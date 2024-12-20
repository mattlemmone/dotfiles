return {
	"EdenEast/nightfox.nvim",
	enabled = true,
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd("colorscheme nightfox")
	end,
}
