local keymap = vim.keymap

vim.g.mapleader = " "

-- ESCAPEEE
keymap.set("i", "jk", "<ESC>")
keymap.set("t", "jk", "<C-\\><C-n>")

-- Split Navigation
keymap.set("n", "<Leader>-", "<CMD>split<CR>", { desc = "Split" })
keymap.set("n", "<Leader>|", "<CMD>vsplit<CR>", { desc = "Vsplit" })

-- Window Mvmt
keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>", { silent = false, remap = true, desc = "Move Window Left" })
keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>", { silent = false, remap = true, desc = "Move Window Down" })
keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>", { silent = false, remap = true, desc = "Move Window Up" })
keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>", { silent = false, remap = true, desc = "Move Window Right" })

keymap.set("n", "<Leader>O", "O<Esc>", { desc = "Open Above" })
keymap.set("n", "<Leader>o", "o<Esc>", { desc = "Open Below" })

keymap.set("n", "<Leader>hl", "<CMD>nohl<CR> ", { desc = "Disable Highlight" })

keymap.set("n", "<Leader>yf", "<CMD>let @+ = expand('%')<CR>", { silent = true, desc = "Copy Filename" })

-- undo and re-do all within the same letter
keymap.set("n", "U", "<CMD>redo<CR>", { desc = "Undo" })

-- ... so unbind ctrl+r, because it's a bad habit
keymap.set("n", "<C-r>", "<Nop>")

-- Visual Mode
keymap.set("v", "y", "ygv<esc>", { desc = "Preserve Yank Location" })
