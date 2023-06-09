local status, plugin = pcall(require, "autoclose")
if not status then
  return
end

plugin.setup({})
