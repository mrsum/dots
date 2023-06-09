local status, plugin = pcall(require, "nvim-navic")
if not status then
  return
end

plugin.setup({})
