local set = vim.opt
local g = vim.g
local expand = vim.fn.expand

set.laststatus = 2 -- always show it

-- Display

vim.o.cpoptions = vim.o.cpoptions .. "y"
set.cursorline = true -- highlight current line
set.encoding = "utf-8"
set.expandtab = true -- convert <TAB> key-presses to spaces
set.list = true -- show special chars
set.listchars = {
	tab = "› ",
	trail = "·",
	extends = "#",
	nbsp = ".",
} -- special character overrides
-- set.lcs+=space:•      -- dot instead of space
set.number = true -- show line numbers
set.ruler = true -- show cursor position
set.showcmd = true
set.textwidth = 79
set.tw = 0 -- text width 0 wont allow linebreak

-- Indentation (Universal default)
set.shiftwidth = 2
set.tabstop = 2

-- Search
set.showmatch = true
set.ignorecase = true
set.smartcase = true -- switch to case-sensitive searches when uppercase chars found
set.incsearch = true -- partial matches
set.hlsearch = true -- highlight matches

-- Indentation (Universal default)
set.shiftwidth = 2
set.tabstop = 2

-- Commands
set.wildmenu = true -- visual autocomplete

-- Python
set.pyxversion = 3

-- neovim
g.node_host_prog = expand("~/.asdf/shims/node")
g.python3_host_prog = expand("~/.pyenv/versions/neovim-python3/bin/python")
g.python_host_prog = expand("~/.pyenv/versions/neovim-python2/bin/python")
g.ruby_host_prog = expand("~/.rbenv/versions/2.6.1/bin/neovim-ruby-host")

-- vim-go
g.go_highlight_build_constraints = 1
g.go_highlight_functions = 1
g.go_highlight_interfaces = 1
g.go_highlight_methods = 1
g.go_highlight_operators = 1
g.go_highlight_structs = 1

-- Plugins
g.UltiSnipsExpandTrigger = "<nop>" -- Let coc.nvim use tab instead of ultisnips
g.gitgutter_map_keys = 0 -- Don't use any key mappings
g.NERDTreeQuitOnOpen = 1 -- close browser after opening a new buffer
g.BufKillCreateMappings = 0

g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd([[
  filetype plugin on
  colorscheme catppuccin
  so ~/dotfiles/neovim/after/options/fzf.vim
]])
