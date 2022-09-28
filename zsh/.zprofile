if [ -z "${TMUX}" ] ; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="${GEM_HOME}/bin:${GOPATH}/bin:${PATH}"
	# Added by Toolbox App
	# export PATH="${PATH}:${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"
fi
