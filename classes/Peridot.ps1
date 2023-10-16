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

    [bool] MatchesArchetype([object]$archetype) {
        $matchesArchetype = (!$archetype.Ear -or $this.Ear -eq $archetype.Ear) -and
            (!$archetype.Face -or $this.Face -eq $archetype.Face) -and
            (!$archetype.Horn -or $this.Horn -eq $archetype.Horn) -and
            (!$archetype.Material -or $this.Material -eq $archetype.Material) -and
            (!$archetype.Pattern -or $this.Pattern -eq $archetype.Pattern) -and
            (!$archetype.Plumage -or $this.Plumage -eq $archetype.Plumage) -and
            (!$archetype.Tail -or $this.Tail -eq $archetype.Tail)

        return $matchesArchetype
    }
}
