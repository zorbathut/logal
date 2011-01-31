local types, prefix = ...

-- simple types
types.float = {
  stdprocess = 
[[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_tonumber(L, INDEX);]],
  returncode = "lua_pushnumber(L, rv);",
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
PARAMNAME = (]]..prefix..[[int)lua_tonumber(L, INDEX);
if((double)PARAMNAME != lua_tonumber(L, INDEX))
  std_error(L, HELP, "Non-integer in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));]],
  returncode = "lua_pushnumber(L, rv);",
  type = prefix .. "int",
}
types.boolean = {
  stdprocess = 
[[if(!(lua_isboolean(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = lua_toboolean(L, INDEX);]],
  returncode = "lua_pushboolean(L, rv);",
  type = prefix .. "boolean",
}
types.string = {
  stdprocess =
[[if(!(lua_isstring(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = (]]..prefix..[[char*)lua_tostring(L, INDEX);]],
  returncode = "lua_pushstring(L, rv);",
  type = "const " .. prefix .. "char *",
}

-- return simple types
types.output_int = {
  input_indices = 0,
  returnpackage = "lua_pushnumber(L, PARAMNAME);",
  param = "&PARAMNAME",
  type = prefix .. "int",
}
types.output_enum = {
  input_indices = 0,
  returnpackage = "lua_pushstring(L, enum_lookup(PARAMNAME));",
  param = "&PARAMNAME",
  type = prefix .. "enum",
}
types.output_enum_as_int = {
  input_indices = 0,
  returnpackage = "lua_pushstring(L, enum_lookup((" .. prefix .. "enum)PARAMNAME));",
  param = "&PARAMNAME",
  type = prefix .. "int",
}

types.table = function(typ)
  typ = prefix .. typ
  local tok = "table_" .. typ
  
  if not types[tok] then
    if typ == prefix.."string" then
      types[tok] = {
        stdprocess =
[[if(!(lua_istable(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME1");
PARAMNAME1 = lua_objlen(L, INDEX);
PARAMNAME2 = new const ]]..prefix..[[char*[PARAMNAME1];
PARAMNAME3 = new ]]..prefix..[[int[PARAMNAME1];
for(int i = 0; i < PARAMNAME1; i++) {
  lua_pushnumber(L, i + 1);
  lua_gettable(L, INDEX);
  const char *strdat;
  size_t len;
  if(!(lua_isstring(L, -1)))
    std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME1");
  strdat = lua_tolstring(L, -1, &len);
  PARAMNAME3[i] = len;
  PARAMNAME2[i] = new ]]..prefix..[[char[len + 1];
  memcpy((void*)PARAMNAME2[i], strdat, len + 1);  // technically we're breaking const-correctness here
  lua_pop(L, 1);
}]],
        stdcleanup =
[[for(int i = 0; i < PARAMNAME1; i++)
  delete [] PARAMNAME2[i];
delete [] PARAMNAME2;
delete [] PARAMNAME3;]],
        type = {"int", "const "..prefix.."char **", prefix.."int *"},
      }
    else
      types[tok] = {
        stdprocess =
([[if(!(lua_istable(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME2 = (#TYPE#*)snagTable<#TYPE#>(L, INDEX, &PARAMNAME1);]]):gsub("#TYPE#", typ),
        stdcleanup = [[free(PARAMNAME2);]],
        type = {"int", typ .. " *"},
      }
    end
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

