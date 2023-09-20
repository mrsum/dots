return {
  "nvim-lualine/lualine.nvim",
  name = "_.mrsum.plugins.editor.lualine",
  dependencies = {},
  config = function()
    local setup, plugin = pcall(require, "lualine")
    if not setup then
      return
    end

    plugin.setup({
      options = {
        theme = "auto",
      },
    })
  end,
}
