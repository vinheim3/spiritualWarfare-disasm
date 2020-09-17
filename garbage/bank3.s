// $1ae8 - left over garbage, writes to $0142+
	ld   de, $0000
	ld   bc, $0000

@c0a0_nz:
	ld   hl, $c0a0                                   ; $5aee: $21 $a0 $c0
	ld   a, (hl)
	cp   $00
	jr   z, @c0a0_0                              ; $5af4: $28 $17

	ld   hl, $c0a3                                   ; $5af6: $21 $a3 $c0
	ld   (hl), a

@loopTilFF:
	call func_03_1b6e
	cp   $ff
	jr   z, @outOfLoop

	ld   hl, $0142                                   ; $5b01: $21 $42 $01
	add  hl, bc
	ld   (hl), a
	inc  bc
	ld   hl, $c0a3                                   ; $5b07: $21 $a3 $c0
	dec  (hl)
	jr   nz, @loopTilFF

@c0a0_0:
	ld   a, $00
	ld   hl, $c0a0                                   ; $5b0f: $21 $a0 $c0
	ld   (hl), $00
	ret

@outOfLoop:
	ld   hl, $c0a3                                   ; $5b15: $21 $a3 $c0
	ld   a, (hl)
	ld   hl, $c0a0                                   ; $5b19: $21 $a0 $c0
	ld   (hl), a
	call func_03_1b6e
	ld   hl, $c0a2                                   ; $5b20: $21 $a2 $c0
	ld   (hl), a
	ld   hl, $c0a0                                   ; $5b24: $21 $a0 $c0
	cp   (hl)
	jr   c, +

	ld   hl, $c0a0                                   ; $5b2a: $21 $a0 $c0
	ld   a, (hl)

+
	ld   hl, $c0a3                                   ; $5b2e: $21 $a3 $c0
	ld   (hl), a
	ld   hl, $c0a2                                   ; $5b32: $21 $a2 $c0
	ld   a, (hl)
	ld   hl, $c0a3                                   ; $5b36: $21 $a3 $c0
	sub  (hl)
	ld   hl, $c0a1                                   ; $5b3a: $21 $a1 $c0
	ld   (hl), a
	ld   hl, $c0a0                                   ; $5b3e: $21 $a0 $c0
	ld   a, (hl)
	ld   hl, $c0a3                                   ; $5b42: $21 $a3 $c0
	sub  (hl)
	ld   hl, $c0a0                                   ; $5b46: $21 $a0 $c0
	ld   (hl), a
	call func_03_1b6e

-
	ld   hl, $0142                                   ; $5b4d: $21 $42 $01
	add  hl, bc
	ld   (hl), a
	inc  bc
	ld   hl, $c0a3                                   ; $5b53: $21 $a3 $c0
	dec  (hl)
	jr   nz, -

	ld   hl, $c0a3                                   ; $5b59: $21 $a3 $c0
	ld   (hl), a
	ld   hl, $c0a0                                   ; $5b5d: $21 $a0 $c0
	ld   a, (hl)
	cp   $00
	jr   nz, @c0a0_nz

	ld   hl, $c0a1                                   ; $5b65: $21 $a1 $c0
	ld   a, (hl)
	ld   hl, $c0a0                                   ; $5b69: $21 $a0 $c0
	ld   (hl), a
	ret


func_03_1b6e:
	ld   hl, $c09a                                   ; $5b6e: $21 $9a $c0
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, $c09a                                   ; $5b76: $21 $9a $c0
	inc  (hl)
	jr   nz, +

	ld   hl, $c09b                                   ; $5b7c: $21 $9b $c0
	inc  (hl)

+
	ret
