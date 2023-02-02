if [ -z "${TMUX}" ] ; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="${KREW_ROOT}/bin:${GEM_HOME}/bin:${GOBIN}:${M2}:${XDG_CONFIG_HOME}/git/commands:${PATH}"
	# Added by Toolbox App
	# export PATH="${PATH}:${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"
fi

yml2env() {
	yq -o p "$1" | awk '{gsub(/\./,"_",$1)}{print toupper($1)$2$3}'
}
