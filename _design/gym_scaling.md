# Badge-scaled Gym Leaders & trainers — design scratch

WIP design doc (not built yet). Working through leader rosters one at a time; this records LOCKED decisions.

## Mechanic
First 7 gym leaders (Brock, Misty, Surge, Erika, Koga, Sabrina, Blaine) + their gym trainers
scale to the player's BADGE COUNT, not their fixed slot. Tier = clamp(badges,0..6)+1.

### Tier framework (existing gym bands)
| Tier | Badges | Size | Level band | Natural leader |
|---|---|---|---|---|
| 1 | 0 | 3 | 12-14 | Brock |
| 2 | 1 | 3 | 22-23 | Misty |
| 3 | 2 | 4 | 25-28 | Surge |
| 4 | 3 | 4 | 33-38 | Erika |
| 5 | 4 | 5 | 46-50 | Koga |
| 6 | 5 | 6 | 55-58 | Sabrina |
| 7 | 6 | 6 | 59-62 | Blaine |

### Engine plan
- Leaders: restructure each leader class to 9 party rows. Sets 1-7 = tiers, sets 8-9 = existing
  Champ Arena rematch rows (renumbered; bump `ld b,2`->`ld b,8` in the 7 ChampArena intros).
  Shared helper at leader-battle start: CountSetBits(wObtainedBadges) -> clamp 0..6 -> +1 -> wTrainerNo.
- Trainers: levels-only auto-scale. Hook in ReadTrainer: if wCurMap is one of the 7 gyms AND opponent
  class != a leader class, add per-gym level delta = anchor[playerTier]-anchor[gymNaturalTier], clamp 1..100.
- Signatures = the TM each leader hands out. All tier rows use $FD custom movesets (bypasses LoneMoves).

### PENDING: party-move review
Exact movesets + signature-move placement are decided in a SEPARATE pass AFTER all 7 rosters are locked.
In roster notes, [SIG] = "leader's signature appears somewhere on this team", NOT a final move assignment.
NOTE: Erika's Pidgeot does NOT get SolarBeam; it gets some other grass coverage (TBD in move review).

### Signature moves (handout TMs)
Brock=BULK UP(BIDE) · Misty=AQUA RING(ACID_ARMOR) · Surge=THUNDERBOLT · Erika=SOLARBEAM ·
Koga=SHADOW GAME(HAZE) · Sabrina=SKITTERMIND(PSYWAVE) · Blaine=SUPERNOVA(SELFDESTRUCT)

### Roster philosophy
Type theme + a SPOILER line that covers the leader's type weakness (a mechanical counter-pick that
still fits the leader's vibe, swapped per-tier as appropriate, never replaced with mono-type filler).
Natural tier = current gym team (kept). Tier 7 ~= Champ-Arena deep bench re-leveled.
`*` = alt-palette mon (the +128 level-byte flag).

### Legendary rule
BADGE teams (tiers 1-7): NO legendaries. Champ-Arena teams (sets 8-9): legends OK.
Mewtwo, Armored Mewtwo, Mew: never used anywhere.

---

## LOCKED: Brock (Rock/Ground) — sig BULK UP, spoiler Koffing->Weezing (hi-DEF anti-Grass Poison wall)
- T1: Geodude 12 · Koffing 13 · Onix 14[BULK UP]
- T2: Graveler 22 · Koffing 22 · Onix 23[BULK UP]
- T3: Graveler 25 · Sandslash 26 · Koffing 27 · Onix 28[BULK UP]
- T4: Golem 33[BULK UP] · Rhydon 35 · Weezing 36 · Onix 38[BULK UP]
- T5: Golem 46[BULK UP] · Rhydon 47 · Aerodactyl 48 · Weezing 48 · Onix 50[BULK UP]
- T6: Golem 55[BULK UP] · Rhydon 55 · Aerodactyl 56 · Kabutops 56 · Weezing 57 · Hardened Onix 58[BULK UP]
- T7: Golem 59[BULK UP] · Rhydon 60 · Weezing 60 · Kabutops 60 · Aerodactyl 61 · Hardened Onix 62[BULK UP]
- Champ set8: Golem 80 · Kangaskhan 79* · Kabutops 79 · Weezing 79 · Aerodactyl 80 · Hardened Onix 89
- Champ set9: Golem 90 · Kangaskhan 89* · Kabutops 89 · Weezing 89 · Aerodactyl 90 · Hardened Onix 99

## LOCKED: Misty (Water) — sig AQUA RING, spoiler Farfetch'd(aggro Flying anti-Grass)->Wigglytuff(bulk)
- T1: Goldeen 12 · Farfetch'd 13 · Staryu 14[AQUA RING]
- T2: Goldeen 22 · Farfetch'd 22 · Starmie 23[AQUA RING]
- T3: Seaking 25 · Farfetch'd 26 · Seadra 27 · Starmie 28[AQUA RING]
- T4: Seaking 33 · Farfetch'd 35 · Kingler 36 · Starmie 38[AQUA RING]
- T5: Seaking 46 · Seadra 47 · Wigglytuff 48 · Kingler 49 · Starmie 50[AQUA RING]
- T6: Gyarados 55[AQUA RING] · Seaking 55 · Seadra 56 · Wigglytuff 56 · Kingler 57 · Starmie 58[AQUA RING]
- T7: Gyarados 60[AQUA RING] · Seaking 59 · Seadra 60 · Wigglytuff 60 · Kingler 61 · Starmie 62[AQUA RING]
- Champ set8: Gyarados 80 · Seaking 76 · Seadra 76* · Wigglytuff 77 · Kingler 77 · Starmie 80
- Champ set9: Gyarados 90 · Seaking 83 · Seadra 86* · Wigglytuff 87 · Kingler 87 · Starmie 90

