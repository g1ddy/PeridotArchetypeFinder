function Invoke-ArchetypePeridotFinder {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$TargetArchetype,
        [int]$Take = 10,
        [string]$ArchetypePath = "$PSScriptRoot\..\assets\Archetypes.csv",
        [string]$PeridotPath = "$PSScriptRoot\..\assets\Peridots.csv"
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        $archetypes = Get-Archetypes -Path $ArchetypePath
        $archetype = $archetypes | Where-Object { $_.Name -eq $TargetArchetype }

        $allPeridots = Get-Peridots -Path $PeridotPath
        $archetypePeridotDictionary = Get-ArchetypePeridotDictionary -Archetypes $archetypes -Peridots $allPeridots

        Format-Peridots -Archetype $archetype -AllPeridots $allPeridots `
            -ArchetypeWithPeridots $archetypePeridotDictionary `
            -Take $Take
    }
}

function Format-Peridots {
    [CmdletBinding()]
    param(
        [Archetype]$Archetype,
        [Peridot[]]$AllPeridots,
        [hashtable]$ArchetypeWithPeridots,
        [int]$Take
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

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

                if ($ArchetypeWithPeridots.ContainsKey($peridotId)) {
                    Write-Output '### Compatibility Table:'
                    $archetypeNames = $ArchetypeWithPeridots[$peridotId]
                    $matchingArchetypes = $Archetypes | Where-Object { $archetypeNames.Contains($_.Name) } | Sort-Object -Property Name
                    $matchingArchetypes | Format-MarkdownTableTableStyle Name, Ear, Face, Horn, Material, Pattern, Plumage, Tail -ShowMarkdown -DoNotCopyToClipboard -HideStandardOutput
                }
            }
    }
}
