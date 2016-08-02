Push-Location (Split-Path -Path $PSCommandPath)
Import-Module ..\PsStringUtilities.psm1 -PassThru -Force
Pop-Location

Describe "Get-StringHash" {
	Context "Exists" {
		It "Is available and has required parameters" {
			$command = Get-Command Get-StringHash -Module PsStringUtilities
			
			$command | Should Not Be $null
			$command.Parameters['String'] | Should Not Be $null
		}
	}
	Context "When executed" {
		It "Produces a correct string hash" {
			$hash = Get-StringHash -String "Example string"
			$hash | Should Be "0a54927c8d063a2999048ef86a3fc48ed37d6d39"
		}
		It "Operates on input pipeline" {
			$hash = "Example string" | Get-StringHash
			$hash | Should Be "0a54927c8d063a2999048ef86a3fc48ed37d6d39"
		}
		It "Operates on multiple inputs from pipeline" {
			$hashes = "Example string", "Hello world" | Get-StringHash

			$hashes.Count | Should Be 2
			$hashes[0] | Should Be "0a54927c8d063a2999048ef86a3fc48ed37d6d39"
			$hashes[1] | Should Be "7b502c3a1f48c8609ae212cdfb639dee39673f5e"
		}
	}
}