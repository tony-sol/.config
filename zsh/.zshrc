if [ -f "${ZDOTDIR}/.zshrc.before" ]; then
	source "${ZDOTDIR}/.zshrc.before"
fi

# =====================================================================

# U+2714 ✔︎
# U+2718 ✘
export PROMPT='%{$bldcyn%}%~%{$txtrst%}%{$txtcyn%}$git_branch%{$bldgrn%}$git_ahead_mark$git_ahead_count%{$bldred%}$git_behind_mark$git_behind_count%{$bldcyn%}$git_stash_mark%{$bldylw%}$git_dirty$git_dirty_count%{$bldblu%}$git_staged_mark$git_staged_count%{$bldpur%}$git_unknown_mark$git_unknown_count%{$txtrst%} $([ $? -ne 0 ] && echo -e "%{$bldred%}\U2718" || echo -e "%{$bldgrn%}\U2714")%{$txtrst%} $ '
export RPROMPT='$(exit_code=$?; [[ $exit_code -ne 0 ]] && echo %{$bldred%}$exit_code%{$txtrst%})'

# aliases
alias ll='ls -AlhF'
alias treee='tree -halFpugD'

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

# hacks
export TERMINFO_DIRS="$(brew --prefix ncurses)/share/terminfo:${TERMINFO_DIRS:-}"
source "$(brew --prefix nvm)/nvm.sh"
alias yarn="yarn --use-yarnrc ${XDG_CONFIG_HOME}/yarn/yarnrc"
alias mvn="mvn -gs "${XDG_CONFIG_HOME}"/m2/settings.xml"

# keymappings
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# auto completion
export FPATH="${ZDOTDIR}/extensions/zsh-completions/src:${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}"

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
source "$(brew --prefix nvm)/etc/bash_completion.d/nvm"
source "$(brew --prefix poetry)/etc/bash_completion.d/poetry"
source "$(brew --prefix fzf)/shell/completion.zsh"
source <(pip3 completion --zsh)
source <(npm completion)
source <(kubectl completion zsh)
source <(helm completion zsh)
source <(helmfile completion zsh)
source <(helmwave completion zsh)
source <(opa completion zsh)
source <(kube-linter completion zsh)
source <(conftest completion zsh)
source <(minikube completion zsh)
source <(kompose completion zsh)
source <(gh completion -s zsh)
source <(octosql completion zsh)
source <(_MOLECULE_COMPLETE=zsh_source molecule)
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/terraform" terraform
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/vault" vault
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/consul" consul

# =====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
