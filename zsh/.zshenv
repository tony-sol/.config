if [ -f "${ZDOTDIR}/.zshenv.before" ]; then
	source "${ZDOTDIR}/.zshenv.before"
fi

# =====================================================================

export SHELL=/bin/zsh
# shell colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad
export COLORTERM=truecolor
# set XDG spec variables
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_BIN_HOME="${HOME}/.local/bin"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_RUNTIME_DIR="${HOME}/.local/run"
export XDG_CACHE_HOME="${HOME}/.local/cache"
# set zsh home directory
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
# set brew configs
export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"
export HOMEBREW_REPOSITORY="${HOMEBREW_REPOSITORY:-$HOMEBREW_PREFIX}"
export HOMEBREW_CELLAR="${HOMEBREW_CELLAR:-$HOMEBREW_PREFIX/Cellar}"

# set vim/nvim initial script
export VIMINIT='let $VIMINIT = has("nvim") ? "${XDG_CONFIG_HOME}/nvim/init.lua" : "${XDG_CONFIG_HOME}/vim/vimrc" | source $VIMINIT'
# set ncurses configs
export TERMINFO="${XDG_DATA_HOME}/terminfo"
export TERMINFO_DIRS="${XDG_DATA_HOME}/terminfo"
# set less history file location
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
# set ripgrep configs
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/ripgrep/config"
# set fzf configs
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_DEFAULT_OPTS="--multi --cycle --keep-right --height=40% --layout=reverse --border --info=inline --ansi --preview='bat --color=always --style=numbers --line-range=:50 {}'"
# set docker configs
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
# set kubernetes configs
export KUBECACHEDIR="${XDG_CACHE_HOME}/kube"
export KUBEHOMEDIR="${XDG_CONFIG_HOME}/kube"
export KUBECONFIG="${KUBEHOMEDIR}/config"
# set kubernetes krew configs
export KREW_ROOT="${XDG_DATA_HOME}/krew"
export KREW_BIN="${KREW_ROOT}/bin"
# set minikube configs
export MINIKUBE_HOME="${KUBEHOMEDIR}/.minikube"
# set werf configs
export WERF_TMP_DIR="${XDG_CACHE_HOME}/werf"
export WERF_HOME="${XDG_CONFIG_HOME}/werf"
# set vagrant configs
export VAGRANT_HOME="${XDG_CONFIG_HOME}/vagrant"
export VAGRANT_ALIAS_FILE="${XDG_CONFIG_HOME}/vagrant/aliases"
# set terraform configs
export TF_HOME_DIR="${XDG_CONFIG_HOME}/terraform"
export TF_CLI_CONFIG_FILE="${TF_HOME_DIR}/terraform.tfrc"
# set vault configs
export VAULT_CONFIG_PATH="${XDG_CONFIG_HOME}/vault/.client.hcl"
export VAULT_ADDR="http://127.0.0.1:8200"
# set gnupg configs
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GPG_TTY=$(tty)
# set ansible configs
export ANSIBLE_HOME="${XDG_DATA_HOME}/ansible"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible"
export ANSIBLE_LOCAL_TEMP="${XDG_CACHE_HOME}/ansible"
export ANSIBLE_VAULT_PASSWORD_FILE="${ANSIBLE_HOME}/.vault-password"
export ANSIBLE_COLLECTIONS_PATH="${ANSIBLE_HOME}/collections"
export ANSIBLE_ROLES_PATH="${ANSIBLE_HOME}/roles"
export ANSIBLE_SSH_CONTROL_PATH_DIR="${ANSIBLE_HOME}/cp"
export ANSIBLE_PERSISTENT_CONTROL_PATH_DIR="${ANSIBLE_HOME}/pc"
export ANSIBLE_PLUGINS="${ANSIBLE_HOME}/plugins"
export ANSIBLE_LIBRARY="${ANSIBLE_PLUGINS}/modules"
export ANSIBLE_ACTION_PLUGINS="${ANSIBLE_PLUGINS}/action"
export ANSIBLE_BECOME_PLUGINS="${ANSIBLE_PLUGINS}/become"
export ANSIBLE_CACHE_PLUGINS="${ANSIBLE_PLUGINS}/cache"
export ANSIBLE_CALLBACK_PLUGINS="${ANSIBLE_PLUGINS}/callback"
export ANSIBLE_CLICONF_PLUGINS="${ANSIBLE_PLUGINS}/cliconf"
export ANSIBLE_CONNECTION_PLUGINS="${ANSIBLE_PLUGINS}/connection"
export ANSIBLE_DOC_FRAGMENT_PLUGINS="${ANSIBLE_PLUGINS}/doc_fragments"
export ANSIBLE_FILTER_PLUGINS="${ANSIBLE_PLUGINS}/filter"
export ANSIBLE_HTTPAPI_PLUGINS="${ANSIBLE_PLUGINS}/httpapi"
export ANSIBLE_INVENTORY_PLUGINS="${ANSIBLE_PLUGINS}/inventory"
export ANSIBLE_LOOKUP_PLUGINS="${ANSIBLE_PLUGINS}/lookup"
export ANSIBLE_MODULE_UTILS="${ANSIBLE_PLUGINS}/module_utils"
export ANSIBLE_NETCONF_PLUGINS="${ANSIBLE_PLUGINS}/netconf"
export ANSIBLE_STRATEGY_PLUGINS="${ANSIBLE_PLUGINS}/strategy"
export ANSIBLE_TERMINAL_PLUGINS="${ANSIBLE_PLUGINS}/terminal"
export ANSIBLE_TEST_PLUGINS="${ANSIBLE_PLUGINS}/test"
export ANSIBLE_VARS_PLUGINS="${ANSIBLE_PLUGINS}/vars"
# set virtualenv configs
export VIRTUALENV_CONFIG_FILE="${XDG_CONFIG_HOME}/virtualenv/config.toml"
# set pip configs
export PIP_CONFIG_FILE="${XDG_CONFIG_HOME}/pip/pip.conf"
# set poetry configs
export POETRY_CONFIG_DIR="${XDG_CONFIG_HOME}/pypoetry"
export POETRY_DATA_DIR="${XDG_DATA_HOME}/pypoetry"
export POETRY_CACHE_DIR="${XDG_CACHE_HOME}/pypoetry"
# set go configs
export GOPATH="${XDG_DATA_HOME}/go"
export GOBIN="${GOPATH}/bin"
# set bundler configs
export BUNDLE_USER_CONFIG="${XDG_CONFIG_HOME}/bundler"
export BUNDLE_USER_CACHE="${XDG_CACHE_HOME}/bundler"
export BUNDLE_USER_PLUGIN="${XDG_DATA_HOME}/bundler"
# set ruby configs
export GEM_HOME="${XDG_DATA_HOME}/gem"
export GEM_BIN="${GEM_HOME}/bin"
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem"
# set rbenv configs
export RBENV_ROOT="${XDG_DATA_HOME}/rbenv"
# set nodenv configs
export NODENV_ROOT="${XDG_DATA_HOME}/nodenv"
# set volta configs
export VOLTA_HOME="${XDG_DATA_HOME}/volta"
export VOLTA_BIN="${VOLTA_HOME}/bin"
# set npm/node configs
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export NODE_REPL_HISTORY="${XDG_STATE_HOME}/node/repl_history"
# set dotnet configs
export DOTNET_ROOT="/usr/local/share/dotnet"
export DOTNET_CLI_HOME="${XDG_DATA_HOME}/dotnet"
export DOTNET_CLI_TOOLS="${DOTNET_CLI_HOME}/tools"
# set nuget configs
export NUGET_PACKAGES="${XDG_DATA_HOME}/nuget/packages"
export NUGET_HTTP_CACHE_PATH="${XDG_CACHE_HOME}/nuget"
export NUGET_PLUGINS_CACHE_PATH="${XDG_CACHE_HOME}/nuget/plugins"
# set maven configs
export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | grep java.home | grep -o '/.*')
export MAVEN_HOME="${XDG_DATA_HOME}/m2"
export MAVEN_REPOSITORY="${XDG_DATA_HOME}/m2/repository"
export MAVEN_ARGS="-gs ${XDG_CONFIG_HOME}/m2/settings.xml"
export M2_HOME="${MAVEN_HOME}"
export M2="${M2_HOME}/bin"
# set gradle configs
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
# set luarocks configs
export LUAROCKS_CONFIG="${XDG_CONFIG_HOME}/luarocks/config.lua"
# set composer configs
export COMPOSER_HOME="${XDG_CONFIG_HOME}/composer"
export COMPOSER_CACHE_DIR="${XDG_CACHE_HOME}/composer"
# set mutagen configs
export MUTAGEN_DATA_DIRECTORY="${XDG_DATA_HOME}/mutagen"
# set code configs
export VSCODE_EXTENSIONS="${XDG_DATA_HOME}/code/extensions"

