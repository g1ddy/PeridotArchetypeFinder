function Invoke-PeridotArchetypeFinder {
    [CmdletBinding()]
    param(
        [string]$Path = "$PSScriptRoot\..\assets\Archetype.csv"
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        $archetypeHash = @{}

        Import-Csv -Path $Path | ForEach-Object {
            $hashObject = @{}
            $_.PSObject.Properties.ForEach({ $hashObject[$_.Name] = $_.Value })
            $archetypeHash.Add($hashObject.Archetype, [Archetype]$hashObject)
        }

        $archetypeHash.Values
    }
}
