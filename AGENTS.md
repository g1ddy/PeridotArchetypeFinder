# Repository Instructions

This project requires **PowerShell 7**. Keep `Set-StrictMode -Version Latest` at the top of scripts.

Tests must be executed with `Invoke-Pester`.

The module depends on the `FormatMarkdownTable` module.

`Archetype.ColorRequirement` is used as a flag (often `"x"`) that requires a Peridot's color to match the archetype name. Use this property for color restrictions.
