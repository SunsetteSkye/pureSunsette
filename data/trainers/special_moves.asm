; Sunsette: LoneMoves + TeamMoves removed 2026-06-21 - vestigial. The $FD custom-moveset path
; (.CustomMovesetTrainer in read_trainer_party.asm) jumps straight to .FinishUp, bypassing the old
; .AddLoneMove/.AddTeamMove handler, and every gym leader / Elite Four trainer now uses a $FD moveset.
; So these tables never reached battle. Gym-leader signature moves now live in the $FD movesets
; (data/trainers/custom_movesets.asm). This file is intentionally empty (INCLUDE removed from trainer_ai.asm).
