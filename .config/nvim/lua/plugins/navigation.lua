local create_lazy_key_map = require("utils/keys").create_lazy_key_map

return {
	{ import = "plugins.telescope.core" },
	{
		"ibhagwan/fzf-lua",
		enabled = false,
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			create_lazy_key_map({
				useLeader = true,
				sequence = "k",
				command = "FzfLua keymaps",
				description = "Keymaps",
			}),
			create_lazy_key_map({
				useLeader = true,
				sequence = "s",
				command = function()
					require("fzf-lua").live_grep_native()
				end,
				description = "Grep",
			}),
			create_lazy_key_map({
				useLeader = true,
				sequence = "S",
				command = function()
					require("fzf-lua").lgrep_curbuf()
				end,
				description = "Grep in current buffer",
			}),
			create_lazy_key_map({
				useLeader = true,
				sequence = "*",
				command = function()
					require("fzf-lua").grep_cword()
				end,
				description = "Search for Word Under Cursor",
			}),
			create_lazy_key_map({
				useLeader = true,
				sequence = "r",
				command = function()
					require("fzf-lua").resume()
				end,
				description = "Resume Search",
			}),

			create_lazy_key_map({
				useLeader = true,
				sequence = "b",
				command = function()
					require("fzf-lua").buffers()
				end,
				description = "List Open Buffers",
			}),
			create_lazy_key_map({
				useLeader = true,
				sequence = "cl",
				command = function()
					require("fzf-lua").commands()
				end,
				description = "Commands",
			}),
			create_lazy_key_map({
				useLeader = true,
				sequence = "ch",
				command = function()
					require("fzf-lua").command_history()
				end,
				description = "Command History",
			}),
			create_lazy_key_map({
				useLeader = true,
				sequence = "f",
				command = "FzfLua files",
				description = "File Search",
			}),
			create_lazy_key_map({
				useLeader = true,
				sequence = "hh",
				command = function()
					require("fzf-lua").oldfiles()
				end,
				description = "File History",
			}),
			create_lazy_key_map({
				useLeader = true,
				sequence = "gm",
				command = "FzfLua marks",
				description = "Go to Mark",
			}),
		},
		config = function()
			local actions = require("fzf-lua.actions")
			require("fzf-lua").setup({
				actions = {
					files = {
						["default"] = actions.file_edit_or_qf,
					},
				},
				files = {
					formatter = "path.filename_first",
				},
			})
		end,
	},
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
	{ -- f/F indicators
		"jinh0/eyeliner.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true, -- show highlights only after keypress
				dim = false, -- dim all other characters if set to true (recommended!)
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
}
