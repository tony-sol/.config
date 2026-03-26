if (Test-Path "${PSScriptRoot}\Profile.before.ps1") {
	. "${PSScriptRoot}\Profile.before.ps1"
}

. "${PSScriptRoot}\Environments.ps1"

Import-Module Terminal-Icons

Import-Module PSReadLine || Install-Module PSReadLine && &{
    Set-PSReadLineOption -ShowToolTips:$true
    Set-PSReadLineOption -MaximumHistoryCount 2000000
    Set-PSReadLineOption -HistoryNoDuplicates:$true
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$true
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    Set-PSReadlineOption -EditMode Vi
    Set-PSReadLineOption -ViModeIndicator Script
    # @FIX On startup, cursor is always system
    Set-PSReadLineOption -ViModeChangeHandler {
        param([String]$mode)
        Write-Host -NoNewLine (($mode.Equals('Insert')) ? "`e[6 q" : "`e[2 q")
    }
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete -ViMode Insert
    Set-PSReadLineKeyHandler -Chord Alt+RightArrow -Function ForwardWord -ViMode Insert
    Set-PSReadLineKeyHandler -Chord Alt+LeftArrow -Function BackwardWord -ViMode Insert
}

Import-Module CompletionPredictor

Import-Module ps-menu

Import-Module posh-git || Install-Module posh-git && &{
    $Global:GitPromptFunctions = @{
        PromptWriteBeforeSuffix = {
            $Global:GitPromptValues.DollarQuestion ? $null : ' ' + $Global:GitPromptValues.LastExitCode
        }
        PromptWriteSuffix = {
            Write-Prompt " $([char]0x276F) " -ForegroundColor ($Global:GitPromptValues.DollarQuestion ? ([System.ConsoleColor]::Green) : ([System.ConsoleColor]::Red))
        }
    }
    $Global:GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
    $Global:GitPromptSettings.DefaultPromptBeforeSuffix.Text = '$(& $GitPromptFunctions.PromptWriteBeforeSuffix)'
    $Global:GitPromptSettings.DefaultPromptBeforeSuffix.ForegroundColor = [System.ConsoleColor]::Red
    # @FIX .ForegroundColor cannot be scriptblock, so use closure call as .Text
    # $Global:GitPromptSettings.DefaultPromptSuffix.Text = " $( [char]0x276F ) "
    # $Global:GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [System.ConsoleColor]::Green
    $Global:GitPromptSettings.DefaultPromptSuffix = '$(& $GitPromptFunctions.PromptWriteSuffix)'
    $Global:GitPromptSettings.DefaultPromptPath.ForegroundColor = [System.ConsoleColor]::Cyan
    $Global:GitPromptSettings.EnableFileStatus = $true
    $Global:GitPromptSettings.EnablePromptStatus = $true
    $Global:GitPromptSettings.EnableStashStatus = $true
    $Global:GitPromptSettings.UntrackedFilesMode = 'All'
}

Import-Module Microsoft.PowerShell.SecretManagement

Import-Module Microsoft.PowerShell.SecretStore

Import-Module Microsoft.PowerShell.ConsoleGuiTools

Import-Module Microsoft.WinGet.Client

Import-Module Microsoft.WinGet.Configuration

Import-Module Microsoft.WinGet.DSC

Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
	param($wordToComplete, $commandAst, $cursorPosition)
	[System.Console]::InputEncoding = [System.Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
	$Local:word = $wordToComplete.Replace('"', '""')
	$Local:ast = $commandAst.ToString().Replace('"', '""')
	winget complete --word "${Local:word}" --commandline "${Local:ast}" --position $cursorPosition | ForEach-Object {
		[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
	}
}

. "${PSScriptRoot}\Aliases.ps1"

if (Test-Path "${PSScriptRoot}\Profile.after.ps1") {
	. "${PSScriptRoot}\Profile.after.ps1"
}

