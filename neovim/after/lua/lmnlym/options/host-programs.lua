local g = vim.g
local expand = vim.fn.expand

g.node_host_prog = expand("~/.asdf/installs/nodejs/18.9.0/.npm/bin/neovim-node-host")
g.python3_host_prog = expand("~/.asdf/shims/python3")
g.python_host_prog = expand("~/.asdf/shims/python2")
g.ruby_host_prog = expand("~/.asdf/shims/neovim-ruby-host")
