local wezterm = require("wezterm")
local act = wezterm.action

local Keys = {}

local function is_vi_process(pane)
  local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
  return process_name == "nvim" or process_name == "vim" or process_name == "e"
end

local direction_keys = {
  Left = "h",
  Down = "j",
  Up = "k",
  Right = "l",
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == "resize" and "SHIFT|CMD" or "ALT",
    action = wezterm.action_callback(function(win, pane)
      if is_vi_process(pane) then
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == "resize" and "SHIFT|ALT" or "ALT" },
        }, pane)
      else
        if resize_or_move == "resize" then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

function Keys.setup(config)
  config.disable_default_key_bindings = false

  config.keys = {
    split_nav("move", "h"),
    split_nav("move", "j"),
    split_nav("move", "k"),
    split_nav("move", "l"),
    split_nav("resize", "h"),
    split_nav("resize", "j"),
    split_nav("resize", "k"),
    split_nav("resize", "l"),

    {
      mods = "SHIFT|CMD",
      key = [[|]],
      action = wezterm.action({
        SplitHorizontal = {
          domain = "CurrentPaneDomain"
        },
      }),
    },

    {
      mods = "SHIFT|CMD",
      key = "LeftArrow",
      action = wezterm.action.ActivatePaneDirection 'Left'
    },

    {
      mods = "SHIFT|CMD",
      key = "RightArrow",
      action = wezterm.action.ActivatePaneDirection 'Right'
    },

    {
      mods = "SHIFT|CMD",
      key = "DownArrow",
      action = wezterm.action.ActivatePaneDirection 'Down'
    },

    {
      mods = "SHIFT|CMD",
      key = "UpArrow",
      action = wezterm.action.ActivatePaneDirection 'Up'
    },

    {
      mods = "SHIFT|CMD",
      key = [[-]],
      action = wezterm.action({
        SplitVertical = {
          domain = "CurrentPaneDomain",
        },
      }),
    },

    { key = "y", mods = "ALT",        action = wezterm.action.ActivateCopyMode },
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
    { key = "=", mods = "CTRL",       action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CTRL",       action = wezterm.action.DecreaseFontSize },
  }
end

return Keys
