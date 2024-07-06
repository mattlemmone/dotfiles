local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig.configs").vtsls = require("vtsls").lspconfig

	-- If the lsp setup is taken over by other plugin, it is the same to call the counterpart setup function
	require("lspconfig").vtsls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
