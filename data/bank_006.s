; Disassembly of "OR"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3


data_06_094b:
	or   h                                           ; $494b: $b4
	adc  b                                           ; $494c: $88
	sub  h                                           ; $494d: $94
	ld   c, d                                        ; $494e: $4a
	ld   c, l                                        ; $494f: $4d
	add  $03                                         ; $4950: $c6 $03
	jp   nz, $b5d0                                   ; $4952: $c2 $d0 $b5

	dec  bc                                          ; $4955: $0b
	ld   l, c                                        ; $4956: $69
	call c, $5fca                                    ; $4957: $dc $ca $5f
	or   $df                                         ; $495a: $f6 $df
	ld   c, $f3                                      ; $495c: $0e $f3
	ld   e, l                                        ; $495e: $5d
	add  (hl)                                        ; $495f: $86
	call nz, $970d                                   ; $4960: $c4 $0d $97
	ld   (hl), a                                     ; $4963: $77
	ld   c, h                                        ; $4964: $4c
	sbc  a                                           ; $4965: $9f
	and  l                                           ; $4966: $a5
	ld   b, e                                        ; $4967: $43
	ld   b, a                                        ; $4968: $47
	call nc, $96d3                                   ; $4969: $d4 $d3 $96
	.db  $fc                                         ; $496c: $fc
	jp   hl                                          ; $496d: $e9


	ldd  a, (hl)                                     ; $496e: $3a
	or   c                                           ; $496f: $b1
	ld   a, ($883e)                                  ; $4970: $fa $3e $88

$4973:
	dec  de                                          ; $4973: $1b

jr_00c_4974:
	rst  $38                                         ; $4974: $ff
	xor  l                                           ; $4975: $ad
	inc  b                                           ; $4976: $04
	sub  e                                           ; $4977: $93
	add  hl, de                                      ; $4978: $19
	ld   a, (de)                                     ; $4979: $1a
	call z, $0b48                                    ; $497a: $cc $48 $0b
	ld   c, e                                        ; $497d: $4b
	ld   h, c                                        ; $497e: $61
	ld   c, l                                        ; $497f: $4d
	ld   a, ($ff00+c)                                ; $4980: $f2
	ld   a, ($4766)                                  ; $4981: $fa $66 $47
	add  hl, hl                                      ; $4984: $29
	add  hl, hl                                      ; $4985: $29
	and  l                                           ; $4986: $a5
	ld   l, b                                        ; $4987: $68
	ld   l, c                                        ; $4988: $69
	or   (hl)                                        ; $4989: $b6
	ld   d, e                                        ; $498a: $53
	and  d                                           ; $498b: $a2
	dec  (hl)                                        ; $498c: $35
	cpl                                              ; $498d: $2f
	sub  l                                           ; $498e: $95
	inc  d                                           ; $498f: $14
	ld   (hl), l                                     ; $4990: $75
	rst  $20                                         ; $4991: $e7
	ld   b, d                                        ; $4992: $42
	ret                                              ; $4993: $c9


	ld   h, b                                        ; $4994: $60
	ld   c, d                                        ; $4995: $4a
	.db  $eb                                         ; $4996: $eb
	and  c                                           ; $4997: $a1
	and  b                                           ; $4998: $a0
	ld   l, l                                        ; $4999: $6d
	add  hl, de                                      ; $499a: $19
	adc  a                                           ; $499b: $8f
	or   c                                           ; $499c: $b1
	jp   hl                                          ; $499d: $e9


	push de                                          ; $499e: $d5
	dec  b                                           ; $499f: $05
	adc  e                                           ; $49a0: $8b
	ld   ($ad6e), a                                  ; $49a1: $ea $6e $ad
	add  b                                           ; $49a4: $80
	add  e                                           ; $49a5: $83
	.db  $76                                         ; $49a6: $76
	ld   e, d                                        ; $49a7: $5a

jr_00c_49a8:
	ld   h, a                                        ; $49a8: $67
	ld   b, l                                        ; $49a9: $45
	ld   c, $3e                                      ; $49aa: $0e $3e
	ld   a, ($630f)                                  ; $49ac: $fa $0f $63
	ld   e, l                                        ; $49af: $5d
	ld   a, l                                        ; $49b0: $7d
	daa                                              ; $49b1: $27
	ld   a, c                                        ; $49b2: $79
	ld   b, c                                        ; $49b3: $41
	and  b                                           ; $49b4: $a0
	adc  d                                           ; $49b5: $8a
	jr   z, jr_00c_49a8                              ; $49b6: $28 $f0

	and  a                                           ; $49b8: $a7
	add  c                                           ; $49b9: $81
	ld   h, e                                        ; $49ba: $63
	dec  de                                          ; $49bb: $1b
	ret  z                                           ; $49bc: $c8

	ld   (hl), l                                     ; $49bd: $75
	ret  nz                                          ; $49be: $c0

	sbc  b                                           ; $49bf: $98
	push de                                          ; $49c0: $d5
	inc  b                                           ; $49c1: $04
	dec  (hl)                                        ; $49c2: $35
	ld   (de), a                                     ; $49c3: $12
	ld   a, (de)                                     ; $49c4: $1a
	ld   d, h                                        ; $49c5: $54
	jr   nz, jr_00c_49c8                             ; $49c6: $20 $00

jr_00c_49c8:
	adc  c                                           ; $49c8: $89
	xor  b                                           ; $49c9: $a8
	adc  e                                           ; $49ca: $8b
	.db  $d3                                         ; $49cb: $d3
	inc  d                                           ; $49cc: $14
	ld   sp, $74ad                                   ; $49cd: $31 $ad $74
	ld   e, e                                        ; $49d0: $5b
	ld   h, $b4                                      ; $49d1: $26 $b4
	.db  $ed                                         ; $49d3: $ed
	add  a                                           ; $49d4: $87
	ld   d, $c1                                      ; $49d5: $16 $c1
	ld   h, (hl)                                     ; $49d7: $66
	.db  $76                                         ; $49d8: $76
	ld   a, l                                        ; $49d9: $7d
	dec  (hl)                                        ; $49da: $35
	ld   d, h                                        ; $49db: $54
	jr   jr_00c_4974                                 ; $49dc: $18 $96

	dec  hl                                          ; $49de: $2b
	.db  $ed                                         ; $49df: $ed
	add  hl, de                                      ; $49e0: $19
	ld   (hl), c                                     ; $49e1: $71
	ld   b, l                                        ; $49e2: $45
	rst  $18                                         ; $49e3: $df
	ret  nz                                          ; $49e4: $c0

	ld   b, l                                        ; $49e5: $45
	xor  h                                           ; $49e6: $ac
	ld   b, c                                        ; $49e7: $41
	rla                                              ; $49e8: $17
	rlca                                             ; $49e9: $07
	ld   d, d                                        ; $49ea: $52
	jp   z, $3c4c                                    ; $49eb: $ca $4c $3c

	ld   a, e                                        ; $49ee: $7b
	ld   b, c                                        ; $49ef: $41
	ld   d, a                                        ; $49f0: $57
	dec  bc                                          ; $49f1: $0b
	ld   a, e                                        ; $49f2: $7b
	inc  (hl)                                        ; $49f3: $34
	.db  $dd                                         ; $49f4: $dd
	sub  (hl)                                        ; $49f5: $96
	pop  bc                                          ; $49f6: $c1
	.db  $ed                                         ; $49f7: $ed
	ld   d, h                                        ; $49f8: $54
	adc  d                                           ; $49f9: $8a
	inc  d                                           ; $49fa: $14
	and  d                                           ; $49fb: $a2
	ld   l, b                                        ; $49fc: $68
	push af                                          ; $49fd: $f5
	dec  e                                           ; $49fe: $1d
	.db  $ec                                         ; $49ff: $ec
	sbc  (hl)                                        ; $4a00: $9e
	ld   e, c                                        ; $4a01: $59
	ld   h, $7a                                      ; $4a02: $26 $7a

jr_00c_4a04:
	jr   c, jr_00c_4a04                              ; $4a04: $38 $fe

	ld   hl, $5807                                   ; $4a06: $21 $07 $58
	adc  h                                           ; $4a09: $8c
	.db  $ec                                         ; $4a0a: $ec
	adc  c                                           ; $4a0b: $89
	ld   l, b                                        ; $4a0c: $68
	ret  c                                           ; $4a0d: $d8

	.db  $d3                                         ; $4a0e: $d3
	xor  h                                           ; $4a0f: $ac
	cp   b                                           ; $4a10: $b8
	rst  $38                                         ; $4a11: $ff
	ld   d, (hl)                                     ; $4a12: $56
	ld   a, (hl)                                     ; $4a13: $7e
	ld   l, c                                        ; $4a14: $69
	or   c                                           ; $4a15: $b1
	dec  l                                           ; $4a16: $2d
	ld   l, h                                        ; $4a17: $6c
	adc  e                                           ; $4a18: $8b
	ret  nc                                          ; $4a19: $d0

	adc  d                                           ; $4a1a: $8a
	ld   l, l                                        ; $4a1b: $6d
	add  d                                           ; $4a1c: $82
	ldd  a, (hl)                                     ; $4a1d: $3a
	sbc  (hl)                                        ; $4a1e: $9e
	ld   a, l                                        ; $4a1f: $7d
	xor  (hl)                                        ; $4a20: $ae
	ld   ($ff00+c), a                                ; $4a21: $e2
	ld   e, (hl)                                     ; $4a22: $5e
	ld   c, l                                        ; $4a23: $4d
	ld   c, d                                        ; $4a24: $4a
	ld   h, $87                                      ; $4a25: $26 $87
	add  hl, sp                                      ; $4a27: $39
	sub  l                                           ; $4a28: $95
	ld   e, l                                        ; $4a29: $5d
	ldh  (<$7a), a                                   ; $4a2a: $e0 $7a
	jr   nc, -$51                                    ; $4a2c: $30 $af

	cp   a                                           ; $4a2e: $bf
	sbc  l                                           ; $4a2f: $9d
	ret  z                                           ; $4a30: $c8

	add  hl, hl                                      ; $4a31: $29
	adc  $33                                         ; $4a32: $ce $33
	.db  $f4                                         ; $4a34: $f4
	.db  $10                                         ; $4a35: $10
	rrca                                             ; $4a36: $0f
	bit  4, c                                        ; $4a37: $cb $61
	.db  $76                                         ; $4a39: $76
	ld   e, $1d                                      ; $4a3a: $1e $1d
	inc  l                                           ; $4a3c: $2c
	inc  c                                           ; $4a3d: $0c
	or   (hl)                                        ; $4a3e: $b6
	adc  b                                           ; $4a3f: $88
	adc  a                                           ; $4a40: $8f
	scf                                              ; $4a41: $37
	ld   (hl), a                                     ; $4a42: $77
	cp   a                                           ; $4a43: $bf
	ret  nz                                          ; $4a44: $c0

	ld   h, (hl)                                     ; $4a45: $66
	rst  $20                                         ; $4a46: $e7
	cp   (hl)                                        ; $4a47: $be
	ld   d, $a2                                      ; $4a48: $16 $a2
	or   (hl)                                        ; $4a4a: $b6
	inc  b                                           ; $4a4b: $04
	ld   l, (hl)                                     ; $4a4c: $6e
	ld   h, (hl)                                     ; $4a4d: $66
	ld   b, (hl)                                     ; $4a4e: $46
	.db  $fc                                         ; $4a4f: $fc
	call $6ab2                               ; $4a50: $cd $b2 $6a
	cp   h                                           ; $4a53: $bc
	ld   b, (hl)                                     ; $4a54: $46
	ld   e, e                                        ; $4a55: $5b
	ld   l, (hl)                                     ; $4a56: $6e
	pop  af                                          ; $4a57: $f1
	rra                                              ; $4a58: $1f
	and  l                                           ; $4a59: $a5
	ld   e, c                                        ; $4a5a: $59
	ld   a, (de)                                     ; $4a5b: $1a
	cpl                                              ; $4a5c: $2f
	inc  de                                          ; $4a5d: $13
	ld   l, (hl)                                     ; $4a5e: $6e
	push af                                          ; $4a5f: $f5
	adc  d                                           ; $4a60: $8a
	ld   a, (hl)                                     ; $4a61: $7e
	ld   sp, hl                                      ; $4a62: $f9
	scf                                              ; $4a63: $37
	ld   h, c                                        ; $4a64: $61
	ld   h, l                                        ; $4a65: $65
	ld   c, b                                        ; $4a66: $48
	add  b                                           ; $4a67: $80
	inc  hl                                          ; $4a68: $23
	add  h                                           ; $4a69: $84
	rst  $30                                         ; $4a6a: $f7
	adc  (hl)                                        ; $4a6b: $8e
	add  sp, -$58                                    ; $4a6c: $e8 $a8
	ld   (hl), b                                     ; $4a6e: $70
	or   c                                           ; $4a6f: $b1
	.db  $10                                         ; $4a70: $10
	pop  bc                                          ; $4a71: $c1
	or   e                                           ; $4a72: $b3
	ld   a, a                                        ; $4a73: $7f
	daa                                              ; $4a74: $27
	add  hl, sp                                      ; $4a75: $39
	ld   d, e                                        ; $4a76: $53
	ret  z                                           ; $4a77: $c8

	inc  c                                           ; $4a78: $0c

jr_00c_4a79:
	add  h                                           ; $4a79: $84
	pop  bc                                          ; $4a7a: $c1
	call z, $f953                                    ; $4a7b: $cc $53 $f9
	call $e7ac                                       ; $4a7e: $cd $ac $e7
	ldh  (<$6a), a                                   ; $4a81: $e0 $6a
	rra                                              ; $4a83: $1f
	.db  $f4                                         ; $4a84: $f4
	call z, $66b2                            ; $4a85: $cc $b2 $66
	inc  b                                           ; $4a88: $04
	ldi  a, (hl)                                     ; $4a89: $2a
	ldi  a, (hl)                                     ; $4a8a: $2a
	add  d                                           ; $4a8b: $82
	ld   h, a                                        ; $4a8c: $67
	dec  de                                          ; $4a8d: $1b
	ld   b, (hl)                                     ; $4a8e: $46
	and  h                                           ; $4a8f: $a4
	reti                                             ; $4a90: $d9


	ld   a, a                                        ; $4a91: $7f
	jr   nc, jr_00c_4a79                             ; $4a92: $30 $e5

	ld   e, a                                        ; $4a94: $5f
	ld   d, d                                        ; $4a95: $52
	push bc                                          ; $4a96: $c5
	scf                                              ; $4a97: $37
	ld   (hl), d                                     ; $4a98: $72
	inc  a                                           ; $4a99: $3c
	ldh  (<$9c), a                                   ; $4a9a: $e0 $9c
	ld   e, a                                        ; $4a9c: $5f
	ld   h, e                                        ; $4a9d: $63
	call c, $ee96                                    ; $4a9e: $dc $96 $ee
	add  h                                           ; $4aa1: $84
	ld   d, h                                        ; $4aa2: $54
	sbc  $42                                         ; $4aa3: $de $42
	ld   b, d                                        ; $4aa5: $42
	dec  l                                           ; $4aa6: $2d
	ld   e, b                                        ; $4aa7: $58
	nop                                              ; $4aa8: $00
	cp   (hl)                                        ; $4aa9: $be
	rst  $10                                         ; $4aaa: $d7
	ld   b, a                                        ; $4aab: $47
	or   e                                           ; $4aac: $b3
	ld   h, a                                        ; $4aad: $67
	rst  $08                                         ; $4aae: $cf
	cp   l                                           ; $4aaf: $bd
	ld   (hl), b                                     ; $4ab0: $70
	inc  de                                          ; $4ab1: $13
	ld   l, c                                        ; $4ab2: $69
	ld   d, (hl)                                     ; $4ab3: $56
	or   l                                           ; $4ab4: $b5
	ld   c, a                                        ; $4ab5: $4f
	call z, $9726                                    ; $4ab6: $cc $26 $97
	.db  $f4                                         ; $4ab9: $f4
	ld   a, $f0                                      ; $4aba: $3e $f0
	dec  e                                           ; $4abc: $1d
	ei                                               ; $4abd: $fb
	and  d                                           ; $4abe: $a2
	sbc  c                                           ; $4abf: $99
	rst  $20                                         ; $4ac0: $e7
	sub  e                                           ; $4ac1: $93
	ld   a, $dc                                      ; $4ac2: $3e $dc
	inc  de                                          ; $4ac4: $13
	ld   (hl), b                                     ; $4ac5: $70
	jp   nz, $603e                           ; $4ac6: $c2 $3e $60

	ld   h, l                                        ; $4ac9: $65
	add  (hl)                                        ; $4aca: $86
	ld   b, l                                        ; $4acb: $45
	sub  h                                           ; $4acc: $94
	dec  (hl)                                        ; $4acd: $35
	inc  d                                           ; $4ace: $14
	push hl                                          ; $4acf: $e5
	inc  e                                           ; $4ad0: $1c
	and  a                                           ; $4ad1: $a7
	and  $3b                                         ; $4ad2: $e6 $3b
	di                                               ; $4ad4: $f3
	ret  c                                           ; $4ad5: $d8

	ld   (hl), b                                     ; $4ad6: $70
	ld   a, l                                        ; $4ad7: $7d
	call nz, $61d5                           ; $4ad8: $c4 $d5 $61
	ldd  (hl), a                                     ; $4adb: $32
	ld   d, e                                        ; $4adc: $53
	ld   l, c                                        ; $4add: $69
	daa                                              ; $4ade: $27
	sbc  (hl)                                        ; $4adf: $9e
	add  hl, de                                      ; $4ae0: $19
	inc  (hl)                                        ; $4ae1: $34
	or   c                                           ; $4ae2: $b1
	add  c                                           ; $4ae3: $81
	ld   l, $fd                                      ; $4ae4: $2e $fd
	ld   a, b                                        ; $4ae6: $78
	ld   bc, $496d                                   ; $4ae7: $01 $6d $49
	ret  nz                                          ; $4aea: $c0

	.db  $e4                                         ; $4aeb: $e4
	jp   nc, $1b2d                                   ; $4aec: $d2 $2d $1b

	ld   (bc), a                                     ; $4aef: $02
	ld   h, $60                                      ; $4af0: $26 $60
	jr   nc, -$06                                    ; $4af2: $30 $fa

	rst  $18                                         ; $4af4: $df
	sub  h                                           ; $4af5: $94
	cp   d                                           ; $4af6: $ba
	dec  h                                           ; $4af7: $25
	ld   b, c                                        ; $4af8: $41
	rlca                                             ; $4af9: $07
	.db  $d3                                         ; $4afa: $d3
	ret  z                                           ; $4afb: $c8

	jp   z, $7355                            ; $4afc: $ca $55 $73

	adc  (hl)                                        ; $4aff: $8e
	call $3490                                       ; $4b00: $cd $90 $34
	dec  (hl)                                        ; $4b03: $35
	ld   e, l                                        ; $4b04: $5d
	sub  d                                           ; $4b05: $92
	ld   e, b                                        ; $4b06: $58
	add  a                                           ; $4b07: $87
	ld   l, h                                        ; $4b08: $6c
	sub  d                                           ; $4b09: $92
	inc  c                                           ; $4b0a: $0c
	adc  h                                           ; $4b0b: $8c
	inc  (hl)                                        ; $4b0c: $34
	or   $ee                                         ; $4b0d: $f6 $ee
	cp   $d6                                         ; $4b0f: $fe $d6
	ld   l, b                                        ; $4b11: $68
	adc  $fd                                         ; $4b12: $ce $fd
	ld   b, d                                        ; $4b14: $42
	inc  l                                           ; $4b15: $2c
	or   c                                           ; $4b16: $b1
	inc  b                                           ; $4b17: $04
	ld   d, (hl)                                     ; $4b18: $56
	or   c                                           ; $4b19: $b1
	inc  e                                           ; $4b1a: $1c
	inc  e                                           ; $4b1b: $1c
	ld   c, d                                        ; $4b1c: $4a
	ld   h, (hl)                                     ; $4b1d: $66
	adc  a                                           ; $4b1e: $8f
	ld   c, a                                        ; $4b1f: $4f
	ld   c, e                                        ; $4b20: $4b
	adc  $4f                                         ; $4b21: $ce $4f
	ld   h, b                                        ; $4b23: $60
	ld   h, (hl)                                     ; $4b24: $66
	rst  $10                                         ; $4b25: $d7
	ld   l, b                                        ; $4b26: $68
	cp   c                                           ; $4b27: $b9
	xor  b                                           ; $4b28: $a8
	ld   l, b                                        ; $4b29: $68
	di                                               ; $4b2a: $f3
	and  l                                           ; $4b2b: $a5
	add  h                                           ; $4b2c: $84
	add  hl, sp                                      ; $4b2d: $39
	sub  l                                           ; $4b2e: $95
	cp   a                                           ; $4b2f: $bf
	ld   (hl), h                                     ; $4b30: $74
	rst  $20                                         ; $4b31: $e7
	ld   c, b                                        ; $4b32: $48
	xor  d                                           ; $4b33: $aa
	.db  $e3                                         ; $4b34: $e3
	ld   c, b                                        ; $4b35: $48
	ld   e, (hl)                                     ; $4b36: $5e
	inc  bc                                          ; $4b37: $03
	ld   c, e                                        ; $4b38: $4b
	ei                                               ; $4b39: $fb
	jp   nz, $9b94                                   ; $4b3a: $c2 $94 $9b

	ld   b, h                                        ; $4b3d: $44
	add  d                                           ; $4b3e: $82
	set  3, e                                        ; $4b3f: $cb $db
	rla                                              ; $4b41: $17
	adc  d                                           ; $4b42: $8a
	ld   l, d                                        ; $4b43: $6a
	ld   (de), a                                     ; $4b44: $12
	ld   (hl), e                                     ; $4b45: $73
	or   d                                           ; $4b46: $b2
	ld   a, a                                        ; $4b47: $7f
	ld   l, b                                        ; $4b48: $68
	pop  af                                          ; $4b49: $f1
	.db  $fc                                         ; $4b4a: $fc
	sub  a                                           ; $4b4b: $97
	adc  b                                           ; $4b4c: $88
	sbc  l                                           ; $4b4d: $9d
	ld   d, $2f                                      ; $4b4e: $16 $2f
	ld   c, b                                        ; $4b50: $48
	inc  b                                           ; $4b51: $04
	daa                                              ; $4b52: $27
	ld   l, e                                        ; $4b53: $6b
	adc  h                                           ; $4b54: $8c
	adc  (hl)                                        ; $4b55: $8e
	rst  $00                                         ; $4b56: $c7
	ld   a, (bc)                                     ; $4b57: $0a
	ld   h, a                                        ; $4b58: $67
	rrca                                             ; $4b59: $0f
	ld   c, a                                        ; $4b5a: $4f
	sbc  d                                           ; $4b5b: $9a
	add  h                                           ; $4b5c: $84
	sbc  b                                           ; $4b5d: $98
	ld   d, h                                        ; $4b5e: $54
	add  sp, -$3b                                    ; $4b5f: $e8 $c5
	sub  e                                           ; $4b61: $93
	ld   l, (hl)                                     ; $4b62: $6e
	cp   e                                           ; $4b63: $bb
	add  hl, hl                                      ; $4b64: $29
	rrca                                             ; $4b65: $0f
	ld   a, $c2                                      ; $4b66: $3e $c2
	di                                               ; $4b68: $f3
	ld   e, b                                        ; $4b69: $58
	xor  a                                           ; $4b6a: $af
	jp   z, $cb09                                    ; $4b6b: $ca $09 $cb

	ld   a, e                                        ; $4b6e: $7b
	inc  (hl)                                        ; $4b6f: $34
	sbc  d                                           ; $4b70: $9a
	add  sp, -$0f                                    ; $4b71: $e8 $f1
	and  a                                           ; $4b73: $a7
	inc  bc                                          ; $4b74: $03
	xor  c                                           ; $4b75: $a9
	or   $02                                         ; $4b76: $f6 $02
	.db  $f4                                         ; $4b78: $f4
	ld   (de), a                                     ; $4b79: $12
	ld   c, e                                        ; $4b7a: $4b
	sub  l                                           ; $4b7b: $95
	adc  $0a                                         ; $4b7c: $ce $0a
	dec  c                                           ; $4b7e: $0d
	sub  b                                           ; $4b7f: $90
	ld   d, b                                        ; $4b80: $50
	ld   l, c                                        ; $4b81: $69
	add  d                                           ; $4b82: $82
	cp   e                                           ; $4b83: $bb
	ld   (hl), e                                     ; $4b84: $73
	ld   d, d                                        ; $4b85: $52
	ld   (de), a                                     ; $4b86: $12
	ld   l, b                                        ; $4b87: $68
	sub  d                                           ; $4b88: $92
	jp   $a694                                       ; $4b89: $c3 $94 $a6


	adc  $6a                                         ; $4b8c: $ce $6a
	call z, $b1b8                                    ; $4b8e: $cc $b8 $b1
	cp   e                                           ; $4b91: $bb
	ld   sp, $11c6                                   ; $4b92: $31 $c6 $11
	ccf                                              ; $4b95: $3f
	di                                               ; $4b96: $f3
	pop  de                                          ; $4b97: $d1
	jr   c, jr_00c_4bc9                              ; $4b98: $38 $2f

	inc  a                                           ; $4b9a: $3c
	.db  $ec                                         ; $4b9b: $ec

