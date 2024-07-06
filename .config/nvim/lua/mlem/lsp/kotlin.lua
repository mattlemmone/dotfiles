local M = {}

M.setup = function(on_attach, capabilities)
	local nvim_lsp = require("lspconfig")

	nvim_lsp.kotlin_language_server.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			compiler = { jvm = { target = "1.8.10" } },
		},
	})
end

return M
