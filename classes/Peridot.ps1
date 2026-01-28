Set-StrictMode -Version Latest

Class Peridot {
    [int]$Generation
    [string]$Name
    [string]$Color
    [string]$Parent

    [string]$Pattern
    [string]$Tail
    [string]$Horn
    [string]$Plumage
    [string]$Material
    [string]$Face
    [string]$Ear

    # Static list of properties to check
    static hidden [string[]] $TraitProperties = @('Pattern', 'Tail', 'Horn', 'Plumage', 'Material', 'Face', 'Ear')

    Peridot() {}

    Peridot(
        [string]$pattern,
        [string]$tail,
        [string]$horn,
        [string]$plumage,
        [string]$material,
        [string]$face,
        [string]$ear
    ) {
        $this.Pattern = $pattern
        $this.Tail = $tail
        $this.Horn = $horn
        $this.Plumage = $plumage
        $this.Material = $material
        $this.Face = $face
        $this.Ear = $ear
    }

    [string] GetId() {
        $peridotName = $this.Name.ToLowerInvariant().Replace(' ', '-')
        return "${peridotName}-$($this.Generation)"
    }

    [bool] MatchesArchetype([object]$archetype) {
        $matchesArchetype = $this.GetMatchPercentage($archetype) -ge 1
        $matchesColor = $true
        if ($archetype.PSObject.Properties.Name -contains 'ColorRequirement') {
            $matchesColor = !$archetype.ColorRequirement -or !$this.Color -or $archetype.Name -eq $this.Color
        } elseif ($archetype.PSObject.Properties.Name -contains 'Color') {
            $matchesColor = !$archetype.Color -or !$this.Color -or $archetype.Name -eq $this.Color
        }

        return $matchesArchetype -and $matchesColor
    }

    [double] GetMatchPercentage([object]$archetype) {
        $totalProperties = 0
        $matchingProperties = 0

        foreach ($property in [Peridot]::TraitProperties) {
            # Check if property is set on the archetype (truthy check)
            # This mimics the original behavior: Where-Object { $archetype.$_ ... }
            $val = $archetype.$property
            if ($val) {
                $totalProperties++
                if ($this.$property -eq $val) {
                    $matchingProperties++
                }
            }
        }

        if ($totalProperties -eq 0) {
            return 1
        }

        $matchPercentage = ($matchingProperties / $totalProperties)
        return $matchPercentage
    }

    [double] GetDistance([Peridot]$otherPeridot) {
        if ($this.Name -eq $otherPeridot.Parent -and ($this.Generation -eq $otherPeridot.Generation - 1)) {
            return 0
        }

        $totalProperties = [Peridot]::TraitProperties.Count

        $complexityIndex = 0

        foreach ($property in [Peridot]::TraitProperties) {
            if (!$this.$property) {
                $complexityIndex++
            }
        }

        $matchPercentage = $this.GetMatchPercentage($otherPeridot)
        if ($matchPercentage -eq 0) {
            return -1
        }

        $complexityIndex /= $totalProperties
        return 4 - $matchPercentage * 3 - $complexityIndex
    }
}
