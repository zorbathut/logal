
local params = {...}
local filename = params[1]
assert(filename)

local fil = io.open(filename, "w")
assert(fil)

fil:write(
[[
/*********************************
  This file is automatically generated by LGL
  
  http://github.com/zorbathut/lgl
  
  You probably shouldn't edit it manually.
*********************************/

#define GL_GLEXT_PROTOTYPES

#include <map>
#include <string>
#include <algorithm>

#include <cassert>

#include "GLee.h"

#include <lua.hpp>

#include <cstdarg>
#include <cstdlib>
#include <cstring>

using namespace std;

static void std_error(lua_State *L, const char *helpdocs, const char *msg, ...) __attribute__((format(printf,3,4), noreturn));
static void std_error(lua_State *L, const char *helpdocs, const char *msg, ...) {
  char buf[2048];
  strcpy(buf, helpdocs);
  size_t len = strlen(buf);
  va_list args;
  va_start(args, msg);
  vsnprintf(buf + len, sizeof(buf) - len, msg, args);
  va_end(args);
  buf[sizeof(buf) - 1] = '\0'; // who bloody well knows
  luaL_error(L, buf);
  exit(0); // should never reach this
}

template<typename T> static void *snagTable(lua_State *L, int index, int *ct_out = NULL) {
  int ct = lua_objlen(L, index);
  T *memblock = (T*)malloc(sizeof(T) * ct);
  for(int i = 0; i < ct; i++) {
    lua_pushnumber(L, i + 1);
    lua_gettable(L, index);
    memblock[i] = (T)lua_tonumber(L, -1);
    lua_pop(L, 1);
  }
  if(ct_out)
    *ct_out = ct;
  return (void*)memblock;
}

]])

local types = {}
assert(loadfile("descriptor_ogl_base.lua")){types = types}

local data
do
  data = {}
  options = {}
  
  local function accumulate(path)
    local descriptor_table = {}
    
    for k, v in pairs(types) do
      if type(v) == "function" then
        descriptor_table[k] = v
      else
        descriptor_table[k] = k
      end
    end
    
    local lf = assert(loadfile(path))
    setfenv(lf, descriptor_table)
    lf()
    local ldata = descriptor_table.data
    local loptions = descriptor_table.options
    
    for k, v in pairs(ldata) do
      assert(not data[k])
      data[k] = v
    end
    
    if loptions and loptions.asymmetric then
      options.asymmetric = options.asymmetric or {}
      for k, _ in pairs(loptions.asymmetric) do
        options.asymmetric[k] = true
      end
    end
  end
  
  accumulate("descriptor_ogl2.lua")
  accumulate("descriptor_ogl3.lua")
end

local enum_list = {}
local function pull_enums(v)
  -- list of enums in the function
  if v.enums then
    for id, typ in pairs(v.params) do
      if v.enums[id] then
        for enu in v.enums[id]:gmatch("([^%s]+)") do
          enum_list[enu] = true
        end
      end
    end
    
    if v.enums.returntype then
      for enu in v.enums.returntype:gmatch("([^%s]+)") do
        enum_list[enu] = true
      end
    end
  end
end

-- we do a few things here, mostly generating lists of stuff
local ites = {}
for k, v in pairs(data) do
  -- list of the functions involved
  table.insert(ites, k)
  
  pull_enums(v)
  for _, chunk in ipairs(v) do
    if type(chunk) == "table" then
      pull_enums(chunk)
    end
  end
end
table.sort(ites)

-- alphabetize enum list, generate the enum init code
local enu_alpha = {}
for k in pairs(enum_list) do
  table.insert(enu_alpha, k)
