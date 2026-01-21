# Repository Instructions

This project requires **PowerShell 7**. Keep `Set-StrictMode -Version Latest` at the top of scripts.

Tests must be executed with `Invoke-Pester`.

The module depends on the `FormatMarkdownTable` module.

`Archetype.ColorRequirement` is used as a flag (often `"x"`) that requires a Peridot's color to match the archetype name. Use this property for color restrictions.

## Environment Setup and Verification

To set up and verify the environment (e.g. on a Jules VM or Ubuntu), run the verify script:

```bash
./scripts/verify.sh
```

This script will:
1.  Run `scripts/setup.sh` to install PowerShell 7 and required modules (`FormatMarkdownTable`, `Pester`).
    *   *Note: This step uses `sudo` and may prompt for your password.*
2.  Verify that dependencies are correctly installed.
3.  Perform a dry-run of the tests to ensure the test runner is working.

## Running Tests

After setup, run tests using:

```powershell
Invoke-Pester
```
