return {
  "rebelot/kanagawa.nvim",
  name = "_.mrsum.themes.kanagawa",
  priority = 1000,
  config = function()
    require('kanagawa').setup({
      compile = false,  -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = { italic = true, bold = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,    -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      theme = "wave",        -- Load "wave" theme when 'background' option is not set
    })
  end,
}
