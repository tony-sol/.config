Import-Module Terminal-Icons
Import-Module PSReadLine
	Set-PSReadLineOption -ShowToolTips:$true
	Set-PSReadLineOption -HistoryNoDuplicates:$true
	Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$true
	Set-PSReadLineOption -PredictionSource:'HistoryAndPlugin'
	Set-PSReadlineOption -EditMode 'Vi'
	Set-PSReadLineOption -ViModeIndicator Script
	# @FIX On startup, cursor is always system
	Set-PSReadLineOption -ViModeChangeHandler {
		param([String]$mode)
		Write-Host -NoNewLine (($mode.Equals('Insert')) ? "`e[6 q" : "`e[2 q")
	}
	Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete -ViMode Insert
Import-Module CompletionPredictor
Import-Module ps-menu
Import-Module posh-git
	$Global:GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
	$Global:GitPromptSettings.DefaultPromptBeforeSuffix.Text = '$(PromptWriteErrorInfo)'
	$Global:GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
	$Global:GitPromptSettings.EnableFileStatus = $true
	$Global:GitPromptSettings.EnablePromptStatus = $true
	$Global:GitPromptSettings.EnableStashStatus = $true
	$Global:GitPromptSettings.UntrackedFilesMode = 'All'
Import-Module Microsoft.PowerShell.SecretManagement
Import-Module Microsoft.PowerShell.SecretStore
