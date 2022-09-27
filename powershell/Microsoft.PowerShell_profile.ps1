if ( (Get-PSRepository -Name PSGallery)."InstallationPolicy" -ne "Trusted" ) {
	Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
}

Import-Module Terminal-Icons

Import-Module posh-git

Import-Module posh-with

Import-Module CompletionPredictor

Import-Module Microsoft.PowerShell.UnixCompleters
Set-UnixCompleter -ShellType Zsh

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
$PSReadLineOptions = @{
	HistoryNoDuplicates = $True
	HistorySearchCursorMovesToEnd = $True
	PredictionSource = "HistoryAndPlugin"
}
Set-PSReadLineOption @PSReadLineOptions

Function _ll { Get-ChildItem -Force $args }
Set-Alias -Name ll -Value _ll -Option AllScope
