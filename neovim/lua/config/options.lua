local set = vim.opt
local g = vim.g
local expand = vim.fn.expand

set.laststatus = 2 -- always show it

-- new tab split direction
set.splitbelow = true
set.splitright = true

-- Display
vim.o.cpoptions = vim.o.cpoptions .. "y"
set.cursorline = true -- highlight current line
set.encoding = "utf-8"
set.expandtab = true  -- convert <TAB> key-presses to spaces
set.list = true       -- show special chars
-- special character overrides
set.listchars = {
  tab = "› ",
  trail = "·",
  extends = "#",
  nbsp = ".",
}
set.number = true -- show line numbers
set.ruler = true  -- show cursor position
set.showcmd = true
set.textwidth = 79
set.tw = 0             -- text width 0 wont allow linebreak
set.signcolumn = "yes" -- prevent flickering on save

-- Indentation (Universal default)
set.shiftwidth = 2
set.tabstop = 2

-- Search
set.showmatch = true
set.ignorecase = true
set.smartcase = true -- switch to case-sensitive searches when uppercase chars found
set.incsearch = true -- partial matches
set.hlsearch = true  -- highlight matches

-- Commands
set.wildmenu = true -- visual autocomplete

-- Clipboard
set.clipboard = "unnamedplus"

-- we dont like dis
set.swapfile = false

vim.cmd([[
  highlight link GitSignsCurrentLineBlame Comment
  set foldmethod=expr
  set foldlevelstart=20
  set foldexpr=nvim_treesitter#foldexpr()
  set foldnestmax=3
]])

g.node_host_prog = expand("~/.asdf/installs/nodejs/18.9.0/.npm/bin/neovim-node-host")
g.python3_host_prog = expand("~/.asdf/shims/python3")
g.python_host_prog = expand("~/.asdf/shims/python2")
g.ruby_host_prog = expand("~/.asdf/shims/neovim-ruby-host")
