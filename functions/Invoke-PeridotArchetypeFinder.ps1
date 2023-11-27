function Invoke-PeridotArchetypeFinder {
    [CmdletBinding()]
    param(
        [string]$ArchetypePath = "$PSScriptRoot\..\assets\Archetypes.csv",
        [string]$PeridotPath = "$PSScriptRoot\..\assets\Peridots.csv"
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        $archetypes = Get-Archetypes -Path $ArchetypePath

        $peridotCombinations = Invoke-PeridotCombinationGenerator -Archetypes $archetypes
        $allPeridotArchetypeDictionary = Get-PeridotArchetypeDictionary -Archetypes $archetypes -Peridots $peridotCombinations


        $peridots = Get-Peridots -Path $PeridotPath
        $samplePeridotArchetypeDictionary = Get-PeridotArchetypeDictionary -Archetypes $archetypes -Peridots $peridots

        Format-PeridotArchetype -Archetypes $archetypes `
            -AllPeridotsWithArchetypes $allPeridotArchetypeDictionary `
            -PeridotArchetypeDictionary $samplePeridotArchetypeDictionary
    }
}

function Format-PeridotArchetype {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes,
        [hashtable]$AllPeridotsWithArchetypes,
        [hashtable]$SamplePeridotsWithArchetypes
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"


        Write-Output '# Peridot with Multi Archetype'
        Write-Output ''

        $orderedPeridotsArchetypes = $AllPeridotsWithArchetypes.GetEnumerator() | Sort-Object -Property @{Expression = { $_.Value.count }; Descending = $true }, Key
        $orderedPeridotsArchetypes | ForEach-Object {
            $archetypeKey = $_.Key
            $archetypeCount = $_.Value.count

            Write-Output "## Archetypes: $archetypeKey, Count: $archetypeCount"

            Write-Output '### Compatibility Table:'
            $archetypeNames = $_.Key.Split(', ')
            $matchingArchetypes = $Archetypes | Where-Object { $archetypeNames.Contains($_.Name) } | Sort-Object -Property Name
            $matchingArchetypes | Format-MarkdownTableTableStyle Name, Ear, Face, Horn, Material, Pattern, Plumage, Tail -ShowMarkdown -DoNotCopyToClipboard -HideStandardOutput

            if ($SamplePeridotsWithArchetypes.ContainsKey($archetypeKey)) {
                Write-Output '### Example(s):'
                $matchingPeridots = $SamplePeridotsWithArchetypes[$archetypeKey].peridots

                foreach ($peridot in $matchingPeridots) {
                    $peridotId = $peridot.GetId()
                    $peridotName = $peridot.Name

                    $peridotNode = "![${peridotName}](./assets/Peridots/${peridotId}.jpg)"

                    Write-Output $peridotNode
                }
            }

            Write-Output ''
        }
    }
}
