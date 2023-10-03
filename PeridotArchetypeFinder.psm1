$imports = "classes", "functions", "globals" |
    ForEach-Object { Join-Path $PSScriptRoot $_ } |
    Where-Object { Test-Path $_ } |
    Get-ChildItem -Include '*.ps1' -Exclude '*.Tests.ps1' -Recurse

$imports | ForEach-Object {
    # Logging
    Write-Verbose "Importing class $($_.Name)"

    Import-Module $_.FullName -Force
}
