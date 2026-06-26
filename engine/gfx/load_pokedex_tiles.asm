; Loads tile patterns for tiles used in the pokedex.
LoadPokedexTilePatterns:
	call LoadHpBarAndStatusTilePatterns
	ld de, PokedexTileGraphics
	ld hl, vChars2 tile $60
	lb bc, BANK(PokedexTileGraphics), (PokedexTileGraphicsEnd - PokedexTileGraphics) / TILE_SIZE
	call CopyVideoData
	call LoadPokeballTileGraphics
; PureRGBnote: ADDED: blue panel-edge tiles for the description box (VRAM $73-$7A)
	ld de, PokedexPanelEdgeGraphics
	ld hl, vChars2 tile $56
	lb bc, BANK(PokedexPanelEdgeGraphics), (PokedexPanelEdgeGraphicsEnd - PokedexPanelEdgeGraphics) / TILE_SIZE
	jp CopyVideoData
LoadPokeballTileGraphics::
	ld de, PokeballTileGraphics
	ld hl, vChars2 tile $72
	lb bc, BANK(PokeballTileGraphics), 1
	jp CopyVideoData ; load pokeball tile for marking caught mons
