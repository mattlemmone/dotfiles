local INITIAL_MODE_NORMAL = "initial_mode='normal'"

local KEYS = {
	LEADER = "<Leader>",
	CMD = "<CMD>",
	ENTER = "<CR>",
}

return {
	{
		KEYS.LEADER .. "k",
		KEYS.CMD .. "Telescope keymaps" .. KEYS.ENTER,
		mode = "n",
		desc = "Keymaps",
	},
	{
		KEYS.LEADER .. ";",
		KEYS.CMD
			.. "lua require('telescope').extensions.project.project({"
			.. INITIAL_MODE_NORMAL
			.. "})"
			.. KEYS.ENTER,
		mode = "n",
		desc = "Project List",
	},

	{
		KEYS.LEADER .. "s",
		KEYS.CMD .. "lua require('telescope.builtin').live_grep()" .. KEYS.ENTER,
		mode = "n",
		desc = "Grep",
	},
	{
		KEYS.LEADER .. "*",
		KEYS.CMD .. "lua require('telescope.builtin').grep_string()" .. KEYS.ENTER,
		mode = "n",
		desc = "Search for Word Under Cursor",
	},
	{
		KEYS.LEADER .. "r",
		KEYS.CMD .. "lua require('telescope.builtin').resume()" .. KEYS.ENTER,
		mode = "n",
		desc = "Resume Search",
	},
	{
		'<Leader>"',
		KEYS.CMD .. "lua require('telescope').extensions.neoclip.default()" .. KEYS.ENTER,
		mode = "n",
		desc = "Yank History",
	},
	{
		KEYS.LEADER .. "b",
		KEYS.CMD .. "lua require('telescope.builtin').buffers()" .. KEYS.ENTER,
		desc = "List Open Buffers",
		mode = "n",
	},
	{
		KEYS.LEADER .. "cl",
		KEYS.CMD .. "lua require('telescope.builtin').commands()" .. KEYS.ENTER,
		desc = "Commands",
		mode = "n",
	},
	{
		KEYS.LEADER .. "ch",
		KEYS.CMD .. "lua require('telescope.builtin').command_history()" .. KEYS.ENTER,
		desc = "Command History",
		mode = "n",
	},
	{
		KEYS.LEADER .. "f",
		KEYS.CMD .. "lua require('telescope.builtin').find_files()" .. KEYS.ENTER,
		desc = "File Search",
		mode = "n",
	},
	{
		KEYS.LEADER .. "hh",
		KEYS.CMD .. "lua require('telescope.builtin').oldfiles()" .. KEYS.ENTER,
		desc = "File History",
		mode = "n",
	},
	{
		KEYS.LEADER .. "n",
		KEYS.CMD
			.. "lua require('telescope').extensions.file_browser.file_browser({path='%:p:h',"
			.. INITIAL_MODE_NORMAL
			.. ",hidden=true,respect_gitignore=false})"
			.. KEYS.ENTER,
		mode = "n",
		silent = true,
		desc = "File Navigation",
	},
	{
		KEYS.LEADER .. "i",
		KEYS.CMD .. "Telescope import" .. KEYS.ENTER,
		mode = "n",
		desc = "Search Imports",
	},

	{
		KEYS.LEADER .. "gm",
		KEYS.CMD .. "Telescope marks" .. KEYS.ENTER,
		mode = { "n" },
		desc = "Go to Mark",
	},
}
