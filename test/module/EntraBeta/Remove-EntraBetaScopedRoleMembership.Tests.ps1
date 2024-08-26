BeforeAll {  
    if((Get-Module -Name Microsoft.Graph.Entra.Beta) -eq $null){
        Import-Module Microsoft.Graph.Entra.Beta       
    }
    Import-Module (Join-Path $psscriptroot "..\Common-Functions.ps1") -Force
    

    Mock -CommandName Remove-MgBetaDirectoryAdministrativeUnitScopedRoleMember -MockWith {} -ModuleName Microsoft.Graph.Entra.Beta
}

Describe "Remove-EntraBetaScopedRoleMembership" {
Context "Test for Remove-EntraBetaScopedRoleMembership" {
        It "Should return empty object" {
            $result = Remove-EntraBetaScopedRoleMembership -ObjectId "dddddddd-1111-2222-3333-eeeeeeeeeeee" -ScopedRoleMembershipId "zTVcE8KFQ0W4bI9tvt6kz9Es_cQCeeJLolvVzF_5NRdnAVb9H_8aR410OwBwq86hU"
            $result | Should -BeNullOrEmpty

            Should -Invoke -CommandName Remove-MgBetaDirectoryAdministrativeUnitScopedRoleMember -ModuleName Microsoft.Graph.Entra.Beta -Times 1
        }
        It "Should fail when ObjectId is empty" {
            { Remove-EntraBetaScopedRoleMembership -ObjectId  -ScopedRoleMembershipId "zTVcE8KFQ0W4bI9tvt6kz9Es_cQCeeJLolvVzF_5NRdnAVb9H_8aR410OwBwq86hU"  } | Should -Throw "Missing an argument for parameter 'ObjectId'*"
        }
        It "Should fail when ObjectId is invalid" {
            { Remove-EntraBetaScopedRoleMembership -ObjectId "" -ScopedRoleMembershipId "zTVcE8KFQ0W4bI9tvt6kz9Es_cQCeeJLolvVzF_5NRdnAVb9H_8aR410OwBwq86hU"} | Should -Throw "Cannot bind argument to parameter 'ObjectId' because it is an empty string."
        }
        It "Should fail when ScopedRoleMembershipId is empty" {
            { Remove-EntraBetaScopedRoleMembership -ObjectId "dddddddd-1111-2222-3333-eeeeeeeeeeee" -ScopedRoleMembershipId  } | Should -Throw "Missing an argument for parameter 'ScopedRoleMembershipId'*"
        }
        It "Should fail when ScopedRoleMembershipId is invalid" {
            { Remove-EntraBetaScopedRoleMembership -ObjectId "dddddddd-1111-2222-3333-eeeeeeeeeeee" -ScopedRoleMembershipId ""} | Should -Throw "Cannot bind argument to parameter 'ScopedRoleMembershipId' because it is an empty string."
        }
        It "Should contain AdministrativeUnitId in parameters when passed ObjectId to it" {    
            Mock -CommandName Remove-MgBetaDirectoryAdministrativeUnitScopedRoleMember -MockWith {$args} -ModuleName Microsoft.Graph.Entra.Beta

            $result = Remove-EntraBetaScopedRoleMembership -ObjectId "dddddddd-1111-2222-3333-eeeeeeeeeeee" -ScopedRoleMembershipId "zTVcE8KFQ0W4bI9tvt6kz9Es_cQCeeJLolvVzF_5NRdnAVb9H_8aR410OwBwq86hU"
            $params = Get-Parameters -data $result
            $params.AdministrativeUnitId | Should -Be "dddddddd-1111-2222-3333-eeeeeeeeeeee"
        }
        It "Should contain 'User-Agent' header" {
            Mock -CommandName Remove-MgBetaDirectoryAdministrativeUnitScopedRoleMember -MockWith {$args} -ModuleName Microsoft.Graph.Entra.Beta

            $userAgentHeaderValue = "PowerShell/$psVersion EntraPowershell/$entraVersion Remove-EntraBetaScopedRoleMembership"

            $result = Remove-EntraBetaScopedRoleMembership -ObjectId "dddddddd-1111-2222-3333-eeeeeeeeeeee" -ScopedRoleMembershipId "zTVcE8KFQ0W4bI9tvt6kz9Es_cQCeeJLolvVzF_5NRdnAVb9H_8aR410OwBwq86hU"
            $params = Get-Parameters -data $result
            $params.Headers["User-Agent"] | Should -Be $userAgentHeaderValue
        }


    }
}