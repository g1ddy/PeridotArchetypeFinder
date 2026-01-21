#!/bin/bash
set -e

echo "Starting verification for PeridotArchetypeFinder environment..."

# 1. Check PowerShell
if ! command -v pwsh &> /dev/null; then
    echo "Error: PowerShell (pwsh) is not found."
    exit 1
fi
echo "PowerShell version: $(pwsh --version)"

# 2. Check Required Modules
echo "Checking required PowerShell modules..."
REQUIRED_MODULES=("FormatMarkdownTable" "Pester")
MISSING_MODULES=0

for module in "${REQUIRED_MODULES[@]}"; do
    if ! pwsh -Command "if (Get-Module -ListAvailable -Name $module) { exit 0 } else { exit 1 }" > /dev/null 2>&1; then
        echo "Error: Module '$module' is missing."
        MISSING_MODULES=1
    else
        echo "Module '$module' is present."
    fi
done

if [ $MISSING_MODULES -ne 0 ]; then
    echo "Verification Failed: One or more required modules are missing."
    exit 1
fi

# 3. Dry run of Pester tests
echo "Attempting to discover Pester tests (Dry Run)..."
# We skip the actual run, just verify discovery works
if ! pwsh -Command "Invoke-Pester -Configuration @{ Run = @{ Path = 'tests'; SkipRun = \$true; Exit = \$true } }" > /dev/null; then
     echo "Error: Failed to discover Pester tests."
     exit 1
fi

echo "Verification Passed. Environment is healthy."
