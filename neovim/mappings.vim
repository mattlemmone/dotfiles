" Set this before any leader mappings
let mapleader=" "

" Plugin Mappings
nnoremap <silent> <Leader>n :Neotree focus dir=%:p:h toggle<CR>\|:silent vertical res 30<CR>
nnoremap <F5> :MundoToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Insert Mode Mappings
inoremap jk <ESC>

" Terminal Mode Mappings
tnoremap jk <C-\><C-n>

" Normal Mode Mappings
nnoremap <Leader>O  O<Esc>
nnoremap <Leader>o  o<Esc>

" list open buffers
nnoremap <Leader>b  :Buffers<CR> 
" jump to line in current buffer
nnoremap <Leader>l  :Lines<CR> 
" jump to line in any open buffer
nnoremap <Leader>ll :BLines<CR>
" command history
nnoremap <Leader>ch  :History:<CR> 
" file search
nnoremap <Leader>f  :Files<CR> 
nnoremap <Leader>g  :Commits<CR> 
" file history
nnoremap <Leader>hh  :History<CR> 
" disable highlight
nnoremap <Leader>hl :nohl<CR> 
nnoremap <Leader>r  :so ~/.vimrc<CR>
nnoremap <Leader>s  :Rg<CR>
" search for word under cursor in project
nnoremap <Leader>*  :Rg <C-R><C-W><CR> 
nnoremap <Leader>d  :BD<CR>
nnoremap <silent> <Leader>w :ArgWrap<CR>
nnoremap <F3> :call YarnTest()<CR><CR>

" Merge Conflicts
nnoremap <silent> <F8>  :call gitgud#OpenFilesWithConflicts()<CR>
nnoremap <silent> <F9>  :call gitgud#ResolveWithFirstConflict()<CR>
nnoremap <silent> <F10> :call gitgud#ResolveWithSecondConflict()<CR>
nnoremap <silent> ]c :call gitgud#NextConflictMarker()<CR>
nnoremap <silent> [c :call gitgud#PrevConflictMarker()<CR>

" Copy to clipboard
nnoremap <Leader>y "*yy 
vnoremap <Leader>y "*y 

" Paste from clipboard
nnoremap <Leader>p "*p

" Copy filename to clipboard
nnoremap <silent> <Leader>yf :let @+ = expand("%")<CR>

" coc.nvim
" Remap keys for applying codeAction to the current buffer.
nmap <silent><leader>ca  <Plug>(coc-codeaction)
nmap <silent><leader>cac <Plug>(coc-codeaction-cursor)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Restart Coc.nvim on fuckery
nnoremap <silent> <leader>CR  :<C-u>CocRestart<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

"" Navigate errors
nmap <silent> ee <Plug>(coc-diagnostic-info)
nmap <silent> gE <Plug>(coc-diagnostic-prev)
nmap <silent> ge <Plug>(coc-diagnostic-next)

"" Show all errors
nnoremap <silent> <leader>le :<C-u>CocList diagnostics<cr>

"" Rename instances
nmap <leader>rn <Plug>(coc-rename)

"" Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Split Navigation
nnoremap <Leader>-  :split<CR>
nnoremap <Leader>\| :vsplit<CR>
