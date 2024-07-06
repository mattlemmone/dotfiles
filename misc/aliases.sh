#!/bin/bash
alias vim='nvim'
alias nvim='neovide'

# Git
alias gc='git checkout'
alias gb='git branch'
alias gp='git pull'
alias gs='git status'
alias gd='git diff'
alias dotfiles='nvim ~/dotfiles'

# Docker
alias docker_tty='docker exec -it $(docker ps | fzf -e --header-lines=1 --reverse | cut -d" " -f1) -- bash'
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
alias ls='eza --icons auto'
alias rm='rip'
alias rm_undo='rip -s'

