export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

HISTSIZE=100000
HIST_STAMPS="mm/dd/yyyy"

plugins=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions vi-mode common-aliases)
plugins+=(tmux git git-flow autojump dotenv timer)
plugins+=(ssh-agent gpg-agent keychain)
plugins+=(docker docker-compose kubectl helm)
plugins+=(npm yarn)
plugins+=(ruby gem)
plugins+=(pipenv)
plugins+=(aws)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export LANG=en_US.UTF-8

fpath=(~/.zsh/completion $fpath)
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.local/bin:$PATH"
export EDITOR=vim
export GPG_TTY=$(tty)

# Arrow keys
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
alias def='sdcv'

autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit

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
[ -f ~/.helm.zsh ] && source ~/.helm.zsh
[ -f ~/.eksctl.zsh ] && source ~/.eksctl.zsh

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

# nvm
source /usr/share/nvm/init-nvm.sh

# mcli
complete -o nospace -F /usr/bin/mcli mcli


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

complete -o nospace -C /usr/bin/kustomize kustomize

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

