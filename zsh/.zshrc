export PROMPT='%{$bldcyn%}%~%{$txtrst$txtcyn%}$git_branch%{$bldgrn%}$git_ahead_mark$git_ahead_count%{$bldred%}$git_behind_mark$git_behind_count%{$bldylw%}$git_stash_mark%{$txtrst$txtylw%}$git_dirty$git_dirty_count%{$txtcyn%}$git_staged_mark$git_staged_count%{$txtpur%}$git_unknown_mark$git_unknown_count%{$txtrst%}$ ' # %n@%m

# aliases
if [ -f "${ZDOTDIR}/.zsh_aliases" ]; then
	source "${ZDOTDIR}/.zsh_aliases"
fi
alias ll='ls -alhFT'
alias treee='tree -halFpugD'
alias vim='nvim'

# auto completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
_complete_alias() {
	[[ -n $PREFIX ]] && compadd -- ${(M)${(k)galiases}:#$PREFIX*}
	return 1
}
zstyle ':completion:*' completer _complete _ignored _complete_alias
zstyle ':completion:*' rehash true

complete -o nospace -C /opt/homebrew/bin/terraform terraform
# end
