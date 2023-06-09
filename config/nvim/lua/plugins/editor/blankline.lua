local status, plugin = pcall(require, "indent_blankline")
if not status then
  return
end

plugin.setup({})
