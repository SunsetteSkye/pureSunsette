; Sunsette: TYPE GUY's TM shop (replaced his old type-remap service). Sells the high-power / coverage TMs
; (HYPER BEAM / ICE BEAM / BLIZZARD / TEMPEST / WYRM WRATH / BRAVE BIRD / DOUBLE-EDGE). INCLUDEd by
; scripts/TypeGuysHouse.asm and must share its bank (the mart engine reads the list from the caller's bank).
TypeGuyTMShop:
	script_mart TM_HYPER_BEAM, TM_ICE_BEAM, TM_BLIZZARD, TM_TEMPEST, TM_WYRM_WRATH, TM_BRAVE_BIRD, TM_DOUBLE_EDGE
