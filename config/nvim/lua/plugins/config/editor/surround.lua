local status_ok, plugin = pcall(require, "surround")
if not status_ok then
  return
end

plugin.setup({
  mappings_style = "surround"
})
