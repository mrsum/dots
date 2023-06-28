return {
  setup = function(on_attach, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.eslint.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.yml",
        ".eslintrc.json",
        "eslint.config.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml"
      ),
    })
  end,
}
