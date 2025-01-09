return {
	{ import = "plugins.colors" },
	{
		"junegunn/goyo.vim",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"stevearc/dressing.nvim",
		opts = {
			input = {
				start_in_insert = false,
				title_pos = "center",
			},
		},
	},
	{
		-- "automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching."
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"echasnovski/mini.indentscope",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
	}, -- highlight color codes real-time
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			-- local theme_colors = require("catppuccin.palettes").get_palette("mocha")

			require("tiny-devicons-auto-colors").setup({
				-- Optional
				colors = theme_colors,
			})
		end,
	},
}
