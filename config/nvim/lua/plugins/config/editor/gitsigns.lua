local status_ok, plugin = pcall(require, "gitsigns")
if not status_ok then
  return
end

plugin.setup({})
