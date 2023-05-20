return {
  { import = "plugins.colors" },
  {
    "embark-theme/vim",
    name = "embark",
    enabled = false,
  },
  { "nyoom-engineering/oxocarbon.nvim", enabled = false },
  {
    "winston0410/range-highlight.nvim",
    event = "CmdwinEnter",
  }, -- highlight selected ranges from command line
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
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
  }, -- stylized buffer tabs
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
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
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
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
    lazy = true,
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
    {
      "nvim-lualine/lualine.nvim", -- status bar
      event = "VeryLazy",
      config = function()
        require("lualine").setup({
          options = {
            icons_enabled = true,
            -- theme = "tundra",
            theme = "catppuccin",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
              statusline = {},
              winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
              statusline = 1000,
              tabline = 1000,
              winbar = 1000,
            },
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "filetype" },
            lualine_y = {},
            lualine_z = { "location" },
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
          },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {},
        })
      end,
    },
  },
}
