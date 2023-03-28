local setup, cursorline = pcall(require, "nvim-cursorliner")
if not setup then
	return
end

cursorline.setup({
	cursorline = {
		enable = true,
	},
	cursorword = {
		enable = true,
	},
})
