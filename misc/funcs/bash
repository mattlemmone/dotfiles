#!/bin/bash

# fzf -> nvim
fzfd(){
    fd $1 | fzf --preview "bat --color=always {}" | xargs -o nvim
}

# rg -> nvim
vg(){
    _rg $1 | xargs -o nvim
}

# rg -> bat
bg(){
    _rg $1 bat
}

_rg(){
  rg $1 --line-number --no-heading -o |
      fzf --delimiter ":" --preview "echo {2} | xargs expr -5 + |  xargs -I $ bat --color=always {1} -H {2} --line-range $:" | 
      cut -d : -f 1 |
      xargs $2 
}


