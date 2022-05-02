if [ -z "${TMUX}" ] ; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export GOPATH="${HOME}/Projects/go"
	export PATH="${PATH}:${GOPATH}/bin"
fi
