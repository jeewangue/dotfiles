export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

HISTSIZE=100000
HIST_STAMPS="mm/dd/yyyy"

plugins=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions vi-mode common-aliases)
plugins+=(tmux git git-flow k z dotenv timer)
plugins+=(gpg-agent)
plugins+=(docker docker-compose kubectl helm)
plugins+=(npm yarn)
plugins+=(ruby gem rvm)
plugins+=(pip pipenv)
plugins+=(aws)

# User configuration
# make path to have unique values
typeset -U path
path+=($HOME/bin $HOME/.yarn/bin $HOME/.local/bin $HOME/.dotnet/tools $HOME/.luarocks/bin)
fpath+=($ZSH/custom/completions)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export GPG_TTY=$(tty)

eval "$(pyenv init -)"

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jeewangue/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jeewangue/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jeewangue/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jeewangue/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda deactivate

