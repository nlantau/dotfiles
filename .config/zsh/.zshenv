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
export MYVIMRC="$HOME/.vimrc"
export VIMRC="$HOME/.vimrc"
source "$HOME/.cargo/env"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# Metasploit
PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/metasploit-framework/bin

# OpenJDK & Haskell
export PATH="/usr/local/opt/openjdk/bin:$PATH"
[ -f "/Users/nlantau/.ghcup/env" ] && source "/Users/nlantau/.ghcup/env" # ghcup-env

# Go
export PATH="/usr/local/go/bin:$PATH"


# Setting PATH for Python 3.8
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# Term
export TERM=xterm-256color
tmux source-file $HOME/.tmux.conf
