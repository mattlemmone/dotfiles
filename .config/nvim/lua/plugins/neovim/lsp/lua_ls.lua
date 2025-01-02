local M = {}

M.setup = function(on_attach, capabilities)
	local nvim_lsp = require("lspconfig")

	nvim_lsp.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
			},
		},
	})
end

return M
