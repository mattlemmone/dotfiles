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
		"echasnovski/mini.bracketed",
		event = "VeryLazy",
		config = function()
			require("mini.bracketed").setup()
		end,
	}, -- navigation using brackets. TS nodes, conflicts, comments, diag, files, bufs, windows...
	{
		"cbochs/grapple.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", lazy = true },
		},
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
		},
		config = function()
			require("leap").add_default_mappings()
		end,
	}, -- ez motion
	{
		"ggandor/flit.nvim",

		config = function()
			require("flit").setup({
				keys = { f = "f", F = "F", t = "t", T = "T" },
				-- A string like "nv", "nvo", "o", etc.
				labeled_modes = "v",
				multiline = true,
				opts = {},
			})
		end,

		keys = {
			{ "f", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "F", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "t", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "T", mode = { "n", "x", "o" }, desc = "Leap backward to" },
		},
	},
	{
		"chrishrb/gx.nvim",
		event = { "VeryLazy" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true, -- default settings
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
	}, -- improved 'gx' for opening links, plugin repos, etc
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "VeryLazy" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
							["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
							["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							["@parameter.outer"] = "v",
							["@function.outer"] = "V",
							["@class.outer"] = "<c-v>",
						},
						include_surrounding_whitespace = true,
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>gs"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>gS"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = { query = "@class.outer", desc = "Next class start" },
							--
							-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
							["]o"] = "@loop.*",
							-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
							--
							-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
							-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
							["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
							["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
						-- Below will go to either the start or the end, whichever is closer.
						-- Use if you want more granular movements
						-- Make it even more gradual by adding multiple queries and regex.
						goto_next = {
							["]c"] = "@conditional.outer",
						},
						goto_previous = {
							["[c"] = "@conditional.outer",
						},
					},
				},
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
					"size",
					"mtime",
				},
				delete_to_trash = false,
				watch_for_changes = false,
				keymaps = {
					["?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-s>"] = {
						"actions.select",
						opts = { vertical = true },
						desc = "Open the entry in a vertical split",
					},
					["<C-h>"] = {
						"actions.select",
						opts = { horizontal = true },
						desc = "Open the entry in a horizontal split",
					},
					["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
					["<C-p>"] = "actions.preview",
					["q"] = "actions.close",
					["<C-l>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = {
						"actions.cd",
						opts = { scope = "tab" },
						desc = ":tcd to the current oil directory",
						mode = "n",
					},
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
					["g\\"] = "actions.toggle_trash",
				},
				use_default_keymaps = false,
				view_options = {
					show_hidden = true,
					-- This function defines what is considered a "hidden" file
					is_hidden_file = function(name, bufnr)
						local m = name:match("^%.")
						return m ~= nil
					end,
					-- This function defines what will never be shown, even when `show_hidden` is set
					is_always_hidden = function(name, bufnr)
						return false
					end,
					-- Sort file names with numbers in a more intuitive order for humans.
					-- Can be "fast", true, or false. "fast" will turn it off for large directories.
					natural_order = "fast",
					-- Sort file and directory names case insensitive
					case_insensitive = false,
					sort = {
						-- sort order can be "asc" or "desc"
						-- see :help oil-columns to see which columns are sortable
						{ "type", "asc" },
						{ "name", "asc" },
					},
					-- Customize the highlight group for the file name
					highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
						return nil
					end,
				},
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "OilEnter",
				callback = vim.schedule_wrap(function(args)
					local oil = require("oil")
					if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
						oil.open_preview()
					end
				end),
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<Leader>n",
				function()
					local cwd = vim.fn.expand("%:p:h")

					require("oil").open_float(cwd)
				end,
				mode = "n",
				silent = true,
				desc = "File Browser",
			},
		},
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
		end,
	},
}
