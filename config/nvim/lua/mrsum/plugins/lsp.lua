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
  "gopls"
}

-- local formatter_linter_list = {
--   "stylua",
--   "prettier",
--   "eslint_d",
-- }

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
    local lsp = require("lspconfig")
    local mason = require("mason")
    local lspsaga = require("lspsaga")
    local mason_lsp_config = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
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

    mason_lsp_config.setup_handlers({
      function(server_name)
        if server_name then
          lsp[server_name].setup({})
        end
      end,
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
      lsp[v].setup({
        capabilities = capabilities,
      })
    end
  end,
}
