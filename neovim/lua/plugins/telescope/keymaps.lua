local createKeyMap = require("utils/keys").createKeyMap

return {
	createKeyMap({
		useLeader = true,
		sequence = "k",
		command = "Telescope keymaps",
		description = "Keymaps",
	}),
	createKeyMap({
		useLeader = true,
		sequence = "s",
		command = function()
			require("telescope.builtin").live_grep()
		end,
		description = "Grep",
	}),
	createKeyMap({
		useLeader = true,
		sequence = "*",
		command = function()
			require("telescope.builtin").grep_string()
		end,
		description = "Search for Word Under Cursor",
	}),
	createKeyMap({
		useLeader = true,
		sequence = "r",
		command = function()
			require("telescope.builtin").resume()
		end,
		description = "Resume Search",
	}),

	createKeyMap({
		useLeader = true,
		sequence = "b",
		command = function()
			require("telescope.builtin").buffers()
		end,
		description = "List Open Buffers",
	}),
	createKeyMap({
		useLeader = true,
		sequence = "cl",
		command = function()
			require("telescope.builtin").commands()
		end,
		description = "Commands",
	}),
	createKeyMap({
		useLeader = true,
		sequence = "ch",
		command = function()
			require("telescope.builtin").command_history()
		end,
		description = "Command History",
	}),
	createKeyMap({
		useLeader = true,
		sequence = "f",
		command = function()
			require("telescope.builtin").find_files()
		end,
		description = "File Search",
	}),
	createKeyMap({
		useLeader = true,
		sequence = "hh",
		command = function()
			require("telescope.builtin").oldfiles()
		end,
		description = "File History",
	}),
	createKeyMap({
		useLeader = true,
		sequence = "gm",
		command = "Telescope marks",
		description = "Go to Mark",
	}),
}
