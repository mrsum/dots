local _autocmd = vim.api.nvim_create_autocmd

-- put your autocmd here
_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup("YankHighlight", {
    clear = true,
  }),
})
