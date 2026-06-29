PrepareOAMData::
; Determine OAM data for currently visible
; sprites and write it to wShadowOAM.

	ld a, [wUpdateSpritesEnabled]
	dec a
	jr z, .updateEnabled

	cp -1
	ret nz
	ld [wUpdateSpritesEnabled], a
	jp HideSprites

.updateEnabled
	xor a
	ldh [hOAMBufferOffset], a

.spriteLoop
	ldh [hSpriteOffset2], a

	ld d, HIGH(wSpriteStateData1)
	;ldh a, [hSpriteOffset2] ; pointless load
	ld e, a
	ld a, [de] ; [x#SPRITESTATEDATA1_PICTUREID]

	and a
	jp z, .nextSprite

	inc e
	inc e
	ld a, [de] ; [x#SPRITESTATEDATA1_IMAGEINDEX]
	ld [wSavedSpriteImageIndex], a
	call SetOWObjPalSlot ; Sunsette: -> hOWObjPal (preserves de; returns a = image index)
	cp $ff ; off-screen (don't draw)
	jr nz, .visible

	call GetSpriteScreenXY
	jp .nextSprite

.visible
	cp $a0 ; is the sprite unchanging like an item ball or boulder?
	jr c, .usefacing

; unchanging
	and $f
	add $10 ; skip to the second half of the table which doesn't account for facing direction
	jr .next

.usefacing
	and $f

.next
	ld l, a

; get sprite priority
	push de
	inc d
	ld a, e
	add $5
	ld e, a
	ld a, [de] ; [x#SPRITESTATEDATA2_GRASSPRIORITY]
	and $80
	ldh [hSpritePriority], a ; temp store sprite priority
	pop de

; read the entry from the table
	ld h, 0
	ld bc, SpriteFacingAndAnimationTable
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a

	call GetSpriteScreenXY

	ldh a, [hOAMBufferOffset]
	ld e, a
	ld d, HIGH(wShadowOAM)

.tileLoop
	ldh a, [hSpriteScreenY]   ; temp for sprite Y position
	add $10                  ; Y=16 is top of screen (Y=0 is invisible)
	add [hl]                 ; add Y offset from table
	ld [de], a               ; write new sprite OAM Y position
	inc hl
	ldh a, [hSpriteScreenX]   ; temp for sprite X position
	add $8                   ; X=8 is left of screen (X=0 is invisible)
	add [hl]                 ; add X offset from table
	inc e
	ld [de], a               ; write new sprite OAM X position
	inc e
	ld a, [bc]               ; read pattern number offset (accommodates orientation (offset 0,4 or 8) and animation (offset 0 or $80))
	inc bc
	push bc
	ld b, a

	ld a, [wSavedSpriteImageIndex]
	swap a                   ; high nybble determines sprite used (0 is always player sprite, next are some npcs)
	and $f

	; Sprites $a and $b have one face (and therefore 4 tiles instead of 12).
	; As a result, sprite $b's tile offset is less than normal.
	cp $b
	jr nz, .notFourTileSprite
	ld a, $a * 12 + 4
	jr .next2

.notFourTileSprite
	; a *= 12
; PureRGBnote: OPTIMIZED
	add a
	add a
	;sla a
	;sla a
	ld c, a
	add a
	;sla a
	add c

.next2
	add b ; add the tile offset from the table (based on frame and facing direction)
	pop bc
	ld [de], a ; tile id
	inc hl
	inc e
	ld a, [wCurMap]
	cp CELADON_BACK_ALLEY
	jr z, .dontSkipPriority
	ld a, [hl]
	bit BIT_SPRITE_UNDER_GRASS, a
	jr z, .skipPriority
.dontSkipPriority
	ldh a, [hSpritePriority]
	or [hl]
.skipPriority
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;shinpokerednote: gbcnote: handling GBC bits for object table attributes

	;Let's do this bit check now instead of later.
	;Then we'll push AF to preserve the flag register
	bit 0, a ; OAMFLAG_ENDOFDATA
	push af
	
	res 3, a ;0=vram0 & 1=vram1
	and %11111100	;if on GBC, default to OBJ pal 0 or 4
	res 2, a; default of OBP0 uses palette 0
	bit 4, a ; 0=OBP0 or 1=OBP1
	jr z, .spriteusesOBP0
	set 2, a ; palette 4 is OBP1
.spriteusesOBP0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Sunsette: apply this sprite's precomputed overworld OBJ palette slot (hOWObjPal,
; set once per sprite by SetOWObjPalSlot). OR-ing 0 is a no-op (keeps the map default 0/4);
; 1/2/3 select player / generic-human / special, preserving the OBP0/OBP1 bit (-> slot N or N+4).
	push bc
	ld b, a
	ld a, [wOWObjPal]
	or b
	pop bc
;;;;;;;;;;
	inc hl
	ld [de], a
	inc e
	;bit BIT_END_OF_OAM_DATA, a ; OAMFLAG_ENDOFDATA
	;shinpokerednote: gbcnote: We already did this earlier, and we are also done with A's current value.
	;So all that's needed is to pop AF to get the flags back
	pop af
	jr z, .tileLoop

	ld a, e
	ldh [hOAMBufferOffset], a

.nextSprite
	ldh a, [hSpriteOffset2]
	add $10
	cp LOW($100)
	jp nz, .spriteLoop

	; Clear unused OAM.
	ldh a, [hOAMBufferOffset]
	ld l, a
	ld h, HIGH(wShadowOAM)
	ld de, OBJ_SIZE
	ld b, SCREEN_HEIGHT_PX + OAM_Y_OFS
	ld a, [wMovementFlags]
	and (1 << BIT_LEDGE_OR_FISHING) | (1 << BIT_FOLLOWER_ACTIVE) ; Sunsette: also preserve the tail for the follower OBJ
	ld a, LOW(wShadowOAMEnd)
	jr z, .clear

; Don't clear the last 4 entries because they are used for the shadow in the
; jumping down ledge animation, the rod in the fishing animation, or (Sunsette)
; the overworld follower Pokemon.
	ld a, LOW(wShadowOAMSprite36)

.clear
	cp l
	ret z
	ld [hl], b
	add hl, de
	jr .clear

GetSpriteScreenXY:
	inc e
	inc e
	ld a, [de] ; [x#SPRITESTATEDATA1_YPIXELS]
	ldh [hSpriteScreenY], a
	inc e
	inc e
	ld a, [de] ; [x#SPRITESTATEDATA1_XPIXELS]
	ldh [hSpriteScreenX], a
	ld a, 4
	add e
	ld e, a
	ldh a, [hSpriteScreenY]
	add 4
	and $f0
	ld [de], a ; [x#SPRITESTATEDATA1_YADJUSTED]
	inc e
	ldh a, [hSpriteScreenX]
	and $f0
	ld [de], a  ; [x#SPRITESTATEDATA1_XADJUSTED]
	ret

;;;;;;;;;; Sunsette: overworld per-sprite OBJ palette system ;;;;;;;;;;
; Maps specific overworld sprite picture IDs to a custom palette, loaded into active OBJ
; palette slot 3 by ScanSlot3Palette. Format: db SPRITE_*, PAL_* ; db 0 terminator.
; The player is sprite slot 0 (handled before this table); Mewmon trainers (Oak/Giovanni/
; Lance/Bruno) fall through to the generic human palette, so they need no entry.
OverworldSpritePalettes:
	db SPRITE_BLUE,     PAL_RIVAL_OW    ; rival (player is slot 0, unaffected)
	db SPRITE_NURSE,    PAL_JOY_OW
	db SPRITE_KOGA,     PAL_KOGA_OW
	db SPRITE_AGATHA,   PAL_GRAYMON_OW
	db SPRITE_LORELEI,  PAL_REDBAR_OW
	db SPRITE_BROCK,    PAL_BROCK_OW
	db SPRITE_MISTY,    PAL_REDBAR_OW
	db SPRITE_LT_SURGE, PAL_GREENBAR_OW
	db SPRITE_ERIKA,    PAL_REDBAR_OW
	db SPRITE_SABRINA,  PAL_REDBAR_OW
	db SPRITE_BLAINE,   PAL_SAFFRON_OW
	db SPRITE_SCUBA_DIVER, PAL_BLUEMON_OW
	db 0

; Sunsette: per-map legendary encounter sprites. Their sprite IDs (SPRITE_BIRD2, SPRITE_PSYCHIC,
; SPRITE_FAIRY) are shared with ordinary NPCs elsewhere, so they're keyed on the map instead of
; the global table above. Format: db map, sprite ID, PAL_* ; -1 terminator.
LegendaryOWPalettes:
	db SEAFOAM_ISLANDS_B4F, SPRITE_BIRD2,   PAL_ARTICUNO_OW
	db POWER_PLANT,         SPRITE_BIRD2,   PAL_ZAPDOS_OW
	db CINNABAR_VOLCANO,    SPRITE_BIRD2,   PAL_MOLTRES_OW
	db CERULEAN_CAVE_B1F,   SPRITE_PSYCHIC, PAL_MEWTWO_OW
	db VERMILION_DOCK,      SPRITE_FAIRY,   PAL_MEW_OW
	db -1

; carry set if (current map, picture ID b) is a legendary encounter sprite. Clobbers a, c, hl.
IsLegendaryHere:
	ld a, [wCurMap]
	ld c, a
	ld hl, LegendaryOWPalettes
.loop
	ld a, [hl] ; map
	inc a
	jr z, .no  ; -1 terminator
	dec a
	cp c
	jr nz, .next
	inc hl
	ld a, [hl] ; sprite ID
	dec hl
	cp b
	jr z, .yes
.next
	inc hl
	inc hl
	inc hl
	jr .loop
.yes
	scf
	ret
.no
	or a
	ret

; Determine the overworld OBJ palette slot for the current sprite -> hOWObjPal.
;  player (sprite slot 0) -> 1 ; sprite in OverworldSpritePalettes -> 3 ; generic animated
;  human -> 2 ; unchanging object (image index >= $a0) -> 0 (keep the map default palette).
; Preserves de. Returns a = the sprite's saved image index (for the caller's off-screen test).
SetOWObjPalSlot:
	ldh a, [hSpriteOffset2]
	and a
	jr nz, .notPlayer
	ld a, 1
	jr .store
.notPlayer
	push de
	ld d, HIGH(wSpriteStateData1)
	ldh a, [hSpriteOffset2]
	ld e, a
	ld a, [de] ; picture ID
	pop de
	ld b, a
	call IsLegendaryHere ; Sunsette: map-specific legendary sprite -> slot 3
	jr c, .special
	ld hl, OverworldSpritePalettes
.search
	ld a, [hl]
	and a
	jr z, .notSpecial
	cp b
	jr z, .special
	inc hl
	inc hl
	jr .search
.special
	ld a, 3
	jr .store
.notSpecial
	ld a, [wSavedSpriteImageIndex]
	cp $a0
	jr c, .genericHuman ; image < $a0 = animated NPC -> human palette
	; unchanging object: item balls + still NPC sprites take the human palette, boulders/statues keep
	; the map default
	ld a, b
	cp SPRITE_POKE_BALL
	jr z, .genericHuman
	cp SPRITE_POKE_BALL2
	jr z, .genericHuman
	cp SPRITE_GAMEBOY_KID ; Sunsette: still sprites that are actually people
	jr z, .genericHuman
	cp SPRITE_CLIPBOARD
	jr z, .genericHuman
	cp SPRITE_COUCH_GUY
	jr z, .genericHuman
	cp SPRITE_COUCH_GUY2
	jr z, .genericHuman
	xor a ; map default (environment)
	jr .store
.genericHuman
	ld a, 2
.store
	ld [wOWObjPal], a
	ld a, [wSavedSpriteImageIndex]
	ret

; Scan the loaded map sprites for the first one in OverworldSpritePalettes and write its
; palette into the overworld pal packet (active slot 3). Called via farcall from
; SetPal_Overworld. Writes PAL_HUMANSPRITE (harmless; nothing routes to slot 3) if none.
ScanSlot3Palette:
	; Sunsette: on a legendary's map, slot 3 = that legendary's palette (its shared sprite ID
	; can't be distinguished globally, so key on the map)
	ld a, [wCurMap]
	ld c, a
	ld hl, LegendaryOWPalettes
.legLoop
	ld a, [hl]
	inc a
	jr z, .noLeg
	dec a
	cp c
	jr z, .legFound
	inc hl
	inc hl
	inc hl
	jr .legLoop
.legFound:
	inc hl
	inc hl
	ld a, [hl] ; palette
	jr .store
.noLeg:
	ld c, 0
.spriteLoop
	ld h, HIGH(wSpriteStateData1)
	ld l, c
	ld a, [hl] ; picture ID
	and a
	jr z, .nextSprite
	ld b, a
	ld hl, OverworldSpritePalettes
.search
	ld a, [hl]
	and a
	jr z, .nextSprite
	cp b
	jr z, .found
	inc hl
	inc hl
	jr .search
.nextSprite
	ld a, c
	add $10
	ld c, a
	and a
	jr nz, .spriteLoop
	ld a, PAL_HUMANSPRITE
	jr .store
.found
	inc hl
	ld a, [hl] ; PAL_*
.store
	ld [wPalPacket + 7], a
	ret
