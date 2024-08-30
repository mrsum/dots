return {
  "nvim-lualine/lualine.nvim",
  name = "_.mrsum.plugins.editor.lualine",
  dependencies = {},
  config = function()
    local setup, plugin = pcall(require, "lualine")
    if not setup then
      return
    end

    local opts = {
      options = {
        theme = "auto",
      },
    }
    plugin.setup(opts)
  end,
}
