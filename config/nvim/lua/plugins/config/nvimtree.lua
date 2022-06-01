local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  return
end


nvimtree.setup({
  update_cwd = true,
  open_on_tab = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  filters = {
    exclude = {
      "node_modules"
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint    = "",
      info    = "",
      warning = "",
      error   = "",
    },
  },
})
