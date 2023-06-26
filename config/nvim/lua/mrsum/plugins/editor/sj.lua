return {
  "woosaaahh/sj.nvim",
  lazy = false,
  config = function()
    local status, plugin = pcall(require, "sj")
    if not status then
      return
    end

    plugin.setup({
      prompt_prefix = "/",
      highlights = {

        SjFocusedLabel = {
          bold = false,
          italic = false,
          fg = "#FFFFFF",
          bg = "#C000C0",
        },

        SjLabel = {
          bold = true,
          italic = false,
          fg = "#000000",
          bg = "#5AA5DE",
        },

        SjLimitReached = {
          bold = true,
          italic = false,
          fg = "#000000",
          bg = "#DE945A",
        },

        SjMatches = {
          bold = false,
          italic = false,
          fg = "#DDDDDD",
          bg = "#005080",
        },

        SjNoMatches = {
          bold = false,
          italic = false,
          fg = "#DE945A",
        },

        SjOverlay = {
          bold = false,
          italic = false,
          fg = "#345576",
        },
      },
    })
  end,
}
