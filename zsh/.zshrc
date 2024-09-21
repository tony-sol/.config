if [ -f "${ZDOTDIR}/.zshrc.before" ]; then
	source "${ZDOTDIR}/.zshrc.before"
fi

# =====================================================================

# zsh plugins
source "${ZDOTDIR}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# setup PATHs
export FPATH=$(__prepend_path $FPATH "${HOMEBREW_PREFIX}/share/zsh/site-functions" "${ZDOTDIR}/plugins/zsh-completions/src" "${ZDOTDIR}/plugins/zsh-autocomplete/Completions")
export PATH=$(__prepend_path $PATH "${HOMEBREW_PREFIX}/sbin" "${HOMEBREW_PREFIX}/bin" $M2 $DOTNET_CLI_TOOLS $GOBIN $GEM_BIN $MISE_SHIMS $KREW_BIN $MASON_BIN "${PYTHONUSERBASE}/bin" $XDG_BIN_HOME)
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
export LUAROCKS_HOME="$(mise where lua)/luarocks"
export TERMINFO_DIRS="$(brew --prefix ncurses)/share/terminfo${TERMINFO_DIRS:+:$TERMINFO_DIRS}"
export MANPAGER="sh -c 'col -bx | bat --style=plain --language=man'"

# per-system hacks
local __fzf_theme_tokyonight_night=$(<"${XDG_CONFIG_HOME}/fzf/themes/tokyonight-night")
local __fzf_theme_tokyonight_day=$(<"${XDG_CONFIG_HOME}/fzf/themes/tokyonight-day")
case $(uname -s) in
	[Dd]arwin )
		alias bat='bat --theme=$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo tokyonight-night || echo tokyonight-day)'
		alias fzf='fzf --color=$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo $__fzf_theme_tokyonight_night || echo $__fzf_theme_tokyonight_day)'
		del() { mv "$@" ~/.Trash }
		;;
	[Ll]inux )
		alias bat='bat --theme=tokyonight-night'
		alias fzf='fzf --color=$__fzf_theme_tokyonight_night'
		del() { mv "$@" "${XDG_DATA_HOME}/Trash" }
		;;
esac

# aliases
alias l='ls -AF'
alias ll='l -hl'
alias tt='tree -halFpugND'
alias t='tt -L 1'

# commands replacements
alias vim='nvim'
alias cat="bat --paging=never"
alias less="bat --paging=always"
alias -g -- -h="-h 2>&1 | bat --paging=never --language=help --style=plain"
alias -g -- --help="--help 2>&1 | bat --paging=never --language=help --style=plain"
alias -g -- help="help 2>&1 | bat --paging=never --language=help --style=plain"

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
lazyload pnpm -- 'source <(pnpm completion zsh)'
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
lazyload fx -- 'source <(fx --comp=zsh)'

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

# zsh plugins
source "${ZDOTDIR}/plugins/zsh-ssh/zsh-ssh.plugin.zsh"

# =====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
