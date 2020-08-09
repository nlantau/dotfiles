# nlantau .zshrc 

# Source aliases, fzf (incl. functions)
[ -f "${HOME}/.config/zsh/aliasrc" ] && source "${HOME}/.config/zsh/aliasrc"
[ -f "${HOME}/.config/fzf" ] && source "${HOME}/.config/fzf/.fzf"

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# AUTOLOAD
autoload -Uz compinit && compinit	# Completion
autoload -U colors && colors		# Colored prompt output
autoload -Uz vcs_info 			    # Git prompt 
precmd() { vcs_info } 

# SETOPT
setopt PROMPT_SUBST
setopt autocd

# ZSTYLE
zstyle ':vcs_info:git:*' formats "%{$fg[red]%}%s%{$reset_color%} %b" 
zstyle ':completion:*' completer _complete _approximate


# PS1 & RPS1
PROMPT='λ $fg[green]%1~ $reset_color% > '
RPROMPT='${vcs_info_msg_0_}' 

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

# end

# exec zsh
ez() {exec zsh;}

# Activate virtualenv (default DA110FHT20)
s() {source $HOME/.virtualenvs/"${1:-DA110FHT20}"/bin/activate;}

# Git function (default message "update")
gp() {git add --all && git commit -m "${1:-update}" && git push --all;}

# Git status
gs() {git status;}


# FZF functions
# fd - cd to selected directory
fd() {local dir; dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) && cd "$dir";}

# fda - including hidden directories
fa() {local dir; dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir";}


# fdr - cd to selected parent directory
fdr() {local declare dirs=(); get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then; for _dir in "${dirs[@]}"; do echo $_dir; done
    else; get_parent_dirs $(dirname "$1"); fi;}
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac); cd "$DIR";}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}";}



