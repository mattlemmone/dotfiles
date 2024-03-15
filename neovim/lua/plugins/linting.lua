return {
	"mfussenegger/nvim-lint",
	opts = {},
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim" },
		{
			"rshkarin/mason-nvim-lint",
			opts = {
				automatic_installation = true,
			},
		},
	},

	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "ruff", "mypy", "flake8" },
			protobuf = { "buf" },
			sh = { "shellcheck" },
			json = { "jsonlint" },
			jsonc = { "jsonlint" },
			yaml = { "yamllint" },
			-- markdown = { "markdownlint" },
		}

		local autocmd = vim.api.nvim_create_autocmd

		autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
