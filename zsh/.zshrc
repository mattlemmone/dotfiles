source ~/dotfiles/misc/aliases
source ~/dotfiles/misc/exports
source ~/dotfiles/misc/funcs/bash
source ~/dotfiles/misc/funcs/yabai
source ~/dotfiles/misc/funcs/git
source ~/dotfiles/misc/.secrets

[ -f ~/dotfiles/misc/doordash ] && source ~/dotfiles/misc/doordash
[ -f ~/dotfiles/misc/wolt ] && source ~/dotfiles/misc/wolt

# Start or resume tmux
#[ -z "$TMUX" ] && tmux attach || tmux

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

eval $(ssh-agent) >> /dev/null

# Zsh
## Load antibody plugin manager - must come before plugins
source <(antibody init)
source ~/dotfiles/zsh/plugins.zsh
source ~/dotfiles/zsh/options.zsh

## Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

source ~/.config/broot/launcher/bash/br
