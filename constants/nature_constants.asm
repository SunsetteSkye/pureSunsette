; Sunsette: ADDED: Pokemon "nature" personality archetypes.
; Each species carries TWO natures in SpeciesNatureData: a PRIMARY and a SECONDARY (or
; NATURE_NONE for single-nature mons). Both are always live: a reaction pulls from the
; primary most often, the secondary less often, and a small slice of the time a random
; OTHER nature. ForbiddenNature pins the one nature each archetype will never voice on the
; random pull (a closed 16-nature ring). Values 0-15, used as table indices.
	const_def
	const NATURE_SCRAPPY     ; 0
	const NATURE_ARROGANT    ; 1
	const NATURE_GENTLE      ; 2
	const NATURE_PLAYFUL     ; 3
	const NATURE_CONSIDERATE ; 4
	const NATURE_LAZY        ; 5
	const NATURE_DITZ        ; 6
	const NATURE_MOROSE      ; 7
	const NATURE_CAUTIOUS    ; 8
	const NATURE_GLUTTON     ; 9
	const NATURE_CALCULATING ; 10
	const NATURE_HYPER       ; 11
	const NATURE_STOLID      ; 12
	const NATURE_RAGE        ; 13
	const NATURE_CRUEL       ; 14
	const NATURE_WISE        ; 15
DEF NUM_NATURES EQU const_value

; Sentinel stored as a mon's SECONDARY when it has only one nature (skips the secondary pull).
DEF NATURE_NONE EQU $FF

; Step cooldown applied after a field-move reaction fires (in overworld steps), so the
; sprite-pop stays a surprise instead of firing on every Cut/Surf during exploration.
DEF NATURE_REACTION_COOLDOWN EQU 250

; Weighted pull thresholds (rolled out of 256) for a dual-nature mon: below PRIMARY = the
; primary nature (~55%), below SECONDARY_CUTOFF = the secondary (~30%), else a random other
; nature (~15%). Single-nature mons use SINGLE for the primary (~75%), else random (~25%).
DEF NATURE_PRIMARY_THRESHOLD   EQU 141 ; 141/256 ~= 55%
DEF NATURE_SECONDARY_CUTOFF    EQU 218 ; (141+77)/256 ~= +30% = 85% cumulative
DEF NATURE_SINGLE_THRESHOLD    EQU 192 ; 192/256 ~= 75%

