# scripts/benchmark_kruskal.ps1
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$classDir = Join-Path $PSScriptRoot ".." "classes"

# Load classes
$dsPath = (Resolve-Path (Join-Path $classDir "DisjointSet.ps1")).Path
$graphPath = (Resolve-Path (Join-Path $classDir "Graph.ps1")).Path

. $dsPath
. $graphPath

# Pre-sorted Kruskal Loop (Original)
function Kruskal_Loop_Original ($Vertices, $SortedEdges) {
    # Create a disjoint-set for the vertices
    $ds = [DisjointSet]::new($Vertices)
    $verticesCount = $Vertices.Count

    # Initialize an empty array for the MST
    $mst = @()

    # Loop through the edges
    foreach ($edge in $SortedEdges) {
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

    return $mst
}

# Pre-sorted Kruskal Loop (Optimized)
function Kruskal_Loop_Optimized ($Vertices, $SortedEdges) {
    # Create a disjoint-set for the vertices
    $ds = [DisjointSet]::new($Vertices)
    $verticesCount = $Vertices.Count

    # Initialize a generic List for the MST
    $mst = [System.Collections.Generic.List[Edge]]::new()

    # Loop through the edges
    foreach ($edge in $SortedEdges) {
        # Check if the edge creates a cycle
        $source = $ds.Find($edge.Source)
        $destination = $ds.Find($edge.Destination)

        if ($source -ne $destination) {
            # Add the edge to the MST
            $mst.Add($edge)
            # Merge the sets of the edge endpoints
            $ds.Union($edge.Source, $edge.Destination)
        }
        # Stop if the MST has V - 1 edges
        if ($mst.Count -eq $verticesCount - 1) {
            break
        }
    }

    return $mst
}

# Graph Generation Helper
function New-RandomGraph {
    param([int]$VertexCount, [int]$EdgeCount)

    $vertices = 1..$VertexCount | ForEach-Object { "V$_" }
    $edges = New-Object System.Collections.Generic.List[Edge]

    $rng = [System.Random]::new()

    for ($i = 0; $i -lt $EdgeCount; $i++) {
        $v1 = $vertices[$rng.Next(0, $VertexCount)]
        $v2 = $vertices[$rng.Next(0, $VertexCount)]
        while ($v1 -eq $v2) {
            $v2 = $vertices[$rng.Next(0, $VertexCount)]
        }
        $weight = $rng.NextDouble() * 100
        $edges.Add([Edge]::new($v1, $v2, $weight))
    }

    return [Graph]::new($vertices, $edges)
}

Write-Host "Generating graph..."
# V=3000 to stress test +=
$vertexCount = 3000
$edgeCount = 10000
$graph = New-RandomGraph -VertexCount $vertexCount -EdgeCount $edgeCount
Write-Host "Graph generated with $vertexCount vertices and $edgeCount edges."

Write-Host "Sorting edges..."
$sortedEdges = $graph.Edges | Sort-Object -Property Weight
Write-Host "Edges sorted."

Write-Host "Running Original Loop..."
$sw = [System.Diagnostics.Stopwatch]::StartNew()
$mstOriginal = Kruskal_Loop_Original $graph.Vertices $sortedEdges
$sw.Stop()
$originalTime = $sw.ElapsedMilliseconds
Write-Host "Original Loop Time: $originalTime ms"
Write-Host "MST Size: $($mstOriginal.Count)"

Write-Host "Running Optimized Loop..."
$sw.Restart()
$mstOptimized = Kruskal_Loop_Optimized $graph.Vertices $sortedEdges
$sw.Stop()
$optimizedTime = $sw.ElapsedMilliseconds
Write-Host "Optimized Loop Time: $optimizedTime ms"
Write-Host "MST Size: $($mstOptimized.Count)"

if ($originalTime -gt 0) {
    $improvement = ($originalTime - $optimizedTime) / $originalTime * 100
    Write-Host "Improvement: $($improvement.ToString('F2'))%"
}
