function Invoke-FindMissingArchetypes {
    [CmdletBinding()]
    param(
        [int]$Take = 10,
        [string]$ArchetypePath = "$PSScriptRoot\..\assets\Archetypes.csv",
        [string]$PeridotPath = "$PSScriptRoot\..\assets\Peridots.csv"
    )
    begin {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"
    }
    process {
        $archetypes = Get-Archetypes -Path $ArchetypePath

        $peridots = Get-Peridots -Path $PeridotPath
        $peridotArchetypeDictionary = Get-PeridotArchetypeDictionary -Archetypes $archetypes -Peridots $peridots

        $achievedArchetypes = New-Object System.Collections.Generic.HashSet[string]
        $peridotArchetypeDictionary.Keys | ForEach-Object {
            $individualArchetypes = $_.Split(', ')
            $individualArchetypes | ForEach-Object { $achievedArchetypes.Add($_) | Out-Null }
        }
        $undiscoveredArchetypes = $archetypes | Where-Object { $achievedArchetypes -notcontains $_.Name }

        $undiscoveredArchetypes | ForEach-Object {
            $outputFileName = "Peridot-ArchetypeFinder-$($_.Name).md"
            $parentFolder = Split-Path -Path $PSScriptRoot -Parent
            $outputPath = Join-Path -Path $parentFolder -ChildPath $outputFileName

            Find-ArchetypePeridot -TargetArchetype $_.Name `
                -Archetype $_ -AllPeridots $peridots `
                -Take $Take | Out-File -FilePath $outputPath
        }
    }
}