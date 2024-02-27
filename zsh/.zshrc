if [ -f "${ZDOTDIR}/.zshrc.before" ]; then
	source "${ZDOTDIR}/.zshrc.before"
fi

# =====================================================================

# zsh extensions
source "${ZDOTDIR}/extensions/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# setup PATHs
function __prepend_path() {
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

export FPATH=$(__prepend_path $FPATH "${HOMEBREW_PREFIX}/share/zsh/site-functions" "${ZDOTDIR}/extensions/zsh-completions/src" "${ZDOTDIR}/extensions/zsh-autocomplete/Completions")
export PATH=$(__prepend_path $PATH "${HOMEBREW_PREFIX}/sbin" "${HOMEBREW_PREFIX}/bin" $M2 $DOTNET_CLI_TOOLS $GOBIN $GEM_BIN $MISE_SHIMS $KREW_BIN $XDG_BIN_HOME)
export MANPATH=$(__prepend_path $MANPATH "${HOMEBREW_PREFIX}/share/man")
export INFOPATH=$(__prepend_path $INFOPATH "${HOMEBREW_PREFIX}/share/info")

unfunction __prepend_path

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
export PROMPT='%{$bldcyn%}%~%{$txtrst%} $([ $? -ne 0 ] && echo -e "%{$bldred%}\U2718" || echo -e "%{$bldgrn%}\U2714")%{$txtrst%} $ '
export RPROMPT='%{$bldgrn%}$git_ahead_mark$git_ahead_count%{$bldred%}$git_behind_mark$git_behind_count%{$bldcyn%}$git_stash_mark%{$bldylw%}$git_dirty$git_dirty_count%{$bldblu%}$git_staged_mark$git_staged_count%{$bldpur%}$git_unknown_mark$git_unknown_count%{$txtrst%}%{$txtcyn%}$git_branch $(exit_code=$?; [[ $exit_code -ne 0 ]] && echo %{$bldred%}$exit_code)%{$txtrst%}'

# aliases
alias l='ls -AF'
alias ll='l -hl'
alias tt='tree -halFpugD'
alias t='tt -L 1'

# commands replacements
alias vim='nvim'
alias cat='bat --paging=never'
alias less='bat --paging=always'
alias -g -- --help='--help 2>&1 | bat --paging=never --language=help --style=plain'

eval "$(mise activate $(basename -- ${SHELL}))"

# hacks
export TERMINFO_DIRS="$(brew --prefix ncurses)/share/terminfo:${TERMINFO_DIRS:-}"
alias yarn="yarn --use-yarnrc ${XDG_CONFIG_HOME}/yarn/yarnrc"

# keymappings
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "\t" menu-select "${terminfo}[kcbt]" menu-select
bindkey -M menuselect "\t" menu-complete "${terminfo}[kcbt]" reverse-menu-complete
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
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-complete
zstyle ':autocomplete:*' fzf-completion yes
zstyle -e ':autocomplete:*' list-lines 'reply=( $(( LINES / 3 )) )'
source "$(brew --prefix fzf)/shell/completion.zsh"

# lazyload completions
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
lazyload mise -- 'source <(mise completion zsh)'
lazyload sg -- 'source <(sg completions zsh)'

complete -o nospace -C "${HOMEBREW_PREFIX}/bin/tofu" tofu
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/terraform" terraform
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/vault" vault
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/consul" consul
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/nomad" nomad
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/waypoint" waypoint

# =====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
