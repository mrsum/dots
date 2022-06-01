local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  open_mapping = [[<c-\>]],
  direction = "vertical",
  size = 80,
  persist_size = true,
  close_on_exit = true,
})
