$modulePath = Split-Path $PSScriptRoot
$moduleName = 'PeridotArchetypeFinder'
Import-Module "$(Join-Path $modulePath $moduleName).psd1" -Force

Set-StrictMode -Version Latest

InModuleScope $moduleName {
    Describe 'Invoke-FindMissingArchetypes' {
        Context 'When finding missing archetypes' {
            It 'Should correctly identify archetypes that have not been achieved' {
                # Arrange
                $mockArchetypes = @(
                    [Archetype]@{ Name = 'AchievedSingle' },
                    [Archetype]@{ Name = 'AchievedInCombo' },
                    [Archetype]@{ Name = 'Missing' }
                )
                Mock Get-Archetypes { return $mockArchetypes }

                $mockPeridots = @([Peridot]::new())
                Mock Get-Peridots { return $mockPeridots }

                # Keys are what matters.
                # 'AchievedSingle' covers the first one.
                # 'Other, AchievedInCombo' covers the second one via split.
                $mockDictionary = @{
                    'AchievedSingle' = @{}
                    'Other, AchievedInCombo' = @{}
                }
                Mock Get-PeridotArchetypeDictionary { return $mockDictionary }

                Mock Find-ArchetypePeridot { return "Content" }
                Mock Out-File { }
                Mock New-Item { }
                Mock Test-Path { return $true }

                # Act
                Invoke-FindMissingArchetypes

                # Assert
                # 'Missing' is the only one not in dictionary keys (split by comma)

                Assert-MockCalled Find-ArchetypePeridot -Times 1 -ParameterFilter {
                    $TargetArchetype -eq 'Missing'
                }

                Assert-MockCalled Find-ArchetypePeridot -Times 0 -ParameterFilter {
                    $TargetArchetype -eq 'AchievedSingle'
                }

                Assert-MockCalled Find-ArchetypePeridot -Times 0 -ParameterFilter {
                    $TargetArchetype -eq 'AchievedInCombo'
                }
            }
        }
    }
}
