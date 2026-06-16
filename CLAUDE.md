# pureSunsette (pokered disassembly hack)

## Building

This repo requires **RGBDS v1.0.1** (NOT the cygwin `/usr/local/bin` rgbasm, which is v0.7.0 and too old: it fails on `__SCOPE__` / scoped labels).

RGBDS v1.0.1 is installed at `C:\Users\astra\rgbds-1.0.1` and is on the persistent user PATH **and** in `~/.bashrc`, so a normal shell just works:

```sh
make pokered.gbc                                      # one ROM
make pokered.gbc pokeblue.gbc pokegreen.gbc pokeblue_debug.gbc   # all 4
```

The Claude Code Bash tool is **Git Bash** (`/usr/bin/bash`); the drive is `/c/...` (not cygwin's `/cygdrive/c`). If a Bash-tool session was started before the PATH was set up and `make` can't find `rgbasm`, prepend it once:

```sh
export PATH="/c/Users/astra/rgbds-1.0.1:$PATH"
```

The four target ROMs are `pokered.gbc`, `pokeblue.gbc`, `pokegreen.gbc`, `pokeblue_debug.gbc`. Always confirm a change builds clean on all four before calling it done; most edits still need an in-game playtest after.

## Layout / banks

Section placement is driven by `layout.link`. Banks listed there stack their sections in order; a section grew too big for its bank shows up as a link-time "overflows ROMX by N bytes" error. Fix by floating the section (remove it from the explicit bank list in `layout.link` so the linker drops it into any bank with room) — e.g. "Evos Moves" was floated out of ROMX `$2C`.

## Other context

Detailed project/feature history, recipes, and gotchas live in the auto-memory at
`C:\Users\astra\.claude\projects\C--Users-astra-Documents-GitHub-pureSunsette\memory\` (indexed by `MEMORY.md`).
