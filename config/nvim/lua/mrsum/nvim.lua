local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins_list = {

  -- themes
  { import = "mrsum.themes.catppuccin" },
  { import = "mrsum.themes.kanagawa" },
  -- core
  { import = "mrsum.core.autocmds" },
  { import = "mrsum.core.keymaps" },

  -- editor plugins
  { import = "mrsum.plugins.editor.neoscroll" },
  { import = "mrsum.plugins.editor.lualine" },
  { import = "mrsum.plugins.editor.split" },
  { import = "mrsum.plugins.editor.neotree" },
  { import = "mrsum.plugins.editor.treesitter" },
  { import = "mrsum.plugins.editor.fzf" },
  { import = "mrsum.plugins.editor.mini" },
  { import = "mrsum.plugins.editor.formatter" },
  { import = "mrsum.plugins.editor.trouble" },
  { import = "mrsum.plugins.editor.cmp" },
  { import = "mrsum.plugins.editor.tabby" },
  { import = "mrsum.plugins.editor.minimap" },
  -- { import = "mrsum.plugins.editor.codeium" },

  -- git
  { import = "mrsum.plugins.git.neogit" },
  { import = "mrsum.plugins.git.gitsigns" },

  -- lsp
  { import = "mrsum.plugins.lsp" },
}

require("lazy").setup(plugins_list)
