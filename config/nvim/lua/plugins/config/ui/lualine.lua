-- check and load
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- setup
lualine.setup ({
  options = {
    theme = "tokyonight"
  }
})
