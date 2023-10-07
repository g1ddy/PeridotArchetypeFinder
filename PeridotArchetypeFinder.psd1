@{
    RootModule    = 'PeridotArchetypeFinder.psm1'
    ModuleVersion = '0.0.1'
    Author        = 'g1ddy'
    Description   = 'A PowerShell module designed to find Peridots that have multiple Archetypes'
    GUID          = 'd0706a46-e375-4570-8bb7-bc44fe2897cd'
    RequiredModules = @(
        'FormatMarkdownTable'
    )
    FunctionsToExport = @(
        'Invoke-PeridotArchetypeFinder'
    )
}

