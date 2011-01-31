local types, prefix = ...

types.float = {
  stdprocess = 
[[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_tonumber(L, INDEX);]],
  type = prefix .. "float",
}
types.enum = {
  stdprocess = 
[[if(!(lua_isstring(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = enum_retrieve(lua_tostring(L, INDEX));
if(PARAMNAME == (]]..prefix..[[enum)-1)
  std_error(L, HELP, "Unknown enum in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));
if(!(ENUMCOMPARE))
  break;]],
  returncode = "lua_pushstring(L, enum_lookup(rv));",
  type = prefix .. "enum",
}
types.int = {
  stdprocess = 
[[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = (]]..prefix..[[XLint)lua_tonumber(L, INDEX);
if((double)PARAMNAME != lua_tonumber(L, INDEX))
  std_error(L, HELP, "Non-integer in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));]],
  returncode = "lua_pushnumber(L, rv);",
  type = prefix .. "XLint",
}
types.boolean = {
  stdprocess = 
[[if(!(lua_isboolean(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_toboolean(L, INDEX);]],
  returncode = "lua_pushboolean(L, rv);",
  type = prefix .. "XLboolean",
}
