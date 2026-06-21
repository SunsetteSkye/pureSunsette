; Sunsette: VERMILION GYM guide's TM shop (ELECTRIC). After LT.SURGE is beaten the guide sells spare
; copies of his handout TM (THUNDERBOLT) plus extra ELECTRIC TMs, gated by badge count: 1 badge = leader
; TM only, 3 = +THUNDER WAVE, 6 = +THUNDER. INCLUDEd by scripts/VermilionGym.asm and must share its bank
; (the mart engine reads the list from the caller's bank). TM_SURGE etc. resolve in tm_location_assignments.asm.
VermilionGymGuideTMShop1:
	script_mart TM_SURGE
VermilionGymGuideTMShop3:
	script_mart TM_SURGE, TM_THUNDER_WAVE
VermilionGymGuideTMShop6:
	script_mart TM_SURGE, TM_THUNDER_WAVE, TM_THUNDER
