local status, plugin = pcall(require, "dropbar")
if not status then
  return
end

plugin.setup({})
