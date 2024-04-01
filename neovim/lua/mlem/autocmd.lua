local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	desc = "Highlight after yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 600 })
	end,
})

autocmd("InsertEnter", {
	desc = "Disable relative numbers",
	callback = function()
		vim.opt.relativenumber = false
	end,
})

autocmd("InsertLeave", {
	desc = "Enable relative numbers",
	callback = function()
		vim.opt.relativenumber = true
	end,
})

autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Enable spellchecking",
	pattern = { "*.txt", "*.md", "gitcommit" },
	command = "setlocal spell",
})

-- autocmd({ "BufRead", "BufNewFile", "BufLeave" }, {
-- 	desc = "Enable distraction free mode",
-- 	pattern = { "*.md" },
-- 	command = "ZenMode",
-- })

autocmd({ "BufReadPost", "BufNewFile", "BufRead" }, {
	desc = "Set syntax for conf files",
	pattern = { "*.conf" },
	callback = function()
		vim.cmd([[set filetype=ini]])
	end,
})

autocmd({ "BufReadPost", "BufNewFile", "BufRead" }, {
	desc = "Set syntax for apple-app-site-association files",
	pattern = { "*apple-app-site-association" },
	callback = function()
		vim.cmd([[set filetype=json]])
	end,
})

autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = misc_augroup,
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

autocmd("BufWritePost", {
	pattern = { ".yabairc" },
	command = "!yabai --restart-service",
})

autocmd("BufWritePost", {
	pattern = { ".skhdrc" },
	command = "!brew services restart skhd",
})
