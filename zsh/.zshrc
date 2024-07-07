if [ -f "${ZDOTDIR}/.zshrc.before" ]; then
	source "${ZDOTDIR}/.zshrc.before"
fi

# =====================================================================

# zsh plugins
source "${ZDOTDIR}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# setup PATHs
export FPATH=$(__prepend_path $FPATH "${HOMEBREW_PREFIX}/share/zsh/site-functions" "${ZDOTDIR}/plugins/zsh-completions/src" "${ZDOTDIR}/plugins/zsh-autocomplete/Completions")
export PATH=$(__prepend_path $PATH "${HOMEBREW_PREFIX}/sbin" "${HOMEBREW_PREFIX}/bin" $M2 $DOTNET_CLI_TOOLS $GOBIN $GEM_BIN $MISE_SHIMS $KREW_BIN $MASON_BIN $XDG_BIN_HOME)
export MANPATH=$(__prepend_path $MANPATH "${HOMEBREW_PREFIX}/share/man")
export INFOPATH=$(__prepend_path $INFOPATH "${HOMEBREW_PREFIX}/share/info")

# ssh agent
if [ -z "${SSH_AUTH_SOCK}" ] ; then
	eval `ssh-agent -P "${HOMEBREW_PREFIX}/lib/*"` > /dev/null
fi
if ! ps -p ${SSH_AGENT_PID:-0} 2>&1 > /dev/null ; then
	unset SSH_AGENT_PID
fi
export SSH_AGENT_PID=${SSH_AGENT_PID:-`pgrep -x ssh-agent`}
if [[ `ssh-add -l` = *"agent has no identities"* ]] ; then
	ssh-add "${HOME}/.ssh/id_ed25519"
fi

# prompt
autoload -U colors && colors
export PROMPT='%{$fg_bold[cyan]%}%~%{$reset_color%} $([ $? -ne 0 ] && echo -e "%{$fg_bold[red]%}$__MARK_ERROR" || echo -e "%{$fg_bold[green]%}$__MARK_SUCCESS")%{$reset_color%} $ '
export RPROMPT='%{$fg_bold[green]%}$git_ahead_mark$git_ahead_count%{$fg_bold[red]%}$git_behind_mark$git_behind_count%{$fg_bold[cyan]%}$git_stash_mark$git_stash_count%{$fg_bold[yellow]%}$git_dirty_mark$git_dirty_count%{$fg_bold[blue]%}$git_staged_mark$git_staged_count%{$fg_bold[magenta]%}$git_unknown_mark$git_unknown_count%{$reset_color%}%{$fg[cyan]%}$git_branch$(exit_code=$?; [[ $exit_code -ne 0 ]] && echo -e " %{$fg_bold[red]%}$exit_code")%{$reset_color%}'

# hacks
case $(uname -s) in
	[Dd]arwin )
		export __BAT_THEME="--theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo tokyonight-night || echo tokyonight-day)"
		local __fzf_tokyonight_night='--color=bg+:#283457,bg:#16161e,border:#27a1b9,fg:#c0caf5,gutter:#16161e,header:#ff9e64,hl+:#2ac3de,hl:#2ac3de,info:#545c7e,marker:#ff007c,pointer:#ff007c,prompt:#2ac3de,query:#c0caf5:regular,scrollbar:#27a1b9,separator:#ff9e64,spinner:#ff007c'
		local __fzf_tokyonight_day='--color=bg+:#b7c1e3,bg:#d0d5e3,border:#4094a3,fg:#3760bf,gutter:#d0d5e3,header:#b15c00,hl+:#188092,hl:#188092,info:#8990b3,marker:#d20065,pointer:#d20065,prompt:#188092,query:#3760bf:regular,scrollbar:#4094a3,separator:#b15c00,spinner:#d20065'
		export __FZF_THEME=$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo $__fzf_tokyonight_night || echo $__fzf_tokyonight_day)
		del() { mv "$@" ~/.Trash }
		;;
	[Ll]inux )
		del() { mv "$@" "${XDG_DATA_HOME}/Trash" }
		;;
esac
export TERMINFO_DIRS="$(brew --prefix ncurses)/share/terminfo${TERMINFO_DIRS:+:$TERMINFO_DIRS}"
export MANPAGER="sh -c 'col -bx | bat --style=plain --language=man ${__BAT_THEME}'"
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} ${__FZF_THEME}"
alias ctop='TERM="${TERM/tmux/xterm}" ctop'

# aliases
alias l='ls -AF'
alias ll='l -hl'
alias tt='tree -halFpugND'
alias t='tt -L 1'

# commands replacements
alias vim='nvim'
alias cat="bat --paging=never ${__BAT_THEME}"
alias less="bat --paging=always ${__BAT_THEME}"
alias -g -- -h="-h 2>&1 | bat --paging=never --language=help --style=plain ${__BAT_THEME}"
alias -g -- --help="--help 2>&1 | bat --paging=never --language=help --style=plain ${__BAT_THEME}"
alias -g -- help="help 2>&1 | bat --paging=never --language=help --style=plain ${__BAT_THEME}"

# keymappings
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "\t" menu-select "${terminfo}[kcbt]" menu-select
bindkey -M menuselect "\t" menu-complete "${terminfo}[kcbt]" reverse-menu-complete

# auto completion
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
_complete_alias() {
	[[ -n $PREFIX ]] && compadd -- ${(M)${(k)galiases}:#$PREFIX*}
	return 1
}
zstyle ':completion:*' completer _complete _ignored _complete_alias
zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose yes
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-complete
zstyle ':autocomplete:*' fzf-completion yes
zstyle -e ':autocomplete:*' list-lines 'reply=( $(( LINES / 3 )) )'

# lazyload completions
lazyload pip3 -- 'source <(pip3 completion --zsh)'
lazyload molecule -- 'source <(_MOLECULE_COMPLETE=zsh_source molecule)'
lazyload npm -- 'source <(npm completion)'
lazyload gh -- 'source <(gh completion --shell=zsh)'
lazyload glab -- 'source <(glab completion --shell=zsh)'
lazyload werf -- 'source <(werf completion --shell=zsh)'
lazyload limactl -- 'source <(limactl completion zsh)'
lazyload kubectl -- 'source <(kubectl completion zsh)'
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
lazyload tailscale -- 'source <(tailscale completion zsh)'

complete -o nospace -C "${HOMEBREW_PREFIX}/bin/tofu" tofu

complete -o nospace -C "${HOMEBREW_PREFIX}/bin/terraform" terraform
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/vault" vault
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/consul" consul
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/nomad" nomad
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/waypoint" waypoint
complete -o nospace -C "${HOMEBREW_PREFIX}/bin/packer" packer

# hooks
source <(fzf --zsh)
source <(mise activate zsh)
source "${HOMEBREW_LIBRARY}/Taps/homebrew/homebrew-command-not-found/handler.sh" || true

# =====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
