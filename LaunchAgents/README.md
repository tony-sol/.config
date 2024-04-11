# macos LaunchAgents services

> [!NOTE]
> ```man
> FILES
> 	~/Library/LaunchAgents         Per-user agents provided by the user.
> 	/Library/LaunchAgents          Per-user agents provided by the administrator.
> 	/Library/LaunchDaemons         System wide daemons provided by the administrator.
> 	/System/Library/LaunchAgents   OS X Per-user agents.
> 	/System/Library/LaunchDaemons  OS X System wide daemons.
> ```

> [!IMPORTANT]
> Services with user permission must be placed into `~/Library/LaunchAgents/`
> ```shell
> cd ~/Library/LaunchAgents/
> ln ~/.config/LaunchAgents/*.plist ./
> ```
> or via `brew services start`, e.g.
> ```shell
> brew services start podman --file ~/.config/LaunchAgents/homebrew.mxcl.podman.plist
> ```

> [!WARNING]
> Services with sudo permission must be placed into `/Library/LaunchDaemons/`
> ```shell
> cd /Library/LaunchDaemons/
> ln ~/.config/LaunchAgents/root/*.plist ./
> ```
> or via `sudo brew services start`, e.g.
> ```shell
> sudo brew services start tailscale --file ~/.config/LaunchAgents/root/homebrew.mxcl.tailscale.plist
> ```
