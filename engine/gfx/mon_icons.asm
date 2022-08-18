
AnimatePartyMon_ForceSpeed1:
	xor a
	ld [wCurrentMenuItem], a
	ld b, a
	inc a
	jr GetAnimationSpeed

;;;;;;;;;; mechanicalpennote: ADDED: code for adding the new pokemon icons to OAM when displaying the party menu.

ResetPartyAnimation::
	push bc
	ld hl, $0
	ld bc, 16
	ld a, [wPartyCount]
	and a
	jr z, .doneReset ; nothing to do if 0 party members.
	call AddNTimes
	push hl
	pop bc
	ld hl, wMonPartySpritesSavedOAM
	ld de, wShadowOAM
	call CopyData
.doneReset
	pop bc
	ret

;;;;;;;;;;

; wPartyMenuHPBarColors contains the party mon's health bar colors
; 0: green
; 1: yellow
; 2: red
AnimatePartyMon::
;;;;;;;;;; mechanicalpennote: ADDED: store which pokemon is being hovered on in the party menu
	ld hl, wPartySpecies
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
  	ld [wMonPartySpriteSpecies], a
;;;;;;;;;;
	ld hl, wPartyMenuHPBarColors
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]

GetAnimationSpeed:
	ld c, a
;;;;;;;;;; PureRGBnote: ADDED: some slow pokemon animate slower by default just for fun
	ld a, [wMonPartySpriteSpecies]
	cp SLOWPOKE ; make some pokemon move slower since they don't like moving quickly
	jr z, .slowSpeed
	cp SLOWBRO
	jr z, .slowSpeed
	cp SNORLAX
	jr z, .slowSpeed
	jr .normalSpeed
.slowSpeed
	ld hl, PartyMonSpeedsSlow
	jr .next
.normalSpeed
	ld hl, PartyMonSpeeds
.next
;;;;;;;;;;
	add hl, bc
	ld a, [wOnSGB]
	xor $1
	add [hl]
	ld c, a
	add a
	ld b, a
	ld a, [wAnimCounter]
	and a
	jr z, .resetSprites
	cp c
	jr z, .animateSprite
.incTimer
	inc a
	cp b
	jr nz, .skipResetTimer
	xor a ; reset timer
.skipResetTimer
	ld [wAnimCounter], a
	jp DelayFrame
.resetSprites
	call ResetPartyAnimation ; mechanicalpennote: ADDED: reset OAM
	xor a
	jr .incTimer
.animateSprite
	push bc
	ld hl, wShadowOAMSprite00TileID
	ld bc, $10
	ld a, [wCurrentMenuItem]
	call AddNTimes
	; mechanicalpennote: ADDED: don't use hardcoded icon sprite indices
	ld c, 2
	ld b, $4
	ld de, $4
.loop
	ld a, [hl]
	add c
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop bc
	ld a, c
	jr .incTimer

; Party mon animations cycle between 2 frames.
; The members of the PartyMonSpeeds array specify the number of V-blanks
; that each frame lasts for green HP, yellow HP, and red HP in order.
; On the naming screen, the yellow HP speed is always used.
PartyMonSpeeds:
	db 5, 16, 32
PartyMonSpeedsSlow:
	db 24, 48, 96


LoadMonPartySpriteGfx:
; Load mon party sprite tile patterns into VRAM during V-blank.
	ld hl, MonPartySpritePointers
	ld a, $1c

LoadAnimSpriteGfx:
; Load animated sprite tile patterns into VRAM during V-blank. hl is the address
; of an array of structures that contain arguments for CopyVideoData and a is
; the number of structures in the array.
	ld bc, $0
.loop
	push af
	push bc
	push hl
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyVideoData
	pop hl
	pop bc
	ld a, $6
	add c
	ld c, a
	pop af
	dec a
	jr nz, .loop
	ret

; mechanicalpennote: CHANGED: don't need this code since we have a new way of displaying menu icons
; LoadMonPartySpriteGfxWithLCDDisabled:
;; Load mon party sprite tile patterns into VRAM immediately by disabling the
;; LCD.
;	call DisableLCD
;	ld hl, MonPartySpritePointers
;	ld a, $1c
;	ld bc, $0
;.loop
;	push af
;	push bc
;	push hl
;	add hl, bc
;	ld a, [hli]
;	ld e, a
;	ld a, [hli]
;	ld d, a
;	push de
;	ld a, [hli]
;	ld c, a
;	swap c
;	ld b, $0
;	ld a, [hli]
;	ld e, [hl]
;	inc hl
;	ld d, [hl]
;	pop hl
;	call FarCopyData2
;	pop hl
;	pop bc
;	ld a, $6
;	add c
;	ld c, a
;	pop af
;	dec a
;	jr nz, .loop
;	jp EnableLCD

INCLUDE "data/icon_pointers.asm"

