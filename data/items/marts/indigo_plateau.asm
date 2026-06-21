; Sunsette: INDIGO PLATEAU lobby MART stock. INCLUDEd by scripts/IndigoPlateauLobby.asm (mart data is read from the caller's bank).
IndigoPlateauLobbyClerkText:
	script_mart \
	HYPER_POTION, \
	MAX_POTION, \
	FULL_RESTORE, \
	FULL_HEAL, \
	REVIVE, \
	ELIXER, \
	PP_UP, \
	GREAT_BALL, \
	ULTRA_BALL, \
	SUPER_REPEL, \
	MAX_REPEL

; Sunsette: the Indigo gym-guide's-son TM shops (IndigoGymGuideSonShop1/2, "all TMs") were deleted -
; they had no callers (the NPC was removed) and were unreachable. The lobby clerk above is the only mart here.
