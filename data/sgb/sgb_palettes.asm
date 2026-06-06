; PureRGBnote: GREENBUILD: added sgb palettes specific to green version
; Default color palettes on SGB, or the palettes displayed when COLOR mode SGB1 is selected on SGB or GBC.

SuperPalettes:
; entries correspond to PAL_* constants
	table_width 2 * 4, SuperPalettes
	RGB 31,31,31, 22,31,22, 12,27,27, 00,00,00 ; PAL_ROUTE
	RGB 31,31,30, 31,25,29, 20,26,31, 00,00,00 ; PAL_PALLET
	RGB 31,31,31, 21,28,14, 09,15,11, 00,00,00 ; PAL_VIRIDIAN	; greener palette, but still works for the pond
	RGB 31,31,31, 23,23,23, 11,15,23, 00,00,00 ; PAL_PEWTER ; Sunsette: Updated the palette again
	RGB 31,31,31, 17,26,30, 14,14,27, 00,00,00 ; PAL_CERULEAN ; reversed bright and dark, suitable for wartortle and less eyeblinding as a map
	RGB 31,31,31, 26,22,31, 12,16,30, 00,00,00 ; PAL_LAVENDER ; Sunsette: More somber colors, works better for pokemon too
	RGB 31,31,31, 30,18,00, 20,26,31, 00,00,00 ; PAL_VERMILION
	RGB 31,31,31, 16,30,22, 20,26,31, 00,00,00 ; PAL_CELADON
	RGB 31,31,31, 31,25,02, 25,13,15, 00,00,00 ; PAL_SAFFRON ; Sunsette: CHANGED More golden Saffron. Don't need water palette.
	RGB 31,31,31, 31,15,22, 20,26,31, 00,00,00 ; PAL_FUCHSIA
	RGB 31,31,31, 26,10,06, 20,26,31, 00,00,00 ; PAL_CINNABAR
	RGB 31,31,31, 22,14,24, 20,26,31, 00,00,00 ; PAL_INDIGO
	RGB 31,31,31, 20,26,31, 10,18,07, 00,00,00 ; PAL_TOWNMAP
IF DEF(_RED)
	RGB 31,31,31, 30,30,17, 17,23,10, 21,00,04 ; PAL_LOGO1
ENDC
IF DEF(_BLUE)
	RGB 31,31,31, 30,30,17, 21,00,04, 14,19,29 ; PAL_LOGO1
ENDC
IF DEF(_GREEN)
	RGB 31,31,31, 30,30,17, 21,00,04, 12,23,00 ; PAL_LOGO1 
ENDC
	RGB 31,31,31, 30,30,17, 18,18,24, 07,07,16 ; PAL_LOGO2
	RGB 31,31,31, 24,20,30, 11,20,30, 00,00,00 ; PAL_0F
	RGB 31,31,31, 30,22,17, 16,14,19, 00,00,00 ; PAL_MEWMON
	RGB 31,31,31, 12,17,26, 04,06,13, 00,00,00 ; PAL_BLUEMON	; Sunsette: richened colors 2 and 3 and moved more purple
	RGB 31,31,31, 31,20,10, 25,07,05, 00,00,00 ; PAL_REDMON
	RGB 31,31,31, 22,26,30, 11,15,23, 00,00,00 ; PAL_CYANMON	; Sunsette: made more pastel, use Cerulean for most formerly Cyanmons
	RGB 31,31,31, 26,20,28, 19,03,15, 00,00,00 ; PAL_PURPLEMON ; Sunsette: Changed colors 2 and 3 to be more vibrant
	RGB 31,31,31, 23,15,11, 13,06,03, 00,00,00 ; PAL_BROWNMON ; Sunsette: Darkened and Saturated
	RGB 31,31,31, 20,26,16, 03,13,05, 00,00,00 ; PAL_GREENMON ; Darkened color 3
	RGB 31,31,31, 30,22,24, 28,15,21, 00,00,00 ; PAL_PINKMON
	RGB 31,31,31, 31,26,10, 17,08,04, 00,00,00 ; PAL_YELLOWMON ; darkened color 2, color 3 is brown. use yellowbar for pokemon that are lighter only
	RGB 31,31,31, 27,27,28, 19,11,22, 00,00,00 ; PAL_GRAYMON	; Aerodactyl / Shellder Color Set, made more purple
IF DEF(_GREEN)
	RGB 31,31,31, 26,21,22, 25,07,05, 00,00,00 ; PAL_SLOTS1	; used Green Slots1 as a basis and made them version-identical. voltorb palette.
