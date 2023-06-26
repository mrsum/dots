return {
  "NvChad/nvim-colorizer.lua",
  lazy = false,
  name = "colorizer",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local status, plugin = pcall(require, "colorizer")
    if not status then
      return
    end

    plugin.setup({
      buftypes = {},
      filetypes = { "*", "!prompt", "!popup" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = false,
        AARRGGBB = false,
        rgb_fn = false,
        hsl_fn = false,
        css = false,
        css_fn = false,
        mode = "background",
        tailwind = true,
        virtualtext = "■",
        always_update = false,
      },
    })
  end,
}
