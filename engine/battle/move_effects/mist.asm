; Sunsette: vanilla Mist is DEAD. AURORA MIST routes MIST_EFFECT through the Haze trampoline to
; AuroraMistEffect_ (which sets STAT_DOWN_IMMUNITY only); nothing dispatches this routine anymore. Its old
; "immune to NORMAL/DRAGON moves" secondary used BattleStatus2 bit 6, now reclaimed as BATTLESTATUS2_UNUSED_6.
; Kept as a bare ret only so the (also-orphaned) MistEffect trampoline's jpfar still resolves.
MistEffect_:
	ret
