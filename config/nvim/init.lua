local g = vim.g

-- global
g.mapleader = " "

require("core.utils")
require("core.options")
require("core.colors")

-- plugins list
require("plugins.list")

-- plugins config
require("plugins.config")

require("core.keymaps")

