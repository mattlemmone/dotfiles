return {
  { import = "plugins.colors" },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
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
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    config = function()
      require("ibl").setup({
      })
    end,
  },
  "norcalli/nvim-colorizer.lua", -- highlight color codes real-time
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
          "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Module",
          "Method",
          "Property",
          "Struct",
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
  },

}
