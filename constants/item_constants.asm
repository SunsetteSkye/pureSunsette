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

	; Sunsette 2026-06-22: HM/TM block slid down from $C4 to $54 (right after the last
	; regular item, MAX_ELIXER = $53) to reclaim the dead $54-$C3 item-id gap. The block
	; can now run up to $FE (one below the $FF item-list terminator) = a ~166-TM ceiling.
	; Ids float symbolically (HM01/TM01); only the ; $XX annotations below are hand-kept.
	const_next $54

; HMs are defined before TMs, so the actual number of TM definitions
; is not yet available. The TM quantity is hard-coded here and must
; match the actual number below.
DEF NUM_TMS EQU 65

DEF __tmhm_value__ = NUM_TMS + 1

MACRO add_tmnum
	DEF \1_TMNUM EQU __tmhm_value__
	DEF __tmhm_value__ += 1
ENDM

MACRO add_hm
; Defines three constants:
; - HM_\1: the item id, starting at $54
; - \1_TMNUM: the learnable TM/HM flag, starting at 51
; - HM##_MOVE: alias for the move id, equal to the value of \1
	const HM_\1
	DEF HM_VALUE = __tmhm_value__ - NUM_TMS
	DEF HM{02d:HM_VALUE}_MOVE EQU \1
	add_tmnum \1
ENDM

DEF HM01 EQU const_value
	add_hm CUT          ; $54
	add_hm FLY          ; $55
	add_hm SURF         ; $56
	add_hm STRENGTH     ; $57
	add_hm FLASH        ; $58
DEF NUM_HMS EQU const_value - HM01

DEF __tmhm_value__ = 1

MACRO add_tm
; Defines three constants:
; - TM_\1: the item id, starting at $59
; - \1_TMNUM: the learnable TM/HM flag, starting at 1
; - TM##_MOVE: alias for the move id, equal to the value of \1
	const TM_\1
	DEF TM{02d:__tmhm_value__}_MOVE EQU \1
	add_tmnum \1
ENDM

