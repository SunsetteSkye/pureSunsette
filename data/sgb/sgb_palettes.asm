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
	RGB 31,31,31, 31,28,20, 25,13,15, 00,00,00 ; PAL_SAFFRON ; Sunsette: light yellow -> ffe8a7 (paler gold); dark 25,13,15. Don't need water palette.
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
	RGB 31,31,31, 30,27,17, 17,08,04, 00,00,00 ; PAL_YELLOWMON ; yellow = f8e088; color 3 is brown. use yellowbar for pokemon that are lighter only
	RGB 31,31,31, 27,27,28, 19,11,22, 00,00,00 ; PAL_GRAYMON	; Aerodactyl / Shellder Color Set, made more purple
IF DEF(_GREEN)
	RGB 31,31,31, 26,21,22, 21,00,04, 00,00,00 ; PAL_SLOTS1 ; Sunsette: restored PureRGB Green Slots1 (kept white/black)
ELSE
	RGB 31,31,31, 26,21,22, 27,20,06, 00,00,00 ; PAL_SLOTS1 ; Sunsette: restored PureRGB Red/Blue Slots1 (kept white/black)
ENDC
IF DEF(_RED)
	RGB 31,31,31, 31,31,17, 25,17,21, 00,00,00 ; PAL_SLOTS2
	RGB 31,31,31, 22,31,16, 25,17,21, 00,00,00 ; PAL_SLOTS3 ; Sunsette: restored PureRGB Red Slots3 (kept white/black)
	RGB 31,31,31, 16,19,29, 25,17,21, 00,00,00 ; PAL_SLOTS4 ; Sunsette: restored PureRGB Red Slots4 (kept white/black)
ENDC
IF DEF(_BLUE)
	RGB 31,31,31, 31,31,17, 16,19,29, 00,00,00 ; PAL_SLOTS2
	RGB 31,31,31, 22,31,16, 16,19,29, 00,00,00 ; PAL_SLOTS3 ; Sunsette: restored PureRGB Blue Slots3 (kept white/black)
	RGB 31,31,31, 25,17,21, 16,19,29, 00,00,00 ; PAL_SLOTS4 ; Sunsette: restored PureRGB Blue Slots4 (kept white/black)
ENDC
IF DEF(_GREEN)
	RGB 31,31,31, 29,26,04, 18,23,12, 00,00,00 ; PAL_SLOTS2
	RGB 31,31,31, 26,14,20, 18,23,12, 00,00,00 ; PAL_SLOTS3 ; Sunsette: restored PureRGB Green Slots3 (kept white/black)
	RGB 31,31,31, 16,19,29, 18,23,12, 00,00,00 ; PAL_SLOTS4 ; Sunsette: restored PureRGB Green Slots4 (kept white/black)
ENDC
	RGB 31,31,31, 13,13,13, 07,07,07, 00,00,00 ; PAL_BLACK	; Sunsette: light/dark -> 686868 / 383838 (neutral grays)
	RGB 31,31,31, 30,26,15, 09,20,11, 00,00,00 ; PAL_GREENBAR
	RGB 31,31,31, 30,26,15, 26,20,00, 00,00,00 ; PAL_YELLOWBAR
	RGB 31,31,31, 30,26,15, 25,07,05, 00,00,00 ; PAL_REDBAR
	RGB 31,31,31, 30,22,17, 11,15,23, 00,00,00 ; PAL_BADGE
	RGB 31,31,31, 18,12,09, 10,08,06, 00,00,00 ; PAL_CAVE	; Sunsette: light/dark -> 906048 / 504030 (kept white/black)
	RGB 31,31,31, 30,26,15, 28,20,14, 00,00,00 ; PAL_GAMEFREAK
