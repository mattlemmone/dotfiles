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
				shell = { "shellharden" },
				-- run multiple formatters sequentially
				python = { "isort", { "blackd", "black" } },
				-- run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
			},
		})

		local autocmd = vim.api.nvim_create_autocmd
		local command = vim.api.nvim_create_user_command

		autocmd("BufWritePre", {
			pattern = { "*" },
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })
	end,
}
