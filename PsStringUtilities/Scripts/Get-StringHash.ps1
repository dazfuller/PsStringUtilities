function Get-StringHash {
	Param (
		[Parameter(Mandatory=$true, ValueFromPipeline)]
		[string] $String
	)

	process {
		$Encoding = New-Object System.Text.UTF8Encoding
		$InputBytes = $Encoding.GetBytes($String)

		$Sha1Provider = New-Object System.Security.Cryptography.SHA1CryptoServiceProvider
		$Hash = -join ($Sha1Provider.ComputeHash($InputBytes) |% { $_.ToString('x2') })

		$Hash
	}
}