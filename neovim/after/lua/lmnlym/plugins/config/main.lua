-- Vendor
require("leap").add_default_mappings()
require("treesitter-context").setup({})
require("persistence").setup()
require("twilight").setup({})
require("pretty-fold").setup({})
require("which-key").setup({})
require("mkdnflow").setup({})
require("nvim-autopairs").setup({})

-- Local
require("lmnlym.plugins.config.catppuccin")
require("lmnlym.plugins.config.tundra")
require("lmnlym.plugins.config.diffview")
require("lmnlym.plugins.config.lsp")
require("lmnlym.plugins.config.completion")
require("lmnlym.plugins.config.telescope")
require("lmnlym.plugins.config.statusline")

require("indent_blankline").setup({
  show_current_context = true,
  show_current_context_start = false,
})

require("nvim-treesitter.configs").setup({
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

require("gitsigns").setup({
  current_line_blame = true,
})

require("bufferline").setup({
  highlights = {
    buffer_selected = { italic = false },
    diagnostic_selected = { italic = false },
    hint_selected = { italic = false },
    pick_selected = { italic = false },
    pick_visible = { italic = false },
    pick = { italic = false },
  },
})

require("fidget").setup({
  text = { spinner = "dots" },
  align = { bottom = false },
  window = {
    relative = "win", -- where to anchor, either "win" or "editor"
    blend = 100, -- &winblend for the window
    zindex = 1, -- the zindex value for the window
    border = "rounded", -- style of border for the fidget window
  },
})
