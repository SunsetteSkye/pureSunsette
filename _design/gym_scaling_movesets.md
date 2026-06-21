# Gym-scaling movesets (DRAFT for spot-check, 2026-06-18)

Movesets for every leader tier team + Champ-Arena rows. Built from `_design/species_reference.md`
(live types/movepools) + the type chart. Names are the in-game (renamed) move names; the build resolves
to constants (e.g. Bulk Up=BIDE, Aqua Ring=ACID_ARMOR, Shadow Game=HAZE, Skittermind=PSYWAVE,
Supernova=SELFDESTRUCT, Riptide=WATERFALL, Brave Bird=SKY_ATTACK, Phantasm=NIGHT_SHADE, Wyrm Wrath=DRAGON_RAGE,
Outrage=THRASH, Hurricane=WHIRLWIND, Senbonzakura=PETAL_DANCE, Venom Lash=CONSTRICT, Full Nelson=SUBMISSION,
Piston Kick=MEGA_KICK, Meteor Drive=SKULL_BASH, Blaze Hammer=FIRE_PUNCH, Void Mind=MEDITATE, Calm Mind=AMNESIA,
Heat Rush=TAKE_DOWN, Roost=RAZOR_WIND, Metamorphic=EXPLOSION, Soulstealer=DREAM_EATER, Phoenix Dive=PHOENIX_DIVE,
Storm Drill=STORM_DRILL).

GENERAL RULES (from user):
- T1 & T2 teams: do NOT fill all 4 move slots (2-3 moves each); early gyms feel light.
- Koffing/Weezing routinely carry DISABLE. Koffing NEVER carries Toxic (Weezing may).
- Signature (handout-TM move) appears OFTEN, on the type-appropriate bodies.
- STAB from the mon's REAL types; spoilers carry the coverage that justifies them.
- A leader's natural-tier feel is preserved; Brock is tuned gently (usually fought first).
- [sig] marks the signature move.
- POWER CAP: moves of 70+ power must NOT appear before T3; moves of 50+ power must NOT appear before T2.
  => T1 = only <50-power moves (+ status); T2 = only <70-power moves (+ status); T3+ unrestricted.
  EXCEPTION: a high-power SIGNATURE move may break the cap at T1/T2, but only on a SINGLE mon
  (the anchor). The rest of that team still obeys the cap. (0-power sigs Bulk Up/Aqua Ring/
  Shadow Game/Skittermind are unrestricted anyway.)

=====================================================================
## BROCK (Rock/Ground) — sig BULK UP (Rock setup)  [LOCKED]
Mon pool movesets (T3+ full):
- Geodude (Rk/Ft): Rock Throw · Karate Chop · Defense Curl · Harden
- Graveler (Rk/Ft): Rock Slide · Karate Chop · Earthquake · Defense Curl
- Golem (Rk/Ft): Rock Slide · Earthquake · Bulk Up[sig] · Fire Punch
- Onix (Rk/Gd): Rock Slide · Bulk Up[sig] · Wrap · Earthquake
- Hardened Onix (Cry/Gd): Rock Slide · Earthquake · Bulk Up[sig] · Surf
- Sandslash (Gd/No): Earthquake · Rock Slide · Slash · Swords Dance
- Rhydon (Gd/Rk): Earthquake · Rock Slide · Piston Kick · Ice Beam
- Weezing (Po): Sludge · Toxic · Disable · Thunderbolt
- Koffing (Po): Sludge · Smog · Disable · Smokescreen   (NEVER Toxic)
- Aerodactyl (Rk/Fly): Rock Slide · Brave Bird · Earthquake · Fire Blast
- Kabutops (Rk/Bug): Rock Slide · Leech Life · Surf · Swords Dance
- Kangaskhan (No/Ft, champ): Body Slam · Earthquake · Full Nelson · Ice Beam
PARTIAL early tiers:
- T1: Geodude L12 [Harden · Tackle] · Koffing L13 [Smog · Disable · Tackle] · Onix L14 [Bulk Up · Wrap · Harden]
- T2: Graveler L22 [Rock Throw · Karate Chop · Defense Curl] · Koffing L22 [Acid · Smog · Disable] · Onix L23 [Rock Throw · Bulk Up · Wrap]

