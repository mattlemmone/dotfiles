#!/bin/bash
alias vim='nvim'

# Git
alias gc='git checkout'
alias gb='git branch'
alias gp='git pull'
alias gs='git status'
alias gd='git diff'
alias dotfiles='nvim ~/dotfiles'

# Docker
alias docker_tty='docker exec -it $(docker ps | fzf -e --header-lines=1 --reverse | cut -d" " -f1) bash'
alias docker_logs='docker logs -f $(docker ps | fzf -e --header-lines=1 --reverse | cut -d" " -f1)'

# Kubernetes
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'
alias kd='kubectl describe' 

# Terraform
alias tf='terraform'
alias tfw='terraform workspace'
alias tfv='terraform validate'
alias tfi='terraform init'

# Everything else
alias ls='eza --icons'
alias rm='rip'
alias rm_undo='rip -s'

# Obsidian
alias edit_personal_notes="pushd /Users/$USER/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/iOS\ Vault; vim .; popd"
