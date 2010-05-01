
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

#include <cassert>

#include "GLee.h"
#include "lua.h"
#include "lauxlib.h"

#include <stdarg.h>

using namespace std;

static void std_error(lua_State *L, const char *helpdocs, const char *msg, ...) __attribute__((format(printf,3,4)));
static void std_error(lua_State *L, const char *helpdocs, const char *msg, ...) {
  char buf[2048];
  strcpy(buf, helpdocs);
  int len = strlen(buf);
  va_list args;
  va_start(args, msg);
  vsnprintf(buf + len, sizeof(buf) - len, msg, args);
  va_end(args);
  buf[sizeof(buf) - 1] = '\0'; // who bloody well knows
  luaL_error(L, buf);
}

]])

local types = {}
types.float = {
  stdprocess = 
[[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_tonumber(L, INDEX);]],
  type = "float",
}
types.enum = {
  stdprocess = 
[[if(!(lua_isstring(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = enum_retrieve(lua_tostring(L, INDEX));
if(PARAMNAME == (GLenum)-1)
  std_error(L, HELP, "Unknown enum in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));]],
  type = "GLenum",
}

local data
do
  local descriptor_table = {}
  
  for k in pairs(types) do
    descriptor_table[k] = k
  end
  
  local lf = assert(loadfile("descriptor_ogl1.lua"))
  setfenv(lf, descriptor_table)
  lf()
  data = descriptor_table.data
end

-- we do a few things here, mostly generating lists of stuff
local ites = {}
local enum_list = {}
for k, v in pairs(data) do
  -- list of the functions involved
  table.insert(ites, k)
  
  -- list of enums in the function
  if v.validity then
    for id, typ in pairs(v.params) do
      if typ == "enum" and v.validity[id] then
        for enu in v.validity[id]:gmatch("([^%s]+)") do
          enum_list[enu] = true
        end
      end
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

local function do_shard(dat, name)
-- first we check the parameter count
  fil:write("  do {\n\n")

  fil:write("    // first we check the parameter count\n") -- :D
  fil:write("    if(lua_gettop(L) != " .. #dat.params .. ") {\n")
  fil:write("      break;\n")
  fil:write("    }\n\n")
  
  
  local paramlist = {}
  for id, typ in ipairs(dat.params) do
    if dat.names and dat.names[id] then
      table.insert(paramlist, dat.names[id])
    else
      table.insert(paramlist, "param" .. id)
    end
  end
  
  -- now we do parameters
  for id, typ in ipairs(dat.params) do
    local tinfo = types[typ]
    local param = paramlist[id]
    assert(tinfo)
    fil:write("    // extract parameter " .. id .. "\n")
    fil:write("    " .. tinfo.type .. " " .. param .. ";\n")
    fil:write("    " .. tinfo.stdprocess:gsub("\n", "\n    "):gsub("INDEX", tostring(id)):gsub("HELP", "help_" .. name):gsub("PARAMNAME", param):gsub("FUNCNAME", "gl." .. name) .. "\n\n")
  end
  
  -- actually call the function
  fil:write("    // actually call the function\n")
  fil:write("    " .. (dat.func or ("gl" .. name)) .. "(")
  for id, name in ipairs(paramlist) do
    if id > 1 then
      fil:write(", ")
    end
    fil:write(name)
  end
  fil:write(");\n\n")

  fil:write("    return 0;\n")
  fil:write("  } while(false); // though actually if we get here something has gone very wrong\n\n")
end

for _, name in pairs(ites) do
  local dat = data[name]
  
  fil:write("static const char help_" .. name .. "[] = \"(gotta write help)\";\n")
  fil:write("static int lgl_" .. name .. "(lua_State *L) {\n\n")
  
  if #dat > 0 then
    for _, v in ipairs(dat) do
      do_shard(v, name)
    end
  else
    do_shard(dat, name)
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