; Roll threshold (out of 256) below which a reaction uses a TYPE-flavored "tell" line (one of the
; mon's types) instead of a nature line. $70 ~= 44%. Falls back to a nature line when the rolled
; type has no pool (e.g. NORMAL).
DEF NATURE_TYPE_ROLL_THRESHOLD EQU $70

; Field-move reaction event ids -> FieldEventPools (each exact move has its own nature set).
	const_def
	const NREVT_CUT          ; 0
	const NREVT_SURF         ; 1
	const NREVT_STRENGTH     ; 2
	const NREVT_FLASH        ; 3
	const NREVT_FLAMETHROWER ; 4
	const NREVT_CONFUSE_RAY  ; 5
	const NREVT_MYSTIC       ; 6 (Metronome / Sing / Hypnosis share one handler)
	const NREVT_HIDING       ; 7 (Sand Attack / powders / etc. share one handler)
	const NREVT_SOFTBOILED   ; 8

; Deferred (warp) reaction event ids -> DeferredEventPools. Packed into wNatureReactionPending
; as (id << 3) | (party index + 1), so keep this list <= 3 bits worth of ids.
	const_def
	const NRDEF_FLY          ; 0
	const NRDEF_DIG          ; 1
	const NRDEF_TELEPORT     ; 2

; Battle-win reaction MODES (FightReactions descriptor: db mode, dw ptrA, dw ptrB).
	const_def
	const NRM_NONE          ; 0 no reaction
	const NRM_STD           ; 1 type/nature TELL beat + health-themed line (ptrA=green, ptrB=hurt)
	const NRM_NATURE        ; 2 nature-only line (ptrA = 8-nature pool)
	const NRM_NATURE_HEALTH ; 3 nature-only, health-split (ptrA=green, ptrB=hurt)
	const NRM_TYPE          ; 4 type-only line (ptrA = sparse type pool w/ wildcard)
	const NRM_TYPE_HEALTH   ; 5 type-only, health-split (ptrA=green, ptrB=hurt)
	const NRM_QUEENS        ; 6 type-only body-language tally (ptrA = count-specific type pool)

; Sentinel "matches any type" entry inside a type pool (placed last, before the -1 terminator).
DEF NR_TYPE_WILDCARD EQU -2

; Legendary reaction ids passed to ShowLegendaryReaction.
	const_def
	const NRLEG_ARTICUNO ; 0
	const NRLEG_ZAPDOS   ; 1
	const NRLEG_MOLTRES  ; 2
	const NRLEG_MEWTWO   ; 3
	const NRLEG_MEW      ; 4

; Overworld plot-reaction ids passed to ShowOverworldNature (lead mon, nature-only). Order must
; match OverworldEventPools in data/pokemon/nature_reactions_data.asm.
	const_def
	const NROW_VIRIDIAN_FOREST ; 0 left the forest
	const NROW_MT_MOON         ; 1 left Mt. Moon
	const NROW_LAVENDER_HEAL   ; 2 healed in the Tower purified zone
	const NROW_GAME_FREAK      ; 3 talked to a Game Freak programmer
	const NROW_TALL_BUILDING   ; 4 near Celadon Dept / Silph Co
	const NROW_CROWDED         ; 5 Celadon hotel / diner
	const NROW_SAFARI          ; 6 a non-central Safari zone map
	const NROW_CARD_KEY        ; 7 picked up the Card Key
	const NROW_ROUTE14         ; 8 entered Route 14

; (Story-event reaction ids removed: the Oak's Parcel / First Badge beats are now cry-only
; hooks in their own scripts, not ShowMonNatureComment nature pools.)

; ===========================================================================================
; Sunsette: status-screen PAGE 3 (battle effects / eagerness / personality reaction).
; ===========================================================================================

; Affection (wPartyMonHappiness, 0-255) buckets used by the eagerness and reaction pages.
DEF SP3_AFFECTION_LOW_MAX  EQU 84  ; <= 84 = LOW (aloof)
DEF SP3_AFFECTION_HIGH_MIN EQU 200 ; >= 200 = HIGH (devoted); between = MID
DEF SP3_AFFECTION_NEUTRAL  EQU 128 ; default used for box/daycare mons (no per-mon affection)

; HP buckets, read off the HPBarLength predef result (0-48 pixels).
DEF SP3_HP_HURT_MIN EQU 17 ; >= 17 px = HURT or better
DEF SP3_HP_GOOD_MIN EQU 33 ; >= 33 px = GOOD

; Health states (also the column order of the eagerness grid). Worst..best, then fainted.
	const_def
	const SP3_HEALTH_BAD     ; 0
	const SP3_HEALTH_HURT    ; 1
	const SP3_HEALTH_GOOD    ; 2
	const SP3_HEALTH_FAINTED ; 3
DEF SP3_NUM_HEALTH EQU const_value

; Affection rows of the eagerness grid (grid index = affection*SP3_NUM_HEALTH + health).
	const_def
	const SP3_AFF_LOW  ; 0
	const SP3_AFF_MID  ; 1
	const SP3_AFF_HIGH ; 2

; Scene ids returned by the out-of-battle map classifier. The first five are "themed"
; (they carry type-flavored reactions); the last five are the generic terrain split.
; Order must match SP3_SceneLineTables in data/pokemon/status_page3_text.asm.
	const_def
	const SP3_SCENE_SEA      ; 0
	const SP3_SCENE_FOREST   ; 1
	const SP3_SCENE_TOWER    ; 2
	const SP3_SCENE_SEAFOAM  ; 3
	const SP3_SCENE_VOLCANO  ; 4
	const SP3_SCENE_CITY     ; 5
	const SP3_SCENE_ROUTE    ; 6
	const SP3_SCENE_CAVE     ; 7
	const SP3_SCENE_HOUSE    ; 8
	const SP3_SCENE_BUILDING ; 9
DEF SP3_NUM_SCENES EQU const_value
DEF SP3_FIRST_GENERIC_SCENE EQU SP3_SCENE_CITY ; scenes >= this have no type reaction

; Sentinels inside a type-reaction table (db type, dw textptr ... terminator).
DEF SP3_TYPE_WILDCARD EQU $FE ; matches any of the mon's types (place last, before terminator)
DEF SP3_TYPE_END      EQU $FF ; end of a type-reaction table
