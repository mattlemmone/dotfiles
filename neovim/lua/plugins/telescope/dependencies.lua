local keyUtils = require("utils/keys")
local INITIAL_MODE_NORMAL = "initial_mode='normal'"

return {
	{
		"nvim-telescope/telescope-project.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		command = "Telescope project",
		keys = {
			keyUtils.createKeyMap({
				useLeader = true,
				sequence = ";",
				command = "lua require('telescope').extensions.project.project({" .. INITIAL_MODE_NORMAL .. "})",
				description = "Project List",
			}),
		},
		config = function()
			require("telescope").load_extension("project")
		end,
	},
	{
		-- if you get issues when installing, make sure to build the binary via `gb`
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		-- Use telescope for vim's ui selector
		"nvim-telescope/telescope-ui-select.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		keys = {
			keyUtils.createKeyMap({
				useLeader = true,
				sequence = "n",
				command = "lua require('telescope').extensions.file_browser.file_browser({path=':p:h',"
					.. INITIAL_MODE_NORMAL
					.. ",hidden=true,respect_gitignore=false})",
				description = "File Navigation",
			}),
		},
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"AckslD/nvim-neoclip.lua", -- register history
		dependencies = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		keys = {
			keyUtils.createKeyMap({
				useLeader = true,
				sequence = '"',
				command = "lua require('telescope').extensions.neoclip.default()",
				description = "Yank History",
			}),
		},
		config = function()
			require("neoclip").setup({
				enable_persistent_history = true,
				preview = true,
				default_register = "+",
			})

			-- This must come after the above neoclip setup function, or persistent history will not work
			require("telescope").load_extension("neoclip")
		end,
	},
	{
		-- auto search imports
		"piersolenski/telescope-import.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		keys = {
			keyUtils.createKeyMap({
				useLeader = true,
				sequence = "i",
				command = "Telescope import",
				description = "Search Imports",
			}),
		},
		config = function()
			require("telescope").load_extension("import")
		end,
	},
}
