# tests/Get-SortedGraph.Unit.Tests.ps1
$modulePath = Split-Path $PSScriptRoot
# If PSScriptRoot is empty (e.g. run from interactive session without context), assume current dir is root/tests
if (-not $PSScriptRoot) {
    $PSScriptRoot = Join-Path (Get-Location) "tests"
}

$moduleName = 'PeridotArchetypeFinder'
# Adjust path if we are in tests/
$moduleFile = Join-Path (Split-Path $PSScriptRoot) "$moduleName.psd1"

if (-not (Test-Path $moduleFile)) {
    Throw "Module file not found at $moduleFile"
}

Import-Module $moduleFile -Force

Set-StrictMode -Version Latest

InModuleScope $moduleName {
    Describe 'Get-SortedGraph' {

        # We need Edge class. It should be available in module scope.
        # But for creating test data, we might need to access it.
        # Since classes are exported to global scope if defined in module manifest using ScriptsToProcess?
        # No, they are dot-sourced in .psm1.
        # If the module is imported, classes defined in it are available if they are in .ps1 files dot-sourced.
        # But wait, classes in PowerShell are scoped.
        # If they are defined in module scope, they are only visible there unless `using module` is used.
        # However, `Import-Module` runs the .psm1.
        # .psm1 dot-sources the class files.
        # So the classes are defined in the module scope.
        # To use them in the test (outside module scope), we might have trouble unless we use `InModuleScope`.

        It 'Should sort edges by connectivity and weight' {
            # We are inside InModuleScope, so [Edge] should be available.
            $e1 = [Edge]::new('A', 'B', 10)
            $e2 = [Edge]::new('B', 'C', 5)
            $e3 = [Edge]::new('A', 'D', 20)

            $edges = @($e3, $e1, $e2)

            $result = Get-SortedGraph -Edges $edges

            $result.Count | Should -Be 3
            $result[0] | Should -Be $e1
            $result[1] | Should -Be $e3
            $result[2] | Should -Be $e2
        }

        It 'Should handle disconnected components' {
            $e1 = [Edge]::new('A', 'B', 10)
            $e2 = [Edge]::new('C', 'D', 10)

            $edges = @($e1, $e2)

            $result = Get-SortedGraph -Edges $edges

            $result.Count | Should -Be 2
            # Order between components depends on how newRoot picks.
            # If weight is same (10), newRoot logic picks most common source.
            # Here: A->B, C->D. Frequencies: A:1, B:0, C:1, D:0 (as sources).
            # A and C have count 1.
            # Sort-Object -Property Count Descending, Name
            # If count same, Name sorts alphabetically. A comes before C.
            # So A should be picked first.

            $result[0] | Should -Be $e1
            $result[1] | Should -Be $e2
        }
    }
}
