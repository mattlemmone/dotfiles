return {
	{ import = "plugins.colors" },
	"folke/zen-mode.nvim",
	{
		"stevearc/dressing.nvim",
		opts = {},
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
		-- stylized buffer tabs
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "v3.*",
		config = function()
			-- require("bufferline").setup({
			-- 	highlights = {
			-- 		buffer_selected = { italic = false },
			-- 		diagnostic_selected = { italic = false },
			-- 		hint_selected = { italic = false },
			-- 		pick_selected = { italic = false },
			-- 		pick_visible = { italic = false },
			-- 		pick = { italic = false },
			-- 	},
			-- })
			local highlights = require("rose-pine.plugins.bufferline")
			require("bufferline").setup({ highlights = highlights })
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "ibl",
		config = function()
			require("ibl").setup({})
		end,
	},
	"norcalli/nvim-colorizer.lua", -- highlight color codes real-time
}
