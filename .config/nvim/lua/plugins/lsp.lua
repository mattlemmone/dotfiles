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
				},
				-- for catpuccin
				notification = {
					window = {
						winblend = 0,
					},
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
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
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		config = function()
			require("tiny-code-action").setup()
		end,
	},
	{
		"Wansmer/symbol-usage.nvim",
		event = "LspAttach",
		config = function()
			require("symbol-usage").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
}
