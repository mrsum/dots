local wezterm = require("wezterm")

local Fonts = {}

function Fonts.setup(config)
  config.font = wezterm.font_with_fallback({
    family = "JetBrainsMono Nerd Font",
    weight = "Bold",
  })

  config.line_height = 1.2
  config.underline_position = "-3pt"
  config.underline_thickness = "100%"
end

return Fonts
