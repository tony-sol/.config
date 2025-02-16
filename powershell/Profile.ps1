$env:SHELL = '/usr/local/bin/pwsh'

if (Test-Path "$PSScriptRoot\Profile.before.ps1")
{
	. "$PSScriptRoot\Profile.before.ps1"
}

. "$PSScriptRoot\Environments.ps1"
. "$PSScriptRoot\Functions.ps1"
. "$PSScriptRoot\Modules.ps1"
. "$PSScriptRoot\Aliases.ps1"
. "$PSScriptRoot\ArgumentCompleters.ps1"

if (Test-Path "$PSScriptRoot\Profile.after.ps1")
{
	. "$PSScriptRoot\Profile.after.ps1"
}
