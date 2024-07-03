return {
  "karb94/neoscroll.nvim",
  name = "_.mrsum.plugins.editor.neoscroll",
  config = function()
    local setup, neoscroll = pcall(require, "neoscroll")
    if not setup then
      return
    end

    local setup_config, config = pcall(require, "neoscroll.config")
    if not setup_config then
      return
    end

    local t = {}

    t["<C-Up>"] = { "scroll", { "-vim.wo.scroll", "true", "50" } }
    t["<C-Down>"] = { "scroll", { "vim.wo.scroll", "true", "50" } }

    neoscroll.setup()
    config.set_mappings(t)
  end,
}
