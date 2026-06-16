; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - AttackAnimationPointers (see data/moves/animations.asm)
; - MoveSoundTable (see data/moves/sfx.asm)
	const_def
	const NO_MOVE      ; 00
	const POUND        ; 01 (JOLT BOLT)
	const KARATE_CHOP  ; 02
	const DOUBLESLAP   ; 03
	const COMET_PUNCH  ; 04 (MACH PUNCH)
	const MEGA_PUNCH   ; 05 (SHORYUKEN)
	const PAY_DAY      ; 06
	const FIRE_PUNCH   ; 07 (BLAZE HAMMER)
	const ICE_PUNCH    ; 08 (FROST FIST)
	const THUNDERPUNCH ; 09 (ZAPPERCUT)
	const SCRATCH      ; 0a
	const VICEGRIP     ; 0b (LOCKJAW)
	const GUILLOTINE   ; 0c (EXTERMINATE)
	const RAZOR_WIND   ; 0d
	const SWORDS_DANCE ; 0e
	const CUT          ; 0f
	const GUST         ; 10
	const WING_ATTACK  ; 11
	const WHIRLWIND    ; 12 (HURRICANE)
	const FLY          ; 13
	const BIND         ; 14 (POWER BIND)
	const SLAM         ; 15 (WASTEMAKER)
	const VINE_WHIP    ; 16
	const STOMP        ; 17
	const DOUBLE_KICK  ; 18
	const MEGA_KICK    ; 19 (PISTON KICK)
	const JUMP_KICK    ; 1a (LEAP ATTACK)
	const ROLLING_KICK ; 1b (METEOR SWEEP)
	const SAND_ATTACK  ; 1c
	const HEADBUTT     ; 1d
	const HORN_ATTACK  ; 1e (METEOR HORN)
	const FURY_ATTACK  ; 1f (MUD BOMB)
	const HORN_DRILL   ; 20 (VENOM DRILL)
	const TACKLE       ; 21
	const BODY_SLAM    ; 22
	const WRAP         ; 23
	const TAKE_DOWN    ; 24
	const THRASH       ; 25
	const DOUBLE_EDGE  ; 26
	const TAIL_WHIP    ; 27
	const POISON_STING ; 28
	const TWINEEDLE    ; 29
	const PIN_MISSILE  ; 2a
	const LEER         ; 2b
	const BITE         ; 2c
	const GROWL        ; 2d
	const ROAR         ; 2e (BELLOW)
	const SING         ; 2f
	const SUPERSONIC   ; 30
	const SONICBOOM    ; 31
	const DISABLE      ; 32
	const ACID         ; 33
	const EMBER        ; 34
	const FLAMETHROWER ; 35
	const MIST         ; 36 (ETHEREAL)
	const WATER_GUN    ; 37 (SUPER SOAK)
	const HYDRO_PUMP   ; 38
	const SURF         ; 39
	const ICE_BEAM     ; 3a
	const BLIZZARD     ; 3b
	const PSYBEAM      ; 3c
	const BUBBLEBEAM   ; 3d
	const AURORA_BEAM  ; 3e
	const HYPER_BEAM   ; 3f
	const PECK         ; 40
	const DRILL_PECK   ; 41 (AIR DRILL)
	const SUBMISSION   ; 42 (FULL NELSON)
	const LOW_KICK     ; 43
	const COUNTER      ; 44 (SHADOW BOX)
	const SEISMIC_TOSS ; 45
	const STRENGTH     ; 46
	const ABSORB       ; 47
	const MEGA_DRAIN   ; 48
	const LEECH_SEED   ; 49
	const GROWTH       ; 4a (ADAPTATION)
	const RAZOR_LEAF   ; 4b
	const SOLARBEAM    ; 4c (SOLARBEAM)
	const POISONPOWDER ; 4d
	const STUN_SPORE   ; 4e
	const SLEEP_POWDER ; 4f
	const PETAL_DANCE  ; 50 (BLOSSOMBLITZ)
	const STRING_SHOT  ; 51
	const DRAGON_RAGE  ; 52 (WYRM WRATH)
	const FIRE_SPIN    ; 53
	const THUNDERSHOCK ; 54
	const THUNDERBOLT  ; 55
	const THUNDER_WAVE ; 56
	const THUNDER      ; 57
	const ROCK_THROW   ; 58
	const EARTHQUAKE   ; 59
	const FISSURE      ; 5a
	const DIG          ; 5b
	const TOXIC        ; 5c
	const CONFUSION    ; 5d
	const PSYCHIC_M    ; 5e
	const HYPNOSIS     ; 5f
	const MEDITATE     ; 60 (VOID MIND)
	const AGILITY      ; 61
	const QUICK_ATTACK ; 62
	const RAGE         ; 63 (MAD RUSH)
	const TELEPORT     ; 64
	const NIGHT_SHADE  ; 65 (PHANTASM)
	const MIMIC        ; 66
	const SCREECH      ; 67
	const DOUBLE_TEAM  ; 68
	const RECOVER      ; 69
	const HARDEN       ; 6a
	const MINIMIZE     ; 6b
	const SMOKESCREEN  ; 6c
	const CONFUSE_RAY  ; 6d
	const WITHDRAW     ; 6e (SHELL GAME)
	const DEFENSE_CURL ; 6f (BUNKER DOWN)
	const BARRIER      ; 70
	const LIGHT_SCREEN ; 71
	const HAZE         ; 72 (BLACK HAZE)
	const REFLECT      ; 73
	const FOCUS_ENERGY ; 74
	const BIDE         ; 75 (BULK UP)
	const METRONOME    ; 76
	const MIRROR_MOVE  ; 77 (MOCKINGBIRD)
	const SELFDESTRUCT ; 78
	const EGG_BOMB     ; 79
	const LICK         ; 7a
	const SMOG         ; 7b
	const SLUDGE       ; 7c (SLUDGE BOMB)
	const BONE_CLUB    ; 7d
	const FIRE_BLAST   ; 7e
	const WATERFALL    ; 7f
	const CLAMP        ; 80
	const SWIFT        ; 81
	const SKULL_BASH   ; 82 (METEOR DRIVE)
	const SPIKE_CANNON ; 83
	const CONSTRICT    ; 84 (VENOM LASH)
	const AMNESIA      ; 85 (CALM MIND)
	const KINESIS      ; 86
	const SOFTBOILED   ; 87
	const HI_JUMP_KICK ; 88
	const GLARE        ; 89
	const DREAM_EATER  ; 8a (SOULSTEALER)
	const POISON_GAS   ; 8b
	const BARRAGE      ; 8c (SHADOW BALL)
	const LEECH_LIFE   ; 8d
	const LOVELY_KISS  ; 8e
	const SKY_ATTACK   ; 8f (BRAVE BIRD)
	const TRANSFORM    ; 90
	const BUBBLE       ; 91
	const DIZZY_PUNCH  ; 92
	const SPORE        ; 93
	const FLASH        ; 94
	const PSYWAVE      ; 95 (SKITTERMIND)
	const SPLASH       ; 96
	const ACID_ARMOR   ; 97 (ACID CLOAK)
	const CRABHAMMER   ; 98
	const EXPLOSION    ; 99
	const FURY_SWIPES  ; 9a (MUD CLAW)
	const BONEMERANG   ; 9b
	const REST         ; 9c
	const ROCK_SLIDE   ; 9d
	const HYPER_FANG   ; 9e
	const SHARPEN      ; 9f (HONE EDGE)
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
	const STRUGGLE     ; a8
