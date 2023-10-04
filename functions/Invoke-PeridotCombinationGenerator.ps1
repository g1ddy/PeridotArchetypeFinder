function Invoke-PeridotCombinationGenerator {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        if (!$Archetypes) {
            throw "Archetypes cannot be null"
        }

        $allArchetypeCombinations = Find-ArchitypeCombinations -Archetypes $Archetypes
        $validArchetypeCombinations = New-Object 'System.Collections.Generic.List[Peridot]'

        foreach ($archetypeCombination in $allArchetypeCombinations) {
            $validArchetype = Confirm-ArchitypeCombination -Archetypes $archetypeCombination

            if ($validArchetype) {
                $validArchetypeCombinations.Add($validArchetype)
            }
        }

        return $validArchetypeCombinations
    }
}

function Find-ArchitypeCombinations {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes
    )
    process {
        if ($Archetypes.Count -eq 0) {
            return $null
        }

        $first = $Archetypes[0]
        $rest = ($Archetypes | Select-Object -Skip 1) ?? @()

        [Archetype[][]]$combinationsWihoutFirst = (Find-ArchitypeCombinations -Archetypes $rest) ?? @(, @())
        $combinationsWithFirst = New-Object System.Collections.Generic.List[Archetype[]]

        foreach ($combination in $combinationsWihoutFirst) {
            [Archetype[]]$combined = $combination + $first
            $combinationsWithFirst.Add($combined) | Out-Null
        }

        $combinationsWithFirst.AddRange($combinationsWihoutFirst) | Out-Null
        return $combinationsWithFirst
    }
}

function Confirm-ArchetypeCompatibility {
    [CmdletBinding()]
    param(
        [Archetype]$Archetype,
        [Peridot]$Other
    )
    process {
        if (!$Archetype -or !$Other) {
            return $true
            # throw "Archetypes cannot be null"
        }

        $matchesArchetype = (!$Archetype.Ear -or !$Other.Ear -or $Archetype.Ear -eq $Other.Ear) -and
            (!$Archetype.Face -or !$Other.Face -or $Archetype.Face -eq $Other.Face) -and
            (!$Archetype.Horn -or !$Other.Horn -or $Archetype.Horn -eq $Other.Horn) -and
            (!$Archetype.Material -or !$Other.Material -or $Archetype.Material -eq $Other.Material) -and
            (!$Archetype.Pattern -or !$Other.Pattern -or $Archetype.Pattern -eq $Other.Pattern) -and
            (!$Archetype.Plumage -or !$Other.Plumage -or $Archetype.Plumage -eq $Other.Plumage) -and
            (!$Archetype.Tail -or !$Other.Tail -or $Archetype.Tail -eq $Other.Tail)

        $matchesArchetype
    }
}

function Confirm-ArchitypeCombination {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes
    )
    process {
        if (!$Archetypes) {
            return $null
        }

        $first = $Archetypes[0]
        $rest = ($Archetypes | Select-Object -Skip 1) ?? @()

        $other = [Peridot]::new($first.Pattern, $first.Tail, $first.Horn, $first.Plumage, $first.Material, $first.Face, $first.Ear)

        foreach ($archetype in $rest) {
            $matchesArchetype = Confirm-ArchetypeCompatibility -Archetype $archetype -Other $other

            if (!$matchesArchetype) {
                return $null
            }

            $other.Pattern = $other.Pattern ? $other.Pattern : $archetype.Pattern
            $other.Tail = $other.Tail ? $other.Tail : $archetype.Tail
            $other.Horn = $other.Horn ? $other.Horn : $archetype.Horn
            $other.Plumage = $other.Plumage ? $other.Plumage : $archetype.Plumage
            $other.Material = $other.Material ? $other.Material : $archetype.Material
            $other.Face = $other.Face ? $other.Face : $archetype.Face
            $other.Ear = $other.Ear ? $other.Ear : $archetype.Ear
        }

        return $other
    }
}
