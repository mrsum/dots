return {
  "gorbit99/codewindow.nvim",
  name = "_.mrsum.plugins.editor.minimap",
  config = function()
    local setup, plugin = pcall(require, "codewindow")
    if not setup then
      return
    end

    plugin.setup({
      window_border = "none",
      auto_enable = true,
      minimap_width = 10
    })
  end,
}
