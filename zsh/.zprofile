if [ -z "${TMUX}" ] ; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="${PATH}:${GOPATH}/bin"
fi
