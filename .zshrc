export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

HISTSIZE=100000
HIST_STAMPS="mm/dd/yyyy"

plugins=(git git-flow autojump common-aliases)
plugins+=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions vi-mode)
plugins+=(ssh-agent docker docker-compose kubectl pipenv ruby gem dotenv)

# User configuration
export PATH="$HOME/bin:$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.yarn/bin:$HOME/.local/bin"
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

eval $(keychain --eval --quiet)
eval "$(pyenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# google cloud completion
CLOUD_SDK_HOME=/opt/google-cloud-sdk
source "${CLOUD_SDK_HOME}/completion.zsh.inc"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export rvm_ignore_gemrc_issues=1

# GARDEN
export PATH="$PATH:$HOME/.garden/bin"

############### before prompt ############
taskbook
gita ll

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
source /usr/share/nvm/init-nvm.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# nvim alias
if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
fi

unalias fd

# go
export GOROOT="/usr/lib/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"

