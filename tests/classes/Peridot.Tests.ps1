BeforeAll {
    # import base Peridot class
    . "$PSScriptRoot\..\..\classes\Peridot.ps1"
    . "$PSScriptRoot\..\..\classes\Archetype.ps1"
}

Describe 'Peridot' {
    Context 'MatchesArchetype' {
        It 'Should return true when no properties defined' {
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

        It 'Should return true when all properties match' {
            $peridot = [Peridot]::new()
            $peridot.Ear = 'Long'
            $peridot.Face = 'Round'
            $peridot.Horn = 'Curved'

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

    Context 'GetDistance' {
        It 'Should return 1 when Peridot is the same' {
            $peridot = [Peridot]::new()
            $peridot.Ear = 'Long'
            $peridot.Face = 'Round'
            $peridot.Horn = 'Curved'
            $peridot.Material = 'Metal'
            $peridot.Pattern = 'Striped'
            $peridot.Plumage = 'Smooth'
            $peridot.Tail = 'Long'

            $otherPeridot = [Peridot]::new()
            $otherPeridot.Ear = $peridot.Ear
            $otherPeridot.Face = $peridot.Face
            $otherPeridot.Horn = $peridot.Horn
            $otherPeridot.Material = $peridot.Material
            $otherPeridot.Pattern = $peridot.Pattern
            $otherPeridot.Plumage = $peridot.Plumage
            $otherPeridot.Tail = $peridot.Tail
            $otherPeridot.Color = $peridot.Color

            $result = $peridot.GetDistance($otherPeridot)

            $result | Should -Be 1
        }

        It 'Should return less than 1 when Peridot is the same but smaller source complexity' {
            $peridot = [Peridot]::new()
            $peridot.Ear = 'Long'
            $peridot.Face = 'Round'
            $peridot.Horn = 'Curved'
            $peridot.Material = 'Metal'
            $peridot.Pattern = 'Striped'

            $otherPeridot = [Peridot]::new()
            $otherPeridot.Ear = $peridot.Ear
            $otherPeridot.Face = $peridot.Face
            $otherPeridot.Horn = $peridot.Horn
            $otherPeridot.Material = $peridot.Material
            $otherPeridot.Pattern = $peridot.Pattern
            $otherPeridot.Plumage = $peridot.Plumage
            $otherPeridot.Tail = $peridot.Tail
            $otherPeridot.Color = $peridot.Color

            $result = $peridot.GetDistance($otherPeridot)

            $result | Should -BeLessThan 1
        }

        It 'Should return -1 when peridot has no similar traits' {
            $peridot = [Peridot]::new()
            $peridot.Generation = 2
            $peridot.Name = 'Child'
            $peridot.Parent = 'Parent'
            $peridot.Ear = 'Long'
            $peridot.Face = 'Round'
            $peridot.Horn = 'Curved'

            $otherPeridot = [Peridot]::new()
            $otherPeridot.Generation = 1
            $otherPeridot.Name = 'Parent'
            $otherPeridot.Ear = 'Short'
            $otherPeridot.Face = 'Square'
            $otherPeridot.Horn = 'Straight'

            $result = $peridot.GetDistance($otherPeridot)

            $result | Should -Be -1
        }

        It 'Should return 0 when Peridot is parent' {
            $peridot = [Peridot]::new()
            $peridot.Generation = 1
            $peridot.Name = 'Parent'
            $peridot.Ear = 'Long'
            $peridot.Face = 'Round'
            $peridot.Horn = 'Curved'

            $otherPeridot = [Peridot]::new()
            $otherPeridot.Generation = 2
            $otherPeridot.Name = 'Child'
            $otherPeridot.Parent = 'Parent'
            $otherPeridot.Ear = 'Short'
            $otherPeridot.Face = 'Square'
            $otherPeridot.Horn = 'Straight'

            $result = $peridot.GetDistance($otherPeridot)

            $result | Should -Be 0
        }

        It 'Should return lower distance when destination is simpler' {
            $complexPeridot = [Peridot]::new()
            $complexPeridot.Ear = 'Long'
            $complexPeridot.Face = 'Round'
            $complexPeridot.Horn = 'Curved'

            $simplerPeridot = [Peridot]::new()
            $simplerPeridot.Ear = $complexPeridot.Ear

            $simplerDestination = $complexPeridot.GetDistance($simplerPeridot)
            $complexDestination = $simplerPeridot.GetDistance($complexPeridot)

            $simplerDestination | Should -BeLessThan $complexDestination
        }

        It 'Should return lower distance when source is simpler' {
            $complexPeridot = [Peridot]::new()
            $complexPeridot.Ear = 'Long'
            $complexPeridot.Face = 'Round'
            $complexPeridot.Horn = 'Curved'

            $simplerPeridot = [Peridot]::new()
            $simplerPeridot.Ear = $complexPeridot.Ear
            $simplerPeridot.Face = $complexPeridot.Face

            $targetPeridot = [Peridot]::new()
            $targetPeridot.Ear = $complexPeridot.Ear

            $complexSource = $complexPeridot.GetDistance($targetPeridot)
            $simplerSource = $simplerPeridot.GetDistance($targetPeridot)

            $simplerSource | Should -BeLessThan $complexSource
        }
    }
}