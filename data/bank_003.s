; Disassembly of "OR"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3

	add  b                                           ; $494b: $80
	ld   c, l                                        ; $494c: $4d
	sub  e                                           ; $494d: $93
	ld   d, c                                        ; $494e: $51
	rst  $38                                         ; $494f: $ff
	rst  $38                                         ; $4950: $ff
	rst  $38                                         ; $4951: $ff
	rst  $38                                         ; $4952: $ff
	add  (hl)                                        ; $4953: $86
	ld   c, l                                        ; $4954: $4d
	add  $51                                         ; $4955: $c6 $51
	ld   (bc), a                                     ; $4957: $02
	rst  $38                                         ; $4958: $ff
	ld   (bc), a                                     ; $4959: $02
	ld   a, h                                        ; $495a: $7c
	adc  a                                           ; $495b: $8f
	ld   c, l                                        ; $495c: $4d
	dec  h                                           ; $495d: $25
	ld   d, d                                        ; $495e: $52
	rst  $38                                         ; $495f: $ff
	rst  $38                                         ; $4960: $ff
	rst  $38                                         ; $4961: $ff
	rst  $38                                         ; $4962: $ff
	adc  a                                           ; $4963: $8f
	ld   c, l                                        ; $4964: $4d
	ld   h, l                                        ; $4965: $65
	ld   c, (hl)                                     ; $4966: $4e
	rst  $38                                         ; $4967: $ff
	rst  $38                                         ; $4968: $ff
	rst  $38                                         ; $4969: $ff
	rst  $38                                         ; $496a: $ff
	sub  h                                           ; $496b: $94
	ld   c, l                                        ; $496c: $4d
	dec  de                                          ; $496d: $1b
	ld   d, e                                        ; $496e: $53
	rst  $38                                         ; $496f: $ff
	rst  $38                                         ; $4970: $ff
	rst  $38                                         ; $4971: $ff
	rst  $38                                         ; $4972: $ff
	cp   a                                           ; $4973: $bf
	ld   c, l                                        ; $4974: $4d
	ld   l, e                                        ; $4975: $6b
	ld   e, b                                        ; $4976: $58
	nop                                              ; $4977: $00
	dec  b                                           ; $4978: $05
	nop                                              ; $4979: $00
	dec  b                                           ; $497a: $05
	jp   c, $7c4d                            ; $497b: $da $4d $7c

	ld   e, b                                        ; $497e: $58
	nop                                              ; $497f: $00
	ld   b, $00                                      ; $4980: $06 $00
	ld   b, $e3                                      ; $4982: $06 $e3
	ld   c, l                                        ; $4984: $4d
	sub  l                                           ; $4985: $95
	ld   e, b                                        ; $4986: $58
	nop                                              ; $4987: $00
	rlca                                             ; $4988: $07
	nop                                              ; $4989: $00
	rlca                                             ; $498a: $07
	ret  z                                           ; $498b: $c8

	ld   c, l                                        ; $498c: $4d
	scf                                              ; $498d: $37
	ld   e, d                                        ; $498e: $5a
	nop                                              ; $498f: $00
	ld   ($0800), sp                                 ; $4990: $08 $00 $08
	pop  de                                          ; $4993: $d1
	ld   c, l                                        ; $4994: $4d
	or   l                                           ; $4995: $b5
	ld   e, d                                        ; $4996: $5a
	nop                                              ; $4997: $00
	add  hl, bc                                      ; $4998: $09
	nop                                              ; $4999: $00
	add  hl, bc                                      ; $499a: $09
	.db  $ec                                         ; $499b: $ec
	ld   c, l                                        ; $499c: $4d
	ld   ($ff00+c), a                                ; $499d: $e2
	ld   e, d                                        ; $499e: $5a
	nop                                              ; $499f: $00
	ld   a, (bc)                                     ; $49a0: $0a
	nop                                              ; $49a1: $00
	ld   a, (bc)                                     ; $49a2: $0a
	xor  l                                           ; $49a3: $ad
	ld   c, l                                        ; $49a4: $4d
	rst  $30                                         ; $49a5: $f7
	ld   e, d                                        ; $49a6: $5a
	rst  $38                                         ; $49a7: $ff
	rst  $38                                         ; $49a8: $ff
	rst  $38                                         ; $49a9: $ff
	rst  $38                                         ; $49aa: $ff
	sbc  l                                           ; $49ab: $9d
	ld   c, l                                        ; $49ac: $4d
	jr   z, jr_006_4a0a                              ; $49ad: $28 $5b

	rst  $38                                         ; $49af: $ff
	rst  $38                                         ; $49b0: $ff
	rst  $38                                         ; $49b1: $ff
	rst  $38                                         ; $49b2: $ff
	and  c                                           ; $49b3: $a1
	ld   c, l                                        ; $49b4: $4d
	dec  l                                           ; $49b5: $2d
	ld   e, e                                        ; $49b6: $5b
	rst  $38                                         ; $49b7: $ff
	rst  $38                                         ; $49b8: $ff
	rst  $38                                         ; $49b9: $ff
	rst  $38                                         ; $49ba: $ff
	and  l                                           ; $49bb: $a5
	ld   c, l                                        ; $49bc: $4d
	ldd  (hl), a                                     ; $49bd: $32
	ld   e, e                                        ; $49be: $5b
	rst  $38                                         ; $49bf: $ff
	rst  $38                                         ; $49c0: $ff
	rst  $38                                         ; $49c1: $ff
	rst  $38                                         ; $49c2: $ff
	xor  c                                           ; $49c3: $a9
	ld   c, l                                        ; $49c4: $4d
	scf                                              ; $49c5: $37
	ld   e, e                                        ; $49c6: $5b

jr_006_49c7:
	rst  $38                                         ; $49c7: $ff
	rst  $38                                         ; $49c8: $ff
	rst  $38                                         ; $49c9: $ff
	rst  $38                                         ; $49ca: $ff
	jp   c, $844d                                    ; $49cb: $da $4d $84

	ld   e, e                                        ; $49ce: $5b
	nop                                              ; $49cf: $00
	.db  $10                                         ; $49d0: $10
	nop                                              ; $49d1: $00
	.db  $10                                         ; $49d2: $10
	cp   $4d                                         ; $49d3: $fe $4d
	sub  h                                           ; $49d5: $94
	ld   e, e                                        ; $49d6: $5b
	nop                                              ; $49d7: $00
	ld   de, $1100                                   ; $49d8: $11 $00 $11
	push af                                          ; $49db: $f5
	ld   c, l                                        ; $49dc: $4d
	and  (hl)                                        ; $49dd: $a6
	ld   e, e                                        ; $49de: $5b
	rst  $38                                         ; $49df: $ff
	rst  $38                                         ; $49e0: $ff
	rst  $38                                         ; $49e1: $ff
	jr   nz, jr_006_49c7                             ; $49e2: $20 $e3

	ld   c, l                                        ; $49e4: $4d
	adc  $5b                                         ; $49e5: $ce $5b
	rst  $38                                         ; $49e7: $ff
	inc  de                                          ; $49e8: $13
	nop                                              ; $49e9: $00
	inc  de                                          ; $49ea: $13
	dec  b                                           ; $49eb: $05
	ld   c, (hl)                                     ; $49ec: $4e
	ld   sp, hl                                      ; $49ed: $f9
	ld   e, e                                        ; $49ee: $5b
	rst  $38                                         ; $49ef: $ff
	rst  $38                                         ; $49f0: $ff
	rst  $38                                         ; $49f1: $ff
	rst  $38                                         ; $49f2: $ff
	ld   l, d                                        ; $49f3: $6a
	ld   c, l                                        ; $49f4: $4d
	add  (hl)                                        ; $49f5: $86
	ld   d, d                                        ; $49f6: $52
	rst  $38                                         ; $49f7: $ff
	rst  $38                                         ; $49f8: $ff
	rst  $38                                         ; $49f9: $ff
	rst  $38                                         ; $49fa: $ff
	.db  $76                                         ; $49fb: $76
	ld   c, l                                        ; $49fc: $4d
	ld   e, $50                                      ; $49fd: $1e $50
	rst  $38                                         ; $49ff: $ff
	rst  $38                                         ; $4a00: $ff
	rst  $38                                         ; $4a01: $ff
	rst  $38                                         ; $4a02: $ff
	ld   a, b                                        ; $4a03: $78
	ld   c, l                                        ; $4a04: $4d
	dec  sp                                          ; $4a05: $3b
	ld   d, b                                        ; $4a06: $50
	rst  $38                                         ; $4a07: $ff
	rst  $38                                         ; $4a08: $ff
	rst  $38                                         ; $4a09: $ff

jr_006_4a0a:
	rst  $38                                         ; $4a0a: $ff
	ld   a, h                                        ; $4a0b: $7c
	ld   c, l                                        ; $4a0c: $4d
	ld   h, (hl)                                     ; $4a0d: $66
	ld   d, b                                        ; $4a0e: $50
	rst  $38                                         ; $4a0f: $ff
	rst  $38                                         ; $4a10: $ff
	rst  $38                                         ; $4a11: $ff
	rst  $38                                         ; $4a12: $ff
	or   (hl)                                        ; $4a13: $b6
	ld   c, l                                        ; $4a14: $4d
	ld   de, $005c                                   ; $4a15: $11 $5c $00
	add  hl, de                                      ; $4a18: $19
	nop                                              ; $4a19: $00
	add  hl, de                                      ; $4a1a: $19
	pop  de                                          ; $4a1b: $d1
	ld   c, l                                        ; $4a1c: $4d
	ld   d, c                                        ; $4a1d: $51
	ld   e, h                                        ; $4a1e: $5c
	nop                                              ; $4a1f: $00
	ld   a, (de)                                     ; $4a20: $1a
	nop                                              ; $4a21: $00
	ld   a, (de)                                     ; $4a22: $1a
	.db  $ec                                         ; $4a23: $ec
	ld   c, l                                        ; $4a24: $4d
	sbc  e                                           ; $4a25: $9b
	ld   e, h                                        ; $4a26: $5c
	rst  $38                                         ; $4a27: $ff
	rst  $38                                         ; $4a28: $ff
	rst  $38                                         ; $4a29: $ff
	dec  de                                          ; $4a2a: $1b
	xor  l                                           ; $4a2b: $ad
	ld   c, l                                        ; $4a2c: $4d
	ldi  (hl), a                                     ; $4a2d: $22
	ld   e, h                                        ; $4a2e: $5c
	rst  $38                                         ; $4a2f: $ff
	rst  $38                                         ; $4a30: $ff
	rst  $38                                         ; $4a31: $ff
	rst  $38                                         ; $4a32: $ff
	cp   a                                           ; $4a33: $bf
	ld   c, l                                        ; $4a34: $4d
	ldd  a, (hl)                                     ; $4a35: $3a
	ld   e, h                                        ; $4a36: $5c
	nop                                              ; $4a37: $00
	dec  e                                           ; $4a38: $1d
	nop                                              ; $4a39: $00
	dec  e                                           ; $4a3a: $1d
	inc  c                                           ; $4a3b: $0c
	ld   c, (hl)                                     ; $4a3c: $4e
	ld   l, c                                        ; $4a3d: $69
	ld   e, e                                        ; $4a3e: $5b
	rst  $38                                         ; $4a3f: $ff
	rst  $38                                         ; $4a40: $ff
	rst  $38                                         ; $4a41: $ff
	rst  $38                                         ; $4a42: $ff
	cp   a                                           ; $4a43: $bf
	ld   c, l                                        ; $4a44: $4d
	inc  bc                                          ; $4a45: $03
	ld   e, h                                        ; $4a46: $5c
	nop                                              ; $4a47: $00
	rra                                              ; $4a48: $1f
	nop                                              ; $4a49: $00
	rra                                              ; $4a4a: $1f
	xor  l                                           ; $4a4b: $ad
	ld   c, l                                        ; $4a4c: $4d
	ld   h, l                                        ; $4a4d: $65
	ld   c, (hl)                                     ; $4a4e: $4e
	rst  $38                                         ; $4a4f: $ff
	rst  $38                                         ; $4a50: $ff
	rst  $38                                         ; $4a51: $ff
	rst  $38                                         ; $4a52: $ff
	pop  de                                          ; $4a53: $d1
	ld   c, l                                        ; $4a54: $4d
	ld   (hl), l                                     ; $4a55: $75
	ld   e, h                                        ; $4a56: $5c
	ld   l, c                                        ; $4a57: $69
	rst  $38                                         ; $4a58: $ff
	rst  $38                                         ; $4a59: $ff
	ld   hl, $4dbf                                   ; $4a5a: $21 $bf $4d
	cp   $5d                                         ; $4a5d: $fe $5d
	nop                                              ; $4a5f: $00
	rst  $38                                         ; $4a60: $ff
	nop                                              ; $4a61: $00
	rst  $38                                         ; $4a62: $ff
	cp   a                                           ; $4a63: $bf
	ld   c, l                                        ; $4a64: $4d
	jp   z, $005c                                    ; $4a65: $ca $5c $00

	inc  hl                                          ; $4a68: $23
	nop                                              ; $4a69: $00
	inc  hl                                          ; $4a6a: $23
	jp   c, $124d                                    ; $4a6b: $da $4d $12

	ld   e, l                                        ; $4a6e: $5d
	nop                                              ; $4a6f: $00
	inc  h                                           ; $4a70: $24
	nop                                              ; $4a71: $00
	inc  h                                           ; $4a72: $24
	.db  $e3                                         ; $4a73: $e3
	ld   c, l                                        ; $4a74: $4d
	ldi  (hl), a                                     ; $4a75: $22
	ld   e, l                                        ; $4a76: $5d
	rst  $38                                         ; $4a77: $ff
	rst  $38                                         ; $4a78: $ff
	rst  $38                                         ; $4a79: $ff
	dec  h                                           ; $4a7a: $25
	.db  $10                                         ; $4a7b: $10
	ld   c, (hl)                                     ; $4a7c: $4e
	ld   a, ($ff5c)                                  ; $4a7d: $fa $5c $ff

jr_006_4a80:
	rst  $38                                         ; $4a80: $ff
	rst  $38                                         ; $4a81: $ff
	jr   nz, jr_006_4aa1                             ; $4a82: $20 $1d

	ld   c, (hl)                                     ; $4a84: $4e
	ld   l, (hl)                                     ; $4a85: $6e
	ld   e, l                                        ; $4a86: $5d
	nop                                              ; $4a87: $00
	daa                                              ; $4a88: $27
	nop                                              ; $4a89: $00
	rst  $38                                         ; $4a8a: $ff
	jp   c, $3e4d                                    ; $4a8b: $da $4d $3e

	ld   e, l                                        ; $4a8e: $5d
	nop                                              ; $4a8f: $00
	jr   z, jr_006_4a92                              ; $4a90: $28 $00

jr_006_4a92:
	jr   z, jr_006_4a80                              ; $4a92: $28 $ec

	ld   c, l                                        ; $4a94: $4d
	cp   (hl)                                        ; $4a95: $be
	ld   e, l                                        ; $4a96: $5d
	nop                                              ; $4a97: $00
	add  hl, hl                                      ; $4a98: $29
	nop                                              ; $4a99: $00
	add  hl, hl                                      ; $4a9a: $29
	add  hl, de                                      ; $4a9b: $19
	ld   c, (hl)                                     ; $4a9c: $4e
	adc  e                                           ; $4a9d: $8b
	ld   e, l                                        ; $4a9e: $5d
	rst  $38                                         ; $4a9f: $ff
	rst  $38                                         ; $4aa0: $ff

jr_006_4aa1:
	rst  $38                                         ; $4aa1: $ff
	rst  $38                                         ; $4aa2: $ff
	dec  de                                          ; $4aa3: $1b
	ld   c, (hl)                                     ; $4aa4: $4e
	and  h                                           ; $4aa5: $a4
	ld   e, l                                        ; $4aa6: $5d
	rst  $38                                         ; $4aa7: $ff
	rst  $38                                         ; $4aa8: $ff
	rst  $38                                         ; $4aa9: $ff
	rst  $38                                         ; $4aaa: $ff
	jp   c, $4d4d                            ; $4aab: $da $4d $4d

	ld   e, l                                        ; $4aae: $5d
	nop                                              ; $4aaf: $00
	inc  l                                           ; $4ab0: $2c
	nop                                              ; $4ab1: $00
	inc  l                                           ; $4ab2: $2c
	ld   b, b                                        ; $4ab3: $40
	ld   c, l                                        ; $4ab4: $4d
	ld   a, h                                        ; $4ab5: $7c
	ld   h, c                                        ; $4ab6: $61
	rst  $38                                         ; $4ab7: $ff
	rst  $38                                         ; $4ab8: $ff
	rst  $38                                         ; $4ab9: $ff
	rst  $38                                         ; $4aba: $ff
	ld   b, a                                        ; $4abb: $47
	ld   c, l                                        ; $4abc: $4d
	ld   h, (hl)                                     ; $4abd: $66
	ld   c, (hl)                                     ; $4abe: $4e
	rst  $38                                         ; $4abf: $ff
	rst  $38                                         ; $4ac0: $ff
	rst  $38                                         ; $4ac1: $ff
	rst  $38                                         ; $4ac2: $ff
	ld   c, e                                        ; $4ac3: $4b
	ld   c, l                                        ; $4ac4: $4d
	cp   e                                           ; $4ac5: $bb
	ld   c, (hl)                                     ; $4ac6: $4e
	rst  $38                                         ; $4ac7: $ff
	rst  $38                                         ; $4ac8: $ff
	rst  $38                                         ; $4ac9: $ff
	rst  $38                                         ; $4aca: $ff
	ld   c, c                                        ; $4acb: $49
	ld   c, l                                        ; $4acc: $4d
	inc  bc                                          ; $4acd: $03
	ld   c, a                                        ; $4ace: $4f
	rst  $38                                         ; $4acf: $ff
	rst  $38                                         ; $4ad0: $ff
	rst  $38                                         ; $4ad1: $ff
	rst  $38                                         ; $4ad2: $ff
	ld   c, l                                        ; $4ad3: $4d
	ld   c, l                                        ; $4ad4: $4d
	ld   d, b                                        ; $4ad5: $50
	ld   c, a                                        ; $4ad6: $4f
	rst  $38                                         ; $4ad7: $ff
	rst  $38                                         ; $4ad8: $ff
	rst  $38                                         ; $4ad9: $ff
	rst  $38                                         ; $4ada: $ff
	ld   b, l                                        ; $4adb: $45
	ld   c, l                                        ; $4adc: $4d
	sbc  l                                           ; $4add: $9d
	ld   c, a                                        ; $4ade: $4f
	rst  $38                                         ; $4adf: $ff
	rst  $38                                         ; $4ae0: $ff
	rst  $38                                         ; $4ae1: $ff
	rst  $38                                         ; $4ae2: $ff
	ld   l, h                                        ; $4ae3: $6c
	ld   c, l                                        ; $4ae4: $4d
	ld   a, h                                        ; $4ae5: $7c
	ld   d, b                                        ; $4ae6: $50
	rst  $38                                         ; $4ae7: $ff
	rst  $38                                         ; $4ae8: $ff
	rst  $38                                         ; $4ae9: $ff
	rst  $38                                         ; $4aea: $ff
	ld   d, c                                        ; $4aeb: $51
	ld   c, l                                        ; $4aec: $4d
	sub  h                                           ; $4aed: $94
	ld   d, b                                        ; $4aee: $50
	rst  $38                                         ; $4aef: $ff
	rst  $38                                         ; $4af0: $ff
	rst  $38                                         ; $4af1: $ff
	rst  $38                                         ; $4af2: $ff
	ld   d, e                                        ; $4af3: $53
	ld   c, l                                        ; $4af4: $4d
	adc  $50                                         ; $4af5: $ce $50
	rst  $38                                         ; $4af7: $ff
	rst  $38                                         ; $4af8: $ff
	rst  $38                                         ; $4af9: $ff
	rst  $38                                         ; $4afa: $ff
	ld   d, l                                        ; $4afb: $55
	ld   c, l                                        ; $4afc: $4d
	ld   a, ($ff50)                                  ; $4afd: $fa $50 $ff
	rst  $38                                         ; $4b00: $ff
	rst  $38                                         ; $4b01: $ff
	rst  $38                                         ; $4b02: $ff
	ld   d, a                                        ; $4b03: $57
	ld   c, l                                        ; $4b04: $4d
	ld   e, $51                                      ; $4b05: $1e $51
	rst  $38                                         ; $4b07: $ff
	rst  $38                                         ; $4b08: $ff
	rst  $38                                         ; $4b09: $ff
	rst  $38                                         ; $4b0a: $ff
	ld   e, c                                        ; $4b0b: $59
	ld   c, l                                        ; $4b0c: $4d
	inc  c                                           ; $4b0d: $0c
	ld   d, c                                        ; $4b0e: $51
	rst  $38                                         ; $4b0f: $ff
	rst  $38                                         ; $4b10: $ff
	rst  $38                                         ; $4b11: $ff
	rst  $38                                         ; $4b12: $ff
	ld   e, e                                        ; $4b13: $5b
	ld   c, l                                        ; $4b14: $4d
	jr   nc, jr_006_4b68                             ; $4b15: $30 $51

	rst  $38                                         ; $4b17: $ff
	rst  $38                                         ; $4b18: $ff
	rst  $38                                         ; $4b19: $ff
	rst  $38                                         ; $4b1a: $ff
	ld   (hl), b                                     ; $4b1b: $70
	ld   c, l                                        ; $4b1c: $4d
	ld   b, d                                        ; $4b1d: $42
	ld   d, c                                        ; $4b1e: $51
	rst  $38                                         ; $4b1f: $ff
	rst  $38                                         ; $4b20: $ff
	rst  $38                                         ; $4b21: $ff
	rst  $38                                         ; $4b22: $ff
	ld   (hl), h                                     ; $4b23: $74
	ld   c, l                                        ; $4b24: $4d
	ld   d, d                                        ; $4b25: $52
	ld   d, c                                        ; $4b26: $51
	rst  $38                                         ; $4b27: $ff
	rst  $38                                         ; $4b28: $ff
	rst  $38                                         ; $4b29: $ff
	rst  $38                                         ; $4b2a: $ff
	ld   l, (hl)                                     ; $4b2b: $6e
	ld   c, l                                        ; $4b2c: $4d
	xor  $52                                         ; $4b2d: $ee $52
	rst  $38                                         ; $4b2f: $ff
	rst  $38                                         ; $4b30: $ff
	rst  $38                                         ; $4b31: $ff
	rst  $38                                         ; $4b32: $ff
	ld   (hl), d                                     ; $4b33: $72
	ld   c, l                                        ; $4b34: $4d
	inc  bc                                          ; $4b35: $03
	ld   d, e                                        ; $4b36: $53
	rst  $38                                         ; $4b37: $ff
	rst  $38                                         ; $4b38: $ff
	rst  $38                                         ; $4b39: $ff
	rst  $38                                         ; $4b3a: $ff
	ld   a, b                                        ; $4b3b: $78
	ld   c, l                                        ; $4b3c: $4d
	inc  bc                                          ; $4b3d: $03
	ld   e, b                                        ; $4b3e: $58
	rst  $38                                         ; $4b3f: $ff
	rst  $38                                         ; $4b40: $ff
	rst  $38                                         ; $4b41: $ff
	rst  $38                                         ; $4b42: $ff
	ld   a, d                                        ; $4b43: $7a
	ld   c, l                                        ; $4b44: $4d
	ld   d, c                                        ; $4b45: $51
	ld   d, b                                        ; $4b46: $50
	rst  $38                                         ; $4b47: $ff
	rst  $38                                         ; $4b48: $ff
	rst  $38                                         ; $4b49: $ff
	rst  $38                                         ; $4b4a: $ff
	ld   a, (hl)                                     ; $4b4b: $7e
	ld   c, l                                        ; $4b4c: $4d
	ld   h, c                                        ; $4b4d: $61
	ld   d, c                                        ; $4b4e: $51
	rst  $38                                         ; $4b4f: $ff
	rst  $38                                         ; $4b50: $ff
	rst  $38                                         ; $4b51: $ff
	rst  $38                                         ; $4b52: $ff
	ld   c, a                                        ; $4b53: $4f
	ld   c, l                                        ; $4b54: $4d
	ld   (hl), a                                     ; $4b55: $77
	ld   d, c                                        ; $4b56: $51
	rst  $38                                         ; $4b57: $ff
	rst  $38                                         ; $4b58: $ff
	rst  $38                                         ; $4b59: $ff
	rst  $38                                         ; $4b5a: $ff
	.db  $ec                                         ; $4b5b: $ec
	ld   c, l                                        ; $4b5c: $4d
	cp   (hl)                                        ; $4b5d: $be
	ld   e, h                                        ; $4b5e: $5c
	rst  $38                                         ; $4b5f: $ff
	rst  $38                                         ; $4b60: $ff
	rst  $38                                         ; $4b61: $ff
	rst  $38                                         ; $4b62: $ff
	ld   hl, $244e                                   ; $4b63: $21 $4e $24
	ld   e, (hl)                                     ; $4b66: $5e
	nop                                              ; $4b67: $00

jr_006_4b68:
	ld   b, e                                        ; $4b68: $43
	nop                                              ; $4b69: $00
	ld   b, e                                        ; $4b6a: $43
	ld   h, $4e                                      ; $4b6b: $26 $4e
	inc  h                                           ; $4b6d: $24
	ld   e, (hl)                                     ; $4b6e: $5e
	nop                                              ; $4b6f: $00
	ld   b, h                                        ; $4b70: $44
	nop                                              ; $4b71: $00
	ld   b, h                                        ; $4b72: $44
	ld   e, l                                        ; $4b73: $5d
	ld   c, l                                        ; $4b74: $4d
	ld   h, h                                        ; $4b75: $64
	ld   e, (hl)                                     ; $4b76: $5e
	ld   b, (hl)                                     ; $4b77: $46
	rst  $38                                         ; $4b78: $ff
	ld   b, (hl)                                     ; $4b79: $46
	rst  $38                                         ; $4b7a: $ff
	ld   e, a                                        ; $4b7b: $5f
	ld   c, l                                        ; $4b7c: $4d
	ld   l, h                                        ; $4b7d: $6c
	ld   e, (hl)                                     ; $4b7e: $5e
	rst  $38                                         ; $4b7f: $ff
	rst  $38                                         ; $4b80: $ff
	rst  $38                                         ; $4b81: $ff
	rst  $38                                         ; $4b82: $ff
	ld   h, c                                        ; $4b83: $61
	ld   c, l                                        ; $4b84: $4d
	add  b                                           ; $4b85: $80
	ld   e, (hl)                                     ; $4b86: $5e
	rst  $38                                         ; $4b87: $ff
	rst  $38                                         ; $4b88: $ff
	rst  $38                                         ; $4b89: $ff
	rst  $38                                         ; $4b8a: $ff
	ld   (hl), d                                     ; $4b8b: $72
	ld   c, l                                        ; $4b8c: $4d
	add  b                                           ; $4b8d: $80
	ld   e, (hl)                                     ; $4b8e: $5e
	rst  $38                                         ; $4b8f: $ff
	rst  $38                                         ; $4b90: $ff
	rst  $38                                         ; $4b91: $ff
	rst  $38                                         ; $4b92: $ff
	ret  z                                           ; $4b93: $c8

	ld   c, l                                        ; $4b94: $4d
	cp   $5d                                         ; $4b95: $fe $5d
	nop                                              ; $4b97: $00
	ld   c, c                                        ; $4b98: $49
	nop                                              ; $4b99: $00
	ld   c, c                                        ; $4b9a: $49
	dec  hl                                          ; $4b9b: $2b
	ld   c, (hl)                                     ; $4b9c: $4e
	or   h                                           ; $4b9d: $b4
	ld   e, (hl)                                     ; $4b9e: $5e
	rst  $38                                         ; $4b9f: $ff
	rst  $38                                         ; $4ba0: $ff
	rst  $38                                         ; $4ba1: $ff
	rst  $38                                         ; $4ba2: $ff
	jr   c, jr_006_4bf3                              ; $4ba3: $38 $4e

	ld   d, $5e                                      ; $4ba5: $16 $5e
	nop                                              ; $4ba7: $00
	ld   c, e                                        ; $4ba8: $4b
	nop                                              ; $4ba9: $00
	ld   c, e                                        ; $4baa: $4b
	dec  a                                           ; $4bab: $3d
	ld   c, (hl)                                     ; $4bac: $4e
	ld   (hl), c                                     ; $4bad: $71
	ld   e, d                                        ; $4bae: $5a
	nop                                              ; $4baf: $00
	ld   ($0800), sp                                 ; $4bb0: $08 $00 $08
	dec  a                                           ; $4bb3: $3d
	ld   c, (hl)                                     ; $4bb4: $4e
	sub  e                                           ; $4bb5: $93
	ld   e, d                                        ; $4bb6: $5a
	nop                                              ; $4bb7: $00
	ld   ($0800), sp                                 ; $4bb8: $08 $00 $08
	ld   b, c                                        ; $4bbb: $41
	ld   c, (hl)                                     ; $4bbc: $4e
	or   b                                           ; $4bbd: $b0
	ld   e, e                                        ; $4bbe: $5b
	rst  $38                                         ; $4bbf: $ff
	rst  $38                                         ; $4bc0: $ff
	inc  bc                                          ; $4bc1: $03
	ld   c, (hl)                                     ; $4bc2: $4e
	ld   b, l                                        ; $4bc3: $45
	ld   c, (hl)                                     ; $4bc4: $4e
	and  h                                           ; $4bc5: $a4
	ld   e, b                                        ; $4bc6: $58
	nop                                              ; $4bc7: $00
	nop                                              ; $4bc8: $00
	nop                                              ; $4bc9: $00
	ld   c, a                                        ; $4bca: $4f
	ld   c, c                                        ; $4bcb: $49
	ld   c, (hl)                                     ; $4bcc: $4e
	add  hl, sp                                      ; $4bcd: $39
	ld   e, c                                        ; $4bce: $59
	rst  $38                                         ; $4bcf: $ff
	rst  $38                                         ; $4bd0: $ff
	rst  $38                                         ; $4bd1: $ff
	rst  $38                                         ; $4bd2: $ff
	ld   c, (hl)                                     ; $4bd3: $4e
	ld   c, (hl)                                     ; $4bd4: $4e
	sub  c                                           ; $4bd5: $91
	ld   e, c                                        ; $4bd6: $59
	rst  $38                                         ; $4bd7: $ff
	rst  $38                                         ; $4bd8: $ff
	rst  $38                                         ; $4bd9: $ff
	rst  $38                                         ; $4bda: $ff
	ld   d, c                                        ; $4bdb: $51
	ld   c, (hl)                                     ; $4bdc: $4e
	jp   nz, $ff59                                   ; $4bdd: $c2 $59 $ff

	rst  $38                                         ; $4be0: $ff
	rst  $38                                         ; $4be1: $ff
	rst  $38                                         ; $4be2: $ff
	ld   e, e                                        ; $4be3: $5b
	ld   c, l                                        ; $4be4: $4d
	.db  $dd                                         ; $4be5: $dd
	ld   e, c                                        ; $4be6: $59
	rst  $38                                         ; $4be7: $ff
	rst  $38                                         ; $4be8: $ff
	rst  $38                                         ; $4be9: $ff
	rst  $38                                         ; $4bea: $ff
	ld   e, e                                        ; $4beb: $5b
	ld   c, l                                        ; $4bec: $4d
	ld   c, $5a                                      ; $4bed: $0e $5a
	rst  $38                                         ; $4bef: $ff
	rst  $38                                         ; $4bf0: $ff
	rst  $38                                         ; $4bf1: $ff
	rst  $38                                         ; $4bf2: $ff

jr_006_4bf3:
	ld   e, e                                        ; $4bf3: $5b
	ld   c, l                                        ; $4bf4: $4d
	ld   h, $5a                                      ; $4bf5: $26 $5a
	rst  $38                                         ; $4bf7: $ff
	rst  $38                                         ; $4bf8: $ff
	rst  $38                                         ; $4bf9: $ff
	rst  $38                                         ; $4bfa: $ff
	ld   d, e                                        ; $4bfb: $53
	ld   c, l                                        ; $4bfc: $4d
	add  (hl)                                        ; $4bfd: $86
	ld   e, (hl)                                     ; $4bfe: $5e
	rst  $38                                         ; $4bff: $ff
	rst  $38                                         ; $4c00: $ff
	rst  $38                                         ; $4c01: $ff
	rst  $38                                         ; $4c02: $ff
	ld   d, c                                        ; $4c03: $51
	ld   c, l                                        ; $4c04: $4d
	add  (hl)                                        ; $4c05: $86
	ld   e, (hl)                                     ; $4c06: $5e
	rst  $38                                         ; $4c07: $ff
	rst  $38                                         ; $4c08: $ff
	rst  $38                                         ; $4c09: $ff
	rst  $38                                         ; $4c0a: $ff
	ld   e, l                                        ; $4c0b: $5d
	ld   c, l                                        ; $4c0c: $4d
	inc  b                                           ; $4c0d: $04
	ld   e, l                                        ; $4c0e: $5d
	ld   e, d                                        ; $4c0f: $5a
	rst  $38                                         ; $4c10: $ff
	ld   e, d                                        ; $4c11: $5a
	rst  $38                                         ; $4c12: $ff
	ld   d, h                                        ; $4c13: $54
	ld   c, (hl)                                     ; $4c14: $4e
	ld   c, $5d                                      ; $4c15: $0e $5d
	rst  $38                                         ; $4c17: $ff
	rst  $38                                         ; $4c18: $ff
	rst  $38                                         ; $4c19: $ff
	rst  $38                                         ; $4c1a: $ff
	ld   h, e                                        ; $4c1b: $63
	ld   c, (hl)                                     ; $4c1c: $4e
	ld   a, b                                        ; $4c1d: $78
	ld   e, (hl)                                     ; $4c1e: $5e
	rst  $38                                         ; $4c1f: $ff
	rst  $38                                         ; $4c20: $ff
	rst  $38                                         ; $4c21: $ff
	rst  $38                                         ; $4c22: $ff
	ld   e, a                                        ; $4c23: $5f
	ld   c, l                                        ; $4c24: $4d
	or   d                                           ; $4c25: $b2
	ld   e, b                                        ; $4c26: $58
	rst  $38                                         ; $4c27: $ff
	rst  $38                                         ; $4c28: $ff
	rst  $38                                         ; $4c29: $ff
	rst  $38                                         ; $4c2a: $ff
	ld   e, a                                        ; $4c2b: $5f
	ld   c, (hl)                                     ; $4c2c: $4e
	ld   sp, $ff5f                                   ; $4c2d: $31 $5f $ff
	rst  $38                                         ; $4c30: $ff
	rst  $38                                         ; $4c31: $ff
	rst  $38                                         ; $4c32: $ff
	ld   d, (hl)                                     ; $4c33: $56
	ld   c, (hl)                                     ; $4c34: $4e
	di                                               ; $4c35: $f3
	ld   e, (hl)                                     ; $4c36: $5e
	ld   e, a                                        ; $4c37: $5f
	rst  $38                                         ; $4c38: $ff
	rst  $38                                         ; $4c39: $ff
	rst  $38                                         ; $4c3a: $ff
	ld   e, a                                        ; $4c3b: $5f
	ld   c, (hl)                                     ; $4c3c: $4e
	ld   sp, $ff5f                                   ; $4c3d: $31 $5f $ff
	rst  $38                                         ; $4c40: $ff
	rst  $38                                         ; $4c41: $ff
	rst  $38                                         ; $4c42: $ff
	adc  a                                           ; $4c43: $8f
	ld   c, l                                        ; $4c44: $4d
	ld   e, h                                        ; $4c45: $5c
	ld   e, a                                        ; $4c46: $5f
	rst  $38                                         ; $4c47: $ff
	rst  $38                                         ; $4c48: $ff
	rst  $38                                         ; $4c49: $ff
	rst  $38                                         ; $4c4a: $ff
	ld   e, a                                        ; $4c4b: $5f
	ld   c, (hl)                                     ; $4c4c: $4e
	ld   l, l                                        ; $4c4d: $6d
	ld   e, a                                        ; $4c4e: $5f
	rst  $38                                         ; $4c4f: $ff
	rst  $38                                         ; $4c50: $ff
	rst  $38                                         ; $4c51: $ff
	rst  $38                                         ; $4c52: $ff
	ret  z                                           ; $4c53: $c8

	ld   c, l                                        ; $4c54: $4d
	add  $5f                                         ; $4c55: $c6 $5f
	rst  $38                                         ; $4c57: $ff
	rst  $38                                         ; $4c58: $ff
	ld   h, c                                        ; $4c59: $61
	rst  $38                                         ; $4c5a: $ff
	ret  z                                           ; $4c5b: $c8

	ld   c, l                                        ; $4c5c: $4d
	ld   sp, hl                                      ; $4c5d: $f9
	ld   h, b                                        ; $4c5e: $60
	rst  $38                                         ; $4c5f: $ff
	ld   h, l                                        ; $4c60: $65
	rst  $38                                         ; $4c61: $ff
	rst  $38                                         ; $4c62: $ff
	pop  de                                          ; $4c63: $d1
	ld   c, l                                        ; $4c64: $4d
	ld   d, c                                        ; $4c65: $51
	ld   h, b                                        ; $4c66: $60
	rst  $38                                         ; $4c67: $ff
	rst  $38                                         ; $4c68: $ff
	ld   h, e                                        ; $4c69: $63
	rst  $38                                         ; $4c6a: $ff
	ld   h, c                                        ; $4c6b: $61
	ld   c, (hl)                                     ; $4c6c: $4e
	and  $60                                         ; $4c6d: $e6 $60
	rst  $38                                         ; $4c6f: $ff
	rst  $38                                         ; $4c70: $ff
	rst  $38                                         ; $4c71: $ff
	ld   e, d                                        ; $4c72: $5a
	adc  a                                           ; $4c73: $8f
	ld   c, l                                        ; $4c74: $4d
	ld   a, ($ff00+c)                                ; $4c75: $f2
	ld   h, b                                        ; $4c76: $60
	rst  $38                                         ; $4c77: $ff
	rst  $38                                         ; $4c78: $ff
	rst  $38                                         ; $4c79: $ff
	rst  $38                                         ; $4c7a: $ff
	ld   a, $4d                                      ; $4c7b: $3e $4d
	.db  $e4                                         ; $4c7d: $e4
	ld   l, c                                        ; $4c7e: $69
	rst  $38                                         ; $4c7f: $ff
	rst  $38                                         ; $4c80: $ff
	rst  $38                                         ; $4c81: $ff
	rst  $38                                         ; $4c82: $ff
	or   d                                           ; $4c83: $b2
	ld   l, d                                        ; $4c84: $6a
	or   (hl)                                        ; $4c85: $b6
	ld   l, d                                        ; $4c86: $6a
	rst  $38                                         ; $4c87: $ff
	rst  $38                                         ; $4c88: $ff
	rst  $38                                         ; $4c89: $ff
	rst  $38                                         ; $4c8a: $ff
	or   d                                           ; $4c8b: $b2
	ld   l, d                                        ; $4c8c: $6a
	.db  $e3                                         ; $4c8d: $e3
	ld   l, d                                        ; $4c8e: $6a
	rst  $38                                         ; $4c8f: $ff
	rst  $38                                         ; $4c90: $ff
	rst  $38                                         ; $4c91: $ff
	rst  $38                                         ; $4c92: $ff
	ld   a, b                                        ; $4c93: $78
	ld   c, l                                        ; $4c94: $4d
	ldd  a, (hl)                                     ; $4c95: $3a
	ld   d, b                                        ; $4c96: $50
	rst  $38                                         ; $4c97: $ff
	rst  $38                                         ; $4c98: $ff
	rst  $38                                         ; $4c99: $ff
	rst  $38                                         ; $4c9a: $ff
	call $1b4e                                       ; $4c9b: $cd $4e $1b
	ld   d, c                                        ; $4c9e: $51
	rst  $38                                         ; $4c9f: $ff
	rst  $38                                         ; $4ca0: $ff
	rst  $38                                         ; $4ca1: $ff
	rst  $38                                         ; $4ca2: $ff
	pop  de                                          ; $4ca3: $d1
	ld   c, (hl)                                     ; $4ca4: $4e
	ldh  (<$52), a                                   ; $4ca5: $e0 $52
	rst  $38                                         ; $4ca7: $ff
	rst  $38                                         ; $4ca8: $ff
	rst  $38                                         ; $4ca9: $ff
	rst  $38                                         ; $4caa: $ff
	rst  $10                                         ; $4cab: $d7
	ld   c, (hl)                                     ; $4cac: $4e
	.db  $fc                                         ; $4cad: $fc
	ld   e, l                                        ; $4cae: $5d
	rst  $38                                         ; $4caf: $ff
	rst  $38                                         ; $4cb0: $ff
	rst  $38                                         ; $4cb1: $ff
	rst  $38                                         ; $4cb2: $ff
	push de                                          ; $4cb3: $d5
	ld   c, (hl)                                     ; $4cb4: $4e
	and  b                                           ; $4cb5: $a0
	ld   d, h                                        ; $4cb6: $54
	rst  $38                                         ; $4cb7: $ff
	rst  $38                                         ; $4cb8: $ff
	rst  $38                                         ; $4cb9: $ff
	rst  $38                                         ; $4cba: $ff
	.db  $d3                                         ; $4cbb: $d3
	ld   c, (hl)                                     ; $4cbc: $4e
	ccf                                              ; $4cbd: $3f
	ld   d, e                                        ; $4cbe: $53
	rst  $38                                         ; $4cbf: $ff
	rst  $38                                         ; $4cc0: $ff
	rst  $38                                         ; $4cc1: $ff
	rst  $38                                         ; $4cc2: $ff
	.db  $d3                                         ; $4cc3: $d3
	ld   c, (hl)                                     ; $4cc4: $4e
	inc  l                                           ; $4cc5: $2c
	ld   d, e                                        ; $4cc6: $53
	rst  $38                                         ; $4cc7: $ff
	rst  $38                                         ; $4cc8: $ff
	rst  $38                                         ; $4cc9: $ff
	rst  $38                                         ; $4cca: $ff
	.db  $d3                                         ; $4ccb: $d3
	ld   c, (hl)                                     ; $4ccc: $4e
	ld   sp, $ff53                                   ; $4ccd: $31 $53 $ff
	rst  $38                                         ; $4cd0: $ff
	rst  $38                                         ; $4cd1: $ff
	rst  $38                                         ; $4cd2: $ff
	.db  $d3                                         ; $4cd3: $d3
	ld   c, (hl)                                     ; $4cd4: $4e
	ld   (hl), $53                                   ; $4cd5: $36 $53
	rst  $38                                         ; $4cd7: $ff
	rst  $38                                         ; $4cd8: $ff
	rst  $38                                         ; $4cd9: $ff
	rst  $38                                         ; $4cda: $ff
	.db  $d3                                         ; $4cdb: $d3
	ld   c, (hl)                                     ; $4cdc: $4e
	dec  sp                                          ; $4cdd: $3b
	ld   d, e                                        ; $4cde: $53
	rst  $38                                         ; $4cdf: $ff
	rst  $38                                         ; $4ce0: $ff
	rst  $38                                         ; $4ce1: $ff
	rst  $38                                         ; $4ce2: $ff
	.db  $d3                                         ; $4ce3: $d3
	ld   c, (hl)                                     ; $4ce4: $4e
	ld   h, c                                        ; $4ce5: $61
	ld   d, e                                        ; $4ce6: $53
	rst  $38                                         ; $4ce7: $ff
	rst  $38                                         ; $4ce8: $ff
	rst  $38                                         ; $4ce9: $ff
	rst  $38                                         ; $4cea: $ff
	call $924e                                       ; $4ceb: $cd $4e $92
	ld   d, e                                        ; $4cee: $53
	rst  $38                                         ; $4cef: $ff
	rst  $38                                         ; $4cf0: $ff
	rst  $38                                         ; $4cf1: $ff
	rst  $38                                         ; $4cf2: $ff
	reti                                             ; $4cf3: $d9


	ld   c, (hl)                                     ; $4cf4: $4e
	sbc  $55                                         ; $4cf5: $de $55
	rst  $38                                         ; $4cf7: $ff
	rst  $38                                         ; $4cf8: $ff
	rst  $38                                         ; $4cf9: $ff
	rst  $38                                         ; $4cfa: $ff
	reti                                             ; $4cfb: $d9


	ld   c, (hl)                                     ; $4cfc: $4e
	ld   ($ff55), a                                  ; $4cfd: $ea $55 $ff
	rst  $38                                         ; $4d00: $ff
	rst  $38                                         ; $4d01: $ff
	rst  $38                                         ; $4d02: $ff
	rst  $38                                         ; $4d03: $ff
	ld   c, (hl)                                     ; $4d04: $4e
	ld   c, $56                                      ; $4d05: $0e $56
	rst  $38                                         ; $4d07: $ff
	rst  $38                                         ; $4d08: $ff
	rst  $38                                         ; $4d09: $ff
	rst  $38                                         ; $4d0a: $ff
	ld   b, l                                        ; $4d0b: $45
	ld   c, a                                        ; $4d0c: $4f
	and  b                                           ; $4d0d: $a0
	ld   e, b                                        ; $4d0e: $58
	nop                                              ; $4d0f: $00
	rst  $38                                         ; $4d10: $ff
	nop                                              ; $4d11: $00
	rst  $38                                         ; $4d12: $ff
	ld   d, c                                        ; $4d13: $51
	ld   c, a                                        ; $4d14: $4f
	call nc, $ff58                                   ; $4d15: $d4 $58 $ff
	rst  $38                                         ; $4d18: $ff
	rst  $38                                         ; $4d19: $ff
	ld   a, h                                        ; $4d1a: $7c
	ld   c, e                                        ; $4d1b: $4b
	ld   c, a                                        ; $4d1c: $4f
	or   d                                           ; $4d1d: $b2
	ld   e, b                                        ; $4d1e: $58
	nop                                              ; $4d1f: $00
	rst  $38                                         ; $4d20: $ff
	nop                                              ; $4d21: $00
	rst  $38                                         ; $4d22: $ff
	ld   d, e                                        ; $4d23: $53
	ld   c, a                                        ; $4d24: $4f
	call nc, $ff58                                   ; $4d25: $d4 $58 $ff
	rst  $38                                         ; $4d28: $ff
	rst  $38                                         ; $4d29: $ff
	ld   a, h                                        ; $4d2a: $7c
	ld   d, l                                        ; $4d2b: $55
	ld   c, a                                        ; $4d2c: $4f
	push hl                                          ; $4d2d: $e5
	ld   e, b                                        ; $4d2e: $58
	rst  $38                                         ; $4d2f: $ff
	rst  $38                                         ; $4d30: $ff
	rst  $38                                         ; $4d31: $ff
	rst  $38                                         ; $4d32: $ff
	sbc  $4e                                         ; $4d33: $de $4e
	.db  $ed                                         ; $4d35: $ed
	ld   e, b                                        ; $4d36: $58
	rst  $38                                         ; $4d37: $ff
	rst  $38                                         ; $4d38: $ff
	rst  $38                                         ; $4d39: $ff
	rst  $38                                         ; $4d3a: $ff
	rst  $08                                         ; $4d3b: $cf
	ld   c, (hl)                                     ; $4d3c: $4e
	adc  (hl)                                        ; $4d3d: $8e
	ld   e, a                                        ; $4d3e: $5f
	rst  $38                                         ; $4d3f: $ff
	rst  $38                                         ; $4d40: $ff
	rst  $38                                         ; $4d41: $ff
	rst  $38                                         ; $4d42: $ff
	dec  c                                           ; $4d43: $0d
	ld   c, a                                        ; $4d44: $4f
	sbc  $5f                                         ; $4d45: $de $5f
	rst  $38                                         ; $4d47: $ff
	rst  $38                                         ; $4d48: $ff
	rst  $38                                         ; $4d49: $ff
	rst  $38                                         ; $4d4a: $ff
	.db  $e3                                         ; $4d4b: $e3
	ld   c, (hl)                                     ; $4d4c: $4e

$4d4d:
	ld   e, $60                                      ; $4d4d: $1e $60
	rst  $38                                         ; $4d4f: $ff
	rst  $38                                         ; $4d50: $ff
	rst  $38                                         ; $4d51: $ff
	rst  $38                                         ; $4d52: $ff
	rst  $20                                         ; $4d53: $e7
	ld   c, (hl)                                     ; $4d54: $4e
	inc  sp                                          ; $4d55: $33
	ld   h, b                                        ; $4d56: $60
	rst  $38                                         ; $4d57: $ff
	rst  $38                                         ; $4d58: $ff
	rst  $38                                         ; $4d59: $ff
	rst  $38                                         ; $4d5a: $ff
	call $014e                                       ; $4d5b: $cd $4e $01
	ld   d, b                                        ; $4d5e: $50
	rst  $38                                         ; $4d5f: $ff
	rst  $38                                         ; $4d60: $ff
	rst  $38                                         ; $4d61: $ff
	rst  $38                                         ; $4d62: $ff
	call $424e                                       ; $4d63: $cd $4e $42
	ld   h, b                                        ; $4d66: $60
	rst  $38                                         ; $4d67: $ff
	rst  $38                                         ; $4d68: $ff
	rst  $38                                         ; $4d69: $ff
	rst  $38                                         ; $4d6a: $ff
	inc  a                                           ; $4d6b: $3c
	ld   c, a                                        ; $4d6c: $4f
	pop  hl                                          ; $4d6d: $e1
	ld   h, l                                        ; $4d6e: $65
	rst  $38                                         ; $4d6f: $ff
	rst  $38                                         ; $4d70: $ff
	rst  $38                                         ; $4d71: $ff
	rst  $38                                         ; $4d72: $ff
	ld   d, $4f                                      ; $4d73: $16 $4f
	ld   (hl), b                                     ; $4d75: $70
	ld   h, (hl)                                     ; $4d76: $66
	add  (hl)                                        ; $4d77: $86
	add  (hl)                                        ; $4d78: $86
	add  a                                           ; $4d79: $87
	rst  $38                                         ; $4d7a: $ff
	ld   d, $4f                                      ; $4d7b: $16 $4f
	add  h                                           ; $4d7d: $84
	ld   h, (hl)                                     ; $4d7e: $66
	rst  $38                                         ; $4d7f: $ff
	add  (hl)                                        ; $4d80: $86
	add  a                                           ; $4d81: $87
	rst  $38                                         ; $4d82: $ff
	ld   d, $4f                                      ; $4d83: $16 $4f
	sub  b                                           ; $4d85: $90
	ld   h, (hl)                                     ; $4d86: $66
	rst  $38                                         ; $4d87: $ff
	rst  $38                                         ; $4d88: $ff
	rst  $38                                         ; $4d89: $ff
	rst  $38                                         ; $4d8a: $ff
	.db  $db                                         ; $4d8b: $db
	ld   c, (hl)                                     ; $4d8c: $4e
	cp   a                                           ; $4d8d: $bf
	ld   h, (hl)                                     ; $4d8e: $66
	rst  $38                                         ; $4d8f: $ff
	rst  $38                                         ; $4d90: $ff
	rst  $38                                         ; $4d91: $ff
	rst  $38                                         ; $4d92: $ff
	ld   ($cb4f), sp                                 ; $4d93: $08 $4f $cb
	ld   h, (hl)                                     ; $4d96: $66
	rst  $38                                         ; $4d97: $ff
	rst  $38                                         ; $4d98: $ff
	rst  $38                                         ; $4d99: $ff
	rst  $38                                         ; $4d9a: $ff
	call $fc4e                                       ; $4d9b: $cd $4e $fc
	ld   h, (hl)                                     ; $4d9e: $66
	rst  $38                                         ; $4d9f: $ff
	rst  $38                                         ; $4da0: $ff
	rst  $38                                         ; $4da1: $ff
	rst  $38                                         ; $4da2: $ff
	call $214e                                       ; $4da3: $cd $4e $21
	ld   h, a                                        ; $4da6: $67
	rst  $38                                         ; $4da7: $ff
	rst  $38                                         ; $4da8: $ff
	rst  $38                                         ; $4da9: $ff
	rst  $38                                         ; $4daa: $ff
	rra                                              ; $4dab: $1f
	ld   c, a                                        ; $4dac: $4f
	ret                                              ; $4dad: $c9


	ld   h, a                                        ; $4dae: $67
	nop                                              ; $4daf: $00
	adc  h                                           ; $4db0: $8c
	nop                                              ; $4db1: $00
	rst  $38                                         ; $4db2: $ff
	jr   z, jr_006_4e04                              ; $4db3: $28 $4f

	jp   hl                                          ; $4db5: $e9


	ld   h, a                                        ; $4db6: $67
	rst  $38                                         ; $4db7: $ff
	adc  l                                           ; $4db8: $8d
	nop                                              ; $4db9: $00
	rst  $38                                         ; $4dba: $ff
	ld   sp, $ff4f                                   ; $4dbb: $31 $4f $ff
	ld   h, a                                        ; $4dbe: $67
	rst  $38                                         ; $4dbf: $ff
	adc  (hl)                                        ; $4dc0: $8e
	nop                                              ; $4dc1: $00
	rst  $38                                         ; $4dc2: $ff
	ldd  a, (hl)                                     ; $4dc3: $3a
	ld   c, a                                        ; $4dc4: $4f
	ldd  (hl), a                                     ; $4dc5: $32
	ld   l, b                                        ; $4dc6: $68
	rst  $38                                         ; $4dc7: $ff
	rst  $38                                         ; $4dc8: $ff
	rst  $38                                         ; $4dc9: $ff
	rst  $38                                         ; $4dca: $ff
	call $fa4e                                       ; $4dcb: $cd $4e $fa
	ld   e, a                                        ; $4dce: $5f
	rst  $38                                         ; $4dcf: $ff
	rst  $38                                         ; $4dd0: $ff
	rst  $38                                         ; $4dd1: $ff
	rst  $38                                         ; $4dd2: $ff
	ld   e, d                                        ; $4dd3: $5a
	ld   c, a                                        ; $4dd4: $4f
	ld   d, l                                        ; $4dd5: $55
	ld   l, b                                        ; $4dd6: $68
	nop                                              ; $4dd7: $00
	sub  c                                           ; $4dd8: $91
	nop                                              ; $4dd9: $00
	rst  $38                                         ; $4dda: $ff
	rst  $00                                         ; $4ddb: $c7
	ld   c, a                                        ; $4ddc: $4f
	or   $55                                         ; $4ddd: $f6 $55
	nop                                              ; $4ddf: $00
	sub  d                                           ; $4de0: $92
	nop                                              ; $4de1: $00
	rst  $38                                         ; $4de2: $ff
	ld   h, e                                        ; $4de3: $63
	ld   c, a                                        ; $4de4: $4f
	sbc  b                                           ; $4de5: $98
	ld   l, b                                        ; $4de6: $68
	nop                                              ; $4de7: $00
	sub  e                                           ; $4de8: $93
	nop                                              ; $4de9: $00
	rst  $38                                         ; $4dea: $ff
	ld   l, h                                        ; $4deb: $6c
	ld   c, a                                        ; $4dec: $4f
	ld   ($ff00+c), a                                ; $4ded: $e2
	ld   l, b                                        ; $4dee: $68
	nop                                              ; $4def: $00
	sub  h                                           ; $4df0: $94
	nop                                              ; $4df1: $00
	rst  $38                                         ; $4df2: $ff
	ld   (hl), l                                     ; $4df3: $75
	ld   c, a                                        ; $4df4: $4f
	dec  hl                                          ; $4df5: $2b
	ld   l, c                                        ; $4df6: $69
	rst  $38                                         ; $4df7: $ff
	rst  $38                                         ; $4df8: $ff
	rst  $38                                         ; $4df9: $ff
	rst  $38                                         ; $4dfa: $ff
	ld   a, d                                        ; $4dfb: $7a
	ld   c, a                                        ; $4dfc: $4f
	jr   c, jr_006_4e68                              ; $4dfd: $38 $69

	nop                                              ; $4dff: $00
	sub  (hl)                                        ; $4e00: $96
	nop                                              ; $4e01: $00
	rst  $38                                         ; $4e02: $ff
	add  e                                           ; $4e03: $83

jr_006_4e04:
	ld   c, a                                        ; $4e04: $4f
	sub  l                                           ; $4e05: $95
	ld   l, c                                        ; $4e06: $69
	nop                                              ; $4e07: $00
	sub  (hl)                                        ; $4e08: $96
	nop                                              ; $4e09: $00
	rst  $38                                         ; $4e0a: $ff
	add  e                                           ; $4e0b: $83
	ld   c, a                                        ; $4e0c: $4f
	xor  c                                           ; $4e0d: $a9
	ld   l, c                                        ; $4e0e: $69
	nop                                              ; $4e0f: $00
	sub  (hl)                                        ; $4e10: $96
	nop                                              ; $4e11: $00
	rst  $38                                         ; $4e12: $ff
	call $3b4e                                       ; $4e13: $cd $4e $3b
	ld   l, d                                        ; $4e16: $6a
	rst  $38                                         ; $4e17: $ff
	rst  $38                                         ; $4e18: $ff
	rst  $38                                         ; $4e19: $ff
	rst  $38                                         ; $4e1a: $ff
	add  (hl)                                        ; $4e1b: $86
	ld   c, a                                        ; $4e1c: $4f
	ld   sp, $ff6b                                   ; $4e1d: $31 $6b $ff
	rst  $38                                         ; $4e20: $ff
	rst  $38                                         ; $4e21: $ff
	rst  $38                                         ; $4e22: $ff
	call $3b4e                                       ; $4e23: $cd $4e $3b
	ld   l, e                                        ; $4e26: $6b
	rst  $38                                         ; $4e27: $ff
	rst  $38                                         ; $4e28: $ff
	rst  $38                                         ; $4e29: $ff
	rst  $38                                         ; $4e2a: $ff
	ld   b, l                                        ; $4e2b: $45
	ld   c, a                                        ; $4e2c: $4f
	ld   (hl), d                                     ; $4e2d: $72
	ld   l, e                                        ; $4e2e: $6b
	nop                                              ; $4e2f: $00
	rst  $38                                         ; $4e30: $ff
	nop                                              ; $4e31: $00
	rst  $38                                         ; $4e32: $ff
	call $bf4e                                       ; $4e33: $cd $4e $bf
	ld   l, e                                        ; $4e36: $6b
	rst  $38                                         ; $4e37: $ff
	rst  $38                                         ; $4e38: $ff
	nop                                              ; $4e39: $00
	rst  $38                                         ; $4e3a: $ff
	sub  h                                           ; $4e3b: $94
	ld   c, a                                        ; $4e3c: $4f
	.db  $db                                         ; $4e3d: $db
	ld   l, h                                        ; $4e3e: $6c
	rst  $38                                         ; $4e3f: $ff
	rst  $38                                         ; $4e40: $ff
	rst  $38                                         ; $4e41: $ff
	rst  $38                                         ; $4e42: $ff
	sub  (hl)                                        ; $4e43: $96
	ld   c, a                                        ; $4e44: $4f
	ld   (hl), a                                     ; $4e45: $77
	ld   l, l                                        ; $4e46: $6d
	rst  $38                                         ; $4e47: $ff
	rst  $38                                         ; $4e48: $ff
	rst  $38                                         ; $4e49: $ff
	rst  $38                                         ; $4e4a: $ff
	sub  (hl)                                        ; $4e4b: $96
	ld   c, a                                        ; $4e4c: $4f
	adc  h                                           ; $4e4d: $8c
	ld   l, l                                        ; $4e4e: $6d
	rst  $38                                         ; $4e4f: $ff
	rst  $38                                         ; $4e50: $ff
	rst  $38                                         ; $4e51: $ff
	rst  $38                                         ; $4e52: $ff
	call $d34e                                       ; $4e53: $cd $4e $d3
	ld   l, e                                        ; $4e56: $6b
	rst  $38                                         ; $4e57: $ff
	rst  $38                                         ; $4e58: $ff
	jr   nz, -$01                                     ; $4e59: $20 $ff

	.db $cd $4e $48
	ld   l, h                                        ; $4e5e: $6c
	and  e                                           ; $4e5f: $a3
	rst  $38                                         ; $4e60: $ff
	and  e                                           ; $4e61: $a3
	and  e                                           ; $4e62: $a3
	ld   d, l                                        ; $4e63: $55
	ld   c, a                                        ; $4e64: $4f
	and  (hl)                                        ; $4e65: $a6
	ld   l, h                                        ; $4e66: $6c
	rst  $38                                         ; $4e67: $ff

jr_006_4e68:
	rst  $38                                         ; $4e68: $ff
	rst  $38                                         ; $4e69: $ff
	rst  $38                                         ; $4e6a: $ff
	ld   d, c                                        ; $4e6b: $51
	ld   c, a                                        ; $4e6c: $4f
	add  b                                           ; $4e6d: $80
	ld   l, e                                        ; $4e6e: $6b
	rst  $38                                         ; $4e6f: $ff
	rst  $38                                         ; $4e70: $ff
	rst  $38                                         ; $4e71: $ff
	ld   a, h                                        ; $4e72: $7c
	ld   c, e                                        ; $4e73: $4b
	ld   c, a                                        ; $4e74: $4f
	adc  (hl)                                        ; $4e75: $8e
	ld   l, e                                        ; $4e76: $6b
	nop                                              ; $4e77: $00
	rst  $38                                         ; $4e78: $ff
	nop                                              ; $4e79: $00
	rst  $38                                         ; $4e7a: $ff
	adc  b                                           ; $4e7b: $88
	ld   c, a                                        ; $4e7c: $4f
	and  b                                           ; $4e7d: $a0
	ld   l, e                                        ; $4e7e: $6b
	nop                                              ; $4e7f: $00
	rst  $38                                         ; $4e80: $ff
	nop                                              ; $4e81: $00
	rst  $38                                         ; $4e82: $ff
	sbc  (hl)                                        ; $4e83: $9e
	ld   c, a                                        ; $4e84: $4f
	ret  nc                                          ; $4e85: $d0

	ld   l, c                                        ; $4e86: $69
	nop                                              ; $4e87: $00
	rst  $38                                         ; $4e88: $ff
	nop                                              ; $4e89: $00
	and  a                                           ; $4e8a: $a7
	and  a                                           ; $4e8b: $a7
	ld   c, a                                        ; $4e8c: $4f
	add  sp, $69                                     ; $4e8d: $e8 $69
	nop                                              ; $4e8f: $00
	rst  $38                                         ; $4e90: $ff
	nop                                              ; $4e91: $00
	xor  b                                           ; $4e92: $a8
	or   b                                           ; $4e93: $b0
	ld   c, a                                        ; $4e94: $4f
	rst  $30                                         ; $4e95: $f7
	ld   l, c                                        ; $4e96: $69
	nop                                              ; $4e97: $00
	rst  $38                                         ; $4e98: $ff
	nop                                              ; $4e99: $00
	xor  c                                           ; $4e9a: $a9
	cp   c                                           ; $4e9b: $b9
	ld   c, a                                        ; $4e9c: $4f
	inc  de                                          ; $4e9d: $13
	ld   l, d                                        ; $4e9e: $6a
	nop                                              ; $4e9f: $00
	rst  $38                                         ; $4ea0: $ff
	nop                                              ; $4ea1: $00
	xor  d                                           ; $4ea2: $aa
	jp   nz, $304f                                   ; $4ea3: $c2 $4f $30

	ld   l, d                                        ; $4ea6: $6a
	ld   a, h                                        ; $4ea7: $7c
	rst  $38                                         ; $4ea8: $ff
	ld   a, h                                        ; $4ea9: $7c
	rst  $38                                         ; $4eaa: $ff
	dec  c                                           ; $4eab: $0d
	ld   c, a                                        ; $4eac: $4f
	.db  $ec                                         ; $4ead: $ec
	ld   e, a                                        ; $4eae: $5f
	rst  $38                                         ; $4eaf: $ff
	rst  $38                                         ; $4eb0: $ff
	rst  $38                                         ; $4eb1: $ff
	rst  $38                                         ; $4eb2: $ff
	sbc  b                                           ; $4eb3: $98
	ld   c, a                                        ; $4eb4: $4f
	and  c                                           ; $4eb5: $a1
	ld   l, l                                        ; $4eb6: $6d
	rst  $38                                         ; $4eb7: $ff
	rst  $38                                         ; $4eb8: $ff
	rst  $38                                         ; $4eb9: $ff
	rst  $38                                         ; $4eba: $ff
	sbc  b                                           ; $4ebb: $98
	ld   c, a                                        ; $4ebc: $4f
	ret  z                                           ; $4ebd: $c8

	ld   l, l                                        ; $4ebe: $6d
	rst  $38                                         ; $4ebf: $ff
	rst  $38                                         ; $4ec0: $ff
	rst  $38                                         ; $4ec1: $ff
	rst  $38                                         ; $4ec2: $ff
	ret  nc                                          ; $4ec3: $d0

	ld   c, a                                        ; $4ec4: $4f
	rst  $28                                         ; $4ec5: $ef
	ld   l, l                                        ; $4ec6: $6d
	rst  $38                                         ; $4ec7: $ff
	rst  $38                                         ; $4ec8: $ff
	rst  $38                                         ; $4ec9: $ff
	rst  $38                                         ; $4eca: $ff
	sbc  e                                           ; $4ecb: $9b
	ld   c, a                                        ; $4ecc: $4f
	ld   l, (hl)                                     ; $4ecd: $6e
	ld   l, l                                        ; $4ece: $6d
	or   d                                           ; $4ecf: $b2
	rst  $38                                         ; $4ed0: $ff
	rst  $38                                         ; $4ed1: $ff
	rst  $38                                         ; $4ed2: $ff
	sub  c                                           ; $4ed3: $91
	ld   c, a                                        ; $4ed4: $4f
	ld   ($ff6e), sp                                 ; $4ed5: $08 $6e $ff
	rst  $38                                         ; $4ed8: $ff
	rst  $38                                         ; $4ed9: $ff
	rst  $38                                         ; $4eda: $ff
	sub  c                                           ; $4edb: $91
	ld   c, a                                        ; $4edc: $4f
	ldi  (hl), a                                     ; $4edd: $22
	ld   l, (hl)                                     ; $4ede: $6e
	rst  $38                                         ; $4edf: $ff
	rst  $38                                         ; $4ee0: $ff
	rst  $38                                         ; $4ee1: $ff
	rst  $38                                         ; $4ee2: $ff
	jp   nc, $a84f                                   ; $4ee3: $d2 $4f $a8

	ld   l, (hl)                                     ; $4ee6: $6e
	ld   a, h                                        ; $4ee7: $7c
	rst  $38                                         ; $4ee8: $ff
	ld   a, h                                        ; $4ee9: $7c
	ld   a, h                                        ; $4eea: $7c
	.db  $eb                                         ; $4eeb: $eb
	ld   c, (hl)                                     ; $4eec: $4e
	dec  l                                           ; $4eed: $2d
	ld   d, b                                        ; $4eee: $50
	rst  $38                                         ; $4eef: $ff
	rst  $38                                         ; $4ef0: $ff
	rst  $38                                         ; $4ef1: $ff
	rst  $38                                         ; $4ef2: $ff
	ldh  a, (<$4e)                                   ; $4ef3: $f0 $4e
	ld   b, h                                        ; $4ef5: $44
	ld   d, b                                        ; $4ef6: $50
	rst  $38                                         ; $4ef7: $ff
	rst  $38                                         ; $4ef8: $ff
	rst  $38                                         ; $4ef9: $ff
	rst  $38                                         ; $4efa: $ff
	push af                                          ; $4efb: $f5
	ld   c, (hl)                                     ; $4efc: $4e
	ld   d, e                                        ; $4efd: $53
	ld   d, b                                        ; $4efe: $50
	rst  $38                                         ; $4eff: $ff
	rst  $38                                         ; $4f00: $ff
	rst  $38                                         ; $4f01: $ff
	rst  $38                                         ; $4f02: $ff
	ld   a, ($6c4e)                                  ; $4f03: $fa $4e $6c
	ld   d, b                                        ; $4f06: $50
	rst  $38                                         ; $4f07: $ff
	rst  $38                                         ; $4f08: $ff
	rst  $38                                         ; $4f09: $ff
	rst  $38                                         ; $4f0a: $ff
	sbc  $4e                                         ; $4f0b: $de $4e
	add  c                                           ; $4f0d: $81
	ld   d, b                                        ; $4f0e: $50
	rst  $38                                         ; $4f0f: $ff
	rst  $38                                         ; $4f10: $ff
	rst  $38                                         ; $4f11: $ff
	rst  $38                                         ; $4f12: $ff
	.db  $eb                                         ; $4f13: $eb
	ld   c, (hl)                                     ; $4f14: $4e
	cp   (hl)                                        ; $4f15: $be
	ld   l, (hl)                                     ; $4f16: $6e
	rst  $38                                         ; $4f17: $ff
	rst  $38                                         ; $4f18: $ff
	rst  $38                                         ; $4f19: $ff
	rst  $38                                         ; $4f1a: $ff
	.db  $eb                                         ; $4f1b: $eb
	ld   c, (hl)                                     ; $4f1c: $4e
	ret  z                                           ; $4f1d: $c8

	ld   l, (hl)                                     ; $4f1e: $6e
	rst  $38                                         ; $4f1f: $ff
	rst  $38                                         ; $4f20: $ff
	rst  $38                                         ; $4f21: $ff
	rst  $38                                         ; $4f22: $ff
	.db  $eb                                         ; $4f23: $eb
	ld   c, (hl)                                     ; $4f24: $4e
	sub  $6e                                         ; $4f25: $d6 $6e
	rst  $38                                         ; $4f27: $ff
	rst  $38                                         ; $4f28: $ff
	rst  $38                                         ; $4f29: $ff
	rst  $38                                         ; $4f2a: $ff
	.db  $eb                                         ; $4f2b: $eb
	ld   c, (hl)                                     ; $4f2c: $4e
	add  sp, $6e                                     ; $4f2d: $e8 $6e
	rst  $38                                         ; $4f2f: $ff
	rst  $38                                         ; $4f30: $ff
	rst  $38                                         ; $4f31: $ff
	rst  $38                                         ; $4f32: $ff
	.db  $eb                                         ; $4f33: $eb
	ld   c, (hl)                                     ; $4f34: $4e
	.db  $fc                                         ; $4f35: $fc
	ld   l, (hl)                                     ; $4f36: $6e
	rst  $38                                         ; $4f37: $ff
	rst  $38                                         ; $4f38: $ff
	rst  $38                                         ; $4f39: $ff
	rst  $38                                         ; $4f3a: $ff
	.db  $eb                                         ; $4f3b: $eb
	ld   c, (hl)                                     ; $4f3c: $4e
	ld   (de), a                                     ; $4f3d: $12
	ld   l, a                                        ; $4f3e: $6f
	rst  $38                                         ; $4f3f: $ff
	rst  $38                                         ; $4f40: $ff
	rst  $38                                         ; $4f41: $ff
	rst  $38                                         ; $4f42: $ff
	ld   l, a                                        ; $4f43: $6f
	dec  c                                           ; $4f44: $0d
	or   $0d                                         ; $4f45: $f6 $0d
	ret  nz                                          ; $4f47: $c0

	rst  $38                                         ; $4f48: $ff
	nop                                              ; $4f49: $00
	cp   a                                           ; $4f4a: $bf
	ld   h, (hl)                                     ; $4f4b: $66
	dec  c                                           ; $4f4c: $0d
	inc  b                                           ; $4f4d: $04
	ld   c, $ff                                      ; $4f4e: $0e $ff
	rst  $38                                         ; $4f50: $ff
	rst  $38                                         ; $4f51: $ff
	rst  $38                                         ; $4f52: $ff
	ld   e, l                                        ; $4f53: $5d
	dec  c                                           ; $4f54: $0d
	or   $0d                                         ; $4f55: $f6 $0d
	nop                                              ; $4f57: $00
	rst  $38                                         ; $4f58: $ff
	nop                                              ; $4f59: $00
	pop  bc                                          ; $4f5a: $c1
	ld   d, h                                        ; $4f5b: $54
	dec  c                                           ; $4f5c: $0d
	sbc  (hl)                                        ; $4f5d: $9e
	ld   de, $ffc3                                   ; $4f5e: $11 $c3 $ff
	nop                                              ; $4f61: $00
	jp   nz, $0d4b                                   ; $4f62: $c2 $4b $0d

	xor  h                                           ; $4f65: $ac
	ld   de, $ffff                                   ; $4f66: $11 $ff $ff
	rst  $38                                         ; $4f69: $ff
	rst  $38                                         ; $4f6a: $ff
	ld   d, h                                        ; $4f6b: $54
	dec  c                                           ; $4f6c: $0d
	sbc  (hl)                                        ; $4f6d: $9e
	ld   de, $ff00                                   ; $4f6e: $11 $00 $ff
	nop                                              ; $4f71: $00
	call nz, $0d78                                   ; $4f72: $c4 $78 $0d
	or   c                                           ; $4f75: $b1
	ld   de, $ffc5                                   ; $4f76: $11 $c5 $ff
	rst  $38                                         ; $4f79: $ff
	push bc                                          ; $4f7a: $c5
	ld   c, e                                        ; $4f7b: $4b
	dec  c                                           ; $4f7c: $0d
	.db  $d3                                         ; $4f7d: $d3
	ld   (de), a                                     ; $4f7e: $12
	jp   z, $e0ff                                    ; $4f7f: $ca $ff $e0

	rst  $38                                         ; $4f82: $ff
	ld   c, e                                        ; $4f83: $4b
	dec  c                                           ; $4f84: $0d
	ld   ($cb13), sp                                 ; $4f85: $08 $13 $cb
	rst  $38                                         ; $4f88: $ff
	ldh  (<$ff), a                                   ; $4f89: $e0 $ff
	xor  b                                           ; $4f8b: $a8
	dec  c                                           ; $4f8c: $0d
	ld   h, $14                                      ; $4f8d: $26 $14
	rst  $38                                         ; $4f8f: $ff
	rst  $38                                         ; $4f90: $ff
	rst  $38                                         ; $4f91: $ff
	rst  $38                                         ; $4f92: $ff
	ld   c, e                                        ; $4f93: $4b
	dec  c                                           ; $4f94: $0d
	dec  a                                           ; $4f95: $3d
	inc  de                                          ; $4f96: $13
	call z, $e0ff                                    ; $4f97: $cc $ff $e0
	rst  $38                                         ; $4f9a: $ff
	ld   c, e                                        ; $4f9b: $4b
	dec  c                                           ; $4f9c: $0d
	.db  $d3                                         ; $4f9d: $d3
	ld   (de), a                                     ; $4f9e: $12
	ldh  (<$ff), a                                   ; $4f9f: $e0 $ff
	ldh  (<$ff), a                                   ; $4fa1: $e0 $ff
	ld   c, e                                        ; $4fa3: $4b
	dec  c                                           ; $4fa4: $0d
	ld   ($e013), sp                                 ; $4fa5: $08 $13 $e0
	rst  $38                                         ; $4fa8: $ff
	ldh  (<$ff), a                                   ; $4fa9: $e0 $ff
	ld   c, e                                        ; $4fab: $4b
	dec  c                                           ; $4fac: $0d
	dec  a                                           ; $4fad: $3d
	inc  de                                          ; $4fae: $13
	ldh  (<$ff), a                                   ; $4faf: $e0 $ff
	ldh  (<$ff), a                                   ; $4fb1: $e0 $ff
	reti                                             ; $4fb3: $d9


	dec  c                                           ; $4fb4: $0d
	ld   e, (hl)                                     ; $4fb5: $5e
	ld   (de), a                                     ; $4fb6: $12
	rst  $38                                         ; $4fb7: $ff
	rst  $38                                         ; $4fb8: $ff
	ldh  (<$ff), a                                   ; $4fb9: $e0 $ff
	push bc                                          ; $4fbb: $c5
	dec  c                                           ; $4fbc: $0d
	ld   l, $14                                      ; $4fbd: $2e $14
	rst  $38                                         ; $4fbf: $ff
	rst  $38                                         ; $4fc0: $ff
	rst  $38                                         ; $4fc1: $ff
	rst  $38                                         ; $4fc2: $ff
	ld   a, b                                        ; $4fc3: $78
	dec  c                                           ; $4fc4: $0d
	xor  c                                           ; $4fc5: $a9
	ld   (de), a                                     ; $4fc6: $12
	rst  $38                                         ; $4fc7: $ff
	rst  $38                                         ; $4fc8: $ff
	ldh  (<$ff), a                                   ; $4fc9: $e0 $ff
	adc  $0d                                         ; $4fcb: $ce $0d
	ld   e, (hl)                                     ; $4fcd: $5e
	inc  d                                           ; $4fce: $14
	inc  bc                                          ; $4fcf: $03
	rst  $38                                         ; $4fd0: $ff
	inc  bc                                          ; $4fd1: $03
	inc  bc                                          ; $4fd2: $03
	or   c                                           ; $4fd3: $b1
	dec  c                                           ; $4fd4: $0d
	ld   a, c                                        ; $4fd5: $79
	inc  de                                          ; $4fd6: $13
	pop  hl                                          ; $4fd7: $e1
	rst  $38                                         ; $4fd8: $ff
	pop  hl                                          ; $4fd9: $e1
	pop  de                                          ; $4fda: $d1
	adc  $0d                                         ; $4fdb: $ce $0d
	inc  (hl)                                        ; $4fdd: $34
	inc  d                                           ; $4fde: $14
	inc  bc                                          ; $4fdf: $03
	rst  $38                                         ; $4fe0: $ff
	inc  bc                                          ; $4fe1: $03
	inc  bc                                          ; $4fe2: $03
	xor  b                                           ; $4fe3: $a8
	dec  c                                           ; $4fe4: $0d
	ld   e, $14                                      ; $4fe5: $1e $14
	inc  bc                                          ; $4fe7: $03
	rst  $38                                         ; $4fe8: $ff
	inc  bc                                          ; $4fe9: $03
	rst  $38                                         ; $4fea: $ff
	reti                                             ; $4feb: $d9


	dec  c                                           ; $4fec: $0d
	.db  $ed                                         ; $4fed: $ed
	ld   de, $ffff                                   ; $4fee: $11 $ff $ff
	rst  $38                                         ; $4ff1: $ff
	rst  $38                                         ; $4ff2: $ff
	reti                                             ; $4ff3: $d9


	dec  c                                           ; $4ff4: $0d
	cp   d                                           ; $4ff5: $ba
	ld   (de), a                                     ; $4ff6: $12
	rst  $38                                         ; $4ff7: $ff
	rst  $38                                         ; $4ff8: $ff
	ldh  (<$ff), a                                   ; $4ff9: $e0 $ff
	reti                                             ; $4ffb: $d9


	dec  c                                           ; $4ffc: $0d
	call c, $ff11                                    ; $4ffd: $dc $11 $ff
	rst  $38                                         ; $5000: $ff
	rst  $38                                         ; $5001: $ff
	rst  $38                                         ; $5002: $ff
	.db  $db                                         ; $5003: $db
	dec  c                                           ; $5004: $0d
	ldi  (hl), a                                     ; $5005: $22
	ld   (de), a                                     ; $5006: $12
	rst  $38                                         ; $5007: $ff
	rst  $38                                         ; $5008: $ff
	rst  $38                                         ; $5009: $ff
	rst  $38                                         ; $500a: $ff
	ld   c, e                                        ; $500b: $4b
	dec  c                                           ; $500c: $0d
	rst  $38                                         ; $500d: $ff
	ld   de, $ffff                                   ; $500e: $11 $ff $ff
	rst  $38                                         ; $5011: $ff
	rst  $38                                         ; $5012: $ff
	or   h                                           ; $5013: $b4
	dec  c                                           ; $5014: $0d
	or   l                                           ; $5015: $b5
	inc  de                                          ; $5016: $13
	rst  $38                                         ; $5017: $ff
	rst  $38                                         ; $5018: $ff
	rst  $38                                         ; $5019: $ff
	rst  $38                                         ; $501a: $ff
	or   h                                           ; $501b: $b4
	dec  c                                           ; $501c: $0d
	sbc  c                                           ; $501d: $99
	inc  de                                          ; $501e: $13
	rst  $38                                         ; $501f: $ff
	rst  $38                                         ; $5020: $ff
	rst  $38                                         ; $5021: $ff
	rst  $38                                         ; $5022: $ff
	ld   e, l                                        ; $5023: $5d
	dec  c                                           ; $5024: $0d
	adc  d                                           ; $5025: $8a
	inc  d                                           ; $5026: $14
	rst  $38                                         ; $5027: $ff
	rst  $38                                         ; $5028: $ff
	ldh  (<$ff), a                                   ; $5029: $e0 $ff
	reti                                             ; $502b: $d9


	dec  c                                           ; $502c: $0d
	and  e                                           ; $502d: $a3
	inc  d                                           ; $502e: $14
	rst  $38                                         ; $502f: $ff
	rst  $38                                         ; $5030: $ff
	rst  $38                                         ; $5031: $ff
	rst  $38                                         ; $5032: $ff
	sbc  $0d                                         ; $5033: $de $0d
	.db  $db                                         ; $5035: $db
	inc  de                                          ; $5036: $13
	rst  $38                                         ; $5037: $ff
	rst  $38                                         ; $5038: $ff
	ldh  (<$ff), a                                   ; $5039: $e0 $ff
	add  c                                           ; $503b: $81
	dec  c                                           ; $503c: $0d
	inc  b                                           ; $503d: $04
	inc  d                                           ; $503e: $14
	rst  $38                                         ; $503f: $ff
	rst  $38                                         ; $5040: $ff
	ldh  (<$ff), a                                   ; $5041: $e0 $ff
	.db  $e3                                         ; $5043: $e3
	dec  c                                           ; $5044: $0d
	dec  d                                           ; $5045: $15
	inc  d                                           ; $5046: $14
	rst  $38                                         ; $5047: $ff
	rst  $38                                         ; $5048: $ff
	ldh  (<$ff), a                                   ; $5049: $e0 $ff
	add  sp, $0d                                     ; $504b: $e8 $0d
	jp   $ff11                                       ; $504d: $c3 $11 $ff


	rst  $38                                         ; $5050: $ff
	rst  $38                                         ; $5051: $ff
	rst  $38                                         ; $5052: $ff
	add  sp, $0d                                     ; $5053: $e8 $0d
	jp   $ff11                                       ; $5055: $c3 $11 $ff


	rst  $38                                         ; $5058: $ff
	rst  $38                                         ; $5059: $ff
	rst  $38                                         ; $505a: $ff
	reti                                             ; $505b: $d9


	dec  c                                           ; $505c: $0d
	jp   nz, $ff14                                   ; $505d: $c2 $14 $ff

	rst  $38                                         ; $5060: $ff
	rst  $38                                         ; $5061: $ff
	rst  $38                                         ; $5062: $ff
	ld   l, a                                        ; $5063: $6f
	dec  c                                           ; $5064: $0d
	add  hl, bc                                      ; $5065: $09
	ld   c, $00                                      ; $5066: $0e $00
	rst  $38                                         ; $5068: $ff
	nop                                              ; $5069: $00
	rst  $38                                         ; $506a: $ff
	reti                                             ; $506b: $d9


	dec  c                                           ; $506c: $0d
	inc  h                                           ; $506d: $24
	ld   c, $ff                                      ; $506e: $0e $ff
	rst  $38                                         ; $5070: $ff
	push hl                                          ; $5071: $e5
	rst  $38                                         ; $5072: $ff
	reti                                             ; $5073: $d9


	dec  c                                           ; $5074: $0d
	inc  l                                           ; $5075: $2c
	ld   c, $ff                                      ; $5076: $0e $ff
	rst  $38                                         ; $5078: $ff
	rst  $38                                         ; $5079: $ff
	rst  $38                                         ; $507a: $ff
	ld   d, h                                        ; $507b: $54
	dec  c                                           ; $507c: $0d
	ccf                                              ; $507d: $3f
	ld   c, $ff                                      ; $507e: $0e $ff
	rst  $38                                         ; $5080: $ff
	rst  $38                                         ; $5081: $ff
	rst  $38                                         ; $5082: $ff
	sub  b                                           ; $5083: $90
	dec  c                                           ; $5084: $0d
	or   (hl)                                        ; $5085: $b6
	ld   c, $ff                                      ; $5086: $0e $ff
	rst  $38                                         ; $5088: $ff
	rst  $38                                         ; $5089: $ff
	rst  $38                                         ; $508a: $ff
	sbc  h                                           ; $508b: $9c
	dec  c                                           ; $508c: $0d
	inc  sp                                          ; $508d: $33
	.db  $10                                         ; $508e: $10
	rst  $38                                         ; $508f: $ff
	rst  $38                                         ; $5090: $ff
	rst  $38                                         ; $5091: $ff
	rst  $38                                         ; $5092: $ff
	sbc  h                                           ; $5093: $9c
	dec  c                                           ; $5094: $0d
	ld   d, d                                        ; $5095: $52
	.db  $10                                         ; $5096: $10
	rst  $38                                         ; $5097: $ff
	rst  $38                                         ; $5098: $ff
	rst  $38                                         ; $5099: $ff
	rst  $38                                         ; $509a: $ff
	ld   c, e                                        ; $509b: $4b
	dec  c                                           ; $509c: $0d
	add  hl, sp                                      ; $509d: $39
	rrca                                             ; $509e: $0f
	rst  $38                                         ; $509f: $ff
	rst  $38                                         ; $50a0: $ff
	nop                                              ; $50a1: $00
	rst  $38                                         ; $50a2: $ff
	rst  $10                                         ; $50a3: $d7
	dec  c                                           ; $50a4: $0d
	nop                                              ; $50a5: $00
	rrca                                             ; $50a6: $0f
	rst  $38                                         ; $50a7: $ff
	rst  $38                                         ; $50a8: $ff
	.db  $ec                                         ; $50a9: $ec
	rst  $38                                         ; $50aa: $ff
	add  sp, $0d                                     ; $50ab: $e8 $0d
	ld   sp, hl                                      ; $50ad: $f9
	ld   c, $ff                                      ; $50ae: $0e $ff
	rst  $38                                         ; $50b0: $ff
	rst  $38                                         ; $50b1: $ff
	rst  $38                                         ; $50b2: $ff
	sub  d                                           ; $50b3: $92
	dec  c                                           ; $50b4: $0d
	call c, $ff10                                    ; $50b5: $dc $10 $ff
	rst  $38                                         ; $50b8: $ff
	rst  $38                                         ; $50b9: $ff
	rst  $38                                         ; $50ba: $ff
	sbc  c                                           ; $50bb: $99
	dec  c                                           ; $50bc: $0d
	jr   z, $11                                      ; $50bd: $28 $11

	rst  $38                                         ; $50bf: $ff
	rst  $38                                         ; $50c0: $ff
	rst  $38                                         ; $50c1: $ff
	rst  $38                                         ; $50c2: $ff
	sub  h                                           ; $50c3: $94
	dec  c                                           ; $50c4: $0d
	ld   (hl), $11                                   ; $50c5: $36 $11
	rst  $38                                         ; $50c7: $ff
	rst  $38                                         ; $50c8: $ff
	di                                               ; $50c9: $f3
	rst  $38                                         ; $50ca: $ff
	and  e                                           ; $50cb: $a3
	dec  c                                           ; $50cc: $0d
	ld   l, a                                        ; $50cd: $6f
	ld   de, $ffff                                   ; $50ce: $11 $ff $ff
	rst  $38                                         ; $50d1: $ff
	rst  $38                                         ; $50d2: $ff
	or   h                                           ; $50d3: $b4
	dec  c                                           ; $50d4: $0d
	ld   (hl), c                                     ; $50d5: $71
	.db  $10                                         ; $50d6: $10
	rst  $38                                         ; $50d7: $ff
	rst  $38                                         ; $50d8: $ff
	rst  $38                                         ; $50d9: $ff
	rst  $38                                         ; $50da: $ff
	cp   d                                           ; $50db: $ba
	dec  c                                           ; $50dc: $0d
	cp   b                                           ; $50dd: $b8
	.db  $10                                         ; $50de: $10
	rst  $38                                         ; $50df: $ff
	rst  $38                                         ; $50e0: $ff
	.db  $f4                                         ; $50e1: $f4
	rst  $38                                         ; $50e2: $ff
	sub  h                                           ; $50e3: $94
	dec  c                                           ; $50e4: $0d
	ld   (hl), $11                                   ; $50e5: $36 $11
	rst  $38                                         ; $50e7: $ff
	rst  $38                                         ; $50e8: $ff
	.db  $ec                                         ; $50e9: $ec
	rst  $38                                         ; $50ea: $ff
	add  sp, $0d                                     ; $50eb: $e8 $0d
	add  $11                                         ; $50ed: $c6 $11
	rst  $38                                         ; $50ef: $ff
	rst  $38                                         ; $50f0: $ff
	rst  $38                                         ; $50f1: $ff
	rst  $38                                         ; $50f2: $ff
	.db  $ed                                         ; $50f3: $ed
	dec  c                                           ; $50f4: $0d
	ld   l, d                                        ; $50f5: $6a
	dec  d                                           ; $50f6: $15
	rst  $38                                         ; $50f7: $ff
	rst  $38                                         ; $50f8: $ff
	rst  $38                                         ; $50f9: $ff
	rst  $38                                         ; $50fa: $ff

	ld   bc, $1214                                   ; $50fb: $01 $14 $12

	m_LayoutData lyt_03_10fe

	ld   bc, $1214                                   ; $5266: $01 $14 $12

	m_LayoutData lyt_mapScreen

	ld   bc, $1214                                   ; $53d1: $01 $14 $12

	m_LayoutData lyt_enterPasswordScreen

	ld   bc, $1214                                   ; $553c: $01 $14 $12

	m_LayoutData lyt_03_153f

	ld   bc, $1214                                   ; $56a7: $01 $14 $12

	m_LayoutData lyt_inventoryScreen

	ld   bc, $1214                                   ; $5812: $01 $14 $12

	m_LayoutData lyt_03_1815

	ld   bc, $1214                                   ; $597d: $01 $14 $12

	m_LayoutData lyt_introTradeMarkScreen


;;
	ld   de, $0000                                   ; $5ae8: $11 $00 $00
	ld   bc, $0000                                   ; $5aeb: $01 $00 $00

jr_006_5aee:
	ld   hl, $c0a0                                   ; $5aee: $21 $a0 $c0
	ld   a, (hl)                                     ; $5af1: $7e
	cp   $00                                         ; $5af2: $fe $00
	jr   z, jr_006_5b0d                              ; $5af4: $28 $17

	ld   hl, $c0a3                                   ; $5af6: $21 $a3 $c0
	ld   (hl), a                                     ; $5af9: $77

jr_006_5afa:
	call $1b6e                                       ; $5afa: $cd $6e $1b
	cp   $ff                                         ; $5afd: $fe $ff
	jr   z, jr_006_5b15                              ; $5aff: $28 $14

	ld   hl, $0142                                   ; $5b01: $21 $42 $01
	add  hl, bc                                      ; $5b04: $09
	ld   (hl), a                                     ; $5b05: $77
	inc  bc                                          ; $5b06: $03
	ld   hl, $c0a3                                   ; $5b07: $21 $a3 $c0
	dec  (hl)                                        ; $5b0a: $35
	jr   nz, jr_006_5afa                             ; $5b0b: $20 $ed

jr_006_5b0d:
	ld   a, $00                                      ; $5b0d: $3e $00
	ld   hl, $c0a0                                   ; $5b0f: $21 $a0 $c0
	ld   (hl), $00                                   ; $5b12: $36 $00
	ret                                              ; $5b14: $c9


jr_006_5b15:
	ld   hl, $c0a3                                   ; $5b15: $21 $a3 $c0
	ld   a, (hl)                                     ; $5b18: $7e
	ld   hl, $c0a0                                   ; $5b19: $21 $a0 $c0
	ld   (hl), a                                     ; $5b1c: $77
	call $1b6e                                       ; $5b1d: $cd $6e $1b
	ld   hl, $c0a2                                   ; $5b20: $21 $a2 $c0
	ld   (hl), a                                     ; $5b23: $77
	ld   hl, $c0a0                                   ; $5b24: $21 $a0 $c0
	cp   (hl)                                        ; $5b27: $be
	jr   c, jr_006_5b2e                              ; $5b28: $38 $04

	ld   hl, $c0a0                                   ; $5b2a: $21 $a0 $c0
	ld   a, (hl)                                     ; $5b2d: $7e

jr_006_5b2e:
	ld   hl, $c0a3                                   ; $5b2e: $21 $a3 $c0
	ld   (hl), a                                     ; $5b31: $77
	ld   hl, $c0a2                                   ; $5b32: $21 $a2 $c0
	ld   a, (hl)                                     ; $5b35: $7e
	ld   hl, $c0a3                                   ; $5b36: $21 $a3 $c0
	sub  (hl)                                        ; $5b39: $96
	ld   hl, $c0a1                                   ; $5b3a: $21 $a1 $c0
	ld   (hl), a                                     ; $5b3d: $77
	ld   hl, $c0a0                                   ; $5b3e: $21 $a0 $c0
	ld   a, (hl)                                     ; $5b41: $7e
	ld   hl, $c0a3                                   ; $5b42: $21 $a3 $c0
	sub  (hl)                                        ; $5b45: $96
	ld   hl, $c0a0                                   ; $5b46: $21 $a0 $c0
	ld   (hl), a                                     ; $5b49: $77
	call $1b6e                                       ; $5b4a: $cd $6e $1b

jr_006_5b4d:
	ld   hl, $0142                                   ; $5b4d: $21 $42 $01
	add  hl, bc                                      ; $5b50: $09
	ld   (hl), a                                     ; $5b51: $77
	inc  bc                                          ; $5b52: $03
	ld   hl, $c0a3                                   ; $5b53: $21 $a3 $c0
	dec  (hl)                                        ; $5b56: $35
	jr   nz, jr_006_5b4d                             ; $5b57: $20 $f4

	ld   hl, $c0a3                                   ; $5b59: $21 $a3 $c0
	ld   (hl), a                                     ; $5b5c: $77
	ld   hl, $c0a0                                   ; $5b5d: $21 $a0 $c0
	ld   a, (hl)                                     ; $5b60: $7e
	cp   $00                                         ; $5b61: $fe $00
	jr   nz, jr_006_5aee                             ; $5b63: $20 $89

	ld   hl, $c0a1                                   ; $5b65: $21 $a1 $c0
	ld   a, (hl)                                     ; $5b68: $7e
	ld   hl, $c0a0                                   ; $5b69: $21 $a0 $c0
	ld   (hl), a                                     ; $5b6c: $77
	ret                                              ; $5b6d: $c9


	ld   hl, $c09a                                   ; $5b6e: $21 $9a $c0
	ldi  a, (hl)                                     ; $5b71: $2a
	ld   h, (hl)                                     ; $5b72: $66
	ld   l, a                                        ; $5b73: $6f
	add  hl, de                                      ; $5b74: $19
	ld   a, (hl)                                     ; $5b75: $7e
	ld   hl, $c09a                                   ; $5b76: $21 $9a $c0
	inc  (hl)                                        ; $5b79: $34
	jr   nz, jr_006_5b80                             ; $5b7a: $20 $04

	ld   hl, $c09b                                   ; $5b7c: $21 $9b $c0
	inc  (hl)                                        ; $5b7f: $34

jr_006_5b80:
	ret                                              ; $5b80: $c9


.include "data/b3_roomStructsAndLayouts.s"


	ld   (de), a                                     ; $4cf2: $12
	add  h                                           ; $4cf3: $84
	jr   nz, jr_007_4cf6                             ; $4cf4: $20 $00

jr_007_4cf6:
	nop                                              ; $4cf6: $00
	ld   a, b                                        ; $4cf7: $78
	sub  b                                           ; $4cf8: $90
	inc  de                                          ; $4cf9: $13
	add  h                                           ; $4cfa: $84
	ld   hl, $0000                                   ; $4cfb: $21 $00 $00
	.db $20 $90

	inc  d                                           ; $4d00: $14
	add  h                                           ; $4d01: $84
	ldi  (hl), a                                     ; $4d02: $22
	nop                                              ; $4d03: $00
	nop                                              ; $4d04: $00
	.db  $10                                         ; $4d05: $10
	sub  b                                           ; $4d06: $90
	dec  d                                           ; $4d07: $15
	add  h                                           ; $4d08: $84
	inc  hl                                          ; $4d09: $23

jr_007_4d0a:
	nop                                              ; $4d0a: $00
	nop                                              ; $4d0b: $00
	ldh  (<$50), a                                   ; $4d0c: $e0 $50
	ld   d, $84                                      ; $4d0e: $16 $84
	inc  h                                           ; $4d10: $24
	nop                                              ; $4d11: $00
	nop                                              ; $4d12: $00
	.db $20 $90

	rla                                              ; $4d15: $17
	add  h                                           ; $4d16: $84
	dec  h                                           ; $4d17: $25
	nop                                              ; $4d18: $00
	nop                                              ; $4d19: $00
	ld   (hl), b                                     ; $4d1a: $70
	sub  b                                           ; $4d1b: $90
	.db $18 $84

	ld   e, $01                                      ; $4d1e: $1e $01
	ld   bc, $5060                                   ; $4d20: $01 $60 $50
	add  hl, de                                      ; $4d23: $19
	add  h                                           ; $4d24: $84
	.db  $10                                         ; $4d25: $10
	inc  bc                                          ; $4d26: $03
	inc  b                                           ; $4d27: $04
	ld   c, b                                        ; $4d28: $48
	sub  h                                           ; $4d29: $94
	rst  $38                                         ; $4d2a: $ff
	cp   c                                           ; $4d2b: $b9
	add  b                                           ; $4d2c: $80
	ldi  (hl), a                                     ; $4d2d: $22
	cp   d                                           ; $4d2e: $ba
	add  b                                           ; $4d2f: $80
	inc  hl                                          ; $4d30: $23
	cp   e                                           ; $4d31: $bb
	add  b                                           ; $4d32: $80
	inc  h                                           ; $4d33: $24
	cp   h                                           ; $4d34: $bc
	add  b                                           ; $4d35: $80
	dec  h                                           ; $4d36: $25
	cp   l                                           ; $4d37: $bd
	add  b                                           ; $4d38: $80
	ld   h, $be                                      ; $4d39: $26 $be
	add  b                                           ; $4d3b: $80
	daa                                              ; $4d3c: $27
	rst  $38                                         ; $4d3d: $ff
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
	ldh  a, (<$f0)                                   ; $4d80: $f0 $f0
	ldh  a, (<$f0)                                   ; $4d82: $f0 $f0
	ret  c                                           ; $4d84: $d8

	ld   bc, $ece8                                   ; $4d85: $01 $e8 $ec
	add  sp, -$18                                    ; $4d88: $e8 $e8
	.db  $ec                                         ; $4d8a: $ec
	add  sp, -$18                                    ; $4d8b: $e8 $e8
	.db  $ec                                         ; $4d8d: $ec
	add  sp, -$43                                    ; $4d8e: $e8 $bd
	cp   l                                           ; $4d90: $bd
	ld   a, l                                        ; $4d91: $7d
	ld   a, l                                        ; $4d92: $7d
	ld   bc, $e0e0                                   ; $4d93: $01 $e0 $e0
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
	ld   bc, $8500                                   ; $4e64: $01 $00 $85
	sub  h                                           ; $4e67: $94
	ld   l, c                                        ; $4e68: $69
	add  (hl)                                        ; $4e69: $86
	ld   a, a                                        ; $4e6a: $7f
	ld   c, (hl)                                     ; $4e6b: $4e
	add  $19                                         ; $4e6c: $c6 $19
	ld   (hl), e                                     ; $4e6e: $73
	ld   c, (hl)                                     ; $4e6f: $4e
	add  c                                           ; $4e70: $81
	sbc  $4f                                         ; $4e71: $de $4f
	add  l                                           ; $4e73: $85
	ld   d, (hl)                                     ; $4e74: $56
	ld   d, d                                        ; $4e75: $52
	sub  c                                           ; $4e76: $91
	inc  bc                                          ; $4e77: $03
	rst  $38                                         ; $4e78: $ff
	ld   d, d                                        ; $4e79: $52
	nop                                              ; $4e7a: $00
	add  (hl)                                        ; $4e7b: $86
	add  a                                           ; $4e7c: $87
	ld   c, (hl)                                     ; $4e7d: $4e
	nop                                              ; $4e7e: $00
	inc  e                                           ; $4e7f: $1c
	nop                                              ; $4e80: $00
	nop                                              ; $4e81: $00
	sbc  c                                           ; $4e82: $99
	ld   c, (hl)                                     ; $4e83: $4e
	rst  $38                                         ; $4e84: $ff
	rst  $38                                         ; $4e85: $ff
	rst  $38                                         ; $4e86: $ff
	inc  e                                           ; $4e87: $1c
	ld   (bc), a                                     ; $4e88: $02
	nop                                              ; $4e89: $00
	and  h                                           ; $4e8a: $a4
	ld   c, (hl)                                     ; $4e8b: $4e
	inc  e                                           ; $4e8c: $1c
	ld   (bc), a                                     ; $4e8d: $02
	rlca                                             ; $4e8e: $07
	xor  d                                           ; $4e8f: $aa
	ld   c, (hl)                                     ; $4e90: $4e
	inc  e                                           ; $4e91: $1c
	ld   (bc), a                                     ; $4e92: $02
	inc  bc                                          ; $4e93: $03
	or   d                                           ; $4e94: $b2
	ld   c, (hl)                                     ; $4e95: $4e
	rst  $38                                         ; $4e96: $ff
	rst  $38                                         ; $4e97: $ff
	rst  $38                                         ; $4e98: $ff
	ld   d, d                                        ; $4e99: $52
	nop                                              ; $4e9a: $00
	ld   d, b                                        ; $4e9b: $50
	nop                                              ; $4e9c: $00
	sub  c                                           ; $4e9d: $91
	inc  bc                                          ; $4e9e: $03
	rst  $38                                         ; $4e9f: $ff
	add  l                                           ; $4ea0: $85
	ret  z                                           ; $4ea1: $c8

	ld   l, c                                        ; $4ea2: $69
	nop                                              ; $4ea3: $00
	ld   d, b                                        ; $4ea4: $50
	ld   bc, $c085                                   ; $4ea5: $01 $85 $c0
	ld   l, c                                        ; $4ea8: $69
	nop                                              ; $4ea9: $00
	ld   d, b                                        ; $4eaa: $50
	ld   (bc), a                                     ; $4eab: $02
	ld   b, l                                        ; $4eac: $45
	ld   ($c485), sp                                 ; $4ead: $08 $85 $c4
	ld   l, c                                        ; $4eb0: $69
	nop                                              ; $4eb1: $00
	ld   d, b                                        ; $4eb2: $50
	inc  bc                                          ; $4eb3: $03
	add  l                                           ; $4eb4: $85
	.db  $dd                                         ; $4eb5: $dd
	ld   l, c                                        ; $4eb6: $69
	add  l                                           ; $4eb7: $85
	call z, $0069                                    ; $4eb8: $cc $69 $00
	add  l                                           ; $4ebb: $85
	sub  h                                           ; $4ebc: $94
	ld   l, c                                        ; $4ebd: $69
	add  $3c                                         ; $4ebe: $c6 $3c
	push bc                                          ; $4ec0: $c5
	ld   c, (hl)                                     ; $4ec1: $4e
	add  c                                           ; $4ec2: $81
	sbc  $4f                                         ; $4ec3: $de $4f
	ld   d, d                                        ; $4ec5: $52
	ld   bc, $6285                                   ; $4ec6: $01 $85 $62
	ld   d, d                                        ; $4ec9: $52
	sub  c                                           ; $4eca: $91
	inc  bc                                          ; $4ecb: $03
	rst  $38                                         ; $4ecc: $ff
	add  (hl)                                        ; $4ecd: $86
	pop  de                                          ; $4ece: $d1
	ld   c, (hl)                                     ; $4ecf: $4e
	nop                                              ; $4ed0: $00
	dec  de                                          ; $4ed1: $1b
	ld   (bc), a                                     ; $4ed2: $02
	ld   bc, $4ee5                                   ; $4ed3: $01 $e5 $4e
	inc  e                                           ; $4ed6: $1c
	ld   (bc), a                                     ; $4ed7: $02
	ld   (bc), a                                     ; $4ed8: $02
	.db  $eb                                         ; $4ed9: $eb
	ld   c, (hl)                                     ; $4eda: $4e
	dec  de                                          ; $4edb: $1b
	ld   (bc), a                                     ; $4edc: $02
	ld   (bc), a                                     ; $4edd: $02
	di                                               ; $4ede: $f3
	ld   c, (hl)                                     ; $4edf: $4e
	inc  e                                           ; $4ee0: $1c
	ld   bc, $fb04                                   ; $4ee1: $01 $04 $fb
	ld   c, (hl)                                     ; $4ee4: $4e
	ld   d, b                                        ; $4ee5: $50
	inc  b                                           ; $4ee6: $04
	add  l                                           ; $4ee7: $85
	call nz, $0069                                   ; $4ee8: $c4 $69 $00
	ld   d, b                                        ; $4eeb: $50
	dec  b                                           ; $4eec: $05
	ld   b, l                                        ; $4eed: $45
	ld   ($cc85), sp                                 ; $4eee: $08 $85 $cc
	ld   l, c                                        ; $4ef1: $69
	nop                                              ; $4ef2: $00
	ld   d, b                                        ; $4ef3: $50
	ld   b, $45                                      ; $4ef4: $06 $45
	inc  c                                           ; $4ef6: $0c
	add  l                                           ; $4ef7: $85
	ret  z                                           ; $4ef8: $c8

	ld   l, c                                        ; $4ef9: $69
	nop                                              ; $4efa: $00
	ld   d, b                                        ; $4efb: $50
	rlca                                             ; $4efc: $07
	ld   b, l                                        ; $4efd: $45
	.db  $10                                         ; $4efe: $10
	add  l                                           ; $4eff: $85
	ret  nz                                          ; $4f00: $c0

	ld   l, c                                        ; $4f01: $69
	nop                                              ; $4f02: $00
	add  l                                           ; $4f03: $85
	sub  h                                           ; $4f04: $94
	ld   l, c                                        ; $4f05: $69
	add  $28                                         ; $4f06: $c6 $28
	dec  c                                           ; $4f08: $0d
	ld   c, a                                        ; $4f09: $4f
	add  c                                           ; $4f0a: $81
	sbc  $4f                                         ; $4f0b: $de $4f
	ld   d, d                                        ; $4f0d: $52
	ld   (bc), a                                     ; $4f0e: $02
	add  l                                           ; $4f0f: $85
	ld   e, d                                        ; $4f10: $5a
	ld   d, d                                        ; $4f11: $52
	sub  c                                           ; $4f12: $91
	inc  bc                                          ; $4f13: $03
	rst  $38                                         ; $4f14: $ff
	add  (hl)                                        ; $4f15: $86
	add  hl, de                                      ; $4f16: $19
	ld   c, a                                        ; $4f17: $4f
	nop                                              ; $4f18: $00
	inc  e                                           ; $4f19: $1c
	ld   bc, $3000                                   ; $4f1a: $01 $00 $30
	ld   c, a                                        ; $4f1d: $4f
	inc  e                                           ; $4f1e: $1c
	ld   (bc), a                                     ; $4f1f: $02
	ld   bc, $4f36                                   ; $4f20: $01 $36 $4f
	ld   e, $00                                      ; $4f23: $1e $00
	nop                                              ; $4f25: $00
	ld   a, $4f                                      ; $4f26: $3e $4f
	inc  e                                           ; $4f28: $1c
	nop                                              ; $4f29: $00
	inc  b                                           ; $4f2a: $04
	ld   b, a                                        ; $4f2b: $47
	ld   c, a                                        ; $4f2c: $4f
	rst  $38                                         ; $4f2d: $ff
	rst  $38                                         ; $4f2e: $ff
	rst  $38                                         ; $4f2f: $ff
	ld   d, b                                        ; $4f30: $50
	ld   ($c085), sp                                 ; $4f31: $08 $85 $c0
	ld   l, c                                        ; $4f34: $69
	nop                                              ; $4f35: $00
	ld   d, b                                        ; $4f36: $50
	add  hl, bc                                      ; $4f37: $09
	ld   b, l                                        ; $4f38: $45
	ld   ($c485), sp                                 ; $4f39: $08 $85 $c4
	ld   l, c                                        ; $4f3c: $69
	nop                                              ; $4f3d: $00
	ld   d, b                                        ; $4f3e: $50
	ld   a, (bc)                                     ; $4f3f: $0a
	add  l                                           ; $4f40: $85
	.db  $dd                                         ; $4f41: $dd
	ld   l, c                                        ; $4f42: $69
	add  l                                           ; $4f43: $85
	call z, $0069                                    ; $4f44: $cc $69 $00
	ld   d, b                                        ; $4f47: $50
	dec  bc                                          ; $4f48: $0b
	add  l                                           ; $4f49: $85
	push de                                          ; $4f4a: $d5
	ld   l, c                                        ; $4f4b: $69
	add  l                                           ; $4f4c: $85
	call z, $0069                                    ; $4f4d: $cc $69 $00
	add  l                                           ; $4f50: $85
	sub  h                                           ; $4f51: $94
	ld   l, c                                        ; $4f52: $69
	add  $4b                                         ; $4f53: $c6 $4b
	ld   e, d                                        ; $4f55: $5a
	ld   c, a                                        ; $4f56: $4f
	add  c                                           ; $4f57: $81
	sbc  $4f                                         ; $4f58: $de $4f
	ld   d, d                                        ; $4f5a: $52
	inc  bc                                          ; $4f5b: $03
	add  l                                           ; $4f5c: $85
	ld   h, (hl)                                     ; $4f5d: $66
	ld   d, d                                        ; $4f5e: $52
	sub  c                                           ; $4f5f: $91
	inc  bc                                          ; $4f60: $03
	rst  $38                                         ; $4f61: $ff
	add  (hl)                                        ; $4f62: $86
	ld   h, (hl)                                     ; $4f63: $66
	ld   c, a                                        ; $4f64: $4f
	nop                                              ; $4f65: $00
	inc  e                                           ; $4f66: $1c
	ld   bc, $7d02                                   ; $4f67: $01 $02 $7d
	ld   c, a                                        ; $4f6a: $4f
	inc  e                                           ; $4f6b: $1c
	nop                                              ; $4f6c: $00
	inc  bc                                          ; $4f6d: $03
	add  e                                           ; $4f6e: $83
	ld   c, a                                        ; $4f6f: $4f
	inc  e                                           ; $4f70: $1c
	nop                                              ; $4f71: $00
	ld   ($4f8b), sp                                 ; $4f72: $08 $8b $4f
	inc  e                                           ; $4f75: $1c
	ld   bc, $9406                                   ; $4f76: $01 $06 $94
	ld   c, a                                        ; $4f79: $4f
	rst  $38                                         ; $4f7a: $ff
	rst  $38                                         ; $4f7b: $ff
	rst  $38                                         ; $4f7c: $ff
	ld   d, b                                        ; $4f7d: $50
	inc  c                                           ; $4f7e: $0c
	add  l                                           ; $4f7f: $85
	cp   (hl)                                        ; $4f80: $be
	ld   l, c                                        ; $4f81: $69
	nop                                              ; $4f82: $00
	ld   d, b                                        ; $4f83: $50
	dec  c                                           ; $4f84: $0d
	ld   b, l                                        ; $4f85: $45
	ld   ($c085), sp                                 ; $4f86: $08 $85 $c0
	ld   l, c                                        ; $4f89: $69
	nop                                              ; $4f8a: $00
	ld   d, b                                        ; $4f8b: $50
	ld   c, $85                                      ; $4f8c: $0e $85
	.db  $dd                                         ; $4f8e: $dd
	ld   l, c                                        ; $4f8f: $69
	add  l                                           ; $4f90: $85
	call nz, $0069                                   ; $4f91: $c4 $69 $00
	ld   d, b                                        ; $4f94: $50
	rrca                                             ; $4f95: $0f
	add  l                                           ; $4f96: $85
	push de                                          ; $4f97: $d5
	ld   l, c                                        ; $4f98: $69
	add  l                                           ; $4f99: $85
	call z, $0069                                    ; $4f9a: $cc $69 $00
	add  l                                           ; $4f9d: $85
	sub  h                                           ; $4f9e: $94
	ld   l, c                                        ; $4f9f: $69
	add  $5a                                         ; $4fa0: $c6 $5a
	and  a                                           ; $4fa2: $a7
	ld   c, a                                        ; $4fa3: $4f
	add  c                                           ; $4fa4: $81
	sbc  $4f                                         ; $4fa5: $de $4f
	ld   d, d                                        ; $4fa7: $52
	inc  b                                           ; $4fa8: $04
	add  l                                           ; $4fa9: $85
	ld   l, d                                        ; $4faa: $6a
	ld   d, d                                        ; $4fab: $52
	sub  c                                           ; $4fac: $91
	inc  bc                                          ; $4fad: $03
	rst  $38                                         ; $4fae: $ff
	add  (hl)                                        ; $4faf: $86
	or   e                                           ; $4fb0: $b3
	ld   c, a                                        ; $4fb1: $4f
	nop                                              ; $4fb2: $00
	inc  e                                           ; $4fb3: $1c
	ld   (bc), a                                     ; $4fb4: $02
	inc  b                                           ; $4fb5: $04
	jp   z, $1c4f                                    ; $4fb6: $ca $4f $1c

	ld   bc, $cf03                                   ; $4fb9: $01 $03 $cf
	ld   c, a                                        ; $4fbc: $4f
	dec  de                                          ; $4fbd: $1b
	ld   bc, $d400                                   ; $4fbe: $01 $00 $d4
	ld   c, a                                        ; $4fc1: $4f
	inc  e                                           ; $4fc2: $1c
	nop                                              ; $4fc3: $00
	ld   b, $d9                                      ; $4fc4: $06 $d9
	ld   c, a                                        ; $4fc6: $4f
	rst  $38                                         ; $4fc7: $ff
	rst  $38                                         ; $4fc8: $ff
	rst  $38                                         ; $4fc9: $ff
	ld   d, b                                        ; $4fca: $50
	.db  $10                                         ; $4fcb: $10
	ld   b, l                                        ; $4fcc: $45
	ld   ($5000), sp                                 ; $4fcd: $08 $00 $50
	ld   de, $0c45                                   ; $4fd0: $11 $45 $0c
	nop                                              ; $4fd3: $00
	ld   d, b                                        ; $4fd4: $50
	ld   (de), a                                     ; $4fd5: $12
	ld   b, l                                        ; $4fd6: $45
	.db  $10                                         ; $4fd7: $10
	nop                                              ; $4fd8: $00
	ld   d, b                                        ; $4fd9: $50
	inc  de                                          ; $4fda: $13
	ld   b, l                                        ; $4fdb: $45
	jr   jr_007_4fde                                 ; $4fdc: $18 $00

jr_007_4fde:
	add  a                                           ; $4fde: $87
	ld   ($854f), a                                  ; $4fdf: $ea $4f $85
	sbc  a                                           ; $4fe2: $9f
	ld   l, c                                        ; $4fe3: $69
	add  l                                           ; $4fe4: $85
	sub  (hl)                                        ; $4fe5: $96
	ld   l, c                                        ; $4fe6: $69
	add  c                                           ; $4fe7: $81
	sbc  $4f                                         ; $4fe8: $de $4f
	inc  b                                           ; $4fea: $04
	ld   (bc), a                                     ; $4feb: $02
	ld   e, c                                        ; $4fec: $59
	ld   l, a                                        ; $4fed: $6f
	ld   (hl), l                                     ; $4fee: $75
	ld   (hl), d                                     ; $4fef: $72
	jr   nz, jr_007_5058                             ; $4ff0: $20 $66

	ld   h, c                                        ; $4ff2: $61
	ld   l, c                                        ; $4ff3: $69
	ld   (hl), h                                     ; $4ff4: $74
	ld   l, b                                        ; $4ff5: $68
	ld   bc, $6f6c                                   ; $4ff6: $01 $6c $6f
	ld   l, a                                        ; $4ff9: $6f
	ld   l, e                                        ; $4ffa: $6b
	ld   (hl), e                                     ; $4ffb: $73
	jr   nz, jr_007_5075                             ; $4ffc: $20 $77

	ld   h, l                                        ; $4ffe: $65
	ld   h, c                                        ; $4fff: $61
	ld   l, e                                        ; $5000: $6b
	ld   l, $01                                      ; $5001: $2e $01
	ld   e, c                                        ; $5003: $59
	ld   l, a                                        ; $5004: $6f
	ld   (hl), l                                     ; $5005: $75
	daa                                              ; $5006: $27
	ld   l, h                                        ; $5007: $6c
	ld   l, h                                        ; $5008: $6c
	jr   nz, jr_007_5079                             ; $5009: $20 $6e

	ld   h, l                                        ; $500b: $65
	ld   h, l                                        ; $500c: $65
	ld   h, h                                        ; $500d: $64
	ld   bc, $6f6d                                   ; $500e: $01 $6d $6f
	ld   (hl), d                                     ; $5011: $72
	ld   h, l                                        ; $5012: $65
	jr   nz, jr_007_5088                             ; $5013: $20 $73

	ld   (hl), b                                     ; $5015: $70
	ld   l, c                                        ; $5016: $69
	ld   (hl), d                                     ; $5017: $72
	ld   l, c                                        ; $5018: $69
	ld   (hl), h                                     ; $5019: $74
	ld   l, $ff                                      ; $501a: $2e $ff
	cp   $7f                                         ; $501c: $fe $7f
	inc  d                                           ; $501e: $14
	add  l                                           ; $501f: $85
	ld   a, e                                        ; $5020: $7b
	ld   l, c                                        ; $5021: $69
	add  d                                           ; $5022: $82
	cpl                                              ; $5023: $2f
	ld   d, b                                        ; $5024: $50
	adc  d                                           ; $5025: $8a
	cpl                                              ; $5026: $2f
	ld   d, b                                        ; $5027: $50
	ld   b, d                                        ; $5028: $42
	ld   bc, $b4c2                                   ; $5029: $01 $c2 $b4
	ldi  (hl), a                                     ; $502c: $22
	ld   d, b                                        ; $502d: $50
	nop                                              ; $502e: $00
	ld   c, (hl)                                     ; $502f: $4e
	ld   bc, $8589                                   ; $5030: $01 $89 $85
	ld   d, $05                                      ; $5033: $16 $05
	ld   b, c                                        ; $5035: $41
	inc  c                                           ; $5036: $0c
	ld   b, b                                        ; $5037: $40
	rst  $38                                         ; $5038: $ff
	nop                                              ; $5039: $00
	jr   z, $14                                      ; $503a: $28 $14

	add  l                                           ; $503c: $85
	ld   a, e                                        ; $503d: $7b
	ld   l, c                                        ; $503e: $69
	add  d                                           ; $503f: $82
	ld   c, h                                        ; $5040: $4c
	ld   d, b                                        ; $5041: $50
	adc  d                                           ; $5042: $8a
	ld   c, h                                        ; $5043: $4c
	ld   d, b                                        ; $5044: $50
	ld   b, d                                        ; $5045: $42
	ld   bc, $b4c2                                   ; $5046: $01 $c2 $b4
	ccf                                              ; $5049: $3f
	ld   d, b                                        ; $504a: $50
	nop                                              ; $504b: $00
	ld   c, (hl)                                     ; $504c: $4e
	dec  b                                           ; $504d: $05
	add  c                                           ; $504e: $81
	ld   sp, $8550                                   ; $504f: $31 $50 $85
	ld   a, e                                        ; $5052: $7b
	ld   l, c                                        ; $5053: $69
	add  d                                           ; $5054: $82
	ld   h, c                                        ; $5055: $61
	ld   d, b                                        ; $5056: $50
	adc  d                                           ; $5057: $8a

jr_007_5058:
	ld   h, c                                        ; $5058: $61
	ld   d, b                                        ; $5059: $50
	ld   b, d                                        ; $505a: $42
	ld   bc, $b4c2                                   ; $505b: $01 $c2 $b4
	ld   d, h                                        ; $505e: $54
	ld   d, b                                        ; $505f: $50
	nop                                              ; $5060: $00
	ld   c, (hl)                                     ; $5061: $4e
	ld   a, (bc)                                     ; $5062: $0a
	add  c                                           ; $5063: $81
	ld   sp, $1450                                   ; $5064: $31 $50 $14
	add  l                                           ; $5067: $85
	ld   a, e                                        ; $5068: $7b
	ld   l, c                                        ; $5069: $69
	add  d                                           ; $506a: $82
	ld   (hl), a                                     ; $506b: $77
	ld   d, b                                        ; $506c: $50
	adc  d                                           ; $506d: $8a
	ld   (hl), a                                     ; $506e: $77
	ld   d, b                                        ; $506f: $50
	ld   b, d                                        ; $5070: $42
	ld   bc, $b4c2                                   ; $5071: $01 $c2 $b4
	ld   l, d                                        ; $5074: $6a

jr_007_5075:
	ld   d, b                                        ; $5075: $50
	nop                                              ; $5076: $00
	ld   c, h                                        ; $5077: $4c
	ld   (bc), a                                     ; $5078: $02

jr_007_5079:
	add  c                                           ; $5079: $81
	ld   sp, $0950                                   ; $507a: $31 $50 $09
	daa                                              ; $507d: $27
	inc  c                                           ; $507e: $0c
	add  c                                           ; $507f: $81
	sbc  a                                           ; $5080: $9f
	ld   h, e                                        ; $5081: $63
	ld   d, h                                        ; $5082: $54
	rst  $38                                         ; $5083: $ff
	ld   c, h                                        ; $5084: $4c
	ld   bc, $6a89                                   ; $5085: $01 $89 $6a

jr_007_5088:
	ld   d, $42                                      ; $5088: $16 $42
	ld   (bc), a                                     ; $508a: $02
	adc  e                                           ; $508b: $8b
	sub  c                                           ; $508c: $91
	ld   d, b                                        ; $508d: $50
	add  c                                           ; $508e: $81
	add  d                                           ; $508f: $82
	ld   d, b                                        ; $5090: $50
	ld   d, h                                        ; $5091: $54
	nop                                              ; $5092: $00
	inc  h                                           ; $5093: $24
	add  l                                           ; $5094: $85
	sub  h                                           ; $5095: $94
	ld   l, c                                        ; $5096: $69
	add  (hl)                                        ; $5097: $86
	cp   b                                           ; $5098: $b8
	ld   d, b                                        ; $5099: $50
	ld   d, h                                        ; $509a: $54
	rst  $38                                         ; $509b: $ff
	add  l                                           ; $509c: $85
	ret  nz                                          ; $509d: $c0

	ld   d, b                                        ; $509e: $50
	add  l                                           ; $509f: $85
	add  d                                           ; $50a0: $82
	ld   d, b                                        ; $50a1: $50
	ld   c, b                                        ; $50a2: $48
	ld   bc, $2045                                   ; $50a3: $01 $45 $20
	ld   d, b                                        ; $50a6: $50
	inc  d                                           ; $50a7: $14
	ld   d, h                                        ; $50a8: $54
	nop                                              ; $50a9: $00
	nop                                              ; $50aa: $00
	add  $96                                         ; $50ab: $c6 $96
	or   d                                           ; $50ad: $b2
	ld   d, b                                        ; $50ae: $50
	add  c                                           ; $50af: $81
	sbc  $4f                                         ; $50b0: $de $4f
	ld   c, b                                        ; $50b2: $48
	ld   bc, $6e85                                   ; $50b3: $01 $85 $6e
	ld   d, d                                        ; $50b6: $52
	nop                                              ; $50b7: $00
	dec  de                                          ; $50b8: $1b
	nop                                              ; $50b9: $00
	ld   bc, $50ab                                   ; $50ba: $01 $ab $50
	rst  $38                                         ; $50bd: $ff
	rst  $38                                         ; $50be: $ff
	rst  $38                                         ; $50bf: $ff
	ld   d, h                                        ; $50c0: $54
	rst  $38                                         ; $50c1: $ff
	adc  c                                           ; $50c2: $89
	add  l                                           ; $50c3: $85
	ld   d, $42                                      ; $50c4: $16 $42
	ld   (bc), a                                     ; $50c6: $02
	jp   nz, $c21e                                   ; $50c7: $c2 $1e $c2

	ld   d, b                                        ; $50ca: $50
	ld   d, h                                        ; $50cb: $54
	ld   bc, $8524                                   ; $50cc: $01 $24 $85
	sub  h                                           ; $50cf: $94
	ld   l, c                                        ; $50d0: $69
	add  (hl)                                        ; $50d1: $86
	ld   a, ($ff00+c)                                ; $50d2: $f2
	ld   d, b                                        ; $50d3: $50
	ld   d, h                                        ; $50d4: $54
	rst  $38                                         ; $50d5: $ff
	add  l                                           ; $50d6: $85
	ret  nz                                          ; $50d7: $c0

	ld   d, b                                        ; $50d8: $50
	add  l                                           ; $50d9: $85
	add  d                                           ; $50da: $82
	ld   d, b                                        ; $50db: $50
	ld   c, b                                        ; $50dc: $48
	ld   (bc), a                                     ; $50dd: $02
	ld   b, l                                        ; $50de: $45
	jr   nz, jr_007_5131                             ; $50df: $20 $50

	dec  d                                           ; $50e1: $15
	ld   d, h                                        ; $50e2: $54
	nop                                              ; $50e3: $00
	nop                                              ; $50e4: $00
	add  $c8                                         ; $50e5: $c6 $c8
	.db  $ec                                         ; $50e7: $ec
	ld   d, b                                        ; $50e8: $50
	add  c                                           ; $50e9: $81
	sbc  $4f                                         ; $50ea: $de $4f
	ld   c, b                                        ; $50ec: $48
	ld   (bc), a                                     ; $50ed: $02
	add  l                                           ; $50ee: $85
	ld   a, d                                        ; $50ef: $7a
	ld   d, d                                        ; $50f0: $52
	nop                                              ; $50f1: $00
	dec  de                                          ; $50f2: $1b
	nop                                              ; $50f3: $00
	ld   bc, $50e5                                   ; $50f4: $01 $e5 $50
	rst  $38                                         ; $50f7: $ff
	rst  $38                                         ; $50f8: $ff

jr_007_50f9:
	rst  $38                                         ; $50f9: $ff
	add  l                                           ; $50fa: $85
	sub  h                                           ; $50fb: $94
	ld   l, c                                        ; $50fc: $69
	ld   d, h                                        ; $50fd: $54
	rst  $38                                         ; $50fe: $ff
	add  l                                           ; $50ff: $85
	ret  nz                                          ; $5100: $c0

	ld   d, b                                        ; $5101: $50
	add  l                                           ; $5102: $85
	add  d                                           ; $5103: $82
	ld   d, b                                        ; $5104: $50
	ld   c, b                                        ; $5105: $48
	inc  b                                           ; $5106: $04
	ld   b, l                                        ; $5107: $45
	jr   nz, jr_007_515e                             ; $5108: $20 $54

	nop                                              ; $510a: $00
	nop                                              ; $510b: $00
	add  l                                           ; $510c: $85
	sub  h                                           ; $510d: $94
	ld   l, c                                        ; $510e: $69
	ld   d, h                                        ; $510f: $54
	rst  $38                                         ; $5110: $ff
	add  l                                           ; $5111: $85
	ret  nz                                          ; $5112: $c0

	ld   d, b                                        ; $5113: $50
	add  l                                           ; $5114: $85
	add  d                                           ; $5115: $82
	ld   d, b                                        ; $5116: $50
	ld   c, b                                        ; $5117: $48
	.db  $10                                         ; $5118: $10
	ld   b, l                                        ; $5119: $45
	jr   nz, jr_007_5170                             ; $511a: $20 $54

	nop                                              ; $511c: $00
	nop                                              ; $511d: $00
	add  l                                           ; $511e: $85
	sub  h                                           ; $511f: $94
	ld   l, c                                        ; $5120: $69
	ld   d, h                                        ; $5121: $54
	rst  $38                                         ; $5122: $ff
	add  l                                           ; $5123: $85
	ret  nz                                          ; $5124: $c0

	ld   d, b                                        ; $5125: $50
	add  l                                           ; $5126: $85
	add  d                                           ; $5127: $82
	ld   d, b                                        ; $5128: $50
	ld   c, b                                        ; $5129: $48
	ld   ($2045), sp                                 ; $512a: $08 $45 $20
	ld   d, h                                        ; $512d: $54
	nop                                              ; $512e: $00
	nop                                              ; $512f: $00
	add  l                                           ; $5130: $85

jr_007_5131:
	sub  h                                           ; $5131: $94
	ld   l, c                                        ; $5132: $69
	ld   d, h                                        ; $5133: $54
	rst  $38                                         ; $5134: $ff
	add  l                                           ; $5135: $85
	ret  nz                                          ; $5136: $c0

	ld   d, b                                        ; $5137: $50
	add  l                                           ; $5138: $85
	add  d                                           ; $5139: $82
	ld   d, b                                        ; $513a: $50
	ld   c, b                                        ; $513b: $48
	jr   nz, jr_007_5183                             ; $513c: $20 $45

	jr   nz, $54                                     ; $513e: $20 $54

	nop                                              ; $5140: $00
	nop                                              ; $5141: $00
	add  l                                           ; $5142: $85
	sub  h                                           ; $5143: $94
	ld   l, c                                        ; $5144: $69
	add  $14                                         ; $5145: $c6 $14
	ld   c, h                                        ; $5147: $4c
	ld   d, c                                        ; $5148: $51
	add  c                                           ; $5149: $81
	sbc  $4f                                         ; $514a: $de $4f
	ld   d, e                                        ; $514c: $53
	rlca                                             ; $514d: $07
	add  l                                           ; $514e: $85
	ld   c, b                                        ; $514f: $48
	ld   d, d                                        ; $5150: $52
	nop                                              ; $5151: $00
	add  l                                           ; $5152: $85
	sub  h                                           ; $5153: $94
	ld   l, c                                        ; $5154: $69
	add  $4b                                         ; $5155: $c6 $4b
	ld   e, h                                        ; $5157: $5c
	ld   d, c                                        ; $5158: $51
	add  c                                           ; $5159: $81
	sbc  $4f                                         ; $515a: $de $4f
	dec  h                                           ; $515c: $25
	add  l                                           ; $515d: $85

jr_007_515e:
	ld   h, (hl)                                     ; $515e: $66
	ld   d, d                                        ; $515f: $52
	nop                                              ; $5160: $00
	push bc                                          ; $5161: $c5
	ld   (bc), a                                     ; $5162: $02
	sbc  d                                           ; $5163: $9a
	ld   d, d                                        ; $5164: $52
	add  l                                           ; $5165: $85
	sub  h                                           ; $5166: $94
	ld   l, c                                        ; $5167: $69
	add  $c3                                         ; $5168: $c6 $c3
	ld   l, a                                        ; $516a: $6f
	ld   d, c                                        ; $516b: $51
	add  c                                           ; $516c: $81
	sbc  $4f                                         ; $516d: $de $4f
	ld   c, d                                        ; $516f: $4a

jr_007_5170:
	ld   (bc), a                                     ; $5170: $02
	ld   b, l                                        ; $5171: $45
	jr   jr_007_50f9                                 ; $5172: $18 $85

	.db  $76                                         ; $5174: $76
	ld   d, d                                        ; $5175: $52
	nop                                              ; $5176: $00
	push bc                                          ; $5177: $c5
	inc  b                                           ; $5178: $04
	sub  d                                           ; $5179: $92
	ld   d, c                                        ; $517a: $51
	inc  d                                           ; $517b: $14
	rst  $00                                         ; $517c: $c7
	nop                                              ; $517d: $00
	add  b                                           ; $517e: $80
	add  b                                           ; $517f: $80
	add  l                                           ; $5180: $85
	add  (hl)                                        ; $5181: $86
	ld   l, c                                        ; $5182: $69

jr_007_5183:
	ld   c, d                                        ; $5183: $4a
	inc  b                                           ; $5184: $04
	add  l                                           ; $5185: $85
	push de                                          ; $5186: $d5
	ld   l, c                                        ; $5187: $69
	add  l                                           ; $5188: $85
	add  $69                                         ; $5189: $c6 $69
	adc  c                                           ; $518b: $89
	ld   l, d                                        ; $518c: $6a
	ld   d, $c7                                      ; $518d: $16 $c7
	scf                                              ; $518f: $37
	add  b                                           ; $5190: $80
	add  b                                           ; $5191: $80
	nop                                              ; $5192: $00
	jr   z, jr_007_51a5                              ; $5193: $28 $10

	rrca                                             ; $5195: $0f
	inc  c                                           ; $5196: $0c
	daa                                              ; $5197: $27
	ld   b, a                                        ; $5198: $47
	inc  bc                                          ; $5199: $03
	add  hl, bc                                      ; $519a: $09
	adc  c                                           ; $519b: $89
	ld   a, h                                        ; $519c: $7c
	ld   d, $45                                      ; $519d: $16 $45
	inc  b                                           ; $519f: $04
	ret  nz                                          ; $51a0: $c0

	add  h                                           ; $51a1: $84
	nop                                              ; $51a2: $00
	nop                                              ; $51a3: $00
	ld   b, d                                        ; $51a4: $42

jr_007_51a5:
	dec  b                                           ; $51a5: $05
	jp   $b1aa                                       ; $51a6: $c3 $aa $b1


	ld   d, c                                        ; $51a9: $51
	ret  nz                                          ; $51aa: $c0

	ld   bc, $0000                                   ; $51ab: $01 $00 $00
	ld   b, d                                        ; $51ae: $42
	add  hl, de                                      ; $51af: $19
	nop                                              ; $51b0: $00
	ld   b, d                                        ; $51b1: $42
	inc  hl                                          ; $51b2: $23
	jp   $b880                                       ; $51b3: $c3 $80 $b8


	ld   d, c                                        ; $51b6: $51
	nop                                              ; $51b7: $00
	jp   $be40                                       ; $51b8: $c3 $40 $be


	ld   d, c                                        ; $51bb: $51
	ld   b, e                                        ; $51bc: $43
	ld   d, $c3                                      ; $51bd: $16 $c3
	add  b                                           ; $51bf: $80
	.db $c4 $51 $43
	rla                                              ; $51c3: $17
	ld   b, e                                        ; $51c4: $43
	jr   jr_007_51d3                                 ; $51c5: $18 $0c

	adc  c                                           ; $51c7: $89
	ld   h, $16                                      ; $51c8: $26 $16
	ld   bc, $f086                                   ; $51ca: $01 $86 $f0
	ld   d, c                                        ; $51cd: $51
	ld   b, c                                        ; $51ce: $41
	ld   bc, $0144                                   ; $51cf: $01 $44 $01
	add  c                                           ; $51d2: $81

jr_007_51d3:
	.db  $e3                                         ; $51d3: $e3
	ld   d, c                                        ; $51d4: $51
	ld   b, c                                        ; $51d5: $41
	ld   (bc), a                                     ; $51d6: $02
	ld   b, h                                        ; $51d7: $44
	ld   (bc), a                                     ; $51d8: $02
	add  c                                           ; $51d9: $81
	.db  $e3                                         ; $51da: $e3
	ld   d, c                                        ; $51db: $51
	ld   b, c                                        ; $51dc: $41
	inc  bc                                          ; $51dd: $03
	ld   b, h                                        ; $51de: $44
	inc  b                                           ; $51df: $04
	add  c                                           ; $51e0: $81
	.db  $e3                                         ; $51e1: $e3
	ld   d, c                                        ; $51e2: $51
	ld   b, b                                        ; $51e3: $40
	inc  b                                           ; $51e4: $04
	add  hl, hl                                      ; $51e5: $29
	ld   b, b                                        ; $51e6: $40
	inc  b                                           ; $51e7: $04
	add  hl, hl                                      ; $51e8: $29
	jp   nz, $e33c                                   ; $51e9: $c2 $3c $e3

	ld   d, c                                        ; $51ec: $51
	ld   b, d                                        ; $51ed: $42
	rrca                                             ; $51ee: $0f
	nop                                              ; $51ef: $00
	ld   (bc), a                                     ; $51f0: $02
	rst  $38                                         ; $51f1: $ff
	rst  $38                                         ; $51f2: $ff
	push de                                          ; $51f3: $d5
	ld   d, c                                        ; $51f4: $51
	inc  b                                           ; $51f5: $04
	rst  $38                                         ; $51f6: $ff
	rst  $38                                         ; $51f7: $ff
	push de                                          ; $51f8: $d5
	ld   d, c                                        ; $51f9: $51
	ld   b, $ff                                      ; $51fa: $06 $ff
	rst  $38                                         ; $51fc: $ff
	call c, $0751                                    ; $51fd: $dc $51 $07
	rst  $38                                         ; $5200: $ff
	rst  $38                                         ; $5201: $ff
	push de                                          ; $5202: $d5
	ld   d, c                                        ; $5203: $51
	ld   ($ffff), sp                                 ; $5204: $08 $ff $ff
	push de                                          ; $5207: $d5
	ld   d, c                                        ; $5208: $51
	ld   a, (bc)                                     ; $5209: $0a
	rst  $38                                         ; $520a: $ff
	rst  $38                                         ; $520b: $ff
	push de                                          ; $520c: $d5
	ld   d, c                                        ; $520d: $51
	dec  bc                                          ; $520e: $0b
	rst  $38                                         ; $520f: $ff
	rst  $38                                         ; $5210: $ff
	call c, $0c51                                    ; $5211: $dc $51 $0c
	rst  $38                                         ; $5214: $ff
	rst  $38                                         ; $5215: $ff
	call c, $0d51                                    ; $5216: $dc $51 $0d
	rst  $38                                         ; $5219: $ff
	rst  $38                                         ; $521a: $ff
	call c, $1051                                    ; $521b: $dc $51 $10
	ld   (bc), a                                     ; $521e: $02
	inc  b                                           ; $521f: $04
	call c, $ff51                                    ; $5220: $dc $51 $ff
	rst  $38                                         ; $5223: $ff
	rst  $38                                         ; $5224: $ff
	inc  d                                           ; $5225: $14
	daa                                              ; $5226: $27
	ld   b, a                                        ; $5227: $47
	inc  bc                                          ; $5228: $03
	inc  c                                           ; $5229: $0c
	add  hl, bc                                      ; $522a: $09
	adc  c                                           ; $522b: $89
	scf                                              ; $522c: $37
	jr   jr_007_5245                                 ; $522d: $18 $16

	add  l                                           ; $522f: $85
	.db $ca $69 $42

	ld   (bc), a                                     ; $5233: $02
	inc  b                                           ; $5234: $04
	jp   $3aa0                                       ; $5235: $c3 $a0 $3a


	ld   d, d                                        ; $5238: $52
	nop                                              ; $5239: $00
	.db $c3 $55 $40


	ld   d, d                                        ; $523d: $52
	ld   b, e                                        ; $523e: $43
	ld   d, $c3                                      ; $523f: $16 $c3
	add  hl, de                                      ; $5241: $19
	ld   b, (hl)                                     ; $5242: $46
	ld   d, d                                        ; $5243: $52
	ld   b, e                                        ; $5244: $43

jr_007_5245:
	rla                                              ; $5245: $17
	ld   b, e                                        ; $5246: $43
	ccf                                              ; $5247: $3f
	ld   c, a                                        ; $5248: $4f
	dec  b                                           ; $5249: $05
	ld   d, h                                        ; $524a: $54
	ld   a, (bc)                                     ; $524b: $0a
	adc  c                                           ; $524c: $89
	ld   (hl), e                                     ; $524d: $73
	ld   d, $42                                      ; $524e: $16 $42
	ld   (bc), a                                     ; $5250: $02
	.db $c2 $04 $48

	ld   d, d                                        ; $5254: $52
	inc  h                                           ; $5255: $24
	jp   nz, $4806                                   ; $5256: $c2 $06 $48

	ld   d, d                                        ; $5259: $52
	jp   nz, $4809                                   ; $525a: $c2 $09 $48

	ld   d, d                                        ; $525d: $52
	.db $c2 $0b $48

	ld   d, d                                        ; $5261: $52
	.db $c2 $0d $48

	ld   d, d                                        ; $5265: $52
	.db $c2 $10 $48

	ld   d, d                                        ; $5269: $52
	.db $c2 $13 $48

	ld   d, d                                        ; $526d: $52
	jp   nz, $481f                                   ; $526e: $c2 $1f $48

	ld   d, d                                        ; $5271: $52
	jp   nz, $4824                                   ; $5272: $c2 $24 $48

	ld   d, d                                        ; $5275: $52
	.db $c2 $28 $48

	ld   d, d                                        ; $5279: $52
	.db $c2 $29 $48

	ld   d, d                                        ; $527d: $52
	.db $c2 $2e $48

	ld   d, d                                        ; $5281: $52
	.db $c2 $33 $48

	ld   d, d                                        ; $5285: $52
	push bc                                          ; $5286: $c5
	ld   ($529a), sp                                 ; $5287: $08 $9a $52
	add  l                                           ; $528a: $85
	sub  h                                           ; $528b: $94
	ld   l, c                                        ; $528c: $69
	add  a                                           ; $528d: $87
	sbc  e                                           ; $528e: $9b
	ld   d, d                                        ; $528f: $52
	add  l                                           ; $5290: $85
	sbc  a                                           ; $5291: $9f
	ld   l, c                                        ; $5292: $69
	ld   b, l                                        ; $5293: $45
	inc  d                                           ; $5294: $14
	ld   c, d                                        ; $5295: $4a
	ld   ($8589), sp                                 ; $5296: $08 $89 $85
	ld   d, $00                                      ; $5299: $16 $00
	inc  bc                                          ; $529b: $03
	ld   bc, $6f47                                   ; $529c: $01 $47 $6f
	ld   l, a                                        ; $529f: $6f
	ld   h, h                                        ; $52a0: $64
	jr   nz, $4a                                     ; $52a1: $20 $4a

	ld   l, a                                        ; $52a3: $6f
	ld   h, d                                        ; $52a4: $62
	ld   hl, $5920                                   ; $52a5: $21 $20 $59
	ld   l, a                                        ; $52a8: $6f
	ld   (hl), l                                     ; $52a9: $75
	ld   bc, $6163                                   ; $52aa: $01 $63 $61
	ld   l, (hl)                                     ; $52ad: $6e
	jr   nz, jr_007_5325                             ; $52ae: $20 $75

	ld   (hl), e                                     ; $52b0: $73
	ld   h, l                                        ; $52b1: $65
	jr   nz, jr_007_5328                             ; $52b2: $20 $74

	ld   l, b                                        ; $52b4: $68
	ld   l, c                                        ; $52b5: $69
	ld   (hl), e                                     ; $52b6: $73
	ld   bc, $6974                                   ; $52b7: $01 $74 $69
	ld   h, e                                        ; $52ba: $63
	ld   l, e                                        ; $52bb: $6b
	ld   h, l                                        ; $52bc: $65
	ld   (hl), h                                     ; $52bd: $74
	jr   nz, jr_007_5334                             ; $52be: $20 $74

	ld   l, a                                        ; $52c0: $6f
	ld   bc, $7274                                   ; $52c1: $01 $74 $72
	ld   h, c                                        ; $52c4: $61
	.db  $76                                         ; $52c5: $76
	ld   h, l                                        ; $52c6: $65
	ld   l, h                                        ; $52c7: $6c
	jr   nz, jr_007_532c                             ; $52c8: $20 $62

	ld   h, l                                        ; $52ca: $65
	ld   (hl), h                                     ; $52cb: $74
	ld   (hl), a                                     ; $52cc: $77
	ld   h, l                                        ; $52cd: $65
	ld   h, l                                        ; $52ce: $65
	ld   l, (hl)                                     ; $52cf: $6e
	ld   bc, $6874                                   ; $52d0: $01 $74 $68
	ld   h, l                                        ; $52d3: $65
	jr   nz, $35                                     ; $52d4: $20 $35

	jr   nz, jr_007_534a                             ; $52d6: $20 $72

	ld   h, c                                        ; $52d8: $61
	ld   l, c                                        ; $52d9: $69
	ld   l, h                                        ; $52da: $6c
	ld   (hl), d                                     ; $52db: $72
	ld   l, a                                        ; $52dc: $6f
	ld   h, c                                        ; $52dd: $61
	ld   h, h                                        ; $52de: $64
	ld   bc, $7473                                   ; $52df: $01 $73 $74
	ld   h, c                                        ; $52e2: $61
	ld   (hl), h                                     ; $52e3: $74
	ld   l, c                                        ; $52e4: $69
	ld   l, a                                        ; $52e5: $6f
	ld   l, (hl)                                     ; $52e6: $6e
	ld   (hl), e                                     ; $52e7: $73
	ld   l, $ff                                      ; $52e8: $2e $ff
	ld   b, d                                        ; $52ea: $42
	inc  a                                           ; $52eb: $3c
	cp   $7f                                         ; $52ec: $fe $7f
	add  l                                           ; $52ee: $85
	sub  h                                           ; $52ef: $94
	ld   l, c                                        ; $52f0: $69
	add  $ff                                         ; $52f1: $c6 $ff
	.db  $fc                                         ; $52f3: $fc
	ld   d, d                                        ; $52f4: $52
	add  l                                           ; $52f5: $85
	or   h                                           ; $52f6: $b4
	ld   l, c                                        ; $52f7: $69
	jp   nz, $f196                                   ; $52f8: $c2 $96 $f1

	ld   d, d                                        ; $52fb: $52
	ld   d, h                                        ; $52fc: $54
	nop                                              ; $52fd: $00
	ld   d, b                                        ; $52fe: $50
	ld   hl, $1845                                   ; $52ff: $21 $45 $18
	nop                                              ; $5302: $00
	add  hl, bc                                      ; $5303: $09
	inc  d                                           ; $5304: $14
	inc  c                                           ; $5305: $0c
	add  l                                           ; $5306: $85
	sub  (hl)                                        ; $5307: $96
	ld   l, c                                        ; $5308: $69
	jp   z, $14ff                                    ; $5309: $ca $ff $14

	ld   d, e                                        ; $530c: $53
	add  l                                           ; $530d: $85
	xor  d                                           ; $530e: $aa
	ld   l, c                                        ; $530f: $69
	.db $c2 $4b $09

	ld   d, e                                        ; $5313: $53
	ld   d, h                                        ; $5314: $54
	nop                                              ; $5315: $00
	ld   d, b                                        ; $5316: $50
	ld   hl, $1845                                   ; $5317: $21 $45 $18
	nop                                              ; $531a: $00
	add  (hl)                                        ; $531b: $86
	daa                                              ; $531c: $27
	ld   d, e                                        ; $531d: $53
	daa                                              ; $531e: $27
	inc  c                                           ; $531f: $0c
	add  l                                           ; $5320: $85
	sub  (hl)                                        ; $5321: $96
	ld   l, c                                        ; $5322: $69
	add  (hl)                                        ; $5323: $86
	sbc  l                                           ; $5324: $9d

jr_007_5325:
	ld   d, e                                        ; $5325: $53
	nop                                              ; $5326: $00
	nop                                              ; $5327: $00

jr_007_5328:
	ld   (bc), a                                     ; $5328: $02
	inc  bc                                          ; $5329: $03
	ld   d, a                                        ; $532a: $57
	ld   d, e                                        ; $532b: $53

jr_007_532c:
	ld   bc, $0400                                   ; $532c: $01 $00 $04
	ld   e, (hl)                                     ; $532f: $5e
	ld   d, e                                        ; $5330: $53
	nop                                              ; $5331: $00
	ld   (bc), a                                     ; $5332: $02
	ld   (bc), a                                     ; $5333: $02

jr_007_5334:
	ld   h, l                                        ; $5334: $65
	ld   d, e                                        ; $5335: $53
	ld   a, (bc)                                     ; $5336: $0a
	ld   (bc), a                                     ; $5337: $02
	ld   (bc), a                                     ; $5338: $02
	ld   l, h                                        ; $5339: $6c
	ld   d, e                                        ; $533a: $53
	ld   ($0002), sp                                 ; $533b: $08 $02 $00
	ld   (hl), e                                     ; $533e: $73
	ld   d, e                                        ; $533f: $53
	ld   bc, $0202                                   ; $5340: $01 $02 $02
	ld   a, h                                        ; $5343: $7c
	ld   d, e                                        ; $5344: $53
	add  hl, bc                                      ; $5345: $09
	nop                                              ; $5346: $00
	ld   bc, $5381                                   ; $5347: $01 $81 $53

jr_007_534a:
	dec  bc                                          ; $534a: $0b
	inc  b                                           ; $534b: $04
	inc  bc                                          ; $534c: $03
	adc  a                                           ; $534d: $8f
	ld   d, e                                        ; $534e: $53
	ld   ($0200), sp                                 ; $534f: $08 $00 $02
	sub  (hl)                                        ; $5352: $96
	ld   d, e                                        ; $5353: $53
	rst  $38                                         ; $5354: $ff
	rst  $38                                         ; $5355: $ff
	rst  $38                                         ; $5356: $ff
	push bc                                          ; $5357: $c5
	inc  b                                           ; $5358: $04
	ld   h, $53                                      ; $5359: $26 $53
	add  c                                           ; $535b: $81
	ld   e, $53                                      ; $535c: $1e $53
	call nz, $2602                                   ; $535e: $c4 $02 $26
	ld   d, e                                        ; $5361: $53
	add  c                                           ; $5362: $81
	ld   e, $53                                      ; $5363: $1e $53
	call nz, $2601                                   ; $5365: $c4 $01 $26
	ld   d, e                                        ; $5368: $53
	add  c                                           ; $5369: $81
	ld   e, $53                                      ; $536a: $1e $53
	call nz, $2610                                   ; $536c: $c4 $10 $26
	ld   d, e                                        ; $536f: $53
	add  c                                           ; $5370: $81
	ld   e, $53                                      ; $5371: $1e $53
	call nz, $1e02                                   ; $5373: $c4 $02 $1e
	ld   d, e                                        ; $5376: $53
	rst  $00                                         ; $5377: $c7
	jr   $05                                         ; $5378: $18 $05

	ld   ($c400), sp                                 ; $537a: $08 $00 $c4
	ld   bc, $531e                                   ; $537d: $01 $1e $53
	nop                                              ; $5380: $00
	call nz, $8801                                   ; $5381: $c4 $01 $88
	ld   d, e                                        ; $5384: $53
	add  c                                           ; $5385: $81
	ld   e, $53                                      ; $5386: $1e $53
	push bc                                          ; $5388: $c5
	ld   bc, $4e65                                   ; $5389: $01 $65 $4e
	add  c                                           ; $538c: $81
	ld   e, $53                                      ; $538d: $1e $53
	ret  z                                           ; $538f: $c8

	ld   (de), a                                     ; $5390: $12
	ld   h, $53                                      ; $5391: $26 $53
	add  c                                           ; $5393: $81
	ld   e, $53                                      ; $5394: $1e $53
	ret  z                                           ; $5396: $c8

	.db  $10                                         ; $5397: $10
	ld   h, $53                                      ; $5398: $26 $53
	add  c                                           ; $539a: $81
	ld   e, $53                                      ; $539b: $1e $53
	nop                                              ; $539d: $00
	ld   (bc), a                                     ; $539e: $02
	inc  bc                                          ; $539f: $03
	sbc  $53                                         ; $53a0: $de $53
	ld   bc, $0400                                   ; $53a2: $01 $00 $04
	xor  $53                                         ; $53a5: $ee $53
	nop                                              ; $53a7: $00
	ld   (bc), a                                     ; $53a8: $02
	ld   (bc), a                                     ; $53a9: $02
	.db  $f4                                         ; $53aa: $f4
	ld   d, e                                        ; $53ab: $53
	nop                                              ; $53ac: $00
	dec  b                                           ; $53ad: $05
	inc  bc                                          ; $53ae: $03
	ld   a, ($0a53)                                  ; $53af: $fa $53 $0a
	ld   (bc), a                                     ; $53b2: $02
	ld   (bc), a                                     ; $53b3: $02
	ld   a, (bc)                                     ; $53b4: $0a
	ld   d, h                                        ; $53b5: $54
	ld   ($0002), sp                                 ; $53b6: $08 $02 $00
	.db  $10                                         ; $53b9: $10
	ld   d, h                                        ; $53ba: $54
	ld   bc, $0202                                   ; $53bb: $01 $02 $02
	ld   d, $54                                      ; $53be: $16 $54
	add  hl, bc                                      ; $53c0: $09
	nop                                              ; $53c1: $00
	ld   bc, $541c                                   ; $53c2: $01 $1c $54
	dec  bc                                          ; $53c5: $0b
	inc  b                                           ; $53c6: $04
	inc  bc                                          ; $53c7: $03
	ldi  (hl), a                                     ; $53c8: $22
	ld   d, h                                        ; $53c9: $54
	ld   ($0200), sp                                 ; $53ca: $08 $00 $02
	jr   z, jr_007_5423                              ; $53cd: $28 $54

	rst  $38                                         ; $53cf: $ff
	rst  $38                                         ; $53d0: $ff
	rst  $38                                         ; $53d1: $ff
	add  (hl)                                        ; $53d2: $86
	sbc  l                                           ; $53d3: $9d

	ld   d, e                                        ; $53d4: $53
	add  l                                           ; $53d5: $85
	sbc  a                                           ; $53d6: $9f
	ld   l, c                                        ; $53d7: $69
	add  l                                           ; $53d8: $85
	sub  (hl)                                        ; $53d9: $96
	ld   l, c                                        ; $53da: $69
	add  c                                           ; $53db: $81
	jp   nc, $c553                                   ; $53dc: $d2 $53 $c5

	ld   (bc), a                                     ; $53df: $02
	add  sp, $53                                     ; $53e0: $e8 $53
	add  a                                           ; $53e2: $87
	ld   l, $54                                      ; $53e3: $2e $54
	add  c                                           ; $53e5: $81
	push de                                          ; $53e6: $d5
	ld   d, e                                        ; $53e7: $53
	add  a                                           ; $53e8: $87
	jp   nz, $8154                                   ; $53e9: $c2 $54 $81

	push de                                          ; $53ec: $d5
	ld   d, e                                        ; $53ed: $53
	add  a                                           ; $53ee: $87
	inc  c                                           ; $53ef: $0c
	ld   d, l                                        ; $53f0: $55
	add  c                                           ; $53f1: $81
	push de                                          ; $53f2: $d5
	ld   d, e                                        ; $53f3: $53
	add  a                                           ; $53f4: $87
	ld   c, (hl)                                     ; $53f5: $4e
	ld   d, l                                        ; $53f6: $55
	add  c                                           ; $53f7: $81
	push de                                          ; $53f8: $d5
	ld   d, e                                        ; $53f9: $53
	call nz, $0401                                   ; $53fa: $c4 $01 $04
	ld   d, h                                        ; $53fd: $54
	add  a                                           ; $53fe: $87
	cp   a                                           ; $53ff: $bf
	ld   d, l                                        ; $5400: $55
	add  c                                           ; $5401: $81
	push de                                          ; $5402: $d5
	ld   d, e                                        ; $5403: $53
	add  a                                           ; $5404: $87
	ld   h, b                                        ; $5405: $60
	ld   d, a                                        ; $5406: $57
	add  c                                           ; $5407: $81
	push de                                          ; $5408: $d5
	ld   d, e                                        ; $5409: $53
	add  a                                           ; $540a: $87
	inc  hl                                          ; $540b: $23
	ld   d, (hl)                                     ; $540c: $56
	add  c                                           ; $540d: $81
	push de                                          ; $540e: $d5
	ld   d, e                                        ; $540f: $53
	add  a                                           ; $5410: $87
	ld   h, a                                        ; $5411: $67
	ld   d, (hl)                                     ; $5412: $56
	add  c                                           ; $5413: $81
	push de                                          ; $5414: $d5
	ld   d, e                                        ; $5415: $53
	add  a                                           ; $5416: $87
	sbc  d                                           ; $5417: $9a
	ld   d, (hl)                                     ; $5418: $56
	add  c                                           ; $5419: $81
	push de                                          ; $541a: $d5
	ld   d, e                                        ; $541b: $53
	add  a                                           ; $541c: $87
	push bc                                          ; $541d: $c5
	ld   d, (hl)                                     ; $541e: $56
	add  c                                           ; $541f: $81
	push de                                          ; $5420: $d5
	ld   d, e                                        ; $5421: $53
	add  a                                           ; $5422: $87

jr_007_5423:
	inc  de                                          ; $5423: $13
	ld   d, a                                        ; $5424: $57
	add  c                                           ; $5425: $81
	push de                                          ; $5426: $d5
	ld   d, e                                        ; $5427: $53
	add  a                                           ; $5428: $87
	cp   c                                           ; $5429: $b9
	ld   d, a                                        ; $542a: $57
	add  c                                           ; $542b: $81
	push de                                          ; $542c: $d5
	ld   d, e                                        ; $542d: $53
	ld   (bc), a                                     ; $542e: $02
	ld   (bc), a                                     ; $542f: $02
	ld   c, b                                        ; $5430: $48
	ld   h, l                                        ; $5431: $65
	ld   l, h                                        ; $5432: $6c
	ld   l, h                                        ; $5433: $6c
	ld   l, a                                        ; $5434: $6f
	ld   l, $20                                      ; $5435: $2e $20
	ld   c, c                                        ; $5437: $49
	ld   h, (hl)                                     ; $5438: $66
	ld   bc, $6f79                                   ; $5439: $01 $79 $6f
	ld   (hl), l                                     ; $543c: $75
	daa                                              ; $543d: $27
	ld   h, h                                        ; $543e: $64
	jr   nz, jr_007_54ad                             ; $543f: $20 $6c

	ld   l, c                                        ; $5441: $69
	ld   l, e                                        ; $5442: $6b
	ld   h, l                                        ; $5443: $65
	ld   bc, $6874                                   ; $5444: $01 $74 $68
	ld   h, l                                        ; $5447: $65
	jr   nz, jr_007_54bc                             ; $5448: $20 $72

	ld   h, c                                        ; $544a: $61
	ld   h, (hl)                                     ; $544b: $66
	ld   (hl), h                                     ; $544c: $74
	inc  l                                           ; $544d: $2c
	ld   bc, $6f79                                   ; $544e: $01 $79 $6f
	ld   (hl), l                                     ; $5451: $75
	daa                                              ; $5452: $27
	ld   l, h                                        ; $5453: $6c
	ld   l, h                                        ; $5454: $6c
	jr   nz, $6e                                     ; $5455: $20 $6e

	ld   h, l                                        ; $5457: $65
	ld   h, l                                        ; $5458: $65
	ld   h, h                                        ; $5459: $64
	ld   bc, $6153                                   ; $545a: $01 $53 $61
	ld   l, l                                        ; $545d: $6d
	ld   (hl), e                                     ; $545e: $73
	ld   l, a                                        ; $545f: $6f
	ld   l, (hl)                                     ; $5460: $6e
	daa                                              ; $5461: $27
	ld   (hl), e                                     ; $5462: $73
	ld   bc, $614a                                   ; $5463: $01 $4a $61
	ld   (hl), a                                     ; $5466: $77
	ld   h, d                                        ; $5467: $62
	ld   l, a                                        ; $5468: $6f
	ld   l, (hl)                                     ; $5469: $6e
	ld   h, l                                        ; $546a: $65
	jr   nz, jr_007_54e1                             ; $546b: $20 $74

	ld   l, a                                        ; $546d: $6f
	ld   bc, $6572                                   ; $546e: $01 $72 $65
	ld   (hl), h                                     ; $5471: $74
	ld   (hl), d                                     ; $5472: $72
	ld   l, c                                        ; $5473: $69
	ld   h, l                                        ; $5474: $65
	.db  $76                                         ; $5475: $76
	ld   h, l                                        ; $5476: $65
	jr   nz, $69                                     ; $5477: $20 $69

	ld   (hl), h                                     ; $5479: $74
	ld   l, $ff                                      ; $547a: $2e $ff
	ld   b, d                                        ; $547c: $42
	add  hl, de                                      ; $547d: $19
	cp   $fd                                         ; $547e: $fe $fd
	inc  bc                                          ; $5480: $03
	ld   (bc), a                                     ; $5481: $02
	ld   d, d                                        ; $5482: $52
	ld   (hl), l                                     ; $5483: $75
	ld   l, l                                        ; $5484: $6d
	ld   l, a                                        ; $5485: $6f
	ld   (hl), d                                     ; $5486: $72
	jr   nz, jr_007_54f1                             ; $5487: $20 $68

	ld   h, c                                        ; $5489: $61
	ld   (hl), e                                     ; $548a: $73
	jr   nz, jr_007_54f6                             ; $548b: $20 $69

	ld   (hl), h                                     ; $548d: $74
	ld   bc, $6874                                   ; $548e: $01 $74 $68
	ld   h, l                                        ; $5491: $65
	jr   nz, $4a                                     ; $5492: $20 $4a

	ld   h, c                                        ; $5494: $61
	ld   (hl), a                                     ; $5495: $77
	ld   h, d                                        ; $5496: $62
	ld   l, a                                        ; $5497: $6f
	ld   l, (hl)                                     ; $5498: $6e
	ld   h, l                                        ; $5499: $65
	ld   bc, $7369                                   ; $549a: $01 $69 $73
	jr   nz, jr_007_5508                             ; $549d: $20 $69

	ld   l, (hl)                                     ; $549f: $6e
	jr   nz, $61                                     ; $54a0: $20 $61

	ld   bc, $6f6c                                   ; $54a2: $01 $6c $6f
	ld   h, e                                        ; $54a5: $63
	ld   l, e                                        ; $54a6: $6b
	ld   h, l                                        ; $54a7: $65
	ld   h, h                                        ; $54a8: $64
	jr   nz, jr_007_551d                             ; $54a9: $20 $72

	ld   l, a                                        ; $54ab: $6f
	ld   l, a                                        ; $54ac: $6f

jr_007_54ad:
	ld   l, l                                        ; $54ad: $6d
	ld   bc, $6e69                                   ; $54ae: $01 $69 $6e
	jr   nz, jr_007_5527                             ; $54b1: $20 $74

	ld   l, b                                        ; $54b3: $68
	ld   h, l                                        ; $54b4: $65
	ld   bc, $6873                                   ; $54b5: $01 $73 $68
	ld   l, c                                        ; $54b8: $69
	ld   (hl), b                                     ; $54b9: $70
	ld   a, c                                        ; $54ba: $79
	ld   h, c                                        ; $54bb: $61

jr_007_54bc:
	ld   (hl), d                                     ; $54bc: $72
	ld   h, h                                        ; $54bd: $64
	ld   l, $ff                                      ; $54be: $2e $ff
	cp   $7f                                         ; $54c0: $fe $7f
	inc  bc                                          ; $54c2: $03
	ld   bc, $6548                                   ; $54c3: $01 $48 $65
	ld   l, h                                        ; $54c6: $6c
	ld   l, h                                        ; $54c7: $6c
	ld   l, a                                        ; $54c8: $6f
	inc  l                                           ; $54c9: $2c
	jr   nz, jr_007_552d                             ; $54ca: $20 $61

	ld   h, a                                        ; $54cc: $67
	ld   h, c                                        ; $54cd: $61
	ld   l, c                                        ; $54ce: $69
	ld   l, (hl)                                     ; $54cf: $6e
	ld   l, $01                                      ; $54d0: $2e $01
	ld   c, (hl)                                     ; $54d2: $4e
	ld   l, a                                        ; $54d3: $6f
	ld   (hl), a                                     ; $54d4: $77
	jr   nz, $79                                     ; $54d5: $20 $79

	ld   l, a                                        ; $54d7: $6f
	ld   (hl), l                                     ; $54d8: $75
	jr   nz, jr_007_553e                             ; $54d9: $20 $63

	ld   h, c                                        ; $54db: $61
	ld   l, (hl)                                     ; $54dc: $6e
	ld   bc, $6567                                   ; $54dd: $01 $67 $65
	ld   (hl), h                                     ; $54e0: $74

jr_007_54e1:
	jr   nz, $74                                     ; $54e1: $20 $74

	ld   l, b                                        ; $54e3: $68
	ld   h, l                                        ; $54e4: $65
	jr   nz, jr_007_5559                             ; $54e5: $20 $72

	ld   h, c                                        ; $54e7: $61
	ld   h, (hl)                                     ; $54e8: $66
	ld   (hl), h                                     ; $54e9: $74
	ld   bc, $7962                                   ; $54ea: $01 $62 $79
	jr   nz, jr_007_5563                             ; $54ed: $20 $74

	ld   l, b                                        ; $54ef: $68
	ld   (hl), d                                     ; $54f0: $72

jr_007_54f1:
	ld   l, a                                        ; $54f1: $6f
	ld   (hl), a                                     ; $54f2: $77
	ld   l, c                                        ; $54f3: $69
	ld   l, (hl)                                     ; $54f4: $6e
	ld   h, a                                        ; $54f5: $67

jr_007_54f6:
	ld   bc, $6874                                   ; $54f6: $01 $74 $68
	ld   h, l                                        ; $54f9: $65
	jr   nz, $4a                                     ; $54fa: $20 $4a

	ld   h, c                                        ; $54fc: $61
	ld   (hl), a                                     ; $54fd: $77
	ld   h, d                                        ; $54fe: $62
	ld   l, a                                        ; $54ff: $6f
	ld   l, (hl)                                     ; $5500: $6e
	ld   h, l                                        ; $5501: $65
	ld   bc, $7461                                   ; $5502: $01 $61 $74
	jr   nz, jr_007_5570                             ; $5505: $20 $69

	ld   (hl), h                                     ; $5507: $74

jr_007_5508:
	ld   l, $ff                                      ; $5508: $2e $ff
	cp   $7f                                         ; $550a: $fe $7f
	inc  bc                                          ; $550c: $03
	ld   (bc), a                                     ; $550d: $02
	ld   e, c                                        ; $550e: $59
	ld   l, a                                        ; $550f: $6f
	ld   (hl), l                                     ; $5510: $75
	daa                                              ; $5511: $27
	ld   h, h                                        ; $5512: $64
	jr   nz, jr_007_5577                             ; $5513: $20 $62

	ld   h, l                                        ; $5515: $65
	ld   (hl), h                                     ; $5516: $74
	ld   (hl), h                                     ; $5517: $74
	ld   h, l                                        ; $5518: $65
	ld   (hl), d                                     ; $5519: $72
	ld   bc, $6168                                   ; $551a: $01 $68 $61

jr_007_551d:
	.db  $76                                         ; $551d: $76
	ld   h, l                                        ; $551e: $65
	jr   nz, $74                                     ; $551f: $20 $74

	ld   l, b                                        ; $5521: $68
	ld   h, l                                        ; $5522: $65
	ld   bc, $7242                                   ; $5523: $01 $42 $72
	ld   h, l                                        ; $5526: $65

jr_007_5527:
	ld   h, c                                        ; $5527: $61
	ld   (hl), e                                     ; $5528: $73
	ld   (hl), h                                     ; $5529: $74
	ld   (hl), b                                     ; $552a: $70
	ld   l, h                                        ; $552b: $6c
	ld   h, c                                        ; $552c: $61

jr_007_552d:
	ld   (hl), h                                     ; $552d: $74
	ld   h, l                                        ; $552e: $65
	ld   bc, $6562                                   ; $552f: $01 $62 $65
	ld   h, (hl)                                     ; $5532: $66
	ld   l, a                                        ; $5533: $6f
	ld   (hl), d                                     ; $5534: $72
	ld   h, l                                        ; $5535: $65
	jr   nz, jr_007_55b1                             ; $5536: $20 $79

	ld   l, a                                        ; $5538: $6f
	ld   (hl), l                                     ; $5539: $75
	ld   bc, $6e65                                   ; $553a: $01 $65 $6e
	ld   (hl), h                                     ; $553d: $74

jr_007_553e:
	ld   h, l                                        ; $553e: $65
	ld   (hl), d                                     ; $553f: $72
	jr   nz, jr_007_55b6                             ; $5540: $20 $74

	ld   l, b                                        ; $5542: $68
	ld   l, c                                        ; $5543: $69
	ld   (hl), e                                     ; $5544: $73
	ld   bc, $7261                                   ; $5545: $01 $61 $72
	ld   h, l                                        ; $5548: $65
	ld   h, c                                        ; $5549: $61
	ld   l, $ff                                      ; $554a: $2e $ff
	cp   $7f                                         ; $554c: $fe $7f
	ld   bc, $4800                                   ; $554e: $01 $00 $48
	ld   l, c                                        ; $5551: $69
	ld   l, $20                                      ; $5552: $2e $20
	ld   b, a                                        ; $5554: $47
	ld   l, a                                        ; $5555: $6f
	jr   nz, $64                                     ; $5556: $20 $64

	ld   l, a                                        ; $5558: $6f

jr_007_5559:
	ld   (hl), a                                     ; $5559: $77
	ld   l, (hl)                                     ; $555a: $6e
	ld   bc, $6874                                   ; $555b: $01 $74 $68
	ld   h, l                                        ; $555e: $65
	ld   (hl), e                                     ; $555f: $73
	ld   h, l                                        ; $5560: $65
	jr   nz, jr_007_55d6                             ; $5561: $20 $73

jr_007_5563:
	ld   (hl), h                                     ; $5563: $74
	ld   h, c                                        ; $5564: $61
	ld   l, c                                        ; $5565: $69
	ld   (hl), d                                     ; $5566: $72
	ld   (hl), e                                     ; $5567: $73
	ld   bc, $6e61                                   ; $5568: $01 $61 $6e
	ld   h, h                                        ; $556b: $64
	jr   nz, jr_007_55da                             ; $556c: $20 $6c

	ld   l, a                                        ; $556e: $6f
	ld   l, a                                        ; $556f: $6f

jr_007_5570:
	ld   l, e                                        ; $5570: $6b
	ld   bc, $7261                                   ; $5571: $01 $61 $72
	ld   l, a                                        ; $5574: $6f
	ld   (hl), l                                     ; $5575: $75
	ld   l, (hl)                                     ; $5576: $6e

jr_007_5577:
	ld   h, h                                        ; $5577: $64
	ld   l, $20                                      ; $5578: $2e $20
	ld   c, a                                        ; $557a: $4f
	ld   l, (hl)                                     ; $557b: $6e
	ld   h, e                                        ; $557c: $63
	ld   h, l                                        ; $557d: $65
	ld   bc, $6f79                                   ; $557e: $01 $79 $6f
	ld   (hl), l                                     ; $5581: $75
	jr   nz, jr_007_55ea                             ; $5582: $20 $66

	ld   l, c                                        ; $5584: $69
	ld   l, (hl)                                     ; $5585: $6e
	ld   h, h                                        ; $5586: $64
	ld   bc, $6874                                   ; $5587: $01 $74 $68
	ld   h, l                                        ; $558a: $65
	jr   nz, $42                                     ; $558b: $20 $42

	ld   h, l                                        ; $558d: $65
	ld   l, h                                        ; $558e: $6c
	ld   (hl), h                                     ; $558f: $74
	jr   nz, jr_007_5601                             ; $5590: $20 $6f

	ld   h, (hl)                                     ; $5592: $66
	ld   bc, $7254                                   ; $5593: $01 $54 $72
	ld   (hl), l                                     ; $5596: $75
	ld   (hl), h                                     ; $5597: $74
	ld   l, b                                        ; $5598: $68
	inc  l                                           ; $5599: $2c
	jr   nz, $79                                     ; $559a: $20 $79

	ld   l, a                                        ; $559c: $6f
	ld   (hl), l                                     ; $559d: $75
	daa                                              ; $559e: $27
	ld   l, h                                        ; $559f: $6c
	ld   l, h                                        ; $55a0: $6c
	ld   bc, $6562                                   ; $55a1: $01 $62 $65
	jr   nz, $61                                     ; $55a4: $20 $61

	ld   h, d                                        ; $55a6: $62
	ld   l, h                                        ; $55a7: $6c
	ld   h, l                                        ; $55a8: $65
	jr   nz, jr_007_561f                             ; $55a9: $20 $74

	ld   l, a                                        ; $55ab: $6f
	ld   bc, $656c                                   ; $55ac: $01 $6c $65
	ld   h, c                                        ; $55af: $61
	.db  $76                                         ; $55b0: $76

jr_007_55b1:
	ld   h, l                                        ; $55b1: $65
	jr   nz, jr_007_5628                             ; $55b2: $20 $74

	ld   l, b                                        ; $55b4: $68
	ld   h, l                                        ; $55b5: $65

jr_007_55b6:
	jr   nz, jr_007_5628                             ; $55b6: $20 $70

	ld   h, c                                        ; $55b8: $61
	ld   (hl), d                                     ; $55b9: $72
	ld   l, e                                        ; $55ba: $6b
	ld   l, $ff                                      ; $55bb: $2e $ff
	cp   $7f                                         ; $55bd: $fe $7f
	ld   (bc), a                                     ; $55bf: $02
	nop                                              ; $55c0: $00
	ld   b, h                                        ; $55c1: $44
	ld   l, a                                        ; $55c2: $6f
	ld   (hl), a                                     ; $55c3: $77
	ld   l, (hl)                                     ; $55c4: $6e
	ld   (hl), h                                     ; $55c5: $74
	ld   l, a                                        ; $55c6: $6f
	ld   (hl), a                                     ; $55c7: $77
	ld   l, (hl)                                     ; $55c8: $6e
	jr   nz, jr_007_5637                             ; $55c9: $20 $6c

	ld   l, c                                        ; $55cb: $69
	ld   h, l                                        ; $55cc: $65
	ld   (hl), e                                     ; $55cd: $73
	ld   bc, $6165                                   ; $55ce: $01 $65 $61
	ld   (hl), e                                     ; $55d1: $73
	ld   (hl), h                                     ; $55d2: $74
	jr   nz, jr_007_5644                             ; $55d3: $20 $6f

	ld   h, (hl)                                     ; $55d5: $66

jr_007_55d6:
	jr   nz, jr_007_5640                             ; $55d6: $20 $68

	ld   h, l                                        ; $55d8: $65
	ld   (hl), d                                     ; $55d9: $72

jr_007_55da:
	ld   h, l                                        ; $55da: $65
	inc  l                                           ; $55db: $2c
	ld   bc, $7562                                   ; $55dc: $01 $62 $75
	ld   (hl), h                                     ; $55df: $74
	jr   nz, jr_007_565b                             ; $55e0: $20 $79

	ld   l, a                                        ; $55e2: $6f
	ld   (hl), l                                     ; $55e3: $75
	daa                                              ; $55e4: $27
	ld   l, h                                        ; $55e5: $6c
	ld   l, h                                        ; $55e6: $6c
	ld   bc, $656e                                   ; $55e7: $01 $6e $65

jr_007_55ea:
	ld   h, l                                        ; $55ea: $65
	ld   h, h                                        ; $55eb: $64
	jr   nz, jr_007_5662                             ; $55ec: $20 $74

	ld   l, b                                        ; $55ee: $68
	ld   h, l                                        ; $55ef: $65
	jr   nz, jr_007_5634                             ; $55f0: $20 $42

	ld   h, l                                        ; $55f2: $65
	ld   l, h                                        ; $55f3: $6c
	ld   (hl), h                                     ; $55f4: $74
	ld   bc, $666f                                   ; $55f5: $01 $6f $66
	jr   nz, jr_007_564e                             ; $55f8: $20 $54

	ld   (hl), d                                     ; $55fa: $72
	ld   (hl), l                                     ; $55fb: $75
	ld   (hl), h                                     ; $55fc: $74
	ld   l, b                                        ; $55fd: $68
	jr   nz, jr_007_5674                             ; $55fe: $20 $74

	ld   l, a                                        ; $5600: $6f

Call_007_5601:
jr_007_5601:
	ld   bc, $7570                                   ; $5601: $01 $70 $75
	ld   (hl), e                                     ; $5604: $73
	ld   l, b                                        ; $5605: $68
	jr   nz, $74                                     ; $5606: $20 $74

	ld   l, b                                        ; $5608: $68
	ld   l, c                                        ; $5609: $69
	ld   (hl), e                                     ; $560a: $73
	jr   nz, jr_007_567f                             ; $560b: $20 $72

	ld   l, a                                        ; $560d: $6f
	ld   h, e                                        ; $560e: $63
	ld   l, e                                        ; $560f: $6b
	ld   bc, $756f                                   ; $5610: $01 $6f $75
	ld   (hl), h                                     ; $5613: $74
	jr   nz, jr_007_5685                             ; $5614: $20 $6f

	ld   h, (hl)                                     ; $5616: $66
	jr   nz, jr_007_568d                             ; $5617: $20 $74

	ld   l, b                                        ; $5619: $68
	ld   h, l                                        ; $561a: $65
	jr   nz, jr_007_5694                             ; $561b: $20 $77

	ld   h, c                                        ; $561d: $61
	ld   a, c                                        ; $561e: $79

jr_007_561f:
	ld   l, $ff                                      ; $561f: $2e $ff
	cp   $7f                                         ; $5621: $fe $7f
	inc  bc                                          ; $5623: $03
	ld   bc, $6548                                   ; $5624: $01 $48 $65
	ld   a, c                                        ; $5627: $79

jr_007_5628:
	inc  l                                           ; $5628: $2c
	jr   nz, jr_007_567e                             ; $5629: $20 $53

	ld   l, a                                        ; $562b: $6f
	ld   l, (hl)                                     ; $562c: $6e
	ld   l, (hl)                                     ; $562d: $6e
	ld   a, c                                        ; $562e: $79
	ld   l, $01                                      ; $562f: $2e $01
	ld   e, c                                        ; $5631: $59
	ld   l, a                                        ; $5632: $6f
	ld   (hl), l                                     ; $5633: $75

jr_007_5634:
	daa                                              ; $5634: $27
	ld   l, h                                        ; $5635: $6c
	ld   l, h                                        ; $5636: $6c

jr_007_5637:
	jr   nz, $6e                                     ; $5637: $20 $6e

	ld   h, l                                        ; $5639: $65
	ld   h, l                                        ; $563a: $65
	ld   h, h                                        ; $563b: $64
	ld   bc, $6874                                   ; $563c: $01 $74 $68
	ld   h, l                                        ; $563f: $65

jr_007_5640:
	jr   nz, jr_007_568a                             ; $5640: $20 $48

	ld   h, l                                        ; $5642: $65
	ld   l, h                                        ; $5643: $6c

jr_007_5644:
	ld   l, l                                        ; $5644: $6d
	ld   h, l                                        ; $5645: $65
	ld   (hl), h                                     ; $5646: $74
	jr   nz, jr_007_56aa                             ; $5647: $20 $61

	ld   l, (hl)                                     ; $5649: $6e
	ld   h, h                                        ; $564a: $64
	ld   bc, $6874                                   ; $564b: $01 $74 $68

jr_007_564e:
	ld   h, l                                        ; $564e: $65
	jr   nz, jr_007_5693                             ; $564f: $20 $42

	ld   l, a                                        ; $5651: $6f
	ld   l, a                                        ; $5652: $6f
	ld   (hl), h                                     ; $5653: $74
	ld   (hl), e                                     ; $5654: $73
	jr   nz, jr_007_56cb                             ; $5655: $20 $74

	ld   l, a                                        ; $5657: $6f
	ld   bc, $7263                                   ; $5658: $01 $63 $72

jr_007_565b:
	ld   l, a                                        ; $565b: $6f
	ld   (hl), e                                     ; $565c: $73
	ld   (hl), e                                     ; $565d: $73
	jr   nz, $68                                     ; $565e: $20 $68

	ld   h, l                                        ; $5660: $65
	ld   (hl), d                                     ; $5661: $72

jr_007_5662:
	ld   h, l                                        ; $5662: $65
	ld   l, $ff                                      ; $5663: $2e $ff
	cp   $7f                                         ; $5665: $fe $7f
	inc  b                                           ; $5667: $04
	ld   bc, $6f59                                   ; $5668: $01 $59 $6f
	ld   (hl), l                                     ; $566b: $75
	daa                                              ; $566c: $27
	ld   h, h                                        ; $566d: $64
	jr   nz, jr_007_56d2                             ; $566e: $20 $62

	ld   h, l                                        ; $5670: $65
	jr   nz, $76                                     ; $5671: $20 $76

	ld   h, l                                        ; $5673: $65

jr_007_5674:
	ld   (hl), d                                     ; $5674: $72
	ld   a, c                                        ; $5675: $79
	ld   bc, $6977                                   ; $5676: $01 $77 $69
	ld   (hl), e                                     ; $5679: $73
	ld   h, l                                        ; $567a: $65
	jr   nz, jr_007_56eb                             ; $567b: $20 $6e

	ld   l, a                                        ; $567d: $6f

jr_007_567e:
	ld   (hl), h                                     ; $567e: $74

jr_007_567f:
	jr   nz, jr_007_56f5                             ; $567f: $20 $74

	ld   l, a                                        ; $5681: $6f
	ld   bc, $6e65                                   ; $5682: $01 $65 $6e

jr_007_5685:
	ld   (hl), h                                     ; $5685: $74
	ld   h, l                                        ; $5686: $65
	ld   (hl), d                                     ; $5687: $72
	jr   nz, jr_007_56fe                             ; $5688: $20 $74

jr_007_568a:
	ld   l, b                                        ; $568a: $68
	ld   l, c                                        ; $568b: $69
	ld   (hl), e                                     ; $568c: $73

jr_007_568d:
	ld   bc, $7562                                   ; $568d: $01 $62 $75
	ld   l, c                                        ; $5690: $69
	ld   l, h                                        ; $5691: $6c
	ld   h, h                                        ; $5692: $64

jr_007_5693:
	ld   l, c                                        ; $5693: $69

jr_007_5694:
	ld   l, (hl)                                     ; $5694: $6e
	ld   h, a                                        ; $5695: $67
	ld   l, $ff                                      ; $5696: $2e $ff
	cp   $7f                                         ; $5698: $fe $7f
	inc  b                                           ; $569a: $04
	ld   (bc), a                                     ; $569b: $02
	ld   c, b                                        ; $569c: $48
	ld   h, l                                        ; $569d: $65
	ld   a, c                                        ; $569e: $79
	ld   hl, $5920                                   ; $569f: $21 $20 $59
	ld   l, a                                        ; $56a2: $6f
	ld   (hl), l                                     ; $56a3: $75
	daa                                              ; $56a4: $27
	ld   h, h                                        ; $56a5: $64
	ld   bc, $6562                                   ; $56a6: $01 $62 $65
	ld   (hl), h                                     ; $56a9: $74

jr_007_56aa:
	ld   (hl), h                                     ; $56aa: $74
	ld   h, l                                        ; $56ab: $65
	ld   (hl), d                                     ; $56ac: $72
	jr   nz, jr_007_5722                             ; $56ad: $20 $73

	ld   (hl), h                                     ; $56af: $74
	ld   h, c                                        ; $56b0: $61
	ld   a, c                                        ; $56b1: $79
	ld   bc, $7761                                   ; $56b2: $01 $61 $77
	ld   h, c                                        ; $56b5: $61
	ld   a, c                                        ; $56b6: $79
	jr   nz, jr_007_571f                             ; $56b7: $20 $66

	ld   (hl), d                                     ; $56b9: $72
	ld   l, a                                        ; $56ba: $6f
	ld   l, l                                        ; $56bb: $6d
	ld   bc, $6162                                   ; $56bc: $01 $62 $61
	ld   (hl), d                                     ; $56bf: $72
	ld   (hl), e                                     ; $56c0: $73
	ld   l, $ff                                      ; $56c1: $2e $ff
	cp   $7f                                         ; $56c3: $fe $7f
	inc  bc                                          ; $56c5: $03
	ld   bc, $6649                                   ; $56c6: $01 $49 $66
	jr   nz, jr_007_5744                             ; $56c9: $20 $79

jr_007_56cb:
	ld   l, a                                        ; $56cb: $6f
	ld   (hl), l                                     ; $56cc: $75
	jr   nz, jr_007_5737                             ; $56cd: $20 $68

	ld   h, c                                        ; $56cf: $61
	.db  $76                                         ; $56d0: $76
	ld   h, l                                        ; $56d1: $65

jr_007_56d2:
	ld   bc, $6874                                   ; $56d2: $01 $74 $68
	ld   h, l                                        ; $56d5: $65
	jr   nz, jr_007_571a                             ; $56d6: $20 $42

	ld   h, l                                        ; $56d8: $65
	ld   l, h                                        ; $56d9: $6c
	ld   (hl), h                                     ; $56da: $74
	jr   nz, $6f                                     ; $56db: $20 $6f

	ld   h, (hl)                                     ; $56dd: $66
	ld   bc, $7254                                   ; $56de: $01 $54 $72
	ld   (hl), l                                     ; $56e1: $75
	ld   (hl), h                                     ; $56e2: $74
	ld   l, b                                        ; $56e3: $68
	jr   nz, jr_007_5747                             ; $56e4: $20 $61

	ld   l, (hl)                                     ; $56e6: $6e
	ld   h, h                                        ; $56e7: $64
	jr   nz, jr_007_575e                             ; $56e8: $20 $74

	ld   l, b                                        ; $56ea: $68

jr_007_56eb:
	ld   h, l                                        ; $56eb: $65
	ld   bc, $6f54                                   ; $56ec: $01 $54 $6f
	ld   (hl), d                                     ; $56ef: $72
	ld   h, e                                        ; $56f0: $63
	ld   l, b                                        ; $56f1: $68
	inc  l                                           ; $56f2: $2c
	jr   nz, jr_007_5769                             ; $56f3: $20 $74

jr_007_56f5:
	ld   l, b                                        ; $56f5: $68
	ld   l, c                                        ; $56f6: $69
	ld   (hl), e                                     ; $56f7: $73
	ld   bc, $616d                                   ; $56f8: $01 $6d $61
	ld   l, e                                        ; $56fb: $6b
	ld   h, l                                        ; $56fc: $65
	ld   (hl), e                                     ; $56fd: $73

jr_007_56fe:
	jr   nz, jr_007_5761                             ; $56fe: $20 $61

	jr   nz, jr_007_5769                             ; $5700: $20 $67

	ld   (hl), d                                     ; $5702: $72
	ld   h, l                                        ; $5703: $65
	ld   h, c                                        ; $5704: $61
	ld   (hl), h                                     ; $5705: $74
	ld   bc, $6873                                   ; $5706: $01 $73 $68
	ld   l, a                                        ; $5709: $6f
	ld   (hl), d                                     ; $570a: $72
	ld   (hl), h                                     ; $570b: $74
	ld   h, e                                        ; $570c: $63
	ld   (hl), l                                     ; $570d: $75
	ld   (hl), h                                     ; $570e: $74
	ld   l, $ff                                      ; $570f: $2e $ff
	cp   $7f                                         ; $5711: $fe $7f
	inc  bc                                          ; $5713: $03
	ld   bc, $6854                                   ; $5714: $01 $54 $68
	ld   h, l                                        ; $5717: $65
	jr   nz, jr_007_578a                             ; $5718: $20 $70

jr_007_571a:
	ld   (hl), l                                     ; $571a: $75
	ld   a, d                                        ; $571b: $7a
	ld   a, d                                        ; $571c: $7a
	ld   l, h                                        ; $571d: $6c
	ld   h, l                                        ; $571e: $65

jr_007_571f:
	jr   nz, jr_007_578a                             ; $571f: $20 $69

	ld   l, (hl)                                     ; $5721: $6e

jr_007_5722:
	ld   bc, $6874                                   ; $5722: $01 $74 $68
	ld   l, c                                        ; $5725: $69
	ld   (hl), e                                     ; $5726: $73
	jr   nz, $72                                     ; $5727: $20 $72

	ld   l, a                                        ; $5729: $6f
	ld   l, a                                        ; $572a: $6f
	ld   l, l                                        ; $572b: $6d
	jr   nz, jr_007_5797                             ; $572c: $20 $69

	ld   (hl), e                                     ; $572e: $73
	ld   bc, $756d                                   ; $572f: $01 $6d $75
	ld   h, e                                        ; $5732: $63
	ld   l, b                                        ; $5733: $68
	jr   nz, $65                                     ; $5734: $20 $65

	ld   h, c                                        ; $5736: $61

jr_007_5737:
	ld   (hl), e                                     ; $5737: $73
	ld   l, c                                        ; $5738: $69
	ld   h, l                                        ; $5739: $65
	ld   (hl), d                                     ; $573a: $72
	ld   bc, $6f74                                   ; $573b: $01 $74 $6f
	jr   nz, jr_007_57b3                             ; $573e: $20 $73

	ld   l, a                                        ; $5740: $6f
	ld   l, h                                        ; $5741: $6c
	.db  $76                                         ; $5742: $76
	ld   h, l                                        ; $5743: $65

jr_007_5744:
	jr   nz, jr_007_57af                             ; $5744: $20 $69

	ld   h, (hl)                                     ; $5746: $66

jr_007_5747:
	ld   bc, $6f79                                   ; $5747: $01 $79 $6f
	ld   (hl), l                                     ; $574a: $75
	jr   nz, jr_007_57b5                             ; $574b: $20 $68

	ld   h, c                                        ; $574d: $61
	.db  $76                                         ; $574e: $76
	ld   h, l                                        ; $574f: $65
	jr   nz, jr_007_57b3                             ; $5750: $20 $61

	ld   bc, $696c                                   ; $5752: $01 $6c $69
	ld   (hl), h                                     ; $5755: $74
	jr   nz, jr_007_57cc                             ; $5756: $20 $74

	ld   l, a                                        ; $5758: $6f
	ld   (hl), d                                     ; $5759: $72
	ld   h, e                                        ; $575a: $63
	ld   l, b                                        ; $575b: $68
	ld   l, $ff                                      ; $575c: $2e $ff

jr_007_575e:
	cp   $7f                                         ; $575e: $fe $7f
	inc  bc                                          ; $5760: $03

jr_007_5761:
	ld   bc, $6f4e                                   ; $5761: $01 $4e $6f
	ld   (hl), a                                     ; $5764: $77
	jr   nz, jr_007_57db                             ; $5765: $20 $74

	ld   l, b                                        ; $5767: $68
	ld   h, c                                        ; $5768: $61

jr_007_5769:
	ld   (hl), h                                     ; $5769: $74
	jr   nz, jr_007_57e5                             ; $576a: $20 $79

	ld   l, a                                        ; $576c: $6f
	ld   (hl), l                                     ; $576d: $75
	ld   bc, $6168                                   ; $576e: $01 $68 $61
	.db  $76                                         ; $5771: $76
	ld   h, l                                        ; $5772: $65
	jr   nz, jr_007_57e9                             ; $5773: $20 $74

	ld   l, b                                        ; $5775: $68
	ld   h, l                                        ; $5776: $65
	jr   nz, $42                                     ; $5777: $20 $42

	ld   h, l                                        ; $5779: $65
	ld   l, h                                        ; $577a: $6c
	ld   (hl), h                                     ; $577b: $74
	ld   bc, $666f                                   ; $577c: $01 $6f $66
	jr   nz, jr_007_57d5                             ; $577f: $20 $54

	ld   (hl), d                                     ; $5781: $72
	ld   (hl), l                                     ; $5782: $75
	ld   (hl), h                                     ; $5783: $74
	ld   l, b                                        ; $5784: $68
	inc  l                                           ; $5785: $2c
	jr   nz, jr_007_57f8                             ; $5786: $20 $70

	ld   (hl), l                                     ; $5788: $75
	ld   (hl), e                                     ; $5789: $73

jr_007_578a:
	ld   l, b                                        ; $578a: $68
	ld   bc, $6874                                   ; $578b: $01 $74 $68
	ld   l, c                                        ; $578e: $69
	ld   (hl), e                                     ; $578f: $73
	jr   nz, jr_007_5804                             ; $5790: $20 $72

	ld   l, a                                        ; $5792: $6f
	ld   h, e                                        ; $5793: $63
	ld   l, e                                        ; $5794: $6b
	jr   nz, jr_007_5806                             ; $5795: $20 $6f

jr_007_5797:
	ld   (hl), l                                     ; $5797: $75
	ld   (hl), h                                     ; $5798: $74
	ld   bc, $666f                                   ; $5799: $01 $6f $66
	jr   nz, jr_007_5812                             ; $579c: $20 $74

	ld   l, b                                        ; $579e: $68
	ld   h, l                                        ; $579f: $65
	jr   nz, $77                                     ; $57a0: $20 $77

	ld   h, c                                        ; $57a2: $61
	ld   a, c                                        ; $57a3: $79
	jr   nz, jr_007_581a                             ; $57a4: $20 $74

	ld   l, a                                        ; $57a6: $6f
	ld   bc, $7865                                   ; $57a7: $01 $65 $78
	ld   l, c                                        ; $57aa: $69
	ld   (hl), h                                     ; $57ab: $74
	jr   nz, $74                                     ; $57ac: $20 $74

	ld   l, b                                        ; $57ae: $68

jr_007_57af:
	ld   h, l                                        ; $57af: $65
	jr   nz, $70                                     ; $57b0: $20 $70

	ld   h, c                                        ; $57b2: $61

jr_007_57b3:
	ld   (hl), d                                     ; $57b3: $72
	ld   l, e                                        ; $57b4: $6b

jr_007_57b5:
	ld   l, $ff                                      ; $57b5: $2e $ff
	cp   $7f                                         ; $57b7: $fe $7f
	inc  bc                                          ; $57b9: $03
	ld   bc, $7542                                   ; $57ba: $01 $42 $75
	ld   (hl), h                                     ; $57bd: $74
	jr   nz, jr_007_5829                             ; $57be: $20 $69

	ld   h, (hl)                                     ; $57c0: $66
	jr   nz, jr_007_583a                             ; $57c1: $20 $77

	ld   h, l                                        ; $57c3: $65
	jr   nz, jr_007_582e                             ; $57c4: $20 $68

	ld   l, a                                        ; $57c6: $6f
	ld   (hl), b                                     ; $57c7: $70
	ld   h, l                                        ; $57c8: $65
	ld   bc, $6f66                                   ; $57c9: $01 $66 $6f

jr_007_57cc:
	ld   (hl), d                                     ; $57cc: $72
	jr   nz, jr_007_5846                             ; $57cd: $20 $77

	ld   l, b                                        ; $57cf: $68
	ld   h, c                                        ; $57d0: $61
	ld   (hl), h                                     ; $57d1: $74
	jr   nz, jr_007_584b                             ; $57d2: $20 $77

	ld   h, l                                        ; $57d4: $65

jr_007_57d5:
	ld   bc, $6f64                                   ; $57d5: $01 $64 $6f
	jr   nz, jr_007_5848                             ; $57d8: $20 $6e

	ld   l, a                                        ; $57da: $6f

jr_007_57db:
	ld   (hl), h                                     ; $57db: $74
	jr   nz, jr_007_5857                             ; $57dc: $20 $79

	ld   h, l                                        ; $57de: $65
	ld   (hl), h                                     ; $57df: $74
	ld   bc, $6168                                   ; $57e0: $01 $68 $61
	.db  $76                                         ; $57e3: $76
	ld   h, l                                        ; $57e4: $65

jr_007_57e5:
	inc  l                                           ; $57e5: $2c
	jr   nz, jr_007_585f                             ; $57e6: $20 $77

	ld   h, l                                        ; $57e8: $65

jr_007_57e9:
	jr   nz, $77                                     ; $57e9: $20 $77

	ld   h, c                                        ; $57eb: $61
	ld   l, c                                        ; $57ec: $69
	ld   (hl), h                                     ; $57ed: $74
	ld   bc, $6f66                                   ; $57ee: $01 $66 $6f
	ld   (hl), d                                     ; $57f1: $72
	jr   nz, jr_007_585d                             ; $57f2: $20 $69

	ld   (hl), h                                     ; $57f4: $74
	ld   bc, $6170                                   ; $57f5: $01 $70 $61

jr_007_57f8:
	ld   (hl), h                                     ; $57f8: $74
	ld   l, c                                        ; $57f9: $69
	ld   h, l                                        ; $57fa: $65
	ld   l, (hl)                                     ; $57fb: $6e
	ld   (hl), h                                     ; $57fc: $74
	ld   l, h                                        ; $57fd: $6c
	ld   a, c                                        ; $57fe: $79
	ld   l, $ff                                      ; $57ff: $2e $ff
	cp   $7f                                         ; $5801: $fe $7f

Jump_007_5803:
	add  (hl)                                        ; $5803: $86

jr_007_5804:
	inc  c                                           ; $5804: $0c
	ld   e, b                                        ; $5805: $58

jr_007_5806:
	nop                                              ; $5806: $00
	rst  $00                                         ; $5807: $c7
	nop                                              ; $5808: $00
	add  b                                           ; $5809: $80
	add  b                                           ; $580a: $80
	nop                                              ; $580b: $00
	add  hl, bc                                      ; $580c: $09
	ld   bc, $3203                                   ; $580d: $01 $03 $32
	ld   e, b                                        ; $5810: $58
	rrca                                             ; $5811: $0f

jr_007_5812:
	nop                                              ; $5812: $00
	inc  b                                           ; $5813: $04
	scf                                              ; $5814: $37
	ld   e, b                                        ; $5815: $58
	add  hl, bc                                      ; $5816: $09
	ld   bc, $3c04                                   ; $5817: $01 $04 $3c

jr_007_581a:
	ld   e, b                                        ; $581a: $58
	nop                                              ; $581b: $00
	dec  b                                           ; $581c: $05
	inc  bc                                          ; $581d: $03
	ld   b, b                                        ; $581e: $40
	ld   e, b                                        ; $581f: $58
	ld   bc, $0202                                   ; $5820: $01 $02 $02
	ld   c, (hl)                                     ; $5823: $4e
	ld   e, b                                        ; $5824: $58
	inc  h                                           ; $5825: $24
	nop                                              ; $5826: $00
	nop                                              ; $5827: $00
	ld   d, a                                        ; $5828: $57

jr_007_5829:
	ld   e, b                                        ; $5829: $58
	ldi  (hl), a                                     ; $582a: $22
	nop                                              ; $582b: $00
	nop                                              ; $582c: $00
	ld   h, c                                        ; $582d: $61

jr_007_582e:
	ld   e, b                                        ; $582e: $58
	rst  $38                                         ; $582f: $ff
	rst  $38                                         ; $5830: $ff
	rst  $38                                         ; $5831: $ff
	ret  z                                           ; $5832: $c8

	ld   ($5807), sp                                 ; $5833: $08 $07 $58
	nop                                              ; $5836: $00
	ret  z                                           ; $5837: $c8

	dec  b                                           ; $5838: $05
	rlca                                             ; $5839: $07

jr_007_583a:
	ld   e, b                                        ; $583a: $58
	nop                                              ; $583b: $00
	adc  b                                           ; $583c: $88
	rlca                                             ; $583d: $07
	ld   e, b                                        ; $583e: $58
	nop                                              ; $583f: $00
	call nz, $4801                                   ; $5840: $c4 $01 $48
	ld   e, b                                        ; $5843: $58
	ret  z                                           ; $5844: $c8

	inc  d                                           ; $5845: $14

jr_007_5846:
	ld   c, c                                        ; $5846: $49
	ld   e, b                                        ; $5847: $58

jr_007_5848:
	nop                                              ; $5848: $00
	rst  $00                                         ; $5849: $c7
	add  d                                           ; $584a: $82

jr_007_584b:
	add  b                                           ; $584b: $80
	add  b                                           ; $584c: $80
	nop                                              ; $584d: $00
	call nz, Call_007_5601                           ; $584e: $c4 $01 $56
	ld   e, b                                        ; $5851: $58
	rst  $00                                         ; $5852: $c7
	sbc  $80                                         ; $5853: $de $80
	add  b                                           ; $5855: $80
	nop                                              ; $5856: $00

jr_007_5857:
	call nz, $5c20                                   ; $5857: $c4 $20 $5c
	ld   e, b                                        ; $585a: $58
	nop                                              ; $585b: $00
	rst  $00                                         ; $585c: $c7

jr_007_585d:
	sbc  h                                           ; $585d: $9c
	add  b                                           ; $585e: $80

jr_007_585f:
	add  b                                           ; $585f: $80
	nop                                              ; $5860: $00
	call nz, Call_007_6604                           ; $5861: $c4 $04 $66
	ld   e, b                                        ; $5864: $58
	nop                                              ; $5865: $00
	rst  $00                                         ; $5866: $c7
	sbc  h                                           ; $5867: $9c
	add  b                                           ; $5868: $80
	add  b                                           ; $5869: $80
	nop                                              ; $586a: $00
	inc  c                                           ; $586b: $0c
	ld   b, d                                        ; $586c: $42
	ld   a, (bc)                                     ; $586d: $0a
	ld   b, a                                        ; $586e: $47
	inc  bc                                          ; $586f: $03
	ld   b, c                                        ; $5870: $41
	ld   bc, $0144                                   ; $5871: $01 $44 $01
	ld   b, b                                        ; $5874: $40
	ld   e, $42                                      ; $5875: $1e $42
	ld   b, $0b                                      ; $5877: $06 $0b
	add  c                                           ; $5879: $81
	ld   (hl), h                                     ; $587a: $74
	ld   e, b                                        ; $587b: $58
	inc  c                                           ; $587c: $0c
	ld   b, d                                        ; $587d: $42
	ld   a, (bc)                                     ; $587e: $0a
	ld   b, a                                        ; $587f: $47
	inc  bc                                          ; $5880: $03
	ld   b, c                                        ; $5881: $41
	ld   (bc), a                                     ; $5882: $02
	ld   b, h                                        ; $5883: $44
	ld   bc, $80c3                                   ; $5884: $01 $c3 $80
	adc  a                                           ; $5887: $8f
	ld   e, b                                        ; $5888: $58
	dec  c                                           ; $5889: $0d
	ld   b, b                                        ; $588a: $40
	ldd  (hl), a                                     ; $588b: $32
	add  c                                           ; $588c: $81
	add  l                                           ; $588d: $85
	ld   e, b                                        ; $588e: $58
	ld   c, $40                                      ; $588f: $0e $40
	ldd  (hl), a                                     ; $5891: $32
	add  c                                           ; $5892: $81
	add  l                                           ; $5893: $85
	ld   e, b                                        ; $5894: $58
	inc  c                                           ; $5895: $0c
	ld   b, d                                        ; $5896: $42
	ld   a, (bc)                                     ; $5897: $0a
	ld   b, a                                        ; $5898: $47
	inc  bc                                          ; $5899: $03
	ld   b, c                                        ; $589a: $41
	inc  b                                           ; $589b: $04
	ld   b, h                                        ; $589c: $44
	ld   bc, $2040                                   ; $589d: $01 $40 $20
	ld   c, $81                                      ; $58a0: $0e $81
	sbc  (hl)                                        ; $58a2: $9e
	ld   e, b                                        ; $58a3: $58
	add  hl, bc                                      ; $58a4: $09
	ld   b, a                                        ; $58a5: $47
	ld   (bc), a                                     ; $58a6: $02
	ld   b, c                                        ; $58a7: $41
	ld   (bc), a                                     ; $58a8: $02
	inc  c                                           ; $58a9: $0c
	ld   b, h                                        ; $58aa: $44
	ld   bc, $ff40                                   ; $58ab: $01 $40 $ff
	rrca                                             ; $58ae: $0f
	add  c                                           ; $58af: $81
	xor  h                                           ; $58b0: $ac
	ld   e, b                                        ; $58b1: $58
	ld   d, l                                        ; $58b2: $55
	ld   d, b                                        ; $58b3: $50
	add  d                                           ; $58b4: $82
	cp   h                                           ; $58b5: $bc
	ld   e, b                                        ; $58b6: $58
	ld   b, d                                        ; $58b7: $42
	ld   bc, $b281                                   ; $58b8: $01 $81 $b2
	ld   e, b                                        ; $58bb: $58
	add  a                                           ; $58bc: $87
	rst  $00                                         ; $58bd: $c7
	ld   e, b                                        ; $58be: $58
	ld   b, d                                        ; $58bf: $42
	ld   e, $82                                      ; $58c0: $1e $82
	or   d                                           ; $58c2: $b2
	ld   e, b                                        ; $58c3: $58
	add  c                                           ; $58c4: $81
	or   d                                           ; $58c5: $b2
	ld   e, b                                        ; $58c6: $58
	ld   bc, $4801                                   ; $58c7: $01 $01 $48
	ld   h, l                                        ; $58ca: $65
	ld   a, c                                        ; $58cb: $79
	jr   nz, jr_007_5910                             ; $58cc: $20 $42

	ld   (hl), l                                     ; $58ce: $75
	ld   h, h                                        ; $58cf: $64
	ld   h, h                                        ; $58d0: $64
	ld   a, c                                        ; $58d1: $79
	ld   hl, $4901                                   ; $58d2: $21 $01 $49
	ld   h, (hl)                                     ; $58d5: $66
	jr   nz, jr_007_5951                             ; $58d6: $20 $79

	ld   l, a                                        ; $58d8: $6f
	ld   (hl), l                                     ; $58d9: $75
	jr   nz, jr_007_594a                             ; $58da: $20 $6e

	ld   h, l                                        ; $58dc: $65
	ld   h, l                                        ; $58dd: $65
	ld   h, h                                        ; $58de: $64
	ld   bc, $6c63                                   ; $58df: $01 $63 $6c
	ld   (hl), l                                     ; $58e2: $75
	ld   h, l                                        ; $58e3: $65
	ld   (hl), e                                     ; $58e4: $73
	jr   nz, jr_007_5956                             ; $58e5: $20 $6f

	ld   l, (hl)                                     ; $58e7: $6e
	jr   nz, jr_007_5961                             ; $58e8: $20 $77

	ld   l, b                                        ; $58ea: $68
	ld   h, c                                        ; $58eb: $61
	ld   (hl), h                                     ; $58ec: $74
	ld   bc, $6f74                                   ; $58ed: $01 $74 $6f
	jr   nz, jr_007_5956                             ; $58f0: $20 $64

	ld   l, a                                        ; $58f2: $6f
	jr   nz, $6e                                     ; $58f3: $20 $6e

	ld   h, l                                        ; $58f5: $65
	ld   a, b                                        ; $58f6: $78
	ld   (hl), h                                     ; $58f7: $74
	inc  l                                           ; $58f8: $2c
	ld   bc, $6f67                                   ; $58f9: $01 $67 $6f
	jr   nz, jr_007_5972                             ; $58fc: $20 $74

jr_007_58fe:
	ld   l, a                                        ; $58fe: $6f
	jr   nz, jr_007_5975                             ; $58ff: $20 $74

	ld   l, b                                        ; $5901: $68
	ld   h, l                                        ; $5902: $65
	ld   bc, $6863                                   ; $5903: $01 $63 $68
	ld   (hl), l                                     ; $5906: $75
	ld   (hl), d                                     ; $5907: $72
	ld   h, e                                        ; $5908: $63
	ld   l, b                                        ; $5909: $68
	jr   nz, jr_007_5975                             ; $590a: $20 $69

	ld   l, (hl)                                     ; $590c: $6e
	jr   nz, jr_007_5983                             ; $590d: $20 $74

	ld   l, b                                        ; $590f: $68

jr_007_5910:
	ld   h, l                                        ; $5910: $65
	ld   bc, $6f68                                   ; $5911: $01 $68 $6f
	ld   (hl), l                                     ; $5914: $75
	ld   (hl), e                                     ; $5915: $73
	ld   l, c                                        ; $5916: $69
	ld   l, (hl)                                     ; $5917: $6e
	ld   h, a                                        ; $5918: $67
	jr   nz, $61                                     ; $5919: $20 $61

	ld   (hl), d                                     ; $591b: $72
	ld   h, l                                        ; $591c: $65
	ld   h, c                                        ; $591d: $61
	ld   l, $01                                      ; $591e: $2e $01
	ld   c, c                                        ; $5920: $49
	ld   (hl), h                                     ; $5921: $74
	daa                                              ; $5922: $27
	ld   (hl), e                                     ; $5923: $73
	jr   nz, $65                                     ; $5924: $20 $65

	ld   h, c                                        ; $5926: $61
	ld   (hl), e                                     ; $5927: $73
	ld   (hl), h                                     ; $5928: $74
	jr   nz, jr_007_599a                             ; $5929: $20 $6f

	ld   h, (hl)                                     ; $592b: $66
	ld   bc, $6f64                                   ; $592c: $01 $64 $6f
	ld   (hl), a                                     ; $592f: $77
	ld   l, (hl)                                     ; $5930: $6e
	ld   (hl), h                                     ; $5931: $74
	ld   l, a                                        ; $5932: $6f
	ld   (hl), a                                     ; $5933: $77
	ld   l, (hl)                                     ; $5934: $6e
	ld   l, $ff                                      ; $5935: $2e $ff
	cp   $7f                                         ; $5937: $fe $7f
	add  hl, bc                                      ; $5939: $09
	ld   b, a                                        ; $593a: $47
	ld   (bc), a                                     ; $593b: $02
	ld   b, c                                        ; $593c: $41
	ld   (bc), a                                     ; $593d: $02
	inc  c                                           ; $593e: $0c
	daa                                              ; $593f: $27
	ld   b, d                                        ; $5940: $42
	ld   a, (bc)                                     ; $5941: $0a
	adc  l                                           ; $5942: $8d
	ld   bc, $c90a                                   ; $5943: $01 $0a $c9
	ret  nc                                          ; $5946: $d0

	adc  l                                           ; $5947: $8d
	ld   e, c                                        ; $5948: $59
	ret                                              ; $5949: $c9


jr_007_594a:
	ld   ($598d), sp                                 ; $594a: $08 $8d $59
	ret                                              ; $594d: $c9


	ld   e, h                                        ; $594e: $5c
	adc  a                                           ; $594f: $8f
	ld   e, c                                        ; $5950: $59

jr_007_5951:
	jp   Jump_007_59c0                               ; $5951: $c3 $c0 $59


	ld   e, c                                        ; $5954: $59
	rlca                                             ; $5955: $07

jr_007_5956:
	add  c                                           ; $5956: $81
	ld   l, d                                        ; $5957: $6a
	ld   e, c                                        ; $5958: $59
	jp   Jump_007_61aa                               ; $5959: $c3 $aa $61


	ld   e, c                                        ; $595c: $59
	ld   ($6a81), sp                                 ; $595d: $08 $81 $6a
	ld   e, c                                        ; $5960: $59

jr_007_5961:
	jp   Jump_007_6980                               ; $5961: $c3 $80 $69


	ld   e, c                                        ; $5964: $59
	dec  b                                           ; $5965: $05
	add  c                                           ; $5966: $81
	ld   l, d                                        ; $5967: $6a
	ld   e, c                                        ; $5968: $59
	ld   b, $c9                                      ; $5969: $06 $c9
	ret  nc                                          ; $596b: $d0

	adc  l                                           ; $596c: $8d
	ld   e, c                                        ; $596d: $59
	ret                                              ; $596e: $c9


	ld   ($598d), sp                                 ; $596f: $08 $8d $59

jr_007_5972:
	ret                                              ; $5972: $c9


	ld   e, h                                        ; $5973: $5c
	adc  a                                           ; $5974: $8f

jr_007_5975:
	ld   e, c                                        ; $5975: $59
	.db $c3 $aa $7f


	ld   e, c                                        ; $5979: $59
	ld   b, b                                        ; $597a: $40
	jr   nz, jr_007_58fe                             ; $597b: $20 $81

	ld   b, d                                        ; $597d: $42
	ld   e, c                                        ; $597e: $59
	jp   $8880                                       ; $597f: $c3 $80 $88


	ld   e, c                                        ; $5982: $59

jr_007_5983:
	ld   b, b                                        ; $5983: $40
	.db  $10                                         ; $5984: $10
	add  c                                           ; $5985: $81
	ld   b, d                                        ; $5986: $42
	ld   e, c                                        ; $5987: $59
	ld   b, b                                        ; $5988: $40
	ld   ($4281), sp                                 ; $5989: $08 $81 $42
	ld   e, c                                        ; $598c: $59
	ld   b, e                                        ; $598d: $43
	ld   d, c                                        ; $598e: $51
	ld   b, e                                        ; $598f: $43
	ld   d, d                                        ; $5990: $52
	ld   b, a                                        ; $5991: $47
	inc  b                                           ; $5992: $04
	add  hl, bc                                      ; $5993: $09
	daa                                              ; $5994: $27
	ret                                              ; $5995: $c9


	ld   ($599c), sp                                 ; $5996: $08 $9c $59
	add  c                                           ; $5999: $81

jr_007_599a:
	xor  a                                           ; $599a: $af
	ld   e, c                                        ; $599b: $59
	rlca                                             ; $599c: $07
	inc  c                                           ; $599d: $0c
	ld   d, $05                                      ; $599e: $16 $05
	ld   b, b                                        ; $59a0: $40
	inc  b                                           ; $59a1: $04
	rlca                                             ; $59a2: $07
	ret  nz                                          ; $59a3: $c0

	ld   d, h                                        ; $59a4: $54
	nop                                              ; $59a5: $00
	nop                                              ; $59a6: $00
	ld   b, d                                        ; $59a7: $42
	ld   c, e                                        ; $59a8: $4b
	ld   b, c                                        ; $59a9: $41
	inc  b                                           ; $59aa: $04
	ld   b, b                                        ; $59ab: $40
	.db  $10                                         ; $59ac: $10
	ld   b, e                                        ; $59ad: $43
	ld   d, b                                        ; $59ae: $50
	ld   ($160c), sp                                 ; $59af: $08 $0c $16
	dec  b                                           ; $59b2: $05
	ld   b, b                                        ; $59b3: $40
	inc  b                                           ; $59b4: $04
	ld   ($53c0), sp                                 ; $59b5: $08 $c0 $53
	nop                                              ; $59b8: $00
	nop                                              ; $59b9: $00
	ld   b, d                                        ; $59ba: $42
	ld   c, e                                        ; $59bb: $4b
	ld   b, c                                        ; $59bc: $41
	inc  b                                           ; $59bd: $04
	ld   b, b                                        ; $59be: $40
	.db  $10                                         ; $59bf: $10

Jump_007_59c0:
	ld   b, e                                        ; $59c0: $43
	ld   d, b                                        ; $59c1: $50
	ld   b, a                                        ; $59c2: $47
	inc  b                                           ; $59c3: $04
	add  hl, bc                                      ; $59c4: $09
	inc  c                                           ; $59c5: $0c
	daa                                              ; $59c6: $27
	dec  b                                           ; $59c7: $05
	ld   b, b                                        ; $59c8: $40
	ld   ($0242), sp                                 ; $59c9: $08 $42 $02
	ret  nz                                          ; $59cc: $c0

	ld   d, l                                        ; $59cd: $55
	nop                                              ; $59ce: $00
	nop                                              ; $59cf: $00
	ld   b, d                                        ; $59d0: $42
	dec  b                                           ; $59d1: $05
	ld   b, $40                                      ; $59d2: $06 $40
	ld   ($3242), sp                                 ; $59d4: $08 $42 $32
	ld   b, c                                        ; $59d7: $41
	inc  b                                           ; $59d8: $04
	ld   b, b                                        ; $59d9: $40
	.db  $10                                         ; $59da: $10
	ld   b, e                                        ; $59db: $43
	ld   d, b                                        ; $59dc: $50
	add  hl, bc                                      ; $59dd: $09
	inc  d                                           ; $59de: $14
	ld   bc, $4127                                   ; $59df: $01 $27 $41
	.db  $10                                         ; $59e2: $10
	inc  c                                           ; $59e3: $0c
	ld   ($0240), sp                                 ; $59e4: $08 $40 $02
	dec  b                                           ; $59e7: $05
	ld   b, b                                        ; $59e8: $40
	ld   (bc), a                                     ; $59e9: $02
	ret                                              ; $59ea: $c9


	or   h                                           ; $59eb: $b4
	ld   sp, hl                                      ; $59ec: $f9
	ld   e, c                                        ; $59ed: $59
	ret                                              ; $59ee: $c9


	inc  h                                           ; $59ef: $24
	ld   sp, hl                                      ; $59f0: $f9
	ld   e, c                                        ; $59f1: $59
	add  c                                           ; $59f2: $81
	.db  $e4                                         ; $59f3: $e4
	ld   e, c                                        ; $59f4: $59
	rlca                                             ; $59f5: $07
	add  c                                           ; $59f6: $81
	ld   a, ($0859)                                  ; $59f7: $fa $59 $08
	ld   b, b                                        ; $59fa: $40
	inc  b                                           ; $59fb: $04
	ld   b, $41                                      ; $59fc: $06 $41
	ld   bc, $1840                                   ; $59fe: $01 $40 $18
	dec  b                                           ; $5a01: $05
	ld   b, b                                        ; $5a02: $40
	inc  b                                           ; $5a03: $04
	ld   b, $40                                      ; $5a04: $06 $40
	inc  b                                           ; $5a06: $04
	dec  b                                           ; $5a07: $05
	ld   b, b                                        ; $5a08: $40
	ld   (bc), a                                     ; $5a09: $02
	ld   b, $40                                      ; $5a0a: $06 $40
	ld   (bc), a                                     ; $5a0c: $02
	nop                                              ; $5a0d: $00
	add  hl, bc                                      ; $5a0e: $09
	inc  d                                           ; $5a0f: $14
	daa                                              ; $5a10: $27
	ld   bc, $1041                                   ; $5a11: $01 $41 $10
	inc  c                                           ; $5a14: $0c
	rlca                                             ; $5a15: $07
	ld   b, b                                        ; $5a16: $40
	ld   (bc), a                                     ; $5a17: $02
	dec  b                                           ; $5a18: $05
	ld   b, b                                        ; $5a19: $40
	ld   (bc), a                                     ; $5a1a: $02
	ret                                              ; $5a1b: $c9


	or   h                                           ; $5a1c: $b4
	push af                                          ; $5a1d: $f5
	ld   e, c                                        ; $5a1e: $59
	ret                                              ; $5a1f: $c9


	inc  h                                           ; $5a20: $24
	push af                                          ; $5a21: $f5
	ld   e, c                                        ; $5a22: $59
	add  c                                           ; $5a23: $81
	dec  d                                           ; $5a24: $15
	ld   e, d                                        ; $5a25: $5a
	add  hl, bc                                      ; $5a26: $09
	inc  d                                           ; $5a27: $14
	daa                                              ; $5a28: $27
	ld   bc, $0841                                   ; $5a29: $01 $41 $08
	inc  c                                           ; $5a2c: $0c
	dec  b                                           ; $5a2d: $05
	ld   b, b                                        ; $5a2e: $40
	ld   (bc), a                                     ; $5a2f: $02
	ret                                              ; $5a30: $c9


	or   h                                           ; $5a31: $b4
	.db  $fc                                         ; $5a32: $fc
	ld   e, c                                        ; $5a33: $59
	add  c                                           ; $5a34: $81
	ld   l, $5a                                      ; $5a35: $2e $5a
	inc  c                                           ; $5a37: $0c
	ld   b, d                                        ; $5a38: $42
	ld   a, (bc)                                     ; $5a39: $0a
	ld   b, a                                        ; $5a3a: $47
	inc  bc                                          ; $5a3b: $03
	ld   b, c                                        ; $5a3c: $41
	inc  b                                           ; $5a3d: $04
	ld   b, h                                        ; $5a3e: $44
	ld   bc, $0a42                                   ; $5a3f: $01 $42 $0a
	ld   de, $4040                                   ; $5a42: $11 $40 $40
	.db  $10                                         ; $5a45: $10
	ld   b, b                                        ; $5a46: $40
	.db  $10                                         ; $5a47: $10
	adc  l                                           ; $5a48: $8d
	inc  bc                                          ; $5a49: $03
	ld   a, (bc)                                     ; $5a4a: $0a
	ret                                              ; $5a4b: $c9


	or   h                                           ; $5a4c: $b4
	ld   l, l                                        ; $5a4d: $6d
	ld   e, d                                        ; $5a4e: $5a
	ret                                              ; $5a4f: $c9


	cp   b                                           ; $5a50: $b8
	ld   l, a                                        ; $5a51: $6f
	ld   e, d                                        ; $5a52: $5a
	jp   nz, $4603                                   ; $5a53: $c2 $03 $46

	ld   e, d                                        ; $5a56: $5a
	ld   (de), a                                     ; $5a57: $12
	ld   b, b                                        ; $5a58: $40
	.db  $10                                         ; $5a59: $10
	adc  l                                           ; $5a5a: $8d
	inc  bc                                          ; $5a5b: $03
	ld   a, (bc)                                     ; $5a5c: $0a
	ret                                              ; $5a5d: $c9


	or   h                                           ; $5a5e: $b4
	ld   l, l                                        ; $5a5f: $6d
	ld   e, d                                        ; $5a60: $5a
	ret                                              ; $5a61: $c9


	cp   b                                           ; $5a62: $b8
	ld   l, a                                        ; $5a63: $6f
	ld   e, d                                        ; $5a64: $5a
	jp   nz, Jump_007_5803                           ; $5a65: $c2 $03 $58

	ld   e, d                                        ; $5a68: $5a
	inc  de                                          ; $5a69: $13
	add  c                                           ; $5a6a: $81
	ld   b, (hl)                                     ; $5a6b: $46
	ld   e, d                                        ; $5a6c: $5a
	ld   b, e                                        ; $5a6d: $43
	ld   c, h                                        ; $5a6e: $4c
	ld   b, e                                        ; $5a6f: $43
	ld   c, l                                        ; $5a70: $4d
	add  hl, bc                                      ; $5a71: $09
	inc  c                                           ; $5a72: $0c
	ld   b, a                                        ; $5a73: $47
	inc  b                                           ; $5a74: $04
	ld   d, $89                                      ; $5a75: $16 $89
	ld   b, a                                        ; $5a77: $47
	ld   d, $c3                                      ; $5a78: $16 $c3
	xor  d                                           ; $5a7a: $aa
	add  e                                           ; $5a7b: $83
	ld   e, d                                        ; $5a7c: $5a
	rst  $00                                         ; $5a7d: $c7
	sbc  b                                           ; $5a7e: $98
	add  b                                           ; $5a7f: $80
	add  b                                           ; $5a80: $80
	ld   b, e                                        ; $5a81: $43
	ld   ($80c3), sp                                 ; $5a82: $08 $c3 $80
	adc  l                                           ; $5a85: $8d
	ld   e, d                                        ; $5a86: $5a
	rst  $00                                         ; $5a87: $c7
	sbc  b                                           ; $5a88: $98
	add  b                                           ; $5a89: $80
	add  b                                           ; $5a8a: $80
	ld   b, e                                        ; $5a8b: $43
	ld   ($98c7), sp                                 ; $5a8c: $08 $c7 $98
	add  b                                           ; $5a8f: $80
	add  b                                           ; $5a90: $80
	ld   b, e                                        ; $5a91: $43
	ld   ($0c09), sp                                 ; $5a92: $08 $09 $0c
	ld   b, a                                        ; $5a95: $47
	inc  b                                           ; $5a96: $04
	ld   d, $89                                      ; $5a97: $16 $89
	ld   b, a                                        ; $5a99: $47
	ld   d, $c3                                      ; $5a9a: $16 $c3
	xor  d                                           ; $5a9c: $aa
	and  l                                           ; $5a9d: $a5
	ld   e, d                                        ; $5a9e: $5a
	rst  $00                                         ; $5a9f: $c7
	ld   d, b                                        ; $5aa0: $50
	add  b                                           ; $5aa1: $80
	add  b                                           ; $5aa2: $80
	ld   b, e                                        ; $5aa3: $43
	ld   ($80c3), sp                                 ; $5aa4: $08 $c3 $80
	xor  a                                           ; $5aa7: $af
	ld   e, d                                        ; $5aa8: $5a
	rst  $00                                         ; $5aa9: $c7
	ld   d, b                                        ; $5aaa: $50
	add  b                                           ; $5aab: $80
	add  b                                           ; $5aac: $80
	ld   b, e                                        ; $5aad: $43
	ld   ($50c7), sp                                 ; $5aae: $08 $c7 $50
	add  b                                           ; $5ab1: $80
	add  b                                           ; $5ab2: $80
	ld   b, e                                        ; $5ab3: $43
	ld   ($420c), sp                                 ; $5ab4: $08 $0c $42
	ld   a, (bc)                                     ; $5ab7: $0a
	ld   b, a                                        ; $5ab8: $47
	ld   (bc), a                                     ; $5ab9: $02
	ld   b, c                                        ; $5aba: $41
	inc  bc                                          ; $5abb: $03
	ld   b, h                                        ; $5abc: $44
	ld   bc, $32c3                                   ; $5abd: $01 $c3 $32
	sub  $5a                                         ; $5ac0: $d6 $5a
	ld   b, d                                        ; $5ac2: $42
	inc  d                                           ; $5ac3: $14
	jp   $cf80                                       ; $5ac4: $c3 $80 $cf


	ld   e, d                                        ; $5ac7: $5a
	dec  c                                           ; $5ac8: $0d
	ld   b, b                                        ; $5ac9: $40
	ldd  (hl), a                                     ; $5aca: $32
	rla                                              ; $5acb: $17
	add  c                                           ; $5acc: $81
	cp   (hl)                                        ; $5acd: $be
	ld   e, d                                        ; $5ace: $5a
	ld   c, $40                                      ; $5acf: $0e $40
	ldd  (hl), a                                     ; $5ad1: $32
	rla                                              ; $5ad2: $17
	add  c                                           ; $5ad3: $81
	cp   (hl)                                        ; $5ad4: $be
	ld   e, d                                        ; $5ad5: $5a
	jp   $de80                                       ; $5ad6: $c3 $80 $de


	ld   e, d                                        ; $5ad9: $5a
	ld   (de), a                                     ; $5ada: $12
	add  c                                           ; $5adb: $81
	cp   (hl)                                        ; $5adc: $be
	ld   e, d                                        ; $5add: $5a
	inc  de                                          ; $5ade: $13
	add  c                                           ; $5adf: $81
	cp   (hl)                                        ; $5ae0: $be
	ld   e, d                                        ; $5ae1: $5a
	inc  c                                           ; $5ae2: $0c
	ld   b, a                                        ; $5ae3: $47
	inc  bc                                          ; $5ae4: $03
	ld   b, c                                        ; $5ae5: $41
	ld   bc, $0144                                   ; $5ae6: $01 $44 $01
	ld   b, d                                        ; $5ae9: $42
	ld   e, $0f                                      ; $5aea: $1e $0f
	ld   b, b                                        ; $5aec: $40
	jr   nz, $0d                                     ; $5aed: $20 $0d

	ld   b, c                                        ; $5aef: $41
	ld   (bc), a                                     ; $5af0: $02
	ld   b, b                                        ; $5af1: $40
	rst  $38                                         ; $5af2: $ff
	rla                                              ; $5af3: $17
	add  c                                           ; $5af4: $81
	pop  af                                          ; $5af5: $f1
	ld   e, d                                        ; $5af6: $5a
	ld   b, c                                        ; $5af7: $41
	inc  b                                           ; $5af8: $04
	ld   b, d                                        ; $5af9: $42
	rrca                                             ; $5afa: $0f
	jp   $f980                                       ; $5afb: $c3 $80 $f9


	ld   e, d                                        ; $5afe: $5a
	.db  $10                                         ; $5aff: $10
	jp   $0bc0                                       ; $5b00: $c3 $c0 $0b


	ld   e, e                                        ; $5b03: $5b
	ret  nz                                          ; $5b04: $c0

	inc  c                                           ; $5b05: $0c
	nop                                              ; $5b06: $00
	nop                                              ; $5b07: $00
	add  c                                           ; $5b08: $81
	ld   sp, hl                                      ; $5b09: $f9
	ld   e, d                                        ; $5b0a: $5a
	jp   $16aa                                       ; $5b0b: $c3 $aa $16


	ld   e, e                                        ; $5b0e: $5b
	ret  nz                                          ; $5b0f: $c0

	dec  c                                           ; $5b10: $0d
	nop                                              ; $5b11: $00
	nop                                              ; $5b12: $00
	add  c                                           ; $5b13: $81
	ld   sp, hl                                      ; $5b14: $f9
	ld   e, d                                        ; $5b15: $5a
	jp   $2180                                       ; $5b16: $c3 $80 $21


	ld   e, e                                        ; $5b19: $5b
	ret  nz                                          ; $5b1a: $c0

	ld   c, $00                                      ; $5b1b: $0e $00
	nop                                              ; $5b1d: $00
	add  c                                           ; $5b1e: $81
	ld   sp, hl                                      ; $5b1f: $f9
	ld   e, d                                        ; $5b20: $5a
	ret  nz                                          ; $5b21: $c0

	rrca                                             ; $5b22: $0f
	nop                                              ; $5b23: $00
	nop                                              ; $5b24: $00
	add  c                                           ; $5b25: $81
	ld   sp, hl                                      ; $5b26: $f9
	ld   e, d                                        ; $5b27: $5a
	ld   b, c                                        ; $5b28: $41
	inc  bc                                          ; $5b29: $03
	add  c                                           ; $5b2a: $81
	add  hl, sp                                      ; $5b2b: $39
	ld   e, e                                        ; $5b2c: $5b
	ld   b, c                                        ; $5b2d: $41
	ld   (bc), a                                     ; $5b2e: $02
	add  c                                           ; $5b2f: $81
	add  hl, sp                                      ; $5b30: $39
	ld   e, e                                        ; $5b31: $5b
	ld   b, c                                        ; $5b32: $41
	dec  b                                           ; $5b33: $05
	add  c                                           ; $5b34: $81
	add  hl, sp                                      ; $5b35: $39
	ld   e, e                                        ; $5b36: $5b
	ld   b, c                                        ; $5b37: $41
	ld   b, $01                                      ; $5b38: $06 $01
	inc  bc                                          ; $5b3a: $03
	jp   $4caa                                       ; $5b3b: $c3 $aa $4c


	ld   e, e                                        ; $5b3e: $5b
	.db $c3 $80 $49


	ld   e, e                                        ; $5b42: $5b
	adc  c                                           ; $5b43: $89
	xor  c                                           ; $5b44: $a9
	ld   d, $81                                      ; $5b45: $16 $81
	ld   c, h                                        ; $5b47: $4c
	ld   e, e                                        ; $5b48: $5b
	adc  c                                           ; $5b49: $89
	cp   d                                           ; $5b4a: $ba
	ld   d, $c3                                      ; $5b4b: $16 $c3
	xor  d                                           ; $5b4d: $aa
	ld   d, e                                        ; $5b4e: $53
	ld   e, e                                        ; $5b4f: $5b
	add  c                                           ; $5b50: $81
	ld   h, b                                        ; $5b51: $60
	ld   e, e                                        ; $5b52: $5b
	jp   Jump_007_5d80                               ; $5b53: $c3 $80 $5d


	ld   e, e                                        ; $5b56: $5b
	ld   b, $40                                      ; $5b57: $06 $40
	.db  $10                                         ; $5b59: $10
	add  c                                           ; $5b5a: $81
	ld   h, b                                        ; $5b5b: $60
	ld   e, e                                        ; $5b5c: $5b
	dec  b                                           ; $5b5d: $05
	ld   b, b                                        ; $5b5e: $40
	.db  $10                                         ; $5b5f: $10
	.db  $10                                         ; $5b60: $10
	inc  c                                           ; $5b61: $0c
	ld   b, a                                        ; $5b62: $47
	inc  bc                                          ; $5b63: $03
	ld   b, h                                        ; $5b64: $44
	ld   bc, $ff40                                   ; $5b65: $01 $40 $ff
	nop                                              ; $5b68: $00
	add  hl, bc                                      ; $5b69: $09
	inc  bc                                          ; $5b6a: $03
	ld   b, a                                        ; $5b6b: $47
	ld   (bc), a                                     ; $5b6c: $02
	ld   b, c                                        ; $5b6d: $41
	inc  b                                           ; $5b6e: $04
	ld   b, h                                        ; $5b6f: $44
	inc  b                                           ; $5b70: $04
	inc  c                                           ; $5b71: $0c
	ld   b, d                                        ; $5b72: $42
	inc  d                                           ; $5b73: $14
	ld   b, b                                        ; $5b74: $40
	ld   b, b                                        ; $5b75: $40
	rrca                                             ; $5b76: $0f
	ld   b, d                                        ; $5b77: $42
	inc  bc                                          ; $5b78: $03
	ld   b, b                                        ; $5b79: $40
	ld   b, b                                        ; $5b7a: $40
	rrca                                             ; $5b7b: $0f
	ld   b, d                                        ; $5b7c: $42
	inc  bc                                          ; $5b7d: $03
	ld   b, b                                        ; $5b7e: $40
	ld   b, b                                        ; $5b7f: $40
	rrca                                             ; $5b80: $0f
	add  c                                           ; $5b81: $81
	ld   (hl), d                                     ; $5b82: $72
	ld   e, e                                        ; $5b83: $5b
	add  hl, bc                                      ; $5b84: $09
	ld   b, a                                        ; $5b85: $47
	ld   (bc), a                                     ; $5b86: $02
	ld   b, c                                        ; $5b87: $41
	ld   (bc), a                                     ; $5b88: $02
	ld   b, h                                        ; $5b89: $44
	ld   (bc), a                                     ; $5b8a: $02
	inc  c                                           ; $5b8b: $0c
	ld   de, $1040                                   ; $5b8c: $11 $40 $10
	.db  $10                                         ; $5b8f: $10
	ld   b, b                                        ; $5b90: $40
	.db  $10                                         ; $5b91: $10
	ld   b, e                                        ; $5b92: $43
	ld   de, $4709                                   ; $5b93: $11 $09 $47
	ld   (bc), a                                     ; $5b96: $02
	ld   b, h                                        ; $5b97: $44
	ld   (bc), a                                     ; $5b98: $02
	inc  c                                           ; $5b99: $0c
	ld   b, d                                        ; $5b9a: $42
	ld   a, (bc)                                     ; $5b9b: $0a
	ld   d, $46                                      ; $5b9c: $16 $46
	ld   (de), a                                     ; $5b9e: $12
	adc  c                                           ; $5b9f: $89
	inc  b                                           ; $5ba0: $04
	ld   d, $42                                      ; $5ba1: $16 $42
	jr   z, jr_007_5be8                              ; $5ba3: $28 $43

	.db  $10                                         ; $5ba5: $10
	inc  c                                           ; $5ba6: $0c
	daa                                              ; $5ba7: $27
	ld   bc, $0441                                   ; $5ba8: $01 $41 $04
	ld   b, h                                        ; $5bab: $44
	inc  b                                           ; $5bac: $04
	ld   b, b                                        ; $5bad: $40
	rst  $38                                         ; $5bae: $ff
	nop                                              ; $5baf: $00
	add  hl, bc                                      ; $5bb0: $09
	inc  d                                           ; $5bb1: $14
	inc  c                                           ; $5bb2: $0c
	ld   b, h                                        ; $5bb3: $44
	ld   (bc), a                                     ; $5bb4: $02
	ld   bc, $0341                                   ; $5bb5: $01 $41 $03
	daa                                              ; $5bb8: $27
	adc  c                                           ; $5bb9: $89
	dec  c                                           ; $5bba: $0d
	ld   d, $42                                      ; $5bbb: $16 $42
	jr   z, jr_007_5bcf                              ; $5bbd: $28 $10

	ld   b, b                                        ; $5bbf: $40
	inc  b                                           ; $5bc0: $04
	ld   de, $0440                                   ; $5bc1: $11 $40 $04
	jp   nz, $be05                                   ; $5bc4: $c2 $05 $be

	ld   e, e                                        ; $5bc7: $5b
	adc  c                                           ; $5bc8: $89
	dec  c                                           ; $5bc9: $0d
	ld   d, $81                                      ; $5bca: $16 $81
	cp   (hl)                                        ; $5bcc: $be
	ld   e, e                                        ; $5bcd: $5b
	ld   b, a                                        ; $5bce: $47

jr_007_5bcf:
	inc  bc                                          ; $5bcf: $03
	ld   b, h                                        ; $5bd0: $44
	inc  b                                           ; $5bd1: $04
	inc  bc                                          ; $5bd2: $03
	inc  c                                           ; $5bd3: $0c
	ld   b, d                                        ; $5bd4: $42
	ld   a, (bc)                                     ; $5bd5: $0a
	ld   b, b                                        ; $5bd6: $40
	add  b                                           ; $5bd7: $80
	rla                                              ; $5bd8: $17
	jp   $e280                                       ; $5bd9: $c3 $80 $e2


	ld   e, e                                        ; $5bdc: $5b
	ld   b, c                                        ; $5bdd: $41
	ld   (bc), a                                     ; $5bde: $02
	add  c                                           ; $5bdf: $81
	sub  $5b                                         ; $5be0: $d6 $5b
	jp   $eb80                                       ; $5be2: $c3 $80 $eb


	ld   e, e                                        ; $5be5: $5b
	ld   b, c                                        ; $5be6: $41
	inc  bc                                          ; $5be7: $03

jr_007_5be8:
	add  c                                           ; $5be8: $81
	sub  $5b                                         ; $5be9: $d6 $5b
	jp   $f480                                       ; $5beb: $c3 $80 $f4


	ld   e, e                                        ; $5bee: $5b
	ld   b, c                                        ; $5bef: $41
	inc  b                                           ; $5bf0: $04
	add  c                                           ; $5bf1: $81
	sub  $5b                                         ; $5bf2: $d6 $5b
	ld   b, c                                        ; $5bf4: $41
	dec  b                                           ; $5bf5: $05
	add  c                                           ; $5bf6: $81
	sub  $5b                                         ; $5bf7: $d6 $5b
	add  hl, bc                                      ; $5bf9: $09
	ld   b, a                                        ; $5bfa: $47
	inc  bc                                          ; $5bfb: $03
	dec  b                                           ; $5bfc: $05
	inc  c                                           ; $5bfd: $0c
	ld   b, d                                        ; $5bfe: $42
	inc  b                                           ; $5bff: $04
	add  c                                           ; $5c00: $81
	cp   $5b                                         ; $5c01: $fe $5b
	inc  c                                           ; $5c03: $0c
	ld   b, d                                        ; $5c04: $42
	ld   a, (bc)                                     ; $5c05: $0a
	ld   b, a                                        ; $5c06: $47
	inc  bc                                          ; $5c07: $03
	ld   b, c                                        ; $5c08: $41
	ld   (bc), a                                     ; $5c09: $02
	ld   b, h                                        ; $5c0a: $44
	inc  b                                           ; $5c0b: $04
	ld   (de), a                                     ; $5c0c: $12
	inc  de                                          ; $5c0d: $13
	add  c                                           ; $5c0e: $81
	inc  c                                           ; $5c0f: $0c
	ld   e, h                                        ; $5c10: $5c
	inc  c                                           ; $5c11: $0c
	ld   b, d                                        ; $5c12: $42
	ld   a, (bc)                                     ; $5c13: $0a
	ld   b, a                                        ; $5c14: $47
	ld   (bc), a                                     ; $5c15: $02
	ld   b, c                                        ; $5c16: $41
	inc  bc                                          ; $5c17: $03
	ld   b, h                                        ; $5c18: $44
	ld   bc, $ff40                                   ; $5c19: $01 $40 $ff
	rla                                              ; $5c1c: $17
	ld   b, d                                        ; $5c1d: $42
	ld   bc, $1a81                                   ; $5c1e: $01 $81 $1a
	ld   e, h                                        ; $5c21: $5c
	ret  z                                           ; $5c22: $c8

	inc  d                                           ; $5c23: $14
	add  hl, hl                                      ; $5c24: $29
	ld   e, h                                        ; $5c25: $5c
	add  c                                           ; $5c26: $81
	dec  l                                           ; $5c27: $2d
	ld   e, h                                        ; $5c28: $5c
	call nz, $2e01                                   ; $5c29: $c4 $01 $2e
	ld   e, h                                        ; $5c2c: $5c
	nop                                              ; $5c2d: $00
	ld   b, d                                        ; $5c2e: $42
	inc  d                                           ; $5c2f: $14
	ret  nz                                          ; $5c30: $c0

	dec  e                                           ; $5c31: $1d
	nop                                              ; $5c32: $00
	nop                                              ; $5c33: $00
	jp   nz, $2e06                                   ; $5c34: $c2 $06 $2e

	ld   e, h                                        ; $5c37: $5c
	jr   z, jr_007_5c3a                              ; $5c38: $28 $00

jr_007_5c3a:
	inc  c                                           ; $5c3a: $0c
	ld   b, d                                        ; $5c3b: $42
	ld   a, (bc)                                     ; $5c3c: $0a
	ld   b, c                                        ; $5c3d: $41
	ld   bc, $0144                                   ; $5c3e: $01 $44 $01
	ld   b, a                                        ; $5c41: $47
	inc  bc                                          ; $5c42: $03
	ld   b, b                                        ; $5c43: $40
	.db  $10                                         ; $5c44: $10
	jp   $4d7f                                       ; $5c45: $c3 $7f $4d


	ld   e, h                                        ; $5c48: $5c
	dec  c                                           ; $5c49: $0d
	add  c                                           ; $5c4a: $81
	ld   b, e                                        ; $5c4b: $43
	ld   e, h                                        ; $5c4c: $5c
	ld   c, $81                                      ; $5c4d: $0e $81
	ld   b, e                                        ; $5c4f: $43
	ld   e, h                                        ; $5c50: $5c
	ld   b, c                                        ; $5c51: $41
	ld   (bc), a                                     ; $5c52: $02
	add  l                                           ; $5c53: $85
	sub  c                                           ; $5c54: $91
	ld   e, h                                        ; $5c55: $5c
	rst  $00                                         ; $5c56: $c7
	ld   c, h                                        ; $5c57: $4c
	add  b                                           ; $5c58: $80
	add  b                                           ; $5c59: $80
	adc  c                                           ; $5c5a: $89
	dec  e                                           ; $5c5b: $1d
	ld   d, $42                                      ; $5c5c: $16 $42
	inc  bc                                          ; $5c5e: $03
	ld   b, b                                        ; $5c5f: $40
	.db  $10                                         ; $5c60: $10
	adc  $10                                         ; $5c61: $ce $10
	ld   l, b                                        ; $5c63: $68
	ld   e, h                                        ; $5c64: $5c
	add  c                                           ; $5c65: $81
	ld   d, (hl)                                     ; $5c66: $56
	ld   e, h                                        ; $5c67: $5c
	rst  $00                                         ; $5c68: $c7
	ld   c, h                                        ; $5c69: $4c
	add  b                                           ; $5c6a: $80
	add  b                                           ; $5c6b: $80
	adc  c                                           ; $5c6c: $89
	dec  e                                           ; $5c6d: $1d
	ld   d, $0a                                      ; $5c6e: $16 $0a
	ld   b, b                                        ; $5c70: $40
	rst  $38                                         ; $5c71: $ff
	add  c                                           ; $5c72: $81
	ld   l, a                                        ; $5c73: $6f
	ld   e, h                                        ; $5c74: $5c
	ld   b, c                                        ; $5c75: $41
	inc  bc                                          ; $5c76: $03
	add  l                                           ; $5c77: $85
	sub  c                                           ; $5c78: $91
	ld   e, h                                        ; $5c79: $5c
	rst  $00                                         ; $5c7a: $c7
	call z, $8080                                    ; $5c7b: $cc $80 $80
	adc  c                                           ; $5c7e: $89
	dec  e                                           ; $5c7f: $1d
	ld   d, $42                                      ; $5c80: $16 $42
	ld   (bc), a                                     ; $5c82: $02
	ld   b, b                                        ; $5c83: $40
	.db  $10                                         ; $5c84: $10
	jp   $8d80                                       ; $5c85: $c3 $80 $8d


	ld   e, h                                        ; $5c88: $5c
	dec  c                                           ; $5c89: $0d
	add  c                                           ; $5c8a: $81
	ld   a, d                                        ; $5c8b: $7a
	ld   e, h                                        ; $5c8c: $5c
	ld   c, $81                                      ; $5c8d: $0e $81
	ld   a, d                                        ; $5c8f: $7a
	ld   e, h                                        ; $5c90: $5c
	inc  c                                           ; $5c91: $0c
	ld   b, d                                        ; $5c92: $42
	ld   a, (bc)                                     ; $5c93: $0a
	ld   b, h                                        ; $5c94: $44
	ld   bc, $0347                                   ; $5c95: $01 $47 $03
	ld   b, d                                        ; $5c98: $42
	ld   a, (bc)                                     ; $5c99: $0a
	inc  h                                           ; $5c9a: $24
	call nz, Call_007_6502                           ; $5c9b: $c4 $02 $65
	ld   c, (hl)                                     ; $5c9e: $4e
	inc  c                                           ; $5c9f: $0c
	ld   b, d                                        ; $5ca0: $42
	ld   a, (bc)                                     ; $5ca1: $0a
	ld   b, a                                        ; $5ca2: $47
	ld   (bc), a                                     ; $5ca3: $02
	ld   b, c                                        ; $5ca4: $41
	ld   (bc), a                                     ; $5ca5: $02
	ld   b, h                                        ; $5ca6: $44
	ld   c, $40                                      ; $5ca7: $0e $40
	rst  $38                                         ; $5ca9: $ff
	jp   $b2aa                                       ; $5caa: $c3 $aa $b2


	ld   e, h                                        ; $5cad: $5c
	rla                                              ; $5cae: $17
	add  c                                           ; $5caf: $81
	xor  b                                           ; $5cb0: $a8
	ld   e, h                                        ; $5cb1: $5c
	jp   $ba7f                                       ; $5cb2: $c3 $7f $ba


	ld   e, h                                        ; $5cb5: $5c
	dec  c                                           ; $5cb6: $0d
	add  c                                           ; $5cb7: $81
	xor  b                                           ; $5cb8: $a8
	ld   e, h                                        ; $5cb9: $5c
	ld   c, $81                                      ; $5cba: $0e $81
	xor  b                                           ; $5cbc: $a8

jr_007_5cbd:
	ld   e, h                                        ; $5cbd: $5c
	call nz, Call_007_6502                           ; $5cbe: $c4 $02 $65
	ld   c, (hl)                                     ; $5cc1: $4e
	inc  c                                           ; $5cc2: $0c
	ld   b, h                                        ; $5cc3: $44
	ld   c, $42                                      ; $5cc4: $0e $42
	ld   bc, $c581                                   ; $5cc6: $01 $81 $c5
	ld   e, h                                        ; $5cc9: $5c
	inc  c                                           ; $5cca: $0c
	ld   b, d                                        ; $5ccb: $42
	ld   a, (bc)                                     ; $5ccc: $0a
	ld   b, a                                        ; $5ccd: $47
	inc  bc                                          ; $5cce: $03
	ld   b, c                                        ; $5ccf: $41
	ld   (bc), a                                     ; $5cd0: $02
	ld   b, h                                        ; $5cd1: $44
	ld   (bc), a                                     ; $5cd2: $02
	.db  $10                                         ; $5cd3: $10
	ld   b, b                                        ; $5cd4: $40
	jr   nz, jr_007_5ce8                             ; $5cd5: $20 $11

	ld   b, b                                        ; $5cd7: $40
	jr   nz, -$3d                                    ; $5cd8: $20 $c3

	add  b                                           ; $5cda: $80
	sbc  $5c                                         ; $5cdb: $de $5c
	.db  $10                                         ; $5cdd: $10
	ld   b, (hl)                                     ; $5cde: $46
	ld   h, $89                                      ; $5cdf: $26 $89
	ld   h, c                                        ; $5ce1: $61
	ld   d, $42                                      ; $5ce2: $16 $42
	ld   a, (bc)                                     ; $5ce4: $0a
	ld   b, (hl)                                     ; $5ce5: $46
	ld   h, $89                                      ; $5ce6: $26 $89

jr_007_5ce8:
	ld   h, c                                        ; $5ce8: $61
	ld   d, $42                                      ; $5ce9: $16 $42
	ld   a, (bc)                                     ; $5ceb: $0a
	ld   b, (hl)                                     ; $5cec: $46
	ld   h, $89                                      ; $5ced: $26 $89
	ld   h, c                                        ; $5cef: $61
	ld   d, $42                                      ; $5cf0: $16 $42
	ld   a, (bc)                                     ; $5cf2: $0a
	rrca                                             ; $5cf3: $0f
	ld   b, b                                        ; $5cf4: $40
	ld   b, d                                        ; $5cf5: $42
	dec  b                                           ; $5cf6: $05
	add  c                                           ; $5cf7: $81
	.db  $d3                                         ; $5cf8: $d3
	ld   e, h                                        ; $5cf9: $5c
	daa                                              ; $5cfa: $27
	inc  c                                           ; $5cfb: $0c
	ld   b, c                                        ; $5cfc: $41
	inc  b                                           ; $5cfd: $04
	ld   bc, $0444                                   ; $5cfe: $01 $44 $04
	ld   b, b                                        ; $5d01: $40
	rst  $38                                         ; $5d02: $ff
	nop                                              ; $5d03: $00

jr_007_5d04:
	add  hl, bc                                      ; $5d04: $09
	inc  c                                           ; $5d05: $0c
	ld   b, c                                        ; $5d06: $41
	inc  b                                           ; $5d07: $04
	ld   bc, $0644                                   ; $5d08: $01 $44 $06
	ld   b, b                                        ; $5d0b: $40
	rst  $38                                         ; $5d0c: $ff
	nop                                              ; $5d0d: $00
	add  hl, bc                                      ; $5d0e: $09
	add  c                                           ; $5d0f: $81
	ld   a, ($0c5c)                                  ; $5d10: $fa $5c $0c
	ld   b, d                                        ; $5d13: $42
	ld   a, (bc)                                     ; $5d14: $0a
	ld   b, a                                        ; $5d15: $47
	inc  bc                                          ; $5d16: $03
	ld   b, c                                        ; $5d17: $41
	inc  bc                                          ; $5d18: $03
	ld   b, h                                        ; $5d19: $44
	ld   (bc), a                                     ; $5d1a: $02
	ld   (de), a                                     ; $5d1b: $12
	inc  de                                          ; $5d1c: $13
	ld   b, d                                        ; $5d1d: $42
	ld   e, $81                                      ; $5d1e: $1e $81
	dec  de                                          ; $5d20: $1b
	ld   e, l                                        ; $5d21: $5d
	inc  c                                           ; $5d22: $0c
	adc  c                                           ; $5d23: $89
	ld   a, (bc)                                     ; $5d24: $0a
	jr   jr_007_5d69                                 ; $5d25: $18 $42

	ld   a, (bc)                                     ; $5d27: $0a
	ld   b, a                                        ; $5d28: $47
	inc  bc                                          ; $5d29: $03
	ld   b, c                                        ; $5d2a: $41
	ld   (bc), a                                     ; $5d2b: $02
	ld   b, h                                        ; $5d2c: $44
	ld   (bc), a                                     ; $5d2d: $02
	ld   b, b                                        ; $5d2e: $40
	rst  $38                                         ; $5d2f: $ff
	jp   $3855                                       ; $5d30: $c3 $55 $38


	ld   e, l                                        ; $5d33: $5d
	rla                                              ; $5d34: $17
	add  c                                           ; $5d35: $81
	ld   l, $5d                                      ; $5d36: $2e $5d
	adc  c                                           ; $5d38: $89
	ld   a, (bc)                                     ; $5d39: $0a
	jr   jr_007_5cbd                                 ; $5d3a: $18 $81

	ld   l, $5d                                      ; $5d3c: $2e $5d
	inc  c                                           ; $5d3e: $0c
	ld   b, d                                        ; $5d3f: $42
	ld   a, (bc)                                     ; $5d40: $0a
	ld   b, c                                        ; $5d41: $41
	inc  bc                                          ; $5d42: $03
	ld   b, a                                        ; $5d43: $47
	inc  bc                                          ; $5d44: $03
	ld   b, h                                        ; $5d45: $44
	inc  b                                           ; $5d46: $04
	ld   b, b                                        ; $5d47: $40
	and  b                                           ; $5d48: $a0
	dec  c                                           ; $5d49: $0d
	add  c                                           ; $5d4a: $81
	ld   b, a                                        ; $5d4b: $47
	ld   e, l                                        ; $5d4c: $5d
	inc  c                                           ; $5d4d: $0c
	ld   b, d                                        ; $5d4e: $42
	ld   a, (bc)                                     ; $5d4f: $0a
	ld   b, c                                        ; $5d50: $41
	inc  b                                           ; $5d51: $04
	ld   b, a                                        ; $5d52: $47
	inc  bc                                          ; $5d53: $03
	ld   b, h                                        ; $5d54: $44
	inc  b                                           ; $5d55: $04
	ld   b, b                                        ; $5d56: $40
	ld   b, b                                        ; $5d57: $40
	ld   c, $40                                      ; $5d58: $0e $40
	ld   b, b                                        ; $5d5a: $40
	dec  c                                           ; $5d5b: $0d
	ld   b, b                                        ; $5d5c: $40
	ld   b, b                                        ; $5d5d: $40
	dec  c                                           ; $5d5e: $0d
	ld   b, b                                        ; $5d5f: $40
	ld   b, b                                        ; $5d60: $40
	ld   c, $40                                      ; $5d61: $0e $40
	ld   b, b                                        ; $5d63: $40
	ld   c, $40                                      ; $5d64: $0e $40
	ld   b, b                                        ; $5d66: $40
	dec  c                                           ; $5d67: $0d
	ld   b, b                                        ; $5d68: $40

jr_007_5d69:
	ld   b, b                                        ; $5d69: $40
	rrca                                             ; $5d6a: $0f
	add  c                                           ; $5d6b: $81
	ld   d, (hl)                                     ; $5d6c: $56
	ld   e, l                                        ; $5d6d: $5d
	inc  c                                           ; $5d6e: $0c
	add  hl, bc                                      ; $5d6f: $09
	ld   b, d                                        ; $5d70: $42
	ld   a, (bc)                                     ; $5d71: $0a
	ld   b, c                                        ; $5d72: $41
	inc  bc                                          ; $5d73: $03
	ld   b, a                                        ; $5d74: $47
	inc  bc                                          ; $5d75: $03
	ld   de, $8582                                   ; $5d76: $11 $82 $85
	ld   e, l                                        ; $5d79: $5d
	ld   b, b                                        ; $5d7a: $40
	jr   jr_007_5d8d                                 ; $5d7b: $18 $10

	add  d                                           ; $5d7d: $82
	add  l                                           ; $5d7e: $85
	ld   e, l                                        ; $5d7f: $5d

Jump_007_5d80:
	ld   b, b                                        ; $5d80: $40
	jr   jr_007_5d04                                 ; $5d81: $18 $81

	.db  $76                                         ; $5d83: $76
	ld   e, l                                        ; $5d84: $5d
	ld   c, a                                        ; $5d85: $4f
	dec  b                                           ; $5d86: $05
	ld   b, d                                        ; $5d87: $42
	dec  l                                           ; $5d88: $2d
	ld   b, e                                        ; $5d89: $43
	daa                                              ; $5d8a: $27
	ret  z                                           ; $5d8b: $c8

	.db  $10                                         ; $5d8c: $10

jr_007_5d8d:
	cp   c                                           ; $5d8d: $b9
	ld   e, l                                        ; $5d8e: $5d
	ld   bc, $1409                                   ; $5d8f: $01 $09 $14
	ld   b, d                                        ; $5d92: $42
	rst  $38                                         ; $5d93: $ff
	jp   nz, $9203                                   ; $5d94: $c2 $03 $92

	ld   e, l                                        ; $5d97: $5d
	inc  c                                           ; $5d98: $0c
	rst  $00                                         ; $5d99: $c7
	adc  l                                           ; $5d9a: $8d
	add  b                                           ; $5d9b: $80
	add  b                                           ; $5d9c: $80
	ld   b, c                                        ; $5d9d: $41
	ld   (bc), a                                     ; $5d9e: $02

jr_007_5d9f:
	ld   b, h                                        ; $5d9f: $44
	ld   (bc), a                                     ; $5da0: $02
	ld   b, b                                        ; $5da1: $40
	rst  $38                                         ; $5da2: $ff
	nop                                              ; $5da3: $00
	ret  z                                           ; $5da4: $c8

	.db  $10                                         ; $5da5: $10
	cp   c                                           ; $5da6: $b9
	ld   e, l                                        ; $5da7: $5d

jr_007_5da8:
	add  hl, bc                                      ; $5da8: $09
	ld   bc, $4214                                   ; $5da9: $01 $14 $42
	rst  $38                                         ; $5dac: $ff
	jp   nz, $ab03                                   ; $5dad: $c2 $03 $ab

	ld   e, l                                        ; $5db0: $5d

jr_007_5db1:
	inc  c                                           ; $5db1: $0c
	rst  $00                                         ; $5db2: $c7
	nop                                              ; $5db3: $00
	add  b                                           ; $5db4: $80
	add  b                                           ; $5db5: $80
	add  c                                           ; $5db6: $81
	sbc  l                                           ; $5db7: $9d
	ld   e, l                                        ; $5db8: $5d
	rst  $00                                         ; $5db9: $c7

jr_007_5dba:
	nop                                              ; $5dba: $00
	add  b                                           ; $5dbb: $80

jr_007_5dbc:
	add  b                                           ; $5dbc: $80
	nop                                              ; $5dbd: $00
	inc  c                                           ; $5dbe: $0c
	ld   b, d                                        ; $5dbf: $42
	ld   a, (bc)                                     ; $5dc0: $0a
	ld   b, h                                        ; $5dc1: $44
	ld   (bc), a                                     ; $5dc2: $02
	ld   b, a                                        ; $5dc3: $47
	inc  bc                                          ; $5dc4: $03
	ld   b, c                                        ; $5dc5: $41
	ld   bc, $2040                                   ; $5dc6: $01 $40 $20
	jp   $c780                                       ; $5dc9: $c3 $80 $c7


	ld   e, l                                        ; $5dcc: $5d
	ld   b, c                                        ; $5dcd: $41
	ld   (bc), a                                     ; $5dce: $02
	rrca                                             ; $5dcf: $0f
	ld   b, b                                        ; $5dd0: $40
	jr   nz, -$3d                                    ; $5dd1: $20 $c3

	add  b                                           ; $5dd3: $80
	ret  nc                                          ; $5dd4: $d0

	ld   e, l                                        ; $5dd5: $5d
	ld   b, c                                        ; $5dd6: $41
	inc  bc                                          ; $5dd7: $03
	rrca                                             ; $5dd8: $0f
	ld   b, b                                        ; $5dd9: $40
	jr   nz, jr_007_5d9f                             ; $5dda: $20 $c3

	add  b                                           ; $5ddc: $80
	reti                                             ; $5ddd: $d9


	ld   e, l                                        ; $5dde: $5d
	ld   b, c                                        ; $5ddf: $41
	inc  b                                           ; $5de0: $04
	rrca                                             ; $5de1: $0f
	ld   b, b                                        ; $5de2: $40
	jr   nz, jr_007_5da8                             ; $5de3: $20 $c3

	add  b                                           ; $5de5: $80
	ld   ($ff00+c), a                                ; $5de6: $e2
	ld   e, l                                        ; $5de7: $5d
	ld   b, c                                        ; $5de8: $41
	inc  bc                                          ; $5de9: $03
	rrca                                             ; $5dea: $0f
	ld   b, b                                        ; $5deb: $40
	jr   nz, jr_007_5db1                             ; $5dec: $20 $c3

	add  b                                           ; $5dee: $80
	.db  $eb                                         ; $5def: $eb
	ld   e, l                                        ; $5df0: $5d
	ld   b, c                                        ; $5df1: $41
	ld   (bc), a                                     ; $5df2: $02
	rrca                                             ; $5df3: $0f
	ld   b, b                                        ; $5df4: $40
	jr   nz, jr_007_5dba                             ; $5df5: $20 $c3

	add  b                                           ; $5df7: $80
	.db  $f4                                         ; $5df8: $f4
	ld   e, l                                        ; $5df9: $5d
	rrca                                             ; $5dfa: $0f
	add  c                                           ; $5dfb: $81
	push bc                                          ; $5dfc: $c5
	ld   e, l                                        ; $5dfd: $5d
	ld   b, a                                        ; $5dfe: $47
	inc  bc                                          ; $5dff: $03
	ld   b, h                                        ; $5e00: $44
	ld   (bc), a                                     ; $5e01: $02
	ld   b, c                                        ; $5e02: $41
	inc  bc                                          ; $5e03: $03
	inc  c                                           ; $5e04: $0c
	ld   b, b                                        ; $5e05: $40
	.db  $10                                         ; $5e06: $10
	ld   c, $ce                                      ; $5e07: $0e $ce
	.db  $10                                         ; $5e09: $10
	ld   (de), a                                     ; $5e0a: $12
	ld   e, (hl)                                     ; $5e0b: $5e
	dec  bc                                          ; $5e0c: $0b
	dec  bc                                          ; $5e0d: $0b
	dec  bc                                          ; $5e0e: $0b
	add  c                                           ; $5e0f: $81
	dec  b                                           ; $5e10: $05
	ld   e, (hl)                                     ; $5e11: $5e
	dec  c                                           ; $5e12: $0d
	add  c                                           ; $5e13: $81
	inc  c                                           ; $5e14: $0c
	ld   e, (hl)                                     ; $5e15: $5e
	ld   b, a                                        ; $5e16: $47
	inc  b                                           ; $5e17: $04
	ld   b, h                                        ; $5e18: $44
	ld   bc, $0141                                   ; $5e19: $01 $41 $01
	add  hl, bc                                      ; $5e1c: $09
	inc  c                                           ; $5e1d: $0c
	ld   b, b                                        ; $5e1e: $40
	rst  $38                                         ; $5e1f: $ff
	rrca                                             ; $5e20: $0f
	add  c                                           ; $5e21: $81
	ld   e, $5e                                      ; $5e22: $1e $5e
	add  hl, bc                                      ; $5e24: $09
	ld   b, h                                        ; $5e25: $44
	ld   (bc), a                                     ; $5e26: $02
	ld   d, $47                                      ; $5e27: $16 $47
	inc  bc                                          ; $5e29: $03
	inc  c                                           ; $5e2a: $0c
	jp   $34aa                                       ; $5e2b: $c3 $aa $34


	ld   e, (hl)                                     ; $5e2e: $5e
	ld   b, d                                        ; $5e2f: $42
	ld   a, (bc)                                     ; $5e30: $0a
	add  c                                           ; $5e31: $81
	ccf                                              ; $5e32: $3f
	ld   e, (hl)                                     ; $5e33: $5e
	jp   $3d80                                       ; $5e34: $c3 $80 $3d


	ld   e, (hl)                                     ; $5e37: $5e
	ld   b, d                                        ; $5e38: $42
	jr   z, jr_007_5dbc                              ; $5e39: $28 $81

	ccf                                              ; $5e3b: $3f
	ld   e, (hl)                                     ; $5e3c: $5e
	ld   b, d                                        ; $5e3d: $42
	inc  d                                           ; $5e3e: $14
	add  hl, bc                                      ; $5e3f: $09
	ld   d, $89                                      ; $5e40: $16 $89
	ld   h, c                                        ; $5e42: $61
	ld   d, $c3                                      ; $5e43: $16 $c3
	add  b                                           ; $5e45: $80
	ld   c, l                                        ; $5e46: $4d
	ld   e, (hl)                                     ; $5e47: $5e
	ld   b, (hl)                                     ; $5e48: $46
	ld   e, b                                        ; $5e49: $58
	add  c                                           ; $5e4a: $81
	ld   c, a                                        ; $5e4b: $4f
	ld   e, (hl)                                     ; $5e4c: $5e
	ld   b, (hl)                                     ; $5e4d: $46
	ld   e, c                                        ; $5e4e: $59
	ld   b, d                                        ; $5e4f: $42
	dec  b                                           ; $5e50: $05
	add  hl, bc                                      ; $5e51: $09
	ld   d, $89                                      ; $5e52: $16 $89
	ld   h, c                                        ; $5e54: $61
	ld   d, $c3                                      ; $5e55: $16 $c3
	add  b                                           ; $5e57: $80
	ld   e, a                                        ; $5e58: $5f
	ld   e, (hl)                                     ; $5e59: $5e
	ld   b, (hl)                                     ; $5e5a: $46
	ld   e, b                                        ; $5e5b: $58
	add  c                                           ; $5e5c: $81
	dec  hl                                          ; $5e5d: $2b
	ld   e, (hl)                                     ; $5e5e: $5e
	ld   b, (hl)                                     ; $5e5f: $46
	ld   e, c                                        ; $5e60: $59
	add  c                                           ; $5e61: $81
	dec  hl                                          ; $5e62: $2b
	ld   e, (hl)                                     ; $5e63: $5e
	add  hl, bc                                      ; $5e64: $09
	sub  b                                           ; $5e65: $90
	ld   (bc), a                                     ; $5e66: $02
	nop                                              ; $5e67: $00
	inc  c                                           ; $5e68: $0c
	add  c                                           ; $5e69: $81
	sbc  a                                           ; $5e6a: $9f
	ld   h, e                                        ; $5e6b: $63
	add  hl, bc                                      ; $5e6c: $09
	inc  c                                           ; $5e6d: $0c
	adc  c                                           ; $5e6e: $89
	ld   e, b                                        ; $5e6f: $58
	ld   d, $42                                      ; $5e70: $16 $42
	dec  b                                           ; $5e72: $05
	rst  $00                                         ; $5e73: $c7
	nop                                              ; $5e74: $00
	add  b                                           ; $5e75: $80
	add  b                                           ; $5e76: $80
	nop                                              ; $5e77: $00
	add  hl, bc                                      ; $5e78: $09
	inc  c                                           ; $5e79: $0c
	adc  c                                           ; $5e7a: $89
	ld   e, b                                        ; $5e7b: $58
	ld   d, $42                                      ; $5e7c: $16 $42
	dec  b                                           ; $5e7e: $05
	nop                                              ; $5e7f: $00
	rra                                              ; $5e80: $1f
	add  hl, bc                                      ; $5e81: $09
	inc  c                                           ; $5e82: $0c
	add  c                                           ; $5e83: $81
	sbc  a                                           ; $5e84: $9f
	ld   h, e                                        ; $5e85: $63
	add  hl, bc                                      ; $5e86: $09
	ld   d, h                                        ; $5e87: $54
	rst  $38                                         ; $5e88: $ff
	dec  b                                           ; $5e89: $05
	ld   bc, $420c                                   ; $5e8a: $01 $0c $42
	ld   e, $89                                      ; $5e8d: $1e $89
	ld   a, ($ff00+c)                                ; $5e8f: $f2
	dec  d                                           ; $5e90: $15
	ld   b, c                                        ; $5e91: $41
	ld   bc, $1040                                   ; $5e92: $01 $40 $10
	ld   b, c                                        ; $5e95: $41
	ld   (bc), a                                     ; $5e96: $02
	ld   b, b                                        ; $5e97: $40
	ld   ($0341), sp                                 ; $5e98: $08 $41 $03
	ld   b, b                                        ; $5e9b: $40
	ld   ($0441), sp                                 ; $5e9c: $08 $41 $04
	ld   b, b                                        ; $5e9f: $40
	ld   ($0541), sp                                 ; $5ea0: $08 $41 $05
	ld   b, b                                        ; $5ea3: $40
	ld   ($0641), sp                                 ; $5ea4: $08 $41 $06
	ld   b, b                                        ; $5ea7: $40
	ld   (bitTable), sp                                 ; $5ea8: $08 $41 $07
	ld   b, b                                        ; $5eab: $40
	ld   ($0841), sp                                 ; $5eac: $08 $41 $08
	ld   b, b                                        ; $5eaf: $40
	ld   d, b                                        ; $5eb0: $50
	ld   d, h                                        ; $5eb1: $54
	ld   bc, $4700                                   ; $5eb2: $01 $00 $47
	inc  b                                           ; $5eb5: $04
	dec  e                                           ; $5eb6: $1d
	ld   bc, $8d0c                                   ; $5eb7: $01 $0c $8d
	ld   bc, $091e                                   ; $5eba: $01 $1e $09
	dec  b                                           ; $5ebd: $05
	ld   b, b                                        ; $5ebe: $40
	ld   bc, $0142                                   ; $5ebf: $01 $42 $01
	ld   b, b                                        ; $5ec2: $40
	ld   bc, $0142                                   ; $5ec3: $01 $42 $01

jr_007_5ec6:
	ld   b, b                                        ; $5ec6: $40
	ld   bc, $0142                                   ; $5ec7: $01 $42 $01
	ld   b, $40                                      ; $5eca: $06 $40
	ld   bc, $0142                                   ; $5ecc: $01 $42 $01
	ld   b, b                                        ; $5ecf: $40
	ld   bc, $0142                                   ; $5ed0: $01 $42 $01
	ld   b, b                                        ; $5ed3: $40
	ld   bc, $0142                                   ; $5ed4: $01 $42 $01
	ld   b, b                                        ; $5ed7: $40
	ld   bc, $0142                                   ; $5ed8: $01 $42 $01
	ld   b, b                                        ; $5edb: $40
	ld   bc, $0142                                   ; $5edc: $01 $42 $01
	ld   b, b                                        ; $5edf: $40
	ld   bc, $0142                                   ; $5ee0: $01 $42 $01
	dec  b                                           ; $5ee3: $05
	ld   b, b                                        ; $5ee4: $40
	ld   bc, $0142                                   ; $5ee5: $01 $42 $01
	ld   b, b                                        ; $5ee8: $40
	ld   bc, $0142                                   ; $5ee9: $01 $42 $01
	ld   b, b                                        ; $5eec: $40
	ld   bc, $0142                                   ; $5eed: $01 $42 $01
	add  c                                           ; $5ef0: $81
	cp   l                                           ; $5ef1: $bd
	ld   e, (hl)                                     ; $5ef2: $5e
	call nz, Call_007_5601                           ; $5ef3: $c4 $01 $56
	ld   e, a                                        ; $5ef6: $5f
	ld   b, c                                        ; $5ef7: $41
	inc  bc                                          ; $5ef8: $03
	ld   d, c                                        ; $5ef9: $51
	ld   sp, $3050                                   ; $5efa: $31 $50 $30
	add  c                                           ; $5efd: $81
	ld   d, $5f                                      ; $5efe: $16 $5f
	ld   b, b                                        ; $5f00: $40
	jr   nz, jr_007_5ec6                             ; $5f01: $20 $c3

	jr   nz, jr_007_5f2f                             ; $5f03: $20 $2a

	ld   e, a                                        ; $5f05: $5f
	jp   $1620                                       ; $5f06: $c3 $20 $16


	ld   e, a                                        ; $5f09: $5f
	jp   $1280                                       ; $5f0a: $c3 $80 $12


	ld   e, a                                        ; $5f0d: $5f
	dec  c                                           ; $5f0e: $0d
	add  c                                           ; $5f0f: $81
	nop                                              ; $5f10: $00
	ld   e, a                                        ; $5f11: $5f
	ld   c, $81                                      ; $5f12: $0e $81
	nop                                              ; $5f14: $00
	ld   e, a                                        ; $5f15: $5f
	ld   bc, $500c                                   ; $5f16: $01 $0c $50
	jr   nc, jr_007_5f20                             ; $5f19: $30 $05

	ld   b, b                                        ; $5f1b: $40
	ld   ($4206), sp                                 ; $5f1c: $08 $06 $42
	ld   a, (bc)                                     ; $5f1f: $0a

jr_007_5f20:
	ld   b, $40                                      ; $5f20: $06 $40
	ld   ($3051), sp                                 ; $5f22: $08 $51 $30
	inc  b                                           ; $5f25: $04
	ld   (bc), a                                     ; $5f26: $02
	add  c                                           ; $5f27: $81
	nop                                              ; $5f28: $00
	ld   e, a                                        ; $5f29: $5f
	ret  nz                                          ; $5f2a: $c0

	ld   bc, $0000                                   ; $5f2b: $01 $00 $00
	add  c                                           ; $5f2e: $81

jr_007_5f2f:
	ld   b, $5f                                      ; $5f2f: $06 $5f
	call nz, $5701                                   ; $5f31: $c4 $01 $57
	ld   e, a                                        ; $5f34: $5f
	inc  d                                           ; $5f35: $14
	dec  e                                           ; $5f36: $1d
	inc  bc                                          ; $5f37: $03
	add  hl, bc                                      ; $5f38: $09
	inc  c                                           ; $5f39: $0c
	ld   d, l                                        ; $5f3a: $55
	ld   e, l                                        ; $5f3b: $5d
	ld   b, d                                        ; $5f3c: $42
	ld   bc, $30c8                                   ; $5f3d: $01 $c8 $30
	ld   c, c                                        ; $5f40: $49
	ld   e, a                                        ; $5f41: $5f
	ret  z                                           ; $5f42: $c8

	ld   sp, $5f56                                   ; $5f43: $31 $56 $5f
	add  c                                           ; $5f46: $81
	ldd  a, (hl)                                     ; $5f47: $3a
	ld   e, a                                        ; $5f48: $5f
	ld   b, d                                        ; $5f49: $42
	ld   bc, $31c8                                   ; $5f4a: $01 $c8 $31
	ld   d, (hl)                                     ; $5f4d: $56
	ld   e, a                                        ; $5f4e: $5f
	ret  z                                           ; $5f4f: $c8

	jr   nc, jr_007_5f9b                             ; $5f50: $30 $49

	ld   e, a                                        ; $5f52: $5f
	add  c                                           ; $5f53: $81
	ldd  a, (hl)                                     ; $5f54: $3a
	ld   e, a                                        ; $5f55: $5f
	nop                                              ; $5f56: $00
	rst  $00                                         ; $5f57: $c7

jr_007_5f58:
	add  l                                           ; $5f58: $85
	ld   ($0002), sp                                 ; $5f59: $08 $02 $00
	inc  d                                           ; $5f5c: $14
	add  hl, bc                                      ; $5f5d: $09
	inc  c                                           ; $5f5e: $0c
	ld   d, b                                        ; $5f5f: $50
	ld   sp, $4216                                   ; $5f60: $31 $16 $42
	dec  b                                           ; $5f63: $05
	inc  b                                           ; $5f64: $04
	rst  $00                                         ; $5f65: $c7
	add  l                                           ; $5f66: $85
	ld   ($8902), sp                                 ; $5f67: $08 $02 $89
	rst  $10                                         ; $5f6a: $d7
	dec  d                                           ; $5f6b: $15
	nop                                              ; $5f6c: $00
	ld   d, c                                        ; $5f6d: $51
	jr   nc, jr_007_5fc1                             ; $5f6e: $30 $51

	ld   sp, $c401                                   ; $5f70: $31 $01 $c4

jr_007_5f73:
	ld   (bc), a                                     ; $5f73: $02
	pop  bc                                          ; $5f74: $c1
	ld   e, a                                        ; $5f75: $5f
	ld   b, c                                        ; $5f76: $41
	.db  $10                                         ; $5f77: $10
	ld   b, b                                        ; $5f78: $40
	.db  $10                                         ; $5f79: $10
	add  d                                           ; $5f7a: $82
	add  l                                           ; $5f7b: $85
	ld   e, a                                        ; $5f7c: $5f
	ret                                              ; $5f7d: $c9


	nop                                              ; $5f7e: $00
	sub  c                                           ; $5f7f: $91
	ld   e, a                                        ; $5f80: $5f
	ret                                              ; $5f81: $c9


	sbc  h                                           ; $5f82: $9c
	xor  c                                           ; $5f83: $a9
	ld   e, a                                        ; $5f84: $5f
	jp   $8d80                                       ; $5f85: $c3 $80 $8d


	ld   e, a                                        ; $5f88: $5f
	dec  c                                           ; $5f89: $0d
	add  c                                           ; $5f8a: $81
	ld   a, b                                        ; $5f8b: $78
	ld   e, a                                        ; $5f8c: $5f
	ld   c, $81                                      ; $5f8d: $0e $81
	ld   a, b                                        ; $5f8f: $78
	ld   e, a                                        ; $5f90: $5f
	jp   $9833                                       ; $5f91: $c3 $33 $98


	ld   e, a                                        ; $5f94: $5f
	add  c                                           ; $5f95: $81
	add  l                                           ; $5f96: $85
	ld   e, a                                        ; $5f97: $5f
	rst  $00                                         ; $5f98: $c7
	inc  d                                           ; $5f99: $14
	add  b                                           ; $5f9a: $80

jr_007_5f9b:
	add  b                                           ; $5f9b: $80
	adc  c                                           ; $5f9c: $89
	ld   e, a                                        ; $5f9d: $5f
	rla                                              ; $5f9e: $17
	adc  l                                           ; $5f9f: $8d
	ld   d, b                                        ; $5fa0: $50
	ld   a, b                                        ; $5fa1: $78
	rst  $00                                         ; $5fa2: $c7
	nop                                              ; $5fa3: $00
	add  b                                           ; $5fa4: $80
	add  b                                           ; $5fa5: $80
	add  c                                           ; $5fa6: $81
	ld   a, b                                        ; $5fa7: $78

jr_007_5fa8:
	ld   e, a                                        ; $5fa8: $5f
	jp   $b033                                       ; $5fa9: $c3 $33 $b0


	ld   e, a                                        ; $5fac: $5f
	add  c                                           ; $5fad: $81
	add  l                                           ; $5fae: $85
	ld   e, a                                        ; $5faf: $5f
	rst  $00                                         ; $5fb0: $c7
	inc  d                                           ; $5fb1: $14
	add  b                                           ; $5fb2: $80
	add  b                                           ; $5fb3: $80
	adc  c                                           ; $5fb4: $89
	ld   e, a                                        ; $5fb5: $5f
	rla                                              ; $5fb6: $17
	adc  l                                           ; $5fb7: $8d
	ld   d, b                                        ; $5fb8: $50
	ld   a, b                                        ; $5fb9: $78
	rst  $00                                         ; $5fba: $c7
	sbc  l                                           ; $5fbb: $9d
	add  b                                           ; $5fbc: $80
	add  b                                           ; $5fbd: $80
	add  c                                           ; $5fbe: $81
	ld   a, b                                        ; $5fbf: $78
	ld   e, a                                        ; $5fc0: $5f

jr_007_5fc1:
	rst  $00                                         ; $5fc1: $c7
	add  h                                           ; $5fc2: $84
	inc  c                                           ; $5fc3: $0c
	ld   bc, $c400                                   ; $5fc4: $01 $00 $c4
	ld   (bc), a                                     ; $5fc7: $02
	ld   h, l                                        ; $5fc8: $65
	ld   c, (hl)                                     ; $5fc9: $4e
	ld   b, d                                        ; $5fca: $42
	ld   a, (bc)                                     ; $5fcb: $0a
	ret  z                                           ; $5fcc: $c8

	jr   nc, jr_007_5fa8                             ; $5fcd: $30 $d9

	ld   e, a                                        ; $5fcf: $5f
	ret  z                                           ; $5fd0: $c8

	ld   sp, $5fe7                                   ; $5fd1: $31 $e7 $5f
	ld   d, b                                        ; $5fd4: $50
	jr   nc, jr_007_5f58                             ; $5fd5: $30 $81

	dec  c                                           ; $5fd7: $0d
	ld   h, b                                        ; $5fd8: $60
	ret  z                                           ; $5fd9: $c8

	ld   sp, $5fef                                   ; $5fda: $31 $ef $5f
	ld   d, c                                        ; $5fdd: $51
	jr   nc, jr_007_6030                             ; $5fde: $30 $50

	ld   sp, $d789                                   ; $5fe0: $31 $89 $d7

jr_007_5fe3:
	dec  d                                           ; $5fe3: $15
	add  c                                           ; $5fe4: $81
	dec  c                                           ; $5fe5: $0d
	ld   h, b                                        ; $5fe6: $60
	ld   d, b                                        ; $5fe7: $50
	jr   nc, jr_007_5f73                             ; $5fe8: $30 $89

	rst  $10                                         ; $5fea: $d7
	dec  d                                           ; $5feb: $15
	add  c                                           ; $5fec: $81
	dec  c                                           ; $5fed: $0d
	ld   h, b                                        ; $5fee: $60
	adc  c                                           ; $5fef: $89
	rst  $10                                         ; $5ff0: $d7
	dec  d                                           ; $5ff1: $15
	inc  b                                           ; $5ff2: $04
	ret  nz                                          ; $5ff3: $c0

	inc  bc                                          ; $5ff4: $03
	add  b                                           ; $5ff5: $80
	add  b                                           ; $5ff6: $80
	ld   b, d                                        ; $5ff7: $42
	rrca                                             ; $5ff8: $0f
	rst  $00                                         ; $5ff9: $c7
	add  h                                           ; $5ffa: $84
	inc  c                                           ; $5ffb: $0c
	ld   bc, $8589                                   ; $5ffc: $01 $89 $85
	ld   d, $42                                      ; $5fff: $16 $42
	ld   (bc), a                                     ; $6001: $02
	adc  c                                           ; $6002: $89
	add  l                                           ; $6003: $85
	ld   d, $42                                      ; $6004: $16 $42
	ld   (bc), a                                     ; $6006: $02
	adc  c                                           ; $6007: $89
	add  l                                           ; $6008: $85
	ld   d, $42                                      ; $6009: $16 $42
	ld   (bc), a                                     ; $600b: $02
	nop                                              ; $600c: $00
	inc  b                                           ; $600d: $04
	jp   $18c0                                       ; $600e: $c3 $c0 $18


	ld   h, b                                        ; $6011: $60
	add  b                                           ; $6012: $80
	jr   nc, jr_007_6025                             ; $6013: $30 $10

	add  c                                           ; $6015: $81
	cpl                                              ; $6016: $2f
	ld   h, b                                        ; $6017: $60
	jp   $22aa                                       ; $6018: $c3 $aa $22


	ld   h, b                                        ; $601b: $60
	add  b                                           ; $601c: $80
	ld   h, b                                        ; $601d: $60
	ld   (hl), b                                     ; $601e: $70
	add  c                                           ; $601f: $81
	cpl                                              ; $6020: $2f
	ld   h, b                                        ; $6021: $60
	jp   $2c80                                       ; $6022: $c3 $80 $2c


jr_007_6025:
	ld   h, b                                        ; $6025: $60
	add  b                                           ; $6026: $80
	and  b                                           ; $6027: $a0
	ld   d, b                                        ; $6028: $50
	add  c                                           ; $6029: $81
	cpl                                              ; $602a: $2f
	ld   h, b                                        ; $602b: $60
	add  b                                           ; $602c: $80
	ldh  (<$10), a                                   ; $602d: $e0 $10
	add  d                                           ; $602f: $82

jr_007_6030:
	dec  c                                           ; $6030: $0d
	ld   h, b                                        ; $6031: $60
	ret                                              ; $6032: $c9


	nop                                              ; $6033: $00
	add  hl, sp                                      ; $6034: $39
	ld   h, b                                        ; $6035: $60
	add  c                                           ; $6036: $81
	dec  c                                           ; $6037: $0d
	ld   h, b                                        ; $6038: $60
	ld   b, a                                        ; $6039: $47
	inc  bc                                          ; $603a: $03
	ld   b, h                                        ; $603b: $44
	ld   (bc), a                                     ; $603c: $02
	ld   b, c                                        ; $603d: $41
	inc  bc                                          ; $603e: $03
	inc  c                                           ; $603f: $0c
	ld   b, b                                        ; $6040: $40
	.db  $10                                         ; $6041: $10
	ld   c, $ce                                      ; $6042: $0e $ce
	.db  $10                                         ; $6044: $10
	ld   c, l                                        ; $6045: $4d
	ld   h, b                                        ; $6046: $60
	dec  bc                                          ; $6047: $0b
	dec  bc                                          ; $6048: $0b
	dec  bc                                          ; $6049: $0b
	add  c                                           ; $604a: $81
	ld   b, b                                        ; $604b: $40
	ld   h, b                                        ; $604c: $60
	dec  c                                           ; $604d: $0d
	add  c                                           ; $604e: $81
	ld   b, a                                        ; $604f: $47
	ld   h, b                                        ; $6050: $60
	call nz, $9820                                   ; $6051: $c4 $20 $98
	ld   h, b                                        ; $6054: $60
	ld   b, d                                        ; $6055: $42
	ld   a, (bc)                                     ; $6056: $0a
	ret  z                                           ; $6057: $c8

	jr   nc, $64                                     ; $6058: $30 $64

	ld   h, b                                        ; $605a: $60
	ret  z                                           ; $605b: $c8

	ld   sp, $6072                                   ; $605c: $31 $72 $60
	ld   d, b                                        ; $605f: $50
	jr   nc, jr_007_5fe3                             ; $6060: $30 $81

	ret                                              ; $6062: $c9


	ld   h, b                                        ; $6063: $60
	ret  z                                           ; $6064: $c8

	ld   sp, $607a                                   ; $6065: $31 $7a $60
	ld   d, c                                        ; $6068: $51
	jr   nc, jr_007_60bb                             ; $6069: $30 $50

	ld   sp, $d789                                   ; $606b: $31 $89 $d7
	dec  d                                           ; $606e: $15
	add  c                                           ; $606f: $81
	sbc  l                                           ; $6070: $9d
	ld   h, b                                        ; $6071: $60
	ld   d, b                                        ; $6072: $50
	jr   nc, -$77                                    ; $6073: $30 $89

	rst  $10                                         ; $6075: $d7
	dec  d                                           ; $6076: $15
	add  c                                           ; $6077: $81
	sbc  l                                           ; $6078: $9d
	ld   h, b                                        ; $6079: $60
	adc  c                                           ; $607a: $89
	rst  $10                                         ; $607b: $d7
	dec  d                                           ; $607c: $15
	inc  b                                           ; $607d: $04
	ret  nz                                          ; $607e: $c0

	inc  bc                                          ; $607f: $03
	add  b                                           ; $6080: $80
	add  b                                           ; $6081: $80
	ld   b, d                                        ; $6082: $42
	rrca                                             ; $6083: $0f
	rst  $00                                         ; $6084: $c7
	add  h                                           ; $6085: $84
	ld   c, $01                                      ; $6086: $0e $01
	adc  c                                           ; $6088: $89
	add  l                                           ; $6089: $85
	ld   d, $42                                      ; $608a: $16 $42
	ld   (bc), a                                     ; $608c: $02
	adc  c                                           ; $608d: $89
	add  l                                           ; $608e: $85
	ld   d, $42                                      ; $608f: $16 $42
	ld   (bc), a                                     ; $6091: $02
	adc  c                                           ; $6092: $89
	add  l                                           ; $6093: $85
	ld   d, $42                                      ; $6094: $16 $42
	ld   (bc), a                                     ; $6096: $02
	nop                                              ; $6097: $00
	rst  $00                                         ; $6098: $c7
	add  h                                           ; $6099: $84
	ld   c, $01                                      ; $609a: $0e $01
	nop                                              ; $609c: $00
	inc  b                                           ; $609d: $04
	jp   $a8c0                                       ; $609e: $c3 $c0 $a8


	ld   h, b                                        ; $60a1: $60
	add  b                                           ; $60a2: $80
	or   b                                           ; $60a3: $b0
	ld   d, b                                        ; $60a4: $50
	add  c                                           ; $60a5: $81
	cp   a                                           ; $60a6: $bf
	ld   h, b                                        ; $60a7: $60
	jp   $b2aa                                       ; $60a8: $c3 $aa $b2


	ld   h, b                                        ; $60ab: $60
	add  b                                           ; $60ac: $80
	ld   b, b                                        ; $60ad: $40
	sub  b                                           ; $60ae: $90
	add  c                                           ; $60af: $81
	cp   a                                           ; $60b0: $bf
	ld   h, b                                        ; $60b1: $60
	jp   $bc80                                       ; $60b2: $c3 $80 $bc


	ld   h, b                                        ; $60b5: $60
	add  b                                           ; $60b6: $80
	ld   (hl), b                                     ; $60b7: $70
	ld   (hl), b                                     ; $60b8: $70
	add  c                                           ; $60b9: $81
	cp   a                                           ; $60ba: $bf

jr_007_60bb:
	ld   h, b                                        ; $60bb: $60
	add  b                                           ; $60bc: $80
	jr   nz, jr_007_60ef                             ; $60bd: $20 $30

	add  d                                           ; $60bf: $82
	sbc  l                                           ; $60c0: $9d
	ld   h, b                                        ; $60c1: $60
	ret                                              ; $60c2: $c9


	nop                                              ; $60c3: $00
	ret                                              ; $60c4: $c9


	ld   h, b                                        ; $60c5: $60
	add  c                                           ; $60c6: $81
	sbc  l                                           ; $60c7: $9d
	ld   h, b                                        ; $60c8: $60
	inc  c                                           ; $60c9: $0c
	ld   b, c                                        ; $60ca: $41
	inc  b                                           ; $60cb: $04
	ld   b, h                                        ; $60cc: $44
	ld   c, $40                                      ; $60cd: $0e $40
	.db  $10                                         ; $60cf: $10
	adc  $10                                         ; $60d0: $ce $10
	ld   ($ff00+c), a                                ; $60d2: $e2
	ld   h, b                                        ; $60d3: $60
	jp   $db2a                                       ; $60d4: $c3 $2a $db


	ld   h, b                                        ; $60d7: $60
	add  c                                           ; $60d8: $81
	adc  $60                                         ; $60d9: $ce $60
	ret  nz                                          ; $60db: $c0

	ld   h, h                                        ; $60dc: $64
	nop                                              ; $60dd: $00
	ld   ($058d), sp                                 ; $60de: $08 $8d $05
	ld   a, (bc)                                     ; $60e1: $0a
	rrca                                             ; $60e2: $0f
	add  c                                           ; $60e3: $81
	adc  $60                                         ; $60e4: $ce $60
	ld   bc, $0c09                                   ; $60e6: $01 $09 $0c
	ld   b, c                                        ; $60e9: $41
	inc  bc                                          ; $60ea: $03
	ld   b, h                                        ; $60eb: $44
	inc  b                                           ; $60ec: $04
	ld   b, $40                                      ; $60ed: $06 $40

jr_007_60ef:
	rst  $38                                         ; $60ef: $ff
	ld   b, e                                        ; $60f0: $43
	ld   e, d                                        ; $60f1: $5a
	add  hl, bc                                      ; $60f2: $09
	inc  c                                           ; $60f3: $0c
	adc  c                                           ; $60f4: $89
	rst  $10                                         ; $60f5: $d7
	dec  d                                           ; $60f6: $15
	ld   d, $00                                      ; $60f7: $16 $00
	ld   d, c                                        ; $60f9: $51
	jr   nc, $51                                     ; $60fa: $30 $51

	ld   sp, $20c4                                   ; $60fc: $31 $c4 $20
	ld   h, l                                        ; $60ff: $65
	ld   c, (hl)                                     ; $6100: $4e
	inc  c                                           ; $6101: $0c
	ld   b, c                                        ; $6102: $41
	inc  bc                                          ; $6103: $03
	ld   b, h                                        ; $6104: $44
	ld   ($1040), sp                                 ; $6105: $08 $40 $10
	adc  $10                                         ; $6108: $ce $10
	ld   a, b                                        ; $610a: $78
	ld   h, c                                        ; $610b: $61
	jp   $1333                                       ; $610c: $c3 $33 $13


	ld   h, c                                        ; $610f: $61
	add  c                                           ; $6110: $81
	ld   b, $61                                      ; $6111: $06 $61
	adc  $30                                         ; $6113: $ce $30
	ld   b, $61                                      ; $6115: $06 $61
	adc  $20                                         ; $6117: $ce $20
	ld   b, $61                                      ; $6119: $06 $61
	adc  $10                                         ; $611b: $ce $10
	ld   b, $61                                      ; $611d: $06 $61
	adc  c                                           ; $611f: $89
	.db  $ec                                         ; $6120: $ec
	ld   d, $d0                                      ; $6121: $16 $d0
	add  hl, bc                                      ; $6123: $09
	ld   c, a                                        ; $6124: $4f
	ld   h, c                                        ; $6125: $61
	rst  $00                                         ; $6126: $c7
	ld   b, l                                        ; $6127: $45
	add  c                                           ; $6128: $81
	add  b                                           ; $6129: $80
	ld   b, d                                        ; $612a: $42
	ld   bc, $45c7                                   ; $612b: $01 $c7 $45
	add  d                                           ; $612e: $82
	add  b                                           ; $612f: $80
	ld   b, d                                        ; $6130: $42
	ld   bc, $45c7                                   ; $6131: $01 $c7 $45
	add  e                                           ; $6134: $83
	add  b                                           ; $6135: $80
	adc  l                                           ; $6136: $8d
	inc  bc                                          ; $6137: $03
	ld   a, (bc)                                     ; $6138: $0a
	rst  $00                                         ; $6139: $c7
	nop                                              ; $613a: $00
	add  e                                           ; $613b: $83
	add  b                                           ; $613c: $80
	ld   b, d                                        ; $613d: $42
	ld   bc, $00c7                                   ; $613e: $01 $c7 $00
	add  d                                           ; $6141: $82
	add  b                                           ; $6142: $80
	ld   b, d                                        ; $6143: $42
	ld   bc, $00c7                                   ; $6144: $01 $c7 $00
	add  c                                           ; $6147: $81
	add  b                                           ; $6148: $80
	adc  l                                           ; $6149: $8d
	inc  b                                           ; $614a: $04
	ld   ($0681), sp                                 ; $614b: $08 $81 $06
	ld   h, c                                        ; $614e: $61
	rst  $00                                         ; $614f: $c7
	ld   b, l                                        ; $6150: $45
	rst  $38                                         ; $6151: $ff
	add  b                                           ; $6152: $80
	ld   b, d                                        ; $6153: $42
	ld   bc, $45c7                                   ; $6154: $01 $c7 $45
	cp   $80                                         ; $6157: $fe $80
	ld   b, d                                        ; $6159: $42
	ld   bc, $45c7                                   ; $615a: $01 $c7 $45
	.db  $fd                                         ; $615d: $fd
	add  b                                           ; $615e: $80
	adc  l                                           ; $615f: $8d
	inc  bc                                          ; $6160: $03
	ld   a, (bc)                                     ; $6161: $0a
	rst  $00                                         ; $6162: $c7
	nop                                              ; $6163: $00
	.db  $fd                                         ; $6164: $fd
	add  b                                           ; $6165: $80
	ld   b, d                                        ; $6166: $42
	ld   bc, $00c7                                   ; $6167: $01 $c7 $00
	cp   $80                                         ; $616a: $fe $80
	ld   b, d                                        ; $616c: $42
	ld   bc, $00c7                                   ; $616d: $01 $c7 $00
	rst  $38                                         ; $6170: $ff
	add  b                                           ; $6171: $80
	adc  l                                           ; $6172: $8d
	inc  b                                           ; $6173: $04
	ld   ($0681), sp                                 ; $6174: $08 $81 $06
	ld   h, c                                        ; $6177: $61
	rrca                                             ; $6178: $0f
	add  c                                           ; $6179: $81
	ld   b, $61                                      ; $617a: $06 $61
	add  hl, bc                                      ; $617c: $09
	ld   b, a                                        ; $617d: $47
	inc  b                                           ; $617e: $04
	rra                                              ; $617f: $1f
	daa                                              ; $6180: $27
	inc  c                                           ; $6181: $0c
	add  (hl)                                        ; $6182: $86
	add  a                                           ; $6183: $87
	ld   h, c                                        ; $6184: $61
	jr   jr_007_6187                                 ; $6185: $18 $00

jr_007_6187:
	inc  e                                           ; $6187: $1c
	nop                                              ; $6188: $00
	nop                                              ; $6189: $00
	ld   (bc), a                                     ; $618a: $02
	ld   h, d                                        ; $618b: $62
	inc  e                                           ; $618c: $1c
	ld   bc, $1500                                   ; $618d: $01 $00 $15
	ld   h, d                                        ; $6190: $62
	inc  e                                           ; $6191: $1c
	nop                                              ; $6192: $00
	ld   bc, $622c                                   ; $6193: $01 $2c $62
	inc  e                                           ; $6196: $1c
	ld   (bc), a                                     ; $6197: $02
	nop                                              ; $6198: $00
	ld   b, e                                        ; $6199: $43
	ld   h, d                                        ; $619a: $62
	inc  e                                           ; $619b: $1c
	ld   bc, $7301                                   ; $619c: $01 $01 $73
	ld   h, d                                        ; $619f: $62
	inc  e                                           ; $61a0: $1c
	ld   (bc), a                                     ; $61a1: $02
	ld   bc, $628a                                   ; $61a2: $01 $8a $62
	inc  e                                           ; $61a5: $1c
	nop                                              ; $61a6: $00
	ld   (bc), a                                     ; $61a7: $02
	sub  c                                           ; $61a8: $91
	ld   h, d                                        ; $61a9: $62

Jump_007_61aa:
	inc  e                                           ; $61aa: $1c
	ld   bc, $a402                                   ; $61ab: $01 $02 $a4
	ld   h, d                                        ; $61ae: $62
	inc  e                                           ; $61af: $1c
	ld   (bc), a                                     ; $61b0: $02
	ld   (bc), a                                     ; $61b1: $02
	cp   e                                           ; $61b2: $bb
	ld   h, d                                        ; $61b3: $62
	inc  e                                           ; $61b4: $1c
	nop                                              ; $61b5: $00
	inc  bc                                          ; $61b6: $03
	jp   nc, $1c62                                   ; $61b7: $d2 $62 $1c

	ld   bc, $d903                                   ; $61ba: $01 $03 $d9
	ld   h, d                                        ; $61bd: $62
	inc  e                                           ; $61be: $1c
	ld   (bc), a                                     ; $61bf: $02
	inc  bc                                          ; $61c0: $03
	ldh  a, (<$62)                                   ; $61c1: $f0 $62
	inc  e                                           ; $61c3: $1c
	nop                                              ; $61c4: $00
	dec  b                                           ; $61c5: $05
	rlca                                             ; $61c6: $07
	ld   h, e                                        ; $61c7: $63
	inc  e                                           ; $61c8: $1c
	nop                                              ; $61c9: $00
	inc  b                                           ; $61ca: $04
	jr   nz, jr_007_6230                             ; $61cb: $20 $63

	inc  e                                           ; $61cd: $1c
	ld   bc, $2704                                   ; $61ce: $01 $04 $27
	ld   h, e                                        ; $61d1: $63
	inc  e                                           ; $61d2: $1c
	ld   (bc), a                                     ; $61d3: $02
	inc  b                                           ; $61d4: $04
	ld   l, $63                                      ; $61d5: $2e $63
	inc  e                                           ; $61d7: $1c
	ld   bc, $3505                                   ; $61d8: $01 $05 $35
	ld   h, e                                        ; $61db: $63
	inc  e                                           ; $61dc: $1c
	nop                                              ; $61dd: $00
	ld   b, $4c                                      ; $61de: $06 $4c
	ld   h, e                                        ; $61e0: $63
	inc  e                                           ; $61e1: $1c
	ld   bc, $5306                                   ; $61e2: $01 $06 $53
	ld   h, e                                        ; $61e5: $63
	inc  e                                           ; $61e6: $1c
	ld   (bc), a                                     ; $61e7: $02
	ld   b, $5a                                      ; $61e8: $06 $5a
	ld   h, e                                        ; $61ea: $63
	inc  e                                           ; $61eb: $1c
	nop                                              ; $61ec: $00
	rlca                                             ; $61ed: $07
	ld   l, e                                        ; $61ee: $6b
	ld   h, e                                        ; $61ef: $63
	inc  e                                           ; $61f0: $1c
	ld   bc, $7c07                                   ; $61f1: $01 $07 $7c
	ld   h, e                                        ; $61f4: $63
	inc  e                                           ; $61f5: $1c
	ld   (bc), a                                     ; $61f6: $02
	rlca                                             ; $61f7: $07
	adc  a                                           ; $61f8: $8f
	ld   h, e                                        ; $61f9: $63
	inc  e                                           ; $61fa: $1c
	nop                                              ; $61fb: $00
	ld   ($6396), sp                                 ; $61fc: $08 $96 $63
	rst  $38                                         ; $61ff: $ff
	rst  $38                                         ; $6200: $ff
	rst  $38                                         ; $6201: $ff
	ret  z                                           ; $6202: $c8

	nop                                              ; $6203: $00
	and  h                                           ; $6204: $a4
	ld   h, e                                        ; $6205: $63
	ld   d, h                                        ; $6206: $54
	rst  $38                                         ; $6207: $ff
	add  e                                           ; $6208: $83
	xor  e                                           ; $6209: $ab
	ld   h, e                                        ; $620a: $63
	add  e                                           ; $620b: $83
	xor  d                                           ; $620c: $aa
	ld   h, e                                        ; $620d: $63
	pop  bc                                          ; $620e: $c1
	ld   l, $78                                      ; $620f: $2e $78
	ld   e, h                                        ; $6211: $5c
	add  c                                           ; $6212: $81
	sbc  l                                           ; $6213: $9d
	ld   h, e                                        ; $6214: $63
	ret  z                                           ; $6215: $c8

	ld   ($63a4), sp                                 ; $6216: $08 $a4 $63
	ld   d, h                                        ; $6219: $54
	rst  $38                                         ; $621a: $ff
	add  e                                           ; $621b: $83
	inc  hl                                          ; $621c: $23
	ld   h, h                                        ; $621d: $64
	add  e                                           ; $621e: $83
	xor  d                                           ; $621f: $aa
	ld   h, e                                        ; $6220: $63
	pop  bc                                          ; $6221: $c1
	jr   nc, jr_007_629e                             ; $6222: $30 $7a

	ld   h, h                                        ; $6224: $64
	pop  bc                                          ; $6225: $c1
	inc  sp                                          ; $6226: $33
	ld   (hl), b                                     ; $6227: $70
	ld   d, h                                        ; $6228: $54
	add  c                                           ; $6229: $81
	sbc  l                                           ; $622a: $9d
	ld   h, e                                        ; $622b: $63
	ret  z                                           ; $622c: $c8

	inc  d                                           ; $622d: $14
	and  h                                           ; $622e: $a4
	ld   h, e                                        ; $622f: $63

jr_007_6230:
	call nz, $a401                                   ; $6230: $c4 $01 $a4
	ld   h, e                                        ; $6233: $63
	ld   d, h                                        ; $6234: $54
	rst  $38                                         ; $6235: $ff
	add  e                                           ; $6236: $83
	sub  a                                           ; $6237: $97
	ld   h, h                                        ; $6238: $64
	add  e                                           ; $6239: $83
	xor  d                                           ; $623a: $aa
	ld   h, e                                        ; $623b: $63
	pop  bc                                          ; $623c: $c1
	inc  (hl)                                        ; $623d: $34
	ld   a, d                                        ; $623e: $7a
	ld   h, h                                        ; $623f: $64
	add  c                                           ; $6240: $81
	sbc  l                                           ; $6241: $9d
	ld   h, e                                        ; $6242: $63
	ld   d, h                                        ; $6243: $54
	rst  $38                                         ; $6244: $ff
	add  e                                           ; $6245: $83
	cp   $64                                         ; $6246: $fe $64
	add  e                                           ; $6248: $83
	xor  d                                           ; $6249: $aa
	ld   h, e                                        ; $624a: $63
	ret  z                                           ; $624b: $c8

	ld   bc, $625d                                   ; $624c: $01 $5d $62
	add  e                                           ; $624f: $83
	ld   d, c                                        ; $6250: $51
	ld   h, l                                        ; $6251: $65
	pop  bc                                          ; $6252: $c1
	ld   l, $7a                                      ; $6253: $2e $7a
	ld   h, h                                        ; $6255: $64
	pop  bc                                          ; $6256: $c1
	inc  sp                                          ; $6257: $33
	ld   (hl), b                                     ; $6258: $70
	ld   d, h                                        ; $6259: $54
	add  c                                           ; $625a: $81
	ld   h, b                                        ; $625b: $60
	ld   h, d                                        ; $625c: $62
	add  e                                           ; $625d: $83
	add  d                                           ; $625e: $82
	ld   h, h                                        ; $625f: $64
	pop  bc                                          ; $6260: $c1
	ldd  a, (hl)                                     ; $6261: $3a
	ld   b, d                                        ; $6262: $42
	ld   h, h                                        ; $6263: $64
	pop  bc                                          ; $6264: $c1
	inc  sp                                          ; $6265: $33
	jr   c, jr_007_62bc                              ; $6266: $38 $54

	pop  bc                                          ; $6268: $c1
	dec  sp                                          ; $6269: $3b
	or   d                                           ; $626a: $b2
	ld   h, h                                        ; $626b: $64
	pop  bc                                          ; $626c: $c1
	inc  sp                                          ; $626d: $33
	xor  b                                           ; $626e: $a8
	ld   d, h                                        ; $626f: $54
	add  c                                           ; $6270: $81
	sbc  l                                           ; $6271: $9d
	ld   h, e                                        ; $6272: $63
	ret  z                                           ; $6273: $c8

	ld   hl, $63a4                                   ; $6274: $21 $a4 $63
	ld   d, h                                        ; $6277: $54
	rst  $38                                         ; $6278: $ff
	add  e                                           ; $6279: $83
	ld   h, (hl)                                     ; $627a: $66
	ld   h, l                                        ; $627b: $65
	add  e                                           ; $627c: $83
	xor  d                                           ; $627d: $aa
	ld   h, e                                        ; $627e: $63
	pop  bc                                          ; $627f: $c1
	dec  a                                           ; $6280: $3d
	ld   d, b                                        ; $6281: $50
	ld   h, h                                        ; $6282: $64
	pop  bc                                          ; $6283: $c1
	inc  a                                           ; $6284: $3c
	and  b                                           ; $6285: $a0
	ld   h, h                                        ; $6286: $64
	add  c                                           ; $6287: $81
	sbc  l                                           ; $6288: $9d
	ld   h, e                                        ; $6289: $63
	ret  z                                           ; $628a: $c8

	add  hl, bc                                      ; $628b: $09
	and  h                                           ; $628c: $a4
	ld   h, e                                        ; $628d: $63
	add  c                                           ; $628e: $81
	add  hl, de                                      ; $628f: $19
	ld   h, d                                        ; $6290: $62
	call nz, $a402                                   ; $6291: $c4 $02 $a4
	ld   h, e                                        ; $6294: $63
	ld   d, h                                        ; $6295: $54
	rst  $38                                         ; $6296: $ff
	add  e                                           ; $6297: $83
	jp   $8365                                       ; $6298: $c3 $65 $83


	xor  d                                           ; $629b: $aa
	ld   h, e                                        ; $629c: $63
	pop  bc                                          ; $629d: $c1

jr_007_629e:
	dec  (hl)                                        ; $629e: $35
	ld   a, d                                        ; $629f: $7a
	ld   h, h                                        ; $62a0: $64
	add  c                                           ; $62a1: $81
	sbc  l                                           ; $62a2: $9d
	ld   h, e                                        ; $62a3: $63
	ret  z                                           ; $62a4: $c8

	inc  c                                           ; $62a5: $0c
	and  h                                           ; $62a6: $a4
	ld   h, e                                        ; $62a7: $63
	ld   d, h                                        ; $62a8: $54
	rst  $38                                         ; $62a9: $ff
	add  e                                           ; $62aa: $83
	ld   hl, $8366                                   ; $62ab: $21 $66 $83
	xor  d                                           ; $62ae: $aa
	ld   h, e                                        ; $62af: $63
	pop  bc                                          ; $62b0: $c1
	ld   sp, $647a                                   ; $62b1: $31 $7a $64
	pop  bc                                          ; $62b4: $c1
	inc  sp                                          ; $62b5: $33
	ld   (hl), b                                     ; $62b6: $70
	ld   d, h                                        ; $62b7: $54
	add  c                                           ; $62b8: $81
	sbc  l                                           ; $62b9: $9d
	ld   h, e                                        ; $62ba: $63
	ret  z                                           ; $62bb: $c8

jr_007_62bc:
	dec  b                                           ; $62bc: $05
	and  h                                           ; $62bd: $a4
	ld   h, e                                        ; $62be: $63
	ld   d, h                                        ; $62bf: $54
	rst  $38                                         ; $62c0: $ff
	add  e                                           ; $62c1: $83
	ld   l, (hl)                                     ; $62c2: $6e
	ld   h, (hl)                                     ; $62c3: $66
	add  e                                           ; $62c4: $83
	xor  d                                           ; $62c5: $aa
	ld   h, e                                        ; $62c6: $63
	pop  bc                                          ; $62c7: $c1
	cpl                                              ; $62c8: $2f
	ld   a, d                                        ; $62c9: $7a
	ld   h, h                                        ; $62ca: $64
	pop  bc                                          ; $62cb: $c1
	inc  sp                                          ; $62cc: $33
	ld   (hl), b                                     ; $62cd: $70
	ld   d, h                                        ; $62ce: $54
	add  c                                           ; $62cf: $81
	sbc  l                                           ; $62d0: $9d
	ld   h, e                                        ; $62d1: $63
	ret  z                                           ; $62d2: $c8

	dec  c                                           ; $62d3: $0d
	and  h                                           ; $62d4: $a4
	ld   h, e                                        ; $62d5: $63
	add  c                                           ; $62d6: $81
	xor  b                                           ; $62d7: $a8
	ld   h, d                                        ; $62d8: $62
	ret  z                                           ; $62d9: $c8

	ld   de, $63a4                                   ; $62da: $11 $a4 $63
	ld   d, h                                        ; $62dd: $54
	rst  $38                                         ; $62de: $ff
	add  e                                           ; $62df: $83
	push de                                          ; $62e0: $d5
	ld   h, (hl)                                     ; $62e1: $66
	add  e                                           ; $62e2: $83
	xor  d                                           ; $62e3: $aa
	ld   h, e                                        ; $62e4: $63
	pop  bc                                          ; $62e5: $c1
	ldd  (hl), a                                     ; $62e6: $32
	ld   a, d                                        ; $62e7: $7a
	ld   h, h                                        ; $62e8: $64
	pop  bc                                          ; $62e9: $c1
	inc  sp                                          ; $62ea: $33
	ld   (hl), b                                     ; $62eb: $70
	ld   d, h                                        ; $62ec: $54
	add  c                                           ; $62ed: $81
	sbc  l                                           ; $62ee: $9d
	ld   h, e                                        ; $62ef: $63
	ret  z                                           ; $62f0: $c8

	inc  bc                                          ; $62f1: $03
	and  h                                           ; $62f2: $a4
	ld   h, e                                        ; $62f3: $63
	ld   d, h                                        ; $62f4: $54
	rst  $38                                         ; $62f5: $ff
	add  e                                           ; $62f6: $83
	cpl                                              ; $62f7: $2f
	ld   h, a                                        ; $62f8: $67
	add  e                                           ; $62f9: $83
	xor  d                                           ; $62fa: $aa
	ld   h, e                                        ; $62fb: $63

Jump_007_62fc:
	pop  bc                                          ; $62fc: $c1
	ld   l, $7a                                      ; $62fd: $2e $7a
	ld   h, h                                        ; $62ff: $64
	pop  bc                                          ; $6300: $c1
	inc  sp                                          ; $6301: $33
	ld   (hl), b                                     ; $6302: $70
	ld   d, h                                        ; $6303: $54
	add  c                                           ; $6304: $81
	sbc  l                                           ; $6305: $9d
	ld   h, e                                        ; $6306: $63
	call nz, $1a10                                   ; $6307: $c4 $10 $1a
	ld   h, e                                        ; $630a: $63
	ld   d, h                                        ; $630b: $54
	rst  $38                                         ; $630c: $ff
	add  e                                           ; $630d: $83
	adc  c                                           ; $630e: $89
	ld   h, a                                        ; $630f: $67
	add  e                                           ; $6310: $83
	xor  d                                           ; $6311: $aa
	ld   h, e                                        ; $6312: $63
	pop  bc                                          ; $6313: $c1
	jr   c, jr_007_638e                              ; $6314: $38 $78

	ld   l, h                                        ; $6316: $6c
	add  c                                           ; $6317: $81
	sbc  l                                           ; $6318: $9d
	ld   h, e                                        ; $6319: $63
	add  e                                           ; $631a: $83
	ldd  (hl), a                                     ; $631b: $32
	ld   l, b                                        ; $631c: $68
	add  c                                           ; $631d: $81
	sbc  l                                           ; $631e: $9d
	ld   h, e                                        ; $631f: $63
	ret  z                                           ; $6320: $c8

	dec  bc                                          ; $6321: $0b
	and  h                                           ; $6322: $a4
	ld   h, e                                        ; $6323: $63
	add  c                                           ; $6324: $81
	add  hl, de                                      ; $6325: $19
	ld   h, d                                        ; $6326: $62
	ret  z                                           ; $6327: $c8

	rlca                                             ; $6328: $07
	and  h                                           ; $6329: $a4
	ld   h, e                                        ; $632a: $63
	add  c                                           ; $632b: $81
	cp   a                                           ; $632c: $bf
	ld   h, d                                        ; $632d: $62
	ret  z                                           ; $632e: $c8

	.db  $10                                         ; $632f: $10
	and  h                                           ; $6330: $a4
	ld   h, e                                        ; $6331: $63
	add  c                                           ; $6332: $81
	.db  $dd                                         ; $6333: $dd
	ld   h, d                                        ; $6334: $62
	push bc                                          ; $6335: $c5
	ld   (bc), a                                     ; $6336: $02
	and  h                                           ; $6337: $a4
	ld   h, e                                        ; $6338: $63
	ld   d, h                                        ; $6339: $54
	rst  $38                                         ; $633a: $ff
	add  e                                           ; $633b: $83
	jp   z, $8367                                    ; $633c: $ca $67 $83

	xor  d                                           ; $633f: $aa
	ld   h, e                                        ; $6340: $63
	pop  bc                                          ; $6341: $c1
	ld   b, b                                        ; $6342: $40
	ld   a, d                                        ; $6343: $7a
	ld   h, h                                        ; $6344: $64
	pop  bc                                          ; $6345: $c1
	inc  sp                                          ; $6346: $33
	ld   (hl), b                                     ; $6347: $70
	ld   d, h                                        ; $6348: $54
	add  c                                           ; $6349: $81
	sbc  l                                           ; $634a: $9d
	ld   h, e                                        ; $634b: $63
	ret  z                                           ; $634c: $c8

	inc  de                                          ; $634d: $13
	and  h                                           ; $634e: $a4
	ld   h, e                                        ; $634f: $63
	add  c                                           ; $6350: $81
	.db  $dd                                         ; $6351: $dd
	ld   h, d                                        ; $6352: $62
	ret  z                                           ; $6353: $c8

	rrca                                             ; $6354: $0f
	and  h                                           ; $6355: $a4
	ld   h, e                                        ; $6356: $63
	add  c                                           ; $6357: $81
	xor  b                                           ; $6358: $a8
	ld   h, d                                        ; $6359: $62
	ld   d, h                                        ; $635a: $54
	rst  $38                                         ; $635b: $ff
	add  e                                           ; $635c: $83
	ld   c, c                                        ; $635d: $49
	ld   l, b                                        ; $635e: $68
	add  e                                           ; $635f: $83
	xor  d                                           ; $6360: $aa
	ld   h, e                                        ; $6361: $63
	pop  bc                                          ; $6362: $c1
	ld   d, a                                        ; $6363: $57
	adc  b                                           ; $6364: $88
	sub  b                                           ; $6365: $90
	ld   c, c                                        ; $6366: $49
	ld   bc, $9d81                                   ; $6367: $01 $81 $9d
	ld   h, e                                        ; $636a: $63
	ld   d, h                                        ; $636b: $54
	rst  $38                                         ; $636c: $ff
	add  e                                           ; $636d: $83
	cp   e                                           ; $636e: $bb
	ld   l, b                                        ; $636f: $68
	add  e                                           ; $6370: $83
	xor  d                                           ; $6371: $aa
	ld   h, e                                        ; $6372: $63
	pop  bc                                          ; $6373: $c1
	ld   d, (hl)                                     ; $6374: $56
	adc  b                                           ; $6375: $88
	sub  b                                           ; $6376: $90
	ld   c, c                                        ; $6377: $49
	ld   (bc), a                                     ; $6378: $02
	add  c                                           ; $6379: $81
	sbc  l                                           ; $637a: $9d
	ld   h, e                                        ; $637b: $63
	call nz, $a408                                   ; $637c: $c4 $08 $a4
	ld   h, e                                        ; $637f: $63
	ld   d, h                                        ; $6380: $54
	rst  $38                                         ; $6381: $ff
	add  e                                           ; $6382: $83
	jr   nc, jr_007_63ee                             ; $6383: $30 $69

	add  e                                           ; $6385: $83
	xor  d                                           ; $6386: $aa
	ld   h, e                                        ; $6387: $63
	pop  bc                                          ; $6388: $c1
	scf                                              ; $6389: $37
	ld   a, d                                        ; $638a: $7a
	ld   h, h                                        ; $638b: $64
	add  c                                           ; $638c: $81
	sbc  l                                           ; $638d: $9d

jr_007_638e:
	ld   h, e                                        ; $638e: $63
	ret  z                                           ; $638f: $c8

	ld   (bc), a                                     ; $6390: $02
	and  h                                           ; $6391: $a4
	ld   h, e                                        ; $6392: $63
	add  c                                           ; $6393: $81
	.db  $f4                                         ; $6394: $f4
	ld   h, d                                        ; $6395: $62
	ret  z                                           ; $6396: $c8

	ld   c, $a4                                      ; $6397: $0e $a4
	ld   h, e                                        ; $6399: $63
	add  c                                           ; $639a: $81
	xor  b                                           ; $639b: $a8
	ld   h, d                                        ; $639c: $62
	ld   d, h                                        ; $639d: $54
	nop                                              ; $639e: $00
	ld   b, d                                        ; $639f: $42
	ld   (bc), a                                     ; $63a0: $02
	add  c                                           ; $63a1: $81
	sbc  a                                           ; $63a2: $9f
	ld   h, e                                        ; $63a3: $63
	add  e                                           ; $63a4: $83
	inc  c                                           ; $63a5: $0c
	ld   h, h                                        ; $63a6: $64
	add  c                                           ; $63a7: $81
	sbc  l                                           ; $63a8: $9d
	ld   h, e                                        ; $63a9: $63
	ld   a, a                                        ; $63aa: $7f
	inc  b                                           ; $63ab: $04
	inc  bc                                          ; $63ac: $03
	ld   e, c                                        ; $63ad: $59
	ld   l, a                                        ; $63ae: $6f
	ld   (hl), l                                     ; $63af: $75
	.db $20 $68

	ld   h, c                                        ; $63b2: $61
	.db  $76                                         ; $63b3: $76
	ld   h, l                                        ; $63b4: $65
	.db $20 $66

	ld   l, a                                        ; $63b7: $6f
	ld   (hl), l                                     ; $63b8: $75
	ld   l, (hl)                                     ; $63b9: $6e
	ld   h, h                                        ; $63ba: $64
	jr   nz, jr_007_6431                             ; $63bb: $20 $74

	ld   l, b                                        ; $63bd: $68
	ld   h, l                                        ; $63be: $65
	ld   bc, $6550                                   ; $63bf: $01 $50 $65
	ld   h, c                                        ; $63c2: $61
	ld   (hl), d                                     ; $63c3: $72
	ld   hl, $2020                                   ; $63c4: $21 $20 $20
	ld   c, c                                        ; $63c7: $49
	ld   (hl), h                                     ; $63c8: $74
	jr   nz, jr_007_6434                             ; $63c9: $20 $69

	ld   (hl), e                                     ; $63cb: $73
	jr   nz, jr_007_6447                             ; $63cc: $20 $79

	ld   l, a                                        ; $63ce: $6f
	ld   (hl), l                                     ; $63cf: $75
	ld   (hl), d                                     ; $63d0: $72
	ld   bc, $6966                                   ; $63d1: $01 $66 $69
	ld   (hl), d                                     ; $63d4: $72
	ld   (hl), e                                     ; $63d5: $73
	ld   (hl), h                                     ; $63d6: $74
	.db $20 $46

	ld   (hl), d                                     ; $63d9: $72
	ld   (hl), l                                     ; $63da: $75
	ld   l, c                                        ; $63db: $69
	ld   (hl), h                                     ; $63dc: $74
	jr   nz, jr_007_644e                             ; $63dd: $20 $6f

	ld   h, (hl)                                     ; $63df: $66
	jr   nz, jr_007_6456                             ; $63e0: $20 $74

	ld   l, b                                        ; $63e2: $68
	ld   h, l                                        ; $63e3: $65
	ld   bc, $7053                                   ; $63e4: $01 $53 $70
	ld   l, c                                        ; $63e7: $69
	ld   (hl), d                                     ; $63e8: $72
	ld   l, c                                        ; $63e9: $69
	ld   (hl), h                                     ; $63ea: $74
	ld   l, $20                                      ; $63eb: $2e $20
	ld   d, l                                        ; $63ed: $55

jr_007_63ee:
	ld   (hl), e                                     ; $63ee: $73
	ld   h, l                                        ; $63ef: $65
	jr   nz, jr_007_6466                             ; $63f0: $20 $74

	ld   l, b                                        ; $63f2: $68
	ld   h, l                                        ; $63f3: $65
	jr   nz, jr_007_6437                             ; $63f4: $20 $41

	ld   bc, $7562                                   ; $63f6: $01 $62 $75
	ld   (hl), h                                     ; $63f9: $74
	ld   (hl), h                                     ; $63fa: $74
	ld   l, a                                        ; $63fb: $6f
	ld   l, (hl)                                     ; $63fc: $6e
	jr   nz, jr_007_6473                             ; $63fd: $20 $74

	ld   l, a                                        ; $63ff: $6f
	jr   nz, jr_007_6476                             ; $6400: $20 $74

	ld   l, b                                        ; $6402: $68
	ld   (hl), d                                     ; $6403: $72
	ld   l, a                                        ; $6404: $6f
	ld   (hl), a                                     ; $6405: $77
	jr   nz, $69                                     ; $6406: $20 $69

	ld   (hl), h                                     ; $6408: $74
	ld   l, $ff                                      ; $6409: $2e $ff
	ld   a, a                                        ; $640b: $7f
	inc  b                                           ; $640c: $04
	inc  bc                                          ; $640d: $03


text_03_640e:
	.asc "This room is empty."
	.db $ff


	ld   a, a                                        ; $6422: $7f
	inc  b                                           ; $6423: $04
	inc  bc                                          ; $6424: $03
	ld   c, b                                        ; $6425: $48
	ld   h, l                                        ; $6426: $65
	ld   (hl), d                                     ; $6427: $72
	ld   h, l                                        ; $6428: $65
	jr   nz, jr_007_6494                             ; $6429: $20 $69

	ld   (hl), e                                     ; $642b: $73
	jr   nz, $61                                     ; $642c: $20 $61

	ld   l, (hl)                                     ; $642e: $6e
	jr   nz, jr_007_6492                             ; $642f: $20 $61

jr_007_6431:
	ld   (hl), b                                     ; $6431: $70
	ld   (hl), b                                     ; $6432: $70
	ld   l, h                                        ; $6433: $6c

jr_007_6434:
	ld   h, l                                        ; $6434: $65
	jr   nz, jr_007_64ab                             ; $6435: $20 $74

jr_007_6437:
	ld   l, a                                        ; $6437: $6f
	jr   nz, jr_007_643b                             ; $6438: $20 $01

	ld   h, c                                        ; $643a: $61

jr_007_643b:
	ld   h, h                                        ; $643b: $64
	ld   h, h                                        ; $643c: $64
	jr   nz, jr_007_64b3                             ; $643d: $20 $74

	ld   l, a                                        ; $643f: $6f
	jr   nz, $79                                     ; $6440: $20 $79

	ld   l, a                                        ; $6442: $6f
	ld   (hl), l                                     ; $6443: $75
	ld   (hl), d                                     ; $6444: $72
	jr   nz, $66                                     ; $6445: $20 $66

jr_007_6447:
	ld   (hl), d                                     ; $6447: $72
	ld   (hl), l                                     ; $6448: $75
	ld   l, c                                        ; $6449: $69
	ld   (hl), h                                     ; $644a: $74
	ld   bc, $6f63                                   ; $644b: $01 $63 $6f

jr_007_644e:
	ld   l, h                                        ; $644e: $6c
	ld   l, h                                        ; $644f: $6c
	ld   h, l                                        ; $6450: $65
	ld   h, e                                        ; $6451: $63
	ld   (hl), h                                     ; $6452: $74
	ld   l, c                                        ; $6453: $69
	ld   l, a                                        ; $6454: $6f
	ld   l, (hl)                                     ; $6455: $6e

jr_007_6456:
	ld   l, $20                                      ; $6456: $2e $20
	ld   c, c                                        ; $6458: $49
	ld   (hl), h                                     ; $6459: $74
	jr   nz, jr_007_64c3                             ; $645a: $20 $67

	ld   l, a                                        ; $645c: $6f
	ld   h, l                                        ; $645d: $65
	ld   (hl), e                                     ; $645e: $73
	ld   bc, $6c73                                   ; $645f: $01 $73 $6c
	ld   l, a                                        ; $6462: $6f
	ld   (hl), a                                     ; $6463: $77
	jr   nz, $62                                     ; $6262: $20 $62

jr_007_6466:
	ld   (hl), l                                     ; $6466: $75
	ld   (hl), h                                     ; $6467: $74
	jr   nz, jr_007_64d3                             ; $6468: $20 $69

	ld   (hl), e                                     ; $646a: $73
	jr   nz, jr_007_64e3                             ; $646b: $20 $76

	ld   h, l                                        ; $646d: $65
	ld   (hl), d                                     ; $646e: $72
	ld   a, c                                        ; $646f: $79
	ld   bc, $6f70                                   ; $6470: $01 $70 $6f

jr_007_6473:
	ld   (hl), a                                     ; $6473: $77
	ld   h, l                                        ; $6474: $65
	ld   (hl), d                                     ; $6475: $72

jr_007_6476:
	ld   h, (hl)                                     ; $6476: $66
	ld   (hl), l                                     ; $6477: $75
	ld   l, h                                        ; $6478: $6c
	ld   l, $ff                                      ; $6479: $2e $ff
	dec  bc                                          ; $647b: $0b
	.db  $10                                         ; $647c: $10
	ld   a, e                                        ; $647d: $7b
	inc  (hl)                                        ; $647e: $34
	jr   nc, -$01                                     ; $647f: $30 $ff

jr_007_6481:
	ld   a, a                                        ; $6481: $7f

jr_007_6482:
	dec  bc                                          ; $6482: $0b
	add  hl, bc                                      ; $6483: $09
	ld   a, e                                        ; $6484: $7b
	ldd  (hl), a                                     ; $6485: $32

jr_007_6486:
	jr   nc, jr_007_64a8                             ; $6486: $30 $20

	jr   nz, $20                                     ; $6488: $20 $20

	jr   nz, jr_007_64ac                             ; $648a: $20 $20

	jr   nz, $20                                     ; $648c: $20 $20

	jr   nz, jr_007_64b0                             ; $648e: $20 $20

	jr   nz, jr_007_64b2                             ; $6490: $20 $20

jr_007_6492:
	ld   a, e                                        ; $6492: $7b
	scf                                              ; $6493: $37

jr_007_6494:
	dec  (hl)                                        ; $6494: $35
	rst  $38                                         ; $6495: $ff
	ld   a, a                                        ; $6496: $7f
	inc  b                                           ; $6497: $04
	inc  bc                                          ; $6498: $03
	ld   d, h                                        ; $6499: $54
	ld   l, b                                        ; $649a: $68
	ld   l, c                                        ; $649b: $69
	ld   (hl), e                                     ; $649c: $73
	jr   nz, $69                                     ; $649d: $20 $69

	ld   (hl), e                                     ; $649f: $73
	jr   nz, jr_007_6516                             ; $64a0: $20 $74

	ld   l, b                                        ; $64a2: $68
	ld   h, l                                        ; $64a3: $65
	jr   nz, jr_007_64e8                             ; $64a4: $20 $42

	ld   h, l                                        ; $64a6: $65
	ld   l, h                                        ; $64a7: $6c

jr_007_64a8:
	ld   (hl), h                                     ; $64a8: $74
	jr   nz, $6f                                     ; $64a9: $20 $6f

jr_007_64ab:
	ld   h, (hl)                                     ; $64ab: $66

jr_007_64ac:
	ld   bc, $7254                                   ; $64ac: $01 $54 $72
	ld   (hl), l                                     ; $64af: $75

jr_007_64b0:
	ld   (hl), h                                     ; $64b0: $74
	ld   l, b                                        ; $64b1: $68

jr_007_64b2:
	inc  l                                           ; $64b2: $2c

jr_007_64b3:
	jr   nz, jr_007_6524                             ; $64b3: $20 $6f

	ld   l, (hl)                                     ; $64b5: $6e
	ld   h, l                                        ; $64b6: $65
	jr   nz, $6f                                     ; $64b7: $20 $6f

	ld   h, (hl)                                     ; $64b9: $66
	jr   nz, jr_007_6530                             ; $64ba: $20 $74

	ld   l, b                                        ; $64bc: $68
	ld   h, l                                        ; $64bd: $65
	jr   nz, jr_007_64f6                             ; $64be: $20 $36

	ld   bc, $6970                                   ; $64c0: $01 $70 $69

jr_007_64c3:
	ld   h, l                                        ; $64c3: $65
	ld   h, e                                        ; $64c4: $63
	ld   h, l                                        ; $64c5: $65
	ld   (hl), e                                     ; $64c6: $73
	jr   nz, jr_007_6538                             ; $64c7: $20 $6f

	ld   h, (hl)                                     ; $64c9: $66
	jr   nz, jr_007_6540                             ; $64ca: $20 $74

	ld   l, b                                        ; $64cc: $68
	ld   h, l                                        ; $64cd: $65
	jr   nz, jr_007_6531                             ; $64ce: $20 $61

	ld   (hl), d                                     ; $64d0: $72
	ld   l, l                                        ; $64d1: $6d
	ld   l, a                                        ; $64d2: $6f

jr_007_64d3:
	ld   (hl), d                                     ; $64d3: $72
	ld   bc, $666f                                   ; $64d4: $01 $6f $66
	jr   nz, jr_007_6520                             ; $64d7: $20 $47

	ld   l, a                                        ; $64d9: $6f
	ld   h, h                                        ; $64da: $64
	ld   l, $20                                      ; $64db: $2e $20
	ld   d, a                                        ; $64dd: $57
	ld   l, c                                        ; $64de: $69
	ld   (hl), h                                     ; $64df: $74
	ld   l, b                                        ; $64e0: $68
	jr   nz, jr_007_654c                             ; $64e1: $20 $69

jr_007_64e3:
	ld   (hl), h                                     ; $64e3: $74
	jr   nz, jr_007_655f                             ; $64e4: $20 $79

	ld   l, a                                        ; $64e6: $6f
	ld   (hl), l                                     ; $64e7: $75

jr_007_64e8:
	ld   bc, $6163                                   ; $64e8: $01 $63 $61
	ld   l, (hl)                                     ; $64eb: $6e
	jr   nz, jr_007_655b                             ; $64ec: $20 $6d

	ld   l, a                                        ; $64ee: $6f
	.db  $76                                         ; $64ef: $76
	ld   h, l                                        ; $64f0: $65
	jr   nz, jr_007_6562                             ; $64f1: $20 $6f

	ld   h, d                                        ; $64f3: $62
	ld   (hl), e                                     ; $64f4: $73
	ld   (hl), h                                     ; $64f5: $74

jr_007_64f6:
	ld   h, c                                        ; $64f6: $61
	ld   h, e                                        ; $64f7: $63
	ld   l, h                                        ; $64f8: $6c
	ld   h, l                                        ; $64f9: $65
	ld   (hl), e                                     ; $64fa: $73
	ld   l, $ff                                      ; $64fb: $2e $ff
	ld   a, a                                        ; $64fd: $7f
	inc  b                                           ; $64fe: $04
	inc  bc                                          ; $64ff: $03
	ld   b, (hl)                                     ; $6500: $46
	ld   l, a                                        ; $6501: $6f

Call_007_6502:
	ld   (hl), d                                     ; $6502: $72
	jr   nz, jr_007_6579                             ; $6503: $20 $74

	ld   l, b                                        ; $6505: $68
	ld   h, l                                        ; $6506: $65
	jr   nz, jr_007_657c                             ; $6507: $20 $73

	ld   (hl), h                                     ; $6509: $74
	ld   (hl), d                                     ; $650a: $72
	ld   l, a                                        ; $650b: $6f
	ld   l, (hl)                                     ; $650c: $6e
	ld   h, a                                        ; $650d: $67
	jr   nz, jr_007_6579                             ; $650e: $20 $69

	ld   l, (hl)                                     ; $6510: $6e
	ld   bc, $7073                                   ; $6511: $01 $73 $70
	ld   l, c                                        ; $6514: $69
	ld   (hl), d                                     ; $6515: $72

jr_007_6516:
	ld   l, c                                        ; $6516: $69
	ld   (hl), h                                     ; $6517: $74
	inc  l                                           ; $6518: $2c
	jr   nz, jr_007_6564                             ; $6519: $20 $49

	jr   nz, jr_007_658c                             ; $651b: $20 $6f

	ld   h, (hl)                                     ; $651d: $66
	ld   h, (hl)                                     ; $651e: $66
	ld   h, l                                        ; $651f: $65

jr_007_6520:
	ld   (hl), d                                     ; $6520: $72
	ld   bc, $6874                                   ; $6521: $01 $74 $68

jr_007_6524:
	ld   h, l                                        ; $6524: $65
	ld   (hl), e                                     ; $6525: $73
	ld   h, l                                        ; $6526: $65
	jr   nz, jr_007_6592                             ; $6527: $20 $69

	ld   (hl), h                                     ; $6529: $74
	ld   h, l                                        ; $652a: $65
	ld   l, l                                        ; $652b: $6d
	ld   (hl), e                                     ; $652c: $73
	ld   l, $20                                      ; $652d: $2e $20
	ld   d, h                                        ; $652f: $54

jr_007_6530:
	ld   l, b                                        ; $6530: $68

jr_007_6531:
	ld   h, l                                        ; $6531: $65
	ld   a, c                                        ; $6532: $79
	ld   bc, $6977                                   ; $6533: $01 $77 $69
	ld   l, h                                        ; $6536: $6c
	ld   l, h                                        ; $6537: $6c

jr_007_6538:
	jr   nz, jr_007_659b                             ; $6538: $20 $61

	ld   l, c                                        ; $653a: $69
	ld   h, h                                        ; $653b: $64
	jr   nz, jr_007_65b7                             ; $653c: $20 $79

	ld   l, a                                        ; $653e: $6f
	ld   (hl), l                                     ; $653f: $75

jr_007_6540:
	jr   nz, $69                                     ; $6540: $20 $69

	ld   l, (hl)                                     ; $6542: $6e
	ld   bc, $6f79                                   ; $6543: $01 $79 $6f
	ld   (hl), l                                     ; $6546: $75
	ld   (hl), d                                     ; $6547: $72
	jr   nz, $71                                     ; $6548: $20 $71

	ld   (hl), l                                     ; $654a: $75
	ld   h, l                                        ; $654b: $65

jr_007_654c:
	ld   (hl), e                                     ; $654c: $73
	ld   (hl), h                                     ; $654d: $74
	ld   l, $ff                                      ; $654e: $2e $ff
	ld   a, a                                        ; $6550: $7f
	dec  bc                                          ; $6551: $0b
	add  hl, bc                                      ; $6552: $09
	ld   a, e                                        ; $6553: $7b
	ldd  (hl), a                                     ; $6554: $32
	jr   nc, jr_007_6577                             ; $6555: $30 $20

	jr   nz, jr_007_6579                             ; $6557: $20 $20

	jr   nz, jr_007_65d6                             ; $6559: $20 $7b

jr_007_655b:
	ldd  (hl), a                                     ; $655b: $32
	dec  (hl)                                        ; $655c: $35
	jr   nz, jr_007_657f                             ; $655d: $20 $20

jr_007_655f:
	jr   nz, jr_007_6581                             ; $655f: $20 $20

	ld   a, e                                        ; $6561: $7b

jr_007_6562:
	scf                                              ; $6562: $37
	dec  (hl)                                        ; $6563: $35

jr_007_6564:
	rst  $38                                         ; $6564: $ff
	ld   a, a                                        ; $6565: $7f
	inc  b                                           ; $6566: $04
	inc  bc                                          ; $6567: $03
	ld   d, a                                        ; $6568: $57
	ld   h, c                                        ; $6569: $61
	ld   a, c                                        ; $656a: $79
	jr   nz, jr_007_65e1                             ; $656b: $20 $74

	ld   l, a                                        ; $656d: $6f
	jr   nz, $67                                     ; $656e: $20 $67

	ld   l, a                                        ; $6570: $6f
	ld   hl, $5920                                   ; $6571: $21 $20 $59
	ld   l, a                                        ; $6574: $6f
	ld   (hl), l                                     ; $6575: $75
	daa                                              ; $6576: $27

jr_007_6577:
	.db  $76                                         ; $6577: $76
	ld   h, l                                        ; $6578: $65

jr_007_6579:
	ld   bc, $6f66                                   ; $6579: $01 $66 $6f

jr_007_657c:
	ld   (hl), l                                     ; $657c: $75
	ld   l, (hl)                                     ; $657d: $6e
	ld   h, h                                        ; $657e: $64

jr_007_657f:
	jr   nz, jr_007_65e2                             ; $657f: $20 $61

jr_007_6581:
	jr   nz, $68                                     ; $6581: $20 $68

	ld   l, c                                        ; $6583: $69
	ld   h, h                                        ; $6584: $64
	ld   h, h                                        ; $6585: $64
	ld   h, l                                        ; $6586: $65
	ld   l, (hl)                                     ; $6587: $6e
	ld   bc, $6f72                                   ; $6588: $01 $72 $6f
	ld   l, a                                        ; $658b: $6f

jr_007_658c:
	ld   l, l                                        ; $658c: $6d
	ld   l, $20                                      ; $658d: $2e $20
	ld   c, c                                        ; $658f: $49
	jr   nz, jr_007_6602                             ; $6590: $20 $70

jr_007_6592:
	ld   (hl), d                                     ; $6592: $72
	ld   h, l                                        ; $6593: $65
	ld   (hl), e                                     ; $6594: $73
	ld   h, l                                        ; $6595: $65
	ld   l, (hl)                                     ; $6596: $6e
	ld   (hl), h                                     ; $6597: $74
	ld   bc, $6f79                                   ; $6598: $01 $79 $6f

jr_007_659b:
	ld   (hl), l                                     ; $659b: $75
	jr   nz, jr_007_6615                             ; $659c: $20 $77

	ld   l, c                                        ; $659e: $69
	ld   (hl), h                                     ; $659f: $74
	ld   l, b                                        ; $65a0: $68
	jr   nz, jr_007_65da                             ; $65a1: $20 $37

	dec  (hl)                                        ; $65a3: $35
	jr   nz, jr_007_661c                             ; $65a4: $20 $76

	ld   l, c                                        ; $65a6: $69
	ld   h, c                                        ; $65a7: $61
	ld   l, h                                        ; $65a8: $6c
	ld   (hl), e                                     ; $65a9: $73
	ld   bc, $6e61                                   ; $65aa: $01 $61 $6e
	ld   h, h                                        ; $65ad: $64
	jr   nz, jr_007_65e1                             ; $65ae: $20 $31

	dec  (hl)                                        ; $65b0: $35
	jr   nc, $20                                     ; $65b1: $30 $20

	ld   (hl), e                                     ; $65b3: $73
	ld   (hl), b                                     ; $65b4: $70
	ld   l, c                                        ; $65b5: $69
	ld   (hl), d                                     ; $65b6: $72

jr_007_65b7:
	ld   l, c                                        ; $65b7: $69
	ld   (hl), h                                     ; $65b8: $74
	ld   bc, $6f70                                   ; $65b9: $01 $70 $6f
	ld   l, c                                        ; $65bc: $69
	ld   l, (hl)                                     ; $65bd: $6e
	ld   (hl), h                                     ; $65be: $74
	ld   (hl), e                                     ; $65bf: $73
	ld   l, $ff                                      ; $65c0: $2e $ff
	ld   a, a                                        ; $65c2: $7f
	inc  b                                           ; $65c3: $04
	inc  bc                                          ; $65c4: $03
	ld   c, c                                        ; $65c5: $49
	jr   nz, $6e                                     ; $65c6: $20 $6e

	ld   l, a                                        ; $65c8: $6f
	ld   (hl), a                                     ; $65c9: $77
	jr   nz, jr_007_663c                             ; $65ca: $20 $70

	ld   (hl), d                                     ; $65cc: $72
	ld   h, l                                        ; $65cd: $65
	ld   (hl), e                                     ; $65ce: $73
	ld   h, l                                        ; $65cf: $65
	ld   l, (hl)                                     ; $65d0: $6e
	ld   (hl), h                                     ; $65d1: $74
	jr   nz, jr_007_664d                             ; $65d2: $20 $79

	ld   l, a                                        ; $65d4: $6f
	ld   (hl), l                                     ; $65d5: $75

jr_007_65d6:
	ld   bc, $6977                                   ; $65d6: $01 $77 $69
	ld   (hl), h                                     ; $65d9: $74

jr_007_65da:
	ld   l, b                                        ; $65da: $68
	jr   nz, jr_007_663e                             ; $65db: $20 $61

	jr   nz, jr_007_6621                             ; $65dd: $20 $42

	ld   (hl), d                                     ; $65df: $72
	ld   h, l                                        ; $65e0: $65

jr_007_65e1:
	ld   h, c                                        ; $65e1: $61

jr_007_65e2:
	ld   (hl), e                                     ; $65e2: $73
	ld   (hl), h                                     ; $65e3: $74
	ld   (hl), b                                     ; $65e4: $70
	ld   l, h                                        ; $65e5: $6c
	ld   h, c                                        ; $65e6: $61
	ld   (hl), h                                     ; $65e7: $74
	ld   h, l                                        ; $65e8: $65
	ld   bc, $666f                                   ; $65e9: $01 $6f $66
	jr   nz, jr_007_6640                             ; $65ec: $20 $52

	ld   l, c                                        ; $65ee: $69
	ld   h, a                                        ; $65ef: $67
	ld   l, b                                        ; $65f0: $68
	ld   (hl), h                                     ; $65f1: $74
	ld   h, l                                        ; $65f2: $65
	ld   l, a                                        ; $65f3: $6f
	ld   (hl), l                                     ; $65f4: $75
	ld   (hl), e                                     ; $65f5: $73
	ld   l, (hl)                                     ; $65f6: $6e
	ld   h, l                                        ; $65f7: $65
	ld   (hl), e                                     ; $65f8: $73
	ld   (hl), e                                     ; $65f9: $73
	ld   l, $01                                      ; $65fa: $2e $01
	ld   e, c                                        ; $65fc: $59
	ld   l, a                                        ; $65fd: $6f
	ld   (hl), l                                     ; $65fe: $75
	ld   (hl), d                                     ; $65ff: $72
	jr   nz, $64                                     ; $6400: $20 $64

jr_007_6602:
	ld   h, c                                        ; $6602: $61
	ld   l, l                                        ; $6603: $6d

Call_007_6604:
	ld   h, c                                        ; $6604: $61
	ld   h, a                                        ; $6605: $67
	ld   h, l                                        ; $6606: $65
	jr   nz, jr_007_6680                             ; $6607: $20 $77

	ld   l, c                                        ; $6609: $69
	ld   l, h                                        ; $660a: $6c
	ld   l, h                                        ; $660b: $6c
	ld   bc, $6562                                   ; $660c: $01 $62 $65
	jr   nz, jr_007_6683                             ; $660f: $20 $72

	ld   h, l                                        ; $6611: $65
	ld   h, h                                        ; $6612: $64
	ld   (hl), l                                     ; $6613: $75
	ld   h, e                                        ; $6614: $63

jr_007_6615:
	ld   h, l                                        ; $6615: $65
	ld   h, h                                        ; $6616: $64
	jr   nz, jr_007_667b                             ; $6617: $20 $62

	ld   a, c                                        ; $6619: $79
	jr   nz, jr_007_664d                             ; $661a: $20 $31

jr_007_661c:
	cpl                                              ; $661c: $2f
	ldd  (hl), a                                     ; $661d: $32
	ld   l, $ff                                      ; $661e: $2e $ff
	ld   a, a                                        ; $6620: $7f

jr_007_6621:
	inc  b                                           ; $6621: $04
	inc  bc                                          ; $6622: $03
	ld   d, h                                        ; $6623: $54
	ld   l, b                                        ; $6624: $68
	ld   h, l                                        ; $6625: $65
	jr   nz, $6d                                     ; $6626: $20 $6d

	ld   l, c                                        ; $6628: $69
	ld   h, a                                        ; $6629: $67
	ld   l, b                                        ; $662a: $68
	ld   (hl), h                                     ; $662b: $74
	ld   a, c                                        ; $662c: $79
	jr   nz, $67                                     ; $662d: $20 $67

	ld   (hl), d                                     ; $662f: $72
	ld   h, c                                        ; $6630: $61
	ld   (hl), b                                     ; $6631: $70
	ld   h, l                                        ; $6632: $65
	ld   (hl), e                                     ; $6633: $73
	ld   bc, $7761                                   ; $6634: $01 $61 $77
	ld   h, c                                        ; $6637: $61
	ld   l, c                                        ; $6638: $69
	ld   (hl), h                                     ; $6639: $74
	jr   nz, jr_007_66b5                             ; $663a: $20 $79

jr_007_663c:
	ld   l, a                                        ; $663c: $6f
	ld   (hl), l                                     ; $663d: $75

jr_007_663e:
	ld   l, $20                                      ; $663e: $2e $20

jr_007_6640:
	ld   d, h                                        ; $6640: $54
	ld   l, b                                        ; $6641: $68
	ld   l, c                                        ; $6642: $69
	ld   (hl), e                                     ; $6643: $73
	ld   bc, $7266                                   ; $6644: $01 $66 $72
	ld   (hl), l                                     ; $6647: $75
	ld   l, c                                        ; $6648: $69
	ld   (hl), h                                     ; $6649: $74
	jr   nz, jr_007_66bf                             ; $664a: $20 $73

	ld   h, e                                        ; $664c: $63

jr_007_664d:
	ld   h, c                                        ; $664d: $61
	ld   (hl), h                                     ; $664e: $74
	ld   (hl), h                                     ; $664f: $74
	ld   h, l                                        ; $6650: $65
	ld   (hl), d                                     ; $6651: $72
	ld   (hl), e                                     ; $6652: $73
	ld   bc, $6877                                   ; $6653: $01 $77 $68
	ld   h, l                                        ; $6656: $65
	ld   l, (hl)                                     ; $6657: $6e
	jr   nz, jr_007_66d3                             ; $6658: $20 $79

	ld   l, a                                        ; $665a: $6f
	ld   (hl), l                                     ; $665b: $75
	jr   nz, $74                                     ; $665c: $20 $74

	ld   l, b                                        ; $665e: $68
	ld   (hl), d                                     ; $665f: $72
	ld   l, a                                        ; $6660: $6f
	ld   (hl), a                                     ; $6661: $77
	jr   nz, $69                                     ; $6662: $20 $69

	ld   (hl), h                                     ; $6664: $74
	ld   l, $ff                                      ; $6665: $2e $ff
	dec  bc                                          ; $6667: $0b
	.db  $10                                         ; $6668: $10
	ld   a, e                                        ; $6669: $7b
	scf                                              ; $666a: $37
	dec  (hl)                                        ; $666b: $35
	rst  $38                                         ; $666c: $ff
	ld   a, a                                        ; $666d: $7f
	inc  b                                           ; $666e: $04
	inc  bc                                          ; $666f: $03
	ld   d, h                                        ; $6670: $54
	ld   l, b                                        ; $6671: $68
	ld   h, l                                        ; $6672: $65
	jr   nz, jr_007_66d6                             ; $6673: $20 $61

	ld   h, h                                        ; $6675: $64
	.db  $76                                         ; $6676: $76
	ld   h, c                                        ; $6677: $61
	ld   l, (hl)                                     ; $6678: $6e
	ld   (hl), h                                     ; $6679: $74
	ld   h, c                                        ; $667a: $61

jr_007_667b:
	ld   h, a                                        ; $667b: $67
	ld   h, l                                        ; $667c: $65
	jr   nz, jr_007_66ee                             ; $667d: $20 $6f

	ld   h, (hl)                                     ; $667f: $66

jr_007_6680:
	ld   bc, $7375                                   ; $6680: $01 $75 $73

jr_007_6683:
	ld   l, c                                        ; $6683: $69
	ld   l, (hl)                                     ; $6684: $6e
	ld   h, a                                        ; $6685: $67
	jr   nz, jr_007_66e9                             ; $6686: $20 $61

	jr   nz, jr_007_66fa                             ; $6688: $20 $70

	ld   l, a                                        ; $668a: $6f
	ld   l, l                                        ; $668b: $6d
	ld   h, l                                        ; $668c: $65
	ld   h, a                                        ; $668d: $67
	ld   (hl), d                                     ; $668e: $72
	ld   h, c                                        ; $668f: $61
	ld   l, (hl)                                     ; $6690: $6e
	ld   h, c                                        ; $6691: $61
	ld   (hl), h                                     ; $6692: $74
	ld   h, l                                        ; $6693: $65
	ld   bc, $7369                                   ; $6694: $01 $69 $73
	jr   nz, jr_007_670d                             ; $6697: $20 $74

	ld   l, b                                        ; $6699: $68
	ld   h, c                                        ; $669a: $61
	ld   (hl), h                                     ; $669b: $74
	jr   nz, jr_007_6707                             ; $669c: $20 $69

	ld   (hl), h                                     ; $669e: $74
	jr   nz, jr_007_6709                             ; $669f: $20 $68

	ld   h, c                                        ; $66a1: $61
	ld   (hl), e                                     ; $66a2: $73
	jr   nz, jr_007_6706                             ; $66a3: $20 $61

	ld   bc, $6977                                   ; $66a5: $01 $77 $69
	ld   h, h                                        ; $66a8: $64
	ld   h, l                                        ; $66a9: $65
	ld   (hl), d                                     ; $66aa: $72
	jr   nz, jr_007_671f                             ; $66ab: $20 $72

	ld   h, c                                        ; $66ad: $61
	ld   l, (hl)                                     ; $66ae: $6e
	ld   h, a                                        ; $66af: $67
	ld   h, l                                        ; $66b0: $65
	ld   l, $20                                      ; $66b1: $2e $20
	ld   c, c                                        ; $66b3: $49
	ld   (hl), h                                     ; $66b4: $74

jr_007_66b5:
	ld   bc, $7274                                   ; $66b5: $01 $74 $72
	ld   h, c                                        ; $66b8: $61
	.db  $76                                         ; $66b9: $76
	ld   h, l                                        ; $66ba: $65
	ld   l, h                                        ; $66bb: $6c
	ld   (hl), e                                     ; $66bc: $73
	jr   nz, jr_007_6720                             ; $66bd: $20 $61

jr_007_66bf:
	jr   nz, jr_007_673b                             ; $66bf: $20 $7a

	ld   l, c                                        ; $66c1: $69
	ld   h, a                                        ; $66c2: $67
	dec  l                                           ; $66c3: $2d
	ld   a, d                                        ; $66c4: $7a
	ld   h, c                                        ; $66c5: $61
	ld   h, a                                        ; $66c6: $67
	ld   bc, $6170                                   ; $66c7: $01 $70 $61
	ld   (hl), h                                     ; $66ca: $74
	ld   l, b                                        ; $66cb: $68
	ld   l, $ff                                      ; $66cc: $2e $ff
	dec  bc                                          ; $66ce: $0b
	.db  $10                                         ; $66cf: $10
	ld   a, e                                        ; $66d0: $7b
	ld   (hl), $30                                   ; $66d1: $36 $30

jr_007_66d3:
	rst  $38                                         ; $66d3: $ff
	ld   a, a                                        ; $66d4: $7f
	inc  b                                           ; $66d5: $04

jr_007_66d6:
	inc  bc                                          ; $66d6: $03
	ld   d, h                                        ; $66d7: $54
	ld   l, b                                        ; $66d8: $68
	ld   h, l                                        ; $66d9: $65
	jr   nz, $66                                     ; $66da: $20 $66

	ld   h, c                                        ; $66dc: $61
	ld   (hl), e                                     ; $66dd: $73
	ld   (hl), h                                     ; $66de: $74
	ld   h, l                                        ; $66df: $65
	ld   (hl), e                                     ; $66e0: $73
	ld   (hl), h                                     ; $66e1: $74
	jr   nz, jr_007_6745                             ; $66e2: $20 $61

	ld   l, (hl)                                     ; $66e4: $6e
	ld   h, h                                        ; $66e5: $64
	ld   bc, $6166                                   ; $66e6: $01 $66 $61

jr_007_66e9:
	ld   (hl), d                                     ; $66e9: $72
	ld   (hl), h                                     ; $66ea: $74
	ld   l, b                                        ; $66eb: $68
	ld   h, l                                        ; $66ec: $65
	ld   (hl), e                                     ; $66ed: $73

jr_007_66ee:
	ld   (hl), h                                     ; $66ee: $74
	jr   nz, jr_007_6757                             ; $66ef: $20 $66

	ld   l, h                                        ; $66f1: $6c
	ld   a, c                                        ; $66f2: $79
	ld   l, c                                        ; $66f3: $69
	ld   l, (hl)                                     ; $66f4: $6e
	ld   h, a                                        ; $66f5: $67
	ld   bc, $7266                                   ; $66f6: $01 $66 $72
	ld   (hl), l                                     ; $66f9: $75

jr_007_66fa:
	ld   l, c                                        ; $66fa: $69
	ld   (hl), h                                     ; $66fb: $74
	jr   nz, jr_007_6767                             ; $66fc: $20 $69

	ld   (hl), e                                     ; $66fe: $73
	jr   nz, jr_007_6775                             ; $66ff: $20 $74

	ld   l, b                                        ; $6701: $68
	ld   h, l                                        ; $6702: $65
	ld   bc, $6162                                   ; $6703: $01 $62 $61

jr_007_6706:
	ld   l, (hl)                                     ; $6706: $6e

jr_007_6707:
	ld   h, c                                        ; $6707: $61
	ld   l, (hl)                                     ; $6708: $6e

jr_007_6709:
	ld   h, c                                        ; $6709: $61
	ld   l, $20                                      ; $670a: $2e $20
	ld   c, c                                        ; $670c: $49

jr_007_670d:
	ld   (hl), h                                     ; $670d: $74
	jr   nz, jr_007_6784                             ; $670e: $20 $74

	ld   (hl), d                                     ; $6710: $72
	ld   h, c                                        ; $6711: $61
	.db  $76                                         ; $6712: $76
	ld   h, l                                        ; $6713: $65
	ld   l, h                                        ; $6714: $6c
	ld   (hl), e                                     ; $6715: $73
	ld   bc, $2061                                   ; $6716: $01 $61 $20
	ld   (hl), e                                     ; $6719: $73
	ld   (hl), h                                     ; $671a: $74
	ld   (hl), d                                     ; $671b: $72
	ld   h, c                                        ; $671c: $61
	ld   l, c                                        ; $671d: $69
	ld   h, a                                        ; $671e: $67

jr_007_671f:
	ld   l, b                                        ; $671f: $68

jr_007_6720:
	ld   (hl), h                                     ; $6720: $74
	jr   nz, jr_007_6793                             ; $6721: $20 $70

	ld   h, c                                        ; $6723: $61
	ld   (hl), h                                     ; $6724: $74
	ld   l, b                                        ; $6725: $68
	ld   l, $ff                                      ; $6726: $2e $ff
	dec  bc                                          ; $6728: $0b
	.db  $10                                         ; $6729: $10
	ld   a, e                                        ; $672a: $7b
	add  hl, sp                                      ; $672b: $39
	jr   nc, -$01                                     ; $672c: $30 $ff

	ld   a, a                                        ; $672e: $7f
	inc  b                                           ; $672f: $04
	inc  bc                                          ; $6730: $03
	ld   c, b                                        ; $6731: $48
	ld   h, l                                        ; $6732: $65
	ld   (hl), d                                     ; $6733: $72
	ld   h, l                                        ; $6734: $65
	jr   nz, jr_007_67a0                             ; $6735: $20 $69

	ld   (hl), e                                     ; $6737: $73
	jr   nz, jr_007_679b                             ; $6738: $20 $61

	ld   l, (hl)                                     ; $673a: $6e

jr_007_673b:
	ld   l, a                                        ; $673b: $6f
	ld   (hl), h                                     ; $673c: $74
	ld   l, b                                        ; $673d: $68
	ld   h, l                                        ; $673e: $65
	ld   (hl), d                                     ; $673f: $72
	ld   bc, $6570                                   ; $6740: $01 $70 $65
	ld   h, c                                        ; $6743: $61
	ld   (hl), d                                     ; $6744: $72

jr_007_6745:
	jr   nz, jr_007_67ad                             ; $6745: $20 $66

	ld   l, a                                        ; $6747: $6f
	ld   (hl), d                                     ; $6748: $72
	jr   nz, jr_007_67c4                             ; $6749: $20 $79

	ld   l, a                                        ; $674b: $6f
	ld   (hl), l                                     ; $674c: $75
	ld   (hl), d                                     ; $674d: $72
	ld   bc, $6f63                                   ; $674e: $01 $63 $6f
	ld   l, h                                        ; $6751: $6c
	ld   l, h                                        ; $6752: $6c
	ld   h, l                                        ; $6753: $65
	ld   h, e                                        ; $6754: $63
	ld   (hl), h                                     ; $6755: $74
	ld   l, c                                        ; $6756: $69

jr_007_6757:
	ld   l, a                                        ; $6757: $6f
	ld   l, (hl)                                     ; $6758: $6e
	ld   l, $20                                      ; $6759: $2e $20
	ld   e, c                                        ; $675b: $59
	ld   l, a                                        ; $675c: $6f
	ld   (hl), l                                     ; $675d: $75
	jr   nz, jr_007_67c3                             ; $675e: $20 $63

	ld   h, c                                        ; $6760: $61
	ld   l, (hl)                                     ; $6761: $6e
	ld   bc, $6966                                   ; $6762: $01 $66 $69
	ld   l, (hl)                                     ; $6765: $6e
	ld   h, h                                        ; $6766: $64

jr_007_6767:
	jr   nz, $75                                     ; $6767: $20 $75

	ld   (hl), b                                     ; $6769: $70
	jr   nz, jr_007_67e0                             ; $676a: $20 $74

	ld   l, a                                        ; $676c: $6f
	jr   nz, $66                                     ; $676d: $20 $66

	ld   l, a                                        ; $676f: $6f
	ld   (hl), l                                     ; $6770: $75
	ld   (hl), d                                     ; $6771: $72
	jr   nz, jr_007_67e3                             ; $6772: $20 $6f

	ld   h, (hl)                                     ; $6774: $66

jr_007_6775:
	ld   bc, $6165                                   ; $6775: $01 $65 $61
	ld   h, e                                        ; $6778: $63
	ld   l, b                                        ; $6779: $68
	jr   nz, jr_007_67e2                             ; $677a: $20 $66

	ld   (hl), d                                     ; $677c: $72
	ld   (hl), l                                     ; $677d: $75
	ld   l, c                                        ; $677e: $69
	ld   (hl), h                                     ; $677f: $74
	ld   l, $ff                                      ; $6780: $2e $ff
	dec  bc                                          ; $6782: $0b
	.db  $10                                         ; $6783: $10

jr_007_6784:
	ld   a, e                                        ; $6784: $7b
	ldd  (hl), a                                     ; $6785: $32
	dec  (hl)                                        ; $6786: $35
	rst  $38                                         ; $6787: $ff
	ld   a, a                                        ; $6788: $7f
	ld   b, $0b                                      ; $6789: $06 $0b
	ld   d, h                                        ; $678b: $54
	ld   l, b                                        ; $678c: $68
	ld   h, l                                        ; $678d: $65
	jr   nz, jr_007_67d8                             ; $678e: $20 $48

	ld   h, l                                        ; $6790: $65
	ld   l, h                                        ; $6791: $6c
	ld   l, l                                        ; $6792: $6d

jr_007_6793:
	ld   h, l                                        ; $6793: $65
	ld   (hl), h                                     ; $6794: $74
	jr   nz, jr_007_6806                             ; $6795: $20 $6f

	ld   h, (hl)                                     ; $6797: $66
	ld   bc, $6153                                   ; $6798: $01 $53 $61

jr_007_679b:
	ld   l, h                                        ; $679b: $6c
	.db  $76                                         ; $679c: $76
	ld   h, c                                        ; $679d: $61
	ld   (hl), h                                     ; $679e: $74
	ld   l, c                                        ; $679f: $69

jr_007_67a0:
	ld   l, a                                        ; $67a0: $6f
	ld   l, (hl)                                     ; $67a1: $6e
	ld   bc, $7270                                   ; $67a2: $01 $70 $72
	ld   l, a                                        ; $67a5: $6f
	ld   (hl), h                                     ; $67a6: $74
	ld   h, l                                        ; $67a7: $65
	ld   h, e                                        ; $67a8: $63
	ld   (hl), h                                     ; $67a9: $74
	ld   (hl), e                                     ; $67aa: $73
	jr   nz, $79                                     ; $67ab: $20 $79

jr_007_67ad:
	ld   l, a                                        ; $67ad: $6f
	ld   (hl), l                                     ; $67ae: $75
	ld   bc, $7266                                   ; $67af: $01 $66 $72
	ld   l, a                                        ; $67b2: $6f
	ld   l, l                                        ; $67b3: $6d
	jr   nz, jr_007_681e                             ; $67b4: $20 $68

	ld   h, c                                        ; $67b6: $61
	ld   (hl), d                                     ; $67b7: $72
	ld   l, l                                        ; $67b8: $6d
	ld   h, (hl)                                     ; $67b9: $66
	ld   (hl), l                                     ; $67ba: $75
	ld   l, h                                        ; $67bb: $6c
	ld   bc, $7865                                   ; $67bc: $01 $65 $78
	ld   (hl), b                                     ; $67bf: $70
	ld   l, h                                        ; $67c0: $6c
	ld   l, a                                        ; $67c1: $6f
	ld   (hl), e                                     ; $67c2: $73

jr_007_67c3:
	ld   l, c                                        ; $67c3: $69

jr_007_67c4:
	ld   l, a                                        ; $67c4: $6f
	ld   l, (hl)                                     ; $67c5: $6e
	ld   (hl), e                                     ; $67c6: $73
	ld   l, $ff                                      ; $67c7: $2e $ff
	ld   a, a                                        ; $67c9: $7f
	inc  b                                           ; $67ca: $04
	inc  bc                                          ; $67cb: $03
	ld   d, e                                        ; $67cc: $53
	ld   h, c                                        ; $67cd: $61
	ld   l, l                                        ; $67ce: $6d
	ld   (hl), e                                     ; $67cf: $73
	ld   l, a                                        ; $67d0: $6f
	ld   l, (hl)                                     ; $67d1: $6e
	daa                                              ; $67d2: $27
	ld   (hl), e                                     ; $67d3: $73
	jr   nz, $4a                                     ; $67d4: $20 $4a

	ld   h, c                                        ; $67d6: $61
	ld   (hl), a                                     ; $67d7: $77

jr_007_67d8:
	ld   h, d                                        ; $67d8: $62
	ld   l, a                                        ; $67d9: $6f
	ld   l, (hl)                                     ; $67da: $6e
	ld   h, l                                        ; $67db: $65
	ld   bc, $6c61                                   ; $67dc: $01 $61 $6c
	ld   l, h                                        ; $67df: $6c

jr_007_67e0:
	ld   l, a                                        ; $67e0: $6f
	ld   (hl), a                                     ; $67e1: $77

jr_007_67e2:
	ld   (hl), e                                     ; $67e2: $73

jr_007_67e3:
	jr   nz, $79                                     ; $67e3: $20 $79

	ld   l, a                                        ; $67e5: $6f
	ld   (hl), l                                     ; $67e6: $75
	jr   nz, $74                                     ; $67e7: $20 $74

	ld   l, a                                        ; $67e9: $6f
	ld   bc, $6572                                   ; $67ea: $01 $72 $65
	ld   (hl), h                                     ; $67ed: $74
	ld   (hl), d                                     ; $67ee: $72
	ld   l, c                                        ; $67ef: $69
	ld   h, l                                        ; $67f0: $65
	.db  $76                                         ; $67f1: $76
	ld   h, l                                        ; $67f2: $65
	jr   nz, $69                                     ; $67f3: $20 $69

	ld   (hl), h                                     ; $67f5: $74
	ld   h, l                                        ; $67f6: $65
	ld   l, l                                        ; $67f7: $6d
	ld   (hl), e                                     ; $67f8: $73
	ld   l, $01                                      ; $67f9: $2e $01
	ld   d, e                                        ; $67fb: $53
	ld   h, l                                        ; $67fc: $65
	ld   l, h                                        ; $67fd: $6c
	ld   h, l                                        ; $67fe: $65

Jump_007_67ff:
	ld   h, e                                        ; $67ff: $63
	ld   (hl), h                                     ; $6800: $74
	jr   nz, jr_007_686c                             ; $6801: $20 $69

	ld   (hl), h                                     ; $6803: $74
	jr   nz, jr_007_686c                             ; $6804: $20 $66

jr_007_6806:
	ld   (hl), d                                     ; $6806: $72
	ld   l, a                                        ; $6807: $6f
	ld   l, l                                        ; $6808: $6d
	jr   nz, jr_007_687f                             ; $6809: $20 $74

	ld   l, b                                        ; $680b: $68
	ld   h, l                                        ; $680c: $65
	ld   bc, $656d                                   ; $680d: $01 $6d $65
	ld   l, (hl)                                     ; $6810: $6e
	ld   (hl), l                                     ; $6811: $75
	jr   nz, jr_007_6875                             ; $6812: $20 $61

	ld   l, (hl)                                     ; $6814: $6e
	ld   h, h                                        ; $6815: $64
	jr   nz, jr_007_688d                             ; $6816: $20 $75

	ld   (hl), e                                     ; $6818: $73
	ld   h, l                                        ; $6819: $65
	jr   nz, $42                                     ; $681a: $20 $42

	jr   nz, jr_007_6892                             ; $681c: $20 $74

jr_007_681e:
	ld   l, a                                        ; $681e: $6f
	ld   bc, $6874                                   ; $681f: $01 $74 $68
	ld   (hl), d                                     ; $6822: $72
	ld   l, a                                        ; $6823: $6f
	ld   (hl), a                                     ; $6824: $77
	jr   nz, $69                                     ; $6825: $20 $69

	ld   (hl), h                                     ; $6827: $74
	ld   l, $ff                                      ; $6828: $2e $ff
	dec  bc                                          ; $682a: $0b
	.db  $10                                         ; $682b: $10
	ld   a, e                                        ; $682c: $7b
	ld   sp, $3539                                   ; $682d: $31 $39 $35
	rst  $38                                         ; $6830: $ff
	ld   a, a                                        ; $6831: $7f
	inc  c                                           ; $6832: $0c
	ld   ($6854), sp                                 ; $6833: $08 $54 $68
	ld   l, c                                        ; $6836: $69
	ld   (hl), e                                     ; $6837: $73
	jr   nz, jr_007_689d                             ; $6838: $20 $63

	ld   h, c                                        ; $683a: $61
	.db  $76                                         ; $683b: $76
	ld   h, l                                        ; $683c: $65
	jr   nz, jr_007_68a8                             ; $683d: $20 $69

	ld   (hl), e                                     ; $683f: $73
	jr   nz, jr_007_68a7                             ; $6840: $20 $65

	ld   l, l                                        ; $6842: $6d
	ld   (hl), b                                     ; $6843: $70
	ld   (hl), h                                     ; $6844: $74
	ld   a, c                                        ; $6845: $79
	ld   l, $ff                                      ; $6846: $2e $ff
	ld   a, a                                        ; $6848: $7f
	inc  b                                           ; $6849: $04
	inc  bc                                          ; $684a: $03
	ld   e, c                                        ; $684b: $59
	ld   l, a                                        ; $684c: $6f
	ld   (hl), l                                     ; $684d: $75
	jr   nz, jr_007_68b8                             ; $684e: $20 $68

	ld   h, c                                        ; $6850: $61
	.db  $76                                         ; $6851: $76
	ld   h, l                                        ; $6852: $65
	jr   nz, jr_007_68c3                             ; $6853: $20 $6e

	ld   l, a                                        ; $6855: $6f
	jr   nz, jr_007_68c8                             ; $6856: $20 $70

	ld   l, h                                        ; $6858: $6c
	ld   h, c                                        ; $6859: $61
	ld   h, e                                        ; $685a: $63
	ld   h, l                                        ; $685b: $65
	ld   bc, $6e69                                   ; $685c: $01 $69 $6e
	jr   nz, jr_007_68c2                             ; $685f: $20 $61

	jr   nz, jr_007_68c5                             ; $6861: $20 $62

	ld   h, c                                        ; $6863: $61
	ld   (hl), d                                     ; $6864: $72
	ld   l, $20                                      ; $6865: $2e $20
	ld   b, c                                        ; $6867: $41
	ld   (hl), e                                     ; $6868: $73
	ld   bc, $7570                                   ; $6869: $01 $70 $75

jr_007_686c:
	ld   l, (hl)                                     ; $686c: $6e
	ld   l, c                                        ; $686d: $69
	ld   (hl), e                                     ; $686e: $73
	ld   l, b                                        ; $686f: $68
	ld   l, l                                        ; $6870: $6d
	ld   h, l                                        ; $6871: $65
	ld   l, (hl)                                     ; $6872: $6e
	ld   (hl), h                                     ; $6873: $74
	inc  l                                           ; $6874: $2c

jr_007_6875:
	jr   nz, jr_007_68c0                             ; $6875: $20 $49

	ld   bc, $6d61                                   ; $6877: $01 $61 $6d
	jr   nz, jr_007_68f0                             ; $687a: $20 $74

	ld   h, c                                        ; $687c: $61
	ld   l, e                                        ; $687d: $6b
	ld   l, c                                        ; $687e: $69

jr_007_687f:
	ld   l, (hl)                                     ; $687f: $6e
	ld   h, a                                        ; $6880: $67
	jr   nz, jr_007_68e5                             ; $6881: $20 $62

	ld   h, c                                        ; $6883: $61
	ld   h, e                                        ; $6884: $63
	ld   l, e                                        ; $6885: $6b
	jr   nz, jr_007_68fc                             ; $6886: $20 $74

	ld   l, b                                        ; $6888: $68
	ld   h, l                                        ; $6889: $65
	ld   bc, $6542                                   ; $688a: $01 $42 $65

jr_007_688d:
	ld   l, h                                        ; $688d: $6c
	ld   (hl), h                                     ; $688e: $74
	jr   nz, $6f                                     ; $688f: $20 $6f

	ld   h, (hl)                                     ; $6891: $66

jr_007_6892:
	jr   nz, $54                                     ; $6892: $20 $54

	ld   (hl), d                                     ; $6894: $72
	ld   (hl), l                                     ; $6895: $75
	ld   (hl), h                                     ; $6896: $74
	ld   l, b                                        ; $6897: $68
	ld   l, $20                                      ; $6898: $2e $20
	ld   e, c                                        ; $689a: $59
	ld   l, a                                        ; $689b: $6f
	ld   (hl), l                                     ; $689c: $75

jr_007_689d:
	ld   bc, $6163                                   ; $689d: $01 $63 $61
	ld   l, (hl)                                     ; $68a0: $6e
	jr   nz, jr_007_6915                             ; $68a1: $20 $72

	ld   h, l                                        ; $68a3: $65
	ld   h, e                                        ; $68a4: $63
	ld   l, h                                        ; $68a5: $6c
	ld   h, c                                        ; $68a6: $61

jr_007_68a7:
	ld   l, c                                        ; $68a7: $69

jr_007_68a8:
	ld   l, l                                        ; $68a8: $6d
	jr   nz, $69                                     ; $68a9: $20 $69

	ld   (hl), h                                     ; $68ab: $74
	jr   nz, $69                                     ; $68ac: $20 $69

	ld   l, (hl)                                     ; $68ae: $6e
	ld   bc, $6874                                   ; $68af: $01 $74 $68
	ld   h, l                                        ; $68b2: $65
	jr   nz, jr_007_6928                             ; $68b3: $20 $73

	ld   l, h                                        ; $68b5: $6c
	ld   (hl), l                                     ; $68b6: $75
	ld   l, l                                        ; $68b7: $6d

jr_007_68b8:
	ld   l, $ff                                      ; $68b8: $2e $ff
	ld   a, a                                        ; $68ba: $7f
	inc  b                                           ; $68bb: $04
	inc  bc                                          ; $68bc: $03
	ld   e, c                                        ; $68bd: $59
	ld   l, a                                        ; $68be: $6f
	ld   (hl), l                                     ; $68bf: $75

jr_007_68c0:
	jr   nz, jr_007_692a                             ; $68c0: $20 $68

jr_007_68c2:
	ld   h, c                                        ; $68c2: $61

jr_007_68c3:
	.db  $76                                         ; $68c3: $76
	ld   h, l                                        ; $68c4: $65

jr_007_68c5:
	jr   nz, jr_007_6935                             ; $68c5: $20 $6e

	ld   l, a                                        ; $68c7: $6f

jr_007_68c8:
	jr   nz, jr_007_693a                             ; $68c8: $20 $70

	ld   l, h                                        ; $68ca: $6c
	ld   h, c                                        ; $68cb: $61
	ld   h, e                                        ; $68cc: $63
	ld   h, l                                        ; $68cd: $65
	ld   bc, $6e69                                   ; $68ce: $01 $69 $6e
	jr   nz, jr_007_6934                             ; $68d1: $20 $61

	jr   nz, jr_007_6938                             ; $68d3: $20 $63

	ld   h, c                                        ; $68d5: $61
	ld   (hl), e                                     ; $68d6: $73
	ld   l, c                                        ; $68d7: $69
	ld   l, (hl)                                     ; $68d8: $6e
	ld   l, a                                        ; $68d9: $6f
	ld   l, $20                                      ; $68da: $2e $20
	ld   c, c                                        ; $68dc: $49
	jr   nz, jr_007_6940                             ; $68dd: $20 $61

	ld   l, l                                        ; $68df: $6d
	ld   bc, $6174                                   ; $68e0: $01 $74 $61
	ld   l, e                                        ; $68e3: $6b
	ld   l, c                                        ; $68e4: $69

jr_007_68e5:
	ld   l, (hl)                                     ; $68e5: $6e
	ld   h, a                                        ; $68e6: $67
	jr   nz, jr_007_694b                             ; $68e7: $20 $62

	ld   h, c                                        ; $68e9: $61
	ld   h, e                                        ; $68ea: $63
	ld   l, e                                        ; $68eb: $6b
	jr   nz, jr_007_6962                             ; $68ec: $20 $74

	ld   l, b                                        ; $68ee: $68
	ld   h, l                                        ; $68ef: $65

jr_007_68f0:
	ld   bc, $7242                                   ; $68f0: $01 $42 $72
	ld   h, l                                        ; $68f3: $65
	ld   h, c                                        ; $68f4: $61
	ld   (hl), e                                     ; $68f5: $73
	ld   (hl), h                                     ; $68f6: $74
	ld   (hl), b                                     ; $68f7: $70
	ld   l, h                                        ; $68f8: $6c
	ld   h, c                                        ; $68f9: $61
	ld   (hl), h                                     ; $68fa: $74
	ld   h, l                                        ; $68fb: $65

jr_007_68fc:
	jr   nz, jr_007_696d                             ; $68fc: $20 $6f

	ld   h, (hl)                                     ; $68fe: $66
	ld   bc, $6952                                   ; $68ff: $01 $52 $69
	ld   h, a                                        ; $6902: $67
	ld   l, b                                        ; $6903: $68
	ld   (hl), h                                     ; $6904: $74
	ld   h, l                                        ; $6905: $65
	ld   l, a                                        ; $6906: $6f
	ld   (hl), l                                     ; $6907: $75
	ld   (hl), e                                     ; $6908: $73
	ld   l, (hl)                                     ; $6909: $6e
	ld   h, l                                        ; $690a: $65
	ld   (hl), e                                     ; $690b: $73
	ld   (hl), e                                     ; $690c: $73
	ld   l, $20                                      ; $690d: $2e $20
	ld   e, c                                        ; $690f: $59
	ld   l, a                                        ; $6910: $6f
	ld   (hl), l                                     ; $6911: $75
	ld   bc, $6163                                   ; $6912: $01 $63 $61

jr_007_6915:
	ld   l, (hl)                                     ; $6915: $6e
	jr   nz, jr_007_698a                             ; $6916: $20 $72

	ld   h, l                                        ; $6918: $65
	ld   h, e                                        ; $6919: $63
	ld   l, h                                        ; $691a: $6c
	ld   h, c                                        ; $691b: $61
	ld   l, c                                        ; $691c: $69
	ld   l, l                                        ; $691d: $6d
	jr   nz, jr_007_6989                             ; $691e: $20 $69

	ld   (hl), h                                     ; $6920: $74
	jr   nz, jr_007_698c                             ; $6921: $20 $69

	ld   l, (hl)                                     ; $6923: $6e
	ld   bc, $6874                                   ; $6924: $01 $74 $68
	ld   h, l                                        ; $6927: $65

jr_007_6928:
	jr   nz, jr_007_699d                             ; $6928: $20 $73

jr_007_692a:
	ld   l, h                                        ; $692a: $6c
	ld   (hl), l                                     ; $692b: $75
	ld   l, l                                        ; $692c: $6d
	ld   l, $ff                                      ; $692d: $2e $ff
	ld   a, a                                        ; $692f: $7f
	inc  b                                           ; $6930: $04
	inc  bc                                          ; $6931: $03
	ld   e, c                                        ; $6932: $59
	ld   l, a                                        ; $6933: $6f

jr_007_6934:
	ld   (hl), l                                     ; $6934: $75

jr_007_6935:
	jr   nz, jr_007_699f                             ; $6935: $20 $68

	ld   h, c                                        ; $6937: $61

jr_007_6938:
	.db  $76                                         ; $6938: $76
	ld   h, l                                        ; $6939: $65

jr_007_693a:
	jr   nz, $66                                     ; $693a: $20 $66

	ld   l, a                                        ; $693c: $6f
	ld   (hl), l                                     ; $693d: $75
	ld   l, (hl)                                     ; $693e: $6e
	ld   h, h                                        ; $693f: $64

jr_007_6940:
	jr   nz, jr_007_69b6                             ; $6940: $20 $74

	ld   l, b                                        ; $6942: $68
	ld   h, l                                        ; $6943: $65
	ld   bc, $6853                                   ; $6944: $01 $53 $68
	ld   l, c                                        ; $6947: $69
	ld   h, l                                        ; $6948: $65
	ld   l, h                                        ; $6949: $6c
	ld   h, h                                        ; $694a: $64

jr_007_694b:
	jr   nz, jr_007_69bc                             ; $694b: $20 $6f

	ld   h, (hl)                                     ; $694d: $66
	jr   nz, jr_007_6996                             ; $694e: $20 $46

	ld   h, c                                        ; $6950: $61
	ld   l, c                                        ; $6951: $69
	ld   (hl), h                                     ; $6952: $74
	ld   l, b                                        ; $6953: $68
	ld   l, $01                                      ; $6954: $2e $01
	ld   d, h                                        ; $6956: $54
	ld   l, b                                        ; $6957: $68
	ld   h, l                                        ; $6958: $65
	jr   nz, jr_007_69c1                             ; $6959: $20 $66

	ld   l, c                                        ; $695b: $69
	ld   h, l                                        ; $695c: $65
	ld   (hl), d                                     ; $695d: $72
	ld   a, c                                        ; $695e: $79
	jr   nz, jr_007_69c5                             ; $695f: $20 $64

	ld   h, c                                        ; $6961: $61

jr_007_6962:
	ld   (hl), d                                     ; $6962: $72
	ld   (hl), h                                     ; $6963: $74
	ld   (hl), e                                     ; $6964: $73
	ld   bc, $6f77                                   ; $6965: $01 $77 $6f
	ld   l, (hl)                                     ; $6968: $6e
	daa                                              ; $6969: $27
	ld   (hl), h                                     ; $696a: $74
	jr   nz, jr_007_69d5                             ; $696b: $20 $68

jr_007_696d:
	ld   h, c                                        ; $696d: $61
	ld   (hl), d                                     ; $696e: $72
	ld   l, l                                        ; $696f: $6d
	jr   nz, jr_007_69eb                             ; $6970: $20 $79

	ld   l, a                                        ; $6972: $6f
	ld   (hl), l                                     ; $6973: $75
	jr   nz, $6e                                     ; $6974: $20 $6e

	ld   l, a                                        ; $6976: $6f
	ld   (hl), a                                     ; $6977: $77
	ld   hl, $7fff                                   ; $6978: $21 $ff $7f
	add  hl, bc                                      ; $697b: $09
	ld   bc, $2707                                   ; $697c: $01 $07 $27
	inc  c                                           ; $697f: $0c

Jump_007_6980:
	ld   b, d                                        ; $6980: $42
	ld   ($8582), sp                                 ; $6981: $08 $82 $85
	ld   l, c                                        ; $6984: $69
	inc  h                                           ; $6985: $24
	add  hl, bc                                      ; $6986: $09
	inc  c                                           ; $6987: $0c
	add  d                                           ; $6988: $82

jr_007_6989:
	sub  e                                           ; $6989: $93

jr_007_698a:
	ld   l, c                                        ; $698a: $69
	adc  d                                           ; $698b: $8a

jr_007_698c:
	sub  e                                           ; $698c: $93
	ld   l, c                                        ; $698d: $69
	ld   b, d                                        ; $698e: $42
	ld   bc, $8881                                   ; $698f: $01 $81 $88
	ld   l, c                                        ; $6992: $69
	inc  h                                           ; $6993: $24
	add  hl, bc                                      ; $6994: $09
	inc  c                                           ; $6995: $0c

jr_007_6996:
	add  d                                           ; $6996: $82
	sbc  (hl)                                        ; $6997: $9e
	ld   l, c                                        ; $6998: $69
	ld   b, d                                        ; $6999: $42
	ld   bc, $9681                                   ; $699a: $01 $81 $96

jr_007_699d:
	ld   l, c                                        ; $699d: $69
	inc  h                                           ; $699e: $24

jr_007_699f:
	ld   b, d                                        ; $699f: $42
	ld   bc, $9f82                                   ; $69a0: $01 $82 $9f
	ld   l, c                                        ; $69a3: $69
	ld   b, d                                        ; $69a4: $42
	dec  b                                           ; $69a5: $05
	add  d                                           ; $69a6: $82
	sbc  a                                           ; $69a7: $9f
	ld   l, c                                        ; $69a8: $69
	inc  h                                           ; $69a9: $24
	ld   d, h                                        ; $69aa: $54
	rst  $38                                         ; $69ab: $ff
	ld   d, e                                        ; $69ac: $53
	ld   bc, $5f89                                   ; $69ad: $01 $89 $5f
	rla                                              ; $69b0: $17
	ld   b, d                                        ; $69b1: $42
	ld   (bc), a                                     ; $69b2: $02
	inc  h                                           ; $69b3: $24
	ld   d, h                                        ; $69b4: $54
	rst  $38                                         ; $69b5: $ff

jr_007_69b6:
	ld   c, (hl)                                     ; $69b6: $4e
	ld   bc, $5f89                                   ; $69b7: $01 $89 $5f
	rla                                              ; $69ba: $17
	ld   b, d                                        ; $69bb: $42

jr_007_69bc:
	ld   (bc), a                                     ; $69bc: $02
	inc  h                                           ; $69bd: $24
	ld   b, l                                        ; $69be: $45
	inc  b                                           ; $69bf: $04
	ld   b, l                                        ; $69c0: $45

jr_007_69c1:
	inc  b                                           ; $69c1: $04
	ld   b, l                                        ; $69c2: $45
	inc  b                                           ; $69c3: $04
	ld   b, l                                        ; $69c4: $45

jr_007_69c5:
	inc  b                                           ; $69c5: $04
	ld   b, l                                        ; $69c6: $45
	inc  b                                           ; $69c7: $04
	ld   b, l                                        ; $69c8: $45
	inc  b                                           ; $69c9: $04
	ld   b, l                                        ; $69ca: $45
	inc  b                                           ; $69cb: $04
	ld   b, l                                        ; $69cc: $45
	inc  b                                           ; $69cd: $04
	ld   b, l                                        ; $69ce: $45
	inc  b                                           ; $69cf: $04
	inc  h                                           ; $69d0: $24
	ld   b, l                                        ; $69d1: $45
	ld   ($0845), sp                                 ; $69d2: $08 $45 $08

jr_007_69d5:
	ld   b, l                                        ; $69d5: $45
	ld   ($0845), sp                                 ; $69d6: $08 $45 $08
	ld   b, l                                        ; $69d9: $45
	ld   ($0845), sp                                 ; $69da: $08 $45 $08
	ld   b, l                                        ; $69dd: $45
	ld   ($0845), sp                                 ; $69de: $08 $45 $08
	ld   b, l                                        ; $69e1: $45
	ld   ($5424), sp                                 ; $69e2: $08 $24 $54
	add  b                                           ; $69e5: $80
	add  b                                           ; $69e6: $80
	ld   ($8540), sp                                 ; $69e7: $08 $40 $85
	add  hl, bc                                      ; $69ea: $09

jr_007_69eb:
	ld   l, d                                        ; $69eb: $6a
	add  l                                           ; $69ec: $85
	add  hl, bc                                      ; $69ed: $09
	ld   l, d                                        ; $69ee: $6a
	add  l                                           ; $69ef: $85
	add  hl, bc                                      ; $69f0: $09
	ld   l, d                                        ; $69f1: $6a
	add  l                                           ; $69f2: $85
	add  hl, bc                                      ; $69f3: $09
	ld   l, d                                        ; $69f4: $6a
	add  l                                           ; $69f5: $85
	add  hl, bc                                      ; $69f6: $09
	ld   l, d                                        ; $69f7: $6a
	add  e                                           ; $69f8: $83
	scf                                              ; $69f9: $37
	ld   l, d                                        ; $69fa: $6a
	sub  c                                           ; $69fb: $91
	ld   bc, $54ff                                   ; $69fc: $01 $ff $54
	rst  $38                                         ; $69ff: $ff
	ld   b, d                                        ; $6a00: $42
	ld   e, d                                        ; $6a01: $5a
	ld   d, h                                        ; $6a02: $54
	add  b                                           ; $6a03: $80
	ld   b, d                                        ; $6a04: $42
	ld   bc, $0281                                   ; $6a05: $01 $81 $02
	ld   l, d                                        ; $6a08: $6a
	ld   d, h                                        ; $6a09: $54
	add  b                                           ; $6a0a: $80
	rst  $00                                         ; $6a0b: $c7
	ret  c                                           ; $6a0c: $d8

	add  b                                           ; $6a0d: $80
	add  b                                           ; $6a0e: $80
	sub  b                                           ; $6a0f: $90
	.db  $10                                         ; $6a10: $10
	nop                                              ; $6a11: $00
	jp   nz, $0908                                   ; $6a12: $c2 $08 $09

	ld   l, d                                        ; $6a15: $6a
	sub  b                                           ; $6a16: $90
	ret  nz                                          ; $6a17: $c0

	nop                                              ; $6a18: $00
	sub  b                                           ; $6a19: $90
	ret  nz                                          ; $6a1a: $c0

	nop                                              ; $6a1b: $00
	ld   b, d                                        ; $6a1c: $42
	inc  b                                           ; $6a1d: $04
	ld   d, h                                        ; $6a1e: $54
	add  b                                           ; $6a1f: $80
	rst  $00                                         ; $6a20: $c7
	sbc  h                                           ; $6a21: $9c
	add  b                                           ; $6a22: $80
	add  b                                           ; $6a23: $80
	sub  b                                           ; $6a24: $90
	.db  $10                                         ; $6a25: $10
	nop                                              ; $6a26: $00
	jp   nz, $1e08                                   ; $6a27: $c2 $08 $1e

	ld   l, d                                        ; $6a2a: $6a
	sub  b                                           ; $6a2b: $90
	ret  nz                                          ; $6a2c: $c0

	nop                                              ; $6a2d: $00
	sub  b                                           ; $6a2e: $90
	ret  nz                                          ; $6a2f: $c0

	nop                                              ; $6a30: $00
	ld   b, d                                        ; $6a31: $42
	inc  b                                           ; $6a32: $04
	sub  b                                           ; $6a33: $90
	nop                                              ; $6a34: $00
	.db  $10                                         ; $6a35: $10
	inc  h                                           ; $6a36: $24
	add  hl, bc                                      ; $6a37: $09
	inc  bc                                          ; $6a38: $03
	jr   nz, jr_007_6a5b                             ; $6a39: $20 $20

	ld   c, b                                        ; $6a3b: $48
	ld   h, c                                        ; $6a3c: $61
	ld   l, h                                        ; $6a3d: $6c
	ld   l, h                                        ; $6a3e: $6c
	ld   h, l                                        ; $6a3f: $65
	ld   l, h                                        ; $6a40: $6c
	ld   (hl), l                                     ; $6a41: $75
	ld   l, d                                        ; $6a42: $6a
	ld   h, c                                        ; $6a43: $61
	ld   l, b                                        ; $6a44: $68
	ld   hl, $0120                                   ; $6a45: $21 $20 $01
	jr   nz, jr_007_6a6a                             ; $6a48: $20 $20

	jr   nz, $59                                     ; $6a4a: $20 $59

	ld   l, a                                        ; $6a4c: $6f
	ld   (hl), l                                     ; $6a4d: $75
	jr   nz, jr_007_6ab8                             ; $6a4e: $20 $68

	ld   h, c                                        ; $6a50: $61
	.db  $76                                         ; $6a51: $76
	ld   h, l                                        ; $6a52: $65
	jr   nz, $20                                     ; $6a53: $20 $20

	jr   nz, $01                                     ; $6a55: $20 $01

	jr   nz, $64                                     ; $6a57: $20 $64

	ld   h, l                                        ; $6a59: $65
	ld   h, (hl)                                     ; $6a5a: $66

jr_007_6a5b:
	ld   h, l                                        ; $6a5b: $65
	ld   h, c                                        ; $6a5c: $61
	ld   (hl), h                                     ; $6a5d: $74
	ld   h, l                                        ; $6a5e: $65
	ld   h, h                                        ; $6a5f: $64
	jr   nz, jr_007_6ad6                             ; $6a60: $20 $74

	ld   l, b                                        ; $6a62: $68
	ld   h, l                                        ; $6a63: $65
	jr   nz, $01                                     ; $6a64: $20 $01

	jr   nz, $66                                     ; $6a66: $20 $66

	ld   l, a                                        ; $6a68: $6f
	ld   h, l                                        ; $6a69: $65

jr_007_6a6a:
	jr   nz, jr_007_6acd                             ; $6a6a: $20 $61

	ld   l, (hl)                                     ; $6a6c: $6e
	ld   h, h                                        ; $6a6d: $64
	jr   nz, jr_007_6ad6                             ; $6a6e: $20 $66

	ld   (hl), d                                     ; $6a70: $72
	ld   h, l                                        ; $6a71: $65
	ld   h, l                                        ; $6a72: $65
	ld   h, h                                        ; $6a73: $64
	ld   bc, $6874                                   ; $6a74: $01 $74 $68
	ld   h, l                                        ; $6a77: $65
	jr   nz, jr_007_6add                             ; $6a78: $20 $63

	ld   l, c                                        ; $6a7a: $69
	ld   (hl), h                                     ; $6a7b: $74
	ld   a, c                                        ; $6a7c: $79
	jr   nz, jr_007_6ae5                             ; $6a7d: $20 $66

	ld   (hl), d                                     ; $6a7f: $72
	ld   l, a                                        ; $6a80: $6f
	ld   l, l                                        ; $6a81: $6d
	jr   nz, jr_007_6a85                             ; $6a82: $20 $01

	ld   l, b                                        ; $6a84: $68

jr_007_6a85:
	ld   l, c                                        ; $6a85: $69
	ld   (hl), e                                     ; $6a86: $73
	jr   nz, jr_007_6aee                             ; $6a87: $20 $65

	.db  $76                                         ; $6a89: $76
	ld   l, c                                        ; $6a8a: $69
	ld   l, h                                        ; $6a8b: $6c
	jr   nz, jr_007_6b00                             ; $6a8c: $20 $72

	ld   (hl), l                                     ; $6a8e: $75
	ld   l, h                                        ; $6a8f: $6c
	ld   h, l                                        ; $6a90: $65
	ld   l, $01                                      ; $6a91: $2e $01
	ld   b, a                                        ; $6a93: $47
	ld   l, a                                        ; $6a94: $6f
	ld   h, h                                        ; $6a95: $64
	jr   nz, jr_007_6afa                             ; $6a96: $20 $62

	ld   l, h                                        ; $6a98: $6c
	ld   h, l                                        ; $6a99: $65
	ld   (hl), e                                     ; $6a9a: $73
	ld   (hl), e                                     ; $6a9b: $73
	.db $20 $79

	ld   l, a                                        ; $6a9e: $6f
	ld   (hl), l                                     ; $6a9f: $75
	jr   nz, jr_007_6aa3                             ; $6aa0: $20 $01

	ld   l, c                                        ; $6aa2: $69

jr_007_6aa3:
	ld   l, (hl)                                     ; $6aa3: $6e
	jr   nz, jr_007_6b07                             ; $6aa4: $20 $61

	ld   l, h                                        ; $6aa6: $6c
	ld   l, h                                        ; $6aa7: $6c
	.db $20 $79

	ld   l, a                                        ; $6aaa: $6f
	ld   (hl), l                                     ; $6aab: $75
	.db $20 $64

	ld   l, a                                        ; $6aae: $6f
	ld   hl, $7fff                                   ; $6aaf: $21 $ff $7f
	ld   a, e                                        ; $6ab2: $7b
	dec  sp                                          ; $6ab3: $3b
	ccf                                              ; $6ab4: $3f
	ld   (bc), a                                     ; $6ab5: $02
	ld   d, h                                        ; $6ab6: $54
	rst  $38                                         ; $6ab7: $ff

jr_007_6ab8:
	add  hl, bc                                      ; $6ab8: $09
	ld   b, a                                        ; $6ab9: $47
	inc  bc                                          ; $6aba: $03
	ld   ($0241), sp                                 ; $6abb: $08 $41 $02
	inc  c                                           ; $6abe: $0c
	ld   b, b                                        ; $6abf: $40
	ld   ($fa83), sp                                 ; $6ac0: $08 $83 $fa
	ld   l, d                                        ; $6ac3: $6a
	jp   nz, $bf1b                                   ; $6ac4: $c2 $1b $bf

	ld   l, d                                        ; $6ac7: $6a
	pop  bc                                          ; $6ac8: $c1
	ld   l, b                                        ; $6ac9: $68
	and  b                                           ; $6aca: $a0
	jr   nc, $40                                     ; $6acb: $30 $40

jr_007_6acd:
	ld   ($fa83), sp                                 ; $6acd: $08 $83 $fa
	ld   l, d                                        ; $6ad0: $6a
	jp   nz, $cc02                                   ; $6ad1: $c2 $02 $cc

	ld   l, d                                        ; $6ad4: $6a
	ld   b, b                                        ; $6ad5: $40

jr_007_6ad6:
	ld   ($0442), sp                                 ; $6ad6: $08 $42 $04
	rlca                                             ; $6ad9: $07
	pop  bc                                          ; $6ada: $c1
	ld   h, (hl)                                     ; $6adb: $66
	nop                                              ; $6adc: $00

jr_007_6add:
	nop                                              ; $6add: $00
	ld   b, d                                        ; $6ade: $42
	ld   bc, $de81                                   ; $6adf: $01 $81 $de
	ld   l, d                                        ; $6ae2: $6a
	add  hl, bc                                      ; $6ae3: $09
	ld   b, a                                        ; $6ae4: $47

jr_007_6ae5:
	inc  bc                                          ; $6ae5: $03
	ld   ($0241), sp                                 ; $6ae6: $08 $41 $02
	inc  c                                           ; $6ae9: $0c
	add  e                                           ; $6aea: $83
	rst  $38                                         ; $6aeb: $ff
	ld   l, d                                        ; $6aec: $6a
	ld   b, b                                        ; $6aed: $40

jr_007_6aee:
	ld   ($0583), sp                                 ; $6aee: $08 $83 $05
	ld   l, e                                        ; $6af1: $6b
	ld   b, b                                        ; $6af2: $40
	ld   ($0a83), sp                                 ; $6af3: $08 $83 $0a
	ld   l, e                                        ; $6af6: $6b
	add  c                                           ; $6af7: $81
	sbc  $6a                                         ; $6af8: $de $6a

jr_007_6afa:
	add  b                                           ; $6afa: $80
	add  b                                           ; $6afb: $80
	ld   e, l                                        ; $6afc: $5d

jr_007_6afd:
	rst  $38                                         ; $6afd: $ff
	ld   a, a                                        ; $6afe: $7f
	rlca                                             ; $6aff: $07

jr_007_6b00:
	inc  d                                           ; $6b00: $14
	.db $20 $20

	rst  $38                                         ; $6b03: $ff
	ld   a, a                                        ; $6b04: $7f
	rlca                                             ; $6b05: $07
	inc  de                                          ; $6b06: $13

jr_007_6b07:
	jr   nz, -$01                                     ; $6b07: $20 $ff

	ld   a, a                                        ; $6b09: $7f
	rlca                                             ; $6b0a: $07
	ld   (de), a                                     ; $6b0b: $12
	jr   nz, -$01                                     ; $6b0c: $20 $ff

	ld   a, a                                        ; $6b0e: $7f
