local status_ok, plugin = pcall(require, "wilder")
if not status_ok then
  return
end

plugin.setup({
  modes = { ':', '/', '?' },
})

plugin.set_option('pipeline', {
  plugin.branch(
    plugin.cmdline_pipeline(),
    plugin.search_pipeline()
  ),
})

plugin.set_option('renderer', plugin.popupmenu_renderer({
  left        = {' ', plugin.popupmenu_devicons()},
  right       = {' ', plugin.popupmenu_scrollbar()},
  highlighter = plugin.basic_highlighter(),
}))
