local keymap = vim.keymap
local plugin_registry = "~/dotfiles/neovim/after/lua/lmnlym/plugins/registry.lua"

-- Plugin Mappings
keymap.set("n", "<Leader>m", "<CMD>MundoToggle<CR>", { silent = true })
-- keymap.set("n", "s", "<CMD>Pounce<CR>", { silent = true })
-- keymap.set("n", "S", "<CMD>PounceRepeat<CR>", { silent = true })

-- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap.set("x", "ga", "<Plug>(EasyAlign)")

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap.set("n", "ga", "<Plug>(EasyAlign)")

-- Git
keymap.set("n", "<Leader>gf", "<CMD>DiffviewFileHistory<CR>") -- show git history for current buffer
keymap.set("n", "<Leader>gd", "<CMD>DiffviewOpen<CR>") -- show modified files

-- ESCAPEEE
keymap.set("i", "jk", "<ESC>")

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

keymap.set("n", "<Leader>d", "<CMD>BufDel<CR>")

keymap.set("n", "<Leader>w", "<CMD>ArgWrap<CR>", { silent = true })

-- Copy filename to clipboard
keymap.set("n", "<Leader>yf", "<CMD>let @+ = expand('%')<CR>", { silent = true })

keymap.set("n", "<Leader>?", "<CMD>Cheatsheet<CR>")

-- Split Navigation
keymap.set("n", "<Leader>-", "<CMD>split<CR>")
keymap.set("n", "<Leader>|", "<CMD>vsplit<CR>")

-- ReplaceWithRegister
keymap.set("n", "<Leader>p", "<Plug>ReplaceWithRegisterOperator")
keymap.set("n", "<Leader>pp", "<Plug>ReplaceWithRegisterLine")
keymap.set("x", "<Leader>p", "<Plug>ReplaceWithRegisterVisual")

-- Open urls
keymap.set("n", "<Leader>u", "<CMD>UrlView<CR>")

-- Swap
keymap.set("n", "<Leader>i", "<CMD>ISwap<CR>")

-- Sessions
keymap.set("n", "<Leader>ls", "<CMD>lua require('persistence').load()<CR>")
keymap.set("n", "<Leader>ll", "<CMD>lua require('persistence').load({last= true})<CR>")

-- Plugin Manager
---- Install plugins
keymap.set("n", "<Leader>;i", "", {
  callback = function()
    vim.cmd("luafile " .. plugin_registry)
    vim.cmd("PlugInstall")
  end,
})

---- Update plugins
keymap.set("n", "<Leader>;u", "", {
  callback = function()
    vim.cmd("luafile " .. plugin_registry)
    vim.cmd("PlugUpdate")
  end,
})

---- Remove plugins
keymap.set("n", "<Leader>;r", "", {
  callback = function()
    vim.cmd("luafile " .. plugin_registry)
    vim.cmd("PlugClean")
  end,
})
