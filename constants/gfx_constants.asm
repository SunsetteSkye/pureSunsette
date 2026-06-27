DEF TILE_1BPP_SIZE EQU TILE_SIZE / 2 ; bytes

; --- Variable-width font (VWF) compositor (engine/gfx/vwf.asm) ---
; Prose cells fetch their composited tile from VRAM bank 1 (attribute bit 3)
; using BG palette 0 (the standard text palette).
DEF VWF_ATTR EQU $08 ; OAM/BG attribute: bit 3 = VRAM bank 1, palette 0
; Pool tiles use tile numbers $80..$FF, which map to $8800..$8FFF under BOTH the
; $8000-unsigned and $8800-signed BG/window addressing modes (the overlap
; region). So the pool lives at bank-1 $8800 and a cell's tile byte = $80+index.
DEF VWF_TILE_BASE EQU $80
DEF VWF_SPACE_WIDTH EQU 3 ; advance for ' ' ($7F), which has no packed glyph
DEF VWF_FIRST_CODE EQU $80 ; first char code present in the packed font
DEF VWF_WORD_BUFSIZE EQU 24 ; Stage-2: max chars buffered per word for wrap (>24 glyphs
                            ; can't fit a line; a longer word is force-flushed)
; Dialogue/battle message box prose region (Stage 1: 2 lines, no scroll).
DEF VWF_DLG_COLS      EQU 18 ; cells per line (cols 1..18). Only the LAST line reserves
                            ; col 18 for the ▼ "more" arrow (row 16); VWFFlushWord drops
                            ; one column of budget on the last line. Top line uses all 18.
DEF VWF_DLG_LINEWIDTH EQU VWF_DLG_COLS * 8 ; line width in pixels (top line)
DEF VWF_DLG_STARTCOL  EQU 1
DEF VWF_DLG_ROW0      EQU 14 ; screen row of line 0
DEF VWF_DLG_ROWSTEP   EQU 2  ; rows between text lines (matches vanilla spacing)
DEF VWF_DLG_LINES     EQU 2

DEF BLOCK_WIDTH EQU 4 ; tiles
DEF BLOCK_HEIGHT EQU BLOCK_WIDTH ; tiles
DEF SCREEN_BLOCK_WIDTH EQU 6 ; blocks
DEF SCREEN_BLOCK_HEIGHT EQU 5 ; blocks
DEF SURROUNDING_WIDTH  EQU SCREEN_BLOCK_WIDTH * BLOCK_WIDTH ; tiles
DEF SURROUNDING_HEIGHT EQU SCREEN_BLOCK_HEIGHT * BLOCK_HEIGHT ; tiles

DEF PIC_WIDTH  EQU 7 ; tiles
DEF PIC_HEIGHT EQU PIC_WIDTH ; tiles
DEF PIC_SIZE   EQU PIC_WIDTH * PIC_HEIGHT ; tiles

DEF SPRITEBUFFERSIZE EQU PIC_WIDTH * PIC_HEIGHT * TILE_1BPP_SIZE

; HP bar
DEF HP_BAR_GREEN  EQU 0
DEF HP_BAR_YELLOW EQU 1
DEF HP_BAR_RED    EQU 2

; hAutoBGTransferEnabled
DEF TRANSFERTOP    EQU 0
DEF TRANSFERMIDDLE EQU 1
DEF TRANSFERBOTTOM EQU 2

; hRedrawRowOrColumnMode
DEF REDRAW_COL EQU 1
DEF REDRAW_ROW EQU 2

; hUILayoutFlags
	const_def
	const BIT_PARTY_MENU_HP_BAR   ; 0
	const BIT_DOUBLE_SPACED_MENU  ; 1
	const BIT_SINGLE_SPACED_LINES ; 2

; tile list ids
; TileIDListPointerTable indexes (see data/tilemaps.asm)
	const_def
	const TILEMAP_MON_PIC
	const TILEMAP_SLIDE_DOWN_MON_PIC_7X5
	const TILEMAP_SLIDE_DOWN_MON_PIC_7X3
	const TILEMAP_GENGAR_INTRO_1
	const TILEMAP_GENGAR_INTRO_2
	const TILEMAP_GENGAR_INTRO_3
	const TILEMAP_GAME_BOY
	const TILEMAP_LINK_CABLE
DEF NUM_TILEMAPS EQU const_value
