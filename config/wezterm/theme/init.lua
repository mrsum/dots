local wezterm = require("wezterm")

local Theme = {}

function Theme.get_colors()
  wezterm.GLOBAL.is_dark = wezterm.gui.get_appearance():find("Dark")

  local THEME_NAME = "github"
  local palettes = require("theme.palettes." .. THEME_NAME)

  return wezterm.GLOBAL.is_dark and palettes.mocha or palettes.latte
end

function Theme.setup(config)
  local colors = Theme.get_colors()

  config.colors = {
    split = colors.surface0,
    foreground = colors.text,
    background = colors.base,
    cursor_bg = colors.text,
    cursor_border = colors.overlay2,
    cursor_fg = colors.base,
    selection_bg = colors.surface2,
    visual_bell = colors.surface0,
    indexed = {
      [16] = colors.peach,
      [17] = colors.rosewater,
    },
    scrollbar_thumb = colors.surface2,
    compose_cursor = colors.flamingo,
    ansi = {
      colors.surface0,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.mauve,
      colors.teal,
      colors.text,
    },
    brights = {
      colors.surface2,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.mauve,
      colors.teal,
      colors.surface2,
    },
    tab_bar = {
      background = colors.mantle,
      active_tab = {
        bg_color = "none",
        fg_color = colors.subtext1,
        intensity = "Bold",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = colors.mantle,
        fg_color = colors.surface2,
      },
      inactive_tab_hover = {
        bg_color = colors.mantle,
        fg_color = colors.surface2,
      },
      new_tab = {
        bg_color = colors.mantle,
        fg_color = colors.subtext0,
      },
      new_tab_hover = {
        bg_color = colors.mantle,
        fg_color = colors.surface2,
      },
    },
  }
end

return Theme
