local status, plugin = pcall(require, "diffview")
if not status then
  return
end

plugin.setup({})
