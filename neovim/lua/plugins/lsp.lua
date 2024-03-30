return {
	{ import = "plugins.lsp" },
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		tag = "legacy",
		config = function()
			require("fidget").setup({ text = { spinner = "dots" } })
		end,
	},
	{ "folke/lsp-colors.nvim", event = { "BufReadPre", "BufNewFile" } }, -- backfill missing lsp highlight colors
	{
		"yioneko/nvim-vtsls",
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		event = { "BufReadPre", "BufNewFile" },
	},
}
