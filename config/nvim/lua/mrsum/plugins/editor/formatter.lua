return {
  "stevearc/conform.nvim",
  name = "_.mrsum.plugins.editor.formatter",
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })

    local setup, plugin = pcall(require, "conform")
    if not setup then
      return
    end

    plugin.setup({
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "prettier" },

        python = { "isort", "black" },

        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
    })
  end,
}
