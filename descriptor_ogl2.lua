--[[
import re;
x = """
GL_TEXTURE_2D,
                    GL_TEXTURE_CUBE_MAP_POSITIVE_X,
                    GL_TEXTURE_CUBE_MAP_NEGATIVE_X,
                    GL_TEXTURE_CUBE_MAP_POSITIVE_Y,
                    GL_TEXTURE_CUBE_MAP_NEGATIVE_Y,
                    GL_TEXTURE_CUBE_MAP_POSITIVE_Z, or
                    GL_TEXTURE_CUBE_MAP_NEGATIVE_Z
"""

print(re.sub(",", " ", re.sub("and", "", re.sub("or", "", re.sub(" ", "", re.sub("GL_", "", re.sub("\n", "", x)))))))
]]

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
BindBuffer = {
  params = {enum, buffer},
  enums = {
    "ARRAY_BUFFER ELEMENT_ARRAY_BUFFER PIXEL_PACK_BUFFER PIXEL_UNPACK_BUFFER",
    nil,
  }
},
BindTexture = {
  params = {enum, texture},
  enums = {
    "TEXTURE_1D TEXTURE_2D TEXTURE_3D TEXTURE_CUBE_MAP",
    nil,
  }
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
BufferData = {
  params = {enum, rawdata_alignment, rawdata_table, enum},
  enums = {
    "ARRAY_BUFFER ELEMENT_ARRAY_BUFFER PIXEL_PACK_BUFFER PIXEL_UNPACK_BUFFER",
    nil,
    nil,
    "STREAM_DRAW STREAM_READ STREAM_COPY STATIC_DRAW STATIC_READ STATIC_COPY DYNAMIC_DRAW DYNAMIC_READ DYNAMIC_COPY",
  }
},
BufferSubData = {
  params = {enum, index, rawdata_alignment, rawdata_table_indexed},
  names = {nil, "index", nil, nil},
  enums = {"ARRAY_BUFFER ELEMENT_ARRAY_BUFFER PIXEL_PACK_BUFFER PIXEL_UNPACK_BUFFER"},
},

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
  params = {boolean, boolean, boolean, boolean},
},
ColorMaterial = {
  params = {enum, enum},
  enums = {
    "FRONT BACK FRONT_AND_BACK",
    "EMISSION AMBIENT DIFFUSE SPECULAR AMBIENT_AND_DIFFUSE",
  }
},
ColorPointer = {
  {
    params = {int, typed_data_type, literal(0), typed_data_preserved},
    enums = {
      nil,
      "SHORT INT FLOAT DOUBLE",
      nil,
    }
  }, {
    params = {int, enum, int, int_forcecasted_void},
    enums = {
      nil,
      "SHORT INT FLOAT DOUBLE",
      nil,
    }
  }
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
-- not really sure how texture internal formats should work, so
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
--[[glConvolutionParameter = {},]]  -- this is awaiting better function overloading
CopyColorSubTable = {
  params = {enum, int, int, int, int},
  enums = {
    "COLOR_TABLE POST_CONVOLUTION_COLOR_TABLE POST_COLOR_MATRIX_COLOR_TABLE",
    nil,
    nil,
    nil,
    nil,
  }
},
CopyColorTable = {
  params = {enum, enum, int, int, int},
  enums = {
    "COLOR_TABLE POST_CONVOLUTION_COLOR_TABLE POST_COLOR_MATRIX_COLOR_TABLE",
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16",
    nil,
    nil,
    nil
  }
},
CopyConvolutionFilter1D = {
  params = {enum, enum, int, int, int},
  enums = {
    "CONVOLUTION_1D",
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16",
    nil,
    nil,
    nil,
  }
},
CopyConvolutionFilter2D = {
  params = {enum, enum, int, int, int, int},
  enums = {
    "CONVOLUTION_2D",
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16",
    nil,
    nil,
    nil,
  }
},
CopyPixels = {
  params = {int, int, int, int, enum},
  enums = {
    nil,
    nil,
    nil,
    nil,
    "COLOR DEPTH STENCIL",
  },
},
CopyTexImage1D = {
  params = {enum, int, enum, int, int, int, int},
  enums = {
    "TEXTURE_1D",
    nil,
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 COMPRESSED_ALPHA COMPRESSED_LUMINANCE COMPRESSED_LUMINANCE_ALPHA COMPRESSED_INTENSITY COMPRESSED_RGB COMPRESSED_RGBA DEPTH_COMPONENT DEPTH_COMPONENT16 DEPTH_COMPONENT24 DEPTH_COMPONENT32 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16 SLUMINANCE SLUMINANCE8 SLUMINANCE_ALPHA SLUMINANCE8_ALPHA8 SRGB SRGB8 SRGB_ALPHA SRGB8_ALPHA8",
    nil,
    nil,
    nil,
    nil,
  },
},
CopyTexImage2D = {
  params = {enum, int, enum, int, int, int, int, int},
  enums = {
    "TEXTURE_2D TEXTURE_CUBE_MAP_POSITIVE_X TEXTURE_CUBE_MAP_NEGATIVE_X TEXTURE_CUBE_MAP_POSITIVE_Y TEXTURE_CUBE_MAP_NEGATIVE_Y TEXTURE_CUBE_MAP_POSITIVE_Z TEXTURE_CUBE_MAP_NEGATIVE_Z",
    nil,
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 COMPRESSED_ALPHA COMPRESSED_LUMINANCE COMPRESSED_LUMINANCE_ALPHA COMPRESSED_INTENSITY COMPRESSED_RGB COMPRESSED_RGBA DEPTH_COMPONENT DEPTH_COMPONENT16 DEPTH_COMPONENT24 DEPTH_COMPONENT32 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16 SLUMINANCE SLUMINANCE8 SLUMINANCE_ALPHA SLUMINANCE8_ALPHA8 SRGB SRGB8 SRGB_ALPHA SRGB8_ALPHA8",
    nil,
    nil,
    nil,
    nil,
    nil,
  },
},
CopyTexSubImage1D = {
  params = {enum, int, int, int, int, int},
  enums = {
    "TEXTURE_1D",
  },
},
CopyTexSubImage2D = {
  params = {enum, int, int, int, int, int, int, int},
  enums = {
    "TEXTURE_2D TEXTURE_CUBE_MAP_POSITIVE_X TEXTURE_CUBE_MAP_NEGATIVE_X TEXTURE_CUBE_MAP_POSITIVE_Y TEXTURE_CUBE_MAP_NEGATIVE_Y TEXTURE_CUBE_MAP_POSITIVE_Z TEXTURE_CUBE_MAP_NEGATIVE_Z",
  },
},
CopyTexSubImage3D = {
  params = {enum, int, int, int, int, int, int, int, int},
  enums = {
    "TEXTURE_3D",
  },
},
CreateProgram = {
  params = {},
  returntype = program,
},
CreateShader = {
  params = {enum},
  enums = {
    "VERTEX_SHADER FRAGMENT_SHADER",
  },
  returntype = shader,
},
CullFace = {
  params = {enum},
  enums = {
    "FRONT BACK FRONT_AND_BACK",
  }
},

DeleteBuffers = {
  params = {table("uint")},
},
DeleteLists = {
  params = {list, int},
},
DeleteProgram = {
  params = {program},
},
DeleteQueries = {
  params = {table("uint")},
},
DeleteShader = {
  params = {shader},
},
DeleteTextures = {
  params = {table("uint")},
},
DepthFunc = {
  params = {enum},
  enums = {
    "NEVER LESS EQUAL LEQUAL GREATER NOTEQUAL GEQUAL ALWAYS"
  }
},
DepthMask = {
  params = {boolean},
},
DepthRange = {
  params = {float, float},
},
DetachShader = {
  params = {program, shader},
},
Disable = {
  params = {enum},
  enums = {
    "ALPHA_TEST AUTO_NORMAL BLEND COLOR_LOGIC_OP COLOR_MATERIAL COLOR_SUM COLOR_TABLE CONVOLUTION_1D CONVOLUTION_2D CULL_FACE DEPTH_TEST DITHER FOG HISTOGRAM INDEX_LOGIC_OP LIGHTING LINE_SMOOTH LINE_STIPPLE MAP1_COLOR_4 MAP1_INDEX MAP1_NORMAL MAP1_TEXTURE_COORD_1 MAP1_TEXTURE_COORD_2 MAP1_TEXTURE_COORD_3 MAP1_TEXTURE_COORD_4 MAP1_VERTEX_3 MAP1_VERTEX_4 MAP2_COLOR_4 MAP2_INDEX MAP2_NORMAL MAP2_TEXTURE_COORD_1 MAP2_TEXTURE_COORD_2 MAP2_TEXTURE_COORD_3 MAP2_TEXTURE_COORD_4 MAP2_VERTEX_3 MAP2_VERTEX_4 MINMAX MULTISAMPLE NORMALIZE POINT_SMOOTH POINT_SPRITE POLYGON_OFFSET_FILL POLYGON_OFFSET_LINE POLYGON_OFFSET_POINT POLYGON_SMOOTH POLYGON_STIPPLE POST_COLOR_MATRIX_COLOR_TABLE POST_CONVOLUTION_COLOR_TABLE RESCALE_NORMAL SAMPLE_ALPHA_TO_COVERAGE SAMPLE_ALPHA_TO_ONE SAMPLE_COVERAGE SEPARABLE_2D SCISSOR_TEST STENCIL_TEST TEXTURE_1D TEXTURE_2D TEXTURE_3D TEXTURE_CUBE_MAP TEXTURE_GEN_Q TEXTURE_GEN_R TEXTURE_GEN_S TEXTURE_GEN_T VERTEX_PROGRAM_POINT_SIZE VERTEX_PROGRAM_TWO_SIDE" -- missing: CLIP_PLANEi LIGHTi 
  }
},
DisableClientState = {
  params = {enum},
  enums = {
    "COLOR_ARRAY EDGE_FLAG_ARRAY FOG_COORD_ARRAY INDEX_ARRAY NORMAL_ARRAY SECONDARY_COLOR_ARRAY TEXTURE_COORD_ARRAY VERTEX_ARRAY",
  },
},
DisableVertexAttribArray = {
  params = {int},
},
DrawArrays = {
  params = {enum, int, int},
  enums = {
    "POINTS LINE_STRIP LINE_LOOP LINES TRIANGLE_STRIP TRIANGLE_FAN TRIANGLES QUAD_STRIP QUADS POLYGON",
  },
},
DrawBuffer = {
  params = {enum},
  enums = {
    "NONE FRONT_LEFT FRONT_RIGHT BACK_LEFT BACK_RIGHT FRONT BACK LEFT RIGHT FRONT_AND_BACK" -- missing: AUXi
  },
},
--[[DrawBuffers = {},]] -- disabled because we need some kind of table(enum) that also supports GL_AUXi and friends
DrawElements = {
  {
    params = {enum, localvar("param4_size"), typed_data_type, typed_data},
    enums = {
      "POINTS LINE_STRIP LINE_LOOP LINES TRIANGLE_STRIP TRIANGLE_FAN TRIANGLES QUAD_STRIP QUADS POLYGON",
    },
  }, {
    params = {enum, int, enum, int_forcecasted_void},
    enums = {
      "POINTS LINE_STRIP LINE_LOOP LINES TRIANGLE_STRIP TRIANGLE_FAN TRIANGLES QUAD_STRIP QUADS POLYGON",
      nil,
      "UNSIGNED_BYTE UNSIGNED_SHORT UNSIGNED_INT",
      nil,
    }
  }
},
DrawPixels = {
  params = {int, int, enum, typed_data_type, typed_data},
  enums = {
    nil,
    nil,
    "COLOR_INDEX STENCIL_INDEX DEPTH_COMPONENT RGB BGR RGBA BGRA RED GREEN BLUE ALPHA LUMINANCE LUMINANCE_ALPHA",
    "UNSIGNED_BYTE BYTE BITMAP UNSIGNED_SHORT SHORT UNSIGNED_INT INT FLOAT UNSIGNED_BYTE_3_3_2 UNSIGNED_BYTE_2_3_3_REV UNSIGNED_SHORT_5_6_5 UNSIGNED_SHORT_5_6_5_REV UNSIGNED_SHORT_4_4_4_4 UNSIGNED_SHORT_4_4_4_4_REV UNSIGNED_SHORT_5_5_5_1 UNSIGNED_SHORT_1_5_5_5_REV UNSIGNED_INT_8_8_8_8 UNSIGNED_INT_8_8_8_8_REV UNSIGNED_INT_10_10_10_2 UNSIGNED_INT_2_10_10_10_REV",
  }
},
DrawRangeElements = {
  {
    params = {enum, int, int, int, typed_data_type, typed_data},
    enums = {
      "POINTS LINE_STRIP LINE_LOOP LINES TRIANGLE_STRIP TRIANGLE_FAN TRIANGLES QUAD_STRIP QUADS POLYGON",
      nil,
      nil,
      nil,
      "UNSIGNED_BYTE UNSIGNED_SHORT UNSIGNED_INT",
    }
  }, {
    params = {enum, int, int, int, enum, int_forcecasted_void},
    enums = {
      "POINTS LINE_STRIP LINE_LOOP LINES TRIANGLE_STRIP TRIANGLE_FAN TRIANGLES QUAD_STRIP QUADS POLYGON",
      nil,
      nil,
      nil,
      "UNSIGNED_BYTE UNSIGNED_SHORT UNSIGNED_INT",
    }
  }
},

EdgeFlag = {
  params = {boolean},
},
--[[EdgeFlagPointer = {}]] -- some confusion as to this function's behavior, might need better overloading
Enable = {
  params = {enum},
  enums = {
    "ALPHA_TEST AUTO_NORMAL BLEND COLOR_LOGIC_OP COLOR_MATERIAL COLOR_SUM COLOR_TABLE CONVOLUTION_1D CONVOLUTION_2D CULL_FACE DEPTH_TEST DITHER FOG HISTOGRAM INDEX_LOGIC_OP LIGHTING LINE_SMOOTH LINE_STIPPLE MAP1_COLOR_4 MAP1_INDEX MAP1_NORMAL MAP1_TEXTURE_COORD_1 MAP1_TEXTURE_COORD_2 MAP1_TEXTURE_COORD_3 MAP1_TEXTURE_COORD_4 MAP1_VERTEX_3 MAP1_VERTEX_4 MAP2_COLOR_4 MAP2_INDEX MAP2_NORMAL MAP2_TEXTURE_COORD_1 MAP2_TEXTURE_COORD_2 MAP2_TEXTURE_COORD_3 MAP2_TEXTURE_COORD_4 MAP2_VERTEX_3 MAP2_VERTEX_4 MINMAX MULTISAMPLE NORMALIZE POINT_SMOOTH POINT_SPRITE POLYGON_OFFSET_FILL POLYGON_OFFSET_LINE POLYGON_OFFSET_POINT POLYGON_SMOOTH POLYGON_STIPPLE POST_COLOR_MATRIX_COLOR_TABLE POST_CONVOLUTION_COLOR_TABLE RESCALE_NORMAL SAMPLE_ALPHA_TO_COVERAGE SAMPLE_ALPHA_TO_ONE SAMPLE_COVERAGE SEPARABLE_2D SCISSOR_TEST STENCIL_TEST TEXTURE_1D TEXTURE_2D TEXTURE_3D TEXTURE_CUBE_MAP TEXTURE_GEN_Q TEXTURE_GEN_R TEXTURE_GEN_S TEXTURE_GEN_T VERTEX_PROGRAM_POINT_SIZE VERTEX_PROGRAM_TWO_SIDE" -- missing: CLIP_PLANEi LIGHTi 
  }
},
EnableClientState = {
  params = {enum},
  enums = {
    "COLOR_ARRAY EDGE_FLAG_ARRAY FOG_COORD_ARRAY INDEX_ARRAY NORMAL_ARRAY SECONDARY_COLOR_ARRAY TEXTURE_COORD_ARRAY VERTEX_ARRAY",
  },
},
EnableVertexAttribArray = {
  params = {int},
},
End = {
  params = {},
},
EndList = {
  params = {},
},
EndQuery = {
  params = {enum},
  enums = {
    "SAMPLES_PASSED",
  },
},
EvalCoord1 = {
  func = "glEvalCoord1f",
  params = {float},
},
EvalCoord2 = {
  func = "glEvalCoord2f",
  params = {float, float},
},
EvalMesh1 = {
  params = {enum, int, int},
  enums = {
    "POINT LINE"
  },
},
EvalMesh2 = {
  params = {enum, int, int, int, int},
  enums = {
    "POINT LINE FILL"
  },
},
EvalPoint1 = {
  params = {int},
},
EvalPoint2 = {
  params = {int, int},
},

--[[FeedbackBuffer = {},]] -- this actually writes back to the buffer, and it's unclear how that should work
Finish = {
  params = {},
},
Flush = {
  params = {},
},
--[[Fog = {},]] -- better overloading needed
FogCoord = {
  func = "glFogCoordf",
  params = {float},
},
--[[FogCoordPointer = {},]] -- better client state needed
FrontFace = {
  params = {enum},
  enums = {
    "CW CCW",
  }
},
Frustum = {
  params = {float, float, float, float, float, float},
},

GenBuffers = {
  params = {int, output_table("GLuint", "param1")},
},
GenLists = {
  params = {int},
  returntype = int,
},
GenQueries = {
  params = {int, output_table("GLuint", "param1")},
},
GenTextures = {
  params = {int, output_table("GLuint", "param1")},
},
Get = { -- HIGHLY HIGHLY INCOMPLETE
  {
    func = "glGetFloatv",
    params = {enum, output_table("GLfloat", 16)},
    enums = {
      "COLOR_MATRIX MODELVIEW_MATRIX TEXTURE_MATRIX PROJECTION_MATRIX",
      nil,
    },
  }, {
    func = "glGetIntegerv",
    params = {enum, output_int},
    enums = {
      "COLOR_MATRIX_STACK_DEPTH MODELVIEW_STACK_DEPTH NAME_STACK_DEPTH PROJECTION_STACK_DEPTH TEXTURE_STACK_DEPTH MAX_ELEMENTS_VERTICES MAX_ELEMENTS_INDICES",
      nil,
    },
  },
},
GetActiveAttrib = {
  params = {program, int, output_items_size("glGetProgramiv(param1, GL_ACTIVE_ATTRIBUTE_MAX_LENGTH, &PARAMNAME);"), output_int, output_enum, output_items_data_string},
  enums = {
    nil,
    nil,
    nil,
    nil,
    "FLOAT FLOAT_VEC2 FLOAT_VEC3 FLOAT_VEC4 FLOAT_MAT2 FLOAT_MAT3 FLOAT_MAT4 FLOAT_MAT2x3 FLOAT_MAT2x4 FLOAT_MAT3x2 FLOAT_MAT3x4 FLOAT_MAT4x2 FLOAT_MAT4x3",
    nil
  }
},
GetActiveUniform = {
  params = {program, int, output_items_size("glGetProgramiv(param1, GL_ACTIVE_UNIFORM_MAX_LENGTH, &PARAMNAME);"), output_int, output_enum, output_items_data_string},
  enums = {
    nil,
    nil,
    nil,
    nil,
    "FLOAT FLOAT_VEC2 FLOAT_VEC3 FLOAT_VEC4 INT INT_VEC2 INT_VEC3 INT_VEC4 BOOL BOOL_VEC2 BOOL_VEC3 BOOL_VEC4 FLOAT_MAT2 FLOAT_MAT3 FLOAT_MAT4 FLOAT_MAT2x3 FLOAT_MAT2x4 FLOAT_MAT3x2 FLOAT_MAT3x4 FLOAT_MAT4x2 FLOAT_MAT4x3 SAMPLER_1D SAMPLER_2D SAMPLER_3D SAMPLER_CUBE SAMPLER_1D_SHADOW SAMPLER_2D_SHADOW",
    nil
  }
},
GetAttachedShaders = {
  params = {program, output_items_size("glGetProgramiv(param1, GL_ATTACHED_SHADERS, &PARAMNAME);"), output_items_data("GLuint")}
},
GetAttribLocation = {
  params = {program, string},
  returntype = int,
},
GetBufferParameter = {
  func = "glGetBufferParameteriv",
  params = {enum, enum, output_item("GLint")},
  enums = {
    "ARRAY_BUFFER ELEMENT_ARRAY_BUFFER PIXEL_PACK_BUFFER PIXEL_UNPACK_BUFFER",
    "BUFFER_ACCESS BUFFER_MAPPED BUFFER_SIZE BUFFER_USAGE",
    nil,
  }
},
--[[GetBufferPointer = {},]] -- hmm
--[[GetBufferSubData = {},]] -- hmm
GetClipPlane = {
  params = {enum_offset("CLIP_PLANE", "MAX_CLIP_PLANES"), output_table("GLdouble", 4)},
},
--[[GetColorTable = {},]] -- highly unclear what the size should be
GetColorTableParameter = {
  func = "glGetColorTableParameterfv",
  params = {enum, enum, output_item("GLfloat")},
  enums = {
    "COLOR_TABLE POST_CONVOLUTION_COLOR_TABLE POST_COLOR_MATRIX_COLOR_TABLE PROXY_COLOR_TABLE PROXY_POST_CONVOLUTION_COLOR_TABLE PROXY_POST_COLOR_MATRIX_COLOR_TABLE",
    "COLOR_TABLE_BIAS COLOR_TABLE_SCALE COLOR_TABLE_FORMAT COLOR_TABLE_WIDTH COLOR_TABLE_RED_SIZE COLOR_TABLE_GREEN_SIZE COLOR_TABLE_BLUE_SIZE COLOR_TABLE_ALPHA_SIZE COLOR_TABLE_LUMINANCE_SIZE COLOR_TABLE_INTENSITY_SIZE",
    nil,
  }
},
--[[GetConvolutionFilter = {},]] -- highly unclear what the size should be
--[[GetConvolutionParameter = {},]] -- I think we need more advanced overloading for this one
GetError = {
  params = {},
  returntype = enum,
  enums = {
    returntype = "NO_ERROR INVALID_ENUM INVALID_VALUE INVALID_OPERATION STACK_OVERFLOW STACK_UNDERFLOW OUT_OF_MEMORY TABLE_TOO_LARGE",
  }
},
--[[GetHistogram = {},]] -- highly unclear what the size should be
--[[GetHistogramParameter = {},]] -- I think we need more advanced overloading for this one
--[[GetLight = {},]] -- I think we need more advanced overloading for this one
--[[GetMap = {},]] -- highly unclear what the size should be
--[[GetMaterial = {},]] -- I think we need more advanced overloading for this one
--[[GetMinmax = {},]] -- highly unclear what the size should be
--[[GetMinmaxParameter = {},]] -- I think we need more advanced overloading for this one
--[[GetPixelMap = {},]] -- highly unclear what the size should be
--[[GetPointer = {},]] -- I don't even know how to provide this
GetPolygonStipple = {
  params = {output_table("GLubyte", 32*32 / 8)},  -- hope this size is right
},
GetProgram = {  -- more overloading would probably help this as well
  func = "glGetProgramiv",
  params = {program, enum, output_item("GLint")},
  enums = {
    nil,
    "DELETE_STATUS LINK_STATUS VALIDATE_STATUS INFO_LOG_LENGTH ATTACHED_SHADERS ACTIVE_ATTRIBUTES ACTIVE_ATTRIBUTE_MAX_LENGTH ACTIVE_UNIFORMS ACTIVE_UNIFORM_MAX_LENGTH",
    nil,
  }
},
GetProgramInfoLog = {
  params = {program, output_items_size("glGetProgramiv(param1, GL_INFO_LOG_LENGTH, &PARAMNAME);"), output_items_data_string},
},
GetQueryObject = {
  func = "glGetQueryObjectiv",
  params = {query, enum, output_item("GLint")},
  enums = {
    nil,
    "QUERY_RESULT QUERY_RESULT_AVAILABLE",
    nil,
  },
},
GetQuery = {
  func = "glGetQueryiv",
  params = {enum, enum, output_item("GLint")},
  enums = {
    "SAMPLES_PASSED",
    "CURRENT_QUERY QUERY_COUNTER_BITS",
    nil,
  }
},
--[[GetSeparableFilter = {},]] -- rargh
GetShader = {
  func = "glGetShaderiv",
  params = {shader, enum, output_enum_as_int},
  enums = {
    nil,
    "SHADER_TYPE DELETE_STATUS COMPILE_STATUS INFO_LOG_LENGTH SHADER_SOURCE_LENGTH",
    "TRUE FALSE",
  }
},
GetShaderInfoLog = {
  params = {shader, output_items_size("glGetShaderiv(param1, GL_INFO_LOG_LENGTH, &PARAMNAME);"), output_items_data_string},
},
GetShaderSource = {
  params = {shader, output_items_size("glGetShaderiv(param1, GL_SHADER_SOURCE_LENGTH, &PARAMNAME);"), output_items_data_string},
},
GetString = {
  params = {enum},
  enums = {
    "VENDOR RENDERER VERSION SHADING_LANGUAGE_VERSION EXTENSIONS",
  },
  returntype = string_ubyte,
},
--[[GetTexEnv = {},]] -- overloading
--[[GetTexGen = {},]] -- overloading
--[[GetTexImage = {},]] -- this is rather complicated
GetTexLevelParameter = {
  func = "glGetTexLevelParameterfv",
  params = {enum, int, enum, output_item("GLfloat")},
  enums = {
    "TEXTURE_1D TEXTURE_2D TEXTURE_3D PROXY_TEXTURE_1D PROXY_TEXTURE_2D PROXY_TEXTURE_3D TEXTURE_CUBE_MAP_POSITIVE_X TEXTURE_CUBE_MAP_NEGATIVE_X TEXTURE_CUBE_MAP_POSITIVE_Y TEXTURE_CUBE_MAP_NEGATIVE_Y TEXTURE_CUBE_MAP_POSITIVE_Z TEXTURE_CUBE_MAP_NEGATIVE_Z PROXY_TEXTURE_CUBE_MAP",
    nil,
    "TEXTURE_WIDTH TEXTURE_HEIGHT TEXTURE_DEPTH TEXTURE_INTERNAL_FORMAT TEXTURE_BORDER TEXTURE_RED_SIZE TEXTURE_GREEN_SIZE TEXTURE_BLUE_SIZE TEXTURE_ALPHA_SIZE TEXTURE_LUMINANCE_SIZE TEXTURE_INTENSITY_SIZE TEXTURE_DEPTH_SIZE TEXTURE_COMPRESSED TEXTURE_COMPRESSED_IMAGE_SIZE",
  }
},
--[[GetTexParameter = {},]] -- overloading
--[[GetUniform = {},]] -- arrrgh
GetUniformLocation = {
  params = {program, string},
  returntype = int,
},
--[[GetVertexAttrib = {},]] -- overloading
--[[GetVertexAttribPointer = {},]] -- wat

Hint = {
  params = {enum, enum},
  enums = {
    "FOG_HINT GENERATE_MIPMAP_HINT LINE_SMOOTH_HINT PERSPECTIVE_CORRECTION_HINT POINT_SMOOTH_HINT POLYGON_SMOOTH_HINT TEXTURE_COMPRESSION_HINT FRAGMENT_SHADER_DERIVATIVE_HINT",
    "FASTEST NICEST DONT_CARE",
  },
},
Histogram = {
  params = {enum, int, enum, boolean},
  enums = {
    "HISTOGRAM PROXY_HISTOGRAM",
    nil,
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16",
  }
},

Index = {
  func = "glIndexi",
  params = {int},
},
--[[IndexMask = {params = {uint},},]] -- odd, I don't have the right number of parameters somehow?
--[[IndexPointer = {},]] -- this is just questionable
InitNames = {
  params = {},
},
--[[InterleavedArrays = {},]] -- hmph
IsBuffer = {
  params = {buffer},
  returntype = boolean,
},
IsEnabled = {
  params = {enum},
  returntype = boolean,
  enums = {
    "ALPHA_TEST AUTO_NORMAL BLEND COLOR_ARRAY COLOR_LOGIC_OP COLOR_MATERIAL COLOR_SUM COLOR_TABLE CONVOLUTION_1D CONVOLUTION_2D CULL_FACE DEPTH_TEST DITHER EDGE_FLAG_ARRAY FOG FOG_COORD_ARRAY HISTOGRAM INDEX_ARRAY INDEX_LOGIC_OP  LIGHTING LINE_SMOOTH LINE_STIPPLE MAP1_COLOR_4 MAP1_INDEX MAP1_NORMAL MAP1_TEXTURE_COORD_1 MAP1_TEXTURE_COORD_2 MAP1_TEXTURE_COORD_3 MAP1_TEXTURE_COORD_4 MAP2_COLOR_4 MAP2_INDEX MAP2_NORMAL MAP2_TEXTURE_COORD_1 MAP2_TEXTURE_COORD_2 MAP2_TEXTURE_COORD_3 MAP2_TEXTURE_COORD_4 MAP2_VERTEX_3 MAP2_VERTEX_4 MINMAX MULTISAMPLE NORMAL_ARRAY NORMALIZE POINT_SMOOTH POINT_SPRITE POLYGON_SMOOTH POLYGON_OFFSET_FILL POLYGON_OFFSET_LINE POLYGON_OFFSET_POINT POLYGON_STIPPLE POST_COLOR_MATRIX_COLOR_TABLE POST_CONVOLUTION_COLOR_TABLE RESCALE_NORMAL SAMPLE_ALPHA_TO_COVERAGE SAMPLE_ALPHA_TO_ONE SAMPLE_COVERAGE SCISSOR_TEST SECONDARY_COLOR_ARRAY SEPARABLE_2D STENCIL_TEST TEXTURE_1D TEXTURE_2D TEXTURE_3D TEXTURE_COORD_ARRAY TEXTURE_CUBE_MAP TEXTURE_GEN_Q TEXTURE_GEN_R TEXTURE_GEN_S TEXTURE_GEN_T VERTEX_ARRAY VERTEX_PROGRAM_POINT_SIZE VERTEX_PROGRAM_TWO_SIDE" -- missing: CLIP_PLANEi LIGHTi
  },
},
IsList = {
  params = {list},
  returntype = boolean,
},
IsProgram = {
  params = {program},
  returntype = boolean,
},
IsQuery = {
  params = {query},
  returntype = boolean,
},
IsShader = {
  params = {shader},
  returntype = boolean,
},
IsTexture = {
  params = {texture},
  returntype = boolean,
},

--[[Light = {},]] -- needs better overloading
--[[LightModel = {},]] -- needs better overloading
LineStipple = {
  params = {int, int},
},
LineWidth = {
  params = {float},
},
LinkProgram = {
  params = {program},
},
ListBase = {
  params = {int},
},
LoadIdentity = {
  params = {},
},
LoadMatrix = {
  func = "glLoadMatrixf",
  params = {table_fixed(float, 16)},
},
LoadName = {
  params = {int},
},
LoadTranspose = {
  func = "glLoadTransposeMatrixf",
  params = {table_fixed(float, 16)},
},
LogicOp = {
  params = {enum},
  enums = {
    "CLEAR SET COPY COPY_INVERTED NOOP INVERT AND NAND OR NOR XOR EQUIV AND_REVERSE AND_INVERTED OR_REVERSE OR_INVERTED",
  },
},

--[[Map1 = {},]]
--[[Map2 = {},]] -- complex
--[[MapBuffer = {},]] -- also complex
MapGrid1 = {
  func = "glMapGrid1f",
  params = {int, float, float},
},
MapGrid2 = {
  func = "glMapGrid2f",
  params = {int, float, float, int, float, float},
},
--[[Material = {},]] -- again, complex
MatrixMode = {
  params = {enum},
  enums = {
    "MODELVIEW PROJECTION TEXTURE",
  },
},
Minmax = {
  params = {enum, enum, boolean},
  enums = {
    "MINMAX",
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16",
  }
},
MultMatrix = {
  func = "glMultMatrixf",
  params = {table_fixed(float, 16)},
},
MultTransposeMatrix = {
  func = "glMultTransposeMatrixf",
  params = {table_fixed(float, 16)},
},
--[[MultiDrawArrays = {},]] -- a bit difficult
--[[MultiDrawElements = {},]] -- a bit difficult
MultiTexCoord1 = {
  func = "glMultiTexCoord1f",
  params = {enum_offset("TEXTURE", "MAX_TEXTURE_COORDS"), float},
},
MultiTexCoord2 = {
  func = "glMultiTexCoord2f",
  params = {enum_offset("TEXTURE", "MAX_TEXTURE_COORDS"), float, float},
},
MultiTexCoord3 = {
  func = "glMultiTexCoord3f",
  params = {enum_offset("TEXTURE", "MAX_TEXTURE_COORDS"), float, float, float},
},
MultiTexCoord4 = {
  func = "glMultiTexCoord4f",
  params = {enum_offset("TEXTURE", "MAX_TEXTURE_COORDS"), float, float, float, float},
},

NewList = {
  params = {list, enum},
  enums = {
    nil,
    "COMPILE COMPILE_AND_EXECUTE",
  },
},
EndList = {
  params = {},
},
Normal = {
  func = "glNormal3f",
  params = {float, float, float},
},
--[[NormalPointer = {},]] -- hurgh

Ortho = {
  params = {float, float, float, float, float, float},
},

PassThrough = {
  params = {float},
},
PixelMap = {
  func = "glPixelMapfv",
  params = {enum, table(float)},
  enums = {
    "PIXEL_MAP_I_TO_I PIXEL_MAP_S_TO_S PIXEL_MAP_I_TO_R PIXEL_MAP_I_TO_G PIXEL_MAP_I_TO_B PIXEL_MAP_I_TO_A PIXEL_MAP_R_TO_R PIXEL_MAP_G_TO_G PIXEL_MAP_B_TO_B PIXEL_MAP_A_TO_A",
    nil,
  },
},
PixelStore = {
  func = "glPixelStoref",
  params = {enum, float},
  enums = {
    "PACK_SWAP_BYTES PACK_LSB_FIRST PACK_ROW_LENGTH PACK_IMAGE_HEIGHT PACK_SKIP_PIXELS PACK_SKIP_ROWS PACK_SKIP_IMAGES PACK_ALIGNMENT UNPACK_SWAP_BYTES UNPACK_LSB_FIRST UNPACK_ROW_LENGTH UNPACK_IMAGE_HEIGHT UNPACK_SKIP_PIXELS UNPACK_SKIP_ROWS UNPACK_SKIP_IMAGES UNPACK_ALIGNMENT",
    nil,
  },
},
PixelTransfer = {
  func = "glPixelTransferf",
  params = {enum, int},
  enums = {
    "MAP_COLOR MAP_STENCIL INDEX_SHIFT INDEX_OFFSET RED_SCALE RED_BIAS GREEN_SCALE GREEN_BIAS BLUE_SCALE BLUE_BIAS ALPHA_SCALE ALPHA_BIAS DEPTH_SCALE DEPTH_BIAS POST_COLOR_MATRIX_RED_SCALE POST_COLOR_MATRIX_GREEN_SCALE POST_COLOR_MATRIX_BLUE_SCALE POST_COLOR_MATRIX_ALPHA_SCALE POST_COLOR_MATRIX_RED_BIAS POST_COLOR_MATRIX_GREEN_BIAS POST_COLOR_MATRIX_BLUE_BIAS POST_COLOR_MATRIX_ALPHA_BIAS POST_CONVOLUTION_RED_SCALE POST_CONVOLUTION_GREEN_SCALE POST_CONVOLUTION_BLUE_SCALE POST_CONVOLUTION_ALPHA_SCALE POST_CONVOLUTION_RED_BIAS POST_CONVOLUTION_GREEN_BIAS POST_CONVOLUTION_BLUE_BIAS POST_CONVOLUTION_ALPHA_BIAS",
    nil,
  },
},
PixelZoom = {
  params = {float, float},
},
--[[PointParameter = {},]] -- overloading
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
PolygonOffset = {
  params = {float, float},
},
PolygonStipple = {
  params = {table_fixed("ubyte", 32*32 / 8)},
},
PopAttrib = {
  params = {},
},
PopClientAttrib = {
  params = {},
},
PopMatrix = {
  params = {},
},
PopName = {
  params = {},
},
--[[PrioritizeTextures = {},]] -- ugh
PushAttrib = {
  params = {bitmask},
  enums = {
    "ALL_ATTRIB_BITS ACCUM_BUFFER_BIT COLOR_BUFFER_BIT CURRENT_BIT DEPTH_BUFFER_BIT ENABLE_BIT EVAL_BIT FOG_BIT HINT_BIT LIGHTING_BIT LINE_BIT LIST_BIT MULTISAMPLE_BIT PIXEL_MODE_BIT POINT_BIT POLYGON_BIT POLYGON_STIPPLE_BIT SCISSOR_BIT STENCIL_BUFFER_BIT TEXTURE_BIT TRANSFORM_BIT VIEWPORT_BIT",
  },
},
PushClientAttrib = {
  params = {bitmask},
  enums = {
    "CLIENT_ALL_ATTRIB_BITS CLIENT_PIXEL_STORE_BIT CLIENT_VERTEX_ARRAY_BIT",
  },
},
PushMatrix = {
  params = {},
},
PushName = {
  params = {int},
},

RasterPos2 = {
  func = "glRasterPos2f",
  params = {float, float},
},
RasterPos3 = {
  func = "glRasterPos3f",
  params = {float, float, float},
},
RasterPos4 = {
  func = "glRasterPos4f",
  params = {float, float, float, float},
},
ReadBuffer = {
  params = {enum},
  enums = {
    "FRONT_LEFT FRONT_RIGHT BACK_LEFT BACK_RIGHT FRONT BACK LEFT RIGHT" -- missing GL_AUXi
  },
},
--[[ReadPixels = {},]] -- complex
Rect = {
  func = "glRectf",
  params = {float, float, float, float},
},
RenderMode = {
  params = {enum},
  enums = {
    "RENDER SELECT FEEDBACK",
  },
  returntype = int,
},
ResetHistogram = {
  params = {enum},
  enums = {
    "HISTOGRAM",
  },
},
ResetMinmax = {
  params = {enum},
  enums = {
    "MINMAX",
  }
},
Rotate = {
  func = "glRotatef",
  params = {float, float, float, float},
},

SampleCoverage = {
  params = {float, boolean},
},
Scale = {
  func = "glScalef",
  params = {float, float, float},
},
Scissor = {
  params = {int, int, int, int},
},
SecondaryColor = {
  func = "glSecondaryColor3f",
  params = {float, float, float},
},
--[[SecondaryColorPointer = {},]] -- hurf, also durf
--[[SelectBuffer = {},]] -- difficult.
--[[SeparableFilter2D = {},]] -- difficult.
ShadeModel = {
  params = {enum},
  enums = {
    "FLAT SMOOTH",
  },
},
ShaderSource = {
  params = {shader, table(string)},
},
StencilFunc = {
  params = {enum, int, int},
  enums = {
    "NEVER LESS LEQUAL GREATER GEQUAL EQUAL NOTEQUAL ALWAYS",
    nil,
    nil,
  },
},
StencilFuncSeparate = {
  params = {enum, enum, int, int},
  enums = {
    "FRONT BACK FRONT_AND_BACK",
    "NEVER LESS LEQUAL GREATER GEQUAL EQUAL NOTEQUAL ALWAYS",
    nil,
    nil,
  }
},
StencilMaskSeparate = {
  params = {enum, int},
  enums = {
    "FRONT BACK FRONT_AND_BACK",
    nil,
  }
},
StencilOp = {
  params = {enum, enum, enum},
  enums = {
    "KEEP ZERO REPLACE INCR INCR_WRAP DECR DECR_WRAP INVERT",
    "KEEP ZERO REPLACE INCR INCR_WRAP DECR DECR_WRAP INVERT",
    "KEEP ZERO REPLACE INCR INCR_WRAP DECR DECR_WRAP INVERT",
  }
},
StencilOpSeparate = {
  params = {enum, enum, enum, enum},
  enums = {
    "FRONT BACK FRONT_AND_BACK",
    "KEEP ZERO REPLACE INCR INCR_WRAP DECR DECR_WRAP INVERT",
    "KEEP ZERO REPLACE INCR INCR_WRAP DECR DECR_WRAP INVERT",
    "KEEP ZERO REPLACE INCR INCR_WRAP DECR DECR_WRAP INVERT",
  }
},

TexCoord1 = {
  func = "glTexCoord1f",
  params = {float},
},
TexCoord2 = {
  func = "glTexCoord2f",
  params = {float, float},
},
TexCoord3 = {
  func = "glTexCoord3f",
  params = {float, float, float},
},
TexCoord4 = {
  func = "glTexCoord4f",
  params = {float, float, float, float},
},
TexCoordPointer = {
  {
    params = {int, typed_data_type, literal(0), typed_data_preserved},
    enums = {
      nil,
      "SHORT INT FLOAT DOUBLE",
      nil,
    }
  }, {
    params = {int, enum, int, int_forcecasted_void},
    enums = {
      nil,
      "SHORT INT FLOAT DOUBLE",
      nil,
    }
  }
},
--[[TexEnv = {},]] -- need better overloading
--[[TexGen = {},]] -- need better overloading

-- complicated to do data safety
TexImage1D = {
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
},
TexImage2D = {
  params = {enum, int, int_or_enum, int, int, int, enum, typed_data_type, typed_data},
  enums = {
    "TEXTURE_2D PROXY_TEXTURE_2D TEXTURE_CUBE_MAP_POSITIVE_X TEXTURE_CUBE_MAP_NEGATIVE_X TEXTURE_CUBE_MAP_POSITIVE_Y TEXTURE_CUBE_MAP_NEGATIVE_Y TEXTURE_CUBE_MAP_POSITIVE_Z TEXTURE_CUBE_MAP_NEGATIVE_Z PROXY_TEXTURE_CUBE_MAP",
    nil,
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 COMPRESSED_ALPHA COMPRESSED_LUMINANCE COMPRESSED_LUMINANCE_ALPHA COMPRESSED_INTENSITY COMPRESSED_RGB COMPRESSED_RGBA DEPTH_COMPONENT DEPTH_COMPONENT16 DEPTH_COMPONENT24 DEPTH_COMPONENT32 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16 SLUMINANCE SLUMINANCE8 SLUMINANCE_ALPHA SLUMINANCE8_ALPHA8 SRGB SRGB8 SRGB_ALPHA SRGB8_ALPHA8",  -- could be 1, 2, 3, 4 also
    nil,
    nil,
    nil,
    "COLOR_INDEX RED GREEN BLUE ALPHA RGB RGBA LUMINANCE LUMINANCE_ALPHA",
    "UNSIGNED_BYTE BYTE BITMAP UNSIGNED_SHORT SHORT UNSIGNED_INT INT FLOAT UNSIGNED_BYTE_3_3_2 UNSIGNED_BYTE_2_3_3_REV UNSIGNED_SHORT_5_6_5 UNSIGNED_SHORT_5_6_5_REV UNSIGNED_SHORT_4_4_4_4 UNSIGNED_SHORT_4_4_4_4_REV UNSIGNED_SHORT_5_5_5_1 UNSIGNED_SHORT_1_5_5_5_REV UNSIGNED_INT_8_8_8_8 UNSIGNED_INT_8_8_8_8_REV UNSIGNED_INT_10_10_10_2 UNSIGNED_INT_2_10_10_10_REV",
    nil,
  }
},
TexImage3D = {
  params = {enum, int, int_or_enum, int, int, int, int, enum, typed_data_type, typed_data},
  enums = {
    "TEXTURE_3D PROXY_TEXTURE_3D",
    nil,
    "ALPHA ALPHA4 ALPHA8 ALPHA12 ALPHA16 COMPRESSED_ALPHA COMPRESSED_LUMINANCE COMPRESSED_LUMINANCE_ALPHA COMPRESSED_INTENSITY COMPRESSED_RGB COMPRESSED_RGBA DEPTH_COMPONENT DEPTH_COMPONENT16 DEPTH_COMPONENT24 DEPTH_COMPONENT32 LUMINANCE LUMINANCE4 LUMINANCE8 LUMINANCE12 LUMINANCE16 LUMINANCE_ALPHA LUMINANCE4_ALPHA4 LUMINANCE6_ALPHA2 LUMINANCE8_ALPHA8 LUMINANCE12_ALPHA4 LUMINANCE12_ALPHA12 LUMINANCE16_ALPHA16 INTENSITY INTENSITY4 INTENSITY8 INTENSITY12 INTENSITY16 R3_G3_B2 RGB RGB4 RGB5 RGB8 RGB10 RGB12 RGB16 RGBA RGBA2 RGBA4 RGB5_A1 RGBA8 RGB10_A2 RGBA12 RGBA16 SLUMINANCE SLUMINANCE8 SLUMINANCE_ALPHA SLUMINANCE8_ALPHA8 SRGB SRGB8 SRGB_ALPHA SRGB8_ALPHA8",  -- could be 1, 2, 3, 4 also
    nil,
    nil,
    nil,
    nil,
    "COLOR_INDEX RED GREEN BLUE ALPHA RGB RGBA LUMINANCE LUMINANCE_ALPHA",
    "UNSIGNED_BYTE BYTE BITMAP UNSIGNED_SHORT SHORT UNSIGNED_INT INT FLOAT UNSIGNED_BYTE_3_3_2 UNSIGNED_BYTE_2_3_3_REV UNSIGNED_SHORT_5_6_5 UNSIGNED_SHORT_5_6_5_REV UNSIGNED_SHORT_4_4_4_4 UNSIGNED_SHORT_4_4_4_4_REV UNSIGNED_SHORT_5_5_5_1 UNSIGNED_SHORT_1_5_5_5_REV UNSIGNED_INT_8_8_8_8 UNSIGNED_INT_8_8_8_8_REV UNSIGNED_INT_10_10_10_2 UNSIGNED_INT_2_10_10_10_REV",
    nil,
  }
},

TexParameter = {  -- missing stuff due to a lack of overloading
  func = "glTexParameterf",
  params = {enum, enum, enum},
  enums = {
    "TEXTURE_1D TEXTURE_2D TEXTURE_3D TEXTURE_CUBE_MAP",
    "TEXTURE_MIN_FILTER TEXTURE_MAG_FILTER TEXTURE_MIN_LOD TEXTURE_MAX_LOD TEXTURE_BASE_LEVEL TEXTURE_MAX_LEVEL TEXTURE_WRAP_S TEXTURE_WRAP_T TEXTURE_WRAP_R TEXTURE_PRIORITY TEXTURE_COMPARE_MODE TEXTURE_COMPARE_FUNC DEPTH_TEXTURE_MODE GENERATE_MIPMAP",
    "NEAREST LINEAR NEAREST_MIPMAP_NEAREST LINEAR_MIPMAP_NEAREST NEAREST_MIPMAP_LINEAR LINEAR_MIPMAP_LINEAR CLAMP",
  }
},
--[[TexSubImage = {},]] -- need better overloading
Translate = {
  func = "glTranslatef",
  params = {float, float, float},
},

-- we're not doing arrays yet, and we should be
Uniform1f = {
  func = "glUniform1f",
  params = {int, float},
},
Uniform2f = {
  func = "glUniform2f",
  params = {int, float, float},
},
Uniform3f = {
  func = "glUniform3f",
  params = {int, float, float, float},
},
Uniform4f = {
  func = "glUniform4f",
  params = {int, float, float, float, float},
},
Uniform1i = {
  func = "glUniform1i",
  params = {int, int},
},
Uniform2i = {
  func = "glUniform2i",
  params = {int, int, int},
},
Uniform3i = {
  func = "glUniform3i",
  params = {int, int, int, int},
},
Uniform4i = {
  func = "glUniform4i",
  params = {int, int, int, int, int},
},
--[[UnmapBuffer = {},]] -- oh man.
UseProgram = {
  params = {program},
},

ValidateProgram = {
  params = {program},
},
Vertex2 = {
  func = "glVertex2f",
  params = {float, float},
},
Vertex3 = {
  func = "glVertex3f",
  params = {float, float, float},
},
Vertex4 = {
  func = "glVertex4f",
  params = {float, float, float, float},
},
-- we're not doing arrays yet, and we should be
VertexAttrib1 = {
  func = "glVertexAttrib1f",
  params = {int, float},
},
VertexAttrib2 = {
  func = "glVertexAttrib2f",
  params = {int, float, float},
},
VertexAttrib3 = {
  func = "glVertexAttrib3f",
  params = {int, float, float, float},
},
VertexAttrib4 = {
  func = "glVertexAttrib4f",
  params = {int, float, float, float, float},
},
--[[VertexAttribPointer = {},]] -- everything that is terrible
VertexPointer = {
  {
    params = {int, typed_data_type, literal(0), typed_data_preserved},
    enums = {
      nil,
      "SHORT INT FLOAT DOUBLE",
      nil,
    }
  }, {
    params = {int, enum, int, int_forcecasted_void},
    enums = {
      nil,
      "SHORT INT FLOAT DOUBLE",
      nil,
    }
  }
},
Viewport = {
  params = {int, int, int, int},
},
WindowPos2 = {
  func = "glWindowPos2f",
  params = {float, float},
},
WindowPos3 = {
  func = "glWindowPos3f",
  params = {float, float, float},
},

}

