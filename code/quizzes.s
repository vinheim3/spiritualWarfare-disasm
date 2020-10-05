text_trueFalse:
	.asc "TrueFalse"


text_questionNum:
	.dw $9821
	.asc "Question #"


text_prize:
	.dw $9861
	.asc "Prize:"

// the following 6 dynamically loaded
data_01_0af1:
	.dw $9847
	.db $d4 $d6

data_01_0af5:
	.dw $9867
	.db $d5 $d7
	
data_01_0af9:
	.dw $9847
	.db $dc $de $e0 $e2 $e0 $e2
	
data_01_0b01:
	.dw $9867
	.db $dd $df $e1 $e3 $e1 $e3
	
data_01_0b09:
	.dw $9848
	.db $e0 $e2
	
data_01_0b0d:
	.dw $9868
	.db $e1 $e3

// the following 4 copied onto screen initially
data_01_0b11:
	.dw $982e
	.db $b4 $b6 $b8 $ba
	
data_01_0b17:
	.dw $984e
	.db $b5 $b7 $b9 $bb
	
data_01_0b1d:
	.dw $986e
	.db $f4 $f6 $f8 $fa

data_01_0b23:
	.dw $988e
	.db $f5 $f7 $f9 $fb



func_01_0b29:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wNextQuizQuestionIdx
	ld   (hl), a

// if script param is ff, simply choose next question
	cp   $ff
	jr   nz, @afterSettingNextQuestionIdx

// c4df to hold quiz question #
// add 1 to it, there are only $f9 questions, so loop after that to 0
	ld   hl, wCurrQuizQuestionIdx
	ld   a, (hl)
	ld   hl, wNextQuizQuestionIdx
	ld   (hl), a
	add  $01
	cp   $fa
	jr   c, +

	ld   a, $00

+
	ld   hl, wCurrQuizQuestionIdx
	ld   (hl), a

@afterSettingNextQuestionIdx:
	call drawQuizScreen

	ld   hl, text_prize
	ld   c, $06
	call destAndCbytesToCopyToScreen1AtHL

	ld   hl, text_questionNum
	ld   c, $0a
	call destAndCbytesToCopyToScreen1AtHL

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

// number of questions
	ld   hl, wNPCScriptParam2                                   ; $4b7c: $21 $21 $c0
	ld   a, (hl)                                     ; $4b7f: $7e
	cp   $01                                         ; $4b80: $fe $01
	jr   nz, @next_0b9a                             ; $4b82: $20 $16

// if only 1 question specified
// seems to always be set to 1
	ld   hl, wNPCScriptParam3                                   ; $4b84: $21 $22 $c0
	ld   a, (hl)                                     ; $4b87: $7e
	bit  7, a                                        ; $4b88: $cb $7f
	jr   nz, @next_0b9a                             ; $4b8a: $20 $0e

// if we encounter npc_end?
	ld   hl, wNPCScriptOpcode                                   ; $4b8c: $21 $1f $c0
	ld   a, (hl)                                     ; $4b8f: $7e
	cp   $00                                         ; $4b90: $fe $00
	jr   nz, @next_0b9a                             ; $4b92: $20 $06

// param 3 to be $03 instead
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

// param 3 equals 3
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
// bit 7 set of param 3 (not usually the case)
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
	ld   de, wScreen1displayOffset
	ld   a, (de)
	ld   e, (hl)
	inc  hl
	add  (hl)
	ld   d, a
	inc  hl
// copy memory C
-
	ldi  a, (hl)
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	ret


drawQuizScreen:
// hl = $9c00
	ld   hl, wScreen1displayOffset
	ld   a, (hl)
	add  >$9800
	ld   h, a
	ld   l, $00

// clear screen 1
	ld   bc, $0240
	ld   a, $00
-
	ldi  (hl), a
	dec  bc
	bit  7, b
	jr   z, -

