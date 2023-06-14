local status, plugin = pcall(require, "nvim-tree")
if not status then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

plugin.setup({
  respect_buf_cwd = true,
  sync_root_with_cwd = true,

  update_focused_file = {
    enable = true,
    update_root = true,
  },

  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
        },
      },
    },
  },

  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