DEF NUM_ATTACKS EQU const_value - 1

DEF CANNOT_MOVE EQU $ff

	; Moves do double duty as animation identifiers.

	const SHOWPIC_ANIM
	const STATUS_AFFECTED_ANIM
	const ANIM_A8 ; unused?
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
	const BURN_ANIM ; Plays when a monster is burned
	const SAFARITOSS_ANIM
	const HYPERTOSS_ANIM
	const PSN_ANIM ; Plays when a monster is poisoned
	const MASTERTOSS_ANIM ; toss Master Ball
;;;;;;;;;;
	const SLP_PLAYER_ANIM
	const SLP_ANIM ; sleeping monster
	const CONF_PLAYER_ANIM
	const CONF_ANIM ; confused monster
	const DIG_DOWN_ANIM
	const TOSS_ANIM ; toss Poké Ball
	const SHAKE_ANIM ; shaking Poké Ball when catching monster
	const POOF_ANIM ; puff of smoke
	const BLOCKBALL_ANIM ; trainer knocks away Poké Ball
	const GREATTOSS_ANIM ; toss Great Ball
	const ULTRATOSS_ANIM ; toss Ultra Ball
	const SHAKE_SCREEN_ANIM ; happens when player is inflicted with poison
	const HIDEPIC_ANIM ; monster disappears
	const ROCK_ANIM ; throw rock
	const BAIT_ANIM ; throw bait
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
;;;;;

	; 45 non-move anims + 166 move anims = 201 anims
	; 53 slots left

DEF NUM_ATTACK_ANIMS EQU const_value - 1
