local status, plugin = pcall(require, "neogit")
if not status then
  return
end

plugin.setup({
  signs = {
    hunk = { "", "" },
    section = { "", "" },
    item = { "", "" },
  },
  integrations = {
    diffview = true,
  },
})
