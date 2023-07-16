return {
  {
    enabled = false, -- cant disable key mapping, docs incorrect
    'aduros/ai.vim',
    event = "VeryLazy",
    cmd = "AI",
    config = function()
      vim.g.ai_no_mappings = 1
    end
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
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
  },
}
