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
        return "$($this.Name.ToLowerInvariant())-$($this.Generation)"
    }

    [bool] MatchesArchetype([object]$archetype) {
        $matchesArchetype = $this.GetMatchPercentage($archetype) -ge 1
        $matchesColor = !$archetype.Color -or !$this.Color -or $archetype.Name -eq $this.Color

        return $matchesArchetype -and $matchesColor
    }

    [double] GetMatchPercentage([object]$archetype) {
        $properties = $archetype | Get-Member -MemberType Properties | Select-Object -ExpandProperty Name
            | Where-Object { $archetype.$_ -and $_ -notin @('Name', 'Color') }
        
        # force to return as array
        $properties = @($properties)
        $totalProperties = $properties.Count

        if ($totalProperties -eq 0) {
            return 1
        }

        $matchingProperties = 0

        foreach ($property in $properties) {
            if ($this.$property -eq $archetype.$property) {
                $matchingProperties++
            }
        }

        $matchPercentage = ($matchingProperties / $totalProperties)
        return $matchPercentage
    }
}
