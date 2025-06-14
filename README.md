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

[Peridot-Archetypes.md](./Peridot-Archetypes.md)


There is also other functionality specific to your Peridot family.
Other resources that this module can generate include:

- [Peridot-FamilyTree.md](./Peridot-FamilyTree.md) - Your peridots represented as a family tree
- [Peridot-ArchetypeTreeMST.md](./Peridot-ArchetypeTreeMST-.md) - Your family tree with suggestions to achieve missing AT

## Usage

This repo uses GitHub Workflows to run the PowerShell Scripts and generate the Markdown resources mentioned above based on the Archetypes and Peridots CSV files. To get a [Peridot-FamilyTree.md](./Peridot-FamilyTree.md) or [Peridot-ArchetypeTreeMST.md](./Peridot-ArchetypeTreeMST-.md) specific to your peridots all you would need to do is create a branch with your updated [Peridots.csv](./assets/Peridots.csv) and it should generate these files for you in your branch.

1. Clone the repo:

    ```powershell
    git clone https://github.com/g1ddy/PeridotArchetypeFinder.git
    ```

2. Populate the [Peridots.csv](./assets/Peridots.csv) with your Peridots

3. Create a branch, commit and push:

    ```powershell
    git checkout -b your-username-update-markdown
    git add .\assets\Peridots.csv
    git commit -m "Update Peridots.csv"
    git push --set-upstream origin your-username-update-markdown
    ```

4. You should now be able to look at this page to see the resources for your specific Peridots:

   <https://github.com/g1ddy/PeridotArchetypeFinder/pull/new/your-username-update-markdown>

## Local Usage and Development

Please follow these instructions if you would like to contribute to this repository or run the code locally instead to run this code locally.

### Prerequisites

[FormatPowerShellToMarkdownTable](https://github.com/microsoft/FormatPowerShellToMarkdownTable)

```powershell
Install-Module FormatMarkdownTable
```

Before running this script please make sure this list is up to date as new Archetypes are constantly being introduced in the game:
[Archetypes.csv](./assets/Archetypes.csv)

### Archetype Combination Finder Usage

1. Invoke the module:

    ```powershell
    Import-Module .\PeridotArchetypeFinder.psm1 -Force
    Invoke-PeridotArchetypeFinder | Set-Content .\Peridot-Archetypes.md
    ```

2. Read the output in the Markdown view of your choice

### Peridot Archetype Peridot Finder Usage

1. Invoke the module:

    ```powershell
    Import-Module .\PeridotArchetypeFinder.psm1 -Force
    Find-ArchetypePeridot -TargetArchetype 'Cactus' | Set-Content .\Peridot-ArchetypeFinder-Cactus.md
    Find-ArchetypePeridot -TargetArchetype 'Elixir' | Set-Content .\Peridot-ArchetypeFinder-Elixir.md
    Find-ArchetypePeridot -TargetArchetype 'Jester' | Set-Content .\Peridot-ArchetypeFinder-Jester.md
    ```

2. Read the output in the Markdown view of your choice

### Archetype Minimum Spanning Tree Usage

1. Populate the [Peridots.csv](./assets/Peridots.csv) with your Peridots
2. Invoke the MST Tree Generator function:

    ```powershell
    Import-Module .\PeridotArchetypeFinder.psm1 -Force
    Invoke-ArchetypeMinimumSpanningTreeFinder | Set-Content .\Peridot-ArchetypeTree.md
    Invoke-ArchetypeMinimumSpanningTreeFinder -IncludePeridots | Set-Content .\Peridot-ArchetypeTreeMST.md
    Invoke-ArchetypeMinimumSpanningTreeFinder -PeridotPath ./assets/External.csv -IncludePeridots | Set-Content .\Peridot-ArchetypeTreeMST-Jinx007.md
    ```

3. Read the output in the Markdown view of your choice
4. Sample output can be found [here](./Peridot-ArchetypeTreeMST-.md)

### Family Tree Usage

1. Populate the [Peridots.csv](./assets/Peridots.csv) with your Peridots
2. Invoke the Tree Generator function:

    ```powershell
    Invoke-PeridotTreeGenerator | Set-Content .\Peridot-FamilyTree.md
    Invoke-PeridotTreeGenerator -PeridotPath ./assets/External.csv | Set-Content .\Peridot-FamilyTree-External.md
    ```

3. Read the output in the Markdown view of your choice
4. Sample output can be found [here](./Peridot-FamilyTree.md)

## TODO

- [x] Optimize recursive algorithm to not continue down tree path if Archetype combination is not feasible
- [ ] Identify a way to eliminate Archetype combinations that are not feasible due to color conflicts
- [x] Github workflow implementation to auto update Peridot Archetype.md
- [x] Determine pattern to best represent Peridot family tree and MermaidJS Diagram
- [x] Store Peridot family tree information in ~~JSON~~ CSV format
- [x] Suggest new possible ~~multi-~~archetype combinations based on your dot family tree and their traits