jr_00c_4b9c:
	ld   b, c                                        ; $4b9c: $41
	ld   b, c                                        ; $4b9d: $41
	or   (hl)                                        ; $4b9e: $b6
	xor  d                                           ; $4b9f: $aa
	push bc                                          ; $4ba0: $c5
	jp   nz, $d34e                                   ; $4ba1: $c2 $4e $d3

	cp   b                                           ; $4ba4: $b8
	push hl                                          ; $4ba5: $e5
	jr   c, jr_00c_4c03                              ; $4ba6: $38 $5b

	adc  l                                           ; $4ba8: $8d
	ld   e, e                                        ; $4ba9: $5b
	inc  (hl)                                        ; $4baa: $34
	sub  h                                           ; $4bab: $94
	and  c                                           ; $4bac: $a1
	inc  hl                                          ; $4bad: $23
	rrca                                             ; $4bae: $0f
	and  d                                           ; $4baf: $a2
	sub  $a4                                         ; $4bb0: $d6 $a4
	ld   l, h                                        ; $4bb2: $6c
	cpl                                              ; $4bb3: $2f
	ld   a, (hl)                                     ; $4bb4: $7e
	ld   sp, hl                                      ; $4bb5: $f9
	call nz, $7c61                           ; $4bb6: $c4 $61 $7c
	adc  h                                           ; $4bb9: $8c
	xor  h                                           ; $4bba: $ac
	add  hl, bc                                      ; $4bbb: $09
	and  l                                           ; $4bbc: $a5
	and  $57                                         ; $4bbd: $e6 $57
	ld   e, $6c                                      ; $4bbf: $1e $6c
	push bc                                          ; $4bc1: $c5
	ld   e, e                                        ; $4bc2: $5b
	ld   l, c                                        ; $4bc3: $69
	cp   a                                           ; $4bc4: $bf
	ld   l, a                                        ; $4bc5: $6f
	cp   b                                           ; $4bc6: $b8
	add  c                                           ; $4bc7: $81
	inc  l                                           ; $4bc8: $2c

jr_00c_4bc9:
	ld   b, a                                        ; $4bc9: $47

jr_00c_4bca:
	ld   d, $fa                                      ; $4bca: $16 $fa
	ld   c, b                                        ; $4bcc: $48
	sbc  (hl)                                        ; $4bcd: $9e
	ld   c, (hl)                                     ; $4bce: $4e
	jp   c, $cb51                                    ; $4bcf: $da $51 $cb

	inc  l                                           ; $4bd2: $2c
	ld   c, h                                        ; $4bd3: $4c
	ld   (de), a                                     ; $4bd4: $12
	ld   a, (hl)                                     ; $4bd5: $7e
	ld   (hl), e                                     ; $4bd6: $73
	sbc  c                                           ; $4bd7: $99
	rlca                                             ; $4bd8: $07
	ld   d, c                                        ; $4bd9: $51
	ldi  (hl), a                                     ; $4bda: $22
	ld   d, e                                        ; $4bdb: $53
	jp   nz, $f6a0                                   ; $4bdc: $c2 $a0 $f6

	.db  $d3                                         ; $4bdf: $d3
	adc  l                                           ; $4be0: $8d
	sbc  e                                           ; $4be1: $9b
	jr   nc, jr_00c_4bca                             ; $4be2: $30 $e6

	ld   d, c                                        ; $4be4: $51
	sbc  c                                           ; $4be5: $99
	sbc  b                                           ; $4be6: $98
	call nz, $afb7                                   ; $4be7: $c4 $b7 $af
	jp   nz, $8c42                                   ; $4bea: $c2 $42 $8c

	add  d                                           ; $4bed: $82
	sub  b                                           ; $4bee: $90
	ld   c, b                                        ; $4bef: $48
	ld   l, d                                        ; $4bf0: $6a
	ld   e, c                                        ; $4bf1: $59
	ld   hl, sp-$7c                                  ; $4bf2: $f8 $84
	sub  l                                           ; $4bf4: $95
	ld   (hl), a                                     ; $4bf5: $77
	ld   ($2360), sp                                 ; $4bf6: $08 $60 $23
	and  a                                           ; $4bf9: $a7
	daa                                              ; $4bfa: $27
	ldd  (hl), a                                     ; $4bfb: $32
	ld   h, b                                        ; $4bfc: $60

jr_00c_4bfd:
	jr   jr_00c_4b9c                                 ; $4bfd: $18 $9d

	or   e                                           ; $4bff: $b3
	ld   (hl), b                                     ; $4c00: $70
	ld   l, e                                        ; $4c01: $6b
	ld   d, (hl)                                     ; $4c02: $56

jr_00c_4c03:
	or   e                                           ; $4c03: $b3
	ld   (hl), $0b                                   ; $4c04: $36 $0b
	ld   ($ff00+c), a                                ; $4c06: $e2
	dec  bc                                          ; $4c07: $0b
	ld   (hl), l                                     ; $4c08: $75
	cp   l                                           ; $4c09: $bd
	pop  bc                                          ; $4c0a: $c1
	jp   nc, $7735                           ; $4c0b: $d2 $35 $77

	sbc  $d4                                         ; $4c0e: $de $d4
	ld   l, c                                        ; $4c10: $69
	.db  $76                                         ; $4c11: $76
	ld   e, c                                        ; $4c12: $59
	ccf                                              ; $4c13: $3f
	adc  $8b                                         ; $4c14: $ce $8b
	adc  c                                           ; $4c16: $89
	and  b                                           ; $4c17: $a0
	ld   d, $b6                                      ; $4c18: $16 $b6
	ld   b, d                                        ; $4c1a: $42
	ld   c, $46                                      ; $4c1b: $0e $46
	push af                                          ; $4c1d: $f5
	ld   d, e                                        ; $4c1e: $53
	and  l                                           ; $4c1f: $a5
	ld   e, l                                        ; $4c20: $5d
	ld   e, (hl)                                     ; $4c21: $5e
	ld   d, e                                        ; $4c22: $53
	ld   (hl), $36                                   ; $4c23: $36 $36
	ld   l, h                                        ; $4c25: $6c
	sbc  (hl)                                        ; $4c26: $9e
	dec  a                                           ; $4c27: $3d
	xor  a                                           ; $4c28: $af
	sub  a                                           ; $4c29: $97
	sbc  d                                           ; $4c2a: $9a
	inc  d                                           ; $4c2b: $14
	dec  bc                                          ; $4c2c: $0b
	daa                                              ; $4c2d: $27
	ccf                                              ; $4c2e: $3f
	ld   h, (hl)                                     ; $4c2f: $66
	sub  l                                           ; $4c30: $95
	ld   c, c                                        ; $4c31: $49
	sub  $e5                                         ; $4c32: $d6 $e5
	add  (hl)                                        ; $4c34: $86
	ld   h, e                                        ; $4c35: $63
	nop                                              ; $4c36: $00
	ld   b, b                                        ; $4c37: $40
	add  hl, hl                                      ; $4c38: $29
	and  l                                           ; $4c39: $a5
	ei                                               ; $4c3a: $fb
	ld   c, a                                        ; $4c3b: $4f
	dec  a                                           ; $4c3c: $3d
	ldh  (<$21), a                                   ; $4c3d: $e0 $21
	sub  c                                           ; $4c3f: $91
	sbc  e                                           ; $4c40: $9b
	sbc  h                                           ; $4c41: $9c
	or   c                                           ; $4c42: $b1
	reti                                             ; $4c43: $d9


	jr   jr_00c_4caa                                 ; $4c44: $18 $64

	jp   nc, $ad44                                   ; $4c46: $d2 $44 $ad

	ld   h, l                                        ; $4c49: $65
	push de                                          ; $4c4a: $d5
	ld   l, (hl)                                     ; $4c4b: $6e
	sub  $38                                         ; $4c4c: $d6 $38
	cp   e                                           ; $4c4e: $bb
	and  $37                                         ; $4c4f: $e6 $37
	ei                                               ; $4c51: $fb
	rst  $30                                         ; $4c52: $f7
	rst  $18                                         ; $4c53: $df
	add  l                                           ; $4c54: $85
	and  (hl)                                        ; $4c55: $a6
	ld   (hl), h                                     ; $4c56: $74
	jr   z, jr_00c_4bfd                              ; $4c57: $28 $a4

	sbc  h                                           ; $4c59: $9c

$4c5a:
	jp   c, $0d5e                                    ; $4c5a: $da $5e $0d

	add  c                                           ; $4c5d: $81
	dec  c                                           ; $4c5e: $0d
	ld   e, a                                        ; $4c5f: $5f
	ld   (hl), e                                     ; $4c60: $73
	ld   c, h                                        ; $4c61: $4c
	rst  $30                                         ; $4c62: $f7
	inc  bc                                          ; $4c63: $03
	and  (hl)                                        ; $4c64: $a6
	sbc  l                                           ; $4c65: $9d
	adc  b                                           ; $4c66: $88
	rlca                                             ; $4c67: $07
	or   a                                           ; $4c68: $b7
	ld   d, b                                        ; $4c69: $50
	ei                                               ; $4c6a: $fb
	ld   c, d                                        ; $4c6b: $4a
	ld   e, l                                        ; $4c6c: $5d
	ld   d, d                                        ; $4c6d: $52
	ld   e, d                                        ; $4c6e: $5a
	inc  a                                           ; $4c6f: $3c
	sub  a                                           ; $4c70: $97
	or   e                                           ; $4c71: $b3
	ld   b, h                                        ; $4c72: $44
	sub  e                                           ; $4c73: $93
	sub  e                                           ; $4c74: $93
	.db  $fd                                         ; $4c75: $fd
	xor  $3f                                         ; $4c76: $ee $3f
	rst  $08                                         ; $4c78: $cf
	push bc                                          ; $4c79: $c5
	ld   l, b                                        ; $4c7a: $68
	and  c                                           ; $4c7b: $a1
	ld   a, (hl)                                     ; $4c7c: $7e
	ld   a, a                                        ; $4c7d: $7f
	ldi  (hl), a                                     ; $4c7e: $22
	ld   hl, sp+$2d                                  ; $4c7f: $f8 $2d
	sub  (hl)                                        ; $4c81: $96
	xor  (hl)                                        ; $4c82: $ae
	inc  e                                           ; $4c83: $1c
	and  (hl)                                        ; $4c84: $a6
	cp   h                                           ; $4c85: $bc
	rst  $00                                         ; $4c86: $c7
	ld   l, (hl)                                     ; $4c87: $6e
	dec  d                                           ; $4c88: $15
	ld   a, a                                        ; $4c89: $7f
	sub  e                                           ; $4c8a: $93
	rrca                                             ; $4c8b: $0f
	ld   l, c                                        ; $4c8c: $69
	ld   e, $25                                      ; $4c8d: $1e $25
	ld   d, b                                        ; $4c8f: $50
	.db  $fd                                         ; $4c90: $fd
	sbc  d                                           ; $4c91: $9a
	ld   b, (hl)                                     ; $4c92: $46
	ld   l, d                                        ; $4c93: $6a
	ld   a, b                                        ; $4c94: $78
	.db  $10                                         ; $4c95: $10
	ld   (hl), l                                     ; $4c96: $75
	ld   l, a                                        ; $4c97: $6f
	pop  af                                          ; $4c98: $f1
	ld   b, l                                        ; $4c99: $45
	inc  l                                           ; $4c9a: $2c
	add  c                                           ; $4c9b: $81
	ld   d, a                                        ; $4c9c: $57
	add  e                                           ; $4c9d: $83
	ld   h, l                                        ; $4c9e: $65
	ld   b, d                                        ; $4c9f: $42
	ld   de, $5da4                                   ; $4ca0: $11 $a4 $5d
	adc  e                                           ; $4ca3: $8b
	pop  hl                                          ; $4ca4: $e1
	ld   l, h                                        ; $4ca5: $6c
	sbc  b                                           ; $4ca6: $98
	ld   h, c                                        ; $4ca7: $61
	ld   c, $1c                                      ; $4ca8: $0e $1c

jr_00c_4caa:
	dec  h                                           ; $4caa: $25
	dec  h                                           ; $4cab: $25
	jp   nz, $2343                                   ; $4cac: $c2 $43 $23

	ld   a, (bc)                                     ; $4caf: $0a
	or   c                                           ; $4cb0: $b1
	ret  c                                           ; $4cb1: $d8

	add  h                                           ; $4cb2: $84
	call z, $86fb                                    ; $4cb3: $cc $fb $86
	ld   de, $54a0                                   ; $4cb6: $11 $a0 $54
	ld   b, a                                        ; $4cb9: $47
	xor  (hl)                                        ; $4cba: $ae
	ld   h, (hl)                                     ; $4cbb: $66
	ld   h, d                                        ; $4cbc: $62
	inc  (hl)                                        ; $4cbd: $34
	ldh  (<$26), a                                   ; $4cbe: $e0 $26
	ld   h, (hl)                                     ; $4cc0: $66
	sbc  e                                           ; $4cc1: $9b
	adc  h                                           ; $4cc2: $8c
	cp   d                                           ; $4cc3: $ba
	rra                                              ; $4cc4: $1f
	ld   d, e                                        ; $4cc5: $53
	ld   bc, $ebc8                                   ; $4cc6: $01 $c8 $eb
	ld   c, h                                        ; $4cc9: $4c
	add  hl, sp                                      ; $4cca: $39
	.db  $f4                                         ; $4ccb: $f4
	jr   nc, jr_00c_4d38                             ; $4ccc: $30 $6a

	ld   e, h                                        ; $4cce: $5c
	ld   d, e                                        ; $4ccf: $53
	ld   a, ($8694)                                  ; $4cd0: $fa $94 $86
	ldi  (hl), a                                     ; $4cd3: $22
	and  $07                                         ; $4cd4: $e6 $07
	jp   z, $3eb8                                    ; $4cd6: $ca $b8 $3e

	pop  af                                          ; $4cd9: $f1
	ld   (hl), a                                     ; $4cda: $77
	cp   c                                           ; $4cdb: $b9
	ld   h, l                                        ; $4cdc: $65
	dec  sp                                          ; $4cdd: $3b
	sbc  d                                           ; $4cde: $9a
	adc  l                                           ; $4cdf: $8d
	.db  $76                                         ; $4ce0: $76
	and  (hl)                                        ; $4ce1: $a6
	call nz, $2810                                   ; $4ce2: $c4 $10 $28
	add  hl, de                                      ; $4ce5: $19
	dec  c                                           ; $4ce6: $0d
	adc  e                                           ; $4ce7: $8b
	push af                                          ; $4ce8: $f5
	add  hl, sp                                      ; $4ce9: $39
	ld   e, b                                        ; $4cea: $58
	.db  $e3                                         ; $4ceb: $e3
	ld   a, e                                        ; $4cec: $7b
	dec  sp                                          ; $4ced: $3b
	reti                                             ; $4cee: $d9


	ld   de, $f622                                   ; $4cef: $11 $22 $f6
	push de                                          ; $4cf2: $d5
	jp   nc, $3dff                                   ; $4cf3: $d2 $ff $3d

	xor  c                                           ; $4cf6: $a9
	and  b                                           ; $4cf7: $a0
	ld   hl, sp+$6b                                  ; $4cf8: $f8 $6b
	ld   c, $e0                                      ; $4cfa: $0e $e0
	add  hl, hl                                      ; $4cfc: $29
	ccf                                              ; $4cfd: $3f
	sbc  e                                           ; $4cfe: $9b
	ld   e, l                                        ; $4cff: $5d
	add  a                                           ; $4d00: $87
	.db  $eb                                         ; $4d01: $eb
	adc  e                                           ; $4d02: $8b
	push af                                          ; $4d03: $f5
	jp   $c167                                       ; $4d04: $c3 $67 $c1


	sub  d                                           ; $4d07: $92
	ld   (hl), c                                     ; $4d08: $71
	dec  bc                                          ; $4d09: $0b
	add  hl, bc                                      ; $4d0a: $09

jr_00c_4d0b:
	ld   e, h                                        ; $4d0b: $5c
	ld   l, d                                        ; $4d0c: $6a
	ld   e, l                                        ; $4d0d: $5d
	and  c                                           ; $4d0e: $a1
	ld   l, $6f                                      ; $4d0f: $2e $6f
	jr   z, jr_00c_4d0b                              ; $4d11: $28 $f8

	ld   b, (hl)                                     ; $4d13: $46
	rrca                                             ; $4d14: $0f
	adc  $b5                                         ; $4d15: $ce $b5
	ld   b, b                                        ; $4d17: $40
	jp   z, $fbde                                    ; $4d18: $ca $de $fb

	ld   b, l                                        ; $4d1b: $45
	.db  $76                                         ; $4d1c: $76
	jp   hl                                          ; $4d1d: $e9


	.db  $ec                                         ; $4d1e: $ec
	add  b                                           ; $4d1f: $80
	ld   ($ff00+c), a                                ; $4d20: $e2
	sub  d                                           ; $4d21: $92
	ld   l, h                                        ; $4d22: $6c
	pop  de                                          ; $4d23: $d1
	cp   d                                           ; $4d24: $ba
	push hl                                          ; $4d25: $e5
	daa                                              ; $4d26: $27
	add  $aa                                         ; $4d27: $c6 $aa
	ld   ($c7d5), a                                  ; $4d29: $ea $d5 $c7
	add  $79                                         ; $4d2c: $c6 $79
	cp   h                                           ; $4d2e: $bc
	sub  b                                           ; $4d2f: $90
	ldi  a, (hl)                                     ; $4d30: $2a
	ld   c, a                                        ; $4d31: $4f
	ld   (hl), a                                     ; $4d32: $77
	.db  $e4                                         ; $4d33: $e4
	.db  $dd                                         ; $4d34: $dd
	ld   h, d                                        ; $4d35: $62
	rst  $30                                         ; $4d36: $f7
	add  b                                           ; $4d37: $80

jr_00c_4d38:
	ei                                               ; $4d38: $fb
	ld   (hl), d                                     ; $4d39: $72
	rst  $00                                         ; $4d3a: $c7
	ld   c, (hl)                                     ; $4d3b: $4e
	inc  d                                           ; $4d3c: $14
	pop  hl                                          ; $4d3d: $e1
	sub  h                                           ; $4d3e: $94
	call c, $c4cf                                    ; $4d3f: $dc $cf $c4
	.db  $ec                                         ; $4d42: $ec
	inc  c                                           ; $4d43: $0c
	.db  $d3                                         ; $4d44: $d3
	ldd  a, (hl)                                     ; $4d45: $3a
	ld   b, (hl)                                     ; $4d46: $46
	dec  c                                           ; $4d47: $0d
	rst  $20                                         ; $4d48: $e7
	.db  $fc                                         ; $4d49: $fc
	ld   b, e                                        ; $4d4a: $43
	inc  a                                           ; $4d4b: $3c
	ld   b, b                                        ; $4d4c: $40
	ld   b, h                                        ; $4d4d: $44
	jr   nc, jr_00c_4d84                             ; $4d4e: $30 $34

	jr   c, jr_00c_4d76                              ; $4d50: $38 $24

	jr   z, jr_00c_4d80                              ; $4d52: $28 $2c

	ld   a, $42                                      ; $4d54: $3e $42
	ld   b, (hl)                                     ; $4d56: $46
	ldd  (hl), a                                     ; $4d57: $32
	ld   (hl), $3a                                   ; $4d58: $36 $3a
	ld   h, $2a                                      ; $4d5a: $26 $2a
	ld   l, $60                                      ; $4d5c: $2e $60
	ld   h, h                                        ; $4d5e: $64
	ld   l, b                                        ; $4d5f: $68
	ld   d, h                                        ; $4d60: $54
	ld   e, b                                        ; $4d61: $58
	ld   e, h                                        ; $4d62: $5c
	ld   c, b                                        ; $4d63: $48
	ld   c, h                                        ; $4d64: $4c
	ld   d, b                                        ; $4d65: $50
	ld   h, c                                        ; $4d66: $61
	ld   h, l                                        ; $4d67: $65
	ld   l, c                                        ; $4d68: $69
	ld   d, l                                        ; $4d69: $55
	ld   e, c                                        ; $4d6a: $59
	ld   e, l                                        ; $4d6b: $5d
	ld   c, c                                        ; $4d6c: $49
	ld   c, l                                        ; $4d6d: $4d
	ld   d, c                                        ; $4d6e: $51
	ld   h, d                                        ; $4d6f: $62
	ld   h, (hl)                                     ; $4d70: $66
	ld   l, d                                        ; $4d71: $6a
	ld   d, (hl)                                     ; $4d72: $56
	ld   e, d                                        ; $4d73: $5a
	ld   e, (hl)                                     ; $4d74: $5e
	ld   c, d                                        ; $4d75: $4a

jr_00c_4d76:
	ld   c, (hl)                                     ; $4d76: $4e
	ld   d, d                                        ; $4d77: $52
	add  h                                           ; $4d78: $84
	adc  b                                           ; $4d79: $88
	adc  h                                           ; $4d7a: $8c
	ld   a, b                                        ; $4d7b: $78
	ld   a, h                                        ; $4d7c: $7c
	add  b                                           ; $4d7d: $80
	ld   l, h                                        ; $4d7e: $6c
	ld   (hl), b                                     ; $4d7f: $70

jr_00c_4d80:
	ld   (hl), h                                     ; $4d80: $74
	add  a                                           ; $4d81: $87
	adc  e                                           ; $4d82: $8b
	adc  a                                           ; $4d83: $8f

jr_00c_4d84:
	ld   a, e                                        ; $4d84: $7b
	ld   a, a                                        ; $4d85: $7f
	add  e                                           ; $4d86: $83
	ld   l, a                                        ; $4d87: $6f
	ld   (hl), e                                     ; $4d88: $73
	ld   (hl), a                                     ; $4d89: $77
	ldh  a, (<$f0)                                   ; $4d8a: $f0 $f0
	ldh  a, (<$f0)                                   ; $4d8c: $f0 $f0
	ret  c                                           ; $4d8e: $d8

	ld   bc, $0133                                   ; $4d8f: $01 $33 $01
	sbc  h                                           ; $4d92: $9c
	ld   bc, $a4a0                                   ; $4d93: $01 $a0 $a4
	xor  b                                           ; $4d96: $a8
	and  h                                           ; $4d97: $a4
	ld   (bc), a                                     ; $4d98: $02
	xor  h                                           ; $4d99: $ac
	or   b                                           ; $4d9a: $b0

jr_00c_4d9b:
	ld   bc, $1f1f                                   ; $4d9b: $01 $1f $1f
	rra                                              ; $4d9e: $1f
	.db  $ec                                         ; $4d9f: $ec
	.db  $ec                                         ; $4da0: $ec
	.db  $ec                                         ; $4da1: $ec
	ld   (bc), a                                     ; $4da2: $02

