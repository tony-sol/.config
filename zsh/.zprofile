if [ -f "${ZDOTDIR}/.zprofile.before" ]; then
	source "${ZDOTDIR}/.zprofile.before"
fi

# =====================================================================



# =====================================================================

if [ -f "${ZDOTDIR}/.zprofile.after" ]; then
	source "${ZDOTDIR}/.zprofile.after"
fi
