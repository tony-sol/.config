# .config

This repo contains configuration from XDG_CONFIG_HOME.

## Noticeable files

* `.gitmodules` - List of manually install plugins (e.g. `zsh` and `tmux` plugins)

## Noticeable tricks

* Ignore changes in indexed file
```shell
git update-index --skip-worktree <FILE> # use --no-skip-worktree to bring file back
```
* List of ignored indexed files
```shell
git ls-files -v | grep -E '^S '
```
