; Disassembly of "OR"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3


;;
	dec  e                                           ; $4d3e: $1d
	ld   bc, $a840                                   ; $4d3f: $01 $40 $a8
	xor  h                                           ; $4d42: $ac
	xor  b                                           ; $4d43: $a8
	ld   (bc), a                                     ; $4d44: $02
	inc  h                                           ; $4d45: $24
	ld   bc, $0128                                   ; $4d46: $01 $28 $01
	inc  l                                           ; $4d49: $2c
	ld   bc, $0130                                   ; $4d4a: $01 $30 $01
	inc  (hl)                                        ; $4d4d: $34
	ld   bc, $0164                                   ; $4d4e: $01 $64 $01
	add  b                                           ; $4d51: $80
	ld   bc, $0184                                   ; $4d52: $01 $84 $01
	adc  b                                           ; $4d55: $88
	ld   bc, $018c                                   ; $4d56: $01 $8c $01
	sub  b                                           ; $4d59: $90
	ld   bc, $0194                                   ; $4d5a: $01 $94 $01
	sbc  h                                           ; $4d5d: $9c
	ld   bc, $01a0                                   ; $4d5e: $01 $a0 $01
	and  a                                           ; $4d61: $a7
	and  a                                           ; $4d62: $a7
	res  4, a                                        ; $4d63: $cb $a7
	and  a                                           ; $4d65: $a7
	and  a                                           ; $4d66: $a7
	set  1, e                                        ; $4d67: $cb $cb
	ld   (bc), a                                     ; $4d69: $02
	or   b                                           ; $4d6a: $b0
	ld   bc, $01c0                                   ; $4d6b: $01 $c0 $01
	jp   $c801                                       ; $4d6e: $c3 $01 $c8


	ld   bc, $01cb                                   ; $4d71: $01 $cb $01
	call z, $c401                                    ; $4d74: $cc $01 $c4
	ld   bc, $01d4                                   ; $4d77: $01 $d4 $01
	call c, $e001                                    ; $4d7a: $dc $01 $e0
	ld   bc, $01e4                                   ; $4d7d: $01 $e4 $01

npc00_word0data:
	.db $f0 $f0 $f0 $f0 $d8 $01


	.db $e8 $ec ; $4d86
	add  sp, -$18                                    ; $4d88: $e8 $e8
	.db  $ec                                         ; $4d8a: $ec
	add  sp, -$18                                    ; $4d8b: $e8 $e8
	.db  $ec                                         ; $4d8d: $ec
	add  sp, -$43                                    ; $4d8e: $e8 $bd
	cp   l                                           ; $4d90: $bd
	ld   a, l                                        ; $4d91: $7d
	ld   a, l                                        ; $4d92: $7d
	.db $01


