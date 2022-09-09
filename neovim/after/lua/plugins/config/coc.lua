local keymap = vim.keymap
local fn = vim.fn
local set = vim.opt
local autocmd = vim.api.nvim_create_autocmd

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
keymap.set("n", "<Leader>CR", ":<C-u>CocRestart<CR>", { silent = true })

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
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
keymap.set("n", "K", ":lua ShowDocumentation()<CR>", { silent = true })

--" Navigate errors
keymap.set("n", "ee", "<Plug>(coc-diagnostic-info)", { silent = true })
keymap.set("n", "gE", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap.set("n", "ge", "<Plug>(coc-diagnostic-next)", { silent = true })

--" Show all errors
keymap.set("n", "<Leader>le", ":<C-u>CocList diagnostics<cr>")

--" Rename instances
keymap.set("n", "<Leader>rn", "<Plug>(coc-rename)")