;;;;; PureRGBnote: CHANGED: TMs were reassigned better moves
; Sunsette 2026-06-23: TM list REORDERED to a Gen-1-anchored layout. A move's TM NUMBER (the "TMxx" shown
; in-game / NPC dialogue) is its 1-based position in this list: HONE_EDGE = TM01 ... ROCK_ON = TM65. Gen-1 TM
; moves keep their classic number (Toxic 06, Body Slam 08, Ice Beam 13, etc.); the elemental punches cluster
; at TM16-18. The "; $XX" after each entry is the ITEM id (hex), NOT the TM number. NUM_TMS == 65 (ASSERT
; below). Compatibility is name-based (base_stats tmhm lists), so reordering does NOT change who learns what.
DEF TM01 EQU const_value
	add_tm HONE_EDGE    ; $59 ; TM01 setup (ATK+ACC)
	add_tm DISABLE      ; $5A ; TM02
	add_tm SWORDS_DANCE ; $5B ; TM03 (Gen1 TM03)
	add_tm AURORA_MIST  ; $5C ; TM04
	add_tm SHADOW_GAME  ; $5D ; TM05
	add_tm TOXIC        ; $5E ; TM06 (Gen1 TM06)
	add_tm SLUDGE_BOMB  ; $5F ; TM07
	add_tm BODY_SLAM    ; $60 ; TM08 (Gen1 TM08)
	add_tm QUICK_ATTACK ; $61 ; TM09
	add_tm DOUBLE_EDGE  ; $62 ; TM10 (Gen1 TM10)
	add_tm WATER_PULSE  ; $63 ; TM11 (Gen1 TM11 = Bubblebeam)
	add_tm SUPER_SOAK   ; $64 ; TM12 (Gen1 TM12 = Water Gun)
	add_tm ICE_BEAM     ; $65 ; TM13 (Gen1 TM13)
	add_tm BLIZZARD     ; $66 ; TM14 (Gen1 TM14)
	add_tm HYPER_BEAM   ; $67 ; TM15 (Gen1 TM15)
	add_tm ZAPPERCUT    ; $68 ; TM16 elemental punch
	add_tm FROST_FIST   ; $69 ; TM17 elemental punch
	add_tm BLAZE_HAMMER ; $6A ; TM18 elemental punch
	add_tm SEISMIC_TOSS ; $6B ; TM19 (Gen1 TM19)
	add_tm GIGA_DRAIN   ; $6C ; TM20
	add_tm MEGA_DRAIN   ; $6D ; TM21 (Gen1 TM21)
	add_tm SOLARBEAM    ; $6E ; TM22 (Gen1 TM22)
	add_tm WYRM_WRATH   ; $6F ; TM23 (Gen1 TM23 = Dragon Rage)
	add_tm THUNDERBOLT  ; $70 ; TM24 (Gen1 TM24)
	add_tm THUNDER      ; $71 ; TM25 (Gen1 TM25)
	add_tm EARTHQUAKE   ; $72 ; TM26 (Gen1 TM26)
	add_tm MUD_BOMB     ; $73 ; TM27
	add_tm DIG          ; $74 ; TM28 (Gen1 TM28)
	add_tm PSYCHIC_M    ; $75 ; TM29 (Gen1 TM29)
	add_tm FINISHER     ; $76 ; TM30
	add_tm DEMOLISH     ; $77 ; TM31
	add_tm BULK_UP      ; $78 ; TM32
	add_tm REFLECT      ; $79 ; TM33 (Gen1 TM33)
	add_tm LIGHT_SCREEN ; $7A ; TM34
	add_tm HEAT_RUSH    ; $7B ; TM35 fire cluster
	add_tm SUPERNOVA    ; $7C ; TM36 fire cluster
	add_tm FLAMETHROWER ; $7D ; TM37 fire cluster (next to Fire Blast)
	add_tm FIRE_BLAST   ; $7E ; TM38 (Gen1 TM38)
	add_tm ILL_WIND     ; $7F ; TM39 ghost cluster
	add_tm SHADOW_BALL  ; $80 ; TM40 ghost cluster
	add_tm SHADOW_BOX   ; $81 ; TM41 ghost cluster
	add_tm BARRIER      ; $82 ; TM42 ghost cluster
	add_tm BRAVE_BIRD   ; $83 ; TM43 (Gen1 TM43 = Sky Attack)
	add_tm ENERGY_FLUX  ; $84 ; TM44
	add_tm THUNDER_WAVE ; $85 ; TM45 (Gen1 TM45)
	add_tm SKITTERMIND  ; $86 ; TM46 (Gen1 TM46 = Psywave)
	add_tm METEOR_SWEEP ; $87 ; TM47 rock cluster
	add_tm ROCK_SLIDE   ; $88 ; TM48 (Gen1 TM48)
	add_tm OROCLASM     ; $89 ; TM49 rock cluster
	add_tm SUBSTITUTE   ; $8A ; TM50 (Gen1 TM50)
	add_tm RIPTIDE      ; $8B ; TM51
	add_tm AQUA_RING    ; $8C ; TM52
	add_tm RAZOR_LEAF   ; $8D ; TM53
	add_tm ADAPTATION   ; $8E ; TM54
	add_tm CALM_MIND    ; $8F ; TM55
	add_tm VOID_MIND    ; $90 ; TM56
	add_tm PSYCHO_SHIFT ; $91 ; TM57
	add_tm LOVELY_KISS  ; $92 ; TM58
	add_tm ROOST        ; $93 ; TM59
	add_tm LEAP_ATTACK  ; $94 ; TM60
	add_tm PIN_MISSILE  ; $95 ; TM61
	add_tm LEECH_LIFE   ; $96 ; TM62
	add_tm TEMPEST      ; $97 ; TM63
	add_tm CLAY_ARMOR   ; $98 ; TM64
	add_tm ROCK_ON      ; $99 ; TM65
ASSERT NUM_TMS == const_value - TM01, "NUM_TMS ({d:NUM_TMS}) does not match the number of add_tm definitions"

DEF NUM_TM_HM EQU NUM_TMS + NUM_HMS

; The per-species TM/HM bitfield auto-sizes to (NUM_TM_HM + 7) / 8 bytes (see the tmhm
; macro and BASE_TMHM), so adding more TMs grows it with no manual rework.
; NUM_TMS (63) + NUM_HMS (5) = 68 flags = 9 bytes per species.
DEF __tmhm_value__ = NUM_TM_HM + 1
DEF UNUSED_TMNUM EQU __tmhm_value__

DEF MAX_HIDDEN_ITEMS EQU 112
DEF MAX_HIDDEN_COINS EQU 16
