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
}
