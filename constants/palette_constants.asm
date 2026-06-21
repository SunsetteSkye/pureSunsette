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
	; PureRGBnote: ADDED: palettes for the ported Surfing Pikachu minigame. (The ; $NN
	; comments above are stale; `const` auto-increments, so the real values stay
	; sequential and parallel with the SetPalFunctions table.)
	const SET_PAL_SURFING_PIKACHU_TITLE    ; surf intro
	const SET_PAL_SURFING_PIKACHU_MINIGAME ; surf gameplay

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
	const PAL_MINDWIPE ; Sunsette: SKITTERMIND all-gray mon palette (true grayscale, no purple tint like PAL_GRAYMON)
	const PAL_ROCKETSISTER ; Sunsette: ROCKET SISTER trainer front sprite (white / f7b58c / 953a58 / black)
	const PAL_EVOTEXTBOX ; Sunsette: evolution textbox split slot - white bg + pure black lines (PAL_BLACK's mid shade is gray)
	const PAL_BROWNMON2 ; Sunsette: default Pidgey-line coloration (white / dbb88a / 7f3f23 / black)
	const PAL_BROWNGOLDMON ; Sunsette: alt Pidgey-line / default Raichu coloration (white / f7d77f / b04545 / black)
	const PAL_STEELMON ; Sunsette: default Spearow/Fearow coloration (white / 98a8c0 / a04040 / black)
	const PAL_TANMON ; Sunsette: alt Spearow/Fearow coloration (white / c89060 / 6b4d75 / black)
	const PAL_MAUVEMON ; Sunsette: alt Rattata/Raticate coloration (white / 857a91 / 51304d / black)
	const PAL_GOLDMON ; Sunsette: default Raichu coloration (white / f8d058 / d07048 / black)
	const PAL_THUNDERMON ; Sunsette: alt Pikachu/Raichu coloration (white / f8e800 / 68b8f8 / black)
	const PAL_SOFTVIOSCAR ; Sunsette: default Butterfree / alt Venomoth coloration (white / e89068 / a888c0 / black)
	const PAL_ORCHIDMON ; Sunsette: default Ekans/Arbok coloration (white / c282cf / a13d41 / black)
	const PAL_OLIVEMON ; Sunsette: alt Ekans/Arbok coloration (white / 90ab70 / 275854 / black)
	const PAL_EMBERMON ; Sunsette: default Vulpix/Charmeleon coloration (white / e07039 / a94315 / black)
	const PAL_FLAREMON ; Sunsette: default Charmander/Charizard + alt Charmeleon (white / f7bc68 / cf3f2f / black)
	const PAL_GRAYVELVET ; Sunsette: alt Vulpix/Wigglytuff coloration (white / 9898ae / 464078 / black)
	const PAL_VERDANTMON ; Sunsette: default Bulbasaur line coloration (white / 29dda8 / 30b515 / black)
	const PAL_IVORYMON ; Sunsette: default Parasect coloration (white / efe6d6 / 84739c / black)
	const PAL_LEAFMON ; Sunsette: alt Bulbasaur line + default Metapod/Scyther (white / 90a870 / 4e914e / black)
	const PAL_AQUAMON ; Sunsette: default Squirtle coloration (white / a0e8e8 / a8a080 / black)
	const PAL_MUDDYWATER ; Sunsette: default Blastoise coloration (white / 68a0e8 / 988870 / black)
	const PAL_HORNETMON ; Sunsette: default Beedrill coloration (white / ffe13b / 897789 / black)
	const PAL_NIDOMASC ; Sunsette: default NidoranM/Nidorino/Nidoking coloration (white / c7a0d6 / 507868 / black)
	const PAL_BLUSHMON ; Sunsette: default Clefairy/Clefable/Jigglypuff/Wigglytuff coloration (white / f0d8e0 / d898a0 / black)
	const PAL_ROSEMON ; Sunsette: default Mr. Mime coloration (white / f0d8e0 / e078a8 / black)
	const PAL_TWILIGHTMON ; Sunsette: default Zubat/Golbat coloration (white / 6088d0 / 702078 / black)
	const PAL_SANDVIOLET ; Sunsette: default Paras coloration (white / e8b898 / a088b8 / black)
	const PAL_SOILMON ; Sunsette: default Diglett/Dugtrio coloration (white / b07858 / 902010 / black)
	const PAL_BRICKMON ; Sunsette: alt Diglett/Dugtrio coloration (white / efe6d9 / b83323 / black)
	const PAL_MOCHAMON ; Sunsette: default Mankey/Primeape coloration (white / efe6d6 / 8b3e20 / black)
	const PAL_SANDMON ; Sunsette: alt Sandshrew/Sandslash coloration (white / f1e7ba / 845038 / black)
	const PAL_AMBERMON ; Sunsette: default Abra/Kadabra/Alakazam coloration (white / f7db87 / 685848 / black)
	const PAL_SLATEMON ; Sunsette: default Machop/Machoke/Machamp coloration (white / 86aaaf / 6c594d / black)
	const PAL_KELPMON ; Sunsette: clone of the old SLOTS3 mon repurpose (white / 98d080 / 5878c8 / black)
	const PAL_CORALMON ; Sunsette: clone of the old SLOTS4 mon repurpose (white / 88d0f0 / c83828 / black)
	const PAL_GRANITEMON ; Sunsette: default Geodude/Graveler coloration (white / 82817a / 5b514a / black)
	const PAL_SANDSTONEMON ; Sunsette: alt Geodude/Graveler/Onix coloration (white / a08060 / 605040 / black)
	const PAL_BOULDERMON ; Sunsette: default Golem coloration (white / 7f4f37 / 3f3f37 / black)
	const PAL_MAGMAMON ; Sunsette: alt Golem coloration (white / db3018 / 895f4a / black, intentional light/dark inversion)
	const PAL_MAGENTAMON ; Sunsette: alt Slowpoke/Slowbro coloration (white / f0b0e0 / bf5bac / black)
	const PAL_IRONMON ; Sunsette: default Magnemite/Magneton coloration (white / 97b7a7 / 4d5354 / black)
	const PAL_LEEKMON ; Sunsette: default Farfetch'd coloration (white / d8d0a8 / 68b058 / black)
	const PAL_PEARLMON ; Sunsette: default Seel coloration (white / efe6d6 / d898a0 / black; ivory light + blush dark)
	const PAL_FROSTMON ; Sunsette: default Dewgong coloration (white / efe6d6 / 98a8d0 / black; PearlMon w/ periwinkle dark)
	const PAL_VOLTORBMON ; Sunsette: clone of the old SLOTS1 mon repurpose (white / d0a8b0 / c83828 / black)
	const PAL_LAVENDERMON ; Sunsette: default Shellder coloration (white / e8c8e0 / 9858b0 / black)
	const PAL_CRYSTALMON ; Sunsette: default Hardened Onix coloration (white / d9e7ec / bcb6c4 / black)
	const PAL_LEMONMON ; Sunsette: default Hypno coloration (white / fff17d / ceb461 / black)
	const PAL_CLAYMON ; Sunsette: default Cubone/Marowak coloration (white / e4c890 / af6763 / black)
	const PAL_GHOSTMON ; Sunsette: alt Cubone/Marowak coloration (white / cddceb / 6b659f / black)
	const PAL_ROSEGOLDMON ; Sunsette: default Hitmonchan coloration (white / c8ac70 / b46b8b / black)
	const PAL_ASHMON ; Sunsette: default Rhyhorn/Rhydon coloration (white / 919191 / 4c5e5e / black)
	const PAL_VIOLETMON ; Sunsette: alt Staryu / default Starmie coloration (white / a098c8 / a06088 / black)
	const PAL_SMOGMON ; Sunsette: default Koffing/Weezing coloration (white / ccbfd7 / b084c3 / black)
	const PAL_ARMORMON ; Sunsette: default Armored Mewtwo coloration (white / c8c0da / 7b577e / black)
	const PAL_CLEFMON ; Sunsette: Clefairy/Clefable battle (BlushMon w/ lighter f8f0e8 light)
	const PAL_JIGGMON ; Sunsette: Jigglypuff/Wigglytuff battle (BlushMon w/ lighter f8e8e8 light)
	const PAL_GOLDEENMON ; Sunsette: Goldeen battle (f8d0a8 / f89840), cloned off PAL_REDMON
; Sunsette: per-species ICON palettes (icon shading; see _design/icon_palettes_draft.md)
	const PAL_ICON_01
	const PAL_ICON_02
	const PAL_ICON_03
	const PAL_ICON_04
	const PAL_ICON_05
	const PAL_ICON_06
	const PAL_ICON_07
	const PAL_ICON_08
	const PAL_ICON_09
	const PAL_ICON_10
	const PAL_ICON_11
	const PAL_ICON_12
	const PAL_ICON_13
	const PAL_ICON_14
	const PAL_ICON_15
	const PAL_ICON_16
	const PAL_ICON_17
	const PAL_ICON_18
	const PAL_ICON_19
	const PAL_ICON_20
	const PAL_ICON_21
	const PAL_ICON_22
	const PAL_ICON_23
	const PAL_ICON_24
	const PAL_ICON_25
	const PAL_ICON_26
	const PAL_ICON_27
	const PAL_ICON_28
	const PAL_ICON_29
	const PAL_ICON_30
	const PAL_ICON_31
	const PAL_ICON_32
	const PAL_ICON_33
	const PAL_ICON_34
	const PAL_ICON_35
	const PAL_ICON_36
	const PAL_ICON_37
	const PAL_ICON_38
	const PAL_ICON_39
	const PAL_ICON_40
	const PAL_ICON_41
	const PAL_ICON_42
	const PAL_ICON_43
	const PAL_ICON_44
	const PAL_ICON_45
	const PAL_ICON_46
	const PAL_ICON_47
	const PAL_ICON_48
	const PAL_ICON_49
	const PAL_ICON_50
	const PAL_ICON_51
	const PAL_ICON_52
	const PAL_ICON_53
	const PAL_ICON_54
	const PAL_ICON_55
	const PAL_ICON_56
	const PAL_ICON_57
	const PAL_ICON_58
	const PAL_ICON_59
	const PAL_ICON_60
	const PAL_ICON_61
	const PAL_ICON_62
	const PAL_ICON_63
	const PAL_ICON_64
	const PAL_ICON_65
	const PAL_ICON_66
	const PAL_ICON_67
	const PAL_ICON_68
	const PAL_ICON_69
	const PAL_ICON_70
	const PAL_ICON_71
	const PAL_ICON_72
	const PAL_ICON_73
	const PAL_ICON_74
	const PAL_ICON_75
	const PAL_ICON_76
	const PAL_ICON_77
	const PAL_ICON_78
	const PAL_ICON_79
	const PAL_OLIVEMON_REV ; Sunsette: alt Koffing/Weezing - PAL_OLIVEMON with the two green mids swapped
	const PAL_WARTORTLEMON ; Sunsette: normal Wartortle unique palette (white / b8c0f8 / 8880a8 / black)
	const PAL_BULBAALT ; Sunsette: alt Bulbasaur icon+battle (white / 78d078 / 489048 / black)
	const PAL_IVYALT ; Sunsette: alt Ivysaur/Venusaur icon+battle (white / 78d078 / d45c40 / black)
	const PAL_CHARIZARDMON ; Sunsette: normal Charizard icon+battle (white / f0a060 / 008ab2 / black)
	const PAL_CHARIZARDALT ; Sunsette: alt Charizard icon+battle (white / 787890 / 008ab2 / black)
	const PAL_CHARMELEONALT ; Sunsette: alt Charmeleon BATTLE (white / 80c8e8 / 8090b0 / black)
	const PAL_CHARMELEONALTICON ; Sunsette: alt Charmeleon ICON (white / f8f8f0 / 8090b0 / black)
DEF NUM_SGB_PALS EQU const_value
