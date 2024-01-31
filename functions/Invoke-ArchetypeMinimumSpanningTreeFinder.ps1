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
        $mst = $mst | Sort-Object -Property Source, Destination

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
                $_.Value.Archetypes | ForEach-Object { $achievedArchetypes.Add($_) | Out-Null }
                $_.Value.Peridots | ForEach-Object {
                    $graphNodes += @{
                        Name    = $_.Name
                        Peridot = $_
                    }
                }
            }
    }

    $ArchetypeDictionary.GetEnumerator() |
        Where-Object {
            $_.Value.Archetypes.Count -eq 1 -and $achievedArchetypes -notcontains $_.Key
        } |
        ForEach-Object {
            $namePrefix = $IncludePeridots ? "New Archetype: " : ""
            $graphNodes += @{
                Name    = "${namePrefix}$($_.Key)"
                Peridot = $_.Value.Peridots[0]
            }
        }

    return $graphNodes | Sort-Object -Property Name
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
        $archetype1Name = $GraphNodes[$i].Name
        $archetype1Peridot = $GraphNodes[$i].Peridot

        for ($j = $i + 1; $j -lt $GraphNodesCount; $j++) {
            $archetype2Name = $GraphNodes[$j].Name
            $archetype2Peridot = $GraphNodes[$j].Peridot

            $isParent = ($archetype2Peridot.Parent -eq $archetype1Peridot.Name) -and ($archetype2Peridot.Generation - 1 -eq $archetype1Peridot.Generation)
            $isChild = ($archetype1Peridot.Parent -eq $archetype2Peridot.Name) -and ($archetype1Peridot.Generation - 1 -eq $archetype2Peridot.Generation)

            $archetypeDistance = $isParent -or $isChild ? 0 : $archetype1Peridot.GetDistance($archetype2Peridot)

            $edge = New-Object Edge $archetype1Name, $archetype2Name, $archetypeDistance

            # Skip edges if there's no relationship
            if ($edge.Weight -lt 0) {
                continue
            }

            $verticesHashSet.Add($archetype1Name) | Out-Null
            $verticesHashSet.Add($archetype2Name) | Out-Null
            
            $edges += $edge

            # Relationship is one directional if the distance is 0
            if ($edge.Weight -eq 0) {
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
                # Write-Output "${sourceName} --['$($edge.Weight)']--> ${destinationName}"
                $link = $edge.Weight -eq 0 ? '-->': '-.->'
                Write-Output "${sourceName} ${link} ${destinationName}"
            }

        Write-Output '```'
        Write-Output ''
    }
}
