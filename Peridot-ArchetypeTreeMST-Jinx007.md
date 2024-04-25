# Peridot Archetype MST Tree

```mermaid
flowchart

Jinx007-Jasmine --> Jinx007-Banshee("Jinx007-Banshee (Cheetah)")
Jinx007-Jasmine --> Jinx007-Fuzz("Jinx007-Fuzz (Static)")
Jinx007-Jasmine --> Jinx007-Maximilian
Jinx007-Banshee("Jinx007-Banshee (Cheetah)") --> Jinx007-Clownking("Jinx007-Clownking (Clownfish,Monkey)")
Jinx007-Fuzz("Jinx007-Fuzz (Static)") --> Jinx007-Lilith("Jinx007-Lilith (Static)")
Jinx007-Fuzz("Jinx007-Fuzz (Static)") --> Jinx007-Turkey("Jinx007-Turkey (Static)")
Jinx007-Lilith("Jinx007-Lilith (Static)") --> Jinx007-Dottie("Jinx007-Dottie (Static)")
Jinx007-Turkey("Jinx007-Turkey (Static)") --> Jinx007-Triumvirate("Jinx007-Triumvirate (Peacock,Psychedelic,Static)")
Jinx007-Lilith("Jinx007-Lilith (Static)") -..-> New_Archetype:_Patina
Jinx007-Dottie("Jinx007-Dottie (Static)") --> Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)")
Jinx007-Triumvirate("Jinx007-Triumvirate (Peacock,Psychedelic,Static)") --> Jinx007-Shimmerrosie("Jinx007-Shimmerrosie (Peacock,Static)")
Jinx007-Triumvirate("Jinx007-Triumvirate (Peacock,Psychedelic,Static)") --> Jinx007-Spyro("Jinx007-Spyro (Dragon,Static)")
Jinx007-Triumvirate("Jinx007-Triumvirate (Peacock,Psychedelic,Static)") --> Jinx007-Twilight("Jinx007-Twilight (Static,Sunset)")
Jinx007-Dottie("Jinx007-Dottie (Static)") -..-> New_Archetype:_Unicorn
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Aries_II("Jinx007-Aries II (Clownfish,Ram,Static)")
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Burnout
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Fluffish("Jinx007-Fluffish (Clownfish,Cotton Candy,Rabbit)")
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Honeybunny("Jinx007-Honeybunny (Bee,Rabbit)")
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Rocket_Raccoon("Jinx007-Rocket Raccoon (Rabbit,Static)")
Jinx007-Shimmerrosie("Jinx007-Shimmerrosie (Peacock,Static)") --> Jinx007-Watermelon("Jinx007-Watermelon (Peacock)")
Jinx007-Spyro("Jinx007-Spyro (Dragon,Static)") --> Jinx007-Tulum("Jinx007-Tulum (Static)")
Jinx007-Twilight("Jinx007-Twilight (Static,Sunset)") --> Jinx007-Dark_Blizzard("Jinx007-Dark Blizzard (Anemone,Snowfall)")
Jinx007-Twilight("Jinx007-Twilight (Static,Sunset)") --> Jinx007-Dusk("Jinx007-Dusk (Anemone)")
Jinx007-Twilight("Jinx007-Twilight (Static,Sunset)") --> Jinx007-Usurper("Jinx007-Usurper (Sunset)")
Jinx007-Shimmerrosie("Jinx007-Shimmerrosie (Peacock,Static)") -..-> New_Archetype:_LED
Jinx007-Burnout --> Jinx007-Clowndelabra("Jinx007-Clowndelabra (Candle,Clownfish)")
Jinx007-Dark_Blizzard("Jinx007-Dark Blizzard (Anemone,Snowfall)") --> Jinx007-Epsilon("Jinx007-Epsilon (Snowfall)")
Jinx007-Dark_Blizzard("Jinx007-Dark Blizzard (Anemone,Snowfall)") --> Jinx007-Rorschach("Jinx007-Rorschach (Scarab)")
Jinx007-Dark_Blizzard("Jinx007-Dark Blizzard (Anemone,Snowfall)") --> Jinx007-Snowstorm("Jinx007-Snowstorm (Gargoyle)")
Jinx007-Fluffish("Jinx007-Fluffish (Clownfish,Cotton Candy,Rabbit)") --> Jinx007-Faun("Jinx007-Faun (Clownfish)")
Jinx007-Fluffish("Jinx007-Fluffish (Clownfish,Cotton Candy,Rabbit)") --> Jinx007-Gumdrop("Jinx007-Gumdrop (Cotton Candy)")
Jinx007-Honeybunny("Jinx007-Honeybunny (Bee,Rabbit)") --> Jinx007-Golden_Idol("Jinx007-Golden Idol (24Karat,Rabbit)")
Jinx007-Tulum("Jinx007-Tulum (Static)") --> Jinx007-Urchin("Jinx007-Urchin (Static)")
Jinx007-Usurper("Jinx007-Usurper (Sunset)") --> Jinx007-Vici("Jinx007-Vici (Royalty,Sunset)")
Jinx007-Watermelon("Jinx007-Watermelon (Peacock)") -.-> New_Archetype:_Watermelon
Jinx007-Aries_II("Jinx007-Aries II (Clownfish,Ram,Static)") -...-> New_Archetype:_Triceratops
Jinx007-Faun("Jinx007-Faun (Clownfish)") --> Jinx007-Littlefoot("Jinx007-Littlefoot (Yeti)")
Jinx007-Golden_Idol("Jinx007-Golden Idol (24Karat,Rabbit)") --> Jinx007-Helion("Jinx007-Helion (24Karat)")
Jinx007-Gumdrop("Jinx007-Gumdrop (Cotton Candy)") --> Jinx007-Herbelion("Jinx007-Herbelion (Dandelion)")
Jinx007-Rorschach("Jinx007-Rorschach (Scarab)") --> Jinx007-Sencha("Jinx007-Sencha (Boba,Glam)")
Jinx007-Rorschach("Jinx007-Rorschach (Scarab)") --> Jinx007-Sunfire("Jinx007-Sunfire (Lobster)")
Jinx007-Snowstorm("Jinx007-Snowstorm (Gargoyle)") --> Jinx007-Galaxy_Gargoyle("Jinx007-Galaxy Gargoyle (Celestial)")
Jinx007-Vici("Jinx007-Vici (Royalty,Sunset)") --> Jinx007-Wreck-It_Ralph("Jinx007-Wreck-It Ralph (Kintsugi,Rabbit)")
Jinx007-Sencha("Jinx007-Sencha (Boba,Glam)") --> Jinx007-Thistle("Jinx007-Thistle (Cactus)")
Jinx007-Sencha("Jinx007-Sencha (Boba,Glam)") -...-> New_Archetype:_Dewdrop
Jinx007-Thistle("Jinx007-Thistle (Cactus)") --> Jinx007-Umbrella
Jinx007-Thistle("Jinx007-Thistle (Cactus)") -...-> New_Archetype:_Banana
New_Archetype:_Patchwork -..-> New_Archetype:_Scarecrow
New_Archetype:_Patchwork -...-> New_Archetype:_Bismuth
New_Archetype:_Patchwork -...-> New_Archetype:_Banana
New_Archetype:_Elixir -..-> New_Archetype:_Icicle
New_Archetype:_Elixir -...-> New_Archetype:_Vampire
New_Archetype:_Icicle -..-> New_Archetype:_Triton
New_Archetype:_Jellyfish -..-> New_Archetype:_Balloon
New_Archetype:_Jellyfish -...-> New_Archetype:_Axolotl
New_Archetype:_Balloon -..-> New_Archetype:_Scarecrow
New_Archetype:_Seal -...-> New_Archetype:_Chameleon
New_Archetype:_Seal -...-> New_Archetype:_Axolotl
New_Archetype:_Chameleon -..-> New_Archetype:_Cinnabon
New_Archetype:_Cinnabon -...-> New_Archetype:_Vampire
New_Archetype:_Aurora -...-> New_Archetype:_Vampire
New_Archetype:_Embers -..-> New_Archetype:_Dewdrop
New_Archetype:_Jester -...-> New_Archetype:_Elixir
New_Archetype:_Paint -..-> New_Archetype:_LED
```

