require("which-key").setup { }

require("nvim-autopairs").setup {}

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = false,
}

require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.25 },
      prompt_position = 'top',
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  pickers = {
    find_files = {
      find_command = {"fd"}
    },
    live_grep = {
      find_command = { "rcatg", "-l" },
    }
  }
})

require('nvim-treesitter.configs').setup {
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true }
}

require('neo-tree').setup{
  popup_border_style = "rounded",
  enable_git_status = true,
  filesystem={
    follow_current_file=true
  },
}

require('gitsigns').setup{
  current_line_blame = true,
}

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
