local autocmd = vim.api.nvim_create_autocmd

-- Highlight after yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 600 })
	end,
})

-- Disable relative numbers
autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

-- Enable relative numbers
autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- Enable spellchecking
autocmd("FileType", {
	pattern = { "*.md", "gitcommit", "text", "tex" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

-- Set syntax for conf files
autocmd({ "BufReadPost", "BufNewFile", "BufRead" }, {
	pattern = { "*.conf" },
	callback = function()
		vim.cmd([[set filetype=ini]])
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = misc_augroup,
	pattern = "*",
	command = 'silent! normal! g`"zv',
})
