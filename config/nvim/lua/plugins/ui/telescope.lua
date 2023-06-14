local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      case_mode = "smart_case",
      override_file_sorter = true,
      override_generic_sorter = true,
    },
  },
  defaults = {
    file_ignore_patterns = {
      "node_modules",
    },
    mappings = {
      i = {
        -- ["<CR>"] = actions.select_vertical,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
})

telescope.load_extension("fzf")
