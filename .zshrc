export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true

COMPLETION_WAITING_DOTS=true
HISTSIZE=100000
HIST_STAMPS="mm/dd/yyyy"

plugins=(git autojump common-aliases)
plugins+=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions)
plugins+=(vi-mode)

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.yarn/bin"
fpath=(~/.zsh/completion $fpath)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR=vim
export GPG_TTY=$(tty)

bindkey 'OA' history-beginning-search-backward
bindkey 'OB' history-beginning-search-forward

# aliases
alias ta='tmux attach -t '
alias mux='tmuxinator'


# ADD By Goznauk 190805
# Play safe!
alias 'rm=rm -i'
alias 'rmdir=rm -rfi'
alias 'mv=mv -i'
alias 'cp=cp -i'

# Typing errors...
alias 'cd..=cd ..'

# Convinence
alias 'l=ls -F'
alias 'la=ls -AF'
alias 'lal=ls -alF'
alias 'v=vim'







autoload -U compinit && compinit

