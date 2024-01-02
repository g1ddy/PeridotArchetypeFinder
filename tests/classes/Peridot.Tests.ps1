BeforeAll {
    # import base Peridot class
    . "$PSScriptRoot\..\..\classes\Peridot.ps1"
    . "$PSScriptRoot\..\..\classes\Archetype.ps1"
}

Describe 'Peridot' {
    Context 'MatchesArchetype' {
        It 'Should return true when all properties match' {
            $peridot = [Peridot]::new()
            $archetype = [Archetype]::new()
            $archetype.Ear = $peridot.Ear
            $archetype.Face = $peridot.Face
            $archetype.Horn = $peridot.Horn
            $archetype.Material = $peridot.Material
            $archetype.Pattern = $peridot.Pattern
            $archetype.Plumage = $peridot.Plumage
            $archetype.Tail = $peridot.Tail
            $archetype.Color = $peridot.Color

            $result = $peridot.MatchesArchetype($archetype)

            $result | Should -Be $true
        }

        It 'Should return false when any property does not match' {
            $peridot = [Peridot]::new()
            $archetype = [Archetype]::new()
            $archetype.Ear = 'Long'
            $archetype.Face = $peridot.Face
            $archetype.Horn = $peridot.Horn
            $archetype.Material = $peridot.Material
            $archetype.Pattern = $peridot.Pattern
            $archetype.Plumage = $peridot.Plumage
            $archetype.Tail = $peridot.Tail
            $archetype.Color = $peridot.Color

            $result = $peridot.MatchesArchetype($archetype)

            $result | Should -Be $false
        }

        It 'Should return true when Color property is not specified' {
            $peridot = [Peridot]::new()
            $archetype = [Archetype]::new()
            $archetype.Ear = $peridot.Ear
            $archetype.Face = $peridot.Face
            $archetype.Horn = $peridot.Horn
            $archetype.Material = $peridot.Material
            $archetype.Pattern = $peridot.Pattern
            $archetype.Plumage = $peridot.Plumage
            $archetype.Tail = $peridot.Tail

            $result = $peridot.MatchesArchetype($archetype)

            $result | Should -Be $true
        }

        It 'Should return true when Color property matches Name property' {
            $peridot = [Peridot]::new()
            $peridot.Color = 'Green'
            $archetype = [Archetype]::new()
            $archetype.Name = 'Green'
            $archetype.Ear = $peridot.Ear
            $archetype.Face = $peridot.Face
            $archetype.Horn = $peridot.Horn
            $archetype.Material = $peridot.Material
            $archetype.Pattern = $peridot.Pattern
            $archetype.Plumage = $peridot.Plumage
            $archetype.Tail = $peridot.Tail
            $archetype.Color = 'x'

            $result = $peridot.MatchesArchetype($archetype)

            $result | Should -Be $true
        }
    }
}