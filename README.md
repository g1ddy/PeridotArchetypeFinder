# PeridotArchetypeFinder

## About the project

Peridot is a game by Niantic, Inc. This console app helps you find Peridot combinations with multiple Archetypes.

In this game you can Hatch new unique Peridots that can vary in color and traits, such as:

- Ear
- Face
- Horn
- Material
- Pattern
- Plumage
- Tail

Certain combinations of said traits, can lead to your Peridot being classified as an Archetype.
e.g. Cotton Candy Archetype can be achieved by having a pastel colored Peridot with Narwhal horn and Furry material

Peridots with multiple Archetypes are very sought after. They can be hard to achieve as you have to find a combination of Archetypes (and their underlying traits) that either overlap or don't conflict with each other. e.g.:

### Archetypes: Cotton Candy, Rabbit

| Name         | Ear    | Face | Horn    | Material | Pattern | Plumage | Tail   |
| :----------- | :----- | :--- | :------ | :------- | :------ | :------ | :----- |
| Cotton Candy |        |      | Narwhal | Furry    |         |         |        |
| Rabbit       | Rabbit |      |         |          |         |         | Rabbit |

## Getting Started

This is a PowerShell module that loads predetermined Archetypes from a CSV file and outputs possible Peridot combinations with more than 1 Archetype in a Markdown table format.

For your convenience a version of the generated Markdown and Archetype combinations can be found here:

[Peridot Archetypes.md](./Peridot%20Archetypes.md)

### Prerequisites

[FormatPowerShellToMarkdownTable](https://github.com/microsoft/FormatPowerShellToMarkdownTable)

```powershell
Install-Module FormatMarkdownTable
```

Before running this script please make sure this list is up to date as new Archetypes are constantly being introduced in the game:
[Archetype.csv](./assets/Archetypes.csv)

## Installation

1. Clone the repo:
    ```powershell
    git clone https://github.com/g1ddy/PeridotArchetypeFinder.git
    ```
2. Import module:
    ```powershell
    Import-Module .\PeridotArchetypeFinder.psm1 -Force
    ```

## Usage

1. Invoke the module:
    ```powershell
    Invoke-PeridotArchetypeFinder | Set-Clipboard
    ```
2. Paste the output in the Markdown view of your choice

## TODO

- [x] Optimize recursive algorithm to not continue down tree path if Archetype combination is not feasible
- [ ] Identify a way to eliminate Archetype combinations that are not feasible due to color conflicts
- [ ] Github workflow implementation to auto update Peridot Archetype.md
- [x] Determine pattern to best represent Peridot family tree and MermaidJS Diagram
- [ ] Store Peridot family tree information in JSON format
- [ ] Suggest new possible multi-archetype combinations based on your dot family tree and their traits
