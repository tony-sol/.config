if [ -z "${TMUX}" ] ; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="${KREW_ROOT}/bin:${GEM_HOME}/bin:${GOPATH}/bin:${PATH}"
	# Added by Toolbox App
	# export PATH="${PATH}:${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"
fi

yaml2env() {
	yq -o p "$1" | awk '{gsub(/\./,"_",$1)}{print toupper($1)$2$3}'
}