jr_00c_4da3:
	call z, $cccc                                    ; $4da3: $cc $cc $cc
	ret  z                                           ; $4da6: $c8

	ld   bc, $bcbc                                   ; $4da7: $01 $bc $bc
	ld   a, h                                        ; $4daa: $7c
	ld   a, h                                        ; $4dab: $7c
	cp   h                                           ; $4dac: $bc
	cp   h                                           ; $4dad: $bc
	ld   a, h                                        ; $4dae: $7c
	ld   a, h                                        ; $4daf: $7c
	ld   (bc), a                                     ; $4db0: $02
	add  sp, -$14                                    ; $4db1: $e8 $ec
	ld   (bc), a                                     ; $4db3: $02
	add  sp, -$14                                    ; $4db4: $e8 $ec
	.db  $ec                                         ; $4db6: $ec
	add  sp, -$14                                    ; $4db7: $e8 $ec
	ld   (bc), a                                     ; $4db9: $02
	.db  $eb                                         ; $4dba: $eb
	rst  $28                                         ; $4dbb: $ef
	rst  $28                                         ; $4dbc: $ef
	.db  $eb                                         ; $4dbd: $eb
	rst  $28                                         ; $4dbe: $ef
	sbc  h                                           ; $4dbf: $9c
	sbc  h                                           ; $4dc0: $9c
	sbc  h                                           ; $4dc1: $9c
	sbc  h                                           ; $4dc2: $9c
	sbc  h                                           ; $4dc3: $9c
	ld   (bc), a                                     ; $4dc4: $02
	pop  bc                                          ; $4dc5: $c1
	pop  bc                                          ; $4dc6: $c1
	pop  bc                                          ; $4dc7: $c1
	pop  de                                          ; $4dc8: $d1
	pop  de                                          ; $4dc9: $d1
	pop  de                                          ; $4dca: $d1
	call $cdcd                                       ; $4dcb: $cd $cd $cd
	sub  b                                           ; $4dce: $90
	sub  h                                           ; $4dcf: $94
	sbc  b                                           ; $4dd0: $98
	xor  b                                           ; $4dd1: $a8
	xor  h                                           ; $4dd2: $ac
	or   b                                           ; $4dd3: $b0
	sbc  h                                           ; $4dd4: $9c
	and  b                                           ; $4dd5: $a0
	and  h                                           ; $4dd6: $a4
	call z, $0001                                    ; $4dd7: $cc $01 $00
	ld   bc, $c4c0                                   ; $4dda: $01 $c0 $c4
	ld   (bc), a                                     ; $4ddd: $02
	set  1, a                                        ; $4dde: $cb $cf
	rst  $08                                         ; $4de0: $cf
	.db  $e3                                         ; $4de1: $e3
	ld   bc, $cfe3                                   ; $4de2: $01 $e3 $cf
	rst  $08                                         ; $4de5: $cf
	rlc  c                                           ; $4de6: $cb $01
	cp   h                                           ; $4de8: $bc
	cp   h                                           ; $4de9: $bc
	ld   a, h                                        ; $4dea: $7c
	ld   a, h                                        ; $4deb: $7c
	ld   bc, $c0c0                                   ; $4dec: $01 $c0 $c0
	call nz, $c0c4                                   ; $4def: $c4 $c4 $c0
	ret  nz                                          ; $4df2: $c0

	call nz, $02c4                                   ; $4df3: $c4 $c4 $02
	inc  c                                           ; $4df6: $0c
	ld   b, d                                        ; $4df7: $42
	dec  b                                           ; $4df8: $05
	add  l                                           ; $4df9: $85
	reti                                             ; $4dfa: $d9


	inc  d                                           ; $4dfb: $14
	add  l                                           ; $4dfc: $85
	add  hl, bc                                      ; $4dfd: $09
	dec  d                                           ; $4dfe: $15
	ld   b, d                                        ; $4dff: $42
	ld   (bc), a                                     ; $4e00: $02
	add  c                                           ; $4e01: $81
	.db  $fc                                         ; $4e02: $fc
	dec  c                                           ; $4e03: $0d
	inc  c                                           ; $4e04: $0c
	ld   b, d                                        ; $4e05: $42
	ld   ($c143), sp                                 ; $4e06: $08 $43 $c1
	inc  c                                           ; $4e09: $0c
	add  l                                           ; $4e0a: $85
	reti                                             ; $4e0b: $d9


	inc  d                                           ; $4e0c: $14
	ld   b, $40                                      ; $4e0d: $06 $40
	.db  $10                                         ; $4e0f: $10
	jp   $1c80                                       ; $4e10: $c3 $80 $1c


	ld   c, $0d                                      ; $4e13: $0e $0d
	ld   a, (bc)                                     ; $4e15: $0a
	ld   a, (bc)                                     ; $4e16: $0a
	ld   b, b                                        ; $4e17: $40
	jr   nz, jr_00c_4d9b                             ; $4e18: $20 $81

	.db  $10                                         ; $4e1a: $10
	ld   c, $0e                                      ; $4e1b: $0e $0e
	dec  bc                                          ; $4e1d: $0b
	dec  bc                                          ; $4e1e: $0b
	ld   b, b                                        ; $4e1f: $40
	jr   nz, jr_00c_4da3                             ; $4e20: $20 $81

	.db  $10                                         ; $4e22: $10
	ld   c, $14                                      ; $4e23: $0e $14
	inc  c                                           ; $4e25: $0c
	dec  l                                           ; $4e26: $2d
	ld   b, d                                        ; $4e27: $42
	ld   (bc), a                                     ; $4e28: $02
	add  c                                           ; $4e29: $81
	daa                                              ; $4e2a: $27
	ld   c, $14                                      ; $4e2b: $0e $14
	inc  c                                           ; $4e2d: $0c
	dec  l                                           ; $4e2e: $2d

jr_00c_4e2f:
	ret  nz                                          ; $4e2f: $c0

	.db  $e3                                         ; $4e30: $e3
	nop                                              ; $4e31: $00
	nop                                              ; $4e32: $00
	ld   b, d                                        ; $4e33: $42
	inc  d                                           ; $4e34: $14

jr_00c_4e35:
	jp   nz, $2c05                                   ; $4e35: $c2 $05 $2c

	ld   c, $c7                                      ; $4e38: $0e $c7
	pop  af                                          ; $4e3a: $f1
	add  b                                           ; $4e3b: $80
	add  b                                           ; $4e3c: $80
	jr   z, jr_00c_4e3f                              ; $4e3d: $28 $00

jr_00c_4e3f:
	call nz, $ae10                                   ; $4e3f: $c4 $10 $ae
	ld   c, $0c                                      ; $4e42: $0e $0c
	ld   d, c                                        ; $4e44: $51
	jr   nc, jr_00c_4e89                             ; $4e45: $30 $42

	ld   a, (bc)                                     ; $4e47: $0a
	ld   b, c                                        ; $4e48: $41
	inc  bc                                          ; $4e49: $03
	ld   b, $40                                      ; $4e4a: $06 $40
	rst  $38                                         ; $4e4c: $ff
	ret                                              ; $4e4d: $c9


	ldh  a, (<$54)                                   ; $4e4e: $f0 $54
	ld   c, $81                                      ; $4e50: $0e $81
	ld   c, e                                        ; $4e52: $4b
	ld   c, $08                                      ; $4e53: $0e $08
	ld   bc, $14c9                                   ; $4e55: $01 $c9 $14
	ld   e, a                                        ; $4e58: $5f
	ld   c, $40                                      ; $4e59: $0e $40
	.db  $10                                         ; $4e5b: $10
	add  c                                           ; $4e5c: $81
	ld   d, (hl)                                     ; $4e5d: $56
	ld   c, $ce                                      ; $4e5e: $0e $ce
	ld   b, $6c                                      ; $4e60: $06 $6c
	ld   c, $42                                      ; $4e62: $0e $42
	scf                                              ; $4e64: $37
	adc  $06                                         ; $4e65: $ce $06
	ld   l, h                                        ; $4e67: $6c
	ld   c, $81                                      ; $4e68: $0e $81
	sub  l                                           ; $4e6a: $95
	ld   c, $50                                      ; $4e6b: $0e $50
	jr   nc, jr_00c_4e2f                             ; $4e6d: $30 $c0

	rst  $20                                         ; $4e6f: $e7
	ldh  a, (<$00)                                   ; $4e70: $f0 $00
	rst  $00                                         ; $4e72: $c7
	nop                                              ; $4e73: $00
	ld   b, $09                                      ; $4e74: $06 $09
	ld   bc, $0441                                   ; $4e76: $01 $41 $04
	rlca                                             ; $4e79: $07
	ld   b, b                                        ; $4e7a: $40
	.db  $10                                         ; $4e7b: $10
	ld   (bc), a                                     ; $4e7c: $02
	ld   b, d                                        ; $4e7d: $42
	inc  bc                                          ; $4e7e: $03
	dec  b                                           ; $4e7f: $05
	ld   b, b                                        ; $4e80: $40
	jr   nc, jr_00c_4e8a                             ; $4e81: $30 $07

	ld   b, b                                        ; $4e83: $40

jr_00c_4e84:
	jr   nz, jr_00c_4ec8                             ; $4e84: $20 $42

	inc  bc                                          ; $4e86: $03
	inc  de                                          ; $4e87: $13
	inc  de                                          ; $4e88: $13

jr_00c_4e89:
	rlca                                             ; $4e89: $07

jr_00c_4e8a:
	ld   b, d                                        ; $4e8a: $42
	inc  bc                                          ; $4e8b: $03
	ld   d, c                                        ; $4e8c: $51
	jr   nc, -$39                                    ; $4e8d: $30 $c7

	jr   nc, jr_00c_4e97                             ; $4e8f: $30 $06

	nop                                              ; $4e91: $00
	add  c                                           ; $4e92: $81
	ld   c, b                                        ; $4e93: $48
	ld   c, $42                                      ; $4e94: $0e $42
	rrca                                             ; $4e96: $0f

jr_00c_4e97:
	ld   b, c                                        ; $4e97: $41
	ld   (bc), a                                     ; $4e98: $02
	rlca                                             ; $4e99: $07
	ld   b, b                                        ; $4e9a: $40
	.db  $10                                         ; $4e9b: $10
	dec  b                                           ; $4e9c: $05
	ld   b, b                                        ; $4e9d: $40
	ld   b, b                                        ; $4e9e: $40
	rlca                                             ; $4e9f: $07
	ld   b, b                                        ; $4ea0: $40
	.db  $10                                         ; $4ea1: $10
	dec  b                                           ; $4ea2: $05
	ld   b, b                                        ; $4ea3: $40
	jr   nc, jr_00c_4eae                             ; $4ea4: $30 $08

	ld   b, b                                        ; $4ea6: $40
	jr   nc, jr_00c_4eae                             ; $4ea7: $30 $05

	ld   b, b                                        ; $4ea9: $40
	jr   nc, jr_00c_4e35                             ; $4eaa: $30 $89

	rst  $10                                         ; $4eac: $d7
	dec  d                                           ; $4ead: $15

jr_00c_4eae:
	rst  $00                                         ; $4eae: $c7
	nop                                              ; $4eaf: $00
	dec  c                                           ; $4eb0: $0d
	ld   ($d789), sp                                 ; $4eb1: $08 $89 $d7
	dec  d                                           ; $4eb4: $15
	nop                                              ; $4eb5: $00
	inc  bc                                          ; $4eb6: $03
	inc  d                                           ; $4eb7: $14
	ld   bc, $0c09                                   ; $4eb8: $01 $09 $0c
	ld   b, c                                        ; $4ebb: $41
	dec  c                                           ; $4ebc: $0d
	ret  z                                           ; $4ebd: $c8

	jr   nc, jr_00c_4e84                             ; $4ebe: $30 $c4

	ld   c, $81                                      ; $4ec0: $0e $81
	rrc  (hl)                                        ; $4ec2: $cb $0e
	ld   d, l                                        ; $4ec4: $55
	and  $40                                         ; $4ec5: $e6 $40
	dec  c                                           ; $4ec7: $0d

jr_00c_4ec8:
	add  c                                           ; $4ec8: $81
	cp   l                                           ; $4ec9: $bd
	ld   c, $40                                      ; $4eca: $0e $40
	inc  de                                          ; $4ecc: $13
	ld   b, c                                        ; $4ecd: $41
	inc  c                                           ; $4ece: $0c
	rlca                                             ; $4ecf: $07
	.db  $10                                         ; $4ed0: $10
	adc  d                                           ; $4ed1: $8a
	call nc, $420e                                   ; $4ed2: $d4 $0e $42
	ld   bc, $ea8a                                   ; $4ed5: $01 $8a $ea
	ld   c, $82                                      ; $4ed8: $0e $82
	ld   ($ff00+c), a                                ; $4eda: $e2
	ld   c, $40                                      ; $4edb: $0e $40
	inc  b                                           ; $4edd: $04
	jp   nz, $d614                                   ; $4ede: $c2 $14 $d6

	ld   c, $40                                      ; $4ee1: $0e $40
	.db  $10                                         ; $4ee3: $10

	ret                                              ; $4ee4: $c9


	inc  d                                           ; $4ee5: $14
	ld   ($ff00+c), a                                ; $4ee6: $e2
	ld   c, $2a                                      ; $4ee7: $0e $2a
	nop                                              ; $4ee9: $00
	adc  c                                           ; $4eea: $89
	ld   l, b                                        ; $4eeb: $68
	rla                                              ; $4eec: $17
	ld   ($0841), sp                                 ; $4eed: $08 $41 $08
	ld   b, b                                        ; $4ef0: $40
	jr   nz, jr_00c_4ef5                             ; $4ef1: $20 $02

	ld   b, b                                        ; $4ef3: $40
	rst  $38                                         ; $4ef4: $ff

jr_00c_4ef5:
	ld   b, d                                        ; $4ef5: $42
	dec  b                                           ; $4ef6: $05
	ldi  a, (hl)                                     ; $4ef7: $2a
	nop                                              ; $4ef8: $00
	inc  d                                           ; $4ef9: $14
	inc  c                                           ; $4efa: $0c
	add  hl, bc                                      ; $4efb: $09
	ld   d, $50                                      ; $4efc: $16 $50
	ldi  a, (hl)                                     ; $4efe: $2a
	nop                                              ; $4eff: $00
	add  hl, bc                                      ; $4f00: $09
	inc  c                                           ; $4f01: $0c
	ld   b, c                                        ; $4f02: $41
	ld   bc, $2901                                   ; $4f03: $01 $01 $29
	ld   b, b                                        ; $4f06: $40
	inc  b                                           ; $4f07: $04
	ret                                              ; $4f08: $c9


	ld   ($0f1a), sp                                 ; $4f09: $08 $1a $0f
	ret                                              ; $4f0c: $c9


	ld   a, h                                        ; $4f0d: $7c
	rra                                              ; $4f0e: $1f
	rrca                                             ; $4f0f: $0f
	add  d                                           ; $4f10: $82
	inc  l                                           ; $4f11: $2c
	rrca                                             ; $4f12: $0f
	ret                                              ; $4f13: $c9


	nop                                              ; $4f14: $00
	inc  h                                           ; $4f15: $24
	rrca                                             ; $4f16: $0f
	add  c                                           ; $4f17: $81
	dec  b                                           ; $4f18: $05
	rrca                                             ; $4f19: $0f
	ld   d, b                                        ; $4f1a: $50
	jr   nc, $42                                     ; $4f1b: $30 $42

	inc  bc                                          ; $4f1d: $03
	nop                                              ; $4f1e: $00
	ld   d, b                                        ; $4f1f: $50
	ld   sp, $0342                                   ; $4f20: $31 $42 $03
	nop                                              ; $4f23: $00
	ld   de, $4002                                   ; $4f24: $11 $02 $40
	.db  $10                                         ; $4f27: $10
	ldi  a, (hl)                                     ; $4f28: $2a
	ld   d, b                                        ; $4f29: $50
	ldi  a, (hl)                                     ; $4f2a: $2a
	nop                                              ; $4f2b: $00
	add  hl, hl                                      ; $4f2c: $29
	ld   b, c                                        ; $4f2d: $41
	ld   (bc), a                                     ; $4f2e: $02
	.db  $10                                         ; $4f2f: $10
	ld   b, b                                        ; $4f30: $40
	inc  b                                           ; $4f31: $04
	ld   de, $0440                                   ; $4f32: $11 $40 $04
	ldi  a, (hl)                                     ; $4f35: $2a
	ld   d, b                                        ; $4f36: $50
	ldi  a, (hl)                                     ; $4f37: $2a
	nop                                              ; $4f38: $00
	call nz, $5104                           ; $4f39: $c4 $04 $51
	.db  $10                                         ; $4f3c: $10
	inc  c                                           ; $4f3d: $0c
	ld   b, c                                        ; $4f3e: $41
	inc  b                                           ; $4f3f: $04
	ld   b, d                                        ; $4f40: $42
	rrca                                             ; $4f41: $0f
	ld   ($1040), sp                                 ; $4f42: $08 $40 $10
	ld   d, c                                        ; $4f45: $51
	jr   nc, jr_00c_4f99                             ; $4f46: $30 $51

	ld   sp, $2a51                                   ; $4f48: $31 $51 $2a
	inc  b                                           ; $4f4b: $04
	ld   bc, $1442                                   ; $4f4c: $01 $42 $14
	jp   $5e80                               ; $4f4f: $c3 $80 $5e


	rrca                                             ; $4f52: $0f
	jp   $5e80                               ; $4f53: $c3 $80 $5e


	rrca                                             ; $4f56: $0f
	jp   $c880                                       ; $4f57: $c3 $80 $c8


	rrca                                             ; $4f5a: $0f
	add  c                                           ; $4f5b: $81
	sbc  $0f                                         ; $4f5c: $de $0f
	jp   $6980                               ; $4f5e: $c3 $80 $69


	rrca                                             ; $4f61: $0f
	jp   $9c80                                       ; $4f62: $c3 $80 $9c


	rrca                                             ; $4f65: $0f
	add  c                                           ; $4f66: $81
	or   d                                           ; $4f67: $b2
	rrca                                             ; $4f68: $0f
	jp   $7080                               ; $4f69: $c3 $80 $70


	rrca                                             ; $4f6c: $0f
	add  c                                           ; $4f6d: $81
	add  (hl)                                        ; $4f6e: $86
	rrca                                             ; $4f6f: $0f
	add  b                                           ; $4f70: $80
	ret  nz                                          ; $4f71: $c0

	add  b                                           ; $4f72: $80
	ret                                              ; $4f73: $c9


	inc  e                                           ; $4f74: $1c
	ld   a, d                                        ; $4f75: $7a
	rrca                                             ; $4f76: $0f
	add  c                                           ; $4f77: $81
	add  b                                           ; $4f78: $80
	rrca                                             ; $4f79: $0f
	ret  nz                                          ; $4f7a: $c0

	add  sp, $00                                     ; $4f7b: $e8 $00
	nop                                              ; $4f7d: $00
	ld   d, b                                        ; $4f7e: $50
	ldi  a, (hl)                                     ; $4f7f: $2a
	add  b                                           ; $4f80: $80
	ld   b, b                                        ; $4f81: $40
	ld   b, b                                        ; $4f82: $40
	add  c                                           ; $4f83: $81
	.db  $f4                                         ; $4f84: $f4
	rrca                                             ; $4f85: $0f
	add  b                                           ; $4f86: $80
	.db  $10                                         ; $4f87: $10
	ld   h, b                                        ; $4f88: $60
	ret                                              ; $4f89: $c9


	inc  e                                           ; $4f8a: $1c
	sub  b                                           ; $4f8b: $90
	rrca                                             ; $4f8c: $0f
	add  c                                           ; $4f8d: $81
	sub  (hl)                                        ; $4f8e: $96
	rrca                                             ; $4f8f: $0f
	ret  nz                                          ; $4f90: $c0

	add  sp, $00                                     ; $4f91: $e8 $00
	nop                                              ; $4f93: $00
	ld   d, b                                        ; $4f94: $50
	ldi  a, (hl)                                     ; $4f95: $2a
	add  b                                           ; $4f96: $80
	sub  b                                           ; $4f97: $90
	ld   (hl), b                                     ; $4f98: $70

jr_00c_4f99:
	add  c                                           ; $4f99: $81
	.db  $f4                                         ; $4f9a: $f4
	rrca                                             ; $4f9b: $0f
	add  b                                           ; $4f9c: $80
	ld   (hl), b                                     ; $4f9d: $70
	ld   b, b                                        ; $4f9e: $40
	ret                                              ; $4f9f: $c9


	inc  e                                           ; $4fa0: $1c
	and  (hl)                                        ; $4fa1: $a6
	rrca                                             ; $4fa2: $0f
	add  c                                           ; $4fa3: $81
	xor  h                                           ; $4fa4: $ac
	rrca                                             ; $4fa5: $0f
	ret  nz                                          ; $4fa6: $c0

	add  sp, $00                                     ; $4fa7: $e8 $00
	nop                                              ; $4fa9: $00
	ld   d, b                                        ; $4faa: $50
	ldi  a, (hl)                                     ; $4fab: $2a
	add  b                                           ; $4fac: $80
	jr   nc, jr_00c_4fef                             ; $4fad: $30 $40

	add  c                                           ; $4faf: $81
	.db  $f4                                         ; $4fb0: $f4
	rrca                                             ; $4fb1: $0f
	add  b                                           ; $4fb2: $80
	ld   d, b                                        ; $4fb3: $50
	ld   d, b                                        ; $4fb4: $50
	ret                                              ; $4fb5: $c9


	inc  e                                           ; $4fb6: $1c
	cp   h                                           ; $4fb7: $bc
	rrca                                             ; $4fb8: $0f
	add  c                                           ; $4fb9: $81
	jp   nz, $c00f                                   ; $4fba: $c2 $0f $c0

	add  sp, $00                                     ; $4fbd: $e8 $00
	nop                                              ; $4fbf: $00
	ld   d, b                                        ; $4fc0: $50
	ldi  a, (hl)                                     ; $4fc1: $2a
	add  b                                           ; $4fc2: $80
	ret  nc                                          ; $4fc3: $d0

	ld   b, b                                        ; $4fc4: $40
	add  c                                           ; $4fc5: $81
	.db  $f4                                         ; $4fc6: $f4
	rrca                                             ; $4fc7: $0f
	add  b                                           ; $4fc8: $80
	ldh  (<$50), a                                   ; $4fc9: $e0 $50
	ret                                              ; $4fcb: $c9


	inc  e                                           ; $4fcc: $1c
	jp   nc, $810f                                   ; $4fcd: $d2 $0f $81

	ret  c                                           ; $4fd0: $d8

	rrca                                             ; $4fd1: $0f
	ret  nz                                          ; $4fd2: $c0

	add  sp, $00                                     ; $4fd3: $e8 $00
	nop                                              ; $4fd5: $00
	ld   d, b                                        ; $4fd6: $50
	ldi  a, (hl)                                     ; $4fd7: $2a
	add  b                                           ; $4fd8: $80
	ld   d, b                                        ; $4fd9: $50
	ld   (hl), b                                     ; $4fda: $70
	add  c                                           ; $4fdb: $81
	.db  $f4                                         ; $4fdc: $f4
	rrca                                             ; $4fdd: $0f
	add  b                                           ; $4fde: $80
	sub  b                                           ; $4fdf: $90
	ld   b, b                                        ; $4fe0: $40
	ret                                              ; $4fe1: $c9


	inc  e                                           ; $4fe2: $1c
	add  sp, $0f                                     ; $4fe3: $e8 $0f
	add  c                                           ; $4fe5: $81
	xor  $0f                                         ; $4fe6: $ee $0f
	ret  nz                                          ; $4fe8: $c0

	add  sp, $00                                     ; $4fe9: $e8 $00
	nop                                              ; $4feb: $00
	ld   d, b                                        ; $4fec: $50
	ldi  a, (hl)                                     ; $4fed: $2a
	add  b                                           ; $4fee: $80

jr_00c_4fef:
	jr   nz, jr_00c_5051                             ; $4fef: $20 $60

	add  c                                           ; $4ff1: $81
	.db  $f4                                         ; $4ff2: $f4
	rrca                                             ; $4ff3: $0f
	ret                                              ; $4ff4: $c9


	inc  e                                           ; $4ff5: $1c
	ei                                               ; $4ff6: $fb
	rrca                                             ; $4ff7: $0f
	add  c                                           ; $4ff8: $81
	inc  b                                           ; $4ff9: $04
	.db  $10                                         ; $4ffa: $10
	ld   d, c                                        ; $4ffb: $51
	ldi  a, (hl)                                     ; $4ffc: $2a
	ret  nz                                          ; $4ffd: $c0

	jp   hl                                          ; $4ffe: $e9


	nop                                              ; $4fff: $00
	nop                                              ; $5000: $00
	add  c                                           ; $5001: $81
	dec  bc                                          ; $5002: $0b
	.db  $10                                         ; $5003: $10
	ret  z                                           ; $5004: $c8

	ldi  a, (hl)                                     ; $5005: $2a
	dec  bc                                          ; $5006: $0b
	.db  $10                                         ; $5007: $10
	add  c                                           ; $5008: $81
	jr   nc, jr_00c_501b                             ; $5009: $30 $10

	add  b                                           ; $500b: $80
	.db  $10                                         ; $500c: $10
	jr   nz, $07                                     ; $500d: $20 $07

jr_00c_500f:
	inc  c                                           ; $500f: $0c
	ld   (bc), a                                     ; $5010: $02
	ld   (de), a                                     ; $5011: $12
	ld   d, c                                        ; $5012: $51
	jr   nc, $51                                     ; $5013: $30 $51

	ld   sp, $2a51                                   ; $5015: $31 $51 $2a
	ret  nz                                          ; $5018: $c0

	.db  $eb                                         ; $5019: $eb
	nop                                              ; $501a: $00

