text_trueFalse:
	.asc "TrueFalse"


text_questionNum:
	.dw $9821
	.asc "Question #"


text_prize:
	.dw $9861
	.asc "Prize:"
	
data_01_0af1:
	.dw $9847
	.db $d4 $d6
	
	
data_01_0af5:
	.db $67
	sbc  b                                           ; $4af6: $98
	push de                                          ; $4af7: $d5
	rst  $10                                         ; $4af8: $d7
	
data_01_0af9:
	ld   b, a                                        ; $4af9: $47
	sbc  b                                           ; $4afa: $98
	call c, $e0de                                    ; $4afb: $dc $de $e0
	ld   ($ff00+c), a                                ; $4afe: $e2
	ldh  (<$e2), a                                   ; $4aff: $e0 $e2
	
data_01_0b01:
	ld   h, a                                        ; $4b01: $67
	sbc  b                                           ; $4b02: $98
	.db  $dd                                         ; $4b03: $dd
	rst  $18                                         ; $4b04: $df
	pop  hl                                          ; $4b05: $e1
	.db  $e3                                         ; $4b06: $e3
	pop  hl                                          ; $4b07: $e1
	.db  $e3                                         ; $4b08: $e3
	
data_01_0b09:
	ld   c, b                                        ; $4b09: $48
	sbc  b                                           ; $4b0a: $98
	ldh  (<$e2), a                                   ; $4b0b: $e0 $e2
	
data_01_0b0d:
	ld   l, b                                        ; $4b0d: $68
	sbc  b                                           ; $4b0e: $98
	pop  hl                                          ; $4b0f: $e1
	.db  $e3                                         ; $4b10: $e3
	
data_01_0b11:
	.dw $982e
	or   h                                           ; $4b13: $b4
	or   (hl)                                        ; $4b14: $b6
	cp   b                                           ; $4b15: $b8
	cp   d                                           ; $4b16: $ba
	
data_01_0b17:
	ld   c, (hl)                                     ; $4b17: $4e
	sbc  b                                           ; $4b18: $98
	or   l                                           ; $4b19: $b5
	or   a                                           ; $4b1a: $b7
	cp   c                                           ; $4b1b: $b9
	cp   e                                           ; $4b1c: $bb
	
data_01_0b1d:
	ld   l, (hl)                                     ; $4b1d: $6e
	sbc  b                                           ; $4b1e: $98
	.db  $f4                                         ; $4b1f: $f4
	or   $f8                                         ; $4b20: $f6 $f8
	.db $fa
	
	
data_01_0b23:
	.db $8e $98
	push af                                          ; $4b25: $f5
	rst  $30                                         ; $4b26: $f7
	ld   sp, hl                                      ; $4b27: $f9
	ei                                               ; $4b28: $fb



func_01_0b29:
	ld   hl, wNPCScriptParam1                                   ; $4b29: $21 $20 $c0
	ld   a, (hl)                                     ; $4b2c: $7e
	ld   hl, $c00a                                   ; $4b2d: $21 $0a $c0
	ld   (hl), a                                     ; $4b30: $77
	cp   $ff                                         ; $4b31: $fe $ff
	jr   nz, @next_0b49                             ; $4b33: $20 $14

	ld   hl, $c4df                                   ; $4b35: $21 $df $c4
	ld   a, (hl)                                     ; $4b38: $7e
	ld   hl, $c00a                                   ; $4b39: $21 $0a $c0
	ld   (hl), a                                     ; $4b3c: $77
	add  $01                                         ; $4b3d: $c6 $01
	cp   $fa                                         ; $4b3f: $fe $fa
	jr   c, +                              ; $4b41: $38 $02

	ld   a, $00                                      ; $4b43: $3e $00

+
	ld   hl, $c4df                                   ; $4b45: $21 $df $c4
	ld   (hl), a                                     ; $4b48: $77

