return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
      {
        -- if you get issues when installing, make sure to build the binary via `gb`
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-ui-select.nvim", -- code actions in telescope.. is that all?
        config = function()
          require("telescope").load_extension("ui-select")
        end,
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
        config = function()
          require("telescope").load_extension("file_browser")
        end,
      },
      {
        "AckslD/nvim-neoclip.lua", -- register history
        dependencies = {
          { "kkharji/sqlite.lua", module = "sqlite" },
        },
        config = function()
          require("neoclip").setup({
            enable_persistent_history = true,
            preview = true,
            default_register = "+",
          })

          -- This must come after the above neoclip setup function, or persistent history will not work
          require("telescope").load_extension("neoclip")
        end,
      },
    },
    config = function()
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
              ["<C-E>"] = require("telescope.actions").to_fuzzy_refine,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
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
      keymap.set(
        "n",
        "<Leader>n",
        "<CMD>Telescope file_browser path=%:p:h initial_mode=normal hidden=true<CR>",
        { silent = true }
      )

      -- grep
      keymap.set("n", "<Leader>s", "<CMD>lua require('telescope.builtin').live_grep()<CR>")

      -- search for word under cursor
      keymap.set("n", "<Leader>*", "<CMD>lua require('telescope.builtin').grep_string()<CR>")

      -- Resuming search
      keymap.set("n", "<Leader>r", "<CMD>Telescope resume<CR>")

      -- Yank history
      keymap.set("n", '<Leader>"', "<CMD>Telescope neoclip<CR>")
    end,
  },
}
