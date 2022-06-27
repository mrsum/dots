local status_ok, plugin = pcall(require, "neoscroll")
if not status_ok then
  return
end

plugin.setup({
  easing_function = "quadratic"
})
