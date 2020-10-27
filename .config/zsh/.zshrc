# nlantau .zshrc 

# Source aliases, fzf (incl. functions)
[ -f "${ZDOTDIR}/aliasrc" ] && source "${ZDOTDIR}/aliasrc"
[ -f "${XDG_CONFIG_HOME}/fzf/.fzf.zsh" ] && source "${XDG_CONFIG_HOME}/fzf/.fzf.zsh"

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
autoload -Uz vcs_info				# Git prompt 
precmd() { vcs_info } 

# vi mode
bindkey -v

# Add ~/.config/functions/ to fpath
fpath=($HOME/.config/functions $fpath)
autoload ez fa fd fdr ff gacp gs s38 s39

# setopt
setopt PROMPT_SUBST
#setopt autocd

# PS1 & RPS1
PROMPT="λ %F{green}%1~ %f> "
RPROMPT='${vcs_info_msg_0_}' 

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

