return {
  "RRethy/vim-illuminate",
  {
    "akinsho/bufferline.nvim",
    tag = "v3*",
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
  }, -- stylized buffer tabs
  "fladson/vim-kitty", -- syntax for kitty terminal config
  -- {"folke/noice.nvim",
  -- config = function()
  -- require("noice").setup({
  -- routes = {
  --   -- Hide 'saved' msgs
  --   {
  --     filter = {
  --       event = "msg_show",
  --       kind = "",
  --       find = "written",
  --     },
  --     opts = { skip = true },
  --   },
  --   -- Hide virtual search text
  --   {
  --     filter = {
  --       event = "msg_show",
  --       kind = "search_count",
  --     },
  --     opts = { skip = true },
  --   },
  -- },
  -- })
  -- end
  -- },
  "folke/twilight.nvim", -- focus on active code selection
  "kyazdani42/nvim-web-devicons",
  {
    "lukas-reineke/indent-blankline.nvim",

    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = false,
      })
    end,
  }, -- indent mgmt
  "norcalli/nvim-colorizer.lua", -- highlight color codes real-time
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter.configs").setup({
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  "nvim-treesitter/nvim-treesitter-context",
  {
    "petertriho/nvim-scrollbar",

    config = function()
      require("scrollbar").setup()
    end,
  },
  "rcarriga/nvim-notify", -- notification window
  {
    "simrat39/symbols-outline.nvim",

    config = function()
      require("symbols-outline").setup()
    end,
  },
  "winston0410/range-highlight.nvim", -- highlight selected ranges from command line

  -- Colors
  { "embark-theme/vim", name = "embark" },
  "nyoom-engineering/oxocarbon.nvim",
}