data.Color = {"Color3", "Color4"}
data.ConvolutionFilter = {"ConvolutionFilter1D", "ConvolutionFilter2D"}
data.CopyConvolutionFilter = {"CopyConvolutionFilter1D", "CopyConvolutionFilter2D"}
data.CopyTexImage = {"CopyTexImage1D", "CopyTexImage2D"}
data.CopyTexSubImage = {"CopyTexSubImage1D", "CopyTexSubImage2D", "CopyTexSubImage3D"}
data.EvalCoord = {"EvalCoord1", "EvalCoord2"}
data.EvalMesh = {"EvalMesh1", "EvalMesh2"}
data.EvalPoint = {"EvalPoint1", "EvalPoint2"}
data.MapGrid = {"MapGrid1", "MapGrid2"}
data.MultiTexCoord = {"MultiTexCoord1", "MultiTexCoord2", "MultiTexCoord3", "MultiTexCoord4"}
data.RasterPos = {"RasterPos2", "RasterPos3", "RasterPos4"}
data.TexCoord = {"TexCoord1", "TexCoord2", "TexCoord3", "TexCoord4"}
data.UniformI = {"Uniform1i", "Uniform2i", "Uniform3i", "Uniform4i"}
data.UniformF = {"Uniform1f", "Uniform2f", "Uniform3f", "Uniform4f"}
data.Vertex = {"Vertex2", "Vertex3", "Vertex4"}
data.VertexAttrib = {"VertexAttrib1", "VertexAttrib2", "VertexAttrib3", "VertexAttrib4"}
data.WindowPos = {"WindowPos2", "WindowPos3"}



options = {
  asymmetric = {
    -- ALL masks
    CLIENT_ALL_ATTRIB_BITS = true,
    
    -- Enum collisions. These are all either bitmasks or glBegin paramters.
    -- 0
    NONE = true,
    POINTS = true,
    ZERO = true,
    FALSE = true, -- this line worries me
    --NO_ERROR = true,
    
    -- 1
    CLIENT_PIXEL_STORE_BIT = true,
    CURRENT_BIT = true,
    ONE = true,
    LINES = true,
    
    -- 2
    LINE_LOOP = true,
    CLIENT_VERTEX_ARRAY_BIT = true,
    POINT_BIT = true,
    
    -- 4
    TRIANGLES = true,
    LINE_BIT = true,
    
    -- 8
    POLYGON_BIT = true,
    QUAD_STRIP = true,
    
    -- 256
    DEPTH_BUFFER_BIT = true,
    ACCUM = true,
    
    -- 512
    NEVER = true,
    ACCUM_BUFFER_BIT = true,
    
    -- 1024
    FRONT_LEFT = true,
    STENCIL_BUFFER_BIT = true,
    
    -- 4096
    TRANSFORM_BIT = true,
    TEXTURE_WIDTH = true,
  },
}