@next_0b49:
	call func_01_0bed                                       ; $4b49: $cd $ed $0b

	ld   hl, text_prize                                   ; $4b4c: $21 $e9 $0a
	ld   c, $06                                      ; $4b4f: $0e $06
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4b51: $cd $dd $0b

	ld   hl, text_questionNum                                   ; $4b54: $21 $dd $0a
	ld   c, $0a                                      ; $4b57: $0e $0a
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4b59: $cd $dd $0b

	ld   c, $04                                      ; $4b5c: $0e $04
	ld   hl, data_01_0b11                                   ; $4b5e: $21 $11 $0b
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4b61: $cd $dd $0b

	ld   c, $04                                      ; $4b64: $0e $04
	ld   hl, data_01_0b17                                   ; $4b66: $21 $17 $0b
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4b69: $cd $dd $0b

	ld   c, $04                                      ; $4b6c: $0e $04
	ld   hl, data_01_0b1d                                   ; $4b6e: $21 $1d $0b
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4b71: $cd $dd $0b

	ld   c, $04                                      ; $4b74: $0e $04
	ld   hl, data_01_0b23                                   ; $4b76: $21 $23 $0b
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4b79: $cd $dd $0b

	ld   hl, wNPCScriptParam2                                   ; $4b7c: $21 $21 $c0
	ld   a, (hl)                                     ; $4b7f: $7e
	cp   $01                                         ; $4b80: $fe $01
	jr   nz, @next_0b9a                             ; $4b82: $20 $16

	ld   hl, wNPCScriptParam3                                   ; $4b84: $21 $22 $c0
	ld   a, (hl)                                     ; $4b87: $7e
	bit  7, a                                        ; $4b88: $cb $7f
	jr   nz, @next_0b9a                             ; $4b8a: $20 $0e

	ld   hl, wNPCScriptOpcode                                   ; $4b8c: $21 $1f $c0
	ld   a, (hl)                                     ; $4b8f: $7e
	cp   $00                                         ; $4b90: $fe $00
	jr   nz, @next_0b9a                             ; $4b92: $20 $06

	ld   a, $03                                      ; $4b94: $3e $03
	ld   hl, wNPCScriptParam3                                   ; $4b96: $21 $22 $c0
	ld   (hl), a                                     ; $4b99: $77

@next_0b9a:
	ld   hl, wNPCScriptParam3                                   ; $4b9a: $21 $22 $c0
	ld   a, (hl)                                     ; $4b9d: $7e
	bit  7, a                                        ; $4b9e: $cb $7f
	jr   nz, ++                             ; $4ba0: $20 $2a

	cp   $03                                         ; $4ba2: $fe $03
	jr   nz, +                             ; $4ba4: $20 $13

	ld   c, $06                                      ; $4ba6: $0e $06
	ld   hl, data_01_0af9                                   ; $4ba8: $21 $f9 $0a
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4bab: $cd $dd $0b
	ld   c, $06                                      ; $4bae: $0e $06
	ld   hl, data_01_0b01                                   ; $4bb0: $21 $01 $0b
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4bb3: $cd $dd $0b
	jp   @done                                       ; $4bb6: $c3 $dc $0b

+
	ld   c, $02                                      ; $4bb9: $0e $02
	ld   hl, data_01_0af1                                   ; $4bbb: $21 $f1 $0a
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4bbe: $cd $dd $0b
	ld   c, $02                                      ; $4bc1: $0e $02
	ld   hl, data_01_0af5                                   ; $4bc3: $21 $f5 $0a
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4bc6: $cd $dd $0b
	jp   @done                                       ; $4bc9: $c3 $dc $0b

++
	ld   c, $02                                      ; $4bcc: $0e $02
	ld   hl, data_01_0b09                                   ; $4bce: $21 $09 $0b
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4bd1: $cd $dd $0b
	ld   c, $02                                      ; $4bd4: $0e $02
	ld   hl, data_01_0b0d                                   ; $4bd6: $21 $0d $0b
	call destAndCbytesToCopyToScreen1AtHL                                       ; $4bd9: $cd $dd $0b
	
@done:
	ret                                              ; $4bdc: $c9


destAndCbytesToCopyToScreen1AtHL:
// screen 1 word in hl
	ld   de, wScreen1displayOffset                                   ; $4bdd: $11 $dd $c6
	ld   a, (de)                                     ; $4be0: $1a
	ld   e, (hl)                                     ; $4be1: $5e
	inc  hl                                          ; $4be2: $23
	add  (hl)                                        ; $4be3: $86
	ld   d, a                                        ; $4be4: $57
	inc  hl                                          ; $4be5: $23
