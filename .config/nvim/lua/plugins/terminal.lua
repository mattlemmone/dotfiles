local create_lazy_key_map = require("utils/keys").create_lazy_key_map

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		keys = {
			create_lazy_key_map({
				sequence = ";t",
				command = "ToggleTerm ToggleAll",
			}),
			create_lazy_key_map({
				sequence = ";t",
				command = "ToggleTerm direction=float",
			}),
		},
	},
	{
		"stevearc/overseer.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			create_lazy_key_map({
				sequence = ";b",
				command = "OverseerBuild",
				description = "Add Overseer Command",
			}),
			create_lazy_key_map({
				sequence = ";t",
				command = "OverseerToggle",
				description = "Toggle Overseer",
			}),
			create_lazy_key_map({
				sequence = ";r",
				command = "OverseerRun",
				description = "Overseer Run",
			}),
		},
		config = function()
			require("overseer").setup()
		end,
	},
}
