local setup, neogit = pcall(require, "neogit")
if not setup then
	return
end

neogit.setup({
	signs = {
		section = { "", "" },
		item = { "", "" },
		hunk = { "", "" },
	},
	integrations = { diffview = true },
})
