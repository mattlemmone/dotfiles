return {
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
    end
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
