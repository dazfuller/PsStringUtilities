if (Get-Module PsStringUtilities) { return }

$ModuleRoot = Split-Path -Path $MyInvocation.MyCommand.Path

"$ModuleRoot\Scripts\*.ps1" |
	Resolve-Path |
	Where-Object { -not ( $_.ProviderPath.ToLower().Contains(".tests.")) } |
	ForEach-Object { . $_.ProviderPath }

Export-ModuleMember -Function @(
	'Get-StringHash'
)