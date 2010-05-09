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
  params = {enum, typed_data_type, typed_data},
  enums = {
    "POINTS LINE_STRIP LINE_LOOP LINES TRIANGLE_STRIP TRIANGLE_FAN TRIANGLES QUAD_STRIP QUADS POLYGON",
  },
  insertions = {
    [2] = "param3_size",
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
  params = {enum, int, int, int, typed_data_type, typed_data},
  enums = {
    "POINTS LINE_STRIP LINE_LOOP LINES TRIANGLE_STRIP TRIANGLE_FAN TRIANGLES QUAD_STRIP QUADS POLYGON",
    nil,
    nil,
    nil,
    "UNSIGNED_BYTE UNSIGNED_SHORT UNSIGNED_INT",
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
data.CopyConvolutionFilter = {"CopyConvolutionFilter1D", "CopyConvolutionFilter2D"}
data.CopyTexImage = {"CopyTexImage1D", "CopyTexImage2D"}
data.CopyTexSubImage = {"CopyTexSubImage1D", "CopyTexSubImage2D", "CopyTexSubImage3D"}
data.EvalCoord = {"EvalCoord1", "EvalCoord2"}
data.EvalMesh = {"EvalMesh1", "EvalMesh2"}
data.EvalPoint = {"EvalPoint1", "EvalPoint2"}