## LOCKED: Surge (Electric) — sig THUNDERBOLT(on Raichu); spoiler Machop(T1-2)->Pinsir(throughline T3+)->+Hitmonchan(hi)
- T1: Voltorb 12 · Machop 13 · Pikachu 14[TBOLT]
- T2: Voltorb 22 · Machop 22 · Raichu 23[TBOLT]
- T3: Voltorb 26 · Magnemite 25 · Pinsir 27 · Raichu 28[TBOLT]
- T4: Electrode 33 · Magneton 35 · Pinsir 36 · Raichu 38[TBOLT]
- T5: Electrode 46 · Magneton 47 · Pinsir 48 · Jolteon 49 · Raichu 50[TBOLT]
- T6: Electrode 55 · Floating Magneton 55* · Electabuzz 56 · Jolteon 57 · Pinsir 56 · Raichu 58[TBOLT]
- T7: Electrode 59 · Floating Magneton 60* · Electabuzz 60 · Pinsir 60 · Hitmonchan 61 · Raichu 62[TBOLT]
- Champ set8: Electrode 73 · Floating Magneton 73 · Pinsir 74 · Hitmonchan 76 · Raichu 77 · Zapdos 80
- Champ set9: Electrode 83 · Floating Magneton 83 · Pinsir 84 · Hitmonchan 86 · Raichu 87 · Zapdos 90

## LOCKED: Erika (Grass/Poison) — sig SOLARBEAM; spoiler Dratini->Dragonair(T4)->Pidgeot(T5+, gets grass moves/SOLARBEAM)
- T1: Bellsprout 12 · Dratini 13 · Tangela 14[SOLARBEAM]
- T2: Weepinbell 22 · Dratini 22 · Tangela 23[SOLARBEAM]
- T3: Weepinbell 25 · Dratini 26 · Gloom 27 · Tangela 28[SOLARBEAM]
- T4: Victreebel 35 · Tangela 33 · Dragonair 38 · Vileplume 37[SOLARBEAM]
- T5: Victreebel 46 · Tangela 47 · Pidgeot 48(grass coverage, NOT solarbeam) · Venusaur 49 · Vileplume 50[SOLARBEAM]
- T6: Victreebel 55 · Tangela 55 · Pidgeot 56 · Butterfree 56 · Venusaur 57 · Vileplume 58[SOLARBEAM]
- T7: Victreebel 59 · Tangela 60 · Pidgeot 60 · Chansey 60 · Venusaur 61 · Vileplume 62[SOLARBEAM]
- Champ set8: Victreebel 70 · Tangela 70 · Chansey 72 · Pidgeot 72* · Venusaur 72 · Vileplume 75
- Champ set9: Victreebel 80 · Tangela 80 · Chansey 82 · Pidgeot 82* · Venusaur 82 · Vileplume 85

## LOCKED: Koga (Poison) — sig SHADOW GAME (spread across poisons); spoiler Zubat->Golbat(T1-3)->Scyther(T4+); Parasect+Floating Weezing bench
- T1: Grimer 12 · Zubat 13 · Koffing 14[SIG]
- T2: Grimer 22 · Golbat 22 · Koffing 23[SIG]
- T3: Tentacool 25 · Golbat 26 · Venonat 27 · Koffing 28[SIG]
- T4: Tentacruel 33 · Muk 35 · Scyther 36 · Weezing 38[SIG]
- T5: Tentacruel 46 · Muk 47 · Venomoth 47 · Scyther 48 · Weezing 50[SIG]
- T6: Tentacruel 55 · Muk 55 · Venomoth 56 · Scyther 56 · Parasect 57 · Weezing 58[SIG]
- T7: Tentacruel 59 · Muk 60 · Venomoth 60 · Scyther 60 · Parasect 61 · Floating Weezing 62[SIG]
- Champ: unchanged (current rematch rows already match this identity)

