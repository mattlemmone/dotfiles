return {
  { "ruanyl/vim-gh-line", event = "VeryLazy" }, -- open in gh
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<Leader>gm",
        "<CMD>Gitsigns blame_line<CR>",
        mode = "n",
        noremap = true,
        silent = true,
      },
    },
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
      })
    end,
  }, -- buffer icons and other things
}
