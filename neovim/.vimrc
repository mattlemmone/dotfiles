" Plugins
lua <<EOF
  vim.g.mapleader = " "

  require("plugins.install")
  require("plugins.config.main")
  require("mappings")
  require("options")
EOF

