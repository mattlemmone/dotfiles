local M = {}

local keymap = vim.keymap

M.registerKeymaps = function(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- Code Actions
	keymap.set({ "n", "v" }, "<Leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", bufopts)

	-- Quick Fix
	keymap.set({ "n", "v" }, "<Leader>qf", "", {
		callback = function()
			vim.lsp.buf.code_action({
				apply = true,
				context = { only = { "quickfix", "f" } },
			})
		end,
	})

	-- Diagnostics
	keymap.set("n", "<Leader>e", "<CMD>Telescope diagnostics<CR>", bufopts)

	-- Docs
	keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", bufopts)

	-- Rename instances
	keymap.set("n", "<Leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", bufopts)

	--" Goto
	keymap.set("n", "gd", "<CMD>Telescope lsp_definitions<CR>", bufopts)
	keymap.set("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", bufopts)
	keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", bufopts)
	keymap.set("n", "gr", "<CMD>Telescope lsp_references initial_mode=normal<CR>", bufopts)
end
return M
