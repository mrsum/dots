return {
  "gelguy/wilder.nvim",
  lazy = false,
  build = ":UpdateRemotePlugins",
  dependencies = {
    { "romgrk/fzy-lua-native", build = "make" },
  },
  config = function()
    local setup, wilder = pcall(require, "wilder")
    if not setup then
      return
    end

    wilder.setup({
      modes = {
        ":",
        "/",
        "?",
      },
    })

    wilder.set_option("pipeline", {
      wilder.branch(

        wilder.python_file_finder_pipeline({
          file_command = function(ctx, arg)
            if string.find(arg, ".") ~= nil then
              return { "fd", "-tf", "-H" }
            else
              return { "fd", "-tf" }
            end
          end,
          dir_command = { "fd", "-td" },
          filters = { "fuzzy_filter", "difflib_sorter" },
        }),

        wilder.substitute_pipeline({
          pipeline = wilder.python_search_pipeline({
            skip_cmdtype_check = 1,
            pattern = wilder.python_fuzzy_pattern({
              start_at_boundary = 0,
            }),
          }),
        }),

        wilder.cmdline_pipeline({
          fuzzy = 1,
          fuzzy_filter = wilder.lua_fzy_filter(),
          debounce = 10,
        }),

        wilder.vim_search_pipeline(),

        wilder.python_search_pipeline({
          pattern = wilder.python_fuzzy_pattern({
            start_at_boundary = 0,
          }),
          debounce = 10,
        })
      ),
    })

    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        highlighter = {
          wilder.pcre2_highlighter(),
          wilder.lua_fzy_highlighter(),
        },
        highlights = {
          border = "Normal",
          accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
        },
        border = "rounded",
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_devicons() },
        empty_message = wilder.popupmenu_empty_message_with_spinner(),
        ["/"] = wilder.wildmenu_renderer({
          highlighter = wilder.lua_fzy_highlighter(),
        }),
      }))
    )
  end,
}