; mechanicalpennote: CHANGED: don't need this code since we have a new way of displaying menu icons
;WriteMonPartySpriteOAMByPartyIndex:
;; Write OAM blocks for the party mon in [hPartyMonIndex].
;	push hl
;	push de
;	push bc
;	ldh a, [hPartyMonIndex]
;	ld hl, wPartySpecies
;	ld e, a
;	ld d, 0
;	add hl, de
;	ld a, [hl]
;	call GetPartyMonSpriteIDOld
;	ld [wOAMBaseTile], a
;	call WriteMonPartySpriteOAM
;	pop bc
;	pop de
;	pop hl
;	ret

WriteMonPartySpriteOAMBySpecies:
; Write OAM blocks for the party sprite of the species in
; [wMonPartySpriteSpecies].
	xor a
	ldh [hPartyMonIndex], a
	ld a, [wMonPartySpriteSpecies]
	callfar GetPartyMonSpriteID ; mechanicalpennote: ADDED: new code for deciding which pokemon icon to display
	ld [wOAMBaseTile], a
	jr WriteMonPartySpriteOAM

; PureRGBnote: CHANGED: don't need this code since it's unused
;UnusedPartyMonSpriteFunction:
; This function is unused and doesn't appear to do anything useful. It looks
; like it may have been intended to load the tile patterns and OAM data for
; the mon party sprite associated with the species in [wcf91].
; However, its calculations are off and it loads garbage data.
;	ld a, [wcf91]
;	call GetPartyMonSpriteID
;	push af
;	ld hl, vSprites tile $00
;	call .LoadTilePatterns
;	pop af
;	add $54
;	ld hl, vSprites tile $04
;	call .LoadTilePatterns
;	xor a
;	ld [wMonPartySpriteSpecies], a
;	jr WriteMonPartySpriteOAMBySpecies
;
;.LoadTilePatterns
;	push hl
;	add a
;	ld c, a
;	ld b, 0
;	ld hl, MonPartySpritePointers
;	add hl, bc
;	add hl, bc
;	add hl, bc
;	ld a, [hli]
;	ld e, a
;	ld a, [hli]
;	ld d, a
;	ld a, [hli]
;	ld c, a
;	ld a, [hli]
;	ld b, a
;	pop hl
;	jp CopyVideoData

WriteMonPartySpriteOAM:
; Write the OAM blocks for the first animation frame into the OAM buffer and
; make a copy at wMonPartySpritesSavedOAM.
	push af
	ld c, $10
	ld h, HIGH(wShadowOAM)
	ldh a, [hPartyMonIndex]
	swap a
	ld l, a
	add $10
	ld b, a
	pop af
	cp ICON_HELIX << 2
	jr z, .helix
	call WriteSymmetricMonPartySpriteOAM
	jr .makeCopy
.helix
	call WriteAsymmetricMonPartySpriteOAM
; Make a copy of the OAM buffer with the first animation frame written so that
; we can flip back to it from the second frame by copying it back.
.makeCopy
	ld hl, wShadowOAM
	ld de, wMonPartySpritesSavedOAM
	ld bc, $60
	jp CopyData

; mechanicalpennote: CHANGED: don't need this code since we have a new way of displaying menu icons
;GetPartyMonSpriteIDOld:
;	ld [wd11e], a
;	predef IndexToPokedex
;	ld a, [wd11e]
;	ld c, a
;	dec a
;	srl a
;	ld hl, MonPartyData
;	ld e, a
;	ld d, 0
;	add hl, de
;	ld a, [hl]
;	bit 0, c
;	jr nz, .skipSwap
;	swap a ; use lower nybble if pokedex num is even
;.skipSwap
;	and $f0
;	srl a ; value == ICON constant << 2
;	srl a
;	ret

; INCLUDE "data/pokemon/menu_icons.asm"

DEF INC_FRAME_1 EQUS "0, $20"
DEF INC_FRAME_2 EQUS "$20, $20"

BugIconFrame1:       INCBIN "gfx/icons/bug.2bpp", INC_FRAME_1
PlantIconFrame1:     INCBIN "gfx/icons/plant.2bpp", INC_FRAME_1
BugIconFrame2:       INCBIN "gfx/icons/bug.2bpp", INC_FRAME_2
PlantIconFrame2:     INCBIN "gfx/icons/plant.2bpp", INC_FRAME_2
SnakeIconFrame1:     INCBIN "gfx/icons/snake.2bpp", INC_FRAME_1
QuadrupedIconFrame1: INCBIN "gfx/icons/quadruped.2bpp", INC_FRAME_1
SnakeIconFrame2:     INCBIN "gfx/icons/snake.2bpp", INC_FRAME_2
QuadrupedIconFrame2: INCBIN "gfx/icons/quadruped.2bpp", INC_FRAME_2

TradeBubbleIconGFX:  INCBIN "gfx/trade/bubble.2bpp"
