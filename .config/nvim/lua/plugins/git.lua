return {

	{ "akinsho/git-conflict.nvim", version = "*", config = true, event = "VeryLazy" },
	{ "ruanyl/vim-gh-line", event = "VeryLazy" }, -- open in gh
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	}, -- buffer icons and other things
}
