return {
  -- more or less global lua deps
  "MunifTanjim/nui.nvim", -- ui
  "nvim-lua/plenary.nvim", -- misc lua functions
  "nathom/filetype.nvim", -- speed up boot time by optimizing filetype autocmd creation
  "sudormrfbin/cheatsheet.nvim",
  "kristijanhusak/vim-carbon-now-sh", -- Screenshot and upload code to carbon.now.sh
  "metakirby5/codi.vim", -- live eval mode
  {
    "folke/which-key.nvim",

    config = function()
      require("which-key").setup({})
    end,
  },
  -- "glacambre/firenvim", {
  --  build = function(,
  --   vim.fn["firenvim#install"](0)
  --  end,
  --}, -- nvim? in the BROWSER?
  {
    "lewis6991/impatient.nvim",

    config = function()
      require("impatient")
    end, -- keep this at the top
  }, -- lua module caching to improve startup time
  {
    "michaelb/sniprun",
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
