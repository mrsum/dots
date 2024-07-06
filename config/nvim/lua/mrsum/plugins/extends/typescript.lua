return {
  "pmizio/typescript-tools.nvim",
  name = "_.mrsum.plugins.extends.typescript",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local setup, plugin = pcall(require, "typescript-tools")
    if not setup then
      return
    end

    plugin.setup({
      settings = {
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
        tsserver_plugins = {
          "@styled/typescript-styled-plugin",
        },
      },
    })
  end,
}
