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
    # When non-empty (commonly 'x'), this value indicates the archetype has a
    # color requirement. In that case a Peridot's color must match the
    # archetype's Name.
    [string]$Color
}
