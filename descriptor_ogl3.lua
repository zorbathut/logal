
data = {

BindFramebuffer = {
  params = {enum, fbo},
  enums = {
    "DRAW_FRAMEBUFFER READ_FRAMEBUFFER FRAMEBUFFER",
  }
},
BindRenderbuffer = {
  params = {enum, rbo},
  enums = {
    "RENDERBUFFER",
  }
},

FramebufferRenderbuffer = {
  params = {enum, enum, enum, rbo},
  enums = {
    "DRAW_FRAMEBUFFER READ_FRAMEBUFFER FRAMEBUFFER",
    "DEPTH_ATTACHMENT STENCIL_ATTACHMENT DEPTH_STENCIL_ATTACHMENT", -- missing COLOR_ATTACHMENTi
    "RENDERBUFFER",
  }
},
FramebufferTexture1D = {
  params = {enum, enum, enum, texture, int},
  enums = {
    "DRAW_FRAMEBUFFER READ_FRAMEBUFFER FRAMEBUFFER",
    "DEPTH_ATTACHMENT STENCIL_ATTACHMENT DEPTH_STENCIL_ATTACHMENT", -- needs color_attachmentblarg
    "TEXTURE_1D",
  }
},
FramebufferTexture2D = {
  params = {enum, enum, enum, texture, int},
  enums = {
    "DRAW_FRAMEBUFFER READ_FRAMEBUFFER FRAMEBUFFER",
    "DEPTH_ATTACHMENT STENCIL_ATTACHMENT DEPTH_STENCIL_ATTACHMENT", -- needs color_attachmentblarg
    "TEXTURE_2D",
  }
},
FramebufferTexture3D = {
  params = {enum, enum, enum, texture, int, int},
  enums = {
    "DRAW_FRAMEBUFFER READ_FRAMEBUFFER FRAMEBUFFER",
    "DEPTH_ATTACHMENT STENCIL_ATTACHMENT DEPTH_STENCIL_ATTACHMENT", -- needs color_attachmentblarg
    "TEXTURE_3D TEXTURE_CUBE_MAP_POSITIVE_X TEXTURE_CUBE_MAP_POSITIVE_Y TEXTURE_CUBE_MAP_POSITIVE_Z TEXTURE_CUBE_MAP_NEGATIVE_X TEXTURE_CUBE_MAP_NEGATIVE_Y TEXTURE_CUBE_MAP_NEGATIVE_Z",
  }
},
  
}

