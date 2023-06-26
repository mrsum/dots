return {
  "Bekaboo/dropbar.nvim",
  lazy = false,
  config = function()
    local status, plugin = pcall(require, "dropbar")
    if not status then
      return
    end

    plugin.setup({})
  end,
}
