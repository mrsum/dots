local _M = {}

_M.setup = function(on_attach, capabilities)
  require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        format = { enable = false },
        completion = { callSnippet = "Replace" },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  })
end

return _M
