return {
  "AlexvZyl/nordic.nvim",
  name = "_.mrsum.themes.nordic",
  config = function()
    require("nordic").setup({
      transparent_bg = true,
      override = {
        CursorLine = {
          bg = "#292A3B", -- Choose a color you like.
          bold = true, -- Or false.
        },
        Visual = {
          bg = "#292A3B", -- Choose a color you like.
          bold = true, -- Or false.
        },
      },
    })
  end,
}
