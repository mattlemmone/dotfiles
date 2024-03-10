return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gopls" },
				markdown = { "markdownlint" },
				protobuf = { "buf" },
				shell = { "shfmt" },
				-- run multiple formatters sequentially
				python = { "isort", { "blackd", "black" } },
				-- run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
			},
		})
	end,
}
