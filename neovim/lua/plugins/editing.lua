return {
  {
    "terrastruct/d2-vim", -- D2 syntax support
    "fladson/vim-kitty",  -- syntax for kitty terminal config
    "tpope/vim-abolish",  -- easy abbrevs, subversion
    "tpope/vim-commentary", -- commenting
    "tpope/vim-repeat",
    "tpope/vim-surround",
    {
      -- doc strings
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
        },
      },
    },
    {
      "junegunn/vim-easy-align",
      keys = {
        {
          -- Start interactive EasyAlign in visual mode (e.g. vipga)
          "ga",
          "<Plug>(EasyAlign)",
          mode = "x",
        },

        {
          -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
          "ga",
          "<Plug>(EasyAlign)",
          mode = "n",
        },
      },
    },
    opts = {},
    config = nil,
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
    "fatih/vim-go",
    keys = {},
    opts = {},
    config = function()
      local g = vim.g

      g.go_highlight_build_constraints = 1
      g.go_highlight_functions = 1
      g.go_highlight_interfaces = 1
      g.go_highlight_methods = 1
      g.go_highlight_operators = 1
      g.go_highlight_structs = 1
    end,
  },
  {
    "inkarkat/vim-ReplaceWithRegister",
    keys = {
      { "<Leader>p",  "<Plug>ReplaceWithRegisterOperator", mode = "n" },
      { "<Leader>pp", "<Plug>ReplaceWithRegisterLine",     mode = "n" },
      { "<Leader>p",  "<Plug>ReplaceWithRegisterVisual",   mode = "x" },
    },
  },                        -- ez replace motion with register contents
  "junegunn/vim-easy-align", -- align text around tokens
  "markonm/traces.vim",     -- live subst preview
  {
    "mizlan/iswap.nvim",
    keys = {
      { "<Leader>i", "<CMD>ISwap<CR>", mode = "n" },
    },
  }, -- swap args, lines, objects
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  }, -- improved % matching
  {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require("pretty-fold").setup({})
    end,
  }, -- foldinggg
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({ default_mappings = true })
    end,
  }, -- marks
  {
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.date.alias["%m/%d/%Y"],
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
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    module = "ssr",
    -- Calling setup is optional.
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

      vim.keymap.set({ "n", "x" }, "<leader>sr", function()
        require("ssr").open()
      end)
    end,
  },
}
