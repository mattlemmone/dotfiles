local wezterm = require("wezterm")
wezterm.log_info("Config file " .. wezterm.config_file)

return {
	font = wezterm.font("FiraCode Nerd Font Mono", { font_size = 16 }),
	color_scheme = "Catppuccin Mocha",
	unix_domains = {
		{
			name = "unix",
		},
	},

	default_gui_startup_args = { "connect", "unix" },
	show_update_window = false,
}