jr_00c_501b:
	nop                                              ; $501b: $00
	ld   b, d                                        ; $501c: $42
	ld   a, (bc)                                     ; $501d: $0a
	ret  z                                           ; $501e: $c8

	jr   nc, jr_00c_504e                             ; $501f: $30 $2d

	.db  $10                                         ; $5021: $10
	ret  z                                           ; $5022: $c8

	ld   sp, $102d                                   ; $5023: $31 $2d $10
	ret  z                                           ; $5026: $c8

	ldi  a, (hl)                                     ; $5027: $2a
	dec  l                                           ; $5028: $2d
	.db  $10                                         ; $5029: $10
	add  c                                           ; $502a: $81
	inc  e                                           ; $502b: $1c
	.db  $10                                         ; $502c: $10
	ld   ($ff40), sp                                 ; $502d: $08 $40 $ff
	add  c                                           ; $5030: $81
	ld   b, l                                        ; $5031: $45
	rrca                                             ; $5032: $0f
	inc  d                                           ; $5033: $14

jr_00c_5034:
	add  hl, bc                                      ; $5034: $09
	dec  e                                           ; $5035: $1d
	inc  c                                           ; $5036: $0c
	rst  $00                                         ; $5037: $c7
	ld   ($8080), sp                                 ; $5038: $08 $80 $80
	ld   b, d                                        ; $503b: $42
	ld   bc, $30c8                                   ; $503c: $01 $c8 $30
	ld   d, b                                        ; $503f: $50
	.db  $10                                         ; $5040: $10
	ret  z                                           ; $5041: $c8

	ld   sp, $1049                                   ; $5042: $31 $49 $10
	jp   nz, $3ba5                                   ; $5045: $c2 $a5 $3b

	.db  $10                                         ; $5048: $10
	rst  $00                                         ; $5049: $c7
	inc  e                                           ; $504a: $1c
	add  b                                           ; $504b: $80
	add  b                                           ; $504c: $80
	add  c                                           ; $504d: $81

jr_00c_504e:
	ld   d, c                                        ; $504e: $51
	.db  $10                                         ; $504f: $10
	ldi  a, (hl)                                     ; $5050: $2a

jr_00c_5051:
	nop                                              ; $5051: $00
	inc  d                                           ; $5052: $14
	add  hl, bc                                      ; $5053: $09
	dec  e                                           ; $5054: $1d
	inc  c                                           ; $5055: $0c
	rst  $00                                         ; $5056: $c7
	ld   a, h                                        ; $5057: $7c
	add  b                                           ; $5058: $80
	add  b                                           ; $5059: $80
	ld   b, d                                        ; $505a: $42
	ld   bc, $31c8                                   ; $505b: $01 $c8 $31
	ld   l, a                                        ; $505e: $6f
	.db  $10                                         ; $505f: $10
	ret  z                                           ; $5060: $c8

	jr   nc, jr_00c_50cb                             ; $5061: $30 $68

	.db  $10                                         ; $5063: $10
	jp   nz, $5aa5                           ; $5064: $c2 $a5 $5a

	.db  $10                                         ; $5067: $10
	rst  $00                                         ; $5068: $c7
	inc  e                                           ; $5069: $1c
	add  b                                           ; $506a: $80
	add  b                                           ; $506b: $80
	add  c                                           ; $506c: $81
	ld   (hl), b                                     ; $506d: $70
	.db  $10                                         ; $506e: $10
	ldi  a, (hl)                                     ; $506f: $2a
	nop                                              ; $5070: $00
	call nz, $7008                           ; $5071: $c4 $08 $70
	.db  $10                                         ; $5074: $10
	add  hl, bc                                      ; $5075: $09
	ld   b, h                                        ; $5076: $44
	ld   b, $01                                      ; $5077: $06 $01
	ld   b, c                                        ; $5079: $41
	ld   ($070c), sp                                 ; $507a: $08 $0c $07
	ld   b, b                                        ; $507d: $40
	jr   nz, -$76                                    ; $507e: $20 $8a

	xor  a                                           ; $5080: $af
	.db  $10                                         ; $5081: $10
	ld   b, b                                        ; $5082: $40
	jr   nz, jr_00c_500f                             ; $5083: $20 $8a

	xor  a                                           ; $5085: $af
	.db  $10                                         ; $5086: $10
	ld   b, b                                        ; $5087: $40
	jr   nz, -$76                                    ; $5088: $20 $8a

	xor  a                                           ; $508a: $af
	.db  $10                                         ; $508b: $10
	jp   $9364                                       ; $508c: $c3 $64 $93


	.db  $10                                         ; $508f: $10
	add  c                                           ; $5090: $81
	sbc  l                                           ; $5091: $9d
	.db  $10                                         ; $5092: $10
	add  hl, hl                                      ; $5093: $29
	ld   b, b                                        ; $5094: $40
	jr   nc, jr_00c_509c                             ; $5095: $30 $05

	ld   b, b                                        ; $5097: $40
	rst  $38                                         ; $5098: $ff
	ld   b, $40                                      ; $5099: $06 $40
	ld   b, b                                        ; $509b: $40

jr_00c_509c:
	rlca                                             ; $509c: $07
	jp   $a280                                       ; $509d: $c3 $80 $a2


	.db  $10                                         ; $50a0: $10
	ld   ($2040), sp                                 ; $50a1: $08 $40 $20
	adc  d                                           ; $50a4: $8a
	xor  a                                           ; $50a5: $af
	.db  $10                                         ; $50a6: $10
	ld   b, b                                        ; $50a7: $40
	jr   nz, jr_00c_5034                             ; $50a8: $20 $8a

	xor  a                                           ; $50aa: $af
	.db  $10                                         ; $50ab: $10
	add  c                                           ; $50ac: $81
	ld   a, l                                        ; $50ad: $7d
	.db  $10                                         ; $50ae: $10
	ret  nz                                          ; $50af: $c0

	ret  z                                           ; $50b0: $c8

	nop                                              ; $50b1: $00
	nop                                              ; $50b2: $00
	ld   b, d                                        ; $50b3: $42
	dec  b                                           ; $50b4: $05
	inc  b                                           ; $50b5: $04
	ld   b, e                                        ; $50b6: $43
	ld   a, ($ff00+c)                                ; $50b7: $f2
	add  hl, bc                                      ; $50b8: $09
	ld   bc, $8080                                   ; $50b9: $01 $80 $80
	ld   b, b                                        ; $50bc: $40
	ld   b, c                                        ; $50bd: $41
	inc  b                                           ; $50be: $04
	adc  d                                           ; $50bf: $8a
	jp   nz, $1010                                   ; $50c0: $c2 $10 $10

	rrca                                             ; $50c3: $0f
	ret  nz                                          ; $50c4: $c0

	ret  z                                           ; $50c5: $c8

	nop                                              ; $50c6: $00
	nop                                              ; $50c7: $00
	adc  c                                           ; $50c8: $89
	ld   h, $16                                      ; $50c9: $26 $16

jr_00c_50cb:
	ld   b, d                                        ; $50cb: $42
	ld   a, (bc)                                     ; $50cc: $0a
	ld   b, b                                        ; $50cd: $40
	.db  $10                                         ; $50ce: $10
	adc  c                                           ; $50cf: $89
	ld   h, $16                                      ; $50d0: $26 $16
	inc  c                                           ; $50d2: $0c
	ld   b, b                                        ; $50d3: $40
	ld   b, b                                        ; $50d4: $40
	ld   b, c                                        ; $50d5: $41
	inc  b                                           ; $50d6: $04
	ld   ($0641), sp                                 ; $50d7: $08 $41 $06
	ld   b, e                                        ; $50da: $43
	pop  af                                          ; $50db: $f1
	ld   b, d                                        ; $50dc: $42
	ld   a, (bc)                                     ; $50dd: $0a
	ld   bc, bcDivA_divInC_modInAB                                   ; $50de: $01 $44 $08
	dec  e                                           ; $50e1: $1d
	ld   b, c                                        ; $50e2: $41
	inc  b                                           ; $50e3: $04
	ld   b, d                                        ; $50e4: $42
	rlca                                             ; $50e5: $07
	add  hl, bc                                      ; $50e6: $09
	inc  c                                           ; $50e7: $0c
	rst  $00                                         ; $50e8: $c7
	nop                                              ; $50e9: $00
	add  b                                           ; $50ea: $80
	add  b                                           ; $50eb: $80
	ld   b, d                                        ; $50ec: $42
	ld   ($4006), sp                                 ; $50ed: $08 $06 $40
	ld   b, b                                        ; $50f0: $40
	ret                                              ; $50f1: $c9


	nop                                              ; $50f2: $00
	.db  $fc                                         ; $50f3: $fc
	.db  $10                                         ; $50f4: $10
	ld   b, b                                        ; $50f5: $40
	jr   nz, -$3e                                    ; $50f6: $20 $c2

	inc  bc                                          ; $50f8: $03
	pop  af                                          ; $50f9: $f1
	.db  $10                                         ; $50fa: $10
	nop                                              ; $50fb: $00
	jp   $256e                                       ; $50fc: $c3 $6e $25


	ld   de, $c704                                   ; $50ff: $11 $04 $c7
	ld   e, h                                        ; $5102: $5c
	add  b                                           ; $5103: $80

$5104:
	add  b                                           ; $5104: $80
	ld   b, d                                        ; $5105: $42
	inc  b                                           ; $5106: $04
	rst  $00                                         ; $5107: $c7
	ld   e, b                                        ; $5108: $58
	add  b                                           ; $5109: $80
	add  b                                           ; $510a: $80
	ld   b, d                                        ; $510b: $42
	ld   a, (bc)                                     ; $510c: $0a
	rst  $00                                         ; $510d: $c7
	sbc  h                                           ; $510e: $9c
	add  b                                           ; $510f: $80
	add  b                                           ; $5110: $80
	ld   b, d                                        ; $5111: $42
	rlca                                             ; $5112: $07
	jp   $1cc8                                       ; $5113: $c3 $c8 $1c


	ld   de, $00c7                                   ; $5116: $11 $c7 $00
	add  b                                           ; $5119: $80
	add  b                                           ; $511a: $80
	nop                                              ; $511b: $00
	ret  nz                                          ; $511c: $c0

	xor  $00                                         ; $511d: $ee $00
	nop                                              ; $511f: $00
	rst  $00                                         ; $5120: $c7
	nop                                              ; $5121: $00
	add  b                                           ; $5122: $80
	add  b                                           ; $5123: $80
	nop                                              ; $5124: $00
	add  c                                           ; $5125: $81
	push af                                          ; $5126: $f5
	.db  $10                                         ; $5127: $10
	add  hl, bc                                      ; $5128: $09
	inc  c                                           ; $5129: $0c
	ld   b, a                                        ; $512a: $47
	inc  bc                                          ; $512b: $03
	daa                                              ; $512c: $27
	ld   d, $42                                      ; $512d: $16 $42
	dec  b                                           ; $512f: $05
	rst  $00                                         ; $5130: $c7
	nop                                              ; $5131: $00
	add  b                                           ; $5132: $80
	add  b                                           ; $5133: $80
	ld   b, e                                        ; $5134: $43
	rst  $28                                         ; $5135: $ef
	call nz, $6a08                           ; $5136: $c4 $08 $6a
	ld   de, $0c09                                   ; $5139: $11 $09 $0c
	ld   b, h                                        ; $513c: $44
	ld   ($4103), sp                                 ; $513d: $08 $03 $41
	inc  b                                           ; $5140: $04
	ld   ($80c3), sp                                 ; $5141: $08 $c3 $80
	ld   b, a                                        ; $5144: $47
	ld   de, $4007                                   ; $5145: $11 $07 $40
	.db  $10                                         ; $5148: $10
	jp   $5a0a                               ; $5149: $c3 $0a $5a


	ld   de, $06ce                                   ; $514c: $11 $ce $06
	ld   d, h                                        ; $514f: $54
	ld   de, $5781                                   ; $5150: $11 $81 $57
	ld   de, $0342                                   ; $5153: $11 $42 $03
	rrca                                             ; $5156: $0f
	add  c                                           ; $5157: $81
	ld   b, a                                        ; $5158: $47
	ld   de, $c704                                   ; $5159: $11 $04 $c7
	sbc  h                                           ; $515c: $9c
	add  b                                           ; $515d: $80
	add  b                                           ; $515e: $80

jr_00c_515f:
	ld   b, d                                        ; $515f: $42
	dec  b                                           ; $5160: $05
	rst  $00                                         ; $5161: $c7
	ld   e, h                                        ; $5162: $5c
	add  b                                           ; $5163: $80
	add  b                                           ; $5164: $80
	ret  nz                                          ; $5165: $c0

	.db  $ed                                         ; $5166: $ed
	nop                                              ; $5167: $00
	nop                                              ; $5168: $00
	nop                                              ; $5169: $00
	rst  $00                                         ; $516a: $c7
	sub  l                                           ; $516b: $95
	ld   b, $09                                      ; $516c: $06 $09
	nop                                              ; $516e: $00
	call nz, $9d08                                   ; $516f: $c4 $08 $9d
	ld   de, $0447                                   ; $5172: $11 $47 $04
	ld   b, c                                        ; $5175: $41
	ld   (bc), a                                     ; $5176: $02
	ld   d, c                                        ; $5177: $51
	jr   nc, jr_00c_51cb                             ; $5178: $30 $51

	ld   sp, ecEquEtimesC                                   ; $517a: $31 $03 $08
	add  hl, bc                                      ; $517d: $09
	inc  c                                           ; $517e: $0c
	rst  $00                                         ; $517f: $c7
	ret  nc                                          ; $5180: $d0

	add  b                                           ; $5181: $80
	add  c                                           ; $5182: $81
	ld   b, d                                        ; $5183: $42
	dec  b                                           ; $5184: $05
	ret  nz                                          ; $5185: $c0

	.db  $ed                                         ; $5186: $ed
	nop                                              ; $5187: $00
	.db  $10                                         ; $5188: $10
	ld   d, $07                                      ; $5189: $16 $07
	ld   b, b                                        ; $518b: $40
	jr   nz, jr_00c_5197                             ; $518c: $20 $09

	ret  nz                                          ; $518e: $c0

	.db  $ed                                         ; $518f: $ed
	nop                                              ; $5190: $00
	.db  $10                                         ; $5191: $10
	ld   d, $0f                                      ; $5192: $16 $0f
	ld   b, b                                        ; $5194: $40
	jr   nz, jr_00c_515f                             ; $5195: $20 $c8

jr_00c_5197:
	ld   sp, $119d                                   ; $5197: $31 $9d $11
	add  c                                           ; $519a: $81
	ld   a, l                                        ; $519b: $7d
	ld   de, $0c00                                   ; $519c: $11 $00 $0c
	ld   b, d                                        ; $519f: $42
	dec  b                                           ; $51a0: $05
	add  l                                           ; $51a1: $85
	reti                                             ; $51a2: $d9


	inc  d                                           ; $51a3: $14
	add  l                                           ; $51a4: $85
	add  hl, bc                                      ; $51a5: $09
	dec  d                                           ; $51a6: $15
	ld   b, d                                        ; $51a7: $42
	ld   (bc), a                                     ; $51a8: $02
	add  c                                           ; $51a9: $81
	and  h                                           ; $51aa: $a4
	ld   de, $420c                                   ; $51ab: $11 $0c $42
	ld   ($c443), sp                                 ; $51ae: $08 $43 $c4
	inc  c                                           ; $51b1: $0c
	inc  bc                                          ; $51b2: $03
	ld   b, d                                        ; $51b3: $42
	rrca                                             ; $51b4: $0f
	adc  c                                           ; $51b5: $89
	ld   a, (bc)                                     ; $51b6: $0a
	jr   -$7b                                        ; $51b7: $18 $85

	reti                                             ; $51b9: $d9


	inc  d                                           ; $51ba: $14
	add  l                                           ; $51bb: $85
	ld   (bc), a                                     ; $51bc: $02
	dec  d                                           ; $51bd: $15
	ld   b, d                                        ; $51be: $42
	ld   (bc), a                                     ; $51bf: $02
	add  c                                           ; $51c0: $81
	cp   e                                           ; $51c1: $bb
	ld   de, $4328                                   ; $51c2: $11 $28 $43
	ld   (bc), a                                     ; $51c5: $02
	add  hl, bc                                      ; $51c6: $09
	rst  $00                                         ; $51c7: $c7
	sub  l                                           ; $51c8: $95
	ld   b, $09                                      ; $51c9: $06 $09

jr_00c_51cb:
	adc  c                                           ; $51cb: $89
	rst  $10                                         ; $51cc: $d7
	dec  d                                           ; $51cd: $15
	ld   d, b                                        ; $51ce: $50
	ld   sp, $0542                                   ; $51cf: $31 $42 $05
	adc  c                                           ; $51d2: $89
	rst  $10                                         ; $51d3: $d7
	dec  d                                           ; $51d4: $15
	ld   b, d                                        ; $51d5: $42
	dec  b                                           ; $51d6: $05
	adc  c                                           ; $51d7: $89
	rst  $10                                         ; $51d8: $d7
	dec  d                                           ; $51d9: $15
	ld   b, e                                        ; $51da: $43
	ld   (bc), a                                     ; $51db: $02
	ld   b, d                                        ; $51dc: $42
	ld   bc, $e782                                   ; $51dd: $01 $82 $e7
	ld   de, $4223                                   ; $51e0: $11 $23 $42
	ld   (bc), a                                     ; $51e3: $02
	add  c                                           ; $51e4: $81
	sbc  $11                                         ; $51e5: $de $11
	ldi  (hl), a                                     ; $51e7: $22
	ld   b, d                                        ; $51e8: $42
	ld   bc, $de81                                   ; $51e9: $01 $81 $de
	ld   de, $0901                                   ; $51ec: $11 $01 $09
	dec  l                                           ; $51ef: $2d
	add  l                                           ; $51f0: $85
	call nc, $8514                                   ; $51f1: $d4 $14 $85
	.db  $10                                         ; $51f4: $10
	dec  d                                           ; $51f5: $15
	ret  nz                                          ; $51f6: $c0

	.db  $d3                                         ; $51f7: $d3
	nop                                              ; $51f8: $00
	nop                                              ; $51f9: $00
	ld   b, d                                        ; $51fa: $42
	dec  l                                           ; $51fb: $2d
	add  c                                           ; $51fc: $81
	di                                               ; $51fd: $f3
	ld   de, $8501                                   ; $51fe: $11 $01 $85
	call nc, $8514                                   ; $5201: $d4 $14 $85
	.db  $10                                         ; $5204: $10
	dec  d                                           ; $5205: $15

jr_00c_5206:
	ld   b, d                                        ; $5206: $42
	ldd  (hl), a                                     ; $5207: $32
	ret  nz                                          ; $5208: $c0

	.db  $d3                                         ; $5209: $d3
	nop                                              ; $520a: $00
	nop                                              ; $520b: $00
	jp   nz, $031e                                   ; $520c: $c2 $1e $03

	ld   (de), a                                     ; $520f: $12
	ld   b, d                                        ; $5210: $42
	ld   e, $c1                                      ; $5211: $1e $c1
	rst  $10                                         ; $5213: $d7
	inc  d                                           ; $5214: $14
	.db  $10                                         ; $5215: $10
	add  l                                           ; $5216: $85
	.db  $10                                         ; $5217: $10
	dec  d                                           ; $5218: $15
	ld   b, d                                        ; $5219: $42
	dec  l                                           ; $521a: $2d
	ret  nz                                          ; $521b: $c0

	.db  $d3                                         ; $521c: $d3
	nop                                              ; $521d: $00
	nop                                              ; $521e: $00
	add  c                                           ; $521f: $81
	ld   d, $12                                      ; $5220: $16 $12
	ld   bc, $4709                                   ; $5222: $01 $09 $47
	inc  bc                                          ; $5225: $03
	inc  c                                           ; $5226: $0c
	ld   b, c                                        ; $5227: $41
	ld   (bc), a                                     ; $5228: $02
	ld   b, d                                        ; $5229: $42
	rrca                                             ; $522a: $0f
	rlca                                             ; $522b: $07
	ld   b, b                                        ; $522c: $40
	ld   b, $06                                      ; $522d: $06 $06
	ld   b, b                                        ; $522f: $40

jr_00c_5230:
	inc  b                                           ; $5230: $04
	jp   $3973                                       ; $5231: $c3 $73 $39


	ld   (de), a                                     ; $5234: $12
	ret  nz                                          ; $5235: $c0

	ccf                                              ; $5236: $3f
	.db  $ec                                         ; $5237: $ec
	.db  $ec                                         ; $5238: $ec
	ld   b, d                                        ; $5239: $42
	rrca                                             ; $523a: $0f
	rlca                                             ; $523b: $07
	ld   b, b                                        ; $523c: $40
	ld   b, $06                                      ; $523d: $06 $06
	ld   b, b                                        ; $523f: $40
	inc  b                                           ; $5240: $04
	jp   $4973                               ; $5241: $c3 $73 $49


	ld   (de), a                                     ; $5244: $12
	ret  nz                                          ; $5245: $c0

	ccf                                              ; $5246: $3f
	ld   a, (bc)                                     ; $5247: $0a
	.db  $ec                                         ; $5248: $ec
	ld   b, d                                        ; $5249: $42
	rrca                                             ; $524a: $0f
	rlca                                             ; $524b: $07
	ld   b, b                                        ; $524c: $40
	ld   b, $06                                      ; $524d: $06 $06
	ld   b, b                                        ; $524f: $40
	inc  b                                           ; $5250: $04
	jp   $5973                               ; $5251: $c3 $73 $59


	ld   (de), a                                     ; $5254: $12
	ret  nz                                          ; $5255: $c0

	ccf                                              ; $5256: $3f
	.db  $ec                                         ; $5257: $ec
	nop                                              ; $5258: $00
	jp   nz, $290a                                   ; $5259: $c2 $0a $29

	ld   (de), a                                     ; $525c: $12
	nop                                              ; $525d: $00
	inc  d                                           ; $525e: $14
	add  hl, bc                                      ; $525f: $09
	inc  c                                           ; $5260: $0c
	dec  l                                           ; $5261: $2d
	dec  e                                           ; $5262: $1d
	inc  bc                                          ; $5263: $03
	add  l                                           ; $5264: $85
	push hl                                          ; $5265: $e5
	inc  d                                           ; $5266: $14
	jp   $7755                               ; $5267: $c3 $55 $77


	ld   (de), a                                     ; $526a: $12
	jp   $7080                               ; $526b: $c3 $80 $70


	ld   (de), a                                     ; $526e: $12
	ld   c, $ce                                      ; $526f: $0e $ce
	jr   jr_00c_5206                                 ; $5271: $18 $93

	ld   (de), a                                     ; $5273: $12
	add  c                                           ; $5274: $81
	ld   a, h                                        ; $5275: $7c
	ld   (de), a                                     ; $5276: $12
	dec  c                                           ; $5277: $0d
	adc  $18                                         ; $5278: $ce $18
	sub  e                                           ; $527a: $93
	ld   (de), a                                     ; $527b: $12
	ret  nz                                          ; $527c: $c0

	adc  $00                                         ; $527d: $ce $00
	nop                                              ; $527f: $00
	jp   $86a0                                       ; $5280: $c3 $a0 $86


	ld   (de), a                                     ; $5283: $12
	ld   b, (hl)                                     ; $5284: $46
	ret  nc                                          ; $5285: $d0

	ld   b, b                                        ; $5286: $40
	.db  $10                                         ; $5287: $10
	jp   $676e                                       ; $5288: $c3 $6e $67


	ld   (de), a                                     ; $528b: $12
	adc  $18                                         ; $528c: $ce $18
	sub  e                                           ; $528e: $93
	ld   (de), a                                     ; $528f: $12
	add  c                                           ; $5290: $81
	ld   a, h                                        ; $5291: $7c
	ld   (de), a                                     ; $5292: $12
	ld   b, d                                        ; $5293: $42
	ld   bc, $80c3                                   ; $5294: $01 $c3 $80
	and  c                                           ; $5297: $a1
	ld   (de), a                                     ; $5298: $12
	ld   c, $ce                                      ; $5299: $0e $ce
	jr   jr_00c_5230                                 ; $529b: $18 $93

	ld   (de), a                                     ; $529d: $12
	add  c                                           ; $529e: $81
	ld   a, h                                        ; $529f: $7c
	ld   (de), a                                     ; $52a0: $12
	dec  c                                           ; $52a1: $0d
	adc  $18                                         ; $52a2: $ce $18
	sub  e                                           ; $52a4: $93
	ld   (de), a                                     ; $52a5: $12
	add  c                                           ; $52a6: $81
	ld   a, h                                        ; $52a7: $7c
	ld   (de), a                                     ; $52a8: $12
	inc  c                                           ; $52a9: $0c
	inc  bc                                          ; $52aa: $03
	add  l                                           ; $52ab: $85
	sbc  $14                                         ; $52ac: $de $14
	add  l                                           ; $52ae: $85
	.db  $ec                                         ; $52af: $ec
	inc  d                                           ; $52b0: $14
	jp   $aef0                                       ; $52b1: $c3 $f0 $ae


	ld   (de), a                                     ; $52b4: $12
	ld   b, (hl)                                     ; $52b5: $46
	ret  nc                                          ; $52b6: $d0

	add  c                                           ; $52b7: $81
	xor  (hl)                                        ; $52b8: $ae
	ld   (de), a                                     ; $52b9: $12
	inc  d                                           ; $52ba: $14
	daa                                              ; $52bb: $27
	dec  e                                           ; $52bc: $1d
	add  hl, bc                                      ; $52bd: $09
	inc  c                                           ; $52be: $0c
	dec  l                                           ; $52bf: $2d
	add  l                                           ; $52c0: $85
	push hl                                          ; $52c1: $e5
	inc  d                                           ; $52c2: $14
	add  l                                           ; $52c3: $85
	.db  $ec                                         ; $52c4: $ec
	inc  d                                           ; $52c5: $14
	ret  nz                                          ; $52c6: $c0

	adc  $00                                         ; $52c7: $ce $00
	nop                                              ; $52c9: $00
	jp   $c3b9                                       ; $52ca: $c3 $b9 $c3


	ld   (de), a                                     ; $52cd: $12
	ld   b, (hl)                                     ; $52ce: $46
	ret  nc                                          ; $52cf: $d0

	add  c                                           ; $52d0: $81
	jp   $8512                                       ; $52d1: $c3 $12 $85


	reti                                             ; $52d4: $d9


	inc  d                                           ; $52d5: $14
	inc  b                                           ; $52d6: $04
	ld   b, d                                        ; $52d7: $42
	inc  d                                           ; $52d8: $14
	jp   $e45a                                       ; $52d9: $c3 $5a $e4


	ld   (de), a                                     ; $52dc: $12
	jp   $f064                                       ; $52dd: $c3 $64 $f0


	ld   (de), a                                     ; $52e0: $12
	add  c                                           ; $52e1: $81
	.db  $fc                                         ; $52e2: $fc
	ld   (de), a                                     ; $52e3: $12
	add  b                                           ; $52e4: $80
	ret  nz                                          ; $52e5: $c0

	ld   (hl), b                                     ; $52e6: $70
	add  l                                           ; $52e7: $85
	ld   (hl), b                                     ; $52e8: $70
	inc  de                                          ; $52e9: $13
	add  l                                           ; $52ea: $85
	ld   c, l                                        ; $52eb: $4d
	dec  d                                           ; $52ec: $15
	add  c                                           ; $52ed: $81
	sub  $12                                         ; $52ee: $d6 $12
	add  b                                           ; $52f0: $80
	ld   b, b                                        ; $52f1: $40
	jr   nc, -$7b                                    ; $52f2: $30 $85

	ld   (hl), b                                     ; $52f4: $70
	inc  de                                          ; $52f5: $13
	add  l                                           ; $52f6: $85

