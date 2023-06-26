local _M = {}

_M.setup = function(on_attach, capabilities)
  require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return _M
