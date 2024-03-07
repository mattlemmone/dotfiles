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
    keys = {
      {
        "<Leader>zn",
        mode = { "n" },
        function() require("utils/input").promptUserForCommandArgs("Create a Note", "ObsidianNew") end,
        desc = "Create a Note",
      },
      {
        "<Leader>zt",
        "<CMD>ObsidianTags<CR>",
        mode = { "n" },
      },
      {
        "<Leader>zr",
        mode = { "n" },
        function() require("utils/input").promptUserForCommandArgs("Rename Note", "ObsidianRename") end,
        desc = "Rename Note"
      }
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
      -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
      ui = {
        enable = true,         -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          -- Replace the above with this if you don't have a patched font:
          -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

          -- You can also add more custom ones...
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = "#f78c6c" },
          ObsidianDone = { bold = true, fg = "#89ddff" },
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
          ObsidianTilde = { bold = true, fg = "#ff5370" },
          ObsidianBullet = { bold = true, fg = "#89ddff" },
          ObsidianRefText = { underline = true, fg = "#c792ea" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#89ddff" },
          ObsidianHighlightText = { bg = "#75662e" },
        },
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
