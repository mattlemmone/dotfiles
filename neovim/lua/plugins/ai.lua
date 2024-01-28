return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    enabled = false,
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
