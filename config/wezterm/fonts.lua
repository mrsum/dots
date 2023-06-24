local wezterm = require("wezterm")

local Fonts = {}

function Fonts.setup(config)
  config.font = wezterm.font_with_fallback({
    "FiraCode Nerd Font Mono",
  })
  config.font_size = 16
  config.underline_thickness = "100%"
  config.underline_position = "-3pt"
  config.line_height = 1.2
end

return Fonts
