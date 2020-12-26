autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

CLOUD_SDK_HOME=/opt/google-cloud-sdk

init_sources=(
	$HOME/.fzf.zsh
	$HOME/.config/tabtab/__tabtab.zsh
	/usr/share/nvm/init-nvm.sh
	${CLOUD_SDK_HOME}/completion.zsh.inc
	/usr/share/z/z.sh
	/etc/bash_completion.d/azure-cli
	/usr/share/bash-completion/completions/gwhisper
)

for i in $init_sources; do
	[[ -f "$i" ]] && source "$i"
done

# kustomize
complete -o nospace -C /usr/bin/kustomize kustomize

