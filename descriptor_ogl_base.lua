local params = ...
local types = params.types

assert(loadfile("descriptor_base.lua"))(types, "GL")

types.typed_data_type = {
  stdprocess =  -- todo: value checking
[[if(!(lua_isstring(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = enum_retrieve(lua_tostring(L, INDEX));
if(PARAMNAME == (GLenum)-1)
  std_error(L, HELP, "Unknown enum in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));]],
  type = "GLenum",
  name = "type",
}
types.typed_data = {
  stdprocess =
[[if(!(lua_istable(L, INDEX)))
  break;
int PARAMNAME_size;
if(type == GL_UNSIGNED_BYTE || type == GL_BYTE || type == GL_UNSIGNED_BYTE_3_3_2 || type == GL_UNSIGNED_BYTE_2_3_3_REV)
  PARAMNAME = snagTable<unsigned char>(L, INDEX, &PARAMNAME_size);
else if(type == GL_UNSIGNED_SHORT || type == GL_SHORT || type == GL_UNSIGNED_SHORT_5_6_5 || type == GL_UNSIGNED_SHORT_5_6_5_REV || type == GL_UNSIGNED_SHORT_4_4_4_4 || type == GL_UNSIGNED_SHORT_4_4_4_4_REV || type == GL_UNSIGNED_SHORT_5_5_5_1 || type == GL_UNSIGNED_SHORT_1_5_5_5_REV || type == GL_2_BYTES)
  PARAMNAME = snagTable<short>(L, INDEX, &PARAMNAME_size);
else if(type == GL_UNSIGNED_INT || type == GL_INT || type == GL_UNSIGNED_INT_8_8_8_8 || type == GL_UNSIGNED_INT_8_8_8_8_REV || type == GL_UNSIGNED_INT_10_10_10_2 || type == GL_UNSIGNED_INT_2_10_10_10_REV || type == GL_4_BYTES)
  PARAMNAME = snagTable<int>(L, INDEX, &PARAMNAME_size);
else if(type == GL_FLOAT)
  PARAMNAME = snagTable<float>(L, INDEX, &PARAMNAME_size);
else if(type == GL_DOUBLE)
  PARAMNAME = snagTable<double>(L, INDEX, &PARAMNAME_size);
else if(type == GL_BITMAP)
  std_error(L, HELP, "GL_BITMAP not supported in FUNCNAME");
else if(type == GL_3_BYTES)
  std_error(L, HELP, "GL_3_BYTES not supported in FUNCNAME");
else
  std_error(L, HELP, "Unrecognized type in FUNCNAME");]],
  stdcleanup = [[free(PARAMNAME);]],
  type = "void *",
}
-- Technically this doesn't free on shutdown, but right now I'm okay with that.
types.typed_data_preserved = {
  stdprocess =
[[int PARAMNAME_size;
if(PARAMNAME) free(PARAMNAME);
if(type == GL_UNSIGNED_BYTE || type == GL_BYTE || type == GL_UNSIGNED_BYTE_3_3_2 || type == GL_UNSIGNED_BYTE_2_3_3_REV)
  PARAMNAME = snagTable<unsigned char>(L, INDEX, &PARAMNAME_size);
else if(type == GL_UNSIGNED_SHORT || type == GL_SHORT || type == GL_UNSIGNED_SHORT_5_6_5 || type == GL_UNSIGNED_SHORT_5_6_5_REV || type == GL_UNSIGNED_SHORT_4_4_4_4 || type == GL_UNSIGNED_SHORT_4_4_4_4_REV || type == GL_UNSIGNED_SHORT_5_5_5_1 || type == GL_UNSIGNED_SHORT_1_5_5_5_REV || type == GL_2_BYTES)
  PARAMNAME = snagTable<short>(L, INDEX, &PARAMNAME_size);
else if(type == GL_UNSIGNED_INT || type == GL_INT || type == GL_UNSIGNED_INT_8_8_8_8 || type == GL_UNSIGNED_INT_8_8_8_8_REV || type == GL_UNSIGNED_INT_10_10_10_2 || type == GL_UNSIGNED_INT_2_10_10_10_REV || type == GL_4_BYTES)
  PARAMNAME = snagTable<int>(L, INDEX, &PARAMNAME_size);
else if(type == GL_FLOAT)
  PARAMNAME = snagTable<float>(L, INDEX, &PARAMNAME_size);
else if(type == GL_DOUBLE)
  PARAMNAME = snagTable<double>(L, INDEX, &PARAMNAME_size);
else if(type == GL_BITMAP)
  std_error(L, HELP, "GL_BITMAP not supported in FUNCNAME");
else if(type == GL_3_BYTES)
  std_error(L, HELP, "GL_3_BYTES not supported in FUNCNAME");
else
  std_error(L, HELP, "Unrecognized type in FUNCNAME");]],
  type = "static void *",
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
} else if(alignment == GL_DOUBLE) {
  PARAMNAME2 = snagTable<double>(L, INDEX, &PARAMNAME1);
  PARAMNAME1 = PARAMNAME1 * sizeof(float);
} else
  std_error(L, HELP, "Unrecognized type in FUNCNAME");]],
  stdcleanup = [[free(PARAMNAME2);]],
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
} else if(alignment == GL_DOUBLE) {
  PARAMNAME2 = snagTable<double>(L, INDEX, &PARAMNAME1);
  PARAMNAME1 = PARAMNAME1 * sizeof(double);
  index = index * sizeof(double);
} else
  std_error(L, HELP, "Unrecognized type in FUNCNAME");]],
  stdcleanup = [[free(PARAMNAME2);]],
  type = {"int", "void *"},
}

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
PARAMNAME = (GLenum)lua_tonumber(L, INDEX);
if(PARAMNAME <= 0 || PARAMNAME > GL_ENUMCAP)
  std_error(L, HELP, "ID out of bounds in FUNCNAME for parameter PARAMNAME");