=====================================================================
## MISTY (Water) — sig AQUA RING (regen self-buff)
Mon pool (T3+ full):
- Goldeen (Wat/No): Riptide · Bubblebeam · Horn Attack · Body Slam   (Riptide auto-+SPD for Goldeen)
- Seaking (Wat/No): Riptide · Surf · Ice Beam · Body Slam            (Riptide auto-+SPD)
- Staryu (Wat): Surf · Bubblebeam · Aqua Ring[sig] · Recover
- Starmie (Wat/Psy): Surf · Psychic · Ice Beam · Aqua Ring[sig]
- Seadra (Wat/Drg): Hydro Pump · Surf · Ice Beam · Smokescreen
- Kingler (Wat/Gd): Crabhammer · Surf · Earthquake · Swords Dance
- Wigglytuff (No/Float): Body Slam · Ice Beam · Thunderbolt · Softboiled
- Gyarados (Wat/Fly): Riptide · Hydro Pump · Thunderbolt · Aqua Ring[sig]  (Riptide auto-+SPD)
- Farfetch'd (Grs/Fly, SPOILER): Razor Leaf · Brave Bird · Swords Dance · Fly
PARTIAL early tiers:
- T1: Goldeen L12 [Water Gun · Tackle] · Farfetch'd L13 [Peck · Vine Whip] · Staryu L14 [Water Gun · Aqua Ring[sig]]
- T2: Goldeen L22 [Bubblebeam · Horn Attack · Tail Whip] · Farfetch'd L22 [Razor Leaf · Wing Attack · Swords Dance] · Starmie L23 [Bubblebeam · Swift · Aqua Ring[sig]]

=====================================================================
## SURGE (Electric) — sig THUNDERBOLT
Mon pool (T3+ full):
- Voltorb (Elec/Fire): Thunderbolt[sig] · Swift · Thunder Wave · Supernova
- Electrode (Elec/Fire): Thunderbolt[sig] · Thunder · Supernova · Thunder Wave   (Fire user = NO recoil Supernova)
- Magnemite (Elec): Thunderbolt[sig] · Tri Attack · Thunder Wave · Sonicboom
- Magneton (Elec): Thunderbolt[sig] · Thunder · Tri Attack · Thunder Wave
- Floating Magneton (Elec/Float): Thunderbolt[sig] · Thunder · Tri Attack · Thunder Wave   (Ground-immune)
- Pikachu (Elec/No): Thunderbolt[sig] · Body Slam · Quick Attack · Thunder Wave
- Raichu (Elec/No): Thunderbolt[sig] · Thunder · Body Slam · Surf
- Jolteon (Elec): Thunderbolt[sig] · Thunder · Pin Missile · Swift
- Electabuzz (Elec/Ft): Thunderbolt[sig] · Thunderpunch · Ice Punch · Seismic Toss
- Zapdos (Elec/Fly, champ): Thunder · Drill Peck · Storm Drill · Sky Attack
- Machop (Ft, SPOILER low): Low Kick · Karate Chop · Seismic Toss
- Pinsir (Bug/Gd, SPOILER): Earthquake · Full Nelson · Guillotine · Swords Dance   (anti-Ground: EQ hits the grounds that wall Electric)
- Hitmonchan (Ft, SPOILER hi): Fire Punch · Ice Punch · Thunderpunch · Full Nelson
PARTIAL early tiers:
- T1: Voltorb L12 [Thundershock · Thunder Wave] · Machop L13 [Double Kick · Seismic Toss] · Pikachu L14 [Thunderbolt[sig] · Thundershock · Thunder Wave]   (Pikachu = the single cap-breaking sig mon)
- T2: Voltorb L22 [Swift · Thundershock · Thunder Wave] · Machop L22 [Low Kick · Karate Chop · Seismic Toss] · Raichu L23 [Thunderbolt[sig] · Swift · Thunder Wave]

