return {
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		tag = "v1.0.0",
		config = function()
			require("fidget").setup({
        progress = {
          display = {
            progress_icon = { pattern = "dots", period = 1 },
          },
        }
			})
		end,
	},
	{
		"neovim/nvim-lspconfig", -- easier lsp mgmt
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{
				"yioneko/nvim-vtsls",
				ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
				event = { "BufReadPre", "BufNewFile" },
			},
		},
		config = function()
			require("mlem.lsp.init")
		end,
	},
}
