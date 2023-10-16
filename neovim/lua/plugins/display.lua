return {
  { import = "plugins.colors" },
  { "folke/zen-mode.nvim" },
  { "folke/twilight.nvim" },
  {
    -- highlight selected ranges from command line
    "winston0410/range-highlight.nvim",
    event = "CmdwinEnter",
  },
  {
    -- "automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching."
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    -- stylized buffer tabs
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "v3.*",
    config = function()
      -- vim.opt.termguicolors = true
      require("bufferline").setup({
        highlights = {
          buffer_selected = { italic = false },
          diagnostic_selected = { italic = false },
          hint_selected = { italic = false },
          pick_selected = { italic = false },
          pick_visible = { italic = false },
          pick = { italic = false },
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  "norcalli/nvim-colorizer.lua", -- highlight color codes real-time
  "rcarriga/nvim-notify",
  {
    "simrat39/symbols-outline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = "SymbolsOutline",
    keys = {
      {
        "<Leader>t",
        "<CMD>SymbolsOutline<CR>",
        mode = "n",
        noremap = true,
        silent = true,
      },
    },
    config = function()
      require("symbols-outline").setup()
    end,
  },
}
