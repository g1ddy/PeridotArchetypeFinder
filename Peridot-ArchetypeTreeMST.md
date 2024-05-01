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
Damascus("Damascus (Kintsugi,Ram)") --> Eldritch("Eldritch (Kintsugi)")
Damascus("Damascus (Kintsugi,Ram)") --> Enrichment("Enrichment (Kintsugi,Royalty)")
Damascus("Damascus (Kintsugi,Ram)") --> Escorpio
Delta --> Echo("Echo (Static)")
Delta --> Jammie
Dill-Hulk("Dill-Hulk (Patchwork)") --> Eclair("Eclair (Banana)")
Dill-Hulk("Dill-Hulk (Patchwork)") --> Escrow("Escrow (Rabbit,Scarecrow,Static)")
Dorado("Dorado (24Karat,Ram)") --> Entropy("Entropy (Clownfish,Ram)")
Dorado("Dorado (24Karat,Ram)") --> Ether("Ether (Celestial,Ram)")
Echo("Echo (Static)") --> Foxtrot("Foxtrot (Unicorn)")
Echo("Echo (Static)") --> Frosty("Frosty (Ram,Static)")
Eclair("Eclair (Banana)") --> Fishhook("Fishhook (Cactus)")
Enrichment("Enrichment (Kintsugi,Royalty)") --> Fable("Fable (Kintsugi,Rabbit,Royalty)")
Entropy("Entropy (Clownfish,Ram)") --> Farceratops("Farceratops (Ram)")
Entropy("Entropy (Clownfish,Ram)") --> Fishline("Fishline (Clownfish)")
Entropy("Entropy (Clownfish,Ram)") --> Floofish("Floofish (Clownfish,Monkey)")
Ether("Ether (Celestial,Ram)") --> Fafnir("Fafnir (Celestial)")
Jammie --> Lilith
Fable("Fable (Kintsugi,Rabbit,Royalty)") --> Glacier("Glacier (Icicle,Rabbit)")
Fable("Fable (Kintsugi,Rabbit,Royalty)") --> Goldilocks("Goldilocks (Royalty)")
Farceratops("Farceratops (Ram)") --> Grazerface("Grazerface (Triceratops)")
Fishline("Fishline (Clownfish)") --> Guardian("Guardian (Clownfish,Yeti)")
Floofish("Floofish (Clownfish,Monkey)") --> Guina
Foxtrot("Foxtrot (Unicorn)") --> Goldie
Foxtrot("Foxtrot (Unicorn)") --> Goral("Goral (Clownfish,Unicorn)")
Lilith --> Maximus
Glacier("Glacier (Icicle,Rabbit)") --> Hailstorm
Goldie --> Harry
Goldie --> Icarus
Grazerface("Grazerface (Triceratops)") --> Hologlittersaur("Hologlittersaur (Triceratops)")
Guardian("Guardian (Clownfish,Yeti)") --> Hydrostatic("Hydrostatic (Clownfish,Dandelion)")
Guina --> Hammerhead("Hammerhead (Seal,Static)")
Guina --> Hippogriff("Hippogriff (Cheetah)")
Guina --> Hypnos
Maximus --> Noise("Noise (Static)")
Hailstorm --> Iceberg("Iceberg (Icicle,Snowfall)")
Hailstorm --> Imugi("Imugi (Triton)")
Harry --> Isla("Isla (Beach)")
Hippogriff("Hippogriff (Cheetah)") --> Incense
Hypnos --> Imhotep("Imhotep (Scarab)")
Hypnos --> Instar("Instar (Bee)")
Icarus --> Jax("Jax (Clownfish)")
Icarus --> Jewelfish("Jewelfish (Clownfish,Rabbit)")
Noise("Noise (Static)") --> Orion("Orion (Aurora)")
Imhotep("Imhotep (Scarab)") --> Jormungandr("Jormungandr (Static)")
Incense --> Jack_Olantern("Jack Olantern (Embers)")
Isla("Isla (Beach)") --> Jubilee("Jubilee (Cinnabon)")
Jax("Jax (Clownfish)") --> Kalypso("Kalypso (Clownfish,Glam)")
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)")
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Kandle
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Krypto("Krypto (Dewdrop,Rabbit)")
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Queezy("Queezy (Peacock)")
Orion("Orion (Aurora)") --> Phenotype("Phenotype (Sunset)")
Orion("Orion (Aurora)") --> Predator("Predator (Vampire)")
Imugi("Imugi (Triton)") -....-> New_Archetype:_Elixir
Jormungandr("Jormungandr (Static)") --> Kira("Kira (Dragon,Static)")
Jubilee("Jubilee (Cinnabon)") --> Khroma("Khroma (Chameleon)")
Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)") --> Lagostosa("Lagostosa (Clownfish,Lobster)")
Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)") --> Mastodon("Mastodon (Anemone,Snowfall)")
Kandle --> Lampent("Lampent (Candle,Clownfish)")
Krypto("Krypto (Dewdrop,Rabbit)") --> Lychee("Lychee (Boba,Rabbit,Static)")
Queezy("Queezy (Peacock)") --> Rockstar("Rockstar (Peacock,Psychedelic)")
New_Archetype:_Elixir -...-> New_Archetype:_Jester
Kira("Kira (Dragon,Static)") --> Leviathan("Leviathan (Dragon)")
Lagostosa("Lagostosa (Clownfish,Lobster)") --> Mexilotl("Mexilotl (Axolotl)")
Lagostosa("Lagostosa (Clownfish,Lobster)") --> Mix_a_lotl("Mix a lotl (Axolotl,Clownfish)")
Lagostosa("Lagostosa (Clownfish,Lobster)") --> Moonlit("Moonlit (Jellyfish)")
Lampent("Lampent (Candle,Clownfish)") --> Mysterion("Mysterion (Candle,Clownfish)")
Mastodon("Mastodon (Anemone,Snowfall)") --> Night_Snow("Night Snow (Gargoyle)")
Rockstar("Rockstar (Peacock,Psychedelic)") --> Skittles
Rockstar("Rockstar (Peacock,Psychedelic)") --> Slushy("Slushy (Cotton Candy)")
Night_Snow("Night Snow (Gargoyle)") --> Om-Nominous("Om-Nominous (Watermelon)")
Skittles --> Trailmix("Trailmix (Paint)")
Skittles --> Turducken("Turducken (LED,Peacock)")
Slushy("Slushy (Cotton Candy)") --> Trifecta
Turducken("Turducken (LED,Peacock)") --> Uluguru("Uluguru (LED)")
Uluguru("Uluguru (LED)") --> Volare("Volare (LED)")
Volare("Volare (LED)") --> Wallflower
Wallflower --> Xenomorphic
```

