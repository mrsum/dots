return {
  "folke/trouble.nvim",
  name = "_.mrsum.plugins.editor.trouble",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      position = "right",
      width = 80,
      action_keys = {
        jump = "<cr>",
      },
    })
  end,
}
