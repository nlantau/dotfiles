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

fpath=($HOME/.config/functions $fpath)
autoload ez fa fd fdr fe gp gs s

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

