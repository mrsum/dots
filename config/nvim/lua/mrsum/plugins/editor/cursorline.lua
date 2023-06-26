return {
  "yamatsum/nvim-cursorline",
  lazy = false,
  config = function()
    local status, plugin = pcall(require, "nvim-cursorliner")
    if not status then
      return
    end

    plugin.setup({
      cursorline = {
        enable = true,
      },
      cursorword = {
        enable = true,
      },
    })
  end,
}
