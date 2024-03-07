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

set.conceallevel = 2

-- configure display for neovim docs
local _border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config {
  float = { border = _border },
  underline = true
}

vim.cmd([[
  highlight link GitSignsCurrentLineBlame Comment
  set foldlevelstart=20
  set foldnestmax=3
]])

vim.api.nvim_create_autocmd('ColorScheme', {
  command = [[highlight DiagnosticUnderlineError gui=undercurl]],
  desc = "undercurl errors"
})

g.node_host_prog = expand("~/.asdf/installs/nodejs/18.16.0/.npm/bin/neovim-node-host")
g.python3_host_prog = expand("~/.asdf/shims/python3")
g.python_host_prog = expand("~/.asdf/shims/python2")
g.ruby_host_prog = expand("~/.asdf/shims/neovim-ruby-host")
