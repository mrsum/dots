local _M = {}
local null_ls = require("null-ls")

local _include_root_file = function(...)
  local files = { ... }
  return function(utils)
    return utils.root_has_file(files)
  end
end

local _exclude_root_file = function(...)
  local files = { ... }
  return function(utils)
    return not utils.root_has_file(files)
  end
end

local _formatting = null_ls.builtins.formatting
local _diagnostics = null_ls.builtins.diagnostics
local _code_actions = null_ls.builtins.code_actions

_M.setup = function(on_attach)
  null_ls.setup({
    save_after_format = true,
    border = "rounded",
    default_timeout = 5000,
    sources = {
      _diagnostics.actionlint,
      _diagnostics.alex,
      _diagnostics.checkmake,
      _diagnostics.hadolint,
      _diagnostics.shellcheck,
      _diagnostics.tidy,
      _diagnostics.write_good,

      _formatting.prettierd,
      _formatting.stylua,
      _formatting.shfmt.with({
        filetypes = { "sh", "bash", "zsh" },
      }),

      _code_actions.shellcheck,
    },
    on_attach = on_attach,
  })
end

return _M
