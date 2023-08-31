return {
  "echasnovski/mini.nvim",
  version = false,
  name = "_.mrsum.plugins.editor.mini",
  config = function()
    require("mini.map").setup()
    require("mini.pairs").setup()
    require("mini.comment").setup()
    require("mini.starter").setup()
    require("mini.surround").setup()
    require("mini.cursorword").setup()

    -- indents
    require("mini.indentscope").setup({
      draw = {
        delay = 0,
        priority = 2,
      },
      symbol = "|",
    })

    -- highlight patterns
    require("mini.hipatterns").setup({
      highlighters = {
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      },
    })
  end,
}
