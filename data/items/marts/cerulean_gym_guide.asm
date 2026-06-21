; Sunsette: CERULEAN GYM guide's TM shop (WATER). After MISTY is beaten the guide sells spare copies of
; her handout TM plus extra WATER TMs, gated by badge count: 1 badge = leader TM only, 3 = +AURORA MIST,
; 6 = +RIPTIDE. INCLUDEd by scripts/CeruleanGym.asm and must share its bank (the mart engine reads the
; list from the caller's bank). TM_MISTY etc. resolve in data/maps/items/tm_location_assignments.asm.
CeruleanGymGuideTMShop1:
	script_mart TM_MISTY
CeruleanGymGuideTMShop3:
	script_mart TM_MISTY, TM_AURORA_MIST
CeruleanGymGuideTMShop6:
	script_mart TM_MISTY, TM_AURORA_MIST, TM_RIPTIDE
