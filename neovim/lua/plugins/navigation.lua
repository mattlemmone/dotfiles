return {
	{ import = "plugins.telescope.core" },
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({
				-- whether to map keybinds or not. default true
				default_mappings = true,
				-- which builtin marks to show. default {}
				builtin_marks = { ".", "<", ">", "^" },
				-- whether movements cycle back to the beginning/end of buffer. default true
				cyclic = true,
				-- whether the shada file is updated after modifying uppercase marks. default false
				force_write_shada = false,
				-- how often (in ms) to redraw signs/recompute mark positions.
				-- higher values will have better performance but may cause visual lag,
				-- while lower values may cause performance penalties. default 150.
				refresh_interval = 250,
				-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
				-- marks, and bookmarks.
				-- can be either a table with all/none of the keys, or a single number, in which case
				-- the priority applies to all marks.
				-- default 10.
				sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
				-- disables mark tracking for specific filetypes. default {}
				excluded_filetypes = {},
				-- disables mark tracking for specific buftypes. default {}
				excluded_buftypes = {},
				-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
				-- sign/virttext. Bookmarks can be used to group together positions and quickly move
				-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
				-- default virt_text is "".
				bookmark_0 = {
					sign = "⚑",
					virt_text = "hello world",
					-- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
					-- defaults to false.
					annotate = false,
				},
				mappings = {},
			})
		end,
	},
	{
		"jinh0/eyeliner.nvim",
		event = { "BufReadPre", "BufNewFile" },
	}, -- f/F indicators
	{
		"echasnovski/mini.bracketed",
		event = "VeryLazy",
		config = function()
			require("mini.bracketed").setup()
		end,
	}, -- navigation using brackets. TS nodes, conflicts, comments, diag, files, bufs, windows...
	{
		"stevearc/oil.nvim",
		event = "BufEnter",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
		end,
	},
	{
		"folke/persistence.nvim",
		event = "VimEnter",
		config = function()
			local keymap = vim.keymap
			require("persistence").setup()

			keymap.set("n", "<Leader>ls", "<CMD>lua require('persistence').load()<CR>")
			keymap.set("n", "<Leader>ll", "<CMD>lua require('persistence').load({last= true})<CR>")
		end,
	}, -- session mgmt
	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function()
			require("leap").add_default_mappings()
		end,
	}, -- ez motion
	{
		"chrishrb/gx.nvim",
		event = { "VeryLazy" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true, -- default settings
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
	}, -- improved 'gx' for opening links, plugin repos, etc
}
