# Peridot Archetype MST Tree

```mermaid
flowchart

Alpha --> Beta
Alpha --> Bravo
Beta --> Canary("Canary (Patchwork)")
Beta --> Chevron("Chevron (Ram)")
Bravo --> Charlie
Canary("Canary (Patchwork)") --> Dill_Hulk("Dill Hulk (Patchwork)")
Canary("Canary (Patchwork)") --> Draco("Draco (Balloon,Patchwork)")
Charlie --> Delta
Charlie --> Dolphin
Chevron("Chevron (Ram)") --> Damascus("Damascus (Kintsugi,Ram)")
Chevron("Chevron (Ram)") --> Dorado("Dorado (24Karat,Ram)")
Chevron("Chevron (Ram)") --> Dormammu("Dormammu (Ram)")
Chevron("Chevron (Ram)") --> Duranium("Duranium (Patina,Ram)")
Chevron("Chevron (Ram)") --> Echelon("Echelon (Bismuth,Ram)")
Damascus("Damascus (Kintsugi,Ram)") --> Eldritch("Eldritch (Kintsugi)")
Damascus("Damascus (Kintsugi,Ram)") --> Enrichment("Enrichment (Kintsugi,Royalty)")
Damascus("Damascus (Kintsugi,Ram)") --> Escorpio
Delta --> Echo("Echo (Static)")
Delta --> Jammie
Dill_Hulk("Dill Hulk (Patchwork)") --> Eclair("Eclair (Banana)")
Dill_Hulk("Dill Hulk (Patchwork)") --> Escrow("Escrow (Rabbit,Scarecrow,Static)")
Dorado("Dorado (24Karat,Ram)") --> Elite("Elite (24Karat)")
Dorado("Dorado (24Karat,Ram)") --> Entropy("Entropy (Clownfish,Ram)")
Dorado("Dorado (24Karat,Ram)") --> Ether("Ether (Celestial,Ram)")
Draco("Draco (Balloon,Patchwork)") --> Eclipse("Eclipse (Balloon,Rabbit,Static)")
Duranium("Duranium (Patina,Ram)") --> Effervescent("Effervescent (Patina,Ram)")
Echo("Echo (Static)") --> Foxtrot("Foxtrot (Unicorn)")
Echo("Echo (Static)") --> Frosty("Frosty (Ram,Static)")
Eclair("Eclair (Banana)") --> Fishhook("Fishhook (Cactus)")
Eldritch("Eldritch (Kintsugi)") --> Farceur("Farceur (Jester)")
Eldritch("Eldritch (Kintsugi)") --> Flutter("Flutter (Kintsugi)")
Enrichment("Enrichment (Kintsugi,Royalty)") --> Fable("Fable (Kintsugi,Rabbit,Royalty)")
Entropy("Entropy (Clownfish,Ram)") --> Farceratops("Farceratops (Ram)")
Entropy("Entropy (Clownfish,Ram)") --> Fishline("Fishline (Clownfish)")
Entropy("Entropy (Clownfish,Ram)") --> Floofish("Floofish (Clownfish,Monkey)")
Ether("Ether (Celestial,Ram)") --> Fafnir("Fafnir (Celestial)")
Jammie --> Lilith
Fable("Fable (Kintsugi,Rabbit,Royalty)") --> Glacier("Glacier (Icicle,Rabbit)")
Fable("Fable (Kintsugi,Rabbit,Royalty)") --> Goldilocks("Goldilocks (Royalty)")
Fable("Fable (Kintsugi,Rabbit,Royalty)") --> Grainy("Grainy (Clownfish,Rabbit,Static)")
Farceratops("Farceratops (Ram)") --> Grazerface("Grazerface (Triceratops)")
Farceur("Farceur (Jester)") --> Gatekeeper
Fishline("Fishline (Clownfish)") --> Guardian("Guardian (Clownfish,Yeti)")
Floofish("Floofish (Clownfish,Monkey)") --> Guina
Foxtrot("Foxtrot (Unicorn)") --> Goldie
Foxtrot("Foxtrot (Unicorn)") --> Goral("Goral (Clownfish,Unicorn)")
Lilith --> Maximus
Frosty("Frosty (Ram,Static)") -.-> New_Archetype:_Clownfish,_Ram,_Static
Fable("Fable (Kintsugi,Rabbit,Royalty)") -..-> New_Archetype:_Clownfish,_Rabbit,_Royalty
Glacier("Glacier (Icicle,Rabbit)") --> Hailstorm
Goldie --> Harry
Goldie --> Icarus
Grazerface("Grazerface (Triceratops)") --> Hologlittersaur("Hologlittersaur (Triceratops)")
Guardian("Guardian (Clownfish,Yeti)") --> Hydrostatic("Hydrostatic (Clownfish,Dandelion)")
Guina --> Hammerhead("Hammerhead (Seal,Static)")
Guina --> Hippogriff("Hippogriff (Cheetah)")
Guina --> Hypnos
Maximus --> Noise("Noise (Static)")
Glacier("Glacier (Icicle,Rabbit)") -..-> New_Archetype:_Clownfish,_Icicle,_Rabbit
Hailstorm --> Iceberg("Iceberg (Icicle,Snowfall)")
Hailstorm --> Imugi("Imugi (Triton)")
Harry --> Isla("Isla (Beach)")
Hippogriff("Hippogriff (Cheetah)") --> Incense
Hippogriff("Hippogriff (Cheetah)") --> Inception
Hydrostatic("Hydrostatic (Clownfish,Dandelion)") --> Interspecies
Hypnos --> Imhotep("Imhotep (Scarab)")
Hypnos --> Instar("Instar (Bee)")
Icarus --> Jax("Jax (Clownfish)")
Icarus --> Jewelfish("Jewelfish (Clownfish,Rabbit)")
Noise("Noise (Static)") --> Orion("Orion (Aurora)")
Iceberg("Iceberg (Icicle,Snowfall)") --> Javelin("Javelin (Snowfall)")
Imhotep("Imhotep (Scarab)") --> Jormungandr("Jormungandr (Static)")
Imugi("Imugi (Triton)") --> Jaguarundi("Jaguarundi (Elixir)")
Incense --> Jack_Olantern("Jack Olantern (Embers)")
Interspecies --> Jade("Jade (Boba)")
Isla("Isla (Beach)") --> Jubilee("Jubilee (Cinnabon)")
Jax("Jax (Clownfish)") --> Kalypso("Kalypso (Clownfish,Glam)")
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)")
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Kandle
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Krypto("Krypto (Dewdrop,Rabbit)")
Jewelfish("Jewelfish (Clownfish,Rabbit)") --> Queezy("Queezy (Peacock)")
Orion("Orion (Aurora)") --> Phenotype("Phenotype (Sunset)")
Orion("Orion (Aurora)") --> Predator("Predator (Vampire)")
Interspecies -..-> New_Archetype:_Clownfish,_Cotton_Candy,_Dandelion
Jaguarundi("Jaguarundi (Elixir)") --> Kyoka_Suigetsu("Kyoka Suigetsu (Elixir)")
Jormungandr("Jormungandr (Static)") --> Kira("Kira (Dragon,Static)")
Jubilee("Jubilee (Cinnabon)") --> Khroma("Khroma (Chameleon)")
Jubilee("Jubilee (Cinnabon)") --> Kpax("Kpax (Cinnabon,Static)")
Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)") --> Lagostosa("Lagostosa (Clownfish,Lobster)")
Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)") --> Lava_Lamp("Lava Lamp (Anemone,Psychedelic)")
Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)") --> Lionfish("Lionfish (Clownfish)")
Kaleidoscope("Kaleidoscope (Anemone,Clownfish,Rabbit)") --> Mastodon("Mastodon (Anemone,Snowfall)")
Kandle --> Lampent("Lampent (Candle,Clownfish)")
Krypto("Krypto (Dewdrop,Rabbit)") --> Leonopteryx
Krypto("Krypto (Dewdrop,Rabbit)") --> Lychee("Lychee (Boba,Rabbit,Static)")
Phenotype("Phenotype (Sunset)") --> Quantum("Quantum (Aurora)")
Queezy("Queezy (Peacock)") --> Rockstar("Rockstar (Peacock,Psychedelic)")
New_Archetype:_Clownfish,_Cotton_Candy,_Dandelion -..-> New_Archetype:_Clownfish,_Cotton_Candy,_Rabbit
Khroma("Khroma (Chameleon)") --> Limelight("Limelight (Chameleon,Static)")
Kira("Kira (Dragon,Static)") --> Leviathan("Leviathan (Dragon)")
Kyoka_Suigetsu("Kyoka Suigetsu (Elixir)") --> Luminosity("Luminosity (Rabbit)")
Lagostosa("Lagostosa (Clownfish,Lobster)") --> Mexilotl("Mexilotl (Axolotl)")
Lagostosa("Lagostosa (Clownfish,Lobster)") --> Mix_a_lotl("Mix a lotl (Axolotl,Clownfish)")
Lagostosa("Lagostosa (Clownfish,Lobster)") --> Moonlit("Moonlit (Jellyfish)")
Lampent("Lampent (Candle,Clownfish)") --> Mysterion("Mysterion (Candle,Clownfish)")
Lava_Lamp("Lava Lamp (Anemone,Psychedelic)") --> Medusa("Medusa (Anemone,Sunset)")
Lychee("Lychee (Boba,Rabbit,Static)") --> Multiverse("Multiverse (Boba,Static)")
Mastodon("Mastodon (Anemone,Snowfall)") --> Night_Snow("Night Snow (Gargoyle)")
Quantum("Quantum (Aurora)") --> Radioactive
Quantum("Quantum (Aurora)") --> Refracted("Refracted (Sunset)")
Rockstar("Rockstar (Peacock,Psychedelic)") --> Skittles
Rockstar("Rockstar (Peacock,Psychedelic)") --> Slushy("Slushy (Cotton Candy)")
Rockstar("Rockstar (Peacock,Psychedelic)") --> Sparkler("Sparkler (Peacock,Psychedelic,Static)")
Kpax("Kpax (Cinnabon,Static)") -..-> New_Archetype:_Cinnabon,_Clownfish,_Static
Luminosity("Luminosity (Rabbit)") --> Mandarin("Mandarin (Elixir,Rabbit)")
Medusa("Medusa (Anemone,Sunset)") --> Neonimbus("Neonimbus (Anemone,Sunset)")
Mix_a_lotl("Mix a lotl (Axolotl,Clownfish)") --> Neon("Neon (Axolotl)")
Night_Snow("Night Snow (Gargoyle)") --> Om_Nominous("Om Nominous (Watermelon)")
Refracted("Refracted (Sunset)") --> Sullen("Sullen (Sunset)")
Skittles --> Trailmix("Trailmix (Paint)")
Skittles --> Turducken("Turducken (LED,Peacock)")
Slushy("Slushy (Cotton Candy)") --> Trifecta
Sparkler("Sparkler (Peacock,Psychedelic,Static)") -..-> New_Archetype:_Clownfish,_Peacock,_Static
Om_Nominous("Om Nominous (Watermelon)") --> Major_Lazer
Sullen("Sullen (Sunset)") --> Troposphere("Troposphere (Sunset)")
Trailmix("Trailmix (Paint)") --> Ultraviolet("Ultraviolet (Paint)")
Turducken("Turducken (LED,Peacock)") --> Uber("Uber (LED)")
Turducken("Turducken (LED,Peacock)") --> UFO("UFO (LED)")
Turducken("Turducken (LED,Peacock)") --> Ultron("Ultron (Bismuth,Peacock)")
Turducken("Turducken (LED,Peacock)") --> Uluguru("Uluguru (LED)")
UFO("UFO (LED)") --> Variant
Ultraviolet("Ultraviolet (Paint)") --> Vega
Ultraviolet("Ultraviolet (Paint)") --> Violet
Uluguru("Uluguru (LED)") --> Volare("Volare (LED)")
Volare("Volare (LED)") --> Wallflower
Wallflower --> Xenomorphic
```

