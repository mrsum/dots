local status, plugin = pcall(require, "null-ls")
if not status then
  return
end

local formatting = plugin.builtins.formatting
local diagnostics = plugin.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

plugin.setup({
  sources = {
    formatting.prettier,
    formatting.stylua,
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file(".eslintrc.json")
      end,
    }),
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
