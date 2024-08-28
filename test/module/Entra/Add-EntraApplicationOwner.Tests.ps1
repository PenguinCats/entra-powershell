BeforeAll {  
    if((Get-Module -Name Microsoft.Graph.Entra) -eq $null){
        Import-Module Microsoft.Graph.Entra      
    }
    Import-Module (Join-Path $psscriptroot "..\Common-Functions.ps1") -Force

    Mock -CommandName New-MgApplicationOwnerByRef -MockWith {} -ModuleName Microsoft.Graph.Entra
}
  
Describe "Add-EntraApplicationOwner" {
    Context "Test for Add-EntraApplicationOwner" { 
        It "Should return empty object"{
            $result = Add-EntraApplicationOwner -ObjectId "c81d387e-d431-43b4-b12e-f07cbb35b771" -RefObjectId "412be9d1-1460-4061-8eed-cca203fcb215"
            $result | Should -BeNullOrEmpty           

            Should -Invoke -CommandName New-MgApplicationOwnerByRef -ModuleName Microsoft.Graph.Entra -Times 1
        }       
        It "Should fail when parameters are empty" {
            { Add-EntraApplicationOwner -ObjectId "" -RefObjectId "" } | Should -Throw "Cannot bind argument to parameter*"
        }
        It "Should contain ApplicationId in parameters when passed ObjectId to it" {              
            Mock -CommandName New-MgApplicationOwnerByRef -MockWith {$args} -ModuleName Microsoft.Graph.Entra

            $result = Add-EntraApplicationOwner -ObjectId "c81d387e-d431-43b4-b12e-f07cbb35b771" -RefObjectId "412be9d1-1460-4061-8eed-cca203fcb215"
            $params = Get-Parameters -data $result
            $params.ApplicationId | Should -Be "c81d387e-d431-43b4-b12e-f07cbb35b771"
        }
        It "Should contain 'User-Agent' header" {
            Mock -CommandName New-MgApplicationOwnerByRef -MockWith {$args} -ModuleName Microsoft.Graph.Entra

            $userAgentHeaderValue = "PowerShell/$psVersion EntraPowershell/$entraVersion Add-EntraApplicationOwner"

            $result = Add-EntraApplicationOwner -ObjectId "c81d387e-d431-43b4-b12e-f07cbb35b771" -RefObjectId "412be9d1-1460-4061-8eed-cca203fcb215"
            $params = Get-Parameters -data $result
            $params.Headers["User-Agent"] | Should -Be $userAgentHeaderValue
        }
    }
}