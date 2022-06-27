local opts = {
  noremap = true,
  silent = true
}

local insert_opts = {
  noremap = true,
  silent = true,
  expr = true
}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- mode.normal --
-- Select all
map("n", "<leader>a", "ggVG")

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- go through virtual lines instead of normal ones
map("n", "j", "gj")
map("n", "k", "gk")

-- split
map('n', "<C-]>", ':vs<CR>', opts)
map('n', "<C-[>", ':sp<CR>', opts)

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', {
  noremap = true
})

-- telescope
map('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", {
  noremap = true
})
map('n', '<C-F>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", {
  noremap = true
})
map('n', '<C-B>', "<cmd>lua require('telescope.builtin').buffers()<CR>", {
  noremap = true
})
map('n', '<C-G>', "<cmd>lua require('telescope.builtin').git_files()<CR>", {
  noremap = true
})

-- CoC
map("n", "<S-D>",       ":CocList diagnostics<CR>", {})
map("n", "<leader>l",   ":CocCommand eslint.executeAutofix<CR>", {})
map("n", "<leader>rn",  "<Plug>(coc-rename)", {})
map("n", "<leader>.",   "<Plug>(coc-codeaction)", {})
map("n", "cd",          "<Plug>(coc-definition)", {})
map("n", "ct",          "<Plug>(coc-type-definition)", {})
map("n", "ci",          "<Plug>(coc-implementation)", {})
map("n", "cr",          "<Plug>(coc-references)", {})
map("n", "H",           ":call CocActionAsync('doHover')<CR>", {})

map("n", "<C-c>",       "<Plug>(coc-cursors-position)", {})
map("n", "<C-d>",       "<Plug>(coc-cursors-word)", {})
map("i", "<C-d>",       "<Plug>(coc-cursors-word)", {})

-- Ctrl+s to save
map("n", "<C-S>", ":w<CR>", opts)
map("n", "<C-Q>", ":q<CR>", opts)

-- Navigate tabs
map("n", "<S-Left>",  ":tabprevious<CR>", opts)
map("n", "<S-Right>", ":tabnext<CR>", opts)

-- Indent text left - right
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
map("x", "J",     ":move '>+1<CR>gv-gv", opts)
map("x", "K",     ":move '<-2<CR>gv-gv", opts)
map("x", "<A-Up>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-Down>", ":move '<-2<CR>gv-gv", opts)

-- mode.insert --
map("i", "<CR>",      "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", insert_opts)
map("i", "<TAB>",     "pumvisible() ? '<C-n>' : '<TAB>'", insert_opts)
map("i", "<S-TAB>",   "pumvisible() ? '<C-p>' : '<C-h>'", insert_opts)
map("i", "<C-Space>", "coc#refresh()", insert_opts)

-- mode.terminal --
-- terminal maps
map("t", "<leader><Esc>", "<C-\\><C-n>")
map('t', '<Esc>', '<C-\\><C-n>', {
  noremap = true,
  silent  = true
})
