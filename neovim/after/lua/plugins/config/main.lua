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
require("plugins.config.catppuccin")
require("plugins.config.completion")
require("plugins.config.diffview")
require("plugins.config.lsp")
require("plugins.config.persistence")
require("plugins.config.statusline")
require("plugins.config.telescope")
-- require("plugins.config.tundra")
require("plugins.config.vim-plug")

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

-- require("fidget").setup({
--   text = { spinner = "dots" },
--   align = { bottom = false },
--   window = {
--     relative = "win", -- where to anchor, either "win" or "editor"
--     blend = 100, -- &winblend for the window
--     zindex = 1, -- the zindex value for the window
--     border = "rounded", -- style of border for the fidget window
--   },
-- })

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

require("mkdnflow").setup()
require("mini.bracketed").setup()
require("scrollbar").setup()
require("symbols-outline").setup()
local augend = require("dial.augend")
require("dial.config").augends:register_group({
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.date.alias["%m/%d/%Y"],
    augend.constant.alias.bool,
    augend.semver.alias.semver,
  },
})
vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
require("noice").setup({
  routes = {
    -- Hide 'saved' msgs
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    -- Hide virtual search text
    {
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
  },
})
require("marks").setup({ default_mappings = true })
require("glow").setup()
require("sniprun").setup({
  display = {
    -- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

    -- "VirtualText",             --# display results as virtual text
    "TempFloatingWindow", --# display results in a floating window
    -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
    -- "Terminal",                --# display results in a vertical split
    -- "TerminalWithCode",        --# display results and code history in a vertical split
    "NvimNotify", --# display with the nvim-notify plugin
    -- "Api"                      --# return output to a programming interface
  },
})

require("neural").setup({
  source = {
    openai = {
      api_key = vim.env.OPENAI_API_KEY,
    },
  },
})
