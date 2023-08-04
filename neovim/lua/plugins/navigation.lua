return {
  { import = "plugins.telescope.core" },
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
    "stevearc/oil.nvim",
    opts = {},
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
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function()
      require("leap").add_default_mappings()
    end,
  }, -- ez motion
  {
    "chrishrb/gx.nvim",
    event = { "VeryLazy" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true, -- default settings
  },               -- improved 'gx' for opening links, plugin repos, etc
}
