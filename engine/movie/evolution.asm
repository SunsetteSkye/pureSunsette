EvolveMon:
	push hl
	push de
	push bc
	ld a, [wCurPartySpecies]
	push af
	ld a, [wCurSpecies]
	push af
	xor a
	ld [wLowHealthAlarm], a
	ld [wChannelSoundIDs + CHAN5], a
	dec a ; SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	rst _PlaySound
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld a, SFX_TINK
	rst _PlaySound
	call Delay3
	xor a
	ldh [hAutoBGTransferEnabled], a
	ldh [hTileAnimations], a
	ld a, [wEvoOldSpecies]
	ld e, a
	call EvolutionSetWholeScreenPalette
	ld a, [wEvoNewSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call Evolution_LoadPic
	ld de, vFrontPic
	ld hl, vBackPic
	ld bc, PIC_SIZE
	call CopyVideoData
	ld a, [wEvoOldSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call Evolution_LoadPic
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld a, [wEvoOldSpecies]
	call PlayCry
	call WaitForSoundToFinish
	ld c, BANK(Music_Evolution)
	ld a, MUSIC_EVOLUTION
	call PlayMusic
	ld c, 80
	rst _DelayFrames
; Sunsette: back-loaded progression - base form at normal brightness early, first lightness ~a third in,
; switch to PAL_SHADOW ~halfway, stronger lightness near the end. The brief white-out flash + reveal are
; done at .done (NOT held in the loop).
	lb bc, $1, $10
.animLoop
	push bc
	ld a, b
	cp 5
	call z, EvolutionSwitchToShadowPalette ; base form palette -> PAL_SHADOW about halfway through
	call EvolutionRampLighten              ; ramp the whole-screen lighten by morph progress
	call Evolution_CheckForCancel
	jr c, .evolutionCancelled
	call Evolution_BackAndForthAnim
	pop bc
	inc b
	dec c
	dec c
	jr nz, .animLoop
	xor a
	ld [wEvoCancelled], a
	ld a, $31
	ld [wEvoMonTileOffset], a
	call Evolution_ChangeMonPic ; show the new species pic
	ld a, [wEvoNewSpecies]
.done
	push af
; Sunsette: brief full white-out FLASH at the climax (PAL_SHADOW washes to pure white for a split second).
	xor a ; %00000000
	ldh [rBGP], a
	call UpdateGBCPal_BGP
	ld c, 8 ; split-second hold (raise/lower to taste)
	rst _DelayFrames
; Sunsette: reveal the evolved mon - set its real palette + restore normal brightness while still white, so
; PAL_SHADOW is never seen at normal brightness and the new form pops straight in.
	pop af
	push af
	ld e, a
	call EvolutionSetWholeScreenPalette
	ld a, %11100100 ; standard BG palette mapping
	ldh [rBGP], a
	call UpdateGBCPal_BGP
; the jingle announcing the end + the new mon's cry
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	rst _PlaySound
	pop af
	call PlayCry
	pop af
	ld [wCurSpecies], a
	pop af
	ld [wCurPartySpecies], a
	pop bc
	pop de
	pop hl
	ld a, [wEvoCancelled]
	and a
	ret z
	scf
	ret
.evolutionCancelled
	pop bc
	ld a, 1
	ld [wEvoCancelled], a
	ld a, [wEvoOldSpecies]
	jr .done

EvolutionSetWholeScreenPalette:
; Sunsette: mon palette (e) on the top, fixed PAL_BLACK on the bottom textbox rows (so it doesn't jump).
	farcall _SetPalEvolutionSplit
	ret

; Sunsette: switch the morph's whole-screen base to PAL_SHADOW (called once, partway through the morph).
EvolutionSwitchToShadowPalette:
	push bc
	ld e, $FE ; PAL_SHADOW
	call EvolutionSetWholeScreenPalette
	pop bc
	ret

; Sunsette: back-loaded lighten by morph progress (b = 1..8): normal -> first lightness (~1/3 in) ->
; stronger lightness (near the end). The full white-out is NOT here - it's a brief flash at .done.
; UpdateGBCPal_BGP only does real work when rBGP actually changes.
EvolutionRampLighten:
	push bc
	push hl
	ld a, b
	cp 7
	jr nc, .second
	cp 4
	jr nc, .first
	ld a, %11100100 ; early (first ~third): normal brightness, base form's own colours
	jr .apply
.first
	ld a, %10010000 ; ~a third in: first lightness
	jr .apply
.second
	ld a, %01000000 ; near the end: stronger lightness
.apply
	ldh [rBGP], a
	call UpdateGBCPal_BGP
	pop hl
	pop bc
	ret

Evolution_LoadPic:
	call GetMonHeader
	hlcoord 7, 2
	jp LoadFlippedFrontSpriteByMonIndex

Evolution_BackAndForthAnim:
; show the mon change back and forth between the new and old species b times
	ld a, $31
	ld [wEvoMonTileOffset], a
	call Evolution_ChangeMonPic
	ld a, -$31
	ld [wEvoMonTileOffset], a
	call Evolution_ChangeMonPic
	dec b
	jr nz, Evolution_BackAndForthAnim
	ret

Evolution_ChangeMonPic:
	push bc
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 7, 2
	lb bc, 7, 7
	ld de, SCREEN_WIDTH - 7
.loop
	push bc
.innerLoop
	ld a, [wEvoMonTileOffset]
	add [hl]
	ld [hli], a
	dec c
	jr nz, .innerLoop
	pop bc
	add hl, de
	dec b
	jr nz, .loop
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	pop bc
	ret

Evolution_CheckForCancel:
	rst _DelayFrame
	push bc
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	pop bc
	and PAD_B
	jr nz, .pressedB
.notAllowedToCancel
	dec c
	jr nz, Evolution_CheckForCancel
	and a
	ret
.pressedB
	ld a, [wForceEvolution]
	and a
	jr nz, .notAllowedToCancel
	scf
	ret
