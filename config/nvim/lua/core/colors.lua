local cmd = vim.cmd
local glb = vim.g

glb.tokyonight_style                = "night"
glb.tokyonight_italic_functions     = true
glb.tokyonight_italic_variables     = true
glb.tokyonight_transparent          = true
glb.tokyonight_transparent_sidebar  = true
glb.tokyonight_dark_sidebar         = false
glb.tokyonight_dark_float           = false

cmd([[colorscheme tokyonight]])

