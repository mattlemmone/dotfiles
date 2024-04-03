local create_key_map = require("utils/keys").create_key_map

return {
	"stevearc/overseer.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		create_key_map({
			sequence = ";b",
			command = "OverseerBuild",
			description = "Add Overseer Command",
		}),
		create_key_map({
			sequence = ";t",
			command = "OverseerToggle",
			description = "Toggle Overseer",
		}),
	},
	config = function()
		require("overseer").setup()
	end,
}
