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
      -- Optional, customize how names/IDs for new notes are created.
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
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
