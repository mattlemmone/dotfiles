---@diagnostic disable: undefined-global
local set = vim.opt
local g = vim.g
local expand = vim.fn.expand
local autocmd = vim.api.nvim_create_autocmd

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
set.signcolumn = "yes" -- prevent flickering on save

-- Indentation (Universal default)
set.shiftwidth = 2
set.tabstop = 2

-- Search
set.showmatch = true
set.ignorecase = true
set.smartcase = true -- switch to case-sensitive searches when uppercase chars found
set.incsearch = true -- partial matches
set.hlsearch = true -- highlight matches

-- Commands
set.wildmenu = true -- visual autocomplete

-- Python
set.pyxversion = 3

-- neovim
g.node_host_prog = expand("~/.asdf/installs/nodejs/18.9.0/.npm/bin/neovim-node-host")
g.python3_host_prog = expand("~/.asdf/shims/python3")
g.python_host_prog = expand("~/.asdf/shims/python2")
g.ruby_host_prog = expand("~/.asdf/shims/neovim-ruby-host")

-- vim-go
g.go_highlight_build_constraints = 1
g.go_highlight_functions = 1
g.go_highlight_interfaces = 1
g.go_highlight_methods = 1
g.go_highlight_operators = 1
g.go_highlight_structs = 1

-- Plugins
g.gitgutter_map_keys = 0 -- Don't use any key mappings
g.NERDTreeQuitOnOpen = 1 -- close browser after opening a new buffer
g.BufKillCreateMappings = 0

-- Clipboard
set.clipboard = "unnamedplus"

--  tundra only
set.termguicolors = true
set.background = "dark"

-- we dont like dis
set.swapfile = false

vim.cmd([[
  colorscheme tundra
  highlight link GitSignsCurrentLineBlame Comment
  set foldmethod=expr
  set foldlevelstart=20
  set foldexpr=nvim_treesitter#foldexpr()
  set foldnestmax=3
]])

-- Format lua on save
autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    vim.lsp.buf.format()
  end,
})
