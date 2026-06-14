; PureRGBnote: CHANGED: Many move effects or values were tweaked/changed

MACRO move
	db \1 ; animation (interchangeable with move id)
	db \2 ; effect
	db \3 ; power
	db \4 ; type
	db \5 percent ; accuracy
	db \6 ; pp
	ASSERT \6 <= 40, "PP must be 40 or less"
ENDM

Moves:
; Characteristics of each move.
	table_width MOVE_LENGTH
	move POUND,        JOLT_BOLT_EFFECT,            55, ELECTRIC,     100, 20 ; JOLT BOLT (was PUMMEL): priority; 50% chance to raise the user's EVASION by 1
	move KARATE_CHOP,  NO_ADDITIONAL_EFFECT,        40, FIGHTING,     100, 20 ; high crit ratio
	move DOUBLESLAP,   TWO_TO_FIVE_ATTACKS_EFFECT,  15, NORMAL,        85, 10
	move COMET_PUNCH,  NO_ADDITIONAL_EFFECT,        60, FIGHTING,     100, 15 ; MACH PUNCH; priority move
	move MEGA_PUNCH,   SHORYUKEN_EFFECT,           100, DRAGON,       100, 5 ; SHORYUKEN (was HAYMAKER): hits through FLY's invuln turn (CheckSemiInvulnBypass) + strips the target's FLYING/FLOATING type on hit (SpeciesMoveBonus -> ShoryukenGround), restored by ROOST. SHORYUKEN_EFFECT is a no-op, just nonzero to enable the hook.
	move PAY_DAY,      PAY_DAY_EFFECT,              50, NORMAL,       100, 20
	move FIRE_PUNCH,   NO_ADDITIONAL_EFFECT,        75, FIRE,         100, 15 ; Sunsette: no status; uses the user's higher of ATTACK/SPECIAL (GHOST-style dynamic category, see GetDamageVars)
	move ICE_PUNCH,    NO_ADDITIONAL_EFFECT,        75, ICE,          100, 15 ; Sunsette: no status; dynamic ATTACK/SPECIAL category
	move THUNDERPUNCH, NO_ADDITIONAL_EFFECT,        75, ELECTRIC,     100, 15 ; Sunsette: no status; dynamic ATTACK/SPECIAL category
	move SCRATCH,      NO_ADDITIONAL_EFFECT,        45, NORMAL,       100, 20
	move VICEGRIP,     HOBBLE_EFFECT,               75, BUG,          100, 15 ; LOCKJAW: BUG move that guarantees -1 SPEED and -1 EVASION on the target (HobbleEffect_)
	move GUILLOTINE,   NO_ADDITIONAL_EFFECT,        80, BUG,           80,  5 ; Sunsette: powerful, inaccurate, high-crit BUG move (was OHKO) (EXTERMINATE)
	move RAZOR_WIND,   ROOST_EFFECT,       	         0, FLYING,       100, 10 ; -> ROOST: heal 1/2 + refresh to natural type/palette (cures SKITTERMIND/WATERIFY) + ground (strip FLYING/FLOATING this turn)
	move SWORDS_DANCE, ATTACK_UP2_EFFECT,            0, FIRE,         100, 20 ; 
	move CUT,          CUT_DISABLE_EFFECT,          70, BUG,          100, 15
	move GUST,         ACCURACY_DOWN_SIDE_EFFECT,	50, FLYING,       100, 20 ; Sunsette: 30% chance to lower the target's ACCURACY
	move WING_ATTACK,  FLINCH_SIDE_EFFECT2,         65, FLYING,       100, 15 ; Sunsette: 30% flinch
	move WHIRLWIND,    CONFUSION_BIG_SIDE_EFFECT,  110, FLYING,        80, 10 ; HURRICANE
	move FLY,          FLY_EFFECT,                  75, FLYING,       100, 15
	move BIND,         TRAPPING_EFFECT,             20, ROCK,          85,  10 ; STONEBOUND
	move SLAM,         CUT_DISABLE_EFFECT,          70, POISON,       100, 15 ; WASTEMAKER
	move VINE_WHIP,    DEFENSE_DOWN_SIDE_EFFECT,    30, GRASS,        100, 15
	move STOMP,        FLINCH_SIDE_EFFECT2,         65, NORMAL,       100, 15
	move DOUBLE_KICK,  ATTACK_TWICE_EFFECT,         30, FIGHTING,     100, 20
	move MEGA_KICK,    PARALYZE_SIDE_EFFECT2,      100, FIGHTING,      90,  10 ; PISTON KICK: 30% paralyze
	move JUMP_KICK,    JUMP_KICK_EFFECT,            95, FLYING,        90, 15 ; LEAP ATTACK
	move ROLLING_KICK, HOBBLE_EFFECT,               70, ROCK,         100, 15 ; METEOR SWEEP: ROCK move that guarantees -1 SPEED and -1 EVASION on the target (HobbleEffect_)
	move SAND_ATTACK,  ACCURACY_DOWN1_EFFECT,        0, GROUND,       100, 15
	move HEADBUTT,     FLINCH_SIDE_EFFECT2,         75, NORMAL,       100, 15
	move HORN_ATTACK,  NO_ADDITIONAL_EFFECT,        60, ROCK,          90, 20 ; METEOR HORN 
	move FURY_ATTACK,  ACCURACY_DOWN_SIDE_EFFECT,   65, GROUND,        90, 20 ; MUD BOMB
	move HORN_DRILL,   POISON_SIDE_EFFECT2,         75, POISON,        80,  5 ; -> VENOM DRILL ; high crit ratio
	move TACKLE,       NO_ADDITIONAL_EFFECT,        35, NORMAL,       100, 20
	move BODY_SLAM,    PARALYZE_SIDE_EFFECT2,       85, NORMAL,       100, 15
	move WRAP,         TRAPPING_EFFECT,             12, NORMAL,        90, 10
	move TAKE_DOWN,    HEAT_RUSH_EFFECT,            65, FIRE,         100, 15 ; -> HEAT RUSH ; Flame Charge: damage + raises user Speed
	move THRASH,       THRASH_PETAL_DANCE_EFFECT,  120, DRAGON,       100, 10 ; OUTRAGE
	move DOUBLE_EDGE,  RECOIL_EFFECT,          	   120, NORMAL,       100, 10
	move TAIL_WHIP,    DEFENSE_DOWN1_EFFECT,         0, NORMAL,       100, 20
	move POISON_STING, POISON_SIDE_EFFECT2,         15, POISON,       100, 20
	move TWINEEDLE,    TWINEEDLE_EFFECT,            50, BUG,          100, 20 ; hits twice, 20% chance of poison
	move PIN_MISSILE,  TWO_TO_FIVE_ATTACKS_EFFECT,  18, BUG,          100, 20 ; priority move
	move LEER,         DEFENSE_DOWN1_EFFECT,         0, NORMAL,       100, 20
	move BITE,         FLINCH_SIDE_EFFECT1,         65, NORMAL,       100, 15
	move GROWL,        ATTACK_DOWN1_EFFECT,          0, NORMAL,       100, 20
	move ROAR,         ATTACK_DOWN_SIDE_EFFECT,     60, DRAGON,       100, 20 ; BELLOW
	move SING,         SLEEP_EFFECT,                 0, NORMAL,        55, 15
	move SUPERSONIC,   CONFUSION_EFFECT,             0, NORMAL,        55, 20
	move SONICBOOM,    FLINCH_SIDE_EFFECT1,         50, GHOST,        100, 15 ; priority move; ILL WIND
	move DISABLE,      DISABLE_EFFECT,               0, NORMAL,       100, 10
	move ACID,         DEFENSE_DOWN_SIDE_EFFECT,    50, POISON,       100, 20
	move EMBER,        BURN_SIDE_EFFECT1,           40, FIRE,         100, 20
	move FLAMETHROWER, BURN_SIDE_EFFECT2,           90, FIRE,         100, 15
	move MIST,         MIST_EFFECT,                  0, ICE,          100, 20 ; priority (ETHEREAL)
	move WATER_GUN,    WATERIFY_EFFECT,            45, WATER,        100, 20 ; Sunsette: retypes the target to WATER
	move HYDRO_PUMP,   WATERIFY_EFFECT,           120, WATER,         90, 10 ; Sunsette: retypes the target to WATER
	move SURF,         SWIFT_EFFECT,  		        90, WATER,        100, 15
	move ICE_BEAM,     FREEZE_SIDE_EFFECT2,         80, ICE,         100, 10
	move BLIZZARD,     FREEZE_SIDE_EFFECT2,         120, ICE,          80,  5 ; Sunsette: 30% freeze; reaches FLY users through their semi-invuln turn (CheckSemiInvulnBypass)
	move PSYBEAM,      CONFUSION_SIDE_EFFECT,       65, PSYCHIC_TYPE, 100, 15
	move BUBBLEBEAM,   CONFUSION_BIG_SIDE_EFFECT,   75, WATER,        100, 15
	move AURORA_BEAM,  CONFUSION_BIG_SIDE_EFFECT,   65, ICE,          100, 15 ; Sunsette: 30% confusion 
	move HYPER_BEAM,   HYPER_BEAM_EFFECT,          150, NORMAL,        90,  5
	move PECK,         NO_ADDITIONAL_EFFECT,        40, FLYING,       100, 20
	move DRILL_PECK,   CUT_DISABLE_EFFECT,          80, FLYING,       100, 15
	move SUBMISSION,   CUT_DISABLE_EFFECT,          70, FIGHTING,     100, 10 ; Sunsette: damage + DISABLE (FULL NELSON)
	move LOW_KICK,     NO_ADDITIONAL_EFFECT,        60, FIGHTING,     100, 20 ; Sunsette: power set live from the target's weight (LowKickModifier); base 60 = fallback for non-dex foes. No flinch - it's a pure weight-based hit.
	move COUNTER,      DRAIN_HP_EFFECT,             75, GHOST,   	  100, 10 ; SHADOW BOX
	move SEISMIC_TOSS, SPECIAL_DAMAGE_EFFECT,        1, FIGHTING,     100, 20
	move STRENGTH,     STRENGTH_EFFECT,            100, NORMAL,        90, 15 ; Sunsette: NORMAL, flat 100 BP. 30% chance to raise the user's ATTACK by 1; if the user is a LIGHTER weight class than the target, the user also takes 1/2-damage recoil ("But the foe was too heavy!"). All in StrengthRagePostHit; STRENGTH_EFFECT just enables the SpeciesMoveBonus hook.
	move ABSORB,       DRAIN_HP_EFFECT,             30, GRASS,        100, 20
	move MEGA_DRAIN,   DRAIN_HP_EFFECT,             60, GRASS,        100, 10
	move LEECH_SEED,   LEECH_SEED_EFFECT,            0, GRASS,        100, 10
	move GROWTH,       GROWTH_EFFECT,                0, GRASS,        100, 10 ; FLOURISH: +1 Special, puts user in regen state
	move RAZOR_LEAF,   NO_ADDITIONAL_EFFECT,        55, GRASS,        100, 20 ; high crit ratio
	move SOLARBEAM,    SOLARBEAM_EFFECT,    	   120, GRASS,        100,  10 ; SOLAR CANNON: pseudo-charge (power set live: 60 charge / 120 release / 90 fire by SolarBeamPowerModifier)
	move POISONPOWDER, POISON_EFFECT,                0, POISON,        75, 20
	move STUN_SPORE,   PARALYZE_EFFECT,              0, GRASS,         75, 15
	move SLEEP_POWDER, SLEEP_EFFECT,                 0, GRASS,         75, 15
	move PETAL_DANCE,  BLOSSOM_BLITZ_EFFECT,       110, GRASS,         85, 10 ; BLOSSOM BLITZ: 50% chance to raise the user's SPEED by 1 (was a confuse chance)
	move STRING_SHOT,  SPEED_DOWN1_EFFECT,           0, BUG,           95, 20
	move DRAGON_RAGE,  SPECIAL_DOWN_SIDE_EFFECT,    90, DRAGON,       100, 10 ; WYRM WRATH
	move FIRE_SPIN,    TRAPPING_EFFECT,             24, FIRE,          85,  10
	move THUNDERSHOCK, PARALYZE_SIDE_EFFECT1,       40, ELECTRIC,     100, 20
	move THUNDERBOLT,  PARALYZE_SIDE_EFFECT2,       90, ELECTRIC,     100, 15
	move THUNDER_WAVE, PARALYZE_EFFECT,              0, ELECTRIC,     100, 15
	move THUNDER,      PARALYZE_SIDE_EFFECT1,      120, ELECTRIC,      85, 10
	move ROCK_THROW,   NO_ADDITIONAL_EFFECT,        50, ROCK,          90, 15
	move EARTHQUAKE,   SWIFT_EFFECT,    		   100, GROUND,       100, 10
	move FISSURE,      OHKO_EFFECT,                  1, GROUND,        30,  5
	move DIG,          CHARGE_EFFECT,               75, GROUND,       100, 15
	move TOXIC,        POISON_EFFECT,                0, POISON,        90, 10
	move CONFUSION,    CONFUSION_SIDE_EFFECT,       50, PSYCHIC_TYPE, 100, 20
	move PSYCHIC_M,    SPECIAL_DOWN_SIDE_EFFECT,    90, PSYCHIC_TYPE, 100, 10
	move HYPNOSIS,     SLEEP_EFFECT,                 0, PSYCHIC_TYPE,  60, 15
	move MEDITATE,     MEDITATE_EFFECT,              0, PSYCHIC_TYPE, 100, 15 ; VOID MIND: priority; Light Screen on user + ATTACK +1
	move AGILITY,      SPEED_UP2_EFFECT,             0, PSYCHIC_TYPE, 100, 20
	move QUICK_ATTACK, NO_ADDITIONAL_EFFECT,        70, NORMAL,       100, 10 ; priority move
	move RAGE,         ATTACK_UP_SIDE_EFFECT,       40, NORMAL,       100, 20 ; MAD RUSH: +1 ATK + damage; UnleashRageModifier TRIPLES BP to 120 if the user is hurt (HP not green)/confused/non-sleep-statused, and on a damaging hit it clears that status/confusion (recalc)
	move TELEPORT,     TELEPORT_EFFECT,              0, PSYCHIC_TYPE, 100, 20
	move NIGHT_SHADE,  PARALYZE_SIDE_EFFECT2,       70, GHOST,        100, 15 ; PHANTASM (was NIGHT STALK)
	move MIMIC,        MIMIC_EFFECT,                 0, NORMAL,       100, 10 ; now uses the mimic'd attack the same turn it's learned
	move SCREECH,      SCREECH_EFFECT,               0, GHOST,        100, 20 ; now has a SLEEP-prevention effect added
	move DOUBLE_TEAM,  EVASION_UP1_EFFECT,           0, NORMAL,       100, 15
	move RECOVER,      HEAL_EFFECT,                  0, PSYCHIC_TYPE, 100, 20
	move HARDEN,       DEFENSE_UP1_EFFECT,           0, ROCK,         100, 20
	move MINIMIZE,     EVASION_UP2_EFFECT,           0, NORMAL,       100, 20
	move SMOKESCREEN,  ACCURACY_DOWN1_EFFECT,        0, ROCK,         100, 20
	move CONFUSE_RAY,  CONFUSION_EFFECT,             0, GHOST,        100, 10
	move WITHDRAW,     WITHDRAW_EFFECT,              0, WATER,        100, 10
	move DEFENSE_CURL, DEFENSE_CURL_EFFECT,          0, NORMAL,       100, 15 ; makes super effective moves do normal damage (BUNKER DOWN)
	move BARRIER,      DEFENSE_UP2_EFFECT,           0, GHOST,        100, 20
	move LIGHT_SCREEN, LIGHT_SCREEN_EFFECT,          0, PSYCHIC_TYPE, 100, 20
	move HAZE,         HAZE_EFFECT,                  0, POISON,       100, 20 ; BLACK HAZE
	move REFLECT,      REFLECT_EFFECT,               0, ELECTRIC,     100, 20
	move FOCUS_ENERGY, FOCUS_ENERGY_EFFECT,          0, ELECTRIC,     100, 20 
	move BIDE,         ATTACK_DEFENSE_UP1_EFFECT,    0, ROCK,         100, 20 ; BULK UP
	move METRONOME,    METRONOME_EFFECT,             0, NORMAL,       100, 10 
	move MIRROR_MOVE,  MIRROR_MOVE_EFFECT,           0, FLYING,       100, 10 ; MOCKINGBIRD: priority; copies ALL the foe's stat-stage changes onto the user, then drops the foe's SPECIAL by 1
	move SELFDESTRUCT, EXPLODE_RECOIL_EFFECT,      140, FIRE,         100,  5 ; high recoil normally, original instant defeat effect and 250 power / half defense at low health.
	move EGG_BOMB,     CONFUSION_BIG_SIDE_EFFECT,   75, NORMAL,       100, 10 ; Sunsette: Normal-typed but attacks special; 30% confusion (see damage calc override)
	move LICK,         PARALYZE_SIDE_EFFECT1,       30, GHOST,        100, 20
	move SMOG,         POISON_SIDE_EFFECT2,         30, POISON,       100, 20
	move SLUDGE,       POISON_SIDE_EFFECT2,         90, POISON,       100, 15 ; SLUDGE BOMB
	move BONE_CLUB,    FLINCH_SIDE_EFFECT1,         65, GROUND,       100, 15
	move FIRE_BLAST,   BURN_SIDE_EFFECT1,          120, FIRE,          85,  5
	move WATERFALL,    FLINCH_SIDE_EFFECT2,         80, WATER,        100, 15
	move CLAMP,        TRAPPING_EFFECT,             12, WATER,         90, 10
	move SWIFT,        SWIFT_EFFECT,                50, NORMAL,       100, 20 ; 
	move SKULL_BASH,   JUMP_KICK_EFFECT,           100, ROCK,          80, 10
	move SPIKE_CANNON, TWO_OR_THREE_ATTACKS_EFFECT, 42, ROCK,         100, 10
	move CONSTRICT,    PARALYZE_SIDE_EFFECT2,       75, GRASS,     100, 15 ; -> STRANGLEVINE: 30% paralyze; 90 BP for TANGELA (see RemappableMoves)
	move AMNESIA,      CALM_MIND_EFFECT,             0, PSYCHIC_TYPE, 100, 20 ; CALM MIND: +1 SPECIAL (both spc atk & def in Gen 1) + clears the user's own CONFUSION
	move KINESIS,      MIRAGE_EFFECT,                0, FIRE,          90, 20 ; -> MIRAGE ; no damage; confuses a non-fire target, burns if user is fire or target already confused
	move SOFTBOILED,   HEAL_EFFECT,                  0, NORMAL,       100, 10
	move HI_JUMP_KICK, JUMP_KICK_EFFECT,           120, FIGHTING,      90, 10
	move GLARE,        PARALYZE_EFFECT,              0, NORMAL,       100, 15
	move DREAM_EATER,  DRAIN_HP_EFFECT,             90, GHOST,        100, 15 ; SOULSTEALER : heals only if the foe has a status or is confused
	move POISON_GAS,   FLINCH_SIDE_EFFECT2,         40, POISON,       100, 20 ; MIASMA priority move ; high flinch chance
	move BARRAGE,      SPECIAL_DOWN_SIDE_EFFECT,    80, GHOST,        100, 15 ; -> SHADOW BALL (was SPIRIT BOMB): 80 BP GHOST, ~33% chance to drop the foe's SPECIAL
	move LEECH_LIFE,   DRAIN_HP_EFFECT,             75, BUG,          100, 15
	move LOVELY_KISS,  SLEEP_EFFECT,                 0, PSYCHIC_TYPE,  75, 10
	move SKY_ATTACK,   RECOIL_EFFECT,          	   120, FLYING,       100, 10 ; BRAVE BIRD (120 FLYING + recoil already matches the name)
	move TRANSFORM,    TRANSFORM_EFFECT,             0, NORMAL,       100, 10 ; priority move
	move BUBBLE,       CONFUSION_BIG_SIDE_EFFECT,   20, WATER,        100, 20 ; low confusion chance
	move DIZZY_PUNCH,  CONFUSION_BIG_SIDE_EFFECT,   70, FIGHTING,     100, 10
	move SPORE,        SLEEP_EFFECT,                 0, GRASS,         90, 15
	move FLASH,        FLASH_EFFECT,                 0, ELECTRIC,     100,  10 ; priority move; no damage; -1 target EVASION + -1 target ACCURACY, then 30% flinch
	move PSYWAVE,      MINDWIPE_EFFECT,              0, PSYCHIC_TYPE, 100, 20 ; SKITTERMIND: no damage; retype target to BUG (gray palette) + -1 ACCURACY
	move SPLASH,       SPLASH_EFFECT,                0, NORMAL,       100, 20
	move ACID_ARMOR,   ACID_ARMOR_EFFECT,            0, POISON,       100, 20 ; combined reflect and light screen effects in one move (ACID CLOAK)
	move CRABHAMMER,   NO_ADDITIONAL_EFFECT,        50, WATER,         95, 10 ; high critical hit ratio
	move EXPLOSION,    EXPLODE_RECOIL_EFFECT,      140, ROCK,         100,  5
	move FURY_SWIPES,  NO_ADDITIONAL_EFFECT,        45, GROUND,       100, 15 ; MUD CLAW
	move BONEMERANG,   BONEMERANG_EFFECT,           50, BONEMERANG_TYPE, 95, 10 ; hits twice, 30% chance to lower speed of opponent, can hit flying opponents
	move REST,         HEAL_EFFECT,                  0, PSYCHIC_TYPE, 100, 10
	move ROCK_SLIDE,   FLINCH_SIDE_EFFECT2,         85, ROCK,          90, 10
	move HYPER_FANG,   FLINCH_SIDE_EFFECT2,         90, NORMAL,        90, 15
	move SHARPEN,      ATTACK_ACCURACY_UP1_EFFECT,   0, NORMAL,       100, 20 ; HONE EDGE: ATTACK +1 and ACCURACY +1 
	move CONVERSION,   CONVERSION_EFFECT,            0, TRI,          100,  10 ; Two modes, defense mode halves damage. Attack mode uses an attack that is super effective on the opponent.
	move TRI_ATTACK,   TRI_ATTACK_EFFECT,           90, TRI,          100, 10 ; 10% chance each of freeze/burn/paralysis, uses SPECIAL stat, NORMAL pokemon get STAB.
	move SUPER_FANG,   SUPER_FANG_EFFECT,            1, NORMAL,       100, 10 ; now does 2/3 of the opponents HP instead of 1/2
	move SLASH,        NO_ADDITIONAL_EFFECT,        70, NORMAL,       100, 15 ; high critical hit ratio
	move SUBSTITUTE,   SUBSTITUTE_EFFECT,            0, NORMAL,       100, 10
	; Sunsette: legendary-bird signature moves cloned from WHIRLWIND / DRILL_PECK / SKY_ATTACK. Data mirrors
	; the source moves; the elemental status (freeze/paralyze/burn+regen) is added in SpeciesMoveBonus, keyed
	; on the new move IDs + the matching bird species.
	move WINTER_GALE,  CONFUSION_BIG_SIDE_EFFECT,  110, FLYING,        80,  5 ; ARTICUNO (clone of WHIRLWIND/HURRICANE) + 30% FREEZE
	move STORM_DRILL,  CUT_DISABLE_EFFECT,          80, FLYING,       100,  5 ; ZAPDOS (clone of DRILL_PECK) + 30% PARALYZE
	move PHOENIX_DIVE, RECOIL_EFFECT,              120, FLYING,       100,  5 ; MOLTRES (clone of SKY_ATTACK/BRAVE BIRD) + 30% BURN + GROWING regen
	move STRUGGLE,     BIG_RECOIL_EFFECT,           50, TYPELESS,     100, 10
	assert_table_length NUM_ATTACKS
