local M = {}

local keymap = vim.keymap

M.registerKeymaps = function(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- Code Actions
	keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, bufopts)

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
	keymap.set("n", "<Leader>e", function()
		require("telescope.builtin").diagnostics({ severity_limit = "WARN" })
	end, bufopts)

	keymap.set({ "i", "n" }, "<C-s>", vim.lsp.buf.signature_help, bufopts)

	-- Docs
	keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

	-- Rename instances
	keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)

	--" Goto
	keymap.set("n", "gd", "<CMD>Telescope lsp_definitions<CR>", bufopts)
	keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap.set("n", "gr", "<CMD>Telescope lsp_references initial_mode=normal<CR>", bufopts)
end

return M
