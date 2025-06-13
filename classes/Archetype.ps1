Set-StrictMode -Version Latest

Class Archetype {
    [string]$Name
    [string]$Pattern
    [string]$Tail
    [string]$Horn
    [string]$Plumage
    [string]$Material
    [string]$Face
    [string]$Ear
    # Indicates that this archetype has a color requirement. Any non-empty value
    # represents that the Peridot's color must match this archetype's name.
    [string]$ColorRequirement
}
