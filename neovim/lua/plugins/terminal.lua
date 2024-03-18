return {
	"stevearc/overseer.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("overseer").setup()
	end,
}
