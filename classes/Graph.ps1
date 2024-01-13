# Define a class for the edges in the graph
class Edge {
    [string]$Source
    [string]$Destination
    [double]$Weight

    Edge([string]$Source, [string]$Destination, [double]$Weight) {
        $this.Source = $Source
        $this.Destination = $Destination
        $this.Weight = $Weight
    }

    # Define a comparison method for sorting edges by weight
    static [int] Compare ($e1, $e2) {
        return $e1.Weight - $e2.Weight
    }
}

# Define a class for the graph to construct MST using Kruskal's algorithm
class Graph {
    [string[]]$Vertices
    [System.Collections.Generic.List[Edge]]$Edges

    Graph([string[]]$Vertices) {
        $this.Vertices = $Vertices
        $this.Edges = New-Object System.Collections.Generic.List[Edge]
    }

    Graph([string[]]$Vertices, [System.Collections.Generic.List[Edge]]$Edges) {
        $this.Vertices = $Vertices
        $this.Edges = $Edges
    }

    # Add an edge to the graph
    [void] AddEdge([Edge]$edge) {
        $this.Edges.Add($edge)
    }
}
