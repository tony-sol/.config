$env:SHELL = '/usr/local/bin/pwsh'

. "$PSScriptRoot\Utils.ps1"

Import-Module Terminal-Icons
Import-Module PSReadLine
	Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
	Set-PSReadLineOption -ShowToolTips:$true
	Set-PSReadLineOption -HistoryNoDuplicates:$true
	Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$true
	Set-PSReadLineOption -PredictionSource:"HistoryAndPlugin"
	# @FIX Commands list not working in Vi-mode on tab press
	Set-PSReadlineOption -EditMode "Vi"
	Set-PSReadLineOption -ViModeIndicator Script
	# @FIX On startup, cursor is always system
	Set-PSReadLineOption -ViModeChangeHandler $Function:_onViModeChange
Import-Module CompletionPredictor
Import-Module ps-menu
Import-Module posh-git
	$global:GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
	$global:GitPromptSettings.DefaultPromptBeforeSuffix.Text = '$(PromptWriteErrorInfo)'
Import-Module Microsoft.PowerShell.SecretManagement
Import-Module Microsoft.PowerShell.SecretStore

Set-Alias -Name vim -Value _nvim -Option AllScope
Set-Alias -Name nvim -Value _nvim -Option AllScope
Set-Alias -Name t -Value _t -Option AllScope
Set-Alias -Name tt -Value _tt -Option AllScope