ELSE
	RGB 31,31,31, 26,21,22, 25,07,05, 00,00,00 ; PAL_SLOTS1	; used Green Slots1 as a basis and made them version-identical. voltorb palette.
ENDC
IF DEF(_RED)
	RGB 31,31,31, 31,31,17, 25,17,21, 00,00,00 ; PAL_SLOTS2
	RGB 31,31,31, 19,26,16, 11,15,25, 00,00,00 ; PAL_SLOTS3 ; used Blue Slots3 as a base and made version-identical. Omastar.
	RGB 31,31,31, 17,26,30, 25,07,05, 00,00,00 ; PAL_SLOTS4 ; used Red Slots4 as a base and made version-identical. Tentacool.
ENDC
IF DEF(_BLUE)
	RGB 31,31,31, 31,31,17, 16,19,29, 00,00,00 ; PAL_SLOTS2
	RGB 31,31,31, 19,26,16, 11,15,25, 00,00,00 ; PAL_SLOTS3 ; used Blue Slots3 as a base and made version-identical. Omastar.
	RGB 31,31,31, 17,26,30, 25,07,05, 00,00,00 ; PAL_SLOTS4 ; used Red Slots4 as a base and made version-identical. Tentacool.
ENDC
IF DEF(_GREEN)
	RGB 31,31,31, 29,26,04, 18,23,12, 00,00,00 ; PAL_SLOTS2
	RGB 31,31,31, 19,26,16, 11,15,25, 00,00,00 ; PAL_SLOTS3 ; used Blue Slots3 as a base and made version-identical. Omastar.
	RGB 31,31,31, 17,26,30, 25,07,05, 00,00,00 ; PAL_SLOTS4 ; used Red Slots4 as a base and made version-identical. Tentacool.
ENDC
	RGB 31,31,31, 11,10,11, 04,05,05, 00,00,00 ; PAL_BLACK	; Sunsette: Changed to be a little brighter on colors 2 and 3
	RGB 31,31,31, 30,26,15, 09,20,11, 00,00,00 ; PAL_GREENBAR
	RGB 31,31,31, 30,26,15, 26,20,00, 00,00,00 ; PAL_YELLOWBAR
	RGB 31,31,31, 30,26,15, 25,07,05, 00,00,00 ; PAL_REDBAR
	RGB 31,31,31, 30,22,17, 11,15,23, 00,00,00 ; PAL_BADGE
	RGB 31,31,31, 15,09,06, 07,07,06, 00,00,00 ; PAL_CAVE	; removed the green, swapped colors 2 and 3 to allow for pokemon use
	RGB 31,31,31, 30,26,15, 28,20,14, 00,00,00 ; PAL_GAMEFREAK
;;;;;;;;;; PureRGBnote: ADDED: new palettes used for various reasons
	RGB 31,31,31, 15,15,15, 05,06,06, 00,00,00 ; PAL_BLACKMON ; black alt palette pokemon
	RGB 31,31,31, 27,27,28, 16,14,19, 00,00,00 ; PAL_WHITEMON ; white alt palette pokemon ; Sunsette: Changed to be a little brighter on color 2
	RGB 31,31,31, 27,11,07, 16,06,20, 00,00,00 ; PAL_REDPURPLEMON ; blue/green alt palette pokemon ; Sunsette: Changed to a dusky set of colors: red/purple
	RGB 31,31,31, 31,31,31, 02,03,03, 00,00,00 ; PAL_BLACK2 ; default move animation palette
	RGB 31,31,31, 31,28,14, 03,03,03, 00,00,00 ; PAL_ULTRABALL ; ultra ball palette when throwing one in battle
	RGB 31,31,31, 18,22,20, 16,12,10, 00,00,00 ; PAL_SAFARIBALL ; safari ball palette when throwing one in battle
	RGB 31,31,31, 14,17,31, 10,11,11, 00,00,00 ; PAL_SECRETLAB
	RGB 31,31,31, 29,04,00, 10,11,11, 00,00,00 ; PAL_VOLCANO
	RGB 31,31,31, 25,11,07, 15,05,04, 00,00,00 ; PAL_REALLY_REDMON ; improved contrast on color 3, desaturated and lightened color 2
	RGB 31,31,31, 21,24,27, 20,19,26, 00,00,00 ; PAL_PRISMATIC