// bc is address of text for quiz
	ld   hl, wNextQuizQuestionIdx
	ld   e, (hl)
	ld   d, $00
	ld   hl, bank1textData
	add  hl, de
	add  hl, de
	ld   c, (hl)
	inc  hl
	ld   b, (hl)

// store in c08e/c08f
	ld   hl, wCurrQuizQuestionAddr
	ld   (hl), c
	inc  hl
	ld   (hl), b

// quiz text offset in c00d/e
	ld   de, $98e1
	ld   hl, wScreen1displayOffset
	ld   a, (hl)
	add  d
	ld   d, a
	ld   hl, wQuizCurrTextVramAddr
	ld   (hl), e
	inc  hl
	ld   (hl), d

// start c008 with ff, wait until text at a certain point?
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
	ld   hl, wQuizCurrTextVramAddr                                   ; $4c46: $21 $0d $c0
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
	call deEquCurrQuizVramAddr                                       ; $4c59: $cd $bf $0c
	call quizVramTextAddrGoToNextRow                                       ; $4c5c: $cd $aa $0c
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

	call deEquCurrQuizVramAddr                                       ; $4c6f: $cd $bf $0c

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
	call deEquCurrQuizVramAddr
	call quizVramTextAddrGoToNextRow
	jp   func_01_0cc6                                       ; $4ca7: $c3 $c6 $0c


quizVramTextAddrGoToNextRow:
	ld   hl, wQuizCurrTextVramAddr
	ld   a, (hl)
	add  <$0020
	ld   hl, wQuizCurrTextVramAddr
	ld   (hl), a

	ld   hl, wQuizCurrTextVramAddr+1
	ld   a, (hl)
	adc  >$0020
	ld   hl, wQuizCurrTextVramAddr+1
	ld   (hl), a
	ret


deEquCurrQuizVramAddr:
	ld   hl, wQuizCurrTextVramAddr
	ld   e, (hl)
	inc  hl
	ld   d, (hl)
	ret


func_01_0cc6:
	ld   hl, $c009                                   ; $4cc6: $21 $09 $c0
	ld   (hl), $22                                   ; $4cc9: $36 $22

@bigLoop:
	call getNextByteFromQuizText                                       ; $4ccb: $cd $8c $0d
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
	call decQuizQuestionAddr                                       ; $4cf0: $cd $98 $0d
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
// quiz question addr in bc
	ld   hl, wCurrQuizQuestionAddr                                   ; $4d39: $21 $8e $c0
	ld   c, (hl)                                     ; $4d3c: $4e
	inc  hl                                          ; $4d3d: $23
	ld   b, (hl)                                     ; $4d3e: $46

	ld   l, $00                                      ; $4d3f: $2e $00
	ld   h, $00                                      ; $4d41: $26 $00
@bigLoop:
// if byte is $20, go to done
	ld   a, (bc)                                     ; $4d43: $0a
	inc  bc                                          ; $4d44: $03
	cp   $20                                         ; $4d45: $fe $20
	jr   z, @done                              ; $4d47: $28 $42

// if byte < 8, go to done
	cp   $08                                         ; $4d49: $fe $08
	jr   c, @done                              ; $4d4b: $38 $3e

// next l
	inc  l                                           ; $4d4d: $2c
	cp   $5f                                         ; $4d4e: $fe $5f
	jr   nz, +                             ; $4d50: $20 $0c

// byte read is $5f or _
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


getNextByteFromQuizText:
// quiz question addr in bc
	ld   hl, wCurrQuizQuestionAddr
	ld   c, (hl)
	inc  hl
	ld   b, (hl)

// get val in a, and inc question addr to next byte
	ld   a, (bc)
	inc  bc
	ld   (hl), b
	dec  hl
	ld   (hl), c
	ret


decQuizQuestionAddr:
	ld   hl, wCurrQuizQuestionAddr
	ld   c, (hl)
	inc  hl
	ld   b, (hl)

	dec  bc
	ld   (hl), b
	dec  hl
	ld   (hl), c
	ret
