
local fil = io.open("lgl.cpp", "w")

fil:write(
[[
/*********************************
  This file is automatically generated by LGL
  
  http://github.com/zorbathut/lgl
  
  You probably shouldn't edit it manually.
*********************************/

#include <map>
#include <string>
#include <algorithm>

#include <cassert>

#include "GLee.h"
#include "lua.h"
#include "lauxlib.h"

#include <stdarg.h>
#include <stdlib.h>

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

template<typename T> void *snagTable(lua_State *L, int index, int *ct_out = NULL) {
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
types.float = {
  stdprocess = 
[[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_tonumber(L, INDEX);]],
  type = "GLfloat",
}
types.enum = {
  stdprocess = 
[[if(!(lua_isstring(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = enum_retrieve(lua_tostring(L, INDEX));
if(PARAMNAME == (GLenum)-1)
  std_error(L, HELP, "Unknown enum in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));]],
  returncode = "lua_pushstring(L, enum_lookup(rv));",
  type = "GLenum",
}
types.int = {
  stdprocess = 
[[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_tonumber(L, INDEX);
if((double)PARAMNAME != lua_tonumber(L, INDEX))
  std_error(L, HELP, "Non-integer in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));]],
  returncode = "lua_pushnumber(L, rv);",
  type = "GLint",
}
types.boolean = {
  stdprocess = 
[[if(!(lua_isboolean(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_toboolean(L, INDEX);]],
  returncode = "lua_pushboolean(L, rv);",
  type = "GLboolean",
}

types.typed_data_type = {
  stdprocess = types.enum.stdprocess,
  type = types.enum.type,
  name = "type",
}
types.typed_data = {
  stdprocess =
[[int PARAMNAME_size;
if(type == GL_UNSIGNED_BYTE || type == GL_BYTE || type == GL_UNSIGNED_BYTE_3_3_2 || type == GL_UNSIGNED_BYTE_2_3_3_REV)
  PARAMNAME = snagTable<unsigned char>(L, INDEX, &PARAMNAME_size);
else if(type == GL_UNSIGNED_SHORT || type == GL_SHORT || type == GL_UNSIGNED_SHORT_5_6_5 || type == GL_UNSIGNED_SHORT_5_6_5_REV || type == GL_UNSIGNED_SHORT_4_4_4_4 || type == GL_UNSIGNED_SHORT_4_4_4_4_REV || type == GL_UNSIGNED_SHORT_5_5_5_1 || type == GL_UNSIGNED_SHORT_1_5_5_5_REV || type == GL_2_BYTES)
  PARAMNAME = snagTable<short>(L, INDEX, &PARAMNAME_size);
else if(type == GL_UNSIGNED_INT || type == GL_INT || type == GL_UNSIGNED_INT_8_8_8_8 || type == GL_UNSIGNED_INT_8_8_8_8_REV || type == GL_UNSIGNED_INT_10_10_10_2 || type == GL_UNSIGNED_INT_2_10_10_10_REV || type == GL_4_BYTES)
  PARAMNAME = snagTable<int>(L, INDEX, &PARAMNAME_size);
else if(type == GL_FLOAT)
  PARAMNAME = snagTable<float>(L, INDEX, &PARAMNAME_size);
else if(type == GL_BITMAP)
  std_error(L, HELP, "GL_BITMAP not supported in FUNCNAME");
else if(type == GL_3_BYTES)
  std_error(L, HELP, "GL_3_BYTES not supported in FUNCNAME");
else
  std_error(L, HELP, "Unrecognized type in FUNCNAME");]],
  stdcleanup = [[free(PARAMNAME);]],
  type = "void *",
}

types.rawdata_alignment = {
  stdprocess =
[[if(!(lua_isstring(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
GLenum alignment = enum_retrieve(lua_tostring(L, INDEX));
if(alignment == (GLenum)-1)
  std_error(L, HELP, "Unknown alignment in FUNCNAME for parameter INDEX: %s", lua_tostring(L, INDEX));]],
  type = {}
}
types.rawdata_table = {
  stdprocess =
[[if(alignment == GL_UNSIGNED_BYTE || alignment == GL_BYTE) {
  PARAMNAME2 = snagTable<unsigned char>(L, INDEX, &PARAMNAME1);
} else if(alignment == GL_UNSIGNED_SHORT || alignment == GL_SHORT) {
  PARAMNAME2 = snagTable<short>(L, INDEX, &PARAMNAME1);
  PARAMNAME1 = PARAMNAME1 * sizeof(short);
} else if(alignment == GL_UNSIGNED_INT || alignment == GL_INT) {
  PARAMNAME2 = snagTable<int>(L, INDEX, &PARAMNAME1);
  PARAMNAME1 = PARAMNAME1 * sizeof(int);
} else if(alignment == GL_FLOAT) {
  PARAMNAME2 = snagTable<float>(L, INDEX, &PARAMNAME1);
  PARAMNAME1 = PARAMNAME1 * sizeof(float);
} else
  std_error(L, HELP, "Unrecognized type in FUNCNAME");]],
  type = {"int", "void *"},
}
types.rawdata_table_indexed = {
  stdprocess =
[[if(alignment == GL_UNSIGNED_BYTE || alignment == GL_BYTE) {
  PARAMNAME2 = snagTable<unsigned char>(L, INDEX, &PARAMNAME1);
} else if(alignment == GL_UNSIGNED_SHORT || alignment == GL_SHORT) {
  PARAMNAME2 = snagTable<short>(L, INDEX, &PARAMNAME1);
  PARAMNAME1 = PARAMNAME1 * sizeof(short);
  index = index * sizeof(short);
} else if(alignment == GL_UNSIGNED_INT || alignment == GL_INT) {
  PARAMNAME2 = snagTable<int>(L, INDEX, &PARAMNAME1);
  PARAMNAME1 = PARAMNAME1 * sizeof(int);
  index = index * sizeof(int);
} else if(alignment == GL_FLOAT) {
  PARAMNAME2 = snagTable<float>(L, INDEX, &PARAMNAME1);
  PARAMNAME1 = PARAMNAME1 * sizeof(float);
  index = index * sizeof(float);
} else
  std_error(L, HELP, "Unrecognized type in FUNCNAME");]],
  type = {"int", "void *"},
}

types.table_fixed = function (typ, num)
  typ = "GL" .. typ
  local tok = "table_fixed_" .. typ .. "_" .. num
  
  if not types[tok] then
    types[tok] = {
      stdprocess =
([[if(!(lua_istable(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
if(lua_objlen(L, INDEX) != FIXEDLEN)
  std_error(L, HELP, "Table size error in FUNCNAME for parameter PARAMNAME - Expected %d, got FIXEDLEN", lua_objlen(L, INDEX));
PARAMNAME = (TYPE*)snagTable<TYPE>(L, INDEX);]]):gsub("FIXEDLEN", tostring(num)):gsub("TYPE", typ),
      stdcleanup = [[free(PARAMNAME);]],
      type = typ .. " *",
    }
  end
  
  return tok
end

types.table = function(typ)
  typ = "GL" .. typ
  local tok = "table_" .. typ
  
  if not types[tok] then
    if typ == "GLstring" then
      types[tok] = {
        stdprocess =
[[if(!(lua_istable(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME1 = lua_objlen(L, INDEX);
PARAMNAME2 = new const GLchar*[PARAMNAME1];
PARAMNAME3 = new GLint[PARAMNAME1];
for(int i = 0; i < PARAMNAME1; i++) {
  lua_pushnumber(L, i + 1);
  lua_gettable(L, INDEX);
  const char *strdat;
  size_t len;
  if(!(lua_isstring(L, INDEX)))
    std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
  strdat = lua_tolstring(L, -1, &len);
  PARAMNAME3[i] = len;
  PARAMNAME2[i] = new GLchar[len + 1];
  memcpy((void*)PARAMNAME2[i], strdat, len + 1);  // technically we're breaking const-correctness here
  lua_pop(L, 1);
}]],
        stdcleanup =
[[for(int i = 0; i < PARAMNAME1; i++)
  delete [] PARAMNAME2[i];
delete [] PARAMNAME2;
delete [] PARAMNAME3;]],
        type = {"int", "const GLchar **", "GLint *"},
      }
    else
      types[tok] = {
        stdprocess =
([[if(!(lua_istable(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME2 = (TYPE*)snagTable<TYPE>(L, INDEX, &PARAMNAME1);]]):gsub("TYPE", typ),
        stdcleanup = [[free(PARAMNAME2);]],
        type = {"int", typ .. " *"},
      }
    end
  end
  
  return tok
end

local eo_caps = {}
types.enum_offset = function (prefix, cap)
  local tok = "enum_offset_" .. prefix
  
  if eo_caps[prefix] then assert(eo_caps[prefix] == cap) end
  eo_caps[prefix] = cap
  
  if not types[tok] then
    types[tok] = {
      stdprocess =
([[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_tonumber(L, INDEX);
if(PARAMNAME <= 0 || PARAMNAME > GL_ENUMCAP)
  std_error(L, HELP, "ID out of bounds in FUNCNAME for parameter PARAMNAME");
PARAMNAME = PARAMNAME + GL_ENUMORIGIN0 - 1;]]):gsub("ENUMORIGIN", prefix):gsub("ENUMCAP", cap),
      type = "GLenum",
    }
  end
  
  return tok
end

types.index = {
  stdprocess = 
[[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_tonumber(L, INDEX);
if((double)PARAMNAME != lua_tonumber(L, INDEX))
  std_error(L, HELP, "Non-integer in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));
PARAMNAME = PARAMNAME + 1;]],
  type = "GLint",
}
types.int_or_enum = {
  stdprocess = 
[[if(lua_isnumber(L, INDEX)) {
  PARAMNAME = lua_tonumber(L, INDEX);
  if((double)PARAMNAME != lua_tonumber(L, INDEX))
    std_error(L, HELP, "Non-integer in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));
} else if(lua_isstring(L, INDEX)) {
  PARAMNAME = (GLint)enum_retrieve(lua_tostring(L, INDEX));
  if(PARAMNAME == -1)
    std_error(L, HELP, "Unknown enum in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));
} else {
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
}]],
  type = "GLint",
}
types.table_data = {
  stdprocess =
[[if(!(lua_istable(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");]],
  type = "void *",
  custom = true,
}
types.enum_custom = {
  type = "GLenum",
  custom = true,
}
types.string = {
  stdprocess =
[[if(!(lua_isstring(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = (GLchar*)lua_tostring(L, INDEX);]],
  type = "GLchar *",
}
types.string_ubyte = {
  returncode = "lua_pushstring(L, (const char*)rv);",
  type = "const GLubyte *",
}
types.bitmask = {
  stdprocess =
[[if(!(lua_isstring(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = enum_bitmask_retrieve(lua_tostring(L, INDEX));
if(PARAMNAME == (GLenum)-1)
  std_error(L, HELP, "Unknown enum in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));]],
  type = "GLenum",
}

types.localvar = function (name)
  local tok = "localvar_" .. name
  
  if not types[tok] then
    types[tok] = {
      input_indices = 0,
      name = name,
      nocreate = true,
    }
  end
  
  return tok
end


types.output_table = function(typ, siz)
  local tok = "output_table_" .. typ .. "__" .. siz
  
  if not types[tok] then
    types[tok] = {
      input_indices = 0,
      stdprocess = "PARAMNAME = new " .. typ .. "[" .. siz .. "];",
      returnpackage =
([[lua_newtable(L);
for(int i = 0; i < (%s); i++) {
  lua_pushnumber(L, i + 1);
  lua_pushnumber(L, PARAMNAME[i]);
  lua_settable(L, -3);
}]]):format(siz),
      stdcleanup = "delete [] PARAMNAME;",
      type = typ .. " *",
      
    }
  end
  
  return tok
end

types.output_items_size = function(size_det)
  local tok = "output_items_size_" .. size_det
  
  if not types[tok] then
    types[tok] = {
      input_indices = 0,
      stdprocess = size_det:gsub("PARAMNAME", "PARAMNAME1") .. [[
PARAMNAME2 = NULL;]],
      param = "PARAMNAME1, &PARAMNAME2",
      type = {"int", "int"},
      name = {"items_length_maximum", "items_length_real"},
    }
  end
  
  return tok
end
types.output_items_data = function(typ)
  local tok = "output_items_data_" .. typ
  
  if not types[tok] then
    types[tok] = {
      input_indices = 0,
      stdprocess = "PARAMNAME = new " .. typ .. "[items_length_maximum];",
      returnpackage = 
[[lua_newtable(L);
for(int i = 0; i < items_length_real; i++) {
  lua_pushnumber(L, i + 1);
  lua_pushnumber(L, PARAMNAME[i]);
  lua_settable(L, -3);
}]],
      stdcleanup = "delete [] PARAMNAME;",
      type = typ .. " *",
    }
  end
  
  return tok
end

types.output_item = function(typ)
  local tok = "output_item_" .. typ
  
  if not types[tok] then
    types[tok] = {
      input_indices = 0,
      returnpackage = "lua_pushnumber(L, PARAMNAME);",
      param = "&PARAMNAME",
      type = typ,
    }
  end
  
  return tok
end

types.output_items_data_string = {
  input_indices = 0,
  stdprocess = "PARAMNAME = new char[items_length_maximum];",
  returnpackage = "lua_pushlstring(L, PARAMNAME, items_length_real);",
  stdcleanup = "delete [] PARAMNAME;",
  type = "char *",
}

types.output_int = {
  input_indices = 0,
  returnpackage = "lua_pushnumber(L, PARAMNAME);",
  param = "&PARAMNAME",
  type = "GLint",
}
types.output_enum = {
  input_indices = 0,
  returnpackage = "lua_pushstring(L, enum_lookup(PARAMNAME));",
  param = "&PARAMNAME",
  type = "GLenum",
}
  

types.program = types.int
types.shader = types.int
types.query = types.int
types.list = types.int
types.texture = types.int
types.buffer = types.int

local data
do
  local descriptor_table = {}
  
  for k, v in pairs(types) do
    if type(v) == "function" then
      descriptor_table[k] = v
    else
      descriptor_table[k] = k
    end
  end
  
  local lf = assert(loadfile("descriptor_ogl1.lua"))
  setfenv(lf, descriptor_table)
  lf()
  data = descriptor_table.data
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

static void enum_add(GLenum enu, const string &text) {
  assert(enum_map.count(text) == 0);
  assert(enum_map_reverse.count(enu) == 0);
  
  assert(enu != (GLenum)-1);
  
  enum_map[text] = enu;
  enum_map_reverse[enu] = text;
}

static GLenum enum_retrieve(const string &text) {
  map<string, GLenum>::iterator itr = enum_map.find(text);
  if(itr != enum_map.end())
    return itr->second;
  return -1;
}

static const char enum_error[] = "LGL_ENUM_ERROR";
static const char *enum_lookup(GLenum enu) {
  map<GLenum, string>::iterator itr = enum_map_reverse.find(enu);
  if(itr != enum_map_reverse.end())
    return itr->second.c_str();
  return enum_error;
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
  fil:write("  enum_add(GL_" .. v .. ", \"" .. v .. "\");\n")
end
fil:write("}\n\n")


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
          addsub("TYPE" .. i, types[i])
        end
        
        if #types == 1 then
          addsub("PARAMNAME", realnames[1])
          addsub("TYPE", types[1])
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
    param_input_final = current_index
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
[[int luaopen_lgl(lua_State *L) {
  enum_init();
  luaL_openlib(L, "gl", lgl, 0);
  return 1;
}
]])

fil:close()
