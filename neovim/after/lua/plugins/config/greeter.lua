local dashboard = require("dashboard")
dashboard.custom_center = {
	{
		icon = "  ",
		desc = "Resume last session                  ",
		shortcut = "SPC s l",
		action = "RestoreSession",
	},
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "DashboardFindHistory",
		shortcut = "SPC f h",
	},
	{
		icon = "  ",
		desc = "Find File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "Telescope file_browser",
		shortcut = "b",
	},
	{ icon = "  ", desc = "Search", action = "Telescope live_grep", shortcut = "SPC f w" },
}
