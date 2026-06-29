; mechanicalpennote: ADDED: new code for increasing the number of icons possible to display on the party menu.

LoadNicknameMonSprite:
	call DisableLCD
	xor a
	ldh [hDownArrowBlinkCount1], a
	ld a, [wMonPartySpriteSpecies]
	ld de, vNPCSprites
	call LoadPartyMonSpriteIntoVRAM
	call FillPartyMonOAM
	call EnableLCD
	ldh a, [hSpriteIndex]
	push af
	xor a
	ldh [hSpriteIndex], a
	call ShowPartyMonSprite
	pop af
	ldh [hSpriteIndex], a
	ret
	
LoadTradeMonSprite:
	call LoadNicknameMonSprite
	jp AdjustForTradeScreen	

LoadPartyMonSprites:
	call DisableLCD
	ld de, vNPCSprites
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	push hl
	call LoadPartyMonSpriteIntoVRAM
	pop hl
	jr .loop
.done
	call FillPartyMonOAM
	jp EnableLCD


FarLoadPartyMonSpriteIntoVRAM::
	ld a, c
LoadPartyMonSpriteIntoVRAM:
	call PreparePartyMonSpriteCopy
	jp FarCopyData

FarLoadPartyMonSpriteIntoVRAMScreenOn::
	ld a, c
	call PreparePartyMonSpriteCopy
	ld b, a
	ld c, 2
	push hl
	push de
	pop hl
	pop de ; swap de and hl
	call CopyVideoData
	push bc
	ld bc, 4 tiles
	push hl
	push de
	pop hl
	add hl, bc
	push hl
	pop de
	pop hl
	ld bc, 2 tiles
	add hl, bc
	pop bc
	jp CopyVideoData

; Sunsette: load the FLY carrier's menu icon into the bird-sprite VRAM slots so the overworld
; FLY animation flaps that species instead of the generic bird. The fly animation only ever
; shows the LEFT-facing frames: image index $08 (StandingLeft = vNPCSprites tiles 8-11) and
; $09 (WalkingLeft = vNPCSprites2 tiles 8-11), so the icon's two 16x16 frames become the two
; flap frames. Icon blob tile order f0={0,1,4,5} f1={2,3,6,7} laid out TL,TR,BL,BR; overworld
; frame order is also TL,TR,BL,BR (cf. the menu copy in FarLoadPartyMonSpriteIntoVRAMScreenOn).
; Reads wFlyCarrierMon (a valid party index is guaranteed by the caller). VBlank-safe copies.
LoadFlyIconIntoBirdVRAM::
	ld a, [wFlyCarrierMon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl] ; a = carrier species index
	ld de, 0
	call PreparePartyMonSpriteCopy ; a = bank, hl = icon src base
	ld b, a ; b = bank (CopyVideoData input)
	ld c, 2 ; tiles per copy
; frame0 top row (icon tiles 0,1) -> vNPCSprites tile 8
	push bc
	push hl
	ld d, h
	ld e, l
	ld hl, vNPCSprites tile 8
	call CopyVideoData
	pop hl
	pop bc
; frame0 bottom row (icon tiles 4,5) -> vNPCSprites tile 10
	push bc
	push hl
	ld de, 4 tiles
	add hl, de
	ld d, h
	ld e, l
	ld hl, vNPCSprites tile 10
	call CopyVideoData
	pop hl
	pop bc
; frame1 top row (icon tiles 2,3) -> vNPCSprites2 tile 8
	push bc
	push hl
	ld de, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ld hl, vNPCSprites2 tile 8
	call CopyVideoData
	pop hl
	pop bc
; frame1 bottom row (icon tiles 6,7) -> vNPCSprites2 tile 10
	push hl
	ld de, 6 tiles
	add hl, de
	ld d, h
	ld e, l
	ld hl, vNPCSprites2 tile 10
	call CopyVideoData
	pop hl
	ret

