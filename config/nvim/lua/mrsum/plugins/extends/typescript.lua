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
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
      },
      tsserver_plugins = {
        "@styled/typescript-styled-plugin",
      },
    })
  end,
}
