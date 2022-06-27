local status_ok, plugin = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

plugin.setup({
  ensure_installed = { "tsx", "typescript", "lua", "json", "yaml" },
  context_commentstring = {
    enable = true
  },
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
    },
  },
})
