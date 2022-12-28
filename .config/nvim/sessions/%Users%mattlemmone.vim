let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +56 dotfiles/neovim/after/lua/lmnlym/plugins/config/lsp.lua
badd +4 Dev/jpdb/sorezore/src/jpdb.ts
badd +31 dotfiles/neovim/after/lua/lmnlym/autocmd.lua
badd +59 dotfiles/neovim/after/lua/lmnlym/plugins/config/telescope.lua
badd +91 dotfiles/neovim/after/lua/lmnlym/mappings.lua
badd +29 dotfiles/neovim/after/lua/lmnlym/plugins/config/completion.lua
argglobal
%argdel
edit Dev/jpdb/sorezore/src/jpdb.ts
argglobal
balt dotfiles/neovim/after/lua/lmnlym/plugins/config/lsp.lua
let s:l = 4 - ((3 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
