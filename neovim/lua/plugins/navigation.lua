return {
  {
    "jinh0/eyeliner.nvim",
    event = { "BufReadPre", "BufNewFile" },
  }, -- f/F indicators
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    config = function()
      require("mini.bracketed").setup()
    end,
  }, -- navigation using brackets. TS nodes, conflicts, comments, diag, files, bufs, windows...
  {
    "echasnovski/mini.starter",
    event = "VimEnter",
    branch = "stable",
    opts = function()
      local obsidianVaultPath = "/Users/matt/Library/Mobile Documents/iCloud~md~obsidian/Documents/iOS Vault/"
      local workNotesPath = obsidianVaultPath .. "/Work/Wolt"
      local meetingNotesPath = workNotesPath .. "/Meetings"
      local oneOnOneNotesPath = workNotesPath .. "/Interpersonal/1-on-1s"

      local function openFilePathAction(path)
        return function()
          require("telescope").extensions.file_browser.file_browser({
            path = path,
            initial_mode = "insert",
            hidden = true,
            respect_gitignore = false,
          })
        end
      end

      local config = {
        items = {
          {
            action = openFilePathAction(meetingNotesPath),
            name = "Meeting Notes",
            section = "Notes",
          },
          {
            action = openFilePathAction(oneOnOneNotesPath),
            name = "1:1 Notes",
            section = "Notes",
          },
          {
            action = openFilePathAction(obsidianVaultPath),
            name = "Read Notes",
            section = "Notes",
          },
          {
            action = "Telescope projects",
            name = "Projects",
            section = "Files",
          },
          {
            action = "Telescope oldfiles",
            name = "Recent",
            section = "Files",
          },
          {
            action = "Lazy update",
            name = "Update",
            section = "Plugins",
          },
          {
            action = "Lazy profile",
            name = "Profile",
            section = "Plugins",
          },
        },

        header = [[

⠀⠀⠀⣀⠤⠤⠤⠀⠀⠀⠀⠀⠀⠀⠠⠤⠤⠤⠤⠤⠄⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⡸⠉⠒⠤⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠑⠢⢄⡀⠀⠀⠀⠀⠀⠀
⠀⠀⡇⠀⠀⡀⠀⠈⠉⠒⡔⠒⠒⠒⠒⠒⠒⠒⠒⠒⠀⠀⠀⠠⠤⠤⠤⠤⠬⠕⣂⣤⠀⠀⠀
⠀⢀⠃⢠⡈⠃⢠⡄⠀⢰⠀⠀⡠⠀⠠⠤⠤⠤⠤⠤⠤⠄⠀⣀⣀⣀⣀⣀⣀⠀⠀⠀⡇⠀⠀
⠀⢸⠀⢈⠁⠷⢠⡄⠀⢸⠀⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⡄⠀⡇⠀⠀
⠀⢸⠀⠘⠁⠰⠆⠀⠀⡆⠀⢸⠀⠀⠀⠀⠒⠴⠃⠀⠀⠀⠀⠀⢄⠴⠀⠀⠀⠀⡇⢸⠀⠀⠀
⠀⡜⠀⣄⡀⠀⠀⠀⠀⡇⠀⡏⠀⠀⠀⠀⠀⠀⠀⢤⡀⠀⣀⠄⠀⠀⠀⠀⠀⢰⠀⢸⠀⠀⠀
⠀⡇⢰⣿⣿⣷⡆⠀⢸⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⡆⠀⠀⠀
⠀⡇⢸⣟⡻⠿⠃⠀⠸⠀⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⡇⠀⠀⠀
⢠⠁⠘⣻⣿⣶⠀⠀⡇⠀⠘⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⢀⠁⠀⠀⠀
⢸⠀⢾⣿⣿⡍⠀⢠⠇⢠⣤⣌⠉⠉⠉⠁⠀⠀⠀⠒⠒⠒⠒⠒⠒⠒⠒⠒⠋⠀⢸⠀⠀⠀⠀
⢸⠀⠀⠈⠙⠃⠀⢸⢰⠁⢨⢺⣶⣶⣶⣶⣶⣶⣶⣤⠀⠀⠀⠀⠀⣤⣄⠀⠀⠀⡘⠀⠀⠀⠀
⠘⣰⣿⣿⣿⡆⠀⢸⠆⢠⠃⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠙⠉⠀⠀⠀⡧⢄⡀⠀⠀
⡇⠹⢿⡁⠹⠇⠤⠋⢠⠃⢠⣰⠦⣄⠀⠀⠀⠀⠀⠀⢀⣾⡄⠀⠀⣀⠀⠀⠀⢀⠷⠤⡈⠑⢆
⡇⠀⠀⠈⠒⠤⠤⢴⠁⠀⠑⢿⣀⡭⠂⠀⠀⠀⠀⠀⠑⠓⠛⠀⢾⣹⡷⠀⠀⢸⠀⢀⡼⢀⡾
⠣⡀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⣽⣿⣿⡆⠀⠀⠀⠀⡏⡴⠋⡴⠋⠀
⠀⠈⠑⠢⢄⡀⠀⡇⠀⠀⠰⠶⠶⠀⠀⠶⠶⠆⠀⠀⠱⣻⣿⣿⠏⠀⠀⠀⠀⠇⠑⠛⠛⠀⠀
⠀⠀⠀⠀⠀⠈⠑⠻⠤⠤⢦⡤⢤⠤⠄⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡼⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢆⠑⢄⠀⠀⠀⠀⡜⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠔⠒⢉⡴⠋⠀⠀⠀⢠⠁⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⣀⡏⠁⠀⠀⠀⠀⠀⡌⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⢰⠁⢸⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠄⠀⠴⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

    ]],
        footer = "",
      }

      return config
    end,
    config = function(_, config)
      -- close Lazy and re-open when starter is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      local starter = require("mini.starter")
      starter.setup(config)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local pad_footer = string.rep(" ", 0)
          starter.config.footer = pad_footer .. "⚡ Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(starter.refresh)
        end,
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
    end,
  },
  {
    "folke/persistence.nvim",
    event = "VimEnter",
    config = function()
      local keymap = vim.keymap
      require("persistence").setup()

      keymap.set("n", "<Leader>ls", "<CMD>lua require('persistence').load()<CR>")
      keymap.set("n", "<Leader>ll", "<CMD>lua require('persistence').load({last= true})<CR>")
    end,
  }, -- session mgmt
  {
    "ggandor/leap.nvim",
    -- Lazy loading not needed, per docs
    config = function()
      require("leap").add_default_mappings()
    end,
  }, -- ez motion
  {
    "chrishrb/gx.nvim",
    event = { "VeryLazy" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true, -- default settings
  },             -- improved 'gx' for opening links, plugin repos, etc
}
