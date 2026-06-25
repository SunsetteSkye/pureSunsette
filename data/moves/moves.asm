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
	move SPARK,        PARALYZE_SIDE_EFFECT2,       65, ELECTRIC,     100, 20 ; SPARK (was JOLT BOLT, was PUMMEL): 30% chance to paralyze the foe
	move DEMOLISH,  NO_ADDITIONAL_EFFECT,        50, FIGHTING,     100, 20 ; high crit ratio; Sunsette: BP 40->50; displayed as DEMOLISH, breaks REFLECT/LIGHT SCREEN pre-damage (DemolishBreakScreens)
	move DOUBLESLAP,   TWO_TO_FIVE_ATTACKS_EFFECT,  15, NORMAL,        85, 10
	move MACH_PUNCH,  NO_ADDITIONAL_EFFECT,        60, FIGHTING,     100, 15 ; MACH PUNCH; priority move
	move SHORYUKEN,   STRENGTH_EFFECT,            75, DRAGON,       100, 5 ; SHORYUKEN: special DRAGON setup uppercut - ~80% chance to raise the USER's ATTACK +1 on a connecting hit (SpeciesMoveBonus -> .shoryukenAtk), made to combo into physical attacks. Still bypasses FLY's invuln turn (CheckSemiInvulnBypass). Reuses STRENGTH_EFFECT (no-op) only to enable the SpeciesMoveBonus hook.
	move PAY_DAY,      PAY_DAY_EFFECT,              50, NORMAL,       100, 20
	move BLAZE_HAMMER,   NO_ADDITIONAL_EFFECT,        75, FIRE,         100, 15 ; Sunsette: no status; uses the user's higher of ATTACK/SPECIAL (GHOST-style dynamic category, see GetDamageVars)
	move FROST_FIST,    NO_ADDITIONAL_EFFECT,        75, ICE,          100, 15 ; Sunsette: no status; dynamic ATTACK/SPECIAL category
	move ZAPPERCUT, NO_ADDITIONAL_EFFECT,        75, ELECTRIC,     100, 15 ; Sunsette: no status; dynamic ATTACK/SPECIAL category
	move SCRATCH,      NO_ADDITIONAL_EFFECT,        45, NORMAL,       100, 20
	move UNDERBUG,     NO_ADDITIONAL_EFFECT,        70, BUG,          100, 15 ; comeback: ComebackApplyPower scales power 70/75/80/90 by stage; confuse chance scales 0/30/100/100 by stage (UnderBugConfuse_ in SpeciesMoveBonus)
	move EXTERMINATE,   NO_ADDITIONAL_EFFECT,       100, BUG,           80,  5 ; Sunsette: powerful, inaccurate, high-crit BUG move (was OHKO); BP 80->100
	move ROOST,   ROOST_EFFECT,       	         0, FLYING,       100, 10 ; -> ROOST: heal 1/2 + refresh to natural type/palette (cures SKITTERMIND/WATERIFY) + ground (strip FLYING/FLOATING this turn)
	move SWORDS_DANCE, ATTACK_UP2_EFFECT,            0, FIRE,         100, 20
	move CUT,          CUT_DISABLE_EFFECT,          70, BUG,          100, 15
	move GUST,         FLINCH_SIDE_EFFECT2,	        50, FLYING,       100, 20 ; Sunsette: 30% flinch (was -ACCURACY) - flinch reads as Flying's speed/disruption identity; -ACCURACY now concentrates as a Ground/Rock "blinding dust" thing (Mud Bomb/Mud Claw/Sand Attack/Smokescreen keep it)
	move WING_ATTACK,  FLINCH_SIDE_EFFECT2,         65, FLYING,       100, 15 ; Sunsette: 30% flinch
	move HURRICANE,    CONFUSION_BIG_SIDE_EFFECT,  110, FLYING,        80, 10
	move FLY,          FLY_EFFECT,                  70, FLYING,        90, 15 ; Sunsette: 90% acc (the dive can whiff, the cost of its bigger +2 EVASION cushion); DIG stays 100%/+1
	move POWER_BIND,         FLINCH_SIDE_EFFECT2,         50, NORMAL,        85,  10 ; POWER BIND (was STONEBOUND): Sunsette trapping rework -> 30% flinch + guaranteed target -1 SPEED (SpeciesMoveBonus).
	move TEMPEST,         TEMPEST_EFFECT,              60, DRAGON,        90, 10 ; TEMPEST (was TWISTER): power scales with the TARGET's weight (TempestWeightModifier, compressed 20/35/50/65/80/90; 60 = non-dex fallback) + grounds the target on hit (strips FLYING/FLOATING, TempestGround; restored by ROOST). Bypasses FLY's invuln turn (CheckSemiInvulnBypass).
	move VINE_WHIP,    DEFENSE_DOWN_SIDE_EFFECT,    40, GRASS,        100, 15
	move STOMP,        FLINCH_SIDE_EFFECT2,         65, NORMAL,       100, 15
	move DOUBLE_KICK,  ATTACK_TWICE_EFFECT,         30, FIGHTING,     100, 20
	move PISTON_KICK,    PARALYZE_SIDE_EFFECT2,      100, FIGHTING,      90,  10 ; PISTON KICK: 30% paralyze
	move LEAP_ATTACK,    JUMP_KICK_EFFECT,            95, FLYING,        90, 15
	move METEOR_SWEEP, HOBBLE_EFFECT,               70, ROCK,         100, 15 ; METEOR SWEEP: ROCK move that guarantees -1 SPEED and -1 EVASION on the target (HobbleEffect_)
	move SAND_ATTACK,  ACCURACY_DOWN1_EFFECT,        0, GROUND,       100, 15
	move HEADBUTT,     FLINCH_SIDE_EFFECT2,         70, NORMAL,       100, 15
	move METEOR_HORN,  NO_ADDITIONAL_EFFECT,        60, ROCK,          90, 20
	move MUD_BOMB,  ACCURACY_DOWN_SIDE_EFFECT,   65, GROUND,        90, 20
	move VENOM_DRILL,   POISON_SIDE_EFFECT2,        100, POISON,        80,  5 ; -> VENOM DRILL ; high crit ratio
	move TACKLE,       NO_ADDITIONAL_EFFECT,        35, NORMAL,       100, 20
	move BODY_SLAM,    PARALYZE_SIDE_EFFECT2,       95, NORMAL,       100, 15
	move WRAP,         FLINCH_SIDE_EFFECT2,         25, NORMAL,        90, 10 ; Sunsette trapping rework -> 30% flinch + guaranteed target -1 SPEED (SpeciesMoveBonus)
	move HEAT_RUSH,    HEAT_RUSH_EFFECT,            65, FIRE,         100, 15 ; -> HEAT RUSH ; Flame Charge: damage + raises user Speed
	move INDIGNATION,       THRASH_PETAL_DANCE_EFFECT,   90, DRAGON,       100, 10 ; Sunsette: displayed INDIGNATION. 120->90 BP; the lock now resets the user's stats + cleanses its status/buffs on activation (IndignationCleanse, keeps FLOURISH). Self-confuse at lock end as ever.
	move DOUBLE_EDGE,  RECOIL_EFFECT,          	   120, NORMAL,       100, 10
	move TAIL_WHIP,    DEFENSE_DOWN1_EFFECT,         0, NORMAL,       100, 20
	move POISON_STING, POISON_SIDE_EFFECT2,         15, POISON,       100, 20
	move TWINEEDLE,    TWINEEDLE_EFFECT,            50, BUG,          100, 20 ; hits twice, 20% chance of poison
	move PIN_MISSILE,  TWO_TO_FIVE_ATTACKS_EFFECT,  20, BUG,          100, 20 ; priority move
	move LEER,         DEFENSE_DOWN1_EFFECT,         0, NORMAL,       100, 20
	move BITE,         FLINCH_SIDE_EFFECT1,         65, NORMAL,       100, 15
	move GROWL,        ATTACK_DOWN1_EFFECT,          0, NORMAL,       100, 20
	move BELLOW,         ATTACK_DOWN_SIDE_EFFECT,     60, DRAGON,       100, 20
	move SING,         SLEEP_EFFECT,                 0, NORMAL,        55, 15
	move SUPERSONIC,   CONFUSION_EFFECT,             0, NORMAL,        55, 20
	move ILL_WIND,    FLINCH_SIDE_EFFECT1,         60, GHOST,        100, 15 ; priority move; ILL WIND
	move DISABLE,      DISABLE_EFFECT,               0, NORMAL,       100, 10
	move ACID,         DEFENSE_DOWN_SIDE_EFFECT,    50, POISON,       100, 20
	move EMBER,        BURN_SIDE_EFFECT1,           40, FIRE,         100, 20
	move FLAMETHROWER, BURN_SIDE_EFFECT2,           90, FIRE,         100, 15
	move AURORA_MIST,         MIST_EFFECT,                  0, ICE,          100, 20 ; AURORA MIST ("Cleansing Aurora", white mirror of SHADOW GAME): Haze-resets BOTH sides' stat stages + cleanses status (incl. confusion) on both, then sets Mist stat-down-immunity + a status-ward (no new status can land) on BOTH. ICE/NORMAL user also gets +1 SPEED. AuroraMistEffect_
	move SUPER_SOAK,    WATERIFY_EFFECT,            40, WATER,        100, 20 ; SUPER SOAK - Sunsette: retypes the target to WATER
	move HYDRO_PUMP,   NO_ADDITIONAL_EFFECT,      110, WATER,         90, 10 ; Sunsette: pure nuke (dropped WATERIFY, BP 120->110)
	move SURF,         SWIFT_EFFECT,  		        80, WATER,        100, 15 ; Sunsette: BP 90->80
	move ICE_BEAM,     FREEZE_SIDE_EFFECT2,         80, ICE,         100, 10
	move BLIZZARD,     FREEZE_SIDE_EFFECT2,         120, ICE,          80,  5 ; Sunsette: 30% freeze; reaches FLY users through their semi-invuln turn (CheckSemiInvulnBypass)
	move PSYBEAM,      CONFUSION_SIDE_EFFECT,       65, PSYCHIC_TYPE, 100, 15
	move WATER_PULSE,   CONFUSION_BIG_SIDE_EFFECT,   65, WATER,        100, 15 ; WATER PULSE: chance to confuse
	move AURORA_BEAM,  ATTACK_DOWN_SIDE_EFFECT,     65, ICE,          100, 15 ; Sunsette: 33% chance to lower the foe's ATTACK
	move HYPER_BEAM,   HYPER_BEAM_EFFECT,          120, NORMAL,        90,  5 ; comeback: ComebackApplyPower scales power 120/140/160/200 by stage; keeps recharge (self-confuse on a KO, special category); breaks REFLECT/LIGHT SCREEN at stages 2-3 (rider)
	move PECK,         NO_ADDITIONAL_EFFECT,        40, FLYING,       100, 20
	move AIR_DRILL,   CUT_DISABLE_EFFECT,          80, FLYING,       100, 15
	move COMBOBREAKER,   CUT_DISABLE_EFFECT,          40, FIGHTING,     100, 10 ; comeback: ComebackApplyPower scales power 40/60/75/90 by stage; always +1 priority but VERY inaccurate (30%) at stage 0 (ComboBreakerAccuracy)
	move FINISHER,     NO_ADDITIONAL_EFFECT,       150, FIGHTING,     100,  5 ; FINISHER: a Focus-Punch-like COMBO MOVE. Goes LAST; 150 BP if unimpeded ("FINISH THEM!"), 50 BP if the user took a direct hit first (FinisherPowerModifier -> FinisherPowerImpl). Can't be used 2 turns running (CheckComboMoveLock). FIGHTING.
	move SHADOW_BOX,      SHADOW_BOX_EFFECT,           90, GHOST,   	  100, 10 ; Sunsette: brace-counter. Power 90 (read foe's Special) / 60 (whiff) via ShadowBoxPowerModifier; FIGHTING users get STAB
	move SEISMIC_TOSS, SPECIAL_DAMAGE_EFFECT,        1, FIGHTING,     100, 20
	move STRENGTH,     STRENGTH_EFFECT,            100, NORMAL,        90, 15 ; Sunsette: NORMAL, flat 100 BP. 30% chance to raise the user's ATTACK by 1; if the user is a LIGHTER weight class than the target, the user also takes 1/2-damage recoil ("But the foe was too heavy!"). All in StrengthRagePostHit; STRENGTH_EFFECT just enables the SpeciesMoveBonus hook.
	move ABSORB,       DRAIN_HP_EFFECT,             30, GRASS,        100, 20 ; Sunsette: plain drain
	move MEGA_DRAIN,   DRAIN_HP_EFFECT,             45, GRASS,        100, 10 ; Sunsette: plain drain
	move LEECH_SEED,   LEECH_SEED_EFFECT,            0, GRASS,        100, 10 ; has type effectiveness now
	move ADAPTATION,       GROWTH_EFFECT,                0, GRASS,        100, 10 ; ADAPTATION: cures the user's status, grants FLOURISH regen, and halves damage from the type that last hit it (fails if not hit). Erika's TM.
	move RAZOR_LEAF,   NO_ADDITIONAL_EFFECT,        65, GRASS,        100, 20 ; high crit ratio; Sunsette: BP 55->65
	move SOLARBEAM,    SOLARBEAM_EFFECT,    	   120, GRASS,        100,  10 ; SOLARBEAM: real charge turn (no damage, +1 SPC + FLOURISH, classic charge anim); release 120 + 30% burn + -1 SPC; FIRE skips charge (full power + recoil). Power set live by SolarBeamPowerModifier (0/120/120).
	move POISONPOWDER, POISON_EFFECT,                0, POISON,       100, 20 ; Sunsette: acc 75->100
	move STUN_SPORE,   PARALYZE_EFFECT,              0, GRASS,         75, 15
	move SLEEP_POWDER, SLEEP_EFFECT,                 0, GRASS,         75, 15
	move SENBONZAKURA,  SENBONZAKURA_EFFECT,         60, GRASS,         85, 10 ; SENBONZAKURA: comeback move. ComebackModifier scales power 60/90/120/150 by desperation stage; SenbonzakuraEffect_ grants FLOURISH that scales with the stage (none / single / double / double).
	move STRING_SHOT,  SPEED_DOWN1_EFFECT,           0, BUG,           95, 20
	move WYRM_WRATH,  SPECIAL_DOWN_SIDE_EFFECT,    90, DRAGON,       100, 10
	move FIRE_SPIN,    FLINCH_SIDE_EFFECT2,         75, FIRE,          85,  10 ; Sunsette trapping rework -> 30% flinch + 30% burn (SpeciesMoveBonus)
	move THUNDERSHOCK, PARALYZE_SIDE_EFFECT1,       40, ELECTRIC,     100, 20
	move THUNDERBOLT,  PARALYZE_SIDE_EFFECT2,       90, ELECTRIC,     100, 15
	move THUNDER_WAVE, PARALYZE_EFFECT,              0, ELECTRIC,     100, 15
	move THUNDER,      PARALYZE_SIDE_EFFECT1,      120, ELECTRIC,      85, 10
	move ROCK_THROW,   NO_ADDITIONAL_EFFECT,        50, ROCK,          90, 15
	move EARTHQUAKE,   SWIFT_EFFECT,    		   100, GROUND,       100, 10
	move CLAY_ARMOR,      CLAY_ARMOR_EFFECT,            0, GROUND,       100, 10 ; CLAY ARMOR: 0-BP self-buff; earthbound types (FIGHT/POISON/GROUND/ROCK/BUG, non-airborne) raise BOTH screens + heal 1/2 HP (all users). Goes LAST + must RECHARGE next turn (the speed-denominated cost; no stat-down). Fails if a screen is up. Giovanni's TM. ClayArmorEffect_.
	move DIG,          CHARGE_EFFECT,               80, GROUND,       100, 15 ; Sunsette: charge turn resets the user's own stat stages (no self-EVASION now); the dig-up hit drops the TARGET's ACCURACY -1 (SpeciesMoveBonus .digAccDrop), compounding across cycles.
	move TOXIC,        POISON_EFFECT,                0, POISON,        90, 10
	move CONFUSION,    CONFUSION_SIDE_EFFECT,       50, PSYCHIC_TYPE, 100, 20
	move PSYCHIC_M,    SPECIAL_DOWN_SIDE_EFFECT,    90, PSYCHIC_TYPE, 100, 10
	move HYPNOSIS,     SLEEP_EFFECT,                 0, PSYCHIC_TYPE,  60, 15
	move VOID_MIND,     VOID_MIND_EFFECT,            0, PSYCHIC_TYPE, 100, 15 ; VOID MIND: "use the Force" - maxes the user's ACCURACY (+6) + clears its own CONFUSION, pushing through the confusion self-hit roll (VoidMindEffect + the .IsConfused bypass). No longer priority/Light Screen/Attack.
	move AGILITY,      SPEED_UP2_EFFECT,             0, PSYCHIC_TYPE, 100, 20
	move BLITZ_STRIKE, NO_ADDITIONAL_EFFECT,        70, NORMAL,       100, 10 ; priority move; comeback: ComebackApplyPower scales power 70/80/90/100 by desperation stage; can't-miss at stages 2-3 (rider)
	move BLOOD_RUSH,         NO_ADDITIONAL_EFFECT,        50, NORMAL,       100, 20 ; comeback: 50 BP static; on a connecting hit raises own ATTACK by (1 + stage) and at stages 2-3 clears own status/confusion (StrengthRagePostHit .rage). ComebackApplyPower handles the desperation flavour/anim.
	move TELEPORT,     TELEPORT_EFFECT,              0, PSYCHIC_TYPE, 100, 20
	move PHANTASM,  PARALYZE_SIDE_EFFECT2,       70, GHOST,        100, 15 ; PHANTASM (was NIGHT STALK)
	move MIMIC,        MIMIC_EFFECT,                 0, NORMAL,       100, 10 ; now uses the mimic'd attack the same turn it's learned
	move SCREECH,      SCREECH_EFFECT,               0, GHOST,        100, 20 ; now has a SLEEP-prevention effect added
	move DOUBLE_TEAM,  EVASION_UP1_EFFECT,           0, NORMAL,       100, 15
	move RECOVER,      HEAL_EFFECT,                  0, PSYCHIC_TYPE, 100, 20
	move HARDEN,       DEFENSE_UP1_EFFECT,           0, ROCK,         100, 20
	move MINIMIZE,     EVASION_UP2_EFFECT,           0, NORMAL,       100, 20
	move SMOKESCREEN,  ACCURACY_DOWN1_EFFECT,        0, ROCK,         100, 20
	move CONFUSE_RAY,  CONFUSION_EFFECT,             0, GHOST,        100, 10
	move SHELL_GAME,     WITHDRAW_EFFECT,              0, WATER,        100, 10 ; SHELL GAME (was SUBMERGE): WATERIFY the opponent + switch out (flee in wild) / take Reflect (ShellGameEffect_)
	move ROCK_ON, DEFENSE_CURL_EFFECT,          0, ROCK,       100, 15 ; ROCK ON: comeback status move. ALL stages: reset own stats + brace vs the foe's last attack type. Stage 1+: +1 DEF + no-one-can-sleep. Stage 2-3: +1 SPECIAL + heal 1/4 (s2) / 1/2 (s3). See _DefenseCurlEffect.
	move BARRIER,      DEFENSE_UP2_EFFECT,           0, GHOST,        100, 20
	move LIGHT_SCREEN, LIGHT_SCREEN_EFFECT,          0, PSYCHIC_TYPE, 100, 20
	move SHADOW_GAME,         HAZE_EFFECT,                  0, POISON,       100,  5 ; SHADOW GAME: Haze reset of both sides' stat stages + volatile statuses (permanent status like sleep/poison is preserved), then badly-poisons BOTH mons (POISON- and GHOST-types immune; an already-statused mon is skipped) + raises BOTH mons' EVASION by 2 (BlackHazeFieldEffect).
	move REFLECT,      REFLECT_EFFECT,               0, ELECTRIC,     100, 20
	move FOCUS_ENERGY, FOCUS_ENERGY_EFFECT,          0, ELECTRIC,     100, 20 
	move BULK_UP,         ATTACK_DEFENSE_UP1_EFFECT,    0, FIGHTING,         100, 20
	move METRONOME,    METRONOME_EFFECT,             0, PSYCHIC_TYPE,       100, 10 
	move MOCKINGBIRD,  MIRROR_MOVE_EFFECT,           0, FLYING,       100, 10 ; MOCKINGBIRD: copies ALL the foe's stat-stage changes onto the user, then confuses the foe
	move SUPERNOVA, SUPERNOVA_EFFECT,           140, FIRE,         100,  5 ; SUPERNOVA: FIRE user takes NO recoil + sheds FIRE (mono -> NORMAL) + PAL_MINDWIPE gray; non-FIRE user takes heavy recoil + self-burn. Blaine's TM. SupernovaEffect_.
	move EGG_BOMB,     CONFUSION_BIG_SIDE_EFFECT,   75, NORMAL,       100, 10 ; Sunsette: Normal-typed but attacks special; 30% confusion (see damage calc override)
	move LICK,         PARALYZE_SIDE_EFFECT1,       30, GHOST,        100, 20
	move SMOG,         POISON_SIDE_EFFECT2,         40, POISON,       100, 20
	move SLUDGE_BOMB,       POISON_SIDE_EFFECT2,         90, POISON,       100, 15
	move BONE_CLUB,    FLINCH_SIDE_EFFECT1,         65, GROUND,       100, 15
	move FIRE_BLAST,   BURN_SIDE_EFFECT1,          120, FIRE,          85,  5
	move RIPTIDE,    BLOSSOM_BLITZ_EFFECT,        80, WATER,        100, 15 ; RIPTIDE: 50% to raise user SPEED (always for GYARADOS/SEAKING/GOLDEEN); was a flinch chance
	move CLAMP,        FLINCH_SIDE_EFFECT2,         60, WATER,         90, 10 ; Sunsette trapping rework -> 30% flinch + guaranteed user +1 DEF (SpeciesMoveBonus)
	move SWIFT,        SWIFT_EFFECT,                60, NORMAL,       100, 20
	move METEOR_DRIVE,   JUMP_KICK_EFFECT,           100, ROCK,          80, 10
	move SPIKE_CANNON, TWO_OR_THREE_ATTACKS_EFFECT, 45, ROCK,         90, 10
	move VENOM_LASH,    CUT_DISABLE_EFFECT,          90, POISON,    100, 15 ; -> VENOM LASH (was STRANGLEVINE): POISON; damage + DISABLE the foe's last move (DisableEffectCore, as CUT does); flat 90 BP
	move CALM_MIND,      CALM_MIND_EFFECT,             0, PSYCHIC_TYPE, 100, 20 ; CALM MIND: +1 SPECIAL (both spc atk & def in Gen 1) + clears the user's own CONFUSION
	move MIRAGE,      CONFUSION_BIG_SIDE_EFFECT,   65, FIRE,         100, 15 ; -> MIRAGE ; FIRE-type clone of WATER PULSE: 30% chance to confuse
	move SOFTBOILED,   HEAL_EFFECT,                  0, NORMAL,       100, 10
	move HI_JUMP_KICK, JUMP_KICK_EFFECT,           120, FIGHTING,      90, 10
	move EXPLOSION,    EXPLODE_EFFECT,             250, NORMAL,       100,  5 ; Sunsette: vanilla EXPLOSION; halves the target's DEFENSE (core.asm) and the user faints on use (ExplosionFaintModifier)
	move SOULSTEALER,  DRAIN_HP_EFFECT,             90, GHOST,        100, 15 ; SOULSTEALER : heals only if the foe has a status or is confused
	move EMETIC_PURGE,   MIASMA_EFFECT,                0, POISON,       100, 20 ; EMETIC PURGE: priority, 0-BP "revenge stat clear" - resets the FOE's stat stages to neutral + regular-poisons it (POISON/GHOST immune; Sub blocks the poison). MiasmaEffect_. No damage, no flinch.
	move SHADOW_BALL,      SPECIAL_DOWN_SIDE_EFFECT,    80, GHOST,        100, 15 ; -> SHADOW BALL (was SPIRIT BOMB): 80 BP GHOST, ~33% chance to drop the foe's SPECIAL
	move LEECH_LIFE,   DRAIN_HP_EFFECT,             75, BUG,          100, 15
	move LOVELY_KISS,  SLEEP_EFFECT,                 0, PSYCHIC_TYPE,  75, 10
	move BRAVE_BIRD,   RECOIL_EFFECT,          	   120, FLYING,       100, 10 ; BRAVE BIRD (120 FLYING + recoil already matches the name)
	move TRANSFORM,    TRANSFORM_EFFECT,             0, NORMAL,       100, 10 ; priority move
	move BUBBLE,       CONFUSION_BIG_SIDE_EFFECT,   20, WATER,        100, 20 ; low confusion chance
	move CLOBBERCLOCK,  CONFUSION_BIG_SIDE_EFFECT,   70, FIGHTING,     100, 10
	move SPORE,        SLEEP_EFFECT,                 0, BUG,           90, 15
	move FLASH,        FLASH_EFFECT,                 0, ELECTRIC,     100,  10 ; no damage; resets the target's stat stages to neutral (anti-setup) + -2 target ACCURACY (FlashEffect_). No priority, no flinch.
	move SKITTERMIND,      MINDWIPE_EFFECT,              0, PSYCHIC_TYPE, 100, 20 ; SKITTERMIND: no damage; retype target to BUG (gray palette) + CONFUSE the target
	move SPLASH,       SPLASH_EFFECT,               30, FLYING,       100, 20 ; Sunsette: damage scales with the USER's weight (SplashWeightModifier, half Low Kick's brackets); 30 is just the non-dex fallback. MAGIKARP signature = no effect + a random comedy line (SplashEffect_).
	move AQUA_RING,   AQUA_RING_EFFECT,             0, WATER,        100, 20 ; AQUA RING (was ACID CLOAK): 0-BP self-buff; grants FLOURISH + DOUBLE_FLOURISH (1/8-per-turn regen). Misty's TM. AquaRingEffect_.
	move CRABHAMMER,   NO_ADDITIONAL_EFFECT,       100, WATER,         90, 10 ; high critical hit ratio
	move OROCLASM,    NO_ADDITIONAL_EFFECT,       110, ROCK,         90,  10 ; OROCLASM: ROCK anti-barrier finisher. Goes LAST (turn-order code) + clears the FOE's screens PRE-DAMAGE (DemolishBreakScreens), so the 110 lands at full power on a foe who just raised a barrier. No status. Usable consecutively (no combo lock).
	move MUD_CLAW,  ACCURACY_DOWN_SIDE_EFFECT,    40, GROUND,       100, 20
	move BONEMERANG,   BONEMERANG_EFFECT,           50, BONEMERANG_TYPE, 95, 10 ; hits twice, 30% chance to lower speed of opponent, can hit flying opponents
	move REST,         HEAL_EFFECT,                  0, NORMAL, 100, 5
	move ROCK_SLIDE,   FLINCH_SIDE_EFFECT2,         85, ROCK,          90, 10
	move HYPER_FANG,   FLINCH_SIDE_EFFECT2,         90, NORMAL,        90, 15
	move HONE_EDGE,      ATTACK_ACCURACY_UP1_EFFECT,   0, NORMAL,       100, 20 ; HONE EDGE: ATTACK +1 and ACCURACY +1
	move CONVERSION,   CONVERSION_EFFECT,            0, TRI,          100,  10 ; Two modes, defense mode halves damage. Attack mode uses an attack that is super effective on the opponent.
	move TRI_ATTACK,   TRI_ATTACK_EFFECT,           90, TRI,          100, 10 ; 10% chance each of freeze/burn/paralysis; dynamic category (higher of ATK/SPECIAL); TRI is neutral vs all types; NORMAL pokemon get STAB.
	move SUPER_FANG,   SUPER_FANG_EFFECT,            1, NORMAL,       100, 10 ; removes half the foe's current HP, or 2/3 on a critical hit
	move SLASH,        NO_ADDITIONAL_EFFECT,        70, NORMAL,       100, 15 ; high critical hit ratio; Sunsette: BP 70->90
	move SUBSTITUTE,   SUBSTITUTE_EFFECT,            0, NORMAL,       100, 10
	; Sunsette: legendary-bird signature moves cloned from WHIRLWIND / DRILL_PECK / SKY_ATTACK. Data mirrors
	; the source moves; the elemental status (freeze/paralyze/burn+regen) is added in SpeciesMoveBonus, keyed
	; on the new move IDs + the matching bird species.
	move WINTER_GALE,  CONFUSION_BIG_SIDE_EFFECT,  110, FLYING,        80,  5 ; ARTICUNO (clone of WHIRLWIND/HURRICANE) + 30% FREEZE
	move STORM_DRILL,  CUT_DISABLE_EFFECT,          80, FLYING,       100,  5 ; ZAPDOS (clone of DRILL_PECK) + 30% PARALYZE
	move PHOENIX_DIVE, RECOIL_EFFECT,              120, FLYING,       100,  5 ; MOLTRES (clone of SKY_ATTACK/BRAVE BIRD) + 30% BURN + FLOURISH regen
	move MAXIMIZE,     MAXIMIZE_EFFECT,              0, NORMAL,       100, 10 ; Sunsette: User ATTACK -> +6, EVASION -2, SPEED -2 (MaximizeEffect_)
	move CRYSTALLIZE,  DEFENSE_UP2_EFFECT,           0, ROCK,         100, 10 ; Sunsette: +2 DEFENSE; type1 -> CRYSTAL (Rock user) / ROCK (non-Rock), via CrystallizeModifier
	move QUICK_ATTACK, NO_ADDITIONAL_EFFECT,        45, NORMAL,       100, 20 ; priority move; comeback: ComebackApplyPower scales power 45/50/65/70 by stage; can't-miss at stages 2-3 (weak early version of BLITZ STRIKE)
	move PSYCHO_SHIFT, PSYCHO_SHIFT_EFFECT,          0, PSYCHIC_TYPE, 100, 10 ; PSYCHO SHIFT: 0-BP status; transfers the user's PSN/BRN/PAR (toxic-aware) + CONFUSION to the target, curing the user (PsychoShiftEffect_, ResidualEffects1)
	move GIGA_DRAIN,   DRAIN_HP_EFFECT,             75, GRASS,        100, 10 ; Sunsette: premium drain (no learnset yet); no crit-vs-status signature
	move SAPPING_COLD, SAPPING_COLD_EFFECT,        60, ICE,          100,  5 ; Sunsette: ICE drain (heals 1/2). Goes LAST; freezes the target if the user took no direct hit that turn (SappingColdEffect_). Low PP.
	move PLASMA_BURN,  BURN_SIDE_EFFECT2,           80, ELECTRIC,     100, 10 ; Sunsette: "electric Scald" - 30% burn. Less oppressive than Scald (its SE target WATER is burn-immune; Electric mons lack Water bulk).
	move BULLDOZE,     SPEED_DOWN_SIDE_EFFECT,      60, GROUND,       100, 20 ; Sunsette: stock Bulldoze - GROUND, chance to lower the target's SPEED.
	move ENERGY_FLUX,  ENERGY_FLUX_EFFECT,           0, ELECTRIC,     100, 10 ; Sunsette: capacitor setup - type2->FLOATING + SPECIAL +2 + ENERGIZED; discharges (reset stats+type) on the next special-typed damaging hit.
	move MUDSLIDE,     NO_ADDITIONAL_EFFECT,        90, GROUND,        90, 10 ; Sunsette: GROUND spread alternative to EARTHQUAKE - 50% chance to drop the target's SPEED (SpeciesMoveBonus .mudslideSpeed). Power/control trade vs EQ's never-miss 100.
	move POISON_FANG,  NO_ADDITIONAL_EFFECT,        50, POISON,       100, 15 ; Sunsette: 50% chance to BADLY-poison (toxic) the target on hit (SpeciesMoveBonus .poisonFang -> PoisonFangToxic_). Sets up the statused condition POISON punishes (crit-vs-statused).
	move BUG_OFF,      BUG_OFF_EFFECT,               0, BUG,          100, 15 ; Sunsette: 0-BP disrupt-and-pivot - confuse + SPECIAL -1 the target, then the user switches out / flees (BugOffEffect_, Haze trampoline). Sub blocks it.
	move PSYCHOCRISIS, THRASH_PETAL_DANCE_EFFECT,  120, PSYCHIC_TYPE, 100, 10 ; Sunsette: PSYCHIC "INDIGNATION". Shares the lock + activation cleanse with INDIGNATION; ADDS 1/2-damage self-recoil every turn (SpeciesMoveBonus .psychocrisisRecoil) - a last-stand nuke. FLOURISH survives the cleanse as a regen gambit.
	move ROCK_SMASH,   DEFENSE_DOWN_SIDE_EFFECT,    50, FIGHTING,     100, 15 ; Sunsette: ROCK SMASH - chance to lower the target's DEFENSE (same odds as ACID/AURORA BEAM)
	move SUPERPOWER,   NO_ADDITIONAL_EFFECT,       120, FIGHTING,     100,  5 ; Sunsette: SUPERPOWER - huge, but lowers the USER's ATTACK + DEFENSE by 1 on a connecting hit (SunsettePostHitSelfEffects .superpower)
	move SUBMISSION,   RECOIL_EFFECT,              120, FIGHTING,     100, 10 ; Sunsette: SUBMISSION - FIGHTING clone of DOUBLE-EDGE (1/3-damage recoil via DefaultRecoilEffect_)
	move SLAM,         NO_ADDITIONAL_EFFECT,        80, NORMAL,       100, 20 ; Sunsette: NEW plain NORMAL move
	move PSYSHOCK,     NO_ADDITIONAL_EFFECT,        80, PSYCHIC_TYPE, 100, 10 ; Sunsette: special-category PSYCHIC move that strikes the target's physical DEFENSE (PsyshockSwapDefender; Reflect protects, not Light Screen)
	move FLUTTER_KICK, BONEMERANG_EFFECT,           35, FLYING,        90, 15 ; Sunsette: FLYING clone of BONEMERANG - hits twice, 30% -SPEED. FLOATING users get STAB (ShouldMoveGetStabBoost); no Fly/Dig bypass.
	move STRUGGLE,     BIG_RECOIL_EFFECT,           50, TYPELESS,     100, 10
	assert_table_length NUM_ATTACKS
