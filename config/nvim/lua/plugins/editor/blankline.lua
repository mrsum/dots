local setup, blankline = pcall(require, "indent_blankline")
if not setup then
  return
end

blankline.setup({})
