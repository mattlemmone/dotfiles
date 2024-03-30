local create_key_map = require("utils/keys").create_key_map
local git = require("utils/git")

return {
	create_key_map({
		useLeader = true,
		sequence = "k",
		command = "Telescope keymaps",
		description = "Keymaps",
	}),
	create_key_map({
		useLeader = true,
		sequence = "s",
		command = function()
			require("telescope.builtin").live_grep({ cwd = git.get_git_project_root_or_current_dir() })
		end,
		description = "Grep",
	}),
	create_key_map({
		useLeader = true,
		sequence = "*",
		command = function()
			require("telescope.builtin").grep_string({ cwd = git.get_git_project_root_or_current_dir() })
		end,
		description = "Search for Word Under Cursor",
	}),
	create_key_map({
		useLeader = true,
		sequence = "r",
		command = function()
			require("telescope.builtin").resume()
		end,
		description = "Resume Search",
	}),

	create_key_map({
		useLeader = true,
		sequence = "b",
		command = function()
			require("telescope.builtin").buffers()
		end,
		description = "List Open Buffers",
	}),
	create_key_map({
		useLeader = true,
		sequence = "cl",
		command = function()
			require("telescope.builtin").commands()
		end,
		description = "Commands",
	}),
	create_key_map({
		useLeader = true,
		sequence = "ch",
		command = function()
			require("telescope.builtin").command_history()
		end,
		description = "Command History",
	}),
	create_key_map({
		useLeader = true,
		sequence = "f",
		command = function()
			require("telescope.builtin").find_files({ cwd = git.get_git_project_root_or_current_dir() })
		end,
		description = "File Search",
	}),
	create_key_map({
		useLeader = true,
		sequence = "hh",
		command = function()
			require("telescope.builtin").oldfiles()
		end,
		description = "File History",
	}),
	create_key_map({
		useLeader = true,
		sequence = "gm",
		command = "Telescope marks",
		description = "Go to Mark",
	}),
}
