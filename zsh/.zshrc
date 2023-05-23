source ~/dotfiles/misc/aliases.sh
source ~/dotfiles/misc/exports.sh
source ~/dotfiles/misc/funcs/bash.sh
source ~/dotfiles/misc/funcs/yabai.sh
source ~/dotfiles/misc/funcs/git.sh
source ~/dotfiles/misc/.secrets

eval $(ssh-agent) &>/dev/null
[ -f ~/dotfiles/misc/wolt.sh ] && source ~/dotfiles/misc/wolt.sh
[ -f ~/.ssh/github ] && ssh-add --apple-use-keychain ~/.ssh/github > /dev/null 2>&1

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

# pnpm
export PNPM_HOME="/Users/matt/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