=====================================================================
## ERIKA (Grass/Poison) — sig SOLARBEAM
Mon pool (T3+ full):
- Bellsprout (Grs/Po): Razor Leaf · Acid · Sleep Powder · Stun Spore
- Weepinbell (Grs/Po): Razor Leaf · Sludge · Sleep Powder · Stun Spore
- Gloom (Grs/Po): Mega Drain · Sludge · Sleep Powder · Acid
- Victreebel (Grs/Po): Razor Leaf · Sludge · Solarbeam[sig] · Sleep Powder
- Vileplume (Ghost/Po): Sludge · Senbonzakura · Solarbeam[sig] · Phantasm
- Tangela (Grs/Ghost): Razor Leaf · Mega Drain · Solarbeam[sig] · Phantasm
- Venusaur (Grs/Po): Razor Leaf · Solarbeam[sig] · Sludge · Earthquake
- Dratini (Drg, SPOILER low): Wyrm Wrath · Twister · Thunder Wave
- Dragonair (Drg, SPOILER): Outrage · Ice Beam · Thunderbolt · Wyrm Wrath
- Pidgeot (No/Fly, SPOILER hi): Brave Bird · Razor Leaf · Hurricane · Quick Attack   (grass coverage = Razor Leaf, NOT Solarbeam)
- Butterfree (Bug/Psy): Psychic · Sleep Powder · Mega Drain · Roost
- Chansey (No): Seismic Toss · Ice Beam · Thunderbolt · Softboiled
PARTIAL early tiers:
- T1: Bellsprout L12 [Vine Whip · Poisonpowder] · Dratini L13 [Wrap · Thunder Wave] · Tangela L14 [Solarbeam[sig] · Absorb · Wrap]   (Tangela = the single cap-breaking sig mon)
- T2: Weepinbell L22 [Razor Leaf · Acid · Sleep Powder] · Dratini L22 [Wrap · Thunder Wave] · Tangela L23 [Solarbeam[sig] · Razor Leaf · Mega Drain]   (Dratini has no <70 Dragon move -> Wrap/T-Wave speed-bump early)

=====================================================================
## KOGA (Poison/Bug) — sig SHADOW GAME (spread across poisons)
Mon pool (T3+ full):
- Grimer (Po): Sludge · Shadow Game[sig] · Body Slam · Minimize
- Muk (Po/Ft): Sludge · Shadow Game[sig] · Body Slam · Venom Lash
- Koffing (Po): Smog · Shadow Game[sig] · Disable · Sludge   (NEVER Toxic)
- Weezing (Po): Sludge · Shadow Game[sig] · Disable · Fire Blast
- Floating Weezing (Po/Float): Sludge · Shadow Game[sig] · Thunderbolt · Fire Blast   (Ground-immune ace)
- Zubat (Po/Fly): Leech Life · Wing Attack · Confuse Ray
- Golbat (Po/Fly): Leech Life · Wing Attack · Shadow Game[sig] · Confuse Ray
- Tentacool (Wat/Po): Acid · Bubblebeam · Shadow Game[sig]
- Tentacruel (Wat/Po): Surf · Shadow Game[sig] · Ice Beam · Venom Lash
- Venonat (Bug/Po): Psybeam · Leech Life · Sleep Powder
- Venomoth (Bug/Po): Psychic · Sludge · Sleep Powder · Shadow Game[sig]
- Scyther (Bug/Fly, SPOILER): Slash · Wing Attack · Brave Bird · Swords Dance   (Ground-immune + Bug->Psychic SE)
- Parasect (Bug/Ghost): Spore · Leech Life · Phantasm · Solarbeam
PARTIAL early tiers:
- T1: Grimer L12 [Smog · Minimize] · Zubat L13 [Absorb · Confuse Ray] · Koffing L14 [Smog · Shadow Game[sig] · Disable]   (Zubat: Absorb 30; Gust 50 available from T2)
- T2: Grimer L22 [Acid · Shadow Game[sig] · Minimize] · Golbat L22 [Wing Attack · Bite · Confuse Ray] · Koffing L23 [Smog · Shadow Game[sig] · Disable]

