SafariZoneEastRestHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneEastRestHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneEastRestHouseScientistText,    TEXT_SAFARIZONEEASTRESTHOUSE_SCIENTIST
	dw_const SafariZoneEastRestHouseRockerText,       TEXT_SAFARIZONEEASTRESTHOUSE_ROCKER
	dw_const SafariZoneEastRestHouseSilphWorkerMText, TEXT_SAFARIZONEEASTRESTHOUSE_SILPH_WORKER_M

; Sunsette: in the battle safari modes (RANGER_HUNT / FREE_ROAM) the scientist explains the WIND
; arena effect (energizing gust - see CheckSafariWind* in engine/battle/arena_indicator.asm); in
; CLASSIC he keeps his vanilla "how many did you catch?" line (the wind only blows in battle modes).
SafariZoneEastRestHouseScientistText:
	text_asm
	ld a, [wSafariType]
	and a
	jr z, .classic
	ld hl, .windText
	jr .print
.classic
	ld hl, .classicText
.print
	rst _PrintText
	rst TextScriptEnd
.classicText
	text_far _SafariZoneEastRestHouseScientistText
	text_end
.windText
	text_far _SafariZoneEastRestHouseWindText
	text_end

SafariZoneEastRestHouseRockerText:
	text_far _SafariZoneEastRestHouseRockerText
	text_end

SafariZoneEastRestHouseSilphWorkerMText:
	text_far _SafariZoneEastRestHouseSilphWorkerMText
	text_end
