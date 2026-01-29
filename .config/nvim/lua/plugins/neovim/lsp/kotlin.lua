local M = {}

M.setup = function()
	vim.lsp.config("kotlin_language_server", {
		settings = {
			compiler = { jvm = { target = "1.8.10" } },
		},
	})

	vim.lsp.enable("kotlin_language_server")
end

return M
