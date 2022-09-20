local keymap = vim.keymap
local fn = vim.fn
local set = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd

g.coc_global_extensions = {
	"coc-css",
	"coc-docker",
	"coc-emoji",
	"coc-html",
	"coc-json",
	"coc-lua",
	"coc-prettier",
	"coc-protobuf",
	"coc-pyright",
	"coc-sh",
	"coc-snippets",
	"coc-tsserver",
	"coc-vimlsp",
	"coc-webpack",
	"coc-xml",
	"coc-yaml",
	"coc-yank",
	"https://github.com/rafamadriz/friendly-snippets@main",
}

-- if hidden is not set, TextEdit might fail.
set.hidden = true

-- Some servers have issues with backup files, see #649
-- set.nobackup=true
-- set.nowritebackup=true

-- Better display for messages
set.cmdheight = 2

-- You will have bad experience for diagnostic messages when it's default 4000.
set.updatetime = 300

-- don't give |ins-completion-menu| messages.
set.shortmess = set.shortmess + "c"

-- always show signcolumns
set.signcolumn = "yes"

function ShowDocumentation()
	if fn.CocAction("hasProvider", "hover") then
		fn.CocActionAsync("doHover")
	else
		fn.feedkeys("K", "in")
	end
end

local function highlight()
	vim.fn.CocActionAsync("highlight")
end

vim.cmd([[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]])

autocmd("CursorHold", {
	pattern = "*",
	callback = highlight,
})

-- mappings
-- Remap keys for applying codeAction to the current buffer.
keymap.set("n", "<Leader>ca", "<Plug>(coc-codeaction)", { silent = true })
keymap.set("n", "<Leader>cac", "<Plug>(coc-codeaction-cursor)", { silent = true })

-- Apply AutoFix to problem on the current line.
keymap.set("n", "<Leader>qf", "<Plug>(coc-fix-current)")

-- Restart Coc.nvim on fuckery
keymap.set("n", "<Leader>CR", "<CMD>CocRestart<CR>", { silent = true })

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect"<CMD> true` in your configuration file.
-- NOTE: Use command ':verbose keymap.set('i', '<tab>' to make sure tab is not mapped by')
-- other plugin before putting this into your config.
keymap.set(
	"i",
	"<TAB>",
	'coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "<Tab>" : coc#refresh()',
	{ silent = true, expr = true }
)
keymap.set("i", "<S-TAB>", 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', { silent = true, expr = true })

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, 'please', make your own choice.
keymap.set(
	"i",
	"<CR>",
	'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"',
	{ silent = true, expr = true }
)

-- Use K to show documentation in preview window.
keymap.set("n", "K", "<CMD>lua ShowDocumentation()<CR>", { silent = true })

--" Navigate errors
keymap.set("n", "<Leader>e", "<CMD>CocDiagnostics<CR>", { silent = true })
keymap.set("n", "gE", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap.set("n", "ge", "<Plug>(coc-diagnostic-next)", { silent = true })
keymap.set("n", "<Leader>co", "<CMD>CocOutline<CR>")

--" Show all errors
keymap.set("n", "<Leader>le", "<CMD><C-u>CocList diagnostics<cr>")

--" Rename instances
keymap.set("n", "<Leader>rn", "<Plug>(coc-rename)")

--" Goto
keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

-- fix CR overlap with nvim pairs: https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin
local npairs = require("nvim-autopairs")

npairs.setup({ map_cr = false })

_G.MUtils = {}

MUtils.completion_confirm = function()
	if vim.fn["coc#pum#visible"]() ~= 0 then
		return vim.fn["coc#pum#confirm"]()
	else
		return npairs.autopairs_cr()
	end
end

-- this must be loaded after nvim-pairs
keymap.set("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
