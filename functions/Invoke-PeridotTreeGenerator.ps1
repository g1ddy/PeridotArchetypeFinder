function Invoke-PeridotTreeGenerator {
    [CmdletBinding()]
    param(
        [string]$ArchetypePath = "$PSScriptRoot\..\assets\Archetypes.csv",
        [string]$PeridotPath = "$PSScriptRoot\..\assets\Peridots.csv"
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        $archetypes = Get-Archetypes -Path $ArchetypePath
        $peridots = Get-Peridots -Path $PeridotPath

        Format-PeridotTree -Archetypes $archetypes -Peridots $peridots
    }
}

function Format-PeridotTree {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes,
        [Peridot[]]$Peridots
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        Write-Output '# Peridot Family Tree'
        Write-Output ''

        Write-Output '```mermaid'
        Write-Output 'flowchart'
        Write-Output ''

        $orderedPeridots = $Peridots.GetEnumerator() | Sort-Object -Property Generation, Parent, Name

        $orderedPeridots | ForEach-Object {
            $peridot = $_

            $matchingArchetypes = New-Object System.Collections.ArrayList
            foreach ($archetype in $Archetypes) {
                if ($peridot.MatchesArchetype($archetype)) {
                    $matchingArchetypes.Add($archetype.Name) | Out-Null
                }
            }

            $peridotId = $peridot.GetId()
            $peridotName = $peridot.Name

            if ($matchingArchetypes) {
                $hashKey = ($matchingArchetypes | Sort-Object) -join ','
                $peridotName += " (${hashKey})"
            }

            $peridotNode = "${peridotId}(""<img src='./assets/Peridots/${peridotId}.jpg'> <br /> ${peridotName}"")"

            if (!$peridot.Parent) {
                Write-Output $peridotNode
                return
            }

            $parentGeneration = $peridot.Generation - 1
            $parentId = "$($peridot.Parent.ToLowerInvariant())-${parentGeneration}"
            Write-Output "${parentId} --> ${peridotNode}"
        }

        Write-Output '```'
        Write-Output ''
    }
}
