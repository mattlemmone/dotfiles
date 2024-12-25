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
		local selene = require("lint").linters.selene
		selene.args = {
			"--config",
			"~/dotfiles/.config/nvim/selene.toml",
			"--display-style",
			"--json",
			"-",
		}

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

		vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