;;;;;;;;;; PureRGBnote: ADDED: new palettes used for various reasons
	RGB 31,31,31, 15,15,15, 05,06,06, 00,00,00 ; PAL_BLACKMON ; black alt palette pokemon
	RGB 31,31,31, 27,27,26, 16,14,19, 00,00,00 ; PAL_WHITEMON ; white alt palette pokemon ; Sunsette: light -> e0dfd8
	RGB 31,31,31, 27,11,07, 16,06,20, 00,00,00 ; PAL_REDPURPLEMON ; blue/green alt palette pokemon ; Sunsette: Changed to a dusky set of colors: red/purple
	RGB 31,31,31, 31,31,31, 02,03,03, 00,00,00 ; PAL_BLACK2 ; default move animation palette
	RGB 31,31,31, 31,28,14, 03,03,03, 00,00,00 ; PAL_ULTRABALL ; ultra ball palette when throwing one in battle
	RGB 31,31,31, 18,22,20, 16,12,10, 00,00,00 ; PAL_SAFARIBALL ; safari ball palette when throwing one in battle
	RGB 31,31,31, 14,17,31, 10,11,11, 00,00,00 ; PAL_SECRETLAB
	RGB 31,31,31, 29,04,00, 10,11,11, 00,00,00 ; PAL_VOLCANO
	RGB 31,31,31, 25,11,07, 15,05,04, 00,00,00 ; PAL_REALLY_REDMON ; improved contrast on color 3, desaturated and lightened color 2
	RGB 31,31,31, 21,24,27, 20,19,26, 00,00,00 ; PAL_PRISMATIC
;;;;;;;;;; Sunsette: ADDED: new environment palettes
	RGB 26,29,24, 04,21,00, 14,28,12, 00,00,00 ; PAL_FOREST   ; d7eac4 / 21ae00 / 71e066
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
	RGB 31,28,23, 24,13,13, 00,00,00, 00,00,00 ; PAL_HUMANSPRITE ; face=light peach (divorced from Mewmon), hair=Mewmon dark
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
	RGB 31,31,31, 31,31,30, 27,05,05, 00,00,00 ; PAL_POKEBALL    ; HUD party balls: white / warm-white / red / black
	RGB 12,17,26, 04,06,13, 00,00,00, 00,00,00 ; PAL_BLUEMON_OW  ; scuba diver: bluemon light/dark
;;;;;;;;;; Sunsette: thrown-pokeball palettes (white / 31,31,30 light / kept dark / black)
	RGB 31,31,31, 31,31,30, 04,06,13, 00,00,00 ; PAL_BLUEBALL    ; bluemon dark (Great Ball, BLUE)
	RGB 31,31,31, 31,31,30, 03,13,05, 00,00,00 ; PAL_GREENBALL   ; greenmon dark (GREEN)
	RGB 31,31,31, 31,31,30, 19,03,15, 00,00,00 ; PAL_PURPLEBALL  ; purplemon dark (Master Ball, PURPLE)
	RGB 31,31,31, 31,31,30, 17,08,04, 00,00,00 ; PAL_YELLOWBALL  ; yellowmon dark (Hyper Ball, YELLOW)
	RGB 31,31,31, 31,31,30, 16,14,19, 00,00,00 ; PAL_PALEBALL    ; mewmon dark (PALE)
	RGB 31,31,31, 31,31,30, 11,15,23, 00,00,00 ; PAL_CYANBALL    ; cyanmon dark (CYAN)
	RGB 31,31,31, 31,31,30, 11,20,30, 00,00,00 ; PAL_INDIGOBALL  ; pal_0f dark (INDIGO)
	RGB 31,31,31, 31,31,30, 28,15,21, 00,00,00 ; PAL_PINKBALL    ; pinkmon dark (PINK)
	RGB 31,31,31, 31,31,30, 19,11,22, 00,00,00 ; PAL_GRAYBALL    ; graymon dark (GRAY)
	RGB 31,31,31, 31,31,30, 16,14,19, 00,00,00 ; PAL_WHITEBALL   ; whitemon dark (WHITE)
	RGB 31,31,31, 31,31,30, 03,03,03, 00,00,00 ; PAL_ULTRABALL_2 ; black ball: ultraball near-black (BLACK)