jr_00c_52f7:
	ld   c, l                                        ; $52f7: $4d
	dec  d                                           ; $52f8: $15
	add  c                                           ; $52f9: $81
	sub  $12                                         ; $52fa: $d6 $12
	add  b                                           ; $52fc: $80
	ld   d, b                                        ; $52fd: $50
	add  b                                           ; $52fe: $80
	add  l                                           ; $52ff: $85
	ld   (hl), b                                     ; $5300: $70
	inc  de                                          ; $5301: $13
	add  l                                           ; $5302: $85
	ld   c, l                                        ; $5303: $4d
	dec  d                                           ; $5304: $15
	add  c                                           ; $5305: $81
	sub  $12                                         ; $5306: $d6 $12
	add  l                                           ; $5308: $85
	reti                                             ; $5309: $d9


	inc  d                                           ; $530a: $14
	inc  b                                           ; $530b: $04
	ld   b, d                                        ; $530c: $42
	inc  c                                           ; $530d: $0c
	jp   $195a                                       ; $530e: $c3 $5a $19


	inc  de                                          ; $5311: $13
	jp   $2564                                       ; $5312: $c3 $64 $25


	inc  de                                          ; $5315: $13
	add  c                                           ; $5316: $81
	ld   sp, $8013                                   ; $5317: $31 $13 $80
	jr   nz, jr_00c_536c                             ; $531a: $20 $50

	add  l                                           ; $531c: $85
	ld   (hl), b                                     ; $531d: $70
	inc  de                                          ; $531e: $13
	add  l                                           ; $531f: $85
	ld   c, l                                        ; $5320: $4d
	dec  d                                           ; $5321: $15
	add  c                                           ; $5322: $81
	dec  bc                                          ; $5323: $0b
	inc  de                                          ; $5324: $13
	add  b                                           ; $5325: $80
	sub  b                                           ; $5326: $90
	ld   d, b                                        ; $5327: $50
	add  l                                           ; $5328: $85
	ld   (hl), b                                     ; $5329: $70
	inc  de                                          ; $532a: $13
	add  l                                           ; $532b: $85
	ld   c, l                                        ; $532c: $4d
	dec  d                                           ; $532d: $15
	add  c                                           ; $532e: $81
	dec  bc                                          ; $532f: $0b
	inc  de                                          ; $5330: $13
	add  b                                           ; $5331: $80
	sub  b                                           ; $5332: $90
	sub  b                                           ; $5333: $90
	add  l                                           ; $5334: $85
	ld   (hl), b                                     ; $5335: $70
	inc  de                                          ; $5336: $13
	add  l                                           ; $5337: $85
	ld   c, l                                        ; $5338: $4d
	dec  d                                           ; $5339: $15
	add  c                                           ; $533a: $81
	dec  bc                                          ; $533b: $0b
	inc  de                                          ; $533c: $13
	add  l                                           ; $533d: $85
	reti                                             ; $533e: $d9


	inc  d                                           ; $533f: $14
	inc  b                                           ; $5340: $04
	jp   $4c5a                               ; $5341: $c3 $5a $4c


	inc  de                                          ; $5344: $13
	jp   $5864                               ; $5345: $c3 $64 $58


	inc  de                                          ; $5348: $13
	add  c                                           ; $5349: $81
	ld   h, h                                        ; $534a: $64
	inc  de                                          ; $534b: $13
	add  b                                           ; $534c: $80
	ld   h, b                                        ; $534d: $60
	ld   d, b                                        ; $534e: $50
	add  l                                           ; $534f: $85
	ld   (hl), b                                     ; $5350: $70
	inc  de                                          ; $5351: $13
	add  l                                           ; $5352: $85
	ld   c, l                                        ; $5353: $4d
	dec  d                                           ; $5354: $15
	add  c                                           ; $5355: $81
	ld   b, b                                        ; $5356: $40
	inc  de                                          ; $5357: $13
	add  b                                           ; $5358: $80
	and  b                                           ; $5359: $a0
	ld   b, b                                        ; $535a: $40
	add  l                                           ; $535b: $85
	ld   (hl), b                                     ; $535c: $70
	inc  de                                          ; $535d: $13
	add  l                                           ; $535e: $85
	ld   c, l                                        ; $535f: $4d
	dec  d                                           ; $5360: $15
	add  c                                           ; $5361: $81
	ld   b, b                                        ; $5362: $40
	inc  de                                          ; $5363: $13
	add  b                                           ; $5364: $80
	jr   nz, jr_00c_52f7                             ; $5365: $20 $90

	add  l                                           ; $5367: $85
	ld   (hl), b                                     ; $5368: $70
	inc  de                                          ; $5369: $13
	add  l                                           ; $536a: $85
	ld   c, l                                        ; $536b: $4d

jr_00c_536c:
	dec  d                                           ; $536c: $15
	add  c                                           ; $536d: $81
	ld   b, b                                        ; $536e: $40
	inc  de                                          ; $536f: $13
	dec  b                                           ; $5370: $05
	ret  nz                                          ; $5371: $c0

	ret  z                                           ; $5372: $c8

	nop                                              ; $5373: $00
	nop                                              ; $5374: $00
	ld   b, d                                        ; $5375: $42
	ld   d, $0c                                      ; $5376: $16 $0c
	inc  h                                           ; $5378: $24
	add  hl, bc                                      ; $5379: $09
	ld   b, a                                        ; $537a: $47
	inc  bc                                          ; $537b: $03
	add  hl, hl                                      ; $537c: $29
	inc  c                                           ; $537d: $0c
	ld   bc, $0642                                   ; $537e: $01 $42 $06
	adc  b                                           ; $5381: $88
	adc  d                                           ; $5382: $8a
	inc  de                                          ; $5383: $13
	add  l                                           ; $5384: $85
	sbc  $14                                         ; $5385: $de $14
	add  c                                           ; $5387: $81
	adc  l                                           ; $5388: $8d
	inc  de                                          ; $5389: $13
	add  l                                           ; $538a: $85
	reti                                             ; $538b: $d9


	inc  d                                           ; $538c: $14
	add  hl, hl                                      ; $538d: $29
	ld   b, b                                        ; $538e: $40
	ld   ($d2c3), sp                                 ; $538f: $08 $c3 $d2
	sub  (hl)                                        ; $5392: $96
	inc  de                                          ; $5393: $13
	ld   b, (hl)                                     ; $5394: $46
	jp   nc, $8d81                                   ; $5395: $d2 $81 $8d

	inc  de                                          ; $5398: $13
	jr   z, jr_00c_53a4                              ; $5399: $28 $09

	inc  c                                           ; $539b: $0c
	ld   bc, $0641                                   ; $539c: $01 $41 $06
	rlca                                             ; $539f: $07
	dec  b                                           ; $53a0: $05
	ld   b, d                                        ; $53a1: $42
	ld   a, (bc)                                     ; $53a2: $0a
	ld   b, b                                        ; $53a3: $40

jr_00c_53a4:
	.db  $10                                         ; $53a4: $10
	ld   b, d                                        ; $53a5: $42
	ld   e, $08                                      ; $53a6: $1e $08
	ld   b, c                                        ; $53a8: $41
	inc  bc                                          ; $53a9: $03
	ld   b, b                                        ; $53aa: $40
	ld   b, $05                                      ; $53ab: $06 $05
	ld   b, b                                        ; $53ad: $40
	.db  $10                                         ; $53ae: $10
	ld   b, c                                        ; $53af: $41
	inc  b                                           ; $53b0: $04
	ld   ($c981), sp                                 ; $53b1: $08 $81 $c9
	inc  de                                          ; $53b4: $13
	jr   z, jr_00c_53c0                              ; $53b5: $28 $09

	inc  c                                           ; $53b7: $0c
	ld   bc, $0754                                   ; $53b8: $01 $54 $07
	ld   b, d                                        ; $53bb: $42
	add  hl, de                                      ; $53bc: $19
	ld   ($0241), sp                                 ; $53bd: $08 $41 $02

jr_00c_53c0:
	ld   b, b                                        ; $53c0: $40
	ld   b, $41                                      ; $53c1: $06 $41
	inc  bc                                          ; $53c3: $03
	ld   b, b                                        ; $53c4: $40
	inc  c                                           ; $53c5: $0c
	ld   b, c                                        ; $53c6: $41
	inc  b                                           ; $53c7: $04
	inc  hl                                          ; $53c8: $23
	ld   b, b                                        ; $53c9: $40
	inc  d                                           ; $53ca: $14
	ld   b, c                                        ; $53cb: $41
	ld   b, $40                                      ; $53cc: $06 $40
	jr   nz, jr_00c_5411                             ; $53ce: $20 $41

	ld   ($0840), sp                                 ; $53d0: $08 $40 $08
	ret                                              ; $53d3: $c9


	adc  h                                           ; $53d4: $8c
	jp   c, $8113                                    ; $53d5: $da $13 $81

	pop  de                                          ; $53d8: $d1
	inc  de                                          ; $53d9: $13
	nop                                              ; $53da: $00
	ld   b, c                                        ; $53db: $41
	ld   ($0a42), sp                                 ; $53dc: $08 $42 $0a
	ld   bc, $8527                                   ; $53df: $01 $27 $85
	.db  $10                                         ; $53e2: $10
	dec  d                                           ; $53e3: $15
	ld   b, d                                        ; $53e4: $42
	ld   a, (bc)                                     ; $53e5: $0a
	ret                                              ; $53e6: $c9


	.db  $ec                                         ; $53e7: $ec
	.db  $fd                                         ; $53e8: $fd
	inc  de                                          ; $53e9: $13
	ret                                              ; $53ea: $c9


	add  sp, -$03                                    ; $53eb: $e8 $fd
	inc  de                                          ; $53ed: $13
	ret                                              ; $53ee: $c9


	ld   e, h                                        ; $53ef: $5c
	.db  $fd                                         ; $53f0: $fd
	inc  de                                          ; $53f1: $13
	ret                                              ; $53f2: $c9


	ld   h, h                                        ; $53f3: $64
	.db  $fd                                         ; $53f4: $fd
	inc  de                                          ; $53f5: $13
	ret                                              ; $53f6: $c9


	ld   h, b                                        ; $53f7: $60
	.db  $fd                                         ; $53f8: $fd
	inc  de                                          ; $53f9: $13
	add  c                                           ; $53fa: $81
	pop  hl                                          ; $53fb: $e1
	inc  de                                          ; $53fc: $13
	inc  c                                           ; $53fd: $0c
	add  hl, bc                                      ; $53fe: $09
	ld   b, a                                        ; $53ff: $47
	inc  b                                           ; $5400: $04
	ld   d, $43                                      ; $5401: $16 $43
	sbc  $0c                                         ; $5403: $de $0c
	ld   bc, $0603                                   ; $5405: $01 $03 $06
	ld   b, d                                        ; $5408: $42
	ld   ($4210), sp                                 ; $5409: $08 $10 $42
	inc  b                                           ; $540c: $04
	ld   b, (hl)                                     ; $540d: $46
	ret  nc                                          ; $540e: $d0

	ld   b, d                                        ; $540f: $42
	rrca                                             ; $5410: $0f

jr_00c_5411:
	ld   b, (hl)                                     ; $5411: $46
	ret  nc                                          ; $5412: $d0

	ld   b, e                                        ; $5413: $43
	rst  $18                                         ; $5414: $df
	ld   bc, $0c27                                   ; $5415: $01 $27 $0c
	add  hl, bc                                      ; $5418: $09
	ld   b, a                                        ; $5419: $47
	inc  b                                           ; $541a: $04
	ld   d, $43                                      ; $541b: $16 $43
	.db  $dd                                         ; $541d: $dd
	inc  d                                           ; $541e: $14
	add  hl, bc                                      ; $541f: $09
	inc  c                                           ; $5420: $0c
	ld   b, d                                        ; $5421: $42

jr_00c_5422:
	inc  hl                                          ; $5422: $23
	dec  d                                           ; $5423: $15
	ld   b, e                                        ; $5424: $43
	pop  de                                          ; $5425: $d1
	ld   b, h                                        ; $5426: $44
	nop                                              ; $5427: $00
	inc  d                                           ; $5428: $14
	add  hl, bc                                      ; $5429: $09
	inc  c                                           ; $542a: $0c
	ld   b, d                                        ; $542b: $42
	inc  d                                           ; $542c: $14
	nop                                              ; $542d: $00
	inc  d                                           ; $542e: $14
	daa                                              ; $542f: $27
	inc  c                                           ; $5430: $0c
	ld   b, d                                        ; $5431: $42
	inc  hl                                          ; $5432: $23
	nop                                              ; $5433: $00
	ld   bc, $c40c                                   ; $5434: $01 $0c $c4
	ld   ($1449), sp                                 ; $5437: $08 $49 $14
	ld   b, h                                        ; $543a: $44
	inc  b                                           ; $543b: $04
	ld   b, c                                        ; $543c: $41
	inc  b                                           ; $543d: $04
	ld   b, b                                        ; $543e: $40
	ld   ($5d8c), sp                                 ; $543f: $08 $8c $5d
	inc  d                                           ; $5442: $14
	add  d                                           ; $5443: $82
	ld   e, l                                        ; $5444: $5d
	inc  d                                           ; $5445: $14
	add  c                                           ; $5446: $81
	ld   a, $14                                      ; $5447: $3e $14
	ld   b, h                                        ; $5449: $44
	nop                                              ; $544a: $00
	ld   b, c                                        ; $544b: $41
	inc  b                                           ; $544c: $04
	add  d                                           ; $544d: $82
	ld   e, b                                        ; $544e: $58
	inc  d                                           ; $544f: $14
	adc  h                                           ; $5450: $8c
	ld   e, l                                        ; $5451: $5d
	inc  d                                           ; $5452: $14
	ld   b, b                                        ; $5453: $40
	ld   ($4d81), sp                                 ; $5454: $08 $81 $4d
	inc  d                                           ; $5457: $14
	rrca                                             ; $5458: $0f
	ld   b, c                                        ; $5459: $41
	inc  b                                           ; $545a: $04
	ld   b, b                                        ; $545b: $40
	.db  $10                                         ; $545c: $10
	nop                                              ; $545d: $00
	inc  c                                           ; $545e: $0c
	ld   bc, $08c4                                   ; $545f: $01 $c4 $08
	.db  $76                                         ; $5462: $76
	inc  d                                           ; $5463: $14
	ld   b, h                                        ; $5464: $44
	inc  b                                           ; $5465: $04
	ld   b, c                                        ; $5466: $41
	nop                                              ; $5467: $00
	ld   (bc), a                                     ; $5468: $02
	nop                                              ; $5469: $00
	adc  h                                           ; $546a: $8c
	adc  c                                           ; $546b: $89
	inc  d                                           ; $546c: $14
	add  d                                           ; $546d: $82
	adc  c                                           ; $546e: $89
	inc  d                                           ; $546f: $14
	add  hl, hl                                      ; $5470: $29
	ld   b, b                                        ; $5471: $40
	inc  bc                                          ; $5472: $03
	add  c                                           ; $5473: $81
	ld   l, d                                        ; $5474: $6a
	inc  d                                           ; $5475: $14
	ld   b, h                                        ; $5476: $44
	nop                                              ; $5477: $00
	ld   b, c                                        ; $5478: $41
	ld   (bc), a                                     ; $5479: $02
	add  d                                           ; $547a: $82
	add  (hl)                                        ; $547b: $86
	inc  d                                           ; $547c: $14
	adc  h                                           ; $547d: $8c
	adc  c                                           ; $547e: $89
	inc  d                                           ; $547f: $14
	add  hl, hl                                      ; $5480: $29
	ld   b, b                                        ; $5481: $40
	inc  bc                                          ; $5482: $03
	add  c                                           ; $5483: $81
	ld   a, d                                        ; $5484: $7a
	inc  d                                           ; $5485: $14
	rrca                                             ; $5486: $0f
	ld   b, b                                        ; $5487: $40
	.db  $10                                         ; $5488: $10
	nop                                              ; $5489: $00
	inc  c                                           ; $548a: $0c
	ld   b, d                                        ; $548b: $42
	ld   a, (bc)                                     ; $548c: $0a
	ld   b, a                                        ; $548d: $47
	inc  bc                                          ; $548e: $03
	ld   b, c                                        ; $548f: $41
	ld   (bc), a                                     ; $5490: $02
	ld   b, h                                        ; $5491: $44
	ld   bc, $80c3                                   ; $5492: $01 $c3 $80
	sbc  l                                           ; $5495: $9d
	inc  d                                           ; $5496: $14
	dec  c                                           ; $5497: $0d
	ld   b, b                                        ; $5498: $40
	jr   nc, -$7f                                    ; $5499: $30 $81

	sub  e                                           ; $549b: $93
	inc  d                                           ; $549c: $14

jr_00c_549d:
	ld   c, $40                                      ; $549d: $0e $40
	jr   nc, jr_00c_5422                             ; $549f: $30 $81

	sub  e                                           ; $54a1: $93
	inc  d                                           ; $54a2: $14
	ret  z                                           ; $54a3: $c8

	ldi  a, (hl)                                     ; $54a4: $2a
	or   c                                           ; $54a5: $b1
	inc  d                                           ; $54a6: $14
	adc  d                                           ; $54a7: $8a
	xor  a                                           ; $54a8: $af
	inc  d                                           ; $54a9: $14
	ld   b, d                                        ; $54aa: $42
	ld   bc, $a781                                   ; $54ab: $01 $81 $a7
	inc  d                                           ; $54ae: $14
	ld   d, b                                        ; $54af: $50
	ldi  a, (hl)                                     ; $54b0: $2a
	add  l                                           ; $54b1: $85
	or   l                                           ; $54b2: $b5
	inc  d                                           ; $54b3: $14
	nop                                              ; $54b4: $00
	rst  $00                                         ; $54b5: $c7
	add  (hl)                                        ; $54b6: $86
	add  b                                           ; $54b7: $80
	add  b                                           ; $54b8: $80
	rst  $00                                         ; $54b9: $c7
	add  (hl)                                        ; $54ba: $86
	add  b                                           ; $54bb: $80
	rst  $38                                         ; $54bc: $ff
	rst  $00                                         ; $54bd: $c7
	add  (hl)                                        ; $54be: $86
	add  b                                           ; $54bf: $80
	cp   $24                                         ; $54c0: $fe $24
	ret  z                                           ; $54c2: $c8

	dec  hl                                          ; $54c3: $2b
	ret  nc                                          ; $54c4: $d0

	inc  d                                           ; $54c5: $14
	adc  d                                           ; $54c6: $8a
	adc  $14                                         ; $54c7: $ce $14
	ld   b, d                                        ; $54c9: $42
	ld   bc, $c681                                   ; $54ca: $01 $81 $c6
	inc  d                                           ; $54cd: $14
	ld   d, b                                        ; $54ce: $50
	dec  hl                                          ; $54cf: $2b
	add  l                                           ; $54d0: $85
	or   l                                           ; $54d1: $b5
	inc  d                                           ; $54d2: $14
	nop                                              ; $54d3: $00
	ld   b, c                                        ; $54d4: $41
	ld   b, $44                                      ; $54d5: $06 $44
	nop                                              ; $54d7: $00
	inc  h                                           ; $54d8: $24
	ld   b, c                                        ; $54d9: $41
	inc  bc                                          ; $54da: $03
	ld   b, h                                        ; $54db: $44
	inc  b                                           ; $54dc: $04
	inc  h                                           ; $54dd: $24
	ld   b, a                                        ; $54de: $47
	ld   (bc), a                                     ; $54df: $02
	ld   b, c                                        ; $54e0: $41
	ld   (bc), a                                     ; $54e1: $02
	ld   b, h                                        ; $54e2: $44
	inc  b                                           ; $54e3: $04
	inc  h                                           ; $54e4: $24
	ld   b, a                                        ; $54e5: $47
	inc  bc                                          ; $54e6: $03
	ld   b, c                                        ; $54e7: $41
	ld   bc, $0444                                   ; $54e8: $01 $44 $04
	inc  h                                           ; $54eb: $24
	ld   c, $81                                      ; $54ec: $0e $81
	ei                                               ; $54ee: $fb
	inc  d                                           ; $54ef: $14
	jp   $f5eb                                       ; $54f0: $c3 $eb $f5


	inc  d                                           ; $54f3: $14
	rrca                                             ; $54f4: $0f
	ld   b, b                                        ; $54f5: $40
	.db  $10                                         ; $54f6: $10
	inc  h                                           ; $54f7: $24
	ld   b, d                                        ; $54f8: $42
	ld   bc, $ce0d                                   ; $54f9: $01 $0d $ce
	inc  c                                           ; $54fc: $0c
	ld   hl, sp+$14                                  ; $54fd: $f8 $14
	add  c                                           ; $54ff: $81
	ldh  a, (<$14)                                   ; $5500: $f0 $14
	.db  $10                                         ; $5502: $10
	ld   b, b                                        ; $5503: $40
	jr   nc, jr_00c_5517                             ; $5504: $30 $11

	ld   b, b                                        ; $5506: $40
	jr   nc, jr_00c_552d                             ; $5507: $30 $24

	.db  $10                                         ; $5509: $10
	ld   b, b                                        ; $550a: $40
	jr   nz, jr_00c_551e                             ; $550b: $20 $11

	ld   b, b                                        ; $550d: $40
	jr   nz, $24                                     ; $550e: $20 $24

	jp   $2455                                       ; $5510: $c3 $55 $24


jr_00c_5513:
	dec  d                                           ; $5513: $15
	jp   $1e80                                       ; $5514: $c3 $80 $1e


jr_00c_5517:
	dec  d                                           ; $5517: $15
	add  b                                           ; $5518: $80
	ld   (hl), b                                     ; $5519: $70
	jr   nc, jr_00c_549d                             ; $551a: $30 $81

