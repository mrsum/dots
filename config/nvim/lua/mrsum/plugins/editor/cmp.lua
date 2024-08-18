return {
  "hrsh7th/nvim-cmp",
  name = "_.mrsum.plugins.editor.cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "onsails/lspkind-nvim",
    "dmitmel/cmp-cmdline-history",
    "lukas-reineke/cmp-under-comparator",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      sources = {
        {
          name = "nvim_lsp",
          max_item_count = 15,
          entry_filter = function(entry, ctx)
            return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
          end,
        },
        { name = "nvim_lua" },
        { name = "ultisnips" },
        { name = "buffer", max_item_count = 15 },
        { name = "path" },
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      },
      experimental = { ghost_text = false },
      formatting = {
        -- format of popup menu
        format = function(entry, vim_item)
          vim_item.kind = string.format(" %s %s ", lspkind.presets.default[vim_item.kind], vim_item.kind)
          vim_item.menu = ({
            nvim_lsp = "[Lsp]",
            nvim_lua = "[Lua]",
            treesitter = "[TS]",
            path = "[Path]",
            buffer = "[Buffer]",
            zsh = "[Zsh]",
            spell = "[Spell]",
          })[entry.source.name]
          return vim_item
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Search",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Search",
        }),
      },
    })

    -- `:` cmdline setup. Maybe wilder is better..
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
  end,
}
