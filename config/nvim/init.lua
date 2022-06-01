local g = vim.g

-- global
g.mapleader = " "

-- settings
require("utils")
require("options")

-- plugins list
require("plugins")

-- plugins configs
require("plugins.config")

-- keymaps
require("keymaps")
