local keymap = vim.keymap
require("persistence").setup()

keymap.set("n", "<Leader>ls", "<CMD>lua require('persistence').load()<CR>")
keymap.set("n", "<Leader>ll", "<CMD>lua require('persistence').load({last= true})<CR>")
