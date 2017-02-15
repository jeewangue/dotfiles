export ZSH=/Users/Treenson/.oh-my-zsh

ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=false
SPACESHIP_NVM_SHOW=false
SPACESHIP_RUBY_SHOW=true

COMPLETION_WAITING_DOTS="true"
HISTSIZE=100000
HIST_STAMPS="mm/dd/yyyy"

plugins=(git brew autojump zsh-syntax-highlighting common-aliases ruby rvm) 

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR=vim

function zle-keymap-select() { zle reset-prompt; zle -R; }
zle -N zle-keymap-select
bindkey -v

bindkey '' history-incremental-pattern-search-backward
bindkey 'OA' history-beginning-search-backward
bindkey 'OB' history-beginning-search-forward
autoload -z edit-command-line
bindkey -M vicmd v edit-command-line

source ~/.personal

# aliases
alias ta='tmux attach -t '

