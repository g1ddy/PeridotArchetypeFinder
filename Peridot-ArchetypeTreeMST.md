# Peridot Archetype MST Tree

```mermaid
flowchart

Alpha --> Beta
Alpha --> Bravo
Beta --> Canary("Canary (Patchwork)")
Beta --> Chevron("Chevron (Ram)")
Bravo --> Charlie
Canary("Canary (Patchwork)") --> Dill-Hulk("Dill-Hulk (Patchwork)")
Canary("Canary (Patchwork)") --> Draco("Draco (Balloon,Patchwork)")
Charlie --> Delta
Charlie --> Dolphin
Chevron("Chevron (Ram)") --> Damascus("Damascus (Kintsugi,Ram)")
Chevron("Chevron (Ram)") --> Dorado("Dorado (24Karat,Ram)")
Chevron("Chevron (Ram)") --> Duranium("Duranium (Patina,Ram)")
Chevron("Chevron (Ram)") --> Echelon("Echelon (Bismuth,Ram)")
Damascus("Damascus (Kintsugi,Ram)") --> Enrichment("Enrichment (Kintsugi,Royalty)")
Damascus("Damascus (Kintsugi,Ram)") --> Escorpio
Delta --> Echo("Echo (Static)")
Delta --> Jammie
Dill-Hulk("Dill-Hulk (Patchwork)") --> Escrow("Escrow (Rabbit,Scarecrow,Static)")
Dorado("Dorado (24Karat,Ram)") --> Entropy("Entropy (Clownfish,Ram)")
Dorado("Dorado (24Karat,Ram)") --> Ether("Ether (Celestial,Ram)")
Echo("Echo (Static)") --> Foxtrot("Foxtrot (Unicorn)")
Echo("Echo (Static)") --> Frosty("Frosty (Ram,Static)")
Enrichment("Enrichment (Kintsugi,Royalty)") --> Fable("Fable (Kintsugi,Rabbit,Royalty)")
Entropy("Entropy (Clownfish,Ram)") --> Farceratops("Farceratops (Ram)")
Entropy("Entropy (Clownfish,Ram)") --> Fishline("Fishline (Clownfish)")
Entropy("Entropy (Clownfish,Ram)") --> Floofish("Floofish (Clownfish,Monkey)")
Fable("Fable (Kintsugi,Rabbit,Royalty)") --> Glacier("Glacier (Icicle,Rabbit)")
Fable("Fable (Kintsugi,Rabbit,Royalty)") --> Goldilocks("Goldilocks (Royalty)")
Farceratops("Farceratops (Ram)") --> Grazerface("Grazerface (Triceratops)")
Fishline("Fishline (Clownfish)") --> Guardian("Guardian (Clownfish,Yeti)")
Floofish("Floofish (Clownfish,Monkey)") --> Guina
Foxtrot("Foxtrot (Unicorn)") --> Goldie
Foxtrot("Foxtrot (Unicorn)") --> Goral("Goral (Clownfish,Unicorn)")
Glacier("Glacier (Icicle,Rabbit)") --> Hailstorm
Goldie --> Harry
Goldie --> Icarus
Guardian("Guardian (Clownfish,Yeti)") --> Hydrostatic("Hydrostatic (Clownfish,Dandelion)")
Guardian("Guardian (Clownfish,Yeti)") -.-> New_Archetype:_Banana
Guina --> Hammerhead("Hammerhead (Seal,Static)")
Guina --> Hippogriff("Hippogriff (Cheetah)")
Guina --> Hypnos
Hailstorm --> Iceberg("Iceberg (Icicle,Snowfall)")
Hailstorm --> Imugi("Imugi (Triton)")
Harry --> Isla("Isla (Beach)")
Hippogriff("Hippogriff (Cheetah)") --> Incense
Hypnos --> Imhotep("Imhotep (Scarab)")
Hypnos --> Instar("Instar (Bee)")
Icarus --> Jax("Jax (Clownfish)")
Icarus --> Jewelfish("Jewelfish (Clownfish,Rabbit)")
Imugi("Imugi (Triton)") -.-> New_Archetype:_Elixir
Imhotep("Imhotep (Scarab)") --> Jormungandr("Jormungandr (Static)")
Incense -.-> New_Archetype:_Embers
Isla("Isla (Beach)") --> Jubilee("Jubilee (Cinnabon)")
Jammie --> Lilith
Jax("Jax (Clownfish)") --> Kalypso("Kalypso (Clownfish,Glam)")
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)")
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Kandle
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Krypto("Krypto (Dewdrop,Rabbit)")
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Queezy("Queezy (Peacock)")
Jormungandr("Jormungandr (Static)") --> Kira("Kira (Dragon,Static)")
Jubilee("Jubilee (Cinnabon)") --> Khroma("Khroma (Chameleon)")
Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)") --> Lagostosa("Lagostosa (Clownfish,Lobster)")
Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)") --> Mastodon("Mastodon (Anemone,Snowfall)")
Kandle --> Lampent("Lampent (Candle,Clownfish)")
Krypto("Krypto (Dewdrop,Rabbit)") --> Lychee("Lychee (Boba,Rabbit,Static)")
Lagostosa("Lagostosa (Clownfish,Lobster)") -.-> New_Archetype:_Axolotl
Lilith --> Maximus
Mastodon("Mastodon (Anemone,Snowfall)") --> Night_Snow("Night Snow (Gargoyle)")
Maximus --> Noise("Noise (Static)")
New_Archetype:_Axolotl -.-> New_Archetype:_Jellyfish
New_Archetype:_Banana -.-> New_Archetype:_Cactus
New_Archetype:_Elixir -.-> New_Archetype:_Jester
Night_Snow("Night Snow (Gargoyle)") --> Om-Nominous("Om-Nominous (Watermelon)")
Noise("Noise (Static)") --> Orion("Orion (Aurora)")
Orion("Orion (Aurora)") --> Phenotype("Phenotype (Sunset)")
Orion("Orion (Aurora)") --> Predator("Predator (Vampire)")
Queezy("Queezy (Peacock)") --> Rockstar("Rockstar (Peacock,Psychedelic)")
Rockstar("Rockstar (Peacock,Psychedelic)") --> Skittles
Rockstar("Rockstar (Peacock,Psychedelic)") --> Slushy("Slushy (Cotton Candy)")
Skittles --> Trailmix("Trailmix (Paint)")
Skittles --> Turducken("Turducken (LED,Peacock)")
Slushy("Slushy (Cotton Candy)") --> Trifecta
```