jr_00c_551c:
	ldi  a, (hl)                                     ; $551c: $2a
	dec  d                                           ; $551d: $15

jr_00c_551e:
	add  b                                           ; $551e: $80
	jr   nc, jr_00c_5591                             ; $551f: $30 $70

	add  c                                           ; $5521: $81
	ldi  a, (hl)                                     ; $5522: $2a
	dec  d                                           ; $5523: $15
	add  b                                           ; $5524: $80
	and  b                                           ; $5525: $a0
	ld   (hl), b                                     ; $5526: $70
	add  c                                           ; $5527: $81
	ldi  a, (hl)                                     ; $5528: $2a
	dec  d                                           ; $5529: $15
	.db $c3 $40 $42


jr_00c_552d:
	dec  d                                           ; $552d: $15
	jp   $3e55                                       ; $552e: $c3 $55 $3e


	dec  d                                           ; $5531: $15
	jp   $3a80                                       ; $5532: $c3 $80 $3a


	dec  d                                           ; $5535: $15
	ld   b, $81                                      ; $5536: $06 $81
	ld   b, e                                        ; $5538: $43
	dec  d                                           ; $5539: $15
	dec  b                                           ; $553a: $05
	add  c                                           ; $553b: $81
	ld   b, e                                        ; $553c: $43
	dec  d                                           ; $553d: $15
	rlca                                             ; $553e: $07
	add  c                                           ; $553f: $81
	ld   b, e                                        ; $5540: $43
	dec  d                                           ; $5541: $15
	ld   ($80c3), sp                                 ; $5542: $08 $c3 $80
	ld   c, d                                        ; $5545: $4a
	dec  d                                           ; $5546: $15
	ld   b, b                                        ; $5547: $40
	jr   nz, jr_00c_556e                             ; $5548: $20 $24

	ld   b, b                                        ; $554a: $40
	ld   b, b                                        ; $554b: $40
	inc  h                                           ; $554c: $24
	ld   b, b                                        ; $554d: $40
	jr   nc, jr_00c_5513                             ; $554e: $30 $c3

	add  b                                           ; $5550: $80
	ld   d, l                                        ; $5551: $55
	dec  d                                           ; $5552: $15
	ld   b, (hl)                                     ; $5553: $46
	.db $d2 $0f $40

	jr   nc, jr_00c_551c                             ; $5557: $30 $c3

	add  b                                           ; $5559: $80
	ld   e, (hl)                                     ; $555a: $5e
	dec  d                                           ; $555b: $15
	ld   b, (hl)                                     ; $555c: $46
	jp   nc, $c20e                                   ; $555d: $d2 $0e $c2

	inc  b                                           ; $5560: $04
	ld   c, l                                        ; $5561: $4d
	dec  d                                           ; $5562: $15
	ret  nz                                          ; $5563: $c0

	ret  z                                           ; $5564: $c8

	nop                                              ; $5565: $00
	nop                                              ; $5566: $00
	ld   b, d                                        ; $5567: $42
	rrca                                             ; $5568: $0f
	inc  h                                           ; $5569: $24
	add  (hl)                                        ; $556a: $86
	.db  $76                                         ; $556b: $76
	dec  d                                           ; $556c: $15
	daa                                              ; $556d: $27

jr_00c_556e:
	inc  c                                           ; $556e: $0c
	add  l                                           ; $556f: $85
	jp   hl                                          ; $5570: $e9


	dec  de                                          ; $5571: $1b
	add  (hl)                                        ; $5572: $86
	pop  bc                                          ; $5573: $c1
	dec  d                                           ; $5574: $15
	nop                                              ; $5575: $00
	add  hl, bc                                      ; $5576: $09
	ld   bc, $9700                                   ; $5577: $01 $00 $97
	dec  d                                           ; $557a: $15
	rrca                                             ; $557b: $0f
	ld   bc, $9e02                                   ; $557c: $01 $02 $9e
	dec  d                                           ; $557f: $15
	rlca                                             ; $5580: $07
	ld   (bc), a                                     ; $5581: $02
	dec  b                                           ; $5582: $05
	and  l                                           ; $5583: $a5
	dec  d                                           ; $5584: $15
	dec  c                                           ; $5585: $0d
	ld   bc, $ac00                                   ; $5586: $01 $00 $ac
	dec  d                                           ; $5589: $15
	dec  bc                                          ; $558a: $0b
	ld   b, $03                                      ; $558b: $06 $03
	or   e                                           ; $558d: $b3
	dec  d                                           ; $558e: $15
	ld   d, $01                                      ; $558f: $16 $01

jr_00c_5591:
	ld   (bc), a                                     ; $5591: $02
	cp   d                                           ; $5592: $ba
	dec  d                                           ; $5593: $15
	rst  $38                                         ; $5594: $ff
	rst  $38                                         ; $5595: $ff
	rst  $38                                         ; $5596: $ff
	call nz, $7501                                   ; $5597: $c4 $01 $75
	dec  d                                           ; $559a: $15
	add  c                                           ; $559b: $81
	ld   l, l                                        ; $559c: $6d
	dec  d                                           ; $559d: $15
	call nz, $7502                           ; $559e: $c4 $02 $75
	dec  d                                           ; $55a1: $15
	add  c                                           ; $55a2: $81
	ld   l, l                                        ; $55a3: $6d
	dec  d                                           ; $55a4: $15
	call nz, $7504                           ; $55a5: $c4 $04 $75
	dec  d                                           ; $55a8: $15
	add  c                                           ; $55a9: $81
	ld   l, l                                        ; $55aa: $6d
	dec  d                                           ; $55ab: $15
	call nz, $7510                           ; $55ac: $c4 $10 $75
	dec  d                                           ; $55af: $15
	add  c                                           ; $55b0: $81
	ld   l, l                                        ; $55b1: $6d
	dec  d                                           ; $55b2: $15
	call nz, $7520                           ; $55b3: $c4 $20 $75
	dec  d                                           ; $55b6: $15
	add  c                                           ; $55b7: $81
	ld   l, l                                        ; $55b8: $6d
	dec  d                                           ; $55b9: $15
	call nz, $7508                                   ; $55ba: $c4 $08 $75
	dec  d                                           ; $55bd: $15
	add  c                                           ; $55be: $81
	ld   l, l                                        ; $55bf: $6d
	dec  d                                           ; $55c0: $15
	add  hl, bc                                      ; $55c1: $09
	ld   bc, $f300                                   ; $55c2: $01 $00 $f3
	dec  d                                           ; $55c5: $15
	rrca                                             ; $55c6: $0f
	ld   bc, $f902                                   ; $55c7: $01 $02 $f9
	dec  d                                           ; $55ca: $15
	rlca                                             ; $55cb: $07
	ld   (bc), a                                     ; $55cc: $02
	dec  b                                           ; $55cd: $05
	rst  $38                                         ; $55ce: $ff
	dec  d                                           ; $55cf: $15
	dec  c                                           ; $55d0: $0d
	ld   bc, $0500                                   ; $55d1: $01 $00 $05
	ld   d, $0b                                      ; $55d4: $16 $0b
	ld   b, $03                                      ; $55d6: $06 $03
	dec  bc                                          ; $55d8: $0b
	ld   d, $16                                      ; $55d9: $16 $16
	ld   bc, $1102                                   ; $55db: $01 $02 $11
	ld   d, $1a                                      ; $55de: $16 $1a
	ld   bc, $1702                                   ; $55e0: $01 $02 $17
	ld   d, $ff                                      ; $55e3: $16 $ff
	rst  $38                                         ; $55e5: $ff
	rst  $38                                         ; $55e6: $ff
	add  (hl)                                        ; $55e7: $86
	pop  bc                                          ; $55e8: $c1
	dec  d                                           ; $55e9: $15
	add  l                                           ; $55ea: $85
	ld   a, ($ff00+c)                                ; $55eb: $f2
	dec  de                                          ; $55ec: $1b
	add  l                                           ; $55ed: $85
	jp   hl                                          ; $55ee: $e9


	dec  de                                          ; $55ef: $1b
	add  c                                           ; $55f0: $81
	rst  $20                                         ; $55f1: $e7
	dec  d                                           ; $55f2: $15
	add  a                                           ; $55f3: $87
	dec  e                                           ; $55f4: $1d
	ld   d, $81                                      ; $55f5: $16 $81
	ld   ($8715), a                                  ; $55f7: $ea $15 $87
	xor  l                                           ; $55fa: $ad
	ld   d, $81                                      ; $55fb: $16 $81
	ld   ($8715), a                                  ; $55fd: $ea $15 $87
	ld   c, e                                        ; $5600: $4b
	rla                                              ; $5601: $17
	add  c                                           ; $5602: $81
	ld   ($8715), a                                  ; $5603: $ea $15 $87
	ld   ($8118), sp                                 ; $5606: $08 $18 $81
	ld   ($8715), a                                  ; $5609: $ea $15 $87
	and  d                                           ; $560c: $a2
	jr   -$7f                                        ; $560d: $18 $81

	ld   ($8715), a                                  ; $560f: $ea $15 $87
	push hl                                          ; $5612: $e5
	add  hl, de                                      ; $5613: $19
	add  c                                           ; $5614: $81
	ld   ($8715), a                                  ; $5615: $ea $15 $87
	ld   ($811b), sp                                 ; $5618: $08 $1b $81
	ld   ($0115), a                                  ; $561b: $ea $15 $01
	nop                                              ; $561e: $00
	ld   d, h                                        ; $561f: $54
	ld   l, b                                        ; $5620: $68
	ld   (hl), d                                     ; $5621: $72
	ld   l, a                                        ; $5622: $6f
	ld   (hl), a                                     ; $5623: $77
	jr   nz, jr_00c_568c                             ; $5624: $20 $66

	ld   (hl), d                                     ; $5626: $72
	ld   (hl), l                                     ; $5627: $75
	ld   l, c                                        ; $5628: $69
	ld   (hl), h                                     ; $5629: $74
	jr   nz, jr_00c_568d                             ; $562a: $20 $61

	ld   (hl), h                                     ; $562c: $74
	ld   bc, $6874                                   ; $562d: $01 $74 $68
	ld   l, c                                        ; $5630: $69
	ld   (hl), e                                     ; $5631: $73
	jr   nz, jr_00c_569b                             ; $5632: $20 $67

	ld   (hl), l                                     ; $5634: $75
	ld   a, c                                        ; $5635: $79
	jr   nz, jr_00c_56a7                             ; $5636: $20 $6f

	ld   l, (hl)                                     ; $5638: $6e
	ld   l, h                                        ; $5639: $6c
	ld   a, c                                        ; $563a: $79
	ld   bc, $6877                                   ; $563b: $01 $77 $68
	ld   h, l                                        ; $563e: $65
	ld   l, (hl)                                     ; $563f: $6e
	jr   nz, $68                                     ; $5640: $20 $68

	ld   h, l                                        ; $5642: $65
	jr   nz, jr_00c_56a8                             ; $5643: $20 $63

	ld   l, a                                        ; $5645: $6f
	ld   l, l                                        ; $5646: $6d
	ld   h, l                                        ; $5647: $65
	ld   (hl), e                                     ; $5648: $73
	ld   bc, $756f                                   ; $5649: $01 $6f $75
	ld   (hl), h                                     ; $564c: $74
	jr   nz, jr_00c_56b5                             ; $564d: $20 $66

	ld   (hl), d                                     ; $564f: $72
	ld   l, a                                        ; $5650: $6f
	ld   l, l                                        ; $5651: $6d
	jr   nz, $62                                     ; $5652: $20 $62

	ld   h, l                                        ; $5654: $65
	ld   l, b                                        ; $5655: $68
	ld   l, c                                        ; $5656: $69
	ld   l, (hl)                                     ; $5657: $6e
	ld   h, h                                        ; $5658: $64
	ld   bc, $6874                                   ; $5659: $01 $74 $68
	ld   h, l                                        ; $565c: $65
	jr   nz, jr_00c_56d1                             ; $565d: $20 $72

	ld   l, a                                        ; $565f: $6f
	ld   h, e                                        ; $5660: $63
	ld   l, e                                        ; $5661: $6b
	ld   l, $20                                      ; $5662: $2e $20
	ld   d, l                                        ; $5664: $55
	ld   (hl), b                                     ; $5665: $70
	ld   l, a                                        ; $5666: $6f
	ld   l, (hl)                                     ; $5667: $6e
	ld   bc, $6564                                   ; $5668: $01 $64 $65
	ld   h, (hl)                                     ; $566b: $66
	ld   h, l                                        ; $566c: $65
	ld   h, c                                        ; $566d: $61
	ld   (hl), h                                     ; $566e: $74
	ld   l, c                                        ; $566f: $69
	ld   l, (hl)                                     ; $5670: $6e
	ld   h, a                                        ; $5671: $67
	jr   nz, jr_00c_56e8                             ; $5672: $20 $74

	ld   l, b                                        ; $5674: $68
	ld   l, c                                        ; $5675: $69
	ld   (hl), e                                     ; $5676: $73
	ld   bc, $6f62                                   ; $5677: $01 $62 $6f
	ld   (hl), e                                     ; $567a: $73
	ld   (hl), e                                     ; $567b: $73
	inc  l                                           ; $567c: $2c
	jr   nz, jr_00c_56f8                             ; $567d: $20 $79

	ld   l, a                                        ; $567f: $6f
	ld   (hl), l                                     ; $5680: $75
	jr   nz, $77                                     ; $5681: $20 $77

	ld   l, c                                        ; $5683: $69
	ld   l, h                                        ; $5684: $6c
	ld   l, h                                        ; $5685: $6c
	ld   bc, $6562                                   ; $5686: $01 $62 $65
	jr   nz, jr_00c_56fd                             ; $5689: $20 $72

	ld   h, l                                        ; $568b: $65

jr_00c_568c:
	ld   (hl), a                                     ; $568c: $77

jr_00c_568d:
	ld   h, c                                        ; $568d: $61
	ld   (hl), d                                     ; $568e: $72
	ld   h, h                                        ; $568f: $64
	ld   h, l                                        ; $5690: $65
	ld   h, h                                        ; $5691: $64
	jr   nz, $77                                     ; $5692: $20 $77

	ld   l, c                                        ; $5694: $69
	ld   (hl), h                                     ; $5695: $74
	ld   l, b                                        ; $5696: $68
	ld   bc, $6874                                   ; $5697: $01 $74 $68
	ld   h, l                                        ; $569a: $65

jr_00c_569b:
	jr   nz, jr_00c_56df                             ; $569b: $20 $42

	ld   h, l                                        ; $569d: $65
	ld   l, h                                        ; $569e: $6c
	ld   (hl), h                                     ; $569f: $74
	jr   nz, jr_00c_5711                             ; $56a0: $20 $6f

	ld   h, (hl)                                     ; $56a2: $66
	ld   bc, $7254                                   ; $56a3: $01 $54 $72
	ld   (hl), l                                     ; $56a6: $75

jr_00c_56a7:
	ld   (hl), h                                     ; $56a7: $74

jr_00c_56a8:
	ld   l, b                                        ; $56a8: $68
	ld   l, $ff                                      ; $56a9: $2e $ff
	cp   $7f                                         ; $56ab: $fe $7f
	nop                                              ; $56ad: $00
	nop                                              ; $56ae: $00
	ld   e, c                                        ; $56af: $59
	ld   l, a                                        ; $56b0: $6f
	ld   (hl), l                                     ; $56b1: $75
	daa                                              ; $56b2: $27
	ld   l, h                                        ; $56b3: $6c
	ld   l, h                                        ; $56b4: $6c

jr_00c_56b5:
	jr   nz, jr_00c_5725                             ; $56b5: $20 $6e

	ld   h, l                                        ; $56b7: $65
	ld   h, l                                        ; $56b8: $65
	ld   h, h                                        ; $56b9: $64
	jr   nz, $61                                     ; $56ba: $20 $61

	ld   bc, $656b                                   ; $56bc: $01 $6b $65
	ld   a, c                                        ; $56bf: $79
	jr   nz, jr_00c_5736                             ; $56c0: $20 $74

	ld   l, a                                        ; $56c2: $6f
	jr   nz, jr_00c_572a                             ; $56c3: $20 $65

	ld   l, (hl)                                     ; $56c5: $6e
	ld   (hl), h                                     ; $56c6: $74
	ld   h, l                                        ; $56c7: $65
	ld   (hl), d                                     ; $56c8: $72
	ld   bc, $6874                                   ; $56c9: $01 $74 $68
	ld   l, c                                        ; $56cc: $69
	ld   (hl), e                                     ; $56cd: $73
	jr   nz, jr_00c_5742                             ; $56ce: $20 $72

	ld   l, a                                        ; $56d0: $6f

jr_00c_56d1:
	ld   l, a                                        ; $56d1: $6f
	ld   l, l                                        ; $56d2: $6d
	ld   l, $20                                      ; $56d3: $2e $20
	ld   c, a                                        ; $56d5: $4f
	ld   l, (hl)                                     ; $56d6: $6e
	ld   h, e                                        ; $56d7: $63
	ld   h, l                                        ; $56d8: $65
	ld   bc, $6e69                                   ; $56d9: $01 $69 $6e
	inc  l                                           ; $56dc: $2c
	jr   nz, jr_00c_5754                             ; $56dd: $20 $75

jr_00c_56df:
	ld   (hl), e                                     ; $56df: $73
	ld   h, l                                        ; $56e0: $65
	jr   nz, $33                                     ; $56e1: $20 $33

	jr   nz, jr_00c_575b                             ; $56e3: $20 $76

	ld   l, c                                        ; $56e5: $69
	ld   h, c                                        ; $56e6: $61
	ld   l, h                                        ; $56e7: $6c

jr_00c_56e8:
	ld   (hl), e                                     ; $56e8: $73
	ld   bc, $6f74                                   ; $56e9: $01 $74 $6f
	jr   nz, $64                                     ; $56ec: $20 $64

	ld   h, l                                        ; $56ee: $65
	ld   h, (hl)                                     ; $56ef: $66
	ld   h, l                                        ; $56f0: $65
	ld   h, c                                        ; $56f1: $61
	ld   (hl), h                                     ; $56f2: $74
	jr   nz, $74                                     ; $56f3: $20 $74

	ld   l, b                                        ; $56f5: $68
	ld   l, c                                        ; $56f6: $69
	ld   (hl), e                                     ; $56f7: $73

jr_00c_56f8:
	ld   bc, $6f62                                   ; $56f8: $01 $62 $6f
	ld   (hl), e                                     ; $56fb: $73
	ld   (hl), e                                     ; $56fc: $73

jr_00c_56fd:
	ld   l, $20                                      ; $56fd: $2e $20
	ld   b, c                                        ; $56ff: $41
	jr   nz, jr_00c_5766                             ; $5700: $20 $64

	ld   l, a                                        ; $5702: $6f
	ld   l, a                                        ; $5703: $6f
	ld   (hl), d                                     ; $5704: $72
	ld   bc, $6977                                   ; $5705: $01 $77 $69
	ld   l, h                                        ; $5708: $6c
	ld   l, h                                        ; $5709: $6c
	jr   nz, $74                                     ; $570a: $20 $74

	ld   l, b                                        ; $570c: $68
	ld   h, l                                        ; $570d: $65
	ld   l, (hl)                                     ; $570e: $6e
	jr   nz, $6f                                     ; $570f: $20 $6f

jr_00c_5711:
	ld   (hl), b                                     ; $5711: $70
	ld   h, l                                        ; $5712: $65
	ld   l, (hl)                                     ; $5713: $6e
	ld   bc, $6e61                                   ; $5714: $01 $61 $6e
	ld   h, h                                        ; $5717: $64
	jr   nz, $79                                     ; $5718: $20 $79

	ld   l, a                                        ; $571a: $6f
	ld   (hl), l                                     ; $571b: $75
	jr   nz, jr_00c_5781                             ; $571c: $20 $63

	ld   h, c                                        ; $571e: $61
	ld   l, (hl)                                     ; $571f: $6e
	ld   bc, $6c63                                   ; $5720: $01 $63 $6c
	ld   h, c                                        ; $5723: $61
	ld   l, c                                        ; $5724: $69

jr_00c_5725:
	ld   l, l                                        ; $5725: $6d
	jr   nz, $74                                     ; $5726: $20 $74

	ld   l, b                                        ; $5728: $68
	ld   h, l                                        ; $5729: $65

jr_00c_572a:
	ld   bc, $7242                                   ; $572a: $01 $42 $72
	ld   h, l                                        ; $572d: $65
	ld   h, c                                        ; $572e: $61
	ld   (hl), e                                     ; $572f: $73
	ld   (hl), h                                     ; $5730: $74
	ld   (hl), b                                     ; $5731: $70
	ld   l, h                                        ; $5732: $6c
	ld   h, c                                        ; $5733: $61
	ld   (hl), h                                     ; $5734: $74
	ld   h, l                                        ; $5735: $65

jr_00c_5736:
	jr   nz, $6f                                     ; $5736: $20 $6f

	ld   h, (hl)                                     ; $5738: $66
	ld   bc, $6952                                   ; $5739: $01 $52 $69
	ld   h, a                                        ; $573c: $67
	ld   l, b                                        ; $573d: $68
	ld   (hl), h                                     ; $573e: $74
	ld   h, l                                        ; $573f: $65
	ld   l, a                                        ; $5740: $6f
	ld   (hl), l                                     ; $5741: $75

jr_00c_5742:
	ld   (hl), e                                     ; $5742: $73
	ld   l, (hl)                                     ; $5743: $6e
	ld   h, l                                        ; $5744: $65
	ld   (hl), e                                     ; $5745: $73
	ld   (hl), e                                     ; $5746: $73
	ld   l, $ff                                      ; $5747: $2e $ff
	cp   $7f                                         ; $5749: $fe $7f
	nop                                              ; $574b: $00
	nop                                              ; $574c: $00
	ld   d, h                                        ; $574d: $54
	ld   l, b                                        ; $574e: $68
	ld   l, c                                        ; $574f: $69
	ld   (hl), e                                     ; $5750: $73
	jr   nz, $64                                     ; $5751: $20 $64

	ld   l, a                                        ; $5753: $6f

jr_00c_5754:
	ld   l, a                                        ; $5754: $6f
	ld   (hl), d                                     ; $5755: $72
	jr   nz, jr_00c_57c4                             ; $5756: $20 $6c

	ld   h, l                                        ; $5758: $65
	ld   h, c                                        ; $5759: $61
	ld   h, h                                        ; $575a: $64

jr_00c_575b:
	ld   (hl), e                                     ; $575b: $73
	ld   bc, $6f74                                   ; $575c: $01 $74 $6f
	jr   nz, jr_00c_57d5                             ; $575f: $20 $74

	ld   l, b                                        ; $5761: $68
	ld   h, l                                        ; $5762: $65
	jr   nz, jr_00c_57c7                             ; $5763: $20 $62

	ld   l, a                                        ; $5765: $6f

jr_00c_5766:
	ld   (hl), e                                     ; $5766: $73
	ld   (hl), e                                     ; $5767: $73
	jr   nz, jr_00c_57dc                             ; $5768: $20 $72

	ld   l, a                                        ; $576a: $6f
	ld   l, a                                        ; $576b: $6f
	ld   l, l                                        ; $576c: $6d
	ld   bc, $6977                                   ; $576d: $01 $77 $69
	ld   (hl), h                                     ; $5770: $74
	ld   l, b                                        ; $5771: $68
	jr   nz, jr_00c_57e8                             ; $5772: $20 $74

	ld   l, b                                        ; $5774: $68
	ld   h, l                                        ; $5775: $65
	jr   nz, jr_00c_57ba                             ; $5776: $20 $42

	ld   l, a                                        ; $5778: $6f
	ld   l, a                                        ; $5779: $6f
	ld   (hl), h                                     ; $577a: $74
	ld   (hl), e                                     ; $577b: $73
	ld   bc, $666f                                   ; $577c: $01 $6f $66
	jr   nz, $74                                     ; $577f: $20 $74

