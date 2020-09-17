	ret                                              ; $091e: $c9


	ld   hl, wScrollingTextBytesBank                                   ; $091f: $21 $68 $c0
	ld   a, (hl)                                     ; $0922: $7e
	ld   l, a                                        ; $0923: $6f
	ld   h, $00                                      ; $0924: $26 $00
	ld   (hl), a                                     ; $0926: $77
	ld   de, $0000                                   ; $0927: $11 $00 $00

-
	ld   hl, wScrollingTextByteAddr                                   ; $092a: $21 $62 $c0
	ldi  a, (hl)                                     ; $092d: $2a
	ld   h, (hl)                                     ; $092e: $66
	ld   l, a                                        ; $092f: $6f
	add  hl, de                                      ; $0930: $19
	ld   a, (hl)                                     ; $0931: $7e
	inc  de                                          ; $0932: $13
	cp   $ff                                         ; $0933: $fe $ff
	jr   z, +                              ; $0935: $28 $0b

	cp   $01                                         ; $0937: $fe $01
	jr   z, +                              ; $0939: $28 $07

	ld   hl, $2007                                   ; $093b: $21 $07 $20
	ld   (hl), a                                     ; $093e: $77
	jp   -                               ; $093f: $c3 $2a $09

+
	ld   hl, $c09a                                   ; $0942: $21 $9a $c0
	ld   (hl), a                                     ; $0945: $77
	ld   hl, $0004                                   ; $0946: $21 $04 $00
	ld   (hl), a                                     ; $0949: $77
	ret                                              ; $094a: $c9
