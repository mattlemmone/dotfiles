return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufWritePre" },
	cmd = { "ConformInfo", "Format" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gopls" },
				rust = { "rustfmt" },
				markdown = { "markdownlint" },
				protobuf = { "buf" },
				sh = { "shfmt" },
				-- run multiple formatters sequentially
				python = { "isort", { "blackd", "black", stop_after_first = true } },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
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

		autocmd("BufWritePre", {
			desc = "Fix all lint and import issues",
			pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
			callback = function(args)
				vim.lsp.buf.code_action({ apply = true, context = { only = { "source.fixAll.eslint" } } })
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
			require("conform").format({
				async = true,
				lsp_fallback = "always",
				range = range,
			})
		end, { range = true })
	end,
}
