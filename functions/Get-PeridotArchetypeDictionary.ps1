function Get-PeridotArchetypeDictionary {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes,
        [Peridot[]]$Peridots
    )
    Set-StrictMode -Version Latest
    $ErrorActionPreference = "Stop"

    $peridotsWithArchetypes = @{}
    foreach ($peridot in $Peridots) {
        $matchingArchetypes = New-Object System.Collections.ArrayList
        foreach ($archetype in $Archetypes) {
            if ($peridot.MatchesArchetype($archetype)) {
                $matchingArchetypes.Add($archetype.Name) | Out-Null
            }
        }

        $hashKey = ($matchingArchetypes | Sort-Object) -join ', '
        if (!$peridotsWithArchetypes.ContainsKey($hashKey)) {
            $peridotArchetypeList = @{
                Peridots = New-Object 'System.Collections.Generic.List[Peridot]'
                Archetypes    = $matchingArchetypes
            }
            $peridotsWithArchetypes.Add($hashKey, $peridotArchetypeList) | Out-Null
        }

        $peridotsWithArchetypes[$hashKey].Peridots.Add($peridot) | Out-Null
    }

    return $peridotsWithArchetypes
}