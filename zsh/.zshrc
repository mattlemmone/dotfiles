source ~/dotfiles/misc/aliases.sh
source ~/dotfiles/misc/exports.sh
source ~/dotfiles/misc/funcs/bash.sh
source ~/dotfiles/misc/funcs/yabai.sh
source ~/dotfiles/misc/funcs/git.sh
source ~/dotfiles/misc/.secrets

eval $(ssh-agent) &>/dev/null
[ -f ~/.ssh/github ] && ssh-add --apple-use-keychain ~/.ssh/github > /dev/null 2>&1
[ -f ~/dotfiles/misc/wolt.sh ] && source ~/dotfiles/misc/wolt.sh

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh

# Zsh
## Load plugin manager - must come before plugins
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load ~/dotfiles/zsh/plugins.txt
source ~/dotfiles/zsh/options.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/dotfiles/misc/bob.zsh

eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/Users/matt/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Shell-GPT integration ZSH v0.2
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh
# Shell-GPT integration ZSH v0.2

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# yazi wrapper
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rip -- "$tmp"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
