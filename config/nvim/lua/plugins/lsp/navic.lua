local setup, navic = pcall(require, "nvim-navic")
if not setup then
  return
end

navic.setup({})
