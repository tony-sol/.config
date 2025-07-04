# vim: foldmethod=marker

if [ -f "${ZDOTDIR}/.zshrc.before" ]; then
	source "${ZDOTDIR}/.zshrc.before"
fi

# =====================================================================

# setup PATHs ==================================================== {{{
function __prepend_path {
	local path=$1
	shift
	for value in $@
	do
		if [[ ":${path}:" == *:"$value":* ]]; then
			path="${path//$value/}"
		fi
		path="${value}${path+:${path//::/:}}"
	done
	echo ${${path#:}%:}
}

if [[ -d "${HOMEBREW_PREFIX}/bin" ]]; then
	export PATH=$(__prepend_path $PATH "${HOMEBREW_PREFIX}/sbin" "${HOMEBREW_PREFIX}/bin")
	export FPATH=$(__prepend_path $FPATH "${HOMEBREW_PREFIX}/share/zsh/site-functions")
	export MANPATH=$(__prepend_path $MANPATH "${HOMEBREW_PREFIX}/share/man")
	export INFOPATH=$(__prepend_path $INFOPATH "${HOMEBREW_PREFIX}/share/info")
fi

export PATH=$(__prepend_path $PATH $DOTNET_CLI_TOOLS $GOBIN $CARGO_BIN $GEM_BIN $KREW_BIN $MASON_BIN "${PYTHONUSERBASE}/bin" $XDG_BIN_HOME)
(( $+commands[mise] )) && source <(mise activate zsh)
export FPATH=$(__prepend_path $FPATH "${ZDOTDIR}/plugins/zsh-completions/src" "${ZDOTDIR}/plugins/zsh-autocomplete/Completions")
# }}}

# zsh vi mode with cursor style ======================================= {{{
function zle-keymap-select zle-line-init {
	case "${KEYMAP}" in
		vicmd)
			print -n -- '\033[2 q'
			;;
		viins|main)
			print -n -- '\033[6 q'
			;;
	esac
	zle reset-prompt
	zle -R
}

function zle-line-finish {
	print -n -- '\033[2 q'
}

setopt VI
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
# }}}
# prompt ============================================================== {{{
autoload -Uz colors && colors
# '\U2714'='✔︎'; '\U2718'='✘'
export PROMPT='%{$fg_bold[cyan]%}%~%{$reset_color%} $([ $? -ne 0 ] && echo -e "%{$fg_bold[red]%}\U2718" || echo -e "%{$fg_bold[green]%}\U2714")%{$reset_color%} $ '
export RPROMPT='%{$fg_bold[green]%}$git_ahead_mark$git_ahead_count%{$fg_bold[red]%}$git_behind_mark$git_behind_count%{$fg_bold[cyan]%}$git_stash_mark$git_stash_count%{$fg_bold[yellow]%}$git_dirty_mark$git_dirty_count%{$fg_bold[blue]%}$git_staged_mark$git_staged_count%{$fg_bold[magenta]%}$git_unknown_mark$git_unknown_count%{$reset_color%}%{$fg[cyan]%} $git_branch$(exit_code=$?; [[ $exit_code -ne 0 ]] && echo -e " %{$fg_bold[red]%}$exit_code") %{$fg[cyan]%}%D{%H:%M:%S}%{$reset_color%}'
# }}}
# zsh plugins ========================================================= {{{
source "${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main root brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[alias]="fg=blue"

source "${ZDOTDIR}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
bindkey "\t" menu-select "${terminfo}[kcbt]" menu-select
bindkey -M menuselect "\t" menu-complete "${terminfo}[kcbt]" reverse-menu-complete
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-complete
zstyle ':autocomplete:*' fzf-completion yes
zstyle -e ':autocomplete:*' list-lines 'reply=( $(( LINES / 3 )) )'

source "${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"

source "${ZDOTDIR}/plugins/zsh-lazyload/zsh-lazyload.plugin.zsh"

source "${ZDOTDIR}/plugins/zsh-ssh/zsh-ssh.plugin.zsh"

source "${ZDOTDIR}/plugins/git-aware-prompt/main.sh" # @todo remove
# }}}
# hacks =============================================================== {{{
# @note macos's ssh-agent doen't export SSH_AGENT_PID, set it manually
# @warn envs are not persistent, use `eval $(ssh-agent -k)` to avoid orphaned instances
# @todo probably should be removed
if [[ $(ps ax | grep 'ssh-agent' | grep -v grep) ]]; then
	[[ -z "${SSH_AGENT_PID}" ]] \
		&& export SSH_AGENT_PID=$(ps ax -o pid,command | awk '$2 ~ "ssh-agent" {print $1}') \
		|| true
else
	eval "$($(which ssh-agent) -s)"
fi

if (( $+commands[mise] )); then
	# @note get lua install location as system rocks_tree
	__lua=$(mise where lua 2>/dev/null) && {
		export LUAROCKS_HOME="${__lua}/luarocks"
	} && unset __lua
	# @note get mvn install location
	__maven=$(mise where maven 2>/dev/null) && {
		export MAVEN_HOME="${__maven}"
		export MVN_HOME="${MAVEN_HOME}"
		export M3_HOME="${MAVEN_HOME}"
		export M2_HOME="${MAVEN_HOME}"
	} && unset __maven
fi

# @note use bat output only if bat installed
if (( $+commands[bat] )); then
	export MANPAGER="sh -c 'col -bx | bat --style=plain --language=man'"
	alias -g -- --help="--help 2>&1 | bat --paging=never --language=help --style=plain"
	alias -g -- help="help 2>&1 | bat --paging=never --language=help --style=plain"
	view() { for arg in $@; do $XDG_CONFIG_HOME/fzf/fzf-preview $arg; [[ "$arg" =~ "$@[-1]" ]] || echo; done }
fi

# @note fzf doesn't support theme files, load them into vars
local __fzf_theme_tokyonight_night=$(<"${XDG_CONFIG_HOME}/fzf/themes/tokyonight-night")
local __fzf_theme_tokyonight_day=$(<"${XDG_CONFIG_HOME}/fzf/themes/tokyonight-day")

# @note per-system hacks
case $(uname -s) in
	[Dd]arwin )
		alias fzf='fzf --color=$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo $__fzf_theme_tokyonight_night || echo $__fzf_theme_tokyonight_day)'
		del() { mv "$@" ~/.Trash }
		get_secret_note() { security find-generic-password -C note -s "$1" -w | xxd -revert -plain | yq --input-format xml --prettyPrint '.plist.dict.string' }
		;;
	[Ll]inux )
		alias fzf='fzf --color=$__fzf_theme_tokyonight_night'
		del() { mv "$@" "${XDG_DATA_HOME}/Trash" }
		;;
esac
# }}}
# aliases ============================================================= {{{
alias l='ls -AF'
alias ll='l -hl'
alias tt='tree -halFpugND'
alias t='tt -L 1'
# }}}
# keymappings ========================================================= {{{
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
# }}}
# auto completion ===================================================== {{{
autoload -Uz compinit && compinit -C
autoload -Uz +X bashcompinit && bashcompinit -C
_complete_alias() {
	[[ -n $PREFIX ]] && compadd -- ${(M)${(k)galiases}:#$PREFIX*}
	return 1
}
zstyle ':completion:*' completer _complete _ignored _complete_alias
zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose yes
# }}}
# hooks =============================================================== {{{
(( $+commands[fzf] )) && source <(fzf --zsh)
# }}}

# =====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
