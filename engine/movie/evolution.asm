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
; Sunsette: hold normal brightness for the whole morph (no gradual lighten / PAL_SHADOW any more) and
; sync wLastBGP so the .done white-out flash still fires. The morph itself rapidly rotates slot 0 (the
; mon area) through a few bright palettes for a "superstar invincibility" strobe - see
; Evolution_BackAndForthAnim / EvolutionMorphCyclePalette. The brief white-out + reveal stay at .done.
	ld a, %11100100 ; normal BG palette mapping (full brightness)
	ldh [rBGP], a
	call UpdateGBCPal_BGP
	xor a
	ld [wEvoMorphPalIndex], a
	lb bc, $1, $10
.animLoop
	push bc
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

Evolution_LoadPic:
	call GetMonHeader
	hlcoord 7, 2
	jp LoadFlippedFrontSpriteByMonIndex

Evolution_BackAndForthAnim:
; show the mon change back and forth between the new and old species b times
; Sunsette: advance the bright-palette strobe on each silhouette flip (~one step per ChangeMonPic, the
; fastest in-loop cadence available) so the morph cycles colours rapidly while it flips. NOTE: `farcall`
; does `ld b, BANK(...)`, which clobbers our loop counter b - so bc must be pushed around each farcall or
; the dec b / jr nz below never terminates (the morph would run forever).
	push bc
	farcall EvolutionMorphCyclePalette
	pop bc
	ld a, $31
	ld [wEvoMonTileOffset], a
	call Evolution_ChangeMonPic
	push bc
	farcall EvolutionMorphCyclePalette
	pop bc
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
