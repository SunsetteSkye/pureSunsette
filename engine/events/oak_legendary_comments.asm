; Sunsette: OAK's lab-visit flavor, shown before his dex dialogue (OakVisitComment, callfar'd from
; OaksLabOak1Text). Priority:
;   1. A caught-legendary remark (Moltres/Articuno/Zapdos/Mew/Mewtwo) - one-time per species, and only
;      ONE per Pallet visit if several are pending (EVENT_OAK_COMMENTED_THIS_VISIT, cleared on lab reload).
;   2. Otherwise a repeatable remark on your highest badge (or being Champion), to reward checking in.
; Either way it flows into the shared transition line, then his normal dex talk continues in OaksLab.
; "Caught" = owned in the Pokedex. Pending legendaries are tracked in wBuffer[0..4]:
;   0=Moltres 1=Articuno 2=Zapdos 3=Mew 4=Mewtwo.

OakVisitComment::
	CheckEvent EVENT_OAK_COMMENTED_THIS_VISIT
	jp nz, .badgeComment ; already used this visit's legendary slot - fall to the (repeatable) badge line
	xor a
	ld [wBuffer + 0], a
	ld [wBuffer + 1], a
	ld [wBuffer + 2], a
	ld [wBuffer + 3], a
	ld [wBuffer + 4], a
	ld [wBuffer + 5], a
	ld [wBuffer + 6], a
	ld a, DEX_MOLTRES - 1
	call .testOwned
	jr z, .chkArticuno
	CheckEvent EVENT_OAK_SAW_MOLTRES
	jr nz, .chkArticuno
	ld a, 1
	ld [wBuffer + 0], a
.chkArticuno
	ld a, DEX_ARTICUNO - 1
	call .testOwned
	jr z, .chkZapdos
	CheckEvent EVENT_OAK_SAW_ARTICUNO
	jr nz, .chkZapdos
	ld a, 1
	ld [wBuffer + 1], a
.chkZapdos
	ld a, DEX_ZAPDOS - 1
	call .testOwned
	jr z, .chkMew
	CheckEvent EVENT_OAK_SAW_ZAPDOS
	jr nz, .chkMew
	ld a, 1
	ld [wBuffer + 2], a
.chkMew
	ld a, DEX_MEW - 1
	call .testOwned
	jr z, .chkMewtwo
	CheckEvent EVENT_OAK_SAW_MEW
	jr nz, .chkMewtwo
	ld a, 1
	ld [wBuffer + 3], a
.chkMewtwo
	ld a, DEX_MEWTWO - 1
	call .testOwned
	jr z, .count
	CheckEvent EVENT_OAK_SAW_MEWTWO
	jr nz, .chkSnorlax
	ld a, 1
	ld [wBuffer + 4], a
