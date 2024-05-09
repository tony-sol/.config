Function _get_shell()
{
	return Get-Command zsh | Select-Object -ExpandProperty Source
}

Function global:PromptWriteErrorInfo()
{
	if ($global:GitPromptValues.DollarQuestion)
	{
		Write-Prompt " ✔︎ " -ForegroundColor ([ConsoleColor]::Green)
	}
	else
	{
		Write-Prompt " ✘ $($global:GitPromptValues.LastExitCode) " -ForegroundColor ([ConsoleColor]::Red)
	}
}

## line cursor in insert mode, block cursor otherwise
Function _onViModeChange()
{
	Write-Host -NoNewLine ( ($args[0] -eq 'Insert') ? "`e[6 q" : "`e[2 q" )
}

Function _nvim()
{
	$env:SHELL = $(_get_shell); nvim $args
}

Function _t()
{
	Get-ChildItem -FollowSymlink -Force $args
}

Function _tt()
{
	Get-ChildItem -FollowSymlink -Force -Recurse $args
}
