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
    event = "BufEnter",
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
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
  }, -- improved 'gx' for opening links, plugin repos, etc
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "AerialToggle",
    keys = {
      {
        "<Leader>t",
        "<CMD>AerialToggle<CR>",
        mode = "n",
        noremap = true,
        silent = true,
      },
    },
    config = function()
      require("aerial").setup({
        layout = {
          min_width = 20
        },
        backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
        default_direction = "prefer_right",
        resize_to_content = true,
        close_on_select = true,
        filter_kind = {
          "Array",
          -- "Boolean",
          "Class",
          -- "Constant",
          "Constructor",
          "Enum",
          -- "EnumMember",
          "Event",
          "Field",
          -- "File",
          "Function",
          "Interface",
          -- "Key",
          "Method",
          "Module",
          "Namespace",
          -- "Null",
          "Number",
          "Object",
          "Operator",
          "Package",
          "Property",
          "String",
          "Struct",
          "TypeParameter",
          -- "Variable",
        },
        highlight_on_hover = true,
        autojump = true,
        manage_folds = true,
        link_folds_to_tree = true,
        link_tree_to_folds = true,
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })

      require("telescope").load_extension("aerial")
    end
  }
}
