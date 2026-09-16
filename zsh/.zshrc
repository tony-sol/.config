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
fpath=( "${ZDOTDIR}/plugins/zasync" "${ZDOTDIR}/plugins/zsh-completions/src" $fpath[@] )
manpath=( $manpath[@] )
infopath=( $infopath[@] )
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
setopt PROMPT_SUBST
setopt VI
# }}}
# prompt ========================================================= {{{
function zle-keymap-select zle-line-init {
	case "${KEYMAP}" in
		# '\U276E'='❮'
		vicmd)      psvar[1]=$'\U276E'; print -n -- '\033[2 q' ;;
		# '\U276F'='❯'
		viins|main) psvar[1]=$'\U276F'; print -n -- '\033[6 q' ;;
	esac
	zle reset-prompt
	zle -R
}

function zle-line-finish {
	print -n -- '\033[2 q'
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# @see https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
# %(!,A,B)  - use A if shell running with privileges, B otherwise
# %S/%s     - start/stop standout mode
# %B/%b     - start/stop bold text
# %F{C}/%f  - start/stop using foreground Color
# %~        - current working directory
# %(N?,A,B) - use A if exit status of the last command was N (default N is 0), B otherwise
# %Nv       - psvar[N] (default N is 1)
export PROMPT='%(!,%S,)%B%F{cyan}%~ %(?,%F{green},%F{red})%v%b%f%(!,%s,) '
# %?    - return status of the last command
# %D{f} - current date in f-string format
#   %H  - the hour as a decimal number using a 24-hour clock
#   %M  - the minute as a decimal number
#   %S  - the second as a decimal number
export RPROMPT='%(?,,%B%F{red}%?%b%f )%F{cyan}%D{%H:%M:%S}%f'

# @todo https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information
source "${ZDOTDIR}/plugins/git-aware-prompt/main.sh"
export RPROMPT="%B%F{green}\$git_ahead_mark\$git_ahead_count%F{red}\$git_behind_mark\$git_behind_count%F{cyan}\$git_stash_mark\$git_stash_count%F{yellow}\$git_dirty_mark\$git_dirty_count%F{blue}\$git_staged_mark\$git_staged_count%F{magenta}\$git_unknown_mark\$git_unknown_count%b%F{cyan} \$git_branch%f $RPROMPT"
# }}}
# plugins ======================================================== {{{
## syntax highlighting =========================================== {{{
source "${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main root brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[alias]="fg=blue"
## }}}
## autocomplete ================================================== {{{
autoload -Uz zasync

source "${ZDOTDIR}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# KEY       | $terminfo[] | RAW  | APP
# Up        | kcuu1       | ^[[A | ^[0A
# Down      | kcud1       | ^[[B | ^[0B
# Right     | kcuf1       | ^[[C | ^[0C
# Left      | kcub1       | ^[[D | ^[0D
# Tab       | kctab       | ^I   | ^I
# Shift+Tab | kcbt        | ^[[Z | ^[[Z
bindkey               '^I' menu-select   '^[[Z' menu-select
bindkey -M menuselect '^I' menu-complete '^[[Z' reverse-menu-complete

zstyle    ':autocomplete:*' insert-unambiguous yes
zstyle    ':autocomplete:*' widget-style menu-complete
zstyle    ':autocomplete:*' fzf-completion yes
zstyle -e ':autocomplete:*' list-lines 'reply=( $(( LINES / 3 )) )'

function _complete_alias() {
	[[ -n $PREFIX ]] && compadd -- ${(M)${(k)galiases}:#$PREFIX*}
	return 1
}

zstyle ':completion:*' completer _complete _ignored _complete_alias
zstyle ':completion:*' rehash yes
zstyle ':completion:*' verbose yes
## }}}
## autosuggestions =============================================== {{{
source "${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
## }}}
## lazyload ====================================================== {{{
source "${ZDOTDIR}/plugins/zsh-lazyload/zsh-lazyload.plugin.zsh"
## }}}
# }}}
# autoload ssh keys ============================================== {{{
if [[ -z "${SSH_CONNECTION}" ]]; then
	ssh-add -ql >/dev/null || find ~/.ssh/keys -type f -and -not -iname '*.pub' -and -not -iname '*.ppk' -exec ssh-add -q {} \; 2>/dev/null
fi
# }}}
# tools ========================================================== {{{
## fzf =========================================================== {{{
if (( $+commands[fzf] )); then
	export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME}/fzf/config"
	export FZF_DEFAULT_OPTS="--color=$(<"${XDG_CONFIG_HOME}/fzf/themes/${COLORTHEME}-${COLORSCHEME}")"
	export FZF_DEFAULT_COMMAND="fd --follow --hidden --no-ignore --exclude=.git/ --color=auto"
	export FZF_COMPLETION_TRIGGER='~~'
	#export FZF_COMPLETION_OPTS=''
	export FZF_COMPLETION_PATH_OPTS='--preview "$XDG_CONFIG_HOME/fzf/fzf-preview {}"'
	export FZF_COMPLETION_DIR_OPTS='--preview "$XDG_CONFIG_HOME/fzf/fzf-preview {}"'
	export FZF_CTRL_R_OPTS='--input-border=none'
	export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND} --type file --type symlink --type socket"
	export FZF_CTRL_T_OPTS='--preview "$XDG_CONFIG_HOME/fzf/fzf-preview {}"'
	export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND} --type directory"
	export FZF_ALT_C_OPTS='--preview "$XDG_CONFIG_HOME/fzf/fzf-preview {}"'

	function _fzf_comprun() {
		local command=$1
		shift
		case "$command" in
			ssh)
				fzf --preview 'ssh -T -G $(cut -f 1 -d " " <<< {}) | grep -i -E "^user |^hostname |^port |^identityfile |^controlmaster |^forwardagent |^localforward |^remoteforward |^proxycommand |^proxyjump "' "$@"
				;;
			*) fzf "$@" ;;
		esac
	}
	source <(fzf --zsh)