# set default tools
export EDITOR=nvim
export VISUAL=nvim

unsetopt MULTIOS
setopt MAGIC_EQUAL_SUBST
setopt BSD_ECHO
setopt INTERACTIVE_COMMENTS
setopt PROMPT_SUBST
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt EMACS

# ssh agent
if [ -z "${SSH_AUTH_SOCK}" ] ; then
	eval `ssh-agent -P "${HOMEBREW_PREFIX}/lib/*"` > /dev/null
fi
if ! ps -p ${SSH_AGENT_PID:-0} 2>&1 > /dev/null ; then
	unset SSH_AGENT_PID
fi
export SSH_AGENT_PID=${SSH_AGENT_PID:-`pgrep -x ssh-agent`}
if [[ `ssh-add -l` = *"agent has no identities"* ]] ; then
	ssh-add "${HOME}/.ssh/id_rsa"
fi

# zsh extensions
source "${ZDOTDIR}/extensions/git-aware-prompt/main.sh"
source "${ZDOTDIR}/extensions/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "${ZDOTDIR}/extensions/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
source "${ZDOTDIR}/extensions/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "${ZDOTDIR}/extensions/zsh-lazyload/zsh-lazyload.plugin.zsh"

# zsh extensions configs
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main root brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=3"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=3"

export FPATH="${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}:${ZDOTDIR}/extensions/zsh-completions/src"

# =====================================================================

if [ -f "${ZDOTDIR}/.zshenv.after" ]; then
	source "${ZDOTDIR}/.zshenv.after"
fi
