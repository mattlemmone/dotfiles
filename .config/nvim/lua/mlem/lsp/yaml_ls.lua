local M = {}

M.setup = function()
	vim.lsp.config("yamlls", {
		settings = {
			yaml = {
				-- remove mapKeyOrder warning
				keyOrdering = false,
			},
		},
	})

	vim.lsp.enable("yamlls")
end

return M