// copy memory C
-
	ldi  a, (hl)                                     ; $4be6: $2a
	ld   (de), a                                     ; $4be7: $12
	inc  de                                          ; $4be8: $13
	dec  c                                           ; $4be9: $0d
	jr   nz, -                             ; $4bea: $20 $fa

	ret                                              ; $4bec: $c9


func_01_0bed:
// hl = $9c00
	ld   hl, wScreen1displayOffset                                   ; $4bed: $21 $dd $c6
	ld   a, (hl)                                     ; $4bf0: $7e
	add  >$9800                                         ; $4bf1: $c6 $98
	ld   h, a                                        ; $4bf3: $67
	ld   l, $00                                      ; $4bf4: $2e $00

// clear screen 1
	ld   bc, $0240                                   ; $4bf6: $01 $40 $02
	ld   a, $00                                      ; $4bf9: $3e $00
-
	ldi  (hl), a                                     ; $4bfb: $22
	dec  bc                                          ; $4bfc: $0b
	bit  7, b                                        ; $4bfd: $cb $78
	jr   z, -                              ; $4bff: $28 $fa

//
	ld   hl, $c00a                                   ; $4c01: $21 $0a $c0
	ld   e, (hl)                                     ; $4c04: $5e
	ld   d, $00                                      ; $4c05: $16 $00
	ld   hl, bank1textData                                   ; $4c07: $21 $a3 $0d
	add  hl, de                                      ; $4c0a: $19
	add  hl, de                                      ; $4c0b: $19
	ld   c, (hl)                                     ; $4c0c: $4e
	inc  hl                                          ; $4c0d: $23
	ld   b, (hl)                                     ; $4c0e: $46
	ld   hl, $c08e                                   ; $4c0f: $21 $8e $c0
	ld   (hl), c                                     ; $4c12: $71
	inc  hl                                          ; $4c13: $23
	ld   (hl), b                                     ; $4c14: $70
	ld   de, $98e1                                   ; $4c15: $11 $e1 $98
	ld   hl, wScreen1displayOffset                                   ; $4c18: $21 $dd $c6
	ld   a, (hl)                                     ; $4c1b: $7e
	add  d                                           ; $4c1c: $82
	ld   d, a                                        ; $4c1d: $57
	ld   hl, $c00d                                   ; $4c1e: $21 $0d $c0
	ld   (hl), e                                     ; $4c21: $73
	inc  hl                                          ; $4c22: $23
	ld   (hl), d                                     ; $4c23: $72
	ld   hl, $c008                                   ; $4c24: $21 $08 $c0
	ld   (hl), $ff                                   ; $4c27: $36 $ff

-
	call func_01_0ca1                                       ; $4c29: $cd $a1 $0c
	cp   $01                                         ; $4c2c: $fe $01
	jr   z, -                              ; $4c2e: $28 $f9

	push af                                          ; $4c30: $f5
	ld   a, $02                                      ; $4c31: $3e $02
	ld   hl, $c098                                   ; $4c33: $21 $98 $c0
	ld   (hl), a                                     ; $4c36: $77
	ld   a, $00                                      ; $4c37: $3e $00
	ld   hl, $c0c4                                   ; $4c39: $21 $c4 $c0
	ld   (hl), a                                     ; $4c3c: $77
	ld   de, $99c3                                   ; $4c3d: $11 $c3 $99
	ld   hl, wScreen1displayOffset                                   ; $4c40: $21 $dd $c6
	ld   a, (hl)                                     ; $4c43: $7e
	add  d                                           ; $4c44: $82
	ld   d, a                                        ; $4c45: $57
	ld   hl, $c00d                                   ; $4c46: $21 $0d $c0
	ld   (hl), e                                     ; $4c49: $73
	inc  hl                                          ; $4c4a: $23
	ld   (hl), d                                     ; $4c4b: $72
	pop  af                                          ; $4c4c: $f1
	cp   $06                                         ; $4c4d: $fe $06
	jr   z, +                              ; $4c4f: $28 $08

	cp   $07                                         ; $4c51: $fe $07
	jr   nz, @func_0c78                             ; $4c53: $20 $23

	ld   hl, $c0c4                                   ; $4c55: $21 $c4 $c0
	inc  (hl)                                        ; $4c58: $34

