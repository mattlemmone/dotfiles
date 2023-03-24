-- Vendor
require("impatient") -- keep this at the top
require("leap").add_default_mappings()
require("nvim-autopairs").setup({})
require("pretty-fold").setup({})
require("which-key").setup({})

-- Needs to be loaded before telescope. Weird race condition causes things to break.
require("neoclip").setup({
  enable_persistent_history = true,
  preview = true,
  default_register = "+",
})

-- Local
require("lmnlym.plugins.config.catppuccin")
require("lmnlym.plugins.config.completion")
require("lmnlym.plugins.config.diffview")
require("lmnlym.plugins.config.lsp")
require("lmnlym.plugins.config.persistence")
require("lmnlym.plugins.config.statusline")
require("lmnlym.plugins.config.telescope")
require("lmnlym.plugins.config.tundra")
require("lmnlym.plugins.config.vim-plug")

require("indent_blankline").setup({
  show_current_context = true,
  show_current_context_start = false,
})

require("nvim-treesitter.configs").setup({
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

require("gitsigns").setup({
  current_line_blame = true,
})

require("bufferline").setup({
  highlights = {
    buffer_selected = { italic = false },
    diagnostic_selected = { italic = false },
    hint_selected = { italic = false },
    pick_selected = { italic = false },
    pick_visible = { italic = false },
    pick = { italic = false },
  },
})

require("fidget").setup({
  text = { spinner = "dots" },
  align = { bottom = false },
  window = {
    relative = "win",   -- where to anchor, either "win" or "editor"
    blend = 100,        -- &winblend for the window
    zindex = 1,         -- the zindex value for the window
    border = "rounded", -- style of border for the fidget window
  },
})

require("mini.starter").setup({
  header = [[

.-.                       .-.              .-. .-.
: :                       : :             .' `.: :
: `-.  .--.  .--. .-..-.  : `-. .--.  .--.`. .': `-.  .--. .--.
: .. :' '_.'' '_.': :; :  ' .; :: ..'' .; :: : : .. :' '_.': ..'
:_;:_;`.__.'`.__.'`._. ;  `.__.':_;  `.__.':_; :_;:_;`.__.':_;
                   .-. :
                   `._.'
                           😮🙂
  ]],
  footer = "",
})
require("mkdnflow").setup({
  mappings = {
    MkdnEnter = { { "n", "v" }, "<CR>" },
    MkdnTab = false,
    MkdnSTab = false,
    MkdnNextLink = { "n", "<Tab>" },
    MkdnPrevLink = { "n", "<S-Tab>" },
    MkdnNextHeading = { "n", "]]" },
    MkdnPrevHeading = { "n", "[[" },
    MkdnGoBack = false,
    MkdnGoForward = false,
    MkdnCreateLink = false, -- see MkdnEnter
    MkdnCreateLinkFromClipboard = false,
    MkdnFollowLink = false, -- see MkdnEnter
    MkdnDestroyLink = { "n", "<M-CR>" },
    MkdnTagSpan = false,
    MkdnMoveSource = false,
    MkdnYankAnchorLink = false,
    MkdnYankFileAnchorLink = false,
    MkdnIncreaseHeading = { "n", "+" },
    MkdnDecreaseHeading = { "n", "-" },
    MkdnToggleToDo = { { "n", "v" }, "<C-k>" },
    MkdnNewListItem = false,
    MkdnNewListItemBelowInsert = { "n", "o" },
    MkdnNewListItemAboveInsert = { "n", "O" },
    MkdnExtendList = false,
    MkdnUpdateNumbering = false,
    MkdnTableNextCell = { "i", "<Tab>" },
    MkdnTablePrevCell = { "i", "<S-Tab>" },
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
require("marks").setup({ default_mappings = true })
require("glow").setup()
require("sniprun").setup({
  display = {
    "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

    -- "VirtualText",             --# display results as virtual text
    "TempFloatingWindow", --# display results in a floating window
    -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
    -- "Terminal",                --# display results in a vertical split
    -- "TerminalWithCode",        --# display results and code history in a vertical split
    "NvimNotify", --# display with the nvim-notify plugin
    -- "Api"                      --# return output to a programming interface
  },
})

require('neural').setup({
    source = {
        openai = {
            api_key = vim.env.OPENAI_API_KEY,
        },
    },
})
