---
description: Regenerate the clustered colour-gallery sheets (build/gallery/) and send them
---

Regenerate the themed colour-gallery sheets, then deliver them. This is the
**clustered** sheet mode (one PNG per logical group of mons). The other mode,
the single big sprite sheet, is `/colorsheet` (the one I usually want).

## Run it

```sh
python tools/build_gallery.py
```

Output: `build/gallery/NN_<slug>.png` (currently 12 sheets). The script first
deletes the old `NN_*.png` sheets so renames don't leave stragglers. When it
finishes, send me the sheets with SendUserFile (ask first if I want all 12 or
just specific ones; don't dump all 12 unprompted). If a build error mentions
PIL, install with `python -m pip install pillow`.

## What the script does (so you can tweak on request)

`tools/build_gallery.py` imports the palette / recolour / per-cell rendering
from `tools/build_sprite_sheet.py` (so `/colorsheet` and `/gallery` always render
cells identically), then arranges them into separate clustered sheets.

- **Each cell** is the same 128×92 cell as the big sheet (icon left, front
  top-right, back bottom-left, recoloured to its in-game palette). For each mon
  the **default** cell is stacked directly over the **alt** cell (no labels), so
  one mon = one column, two cells tall, counting as **one mon high**.
- **Clusters** are hand-authored as explicit rows in the `CLUSTERS` list at the
  top of the script: `("Title", [ [row], [row], ... ])`. A row entry is a dex
  number (1–151) or a variant item (`V_FLOATMAG`, `V_HARDONIX`, `V_FLOATWEEZ`,
  `V_VOLMAGMAR`, `V_WINTERDRA`, `V_ARMORMEW`). The sheet width is the widest row,
  height is the row count, and rows are left-aligned. The title is only used for
  the filename (sheets carry no drawn text).

## Layout rules these clusters follow (keep them when editing)

- **Never split one evolution family across two rows.** A family sits whole on a
  row, OR (for a 2-stage family only) as a clean vertical column spanning two
  consecutive rows to fill a gap pair — e.g. Sandshrew/Sandslash on the Nidoran
  sheet, Ponyta/Rapidash on the Moles/Frogs/Plants sheet. Never tile a 3-stage
  family vertically.
- **Mostly dex order**, light rearrangement allowed to make sheets pack cleanly.
- **At most one ragged (short) line per sheet, preferably bottom-right.** Prime
  mon counts (e.g. 13, 7) can't form a full rectangle, so one short bottom row is
  unavoidable there; that's fine.
- Sheets may go up to **6 wide or 6 tall** when it makes a sheet pack clean.
- Trade-evo families (Abra, Machop, Geodude, Gastly lines) live on their own
  "Trade Evolutions" sheet.

The current set is 12 sheets, net-neutral with the per-family clustering; see the
`CLUSTERS` list for the exact grouping.

`$ARGUMENTS` — if I pass any (e.g. "split sheet 7", "merge fossils into legends",
"send only sheet 6"), apply that to the `CLUSTERS` list (or the send step) before
running.
