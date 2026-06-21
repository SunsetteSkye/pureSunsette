; Sunsette: CINNABAR GYM guide's TM shop (FIRE). After BLAINE is beaten the guide sells spare copies of
; his handout TM (SUPERNOVA) plus extra FIRE TMs, gated by badge count: 1 badge = leader TM only,
; 3 = +MIRAGE, 6 = +FIRE BLAST. INCLUDEd by scripts/CinnabarGym.asm and must share its bank (the mart
; engine reads the list from the caller's bank). TM_BLAINE etc. resolve in tm_location_assignments.asm.
CinnabarGymGuideTMShop1:
	script_mart TM_BLAINE
CinnabarGymGuideTMShop3:
	script_mart TM_BLAINE, TM_MIRAGE
CinnabarGymGuideTMShop6:
	script_mart TM_BLAINE, TM_MIRAGE, TM_FIRE_BLAST
