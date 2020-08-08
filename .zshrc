# nlantau .zshrc 

# AUTOLOAD
autoload -Uz compinit && compinit	# Completion
autoload -U colors && colors		# Colored prompt output
autoload -Uz vcs_info 			    # Git prompt 
precmd() { vcs_info } 
# ZSTYLE
zstyle ':vcs_info:git:*' formats "%{$fg[red]%}%s%{$reset_color%} %b" 
zstyle ':completion:*' completer _complete _approximate
# FZF
[ -f ~/.config/fzf/.fzf ] && source ~/.config/fzf/.fzf
# SETOPT
setopt PROMPT_SUBST
setopt autocd

# PS1 & RPS1
PROMPT='λ $fg[green]%1~ $reset_color% > '
RPROMPT='${vcs_info_msg_0_}' 

# ALIAS
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
        alias vz="nvim $HOME/.zshrc"
        alias vn="nvim $HOME/.config/nvim/init.vim"
        alias grep="ggrep --color"
        alias g="cd $HOME/Docs/GitHub/"
        alias code='/Applications/Visual\ Studio\ Code.app/
                \Contents/MacOS/Electron > /dev/null 2>&1 &!; cd $HOME'
        alias discord='/Applications/
                \Discord.app/Contents/MacOS/Discord > /dev/null 2>&1 &!; cd $HOME'
        alias subl='/Applications/Sublime\ Text.app/Contents/
                \MacOS/Sublime\ Text > /dev/null 2>&1 &!; cd $HOME'
        alias da="cd $HOME/Docs/GitHub/DA110FHT20/"
elif [ "$(uname 2> /dev/null)" != "Darwin" ]; then
        echo "TODO"
fi

alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias l="ls -G"
alias ls="ls -G"
alias la="ls -aG"
alias ll="ls -lahG"
alias c="clear"
alias d="deactivate"

# Git bare
alias dotfiles="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
        __conda_setup="$('/Users/nlantau/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/Users/nlantau/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/Users/nlantau/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/Users/nlantau/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
# <<< conda initialize <<<

        # Don't want conda to be activated from start
        conda deactivate
fi

# Run NeoFetch
neofetch

# Activate virtualenv (default DA110FHT20)
s() {
        source $HOME/.virtualenvs/"${1:-DA110FHT20}"/bin/activate
}

# Git function (default message "update")
gp() {
       git add --all
       git commit -m "${1:-update}"
       git push --all
}


# FZF functions
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
}
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-nvim} "$file"
  fi
}

# end





