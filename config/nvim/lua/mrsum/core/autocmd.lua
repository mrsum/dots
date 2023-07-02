local _autocmd = vim.api.nvim_create_autocmd

_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup("YankHighlight", {
    clear = true,
  }),
})

_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("ResizeSplit", {
    clear = true,
  }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert!")
  end,
})
