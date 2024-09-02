return {
  "karb94/neoscroll.nvim",
  name = "_.mrsum.plugins.editor.neoscroll",
  config = function()
    local setup, neoscroll = pcall(require, "neoscroll")
    if not setup then
      return
    end

    local keymap = {
      ["<C-Up>"] = function()
        neoscroll.ctrl_u({ duration = 250 })
      end,
      ["<C-Down>"] = function()
        neoscroll.ctrl_d({ duration = 250 })
      end,
      ["<C-b>"] = function()
        neoscroll.ctrl_b({ duration = 450 })
      end,
      ["<C-f>"] = function()
        neoscroll.ctrl_f({ duration = 450 })
      end,
      ["<C-y>"] = function()
        neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
      end,
      ["<C-e>"] = function()
        neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
      end,
      ["zt"] = function()
        neoscroll.zt({ half_win_duration = 250 })
      end,
      ["zz"] = function()
        neoscroll.zz({ half_win_duration = 250 })
      end,
      ["zb"] = function()
        neoscroll.zb({ half_win_duration = 250 })
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
