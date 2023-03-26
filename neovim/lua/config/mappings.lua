local keymap = vim.keymap

-- ESCAPEEE
keymap.set("i", "jk", "<ESC>")

-- Split Navigation
keymap.set("n", "<Leader>-", "<CMD>split<CR>")
keymap.set("n", "<Leader>|", "<CMD>vsplit<CR>")

-- Terminal Mode Mappings
keymap.set("t", "jk", "<C-\\><C-n>")

-- Normal Mode Mappings
keymap.set("n", "<Leader>O", "O<Esc>")
keymap.set("n", "<Leader>o", "o<Esc>")

-- disable highlight
keymap.set("n", "<Leader>hl", "<CMD>nohl<CR> ")

-- Copy filename to clipboard
keymap.set("n", "<Leader>yf", "<CMD>let @+ = expand('%')<CR>", { silent = true })
