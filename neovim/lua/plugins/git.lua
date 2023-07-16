return {
  { "ruanyl/vim-gh-line", event = "VeryLazy" },    -- open in gh
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
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<Leader>gf",
        "<CMD>DiffviewFileHistory<CR>",
        desc = "Show Git History for Current Buffer",
        mode = "n",
      },
      {
        "<Leader>gd",
        "<CMD>DiffviewOpen<CR>",
        desc = "Show Modified Files",
        mode = "n",
      },
    },
    config = function()
      local actions = require("diffview.actions")

      require("diffview").setup({
        keymaps = {
          disable_defaults = false, -- Disable the default keymaps
          view = {
            -- The `view` bindings are active in the diff buffers, only when the current
            -- tabpage is a Diffview.
            ["gE"] = actions.prev_conflict, -- In the merge_tool: jump to the previous conflict
            ["ge"] = actions.next_conflict, -- In the merge_tool: jump to the next conflict
            ["nn"] = actions.focus_entry,
          },
        },
      })
    end,
  }, -- diff mgmt!
}
