local setup, wk = pcall(require, "which-key")
if not setup then
	return
end

local setup_sj, sj = pcall(require, "sj")
if not setup_sj then
	return
end

local normal_mode = {
	mode = { "n" },

	-- jump mode
	["s"] = { sj.run, "Start search in current file" },
	["qq"] = { "<cmd>:q!<cr>", "Exit without savings" },
	["<C-,>"] = { sj.prev_match, "Prev match" },
	["<C-.>"] = { sj.next_matach, "Next match" },
	["R"] = { sj.redo, "Redo match" },

	-- global keys
	["<CR>"] = { "<cmd>noh<cr><cr>", "Clear highlights" },
	["<C-s>"] = { "<cmd>:w<cr>", "Save file" },
	["<C-q>"] = { "<cmd>:q!<cr>", "Quit" },
	["<C-a>"] = { "ggVG", "Select all" },
	["<C-e>"] = { "<cmd>NvimTreeToggle<cr>", "Toggle tree" },

	-- telescope
	["<S-T>"] = { "<cmd>Telescope help_tags<cr>", "Find tags" },
	["<S-P>"] = { "<cmd>Telescope find_files<cr>", "Pick file" },
	["<S-F>"] = { "<cmd>Telescope live_grep<cr>", "Grep string" },
	["<S-S>"] = { "<cmd>Telescope git_status<cr>", "Git status" },
	["<S-B>"] = { "<cmd>Telescope git_branches<cr>", "Git branches" },
	["<S-C>"] = { "<cmd>Telescope git_commits<cr>", "Git commits" },

	-- troubles
	["<S-L>"] = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references" },
	["<S-D>"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "LSP document diagnostics" },
	["<S-W>"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "LSP workspace diagnostics" },
	["<S-Q>"] = { "<cmd>TroubleToggle quickfix<cr>", "LSP quickfix" },

	-- spits
	["<S-V>"] = { "<cmd>vs<cr>", "Vertical split" },
	["<S-H>"] = { "<cmd>sp<cr>", "Horizontal split" },

	-- split.navigation
	["<S-Up>"] = { "<C-w>k", "Go to upper split" },
	["<S-Down>"] = { "<C-w>j", "Go to bottom split" },
	["<S-Right>"] = { "<C-w>l", "Go to right split " },
	["<S-Left>"] = { "<C-w>h", "Go to left split" },

	-- tabs
	["<C-o>"] = { "<cmd>$tabnew<cr>", "Open tab" },
	["<C-w>"] = { "<cmd>tabclose<cr>", "Close tab" },
	["<Tab>"] = { "<cmd>tabn<cr>", "Next tab" },
	["<S-Tab>"] = { "<cmd>tabp<cr>", "Prev tab" },

	-- plugins hotkeys
	["<C-g>"] = { "<cmd>Neogit<cr>", "Open NeoGit" },
	["<C-d>"] = { "<cmd>DiffviewOpen<cr>", "Open Diffview" },
}

local insert_mode = {
	mode = { "i" },

	["<C-s>"] = { "<esc> :w<cr>", "[S]ave file" },
}

local visual_mode = {
	mode = { "v" },

	["<"] = { "<gv", "Move left" },
	[">"] = { ">gv", "Move right" },
}

wk.setup({})

wk.register(normal_mode)
wk.register(insert_mode)
wk.register(visual_mode)
