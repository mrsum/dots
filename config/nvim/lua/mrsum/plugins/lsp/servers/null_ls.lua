return {
  setup = function(on_attach, capabilities)
    local status, null_ls = pcall(require, "null-ls")
    if not status then
      return
    end

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      border = "rounded",
      sources = {
        -- formattings section
        formatting.stylua,
        formatting.prettier,
        formatting.shfmt.with({
          filetypes = { "sh", "bash", "zsh" },
        }),

        -- diagnostic section
        diagnostics.actionlint,
        diagnostics.alex,
        diagnostics.checkmake,
        diagnostics.hadolint,
        diagnostics.shellcheck,
        diagnostics.tidy,
        diagnostics.write_good,
        diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file(".eslintrc.json")
          end,
        }),
        code_actions.shellcheck,
      },

      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    })
  end,
}