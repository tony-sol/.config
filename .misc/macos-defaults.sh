# Set Launchpad size to 9 x 5
defaults wirte com.apple.dock 'springboard-columns' -int '9'
defaults wirte com.apple.dock 'springboard-rows' -int '5'

# Set Dock icons size to 36
defaults wirte com.apple.dock 'tilesize' -int '36'

# Set Screencapture to disable shadows
defaults write com.apple.screencapture 'disable-shadow' -bool 'true'

# Set Finder to show all extensions
defaults write NSGlobalDomain 'AppleShowAllExtensions' -bool 'true'

# Set Finder to show hidden files
defaults write com.apple.finder 'AppleShowAllFiles' -bool 'true'

# Set Finder to show path bar
defaults write com.apple.finder 'ShowPathbar' -bool 'true'

# Set Finder to show directories first
defaults write com.apple.finder '_FXSortFoldersFirst' -bool 'true'
defaults write com.apple.finder '_FXSortFoldersFirstOnDesktop' -bool 'true'

# Set Finder to disable changing file extension warning
defaults write com.apple.finder 'FXEnableExtensionChangeWarning' -bool 'false'

# Set Finder to show disks on desktop
defaults write com.apple.finder 'ShowHardDrivesOnDesktop' -bool 'true'
defaults write com.apple.finder 'ShowExternalHardDrivesOnDesktop' -bool 'true'

# Set Finder to show removable media on desktop
defaults write com.apple.finder 'ShowRemovableMediaOnDesktop' -bool 'true'

# Set Finder to show mounted servers on desktop
defaults write com.apple.finder 'ShowMountedServersOnDesktop' -bool 'true'

# Set Finder to show iCloud
defaults write com.apple.finder 'SidebarShowingiCloudDesktop' -bool 'true'

# Set Activity Monitor icon to show CPU usage history, graphed over time
defaults write com.apple.ActivityMonitor "IconType" -int '6'

# Set clock display
defaults write com.apple.menuextra.clock 'Show24Hour' -bool 'true'
defaults write com.apple.menuextra.clock 'ShowDate' -bool 'true'
defaults write com.apple.menuextra.clock 'ShowDayOfWeek' -bool 'true'

# Set trackpad touch-as-click
defaults write com.apple.AppleMultitouchTrackpad 'Clicking' -bool 'true'

# Set trackpad touch-as-click
defaults write com.apple.AppleMultitouchTrackpad 'Clicking' -bool 'true'

# Set keyboard fn-keys as standard function keys
defaults read NSGlobalDomain com.apple.keyboard.fnState -bool 'true'

# Restart
killall Dock
killall Finder
