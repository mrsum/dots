return {
  setup = function(on_attach, capabilities)
    require("lspconfig").cssmodules_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "javascriptreact", "typescriptreact" },
    })
  end,
}