npc04_word0data:
	.db $e0 $e0
	ldh  (<$e2), a                                   ; $4d96: $e0 $e2
	ld   ($ff00+c), a                                ; $4d98: $e2
	ld   ($ff00+c), a                                ; $4d99: $e2
	.db  $e3                                         ; $4d9a: $e3
	.db  $e3                                         ; $4d9b: $e3
	.db  $e3                                         ; $4d9c: $e3
	sbc  h                                           ; $4d9d: $9c
	and  b                                           ; $4d9e: $a0
	and  h                                           ; $4d9f: $a4
	ld   (bc), a                                     ; $4da0: $02
	sbc  l                                           ; $4da1: $9d
	and  c                                           ; $4da2: $a1
	and  l                                           ; $4da3: $a5
	ld   (bc), a                                     ; $4da4: $02
	sbc  (hl)                                        ; $4da5: $9e
	and  d                                           ; $4da6: $a2
	and  (hl)                                        ; $4da7: $a6
	ld   (bc), a                                     ; $4da8: $02
	sbc  a                                           ; $4da9: $9f
	and  e                                           ; $4daa: $a3
	and  a                                           ; $4dab: $a7
	ld   (bc), a                                     ; $4dac: $02
	inc  a                                           ; $4dad: $3c
	ld   b, b                                        ; $4dae: $40
	ld   b, h                                        ; $4daf: $44
	jr   nc, jr_007_4de6                             ; $4db0: $30 $34

	jr   c, jr_007_4dd8                              ; $4db2: $38 $24

	jr   z, jr_007_4de2                              ; $4db4: $28 $2c

	dec  a                                           ; $4db6: $3d
	ld   b, c                                        ; $4db7: $41
	ld   b, l                                        ; $4db8: $45
	ld   sp, $3935                                   ; $4db9: $31 $35 $39
	dec  h                                           ; $4dbc: $25
	add  hl, hl                                      ; $4dbd: $29
	dec  l                                           ; $4dbe: $2d
	ld   a, $42                                      ; $4dbf: $3e $42
	ld   b, (hl)                                     ; $4dc1: $46
	ldd  (hl), a                                     ; $4dc2: $32
	ld   (hl), $3a                                   ; $4dc3: $36 $3a
	ld   h, $2a                                      ; $4dc5: $26 $2a
	ld   l, $3f                                      ; $4dc7: $2e $3f
	ld   b, e                                        ; $4dc9: $43
	ld   b, a                                        ; $4dca: $47
	inc  sp                                          ; $4dcb: $33
	scf                                              ; $4dcc: $37
	dec  sp                                          ; $4dcd: $3b
	daa                                              ; $4dce: $27
	dec  hl                                          ; $4dcf: $2b
	cpl                                              ; $4dd0: $2f
	ld   h, b                                        ; $4dd1: $60
	ld   h, h                                        ; $4dd2: $64
	ld   l, b                                        ; $4dd3: $68
	ld   d, h                                        ; $4dd4: $54
	ld   e, b                                        ; $4dd5: $58
	ld   e, h                                        ; $4dd6: $5c
	ld   c, b                                        ; $4dd7: $48

jr_007_4dd8:
	ld   c, h                                        ; $4dd8: $4c
	ld   d, b                                        ; $4dd9: $50
	ld   h, e                                        ; $4dda: $63
	ld   h, a                                        ; $4ddb: $67
	ld   l, e                                        ; $4ddc: $6b
	ld   d, a                                        ; $4ddd: $57
	ld   e, e                                        ; $4dde: $5b
	ld   e, a                                        ; $4ddf: $5f
	ld   c, e                                        ; $4de0: $4b
	ld   c, a                                        ; $4de1: $4f

jr_007_4de2:
	ld   d, e                                        ; $4de2: $53
	add  h                                           ; $4de3: $84
	adc  b                                           ; $4de4: $88
	adc  h                                           ; $4de5: $8c

