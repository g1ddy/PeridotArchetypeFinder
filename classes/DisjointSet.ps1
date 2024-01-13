# Define a class for a disjoint-set
class DisjointSet {
    [hashtable]$Parent
    [hashtable]$Rank

    # Define a constructor for the disjoint-set
    DisjointSet ($vertices) {
        $this.Parent = @{}
        $this.Rank = @{}
        foreach ($v in $vertices) {
            $this.Parent[$v] = $v # Each vertex is its own parent initially
            $this.Rank[$v] = 0 # Each vertex has rank 0 initially
        }
    }

    # Find the representative of a vertex using path compression
    [string] Find ($x) {
        # Check if the vertex exists in the hashtable
        if (!$x -or !$this.Parent.ContainsKey($x)) {
            return ""
        }
        if ($this.Parent[$x] -ne $x) {
            $this.Parent[$x] = $this.Find($this.Parent[$x])
        }
        return $this.Parent[$x]
    }

    # Merge two sets using union by rank
    [void] Union ($x, $y) {
        $xroot = $this.Find($x)
        $yroot = $this.Find($y)
        if ($xroot -eq $yroot) {
            return
        }
        if ($this.Rank[$xroot] -lt $this.Rank[$yroot]) {
            $this.Parent[$xroot] = $yroot
        }
        elseif ($this.Rank[$xroot] -gt $this.Rank[$yroot]) {
            $this.Parent[$yroot] = $xroot
        }
        else {
            $this.Parent[$yroot] = $xroot
            $this.Rank[$xroot] += 1
        }
    }
}
