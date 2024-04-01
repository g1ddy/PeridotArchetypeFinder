function Get-SortedGraph {
    [CmdletBinding()]
    param(
        [Edge[]]$Edges,
        [Edge[]]$SortedEdges = @()
    )
    process {
        # Terminating condition
        if (!$Edges) {
            return $SortedEdges
        }

        $newSources = ($SortedEdges | Select-Object -ExpandProperty Destination) ?? @()
        $currentEdges = ($Edges | Where-Object { $newSources.Contains($_.Source) })

        if (!$currentEdges) {
            $newRoot = $Edges[0]

            if ($newRoot.Weight -ne 0) {
                $mostCommon = $Edges | Group-Object -Property Source |
                    Sort-Object -Property @{Expression = { $_.Count }; Descending = $true }, Name
                $newRoot = $mostCommon[0].Group[0]
            }
            
            $newSource = $newRoot.Source
            $currentEdges = ($Edges | Where-Object { $_.Source -eq $newSource }) ?? @()
        }

        $currentEdges = $currentEdges |
            Sort-Object -Property Weight, Source, Destination
        
        $SortedEdges += $currentEdges
        $Edges = ($Edges | Where-Object { $_ -notin $currentEdges })

        return Get-SortedGraph -Edges $Edges -SortedEdges $SortedEdges
    }
}
