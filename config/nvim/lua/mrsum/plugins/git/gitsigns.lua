return {
  "lewis6991/gitsigns.nvim",
  name = "_.mrsum.plugins.git.gitsigns",
  dependencies = {
    "f-person/git-blame.nvim",
  },
  config = function()
    local status, plugin = pcall(require, "gitsigns")
    if not status then
      return
    end

    plugin.setup({})
  end,
}
