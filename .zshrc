export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"

COMPLETION_WAITING_DOTS="true"

HISTSIZE=100000
HIST_STAMPS="mm/dd/yyyy"

plugins=(git brew autojump zsh-syntax-highlighting common-aliases ruby rails rvm pip python virtualenvwrapper) 

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'

alias ta='tmux attach -t '

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.SIGMA_ENV
source ~/.personal

# COMPLETION SETTINGS
# add custom completion scripts
fpath=(~/.zsh/completion $fpath)

# compsys initialization
autoload -U compinit
compinit
 
# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2
zstyle ":completion:*:descriptions" format "%B%d%b"

