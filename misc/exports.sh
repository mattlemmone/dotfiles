#!/bin/bash
export BAT_THEME="Catppuccin Mocha"
export BREW_PREFIX=/opt/homebrew
export EDITOR=nvim
export GOPATH=$HOME/go
export PAGER='less'
export SHELL=/bin/zsh

export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$BREW_PREFIX/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH=$HOME/Dev/flutter/bin:$PATH
export PATH=$HOME/.gem/bin:$PATH

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
