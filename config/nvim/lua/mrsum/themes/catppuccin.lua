return {
  "catppuccin/nvim",
  name = "_.mrsum.themes.catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      -- latte, frappe, macchiato, mocha
      flavour = "mocha",
      styles = {
        keywords = { "bold" },
        functions = { "italic" },
      },
      transparent_background = true,
      integrations = {
        cmp = true,
        mason = true,
        neotree = true,
        neogit = true,
        which_key = true,
        telescope = true,
        noice = true,
        dap = {
          enabled = true,
          enable_ui = true,
        },
      },

      custom_highlights = function(colors)
        return {
          PanelHeading = {
            fg = colors.lavender,
            style = { "bold", "italic" },
          },

          LazyH1 = {
            bg = "NONE",
            fg = colors.lavender,
            style = { "bold" },
          },
          LazyButton = {
            bg = "NONE",
            fg = colors.overlay0,
          },
          LazyButtonActive = {
            bg = "NONE",
            fg = colors.lavender,
            style = { " bold" },
          },
          LazySpecial = {
            fg = colors.sapphire,
          },
          FloatBorder = {
            fg = colors.overlay1,
          },
          TelescopeBorder = {
            fg = colors.overlay1,
          },
          WhichKeyBorder = {
            fg = colors.overlay1,
          },
          NeoTreeFloatBorder = {
            fg = colors.overlay1,
          },
          LspInfoBorder = {
            fg = colors.overlay1,
          },

          IndentBlanklineContextChar = {
            fg = colors.overlay0,
          },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