PARAMNAME = PARAMNAME + GL_ENUMORIGIN0 - 1;]]):gsub("ENUMORIGIN", prefix):gsub("ENUMCAP", cap),
      type = "GLenum",
    }
  end
  
  return tok
end

types.literal = function(literal)
  local tok = "literal_" .. literal
  
  if not types[tok] then
    types[tok] = {
      input_indices = 0,
      name = tostring(literal),
      nocreate = true,
    }
  end
  
  return tok
end
types.int_forcecasted_void = {
  stdprocess = 
[[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = (void*)(int)lua_tonumber(L, INDEX);
if((double)(int)PARAMNAME != lua_tonumber(L, INDEX))
  std_error(L, HELP, "Non-integer in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));]],
  returncode = "lua_pushnumber(L, rv);",
  type = "void *",
}

types.index = {
  stdprocess = 
[[if(!(lua_isnumber(L, INDEX)))
  std_error(L, HELP, "Parameter type mismatch in FUNCNAME for parameter PARAMNAME");
PARAMNAME = (GLint)lua_tonumber(L, INDEX);
if((double)PARAMNAME != lua_tonumber(L, INDEX))
  std_error(L, HELP, "Non-integer in FUNCNAME for parameter PARAMNAME: %s", lua_tostring(L, INDEX));
PARAMNAME = PARAMNAME + 1;]],
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


types.output_items_size = function(size_det)
  local tok = "output_items_size_" .. size_det
  
  if not types[tok] then
    types[tok] = {
      input_indices = 0,
      stdprocess = size_det:gsub("PARAMNAME", "PARAMNAME1") .. [[

PARAMNAME2 = 0;]],
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

types.program = types.int
types.shader = types.int
types.query = types.int
types.list = types.int
types.texture = types.int
types.buffer = types.int
types.fbo = types.int
types.rbo = types.int
