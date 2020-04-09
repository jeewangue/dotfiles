export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

HISTSIZE=100000
HIST_STAMPS="mm/dd/yyyy"

# ZSH plugins
plugins=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions vi-mode common-aliases)
# common
plugins+=(tmux git git-flow autojump dotenv timer)
# auths
# plugins+=(ssh-agent gpg-agent keychain)
# container
plugins+=(docker docker-compose kubectl helm)
# ruby
# plugins+=(ruby gem)
# python
# plugins+=(pipenv)
# others
# plugins+=(aws)

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.local/bin:$PATH"

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
alias tb='taskbook'
alias pm='pulsemixer'

autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# nvim alias
if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
fi

# unalias fd for find
unalias fd
