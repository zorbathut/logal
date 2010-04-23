pointSize = {
  params = {float},
},
polygonMode = {
  params = {enum, enum},
  validity = {
      "FRONT BACK FRONT_AND_BACK",
      "POINT LINE FILL",
  }
},
texImage = {
  {
    function = "glTexImage1D",
    params = {enum, int, int, int, int, enum, enum, table_data},
    names = {nil, nil, nil, "width", nil, "format", "type", "data"},
    custom = {nil, nil, nil, nil, nil, nil, nil, 
      {
        parse = [[
          // C code here
        ]],
        cleanup = [[
          // C code here
        ]],
      }
    },
    validity = {
      "TEXTURE_1D",
      nil,
      nil,
      nil,
      nil,
      "COLOR_INDEX RED GREEN BLUE ALPHA RGB RGBA LUMINANCE LUMINANCE_ALPHA",
      "type_validities_here",
      nil,
    }
  }
},
color = {
  {
    function = "glColor3f",
    params = {float, float, float},
  },
  {
    function = "glColor4f",
    params = {float, float, float},
  },

}