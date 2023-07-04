return {
  setup = function(on_attach, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.tsserver.setup({
      capabilities = capabilities,
      single_file_support = false,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
      end,
      commands = {
        OrganizeImports = {
          function()
            vim.lsp.buf.execute_command({
              command = "_typescript.organizeImports",
              arguments = {
                vim.api.nvim_buf_get_name(0),
              },
              title = "Organize Imports",
            })
          end,
          description = "Organize Imports",
        },
      },
    })
  end,
}
