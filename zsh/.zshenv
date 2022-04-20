export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad
export COLORTERM=truecolor
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

export VIMINIT="source ${XDG_CONFIG_HOME}/vim/vimrc"
export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export KUBECONFIG="${XDG_CONFIG_HOME}/kube/config"
export VAGRANT_HOME="${XDG_CONFIG_HOME}/vagrant"
export VAGRANT_ALIAS_FILE="${XDG_CONFIG_HOME}/vagrant/aliases"
export ANSIBLE_VAULT_PASSWORD_FILE="${HOME}/.ansible/.keyfile"

unsetopt MULTIOS
setopt MAGIC_EQUAL_SUBST
setopt BSD_ECHO
setopt INTERACTIVE_COMMENTS
setopt PROMPT_SUBST
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# ssh agent
plugins=(git ssh-agent)
if [ -z "${SSH_AUTH_SOCK}" ] ; then
	eval `ssh-agent -s`
fi
if [[ `ssh-add -l` = *"agent has no identities"* ]] ; then
	ssh-add "${HOME}/.ssh/id_rsa"
fi

# git aware prompt
export GITAWAREPROMPT="${ZDOTDIR}/extensions/git-aware-prompt"
source "${GITAWAREPROMPT}/main.sh"

# end
