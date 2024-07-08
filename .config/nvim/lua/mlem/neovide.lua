vim.o.guifont = "JetBrains Mono:h16" -- text below applies for VimScript
vim.g.neovide_show_border = false
vim.g.neovide_theme = "auto"
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_trail_size = 0.3

vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

-- Workaround for Neovide not focusing on startup: https://github.com/neovide/neovide/issues/2330
vim.defer_fn(function()
	vim.cmd("NeovideFocus")
end, 300)
