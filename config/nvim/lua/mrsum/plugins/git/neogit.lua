return {
  "TimUntersberger/neogit",
  lazy = false,
  config = function()
    local status, plugin = pcall(require, "neogit")
    if not status then
      return
    end

    plugin.setup({
      signs = {
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
      },
      integrations = {
        diffview = true,
      },
    })
  end,
}
