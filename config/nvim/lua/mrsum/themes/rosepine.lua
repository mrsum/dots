return {
  "rose-pine/neovim",
  name = "_.mrsum.themes.rose-pine",
  priority = 1001,
  config = function()
    local setup, plugin = pcall(require, "rose-pine")
    if not setup then
      return
    end

    plugin.setup({
      variant = "auto",
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = true,
      extend_background_behind_borders = false,
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    })
  end,
}
