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

[Peridot Archetypes.md](./Peridot-Archetypes.md)

### Prerequisites

[FormatPowerShellToMarkdownTable](https://github.com/microsoft/FormatPowerShellToMarkdownTable)

```powershell
Install-Module FormatMarkdownTable
```

Before running this script please make sure this list is up to date as new Archetypes are constantly being introduced in the game:
[Archetypes.csv](./assets/Archetypes.csv)

## Installation

1. Clone the repo:
    ```powershell
    git clone https://github.com/g1ddy/PeridotArchetypeFinder.git
    ```
2. Import module:
    ```powershell
    Import-Module .\PeridotArchetypeFinder.psm1 -Force
    ```

## Archetype Combination Finder Usage

1. Invoke the module:
    ```powershell
    Invoke-PeridotArchetypeFinder | Set-Content .\Peridot-Archetypes.md
    ```
2. Read the output in the Markdown view of your choice

## Peridot Archetype Peridot Finder Usage

1. Invoke the module:
    ```powershell
    Invoke-ArchetypePeridotFinder -TargetArchetype 'Cactus' | Set-Content .\Peridot-ArchetypeFinder-Cactus.md
    Invoke-ArchetypePeridotFinder -TargetArchetype 'Cheetah' | Set-Content .\Peridot-ArchetypeFinder-Cheetah.md
    Invoke-ArchetypePeridotFinder -TargetArchetype 'Cinnabon' | Set-Content .\Peridot-ArchetypeFinder-Cinnabon.md
    Invoke-ArchetypePeridotFinder -TargetArchetype 'Elixir' | Set-Content .\Peridot-ArchetypeFinder-Elixir.md
    Invoke-ArchetypePeridotFinder -TargetArchetype 'LED' | Set-Content .\Peridot-ArchetypeFinder-LED.md
    ```
2. Read the output in the Markdown view of your choice

## Family Tree Usage

1. Populate the [Peridots.csv](./assets/Peridots.csv) with your Peridots
2. Invoke the Tree Generator function:
    ```powershell
    Invoke-PeridotTreeGenerator | Set-Content .\Peridot-FamilyTree.md
    ```
3. Read the output in the Markdown view of your choice
4. Sample output can be found [here](./Peridot-FamilyTree.md)

## TODO

- [x] Optimize recursive algorithm to not continue down tree path if Archetype combination is not feasible
- [ ] Identify a way to eliminate Archetype combinations that are not feasible due to color conflicts
- [ ] Github workflow implementation to auto update Peridot Archetype.md
- [x] Determine pattern to best represent Peridot family tree and MermaidJS Diagram
- [x] Store Peridot family tree information in ~~JSON~~ CSV format
- [x] Suggest new possible ~~multi-~~archetype combinations based on your dot family tree and their traits
