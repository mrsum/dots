local setup, cs = pcall(require, "cool-substitute")
if not setup then
  return
end

cs.setup({
  setup_keybindings = true,
})
