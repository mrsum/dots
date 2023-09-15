return {
  "mhartington/formatter.nvim",
  name = "_.mrsum.plugins.editor.formatter",
  config = function()
    local util = require("formatter.util")

    -- create autocmd for
    vim.cmd([[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost * FormatWriteLock
      augroup END
    ]])

    -- default fronted formatter
    -- get prettier from node_modules folder
    -- inside project
    local default_frontend_formatter = function()
      return {
        exe = vim.loop.cwd() .. "/node_modules/.bin/prettier",
        args = {
          vim.api.nvim_buf_get_name(0),
        },
        stdin = true,
      }
    end

    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
          function()
            if util.get_current_buffer_file_name() == "special.lua" then
              return nil
            end
            return {
              exe = "stylua",
              args = {
                "--search-parent-directories",
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
                "--",
                "-",
              },
              stdin = true,
            }
          end,
        },

        typescript = {
          default_frontend_formatter,
        },

        javascript = {
          default_frontend_formatter,
        },

        json = {
          default_frontend_formatter,
        },

        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })
  end,
}
