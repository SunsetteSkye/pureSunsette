; pal/blk packets
; SetPalFunctions indexes (see engine/gfx/palettes.asm)
	const_def
	const SET_PAL_BATTLE_BLACK         ; $00
	const SET_PAL_BATTLE               ; $01
	const SET_PAL_TOWN_MAP             ; $02
	const SET_PAL_STATUS_SCREEN        ; $03
	const SET_PAL_POKEDEX              ; $04
	const SET_PAL_SLOTS                ; $05
	const SET_PAL_TITLE_SCREEN         ; $06
	const SET_PAL_NIDORINO_INTRO       ; $07
	const SET_PAL_GENERIC              ; $08
	const SET_PAL_OVERWORLD            ; $09
	const SET_PAL_PARTY_MENU           ; $0A
	const SET_PAL_POKEMON_WHOLE_SCREEN ; $0B
	const SET_PAL_POKEMON_WHOLE_SCREEN_TRADE ; $0C
	const SET_PAL_GAME_FREAK_INTRO     ; $0D
	const SET_PAL_TRAINER_CARD         ; $0E
	const SET_PAL_BEFORE_AFTER         ; $10
	const SET_PAL_MIDDLE_SCREEN_MON_BOX; $11
	const SET_PAL_MOVEDEX              ; $12
	const SET_PAL_CELADON              ; $13

DEF SET_PAL_PARTY_MENU_HP_BARS EQU $fc
DEF SET_PAL_DEFAULT EQU $ff

; sgb palettes
; SuperPalettes indexes (see data/sgb/sgb_palettes.asm)
	const_def
	const PAL_ROUTE     ; $00
	const PAL_PALLET    ; $01
	const PAL_VIRIDIAN  ; $02
	const PAL_PEWTER    ; $03
	const PAL_CERULEAN  ; $04
	const PAL_LAVENDER  ; $05
	const PAL_VERMILION ; $06
	const PAL_CELADON   ; $07
	const PAL_SAFFRON   ; $08
	const PAL_FUCHSIA   ; $09
	const PAL_CINNABAR  ; $0A
	const PAL_INDIGO    ; $0B
	const PAL_TOWNMAP   ; $0C
	const PAL_LOGO1     ; $0D
	const PAL_LOGO2     ; $0E
	const PAL_0F        ; $0F
	const PAL_MEWMON    ; $10
	const PAL_BLUEMON   ; $11
	const PAL_REDMON    ; $12
	const PAL_CYANMON   ; $13
	const PAL_PURPLEMON ; $14
	const PAL_BROWNMON  ; $15
	const PAL_GREENMON  ; $16
	const PAL_PINKMON   ; $17
	const PAL_YELLOWMON ; $18
	const PAL_GRAYMON   ; $19
	const PAL_SLOTS1    ; $1A
	const PAL_SLOTS2    ; $1B
	const PAL_SLOTS3    ; $1C
	const PAL_SLOTS4    ; $1D
	const PAL_BLACK     ; $1E
	const PAL_GREENBAR  ; $1F
	const PAL_YELLOWBAR ; $20
	const PAL_REDBAR    ; $21
	const PAL_BADGE     ; $22
	const PAL_CAVE      ; $23
	const PAL_GAMEFREAK ; $24
	const PAL_BLACKMON  ; $25
	const PAL_WHITEMON  ; $26
	const PAL_REDPURPLEMON  ; $27
	const PAL_BLACK2        ; $28	;gbc only
	const PAL_ULTRABALL     ; $29	;gbc only
	const PAL_SAFARIBALL    ; $2A   ;gbc only
	const PAL_SECRETLAB     ; $2B
	const PAL_VOLCANO       ; $2C
	const PAL_REALLY_REDMON ; $2D
	const PAL_PRISMATIC     ; $2F
;;;;;;;;;; Sunsette: ADDED: new environment palettes
	const PAL_FOREST
	const PAL_HIGHLAND
	const PAL_AQUA
	const PAL_DUSK
	const PAL_MYSTIC
;;;;;;;;;;
;;;;;;;;;; Sunsette: ADDED: per-sprite / per-trainer palettes
	const PAL_BROCK     ; Brock (front sprite + overworld)
	const PAL_KOGA      ; Koga (front sprite + overworld)
	const PAL_RIVAL     ; Rival (front sprite + overworld)
	const PAL_PLAYER    ; player back sprite + menu/trainer-card front
	const PAL_PLAYEROW  ; player overworld walking sprite
	const PAL_JOY       ; Nurse Joy (rival light color + pinkmon dark color)
	const PAL_TITLELOGO ; brighter title-logo palette (yellow + blue)
	const PAL_HUMANSPRITE ; generic NPC overworld palette (overworld-ordered, Mewmon-based)
	const PAL_BROCK_OW    ; Brock overworld    (light->face, dark->hair)
	const PAL_REDBAR_OW   ; Misty/Erika/Sabrina/Lorelei overworld
	const PAL_GREENBAR_OW ; Lt.Surge overworld
	const PAL_KOGA_OW     ; Koga overworld
	const PAL_SAFFRON_OW  ; Blaine overworld
	const PAL_GRAYMON_OW  ; Agatha overworld
	const PAL_RIVAL_OW    ; Rival overworld
	const PAL_JOY_OW      ; Nurse Joy overworld
	const PAL_ARTICUNO_OW ; Articuno overworld (Seafoam Islands B4F)
	const PAL_ZAPDOS_OW   ; Zapdos overworld (Power Plant)
	const PAL_MOLTRES_OW  ; Moltres overworld (Cinnabar Volcano)
	const PAL_MEWTWO_OW   ; Mewtwo overworld (Cerulean Cave B1F)
	const PAL_MEW_OW      ; Mew overworld (Vermilion Dock)
	const PAL_POKEBALL    ; team-size HUD balls (red/white)
	const PAL_BLUEMON_OW  ; scuba diver overworld (bluemon light/dark)
;;;;;;;;;; Sunsette: thrown-pokeball palettes (white / 31,31,30 light / kept dark / black)
	const PAL_BLUEBALL
	const PAL_GREENBALL
	const PAL_PURPLEBALL
	const PAL_YELLOWBALL
	const PAL_PALEBALL
	const PAL_CYANBALL
	const PAL_INDIGOBALL
	const PAL_PINKBALL
	const PAL_GRAYBALL
	const PAL_WHITEBALL
	const PAL_ULTRABALL_2
;;;;;;;;;;
	const PAL_MTMOONB2F ; Sunsette: Mt. Moon B2F-only cave palette (clears to PAL_CAVE on B1F/1F)
	const PAL_SHADOW ; Sunsette: evolution morph silhouette palette (replaces PAL_BLACK for the morph)
	const PAL_VERMILIONGOLD ; Sunsette: Vermilion palette with the orange swapped for Saffron's gold (Routes 12-15)
DEF NUM_SGB_PALS EQU const_value
