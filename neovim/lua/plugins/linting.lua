return {
	"mfussenegger/nvim-lint",
	opts = {},
	event = { "BufWritePost", "BufReadPost", "InsertLeave" },
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
			javascriptreact = { "eslint_d" },
			json = { "jsonlint" },
			jsonc = { "jsonlint" },
			lua = { "selene" },
			protobuf = { "buf_lint" },
			python = { "ruff", "mypy", "flake8" },
			sh = { "shellcheck" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			yaml = { "yamllint" },
		}

		local autocmd = vim.api.nvim_create_autocmd

		autocmd({ "BufReadPre", "BufWritePost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
