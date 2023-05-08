export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

HISTSIZE=100000
HIST_STAMPS="mm/dd/yyyy"

plugins=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions vi-mode common-aliases)
plugins+=(tmux git git-flow zsh-z dotenv timer)
plugins+=(copyfile copypath copybuffer)
plugins+=(gpg-agent)
plugins+=(docker docker-compose kubectl helm)
plugins+=(asdf)
plugins+=(npm yarn)
plugins+=(ruby gem)
plugins+=(pip pipenv)
plugins+=(aws)

# User configuration
# make path to have unique values
typeset -U path
path+=($HOME/bin $HOME/.yarn/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/.dotnet/tools $HOME/.luarocks/bin $HOME/Android/Sdk/platform-tools $HOME/Android/Sdk/tools/bin $HOME/Android/Sdk/cmdline-tools/latest/bin)
fpath+=($ZSH/custom/completions)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export GPG_TTY=$(tty)

source $ZSH/oh-my-zsh.sh

# Arrow keys
bindkey 'OA' history-beginning-search-backward
bindkey 'OB' history-beginning-search-forward
bindkey '[A' history-beginning-search-backward
bindkey '[B' history-beginning-search-forward

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

############### before prompt ############
taskbook

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/jeewangue/bin/mc mc

# setting for gup command (auto generate)
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

