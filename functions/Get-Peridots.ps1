function Get-Peridots {
    [CmdletBinding()]
    param(
        [ValidateScript({ if ($_) { Test-Path $_ } })]
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    process {
        $peridotHash = @{}

        Import-Csv -Path $Path | ForEach-Object {
            $hashObject = @{}
            $_.PSObject.Properties.ForEach({ $hashObject[$_.Name] = $_.Value })
            $peridotHash.Add($hashObject.Name, [Peridot]$hashObject)
        }

        $peridotHash.Values
    }
}
