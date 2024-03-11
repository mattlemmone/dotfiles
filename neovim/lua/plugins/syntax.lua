return {
	{
		"fatih/vim-go",
		keys = {},
		opts = {},
		config = function()
			local g = vim.g

			g.go_highlight_build_constraints = 1
			g.go_highlight_functions = 1
			g.go_highlight_interfaces = 1
			g.go_highlight_methods = 1
			g.go_highlight_operators = 1
			g.go_highlight_structs = 1
		end,
	},
	{
		-- D2 syntax support
		"terrastruct/d2-vim",
		event = "BufReadPre *.d2",
	},
	{
		-- syntax for kitty terminal config
		"fladson/vim-kitty",
		event = "BufReadPre kitty.conf",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = function()
					require("treesitter-context").setup({
						max_lines = 10,
					})
				end,
			},
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				modules = {},
				ensure_installed = {},
				ignore_install = {},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				matchup = { enable = true },
			})
		end,
	},
}
