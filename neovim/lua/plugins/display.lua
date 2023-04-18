return {
  { import = "plugins.colors" },
  { "embark-theme/vim",                 name = "embark", enabled = false },
  { "nyoom-engineering/oxocarbon.nvim", enabled = false },
  "winston0410/range-highlight.nvim", -- highlight selected ranges from command line
  "RRethy/vim-illuminate",
  {
    "akinsho/bufferline.nvim",
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
  }, -- stylized buffer tabs
  {
    "folke/noice.nvim",
    enabled = false,
    config = function()
      require("noice").setup({
        routes = {
          -- Hide 'saved' msgs
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = { skip = true },
          },
          -- Hide virtual search text
          {
            filter = {
              event = "msg_show",
              kind = "search_count",
            },
            opts = { skip = true },
          },
        },
      })
    end,
  },
  "folke/twilight.nvim", -- focus on active code selection
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = false,
      })
    end,
  },                            -- indent mgmt
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
  {
    "rcarriga/nvim-notify",
    keys = {
      -- reload current lua file
      {
        "<Leader>l",
        "",
        mode = "n",
        callback = function()
          require("notify")(vim.fn.expand("%"), "", { title = "Sourcing luafile" })
          vim.cmd("luafile %")
        end,
      },
    },
    opts = {},
    config = nil,
  },
  {
    "simrat39/symbols-outline.nvim",
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
