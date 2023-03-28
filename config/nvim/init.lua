-- @author: https://github.com/mrsum
-- @see:
--
vim.g.mapleader = " "

-- @see: lua/core/options.lua
require("core.options")

-- list of plugins
-- @see: lua/list.lua
require("list")

-- ui.theme
require("plugins.ui.theme")

-- ui.plugins
require("plugins.ui.feline")
require("plugins.ui.telescope")
require("plugins.ui.tabby")
require("plugins.ui.trouble")
require("plugins.ui.nvimtree")
require("plugins.ui.neoscroll")

-- editor.plugins
require("plugins.editor.treesitter")
require("plugins.editor.cmp")
require("plugins.editor.autopairs")
require("plugins.editor.comment")
require("plugins.editor.blankline")
require("plugins.editor.colorizer")
require("plugins.editor.coolsubstitute")
require("plugins.editor.sj")
require("plugins.editor.cursorline")
require("plugins.editor.autoclose")
require("plugins.editor.wilder")

-- lsp
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
require("plugins.lsp.barbecue")

-- git.plugins
require("plugins.git.gitsigns")
require("plugins.git.blamer")
require("plugins.git.diffview")
require("plugins.git.neogit")

-- keybindings
-- @see: lua/keymaps.lua
require("keymaps")
