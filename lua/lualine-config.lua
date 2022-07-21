require('lualine').setup({
sections={
  lualine_c={
    {
    'filename',
    path = 1,
  }
  },
  lualine_a={},
  lualine_b={},
  lualine_y={},
  lualine_z={}
},
inactive_sections={
  lualine_a={},
  lualine_b={},
 lualine_c={
   {
    'filename',
    path = 1,
  }
  },
}
})
