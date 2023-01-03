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

-- reload current lua file
keymap.set("n", "<Leader>l", "", {
  callback = function()
    require("notify")(vim.fn.expand("%"), "", { title = "Sourcing luafile" })
    vim.cmd("luafile %")
  end,
})

-- Copy filename to clipboard
keymap.set("n", "<Leader>yf", "<CMD>let @+ = expand('%')<CR>", { silent = true })

-- Plugin Mappings
keymap.set("n", "<Leader>m", "<CMD>MundoToggle<CR>", { silent = true })

keymap.set("n", "<Leader>d", "<CMD>BufDel<CR>")
keymap.set("n", "<Leader>w", "<CMD>ArgWrap<CR>", { silent = true })

-- ReplaceWithRegister
keymap.set("n", "<Leader>p", "<Plug>ReplaceWithRegisterOperator")
keymap.set("n", "<Leader>pp", "<Plug>ReplaceWithRegisterLine")
keymap.set("x", "<Leader>p", "<Plug>ReplaceWithRegisterVisual")

-- Open urls
keymap.set("n", "<Leader>u", "<CMD>UrlView<CR>")

-- Swap
keymap.set("n", "<Leader>i", "<CMD>ISwap<CR>")

-- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap.set("x", "ga", "<Plug>(EasyAlign)")

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap.set("n", "ga", "<Plug>(EasyAlign)")
