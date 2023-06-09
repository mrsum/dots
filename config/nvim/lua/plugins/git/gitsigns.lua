local status, plugin = pcall(require, "gitsigns")
if not status then
  return
end

plugin.setup({})
