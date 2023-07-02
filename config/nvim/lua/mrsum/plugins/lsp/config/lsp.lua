return {
  setup = function(lang_list)
    local lspconfig_status, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_status then
      return
    end

    local lspconfig_ui_status, lspconfig_ui = pcall(require, "lspconfig.ui.windows")
    if not lspconfig_ui_status then
      return
    end

    local typescript_setup, typescript = pcall(require, "typescript")
    if not typescript_setup then
      return
    end

    local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not cmp_nvim_lsp_status then
      return
    end

    local fn = vim.fn
    local lsp = vim.lsp
    local keymap = vim.keymap
    local diagnostic = vim.diagnostic

    fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "" })
    fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "" })
    fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "" })
    fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })

    diagnostic.config({
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      virtual_text = {
        source = false,
        prefix = vim.g.emoji and " 🐤" or " 󱙝",
        format = function(diag)
          return string.format("%s%s ", diag.source and string.format("[%s]: ", diag.source) or "", diag.message)
        end,
      },
      float = {
        source = false,
        border = "rounded",
        format = function(diag)
          return string.format("%s%s ", diag.source and string.format("[%s]: ", diag.source) or "", diag.message)
        end,
      },
    })

    lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
      border = "rounded",
    })

    lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
      border = "rounded",
    })

    lspconfig_ui.default_options = {
      border = "rounded",
    }

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      keymap.set("n", ".", "<cmd>Lspsaga lsp_finder<CR>", opts)
      keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
      keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      keymap.set("n", "<S-o>", "<cmd>Lspsaga outline<CR>", opts)

      keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
      keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
      keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
      keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

      keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
      keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
      keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
      keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

      if client.name == "tsserver" then
        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
        keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>")
        keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")
      end
    end

    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local signs = {
      Error = " ",
      Warn = " ",
      Hint = "ﴞ ",
      Info = " ",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    for _, server in ipairs(lang_list) do
      require("mrsum.plugins.lsp.servers." .. server).setup(on_attach, capabilities)
    end
  end,
}
