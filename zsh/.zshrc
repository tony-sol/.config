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
# options ======================================================== {{{
setopt INTERACTIVE_COMMENTS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
# }}}
# prompt ========================================================= {{{
setopt PROMPT_SUBST
# '\U276E'='❮'; '\U276F'='❯'
# @see https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
export PROMPT='%(!,%S,)%B%F{cyan}%~ %(?,%F{green},%F{red})%v%b%f%(!,%s,) '
export RPROMPT='%B%F{green}$git_ahead_mark$git_ahead_count%F{red}$git_behind_mark$git_behind_count%F{cyan}$git_stash_mark$git_stash_count%F{yellow}$git_dirty_mark$git_dirty_count%F{blue}$git_staged_mark$git_staged_count%F{magenta}$git_unknown_mark$git_unknown_count%b%F{cyan} $git_branch%(?,, %B%F{red}%?%b%f)%F{cyan} %D{%H:%M:%S}%b%f'
# }}}
# zsh plugin syntax highlighting ================================= {{{
source "${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main root brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[alias]="fg=blue"
# zsh plugin autocomplete ======================================== {{{
source "${ZDOTDIR}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
bindkey "\t" menu-select "${terminfo}[kcbt]" menu-select
bindkey -M menuselect "\t" menu-complete "${terminfo}[kcbt]" reverse-menu-complete
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-complete
zstyle ':autocomplete:*' fzf-completion yes
zstyle -e ':autocomplete:*' list-lines 'reply=( $(( LINES / 3 )) )'
# }}}
# zsh plugin autosuggestions ===================================== {{{
source "${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
# }}}
# zsh plugin lazyload ============================================ {{{
source "${ZDOTDIR}/plugins/zsh-lazyload/zsh-lazyload.plugin.zsh"
# }}}
# zsh plugin ssh ================================================= {{{
source "${ZDOTDIR}/plugins/zsh-ssh/zsh-ssh.plugin.zsh"
# }}}
# zsh plugin git aware prompt ==================================== {{{
# @todo https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information
source "${ZDOTDIR}/plugins/git-aware-prompt/main.sh"
# }}}
# hacks ========================================================== {{{
if [[ -z "${SSH_CONNECTION}" ]]; then
	ssh-add -ql >/dev/null || find ~/.ssh/keys -type f -and -not -iname '*.pub' -and -not -iname '*.ppk' -exec ssh-add -q {} \;
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

# @note use bat wrapper only if bat installed
if (( $+commands[bat] )); then
	export MANROFFOPT="-c"
	export MANPAGER="sh -c 'col -bx | bat --language=man --style=plain'"
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
		(( $+commands[vivid] )) && export LS_COLORS=$(vivid generate "${XDG_CONFIG_HOME}/vivid/themes/${COLORTHEME}-${COLORSCHEME}.yml")
		;;
esac
# }}}
# aliases ======================================================== {{{
alias l='ls --almost-all --color=auto --classify=auto'
alias ll='l -l --human-readable'

# @note use tree aliases only if tree installed
if (( $+commands[tree] )); then
	alias tt='tree -a -l --metafirst -N -p -u -g -h -D -F --dirsfirst'
	alias t='tt -L 1'
fi

# @note use eza aliases only if eza installed
if (( $+commands[eza] )); then
	alias ee='eza --long --tree --classify=auto --color=auto --icons=auto --follow-symlinks --almost-all --group-directories-first --smart-group --time=changed --git --git-repos'
	alias e='ee --level 1'
fi
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
