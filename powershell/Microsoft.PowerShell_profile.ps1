$env:SHELL = '/usr/local/bin/pwsh'

Import-Module Terminal-Icons

Import-Module posh-git
Function global:PromptWriteErrorInfo() {
	if ($global:GitPromptValues.DollarQuestion) {
		Write-Prompt " ✔︎ " -ForegroundColor ([ConsoleColor]::Green)
	} else {
		Write-Prompt " ✘ " -ForegroundColor ([ConsoleColor]::Red)
	}
}
$global:GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
$global:GitPromptSettings.DefaultPromptBeforeSuffix.Text = '$(PromptWriteErrorInfo)'

Import-Module posh-with

Import-Module CompletionPredictor

Import-Module Microsoft.PowerShell.UnixCompleters
Set-UnixCompleter -ShellType Zsh

Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
$PSReadLineOptions = @{
	HistoryNoDuplicates = $True
	HistorySearchCursorMovesToEnd = $True
	PredictionSource = "HistoryAndPlugin"
}
Set-PSReadLineOption @PSReadLineOptions

Function _vim() {
	$env:SHELL = '/bin/zsh'
	nvim $args
}
Set-Alias -Name vim -Value _vim -Option AllScope

Function _ll() {
	Get-ChildItem -Force $args
}
Set-Alias -Name ll -Value _ll -Option AllScope
