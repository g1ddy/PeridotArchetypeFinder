function Get-SortedGraph {
    [CmdletBinding()]
    param(
        [Edge[]]$Edges,
        [Edge[]]$SortedEdges = @()
    )

    # 1. Pre-processing: Index edges by Source
    # Use OrderedDictionary to preserve order for deterministic "Restart" behavior
    $edgesBySource = [System.Collections.Specialized.OrderedDictionary]::new()
    $totalEdges = 0

    if ($Edges) {
        foreach ($edge in $Edges) {
            if (-not $edgesBySource.Contains($edge.Source)) {
                $edgesBySource[$edge.Source] = [System.Collections.Generic.List[Edge]]::new()
            }
            $edgesBySource[$edge.Source].Add($edge)
            $totalEdges++
        }
    }

    # 2. Initialize result and active sources
    $finalSortedEdges = [System.Collections.Generic.List[Edge]]::new()
    $activeSources = [System.Collections.Generic.HashSet[string]]::new()

    if ($SortedEdges) {
        $finalSortedEdges.AddRange($SortedEdges)
        foreach ($edge in $SortedEdges) {
            [void]$activeSources.Add($edge.Destination)
        }
    }

    # Comparer for sorting edges
    # Explicitly cast to System.Comparison[Edge] for robustness
    $comparer = [System.Comparison[Edge]]{
        param($a, $b)
        $diff = $a.Weight - $b.Weight
        if ($diff -ne 0) { return $diff }
        $diff = [string]::Compare($a.Source, $b.Source, [System.StringComparison]::InvariantCultureIgnoreCase)
        if ($diff -ne 0) { return $diff }
        return [string]::Compare($a.Destination, $b.Destination, [System.StringComparison]::InvariantCultureIgnoreCase)
    }

    # 3. Main Loop
    while ($totalEdges -gt 0) {
        $candidates = [System.Collections.Generic.List[Edge]]::new()

        # 3a. Find candidates from active sources
        # Iterate over a copy of activeSources keys because we modify activeSources later (and clear it now)
        # Actually we clear it immediately.

        # We need to iterate the sources.
        # Note: If activeSources is large, this loop is fast.
        # Lookup in edgesBySource is O(1).

        foreach ($source in $activeSources) {
            if ($edgesBySource.Contains($source)) {
                $candidates.AddRange($edgesBySource[$source])
                $edgesBySource.Remove($source)
            }
        }
        $activeSources.Clear()

        # 3b. Restart Logic (if no candidates found from active sources)
        if ($candidates.Count -eq 0) {
            if ($edgesBySource.Count -eq 0) {
                break
            }

            # Get first key/value efficiently
            $enum = $edgesBySource.GetEnumerator()
            [void]$enum.MoveNext()
            $firstEntry = $enum.Entry
            $firstSource = $firstEntry.Key
            $firstEdgeList = $firstEntry.Value
            $newRoot = $firstEdgeList[0]

            if ($newRoot.Weight -ne 0) {
                # Find most common source
                $sourceCounts = [System.Collections.Generic.List[PSObject]]::new()
                foreach ($key in $edgesBySource.Keys) {
                    $count = $edgesBySource[$key].Count
                    $obj = [PSCustomObject]@{ Name = $key; Count = $count }
                    $sourceCounts.Add($obj)
                }

                # Explicitly cast to System.Comparison[PSObject] for robustness
                $sourceCounts.Sort([System.Comparison[PSObject]]{
                    param($a, $b)
                    # Descending Count
                    $diff = $b.Count - $a.Count
                    if ($diff -ne 0) { return $diff }
                    # Ascending Name
                    return [string]::Compare($a.Name, $b.Name, [System.StringComparison]::InvariantCultureIgnoreCase)
                })

                $bestSource = $sourceCounts[0].Name
                $candidates.AddRange($edgesBySource[$bestSource])
                $edgesBySource.Remove($bestSource)
            }
            else {
                # Use the first source found
                $candidates.AddRange($firstEdgeList)
                $edgesBySource.Remove($firstSource)
            }
        }
        
        # 3c. Sort candidates and update state
        if ($candidates.Count -gt 0) {
            $candidates.Sort($comparer)

            $finalSortedEdges.AddRange($candidates)
            $totalEdges -= $candidates.Count

            foreach ($edge in $candidates) {
                [void]$activeSources.Add($edge.Destination)
            }
        }
    }

    return $finalSortedEdges
}
