return {
  "mrjones2014/smart-splits.nvim",
  name = "_.mrsum.plugins.editor.split",
  config = function()
    local setup, plugin = pcall(require, "smart-splits")
    if not setup then
      return
    end

    plugin.setup({
      resize_mode = {
        silent = true,
      },
    })
  end,
}
