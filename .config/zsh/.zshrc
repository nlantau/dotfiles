# nlantau .zshrc 

# Source aliases, fzf (incl. functions)
[ -f "${HOME}/.config/zsh/aliasrc" ] && source "${HOME}/.config/zsh/aliasrc"
[ -f "${HOME}/.config/fzf/.fzf.zsh" ] && source "${HOME}/.config/fzf/.fzf.zsh"

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load completions system
zmodload -i zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ":completion:*" matcher-list 'm:{A-Zöäüa-zÖÄÜ}={a-zÖÄÜA-Zöäü}'
zstyle ':completion:*' special-dirs true

# Git info
zstyle ':vcs_info:git:*' formats "%F{red}%s%f %b" 

# Auto/tab complete, colors & git prompt
autoload -Uz compinit && compinit   # Completion
autoload -U colors && colors		# Colored prompt output
autoload -Uz vcs_info 			    # Git prompt 
precmd() { vcs_info } 


# vi mode
bindkey -v

# vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Add ~/.config/functions/ to fpath
fpath=($HOME/.config/functions $fpath)
autoload ez fa fd fdr ff gp gs s

# setopt
setopt PROMPT_SUBST
#setopt autocd

# PS1 & RPS1
PROMPT="λ %F{green}%1~ %f> "
#PROMPT="$ %1d > "
RPROMPT='${vcs_info_msg_0_}' 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
        __conda_setup="$('/Users/nlantau/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then; eval "$__conda_setup"; else
            if [ -f "/Users/nlantau/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/Users/nlantau/miniconda3/etc/profile.d/conda.sh"
            else; export PATH="/Users/nlantau/miniconda3/bin:$PATH"; fi; fi;
        unset __conda_setup
        # Don't want conda to be activated from start
        conda deactivate; fi

