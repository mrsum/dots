return {
  "ibhagwan/fzf-lua",
  name = "_.mrsum.plugins.editor.fzf",
  config = function()
    local setup, plugin = pcall(require, "fzf-lua")
    if not setup then
      return
    end

    plugin.setup({
      file_ignore_patterns = {
        "node_modules",
        "dist",
        ".next",
        ".git",
        ".gitlab",
        "build",
        "target",
        "package-lock.json",
        "pnpm-lock.yaml",
        "yarn.lock",
      },
    })
  end,
}
