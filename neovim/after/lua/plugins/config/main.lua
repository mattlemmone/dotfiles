local actions = require("diffview.actions")

require("diffview").setup({
	keymaps = {
		disable_defaults = false, -- Disable the default keymaps
		view = {
			-- The `view` bindings are active in the diff buffers, only when the current
			-- tabpage is a Diffview.
			["gE"] = actions.prev_conflict, -- In the merge_tool: jump to the previous conflict
			["ge"] = actions.next_conflict, -- In the merge_tool: jump to the next conflict
		},
	},
})
require("nvim-surround").setup()
require("octo").setup()
require("nvim-tundra").setup({
	plugins = {
		telescope = true,
		treesitter = true,
		context = true,
		gitsigns = true,
	},
})
require("mkdnflow").setup({})
require("nvim-autopairs").setup({})
require("nvim-surround").setup({})
require("plugins.config.coc")
require("plugins.config.search")
require("plugins.config.statusline")

require("neo-tree").setup()

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

require("treesitter-context").setup({})
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
