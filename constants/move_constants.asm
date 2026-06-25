; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - AttackAnimationPointers (see data/moves/animations.asm)
; - MoveSoundTable (see data/moves/sfx.asm)
	const_def
	const NO_MOVE      ; 00
	const SPARK        ; 01
	const DEMOLISH  ; 02
	const DOUBLESLAP   ; 03
	const MACH_PUNCH   ; 04
	const SHORYUKEN    ; 05
	const PAY_DAY      ; 06
	const BLAZE_HAMMER ; 07
	const FROST_FIST   ; 08
	const ZAPPERCUT    ; 09
	const SCRATCH      ; 0a
	const UNDERBUG      ; 0b
	const EXTERMINATE  ; 0c
	const ROOST        ; 0d
	const SWORDS_DANCE ; 0e
	const CUT          ; 0f
	const GUST         ; 10
	const WING_ATTACK  ; 11
	const HURRICANE    ; 12
	const FLY          ; 13
	const POWER_BIND   ; 14
	const TEMPEST      ; 15
	const VINE_WHIP    ; 16
	const STOMP        ; 17
	const DOUBLE_KICK  ; 18
	const PISTON_KICK  ; 19
	const LEAP_ATTACK  ; 1a
	const METEOR_SWEEP ; 1b
	const SAND_ATTACK  ; 1c
	const HEADBUTT     ; 1d
	const METEOR_HORN  ; 1e
	const MUD_BOMB     ; 1f
	const VENOM_DRILL  ; 20
	const TACKLE       ; 21
	const BODY_SLAM    ; 22
	const WRAP         ; 23
	const HEAT_RUSH    ; 24
	const INDIGNATION      ; 25
	const DOUBLE_EDGE  ; 26
	const TAIL_WHIP    ; 27
	const POISON_STING ; 28
	const TWINEEDLE    ; 29
	const PIN_MISSILE  ; 2a
	const LEER         ; 2b
	const BITE         ; 2c
	const GROWL        ; 2d
	const BELLOW       ; 2e
	const SING         ; 2f
	const SUPERSONIC   ; 30
	const ILL_WIND     ; 31
	const DISABLE      ; 32
	const ACID         ; 33
	const EMBER        ; 34
	const FLAMETHROWER ; 35
	const AURORA_MIST  ; 36
	const SUPER_SOAK   ; 37
	const HYDRO_PUMP   ; 38
	const SURF         ; 39
	const ICE_BEAM     ; 3a
	const BLIZZARD     ; 3b
	const PSYBEAM      ; 3c
	const WATER_PULSE  ; 3d
	const AURORA_BEAM  ; 3e
	const HYPER_BEAM   ; 3f
	const PECK         ; 40
	const AIR_DRILL    ; 41
	const COMBOBREAKER  ; 42
	const FINISHER     ; 43
	const SHADOW_BOX   ; 44
	const SEISMIC_TOSS ; 45
	const STRENGTH     ; 46
	const ABSORB       ; 47
	const MEGA_DRAIN   ; 48
	const LEECH_SEED   ; 49
	const ADAPTATION   ; 4a
	const RAZOR_LEAF   ; 4b
	const SOLARBEAM    ; 4c
	const POISONPOWDER ; 4d
	const STUN_SPORE   ; 4e
	const SLEEP_POWDER ; 4f
	const SENBONZAKURA ; 50
	const STRING_SHOT  ; 51
	const WYRM_WRATH   ; 52
	const FIRE_SPIN    ; 53
	const THUNDERSHOCK ; 54
	const THUNDERBOLT  ; 55
	const THUNDER_WAVE ; 56
	const THUNDER      ; 57
	const ROCK_THROW   ; 58
	const EARTHQUAKE   ; 59
	const CLAY_ARMOR   ; 5a
	const DIG          ; 5b
	const TOXIC        ; 5c
	const CONFUSION    ; 5d
	const PSYCHIC_M    ; 5e
	const HYPNOSIS     ; 5f
	const VOID_MIND    ; 60
	const AGILITY      ; 61
	const BLITZ_STRIKE ; 62
	const BLOOD_RUSH     ; 63
	const TELEPORT     ; 64
	const PHANTASM     ; 65
	const MIMIC        ; 66
	const SCREECH      ; 67
	const DOUBLE_TEAM  ; 68
	const RECOVER      ; 69
	const HARDEN       ; 6a
	const MINIMIZE     ; 6b
	const SMOKESCREEN  ; 6c
	const CONFUSE_RAY  ; 6d
	const SHELL_GAME   ; 6e
	const ROCK_ON  ; 6f
	const BARRIER      ; 70
	const LIGHT_SCREEN ; 71
	const SHADOW_GAME  ; 72
	const REFLECT      ; 73
	const FOCUS_ENERGY ; 74
	const BULK_UP      ; 75
	const METRONOME    ; 76
	const MOCKINGBIRD  ; 77
	const SUPERNOVA    ; 78
	const EGG_BOMB     ; 79
	const LICK         ; 7a
	const SMOG         ; 7b
	const SLUDGE_BOMB  ; 7c
	const BONE_CLUB    ; 7d
	const FIRE_BLAST   ; 7e
	const RIPTIDE      ; 7f
	const CLAMP        ; 80
	const SWIFT        ; 81
	const METEOR_DRIVE ; 82
	const SPIKE_CANNON ; 83
	const VENOM_LASH   ; 84
	const CALM_MIND    ; 85
	const MIRAGE       ; 86
	const SOFTBOILED   ; 87
	const HI_JUMP_KICK ; 88
	const EXPLOSION    ; 89 ; Sunsette: vanilla EXPLOSION; 250 BP NORMAL, halves target DEF, faints user
	const SOULSTEALER  ; 8a
	const EMETIC_PURGE ; 8b
	const SHADOW_BALL  ; 8c
	const LEECH_LIFE   ; 8d
	const LOVELY_KISS  ; 8e
	const BRAVE_BIRD   ; 8f
	const TRANSFORM    ; 90
	const BUBBLE       ; 91
	const CLOBBERCLOCK  ; 92
	const SPORE        ; 93
	const FLASH        ; 94
	const SKITTERMIND  ; 95
	const SPLASH       ; 96
	const AQUA_RING    ; 97
	const CRABHAMMER   ; 98
	const OROCLASM  ; 99
	const MUD_CLAW     ; 9a
	const BONEMERANG   ; 9b
	const REST         ; 9c
	const ROCK_SLIDE   ; 9d
	const HYPER_FANG   ; 9e
	const HONE_EDGE    ; 9f
	const CONVERSION   ; a0
	const TRI_ATTACK   ; a1
	const SUPER_FANG   ; a2
	const SLASH        ; a3
	const SUBSTITUTE   ; a4
	; Sunsette: dedicated legendary-bird signature moves, cloned from Whirlwind / Drill Peck / Sky Attack.
	; Placed just before STRUGGLE so every other move ID is unchanged (only STRUGGLE shifts, and
	; NUM_ATTACKS == STRUGGLE still holds). Effects mirror the bird signatures (SpeciesMoveBonus).
	const WINTER_GALE  ; a5 - ARTICUNO (clone of WHIRLWIND)
	const STORM_DRILL  ; a6 - ZAPDOS   (clone of Drill Peck)
	const PHOENIX_DIVE ; a7 - MOLTRES  (clone of SKY_ATTACK)
	; Sunsette: MAXIMIZE - NORMAL status buff (Jigglypuff/Muk/Gengar/Golbat lines). Sets the user's
	; ATTACK to +6 and drops its EVASION and SPEED by 2 each. Placed just before STRUGGLE so only
	; STRUGGLE shifts (NUM_ATTACKS == STRUGGLE still holds).
	const MAXIMIZE     ; a8
	; Sunsette: CRYSTALLIZE - ROCK status buff (Onix line + the cocoon/bug lines). +2 DEFENSE, and turns a
	; Rock-type's type1 to CRYSTAL or a non-Rock's type1 to ROCK. Placed before STRUGGLE so only STRUGGLE
	; shifts (NUM_ATTACKS == STRUGGLE still holds). +2 DEF via DEFENSE_UP2_EFFECT; type change via CrystallizeModifier.
	const CRYSTALLIZE  ; a9
	; Sunsette: QUICK ATTACK revived as the early/weak member of the comeback priority line (BLITZ STRIKE is the
	; upgrade). Placed just before STRUGGLE so only STRUGGLE shifts (NUM_ATTACKS == STRUGGLE still holds).
	const QUICK_ATTACK ; aa
	; Sunsette: PSYCHO SHIFT - PSYCHIC 0-BP status move. Transfers the USER's own ailments (PSN/BRN/PAR,
	; toxic-aware, + CONFUSION) onto the target and cures the user of whatever lands. Placed just before
	; STRUGGLE so only STRUGGLE shifts (NUM_ATTACKS == STRUGGLE still holds). Effect = PSYCHO_SHIFT_EFFECT.
	const PSYCHO_SHIFT ; ab
	; Sunsette: GIGA DRAIN - GRASS 75-BP drain (DRAIN_HP_EFFECT, 50% drain like ABSORB/MEGA DRAIN). Placed
	; just before STRUGGLE so only STRUGGLE shifts (NUM_ATTACKS == STRUGGLE still holds). No learnset yet.
	const GIGA_DRAIN   ; ac
	; Sunsette: SAPPING COLD - ICE drain that goes LAST and freezes if the user wasn't hit. Placed just
	; before STRUGGLE so only STRUGGLE shifts (NUM_ATTACKS == STRUGGLE still holds).
	const SAPPING_COLD ; ad
	; Sunsette: PLASMA BURN (electric Scald), BULLDOZE (stock), ENERGY FLUX (capacitor setup). Placed before
	; STRUGGLE so only STRUGGLE shifts (NUM_ATTACKS == STRUGGLE still holds).
	const PLASMA_BURN  ; ae
	const BULLDOZE     ; af
	const ENERGY_FLUX  ; b0
	const MUDSLIDE     ; b1 ; Sunsette: GROUND spread alternative to EARTHQUAKE (90/90, 50% -1 target SPEED via SpeciesMoveBonus)
	const POISON_FANG  ; b2 ; Sunsette: POISON 50/100, 50% chance to BADLY-poison (toxic) on hit - sets up the statused condition POISON punishes
	const BUG_OFF      ; b3 ; Sunsette: BUG 0-BP disrupt-and-pivot - confuse + -1 SPECIAL the target, then the user switches out / flees (Butterfree/Venomoth)
	; Sunsette: PSYCHOCRISIS - PSYCHIC "INDIGNATION" (THRASH_PETAL_DANCE_EFFECT, shared with INDIGNATION). 120 BP,
	; locks 2-3 turns, cleanses the user on activation (see ThrashPetalDanceEffect -> IndignationCleanse), and
	; takes 1/2-damage self-recoil every turn (SpeciesMoveBonus .psychocrisisRecoil). Placed just before STRUGGLE
	; so only STRUGGLE shifts (NUM_ATTACKS == STRUGGLE still holds). Self-confuse at lock-end hits PSYCHIC users.
	const PSYCHOCRISIS ; b4
	; Sunsette: ROCK SMASH (40-BP FIGHTING, chance to -1 target DEF), SUPERPOWER (120-BP FIGHTING, self -1 ATK/-1
	; DEF on hit via SunsettePostHitSelfEffects), SUBMISSION (FIGHTING clone of DOUBLE-EDGE / RECOIL_EFFECT).
	; Placed before STRUGGLE so only STRUGGLE shifts (NUM_ATTACKS == STRUGGLE still holds).
	const ROCK_SMASH   ; b5
	const SUPERPOWER   ; b6
	const SUBMISSION   ; b7
	const SLAM         ; b8 ; Sunsette: NEW plain NORMAL 80-BP move (vanilla SLAM's slot is now TEMPEST; this reclaims the free SLAM const). Before STRUGGLE so only STRUGGLE shifts.
	const PSYSHOCK     ; b9 ; Sunsette: PSYCHIC (special-category) move that hits the target's physical DEFENSE (PsyshockSwapDefender in the damage calc). Before STRUGGLE so only STRUGGLE shifts.
	const FLUTTER_KICK ; ba ; Sunsette: FLYING clone of BONEMERANG (hits twice, 30% -SPEED). No Fly/Dig bypass; FLOATING users get STAB (ShouldMoveGetStabBoost). Before STRUGGLE so only STRUGGLE shifts.
	const HYDROBATH    ; bb ; Sunsette: WATER two-turn no-damage setup (Goldeen/Seaking/Seel/Dewgong). Charges invulnerable like Dig but breached by ELECTRIC, not ground; surfaces to cure status + SPEED/SPECIAL +2. Before STRUGGLE so only STRUGGLE shifts.
	const STRUGGLE     ; bc
DEF NUM_ATTACKS EQU const_value - 1

DEF CANNOT_MOVE EQU $ff

	; Moves do double duty as animation identifiers.

	const SHOWPIC_ANIM
	const STATUS_AFFECTED_ANIM
	const ANIM_A8      ; unused?
	const SHAKE_ENEMY_HUD_ANIM ; happens when a side effect applies status to an enemy
	const TRADE_BALL_DROP_ANIM
	const TRADE_BALL_SHAKE_ANIM
	const TRADE_BALL_TILT_ANIM
	const TRADE_BALL_POOF_ANIM
	const XSTATITEM_ANIM ; use X Attack/Defense/Speed/Special
	const SHRINKING_SQUARE_ANIM ; happens before using thrash or petal dance animations
;;;;;;;;;; PureRGBnote: CHANGED: some unused animations are now unique animations
	const TRI_ATTACK_START
	const TRI_ATTACK_TRIANGLE2
	const TRI_ATTACK_TRIANGLE3
	const TRI_ATTACK_FIRE
	const TRI_ATTACK_ICE
	const TRI_ATTACK_THUNDER
	const AMNESIA_ENEMY_ANIM
	const BURN_ANIM    ; Plays when a monster is burned
	const SAFARITOSS_ANIM
	const HYPERTOSS_ANIM
	const PSN_ANIM     ; Plays when a monster is poisoned
	const MASTERTOSS_ANIM ; toss Master Ball
;;;;;;;;;;
	const SLP_PLAYER_ANIM
	const SLP_ANIM     ; sleeping monster
	const CONF_PLAYER_ANIM
	const CONF_ANIM    ; confused monster
	const DIG_DOWN_ANIM
	const TOSS_ANIM    ; toss Poké Ball
	const SHAKE_ANIM   ; shaking Poké Ball when catching monster
	const POOF_ANIM    ; puff of smoke
	const BLOCKBALL_ANIM ; trainer knocks away Poké Ball
	const GREATTOSS_ANIM ; toss Great Ball
	const ULTRATOSS_ANIM ; toss Ultra Ball
	const SHAKE_SCREEN_ANIM ; happens when player is inflicted with poison
	const HIDEPIC_ANIM ; monster disappears
	const ROCK_ANIM    ; throw rock
	const BAIT_ANIM    ; throw bait
;;;;; PureRGBnote: ADDED: new animation constants
	const FLY_ANIM_PART1
	const FIRE_PILLAR_ANIM
	const RAGE_ENEMY_ANIM
	const CONVERSION_DEFENSE_MODE_ANIM
	const CONVERSION_ATTACK_MODE_ANIM
	const RADIATION_ANIM
	const DIVINE_PROTECTION_ANIM
	const POKE_DOLL_ANIM
	const SEND_OUT_MON_BALL_POOF_ANIM
	const HAPPINESS_HEART_ANIM ; Sunsette: affection heart cue
	const HAPPINESS_SPARKLE_ANIM ; Sunsette: legendary sparkle cue (over the PLAYER's mon)
	const HAPPINESS_SPARKLE_ENEMY_ANIM ; Sunsette: legendary sparkle cue (over the ENEMY's mon)
	const PSISMIC_TOSS_ANIM ; Sunsette: PSISMIC TOSS - Psychic-user variant of SEISMIC TOSS's animation (PlayAnimation swaps to it via MaybeSeismicTossPsychicAnim)
	const DESPERATE_SENBONZAKURA_ANIM ; Sunsette: comeback family - SENBONZAKURA at desperation stage 2-3 (swapped in by MaybeDesperateAnim)
	const DESPERATE_BLITZ_STRIKE_ANIM ; Sunsette: comeback family - BLITZ STRIKE at stage 2-3
	const DESPERATE_HYPER_BEAM_ANIM ; Sunsette: comeback family - HYPER BEAM at stage 2-3
	const DESPERATE_BLOOD_RUSH_ANIM ; Sunsette: comeback family - BLOOD RUSH at stage 2-3
	const DESPERATE_COMBOBREAKER_ANIM ; Sunsette: comeback family - COMBOBREAKER at stage 2-3
	const DESPERATE_UNDERBUG_ANIM ; Sunsette: comeback family - UNDERBUG at stage 2-3
	const DESPERATE_QUICK_ATTACK_ANIM ; Sunsette: comeback family - QUICK ATTACK at stage 2-3 (copy of BLITZ STRIKE's anim)
;;;;;

	; NUM_ATTACK_ANIMS below is the authoritative count (NUM_ATTACKS move anims + the non-move anims above)

DEF NUM_ATTACK_ANIMS EQU const_value - 1
