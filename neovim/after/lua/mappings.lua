local keymap = vim.keymap

-- Set this before any Leader mappings
vim.g.mapleader = " "

-- Plugin Mappings
keymap.set("n", "<Leader>n", ":Neotree focus dir=%:p:h toggle<CR>|:silent vertical res 30<CR>", { silent = true })
-- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap.set("x", "ga", "<Plug>(EasyAlign)")

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap.set("n", "ga", "<Plug>(EasyAlign)")

-- Insert Mode Mappings
keymap.set("i", "jk", "<ESC>")

-- Terminal Mode Mappings
keymap.set("t", "jk", "<C-\\><C-n>")

-- Normal Mode Mappings
keymap.set("n", "<Leader>O", "O<Esc>")
keymap.set("n", "<Leader>o", "o<Esc>")

-- list open buffers
keymap.set("n", "<Leader>b", ":Buffers<CR>")

-- reload current lua file
keymap.set("n", "<Leader>l", ":luafile %<CR>")

-- command history
keymap.set("n", "<Leader>ch", ":History:<CR>")

-- file search
keymap.set("n", "<Leader>f", ":Files<CR>")
keymap.set("n", "<Leader>g", ":Commits<CR>")

-- file history
keymap.set("n", "<Leader>hh", ":History<CR>")

-- disable highlight
keymap.set("n", "<Leader>hl", ":nohl<CR> ")
keymap.set("n", "<Leader>r", ":so ~/dotfiles/neovim/.vimrc<CR>")
keymap.set("n", "<Leader>r", ":so ~/dotfiles/neovim/.vimrc<CR>")
keymap.set("n", "<Leader>s", ":Rg<CR>")

-- search for word under cursor in project
keymap.set("n", "<Leader>*", ":Rg <C-R><C-W><CR> ")
keymap.set("n", "<Leader>d", ":Bdelete<CR>")
keymap.set("n", "<Leader>w", ":ArgWrap<CR>", { silent = true })

-- Copy to clipboard
keymap.set("n", "<Leader>y", '"*yy')
keymap.set("v", "<Leader>y", '"*y')

-- Paste from clipboard
keymap.set("n", "<Leader>p", '"*p')

-- Copy filename to clipboard
keymap.set("n", "<Leader>yf", ':let @+ = expand("%")<CR>', { silent = true })

--" Rename instances
keymap.set("n", "<Leader>?", ":Cheatsheet<CR>")

--" Goto
keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Split Navigation
keymap.set("n", "<Leader>-", ":split<CR>")
keymap.set("n", "<Leader>|", ":vsplit<CR>")
