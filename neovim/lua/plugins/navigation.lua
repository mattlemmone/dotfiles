return {
  {
    "echasnovski/mini.bracketed",
    config = function()
      require("mini.bracketed").setup()
    end,
  }, -- navigation using brackets. TS nodes, conflicts, comments, diag, files, bufs, windows...
  {
    "echasnovski/mini.starter",
    branch = "stable",
    config = function()
      require("mini.starter").setup({
        header = [[

  .-.                       .-.              .-. .-.
  : :                       : :             .' `.: :
  : `-.  .--.  .--. .-..-.  : `-. .--.  .--.`. .': `-.  .--. .--.
  : .. :' '_.'' '_.': :; :  ' .; :: ..'' .; :: : : .. :' '_.': ..'
  :_;:_;`.__.'`.__.'`._. ;  `.__.':_;  `.__.':_; :_;:_;`.__.':_;
                     .-. :
                     `._.'
                             😮🙂
    ]]   ,
        footer = "",
      })
    end,
  },
  "elihunter173/dirbuf.nvim",
  {
    "folke/persistence.nvim",
    config = function()
      local keymap = vim.keymap
      require("persistence").setup()

      keymap.set("n", "<Leader>ls", "<CMD>lua require('persistence').load()<CR>")
      keymap.set("n", "<Leader>ll", "<CMD>lua require('persistence').load({last= true})<CR>")
    end,
  }, -- session mgmt
  {
    "ggandor/leap.nvim",

    config = function()
      require("leap").add_default_mappings()
    end,
  }, -- ez motion
  "jinh0/eyeliner.nvim", -- f/F indicators
}
