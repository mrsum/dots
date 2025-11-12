local lang_list = {
  "html",
  "cssls",
  "lua_ls",
  "bashls",
  "eslint",
  "graphql",
  "jsonls",
  "yamlls",
  "ts_ls",
  "cssmodules_ls",
  "gopls",
}

return {
  "neovim/nvim-lspconfig",
  name = "_.mrsum.plugins.lsp",
  dependencies = {
    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", -- Optional
    -- Custom
    "folke/neodev.nvim",
    "glepnir/lspsaga.nvim",
    "rachartier/tiny-inline-diagnostic.nvim",
  },

  config = function()
    local mason = require("mason")
    local lspsaga = require("lspsaga")
    local mason_lsp_config = require("mason-lspconfig")
    local diagnostic = require("tiny-inline-diagnostic")

    vim.diagnostic.config({ virtual_text = false })

    -- nice and clean diagnostic popup
    diagnostic.setup()

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

    lspsaga.setup({
      lightbulb = {
        enable = false,
      },
      finder = {
        max_height = 0.6,
        keys = {
          vsplit = "<C-v>",
          toggle_or_open = "<CR>",
        },
      },
      outline = {
        win_width = 50,
        keys = {
          toggle_or_jump = "<CR>",
        },
      },
    })

    for k, v in pairs(lang_list) do
      vim.lsp.enable(v)
    end
  end,
}