fi
## }}}
## bat =========================================================== {{{
if (( $+commands[bat] )); then
	export BAT_THEME="${COLORTHEME}-${COLORSCHEME}"
	export MANROFFOPT="-c"
	export MANPAGER="sh -c 'col -bx | bat --paging=always --language=man --style=plain'"
	alias -g -- --help="--help 2>&1 | bat --paging=never --language=help --style=plain"
	alias -g -- help="help 2>&1 | bat --paging=never --language=help --style=plain"
fi
## }}}
## vivid ========================================================= {{{
## @todo replace? remove?
if (( $+commands[vivid] )); then
	export LS_COLORS=$(vivid generate "${COLORTHEME}-${COLORSCHEME}")
fi
## }}}
# }}}
# aliases ======================================================== {{{
alias l='ls --almost-all --color=auto --classify=auto'
alias ll='l -l --human-readable'
alias disks='lsblk -o UUID,PARTUUID,NAME,LABEL,PARTLABEL,TYPE,MOUNTPOINT,SIZE,FSTYPE,FSSIZE'

if (( $+commands[tree] )); then
	alias tt='tree -a -l --metafirst -N -p -u -g -h -D -F --dirsfirst'
	alias t='tt -L 1'
fi

if (( $+commands[eza] )); then
	alias ee='eza --long --tree --classify=auto --color=auto --icons=auto --follow-symlinks --almost-all --group-directories-first --smart-group --time=changed --git --git-repos'
	alias e='ee --level 1'
fi

if (( $+commands[nvim] )); then
	export EDITOR=nvim
	export VISUAL=nvim
	alias vim="nvim"
fi

if (( $+commands[ctop] )); then
	alias ctop='TERM="${TERM/tmux/screen}" ctop'
fi
# }}}
# functions ====================================================== {{{
function view() {
	for arg in "$@"; do
		$XDG_CONFIG_HOME/fzf/fzf-preview "$arg";
		[[ "$arg" =~ "$@[-1]" ]] || echo;
	done
}
# }}}

# ====================================================================

if [ -f "${ZDOTDIR}/.zshrc.after" ]; then
	source "${ZDOTDIR}/.zshrc.after"
fi
