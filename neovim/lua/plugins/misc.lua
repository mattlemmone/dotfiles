return {
  "MunifTanjim/nui.nvim",                                     -- ui
  { "nvim-lua/plenary.nvim",            lazy = true },        -- misc lua functions
  { "kristijanhusak/vim-carbon-now-sh", event = "VeryLazy" }, -- Screenshot and upload code to carbon.now.sh
  { "metakirby5/codi.vim",              event = "VeryLazy" }, -- live eval mode
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },
  {
    "michaelb/sniprun",
    event = "VeryLazy",
    build = "bash install.sh",
    config = function()
      require("sniprun").setup({
        display = {
          "NvimNotify", --# display with the nvim-notify plugin
        },
      })
    end,
  }, -- execute lines of selected code
}
