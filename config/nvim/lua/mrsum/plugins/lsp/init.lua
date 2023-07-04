local lang_list = {
  "html",
  "cssls",
  "lua_ls",
  "bashls",
  "eslint",
  "graphql",
  "null_ls",
  "jsonls",
  "yamlls",
  "tsserver",
  "emmet_ls",
  "cssmodules_ls",
}

local linter_list = {
  "stylua",
  "prettier",
  "eslint_d",
}

return {
  "williamboman/mason.nvim",
  lazy = false,
  build = ":MasonUpdate",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    {
      "glepnir/lspsaga.nvim",
      event = "LspAttach",
      dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    },

    { "williamboman/mason-lspconfig.nvim" },
    { "jayp0521/mason-null-ls.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "onsails/lspkind.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "jose-elias-alvarez/typescript.nvim" },
    { "b0o/schemastore.nvim" },
  },

  config = function()
    local mason_status, mason = pcall(require, "mrsum.plugins.lsp.config.mason")
    if not mason_status then
      return
    end

    local lsp_status, lsp = pcall(require, "mrsum.plugins.lsp.config.lsp")
    if not lsp_status then
      return
    end

    local saga_status, saga = pcall(require, "mrsum.plugins.lsp.config.saga")
    if not saga_status then
      return
    end

    -- install languages support and linters by mason
    mason.setup(lang_list, linter_list)

    -- activate language server protocols
    lsp.setup(lang_list)

    -- lsp saga
    saga.setup()
  end,
}
