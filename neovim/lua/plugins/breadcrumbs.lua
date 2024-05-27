return {
	"utilyre/barbecue.nvim",
	event = "VeryLazy",
	name = "barbecue",
	version = "*",
	dependencies = {
		{
			"smiteshp/nvim-navic",
			config = function()
				local navic = require("nvim-navic")
				navic.setup({
					lsp = {
						preference = { "pyright" },
					},
					-- catpuccin
					highlight = true,
				})
			end,
		},
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		-- configurations go here
	},
}
