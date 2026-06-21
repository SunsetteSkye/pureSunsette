; Sunsette: PEWTER MART side counter - the repurposed mart kid sells FRESH WATER (gated in the script
; until you earn the THUNDERBADGE). One-item sale. INCLUDEd by scripts/PewterMart.asm and must share its
; bank (the mart engine reads the list from the caller's bank). Label was promoted from a local
; .FreshWaterShop to a global so it can live in this file.
PewterMartFreshWaterShop:
	script_mart FRESH_WATER
