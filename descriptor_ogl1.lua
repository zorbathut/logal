data = {

Accum = {
  params = {enum, float},
  validity = {
    "ACCUM LOAD ADD MULT RETURN",
    nil,
  }
},
ActiveTexture = {
  params = {enum_offset("TEXTURE", "MAX_TEXTURE_COORDS")},
},
AlphaFunc = {
  params = {enum, float},
  validity = {
    "NEVER LESS EQUAL LEQUAL GREATER NOTEQUAL GEQUAL ALWAYS",
    nil,
  }
},
--[[AreTexturesResident = {},]]
ArrayElement = {
  params = {index},
},
AttachShader = {
  params = {program, shader},
},

Begin = {
  params = {enum},
  validity = {
    "POINTS LINES LINE_STRIP LINE_LOOP TRIANGLES TRIANGLE_STRIP TRIANGLE_FAN QUADS QUAD_STRIP POLYGON",
  }
},
BeginQuery = {
  params = {enum, query},
  validity = {
    "SAMPLES_PASSED",
    nil,
  }
},
BindAttribLocation = {
  params = {program, index, string},
},
--[[Bitmap = {},]]
BlendColor = {
  params = {float, float, float, float},
},
BlendEquation = {
  params = {enum},
  validity = {
    "FUNC_ADD FUNC_SUBTRACT FUNC_REVERSE_SUBTRACT MIN MAX",
  }
},
BlendEquationSeparate = {
  params = {enum, enum},
  validity = {
    "FUNC_ADD FUNC_SUBTRACT FUNC_REVERSE_SUBTRACT MIN MAX",
    "FUNC_ADD FUNC_SUBTRACT FUNC_REVERSE_SUBTRACT MIN MAX",
  }
},
BlendFunc = {
  params = {enum, enum},
  validity = {
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA SRC_ALPHA_SATURATE",
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA",
  }
},
BlendFuncSeparate = {
  params = {enum, enum, enum, enum},
  validity = {
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA SRC_ALPHA_SATURATE",
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA",
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA SRC_ALPHA_SATURATE",
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA",
  }
},
--[[BufferSubData = {},]]

CallList = {
  params = {list},
},
--[[CallLists = {},]]
Clear = {
  params = {bitmask},
  validity = {
    "COLOR_BUFFER_BIT DEPTH_BUFFER_BIT ACCUM_BUFFER_BIT STENCIL_BUFFER_BIT",
  }
},
ClearAccum = {
  params = {float, float, float, float},
},
ClearColor = {
  params = {float, float, float, float},
},
ClearDepth = {
  params = {float},
},
ClearIndex = {
  params = {float},
},
ClearStencil = {
  params = {int},
},
ClientActiveTexture = {
  params = {enum_offset("TEXTURE", "MAX_TEXTURE_COORDS")},
},
ClipPlane = {
  params = {enum_offset("CLIP_PLANE", "MAX_CLIP_PLANES"), table_fixed("double", 4)},
},
Color3 = {
  func = "glColor3f",
  params = {float, float, float},
},
Color4 = {
  func = "glColor4f",
  params = {float, float, float, float},
},
-- Color itself defined later on
ColorMask = {
  params = {bool, bool, bool, bool},
},
ColorMaterial = {
  params = {enum, enum},
  validity = {
    "FRONT BACK FRONT_AND_BACK",
    "EMISSION AMBIENT DIFFUSE SPECULAR AMBIENT_AND_DIFFUSE",
  }
},
--[[ColorPointer = {},]]
--[[ColorSubTable = {},]]
--[[ColorTable = {},]]
ColorTableParameter = {
  func = "glColorTableParameterfv",
  params = {enum, enum, table_fixed("float", 4)},
  validity = {
    "COLOR_TABLE POST_CONVOLUTION_COLOR_TABLE POST_COLOR_MATRIX_COLOR_TABLE",
    "COLOR_TABLE_SCALE COLOR_TABLE_BIAS",
  }
},
CompileShader = {
  params = {shader},
},



PointSize = {
  params = {float},
},
PolygonMode = {
  params = {enum, enum},
  validity = {
    "FRONT BACK FRONT_AND_BACK",
    "POINT LINE FILL",
  }
},

TexImage = {
  {
    func = "glTexImage1D",
    params = {enum, int, int_or_enum, int, int, enum, enum, table_data},
    names = {nil, nil, nil, nil, nil, nil, "type", "data"},
    custom = {nil, nil, nil, nil, nil, nil, nil, 
      {
        parse = [[
          if(type == GL_UNSIGNED_BYTE || type == GL_BYTE || type == GL_UNSIGNED_BYTE_3_3_2 || type == GL_UNSIGNED_BYTE_2_3_3_REV)
            data = snagTable<unsigned char>(L, INDEX);
          else if(type == GL_UNSIGNED_SHORT || type == GL_SHORT || type == GL_UNSIGNED_SHORT_5_6_5 || type == GL_UNSIGNED_SHORT_5_6_5_REV || type == GL_UNSIGNED_SHORT_4_4_4_4 || type == GL_UNSIGNED_SHORT_4_4_4_4_REV || type == GL_UNSIGNED_SHORT_5_5_5_1 || type == GL_UNSIGNED_SHORT_1_5_5_5_REV)
            data = snagTable<short>(L, INDEX);
          else if(type == GL_UNSIGNED_INT || type == GL_INT || type == GL_UNSIGNED_INT_8_8_8_8 || type == GL_UNSIGNED_INT_8_8_8_8_REV || type == GL_UNSIGNED_INT_10_10_10_2 || type == GL_UNSIGNED_INT_2_10_10_10_REV)
            data = snagTable<int>(L, INDEX);
          else if(type == GL_FLOAT)
            data = snagTable<float>(L, INDEX);
          else if(type == GL_BITMAP)
            std_error(L, HELP, "GL_BITMAP not supported in FUNCNAME");
          else
            std_error(L, HELP, "Unrecognized type in FUNCNAME");
        ]],
        cleanup = [[
          free(data);
        ]],
      }
    },
    validity = {
      "TEXTURE_1D",
      nil,
      "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 COMPRESSED_ALPHA COMPRESSED_LUMINANCE COMPRESSED_LUMINANCE_ALPHA COMPRESSED_INTENSITY COMPRESSED_RGB COMPRESSED_RGBA DEPTH_COMPONENT DEPTH_COMPONENT16 DEPTH_COMPONENT24 DEPTH_COMPONENT32 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16 SLUMINANCE SLUMINANCE8 SLUMINANCE_ALPHA SLUMINANCE8_ALPHA8 SRGB SRGB8 SRGB_ALPHA SRGB8_ALPHA8",  -- could be 1, 2, 3, 4 also
      nil,
      nil,
      "COLOR_INDEX RED GREEN BLUE ALPHA RGB RGBA LUMINANCE LUMINANCE_ALPHA",
      "UNSIGNED_BYTE BYTE BITMAP UNSIGNED_SHORT SHORT UNSIGNED_INT INT FLOAT UNSIGNED_BYTE_3_3_2 UNSIGNED_BYTE_2_3_3_REV UNSIGNED_SHORT_5_6_5 UNSIGNED_SHORT_5_6_5_REV UNSIGNED_SHORT_4_4_4_4 UNSIGNED_SHORT_4_4_4_4_REV UNSIGNED_SHORT_5_5_5_1 UNSIGNED_SHORT_1_5_5_5_REV UNSIGNED_INT_8_8_8_8 UNSIGNED_INT_8_8_8_8_REV UNSIGNED_INT_10_10_10_2 UNSIGNED_INT_2_10_10_10_REV",
      nil,
    }
  }
},

}

data.Color = {data.Color3, data.Color4}