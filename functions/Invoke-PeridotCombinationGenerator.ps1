function Invoke-PeridotCombinationGenerator {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes
    )
    process {
        if (!$Archetypes) {
            throw "Archetypes cannot be null"
        }

        $allArchetypeCombinations = Find-ArchitypeCombinations -Archetypes $Archetypes
        $validArchetypeCombinations = New-Object 'System.Collections.Generic.List[Peridot]'

        foreach ($archetypeCombination in $allArchetypeCombinations) {
            $validArchetype = New-PeridotArchitypeCombination -Archetypes $archetypeCombination

            if ($validArchetype) {
                $validArchetypeCombinations.Add($validArchetype)
            }
        }

        return $validArchetypeCombinations
    }
}

function Find-ArchitypeCombinations {
    [OutputType([Archetype[][]])]
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes,
        [int]$StartIndex = 0,
        [Archetype[]]$CurrentCombination = @()
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        if ($null -eq $Archetypes -or $StartIndex -ge $Archetypes.Count) {
            return @(, $CurrentCombination)
        }

        $first = $Archetypes[$StartIndex]

        # Recursive call without the first element
        [Archetype[][]]$combinationsWithoutFirst = @(Find-ArchitypeCombinations -Archetypes $Archetypes -StartIndex ($StartIndex + 1) -CurrentCombination $CurrentCombination) ?? @(, @())

        $result = New-Object System.Collections.Generic.List[Archetype[]]

        # Filter remaining items for compatibility with the first element
        $compatibleRestList = New-Object System.Collections.Generic.List[Archetype]

        if (!$first) {
            for ($i = $StartIndex + 1; $i -lt $Archetypes.Count; $i++) {
                $compatibleRestList.Add($Archetypes[$i])
            }
        } else {
            for ($i = $StartIndex + 1; $i -lt $Archetypes.Count; $i++) {
                $other = $Archetypes[$i]

                if (!$other) {
                    $compatibleRestList.Add($other)
                    continue
                }

                # Inline Confirm-ArchetypeCompatibility logic for performance
                $compatible = (!$first.Ear -or !$other.Ear -or $first.Ear -eq $other.Ear) -and
                    (!$first.Face -or !$other.Face -or $first.Face -eq $other.Face) -and
                    (!$first.Horn -or !$other.Horn -or $first.Horn -eq $other.Horn) -and
                    (!$first.Material -or !$other.Material -or $first.Material -eq $other.Material) -and
                    (!$first.Pattern -or !$other.Pattern -or $first.Pattern -eq $other.Pattern) -and
                    (!$first.Plumage -or !$other.Plumage -or $first.Plumage -eq $other.Plumage) -and
                    (!$first.Tail -or !$other.Tail -or $first.Tail -eq $other.Tail)

                if ($compatible) {
                    $compatibleRestList.Add($other)
                }
            }
        }
        $compatibleRest = $compatibleRestList.ToArray()

        $currentWithFirst = $CurrentCombination + $first

        # Recursive call with the first element using the filtered list
        [Archetype[][]]$combinationsWithFirst = @(Find-ArchitypeCombinations -Archetypes $compatibleRest -StartIndex 0 -CurrentCombination $currentWithFirst) ?? @(, @())

        $result.AddRange($combinationsWithoutFirst) | Out-Null
        $result.AddRange($combinationsWithFirst) | Out-Null
        return $result
    }
}

function New-PeridotArchitypeCombination {
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
