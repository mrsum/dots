local tab = require("tab")
local theme = require("theme")
local keys = require("keys")
local fonts = require("fonts")

local wezterm = require("wezterm")

local config = {
  enable_wayland = false,
  pane_focus_follows_mouse = false,
  warn_about_missing_glyphs = false,
  show_update_window = true,
  check_for_updates = true,
  window_decorations = "NONE",
  window_close_confirmation = "NeverPrompt",
  window_padding = {
    top = 10,
    bottom = 10,
    left = 10,
    right = 10,
  },
  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = wezterm.GLOBAL.is_dark and 0.90 or 0.95,
  },
  enable_scroll_bar = false,
  window_background_opacity = 0.98,
  hyperlink_rules = {
    {
      regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
      format = "$0",
    },
    {
      regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },
    {
      regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
      format = "mailto:$0",
    },
    {
      regex = [[\bfile://\S*\b]],
      format = "$0",
    },
    {
      regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = "$0",
    },
    {
      regex = [[\b[tT](\d+)\b]],
      format = "https://example.com/tasks/?t=$1",
    },
  },
}

fonts.setup(config)
theme.setup(config)
keys.setup(config)
tab.setup(config)

return config
