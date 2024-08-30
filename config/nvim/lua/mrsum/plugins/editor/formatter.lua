return {
  "stevearc/conform.nvim",
  name = "_.mrsum.plugins.editor.formatter",
  config = function()
    local setup, plugin = pcall(require, "conform")
    if not setup then
      return
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        plugin.format({ bufnr = args.buf })
      end,
    })

    plugin.setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        prettier = {
          condition = function()
            return vim.loop.fs_realpath(".prettierrc") ~= nil
              or vim.loop.fs_realpath(".prettierrc.json") ~= nil
              or vim.loop.fs_realpath(".prettierrc.config.js") ~= nil
              or vim.loop.fs_realpath(".prettierrc.json") ~= nil
          end,
        },
      },
    })

    plugin.formatters_by_ft.lua = { "stylua" }
    plugin.formatters_by_ft.html = { "prettier" }
    plugin.formatters_by_ft.css = { "prettier" }
    plugin.formatters_by_ft.json = { "prettier" }
    plugin.formatters_by_ft.jsonc = { "prettier" }
    plugin.formatters_by_ft.javascript = { "prettier" }
    plugin.formatters_by_ft.typescript = { "prettier" }
    plugin.formatters_by_ft.typescriptreact = { "prettier" }
  end,
}
