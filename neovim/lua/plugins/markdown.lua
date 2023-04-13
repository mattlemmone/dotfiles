return {
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup()
    end,
  },
  {
    "jakewvincent/mkdnflow.nvim",
    config = function()
      require("mkdnflow").setup({
        mappings = {
          MkdnEnter = { { "n", "v" }, "<CR>" },
          MkdnTab = { { "n" }, "<Tab>" },
          MkdnSTab = false,
          MkdnNextLink = false,
          MkdnPrevLink = false,
          MkdnNextHeading = { "n", "]]" },
          MkdnPrevHeading = { "n", "[[" },
          MkdnGoBack = false,
          MkdnGoForward = false,
          MkdnCreateLink = false, -- see MkdnEnter
          MkdnCreateLinkFromClipboard = false,
          MkdnFollowLink = false, -- see MkdnEnter
          MkdnDestroyLink = false,
          MkdnTagSpan = false,
          MkdnMoveSource = false,
          MkdnYankAnchorLink = false,
          MkdnYankFileAnchorLink = false,
          MkdnIncreaseHeading = { "n", "+" },
          MkdnDecreaseHeading = { "n", "-" },
          MkdnToggleToDo = { { "n", "v" }, "<C-k>" },
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
