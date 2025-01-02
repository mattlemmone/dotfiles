local create_lazy_key_map = require("utils/keys").create_lazy_key_map

return {
	{
		"nvim-telescope/telescope-project.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		command = "Telescope project",
		keys = {
			create_lazy_key_map({
				useLeader = true,
				sequence = ";",
				command = function()
					require("telescope").extensions.project.project({ initial_mode = "normal" })
				end,
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
		event = "VeryLazy",
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
		-- auto search imports
		"piersolenski/telescope-import.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		keys = {
			create_lazy_key_map({
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
