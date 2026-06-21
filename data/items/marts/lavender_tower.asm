; Sunsette: POKEMON TOWER 1F receptionist's gift shop. Opens after Mr. Fuji is rescued; sells the three
; "ghostly" TMs (ILL WIND / SHADOW BALL / VOID MIND). INCLUDEd by scripts/PokemonTower1F.asm and must
; share its bank (the mart engine reads the list from the caller's bank).
LavenderTowerGiftShop:
	script_mart TM_ILL_WIND, TM_SHADOW_BALL, TM_VOID_MIND
