return {
  "nvim-treesitter/nvim-treesitter",
  name = "_.mrsum.plugins.editor.treesitter",
  config = function()
    local status, plugin = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    local list = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "graphql",
      "bash",
      "lua",
      "dockerfile",
      "gitignore",
      "git_rebase",
      "gitattributes",
      "gitcommit",
    }

    plugin.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = list,
      auto_install = true,
    })
  end,
}
