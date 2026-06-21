---
description: Regenerate the per-mon colour sprite sheet (build/sprite_sheet.png) and send it
---

Regenerate the big per-mon colour sprite sheet, then deliver it.

## Run it

```sh
python tools/build_sprite_sheet.py
```

Output: `build/sprite_sheet.png` (currently ~3008×1712, ≈16:9). When it finishes,
send the file to me with SendUserFile. If a build error mentions PIL, install with
`python -m pip install pillow`.

## What the script does (so you can tweak on request)

`tools/build_sprite_sheet.py` reads the live game data each run, so new sprites or
palette edits are picked up automatically:

- **Palettes:** `data/sgb/sgb_palettes.asm` (`SuperPalettes`, the live PAL_* table,
  `_RED` branch) → RGB; per-mon battle palette `data/pokemon/palettes.asm`
  (`MonsterPalettes`) and `alt_palettes.asm` (`AltMonsterPalettes`); per-mon icon
  palette `data/pokemon/icon_palettes.asm` (`$FF` = use the battle palette).
- **Sprites:** fronts from `gfx/pokemon/front/`, backs from `gfx/pokemon/back_sw/`
  (the 48×48 Spaceworld backs the species actually render), icons from
  `gfx/pokemon/icons/` (16×32 = two frames already stacked), variant fronts from
  `gfx/pokemon/front_alt/`.
- **Cell (128×92):** icon section = left 24px with the two icon frames stacked &
  centred; battle section = front sprite top-right, back sprite bottom-left. Every
  sprite recoloured to its in-game palette.
- **Layout:** dex order 1→151; evolution families (and the merged sets
  Hitmonlee+Hitmonchan, the three birds, Mewtwo/Armored Mewtwo/Mew) never split
  across a row; each row is mirrored directly below in alt palettes (alt-row **icons**
  follow the alt battle palette, because the game's `IconPalettesAlt` mostly just
  copies the normal icon colour); 16px gutters; column count auto-chosen for ≈16:9.
- **Variants** (placed right of their base): Floating Magneton, Hardened Onix,
  Floating Weezing, Volcanic Magmar, Winter Dragonair, Armored Mewtwo. The **player** is the final cell
  (walking sprite in the icon slot, front+back coloured via `PAL_PLAYER`).

Key tunables near the top of the script: `GUTTER` (16), `CELL_W`/`CELL_H` (128/92),
and the variant palette overrides in the `mk_variant(...)` calls.

`$ARGUMENTS` — if I pass any (e.g. "gutter 8", "cell height 100"), apply that change
to the script before running.
