filetype plugin on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Colors
syntax on
colorscheme embark

lua <<EOF
  require('options')
EOF


" Others
so ~/dotfiles/neovim/after/options/fzf.vim
so ~/dotfiles/neovim/after/options/coc.vim
