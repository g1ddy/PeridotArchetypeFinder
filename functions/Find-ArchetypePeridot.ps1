function Find-ArchetypePeridot{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$TargetArchetype,
        [Archetype]$Archetype,
        [Peridot[]]$AllPeridots,
        [int]$Take
    )
    begin {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"
    }
    process {
        $archetypePeridotDictionary = Get-ArchetypePeridotDictionary -Archetypes $Archetype -Peridots $AllPeridots

        Write-Output '# Peridot closest to Archetype'
        Write-Output ''

        Write-Output "## Target Archetype: $($Archetype.Name)"
        $Archetype | Format-MarkdownTableTableStyle Name, Ear, Face, Horn, Material, Pattern, Plumage, Tail -ShowMarkdown -DoNotCopyToClipboard -HideStandardOutput

        $orderedPeridots = $AllPeridots | ForEach-Object {
            $peridot = [Peridot]$_
            $matchPercentage = $peridot.GetMatchPercentage($Archetype)

            [pscustomobject]@{
                Peridot         = $peridot
                MatchPercentage = $matchPercentage
            }
        } | Sort-Object -Property @{Expression = 'MatchPercentage'; Descending = $true },
        @{Expression = { $_.Peridot.Name }; Descending = $true }

        $orderedPeridots |
            Where-Object { $_.MatchPercentage -gt 0 } |
            Select-Object -First $Take | ForEach-Object {
                $peridot = $_.Peridot
                $peridotId = $peridot.GetId()
                $peridotName = $peridot.Name
                $matchPercentage = $_.MatchPercentage

                Write-Output "## Peridot: $peridotName, Score: $matchPercentage"
                Write-Output ''

                # $peridotNode = "![${peridotName}](./assets/Peridots/${peridotId}.jpg)"
                # Write-Output $peridotNode

                Write-Output '### Peridot Traits:'
                $peridot | Format-MarkdownTableTableStyle Name, Ear, Face, Horn, Material, Pattern, Plumage, Tail -ShowMarkdown -DoNotCopyToClipboard -HideStandardOutput

                if ($archetypePeridotDictionary.ContainsKey($peridotId)) {
                    Write-Output '### Compatibility Table:'
                    $archetypeNames = $archetypePeridotDictionary[$peridotId]
                    $matchingArchetypes = $Archetypes | Where-Object { $archetypeNames.Contains($_.Name) } | Sort-Object -Property Name
                    $matchingArchetypes | Format-MarkdownTableTableStyle Name, Ear, Face, Horn, Material, Pattern, Plumage, Tail -ShowMarkdown -DoNotCopyToClipboard -HideStandardOutput
                }
            }
    }
}
