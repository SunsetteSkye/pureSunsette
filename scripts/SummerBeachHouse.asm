; Sunsette: Summer Beach House (Route 19), ported from pokeyellow. Home of the Surfing
; Pikachu minigame. Gating reworked from pokeyellow's Surf-Pikachu-starter check:
;   * FIRST ride: need Koga's badge (BIT_POISONBADGE = the MARSH BADGE in this hack) AND a
;     PIKACHU or RAICHU that knows SURF.
;   * After you've surfed once (persistent EVENT_SURFED_WITH_DUDE), the SURFIN' DUDE
;     "remembers" you and lets you ride anytime, no badge or party requirement.
;   * The 1000-coin wager is only offered from the SECOND ride on (needs the Coin Case);
;     win it back as coins equal to your run's score.
; The Game Boy Printer hardware path is dropped; the "printer" object still shows the
; graphical hi-score screen.

SummerBeachHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

; Returns z = not eligible, nz = eligible (Koga's badge + a PIKACHU/RAICHU that knows Surf).
SummerBeachHouse_CheckEligible:
	ld a, [wObtainedBadges]
	bit BIT_POISONBADGE, a ; Koga's badge (the MARSH BADGE in this hack)
	ret z ; no badge -> z
	; fall through to scan the party for a Pikachu/Raichu that knows Surf
SummerBeachHouse_SurfPikachuInParty:
	ld a, [wPartyCount]
	and a
	ret z ; empty party -> z
	ld e, 0 ; party index
.nextMon
	ld a, e
	ld hl, wPartyMon1Species
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hl]
	cp PIKACHU
	jr z, .checkMoves
	cp RAICHU
	jr nz, .notThisMon
.checkMoves
	; it's a Pikachu/Raichu; does it know Surf?
	ld a, e
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld b, NUM_MOVES
.moveLoop
	ld a, [hl]
	cp SURF
	jr z, .found
	inc hl
	dec b
	jr nz, .moveLoop
.notThisMon
	inc e
	ld a, [wPartyCount]
	cp e
	jr nz, .nextMon
	xor a ; not found -> z
	ret
.found
	or 1 ; eligible -> nz
	ret

SummerBeachHouse_TextPointers:
	def_text_pointers
	dw_const SummerBeachHouseSurfinDudeText, TEXT_SUMMERBEACHHOUSE_SURFINDUDE
	dw_const SummerBeachHousePikachuText,    TEXT_SUMMERBEACHHOUSE_PIKACHU
	dw_const SummerBeachHousePoster1Text,    TEXT_SUMMERBEACHHOUSE_POSTER1
	dw_const SummerBeachHousePoster2Text,    TEXT_SUMMERBEACHHOUSE_POSTER2
	dw_const SummerBeachHousePoster3Text,    TEXT_SUMMERBEACHHOUSE_POSTER3
	dw_const SummerBeachHousePrinterText,    TEXT_SUMMERBEACHHOUSE_PRINTER

SummerBeachHouseSurfinDudeText:
	text_asm
	CheckEvent EVENT_SURFED_WITH_DUDE
	jr nz, .remembered
	; --- first ride: gate on Koga's badge + a Pikachu/Raichu that knows Surf ---
	call SummerBeachHouse_CheckEligible
	jr nz, .firstTime
	ld hl, .NotEligibleText
	call PrintText
	jp TextScriptEnd
.firstTime
	ld hl, .FirstTimeText
	call PrintText
	ld hl, .WannaSurfText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .declined
	call .ride ; first ride is never wagered
	; first ride done: the SURF signature just unlocked - tell them their PIKACHU/RAICHU
	; (by nickname) picked up some battle tricks out on the waves.
	call SummerBeachHouse_SurfPikachuInParty ; a = found flag, e = its party index
	and a
	jr z, .firstTimeDone ; safety: the mon's gone (shouldn't happen right after a ride)
	ld a, e
	ld hl, wPartyMonNicks
	call GetPartyMonName ; nickname -> wNameBuffer (for text_ram_namebuffer)
	ld hl, .NewTricksText
	call PrintText
.firstTimeDone
	jp TextScriptEnd
