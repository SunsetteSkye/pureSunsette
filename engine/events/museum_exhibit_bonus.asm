; Sunsette: reading a Pewter Museum exhibit (fossils, space shuttle, moon stone, old amber...)
; grants the WHOLE party a small one-time Special stat-EXP boost ("feel a little smarter").
; This routine ONLY does the stat-EXP math; the one-time gating + the jingle/message are done
; by each exhibit's text in the museum script bank (sound_get_item from a floating ROM bank
; loses the bank and crashes, so the message must be printed from a normal script/text bank).

DEF MUSEUM_EXHIBIT_SPC_EXP EQU 5

GrantMuseumSmartsBonus::
	ld a, [wPartyCount]
	and a
	ret z
	ld b, a
	ld hl, wPartyMons + MON_SPC_EXP ; first mon's Special stat EXP (2 bytes, big-endian: hi, lo)
.loop
	inc hl ; -> low byte
	ld a, [hl]
	add MUSEUM_EXHIBIT_SPC_EXP
	ld [hld], a ; store low, hl -> high byte
	ld a, [hl]
	adc 0
	ld [hl], a ; store high
	jr nc, .noCap
	ld a, $ff ; rolled past 65535 -> saturate both bytes
	ld [hli], a
	ld [hld], a
.noCap
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de ; next mon's Special stat EXP
	dec b
	jr nz, .loop
	ret
