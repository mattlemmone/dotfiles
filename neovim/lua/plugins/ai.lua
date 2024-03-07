return {
  {
    --- AI diagnostics. pretty sweet.
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
    keys = {
      {
        "gw",
        mode = { "n", "x" },
        function()
          require("wtf").ai()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        mode = { "n", "x" },
        "gW",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
  {
    "dpayne/CodeGPT.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require("codegpt.config")
      vim.g["codegpt_commands"] = {
        ["testwith"] = {
          user_message_template =
              "Write tests for the following code: ```{{filetype}}\n{{text_selection}}```\n{{command_args}} " ..
              "Only return the code snippet and nothing else.",
          callback_type = "code_popup",
          model = "gpt-4"
        }
      }

      vim.g["codegpt_commands"] = {
        ["completion"] = { model = "gpt-4" },
        ["code_edit"] = { model = "gpt-4" },
        ["opt"] = { model = "gpt-4" },
        ["tests"] = { model = "gpt-4" },
        ["explain"] = { model = "gpt-4" },
      }
    end,
    keys = {
      {
        "<Leader>qe",
        mode = { "x" },
        function() require("utils/input").promptUserForCommandArgs("Edit With GPT", "Chat code_edit") end,
        desc = "Edit With GPT",
      },
      {
        "<Leader>qt",
        "<CMD>Chat tests<CR>",
        mode = { "x" },
        desc = "Test With GPT",
      },
      {
        "<Leader>qq",
        "<CMD>Chat explain<CR>",
        mode = { "x" },
        desc = "Explain With GPT",
      },
    }
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },

        -- Disable for copilot cmp source
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  } }
