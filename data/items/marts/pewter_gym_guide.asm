; Sunsette: PEWTER GYM guide's TM shop (ROCK). After BROCK is beaten the guide sells spare copies of
; his handout TM plus extra ROCK TMs, gated by badge count: 1 badge = leader TM only, 3 = +BARRIER,
; 6 = +ROCK SLIDE. INCLUDEd by scripts/PewterGym.asm and must share its bank (the mart engine reads
; the list from the caller's bank). TM_BROCK etc. resolve in data/maps/items/tm_location_assignments.asm.
PewterGymGuideTMShop1:
	script_mart TM_BROCK
PewterGymGuideTMShop3:
	script_mart TM_BROCK, TM_BARRIER
PewterGymGuideTMShop6:
	script_mart TM_BROCK, TM_BARRIER, TM_ROCK_SLIDE