jr_007_4de6:
	ld   a, b                                        ; $4de6: $78
	ld   a, h                                        ; $4de7: $7c
	add  b                                           ; $4de8: $80
	ld   l, h                                        ; $4de9: $6c
	ld   (hl), b                                     ; $4dea: $70
	ld   (hl), h                                     ; $4deb: $74
	add  (hl)                                        ; $4dec: $86
	adc  d                                           ; $4ded: $8a
	adc  (hl)                                        ; $4dee: $8e
	ld   a, d                                        ; $4def: $7a
	ld   a, (hl)                                     ; $4df0: $7e
	add  d                                           ; $4df1: $82
	ld   l, (hl)                                     ; $4df2: $6e
	ld   (hl), d                                     ; $4df3: $72
	.db  $76                                         ; $4df4: $76
	call z, $cccc                                    ; $4df5: $cc $cc $cc
	ret  nc                                          ; $4df8: $d0

	ret  nc                                          ; $4df9: $d0

	ret  nc                                          ; $4dfa: $d0

	call nc, $d4d4                                   ; $4dfb: $d4 $d4 $d4
	sbc  a                                           ; $4dfe: $9f
	sbc  a                                           ; $4dff: $9f
	and  e                                           ; $4e00: $a3
	and  e                                           ; $4e01: $a3
	and  a                                           ; $4e02: $a7
	and  a                                           ; $4e03: $a7
	ld   bc, $a9a9                                   ; $4e04: $01 $a9 $a9
	xor  l                                           ; $4e07: $ad
	xor  l                                           ; $4e08: $ad
	or   c                                           ; $4e09: $b1
	or   c                                           ; $4e0a: $b1
	ld   (bc), a                                     ; $4e0b: $02
	sub  b                                           ; $4e0c: $90
	sub  h                                           ; $4e0d: $94
	sbc  b                                           ; $4e0e: $98
	ld   (bc), a                                     ; $4e0f: $02
	sbc  l                                           ; $4e10: $9d
	sbc  l                                           ; $4e11: $9d
	sbc  l                                           ; $4e12: $9d
	and  c                                           ; $4e13: $a1
	and  c                                           ; $4e14: $a1
	and  c                                           ; $4e15: $a1
	and  l                                           ; $4e16: $a5
	and  l                                           ; $4e17: $a5
	and  l                                           ; $4e18: $a5
	ld   c, c                                        ; $4e19: $49
	ld   bc, $0189                                   ; $4e1a: $01 $89 $01
	inc  a                                           ; $4e1d: $3c
	ld   b, b                                        ; $4e1e: $40
	ld   b, h                                        ; $4e1f: $44
	ld   (bc), a                                     ; $4e20: $02
	ld   l, a                                        ; $4e21: $6f
	ld   (hl), e                                     ; $4e22: $73
	ld   (hl), a                                     ; $4e23: $77
	ld   l, a                                        ; $4e24: $6f
	ld   bc, $726e                                   ; $4e25: $01 $6e $72
	.db  $76                                         ; $4e28: $76
	ld   l, (hl)                                     ; $4e29: $6e
	ld   bc, $9292                                   ; $4e2a: $01 $92 $92
	sub  d                                           ; $4e2d: $92
	sub  (hl)                                        ; $4e2e: $96
	sub  (hl)                                        ; $4e2f: $96
	sub  (hl)                                        ; $4e30: $96
	sbc  d                                           ; $4e31: $9a
	sbc  d                                           ; $4e32: $9a
	sbc  d                                           ; $4e33: $9a
	sub  (hl)                                        ; $4e34: $96
	sub  (hl)                                        ; $4e35: $96
	sub  (hl)                                        ; $4e36: $96
	ld   (bc), a                                     ; $4e37: $02
	ld   a, (hl)                                     ; $4e38: $7e
	ld   a, d                                        ; $4e39: $7a
	add  d                                           ; $4e3a: $82
	ld   a, d                                        ; $4e3b: $7a
	ld   (bc), a                                     ; $4e3c: $02
	sub  e                                           ; $4e3d: $93
	sub  a                                           ; $4e3e: $97
	sbc  e                                           ; $4e3f: $9b
	ld   bc, $4404                                   ; $4e40: $01 $04 $44
	ld   c, b                                        ; $4e43: $48
	ld   (bc), a                                     ; $4e44: $02
	sub  d                                           ; $4e45: $92
	sub  (hl)                                        ; $4e46: $96
	sbc  d                                           ; $4e47: $9a
	ld   (bc), a                                     ; $4e48: $02
	sbc  h                                           ; $4e49: $9c
	and  b                                           ; $4e4a: $a0
	sbc  h                                           ; $4e4b: $9c
	and  h                                           ; $4e4c: $a4
	ld   (bc), a                                     ; $4e4d: $02
	xor  b                                           ; $4e4e: $a8
	xor  h                                           ; $4e4f: $ac
	ld   bc, $ccc8                                   ; $4e50: $01 $c8 $cc
	ld   bc, $01cd                                   ; $4e53: $01 $cd $01
	ld   h, e                                        ; $4e56: $63
	ld   h, a                                        ; $4e57: $67
	ld   l, e                                        ; $4e58: $6b
	ld   c, e                                        ; $4e59: $4b
	ld   c, a                                        ; $4e5a: $4f
	ld   d, e                                        ; $4e5b: $53
	ld   c, e                                        ; $4e5c: $4b
	ld   c, a                                        ; $4e5d: $4f
	ld   d, e                                        ; $4e5e: $53
	ld   c, l                                        ; $4e5f: $4d
	ld   bc, $019e                                   ; $4e60: $01 $9e $01
	and  d                                           ; $4e63: $a2
	.db $01
