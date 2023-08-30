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
	"VonHeikemen/lsp-zero.nvim",
	name = "_.mrsum.plugins.lsp",
	branch = "v1.x",
	dependencies = {
		-- LSP
		"neovim/nvim-lspconfig", -- Required
		"williamboman/mason.nvim", -- Optional
		"williamboman/mason-lspconfig.nvim", -- Optional

		-- Custom
		"jose-elias-alvarez/null-ls.nvim", -- NULL LS
		"jay-babu/mason-null-ls.nvim", -- NULL LS + Mason Support
		"glepnir/lspsaga.nvim", -- Better LSP UI
		"folke/neodev.nvim", -- NeoDev LSP
		"windwp/nvim-autopairs", -- Autopairs
		"lukas-reineke/lsp-format.nvim", -- Autoformat on Save ASYNC
	},
	config = function()
		local lsp = require("lsp-zero").preset({})
		local null_ls = require("null-ls")
		local mason = require("mason")
		local mason_lsp_config = require("mason-lspconfig")
		local mason_null_ls = require("mason-null-ls")

		-- install lsp language from list
		mason.setup()
		mason_lsp_config.setup({
			ensure_installed = lang_list,
			automatic_installation = true,
		})

		-- attach on lsp
		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
		end)

		-- define formatter
		lsp.format_on_save({
			format_opts = {
				async = true,
				timeout_ms = 10000,
			},
			servers = {
				["null-ls"] = {
					"javascript",
					"typescript",
					"lua",
				},
			},
		})

		-- setup lsp
		lsp.setup()

		-- setup null-ls sources
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			},
		})

		-- setup bindigs from mason to null_ls
		mason_null_ls.setup({
			ensure_installed = linter_list,
			automatic_installation = true,
			handlers = {},
		})
	end,
}
