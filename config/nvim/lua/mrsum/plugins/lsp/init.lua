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
  "stylua",
  "prettier",
  "eslint_d",
}

return {
  "neovim/nvim-lspconfig",
  name = "_.mrsum.plugins.lsp",
  dependencies = {
    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", -- Optional
    "nvimdev/guard.nvim",

    -- Custom
    "folke/neodev.nvim",
    "glepnir/lspsaga.nvim",
  },

  config = function()
    local lsp = require("lspconfig")
    local ft = require("guard.filetype")
    local mason = require("mason")
    local lspsaga = require("lspsaga")
    local mason_lsp_config = require("mason-lspconfig")

    -- install lsp language from list
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- languages and linters
    mason_lsp_config.setup({
      ensure_installed = lang_list,
      automatic_installation = true,
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = "",
        spacing = 0,
      },
      signs = true,
      underline = true,
    })

    -- symbols for autocomplete
    vim.lsp.protocol.CompletionItemKind = {
      "   (Text) ",
      "   (Method)",
      "   (Function)",
      "   (Constructor)",
      " ﴲ  (Field)",
      "[] (Variable)",
      "   (Class)",
      " ﰮ  (Interface)",
      "   (Module)",
      " 襁 (Property)",
      "   (Unit)",
      "   (Value)",
      " 練 (Enum)",
      "   (Keyword)",
      "   (Snippet)",
      "   (Color)",
      "   (File)",
      "   (Reference)",
      "   (Folder)",
      "   (EnumMember)",
      " ﲀ  (Constant)",
      " ﳤ  (Struct)",
      "   (Event)",
      "   (Operator)",
      "   (TypeParameter)",
    }

    mason_lsp_config.setup_handlers({
      function(server_name)
        if server_name then
          lsp[server_name].setup({})
        end
      end,
    })

    lspsaga.setup({
      finder = {
        max_height = 0.6,
        keys = {
          vsplit = "<C-v>",
          toggle_or_open = "<cr>",
        },
      },
    })

    -- define formatters for filetype
    ft("lua"):fmt("stylua")
    ft("typescript,javascript,typescriptreact"):fmt("prettier")

    require("guard").setup({
      fmt_on_save = true,
      lsp_as_default_formatter = false,
    })
  end,
}
