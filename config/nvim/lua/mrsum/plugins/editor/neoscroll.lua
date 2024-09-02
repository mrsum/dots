return {
  "karb94/neoscroll.nvim",
  name = "_.mrsum.plugins.editor.neoscroll",
  config = function()
    local setup, neoscroll = pcall(require, "neoscroll")
    if not setup then
      return
    end

    -- up and down for Ctrl+
    local keymap = {
      ["<C-Up>"] = function()
        neoscroll.ctrl_u({ duration = 150 })
      end,
      ["<C-Down>"] = function()
        neoscroll.ctrl_d({ duration = 150 })
      end,
    }
    local modes = { "n", "v", "x" }

    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end

    neoscroll.setup({
      easing = "quadratic",
    })
  end,
}
