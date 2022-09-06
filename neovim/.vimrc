" Plugins
lua <<EOF
  require("plugins.install")
  require("plugins.init")
  require("mappings")
EOF

so ~/dotfiles/neovim/after/options/main.vim
