if [ -f "${ZDOTDIR}/.zprofile.before" ]; then
	source "${ZDOTDIR}/.zprofile.before"
fi

# =====================================================================

# tmux workaround
if [ -z "${TMUX}" ] ; then
	export PATH="${KREW_ROOT}/bin:${GEM_BIN}:${GOBIN}:${M2}:${XDG_CONFIG_HOME}/git/commands:${PATH}"
fi

# custom functions
yml2env() {
	yq -o p "$1" | awk '{gsub(/\./,"_",$1)}{print toupper($1)$2$3}'
}

# =====================================================================

if [ -f "${ZDOTDIR}/.zprofile.after" ]; then
	source "${ZDOTDIR}/.zprofile.after"
fi
