# aliases
alias c='clear -x'
alias ta='tmux attach -t '
alias tb='taskbook'
alias pm='pulsemixer'

# nvim alias
if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
fi

unalias fd  # for fd  command (https://github.com/sharkdp/fd)
unalias k   # for k   command (https://github.com/supercrabtree/k)
unalias grv # for grv command (https://github.com/rgburke/grv)
unalias gm  # for gm  command (graphicsmagick)

alias ka='k -a '

alias -g XCLIP='| xclip -selection clipboard'

function withlogs() {
	if [[ -d ./logs ]]; then
		LogDatePrefix=$(date +%F-%H%M%S)
		LogOutFile="./logs/${LogDatePrefix}-${1}-out.log"
		LogErrFile="./logs/${LogDatePrefix}-${1}-err.log"
		echo "${${@:q}}" >> ${LogOutFile}
		echo "${${@:q}}" >> ${LogErrFile}
		script --quiet --command "${${@:q}}" --append --log-out ${LogOutFile} 2>> ${LogErrFile}
	else
		echo "no logs directory"
	fi
}

alias gpa='git remote | xargs -L1 git push --all'
alias gpat='git remote | xargs -L1 git push --tags'
