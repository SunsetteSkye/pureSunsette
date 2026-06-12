MistEffect_:
	ld hl, wPlayerBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .mistEffect
	ld hl, wEnemyBattleStatus2
.mistEffect
	bit NORMAL_DRAGON_IMMUNITY, [hl] ; is mon protected by mist?
	jr nz, .mistAlreadyInUse
	set STAT_DOWN_IMMUNITY, [hl] ; mon is now protected by mist (shared with guard spec)
	set NORMAL_DRAGON_IMMUNITY, [hl] ; secondary effect of mist: immune to NORMAL and DRAGON moves
	callfar PlayCurrentMoveAnimation
	ld hl, ShroudedInMistText
	jp PrintText
.mistAlreadyInUse
	ld c, 50
	rst _DelayFrames
	jpfar PrintButItFailedText_

ShroudedInMistText:
	text_far _ShroudedInMistText
	text_end
