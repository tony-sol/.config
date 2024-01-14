# For macos


# For linux

## Add these lines into .zprofile.before
```shell
if [ -z "${TMUX}" ] ; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
```
## .zshenv.before
```shell
export LS_COLORS="di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export HOMEBREW_CACHE="${XDG_CACHE_HOME}/Homebrew"
export HOMEBREW_LOGS="${HOMEBREW_CACHE}/Logs"
```
## .zshrc.after
```shell
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
```
