local status_ok, plugin = pcall(require, "colorizer")
if not status_ok then
  return
end

plugin.setup({})
