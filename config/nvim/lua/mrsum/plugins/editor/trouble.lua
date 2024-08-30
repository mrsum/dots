return {
  "folke/trouble.nvim",
  name = "_.mrsum.plugins.editor.trouble",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local setup, plugin = pcall(require, "trouble")
    if not setup then
      return
    end

    plugin.setup({
      win = {
        position = "right",
        size = {
          width = 100,
        },
      },
      action_keys = {
        jump = "<cr>",
      },
    })
  end,
}
