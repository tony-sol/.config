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

# direnv setup
source <(direnv hook zsh)

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
lazyload fzf -- 'source "$(brew --prefix fzf)/shell/completion.zsh"'
# source <(pip3 completion --zsh)
lazyload pip3 -- 'source <(pip3 completion --zsh)'
# source <(_MOLECULE_COMPLETE=zsh_source molecule)
lazyload molecule -- 'source <(_MOLECULE_COMPLETE=zsh_source molecule)'
# source <(npm completion)
lazyload npm -- 'source <(npm completion)'
# source <(gh completion --shell=zsh)
lazyload gh -- 'source <(gh completion --shell=zsh)'
# source <(werf completion --shell=zsh)
lazyload werf -- 'source <(werf completion --shell=zsh)'
# source <(kubectl completion zsh)
lazyload kubectl -- 'source <(kubectl completion zsh)'
# source <(kubectl-krew completion zsh)
lazyload kubectl-krew -- 'source <(kubectl-krew completion zsh)'
# source <(minikube completion zsh)
lazyload minikube -- 'source <(minikube completion zsh)'
# source <(helm completion zsh)
lazyload helm -- 'source <(helm completion zsh)'
# source <(helmfile completion zsh)
lazyload helmfile -- 'source <(helmfile completion zsh)'
# source <(helmwave completion zsh)
lazyload helmwave -- 'source <(helmwave completion zsh)'
# source <(opa completion zsh)
lazyload opa -- 'source <(opa completion zsh)'
# source <(conftest completion zsh)
lazyload conftest -- 'source <(conftest completion zsh)'
# source <(kube-linter completion zsh)
lazyload kube-linter -- 'source <(kube-linter completion zsh)'
# source <(trivy completion zsh)
lazyload trivy -- 'source <(trivy completion zsh)'
# source <(octosql completion zsh)
lazyload octosql -- 'source <(octosql completion zsh)'
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/terraform" terraform
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/vault" vault
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/consul" consul

# =====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
