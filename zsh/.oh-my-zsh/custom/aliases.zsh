# aliases
alias c='clear -x'
alias ta='tmux attach -t '
alias tb='taskbook'
alias pm='pulsemixer'
alias dcp='docker-compose'

# nvim alias
if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
fi

unalias grv # for grv command (https://github.com/rgburke/grv)
unalias gm  # for gm  command (graphicsmagick)

alias ka='k -a '

alias -g XCLIP='| xclip -selection clipboard'

function withlogs() {
	if [[ ! -d ./logs ]]; then
		mkdir -v ./logs
	fi
	LogDatePrefix=$(date +%F-%H%M%S)
	LogOutFile="./logs/${LogDatePrefix}-${1}.log"
	echo "${${@:q}}" >> ${LogOutFile}
	script --quiet --command "${${@:q}}" --append --log-out ${LogOutFile}
}

alias gpa='git remote | xargs -L1 git push --all'
alias gpat='git remote | xargs -L1 git push --tags'

# https://github.com/stedolan/jq/issues/884#issuecomment-525574290
# Use `jq` with both JSON and non-JSON lines.
function jjq {
    jq -R -r "${1:-.} as \$line | try fromjson catch \$line"
}
