local M = {}

M.setup = function(on_attach)
	local nvim_lsp = require("lspconfig")

	nvim_lsp.yamlls.setup({
		on_attach = on_attach,
		settings = {
			yaml = {
				-- remove mapKeyOrder warning
				keyOrdering = false,
			},
		},
	})
end

return M
