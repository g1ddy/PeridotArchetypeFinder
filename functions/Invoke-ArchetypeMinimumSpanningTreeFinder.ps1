function Invoke-ArchetypeMinimumSpanningTreeFinder {
    [CmdletBinding()]
    param(
        [string]$ArchetypePath = "$PSScriptRoot\..\assets\Archetypes.csv",
        [string]$PeridotPath = "$PSScriptRoot\..\assets\Peridots.csv",
        [switch]$IncludePeridots
    )
    begin {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"
    }
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        $archetypes = Get-Archetypes -Path $ArchetypePath

        $peridotCombinations = Invoke-PeridotCombinationGenerator -Archetypes $archetypes
        $allPeridotArchetypeDictionary = Get-PeridotArchetypeDictionary -Archetypes $archetypes -Peridots $peridotCombinations

        $peridots = Get-Peridots -Path $PeridotPath
        $samplePeridotArchetypeDictionary = Get-PeridotArchetypeDictionary -Archetypes $archetypes -Peridots $peridots

        $graphNodes = Get-GraphNodes -ArchetypeDictionary $allPeridotArchetypeDictionary `
            -PeridotDictionary $samplePeridotArchetypeDictionary `
            -IncludePeridots:$IncludePeridots

        $graph = Get-ArchetypeGraph -GraphNodes $graphNodes

        # Find MST using Kruskal's algorithm
        $mst = Kruskal $graph
        $mst = Get-SortedGraph -Edges $mst

        Format-ArchetypeTree -Edges $mst
    }
}

function Get-GraphNodes {
    param(
        $ArchetypeDictionary,
        $PeridotDictionary,
        $IncludePeridots
    )

    $achievedArchetypes = New-Object System.Collections.Generic.HashSet[string]
    $graphNodes = @()

    if ($IncludePeridots) {
        $PeridotDictionary.GetEnumerator() |
            ForEach-Object {
                $hashKey = $_.Key.Replace(', ', ',')
                $matchingArchetypes = $_.Value.Archetypes
                $matchingArchetypes | ForEach-Object { $achievedArchetypes.Add($_) | Out-Null }

                if ($_.Value.Archetypes.Count -gt 1) {
                    $achievedArchetypes.Add($_.Key) | Out-Null
                }

                $_.Value.Peridots | ForEach-Object {
                    $peridotName = $_.Name

                    if ($matchingArchetypes) {
                        $peridotName += " (${hashKey})"
                    }

                    $graphNodes += @{
                        Name       = $peridotName
                        Generation = $_.Generation
                        Peridot    = $_
                        IsArchetype = $false
                    }
                }
            }
    }

    $ArchetypeDictionary.GetEnumerator() |
        Where-Object {
            $undiscoveredArchetypes = ($_.Value.Archetypes | Where-Object { $achievedArchetypes -notcontains $_ })
            $_.Value.Archetypes.Count -eq 1 -and $undiscoveredArchetypes
        } |
        ForEach-Object {
            $namePrefix = $IncludePeridots ? "New Archetype: " : ""
            $graphNodes += @{
                Name        = "${namePrefix}$($_.Key)"
                Peridot     = $_.Value.Peridots[0]
                IsArchetype = $true
            }
        }

    return $graphNodes | Sort-Object -Property Generation, Name
}

function Get-ArchetypeGraph {
    param(
        $GraphNodes
    )

    $verticesHashSet = New-Object System.Collections.Generic.HashSet[string]
    $edges = @()

    $GraphNodesCount = $GraphNodes.Count

    # Iterate through all GraphNodes to create edges
    for ($i = 0; $i -lt $GraphNodesCount; $i++) {
        $currentGraphNode = $GraphNodes[$i]
        $archetype1Name = $currentGraphNode.Name
        $archetype1Peridot = $currentGraphNode.Peridot

        for ($j = $i + 1; $j -lt $GraphNodesCount; $j++) {
            $otherGraphNode = $GraphNodes[$j]
            $archetype2Name = $otherGraphNode.Name
            $archetype2Peridot = $otherGraphNode.Peridot

            $archetypeDistance = $archetype1Peridot.GetDistance($archetype2Peridot)
            $isParent = $archetypeDistance -eq 0

            $edge = New-Object Edge $archetype1Name, $archetype2Name, $archetypeDistance

            # Skip edges if there's no relationship
            if ($edge.Weight -lt 0) {
                continue
            }

            $verticesHashSet.Add($archetype1Name) | Out-Null
            $verticesHashSet.Add($archetype2Name) | Out-Null

            $edges += $edge

            # Relationship is one directional if is parent or peridot points to an archetype
            if ($isParent -or !$currentGraphNode.IsArchetype) {
                continue
            }

            $archetypeDistance = $archetype2Peridot.GetDistance($archetype1Peridot)
            $edge = New-Object Edge $archetype2Name, $archetype1Name, $archetypeDistance
            $edges += $edge
        }
    }

    # Create graph
    $vertices = [System.Collections.ArrayList]@($verticesHashSet)
    $graph = [Graph]::new($vertices, $edges)

    return $graph
}

# Define a function for Kruskal's algorithm
function Kruskal ($graph) {
    $vertices = $graph.Vertices
    $edges = $graph.Edges

    # Sort the edges by weight
    $E = $edges | Sort-Object -Property Weight

    # Create a disjoint-set for the vertices
    $ds = [DisjointSet]::new($Vertices)
    $verticesCount = $Vertices.Count

    # Initialize an empty array for the MST
    $mst = @()

    # Loop through the edges
    foreach ($edge in $E) {
        # Check if the edge creates a cycle
        $source = $ds.Find($edge.Source)
        $destination = $ds.Find($edge.Destination)

        if ($source -ne $destination) {
            # Add the edge to the MST
            $mst += $edge
            # Merge the sets of the edge endpoints
            $ds.Union($edge.Source, $edge.Destination)
        }
        # Stop if the MST has V - 1 edges
        if ($mst.Count -eq $verticesCount - 1) {
            break
        }
    }

    # Return the MST
    return $mst
}

function Format-ArchetypeTree {
    [CmdletBinding()]
    param(
        [Edge[]]$Edges
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        Write-Output '# Peridot Archetype MST Tree'
        Write-Output ''

        Write-Output '```mermaid'
        Write-Output 'flowchart'
        Write-Output ''

        # Format $Edges using MermaidJS syntax
        $Edges |
            ForEach-Object {
                $edge = $_
                $sourceName = $edge.Source.Replace(' ', '_')
                $destinationName = $edge.Destination.Replace(' ', '_')

                if ($sourceName.Contains('(')) {
                    $sourceName = ($sourceName -Split '_\(')[0]
                    $sourceName += "(""$($edge.Source)"")"
                }

                if ($destinationName.Contains('(')) {
                    $destinationName = ($destinationName -Split '_\(')[0]
                    $destinationName += "(""$($edge.Destination)"")"
                }

                # $linkLength = '.' * [Math]::Ceiling($edge.Weight / 3)
                $linkLength = $edge.Weight -eq 0 ? '' : '.'
                $link = "-${linkLength}->"
                Write-Output "${sourceName} ${link} ${destinationName}"
            }

        Write-Output '```'
        Write-Output ''
    }
}
