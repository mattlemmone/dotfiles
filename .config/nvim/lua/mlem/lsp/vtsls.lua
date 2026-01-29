local M = {}

M.setup = function()
	-- Register vtsls config from the nvim-vtsls plugin
	require("vtsls").lspconfig = nil -- Clear any previous config
	local vtsls_config = require("vtsls").lspconfig or {}

	vim.lsp.config("vtsls", vim.tbl_deep_extend("force", vtsls_config, {
		settings = {
			typescript = { preferences = { useAliasesForRenames = false } },
			javascript = { preferences = { useAliasesForRenames = false } },
		},
	}))

	vim.lsp.enable("vtsls")
end

return M
