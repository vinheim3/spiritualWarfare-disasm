;;
	.db  $00 ; $4ecd
	ld   bc, $019b                                   ; $4ece: $01 $9b $01
	ld   d, b                                        ; $4ed1: $50
	ld   bc, $0148                                   ; $4ed2: $01 $48 $01
	.db $dc $01 $7f
	ld   bc, $0124                                   ; $4ed8: $01 $24 $01
	xor  b                                           ; $4edb: $a8
	xor  h                                           ; $4edc: $ac
	ld   (bc), a                                     ; $4edd: $02
	ld   b, b                                        ; $4ede: $40
	xor  b                                           ; $4edf: $a8
	xor  h                                           ; $4ee0: $ac
	xor  b                                           ; $4ee1: $a8
	ld   (bc), a                                     ; $4ee2: $02
	ret  z                                           ; $4ee3: $c8

	ret                                              ; $4ee4: $c9


	rlc  d                                           ; $4ee5: $cb $02
	ret  nz                                          ; $4ee7: $c0

	pop  bc                                          ; $4ee8: $c1
	jp   $9402                                       ; $4ee9: $c3 $02 $94


	sub  l                                           ; $4eec: $95
	sub  (hl)                                        ; $4eed: $96
	sub  a                                           ; $4eee: $97
	ld   (bc), a                                     ; $4eef: $02
	push hl                                          ; $4ef0: $e5
	and  $e7                                         ; $4ef1: $e6 $e7
	.db  $e4                                         ; $4ef3: $e4
	ld   (bc), a                                     ; $4ef4: $02
	ld   ($ff00+c), a                                ; $4ef5: $e2
	.db  $e3                                         ; $4ef6: $e3
	ldh  (<$e1), a                                   ; $4ef7: $e0 $e1
	ld   (bc), a                                     ; $4ef9: $02
	daa                                              ; $4efa: $27
	inc  h                                           ; $4efb: $24
	dec  h                                           ; $4efc: $25
	ld   h, $02                                      ; $4efd: $26 $02
	ldh  (<$e0), a                                   ; $4eff: $e0 $e0
	ldh  (<$e2), a                                   ; $4f01: $e0 $e2
	ld   ($ff00+c), a                                ; $4f03: $e2
	ld   ($ff00+c), a                                ; $4f04: $e2
	.db  $e3                                         ; $4f05: $e3
	.db  $e3                                         ; $4f06: $e3
	.db  $e3                                         ; $4f07: $e3
	and  b                                           ; $4f08: $a0
	and  h                                           ; $4f09: $a4
	xor  b                                           ; $4f0a: $a8
	and  h                                           ; $4f0b: $a4
	ld   (bc), a                                     ; $4f0c: $02
	ld   h, c                                        ; $4f0d: $61
	ld   h, l                                        ; $4f0e: $65
	ld   l, c                                        ; $4f0f: $69
	ld   d, l                                        ; $4f10: $55
	ld   e, c                                        ; $4f11: $59
	ld   e, l                                        ; $4f12: $5d
	ld   c, c                                        ; $4f13: $49
	ld   c, l                                        ; $4f14: $4d
	ld   d, c                                        ; $4f15: $51
	add  h                                           ; $4f16: $84
	adc  b                                           ; $4f17: $88
	adc  h                                           ; $4f18: $8c
	ld   a, b                                        ; $4f19: $78
	ld   a, h                                        ; $4f1a: $7c
	add  b                                           ; $4f1b: $80
	ld   l, h                                        ; $4f1c: $6c
	ld   (hl), b                                     ; $4f1d: $70
	ld   (hl), h                                     ; $4f1e: $74
	ld   a, $42                                      ; $4f1f: $3e $42
	ld   b, (hl)                                     ; $4f21: $46
	ldd  (hl), a                                     ; $4f22: $32
	ld   (hl), $3a                                   ; $4f23: $36 $3a
	ld   h, $2a                                      ; $4f25: $26 $2a
	ld   l, $86                                      ; $4f27: $2e $86
	adc  d                                           ; $4f29: $8a
	adc  (hl)                                        ; $4f2a: $8e
	ld   a, d                                        ; $4f2b: $7a
	ld   a, (hl)                                     ; $4f2c: $7e
	add  d                                           ; $4f2d: $82
	ld   l, (hl)                                     ; $4f2e: $6e
	ld   (hl), d                                     ; $4f2f: $72
	.db  $76                                         ; $4f30: $76
	add  h                                           ; $4f31: $84
	adc  b                                           ; $4f32: $88
	adc  h                                           ; $4f33: $8c
	ld   a, b                                        ; $4f34: $78
	ld   a, h                                        ; $4f35: $7c
	add  b                                           ; $4f36: $80
	ld   l, h                                        ; $4f37: $6c
	ld   (hl), b                                     ; $4f38: $70
	ld   (hl), h                                     ; $4f39: $74
	ld   c, b                                        ; $4f3a: $48
	ld   bc, $c0c0                                   ; $4f3b: $01 $c0 $c0
	call nz, $c0c4                                   ; $4f3e: $c4 $c4 $c0
	ret  nz                                          ; $4f41: $c0

	call nz, $02c4                                   ; $4f42: $c4 $c4 $02
	sbc  h                                           ; $4f45: $9c
	and  b                                           ; $4f46: $a0
	and  h                                           ; $4f47: $a4
	and  b                                           ; $4f48: $a0
	sbc  h                                           ; $4f49: $9c
	ld   bc, $a29e                                   ; $4f4a: $01 $9e $a2
	and  (hl)                                        ; $4f4d: $a6
	and  d                                           ; $4f4e: $a2
	sbc  (hl)                                        ; $4f4f: $9e
	ld   bc, $01c8                                   ; $4f50: $01 $c8 $01
	jp   z, $bd01                                    ; $4f53: $ca $01 $bd

	cp   l                                           ; $4f56: $bd
	ld   a, l                                        ; $4f57: $7d
	ld   a, l                                        ; $4f58: $7d
	ld   bc, $6763                                   ; $4f59: $01 $63 $67
	ld   l, e                                        ; $4f5c: $6b
	ld   d, a                                        ; $4f5d: $57
	ld   e, e                                        ; $4f5e: $5b
	ld   e, a                                        ; $4f5f: $5f
	ld   c, e                                        ; $4f60: $4b
	ld   c, a                                        ; $4f61: $4f
	ld   d, e                                        ; $4f62: $53
	ld   a, $42                                      ; $4f63: $3e $42
	ld   b, (hl)                                     ; $4f65: $46
	ldd  (hl), a                                     ; $4f66: $32
	ld   (hl), $3a                                   ; $4f67: $36 $3a
	ld   h, $2a                                      ; $4f69: $26 $2a
	ld   l, $60                                      ; $4f6b: $2e $60
	ld   h, h                                        ; $4f6d: $64
	ld   l, b                                        ; $4f6e: $68
	ld   d, h                                        ; $4f6f: $54
	ld   e, b                                        ; $4f70: $58
	ld   e, h                                        ; $4f71: $5c
	ld   c, b                                        ; $4f72: $48
	ld   c, h                                        ; $4f73: $4c
	ld   d, b                                        ; $4f74: $50
	adc  h                                           ; $4f75: $8c
	sub  b                                           ; $4f76: $90
	sbc  b                                           ; $4f77: $98
	ld   d, b                                        ; $4f78: $50
	ld   (bc), a                                     ; $4f79: $02
	xor  e                                           ; $4f7a: $ab
	xor  a                                           ; $4f7b: $af
	or   e                                           ; $4f7c: $b3
	sbc  a                                           ; $4f7d: $9f
	and  e                                           ; $4f7e: $a3
	and  a                                           ; $4f7f: $a7
	sub  e                                           ; $4f80: $93
	sub  a                                           ; $4f81: $97
	sbc  e                                           ; $4f82: $9b
	set  1, a                                        ; $4f83: $cb $cf
	ld   (bc), a                                     ; $4f85: $02
	ret  c                                           ; $4f86: $d8

	ld   bc, $aeaa                                   ; $4f87: $01 $aa $ae
	or   d                                           ; $4f8a: $b2
	xor  d                                           ; $4f8b: $aa
	xor  (hl)                                        ; $4f8c: $ae
	or   d                                           ; $4f8d: $b2
	xor  d                                           ; $4f8e: $aa
	xor  (hl)                                        ; $4f8f: $ae
	or   d                                           ; $4f90: $b2
	add  $a6                                         ; $4f91: $c6 $a6
	ld   (bc), a                                     ; $4f93: $02
	add  $01                                         ; $4f94: $c6 $01
	xor  (hl)                                        ; $4f96: $ae
	ld   bc, $eec2                                   ; $4f97: $01 $c2 $ee
	ld   bc, $8cc6                                   ; $4f9a: $01 $c6 $8c
	ld   (bc), a                                     ; $4f9d: $02
	ld   a, $42                                      ; $4f9e: $3e $42
	ld   b, (hl)                                     ; $4fa0: $46
	ldd  (hl), a                                     ; $4fa1: $32
	ld   (hl), $3a                                   ; $4fa2: $36 $3a
	ld   h, $2a                                      ; $4fa4: $26 $2a
	ld   l, $60                                      ; $4fa6: $2e $60
	ld   h, h                                        ; $4fa8: $64
	ld   l, b                                        ; $4fa9: $68
	ld   d, h                                        ; $4faa: $54
	ld   e, b                                        ; $4fab: $58
	ld   e, h                                        ; $4fac: $5c
	ld   c, b                                        ; $4fad: $48
	ld   c, h                                        ; $4fae: $4c
	ld   d, b                                        ; $4faf: $50
	add  h                                           ; $4fb0: $84
	adc  b                                           ; $4fb1: $88
	adc  h                                           ; $4fb2: $8c
	ld   a, b                                        ; $4fb3: $78
	ld   a, h                                        ; $4fb4: $7c
	add  b                                           ; $4fb5: $80
	ld   l, h                                        ; $4fb6: $6c
	ld   (hl), b                                     ; $4fb7: $70
	ld   (hl), h                                     ; $4fb8: $74
	inc  a                                           ; $4fb9: $3c
	ld   b, b                                        ; $4fba: $40
	ld   b, h                                        ; $4fbb: $44
	jr   nc, $34                                     ; $4fbc: $30 $34

	.db $38 $24

	.db $28 $2c

	jp   z, $9ece                                    ; $4fc2: $ca $ce $9e

	xor  (hl)                                        ; $4fc5: $ae
	ld   (bc), a                                     ; $4fc6: $02
	inc  a                                           ; $4fc7: $3c
	ld   b, b                                        ; $4fc8: $40
	ld   b, h                                        ; $4fc9: $44
	.db $30 $34

	jr   c, $24                                      ; $4fcc: $38 $24

	.db $28 $2c

	dec  e                                           ; $4fd0: $1d
	ld   bc, $eeea                                   ; $4fd1: $01 $ea $ee
	ld   ($eeea), a                                  ; $4fd4: $ea $ea $ee
	ld   ($eeea), a                                  ; $4fd7: $ea $ea $ee
	.db $ea