.chkSnorlax
	; index 5: after fighting EITHER SNORLAX (BEAT = KO'd or caught), not yet remarked on
	CheckEvent EVENT_BEAT_ROUTE12_SNORLAX
	jr nz, .snorlaxFought
	CheckEvent EVENT_BEAT_ROUTE16_SNORLAX
	jr z, .chkSurf
.snorlaxFought
	CheckEvent EVENT_OAK_SAW_SNORLAX
	jr nz, .chkSurf
	ld a, 1
	ld [wBuffer + 5], a
.chkSurf
	; index 6: got HM03 (SURF), not yet remarked on
	CheckEvent EVENT_GOT_HM03
	jr z, .count
	CheckEvent EVENT_OAK_SAW_SURF
	jr nz, .count
	ld a, 1
	ld [wBuffer + 6], a
.count
	ld a, [wBuffer + 0]
	ld b, a
	ld a, [wBuffer + 1]
	add b
	ld b, a
	ld a, [wBuffer + 2]
	add b
	ld b, a
	ld a, [wBuffer + 3]
	add b
	ld b, a
	ld a, [wBuffer + 4]
	add b
	ld b, a
	ld a, [wBuffer + 5]
	add b
	ld b, a
	ld a, [wBuffer + 6]
	add b
	and a
	jp z, .badgeComment ; no legendary/event remark pending
	ld c, a ; count
	call Random
.mod
	cp c
	jr c, .gotOrdinal
	sub c
	jr .mod
.gotOrdinal
	ld c, a ; random ordinal countdown
	ld b, 0 ; index 0..4
	ld hl, wBuffer
.walk
	ld a, [hl]
	and a
	jr z, .walkNext
	ld a, c
	and a
	jr z, .chosen
	dec c
.walkNext
	inc hl
	inc b
	jr .walk
.chosen
	ld a, b
	cp 1
	jr z, .doArticuno
	cp 2
	jr z, .doZapdos
	cp 3
	jr z, .doMew
	cp 4
	jr z, .doMewtwo
	cp 5
	jr z, .doSnorlax
	cp 6
	jr z, .doSurf
	ld hl, .moltresText
	rst _PrintText
	SetEvent EVENT_OAK_SAW_MOLTRES
	jr .legendaryDone
.doArticuno
	ld hl, .articunoText
	rst _PrintText
	SetEvent EVENT_OAK_SAW_ARTICUNO
	jr .legendaryDone
.doZapdos
	ld hl, .zapdosText
	rst _PrintText
	SetEvent EVENT_OAK_SAW_ZAPDOS
	jr .legendaryDone
.doMew
	ld hl, .mewText
	rst _PrintText
	SetEvent EVENT_OAK_SAW_MEW
	jr .legendaryDone
.doMewtwo
	ld hl, .mewtwoText
	rst _PrintText
	SetEvent EVENT_OAK_SAW_MEWTWO
	jr .legendaryDone
.doSnorlax
	ld hl, .snorlaxText
	rst _PrintText
	SetEvent EVENT_OAK_SAW_SNORLAX
	jr .legendaryDone
.doSurf
	ld hl, .surfText
	rst _PrintText
	SetEvent EVENT_OAK_SAW_SURF
.legendaryDone
	SetEvent EVENT_OAK_COMMENTED_THIS_VISIT
.printTransition
	ld hl, .transitionText
	rst _PrintText
	ret

.badgeComment
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	jr nz, .bChampion
	ld a, [wObtainedBadges]
	ld b, a
	bit BIT_EARTHBADGE, b
	jr nz, .bGiovanni
	bit BIT_VOLCANOBADGE, b
	jr nz, .bBlaine
	bit BIT_PSYCHICBADGE, b
	jr nz, .bSabrina
	bit BIT_POISONBADGE, b
	jr nz, .bKoga
	bit BIT_RAINBOWBADGE, b
	jr nz, .bErika
	bit BIT_THUNDERBADGE, b
	jr nz, .bSurge
	bit BIT_CASCADEBADGE, b
	jr nz, .bMisty
	bit BIT_BOULDERBADGE, b
	jr nz, .bBrock
	ret ; no badges yet -> nothing; caller proceeds straight to the dex dialogue
.bChampion
	ld hl, .championText
	jr .badgeShow
.bGiovanni
	ld hl, .giovanniText
	jr .badgeShow
.bBlaine
	ld hl, .blaineText
	jr .badgeShow
.bSabrina
	ld hl, .sabrinaText
	jr .badgeShow
.bKoga
	ld hl, .kogaText
	jr .badgeShow
.bErika
	ld hl, .erikaText
	jr .badgeShow
.bSurge
	ld hl, .surgeText
	jr .badgeShow
.bMisty
	ld hl, .mistyText
	jr .badgeShow
.bBrock
	ld hl, .brockText
.badgeShow
	rst _PrintText
	jr .printTransition

; a = dex number - 1 (bit index). Returns z if the species is NOT owned (caught). Clobbers a/bc/hl.
.testOwned
	ld c, a
	ld b, FLAG_TEST
	ld hl, wPokedexOwned
	call FlagAction
	and a
	ret

.moltresText
	text_far _OakMoltresText
	text_end
.articunoText
	text_far _OakArticunoText
	text_end
.zapdosText
	text_far _OakZapdosText
	text_end
.mewText
	text_far _OakMewText
	text_end
.mewtwoText
	text_far _OakMewtwoText
	text_end
.snorlaxText
	text_far _OakSnorlaxText
	text_end
.surfText
	text_far _OakSurfText
	text_end
.transitionText
	text_far _OakLegendaryTransitionText
	text_end
.brockText
	text_far _OakBrockText
	text_end
.mistyText
	text_far _OakMistyText
	text_end
.surgeText
	text_far _OakSurgeText
	text_end
.erikaText
	text_far _OakErikaText
	text_end
.kogaText
	text_far _OakKogaText
	text_end
.sabrinaText
	text_far _OakSabrinaText
	text_end
.blaineText
	text_far _OakBlaineText
	text_end
.giovanniText
	text_far _OakGiovanniText
	text_end
.championText
	text_far _OakChampionBadgeText
	text_end
