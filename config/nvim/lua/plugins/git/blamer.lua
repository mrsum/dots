local status, plugin = pcall(require, "blamer")
if not status then
  return
end

plugin.setup({})
