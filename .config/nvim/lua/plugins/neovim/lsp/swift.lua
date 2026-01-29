local M = {}

M.setup = function()
	vim.lsp.config("sourcekit", {
		capabilities = {
			workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = true,
				},
			},
		},
	})

	vim.lsp.enable("sourcekit")
end

return M