; Sunsette: composite the lead party Pokemon's menu icon into the bank-1 vFollowerTiles pool
; (see vram.asm) as placeholder overworld follower graphics. Reads wPartySpecies[0]; no-op on
; an empty party, and skips the VRAM copies when the same species is already resident. The
; wFollower* state lives in the bank-1 saved WRAM region, reached at the overworld default
; SVBK=1, so no WRAM bank switching is needed (an earlier bank-2 home broke the VWF compositor).
; The icon source pointer is kept in registers so SVBK is never disturbed across the VBlank-
; waiting CopyVideoData calls. Precondition: called with SVBK=1 (overworld default).
;
; PLACEHOLDER SEAM: the party icon has only ONE facing (down) in two frames, so we load just
; the down-standing (pool tile 0) and down-walking (pool tile 12) slots; the OAM draw clamps
; every facing to down (matching seam in the follower draw). When the real per-species
; overworld sheets arrive, also fill the up/left slots (tiles 4/8 stand, 16/20 walk) and drop
; the draw clamp. Icon blob tile order: frame0={0,1,4,5}, frame1={2,3,6,7} (TL,TR,BL,BR).
LoadFollowerGraphics::
	; Sunsette DESIGN CONTRACT: there is no follower when the party is empty. The eventual
	; per-frame draw/update MUST no-op the same way on wPartyCount==0 / an empty slot-0 species
	; BEFORE it touches OAM -- drawing a follower from an empty slot 0 would garbage OAM and hang
	; the next VBlank (cf. the VWF-session handoff). This loader already obeys it:
	ld a, [wPartyCount]
	and a
	jr z, .clear        ; no party at all -> no follower
	ld a, [wPartySpecies]
	and a
	jr z, .clear        ; empty / Missingno slot 0 -> no follower
	cp $ff
	jr z, .clear
	ld b, a             ; b = live lead species
	ld a, [wFollowerSpecies]
	cp b
	ret z               ; already resident; nothing to copy
	push bc             ; save live species in b
	ld a, b
	ld de, 0
	call PreparePartyMonSpriteCopy ; a = ROM bank, hl = icon src base (8 tiles)
	ld b, a             ; b = ROM bank (CopyVideoData input)
	ld c, 2             ; tiles per copy
	ld a, 1
	ldh [rVBK], a       ; route the tile copies to VRAM bank 1
; frame0 top row (icon tiles 0,1) -> standing-down (vFollowerTiles tile 0)
	push bc
	push hl
	ld d, h
	ld e, l
	ld hl, vFollowerTiles tile 0
	call CopyVideoData
	pop hl
	pop bc
; frame0 bottom row (icon tiles 4,5) -> standing-down (vFollowerTiles tile 2)
	push bc
	push hl
	ld de, 4 tiles
	add hl, de
	ld d, h
	ld e, l
	ld hl, vFollowerTiles tile 2
	call CopyVideoData
	pop hl
	pop bc
; frame1 top row (icon tiles 2,3) -> walking-down (vFollowerTiles tile 12)
	push bc
	push hl
	ld de, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ld hl, vFollowerTiles tile 12
	call CopyVideoData
	pop hl
	pop bc
; frame1 bottom row (icon tiles 6,7) -> walking-down (vFollowerTiles tile 14)
	push hl
	ld de, 6 tiles
	add hl, de
	ld d, h
	ld e, l
	ld hl, vFollowerTiles tile 14
	call CopyVideoData
	pop hl
	xor a
	ldh [rVBK], a       ; restore VRAM bank 0
	pop bc              ; b = live species
	ld a, b
	ld [wFollowerSpecies], a ; mark resident species (bank-1, ambient SVBK)
	ret
.clear
	xor a
	ld [wFollowerSpecies], a
	ld [wFollowerVisible], a
	ret

PreparePartyMonSpriteCopy:
	push de
	call GetPartyMonSpriteID ; a = per-species icon slot, 0..151 (dex order)
; Sunsette: CHANGED: slots span two banks. 0..127 in DexPartyIcons1, 128..151 in
; DexPartyIcons2 (each blob starts at $4000, so the +$40 high-byte base holds for
; both). b carries the bank across Multiply (Multiply preserves bc).
	ld b, BANK(DexPartyIcons1)
	bit 7, a
	jr z, .gotBank
	res 7, a ; 128..151 -> 0..23 within the second blob
	ld b, BANK(DexPartyIcons2)
