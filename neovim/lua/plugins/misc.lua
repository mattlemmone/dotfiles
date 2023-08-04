return {
  "MunifTanjim/nui.nvim",                                     -- ui
  { "nvim-lua/plenary.nvim",            lazy = true },        -- misc lua functions
  { "kristijanhusak/vim-carbon-now-sh", event = "VeryLazy" }, -- Screenshot and upload code to carbon.now.sh
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },
  -- execute lines of selected code
}
