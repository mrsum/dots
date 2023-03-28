local theme_name = "catppuccin"

local setup, theme = pcall(require, theme_name)
if not setup then
  return
end

theme.setup({
  -- latte, frappe, macchiato, mocha
  flavour = "mocha",
  styles = {
    keywords = { "bold" },
    functions = { "italic" },
  },
  transparent_background = true,
  integrations = {
    mason = true,
    which_key = true,
    nvimtree = false,
    dap = { enabled = true, enable_ui = true },
  },
  custom_highlights = function(colors)
    return {
      PanelHeading = { fg = colors.lavender, style = { "bold", "italic" } },

      LazyH1 = { bg = "NONE", fg = colors.lavender, style = { "bold" } },
      LazyButton = { bg = "NONE", fg = colors.overlay0 },
      LazyButtonActive = { bg = "NONE", fg = colors.lavender, style = { " bold" } },
      LazySpecial = { fg = colors.sapphire },

      FloatBorder = { fg = colors.overlay1 },
      TelescopeBorder = { fg = colors.overlay1 },
      WhichKeyBorder = { fg = colors.overlay1 },
      NeoTreeFloatBorder = { fg = colors.overlay1 },
      LspInfoBorder = { fg = colors.overlay1 },

      IndentBlanklineContextChar = { fg = colors.overlay0 },
    }
  end,
})

vim.cmd.colorscheme(theme_name)
