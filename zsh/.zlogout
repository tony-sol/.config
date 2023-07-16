if [ -f "${ZDOTDIR}/.zlogout.before" ]; then
	source "${ZDOTDIR}/.zlogout.before"
fi

# =====================================================================



# =====================================================================

if [ -f "${ZDOTDIR}/.zlogout.after" ]; then
	source "${ZDOTDIR}/.zlogout.after"
fi