;;;;;;;;;;
	RGB 25,31,31, 07,07,06, 15,09,06, 00,00,00 ; PAL_MTMOONB2F ; Sunsette: Mt. Moon B2F (ccfaff / 3a3a31 / 7b4a31 / black)
	RGB 31,29,31, 07,07,07, 02,03,03, 03,02,02 ; PAL_SHADOW ; Sunsette: evolution morph silhouette
	RGB 31,31,31, 31,25,02, 20,26,31, 00,00,00 ; PAL_VERMILIONGOLD ; Sunsette: Vermilion w/ Saffron's gold (31,25,02) in place of the orange
	RGB 31,31,31, 21,21,21, 11,11,11, 00,00,00 ; PAL_MINDWIPE ; Sunsette: true grayscale (r=g=b, no purple tint) for the SKITTERMIND'd target
	RGB 31,31,31, 30,22,17, 18,07,11, 00,00,00 ; PAL_ROCKETSISTER ; Sunsette: white / f7b58c / 953a58 / black (ROCKET SISTER front sprite)
	RGB 31,31,31, 00,00,00, 00,00,00, 00,00,00 ; PAL_EVOTEXTBOX ; Sunsette: white bg + pure black for all line/text shades (evolution textbox)
	RGB 31,31,31, 27,22,17, 15,08,04, 00,00,00 ; PAL_BROWNMON2 ; Sunsette: default Pidgey line - white / dbb88a / 7f3f23 / black
	RGB 31,31,31, 30,26,15, 21,08,08, 00,00,00 ; PAL_BROWNGOLDMON ; Sunsette: alt Pidgey / default Raichu - white / f7d77f / b04545 / black
	RGB 31,31,31, 19,21,24, 20,08,08, 00,00,00 ; PAL_STEELMON ; Sunsette: default Spearow/Fearow - white / 98a8c0 / a04040 / black
	RGB 31,31,31, 25,18,12, 13,09,14, 00,00,00 ; PAL_TANMON ; Sunsette: alt Spearow/Fearow - white / c89060 / 6b4d75 / black
	RGB 31,31,31, 16,15,18, 10,06,09, 00,00,00 ; PAL_MAUVEMON ; Sunsette: alt Rattata/Raticate - white / 857a91 / 51304d / black
	RGB 31,31,31, 31,26,11, 26,14,09, 00,00,00 ; PAL_GOLDMON ; Sunsette: default Raichu - white / f8d058 / d07048 / black
	RGB 31,31,31, 31,29,00, 13,23,31, 00,00,00 ; PAL_THUNDERMON ; Sunsette: alt Pikachu/Raichu - white / f8e800 / 68b8f8 / black
	RGB 31,31,31, 29,18,13, 21,17,24, 00,00,00 ; PAL_SOFTVIOSCAR ; Sunsette: default Butterfree / alt Venomoth - white / e89068 / a888c0 / black
	RGB 31,31,31, 24,16,25, 20,07,08, 00,00,00 ; PAL_ORCHIDMON ; Sunsette: default Ekans/Arbok - white / c282cf / a13d41 / black
	RGB 31,31,31, 18,21,14, 05,11,10, 00,00,00 ; PAL_OLIVEMON ; Sunsette: alt Ekans/Arbok - white / 90ab70 / 275854 / black
	RGB 31,31,31, 27,14,07, 21,08,03, 00,00,00 ; PAL_EMBERMON ; Sunsette: default Vulpix/Charmeleon - white / e07039 / a94315 / black
	RGB 31,31,31, 30,23,13, 25,08,06, 00,00,00 ; PAL_FLAREMON ; Sunsette: default Charmander/Charizard + alt Charmeleon - white / f7bc68 / cf3f2f / black
	RGB 31,31,31, 18,18,21, 09,08,15, 00,00,00 ; PAL_GRAYVELVET ; Sunsette: alt Vulpix/Wigglytuff - white / 9898ae / 464078 / black
	RGB 31,31,31, 05,27,20, 06,22,03, 00,00,00 ; PAL_VERDANTMON ; Sunsette: default Bulbasaur line - white / 29dda8 / 30b515 / black
	RGB 31,31,31, 29,28,26, 16,14,19, 00,00,00 ; PAL_IVORYMON ; Sunsette: default Parasect - white / efe6d6 / 84739c / black
	RGB 31,31,31, 18,21,14, 09,18,09, 00,00,00 ; PAL_LEAFMON ; Sunsette: alt Bulbasaur line + default Metapod/Scyther - white / 90a870 / 4e914e / black
	RGB 31,31,31, 20,29,29, 21,20,16, 00,00,00 ; PAL_AQUAMON ; Sunsette: default Squirtle - white / a0e8e8 / a8a080 / black
	RGB 31,31,31, 13,20,29, 19,17,14, 00,00,00 ; PAL_MUDDYWATER ; Sunsette: default Blastoise - white / 68a0e8 / 988870 / black
	RGB 31,31,31, 31,27,07, 17,14,17, 00,00,00 ; PAL_HORNETMON ; Sunsette: default Beedrill - white / ffe13b / 897789 / black
	RGB 31,31,31, 24,19,26, 10,15,13, 00,00,00 ; PAL_NIDOMASC ; Sunsette: default NidoranM/Nidorino/Nidoking - white / c7a0d6 / 507868 / black
	RGB 31,31,31, 30,27,28, 27,19,20, 00,00,00 ; PAL_BLUSHMON ; Sunsette: default Clefairy/Clefable/Jigglypuff/Wigglytuff - white / f0d8e0 / d898a0 / black
	RGB 31,31,31, 30,27,28, 28,15,21, 00,00,00 ; PAL_ROSEMON ; Sunsette: default Mr. Mime - white / f0d8e0 / e078a8 / black
	RGB 31,31,31, 12,17,26, 14,04,15, 00,00,00 ; PAL_TWILIGHTMON ; Sunsette: default Zubat/Golbat - white / 6088d0 / 702078 / black
	RGB 31,31,31, 29,23,19, 20,17,23, 00,00,00 ; PAL_SANDVIOLET ; Sunsette: default Paras - white / e8b898 / a088b8 / black
	RGB 31,31,31, 22,15,11, 18,04,02, 00,00,00 ; PAL_SOILMON ; Sunsette: default Diglett/Dugtrio - white / b07858 / 902010 / black
	RGB 31,31,31, 29,28,26, 22,06,04, 00,00,00 ; PAL_BRICKMON ; Sunsette: alt Diglett/Dugtrio - white / efe6d9 / b83323 / black
	RGB 31,31,31, 29,28,26, 17,08,04, 00,00,00 ; PAL_MOCHAMON ; Sunsette: default Mankey/Primeape - white / efe6d6 / 8b3e20 / black
	RGB 31,31,31, 29,28,23, 16,10,07, 00,00,00 ; PAL_SANDMON ; Sunsette: alt Sandshrew/Sandslash - white / f1e7ba / 845038 / black
	RGB 31,31,31, 29,26,16, 25,13,16, 00,00,00 ; PAL_AMBERMON ; Sunsette: default Abra/Kadabra/Alakazam - white / f0d880 / d06c80 / black
	RGB 31,31,31, 16,21,21, 13,11,09, 00,00,00 ; PAL_SLATEMON ; Sunsette: default Machop/Machoke/Machamp - white / 86aaaf / 6c594d / black
	RGB 31,31,31, 19,26,16, 11,15,25, 00,00,00 ; PAL_KELPMON ; Sunsette: ex-SLOTS3 mon colors - white / 98d080 / 5878c8 / black
	RGB 31,31,31, 17,26,30, 25,07,05, 00,00,00 ; PAL_CORALMON ; Sunsette: ex-SLOTS4 mon colors - white / 88d0f0 / c83828 / black
	RGB 31,31,31, 16,16,15, 11,10,09, 00,00,00 ; PAL_GRANITEMON ; Sunsette: default Geodude/Graveler - white / 82817a / 5b514a / black
	RGB 31,31,31, 20,16,12, 12,10,08, 00,00,00 ; PAL_SANDSTONEMON ; Sunsette: alt Geodude/Graveler/Onix - white / a08060 / 605040 / black
	RGB 31,31,31, 15,10,07, 08,08,07, 00,00,00 ; PAL_BOULDERMON ; Sunsette: default Golem - white / 7f4f37 / 3f3f37 / black
	RGB 31,31,31, 27,06,03, 17,12,09, 00,00,00 ; PAL_MAGMAMON ; Sunsette: alt Golem - white / db3018 / 895f4a / black (intentional light/dark inversion)
	RGB 31,31,31, 30,22,28, 23,11,21, 00,00,00 ; PAL_MAGENTAMON ; Sunsette: alt Slowpoke/Slowbro - white / f0b0e0 / bf5bac / black
	RGB 31,31,31, 18,22,20, 09,10,10, 00,00,00 ; PAL_IRONMON ; Sunsette: default Magnemite/Magneton - white / 97b7a7 / 4d5354 / black
	RGB 31,31,31, 27,26,21, 13,22,11, 00,00,00 ; PAL_LEEKMON ; Sunsette: default Farfetch'd - white / d8d0a8 / 68b058 / black
	RGB 31,31,31, 29,28,26, 27,19,20, 00,00,00 ; PAL_PEARLMON ; Sunsette: default Seel - white / efe6d6 / d898a0 / black (ivory light + blush dark)
	RGB 31,31,31, 29,28,26, 19,21,26, 00,00,00 ; PAL_FROSTMON ; Sunsette: default Dewgong - white / efe6d6 / 98a8d0 / black (PearlMon w/ periwinkle dark)
	RGB 31,31,31, 26,21,22, 25,07,05, 00,00,00 ; PAL_VOLTORBMON ; Sunsette: ex-SLOTS1 mon colors - white / d0a8b0 / c83828 / black
	RGB 31,31,31, 29,25,28, 19,11,22, 00,00,00 ; PAL_LAVENDERMON ; Sunsette: default Shellder - white / e8c8e0 / 9858b0 / black
	RGB 31,31,31, 26,28,29, 23,22,24, 00,00,00 ; PAL_CRYSTALMON ; Sunsette: default Hardened Onix - white / d9e7ec / bcb6c4 / black
	RGB 31,31,31, 31,29,15, 25,22,12, 00,00,00 ; PAL_LEMONMON ; Sunsette: default Hypno - white / fff17d / ceb461 / black
	RGB 31,31,31, 28,24,18, 21,13,12, 00,00,00 ; PAL_CLAYMON ; Sunsette: default Cubone/Marowak - white / e4c890 / af6763 / black
	RGB 31,31,31, 25,27,29, 13,12,19, 00,00,00 ; PAL_GHOSTMON ; Sunsette: alt Cubone/Marowak - white / cddceb / 6b659f / black
	RGB 31,31,31, 24,21,14, 22,13,17, 00,00,00 ; PAL_ROSEGOLDMON ; Sunsette: default Hitmonchan - white / c8ac70 / b46b8b / black
	RGB 31,31,31, 18,18,18, 09,11,11, 00,00,00 ; PAL_ASHMON ; Sunsette: default Rhyhorn/Rhydon - white / 919191 / 4c5e5e / black
	RGB 31,31,31, 20,19,25, 20,12,17, 00,00,00 ; PAL_VIOLETMON ; Sunsette: alt Staryu / default Starmie - white / a098c8 / a06088 / black
	RGB 31,31,31, 25,23,26, 21,16,24, 00,00,00 ; PAL_SMOGMON ; Sunsette: default Koffing/Weezing - white / ccbfd7 / b084c3 / black
	RGB 31,31,31, 25,24,27, 15,11,15, 00,00,00 ; PAL_ARMORMON ; Sunsette: default Armored Mewtwo - white / c8c0da / 7b577e / black
	RGB 31,31,31, 31,30,29, 27,19,20, 00,00,00 ; PAL_CLEFMON ; Sunsette: Clefairy/Clefable - BlushMon, light -> f8f0e8
	RGB 31,31,31, 31,29,29, 27,19,20, 00,00,00 ; PAL_JIGGMON ; Sunsette: Jigglypuff/Wigglytuff - BlushMon, light -> f8e8e8
	RGB 31,31,31, 31,26,21, 31,19,08, 00,00,00 ; PAL_GOLDEENMON ; Sunsette: Goldeen battle - f8d0a8 / f89840
	RGB 31,31,31,  5,27,20,  6,22, 3, 00,00,00 ; PAL_ICON_01
	RGB 31,31,31,  5,27,20, 30,13,18, 00,00,00 ; PAL_ICON_02 ; Sunsette: pink -> f86898 (also normal Ivysaur/Venusaur battle)
	RGB 31,31,31, 31,29,24, 31,24,13, 00,00,00 ; PAL_ICON_03
	RGB 31,31,31, 31,31,30, 27,14, 7, 00,00,00 ; PAL_ICON_04
	RGB 31,31,31, 31,29,24, 20,29,29, 00,00,00 ; PAL_ICON_05
	RGB 31,31,31, 11,15,23, 23,23,23, 00,00,00 ; PAL_ICON_06
	RGB 31,31,31, 31,31,30, 24,23,31, 00,00,00 ; PAL_ICON_07
	RGB 31,31,31, 31,29,24, 13,20,29, 00,00,00 ; PAL_ICON_08
	RGB 31,31,31, 31,31,30, 29,16,22, 00,00,00 ; PAL_ICON_09
	RGB 31,31,31, 31,31,27, 21,14, 7, 00,00,00 ; PAL_ICON_10
	RGB 31,31,31, 31,28,21, 21, 8, 8, 00,00,00 ; PAL_ICON_11
	RGB 31,31,31, 31,31,30, 26,20,28, 00,00,00 ; PAL_ICON_12
	RGB 31,31,31, 31,31,30, 16,16,18, 00,00,00 ; PAL_ICON_13
	RGB 31,31,31, 31,31,30, 26,19,15, 00,00,00 ; PAL_ICON_14
	RGB 31,31,31, 31,26,11, 26,20,28, 00,00,00 ; PAL_ICON_15
	RGB 31,31,31, 31,31,30, 31,26,10, 00,00,00 ; PAL_ICON_16
	RGB 31,31,31, 31,31,30, 30,28,23, 00,00,00 ; PAL_ICON_17
	RGB 31,31,31, 31,31,30, 22,26,30, 00,00,00 ; PAL_ICON_18
	RGB 31,31,31, 31,31,30, 31,20,10, 00,00,00 ; PAL_ICON_19
	RGB 31,31,31, 31,31,30, 29,18,13, 00,00,00 ; PAL_ICON_20
	RGB 31,31,31, 31,31,30, 24,19,26, 00,00,00 ; PAL_ICON_21
	RGB 31,31,31, 10,15,13, 24,19,26, 00,00,00 ; PAL_ICON_22
	RGB 31,31,31, 31,30,29, 30,26,26, 00,00,00 ; PAL_ICON_23
	RGB 31,31,31, 31,31,29, 30,26,23, 00,00,00 ; PAL_ICON_24
	RGB 31,31,31, 31,31,30, 27,23,14, 00,00,00 ; PAL_ICON_25
	RGB 31,31,31, 31,29,29,  4,28,31, 00,00,00 ; PAL_ICON_26
	RGB 31,31,31, 31,31,30, 16,14,19, 00,00,00 ; PAL_ICON_27
	RGB 31,31,31, 31,31,29, 29,23,16, 00,00,00 ; PAL_ICON_28
	RGB 31,31,31, 31,31,30, 17, 8, 4, 00,00,00 ; PAL_ICON_29
	RGB 31,31,31, 31,29, 0, 13,23,31, 00,00,00 ; PAL_ICON_30
	RGB 31,31,31, 11,15,25, 19,26,16, 00,00,00 ; PAL_ICON_31
	RGB 31,31,31, 31,31,29, 30,20,14, 00,00,00 ; PAL_ICON_32
	RGB 31,31,31, 30,29,25, 23,11,10, 00,00,00 ; PAL_ICON_33
	RGB 31,31,31, 31,31,30, 11,13,17, 00,00,00 ; PAL_ICON_34
	RGB 31,31,31, 31,31,30, 10,16, 9, 00,00,00 ; PAL_ICON_35
	RGB 31,31,31, 23,21,19, 16,21,21, 00,00,00 ; PAL_ICON_36
	RGB 31,31,31, 28,25,20, 18,21,14, 00,00,00 ; PAL_ICON_37
	RGB 31,31,31, 17,12, 9, 27, 6, 3, 00,00,00 ; PAL_ICON_38
	RGB 31,31,31, 29,30,31, 24,20,30, 00,00,00 ; PAL_ICON_39
	RGB 31,31,31, 31,30,28, 27,19,20, 00,00,00 ; PAL_ICON_40
	RGB 31,31,31, 31,30,28, 30,22,28, 00,00,00 ; PAL_ICON_41
	RGB 31,31,31, 30,31,31, 18,22,20, 00,00,00 ; PAL_ICON_42
	RGB 31,31,31, 31,31,30, 30,26,16, 00,00,00 ; PAL_ICON_43
	RGB 31,31,31, 31,30,28, 30,22,24, 00,00,00 ; PAL_ICON_44
	RGB 31,31,31, 31,31,30, 27,19,20, 00,00,00 ; PAL_ICON_45
	RGB 31,31,31, 31,31,30, 20,29,29, 00,00,00 ; PAL_ICON_46
	RGB 31,31,31, 31,31,30, 19,21,26, 00,00,00 ; PAL_ICON_47
	RGB 31,31,31, 31,31,30,  9,20,11, 00,00,00 ; PAL_ICON_48
	RGB 31,31,31, 30,30,29, 21,13,12, 00,00,00 ; PAL_ICON_49
	RGB 31,31,31, 30,30,29, 13,12,19, 00,00,00 ; PAL_ICON_50
	RGB 31,31,31, 30,30,29, 18,12, 9, 00,00,00 ; PAL_ICON_51
	RGB 31,31,31, 30,30,29, 23,25,19, 00,00,00 ; PAL_ICON_52
	RGB 31,31,31, 31,31,30, 21,16,24, 00,00,00 ; PAL_ICON_53
	RGB 31,31,31, 31,31,30, 18,21,14, 00,00,00 ; PAL_ICON_54
	RGB 31,31,31, 28,28,27, 19,20,20, 00,00,00 ; PAL_ICON_55
	RGB 31,31,31, 31,31,29, 10,21,12, 00,00,00 ; PAL_ICON_56
	RGB 31,31,31, 31,31,30, 16,16,15, 00,00,00 ; PAL_ICON_57
	RGB 31,31,31, 31,29,24, 17,26,30, 00,00,00 ; PAL_ICON_58
	RGB 31,31,31, 31,31,30, 11,15,23, 00,00,00 ; PAL_ICON_59
	RGB 31,31,31, 31,31,30, 26,15, 9, 00,00,00 ; PAL_ICON_60
	RGB 31,31,31, 31,28,20, 20,12,17, 00,00,00 ; PAL_ICON_61
	RGB 31,31,31, 31,31,30, 28,15,21, 00,00,00 ; PAL_ICON_62
	RGB 31,31,31, 31,31,30, 27,26,21, 00,00,00 ; PAL_ICON_63
	RGB 31,31,31, 31,31,30, 21,14, 7, 00,00,00 ; PAL_ICON_64
	RGB 31,31,31, 31,31,30,  7, 7, 7, 00,00,00 ; PAL_ICON_65
	RGB 31,31,31, 31,31,30, 27,26,24, 00,00,00 ; PAL_ICON_66
	RGB 31,31,31, 31,31,30, 30,26,15, 00,00,00 ; PAL_ICON_67
	RGB 31,31,31, 30,30,28, 17,26,30, 00,00,00 ; PAL_ICON_68
	RGB 31,31,31, 31,31,30, 12,17,26, 00,00,00 ; PAL_ICON_69
	RGB 31,31,31, 31,31,30, 29,28,26, 00,00,00 ; PAL_ICON_70
	RGB 31,31,31, 31,31,30, 17,26,30, 00,00,00 ; PAL_ICON_71
	RGB 31,31,31, 31,31,30, 19,26,16, 00,00,00 ; PAL_ICON_72
	RGB 31,31,31, 31,30,28, 17,23,18, 00,00,00 ; PAL_ICON_73
	RGB 31,31,31, 31,30,28, 18,27,31, 00,00,00 ; PAL_ICON_74
	RGB 31,31,31, 31,31,30,  3,14,14, 00,00,00 ; PAL_ICON_75
	RGB 31,31,31, 22,26,30, 12,17,26, 00,00,00 ; PAL_ICON_76
	RGB 31,31,31, 31,29,16, 31,29,16, 00,00,00 ; PAL_ICON_77
	RGB 31,31,31, 31,30,29, 30,22,17, 00,00,00 ; PAL_ICON_78
	RGB 31,31,31, 31,31,30, 30,22,24, 00,00,00 ; PAL_ICON_79
	RGB 31,31,31, 05,11,10, 18,21,14, 00,00,00 ; PAL_OLIVEMON_REV ; Sunsette: alt Koffing/Weezing - olive mids reversed (white / 275854 / 90ab70 / black)
	RGB 31,31,31, 22,23,30, 17,16,20, 00,00,00 ; PAL_WARTORTLEMON ; Sunsette: normal Wartortle - white / b8c0f8 / 8880a8 / black
	RGB 31,31,31, 15,25,15, 09,18,09, 00,00,00 ; PAL_BULBAALT ; Sunsette: alt Bulbasaur (icon+battle) - white / 78d078 / 489048 / black
	RGB 31,31,31, 15,25,15, 26,11,08, 00,00,00 ; PAL_IVYALT ; Sunsette: alt Ivysaur/Venusaur (icon+battle) - white / 78d078 / d45c40 / black
	RGB 31,31,31, 29,19,12, 00,17,22, 00,00,00 ; PAL_CHARIZARDMON ; Sunsette: normal Charizard (icon+battle) - white / f0a060 / 008ab2 / black
	RGB 31,31,31, 15,15,18, 00,17,22, 00,00,00 ; PAL_CHARIZARDALT ; Sunsette: alt Charizard (icon+battle) - white / 787890 / 008ab2 / black
	RGB 31,31,31, 16,24,28, 16,18,21, 00,00,00 ; PAL_CHARMELEONALT ; Sunsette: alt Charmeleon BATTLE - white / 80c8e8 / 8090b0 / black
	RGB 31,31,31, 30,30,29, 16,18,21, 00,00,00 ; PAL_CHARMELEONALTICON ; Sunsette: alt Charmeleon ICON - white / f8f8f0 / 8090b0 / black
	assert_table_length NUM_SGB_PALS
