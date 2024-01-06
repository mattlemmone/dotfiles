return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    event = "BufEnter *.md",
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- latest
    -- lazy = true,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "iOS Vault",
          path = "/Users/matt/Library/Mobile Documents/iCloud~md~obsidian/Documents/iOS Vault/",
        },

      },

      -- see below for full list of options 👇
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