;;;;;;;;;; Sunsette: ADDED: new environment palettes
	RGB 31,31,31, 27,31,22, 14,28,12, 00,00,00 ; PAL_FOREST   ; deffb7 / 71e066
	RGB 31,31,31, 22,26,16, 27,23,18, 00,00,00 ; PAL_HIGHLAND ; b2d782 / dbb994
	RGB 31,31,31, 30,30,30, 20,26,31, 00,00,00 ; PAL_AQUA     ; white, white, standard water blue, black
	RGB 31,31,31, 26,21,22, 15,15,18, 00,00,00 ; PAL_DUSK     ; d6adb5 / 7b7b94
	RGB 31,26,30, 24,22,28, 11,08,11, 00,00,00 ; PAL_MYSTIC   ; ffd4f7 / c1b1e7 / 5f435b
;;;;;;;;;;
;;;;;;;;;; Sunsette: ADDED: per-sprite / per-trainer palettes (white, light, dark, black)
	RGB 31,31,31, 24,19,08, 02,10,01, 00,00,00 ; PAL_BROCK    ; c69c42 / 14510a
	RGB 31,31,31, 28,25,20, 20,00,24, 00,00,00 ; PAL_KOGA     ; e4cda8 / a400c2
	RGB 31,31,31, 31,27,22, 14,03,12, 00,00,00 ; PAL_RIVAL    ; ffdeb4 / 741962
	RGB 31,31,31, 25,18,16, 07,05,02, 00,00,00 ; PAL_PLAYER   ; ca9487 / 3d2714
	RGB 31,29,25, 21,17,13, 00,00,00, 00,00,00 ; PAL_PLAYEROW ; idx0 face=fff0cd, idx1 hair=ab8869, idx2=transparent, idx3 outline=black
	RGB 31,31,31, 31,27,22, 28,15,21, 00,00,00 ; PAL_JOY      ; rival light + pinkmon dark
	RGB 31,31,31, 31,27,00, 00,01,31, 07,07,16 ; PAL_TITLELOGO ; bright yellow ffde00 / bright blue 000cff
	RGB 31,28,23, 16,14,19, 00,00,00, 00,00,00 ; PAL_HUMANSPRITE ; face=light peach (divorced from Mewmon), hair=Mewmon dark
	RGB 24,19,08, 02,10,01, 00,00,00, 00,00,00 ; PAL_BROCK_OW    ; c69c42 face / 14510a hair
	RGB 30,26,15, 25,07,05, 00,00,00, 00,00,00 ; PAL_REDBAR_OW   ; redbar light face / dark hair
	RGB 30,26,15, 09,20,11, 00,00,00, 00,00,00 ; PAL_GREENBAR_OW ; greenbar light face / dark hair
	RGB 28,25,20, 20,00,24, 00,00,00, 00,00,00 ; PAL_KOGA_OW     ; e4cda8 face / a400c2 hair
	RGB 31,25,02, 25,13,15, 00,00,00, 00,00,00 ; PAL_SAFFRON_OW  ; saffron light face / dark hair
	RGB 27,27,28, 19,11,22, 00,00,00, 00,00,00 ; PAL_GRAYMON_OW  ; graymon light face / dark hair
	RGB 31,30,27, 14,03,12, 00,00,00, 00,00,00 ; PAL_RIVAL_OW    ; lighter face / 741962 hair
	RGB 31,27,22, 28,15,21, 00,00,00, 00,00,00 ; PAL_JOY_OW      ; joy light face / dark hair
	RGB 17,26,30, 14,14,27, 00,00,00, 00,00,00 ; PAL_ARTICUNO_OW ; cerulean light/dark
	RGB 30,26,15, 28,20,14, 00,00,00, 00,00,00 ; PAL_ZAPDOS_OW   ; gamefreak light/dark
	RGB 31,20,10, 25,07,05, 00,00,00, 00,00,00 ; PAL_MOLTRES_OW  ; redmon light/dark
	RGB 27,27,28, 19,11,22, 00,00,00, 00,00,00 ; PAL_MEWTWO_OW   ; graymon light/dark
	RGB 30,22,24, 28,15,21, 00,00,00, 00,00,00 ; PAL_MEW_OW      ; pinkmon light/dark
	RGB 31,31,31, 31,28,24, 27,05,05, 00,00,00 ; PAL_POKEBALL    ; HUD party balls: white / warm-white / red / black
	RGB 12,17,26, 04,06,13, 00,00,00, 00,00,00 ; PAL_BLUEMON_OW  ; scuba diver: bluemon light/dark
;;;;;;;;;;
	assert_table_length NUM_SGB_PALS
