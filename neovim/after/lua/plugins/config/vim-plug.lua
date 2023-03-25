local keymap = vim.keymap
local plugin_registry = "~/dotfiles/neovim/after/lua/plugins/registry.lua"

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
