; Sunsette: CELADON GYM guide's TM shop (GRASS). ERIKA's guide is stationed in the CELADON GAME CORNER,
; so this is INCLUDEd by scripts/GameCorner.asm (labels keep the GameCorner* prefix) and must share its
; bank (the mart engine reads the list from the caller's bank). After ERIKA is beaten the guide sells
; spare copies of her handout TM (ADAPTATION) plus extra GRASS TMs, gated by badge count: 1 badge = leader
; TM only, 3 = +MEGA DRAIN, 6 = +SOLARBEAM. TM_ERIKA etc. resolve in tm_location_assignments.asm.
GameCornerGymGuideTMShop1:
	script_mart TM_ERIKA ; ADAPTATION (Erika's gift)
GameCornerGymGuideTMShop3:
	script_mart TM_ERIKA, TM_MEGA_DRAIN
GameCornerGymGuideTMShop6:
	script_mart TM_ERIKA, TM_MEGA_DRAIN, TM_SOLARBEAM ; Sunsette: SOLARBEAM unlocks at 6 badges (was RAZOR_LEAF)
