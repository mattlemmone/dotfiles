local keymap = vim.keymap

-- im lazy but i should fix this dupe
vim.g.mapleader = " "

require("telescope").setup({
	defaults = {
  sorting_strategy = "ascending",
		layout_config = {
			vertical = { width = 0.25 },
			prompt_position = "top",
			-- other layout configuration here
		},
		-- other defaults configuration here
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files" },
		},
		live_grep = {
			find_command = { "rg", "-l" },
		},
    buffers = {
      sort_lastused = true,
      ignore_current_buffer = true
    }
	},
})

-- list open buffers
keymap.set("n", "<Leader>b", "<CMD>lua require('telescope.builtin').buffers()<CR>")

-- search current buffer
keymap.set("n", "<Leader>ll", "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")

-- registers
keymap.set("n", '<Leader>\"', "<CMD>lua require('telescope.builtin').registers()<CR>")

-- command history
keymap.set("n", "<Leader>ch", "<CMD>lua require('telescope.builtin').command_history()<CR>")

-- file search
keymap.set("n", "<Leader>f", "<CMD>lua require('telescope.builtin').find_files()<CR>")
keymap.set("n", "<Leader>g", "<CMD>lua require('telescope.builtin').git_commits()<CR>")

-- file history
keymap.set("n", "<Leader>hh", "<CMD>lua require('telescope.builtin').oldfiles()<CR>")

-- grep
keymap.set("n", "<Leader>s", "<CMD>lua require('telescope.builtin').live_grep()<CR>")

-- search for word under cursor in project
keymap.set("n", "<Leader>*", ":Rg <C-R>:<C-W><CR> ")
