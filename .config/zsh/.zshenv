#!/usr/bin/zsh

# Default programs
export EDITOR="vim"
export VISUAL="vim"

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
export SCHOOLDIR="$HOME/Dropbox/Skola/7_mot_ingenjor"

# Vim
export NVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"
export MYVIMRC="$HOME/.vimrc"
export AOC_SESSION="53616c7465645f5f4122b94ebe4a0e58c08f7a9b5b99d857fc9bacb83aa815dfdcc82f4f213f3f951fb3267397fb90e8"
source "$HOME/.cargo/env"
