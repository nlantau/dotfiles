# nlantau .zshrc 

# AUTOLOAD
autoload -Uz compinit && compinit	# Completion
autoload -U colors && colors		# Colored prompt output
autoload -Uz vcs_info 			    # Git prompt 
precmd() { vcs_info } 
# ZSTYLE
zstyle ':vcs_info:git:*' formats "%{$fg[red]%}%s%{$reset_color%} %b" 
zstyle ':completion:*' completer _complete _approximate

# SETOPT
setopt PROMPT_SUBST
setopt autocd

# PS1 & RPS1
PROMPT='λ $fg[green]%1~ $reset_color% > '
RPROMPT='${vcs_info_msg_0_}' 

# ALIAS
alias vz="nvim $HOME/.zshrc"
alias vn="nvim $HOME/.config/nvim/init.vim"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias l="ls -G"
alias ls="ls -G"
alias la="ls -aG"
alias ll="ls -lahG"
alias c="clear"
alias grep="ggrep --color"
alias d="deactivate"

# Git bare
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Directory aliases
alias g="cd $HOME/Docs/GitHub/"
alias da="cd $HOME/Docs/GitHub/DA110FHT20/"

# Application Aliases with dev/null and disown
alias code='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron > /dev/null 2>&1 &!'
alias discord='/Applications/Discord.app/Contents/MacOS/Discord > /dev/null 2>&1 &!'
alias subl='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text > /dev/null 2>&1 &!'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
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






# end

