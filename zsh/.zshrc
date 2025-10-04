# vim: foldmethod=marker

if [ -f "${ZDOTDIR}/.zshrc.before" ]; then
	source "${ZDOTDIR}/.zshrc.before"
fi

# ====================================================================

# setup PATHs ==================================================== {{{
export -TU FPATH fpath
export -TU MANPATH manpath
export -TU INFOPATH infopath
if [[ -d "${HOMEBREW_PREFIX}/share" ]]; then
	fpath=( "${HOMEBREW_PREFIX}/share/zsh/site-functions" $fpath[@] )
	manpath=( "${HOMEBREW_PREFIX}/share/man" $manpath[@] )
	infopath=( "${HOMEBREW_PREFIX}/share/info" $infopath[@] )
fi
fpath=( "${ZDOTDIR}/plugins/zsh-completions/src" $fpath[@] )
# manpath=( $manpath[@] )
# infopath=( $infopath[@] )
# }}}
# zsh vi mode with cursor style ================================== {{{
function zle-keymap-select zle-line-init {
	case "${KEYMAP}" in
		vicmd)
			psvar[1]=$'\U276E'
			print -n -- '\033[2 q'
			;;
		viins|main)
			psvar[1]=$'\U276F'
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
# prompt ========================================================= {{{
setopt PROMPT_SUBST
# '\U276E'='❮'; '\U276F'='❯'
export PROMPT='%(!,%S,)%B%F{cyan}%~ %(?,%F{green},%F{red})%v%b%f%(!,%s,) '
export RPROMPT='%B%F{green}$git_ahead_mark$git_ahead_count%F{red}$git_behind_mark$git_behind_count%F{cyan}$git_stash_mark$git_stash_count%F{yellow}$git_dirty_mark$git_dirty_count%F{blue}$git_staged_mark$git_staged_count%F{magenta}$git_unknown_mark$git_unknown_count%b%F{cyan} $git_branch%(?,, %B%F{red}%?%b%f)%F{cyan} %D{%H:%M:%S}%b%f'
# }}}
# zsh plugins ==================================================== {{{
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
# hacks ========================================================== {{{
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

(( $+commands[fzf] )) && source <(fzf --zsh)
(( $+commands[mise] )) && source <(mise activate zsh)

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
	export MANROFFOPT="-c"
	export MANPAGER="sh -c 'col -bx | bat --style=plain --language=man'"
	alias -g -- --help="--help 2>&1 | bat --paging=never --language=help --style=plain"
	alias -g -- help="help 2>&1 | bat --paging=never --language=help --style=plain"
	view() { for arg in $@; do $XDG_CONFIG_HOME/fzf/fzf-preview $arg; [[ "$arg" =~ "$@[-1]" ]] || echo; done }
fi

# @note per-system hacks
case $(uname -s) in
	[Dd]arwin )
		del() { mv "$@" ~/.Trash }
		get_secret_note() { security find-generic-password -C note -s "$1" -w | xxd -revert -plain | yq --input-format xml --prettyPrint '.plist.dict.string' }
		;;
	[Ll]inux )
		del() { mv "$@" "${XDG_DATA_HOME}/Trash" }
		;;
esac
# }}}
# aliases ======================================================== {{{
alias l='ls -AF'
alias ll='l -hl'
alias tt='tree -halFpugND'
alias t='tt -L 1'
# }}}
# keymappings ==================================================== {{{
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
# }}}
# auto completion ================================================ {{{
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

# ====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
