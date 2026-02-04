# scripts/benchmark-GetSortedGraph.ps1
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$classDir = Join-Path $PSScriptRoot ".." "classes"
$funcDir = Join-Path $PSScriptRoot ".." "functions"

# Load Edge class
$graphPath = (Resolve-Path (Join-Path $classDir "Graph.ps1")).Path
. $graphPath

# Load Get-SortedGraph function
$getSortedGraphPath = (Resolve-Path (Join-Path $funcDir "Get-SortedGraph.ps1")).Path
. $getSortedGraphPath

# Graph Generation Helper
function New-RandomGraph {
    param([int]$VertexCount, [int]$EdgeCount)

    $vertices = 1..$VertexCount | ForEach-Object { "V$_" }
    $edges = [System.Collections.Generic.List[Edge]]::new()

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
# V=1000, E=3000 (smaller than Kruskal since recursion is very slow)
$vertexCount = 1000
$edgeCount = 3000
$graph = New-RandomGraph -VertexCount $vertexCount -EdgeCount $edgeCount
Write-Host "Graph generated with $vertexCount vertices and $edgeCount edges."

Write-Host "Converting Edges to Array..."
$edgesArray = $graph.Edges.ToArray()
Write-Host "Edges count: $($edgesArray.Count)"

Write-Host "Running Get-SortedGraph (Baseline)..."
$sw = [System.Diagnostics.Stopwatch]::StartNew()
try {
    $sortedEdges = Get-SortedGraph -Edges $edgesArray
    $sw.Stop()
    $time = $sw.ElapsedMilliseconds
    Write-Host "Get-SortedGraph Time: $time ms"
    Write-Host "Sorted Edges Count: $($sortedEdges.Count)"
}
catch {
    Write-Host "Error running Get-SortedGraph: $_"
    # If recursion depth exceeded, print warning
    if ($_.Exception.Message -match "recursion") {
        Write-Host "Recursion limit exceeded with current input size."
    }
}
