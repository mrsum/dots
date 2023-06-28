return {
  setup = function(on_attach, capabilities)
    require("lspconfig").jsonls.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
      end,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
        },
      },
      init_options = {
        provideFormatter = true,
      },
      capabilities = capabilities,
    })
  end,
}
