local keymap = vim.keymap

require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = {
			vertical = { width = 0.25 },
			prompt_position = "top",
		},
		mappings = {
			i = {
				["<C-D>"] = require("telescope.actions").cycle_history_next,
				["<C-U>"] = require("telescope.actions").cycle_history_prev,
			},
		},
	},
	extensions = {
		file_browser = {
			mappings = {},
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files" },
		},
		buffers = {
			sort_lastused = true,
			ignore_current_buffer = true,
		},
	},
})

-- Plugins
require("telescope").load_extension("file_browser")
require("telescope").load_extension("undo")
require("telescope").load_extension("coc")

-- Key Maps
-- list open buffers
keymap.set("n", "<Leader>b", "<CMD>lua require('telescope.builtin').buffers()<CR>")

-- search current buffer
keymap.set("n", "<Leader>ll", "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")

-- registers
keymap.set("n", "<Leader>re", "<CMD>lua require('telescope.builtin').registers()<CR>")

-- command history
keymap.set("n", "<Leader>ch", "<CMD>lua require('telescope.builtin').command_history()<CR>")

-- file search
keymap.set("n", "<Leader>f", "<CMD>lua require('telescope.builtin').find_files()<CR>")

-- file history
keymap.set("n", "<Leader>hh", "<CMD>lua require('telescope.builtin').oldfiles()<CR>")

-- file nav
keymap.set("n", "<Leader>n", "<CMD>Telescope file_browser path=%:p:h initial_mode=normal<CR>", { silent = true })

-- grep
keymap.set("n", "<Leader>s", "<CMD>lua require('telescope.builtin').live_grep()<CR>")

-- search for word under cursor in project
keymap.set("n", "<Leader>*", ":Rg <C-R>:<C-W><CR> ")

-- registers
keymap.set("n", "<Leader>re", "<CMD>Telescope registers<CR>")
