local vim = vim
local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 0,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 100,
  undofile = true,
  updatetime = 100,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = false,
  numberwidth = 1,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 10,
  sidescrolloff = 10,
  guifont = "FiraMono Nerd Font",
  laststatus = 3,
  splitkeep = "screen",
}

local global_options = {
  gitblame_enabled = 1,
  gitblame_message_template = "  <author> • <summary> • <date> •",
  gitblame_delay = 400,
  Illuminate_delay = 0,
}

vim.opt.shortmess:append("c")

vim.filetype.add({
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
  },
})

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(global_options) do
  vim.g[k] = v
end
