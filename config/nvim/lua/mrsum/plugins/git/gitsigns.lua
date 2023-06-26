return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "f-person/git-blame.nvim",
  },
  lazy = false,
  config = function()
    local status, plugin = pcall(require, "gitsigns")
    if not status then
      return
    end

    plugin.setup({})
  end,
}
