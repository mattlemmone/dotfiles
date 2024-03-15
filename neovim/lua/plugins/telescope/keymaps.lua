local INITIAL_MODE_NORMAL = "initial_mode='normal'"

return {
	{
		"<Leader>k",
		"<CMD>Telescope keymaps<CR>",
		mode = "n",
		desc = "Keymaps",
	},
	{
		"<Leader>;",
		":lua require('telescope').extensions.project.project({" .. INITIAL_MODE_NORMAL .. "})<CR>",
		mode = "n",
		desc = "Project List",
	},
	{
		"<Leader>s",
		"<CMD>lua require('telescope.builtin').live_grep()<CR>",
		mode = "n",
		desc = "Grep",
	},
	{
		"<Leader>*",
		"<CMD>lua require('telescope.builtin').grep_string()<CR>",
		mode = "n",
		desc = "Search for Word Under Cursor",
	},
	{
		"<Leader>r",
		"<CMD>lua require('telescope.builtin').resume()<CR>",
		mode = "n",
		desc = "Resume Search",
	},
	{
		'<Leader>"',
		"<CMD>lua require('telescope').extensions.neoclip.default()<CR>",
		mode = "n",
		desc = "Yank History",
	},
	{
		"<Leader>b",
		"<CMD>lua require('telescope.builtin').buffers()<CR>",
		desc = "List Open Buffers",
		mode = "n",
	},
	{
		"<Leader>cl",
		"<CMD>lua require('telescope.builtin').commands()<CR>",
		desc = "Commands",
		mode = "n",
	},
	{
		"<Leader>ch",
		"<CMD>lua require('telescope.builtin').command_history()<CR>",
		desc = "Command History",
		mode = "n",
	},
	{
		"<Leader>f",
		"<CMD>lua require('telescope.builtin').find_files()<CR>",
		desc = "File Search",
		mode = "n",
	},
	{
		"<Leader>hh",
		"<CMD>lua require('telescope.builtin').oldfiles()<CR>",
		desc = "File History",
		mode = "n",
	},
	{
		"<Leader>n",
		"<CMD>lua require('telescope').extensions.file_browser.file_browser({path='%:p:h',"
			.. INITIAL_MODE_NORMAL
			.. ",hidden=true,respect_gitignore=false})<CR>",
		mode = "n",
		silent = true,
		desc = "File Navigation",
	},
	{
		"<Leader>i",
		"<CMD>Telescope import<CR>",
		mode = "n",
		desc = "Search Imports",
	},
}
