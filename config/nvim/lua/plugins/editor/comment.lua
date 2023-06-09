local status, plugin = pcall(require, "Comment")
if not status then
  return
end

plugin.setup({})
