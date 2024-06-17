# .config

This repo contains configuration from XDG_CONFIG_HOME.

## Noticeable files

* `.gitmodules` - List of manually install plugins (e.g. `zsh` and `tmux` plugins)
* `.misc/provision.yml` - Ansible playbook to restore shell configuration and install application
* `.misc/rectangle.json` - Configuration backup of [Rectangle.app](https://rectangleapp.com/)
* `.misc/vimium.json` - Configuration backup of [Vimium](https://github.com/philc/vimium)
* `.misc/macos/` - macos specific `defaults` setting and patched `.plist` files for `launchctl`

## Noticeable tricks

* Ignore changes in indexed file
```shell
git update-index --skip-worktree <FILE>
```
