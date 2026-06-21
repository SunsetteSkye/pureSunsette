; Sunsette: VIRIDIAN GYM guide's TM shop (GROUND). After GIOVANNI is beaten the guide sells spare copies
; of his handout TM (CLAY ARMOR) plus extra TMs, gated by badge count: 1 badge = leader TM only,
; 3 = +BULK UP, 6 = +EARTHQUAKE. The guide persists after GIOVANNI vanishes, so this doubles as the
; post-game CLAY ARMOR source. INCLUDEd by scripts/ViridianGym.asm and must share its bank (the mart
; engine reads the list from the caller's bank). TM_GIOVANNI etc. resolve in tm_location_assignments.asm.
ViridianGymGuideTMShop1:
	script_mart TM_GIOVANNI
ViridianGymGuideTMShop3:
	script_mart TM_GIOVANNI, TM_BULK_UP ; Sunsette: BULK UP (was GLARE, no longer a TM); Bulk Up lost its Brock home to BUNKER DOWN
ViridianGymGuideTMShop6:
	script_mart TM_GIOVANNI, TM_BULK_UP, TM_EARTHQUAKE
