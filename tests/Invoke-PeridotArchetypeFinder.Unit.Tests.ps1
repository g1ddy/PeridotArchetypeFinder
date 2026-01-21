$modulePath = Split-Path $PSScriptRoot
$moduleName = 'PeridotArchetypeFinder'
Import-Module "$(Join-Path $modulePath $moduleName).psd1" -Force

Set-StrictMode -Version Latest

InModuleScope $moduleName {
    Describe 'Invoke-PeridotArchetypeFinder' {

        It "Should not throw" {
            { Invoke-PeridotArchetypeFinder } | Should -Not -Throw
        }

        It "Should output header" {
            $result = Invoke-PeridotArchetypeFinder
            $result | Should -Contain '# Peridot with Multi Archetype'
        }
    }
}