+
	call store_c00d_wordIntoDE                                       ; $4c59: $cd $bf $0c
	call c00e_c00d_plusEqu20h                                       ; $4c5c: $cd $aa $0c
	ld   bc, $0000                                   ; $4c5f: $01 $00 $00

-
	ld   hl, text_trueFalse                                   ; $4c62: $21 $d4 $0a
	add  hl, bc                                      ; $4c65: $09
	ld   a, (hl)                                     ; $4c66: $7e
	ld   (de), a                                     ; $4c67: $12
	inc  de                                          ; $4c68: $13
	inc  bc                                          ; $4c69: $03
	ld   a, c                                        ; $4c6a: $79
	cp   $04                                         ; $4c6b: $fe $04
	jr   nz, +                             ; $4c6d: $20 $03

	call store_c00d_wordIntoDE                                       ; $4c6f: $cd $bf $0c

+
	ld   a, c                                        ; $4c72: $79
	cp   $09                                         ; $4c73: $fe $09
	jr   nz, -                             ; $4c75: $20 $eb

	ret                                              ; $4c77: $c9

@func_0c78:
	ld   a, $00                                      ; $4c78: $3e $00
	ld   hl, $c098                                   ; $4c7a: $21 $98 $c0
	ld   (hl), a                                     ; $4c7d: $77
	ld   hl, $c008                                   ; $4c7e: $21 $08 $c0
	ld   (hl), $00                                   ; $4c81: $36 $00

@loop:
	call func_01_0ca1                                       ; $4c83: $cd $a1 $0c
	ld   hl, $c098                                   ; $4c86: $21 $98 $c0
	ld   c, (hl)                                     ; $4c89: $4e
	ld   b, $00                                      ; $4c8a: $06 $00
	ld   hl, $c098                                   ; $4c8c: $21 $98 $c0
	inc  (hl)                                        ; $4c8f: $34
	cp   $02                                         ; $4c90: $fe $02
	jr   z, @loop                              ; $4c92: $28 $ef

	cp   $05                                         ; $4c94: $fe $05
	jr   z, @done                              ; $4c96: $28 $08

	ld   hl, $c0c4                                   ; $4c98: $21 $c4 $c0
	ld   (hl), c                                     ; $4c9b: $71
	cp   $03                                         ; $4c9c: $fe $03
	jr   z, @loop                              ; $4c9e: $28 $e3

@done:
	ret                                              ; $4ca0: $c9


func_01_0ca1:
	call store_c00d_wordIntoDE                                       ; $4ca1: $cd $bf $0c
	call c00e_c00d_plusEqu20h                                       ; $4ca4: $cd $aa $0c
	jp   func_01_0cc6                                       ; $4ca7: $c3 $c6 $0c


c00e_c00d_plusEqu20h:
	ld   hl, $c00d                                   ; $4caa: $21 $0d $c0
	ld   a, (hl)                                     ; $4cad: $7e
	add  $20                                         ; $4cae: $c6 $20
	ld   hl, $c00d                                   ; $4cb0: $21 $0d $c0
	ld   (hl), a                                     ; $4cb3: $77

	ld   hl, $c00e                                   ; $4cb4: $21 $0e $c0
	ld   a, (hl)                                     ; $4cb7: $7e
	adc  $00                                         ; $4cb8: $ce $00
	ld   hl, $c00e                                   ; $4cba: $21 $0e $c0
	ld   (hl), a                                     ; $4cbd: $77
	ret                                              ; $4cbe: $c9


store_c00d_wordIntoDE:
	ld   hl, $c00d                                   ; $4cbf: $21 $0d $c0
	ld   e, (hl)                                     ; $4cc2: $5e
	inc  hl                                          ; $4cc3: $23
	ld   d, (hl)                                     ; $4cc4: $56
	ret                                              ; $4cc5: $c9


