return {
  { "tpope/vim-commentary", event = "VeryLazy" }, -- commenting
  { "tpope/vim-repeat",     event = "VeryLazy" },
  { "tpope/vim-surround",   event = "VeryLazy" },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    version = "*",
    keys = {
      {
        "<Leader>/",
        "<CMD>lua require('neogen').generate()<CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Generate Doc Strings",
      },
    },
  },
  {
    "ojroques/nvim-bufdel",
    keys = {
      { "<Leader>d", "<CMD>BufDel<CR>", mode = "n" },
    },
  }, -- dont close split when closing buffer
  {
    "simnalamburt/vim-mundo",
    keys = {
      {
        "<Leader>m",
        "<CMD>MundoToggle<CR>",
        mode = "n",
        silent = true,
      },
    },
  }, -- undo tree
  {
    "FooSoft/vim-argwrap",
    keys = {
      { "<Leader>w", "<CMD>ArgWrap<CR>", mode = "n", silent = true },
    },
  }, -- auto inline/multiline args
  {
    "inkarkat/vim-ReplaceWithRegister",
    keys = {
      { "<Leader>p",  "<Plug>ReplaceWithRegisterOperator", mode = "n" },
      { "<Leader>pp", "<Plug>ReplaceWithRegisterLine",     mode = "n" },
      { "<Leader>p",  "<Plug>ReplaceWithRegisterVisual",   mode = "x" },
    },
  },                    -- ez replace motion with register contents
  "markonm/traces.vim", -- live subst preview
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  }, -- improved % matching
  {
    "anuvyklack/pretty-fold.nvim",
    event = "VeryLazy",
    config = function()
      require("pretty-fold").setup({})
    end,
  }, -- foldinggg
  {
    "monaqa/dial.nvim",
    event = "VeryLazy",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.date.alias["%m/%d/%Y"],
          augend.date.new({
            pattern = "%a, %b %d %Y",
            default_kind = "day",
            only_valid = true,
            word = false,
          }),
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      })

      vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
      vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
      vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
      vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
      vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
      vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
    end,
  }, -- easy inc/dec/toggling of types
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>sr",
        "<CMD>lua require('ssr').open()<CR>",
        mode = { "n", "x" },
        desc = "Structural Search and Replace",
      },
    },
    module = "ssr",
    config = function()
      require("ssr").setup({
        border = "rounded",
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_confirm = "<cr>",
          replace_all = "<leader><cr>",
        },
      })
    end,
  },
}
