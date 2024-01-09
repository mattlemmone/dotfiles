local vault_path = vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/iOS Vault/"

return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    event = "BufEnter *.md",
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- latest
    lazy = true,
    open_notes_in = "hsplit",
    event = {
      "BufReadPre " .. vault_path .. "**.md",
      "BufNewFile " .. vault_path .. "**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      daily_notes = {
        folder = "Daily Notes",
        template = "daily.md"
      },
      templates = {
        subdir = "Note Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
      workspaces = {
        {
          name = "iOS Vault",
          path = vault_path
        },

      },
    },
  },
  {
    "jakewvincent/mkdnflow.nvim",
    event = "BufEnter *.md",
    config = function()
      require("mkdnflow").setup({
        mappings = {
          MkdnEnter = false,
          MkdnTab = { { "n" }, "<Tab>" },
          -- MkdnSTab = false,
          MkdnNextLink = false,
          MkdnPrevLink = false,
          -- MkdnNextHeading = { "n", "]]" },
          -- MkdnPrevHeading = { "n", "[[" },
          MkdnGoBack = false,
          MkdnGoForward = false,
          MkdnCreateLink = false, -- see MkdnEnter
          MkdnCreateLinkFromClipboard = { "n", "<Leader><CR>" },
          MkdnFollowLink = false, -- see MkdnEnter
          MkdnDestroyLink = false,
          MkdnTagSpan = false,
          MkdnMoveSource = false,
          MkdnYankAnchorLink = false,
          MkdnYankFileAnchorLink = false,
          MkdnIncreaseHeading = { "n", "+" },
          MkdnDecreaseHeading = { "n", "-" },
          MkdnToggleToDo = { { "n", "v" }, "<CR>" },
          MkdnNewListItem = { "i", "<CR>" }, -- Use this command instead if you only want <CR> in
          MkdnNewListItemBelowInsert = { "n", "o" },
          MkdnNewListItemAboveInsert = { "n", "O" },
          MkdnExtendList = false,
          MkdnUpdateNumbering = false,
          MkdnTableNextCell = false,
          MkdnTablePrevCell = false,
          MkdnTableNextRow = false,
          MkdnTablePrevRow = false,
          MkdnTableNewRowBelow = { "n", "<leader>ir" },
          MkdnTableNewRowAbove = { "n", "<leader>iR" },
          MkdnTableNewColAfter = { "n", "<leader>ic" },
          MkdnTableNewColBefore = { "n", "<leader>iC" },
          MkdnFoldSection = false,
          MkdnUnfoldSection = false,
        },
      })
    end,
  },
}
