# De-cap Pass — Runbook (for a dedicated session)

**Purpose:** the dialogue **content** sweep, de-capitalize residual ALL-CAPS prose and
re-classify line/page breaks for the VWF reflow, across all text files. The engine work
(VWF, reflow, the compression inserts) is **DONE** in another session; this runbook is
self-contained so a fresh session can execute it without that context.

Hand this to a new session with: *"Follow `notes/decap-pass-plan.md`."*

---

## 0. Load context first
- Auto-memory `decap-pass.md` (the authoritative record: rules, insert mechanism, gotchas).
  Also skim `vwf-variable-width-font.md` and `text-formatting.md`.
- The **pilot** (already done, user-approved, render-confirmed): `text/RedsHouse1F.asm`.
  Use it as the template for tone, casing, breaks, and insert usage.

## 1. The locked rules (USER-CONFIRMED — do not re-litigate)

### Casing
- **Names / speaker labels / place names → Title Case, and ADD SPACES:**
  `MOM`→`Mom`, `DAD`→`Dad`, `PROF.OAK`→`Prof. Oak`, `BIKE SHOP GUY`→`Bike Shop Guy`,
  `SAFFRON CITY`→`Saffron City`, `MT.MOON`→`Mt. Moon`.
- **EXCEPTION:** keep ALL CAPS when a word is genuinely **SHOUTED for emphasis**
  (e.g. Mom's "so THAT'S what..."). If unsure whether it's emphasis, **ASK the user.**
- **Initialisms STAY caps:** HP, PP, TM, HM, PC, TV, SNES, OK, ID.
- **Menu tentpoles STAY ALL-CAPS** (they're fixed-width, not prose): FIGHT/PKMN/ITEM/RUN,
  POKEDEX, and the menu `#MON`. Don't touch these.

### The Poké words — USE THE INSERTS (don't spell them out; literals bloat the bank)
| write | renders | use for |
|-------|---------|---------|
| `<pokemon>` | pokémon (lowercase) | the word, mid-sentence |
| `<Pokemon>` | Pokémon (capital P) | when a sentence **starts** with it |
| `<poke>` | Poké (initial-cap) | compound prefix: `<poke> Ball`, `<poke>Dex` |

Keep the **uppercase** `#` ("POKé") and `#MON` ("POKéMON") for **menus and place names**
(START menu, `#MON LEAGUE`, `#DEX`) — those must stay caps.

### Break audit (reflow semantics)
The VWF now reflows in-paragraph breaks and auto-pages. Decide each break by **meaning:**
- **Formatting break** (text was just chunked to fit the old box) → **REFLOW:** merge into
  one continuous `text`/`para` string; it auto-wraps and auto-pages.
- **Semantic break** (a beat, pause, topic shift, a closing line like "Take care now!")
  → **KEEP a hard break** (`para` / `cont`).
- When ambiguous, **ASK.**
- **Light prose polish on awkward lines is welcome** — *propose* it, don't rewrite silently.
  (The user herself rewrote Mom's Oak line in the pilot.)

## 1b. The data NAME lists (species / moves / items / suggested names)
Separate from prose, but part of the de-cap. These render in **fixed-width** battle/menus
(verified: the fixed-width font has lowercase — `font.png` is 128 tiles loaded at VRAM
`$80`, so `a`=`$a0` is real; first time lowercase names appear there, so **render-test**).
- **Files:** `data/pokemon/names.asm` (species), `data/moves/names.asm`, `data/items/names.asm`,
  `data/player/names.asm` + `data/player/names_list.asm` (suggested player/rival names).
- **Rule: Title Case** (these are proper-noun-like, always capitalized — **no** lowercase
  variants like `<pokemon>`): `MASTER BALL`→`Master Ball`, `SPARK`→`Spark`, `PIDGEY`→`Pidgey`,
  `RED`→`Red`. Keep `TM`/`HM` initialisms in item names caps (`TM01` stays).
- **EXCLUDE the menu COMMAND labels** — they're separate literals, NOT in these lists, and
  stay ALL-CAPS: FIGHT / PKMN (PkMn) / ITEM / RUN, POKéDEX, OPTIONS, SAVE, the START menu.
- **Spacing: modern spacing/hyphenation per current Pokémon naming (USER-CONFIRMED):**
  `DOUBLESLAP`→`Double Slap`, `SOFTBOILED`→`Soft-Boiled`, etc.; already-spaced names like
  `FULL RESTORE`→`Full Restore` are unaffected.
- **WIDTH-CHECK every name that GAINS characters** (modern spacing adds them). Names display
  in fixed slots — there are `*_NAME_LENGTH` limits (`constants/`) and battle/menu HUD widths;
  an over-long name truncates or overflows. For each lengthened name: confirm it fits the slot
  (check the length constant) **and render-test it in the actual menu/battle**. If it won't
  fit, fall back to unspaced (`Doubleslap`) for that one. Species names especially are tight
  (the party/box/HUD slot).
- **Poké-prefixed items** (`POKé BALL`, `POKé DOLL`): use the `<poke>` insert → `Poké Ball`.
- These propagate EVERYWHERE (battle + menus + prose inserts), so once the lists are done the
  prose pass can **ignore** species/move/item tokens. **This runs in THIS content session**
  (the user chose to bundle it with the prose sweep), so do it before/alongside the prose so
  name tokens resolve correctly. Do it as its own focused step (4 list files) with width checks.
- **STATUS: DONE 2026-06-27** (all 4 ROMs build clean). Species (`data/pokemon/names.asm`,
  case-only, `MR.MIME`→`Mr. Mime`), moves (`data/moves/names.asm`, case + canonical re-spacing:
  `Double Slap`/`Solar Beam`/`Soft-Boiled`; **width-forced compound rule (USER-CONFIRMED): a
  two-word name that overflows 12 with a space gets camelCase NOW, NOT flattened** —
  `PoisonPowder`/`ComboBreaker`/`ClobberClock`/`PsychoCrisis` (these are PROVISIONAL: the user
  WANTS them as two words — Poison Powder etc. — and the battle-VWF pass will re-space them once
  the slot limit lifts; TODO in [[vwf-variable-width-font]]). **EXCEPTION `Thundershock`: ONE WORD
  de-cameled, STAYS one word** (user named only this one; not camelCase, not "Thunder Shock")), items
  (`data/items/names.asm`, Poké-prefix via `<poke>` insert, camelCase `ThunderStone`/`TopSecretKey`,
  bag `<poke>dex` = "Pokédex" de-capped like prose),
  player/rival presets (`constants/player_constants.asm` + `data/player/names*.asm`, incl.
  `New Name`). Scripts in scratchpad printed every transform + width. RENDER: species
  ("Charmander") confirmed in the battle HUD + text box via `play_to_rival.py` (cold boot, no
  savestate). `<poke>` insert in item names verified SAFE by code-read (`home/list_menu.asm`:
  quantity/price drawn at a FIXED column offset from the saved row-start hl, independent of name
  length; name ≤12 glyphs fits where vanilla 12-glyph names do).

## 1c. Decisions locked DURING the prose sweep (USER-CONFIRMED 2026-06-27)
- **Pokédex device in prose → `<poke>dex`** ("Pokédex", lowercase d). Menu/title uses of
  `#DEX`/`#MON` stay uppercase, but the device named in dialogue is `<poke>dex`.
- **Signs / placards → Title Case** (not engraved ALL-CAPS): `PALLET TOWN`→`Pallet Town`,
  `OAK #MON RESEARCH LAB`→`Oak <Pokemon> Research Lab`. The sign's `#MON`→`<Pokemon>`.
- **Named game concepts → Title Case** (NOT lowercased), even standalone/bare:
  `Gym`, `Leader`/`Gym Leader`, `Trainer`, `Badge`, `Champion`, `Elite Four`
  ("who the Leader is?", "the Gym's doors"). Generic descriptive nouns stay lowercase
  (coffee, shop, road, collection, aide).
- **Pokémon-prefixed role/place compounds use `<Pokemon>`** (capital) so they read
  capitalized: `Pokémon Center`, `Pokémon Gym`, `Pokémon Mart`, `Pokémon Trainer`,
  `Pokémon League`. (Don't write `<pokemon> Trainer` — lowercase word + capital role looks wrong.)
- **Emphasis shouts keep caps**: the Rival's `WHAT?` (dismay) stays uppercase, like the
  pilot's `THAT'S`. When genuinely unsure if it's emphasis, ASK.
- **Types & stats: "Title only when FORMAL" (USER-CONFIRMED).** Generic "type"/"types" the
  word stays lowercase; a SPECIFIC type/stat named as a mechanic gets Title Case
  (`Psychic-type`, the type charts, `the Attack and Defense stats`, `raise their Speed`,
  `Grass and Bug <pokemon>`). Casual adjectives stay lowercase (`a fire <pokemon>`,
  `full speed` as idiom, `rock hard defense`).
- **Computer-terminal / classified-document text (USER-CONFIRMED): keep headers/codenames/
  terminal-signs ALL-CAPS**, de-cap the readable prose bodies. So OPERATION codenames
  (`OPERATION GUIDING HAND`), section headers (`-STATUS REPORT-`, `CONCLUSION:`), stamped
  verdicts (`MORE STUDY NECESSARY`), redactions (`-REDACTED-`, `BLACK FOG`), and terminal
  door signs (`EMERGENCY EGRESS`, `VOIDAL TERMINAL`) stay caps; the paragraph prose de-caps.
  (NORMAL town signs/placards still go Title Case per above — this is only the terminal/
  classified aesthetic.)
- **Other recurring tokens settled:** `BALL`/`#BALL`→`<poke> Ball`, standalone ball-type
  `Ball(s)` (Title Case, like Badge); `#MANIAC`→`<poke>Maniac`; trainer/role classes
  Title Case (`Bug Catcher`, `Hiker`, `Biker`, `Fishing Guru`, `Designer`); `Mart`/`Museum`/
  `Box`/`Movedex` Title Case (named features); badge names modern-spaced
  (`Boulder Badge`, `Cascade Badge`, `Earth Badge`); generic `rival`/`police`/`champ` stay
  lowercase, but `Champion` (the title) is Title Case; dashes in prose dropped per her
  dash-aversion.

## 2. Per-file workflow
1. Read the text file (`text/*.asm`, some prose also in `data/text/text_*.asm`).
2. Apply casing + the Poké inserts + the break audit.
3. Collect ambiguous casing/break calls → present to the user in a batch (don't guess).
4. **Assemble-check** (RGBDS v1.0.1 must be first on PATH):
   ```sh
   export PATH="/c/Users/astra/rgbds-1.0.1:$PATH"
   rgbasm -Weverything -Wtruncation=1 -Q8 -P includes.asm -D _GREEN -o /dev/null text.asm
   ```
5. If **"Text N grew too big (max 0x4000)"**: the de-cap grew that bank past 16KB.
   Move a file from that `SECTION "Text N"` (in `text.asm`) down into the floating relief
   section `SECTION "Text Nb"` (or add a `Text Nc`). `Text Nb` **floats**; `Text N` is
   bank-pinned in `layout.link`. (A single section can't exceed one 16KB bank — floating
   only helps by letting you split files across sections.)
6. Periodically build all four ROMs:
   ```sh
   make pokered.gbc pokeblue.gbc pokegreen.gbc pokeblue_debug.gbc
   ```
   **NEVER** `make clean` / `make tidy` (deletes unrebuildable tools; a hook blocks it).
7. **Render-test a sample** with the probe pattern in `tools/playtest/probe_mom_decap.py`:
   fresh boot → navigate → talk → screenshot. Boot **from a FRESH boot**, never a savestate
   across a rebuild (savestate desync = fake bugs). Reaching an NPC: pathfind to a tile
   adjacent to them, then face them (compute the facing from the actual landing tile —
   the pathfinder stops one tile short, on whichever side it could reach).

## 3. File order
Roughly **story order** so the user can spot-check on BGB as you go:
Pallet → Viridian → Pewter → Mt. Moon → Cerulean → ... through the text files.
`text/RedsHouse1F.asm` is **DONE**. Some files are still fully ALL-CAPS
(e.g. `text/BillsGarden.asm`, `CameraEvents.asm`) — those need the most work.

## 4. Gotchas
- **Don't add new shortcut inserts casually.** The code table is full except for the kana
  codes already repurposed: `FIRST_TEXT_SHORCUT_ID` is now `$3C`; `$3C/$3D/$3E` are the
  three Poké inserts (`<Pokemon>`/`<poke>`/`<pokemon>`). The `print_name` macro is `jp`
  (not `jr`) now — leave it.
- **Palettes and sprites are deliberate art** — never "fix"/saturate them; don't touch PNGs.
- **she/her** pronouns for the user, always. **Never push/commit** without her explicit say.
- No em dashes / dash+space in prose you write *to her* (commas/periods/ellipses).

## 5. Scope boundary (do NOT do these here)
- Battle VWF (shelved on branch `battle-vwf-shelf`) and the intro (still fixed-width)
  are **engine** work for the other session, not part of this content sweep.
