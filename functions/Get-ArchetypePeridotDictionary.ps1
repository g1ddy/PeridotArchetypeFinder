function Get-ArchetypePeridotDictionary {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes,
        [Peridot[]]$Peridots
    )
    Set-StrictMode -Version Latest
    $ErrorActionPreference = "Stop"

    $archetypeWithPeridots = @{}
    foreach ($peridot in $Peridots) {
        $matchingArchetypes = New-Object System.Collections.ArrayList
        foreach ($archetype in $Archetypes) {
            if ($peridot.MatchesArchetype($archetype)) {
                $matchingArchetypes.Add($archetype.Name) | Out-Null
            }
        }

        if ($matchingArchetypes.Count -gt 0) {
            $hashKey = $peridot.GetId()
            $archetypeWithPeridots[$hashKey] = $matchingArchetypes
        }
    }

    return $archetypeWithPeridots
}