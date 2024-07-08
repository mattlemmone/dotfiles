local create_lazy_key_map = require("utils/keys").create_lazy_key_map
local git = require("utils/git")

return {
	create_lazy_key_map({
		useLeader = true,
		sequence = "k",
		command = "Telescope keymaps",
		description = "Keymaps",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "s",
		command = function()
			require("telescope.builtin").live_grep()
		end,
		description = "Grep",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "S",
		command = function()
			require("telescope.builtin").live_grep({
				grep_open_files = true,
			})
		end,
		description = "Grep in open buffers",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "*",
		command = function()
			local cwd = vim.fn.expand("%:p:h")
			require("telescope.builtin").grep_string({ cwd = git.get_git_project_root(cwd) or cwd })
		end,
		description = "Search for Word Under Cursor",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "r",
		command = function()
			require("telescope.builtin").resume()
		end,
		description = "Resume Search",
	}),

	create_lazy_key_map({
		useLeader = true,
		sequence = "b",
		command = function()
			require("telescope.builtin").buffers()
		end,
		description = "List Open Buffers",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "cl",
		command = function()
			require("telescope.builtin").commands()
		end,
		description = "Commands",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "ch",
		command = function()
			require("telescope.builtin").command_history()
		end,
		description = "Command History",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "f",
		command = "Telescope find_files",
		description = "File Search",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "F",
		command = function()
			require("telescope.builtin").find_files({
				cwd = require("telescope.utils").buffer_dir(),
			})
		end,
		description = "File Search in buffer directory",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "hh",
		command = function()
			require("telescope.builtin").oldfiles()
		end,
		description = "File History",
	}),
	create_lazy_key_map({
		useLeader = true,
		sequence = "gm",
		command = "Telescope marks",
		description = "Go to Mark",
	}),
}
