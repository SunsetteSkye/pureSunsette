; Sunsette: SAFFRON GYM guide's TM shop (PSYCHIC). After SABRINA is beaten the guide sells spare copies
; of her handout TM (SKITTERMIND) plus extra PSYCHIC TMs, gated by badge count: 1 badge = leader TM only,
; 3 = +CALM MIND, 6 = +PSYCHIC. INCLUDEd by scripts/SaffronGym.asm and must share its bank (the mart
; engine reads the list from the caller's bank). TM_SABRINA etc. resolve in tm_location_assignments.asm.
SaffronGymGuideTMShop1:
	script_mart TM_SABRINA
SaffronGymGuideTMShop3:
	script_mart TM_SABRINA, TM_CALM_MIND
SaffronGymGuideTMShop6:
	script_mart TM_SABRINA, TM_CALM_MIND, TM_PSYCHIC_M
