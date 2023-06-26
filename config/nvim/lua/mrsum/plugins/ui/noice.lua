return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["cmp.entry.get_documentation"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      },
    },
    cmdline = {
      enabled = true,
      view = "cmdline",
      format = {
        lua = false,
        help = false,
        filter = false,
        input = {},
        cmdline = {
          pattern = "^:",
          icon = "_",
          lang = "vim",
        },
        search_down = {
          kind = "search",
          pattern = "^/",
          icon = "  ",
          lang = "regex",
        },
        search_up = {
          kind = "search",
          pattern = "^%?",
          icon = "  ",
          lang = "regex",
        },
      },
    },
    presets = {
      lsp_doc_border = true,
    },
    notify = {
      enabled = false,
    },
  },
  config = function()
    require("notify").setup({})
  end,
}
