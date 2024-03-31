return {
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
		require("config.lsp.init").setup()
	end,
}
