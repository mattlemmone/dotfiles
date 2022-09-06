set rtp+=/usr/local/opt/fzf
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let $FZF_DEFAULT_COMMAND =  "rg --files"

let $FZF_DEFAULT_OPTS=
    \'
    \ --color=fg:#cbccc6,bg:#1f2430,hl:#707a8c 
    \ --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
    \ --color=info:#73d0ff,prompt:#707a8c,pointer:#ffcc66
    \ --color=marker:#cbccc6,spinner:#73d0ff,header:#d4bfff
    \ --ansi
    \ --preview "bat --color=always --style=header,grid --line-range :300 {}"
    \ --margin=1,4
    \ --layout=reverse
    \'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" required for quickfix list in fzf search!
let g:fzf_history_dir = '~/.vim/.fzf-history'
