return {
  "lewis6991/satellite.nvim",
  name = "_.mrsum.plugins.editor.satellite",
  config = function()
    require("satellite").setup({
      winblend = 20,
      zindex = 20,
      width = 2,
    })
  end,
}
