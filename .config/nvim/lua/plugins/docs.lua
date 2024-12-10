return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		version = "*",
		keys = {
			{
				"<Leader>/",
				"<CMD>lua require('neogen').generate()<CR>",
				mode = "n",
				noremap = true,
				silent = true,
				desc = "Generate Doc Strings",
			},
		},
	},
}