## LOCKED: Sabrina (Psychic) — sig SKITTERMIND (on Alakazam/Hypno); spoiler Psyduck->Golduck throughline; Ninetales(Fire, anti-Bug)+Clefable+Gengar late
- T1: Abra 12 · Psyduck 13 · Drowzee 14[SIG]
- T2: Kadabra 22 · Psyduck 22 · Hypno 23[SIG]
- T3: Kadabra 25 · Golduck 26 · Slowpoke 27 · Hypno 28[SIG]
- T4: Kadabra 33 · Golduck 35 · Mr.Mime 36 · Hypno 38[SIG]
- T5: Alakazam 46 · Golduck 47 · Mr.Mime 48 · Slowbro 49 · Hypno 50[SIG]
- T6: Hypno 55 · Mr.Mime 55 · Golduck 55 · Clefable 56 · Gengar 57 · Alakazam 58[SIG]
- T7: Hypno 59 · Ninetales 60 · Golduck 60 · Gengar 60 · Clefable 61 · Alakazam 62[SIG]
- Champ set8: Hypno 74* · Ninetales 74 · Golduck 74 · Gengar 76 · Clefable 76 · Alakazam 78
- Champ set9: Hypno 84* · Ninetales 84 · Golduck 84 · Gengar 86 · Clefable 86 · Alakazam 88

## LOCKED: Blaine (Fire) — sig SUPERNOVA (Fire-typed; on fire bodies AND Electrode); spoiler Voltorb->Electrode(anti-Water, throughline)+Golem(late)
- T1: Vulpix 12 · Voltorb 13 · Growlithe 14[SIG]
- T2: Ponyta 22 · Voltorb 22 · Growlithe 23[SIG]
- T3: Ponyta 25 · Voltorb 26 · Vulpix 27 · Growlithe 28[SIG]
- T4: Rapidash 33 · Electrode 35 · Ninetales 36 · Magmar 38[SIG]
- T5: Rapidash 46 · Electrode 47 · Ninetales 48 · Magmar 49 · Arcanine 50[SIG]
- T6: Ninetales 55 · Magmar 55 · Electrode 56 · Rapidash 56 · Golem 57 · Arcanine 58[SIG]
- T7: Ninetales 59 · Magmar 60 · Electrode 60 · Rapidash 61 · Golem 61* · Arcanine 62[SIG]
- Champ set8: Ninetales 72 · Electrode 72 · Golem 72* · Rapidash 73 · Arcanine 73 · Moltres 76
- Champ set9: Ninetales 82 · Electrode 82 · Golem 82* · Rapidash 83 · Arcanine 83 · Moltres 86
- MOVE REVIEW NOTE: SUPERNOVA is Fire-typed; goes on Electrode (gives it fire coverage) as well as fire mons.

---

## STATUS: all 7 leader rosters LOCKED + movesets DRAFTED (see gym_scaling_movesets.md), 2026-06-18.
Next: BUILD (engine + party data). Build only after user confirms movesets.

### Build plan
1. custom_movesets.asm: add ~49 tier movesets (consts + MoveSetMappings + defs) + edit the 6 reworked
   champ movesets (Brock/Misty/Surge/Erika/Sabrina/Blaine per locked rosters).
2. parties.asm: rewrite the 7 leader classes to 9 rows each (sets 1-7 = tiers via $FD, 8-9 = champ).
3. Badge->tier selector: shared helper (CountSetBits wObtainedBadges, clamp 0-6, +1 -> wTrainerNo),
   called in each of the 7 leader gym scripts right after InitBattleEnemyParameters.
4. ChampArena.asm: bump `ld b, 2`->`ld b, 8` for the 7 leader intros (GetChampArenaChallengerPartyID inc->9).
5. Gym-trainer level auto-scale: ReadTrainer hook. When wCurMap in {PEWTER/CERULEAN/VERMILION/CELADON/
   FUCHSIA/SAFFRON/CINNABAR}_GYM AND opponent class NOT in {BROCK..BLAINE}: add level delta
   = tierAnchor[playerTier]-tierAnchor[gymNaturalTier], clamp 1..100. Anchors ~ [13,22,27,36,48,56,61].
6. Build all 4 ROMs clean; NEEDS PLAYTEST.

## STATUS: BUILT — all 4 ROMs clean (2026-06-18), NEEDS PLAYTEST.
Implementation notes:
- Engine: ApplyGymLeaderBadgeTier (home/trainers.asm) wired into all 7 leader gym scripts
  (Cinnabar gated on the Blaine sprite, in CinnabarGymStartBattleScript). AdjustGymTrainerLevel +
  GymScalingMaps + GymTierAnchors in read_trainer_party.asm, called at both wCurEnemyLevel stores.
- Data: 49 tier movesets in custom_movesets.asm; the 42 non-Brock ones live in a NEW floating
  SECTION "Gym Tier Movesets" (Brock's 7 stayed in "Custom Movesets"). Champ rosters reworked for
  Brock/Misty/Surge/Erika/Sabrina/Blaine (positional moveset edits + party species swaps).
- parties.asm: each of the 7 leaders now has 9 $FD rows (sets 1-7 tiers, 8-9 champ).
- ChampArena.asm: all 7 leader intros bumped to `ld b, 8`.
- BANK FIX: parties.asm + read_trainer_party.asm live in Battle Engine 7 (bank $E); the +party rows
  overflowed $E. Floated "Slot Machines" out of $E in layout.link (it's bank-safe: jpfar entry +
  BANK() internal refs) to reclaim room. (Could not move parties out — ReadTrainer reads it same-bank.)
- LoneMoves now dormant for the 7 leaders (all tiers are $FD, which bypasses the LoneMoves path).
