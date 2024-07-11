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
      formatters_by_ft = {
        html = { { "prettierd" } },
        javascript = { { "prettierd" } },
        javascriptreact = { { "prettierd" } },
        markdown = { { "prettierd" } },
        typescript = { { "prettierd" } },
        typescriptreact = { { "prettierd" } },
        ["*"] = { "trim_whitespace" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        prettierd = {
          condition = function()
            return vim.loop.fs_realpath(".prettierrc.js") ~= nil
                or vim.loop.fs_realpath(".prettierrc.json") ~= nil
          end,
        },
      },
    })
  end,
}
