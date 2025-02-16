switch ($true)
{
	($IsMacOS -or $IsLinux)
	{
		# mimic XDG Base Directory Specification {{{
		$env:XDG_CONFIG_HOME ??= "$env:HOME/.config"
		$env:XDG_BIN_HOME ??= "$env:HOME/.local/bin"
		$env:XDG_DATA_HOME ??= "$env:HOME/.local/share"
		$env:XDG_STATE_HOME ??= "$env:HOME/.local/state"
		$env:XDG_CACHE_HOME ??= "$env:HOME/.cache"
		$env:XDG_RUNTIME_DIR ??= "$env:HOME/.local/run"
		# }}}
		# mimic XDG User Directories Specification {{{
		$env:XDG_DESKTOP_DIR ??= "$env:HOME/Desktop"
		$env:XDG_DOCUMENTS_DIR ??= "$env:HOME/Documents"
		$env:XDG_DOWNLOAD_DIR ??= "$env:HOME/Downloads"
		$env:XDG_MUSIC_DIR ??= "$env:HOME/Music"
		$env:XDG_PICTURES_DIR ??= "$env:HOME/Pictures"
		$env:XDG_PROJECTS_DIR ??= "$env:HOME/Projects"
		$env:XDG_PUBLICSHARE_DIR ??= "$env:HOME/Public"
		$env:XDG_TEMPLATES_DIR ??= "$env:HOME/Templates"
		$env:XDG_VIDEOS_DIR ??= "$env:HOME/Videos"
		# }}}
	}
	($IsWindows)
	{
		# mimic XDG Base Directory Specification {{{
		$env:XDG_CONFIG_HOME ??= "$env:USERPROFILE\AppData\Config"
		$env:XDG_BIN_HOME ??= "$env:USERPROFILE\AppData\Bin"
		$env:XDG_DATA_HOME ??= "$env:LOCALAPPDATA"
		$env:XDG_STATE_HOME ??= "$env:LOCALAPPDATA"
		$env:XDG_CACHE_HOME ??= "$env:LOCALAPPDATA\Cache"
		$env:XDG_RUNTIME_DIR ??= "$env:LOCALAPPDATA"
		# }}}
		# mimic XDG User Directories Specification {{{
		$env:XDG_DESKTOP_DIR ??= "$env:USERPROFILE\Desktop"
		$env:XDG_DOCUMENTS_DIR ??= "$env:USERPROFILE\Documents"
		$env:XDG_DOWNLOAD_DIR ??= "$env:USERPROFILE\Downloads"
		$env:XDG_MUSIC_DIR ??= "$env:USERPROFILE\Music"
		$env:XDG_PICTURES_DIR ??= "$env:USERPROFILE\Pictures"
		$env:XDG_VIDEOS_DIR ??= "$env:USERPROFILE\Videos"
		$env:XDG_TEMPLATES_DIR ??= "$env:APPDATA\Microsoft\Windows\Templates"
		$env:XDG_PUBLICSHARE_DIR ??= "$env:PUBLIC"
		$env:XDG_PROJECTS_DIR ??= "$env:USERPROFILE\Projects"
		# }}}
	}
}
