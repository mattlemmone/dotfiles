local wezterm = require("wezterm")
local action = wezterm.action

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
	keys = {
		{
			key = "-",
			mods = "CTRL",
			action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "|",
			mods = "CTRL",
			action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CMD",
			action = action.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "h",
			mods = "CMD",
			action = action.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CMD",
			action = action.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "CMD",
			action = action.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "CMD",
			action = action.ActivatePaneDirection("Down"),
		},
		{
			key = "f",
			mods = "CTRL",
			action = action.TogglePaneZoomState,
		},
		{
			key = "Escape",
			mods = "CTRL",
			action = action.ActivateCopyMode,
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = action.QuickSelect,
		},
	},
}
