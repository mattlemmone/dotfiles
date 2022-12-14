source ~/dotfiles/misc/aliases
source ~/dotfiles/misc/exports
source ~/dotfiles/misc/funcs/bash
source ~/dotfiles/misc/funcs/yabai
source ~/dotfiles/misc/funcs/git
source ~/dotfiles/misc/.secrets

eval $(ssh-agent) 
[ -f ~/dotfiles/misc/doordash ] && source ~/dotfiles/misc/doordash
[ -f ~/dotfiles/misc/wolt ] && source ~/dotfiles/misc/wolt

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh

# Zsh
## Load antibody plugin manager - must come before plugins
source <(antibody init)
source ~/dotfiles/zsh/plugins.zsh
source ~/dotfiles/zsh/options.zsh

## Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

# Misc
eval $(thefuck --alias)

source ~/.config/broot/launcher/bash/br

