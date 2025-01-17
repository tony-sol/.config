Function global:PromptWriteErrorInfo()
{
	if ($global:GitPromptValues.DollarQuestion)
	{
		Write-Prompt " $([char]0x2714) " -ForegroundColor ([ConsoleColor]::Green)
	}
	else
	{
		Write-Prompt " $([char]0x2718) $($global:GitPromptValues.LastExitCode) " -ForegroundColor ([ConsoleColor]::Red)
	}
}
