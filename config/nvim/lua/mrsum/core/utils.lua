local utils = {}

function utils.is_os_dark_mode()
  local handle = assert(io.popen("/usr/bin/gsettings get org.gnome.desktop.interface color-scheme"))
  local result = assert(handle:read("*a"))

  handle:close()

  return string.match(result, "dark")
end

return utils
