; Sunsette: FIGHTING DOJO KARATE MASTER's TM shop. After he is beaten for the SOUL BADGE he sells a set
; of FIGHTING / punching TMs. INCLUDEd by scripts/FightingDojo.asm and must share its bank (the mart
; engine reads the list from the caller's bank).
FightingDojoMasterTMShop:
	script_mart TM_DEMOLISH, TM_LOW_KICK, TM_BODY_SLAM, TM_FROST_FIST, TM_BLAZE_HAMMER, TM_ZAPPERCUT, TM_BULK_UP ; Sunsette: TM_BULK_UP added (it lost its Brock home to BUNKER DOWN)
