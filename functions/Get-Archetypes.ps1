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
            if ($hashObject.ContainsKey('Color')) {
                $hashObject['ColorRequirement'] = $hashObject['Color']
                $hashObject.Remove('Color')
            }
            $archetypeHash.Add($hashObject.Name, [Archetype]$hashObject)
        }

        $archetypeHash.Values
    }
}
