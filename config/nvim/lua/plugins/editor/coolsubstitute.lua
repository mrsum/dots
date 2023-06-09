local status, plugin = pcall(require, "cool-substitute")
if not status then
  return
end

plugin.setup({
  setup_keybindings = true,
})
