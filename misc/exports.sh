#!/bin/bash
export SHELL=/bin/zsh
export EDITOR=neovide
export PAGER='less'
export GOPATH=$HOME/go

# Path
case $(arch) in
arm64) # Apple Silicon
	export BREW_PREFIX=/opt/homebrew

	;;
i386) # Intel
	export BREW_PREFIX=/usr/local
	;;
esac

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

# Bat
export BAT_THEME="Catppuccin Mocha"
