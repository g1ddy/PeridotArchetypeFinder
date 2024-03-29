# Peridot Archetype MST Tree

```mermaid
flowchart

Jinx007-Banshee("Jinx007-Banshee (Cheetah)") --> Jinx007-Clownking("Jinx007-Clownking (Clownfish,Monkey)")
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Aries_II("Jinx007-Aries II (Clownfish,Ram,Static)")
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Burnout
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Fluffish("Jinx007-Fluffish (Clownfish,Cotton Candy,Rabbit)")
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Honeybunny("Jinx007-Honeybunny (Bee,Rabbit)")
Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)") --> Jinx007-Rocket_Raccoon("Jinx007-Rocket Raccoon (Rabbit,Static)")
Jinx007-Burnout --> Jinx007-Clowndelabra("Jinx007-Clowndelabra (Candle,Clownfish)")
Jinx007-Dark_Blizzard("Jinx007-Dark Blizzard (Anemone,Snowfall)") --> Jinx007-Rorschach("Jinx007-Rorschach (Scarab)")
Jinx007-Dark_Blizzard("Jinx007-Dark Blizzard (Anemone,Snowfall)") --> Jinx007-Snowstorm("Jinx007-Snowstorm (Gargoyle)")
Jinx007-Dottie("Jinx007-Dottie (Static)") --> Jinx007-Buggy_Bunny("Jinx007-Buggy Bunny (Clownfish,Rabbit,Static)")
Jinx007-Dottie("Jinx007-Dottie (Static)") -.-> New_Archetype:_Unicorn
Jinx007-Faun("Jinx007-Faun (Clownfish)") --> Jinx007-Littlefoot("Jinx007-Littlefoot (Yeti)")
Jinx007-Fluffish("Jinx007-Fluffish (Clownfish,Cotton Candy,Rabbit)") --> Jinx007-Faun("Jinx007-Faun (Clownfish)")
Jinx007-Fluffish("Jinx007-Fluffish (Clownfish,Cotton Candy,Rabbit)") --> Jinx007-Gumdrop("Jinx007-Gumdrop (Cotton Candy)")
Jinx007-Fuzz("Jinx007-Fuzz (Static)") --> Jinx007-Lilith("Jinx007-Lilith (Static)")
Jinx007-Fuzz("Jinx007-Fuzz (Static)") --> Jinx007-Turkey("Jinx007-Turkey (Static)")
Jinx007-Galaxy_Gargoyle("Jinx007-Galaxy Gargoyle (Celestial)") -.-> New_Archetype:_Triceratops
Jinx007-Gumdrop("Jinx007-Gumdrop (Cotton Candy)") --> Jinx007-Herbelion("Jinx007-Herbelion (Dandelion)")
Jinx007-Gumdrop("Jinx007-Gumdrop (Cotton Candy)") -.-> New_Archetype:_Embers
Jinx007-Honeybunny("Jinx007-Honeybunny (Bee,Rabbit)") --> Jinx007-Golden_Idol("Jinx007-Golden Idol (24Karat,Rabbit)")
Jinx007-Jasmine --> Jinx007-Banshee("Jinx007-Banshee (Cheetah)")
Jinx007-Jasmine --> Jinx007-Fuzz("Jinx007-Fuzz (Static)")
Jinx007-Jasmine --> Jinx007-Maximilian
Jinx007-Jasmine -.-> New_Archetype:_Paint
Jinx007-Lilith("Jinx007-Lilith (Static)") --> Jinx007-Dottie("Jinx007-Dottie (Static)")
Jinx007-Fuzz("Jinx007-Fuzz (Static)") -.-> New_Archetype:_Patina
Jinx007-Littlefoot("Jinx007-Littlefoot (Yeti)") -.-> New_Archetype:_Banana
Jinx007-Rorschach("Jinx007-Rorschach (Scarab)") --> Jinx007-Sencha("Jinx007-Sencha (Boba,Glam)")
Jinx007-Shimmerrosie("Jinx007-Shimmerrosie (Peacock,Static)") --> Jinx007-Watermelon("Jinx007-Watermelon (Peacock)")
Jinx007-Snowstorm("Jinx007-Snowstorm (Gargoyle)") --> Jinx007-Galaxy_Gargoyle("Jinx007-Galaxy Gargoyle (Celestial)")
Jinx007-Triumvirate("Jinx007-Triumvirate (Peacock,Psychedelic,Static)") --> Jinx007-Shimmerrosie("Jinx007-Shimmerrosie (Peacock,Static)")
Jinx007-Triumvirate("Jinx007-Triumvirate (Peacock,Psychedelic,Static)") --> Jinx007-Twilight("Jinx007-Twilight (Static,Sunset)")
Jinx007-Turkey("Jinx007-Turkey (Static)") --> Jinx007-Triumvirate("Jinx007-Triumvirate (Peacock,Psychedelic,Static)")
Jinx007-Twilight("Jinx007-Twilight (Static,Sunset)") --> Jinx007-Dark_Blizzard("Jinx007-Dark Blizzard (Anemone,Snowfall)")
Jinx007-Twilight("Jinx007-Twilight (Static,Sunset)") --> Jinx007-Dusk("Jinx007-Dusk (Anemone)")
Jinx007-Watermelon("Jinx007-Watermelon (Peacock)") -.-> New_Archetype:_Watermelon
New_Archetype:_Balloon -.-> New_Archetype:_Scarecrow
New_Archetype:_Banana -.-> New_Archetype:_Cactus
New_Archetype:_Patchwork -.-> New_Archetype:_Bismuth
New_Archetype:_Cinnabon -.-> New_Archetype:_Chameleon
New_Archetype:_Elixir -.-> New_Archetype:_Vampire
New_Archetype:_Embers -.-> New_Archetype:_Dewdrop
New_Archetype:_Cactus -.-> New_Archetype:_Icicle
New_Archetype:_Icicle -.-> New_Archetype:_Elixir
New_Archetype:_Icicle -.-> New_Archetype:_Royalty
New_Archetype:_Icicle -.-> New_Archetype:_Triton
New_Archetype:_Balloon -.-> New_Archetype:_Jellyfish
Jinx007-Rorschach("Jinx007-Rorschach (Scarab)") --> Jinx007-Sunfire("Jinx007-Sunfire (Lobster)")
New_Archetype:_Elixir -.-> New_Archetype:_Jester
New_Archetype:_Jester -.-> New_Archetype:_Kintsugi
New_Archetype:_LED -.-> New_Archetype:_Paint
Jinx007-Sunfire("Jinx007-Sunfire (Lobster)") -.-> New_Archetype:_Axolotl
New_Archetype:_Cactus -.-> New_Archetype:_Patchwork
New_Archetype:_Royalty -.-> New_Archetype:_Balloon
New_Archetype:_Chameleon -.-> New_Archetype:_Seal
New_Archetype:_Vampire -.-> New_Archetype:_Aurora
New_Archetype:_Vampire -.-> New_Archetype:_Cinnabon
```
