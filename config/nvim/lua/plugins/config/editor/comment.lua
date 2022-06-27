-- check and load
local status_ok, plugin = pcall(require, "Comment")
if not status_ok then
  return
end

plugin.setup()