jr_00c_5781:
	ld   l, b                                        ; $5781: $68
	ld   h, l                                        ; $5782: $65
	jr   nz, $47                                     ; $5783: $20 $47

	ld   l, a                                        ; $5785: $6f
	ld   (hl), e                                     ; $5786: $73
	ld   (hl), b                                     ; $5787: $70
	ld   h, l                                        ; $5788: $65
	ld   l, h                                        ; $5789: $6c
	ld   l, $01                                      ; $578a: $2e $01
	ld   b, c                                        ; $578c: $41
	ld   (hl), e                                     ; $578d: $73
	jr   nz, jr_00c_5804                             ; $578e: $20 $74

	ld   l, b                                        ; $5790: $68
	ld   h, l                                        ; $5791: $65
	jr   nz, jr_00c_5804                             ; $5792: $20 $70

	ld   (hl), d                                     ; $5794: $72
	ld   l, a                                        ; $5795: $6f
	ld   l, d                                        ; $5796: $6a
	ld   h, l                                        ; $5797: $65
	ld   h, e                                        ; $5798: $63
	dec  l                                           ; $5799: $2d
	ld   bc, $6974                                   ; $579a: $01 $74 $69
	ld   l, h                                        ; $579d: $6c
	ld   h, l                                        ; $579e: $65
	ld   (hl), e                                     ; $579f: $73
	jr   nz, jr_00c_5816                             ; $57a0: $20 $74

	ld   (hl), d                                     ; $57a2: $72
	ld   h, c                                        ; $57a3: $61
	ld   h, e                                        ; $57a4: $63
	ld   l, e                                        ; $57a5: $6b
	jr   nz, jr_00c_5821                             ; $57a6: $20 $79

	ld   l, a                                        ; $57a8: $6f
	ld   (hl), l                                     ; $57a9: $75
	inc  l                                           ; $57aa: $2c
	ld   bc, $7567                                   ; $57ab: $01 $67 $75
	ld   l, c                                        ; $57ae: $69
	ld   h, h                                        ; $57af: $64
	ld   h, l                                        ; $57b0: $65
	jr   nz, $74                                     ; $57b1: $20 $74

	ld   l, b                                        ; $57b3: $68
	ld   h, l                                        ; $57b4: $65
	ld   l, l                                        ; $57b5: $6d
	jr   nz, jr_00c_582c                             ; $57b6: $20 $74

	ld   l, a                                        ; $57b8: $6f
	dec  l                                           ; $57b9: $2d

jr_00c_57ba:
	ld   bc, $6177                                   ; $57ba: $01 $77 $61
	ld   (hl), d                                     ; $57bd: $72
	ld   h, h                                        ; $57be: $64
	ld   (hl), e                                     ; $57bf: $73
	jr   nz, $74                                     ; $57c0: $20 $74

	ld   l, b                                        ; $57c2: $68
	ld   h, l                                        ; $57c3: $65

jr_00c_57c4:
	jr   nz, jr_00c_582d                             ; $57c4: $20 $67

	ld   l, h                                        ; $57c6: $6c

jr_00c_57c7:
	ld   l, a                                        ; $57c7: $6f
	ld   (hl), a                                     ; $57c8: $77
	dec  l                                           ; $57c9: $2d
	ld   bc, $6e69                                   ; $57ca: $01 $69 $6e
	ld   h, a                                        ; $57cd: $67
	jr   nz, jr_00c_5832                             ; $57ce: $20 $62

	ld   (hl), d                                     ; $57d0: $72
	ld   l, c                                        ; $57d1: $69
	ld   h, e                                        ; $57d2: $63
	ld   l, e                                        ; $57d3: $6b
	ld   (hl), e                                     ; $57d4: $73

jr_00c_57d5:
	ld   l, $01                                      ; $57d5: $2e $01
	ld   d, l                                        ; $57d7: $55
	ld   (hl), e                                     ; $57d8: $73
	ld   h, l                                        ; $57d9: $65
	jr   nz, $74                                     ; $57da: $20 $74

jr_00c_57dc:
	ld   l, b                                        ; $57dc: $68
	ld   l, c                                        ; $57dd: $69
	ld   (hl), e                                     ; $57de: $73
	jr   nz, jr_00c_5842                             ; $57df: $20 $61

	ld   l, (hl)                                     ; $57e1: $6e
	ld   h, h                                        ; $57e2: $64
	ld   bc, $6976                                   ; $57e3: $01 $76 $69
	ld   h, c                                        ; $57e6: $61
	ld   l, h                                        ; $57e7: $6c

jr_00c_57e8:
	ld   (hl), e                                     ; $57e8: $73
	jr   nz, $74                                     ; $57e9: $20 $74

	ld   l, a                                        ; $57eb: $6f
	jr   nz, jr_00c_5851                             ; $57ec: $20 $63

	ld   l, h                                        ; $57ee: $6c
	ld   h, l                                        ; $57ef: $65
	ld   h, c                                        ; $57f0: $61
	ld   (hl), d                                     ; $57f1: $72
	jr   nz, jr_00c_5855                             ; $57f2: $20 $61

	ld   bc, $6170                                   ; $57f4: $01 $70 $61
	ld   (hl), h                                     ; $57f7: $74
	ld   l, b                                        ; $57f8: $68
	jr   nz, jr_00c_586f                             ; $57f9: $20 $74

	ld   l, a                                        ; $57fb: $6f
	jr   nz, jr_00c_5872                             ; $57fc: $20 $74

	ld   l, b                                        ; $57fe: $68
	ld   h, l                                        ; $57ff: $65
	jr   nz, jr_00c_5876                             ; $5800: $20 $74

	ld   l, a                                        ; $5802: $6f
	ld   (hl), b                                     ; $5803: $70

jr_00c_5804:
	ld   l, $ff                                      ; $5804: $2e $ff
	cp   $7f                                         ; $5806: $fe $7f
	ld   bc, $4100                                   ; $5808: $01 $00 $41
	ld   (hl), d                                     ; $580b: $72
	ld   h, l                                        ; $580c: $65
	jr   nz, jr_00c_5888                             ; $580d: $20 $79

	ld   l, a                                        ; $580f: $6f
	ld   (hl), l                                     ; $5810: $75
	jr   nz, $72                                     ; $5811: $20 $72

	ld   h, l                                        ; $5813: $65
	ld   h, c                                        ; $5814: $61
	ld   h, h                                        ; $5815: $64

jr_00c_5816:
	ld   a, c                                        ; $5816: $79
	ld   bc, $6f66                                   ; $5817: $01 $66 $6f
	ld   (hl), d                                     ; $581a: $72
	jr   nz, jr_00c_5891                             ; $581b: $20 $74

	ld   l, b                                        ; $581d: $68
	ld   h, l                                        ; $581e: $65
	jr   nz, jr_00c_5869                             ; $581f: $20 $48

jr_00c_5821:
	ld   h, l                                        ; $5821: $65
	ld   l, h                                        ; $5822: $6c
	ld   l, l                                        ; $5823: $6d
	ld   h, l                                        ; $5824: $65
	ld   (hl), h                                     ; $5825: $74
	ld   bc, $666f                                   ; $5826: $01 $6f $66
	jr   nz, jr_00c_587e                             ; $5829: $20 $53

	ld   h, c                                        ; $582b: $61

jr_00c_582c:
	ld   l, h                                        ; $582c: $6c

jr_00c_582d:
	.db  $76                                         ; $582d: $76
	ld   h, c                                        ; $582e: $61
	ld   (hl), h                                     ; $582f: $74
	ld   l, c                                        ; $5830: $69
	ld   l, a                                        ; $5831: $6f

jr_00c_5832:
	ld   l, (hl)                                     ; $5832: $6e
	ccf                                              ; $5833: $3f
	ld   bc, $6f59                                   ; $5834: $01 $59 $6f
	ld   (hl), l                                     ; $5837: $75
	daa                                              ; $5838: $27
	ld   l, h                                        ; $5839: $6c
	ld   l, h                                        ; $583a: $6c
	jr   nz, $6e                                     ; $583b: $20 $6e

	ld   h, l                                        ; $583d: $65
	ld   h, l                                        ; $583e: $65
	ld   h, h                                        ; $583f: $64
	jr   nz, jr_00c_58b6                             ; $5840: $20 $74

jr_00c_5842:
	ld   l, b                                        ; $5842: $68
	ld   h, l                                        ; $5843: $65
	ld   bc, $614a                                   ; $5844: $01 $4a $61
	ld   (hl), a                                     ; $5847: $77
	ld   h, d                                        ; $5848: $62
	ld   l, a                                        ; $5849: $6f
	ld   l, (hl)                                     ; $584a: $6e
	ld   h, l                                        ; $584b: $65
	jr   nz, jr_00c_58c2                             ; $584c: $20 $74

	ld   l, a                                        ; $584e: $6f
	jr   nz, jr_00c_58bc                             ; $584f: $20 $6b

jr_00c_5851:
	ld   l, (hl)                                     ; $5851: $6e
	ld   l, a                                        ; $5852: $6f
	ld   h, e                                        ; $5853: $63
	ld   l, e                                        ; $5854: $6b

jr_00c_5855:
	ld   bc, $6162                                   ; $5855: $01 $62 $61
	ld   h, e                                        ; $5858: $63
	ld   l, e                                        ; $5859: $6b
	jr   nz, $74                                     ; $585a: $20 $74

	ld   l, b                                        ; $585c: $68
	ld   h, l                                        ; $585d: $65
	jr   nz, jr_00c_58c3                             ; $585e: $20 $63

	ld   l, b                                        ; $5860: $68
	ld   h, l                                        ; $5861: $65
	ld   (hl), d                                     ; $5862: $72
	dec  l                                           ; $5863: $2d

$5864:
	ld   bc, $6972                                   ; $5864: $01 $72 $69
	ld   h, l                                        ; $5867: $65
	ld   (hl), e                                     ; $5868: $73

jr_00c_5869:
	ld   l, $20                                      ; $5869: $2e $20
	ld   c, a                                        ; $586b: $4f
	ld   l, (hl)                                     ; $586c: $6e
	ld   h, e                                        ; $586d: $63
	ld   h, l                                        ; $586e: $65

jr_00c_586f:
	jr   nz, jr_00c_58d2                             ; $586f: $20 $61

	ld   l, h                                        ; $5871: $6c

jr_00c_5872:
	ld   l, h                                        ; $5872: $6c
	ld   bc, $6874                                   ; $5873: $01 $74 $68

jr_00c_5876:
	ld   h, l                                        ; $5876: $65
	jr   nz, jr_00c_58dc                             ; $5877: $20 $63

	ld   l, b                                        ; $5879: $68
	ld   h, l                                        ; $587a: $65
	ld   (hl), d                                     ; $587b: $72
	ld   (hl), d                                     ; $587c: $72
	ld   l, c                                        ; $587d: $69

jr_00c_587e:
	ld   h, l                                        ; $587e: $65
	ld   (hl), e                                     ; $587f: $73
	jr   nz, jr_00c_58e3                             ; $5880: $20 $61

	ld   (hl), d                                     ; $5882: $72
	ld   h, l                                        ; $5883: $65
	ld   bc, $6f67                                   ; $5884: $01 $67 $6f
	ld   l, (hl)                                     ; $5887: $6e

jr_00c_5888:
	ld   h, l                                        ; $5888: $65
	inc  l                                           ; $5889: $2c
	jr   nz, $61                                     ; $588a: $20 $61

	ld   l, (hl)                                     ; $588c: $6e
	jr   nz, jr_00c_58f4                             ; $588d: $20 $65

	ld   a, b                                        ; $588f: $78
	ld   l, c                                        ; $5890: $69

jr_00c_5891:
	ld   (hl), h                                     ; $5891: $74
	ld   bc, $6977                                   ; $5892: $01 $77 $69
	ld   l, h                                        ; $5895: $6c
	ld   l, h                                        ; $5896: $6c
	jr   nz, jr_00c_58fa                             ; $5897: $20 $61

	ld   (hl), b                                     ; $5899: $70
	ld   (hl), b                                     ; $589a: $70
	ld   h, l                                        ; $589b: $65
	ld   h, c                                        ; $589c: $61
	ld   (hl), d                                     ; $589d: $72
	ld   l, $ff                                      ; $589e: $2e $ff
	cp   $7f                                         ; $58a0: $fe $7f
	nop                                              ; $58a2: $00
	nop                                              ; $58a3: $00
	ld   c, c                                        ; $58a4: $49
	jr   nz, $68                                     ; $58a5: $20 $68

	ld   l, a                                        ; $58a7: $6f
	ld   (hl), b                                     ; $58a8: $70
	ld   h, l                                        ; $58a9: $65
	jr   nz, $79                                     ; $58aa: $20 $79

	ld   l, a                                        ; $58ac: $6f
	ld   (hl), l                                     ; $58ad: $75
	jr   nz, $68                                     ; $58ae: $20 $68

	ld   h, c                                        ; $58b0: $61
	.db  $76                                         ; $58b1: $76
	ld   h, l                                        ; $58b2: $65
	ld   bc, $6c70                                   ; $58b3: $01 $70 $6c

jr_00c_58b6:
	ld   h, l                                        ; $58b6: $65
	ld   l, (hl)                                     ; $58b7: $6e
	ld   (hl), h                                     ; $58b8: $74
	ld   a, c                                        ; $58b9: $79
	jr   nz, jr_00c_592b                             ; $58ba: $20 $6f

jr_00c_58bc:
	ld   h, (hl)                                     ; $58bc: $66
	jr   nz, jr_00c_5935                             ; $58bd: $20 $76

	ld   l, c                                        ; $58bf: $69
	ld   h, c                                        ; $58c0: $61
	ld   l, h                                        ; $58c1: $6c

jr_00c_58c2:
	ld   (hl), e                                     ; $58c2: $73

jr_00c_58c3:
	ld   l, $01                                      ; $58c3: $2e $01
	ld   d, h                                        ; $58c5: $54
	ld   l, b                                        ; $58c6: $68
	ld   h, l                                        ; $58c7: $65
	jr   nz, jr_00c_5931                             ; $58c8: $20 $67

	ld   (hl), l                                     ; $58ca: $75
	ld   a, c                                        ; $58cb: $79
	jr   nz, jr_00c_592f                             ; $58cc: $20 $61

	ld   (hl), h                                     ; $58ce: $74
	jr   nz, $74                                     ; $58cf: $20 $74

	ld   l, b                                        ; $58d1: $68

jr_00c_58d2:
	ld   h, l                                        ; $58d2: $65
	ld   bc, $6f74                                   ; $58d3: $01 $74 $6f
	ld   (hl), b                                     ; $58d6: $70
	jr   nz, jr_00c_5948                             ; $58d7: $20 $6f

	ld   h, (hl)                                     ; $58d9: $66
	jr   nz, jr_00c_5950                             ; $58da: $20 $74

jr_00c_58dc:
	ld   l, b                                        ; $58dc: $68
	ld   l, c                                        ; $58dd: $69
	ld   (hl), e                                     ; $58de: $73
	jr   nz, jr_00c_5953                             ; $58df: $20 $72

	ld   l, a                                        ; $58e1: $6f
	ld   l, a                                        ; $58e2: $6f

jr_00c_58e3:
	ld   l, l                                        ; $58e3: $6d
	ld   bc, $6174                                   ; $58e4: $01 $74 $61
	ld   l, e                                        ; $58e7: $6b
	ld   h, l                                        ; $58e8: $65
	ld   (hl), e                                     ; $58e9: $73
	jr   nz, $33                                     ; $58ea: $20 $33

	jr   nz, $76                                     ; $58ec: $20 $76

	ld   l, c                                        ; $58ee: $69
	ld   h, c                                        ; $58ef: $61
	ld   l, h                                        ; $58f0: $6c
	ld   bc, $6c62                                   ; $58f1: $01 $62 $6c

jr_00c_58f4:
	ld   h, c                                        ; $58f4: $61
	ld   (hl), e                                     ; $58f5: $73
	ld   (hl), h                                     ; $58f6: $74
	ld   (hl), e                                     ; $58f7: $73
	jr   nz, jr_00c_595c                             ; $58f8: $20 $62

jr_00c_58fa:
	ld   h, l                                        ; $58fa: $65
	ld   h, (hl)                                     ; $58fb: $66
	ld   l, a                                        ; $58fc: $6f
	ld   (hl), d                                     ; $58fd: $72
	ld   h, l                                        ; $58fe: $65
	ld   bc, $6568                                   ; $58ff: $01 $68 $65
	daa                                              ; $5902: $27
	ld   l, h                                        ; $5903: $6c
	ld   l, h                                        ; $5904: $6c
	jr   nz, jr_00c_5976                             ; $5905: $20 $6f

	ld   (hl), b                                     ; $5907: $70
	ld   h, l                                        ; $5908: $65
	ld   l, (hl)                                     ; $5909: $6e
	jr   nz, $74                                     ; $590a: $20 $74

	ld   l, b                                        ; $590c: $68
	ld   h, l                                        ; $590d: $65
	ld   bc, $6874                                   ; $590e: $01 $74 $68
	ld   h, l                                        ; $5911: $65
	jr   nz, $64                                     ; $5912: $20 $64

	ld   l, a                                        ; $5914: $6f
	ld   l, a                                        ; $5915: $6f
	ld   (hl), d                                     ; $5916: $72
	jr   nz, jr_00c_598d                             ; $5917: $20 $74

	ld   l, a                                        ; $5919: $6f
	jr   nz, jr_00c_5990                             ; $591a: $20 $74

	ld   l, b                                        ; $591c: $68
	ld   h, l                                        ; $591d: $65
	ld   bc, $7753                                   ; $591e: $01 $53 $77
	ld   l, a                                        ; $5921: $6f
	ld   (hl), d                                     ; $5922: $72
	ld   h, h                                        ; $5923: $64
	jr   nz, jr_00c_5995                             ; $5924: $20 $6f

	ld   h, (hl)                                     ; $5926: $66
	jr   nz, jr_00c_599d                             ; $5927: $20 $74

	ld   l, b                                        ; $5929: $68
	ld   h, l                                        ; $592a: $65

jr_00c_592b:
	ld   bc, $7053                                   ; $592b: $01 $53 $70
	ld   l, c                                        ; $592e: $69

jr_00c_592f:
	ld   (hl), d                                     ; $592f: $72
	ld   l, c                                        ; $5930: $69

jr_00c_5931:
	ld   (hl), h                                     ; $5931: $74
	ld   l, $20                                      ; $5932: $2e $20
	ld   c, b                                        ; $5934: $48

jr_00c_5935:
	ld   l, c                                        ; $5935: $69
	ld   (hl), e                                     ; $5936: $73
	ld   bc, $6568                                   ; $5937: $01 $68 $65
	ld   l, h                                        ; $593a: $6c
	ld   (hl), b                                     ; $593b: $70
	ld   h, l                                        ; $593c: $65
	ld   (hl), d                                     ; $593d: $72
	ld   (hl), e                                     ; $593e: $73
	jr   nz, jr_00c_59b8                             ; $593f: $20 $77

	ld   l, c                                        ; $5941: $69
	ld   l, h                                        ; $5942: $6c
	ld   l, h                                        ; $5943: $6c
	ld   bc, $6e6f                                   ; $5944: $01 $6f $6e
	ld   l, h                                        ; $5947: $6c

jr_00c_5948:
	ld   a, c                                        ; $5948: $79
	jr   nz, jr_00c_59b2                             ; $5949: $20 $67

	ld   l, a                                        ; $594b: $6f
	jr   nz, jr_00c_59af                             ; $594c: $20 $61

	ld   (hl), a                                     ; $594e: $77
	ld   h, c                                        ; $594f: $61

jr_00c_5950:
	ld   a, c                                        ; $5950: $79
	rst  $38                                         ; $5951: $ff
	ld   b, d                                        ; $5952: $42

jr_00c_5953:
	add  hl, de                                      ; $5953: $19
	cp   $fd                                         ; $5954: $fe $fd
	nop                                              ; $5956: $00
	nop                                              ; $5957: $00
	ld   (hl), a                                     ; $5958: $77
	ld   l, b                                        ; $5959: $68
	ld   h, l                                        ; $595a: $65
	ld   l, (hl)                                     ; $595b: $6e

jr_00c_595c:
	jr   nz, jr_00c_59ce                             ; $595c: $20 $70

	ld   (hl), l                                     ; $595e: $75
	ld   (hl), e                                     ; $595f: $73
	ld   l, b                                        ; $5960: $68
	ld   h, l                                        ; $5961: $65
	ld   h, h                                        ; $5962: $64
	jr   nz, jr_00c_59c7                             ; $5963: $20 $62

	ld   a, c                                        ; $5965: $79
	jr   nz, jr_00c_59c9                             ; $5966: $20 $61

	ld   bc, $6162                                   ; $5968: $01 $62 $61
	ld   (hl), d                                     ; $596b: $72
	ld   (hl), d                                     ; $596c: $72
	ld   h, l                                        ; $596d: $65
	ld   l, h                                        ; $596e: $6c
	ld   l, $20                                      ; $596f: $2e $20
	ld   c, b                                        ; $5971: $48
	ld   l, c                                        ; $5972: $69

$5973:
	ld   h, h                                        ; $5973: $64
	ld   h, h                                        ; $5974: $64
	ld   h, l                                        ; $5975: $65

jr_00c_5976:
	ld   l, (hl)                                     ; $5976: $6e
	ld   bc, $616c                                   ; $5977: $01 $6c $61
	ld   h, h                                        ; $597a: $64
	ld   h, h                                        ; $597b: $64
	ld   h, l                                        ; $597c: $65
	ld   (hl), d                                     ; $597d: $72
	ld   (hl), e                                     ; $597e: $73
	jr   nz, $63                                     ; $597f: $20 $63

	ld   h, c                                        ; $5981: $61
	ld   l, (hl)                                     ; $5982: $6e
	jr   nz, jr_00c_59e6                             ; $5983: $20 $61

	ld   l, h                                        ; $5985: $6c
	ld   (hl), e                                     ; $5986: $73
	ld   l, a                                        ; $5987: $6f
	ld   bc, $6562                                   ; $5988: $01 $62 $65
	jr   nz, $65                                     ; $598b: $20 $65

jr_00c_598d:
	ld   a, b                                        ; $598d: $78
	ld   (hl), b                                     ; $598e: $70
	ld   l, a                                        ; $598f: $6f

jr_00c_5990:
	ld   (hl), e                                     ; $5990: $73
	ld   h, l                                        ; $5991: $65
	ld   h, h                                        ; $5992: $64
	jr   nz, jr_00c_5a0c                             ; $5993: $20 $77

jr_00c_5995:
	ld   l, c                                        ; $5995: $69
	ld   (hl), h                                     ; $5996: $74
	ld   l, b                                        ; $5997: $68
	ld   bc, $6976                                   ; $5998: $01 $76 $69
	ld   h, c                                        ; $599b: $61
	ld   l, h                                        ; $599c: $6c

jr_00c_599d:
	jr   nz, jr_00c_5a01                             ; $599d: $20 $62

	ld   l, h                                        ; $599f: $6c
	ld   h, c                                        ; $59a0: $61
	ld   (hl), e                                     ; $59a1: $73
	ld   (hl), h                                     ; $59a2: $74
	ld   (hl), e                                     ; $59a3: $73
	ld   l, $20                                      ; $59a4: $2e $20
	ld   d, h                                        ; $59a6: $54
	ld   l, b                                        ; $59a7: $68
	ld   h, l                                        ; $59a8: $65
	ld   bc, $6e65                                   ; $59a9: $01 $65 $6e
	ld   (hl), h                                     ; $59ac: $74
	ld   (hl), d                                     ; $59ad: $72
	ld   h, c                                        ; $59ae: $61

jr_00c_59af:
	ld   l, (hl)                                     ; $59af: $6e
	ld   h, e                                        ; $59b0: $63
	ld   h, l                                        ; $59b1: $65

jr_00c_59b2:
	jr   nz, $74                                     ; $59b2: $20 $74

	ld   l, a                                        ; $59b4: $6f
	jr   nz, jr_00c_5a2b                             ; $59b5: $20 $74

	ld   l, b                                        ; $59b7: $68

jr_00c_59b8:
	ld   l, c                                        ; $59b8: $69
	ld   (hl), e                                     ; $59b9: $73
	ld   bc, $6f72                                   ; $59ba: $01 $72 $6f
	ld   l, a                                        ; $59bd: $6f
	ld   l, l                                        ; $59be: $6d
	jr   nz, jr_00c_5a2a                             ; $59bf: $20 $69

	ld   (hl), e                                     ; $59c1: $73
	jr   nz, jr_00c_5a2c                             ; $59c2: $20 $68

	ld   l, c                                        ; $59c4: $69
	ld   h, h                                        ; $59c5: $64
	ld   h, h                                        ; $59c6: $64

jr_00c_59c7:
	ld   h, l                                        ; $59c7: $65
	ld   l, (hl)                                     ; $59c8: $6e

jr_00c_59c9:
	ld   l, $01                                      ; $59c9: $2e $01
	ld   d, l                                        ; $59cb: $55
	ld   (hl), e                                     ; $59cc: $73
	ld   h, l                                        ; $59cd: $65

