function Invoke-ArchetypeMinimumSpanningTreeFinder {
    [CmdletBinding()]
    param(
        [string]$ArchetypePath = "$PSScriptRoot\..\assets\Archetypes.csv"
    )
    begin {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"
    }
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        $archetypes = Get-Archetypes -Path $ArchetypePath # |
        # Sort-Object -Property Name
        $graph = Get-ArchetypeGraph -Archetypes $archetypes

        # Find MST using Kruskal's algorithm
        $mst = Kruskal $graph
        # $mst = $graph.Edges | Where-Object { $_.Weight -lt 3.5 }

        Format-ArchetypeTree -Edges $mst
    }
}

function Get-ArchetypeGraph {
    param (
        [Parameter(Mandatory = $true)]
        [System.Collections.Generic.List[Archetype]]$Archetypes
    )

    $verticesHashSet = New-Object System.Collections.Generic.HashSet[string]
    $edges = @()

    # Iterate through all archetypes to create edges
    for ($i = 0; $i -lt $Archetypes.Count; $i++) {
        for ($j = $i + 1; $j -lt $Archetypes.Count; $j++) {
            $archetype1 = $Archetypes[$i]
            $archetype2 = $Archetypes[$j]

            $edge = New-Object Edge $archetype1.Name, $archetype2.Name, $archetype1.GetDistance($archetype2)
            # $edge = New-Object Edge $archetype2.Name, $archetype1.Name, $archetype2.GetDistance($archetype1)

            if ($edge.Weight -lt 0) {
                continue
            }

            $verticesHashSet.Add($archetype1.Name) | Out-Null
            $verticesHashSet.Add($archetype2.Name) | Out-Null

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
                Write-Output "${sourceName} --> ${destinationName}"
            }

        Write-Output '```'
        Write-Output ''
    }
}
