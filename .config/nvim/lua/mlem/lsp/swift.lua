local M = {}

M.setup = function(on_attach)
	local nvim_lsp = require("lspconfig")

	nvim_lsp.sourcekit.setup({
		capabilities = {
			workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = true,
				},
			},
		},
	})
end

return M
