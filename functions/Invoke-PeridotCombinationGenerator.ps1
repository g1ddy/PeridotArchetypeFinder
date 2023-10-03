function Invoke-PeridotCombinationGenerator {
    [CmdletBinding()]
    param(
        [Archetype[]]$Archetypes
    )
    process {
        Set-StrictMode -Version Latest

        if (!$Archetypes) {
            throw "Archetypes cannot be null"
        }

        $patterns = @($archetypes.Pattern | Get-Unique)
        $tails = @($archetypes.Tail | Get-Unique)
        $horns = @($archetypes.Horn | Get-Unique)
        $plumages = @($archetypes.Plumage | Get-Unique)
        $materials = @($archetypes.Material | Get-Unique)
        $faces = @($archetypes.Face | Get-Unique)
        $ears = @($archetypes.Ear | Get-Unique)

        foreach ($pattern in $patterns) {
            foreach ($tail in $tails) {
                foreach ($horn in $horns) {
                    foreach ($plumage in $plumages) {
                        foreach ($material in $materials) {
                            foreach ($face in $faces) {
                                foreach ($ear in $ears) {
                                    [Peridot]::new($pattern, $tail, $horn, $plumage, $material, $face, $ear)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
