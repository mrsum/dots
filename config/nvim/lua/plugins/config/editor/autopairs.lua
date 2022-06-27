local status_ok, plugin = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

plugin.setup()
