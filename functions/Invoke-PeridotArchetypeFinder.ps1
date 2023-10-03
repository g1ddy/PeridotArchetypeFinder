function Invoke-PeridotArchetypeFinder {
    [CmdletBinding()]
    param(
        [string]$Path = "$PSScriptRoot\..\assets\Archetype.csv"
    )
    process {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"

        $archetypes = Get-Archetypes -Path $Path

        $peridotCombinations = Invoke-PeridotCombinationGenerator -Archetypes $archetypes
    }
}

function Get-Archetypes {
    [CmdletBinding()]
    param(
        [ValidateScript({ if ($_) { Test-Path $_ } })]
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    process {
        $archetypeHash = @{}

        Import-Csv -Path $Path | ForEach-Object {
            $hashObject = @{}
            $_.PSObject.Properties.ForEach({ $hashObject[$_.Name] = $_.Value })
            $archetypeHash.Add($hashObject.Archetype, [Archetype]$hashObject)
        }

        $archetypeHash.Values
    }
}
