#!/usr/bin/zsh

# Default programs
export EDITOR="nvim"
export VISUAL="nvim"

# XDG Base Directory 
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# Zsh environment variables
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Special
export GITHUBDIR="$HOME/Docs/GitHub"
export VIRENVDIR="$HOME/.virtualenvs"
export SCHOOLDIR="$HOME/Dropbox/Skola/7.\ Mot\ ingenjör"

# Neovim
export NVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"
