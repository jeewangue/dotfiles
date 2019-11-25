export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

HISTSIZE=100000
HIST_STAMPS="mm/dd/yyyy"

plugins=(git git-flow autojump common-aliases)
plugins+=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions vi-mode)
plugins+=(ssh-agent docker-compose kubectl pipenv ruby gem dotenv)

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.yarn/bin"
fpath=(~/.zsh/completion $fpath)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR=vim
export GPG_TTY=$(tty)

bindkey 'OA' history-beginning-search-backward
bindkey 'OB' history-beginning-search-forward
bindkey '[A' history-beginning-search-backward
bindkey '[B' history-beginning-search-forward

# aliases
alias c='clear -x'
alias ta='tmux attach -t '
alias mux='tmuxinator'

autoload -U compinit && compinit

