local wezterm = require("wezterm")

local Fonts = {}

function Fonts.setup(config)
  config.font = wezterm.font_with_fallback({
    family = "FiraCode Nerd Font Mono",
    weight = "Bold",
  })

  config.line_height = 1.2
  config.underline_position = "-3pt"
  config.underline_thickness = "100%"
end

return Fonts
