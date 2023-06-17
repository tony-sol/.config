if [ -f "${ZDOTDIR}/.zshrc.before" ]; then
	source "${ZDOTDIR}/.zshrc.before"
fi

# =====================================================================

# U+2714 ✔︎
# U+2718 ✘
export PROMPT='%{$bldcyn%}%~%{$txtrst%}%{$txtcyn%}$git_branch%{$bldgrn%}$git_ahead_mark$git_ahead_count%{$bldred%}$git_behind_mark$git_behind_count%{$bldcyn%}$git_stash_mark%{$bldylw%}$git_dirty$git_dirty_count%{$bldblu%}$git_staged_mark$git_staged_count%{$bldpur%}$git_unknown_mark$git_unknown_count%{$txtrst%} $([ $? -ne 0 ] && echo -e "%{$bldred%}\U2718" || echo -e "%{$bldgrn%}\U2714")%{$txtrst%} $ '
export RPROMPT='$(exit_code=$?; [[ $exit_code -ne 0 ]] && echo %{$bldred%}$exit_code%{$txtrst%})'
export RPROMPT="${RPROMPT} %{$bldcyn%}%D{%Y-%m-%d %H:%M:%S}%{$txtrst%}"

# aliases
alias l='ls -AF'
alias ll='l -hl'
alias tt='tree -halFpugD'
alias t='tt -L 1'

# replace commands with "modern" alternatives
cat() {
	bat_executable=$(whence -p bat)
	if [[ -x $bat_executable ]]; then
		$bat_executable --paging=never $@
	else
		$(whence -p cat) $@
	fi
}
less() {
	bat_executable=$(whence -p bat)
	if [[ -x $bat_executable ]]; then
		$bat_executable --paging=always $@
	else
		$(whence -p less) $@
	fi
}
vim() {
	nvim_executable=$(whence -p nvim)
	if [[ -x $nvim_executable ]]; then
		$nvim_executable $@
	else
		$(whence -p vim) $@
	fi
}

# direnv setup
source <(direnv hook zsh)

# nvm setup
# nvm() {
# 	unfunction "$0"
# 	local prefix=$(brew --prefix nvm)
# 	source "${prefix}/nvm.sh"
# 	source "${prefix}/etc/bash_completion.d/nvm"
# 	$0 "$@"
# }

# hacks
export TERMINFO_DIRS="$(brew --prefix ncurses)/share/terminfo:${TERMINFO_DIRS:-}"
alias yarn="yarn --use-yarnrc ${XDG_CONFIG_HOME}/yarn/yarnrc"

# keymappings
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# auto completion
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
_complete_alias() {
	[[ -n $PREFIX ]] && compadd -- ${(M)${(k)galiases}:#$PREFIX*}
	return 1
}
zstyle ':completion:*' completer _complete _ignored _complete_alias
zstyle ':completion:*' rehash true

# zsh extensions completion
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-complete
zstyle ':autocomplete:*' fzf-completion yes
zstyle -e ':autocomplete:*' list-lines 'reply=( $(( LINES / 3 )) )'

# other completions
# source "$(brew --prefix fzf)/shell/completion.zsh"
if [ $commands[fzf] ]; then
	fzf() { unfunction "$0"; source "$(brew --prefix fzf)/shell/completion.zsh"; $0 "$@"; }
fi
# source <(pip3 completion --zsh)
if [ $commands[pip3] ]; then
	pip3() { unfunction "$0"; source <(pip3 completion --zsh); $0 "$@"; }
fi
# source <(_MOLECULE_COMPLETE=zsh_source molecule)
if [ $commands[molecule] ]; then
	molecule() { unfunction "$0"; source <(_MOLECULE_COMPLETE=zsh_source molecule); $0 "$@"; }
fi
# source <(npm completion)
if [ $commands[npm] ]; then
	npm() { unfunction "$0"; source <(npm completion); $0 "$@"; }
fi
# source <(gh completion --shell zsh)
if [ $commands[gh] ]; then
	gh() { unfunction "$0"; source <(gh completion --shell zsh); $0 "$@"; }
fi
# source <(werf completion --shell zsh)
if [ $commands[werf] ]; then
	werf() { unfunction "$0"; source <(werf completion --shell zsh); $0 "$@"; }
fi
# source <(kubectl completion zsh)
if [ $commands[kubectl] ]; then
	kubectl() { unfunction "$0"; source <(kubectl completion zsh); $0 "$@"; }
fi
# source <(minikube completion zsh)
if [ $commands[minikube] ]; then
	minikube() { unfunction "$0"; source <(minikube completion zsh); $0 "$@"; }
fi
# source <(kompose completion zsh)
if [ $commands[kompose] ]; then
	kompose() { unfunction "$0"; source <(kompose completion zsh); $0 "$@"; }
fi
# source <(helm completion zsh)
if [ $commands[helm] ]; then
	helm() { unfunction "$0"; source <(helm completion zsh); $0 "$@"; }
fi
# source <(helmfile completion zsh)
if [ $commands[helmfile] ]; then
	helmfile() { unfunction "$0"; source <(helmfile completion zsh); $0 "$@"; }
fi
# source <(helmwave completion zsh)
if [ $commands[helmwave] ]; then
	helmwave() { unfunction "$0"; source <(helmwave completion zsh); $0 "$@"; }
fi
# source <(opa completion zsh)
if [ $commands[opa] ]; then
	opa() { unfunction "$0"; source <(opa completion zsh); $0 "$@"; }
fi
# source <(conftest completion zsh)
if [ $commands[conftest] ]; then
	conftest() { unfunction "$0"; source <(conftest completion zsh); $0 "$@"; }
fi
# source <(kube-linter completion zsh)
if [ $commands[kube-linter] ]; then
	kube-linter() { unfunction "$0"; source <(kube-linter completion zsh); $0 "$@"; }
fi
# source <(trivy completion zsh)
if [ $commands[trivy] ]; then
	trivy() { unfunction "$0"; source <(trivy completion zsh); $0 "$@"; }
fi
# source <(octosql completion zsh)
if [ $commands[octosql] ]; then
	octosql() { unfunction "$0"; source <(octosql completion zsh); $0 "$@"; }
fi
# complete -o nospace -C "${HOMEBREW_PREFIX}/bin/terraform" terraform
if [ $commands[terraform] ]; then
	terraform() { unfunction "$0"; complete -o nospace -C "${HOMEBREW_PREFIX}/bin/terraform" terraform; $0 "$@"; }
fi
# complete -o nospace -C "${HOMEBREW_PREFIX}/bin/vault" vault
if [ $commands[vault] ]; then
	vault() { unfunction "$0"; complete -o nospace -C "${HOMEBREW_PREFIX}/bin/vault" vault; $0 "$@"; }
fi
# complete -o nospace -C "${HOMEBREW_PREFIX}/bin/consul" consul
if [ $commands[consul] ]; then
	consul() { unfunction "$0"; complete -o nospace -C "${HOMEBREW_PREFIX}/bin/consul" consul; $0 "$@"; }
fi

# =====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