func_01_0cc6:
	ld   hl, $c009                                   ; $4cc6: $21 $09 $c0
	ld   (hl), $22                                   ; $4cc9: $36 $22

@bigLoop:
	call func_01_0d8c                                       ; $4ccb: $cd $8c $0d
	cp   $08                                         ; $4cce: $fe $08
	jr   c, @done                              ; $4cd0: $38 $66

	cp   $5f                                         ; $4cd2: $fe $5f
	jr   z, +                              ; $4cd4: $28 $08

	cp   $41                                         ; $4cd6: $fe $41
	jr   c, @func_0cf7                              ; $4cd8: $38 $1d

	cp   $5b                                         ; $4cda: $fe $5b
	jr   nc, @func_0cf7                             ; $4cdc: $30 $19

+
	push af                                          ; $4cde: $f5
	ld   hl, $c009                                   ; $4cdf: $21 $09 $c0
	ld   a, (hl)                                     ; $4ce2: $7e
	cp   $22                                         ; $4ce3: $fe $22
	jr   z, +                              ; $4ce5: $28 $0f

	cp   $2c                                         ; $4ce7: $fe $2c
	jr   z, +                              ; $4ce9: $28 $0b

	cp   $20                                         ; $4ceb: $fe $20
	jr   z, +                              ; $4ced: $28 $07

	pop  af                                          ; $4cef: $f1
	call func_01_0d98                                       ; $4cf0: $cd $98 $0d
	ld   a, $20                                      ; $4cf3: $3e $20
	push af                                          ; $4cf5: $f5

+
	pop  af                                          ; $4cf6: $f1

@func_0cf7:
	ld   (de), a                                     ; $4cf7: $12
	inc  de                                          ; $4cf8: $13
	ld   hl, $c009                                   ; $4cf9: $21 $09 $c0
	ld   (hl), a                                     ; $4cfc: $77
	cp   $5f                                         ; $4cfd: $fe $5f
	jr   nz, +                             ; $4cff: $20 $08

	ld   (de), a                                     ; $4d01: $12
	inc  de                                          ; $4d02: $13
	ld   (de), a                                     ; $4d03: $12
	inc  de                                          ; $4d04: $13
	ld   (de), a                                     ; $4d05: $12
	inc  de                                          ; $4d06: $13
	ld   (de), a                                     ; $4d07: $12
	inc  de                                          ; $4d08: $13

+
	cp   $2c                                         ; $4d09: $fe $2c
	jr   z, +                              ; $4d0b: $28 $0c

	cp   $3b                                         ; $4d0d: $fe $3b
	jr   z, +                              ; $4d0f: $28 $08

	cp   $3f                                         ; $4d11: $fe $3f
	jr   z, +                              ; $4d13: $28 $04

	cp   $21                                         ; $4d15: $fe $21
	jr   nz, @next_0d1d                             ; $4d17: $20 $04

+
	ld   a, $20                                      ; $4d19: $3e $20
	ld   (de), a                                     ; $4d1b: $12
	inc  de                                          ; $4d1c: $13

@next_0d1d:
	ld   c, a                                        ; $4d1d: $4f
	ld   hl, $c008                                   ; $4d1e: $21 $08 $c0
	ld   a, (hl)                                     ; $4d21: $7e
	cp   $00                                         ; $4d22: $fe $00
	jr   z, @bigLoop                              ; $4d24: $28 $a5

	ld   a, c                                        ; $4d26: $79
	cp   $20                                         ; $4d27: $fe $20
	jr   nz, @bigLoop                             ; $4d29: $20 $a0

	call func_01_0d39                                       ; $4d2b: $cd $39 $0d
	ld   a, e                                        ; $4d2e: $7b
	and  $1f                                         ; $4d2f: $e6 $1f
	add  l                                           ; $4d31: $85
	cp   $15                                         ; $4d32: $fe $15
	jr   c, @bigLoop                              ; $4d34: $38 $95

	ld   a, $01                                      ; $4d36: $3e $01

@done:
	ret                                              ; $4d38: $c9


