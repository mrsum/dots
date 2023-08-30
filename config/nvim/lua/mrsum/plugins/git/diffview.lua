return {
	"sindrets/diffview.nvim",
	name = "_.mrsum.plugins.git.diffview",
	config = function()
		local status, plugin = pcall(require, "diffview")
		if not status then
			return
		end

		plugin.setup({})
	end,
}
