Function global:PromptWriteBeforeSuffix()
{
	if (!($global:GitPromptValues.DollarQuestion))
	{
		Write-Prompt " $($global:GitPromptValues.LastExitCode)" -ForegroundColor ([ConsoleColor]::Red)
	}
}

Function global:PromptWriteSuffix()
{
	Write-Prompt " $([char]0x276F) " -ForegroundColor (($global:GitPromptValues.DollarQuestion) ? ([ConsoleColor]::Green) : ([ConsoleColor]::Red))
}