.remembered
	ld hl, .RememberedText
	call PrintText
	ld hl, .WannaSurfText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .declined
	; --- second ride on: offer a wager if the player owns the Coin Case ---
	CheckEvent EVENT_GOT_COIN_CASE
	jr z, .playNoWager
	ld hl, .WagerText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .playNoWager ; declined the wager
	; wager 1000 coins: do they have them?
	ld a, $10
	ldh [hCoins], a
	xor a
	ldh [hCoins + 1], a ; hCoins = 1000 (BCD, big-endian)
	call HasEnoughCoins
	jr c, .notEnoughCoins
	; pay the 1000-coin stake up front
	ld hl, hCoins + 1
	ld de, wPlayerCoins + 1
	ld c, 2
	predef SubBCDPredef
	call .ride
	; pay out coins equal to this run's score
	ld a, [wSurfingMinigameLastScore]     ; low BCD pair (little-endian)
	ldh [hCoins + 1], a
	ld a, [wSurfingMinigameLastScore + 1] ; high BCD pair
	ldh [hCoins], a                       ; hCoins now big-endian = score
	ld hl, hCoins + 1
	ld de, wPlayerCoins + 1
	ld c, 2
	predef AddBCDPredef ; caps at 9999
	ld hl, .PayoutText
	call PrintText
	jp TextScriptEnd
.notEnoughCoins
	ld hl, .NotEnoughCoinsText
	call PrintText
	; no stake taken; ride anyway with no payout
.playNoWager
	call .ride
	jp TextScriptEnd
.declined
	ld hl, .ComeBackText
	call PrintText
	jp TextScriptEnd

; Launch the minigame; mark the player remembered (persistent) + this-session surfed.
; wSurfingMinigameLastScore is filled in by SurfingPikachuMinigame before it reloads the map.
.ride
	; if we've ridden before, enable in-run Select-to-quit this session
	CheckEvent EVENT_SURFED_WITH_DUDE
	jr z, .firstRide
	ld hl, wd492
	set 1, [hl]
.firstRide
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	farcall SurfingPikachuMinigame
	SetEvent EVENT_SURFED_WITH_DUDE ; persistent "remembered" + unlocks the SURF signature
	ld hl, wd492
	set 1, [hl] ; this-session "has surfed" -> printer offers the hi-score
	ret

.FirstTimeText
	text_far _SummerBeachHouseSurfinDudeFirstTimeText
	text_end
.NewTricksText
	text_far _SummerBeachHouseNewTricksText
	text_end
.RememberedText
	text_far _SummerBeachHouseSurfinDudeRememberedText
	text_end
.WannaSurfText
	text_far _SummerBeachHouseSurfinDudeWannaSurfText
	text_end
.ComeBackText
	text_far _SummerBeachHouseSurfinDudeComeBackText
	text_end
.NotEligibleText
	text_far _SummerBeachHouseSurfinDudeNotEligibleText
	text_end
.WagerText
	text_far _SummerBeachHouseSurfinDudeWagerText
	text_end
.NotEnoughCoinsText
	text_far _SummerBeachHouseSurfinDudeNotEnoughCoinsText
	text_end
.PayoutText
	text_far _SummerBeachHouseSurfinDudePayoutText
	text_end

SummerBeachHousePikachuText:
	text_asm
	ld hl, .PikachuText
	call PrintText
	ld a, PIKACHU
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.PikachuText
	text_far _SummerBeachHousePikachuText
	text_end

SummerBeachHousePoster1Text:
	text_far _SummerBeachHousePoster1Text
	text_end

SummerBeachHousePoster2Text:
	text_far _SummerBeachHousePoster2Text
	text_end

SummerBeachHousePoster3Text:
	text_far _SummerBeachHousePoster3Text
	text_end

SummerBeachHousePrinterText:
	text_asm
	ld hl, .PrinterText
	call PrintText
	; only offer the hi-score once the player has surfed this session (the hi-score is
	; session-only RAM, like wd492, so gating on the session flag keeps them in sync)
	ld a, [wd492]
	bit 1, a
	jr z, .done
	ld hl, .PrinterShowText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	; show the graphical hi-score screen, then restore the room
	call SaveScreenTilesToBuffer2
	farcall SurfingMinigameDisplayHighScore
	call WaitForTextScrollButtonPress
	call GBPalWhiteOutWithDelay3
	call ReloadTilesetTilePatterns
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadScreenTilesFromBuffer2
	call Delay3
	call GBPalNormal
.done
	jp TextScriptEnd

.PrinterText
	text_far _SummerBeachHousePrinterText
	text_waitbutton
	text_end
.PrinterShowText
	text_far _SummerBeachHousePrinterShowText
	text_end
