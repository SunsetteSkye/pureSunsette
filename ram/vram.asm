SECTION "VRAM", VRAM

UNION
; generic
vChars0:: ds $80 tiles
vChars1:: ds $80 tiles
vChars2:: ds $80 tiles
vBGMap0:: ds TILEMAP_AREA
vBGMap1:: ds TILEMAP_AREA

NEXTU
; battle/menu
vSprites::  ds $80 tiles
vFont::     ds $80 tiles
vFrontPic:: ds PIC_SIZE tiles
vBackPic::  ds PIC_SIZE tiles

NEXTU
; overworld
vNPCSprites::  ds $80 tiles
vNPCSprites2:: ds $80 tiles
vTileset::     ds $80 tiles

NEXTU
; title
	ds $80 tiles
vTitleLogo::  ds $80 tiles
	ds PIC_SIZE tiles
vTitleLogo2:: ds 30 tiles

ENDU

ENDSECTION


; VWF composited-tile pool. Physically this lives in VRAM bank 1's tile region
; ($8000..$97FF), which is otherwise unused for tiles (bank 1 only holds the BG
; attribute map at $9800+); the compositor writes it with rVBK=1 and prose cells
; fetch it via attribute bit 3. The *nominal* link bank is 0 only because the
; main "VRAM" section already claims nominal bank 1 (layout.link); VRAM bank
; attribution is linker bookkeeping, the real bank is chosen at runtime by rVBK.
; Bank-0 tiles are untouched, so the static font stays fully resident. GBC-only.
SECTION "VWF Pool", VRAM[$8800], BANK[0]

vVWFPool:: ds $80 tiles

ENDSECTION