=====================================================================
## SABRINA (Psychic) — sig SKITTERMIND (retype foe to Bug)
Mon pool (T3+ full):
- Abra (Psy): Psychic · Disable · Reflect
- Kadabra (Psy): Psybeam · Psychic · Recover · Disable
- Alakazam (Psy): Psychic · Skittermind[sig] · Recover · Ice Punch
- Drowzee (Psy/Po): Confusion · Psychic · Disable · Headbutt
- Hypno (Psy/Po): Psychic · Skittermind[sig] · Ice Punch · Toxic
- Psyduck (Wat, SPOILER low): Confusion · Surf · Disable
- Golduck (Wat/Psy, SPOILER): Surf · Psychic · Ice Beam · Calm Mind
- Slowpoke (Wat/Psy): Confusion · Surf · Calm Mind
- Slowbro (Wat/Psy): Psychic · Surf · Ice Beam · Calm Mind
- Mr.Mime (Psy/Ghost): Psychic · Skittermind[sig] · Thunderbolt · Phantasm
- Clefable (No/Psy): Psychic · Tri Attack · Ice Beam · Thunderbolt
- Gengar (Ghost/Float): Phantasm · Thunderbolt · Hypnosis · Soulstealer   (Ground-immune; Ghost->Psychic SE breaks mirrors)
- Ninetales (Fire/Ghost, SPOILER hi): Flamethrower · Phantasm · Psychic · Confuse Ray   (Fire->Bug SE punishes the Bugs that beat Psychic)
PARTIAL early tiers:
- T1: Abra L12 [Seismic Toss · Disable · Reflect] · Psyduck L13 [Water Gun · Disable] · Drowzee L14 [Poison Sting · Disable]
- T2: Kadabra L22 [Psybeam · Disable · Reflect] · Psyduck L22 [Confusion · Water Gun · Disable] · Hypno L23 [Confusion · Skittermind[sig] · Toxic]

=====================================================================
## BLAINE (Fire) — sig SUPERNOVA (Fire user = no-recoil nuke; ALSO on Electrode)
Mon pool (T3+ full):
- Vulpix (Fire): Flamethrower · Confuse Ray · Phantasm · Quick Attack (EXTREMESPEED, +2 prio)
- Growlithe (Fire/No): Flamethrower · Body Slam · Heat Rush · Bite
- Arcanine (Fire/No): Flamethrower · Fire Blast · Body Slam · Supernova[sig]
- Ponyta (Fire/Psy): Fire Blast · Fire Spin · Psychic · Heat Rush
- Rapidash (Fire/Ft): Fire Blast · Piston Kick · Meteor Drive · Fire Spin
- Magmar (Fire/Po): Blaze Hammer · Fire Blast · Psychic · Supernova[sig]
- Ninetales (Fire/Ghost): Flamethrower · Supernova[sig] · Phantasm · Confuse Ray
- Voltorb (Elec/Fire, SPOILER low): Thunderbolt · Swift · Supernova[sig]
- Electrode (Elec/Fire, SPOILER): Thunderbolt · Supernova[sig] · Thunder · Swift   (anti-Water; Fire user = no recoil)
- Golem (Rk/Ft, SPOILER hi): Rock Slide · Earthquake · Fire Punch · Metamorphic
- Moltres (Fire/Fly, champ): Fire Blast · Phoenix Dive · Supernova[sig] · Sky Attack
PARTIAL early tiers:
- T1: THROWAWAY/UNREACHABLE — Blaine needs Surf (Soul Badge) to reach Cinnabar, so 0-badge T1 can't
  happen legitimately. Stub it minimal (e.g. Vulpix L12 [Ember]); not balanced. Real Blaine starts T2.
- T2: Ponyta L22 [Take Down · Confusion · Ember] · Voltorb L22 [Swift · Thundershock · Thunder Wave] · Growlithe L23 [Supernova[sig] · Heat Rush · Ember]
