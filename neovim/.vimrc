" Plugins
lua <<EOF
  vim.g.mapleader = " "

  require("lmnlym.plugins.registry")
  require("lmnlym.plugins.config.main")
  require("lmnlym.mappings")
  require("lmnlym.options.main")
  require("lmnlym.autocmd")
EOF

