	ret                                              ; $5b7a: $c9


	ret                                              ; $5b7b: $c9

// waits until in vblank on the NES
jr_001_5b7c:
	ld   hl, $2002                                   ; $5b7c: $21 $02 $20
	ld   a, (hl)                                     ; $5b7f: $7e
	bit  7, a                                        ; $5b80: $cb $7f
	jr   z, jr_001_5b7c                              ; $5b82: $28 $f8

	ret                                              ; $5b84: $c9