func_01_0d39:
	ld   hl, $c08e                                   ; $4d39: $21 $8e $c0
	ld   c, (hl)                                     ; $4d3c: $4e
	inc  hl                                          ; $4d3d: $23
	ld   b, (hl)                                     ; $4d3e: $46
	ld   l, $00                                      ; $4d3f: $2e $00
	ld   h, $00                                      ; $4d41: $26 $00

@bigLoop:
	ld   a, (bc)                                     ; $4d43: $0a
	inc  bc                                          ; $4d44: $03
	cp   $20                                         ; $4d45: $fe $20
	jr   z, @done                              ; $4d47: $28 $42

	cp   $08                                         ; $4d49: $fe $08
	jr   c, @done                              ; $4d4b: $38 $3e

	inc  l                                           ; $4d4d: $2c
	cp   $5f                                         ; $4d4e: $fe $5f
	jr   nz, +                             ; $4d50: $20 $0c

	ld   h, a                                        ; $4d52: $67
	ld   a, l                                        ; $4d53: $7d
	cp   $01                                         ; $4d54: $fe $01
	jr   nz, @done                             ; $4d56: $20 $33

	inc  l                                           ; $4d58: $2c
	inc  l                                           ; $4d59: $2c
	inc  l                                           ; $4d5a: $2c
	inc  l                                           ; $4d5b: $2c
	jr   @bigLoop                                 ; $4d5c: $18 $e5

+

// go to done, or 0d88, with optional pop af, if after the push af
	cp   $2c                                         ; $4d5e: $fe $2c
	jr   z, @done                              ; $4d60: $28 $29

	cp   $3b                                         ; $4d62: $fe $3b
	jr   z, @done                              ; $4d64: $28 $25

	cp   $3f                                         ; $4d66: $fe $3f
	jr   z, @done                              ; $4d68: $28 $21

	cp   $21                                         ; $4d6a: $fe $21
	jr   z, @done                              ; $4d6c: $28 $1d

	cp   $41                                         ; $4d6e: $fe $41
	jr   c, @func_0d88                              ; $4d70: $38 $16

	cp   $5b                                         ; $4d72: $fe $5b
	jr   nc, @func_0d88                             ; $4d74: $30 $12

	push af                                          ; $4d76: $f5
	ld   a, h                                        ; $4d77: $7c
	cp   $22                                         ; $4d78: $fe $22
	jr   z, @func_0d87                              ; $4d7a: $28 $0b

	cp   $2c                                         ; $4d7c: $fe $2c
	jr   z, @func_0d87                              ; $4d7e: $28 $07

	ld   a, l                                        ; $4d80: $7d
	cp   $01                                         ; $4d81: $fe $01
	jr   z, @func_0d87                              ; $4d83: $28 $02

	pop  af                                          ; $4d85: $f1
	ret                                              ; $4d86: $c9


@func_0d87:
	pop  af                                          ; $4d87: $f1

@func_0d88:
	ld   h, a                                        ; $4d88: $67
	jr   @bigLoop                                 ; $4d89: $18 $b8

@done:
	ret                                              ; $4d8b: $c9


func_01_0d8c:
	ld   hl, $c08e                                   ; $4d8c: $21 $8e $c0
	ld   c, (hl)                                     ; $4d8f: $4e
	inc  hl                                          ; $4d90: $23
	ld   b, (hl)                                     ; $4d91: $46
	ld   a, (bc)                                     ; $4d92: $0a
	inc  bc                                          ; $4d93: $03
	ld   (hl), b                                     ; $4d94: $70
	dec  hl                                          ; $4d95: $2b
	ld   (hl), c                                     ; $4d96: $71
	ret                                              ; $4d97: $c9


func_01_0d98:
	ld   hl, $c08e                                   ; $4d98: $21 $8e $c0
	ld   c, (hl)                                     ; $4d9b: $4e
	inc  hl                                          ; $4d9c: $23
	ld   b, (hl)                                     ; $4d9d: $46
	dec  bc                                          ; $4d9e: $0b
	ld   (hl), b                                     ; $4d9f: $70
	dec  hl                                          ; $4da0: $2b
	ld   (hl), c                                     ; $4da1: $71
	ret                                              ; $4da2: $c9
