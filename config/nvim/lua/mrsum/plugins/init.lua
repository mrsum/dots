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

-- list of plugins
-- each plugin should contain
-- config file like ~/.config/nvim/lua/mrsum/plugins/*.lua
local plugins_list = {
  -- themes
  { import = "mrsum.themes.catppuccin" },

  -- core
  { import = "mrsum.plugins.keymaps" },

  -- ui
  { import = "mrsum.plugins.ui.neoscroll" },
  { import = "mrsum.plugins.ui.heirline" },
  { import = "mrsum.plugins.ui.tabby" },
  { import = "mrsum.plugins.ui.trouble" },
  { import = "mrsum.plugins.ui.noice" },

  -- editor
  { import = "mrsum.plugins.editor.sj" },
  { import = "mrsum.plugins.editor.cmp" },
  { import = "mrsum.plugins.editor.colorizer" },
  { import = "mrsum.plugins.editor.autopairs" },
  { import = "mrsum.plugins.editor.cursorline" },
  { import = "mrsum.plugins.editor.telescope" },
  { import = "mrsum.plugins.editor.neotree" },
  { import = "mrsum.plugins.editor.dropbar" },
  { import = "mrsum.plugins.editor.treesitter" },
  { import = "mrsum.plugins.editor.wilder" },
  { import = "mrsum.plugins.editor.illuminate" },
  { import = "mrsum.plugins.editor.comment" },
  { import = "mrsum.plugins.editor.devicons" },
  { import = "mrsum.plugins.editor.gitsigns" },
  { import = "mrsum.plugins.editor.statuscol" },

  -- git
  { import = "mrsum.plugins.git.diffview" },
  { import = "mrsum.plugins.git.gitsigns" },
  { import = "mrsum.plugins.git.neogit" },

  -- lsp
  { import = "mrsum.plugins.lsp" },
}

require("lazy").setup(plugins_list, {
  defaults = {
    lazy = true,
    version = false,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "rounded",
    icons = {
      cmd = vim.g.emoji and "🌠" or " ",
      config = vim.g.emoji and "🔧" or "",
      event = vim.g.emoji and "🌈" or "",
      ft = vim.g.emoji and "🔖" or " ",
      init = vim.g.emoji and "🔧" or "",
      import = vim.g.emoji and "⚓" or "",
      keys = vim.g.emoji and "⌨ " or "",
      lazy = vim.g.emoji and "🌜" or " ",
      loaded = vim.g.emoji and "🌕" or "",
      not_loaded = vim.g.emoji and "🌑" or "",
      plugin = vim.g.emoji and "📦" or "",
      runtime = vim.g.emoji and "⛺" or "",
      source = vim.g.emoji and "📰" or " ",
      start = vim.g.emoji and "🛫" or "",
      task = vim.g.emoji and "✅" or "",
      list = {
        "",
        "",
        "",
        "‒",
      },
    },
  },
})
