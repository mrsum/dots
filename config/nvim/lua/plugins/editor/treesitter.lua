local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

local ts_parser_list = {
	"json",
	"javascript",
	"typescript",
	"tsx",
	"yaml",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"graphql",
	"bash",
	"lua",
	"vim",
	"dockerfile",
	"gitignore",
	"git_rebase",
	"gitattributes",
	"gitcommit",
}

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = ts_parser_list,
	auto_install = true,
})
