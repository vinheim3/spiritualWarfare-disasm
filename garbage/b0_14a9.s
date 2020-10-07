;;
func_14a9
	ld   de, $0000                                   ; $14a9: $11 $00 $00
	ld   hl, $c006                                   ; $14ac: $21 $06 $c0
	ldi  a, (hl)                                     ; $14af: $2a
	ld   h, (hl)                                     ; $14b0: $66
	ld   l, a                                        ; $14b1: $6f
	add  hl, de                                      ; $14b2: $19
	ld   a, (hl)                                     ; $14b3: $7e
	ld   hl, $c006                                   ; $14b4: $21 $06 $c0
	inc  (hl)                                        ; $14b7: $34
	jr   nz, @done                             ; $14b8: $20 $04

	ld   hl, $c007                                   ; $14ba: $21 $07 $c0
	inc  (hl)                                        ; $14bd: $34

@done:
	ret                                              ; $14be: $c9
