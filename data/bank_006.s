; Disassembly of "OR"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3

;;
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
