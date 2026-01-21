# Repository Instructions

This project requires **PowerShell 7**. Keep `Set-StrictMode -Version Latest` at the top of scripts.

Tests must be executed with `Invoke-Pester`.

The module depends on the `FormatMarkdownTable` module.

`Archetype.ColorRequirement` is used as a flag (often `"x"`) that requires a Peridot's color to match the archetype name. Use this property for color restrictions.

## Environment Setup

To set up the environment (e.g. on a Jules VM or Ubuntu), run the setup script:

```bash
sudo ./scripts/setup.sh
```

This script will:
1.  Install PowerShell 7 (pwsh).
2.  Install the required PowerShell modules: `FormatMarkdownTable` and `Pester`.

To verify that the environment is correctly set up, run:

```bash
./scripts/verify.sh
```

## Running Tests

After setup, run tests using:

```powershell
Invoke-Pester
```
