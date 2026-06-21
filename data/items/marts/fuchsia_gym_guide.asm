; Sunsette: FUCHSIA GYM guide's TM shop (POISON). After KOGA is beaten the guide sells spare copies of
; his handout TM (SHADOW GAME) plus extra POISON TMs, gated by badge count: 1 badge = leader TM only,
; 3 = +DISABLE, 6 = +TOXIC. INCLUDEd by scripts/FuchsiaGym.asm and must share its bank (the mart engine
; reads the list from the caller's bank). TM_KOGA etc. resolve in tm_location_assignments.asm.
FuchsiaGymGuideTMShop1:
	script_mart TM_KOGA
FuchsiaGymGuideTMShop3:
	script_mart TM_KOGA, TM_DISABLE
FuchsiaGymGuideTMShop6:
	script_mart TM_KOGA, TM_DISABLE, TM_TOXIC
