require("octo").setup()
require("nvim-tundra").setup({
	plugins = {
		telescope = true,
		treesitter = true,
		gitsigns = true,
	},
})
require("mkdnflow").setup({})
require("nvim-autopairs").setup({})
require("plugins.config.coc")
require("plugins.config.search")
require("plugins.config.statusline")

require("auto-session").setup({
	cwd_change_handling = {
		restore_upcoming_session = false,
	},
})

require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			visible = true, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
})

require("catppuccin").setup({
	integrations = {
		neotree = {
			enabled = true,
			show_root = true, -- makes the root folder not transparent
			transparent_panel = false, -- make the panel transparent
		},
	},
})
require("which-key").setup({})

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

require("neo-tree").setup({
	popup_border_style = "rounded",
	enable_git_status = true,
	filesystem = {
		follow_current_file = false,
	},
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
