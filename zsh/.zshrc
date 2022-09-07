# Zsh
~/Color-Scripts/ghosts

## Load antibody plugin manager - must come before plugins
source <(antibody init)
source ~/dotfiles/zsh/plugins.zsh
source ~/dotfiles/zsh/options.zsh

## Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Everything else
source ~/dotfiles/misc/aliases
source ~/dotfiles/misc/exports
source ~/dotfiles/misc/funcs/bash
source ~/dotfiles/misc/funcs/yabai
source ~/dotfiles/misc/funcs/git

eval $(ssh-agent) >> /dev/null
source ~/dotfiles/misc/.secrets
source ~/dotfiles/misc/doordash
source ~/dotfiles/misc/wolt

source /Users/matt/.config/broot/launcher/bash/br

# Start or resume tmux
[ -z "$TMUX" ] && tmux attach || tmux

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

eval "$(zoxide init zsh)"
