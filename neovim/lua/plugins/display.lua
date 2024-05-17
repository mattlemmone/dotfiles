return {
	{ import = "plugins.colors" },
	{
		"stevearc/dressing.nvim",
		opts = { input = {
			start_in_insert = false,
			title_pos = "center",
		} },
	},
	{
		-- highlight selected ranges from command line
		"winston0410/range-highlight.nvim",
		event = "CmdwinEnter",
	},
	{
		-- "automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching."
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
    tag = "v3.5.4",
		main = "ibl",
		config = function()
			require("ibl").setup({})
		end,
	},
	"norcalli/nvim-colorizer.lua", -- highlight color codes real-time
}
