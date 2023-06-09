local status, plugin = pcall(require, "trouble")
if not status then
  return
end

plugin.setup({
  width = 50,
  height = 10,
  icons = true,
  group = true,
  padding = true,
  position = "right",
  fold_open = "",
  fold_closed = "",
  indent_lines = true,
  auto_open = false,
  auto_close = false,
  auto_preview = true,
  auto_fold = false,
  auto_jump = {
    "lsp_definitions",
  },
  mode = "workspace_diagnostics",
  use_diagnostic_signs = true,
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠",
  },
  action_keys = {
    close = "q",
    cancel = "<esc>",
    refresh = "r",
    jump = { "<cr>", "<tab>" },
    open_split = { "<c-x>" },
    open_vsplit = { "<c-v>" },
    open_tab = { "<c-t>" },
    jump_close = { "o" },
    toggle_mode = "m",
    toggle_preview = "P",
    hover = "K",
    preview = "p",
    close_folds = { "zM", "zm" },
    open_folds = { "zR", "zr" },
    toggle_fold = { "zA", "za" },
    previous = "k",
    next = "j",
  },
})
