if [ -f "${ZDOTDIR}/.zlogin.before" ]; then
	source "${ZDOTDIR}/.zlogin.before"
fi

# =====================================================================



# =====================================================================

if [ -f "${ZDOTDIR}/.zlogin.after" ]; then
	source "${ZDOTDIR}/.zlogin.after"
fi
