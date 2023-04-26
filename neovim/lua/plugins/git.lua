return {
  "ruanyl/vim-gh-line", -- open in gh
  "kdheepak/lazygit.nvim",
  {
    "lewis6991/gitsigns.nvim",
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
    config = function()
      local actions = require("diffview.actions")
      local keymap = vim.keymap

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

      keymap.set("n", "<Leader>gf", "<CMD>DiffviewFileHistory<CR>") -- show git history for current buffer
      keymap.set("n", "<Leader>gd", "<CMD>DiffviewOpen<CR>")     -- show modified files
    end,
  },                                                             -- diff mgmt!
}
