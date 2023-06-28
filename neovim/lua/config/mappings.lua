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
keymap.set("n", "<cr>", "ciw")

-- disable highlight
keymap.set("n", "<Leader>hl", "<CMD>nohl<CR> ")

-- Copy filename to clipboard
keymap.set("n", "<Leader>yf", "<CMD>let @+ = expand('%')<CR>", { silent = true })

-- undo and re-do all within the same letter
keymap.set("n", "U", "<C-r>")

-- Visual Mode
keymap.set("v", "y", "ygv<esc>") -- preserve yank location
