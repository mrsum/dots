return {
  "NeogitOrg/neogit",
  name = "_.mrsum.plugins.git.neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    local setup, plugin = pcall(require, "neogit")
    if not setup then
      return
    end

    plugin.setup({
      popup = {
        kind = "floating",
      },
      commit_popup = {
        kind = "floating",
      },
    })
  end,
}
