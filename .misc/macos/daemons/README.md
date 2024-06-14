# macos patched services

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
> cat ~/.config/.misc/macos/daemons/Library.home/LaunchAgents/homebrew.mxcl.podman.plist | envsubst > ~/Library/LaunchAgents/homebrew.mxcl.podman.plist
> ```
> or via `brew services start`, e.g.
> ```shell
> brew services start podman --file ~/.config/.misc/macos/daemons/Library.home/LaunchAgents/homebrew.mxcl.podman.plist
> ```

> [!WARNING]
> Services with sudo permission must be placed into `/Library/LaunchDaemons/`
> ```shell
> sudo cat ~/.config/.misc/macos/daemons/Library.root/LaunchDaemons/homebrew.mxcl.tailscale.plist | envsubst > /Library/LaunchDaemons/homebrew.mxcl.tailscale.plist
> ```
> or via `sudo brew services start`, e.g.
> ```shell
> sudo brew services start tailscale --file ~/.config/.misc/macos/daemons/Library.root/LaunchDaemons/homebrew.mxcl.tailscale.plist
> ```
