local keyUtils = require("utils/keys")

return {
	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "k",
		command = "Telescope keymaps",
		description = "Keymaps",
	}),
	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "s",
		command = "lua require('telescope.builtin').live_grep()",
		description = "Grep",
	}),
	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "*",
		command = "lua require('telescope.builtin').grep_string()",
		description = "Search for Word Under Cursor",
	}),
	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "r",
		command = "lua require('telescope.builtin').resume()",
		description = "Resume Search",
	}),

	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "b",
		command = "lua require('telescope.builtin').buffers()",
		description = "List Open Buffers",
	}),
	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "cl",
		command = "lua require('telescope.builtin').commands()",
		description = "Commands",
	}),
	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "ch",
		command = "lua require('telescope.builtin').command_history()",
		description = "Command History",
	}),
	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "f",
		command = "lua require('telescope.builtin').find_files()",
		description = "File Search",
	}),
	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "hh",
		command = "lua require('telescope.builtin').oldfiles()",
		description = "File History",
	}),
	keyUtils.createKeyMap({
		useLeader = true,
		sequence = "gm",
		command = "Telescope marks",
		description = "Go to Mark",
	}),
}
