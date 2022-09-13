local keymap = vim.keymap

-- Plugin Mappings
keymap.set("n", "<Leader>n", ":Neotree focus dir=%:p:h toggle<CR>|:silent vertical res 30<CR>", { silent = true })

-- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap.set("x", "ga", "<Plug>(EasyAlign)")

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap.set("n", "ga", "<Plug>(EasyAlign)")

-- Git
keymap.set("n", "gf", ":DiffviewFileHistory<CR>") -- show git history for current buffer
keymap.set("n", "gd", ":DiffviewOpen<CR>") -- show modified files

-- ESCAPEEE
keymap.set("i", "jk", "<ESC>")

-- Terminal Mode Mappings
keymap.set("t", "jk", "<C-\\><C-n>")

-- Normal Mode Mappings
keymap.set("n", "<Leader>O", "O<Esc>")
keymap.set("n", "<Leader>o", "o<Esc>")

-- disable highlight
keymap.set("n", "<Leader>hl", ":nohl<CR> ")

-- reload current lua file
keymap.set("n", "<Leader>l", ":luafile %<CR>")

-- reload vimrc
keymap.set("n", "<Leader>r", ":so ~/dotfiles/neovim/.vimrc<CR>")

keymap.set("n", "<Leader>d", ":Bdelete<CR>")

keymap.set("n", "<Leader>w", ":ArgWrap<CR>", { silent = true })

-- Copy filename to clipboard
keymap.set("n", "<Leader>yf", ':let @+ = expand("%")<CR>', { silent = true })

keymap.set("n", "<Leader>?", ":Cheatsheet<CR>")

-- Split Navigation
keymap.set("n", "<Leader>-", ":split<CR>")
keymap.set("n", "<Leader>|", ":vsplit<CR>")