.gotBank
	ld c, a
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, $80
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct + 2]
	ld h, a
	ldh a, [hProduct + 3]
	ld l, a
	ld a, h
	add $40
	ld h, a
	ld a, b
	pop de
	ld bc, $0080
	ret

GetPartyMonSpriteID:
; Sunsette: variant species with a dedicated icon (e.g. Armored Mewtwo) return
; their own appended slot instead of collapsing to the base dex icon. The slot
; numbers match the VARIANTS list in tools/build_dex_menu_icons.py (152 = first).
	ld b, a ; b = species index
	ld hl, VariantIconSlots
.varLoop
	ld a, [hli]
	cp -1
	jr z, .notVariant
	cp b
	jr z, .gotVariant
	inc hl ; skip the slot byte
	jr .varLoop
.gotVariant
	ld a, [hl]
	ret
.notVariant
	ld a, b
	ld [wPokedexNum], a
	call IndexToPokedex
	ld a, [wPokedexNum]
	; missingno is allowed here, 0 is a valid value
	ld b, a
; Sunsette: icons are always OG+ (enhanced)
	ld hl, MonPartyDataNew
	ld a, b
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ret

VariantIconSlots:
; species index, appended icon slot ; terminated by -1
	db ARMORED_MEWTWO, 152
	db -1

FillPartyMonOAM:
	push hl
	push de
	push bc
	ld hl, PartyMonOAM
	ld de, wShadowOAM
	ld bc, $60
	rst _CopyData
	ld hl, PartyMonOAM
	ld de, wMonPartySpritesSavedOAM
	ld bc, $60
	rst _CopyData
	pop bc
	pop de
	pop hl
	ret

ShowPartyMonSprite:
	push hl
	push de
	push bc
	ldh a, [hSpriteIndex]
	add a
	add a
	add a
	add a ;x16. a is $0 - $50 now.
	ld c, a ; store H_SPRITEINDEX * 8 for later.
	ld hl, wShadowOAM
	ld b, 0
	add hl, bc
	add $10 ; for OAM Y replacement
	ld de, $4
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	add $8
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	; also update the saved OAM.
	ld hl, wShadowOAM ; count back up to where we were
	ld b, 0
	; we haven't touched c yet so it's still H_SPRITEINDEX * 8.
	add hl, bc
	push hl
	ld hl, wMonPartySpritesSavedOAM
	add hl, bc
	push hl
	pop de
	pop hl
	ld bc, $10
	rst _CopyData
	pop bc
	pop de
	pop hl
	ret
	
AdjustForTradeScreen:
	ld hl, wShadowOAM + $1 ;the x value of party sprite 1.
	ld de, $4
	ld b, e
.loopOAM
	inc [hl]
	add hl, de
	dec b
	jr nz, .loopOAM
	ld hl, wMonPartySpritesSavedOAM + $1 ;the x value of party sprite 1.
	ld de, $4
	ld b, e
.loopSaved
	inc [hl]
	add hl, de
	dec b
	jr nz, .loopSaved
	ret


	; fixme trade screen doesn't like our poke being offset to 15.
PartyMonOAM:
; all the Ys are set to be offscreen.
; placed at the proper y in ShowPartyMonSprite
	db 160,15,$00,$00
	db 160,23,$01,$00
	db 160,15,$04,$00
	db 160,23,$05,$00

	db 160,15,$08,$00
	db 160,23,$09,$00
	db 160,15,$0c,$00
	db 160,23,$0d,$00

	db 160,15,$10,$00
	db 160,23,$11,$00
	db 160,15,$14,$00
	db 160,23,$15,$00

	db 160,15,$18,$00
	db 160,23,$19,$00
	db 160,15,$1c,$00
	db 160,23,$1d,$00

	db 160,15,$20,$00
	db 160,23,$21,$00
	db 160,15,$24,$00
	db 160,23,$25,$00

	db 160,15,$28,$00
	db 160,23,$29,$00
	db 160,15,$2c,$00
	db 160,23,$2d,$00

INCLUDE "data/pokemon/menu_icons_new.asm"
INCLUDE "data/pokemon/menu_icons.asm"
