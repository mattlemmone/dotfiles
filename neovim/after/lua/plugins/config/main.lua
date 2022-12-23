-- TODO move out of here
local actions = require("diffview.actions")
require("diffview").setup({
	keymaps = {
		disable_defaults = false, -- Disable the default keymaps
		view = {
			-- The `view` bindings are active in the diff buffers, only when the current
			-- tabpage is a Diffview.
			["gE"] = actions.prev_conflict, -- In the merge_tool: jump to the previous conflict
			["ge"] = actions.next_conflict, -- In the merge_tool: jump to the next conflict
			["nn"] = actions.focus_entry,
		},
	},
})
require("nvim-tundra").setup({
	plugins = {
		telescope = true,
		treesitter = true,
		context = true,
		gitsigns = true,
	},
})

require("catppuccin").setup({
	integrations = {},
})

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

require("pretty-fold").setup()
require("which-key").setup({})
require("nvim-surround").setup()
require("mkdnflow").setup({})
require("nvim-autopairs").setup({})
require("nvim-surround").setup({})
require("plugins.config.coc")
require("plugins.config.search")
require("plugins.config.statusline")
