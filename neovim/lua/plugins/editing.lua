return {
  "ojroques/nvim-bufdel", -- dont close split when closing buffer
  "simnalamburt/vim-mundo", -- undo tree
  "terrastruct/d2-vim", -- D2 syntax support
  "tpope/vim-abolish", -- easy abbrevs, subversion
  "tpope/vim-commentary", -- commenting
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "FooSoft/vim-argwrap", -- auto inline/multiline args
  "fatih/vim-go",
  "inkarkat/vim-ReplaceWithRegister", -- ez replace motion with register contents
  "junegunn/vim-easy-align", -- align text around tokens
  "markonm/traces.vim", -- live subst preview
  "mizlan/iswap.nvim", -- swap args, lines, objects
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
}
