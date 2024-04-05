local git = require("utils/git")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		return tail
	end
	return string.format("%s\t\t%s", tail, parent)
end

return {
	{ import = "plugins.telescope.dependencies" },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		cmd = "Telescope",
		keys = require("mlem.keymaps.telescope"),
		config = function()
			require("telescope").setup({
				defaults = {
					--- Specifically ignoring things in personal notes folder
					file_ignore_patterns = {
						"Bear Export/",
						"Attachments/",
						"*.mindnode/",
					},
					sorting_strategy = "ascending",
					path_display = filenameFirst,
					layout_config = {
						vertical = { width = 0.25 },
						prompt_position = "top",
					},
					mappings = {
						i = {
							["<C-D>"] = require("telescope.actions").cycle_history_next,
							["<C-U>"] = require("telescope.actions").cycle_history_prev,
							["<C-CR>"] = require("telescope.actions").to_fuzzy_refine,
						},
						n = {
							["q"] = function(...)
								require("telescope.actions").smart_send_to_qflist(...)
								require("telescope.builtin").quickfix({ initial_mode = "normal" })
							end,
							["x"] = "delete_buffer",
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
					project = {
						hidden_files = true,
						on_project_selected = function(prompt_bufnr)
							local project_actions = require("telescope._extensions.project.actions")
							project_actions.change_working_directory(prompt_bufnr, false)

							local cwd = vim.fn.expand("%:p:h")
							require("telescope.builtin").find_files({ cwd = git.get_git_project_root(cwd) or cwd })
						end,
					},
					["ui-select"] = {
						require("telescope.themes").get_cursor(),
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
					lsp_references = {
						path_display = { "shorten" },
					},
				},
				import = {
					-- Add imports to the top of the file keeping the cursor in place
					insert_at_top = false,
				},
			})
		end,
	},
}
