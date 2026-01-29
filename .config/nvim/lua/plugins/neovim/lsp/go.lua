local M = {}

M.setup = function()
	vim.lsp.config("gopls", {
		settings = {
			gopls = {
				experimentalPostfixCompletions = true,
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
			},
		},
		init_options = {
			usePlaceholders = true,
		},
	})

	vim.lsp.enable("gopls")
end

return M
