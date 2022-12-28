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
  },
})

-- Plugins
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")

-- Key Maps
-- list open buffers
keymap.set("n", "<Leader>b", "<CMD>lua require('telescope.builtin').buffers()<CR>")

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
keymap.set("n", "<Leader>*", "<CMD>lua require('telescope.builtin').grep_string()<CR>")

-- registers
keymap.set("n", "<Leader>re", "<CMD>Telescope registers<CR>")