jr_00c_59ce:
	jr   nz, jr_00c_5a46                             ; $59ce: $20 $76

	ld   l, c                                        ; $59d0: $69
	ld   h, c                                        ; $59d1: $61
	ld   l, h                                        ; $59d2: $6c
	ld   (hl), e                                     ; $59d3: $73
	jr   nz, $74                                     ; $59d4: $20 $74

	ld   l, a                                        ; $59d6: $6f
	ld   bc, $7865                                   ; $59d7: $01 $65 $78
	ld   (hl), b                                     ; $59da: $70
	ld   l, a                                        ; $59db: $6f
	ld   (hl), e                                     ; $59dc: $73
	ld   h, l                                        ; $59dd: $65
	jr   nz, jr_00c_5a49                             ; $59de: $20 $69

	ld   (hl), h                                     ; $59e0: $74
	ld   l, $ff                                      ; $59e1: $2e $ff
	cp   $7f                                         ; $59e3: $fe $7f
	nop                                              ; $59e5: $00

jr_00c_59e6:
	nop                                              ; $59e6: $00
	ld   d, h                                        ; $59e7: $54
	ld   l, b                                        ; $59e8: $68
	ld   h, l                                        ; $59e9: $65
	jr   nz, jr_00c_5a3f                             ; $59ea: $20 $53

	ld   l, b                                        ; $59ec: $68
	ld   l, c                                        ; $59ed: $69
	ld   h, l                                        ; $59ee: $65
	ld   l, h                                        ; $59ef: $6c
	ld   h, h                                        ; $59f0: $64
	jr   nz, jr_00c_5a62                             ; $59f1: $20 $6f

	ld   h, (hl)                                     ; $59f3: $66
	ld   bc, $6146                                   ; $59f4: $01 $46 $61
	ld   l, c                                        ; $59f7: $69
	ld   (hl), h                                     ; $59f8: $74
	ld   l, b                                        ; $59f9: $68
	jr   nz, jr_00c_5a5d                             ; $59fa: $20 $61

	ld   (hl), a                                     ; $59fc: $77
	ld   h, c                                        ; $59fd: $61
	ld   l, c                                        ; $59fe: $69
	ld   (hl), h                                     ; $59ff: $74
	ld   (hl), e                                     ; $5a00: $73

jr_00c_5a01:
	ld   bc, $6f79                                   ; $5a01: $01 $79 $6f
	ld   (hl), l                                     ; $5a04: $75
	inc  l                                           ; $5a05: $2c
	jr   nz, jr_00c_5a6a                             ; $5a06: $20 $62

	ld   (hl), l                                     ; $5a08: $75
	ld   (hl), h                                     ; $5a09: $74

$5a0a:
	jr   nz, jr_00c_5a72                             ; $5a0a: $20 $66

jr_00c_5a0c:
	ld   l, c                                        ; $5a0c: $69
	ld   (hl), d                                     ; $5a0d: $72
	ld   (hl), e                                     ; $5a0e: $73
	ld   (hl), h                                     ; $5a0f: $74
	ld   bc, $6f79                                   ; $5a10: $01 $79 $6f
	ld   (hl), l                                     ; $5a13: $75
	jr   nz, jr_00c_5a83                             ; $5a14: $20 $6d

	ld   (hl), l                                     ; $5a16: $75
	ld   (hl), e                                     ; $5a17: $73
	ld   (hl), h                                     ; $5a18: $74
	jr   nz, jr_00c_5a82                             ; $5a19: $20 $67

	ld   h, l                                        ; $5a1b: $65
	ld   (hl), h                                     ; $5a1c: $74
	ld   bc, $6170                                   ; $5a1d: $01 $70 $61
	ld   (hl), e                                     ; $5a20: $73
	ld   (hl), h                                     ; $5a21: $74
	jr   nz, $74                                     ; $5a22: $20 $74

	ld   l, b                                        ; $5a24: $68
	ld   l, c                                        ; $5a25: $69
	ld   (hl), e                                     ; $5a26: $73
	jr   nz, jr_00c_5a9b                             ; $5a27: $20 $72

	ld   l, a                                        ; $5a29: $6f

jr_00c_5a2a:
	ld   l, a                                        ; $5a2a: $6f

jr_00c_5a2b:
	ld   l, l                                        ; $5a2b: $6d

jr_00c_5a2c:
	ld   l, $01                                      ; $5a2c: $2e $01
	ld   b, c                                        ; $5a2e: $41
	ld   l, (hl)                                     ; $5a2f: $6e
	jr   nz, jr_00c_5a97                             ; $5a30: $20 $65

	.db  $76                                         ; $5a32: $76
	ld   l, c                                        ; $5a33: $69
	ld   l, h                                        ; $5a34: $6c
	jr   nz, $73                                     ; $5a35: $20 $73

	ld   (hl), b                                     ; $5a37: $70
	ld   l, c                                        ; $5a38: $69
	ld   (hl), d                                     ; $5a39: $72
	ld   l, c                                        ; $5a3a: $69
	ld   (hl), h                                     ; $5a3b: $74
	ld   bc, $6c66                                   ; $5a3c: $01 $66 $6c

jr_00c_5a3f:
	ld   l, c                                        ; $5a3f: $69
	ld   h, l                                        ; $5a40: $65
	ld   (hl), e                                     ; $5a41: $73
	jr   nz, jr_00c_5aa5                             ; $5a42: $20 $61

	ld   h, e                                        ; $5a44: $63
	ld   (hl), d                                     ; $5a45: $72

jr_00c_5a46:
	ld   l, a                                        ; $5a46: $6f
	ld   (hl), e                                     ; $5a47: $73
	ld   (hl), e                                     ; $5a48: $73

jr_00c_5a49:
	jr   nz, jr_00c_5abf                             ; $5a49: $20 $74

	ld   l, b                                        ; $5a4b: $68
	ld   h, l                                        ; $5a4c: $65
	ld   bc, $6f74                                   ; $5a4d: $01 $74 $6f
	ld   (hl), b                                     ; $5a50: $70
	ld   l, $20                                      ; $5a51: $2e $20
	ld   c, a                                        ; $5a53: $4f
	ld   l, (hl)                                     ; $5a54: $6e
	ld   h, l                                        ; $5a55: $65
	jr   nz, jr_00c_5ac0                             ; $5a56: $20 $68

	ld   l, c                                        ; $5a58: $69
	ld   (hl), h                                     ; $5a59: $74
	ld   bc, $7266                                   ; $5a5a: $01 $66 $72

jr_00c_5a5d:
	ld   l, a                                        ; $5a5d: $6f
	ld   l, l                                        ; $5a5e: $6d
	jr   nz, jr_00c_5ada                             ; $5a5f: $20 $79

	ld   l, a                                        ; $5a61: $6f

jr_00c_5a62:
	ld   (hl), l                                     ; $5a62: $75
	ld   (hl), d                                     ; $5a63: $72
	jr   nz, jr_00c_5ab9                             ; $5a64: $20 $53

	ld   (hl), a                                     ; $5a66: $77
	ld   l, a                                        ; $5a67: $6f
	ld   (hl), d                                     ; $5a68: $72
	ld   h, h                                        ; $5a69: $64

jr_00c_5a6a:
	ld   bc, $6977                                   ; $5a6a: $01 $77 $69
	ld   l, h                                        ; $5a6d: $6c
	ld   l, h                                        ; $5a6e: $6c
	jr   nz, jr_00c_5ade                             ; $5a6f: $20 $6d

	ld   h, c                                        ; $5a71: $61

jr_00c_5a72:
	ld   l, e                                        ; $5a72: $6b
	ld   h, l                                        ; $5a73: $65
	jr   nz, jr_00c_5ade                             ; $5a74: $20 $68

	ld   l, c                                        ; $5a76: $69
	ld   l, l                                        ; $5a77: $6d
	ld   bc, $7576                                   ; $5a78: $01 $76 $75
	ld   l, h                                        ; $5a7b: $6c
	ld   l, (hl)                                     ; $5a7c: $6e
	ld   h, l                                        ; $5a7d: $65
	ld   (hl), d                                     ; $5a7e: $72
	ld   h, c                                        ; $5a7f: $61
	ld   h, d                                        ; $5a80: $62
	ld   l, h                                        ; $5a81: $6c

jr_00c_5a82:
	ld   h, l                                        ; $5a82: $65

jr_00c_5a83:
	ld   l, $01                                      ; $5a83: $2e $01
	ld   d, a                                        ; $5a85: $57
	ld   l, c                                        ; $5a86: $69
	ld   (hl), h                                     ; $5a87: $74
	ld   l, b                                        ; $5a88: $68
	ld   l, c                                        ; $5a89: $69
	ld   l, (hl)                                     ; $5a8a: $6e
	jr   nz, jr_00c_5aee                             ; $5a8b: $20 $61

	jr   nz, jr_00c_5af2                             ; $5a8d: $20 $63

	ld   l, a                                        ; $5a8f: $6f
	ld   (hl), l                                     ; $5a90: $75
	ld   (hl), b                                     ; $5a91: $70
	ld   l, h                                        ; $5a92: $6c
	ld   h, l                                        ; $5a93: $65
	rst  $38                                         ; $5a94: $ff
	ld   b, d                                        ; $5a95: $42
	add  hl, de                                      ; $5a96: $19

jr_00c_5a97:
	cp   $fd                                         ; $5a97: $fe $fd
	nop                                              ; $5a99: $00
	nop                                              ; $5a9a: $00

jr_00c_5a9b:
	ld   l, a                                        ; $5a9b: $6f
	ld   h, (hl)                                     ; $5a9c: $66
	jr   nz, jr_00c_5b12                             ; $5a9d: $20 $73

	ld   h, l                                        ; $5a9f: $65
	ld   h, e                                        ; $5aa0: $63
	ld   l, a                                        ; $5aa1: $6f
	ld   l, (hl)                                     ; $5aa2: $6e
	ld   h, h                                        ; $5aa3: $64
	ld   (hl), e                                     ; $5aa4: $73

$5aa5:
jr_00c_5aa5:
	jr   nz, $79                                     ; $5aa5: $20 $79

	ld   l, a                                        ; $5aa7: $6f
	ld   (hl), l                                     ; $5aa8: $75
	ld   bc, $756d                                   ; $5aa9: $01 $6d $75
	ld   (hl), e                                     ; $5aac: $73
	ld   (hl), h                                     ; $5aad: $74
	jr   nz, $68                                     ; $5aae: $20 $68

	ld   l, c                                        ; $5ab0: $69
	ld   (hl), h                                     ; $5ab1: $74
	jr   nz, jr_00c_5b1c                             ; $5ab2: $20 $68

	ld   l, c                                        ; $5ab4: $69
	ld   l, l                                        ; $5ab5: $6d
	ld   bc, $6761                                   ; $5ab6: $01 $61 $67

jr_00c_5ab9:
	ld   h, c                                        ; $5ab9: $61
	ld   l, c                                        ; $5aba: $69
	ld   l, (hl)                                     ; $5abb: $6e
	jr   nz, jr_00c_5b35                             ; $5abc: $20 $77

	ld   l, c                                        ; $5abe: $69

jr_00c_5abf:
	ld   (hl), h                                     ; $5abf: $74

jr_00c_5ac0:
	ld   l, b                                        ; $5ac0: $68
	jr   nz, jr_00c_5b3c                             ; $5ac1: $20 $79

	ld   l, a                                        ; $5ac3: $6f
	ld   (hl), l                                     ; $5ac4: $75
	ld   (hl), d                                     ; $5ac5: $72
	ld   bc, $7773                                   ; $5ac6: $01 $73 $77
	ld   l, a                                        ; $5ac9: $6f
	ld   (hl), d                                     ; $5aca: $72
	ld   h, h                                        ; $5acb: $64
	ld   l, $20                                      ; $5acc: $2e $20
	ld   b, d                                        ; $5ace: $42
	ld   h, l                                        ; $5acf: $65
	jr   nz, jr_00c_5b42                             ; $5ad0: $20 $70

	ld   h, c                                        ; $5ad2: $61
	dec  l                                           ; $5ad3: $2d
	ld   bc, $6974                                   ; $5ad4: $01 $74 $69
	ld   h, l                                        ; $5ad7: $65
	ld   l, (hl)                                     ; $5ad8: $6e
	ld   (hl), h                                     ; $5ad9: $74

jr_00c_5ada:
	jr   nz, jr_00c_5b3d                             ; $5ada: $20 $61

	ld   l, (hl)                                     ; $5adc: $6e
	ld   h, h                                        ; $5add: $64

jr_00c_5ade:
	jr   nz, jr_00c_5b46                             ; $5ade: $20 $66

	ld   l, c                                        ; $5ae0: $69
	ld   h, a                                        ; $5ae1: $67
	ld   l, b                                        ; $5ae2: $68
	ld   (hl), h                                     ; $5ae3: $74
	ld   bc, $6168                                   ; $5ae4: $01 $68 $61
	ld   (hl), d                                     ; $5ae7: $72
	ld   h, h                                        ; $5ae8: $64
	ld   l, $20                                      ; $5ae9: $2e $20
	ld   d, a                                        ; $5aeb: $57
	ld   h, c                                        ; $5aec: $61
	ld   (hl), h                                     ; $5aed: $74

jr_00c_5aee:
	ld   h, e                                        ; $5aee: $63
	ld   l, b                                        ; $5aef: $68
	jr   nz, jr_00c_5b61                             ; $5af0: $20 $6f

jr_00c_5af2:
	ld   (hl), l                                     ; $5af2: $75
	ld   (hl), h                                     ; $5af3: $74
	ld   bc, $6f66                                   ; $5af4: $01 $66 $6f
	ld   (hl), d                                     ; $5af7: $72
	jr   nz, jr_00c_5b60                             ; $5af8: $20 $66

	ld   l, c                                        ; $5afa: $69
	ld   h, l                                        ; $5afb: $65
	ld   (hl), d                                     ; $5afc: $72
	ld   a, c                                        ; $5afd: $79
	jr   nz, jr_00c_5b64                             ; $5afe: $20 $64

	ld   (hl), d                                     ; $5b00: $72
	ld   l, a                                        ; $5b01: $6f
	ld   (hl), b                                     ; $5b02: $70
	ld   (hl), e                                     ; $5b03: $73
	ld   hl, $feff                                   ; $5b04: $21 $ff $fe
	ld   a, a                                        ; $5b07: $7f
	nop                                              ; $5b08: $00
	nop                                              ; $5b09: $00
	ld   e, c                                        ; $5b0a: $59
	ld   l, a                                        ; $5b0b: $6f
	ld   (hl), l                                     ; $5b0c: $75
	jr   nz, jr_00c_5b77                             ; $5b0d: $20 $68

	ld   h, c                                        ; $5b0f: $61
	.db  $76                                         ; $5b10: $76
	ld   h, l                                        ; $5b11: $65

jr_00c_5b12:
	jr   nz, jr_00c_5b78                             ; $5b12: $20 $64

	ld   l, a                                        ; $5b14: $6f
	ld   l, (hl)                                     ; $5b15: $6e
	ld   h, l                                        ; $5b16: $65
	ld   bc, $6f73                                   ; $5b17: $01 $73 $6f
	jr   nz, $77                                     ; $5b1a: $20 $77

jr_00c_5b1c:
	ld   h, l                                        ; $5b1c: $65
	ld   l, h                                        ; $5b1d: $6c
	ld   l, h                                        ; $5b1e: $6c
	ld   hl, $4e20                                   ; $5b1f: $21 $20 $4e
	ld   l, a                                        ; $5b22: $6f
	ld   (hl), a                                     ; $5b23: $77
	ld   bc, $6f63                                   ; $5b24: $01 $63 $6f
	ld   l, l                                        ; $5b27: $6d
	ld   h, l                                        ; $5b28: $65
	ld   (hl), e                                     ; $5b29: $73
	jr   nz, jr_00c_5ba5                             ; $5b2a: $20 $79

	ld   l, a                                        ; $5b2c: $6f
	ld   (hl), l                                     ; $5b2d: $75
	ld   (hl), d                                     ; $5b2e: $72
	ld   bc, $6c75                                   ; $5b2f: $01 $75 $6c
	ld   (hl), h                                     ; $5b32: $74
	ld   l, c                                        ; $5b33: $69
	ld   l, l                                        ; $5b34: $6d

jr_00c_5b35:
	ld   h, c                                        ; $5b35: $61
	ld   (hl), h                                     ; $5b36: $74
	ld   h, l                                        ; $5b37: $65
	jr   nz, jr_00c_5b9d                             ; $5b38: $20 $63

	ld   l, b                                        ; $5b3a: $68
	ld   h, c                                        ; $5b3b: $61

jr_00c_5b3c:
	ld   l, h                                        ; $5b3c: $6c

jr_00c_5b3d:
	dec  l                                           ; $5b3d: $2d
	ld   bc, $656c                                   ; $5b3e: $01 $6c $65
	ld   l, (hl)                                     ; $5b41: $6e

jr_00c_5b42:
	ld   h, a                                        ; $5b42: $67
	ld   h, l                                        ; $5b43: $65
	ld   l, $20                                      ; $5b44: $2e $20

jr_00c_5b46:
	ld   d, h                                        ; $5b46: $54
	ld   l, b                                        ; $5b47: $68
	ld   l, c                                        ; $5b48: $69
	ld   (hl), e                                     ; $5b49: $73
	jr   nz, jr_00c_5bb3                             ; $5b4a: $20 $67

	ld   (hl), l                                     ; $5b4c: $75
	ld   a, c                                        ; $5b4d: $79
	ld   bc, $7369                                   ; $5b4e: $01 $69 $73
	jr   nz, jr_00c_5bc7                             ; $5b51: $20 $74

	ld   l, a                                        ; $5b53: $6f
	ld   (hl), l                                     ; $5b54: $75
	ld   h, a                                        ; $5b55: $67
	ld   l, b                                        ; $5b56: $68
	ld   hl, $5520                                   ; $5b57: $21 $20 $55
	ld   (hl), e                                     ; $5b5a: $73
	ld   h, l                                        ; $5b5b: $65
	ld   bc, $6f79                                   ; $5b5c: $01 $79 $6f
	ld   (hl), l                                     ; $5b5f: $75

jr_00c_5b60:
	ld   (hl), d                                     ; $5b60: $72

jr_00c_5b61:
	jr   nz, jr_00c_5bb6                             ; $5b61: $20 $53

	ld   (hl), a                                     ; $5b63: $77

jr_00c_5b64:
	ld   l, a                                        ; $5b64: $6f
	ld   (hl), d                                     ; $5b65: $72
	ld   h, h                                        ; $5b66: $64
	jr   nz, jr_00c_5bdd                             ; $5b67: $20 $74

	ld   l, a                                        ; $5b69: $6f
	ld   bc, $7473                                   ; $5b6a: $01 $73 $74
	ld   l, a                                        ; $5b6d: $6f
	ld   (hl), b                                     ; $5b6e: $70
	jr   nz, jr_00c_5bd9                             ; $5b6f: $20 $68

	ld   l, c                                        ; $5b71: $69
	ld   (hl), e                                     ; $5b72: $73
	jr   nz, jr_00c_5be7                             ; $5b73: $20 $72

	ld   l, a                                        ; $5b75: $6f
	ld   h, e                                        ; $5b76: $63

jr_00c_5b77:
	ld   l, e                                        ; $5b77: $6b

jr_00c_5b78:
	ld   bc, $6873                                   ; $5b78: $01 $73 $68
	ld   l, c                                        ; $5b7b: $69
	ld   h, l                                        ; $5b7c: $65
	ld   l, h                                        ; $5b7d: $6c
	ld   h, h                                        ; $5b7e: $64
	jr   nz, jr_00c_5be2                             ; $5b7f: $20 $61

	ld   l, (hl)                                     ; $5b81: $6e
	ld   h, h                                        ; $5b82: $64
	jr   nz, jr_00c_5bf9                             ; $5b83: $20 $74

	ld   l, b                                        ; $5b85: $68
	ld   (hl), d                                     ; $5b86: $72
	ld   l, a                                        ; $5b87: $6f
	ld   (hl), a                                     ; $5b88: $77
	ld   bc, $7266                                   ; $5b89: $01 $66 $72
	ld   (hl), l                                     ; $5b8c: $75
	ld   l, c                                        ; $5b8d: $69
	ld   (hl), h                                     ; $5b8e: $74
	jr   nz, jr_00c_5bf2                             ; $5b8f: $20 $61

	ld   (hl), h                                     ; $5b91: $74
	jr   nz, jr_00c_5bfc                             ; $5b92: $20 $68

	ld   l, c                                        ; $5b94: $69
	ld   (hl), e                                     ; $5b95: $73
	ld   bc, $6568                                   ; $5b96: $01 $68 $65
	ld   h, c                                        ; $5b99: $61
	ld   h, h                                        ; $5b9a: $64
	.db $20 $6f

jr_00c_5b9d:
	ld   l, (hl)                                     ; $5b9d: $6e
	ld   l, h                                        ; $5b9e: $6c
	ld   a, c                                        ; $5b9f: $79
	.db $20 $77

	ld   l, b                                        ; $5ba2: $68
	ld   h, l                                        ; $5ba3: $65
	ld   l, (hl)                                     ; $5ba4: $6e

jr_00c_5ba5:
	ld   bc, $7469                                   ; $5ba5: $01 $69 $74
	.db $20 $69

	ld   (hl), e                                     ; $5baa: $73
	.db $20 $66

	ld   l, h                                        ; $5bad: $6c
	ld   h, c                                        ; $5bae: $61
	ld   (hl), e                                     ; $5baf: $73
	ld   l, b                                        ; $5bb0: $68
	ld   l, c                                        ; $5bb1: $69
	ld   l, (hl)                                     ; $5bb2: $6e

jr_00c_5bb3:
	ld   h, a                                        ; $5bb3: $67
	ld   l, $ff                                      ; $5bb4: $2e $ff

jr_00c_5bb6:
	ld   b, d                                        ; $5bb6: $42
	add  hl, de                                      ; $5bb7: $19
	cp   $fd                                         ; $5bb8: $fe $fd
	nop                                              ; $5bba: $00
	nop                                              ; $5bbb: $00
	ld   c, b                                        ; $5bbc: $48
	ld   h, l                                        ; $5bbd: $65
	jr   nz, $6f                                     ; $5bbe: $20 $6f

	ld   l, (hl)                                     ; $5bc0: $6e
	ld   l, h                                        ; $5bc1: $6c
	ld   a, c                                        ; $5bc2: $79
	.db $20 $67

	ld   l, a                                        ; $5bc5: $6f
	ld   h, l                                        ; $5bc6: $65

jr_00c_5bc7:
	ld   (hl), e                                     ; $5bc7: $73
	ld   bc, $7761                                   ; $5bc8: $01 $61 $77
	ld   h, c                                        ; $5bcb: $61
	ld   a, c                                        ; $5bcc: $79
	.db $20 $61

	ld   h, (hl)                                     ; $5bcf: $66
	ld   (hl), h                                     ; $5bd0: $74
	ld   h, l                                        ; $5bd1: $65
	ld   (hl), d                                     ; $5bd2: $72
	jr   nz, $62                                     ; $5bd3: $20 $62

	ld   h, l                                        ; $5bd5: $65
	ld   l, c                                        ; $5bd6: $69
	ld   l, (hl)                                     ; $5bd7: $6e
	ld   h, a                                        ; $5bd8: $67

jr_00c_5bd9:
	ld   bc, $6968                                   ; $5bd9: $01 $68 $69
	ld   (hl), h                                     ; $5bdc: $74

jr_00c_5bdd:
	jr   nz, $37                                     ; $5bdd: $20 $37

	.db $20 $74

	ld   l, c                                        ; $5be1: $69

jr_00c_5be2:
	ld   l, l                                        ; $5be2: $6d
	ld   h, l                                        ; $5be3: $65
	ld   (hl), e                                     ; $5be4: $73
	ld   l, $ff                                      ; $5be5: $2e $ff

jr_00c_5be7:
	cp   $7f                                         ; $5be7: $fe $7f
	add  d                                           ; $5be9: $82
	pop  af                                          ; $5bea: $f1
	dec  de                                          ; $5beb: $1b
	ld   b, d                                        ; $5bec: $42
	ld   bc, $e981                                   ; $5bed: $01 $81 $e9
	dec  de                                          ; $5bf0: $1b
	inc  h                                           ; $5bf1: $24

jr_00c_5bf2:
	ld   b, d                                        ; $5bf2: $42
	ld   bc, $f282                                   ; $5bf3: $01 $82 $f2
	dec  de                                          ; $5bf6: $1b
	ld   b, d                                        ; $5bf7: $42
	dec  b                                           ; $5bf8: $05

jr_00c_5bf9:
	add  d                                           ; $5bf9: $82
	ld   a, ($ff00+c)                                ; $5bfa: $f2
	dec  de                                          ; $5bfb: $1b

jr_00c_5bfc:
	inc  h                                           ; $5bfc: $24
