; Sunsette 2026-06-25: move-effect FAR dispatch (reader half).
;
; Background: the engine dispatched a move's effect with `jp hl` out of the "Battle Core" bank. `jp hl`
; can only reach the currently-mapped bank, so every effect handler had to physically live in Battle Core
; or be reached by a 3-byte `jpfar` stub sitting in Battle Core. Battle Core ran out of room years of
; features ago (~38 bytes free of 16 KB), so new effects were bolted on as stubs and, worse, ~25 of them
; were funnelled through a single `HazeEffect` stub into a hand-written `cp`-chain dispatcher
; (HazeFlinchEffect_) that re-decoded the effect id. That whole layer is the "trampoline" smell.
;
; Fix: dispatch through a `dba` (bank + address) table so a handler can live in ANY bank and be called
; directly. This mirrors the engine's proven Predef pattern exactly:
;   * _JumpMoveEffect (Battle Core) computes the effect index, then far-calls GetMoveEffectHandler here.
;   * GetMoveEffectHandler runs IN this bank (so it can read the table next to it) and returns the
;     handler's bank in e and address in hl. Both survive `Bankswitch`'s epilogue, which only clobbers
;     af/bc, so no scratch WRAM is needed.
;   * _JumpMoveEffect then far-calls the handler (b = bank, hl = addr) via a second `rst _Bankswitch`.
;
; The reader and the table must stay in the SAME bank (the reader indexes the table in-bank); keeping both
; in this one floated section guarantees that.

; In:  e = effect index (move effect const - 1)
; Out: e = handler bank, hl = handler address  (de/a clobbered; both outputs survive rst _Bankswitch)
GetMoveEffectHandler::
	ld d, 0
	ld hl, MoveEffectPointerTable
	add hl, de
	add hl, de
	add hl, de            ; hl = &MoveEffectPointerTable[index] (3 bytes/entry: bank, addr-lo, addr-hi)
	ld a, [hli]           ; handler bank
	ld e, a               ; -> e (survives the bankswitch back to the caller)
	ld a, [hli]           ; addr low
	ld h, [hl]            ; addr high
	ld l, a               ; hl = handler address
	ret

INCLUDE "data/moves/effects_pointers.asm"
