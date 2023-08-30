return {
	dir = "mrsum/core/autocmds",
	name = "_.mrsum.core.autocmds",
	config = function()
		local _autocmd = vim.api.nvim_create_autocmd

		_autocmd("TextYankPost", {
			pattern = "*",
			callback = function()
				vim.highlight.on_yank()
			end,
			group = vim.api.nvim_create_augroup("YankHighlight", {
				clear = true,
			}),
		})
	end,
}
