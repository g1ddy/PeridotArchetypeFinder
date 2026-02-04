param(
    [int]$Count = 15
)

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$repoRoot = Resolve-Path "$root/.."

# Source Classes
Get-ChildItem "$repoRoot/classes/*.ps1" | ForEach-Object { . $_.FullName }

# Source Functions
. "$repoRoot/functions/Get-Archetypes.ps1"
. "$repoRoot/functions/Invoke-PeridotCombinationGenerator.ps1"

# Load Data
$csvPath = "$repoRoot/assets/Archetypes.csv"
$allArchetypes = @(Get-Archetypes -Path $csvPath)

Write-Host "Total Archetypes available: $($allArchetypes.Count)"
$subset = $allArchetypes | Select-Object -First $Count
Write-Host "Benchmarking with first $Count archetypes..."

$time = Measure-Command {
    $result = Invoke-PeridotCombinationGenerator -Archetypes $subset
}

Write-Host "Time: $($time.TotalMilliseconds) ms"
Write-Host "Found $($result.Count) combinations."
