Function _t()
{
	Get-ChildItem -FollowSymlink -Force $args
}

Set-Alias -Name t -Value _t -Option AllScope

Function _tt()
{
	Get-ChildItem -FollowSymlink -Force -Recurse $args
}

Set-Alias -Name tt -Value _tt -Option AllScope
