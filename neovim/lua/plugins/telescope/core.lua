return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    cmd = "Telescope",
    keys = require('plugins.telescope.keymaps'),
    dependencies = require('plugins.telescope.dependencies'),
    config = function()
      require("telescope").setup({
        defaults = {
          --- Specifically ignoring things in personal notes folder
          file_ignore_patterns = { "Bear Export/", "Attachments/" },
          sorting_strategy = "ascending",
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
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          },
          project = {
            on_project_selected = function(prompt_bufnr)
              local project_actions = require("telescope._extensions.project.actions")
              project_actions.change_working_directory(prompt_bufnr, false)
              vim.cmd("Oil .")
            end
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
    end,
  },
}
