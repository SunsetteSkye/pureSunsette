StatModifierRatios:
; first byte is numerator, second byte is denominator
	db 25, 100  ; 0.25
	db 28, 100  ; 0.28
	db 33, 100  ; 0.33
	db 40, 100  ; 0.40
	db 50, 100  ; 0.50
	db 66, 100  ; 0.66
	db  1,   1  ; 1.00
	db 15,  10  ; 1.50
	db  2,   1  ; 2.00
	db 25,  10  ; 2.50
	db  3,   1  ; 3.00
	db 35,  10  ; 3.50
	db  4,   1  ; 4.00

; Sunsette: accuracy/evasion use the Gen-2 modifier table instead of the (numerator-2) StatModifierRatios
; above that the regular stats use. Numerator is 3; the denominator steps +/-1 from 3 (so -1 = 3/4 = 0.75,
; +1 = 4/3 = 1.33, etc.) - a gentler curve than the old gen-1 acc/eva math. Read only by CalcHitChance,
; indexed by the accuracy/evasion mod (1..13 -> -6..+6), same 2-byte num/denom layout.
AccuracyEvasionRatios:
	db 3, 9     ; -6  0.33
	db 3, 8     ; -5  0.38
	db 3, 7     ; -4  0.43
	db 3, 6     ; -3  0.50
	db 3, 5     ; -2  0.60
	db 3, 4     ; -1  0.75
	db 3, 3     ;  0  1.00
	db 4, 3     ; +1  1.33
	db 5, 3     ; +2  1.67
	db 6, 3     ; +3  2.00
	db 7, 3     ; +4  2.33
	db 8, 3     ; +5  2.67
	db 9, 3     ; +6  3.00
