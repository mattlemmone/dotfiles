return {
	{
		"ojroques/nvim-bufdel",
		keys = {
			{ "<Leader>d", "<CMD>BufDel<CR>", mode = "n" },
		},
	},
	{
		-- stylized buffer tabs
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
}
