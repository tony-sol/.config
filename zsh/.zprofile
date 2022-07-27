if [ -z "${TMUX}" ] ; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="${PATH}:${GOPATH}/bin:${GEM_HOME}/bin"
	# Added by Toolbox App
	# export PATH="${PATH}:${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"
fi