end
table.sort(enu_alpha)
fil:write(
[[map<string, GLenum> enum_map;
map<GLenum, string> enum_map_reverse;

#ifdef WIN32
#define WINDOWS_DEBUG_OUTPUT
#endif

#ifdef WINDOWS_DEBUG_OUTPUT
#include <windows.h>
#endif

bool broken = false;
static void enum_add(GLenum enu, const string &text, bool asymmetric = false) {
  assert(enum_map.count(text) == 0);
  
  enum_map[text] = enu;
  
  if(!asymmetric) {
    if(enum_map_reverse.count(enu)) {
      broken = true;
      
      #ifdef WINDOWS_DEBUG_OUTPUT
        OutputDebugString("ERROR: collision");
        OutputDebugString(text.c_str());
        OutputDebugString(enum_map_reverse[enu].c_str());
        char bf[30];
        sprintf(bf, "%d", enu);
        OutputDebugString(bf);
        OutputDebugString("--");
      #endif
    }
    
    if(enu == (GLenum)-1) {
      broken = true;
      
      #ifdef WINDOWS_DEBUG_OUTPUT
        OutputDebugString("ERROR: negative one");
        OutputDebugString(text.c_str());
        OutputDebugString("--");
      #endif
    }
    assert(enu != (GLenum)-1);
    
    enum_map_reverse[enu] = text;
  }
}

static GLenum enum_retrieve(const string &text) {
  map<string, GLenum>::iterator itr = enum_map.find(text);
  if(itr != enum_map.end())
    return itr->second;
  return (GLenum)-1;
}

map<GLenum, string> errors;
static const char *enum_lookup(GLenum enu) {
  map<GLenum, string>::iterator itr = enum_map_reverse.find(enu);
  if(itr != enum_map_reverse.end())
    return itr->second.c_str();
  if(errors.count(enu))
    return errors[enu].c_str();
  char error[64];
  sprintf(error, "LGL_ENUM_ERROR_%d", enu);
  errors[enu] = error;
  return errors[enu].c_str();
}

static GLenum enum_bitmask_retrieve(const string &text) {
  GLenum rv = 0;
  string::const_iterator st = text.begin();
  string::const_iterator ed = find(st, text.end(), ' ');
  while(st != text.end()) {
    rv = rv | enum_retrieve(string(st, ed));
    st = ed;
    if(st != text.end())
      st++;
    ed = find(st, text.end(), ' ');
  }
  return rv;
}

static void enum_init() {
]])
for _, v in pairs(enu_alpha) do
  fil:write("  enum_add(GL_" .. v .. ", \"" .. v .. "\"" .. (options.asymmetric[v] and ", true" or "") .. ");\n")
end
fil:write("  assert(!broken);\n}\n\n")


--[[ how shards look:

do {
  -- code blah blah
  if(failure) break;
}

do {
}

print_error_message();

-- and that's a bit different from the normal, more useful messages

]]

local function do_shard(dat, local_name, name)
  
  fil:write("  do {\n\n")

  -- first we need to distill down our various inputs into something slightly more linear, with the internal information created
  -- all the logic should be here, the other sections should just be outputting text
  local param_input_final = 0
  local param_list = {}
  local conversions = {}
  local returns = {}
  do
    local current_index = 1
    for id, tid in ipairs(dat.params) do
      local typ = types[tid]
      assert(typ)
      
      conversions[id] = function(x) return x end
      local function addsub(src, dst)
        local cp = conversions[id]
        conversions[id] = function(x) return cp(x):gsub(src, dst) end
      end
      
      addsub("\n", "\n    ")
      addsub("FUNCNAME", "gl." .. name)
      addsub("HELP", "help_" .. name)
      
      local param = {}
      
      param.index = current_index
      addsub("INDEX", tostring(param.index))
      current_index = current_index + (typ.input_indices or 1)
      
      -- comparing valid enums so we can branch on that
      if dat.enums and dat.enums[id] then
        local comparestring
        for enum in dat.enums[id]:gmatch("([^%s]+)") do
          if comparestring then
            comparestring = comparestring .. " || "
          else
            comparestring = ""
          end
          comparestring = comparestring .. "PARAMNAME == GL_" .. enum
        end
        
        addsub("ENUMCOMPARE", comparestring)
      end
      
      -- distill variable names out
      do
        local typcustom = dat.names and dat.names[id]
        local typbasic = typ.name
        local types = typ.type
        
        if type(typcustom) == "string" then typcustom = {typcustom} end
        if type(typbasic) == "string" then typbasic = {typbasic} end
        if type(types) == "string" then types = {types} end
        if not types then
          assert(typcustom or typbasic)
          local len = typcustom and #typcustom or #typbasic
          types = {}
          for i = 1, len do
            table.insert(types, "")
          end
        end
        
        if typcustom then
          assert(#typcustom == #types)
        end
        if typbasic then
          assert(#typbasic == #types)
        end
        
        local realnames = {}
        for i = 1, #types do
          local def = "param" .. id
          if #types > 1 then
            def = def .. "_" .. i
          end
          table.insert(realnames, (typcustom and typcustom[i]) or (typbasic and typbasic[i]) or def)
          
          addsub("PARAMNAME" .. i, realnames[i])
          addsub("#TYPE#" .. i, types[i])
        end
        
        if #types == 1 then
          addsub("PARAMNAME", realnames[1])
          addsub("#TYPE#", types[1])
        end
        
        param.names = realnames
      end
      
      -- get typing standardized
      if not typ.nocreate then  -- if we're nocreate, we don't care about typing
        param.type = typ.type
        if type(param.type) ~= "table" then
          param.type = {param.type}
        end
        
        assert(#param.type == #param.names)
      end
      
      param.stdprocess = typ.stdprocess
      param.stdcleanup = typ.stdcleanup
      param.nocreate = typ.nocreate
      param.param = typ.param
      
      table.insert(param_list, param)
      
      if typ.returnpackage then
        table.insert(returns, {index = id, text = typ.returnpackage})
      end
    end
    param_input_final = current_index - 1
  end
  
  -- then we check the parameter count
  fil:write("    // first we check the parameter count\n") -- :D
  fil:write("    if(lua_gettop(L) != " .. param_input_final .. ") {\n")
  fil:write("      break;\n")
  fil:write("    }\n\n")
  
  -- now we do parameters
  for id, typ in ipairs(param_list) do
   fil:write("    // extract parameter " .. id .. "\n")
    
    -- types
    if not typ.nocreate then
      for pid = 1, #typ.names do
        fil:write("    " .. typ.type[pid] .. " " .. typ.names[pid] .. ";\n")
      end
    end
    
    if typ.stdprocess then
      fil:write("    " .. conversions[id](typ.stdprocess) .. "\n\n")
    end
  end
  
  -- now we do custom parameter init
  --[[ -- don't really have any of this right now
  if dat.custom then
    for id, typ in ipairs(dat.params) do
      local cst = dat.custom[id]
      if cst and cst.parse then
        local param = paramlist[id]
        fil:write("    // custom init code for parameter " .. id .. "\n")
        fil:write("    " .. conversions[id](cst.parse) .. "\n\n")
      end
    end
  end]]
  
  -- actually call the function
  fil:write("    // actually call the function\n")
  fil:write("    ")
  if dat.returntype then
    fil:write(types[dat.returntype].type .. " rv = ")
  end
  local ln
  if dat.func then
    ln = dat.func
  elseif local_name then
    ln = "gl" .. local_name
  else
    ln = "gl" .. name
  end
  fil:write(ln .. "(")
  do
    local first = true
    local function param(tik)
      if not first then
        fil:write(", ")
      end
      fil:write(tik)
      first = false
    end
    
    local parms = {}
    for id, chunk in ipairs(param_list) do
      if chunk.param then
        param(conversions[id](chunk.param))
      else
        for _, name in pairs(chunk.names) do
          param(name)
        end
      end
    end
  end
  fil:write(");\n\n")
  
  local returnslots = 0
  
  -- jam return value back in first
  if dat.returntype then
    assert(types[dat.returntype].returncode, "No returncode in " .. dat.returntype)
    fil:write("    // standard return value\n")
    fil:write("    " .. types[dat.returntype].returncode .. "\n\n");
    returnslots = returnslots + 1
  end
  
  -- now we do any custom returns we might have
  for _, v in ipairs(returns) do
    fil:write("    // extra return value\n")
    fil:write("    " .. conversions[v.index](v.text) .. "\n\n");
    returnslots = returnslots + 1
  end
  
  -- now we do custom parameter cleanup
  --[[  -- again, bzzt
  if dat.custom then
    for id, typ in ipairs(dat.params) do
      local cst = dat.custom[id]
      if cst and cst.cleanup then
        local param = paramlist[id]
        fil:write("    // custom cleanup code for parameter " .. id .. "\n")
        fil:write("    " .. conversions[id](cst.cleanup) .. "\n\n")
      end
    end
  end]]

  -- now we do normal cleanup
  for id, typ in ipairs(param_list) do
    if typ.stdcleanup then
      fil:write("    // cleanup parameter " .. id .. "\n")
      fil:write("    " .. conversions[id](typ.stdcleanup) .. "\n\n")
    end
  end
  
  -- now we really return
  fil:write("    return " .. returnslots .. ";\n")
  fil:write("  } while(false); // though actually if we get here something has gone very wrong\n\n")
end

for _, name in pairs(ites) do
  local dat = data[name]
  
  fil:write("static const char help_" .. name .. "[] = \"(gotta write help)\";\n")
  fil:write("static int lgl_" .. name .. "(lua_State *L) {\n\n")
  
  if #dat > 0 then
    for _, v in ipairs(dat) do
      if type(v) == "table" then
        do_shard(v, name, name)
      else
        do_shard(data[v], v, name)
      end
    end
  else
    do_shard(dat, name, name)
  end

  fil:write("  std_error(L, help_" .. name .. ", \"Incorrect number of parameters in gl." .. name .. ". Got %d\", lua_gettop(L));\n")
  
  fil:write("  return 0;\n")
  fil:write("}\n\n")
end


fil:write("\n\nstatic const luaL_reg lgl[] = {\n")
for _, v in pairs(ites) do
  fil:write('  {"' .. v .. '", lgl_' .. v .. '},\n')
end
fil:write("  {NULL, NULL}\n")
fil:write("};\n\n")

fil:write(
[[static bool internal_initted = false;
extern "C" {
  int luaopen_lgl(lua_State *L) {
    if(!internal_initted) {
      enum_init();
      internal_initted = true;
    }
    luaL_openlib(L, "gl", lgl, 0);
    return 1;
  }
}
]])

fil:close()
