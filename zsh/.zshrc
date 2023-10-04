if [ -f "${ZDOTDIR}/.zshrc.before" ]; then
	source "${ZDOTDIR}/.zshrc.before"
fi

# =====================================================================

function unshift_path() {
	local path=$1
	shift
	for value in $@
	do
		if [[ ":${path}:" == *:"$value":* ]]
		then path="${path//$value/}"
		fi
		path="${value}${path+:${path//::/:}}"
	done
	echo ${${path#:}%:}
}

# setup FPATH
export FPATH=$(unshift_path $FPATH "${HOMEBREW_PREFIX}/share/zsh/site-functions" "${ZDOTDIR}/extensions/zsh-completions/src" "${ZDOTDIR}/extensions/zsh-autocomplete/Completions")

# setup PATH
export PATH=$(unshift_path $PATH "${HOMEBREW_PREFIX}/sbin" "${HOMEBREW_PREFIX}/bin" $M2 $DOTNET_CLI_TOOLS $GOBIN $GEM_BIN $RTX_SHIMS $KREW_BIN $XDG_BIN_HOME)

# setup MANPATH
export MANPATH=$(unshift_path $MANPATH "${HOMEBREW_PREFIX}/share/man")

# setup INFOPATH
export INFOPATH=$(unshift_path $INFOPATH "${HOMEBREW_PREFIX}/share/info")

# ssh agent
if [ -z "${SSH_AUTH_SOCK}" ] ; then
	eval `ssh-agent -P "${HOMEBREW_PREFIX}/lib/*"` > /dev/null
fi
if ! ps -p ${SSH_AGENT_PID:-0} 2>&1 > /dev/null ; then
	unset SSH_AGENT_PID
fi
export SSH_AGENT_PID=${SSH_AGENT_PID:-`pgrep -x ssh-agent`}
if [[ `ssh-add -l` = *"agent has no identities"* ]] ; then
	ssh-add "${HOME}/.ssh/id_rsa"
fi

# U+2714 ✔︎
# U+2718 ✘
export PROMPT='%{$bldcyn%}%~%{$txtrst%}%{$txtcyn%}$git_branch%{$bldgrn%}$git_ahead_mark$git_ahead_count%{$bldred%}$git_behind_mark$git_behind_count%{$bldcyn%}$git_stash_mark%{$bldylw%}$git_dirty$git_dirty_count%{$bldblu%}$git_staged_mark$git_staged_count%{$bldpur%}$git_unknown_mark$git_unknown_count%{$txtrst%} $([ $? -ne 0 ] && echo -e "%{$bldred%}\U2718" || echo -e "%{$bldgrn%}\U2714")%{$txtrst%} $ '
export RPROMPT='$(exit_code=$?; [[ $exit_code -ne 0 ]] && echo %{$bldred%}$exit_code%{$txtrst%}) %{$bldcyn%}%D{%Y-%m-%d %H:%M:%S}%{$txtrst%}'

# aliases
alias l='ls -AF'
alias ll='l -hl'
alias tt='tree -halFpugD'
alias t='tt -L 1'

# commands replacements
alias vim='nvim'
alias cat='bat --paging=never'
alias less='bat --paging=always'

eval "$(rtx activate)"

# hacks
export TERMINFO_DIRS="$(brew --prefix ncurses)/share/terminfo:${TERMINFO_DIRS:-}"
export ASDF_DIR="$(brew --prefix asdf)/libexec"
alias yarn="yarn --use-yarnrc ${XDG_CONFIG_HOME}/yarn/yarnrc"
alias wget="wget --hsts-file ${XDG_STATE_HOME}/wget/wget-hsts"

# keymappings
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
source "$(brew --prefix fzf)/shell/key-bindings.zsh"

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
lazyload fzf -- 'source "$(brew --prefix fzf)/shell/completion.zsh"'
lazyload pip3 -- 'source <(pip3 completion --zsh)'
lazyload molecule -- 'source <(_MOLECULE_COMPLETE=zsh_source molecule)'
lazyload npm -- 'source <(npm completion)'
lazyload gh -- 'source <(gh completion --shell=zsh)'
lazyload werf -- 'source <(werf completion --shell=zsh)'
lazyload kubectl -- 'source <(kubectl completion zsh)'
lazyload kubectl-krew -- 'source <(kubectl-krew completion zsh)'
lazyload minikube -- 'source <(minikube completion zsh)'
lazyload kind -- 'source <(kind completion zsh)'
lazyload helm -- 'source <(helm completion zsh)'
lazyload helmfile -- 'source <(helmfile completion zsh)'
lazyload helmwave -- 'source <(helmwave completion zsh)'
lazyload opa -- 'source <(opa completion zsh)'
lazyload conftest -- 'source <(conftest completion zsh)'
lazyload kube-linter -- 'source <(kube-linter completion zsh)'
lazyload trivy -- 'source <(trivy completion zsh)'
lazyload syft -- 'source <(syft completion zsh)'
lazyload octosql -- 'source <(octosql completion zsh)'
lazyload tsh -- 'source <(tsh --completion-script-zsh)'

complete -o nospace -C "${HOMEBREW_PREFIX}/bin/terraform" terraform
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/vault" vault
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/consul" consul
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/nomad" nomad
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/waypoint" waypoint

# =====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
