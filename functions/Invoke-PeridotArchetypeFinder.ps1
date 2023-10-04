function Invoke-PeridotArchetypeFinder {
    [CmdletBinding()]
    param(
        [string]$Path = "$PSScriptRoot\..\assets\Archetype.csv"
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        $archetypes = Get-Archetypes -Path $Path

        $peridotCombinations = Invoke-PeridotCombinationGenerator -Archetypes $archetypes

        Format-PeridotArchetype -Archetypes $archetypes -Peridots $peridotCombinations
    }
}

function Get-Archetypes {
    [CmdletBinding()]
    param(
        [ValidateScript({ if ($_) { Test-Path $_ } })]
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    process {
        $archetypeHash = @{}

        Import-Csv -Path $Path | ForEach-Object {
            $hashObject = @{}
            $_.PSObject.Properties.ForEach({ $hashObject[$_.Name] = $_.Value })
            $archetypeHash.Add($hashObject.Name, [Archetype]$hashObject)
        }

        $archetypeHash.Values
    }
}

function Format-PeridotArchetype {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes,
        [Peridot[]]$Peridots
    )
    process {
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

            if ($matchingArchetypes.Count -gt 1) {
                $hashKey = ($matchingArchetypes | Sort-Object) -join ', '
                if (!$peridotsWithArchetypes.ContainsKey($hashKey)) {
                    $peridotArchetypeList = @{
                        peridots = New-Object 'System.Collections.Generic.List[Peridot]'
                        count    = $matchingArchetypes.Count
                    }
                    $peridotsWithArchetypes.Add($hashKey, $peridotArchetypeList) | Out-Null
                }

                $peridotsWithArchetypes[$hashKey].peridots.Add($peridot) | Out-Null
            }
        }

        Write-Output "# Peridot with Multi Archetype"
        $orderedPeridotsArchetypes = $peridotsWithArchetypes.GetEnumerator() | Sort-Object -Property @{Expression = { $_.Value.count }; Descending = $true }, Key
        $orderedPeridotsArchetypes | ForEach-Object {
            $archetypeKey = $_.Key
            $archetypeCount = $_.Value.count

            Write-Output "## Archetypes: $archetypeKey, Count: $archetypeCount"

            $archetypeNames = $_.Key.Split(', ')
            $matchingArchetypes = $Archetypes | Where-Object { $archetypeNames.Contains($_.Name) } | Sort-Object -Property Name
            $matchingArchetypes | Format-MarkdownTableTableStyle Name, Ear, Face, Horn, Material, Pattern, Plumage, Tail -ShowMarkdown -DoNotCopyToClipboard -HideStandardOutput

            Write-Output ''
        }
    }
}
