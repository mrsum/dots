local status_ok, icons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

-- custom folder icon
icons.setup({
  override = {
    lir_folder_icon = {
      icon = "",
      color = "#7ebae4",
      name = "LirFolderNode",
    },
  },
})
