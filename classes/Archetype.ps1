Set-StrictMode -Version Latest

Class Archetype {
    [string]$Name
    [string]$Pattern
    [string]$Tail
    [string]$Horn
    [string]$Plumage
    [string]$Material
    [string]$Face
    [string]$Ear
    [string]$Color

    [double] GetDistance([Archetype]$otherArchetype) {
        $properties = $otherArchetype | Get-Member -MemberType Properties | Select-Object -ExpandProperty Name
            | Where-Object {$_ -notin @('Name', 'Color') }

        # force to return as array
        $properties = @($properties)
        $totalProperties = $properties.Count

        $complexityIndex = 0
        $matchingProperties = 0

        foreach ($property in $properties) {
            if (!$this.$property -and !$otherArchetype.$property) {
                $complexityIndex = $complexityIndex + 0.3
            }
            elseif ($this.$property -eq $otherArchetype.$property) {
                $matchingProperties++
            }
        }

        if ($matchingProperties -eq 0)
        {
            return -1
        }

        $matchDistance = $totalProperties - $matchingProperties - $complexityIndex
        return $matchDistance
    }
}
