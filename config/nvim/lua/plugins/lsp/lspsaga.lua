local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	symbol_in_winbar = {
		enable = false,
	},
	move_in_saga = {
		prev = "<C-k>",
		next = "<C-j>",
	},
	finder_action_keys = {
		open = "<CR>",
	},
	outline = {
		win_position = "right",
		win_with = "",
		win_width = 70,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = "<CR>",
			expand_collapse = "u",
			quit = "q",
		},
	},

	finder = {
		max_height = 0.5,
		keys = {
			jump_to = "p",
			edit = { "o" },
			vsplit = "<CR>",
			split = "i",
			tabe = "<TAB>",
			quit = { "q", "<ESC>" },
			close_in_preview = "<ESC>",
		},
	},

	definition_action_keys = {
		edit = "<CR>",
	},
})
