local wezterm = require("wezterm")

return {
	window_close_confirmation = "NeverPrompt",
	bypass_mouse_reporting_modifiers = "SHIFT",
	-- color_scheme = "ChallengerDeep",
	font = wezterm.font("FiraCode Nerd Font Mono"),
	font_size = 16,
	freetype_load_target = "Normal",
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Catppuccin Mocha",
	unix_domains = {
		{
			name = "unix",
		},
	},

	default_gui_startup_args = { "connect", "unix" },
	show_update_window = false,
}
