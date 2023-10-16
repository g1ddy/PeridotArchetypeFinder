```mermaid
erDiagram

alpha-1 {
    Archetype None
    Pattern Chromatic
    Horns Goat
    Plumage Spades
    Material Iridescent
    Face Diamond
    Ears Square
}

alpha-1 ||--|| bravo-2 : v
alpha-1 ||--||  beta-2 : v

bravo-2 ||--|| charlie-3 : v
beta-2 ||--|| canary-3  : v

charlie-3 ||--|| delta-4 : v
charlie-3 ||--|| dolphin-4 : v

delta-4 ||--|| jammie-5 : v
delta-4 ||--|| echo-5  : v

jammie-5 ||--|| lilith-6 : v
echo-5 ||--|| foxtrot-6  : v

lilith-6 ||--|| maximus-7 : v
foxtrot-6 ||--|| goldie-7 : v

maximus-7 ||--|| noise-8  : v
goldie-7 ||--|| harry-8 : v
goldie-7 ||--|| icarus-8 : v

icarus-8 ||--|| jewelfish-9 : v
noise-8 ||--|| orion-9  : v

jewelfish-9 ||--|| krypto-10 : v
jewelfish-9 ||--|| queezy-10  : v

krypto-10 ||--|| lychee-11 : v
queezy-10 ||--|| rockstar-11 : v

rockstar-11 ||--|| slushy-12 : v

```

```mermaid
classDiagram

class alpha-1 {
    Archetype None
    Pattern Chromatic
    Horns Goat
    Plumage Spades
    Material Iridescent
    Face Diamond
    Ears Square
    Archetype None()
}
``````