; shinpokerednote: gbcnote: ADDED: color palettes based on pokemon yellow's GBC colors.
; GREENBUILD: palettes specific to pokemon green
; These color palettes are displayed when COLOR option Y is selected on Super Gameboy or GBC.

; Sunsette: GBCBasePalettes (the full PAL_* table) removed - everything now uses the SuperPalettes
; (SGB1) set, read on GBC via its register path. Only the duochromatic GBC defaults below remain.



; PureRGBnote: ADDED: the colors that display on gbc without any modifications to pokemon red/blue code.
; The "duochromatic" colors that original displayed on GBC games playing red/blue/green.
; only 2 palettes, one for background and OBJ1, another for OBJ0

GBC_OGPalettes_BGOBJ1:
IF DEF(_RED)
	RGB 31,31,31, 31,16,16, 18,07,07, 00,00,00 ; BG, OBJ1
ENDC
IF DEF(_BLUE)
	RGB 31,31,31, 12,20,31, 00,00,31, 00,00,00 ; BG, OBJ1
ENDC
IF DEF(_GREEN)
	RGB 31,31,31, 15,31,06, 00,16,00, 00,00,00 ; BG, OBJ1
ENDC

GBC_OGPalettes_OBJ0:
IF DEF(_RED)
	RGB 31,31,31, 15,31,06, 00,16,00, 00,00,00 ; OBJ0
ENDC
IF DEF(_BLUE)
	RGB 31,31,31, 31,16,16, 18,07,07, 00,00,00 ; OBJ0
ENDC
IF DEF(_GREEN)
	RGB 31,31,31, 12,20,31, 00,00,31, 00,00,00 ; OBJ0
ENDC

