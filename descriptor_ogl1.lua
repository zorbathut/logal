data = {

Accum = {
  params = {enum, float},
  enums = {
    "ACCUM LOAD ADD MULT RETURN",
    nil,
  }
},
ActiveTexture = {
  params = {enum_offset("TEXTURE", "MAX_TEXTURE_COORDS")},
},
AlphaFunc = {
  params = {enum, float},
  enums = {
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
  enums = {
    "POINTS LINES LINE_STRIP LINE_LOOP TRIANGLES TRIANGLE_STRIP TRIANGLE_FAN QUADS QUAD_STRIP POLYGON",
  }
},
BeginQuery = {
  params = {enum, query},
  enums = {
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
  enums = {
    "FUNC_ADD FUNC_SUBTRACT FUNC_REVERSE_SUBTRACT MIN MAX",
  }
},
BlendEquationSeparate = {
  params = {enum, enum},
  enums = {
    "FUNC_ADD FUNC_SUBTRACT FUNC_REVERSE_SUBTRACT MIN MAX",
    "FUNC_ADD FUNC_SUBTRACT FUNC_REVERSE_SUBTRACT MIN MAX",
  }
},
BlendFunc = {
  params = {enum, enum},
  enums = {
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA SRC_ALPHA_SATURATE",
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA",
  }
},
BlendFuncSeparate = {
  params = {enum, enum, enum, enum},
  enums = {
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA SRC_ALPHA_SATURATE",
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA",
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA SRC_ALPHA_SATURATE",
    "ZERO ONE SRC_COLOR ONE_MINUS_SRC_COLOR DST_COLOR ONE_MINUS_DST_COLOR SRC_ALPHA ONE_MINUS_SRC_ALPHA DST_ALPHA ONE_MINUS_DST_ALPHA CONSTANT_COLOR ONE_MINUS_CONSTANT_COLOR CONSTANT_ALPHA ONE_MINUS_CONSTANT_ALPHA",
  }
},
--[[BufferData = {},]]
--[[BufferSubData = {},]]

CallList = {
  params = {list},
},
--[[CallLists = {},]]
Clear = {
  params = {bitmask},
  enums = {
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
  enums = {
    "FRONT BACK FRONT_AND_BACK",
    "EMISSION AMBIENT DIFFUSE SPECULAR AMBIENT_AND_DIFFUSE",
  }
},
ColorPointer = {
  params = {int, typed_data_type, int, typed_data},
},
ColorSubTable = {
  params = {enum, int, int, enum, typed_data_type, typed_data},
  enums = {
    "COLOR_TABLE POST_CONVOLUTION_COLOR_TABLE POST_COLOR_MATRIX_COLOR_TABLE",
    nil,
    nil,
    "RED GREEN BLUE ALPHA LUMINANCE LUMINANCE_ALPHA RGB BGR RGBA BGRA",
    "UNSIGNED_BYTE BYTE BITMAP UNSIGNED_SHORT SHORT UNSIGNED_INT INT FLOAT UNSIGNED_BYTE_3_3_2 UNSIGNED_BYTE_2_3_3_REV UNSIGNED_SHORT_5_6_5 UNSIGNED_SHORT_5_6_5_REV UNSIGNED_SHORT_4_4_4_4 UNSIGNED_SHORT_4_4_4_4_REV UNSIGNED_SHORT_5_5_5_1 UNSIGNED_SHORT_1_5_5_5_REV UNSIGNED_INT_8_8_8_8 UNSIGNED_INT_8_8_8_8_REV UNSIGNED_INT_10_10_10_2 UNSIGNED_INT_2_10_10_10_REV",
  }
},
ColorTable = {
  params = {enum, enum, int, enum, typed_data_type, typed_data},
  enums = {
    " COLOR_TABLE  POST_CONVOLUTION_COLOR_TABLE  POST_COLOR_MATRIX_COLOR_TABLE  PROXY_COLOR_TABLE  PROXY_POST_CONVOLUTION_COLOR_TABLE  PROXY_POST_COLOR_MATRIX_COLOR_TABLE",
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16",
    nil,
    "RED GREEN BLUE ALPHA LUMINANCE LUMINANCE_ALPHA RGB BGR RGBA BGRA",
    "UNSIGNED_BYTE BYTE BITMAP UNSIGNED_SHORT SHORT UNSIGNED_INT INT FLOAT UNSIGNED_BYTE_3_3_2 UNSIGNED_BYTE_2_3_3_REV UNSIGNED_SHORT_5_6_5 UNSIGNED_SHORT_5_6_5_REV UNSIGNED_SHORT_4_4_4_4 UNSIGNED_SHORT_4_4_4_4_REV UNSIGNED_SHORT_5_5_5_1 UNSIGNED_SHORT_1_5_5_5_REV UNSIGNED_INT_8_8_8_8 UNSIGNED_INT_8_8_8_8_REV UNSIGNED_INT_10_10_10_2 UNSIGNED_INT_2_10_10_10_REV",
  }
},
ColorTableParameter = {
  func = "glColorTableParameterfv",
  params = {enum, enum, table_fixed("float", 4)},
  enums = {
    "COLOR_TABLE POST_CONVOLUTION_COLOR_TABLE POST_COLOR_MATRIX_COLOR_TABLE",
    "COLOR_TABLE_SCALE COLOR_TABLE_BIAS",
  }
},
CompileShader = {
  params = {shader},
},
--[[CompressedTexImage1D = {},]]
--[[CompressedTexImage2D = {},]]
--[[CompressedTexImage3D = {},]]
--[[CompressedTexImage = {},]]
--[[CompressedTexSubImage1D = {},]]
--[[CompressedTexSubImage2D = {},]]
--[[CompressedTexSubImage3D = {},]]
--[[CompressedTexSubImage = {},]]
ConvolutionFilter1D = {
  params = {enum, enum, int, enum, typed_data_type, typed_data},
  enums = {
    "CONVOLUTION_1D",
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16",
    nil,
    "ALPHA LUMINANCE LUMINANCE_ALPHA INTENSITY RGB RGBA",
    "UNSIGNED_BYTE BYTE BITMAP UNSIGNED_SHORT SHORT UNSIGNED_INT INT FLOAT UNSIGNED_BYTE_3_3_2 UNSIGNED_BYTE_2_3_3_REV UNSIGNED_SHORT_5_6_5 UNSIGNED_SHORT_5_6_5_REV UNSIGNED_SHORT_4_4_4_4 UNSIGNED_SHORT_4_4_4_4_REV UNSIGNED_SHORT_5_5_5_1 UNSIGNED_SHORT_1_5_5_5_REV UNSIGNED_INT_8_8_8_8 UNSIGNED_INT_8_8_8_8_REV UNSIGNED_INT_10_10_10_2 UNSIGNED_INT_2_10_10_10_REV",
  }
},
ConvolutionFilter2D = {
  params = {enum, enum, int, int, enum, typed_data_type, typed_data},
  enums = {
    "CONVOLUTION_2D",
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16",
    nil,
    nil,
    "ALPHA LUMINANCE LUMINANCE_ALPHA INTENSITY RGB RGBA",
    "UNSIGNED_BYTE BYTE BITMAP UNSIGNED_SHORT SHORT UNSIGNED_INT INT FLOAT UNSIGNED_BYTE_3_3_2 UNSIGNED_BYTE_2_3_3_REV UNSIGNED_SHORT_5_6_5 UNSIGNED_SHORT_5_6_5_REV UNSIGNED_SHORT_4_4_4_4 UNSIGNED_SHORT_4_4_4_4_REV UNSIGNED_SHORT_5_5_5_1 UNSIGNED_SHORT_1_5_5_5_REV UNSIGNED_INT_8_8_8_8 UNSIGNED_INT_8_8_8_8_REV UNSIGNED_INT_10_10_10_2 UNSIGNED_INT_2_10_10_10_REV",
  }
},
--[[glConvolutionParameter = {}]],


PointSize = {
  params = {float},
},
PolygonMode = {
  params = {enum, enum},
  enums = {
    "FRONT BACK FRONT_AND_BACK",
    "POINT LINE FILL",
  }
},

TexImage = {
  {
    func = "glTexImage1D",
    params = {enum, int, int_or_enum, int, int, enum, typed_data_type, typed_data},
    enums = {
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

data.Color = {"Color3", "Color4"}
data.ConvolutionFilter = {"ConvolutionFilter1D", "ConvolutionFilter2D"}
