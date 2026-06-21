; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemPrices (see data/items/prices.asm)
; - TechnicalMachinePrices (see data/items/tm_prices.asm)
; - KeyItemFlags (see data/items/key_items.asm)
; - ItemUsePtrTable (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM       ; $00
	const MASTER_BALL   ; $01
	const ULTRA_BALL    ; $02
	const GREAT_BALL    ; $03
	const POKE_BALL     ; $04
	const HYPER_BALL    ; $05 ; PureRGBnote: ADDED: New item, used to be TOWN MAP
	const BICYCLE       ; $06
	const SURFBOARD     ; $07
	const SAFARI_BALL   ; $08
	const POKEDEX       ; $09 pointless item?
	const MOON_STONE    ; $0A
	const ANTIDOTE      ; $0B
	const BURN_HEAL     ; $0C
	const ICE_HEAL      ; $0D
	const AWAKENING     ; $0E
	const PARLYZ_HEAL   ; $0F
	const FULL_RESTORE  ; $10
	const MAX_POTION    ; $11
	const HYPER_POTION  ; $12
	const SUPER_POTION  ; $13
	const POTION        ; $14
	const SAFARI_BAIT   ; $15 ; PureRGBnote: CHANGED: each of the badges used to have an item defined starting at this index, they were cleaned out
	const SAFARI_ROCK   ; $16
	const OLD_COIN      ; $17 ; PureRGBnote: ADDED: New item
	const TOPSECRETKEY  ; $18 ; PureRGBnote: ADDED: New item
	const CAMERA        ; $19 ; PureRGBnote: ADDED: New item
	const UNUSED_ITEM4  ; $1A
	const UNUSED_ITEM5  ; $1B
	const UNUSED_ITEM6  ; $1C
	const ESCAPE_ROPE   ; $1D
	const REPEL         ; $1E
	const OLD_AMBER     ; $1F
	const FIRE_STONE    ; $20
	const THUNDER_STONE ; $21
	const WATER_STONE   ; $22
	const HP_UP         ; $23
	const PROTEIN       ; $24
	const IRON          ; $25
	const CARBOS        ; $26
	const CALCIUM       ; $27
	const RARE_CANDY    ; $28
	const DOME_FOSSIL   ; $29
	const HELIX_FOSSIL  ; $2A
	const SECRET_KEY    ; $2B
	const POCKET_ABRA   ; $2C ; PureRGBnote: ADDED: New item, used to be an unused placeholder item
	const BIKE_VOUCHER  ; $2D
	const X_ACCURACY    ; $2E
	const LEAF_STONE    ; $2F
	const CARD_KEY      ; $30
	const NUGGET        ; $31
	const APEX_CHIP     ; $32 ; PureRGBnote: ADDED: New item, used to be a broken second instance of PP Up
	const POKE_DOLL     ; $33
	const FULL_HEAL     ; $34
	const REVIVE        ; $35
	const MAX_REVIVE    ; $36
	const GUARD_SPEC    ; $37
	const SUPER_REPEL   ; $38
	const MAX_REPEL     ; $39
	const DIRE_HIT      ; $3A
	const COIN          ; $3B ; useless item?
	const FRESH_WATER   ; $3C
	const SODA_POP      ; $3D
	const LEMONADE      ; $3E
	const S_S_TICKET    ; $3F
	const GOLD_TEETH    ; $40
	const X_ATTACK      ; $41
	const X_DEFEND      ; $42
	const X_SPEED       ; $43
	const X_SPECIAL     ; $44
	const LOST_WALLET   ; $45 ; PureRGBnote: ADDED: New item, Used to be COIN_CASE before coin case was switched to be an event only
	const OAKS_PARCEL   ; $46
	const ITEMFINDER    ; $47
	const SILPH_SCOPE   ; $48
	const POKE_FLUTE    ; $49
	const LIFT_KEY      ; $4A
	const BOOSTER_CHIP  ; $4B ; PureRGBnote: ADDED: New item, used to be EXP.ALL
	const OLD_ROD       ; $4C
	const GOOD_ROD      ; $4D
	const SUPER_ROD     ; $4E
	const PP_UP         ; $4F
	const ETHER         ; $50
	const MAX_ETHER     ; $51
	const ELIXER        ; $52
	const MAX_ELIXER    ; $53
DEF NUM_ITEMS EQU const_value - 1

	const_next $C4

; HMs are defined before TMs, so the actual number of TM definitions
; is not yet available. The TM quantity is hard-coded here and must
; match the actual number below.
DEF NUM_TMS EQU 51

DEF __tmhm_value__ = NUM_TMS + 1

MACRO add_tmnum
	DEF \1_TMNUM EQU __tmhm_value__
	DEF __tmhm_value__ += 1
ENDM

MACRO add_hm
; Defines three constants:
; - HM_\1: the item id, starting at $C4
; - \1_TMNUM: the learnable TM/HM flag, starting at 51
; - HM##_MOVE: alias for the move id, equal to the value of \1
	const HM_\1
	DEF HM_VALUE = __tmhm_value__ - NUM_TMS
	DEF HM{02d:HM_VALUE}_MOVE EQU \1
	add_tmnum \1
ENDM

DEF HM01 EQU const_value
	add_hm CUT          ; $C4
	add_hm FLY          ; $C5
	add_hm SURF         ; $C6
	add_hm STRENGTH     ; $C7
	add_hm FLASH        ; $C8
DEF NUM_HMS EQU const_value - HM01

DEF __tmhm_value__ = 1

MACRO add_tm
; Defines three constants:
; - TM_\1: the item id, starting at $C9
; - \1_TMNUM: the learnable TM/HM flag, starting at 1
; - TM##_MOVE: alias for the move id, equal to the value of \1
	const TM_\1
	DEF TM{02d:__tmhm_value__}_MOVE EQU \1
	add_tmnum \1
ENDM

;;;;; PureRGBnote: CHANGED: TMs were reassigned better moves
; Sunsette: a move's TM NUMBER (the "TMxx" shown in-game and in NPC dialogue) is its 1-based position in this
; list: FROST_FIST = TM01, ... ROCK_ON = TM49, SUBSTITUTE = TM50, CLAY_ARMOR = TM51. The "; $XX" after each
; entry is the ITEM id (hex), NOT the TM number - do not confuse the two. To number a TM, count only the real
; "add_tm <MOVE>" lines (a loose grep for "add_tm" also matches the macro definition + comments and overcounts,
; e.g. it makes ROCK_ON look like TM53). There are exactly NUM_TMS == 51, enforced by the ASSERT below.
DEF TM01 EQU const_value
	add_tm FROST_FIST   ; $C9
	add_tm ROOST        ; $CA
	add_tm MUD_BOMB     ; $CB ; was LEECH_SEED
	add_tm PIN_MISSILE  ; $CC
	add_tm BLAZE_HAMMER ; $CD
	add_tm TOXIC        ; $CE
	add_tm HONE_EDGE    ; $CF ; Sunsette: HONE EDGE (was VENOM DRILL/HORN_DRILL TM); wide distribution
	add_tm BODY_SLAM    ; $D0
	add_tm DISABLE      ; $D1
	add_tm DOUBLE_EDGE  ; $D2
	add_tm AQUA_RING    ; $D3 ; Sunsette: AQUA RING (was BUBBLEBEAM TM); Misty's TM. Bubblebeam -> WATER PULSE level-up
	add_tm AURORA_MIST  ; $D4 ; Sunsette: AURORA MIST (was AURORA_BEAM TM); Aurora Beam -> level-up
	add_tm ICE_BEAM     ; $D5
	add_tm BLIZZARD     ; $D6
	add_tm HYPER_BEAM   ; $D7
	add_tm CALM_MIND    ; $D8
	add_tm LOW_KICK     ; $D9 ; Sunsette: was HI_JUMP_KICK; now the weight-based LOW KICK TM (TM_HI_JUMP_KICK -> TM_LOW_KICK), taught to all but a set of exclusions
	add_tm ZAPPERCUT    ; $DA
	add_tm METEOR_SWEEP ; $DB
	add_tm BARRIER      ; $DC
	add_tm ADAPTATION   ; $DD ; Sunsette: ADAPTATION (was RAZOR_LEAF TM); Erika's gift, type-themed distribution. Razor Leaf is level-up only now.
	add_tm SOLARBEAM    ; $DE
	add_tm WYRM_WRATH   ; $DF
	add_tm THUNDERBOLT  ; $E0
	add_tm THUNDER      ; $E1
	add_tm EARTHQUAKE   ; $E2
	add_tm RIPTIDE      ; $E3 ; Sunsette: TM28 now teaches RIPTIDE (WATERFALL); was CRABHAMMER (still a KRABBY/KINGLER level-up move)
	add_tm DIG          ; $E4
	add_tm PSYCHIC_M    ; $E5
	add_tm MEGA_DRAIN   ; $E6
	add_tm MIRAGE       ; $E7
	add_tm SWORDS_DANCE ; $E8
	add_tm REFLECT      ; $E9
	add_tm BULK_UP      ; $EA
	add_tm ILL_WIND     ; $EB
	add_tm SHADOW_BALL  ; $EC
	add_tm SUPERNOVA    ; $ED ; Sunsette: SUPERNOVA (was FLAMETHROWER TM); Blaine's TM. Flamethrower -> level-up
	add_tm FIRE_BLAST   ; $EE
	add_tm TWISTER      ; $EF
	add_tm DEMOLISH  ; $F0
	add_tm VOID_MIND    ; $F1
	add_tm LOVELY_KISS  ; $F2
	add_tm BRAVE_BIRD   ; $F3
	add_tm LIGHT_SCREEN ; $F4
	add_tm THUNDER_WAVE ; $F5
	add_tm SKITTERMIND  ; $F6 ; SKITTERMIND (was PSYBEAM's TM; now teaches PSYWAVE/SKITTERMIND)
	add_tm SHADOW_GAME  ; $F7 ; Sunsette: was SLUDGE; now teaches SHADOW GAME. Sludge Bomb is level-up only now.
	add_tm ROCK_SLIDE   ; $F8
	add_tm ROCK_ON  ; $F9 ; Sunsette: BUNKER DOWN (was GLARE TM); Brock's gift, physical+GHOST brace. GLARE is level-up only now.
	add_tm SUBSTITUTE   ; $FA
	add_tm CLAY_ARMOR   ; $FB ; Sunsette: CLAY ARMOR - the 51st TM (Giovanni's). Uses the last free tmhm bit; nothing sacrificed.
ASSERT NUM_TMS == const_value - TM01, "NUM_TMS ({d:NUM_TMS}) does not match the number of add_tm definitions"

DEF NUM_TM_HM EQU NUM_TMS + NUM_HMS

; 51 TMs + 5 HMs = 56 learnable TM/HM flags per Pokémon.
; These fit in 7 bytes exactly (the last spare bit is now used by CLAY ARMOR's TM).
DEF __tmhm_value__ = NUM_TM_HM + 1
DEF UNUSED_TMNUM EQU __tmhm_value__

DEF MAX_HIDDEN_ITEMS EQU 112
DEF MAX_HIDDEN_COINS EQU 16
