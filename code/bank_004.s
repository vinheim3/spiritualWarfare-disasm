; Disassembly of "OR"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3

// a $b0-sized table of 2x2 values ($c3b0) is pumped through here
// and tiles converted if they do not read $ff in the table
vramTileConversionTables:
	.db $ff $30 $00 $ff $ff $ff $1c $ff $1c $ff $ff $ff $ff $ff $ff $ff
	.db $ff $94 $a0 $a4 $ff $ff $ff $00 $ff $a8 $ff $ff $34 $ff $04 $bd
	.db $04 $08 $04 $20 $18 $74 $ff $ff $9c $9c $64 $ff $ff $5c $48 $ff
	.db $44 $ff $ff $4c $00 $ff $ff $ff $ff $ff $ff $ff $ff $70 $7b $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $ff $40 $4c $ff $4d $58 $ff $59 $ff $ff $64 $70 $ff $71 $7c $ff
	.db $ff $44 $68 $68 $84 $8c $8c $c0 $c0 $cc $38 $2c $78 $48 $48 $48
	.db $14 $20 $50 $5c $b4 $b8 $24 $d0 $88 $90 $54 $6c $30 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $1c $ff $ff $ff $ff $ff $54 $ff $ff $ff
	.db $ff $d4 $ff $dc $ff $ff $ff $54 $58 $ff $ff $ff $ff $ff $ff $bd
	.db $ff $ff $ff $ff $44 $ff $ff $ff $ff $ff $ff $ff $ff $5c $60 $ff
	.db $ff $d0 $ff $ff $30 $d0 $18 $94 $ff $ff $ff $ff $ff $4c $c4 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $ff $ff $29 $ff $ff $35 $ff
	.db $ff $40 $4c $ff $4d $58 $ff $59 $ff $ff $64 $ff $ff $70 $ff $ff
	.db $7c $48 $d8 $d8 $3c $3c $74 $54 $54 $2c $ff $ff $ff $50 $50 $50
	.db $14 $20 $ff $ff $b4 $b8 $68 $d0 $44 $90 $38 $38 $5c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $1c
	.db $ff $ff $88 $ff $8d $cc $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $ff $48 $ff $99 $ff $ff $ff $ff $ff $ff $ff $ff $3c $a8 $ff
	.db $ff $d4 $ff $c4 $ff $ff $ff $ff $ff $ff $ff $ff $ff $54 $50 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $ff $40 $4c $ff $4d $58 $ff $59 $ff $68 $ff $74 $75 $74 $ff $78
	.db $79 $44 $44 $44 $54 $54 $55 $5c $5c $5d $6c $6c $70 $50 $50 $50
	.db $14 $20 $30 $64 $b4 $b8 $48 $7c $38 $90 $2c $2c $24 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $48 $ff $ff $ff $ff $ff $ff $ff
	.db $ff $40 $ff $cc $ff $ff $9c $a0 $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $40 $ff $ff $4c $ff $58 $ff $5c $48 $c0 $c0 $ff $84 $a4 $ff
	.db $ff $ff $ff $00 $d0 $ff $ff $ff $ff $ff $ff $ff $ff $44 $20 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $29 $ff $28 $35 $ff $34 $ff
	.db $44 $ff $4d $ff $4c $59 $ff $58 $ff $68 $ff $71 $ff $70 $7d $ff
	.db $7c $48 $40 $40 $98 $a8 $ac $d0 $5c $5c $64 $9c $54 $50 $50 $50
	.db $14 $20 $74 $78 $ff $ff $30 $38 $6c $90 $24 $24 $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $e4 $ff $ff $ff $ff $ff $ff $ff $ff $64 $ff $ff $ff $bd
	.db $ff $ff $ff $48 $c4 $ff $ff $ff $ff $ff $ff $ff $ff $8c $e0 $ff
	.db $ff $d0 $ff $ff $cc $d0 $ff $d8 $dc $ff $ff $ff $ff $d4 $6c $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $44 $ff $4c $ff $ff $58 $ff $ff $ff $68 $ff $70 $ff $71 $7c $ff
	.db $7d $40 $64 $64 $ff $ff $ff $ff $ff $ff $ff $ff $ff $24 $24 $24
	.db $14 $20 $ff $ff $ff $ff $30 $6c $38 $90 $74 $78 $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $34 $34
	.db $ff $84 $88 $8c $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $44 $48 $4c $c4 $ff $ff $ff $ff $ff $34 $ff $ff $78 $ff $ff
	.db $ff $a8 $ff $ff $ff $a8 $ff $ff $ff $ff $ff $ff $ff $d4 $e8 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $ff $40 $4c $ff $4d $58 $ff $59 $ff $68 $ff $70 $ff $71 $7c $ff
	.db $7d $44 $48 $48 $5d $54 $5c $64 $74 $78 $ff $ff $6c $24 $24 $24
	.db $14 $20 $ff $ff $ff $ff $38 $a8 $50 $ff $30 $30 $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $c4 $ff $ff $ff $ff $ff $ff $ff
	.db $ff $80 $88 $8c $ff $ff $d4 $ff $ff $74 $ff $74 $ff $ff $ff $bd
	.db $44 $ff $48 $4c $d0 $ff $ff $ff $ff $ff $ff $ff $ff $d0 $8c $ff
	.db $ff $cc $ff $64 $7c $cc $ff $ff $ff $ff $ff $ff $ff $58 $20 $6c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $ff $24 $24 $ff $30 $30 $ff
	.db $3c $3c $4c $ff $4d $58 $ff $59 $ff $ff $64 $70 $ff $71 $7c $ff
	.db $7d $40 $44 $44 $6c $6c $6d $50 $50 $5c $48 $68 $68 $28 $28 $28
	.db $14 $14 $54 $ff $ff $ff $78 $74 $38 $ff $2c $20 $34 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $1c $ff $1c $ff $ff $00 $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $2c $ff $ff $84 $ff $ff $ff $ff $ff $ff $ff $ff $60 $d4 $ff
	.db $ff $ff $ff $ff $ff $c4 $ff $ff $ff $ff $ff $ff $ff $18 $20 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $44 $ff $ff $ff $ff $58 $ff $ff $ff $68 $ff $70 $ff $70 $7c $ff
	.db $7c $6c $74 $74 $ff $ff $ff $ff $ff $ff $ff $ff $ff $24 $24 $24
	.db $14 $20 $ff $ff $ff $ff $40 $64 $38 $90 $30 $78 $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $2c $ff $2c $ff $ff $ff
	.db $ff $ff $8c $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $ff $ff $48 $28 $ff $ff $ff $ff $ff $ff $ff $ff $30 $14 $ff
	.db $ff $d4 $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $c4 $10 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $44 $ff $ff $48 $48 $ff $54 $54 $ff $60 $60 $70 $ff $ff $7c $ff
	.db $78 $40 $4c $50 $ff $ff $ff $ff $ff $ff $ff $ff $ff $24 $24 $24
	.db $14 $20 $ff $ff $ff $ff $6c $68 $38 $ff $2c $64 $30 $ff $ff $ff

	.db $ff $ff $ff $ff $e8 $ff $ff $ff $ff $ff $ff $ff $ff $48 $ff $ff
	.db $ff $c4 $98 $d4 $ff $ff $ff $ff $ff $ff $ff $68 $ff $ff $04 $bd
	.db $ff $ff $ff $ff $78 $ff $48 $ff $ff $ff $ff $ff $ff $6c $34 $ff
	.db $ff $cc $ff $10 $ff $cc $ff $ff $ff $ff $ff $ff $ff $44 $4c $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $ff $24 $24 $ff $30 $30 $ff
	.db $3c $3c $ff $48 $48 $ff $54 $54 $ff $60 $60 $70 $ff $71 $7c $ff
	.db $7d $44 $4c $4c $50 $58 $51 $6c $5c $64 $64 $68 $78 $28 $28 $28
	.db $14 $20 $69 $6d $ff $ff $40 $74 $38 $ff $2c $2c $34 $ff $ff $ff

	.db $ff $b0 $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $6c $6c $ff $ff
	.db $ff $a0 $a4 $80 $ff $ff $ff $ff $ff $ff $ff $ff $6c $ff $ff $bd
	.db $04 $ff $ff $ff $dc $ff $ff $ff $9c $9c $ff $34 $30 $c4 $d4 $ff
	.db $ff $d0 $ff $ff $50 $d0 $48 $70 $ff $ff $4c $ff $ff $44 $ac $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $ff $40 $4c $ff $ff $58 $ff $ff $ff $ff $64 $70 $ff $71 $7c $ff
	.db $70 $74 $74 $78 $2c $2c $38 $30 $30 $68 $e9 $e8 $e8 $6c $6c $6c
	.db $14 $20 $ff $d8 $ff $ff $24 $d0 $48 $90 $54 $54 $44 $ff $ff $ff

	.db $ff $ff $00 $ff $9c $ff $ff $9c $ff $ff $ff $ff $c4 $ff $ff $ff
	.db $ff $84 $88 $8c $94 $24 $ff $ff $ff $24 $ff $ff $ff $ff $ff $bd
	.db $ff $44 $48 $4c $08 $50 $ff $10 $ff $ff $ff $ff $ff $30 $1c $ff
	.db $ff $d4 $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $54 $64 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $28 $28 $29 $ff
	.db $44 $ff $4c $ff $4d $4c $4c $4d $ff $68 $ff $ff $74 $ff $7c $ff
	.db $7d $74 $70 $70 $54 $54 $55 $50 $48 $40 $58 $58 $78 $30 $30 $30
	.db $14 $20 $64 $24 $ff $ff $38 $d4 $34 $ff $5c $5c $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $1c $ff $1c $ff $ff $ff $ff $ff $ff $ff
	.db $a0 $ff $84 $ff $ff $ff $ff $ff $ff $ff $ff $ff $c4 $ff $ff $bd
	.db $ff $48 $ff $40 $8c $ff $ff $ff $ff $ff $ff $ff $ff $70 $d4 $ff
	.db $ff $24 $ff $ff $ff $24 $ff $ff $ff $ff $ff $ff $ff $18 $20 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $40
	.db $ff $ff $4c $ff $4d $58 $ff $59 $64 $ff $ff $70 $ff $ff $7c $ff
	.db $7d $48 $48 $50 $54 $54 $55 $5c $5c $5d $60 $6c $6c $2c $2c $2c
	.db $14 $20 $ff $ff $ff $ff $3c $24 $78 $ff $30 $30 $38 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $ff $ff $ff $6c $ff $84 $ff $ff $ff $ff $ff $ff $e8 $98 $ff
	.db $2c $c0 $ff $ff $ff $c0 $ff $ff $ff $ff $60 $ff $ff $c4 $d4 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $44 $ff $4c $ff $4d $58 $ff $59 $ff $68 $ff $70 $ff $71 $7c $ff
	.db $7d $48 $50 $50 $54 $54 $40 $5c $5c $5d $64 $64 $65 $24 $24 $24
	.db $14 $20 $6c $74 $ff $ff $78 $c0 $70 $ff $30 $30 $38 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $b0 $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $00 $ff $ff $ff $94 $04 $ff $ff $ff $ff $ff $ff $1c $ff $ff $ff
	.db $ff $ff $ff $ff $ff $c4 $ff $c4 $ff $ff $ff $ff $ff $ff $ff $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $ff $ff $ff $ff $ff $3c $ff
	.db $78 $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $54 $58 $5c $60 $64 $68 $14 $ff $ff $6c $3c $3c $70 $20 $20 $20
	.db $80 $6c $d4 $dc $ff $ff $40 $ff $e0 $90 $38 $38 $74 $ff $ff $ff



	ret  z                                           ; $514b: $c8

	add  h                                           ; $514c: $84
	ret  c                                           ; $514d: $d8

	sub  d                                           ; $514e: $92
	sub  (hl)                                        ; $514f: $96
	sub  h                                           ; $5150: $94
	sbc  b                                           ; $5151: $98
	sub  b                                           ; $5152: $90
	xor  d                                           ; $5153: $aa
	sbc  b                                           ; $5154: $98
	xor  l                                           ; $5155: $ad
	sbc  b                                           ; $5156: $98
	or   b                                           ; $5157: $b0
	sbc  b                                           ; $5158: $98
	ldh  a, (<$98)                                   ; $5159: $f0 $98
	ld   ($ed98), a                                  ; $515b: $ea $98 $ed
	sbc  b                                           ; $515e: $98


drawInDynamicPartOfInventoryScreen:
	ld   hl, wNumBombs                                   ; $515f: $21 $3b $c0
	ld   a, (hl)                                     ; $5162: $7e
	ld   de, $99ec                                   ; $5163: $11 $ec $99
	call drawBombsOrKeys                                       ; $5166: $cd $2a $12

	ld   hl, wNumKeys                                   ; $5169: $21 $fa $c5
	ld   a, (hl)                                     ; $516c: $7e
	ld   de, $99e7                                   ; $516d: $11 $e7 $99
	call drawBombsOrKeys                                       ; $5170: $cd $2a $12

	call drawNumBirds                                       ; $5173: $cd $8f $11
	call drawHearts                                       ; $5176: $cd $21 $13
	call drawFruitAmounts                                       ; $5179: $cd $d1 $13
	call drawScore                                       ; $517c: $cd $08 $13
	call drawBitem                                       ; $517f: $cd $83 $13
	call drawAitem                                       ; $5182: $cd $a8 $13
	call drawRailroadTicketIfRetrieved                                       ; $5185: $cd $19 $14
	call drawSelectableBitems                                       ; $5188: $cd $32 $14
	call func_04_1462                                       ; $518b: $cd $62 $14
	ret                                              ; $518e: $c9


drawNumBirds:
	ld   hl, wNumBirds                                   ; $518f: $21 $08 $c7
	ld   a, (hl)                                     ; $5192: $7e
	ld   de, $99f1                                   ; $5193: $11 $f1 $99
	call func_04_1234                                       ; $5196: $cd $34 $12
	ret                                              ; $5199: $c9


drawInDynamicPartOfMap:
	call drawAreaTextInMapScreen
	call drawCurrentLocationInMap
	call drawPlayerNameInMap
	ret


// build up a byte in a, each bit signalling if we have that
// selectable b item
checkBitemsSelectable:
	ld   hl, wNumBirds
	ld   a, (hl)
	cp   $0a
	jr   nc, @moreThan10birds

	ld   a, $00
	jr   @checkBombs

// can pray
@moreThan10birds:
	ld   a, $80

@checkBombs:

// always display bombs
	or   $01
	ld   hl, wNumBombs
	ld   c, (hl)
	ld   b, $00
	jr   nz, +
	xor  $01
+

// c0a0 is used as temp storage
	ld   hl, $c0a0
	ld   (hl), a                                     ; $51c1: $77

// bit 0 set of special items byte, put in bit 3
	ld   hl, wSpecialBitemsGotten
	ld   a, (hl)
	and  $01
	sla  a
	sla  a
	sla  a
	ld   hl, $c0a0                                   ; $51ce: $21 $a0 $c0
	or   (hl)                                        ; $51d1: $b6

	ld   hl, $c0a0                                   ; $51d2: $21 $a0 $c0
	ld   (hl), a                                     ; $51d5: $77

// bit 1 set of special items byte, put in bit 1
	ld   hl, wSpecialBitemsGotten
	ld   a, (hl)
	and  $02
	ld   hl, $c0a0                                   ; $51dc: $21 $a0 $c0
	or   (hl)                                        ; $51df: $b6

	ld   hl, $c0a0                                   ; $51e0: $21 $a0 $c0
	ld   (hl), a                                     ; $51e3: $77

// bit 2 set of special items byte, put in bit 4
	ld   hl, wSpecialBitemsGotten
	ld   a, (hl)
	and  $04
	sla  a
	sla  a
	ld   hl, $c0a0                                   ; $51ee: $21 $a0 $c0
	or   (hl)                                        ; $51f1: $b6

	ld   hl, $c0a0                                   ; $51f2: $21 $a0 $c0
	ld   (hl), a                                     ; $51f5: $77

// bit 5 and 6 - anointing oils
	ld   hl, wAnointingOilsGotten
	ld   a, (hl)
	and  $03
	sla  a
	sla  a
	sla  a
	sla  a
	sla  a
	ld   hl, $c0a0                                   ; $5206: $21 $a0 $c0
	or   (hl)                                        ; $5209: $b6

	ld   hl, $c0a0                                   ; $520a: $21 $a0 $c0
	ld   (hl), a                                     ; $520d: $77

// bit 2 - sword of the spirit
	ld   hl, wArmorOfGodGotten
	ld   a, (hl)
	and  $20
	srl  a
	srl  a
	srl  a
	ld   hl, $c0a0                                   ; $521a: $21 $a0 $c0
	or   (hl)                                        ; $521d: $b6
	ld   hl, $c0a0                                   ; $521e: $21 $a0 $c0
	ld   (hl), a                                     ; $5221: $77
	ret                                              ; $5222: $c9


;;
	ld   hl, $c000                                   ; $5223: $21 $00 $c0
	ld   (hl), $01                                   ; $5226: $36 $01
	jr   jr_008_5239                                 ; $5228: $18 $0f


drawBombsOrKeys:
	ld   hl, $c000                                   ; $522a: $21 $00 $c0
	ld   (hl), $02                                   ; $522d: $36 $02
	call aIsMax99                                       ; $522f: $cd $ef $12
	jr   jr_008_5239                                 ; $5232: $18 $05

func_04_1234:
	ld   hl, $c000                                   ; $5234: $21 $00 $c0
	ld   (hl), $03                                   ; $5237: $36 $03

jr_008_5239:
	ld   c, a                                        ; $5239: $4f
	ld   b, $00                                      ; $523a: $06 $00
	call b4_dPlusEquValueIn_c6dd                                       ; $523c: $cd $01 $13
	ld   hl, $c5fc                                   ; $523f: $21 $fc $c5
	ld   (hl), e                                     ; $5242: $73
	inc  hl                                          ; $5243: $23
	ld   (hl), d                                     ; $5244: $72
	ld   a, $0a                                      ; $5245: $3e $0a
	call bcDivA_divInC_modInAB                                       ; $5247: $cd $44 $08
	ld   hl, $c0a0                                   ; $524a: $21 $a0 $c0
	ld   (hl), b                                     ; $524d: $70
	ld   b, $00                                      ; $524e: $06 $00
	ld   a, $0a                                      ; $5250: $3e $0a
	call bcDivA_divInC_modInAB                                       ; $5252: $cd $44 $08
	ld   hl, $c0a1                                   ; $5255: $21 $a1 $c0
	ld   (hl), b                                     ; $5258: $70
	ld   hl, $c0a2                                   ; $5259: $21 $a2 $c0
	ld   (hl), c                                     ; $525c: $71
	ld   hl, $c000                                   ; $525d: $21 $00 $c0
	ld   a, (hl)                                     ; $5260: $7e
	cp   $01                                         ; $5261: $fe $01
	jr   nz, +                             ; $5263: $20 $08

	ld   hl, $c0a0                                   ; $5265: $21 $a0 $c0
	call copyHLDDigitTileIdxIntoDE                                       ; $5268: $cd $e1 $12
	jr   @next_1299                                 ; $526b: $18 $2c

+
	cp   $02                                         ; $526d: $fe $02
	jr   nz, +                             ; $526f: $20 $0b

	ld   hl, $c0a1                                   ; $5271: $21 $a1 $c0
	call copyHLDDigitTileIdxIntoDE                                       ; $5274: $cd $e1 $12
	call copyHLDDigitTileIdxIntoDE                                       ; $5277: $cd $e1 $12
	jr   @next_1299                                 ; $527a: $18 $1d

+
	ld   hl, $c0a2                                   ; $527c: $21 $a2 $c0
	ld   a, (hl)                                     ; $527f: $7e
	cp   $00                                         ; $5280: $fe $00
	jr   nz, +                             ; $5282: $20 $0c

	dec  hl                                          ; $5284: $2b
	call copyHLDDigitTileIdxIntoDE                                       ; $5285: $cd $e1 $12
	call copyHLDDigitTileIdxIntoDE                                       ; $5288: $cd $e1 $12
	ld   a, $00                                      ; $528b: $3e $00
	ld   (de), a                                     ; $528d: $12
	jr   @next_1299                                 ; $528e: $18 $09

+
	call copyHLDDigitTileIdxIntoDE                                       ; $5290: $cd $e1 $12
	call copyHLDDigitTileIdxIntoDE                                       ; $5293: $cd $e1 $12
	call copyHLDDigitTileIdxIntoDE                                       ; $5296: $cd $e1 $12

@next_1299:
	ld   hl, $c5fc                                   ; $5299: $21 $fc $c5
	ldi  a, (hl)                                     ; $529c: $2a
	add  $20                                         ; $529d: $c6 $20
	ld   e, a                                        ; $529f: $5f
	ld   a, (hl)                                     ; $52a0: $7e
	adc  $00                                         ; $52a1: $ce $00
	ld   d, a                                        ; $52a3: $57
	ld   hl, $c000                                   ; $52a4: $21 $00 $c0
	ld   a, (hl)                                     ; $52a7: $7e
	cp   $01                                         ; $52a8: $fe $01
	jr   nz, jr_008_52b4                             ; $52aa: $20 $08

	ld   hl, $c0a0                                   ; $52ac: $21 $a0 $c0
	call $12e8                                       ; $52af: $cd $e8 $12
	jr   jr_008_52e0                                 ; $52b2: $18 $2c

jr_008_52b4:
	cp   $02                                         ; $52b4: $fe $02
	jr   nz, jr_008_52c3                             ; $52b6: $20 $0b

	ld   hl, $c0a1                                   ; $52b8: $21 $a1 $c0
	call $12e8                                       ; $52bb: $cd $e8 $12
	call $12e8                                       ; $52be: $cd $e8 $12
	jr   jr_008_52e0                                 ; $52c1: $18 $1d

jr_008_52c3:
	ld   hl, $c0a2                                   ; $52c3: $21 $a2 $c0
	ld   a, (hl)                                     ; $52c6: $7e
	cp   $00                                         ; $52c7: $fe $00
	jr   nz, jr_008_52d7                             ; $52c9: $20 $0c

	dec  hl                                          ; $52cb: $2b
	call $12e8                                       ; $52cc: $cd $e8 $12
	call $12e8                                       ; $52cf: $cd $e8 $12
	ld   a, $00                                      ; $52d2: $3e $00
	ld   (de), a                                     ; $52d4: $12
	jr   jr_008_52e0                                 ; $52d5: $18 $09

jr_008_52d7:
	call $12e8                                       ; $52d7: $cd $e8 $12
	call $12e8                                       ; $52da: $cd $e8 $12
	call $12e8                                       ; $52dd: $cd $e8 $12

jr_008_52e0:
	ret                                              ; $52e0: $c9


// draws the number of bombs
copyHLDDigitTileIdxIntoDE:
	ldd  a, (hl)                                     ; $52e1: $3a
	call convDigitIntoTileIdx                                       ; $52e2: $cd $f6 $12
	ld   (de), a                                     ; $52e5: $12
	inc  de                                          ; $52e6: $13
	ret                                              ; $52e7: $c9


	ldd  a, (hl)                                     ; $52e8: $3a
	call $12fb                                       ; $52e9: $cd $fb $12
	ld   (de), a                                     ; $52ec: $12
	inc  de                                          ; $52ed: $13
	ret                                              ; $52ee: $c9


aIsMax99:
	cp   $64
	jr   c, +

	ld   a, $63

+
	ret


convDigitIntoTileIdx:
	sla  a
	add  $0a
	ret


	call convDigitIntoTileIdx                                       ; $52fb: $cd $f6 $12
	add  $01                                         ; $52fe: $c6 $01
	ret                                              ; $5300: $c9


b4_dPlusEquValueIn_c6dd:
	ld   hl, $c6dd                                   ; $5301: $21 $dd $c6
	ld   a, d                                        ; $5304: $7a
	add  (hl)                                        ; $5305: $86
	ld   d, a                                        ; $5306: $57
	ret                                              ; $5307: $c9


drawScore:
	ld   de, $996a                                   ; $5308: $11 $6a $99
	call b4_dPlusEquValueIn_c6dd                                       ; $530b: $cd $01 $13
	ld   bc, $0000                                   ; $530e: $01 $00 $00

-
	ld   hl, $c02b                                   ; $5311: $21 $2b $c0
	add  hl, bc                                      ; $5314: $09
	ld   a, (hl)                                     ; $5315: $7e
	add  $30                                         ; $5316: $c6 $30
	ld   (de), a                                     ; $5318: $12
	inc  de                                          ; $5319: $13
	inc  bc                                          ; $531a: $03
	ld   a, c                                        ; $531b: $79
	cp   $07                                         ; $531c: $fe $07
	jr   nz, -                             ; $531e: $20 $f1

	ret                                              ; $5320: $c9


drawHearts:
	ld   de, $99a8                                   ; $5321: $11 $a8 $99
	call b4_dPlusEquValueIn_c6dd                                       ; $5324: $cd $01 $13
	ld   a, $0c                                      ; $5327: $3e $0c
	ld   hl, $c0a0                                   ; $5329: $21 $a0 $c0
	ld   (hl), a                                     ; $532c: $77
	ld   hl, $c073                                   ; $532d: $21 $73 $c0
	ld   b, (hl)                                     ; $5330: $46
	srl  b                                           ; $5331: $cb $38
	ld   hl, $c072                                   ; $5333: $21 $72 $c0
	ld   c, (hl)                                     ; $5336: $4e

jr_008_5337:
	inc  c                                           ; $5337: $0c
	ld   a, $ea                                      ; $5338: $3e $ea
	dec  c                                           ; $533a: $0d
	jr   z, jr_008_5345                              ; $533b: $28 $08

	ld   a, $e9                                      ; $533d: $3e $e9
	dec  c                                           ; $533f: $0d
	jr   z, jr_008_5345                              ; $5340: $28 $03

	ld   a, $e8                                      ; $5342: $3e $e8
	dec  c                                           ; $5344: $0d

jr_008_5345:
	ld   (de), a                                     ; $5345: $12
	inc  de                                          ; $5346: $13
	ld   hl, $c0a0                                   ; $5347: $21 $a0 $c0
	dec  (hl)                                        ; $534a: $35
	dec  b                                           ; $534b: $05
	jr   nz, jr_008_5337                             ; $534c: $20 $e9

	ld   hl, $c0a0                                   ; $534e: $21 $a0 $c0
	ld   c, (hl)                                     ; $5351: $4e
	inc  c                                           ; $5352: $0c
	ld   a, $00                                      ; $5353: $3e $00

jr_008_5355:
	dec  c                                           ; $5355: $0d
	jr   z, jr_008_535c                              ; $5356: $28 $04

	ld   (de), a                                     ; $5358: $12
	inc  de                                          ; $5359: $13
	jr   jr_008_5355                                 ; $535a: $18 $f9

jr_008_535c:
	ret                                              ; $535c: $c9


drawAreaTextInMapScreen:
	ld   de, $99e6                                   ; $535d: $11 $e6 $99
	call b4_dPlusEquValueIn_c6dd                                       ; $5360: $cd $01 $13
	ld   hl, $c716                                   ; $5363: $21 $16 $c7
	ld   c, $07                                      ; $5366: $0e $07
	call copyMemoryC_conv20hTo0                                       ; $5368: $cd $76 $13
	ld   de, $9a06                                   ; $536b: $11 $06 $9a
	call b4_dPlusEquValueIn_c6dd                                       ; $536e: $cd $01 $13
	ld   hl, $c71d                                   ; $5371: $21 $1d $c7
	ld   c, $07                                      ; $5374: $0e $07

copyMemoryC_conv20hTo0:
-
	ldi  a, (hl)                                     ; $5376: $2a
	cp   $20                                         ; $5377: $fe $20
	jr   nz, +                             ; $5379: $20 $02

	ld   a, $00                                      ; $537b: $3e $00

+
	ld   (de), a                                     ; $537d: $12
	inc  de                                          ; $537e: $13
	dec  c                                           ; $537f: $0d
	jr   nz, -                             ; $5380: $20 $f4

	ret                                              ; $5382: $c9


drawBitem:
	ld   de, $98c5                                   ; $5383: $11 $c5 $98
	call b4_dPlusEquValueIn_c6dd                                       ; $5386: $cd $01 $13
	ld   hl, wEquippedBItem                                   ; $5389: $21 $49 $c0
	ld   c, (hl)                                     ; $538c: $4e
	ld   b, $00                                      ; $538d: $06 $00
	ld   hl, $114b                                   ; $538f: $21 $4b $11
	add  hl, bc                                      ; $5392: $09
	ld   a, (hl)                                     ; $5393: $7e
	ld   (de), a                                     ; $5394: $12
	inc  de                                          ; $5395: $13
	add  $02                                         ; $5396: $c6 $02
	ld   (de), a                                     ; $5398: $12
	push af                                          ; $5399: $f5
	ld   de, $98e5                                   ; $539a: $11 $e5 $98
	call b4_dPlusEquValueIn_c6dd                                       ; $539d: $cd $01 $13
	pop  af                                          ; $53a0: $f1
	dec  a                                           ; $53a1: $3d
	ld   (de), a                                     ; $53a2: $12
	inc  de                                          ; $53a3: $13
	add  $02                                         ; $53a4: $c6 $02
	ld   (de), a                                     ; $53a6: $12
	ret                                              ; $53a7: $c9


drawAitem:
	ld   de, $9945                                   ; $53a8: $11 $45 $99
	call b4_dPlusEquValueIn_c6dd                                       ; $53ab: $cd $01 $13
	ld   hl, $c70c                                   ; $53ae: $21 $0c $c7
	ld   c, (hl)                                     ; $53b1: $4e
	ld   b, $00                                      ; $53b2: $06 $00
	ld   hl, $114e                                   ; $53b4: $21 $4e $11
	add  hl, bc                                      ; $53b7: $09
	ld   a, (hl)                                     ; $53b8: $7e
	ld   (de), a                                     ; $53b9: $12
	inc  de                                          ; $53ba: $13
	push af                                          ; $53bb: $f5
	ld   a, c                                        ; $53bc: $79
	push de                                          ; $53bd: $d5
	ld   e, a                                        ; $53be: $5f
	call getFruitAmountFromWram                                       ; $53bf: $cd $fe $13
	add  $30                                         ; $53c2: $c6 $30
	pop  de                                          ; $53c4: $d1
	ld   (de), a                                     ; $53c5: $12
	ld   de, $9965                                   ; $53c6: $11 $65 $99
	call b4_dPlusEquValueIn_c6dd                                       ; $53c9: $cd $01 $13
	pop  af                                          ; $53cc: $f1
	add  $01                                         ; $53cd: $c6 $01
	ld   (de), a                                     ; $53cf: $12
	ret                                              ; $53d0: $c9


drawFruitAmounts:
	ld   de, $9882                                   ; $53d1: $11 $82 $98
	call b4_dPlusEquValueIn_c6dd                                       ; $53d4: $cd $01 $13
	ld   bc, $0000                                   ; $53d7: $01 $00 $00

@loop:
	push de                                          ; $53da: $d5
	push bc                                          ; $53db: $c5
	push bc                                          ; $53dc: $c5
	pop  de                                          ; $53dd: $d1
	call getFruitAmountFromWram                                       ; $53de: $cd $fe $13
	ld   a, e                                        ; $53e1: $7b
	pop  bc                                          ; $53e2: $c1
	pop  de                                          ; $53e3: $d1

// turn fruit nums into the tile idxes
	call convDigitIntoTileIdx                                       ; $53e4: $cd $f6 $12
	ld   (de), a                                     ; $53e7: $12
	call b4_dePlusEqu20h                                       ; $53e8: $cd $f7 $13
	inc  a                                           ; $53eb: $3c
	ld   (de), a                                     ; $53ec: $12
	call b4_dePlusEqu20h                                       ; $53ed: $cd $f7 $13

// 5 fruits?
	inc  bc                                          ; $53f0: $03
	ld   a, c                                        ; $53f1: $79
	cp   $05                                         ; $53f2: $fe $05
	jr   nz, @loop                             ; $53f4: $20 $e4

	ret                                              ; $53f6: $c9

b4_dePlusEqu20h:
	ld   hl, $0020                                   ; $53f7: $21 $20 $00
	add  hl, de                                      ; $53fa: $19
	push hl                                          ; $53fb: $e5
	pop  de                                          ; $53fc: $d1
	ret                                              ; $53fd: $c9


getFruitAmountFromWram:
	ld   a, e                                        ; $53fe: $7b
	push af                                          ; $53ff: $f5
	srl  e                                           ; $5400: $cb $3b
	ld   d, $00                                      ; $5402: $16 $00
	ld   hl, wFruitAmounts                                   ; $5404: $21 $09 $c7
	add  hl, de                                      ; $5407: $19
	ld   e, (hl)                                     ; $5408: $5e
	pop  af                                          ; $5409: $f1
	and  $01                                         ; $540a: $e6 $01
	jr   z, +                              ; $540c: $28 $06

	srl  e                                           ; $540e: $cb $3b
	srl  e                                           ; $5410: $cb $3b
	srl  e                                           ; $5412: $cb $3b

+
	ld   a, e                                        ; $5414: $7b
	and  $07                                         ; $5415: $e6 $07
	ld   e, a                                        ; $5417: $5f
	ret                                              ; $5418: $c9


drawRailroadTicketIfRetrieved:
	ld   hl, wSpecialBitemsGotten                                   ; $5419: $21 $53 $c6
	ld   a, (hl)                                     ; $541c: $7e
	and  $08                                         ; $541d: $e6 $08
	jr   nz, +                             ; $541f: $20 $10

	ld   de, $99a4                                   ; $5421: $11 $a4 $99
	call b4_dPlusEquValueIn_c6dd                                       ; $5424: $cd $01 $13
	ld   a, $00                                      ; $5427: $3e $00
	ld   (de), a                                     ; $5429: $12
	inc  de                                          ; $542a: $13
	ld   (de), a                                     ; $542b: $12
	inc  de                                          ; $542c: $13
	ld   (de), a                                     ; $542d: $12
	inc  de                                          ; $542e: $13
	ld   (de), a                                     ; $542f: $12
	inc  de                                          ; $5430: $13

+
	ret                                              ; $5431: $c9


drawSelectableBitems:
	ld   de, $9821                                   ; $5432: $11 $21 $98
	call b4_dPlusEquValueIn_c6dd                                       ; $5435: $cd $01 $13
	call checkBitemsSelectable                                       ; $5438: $cd $a4 $11
	ld   b, a                                        ; $543b: $47
	ld   c, $00                                      ; $543c: $0e $00

@checkNextItem:
	bit  0, b                                        ; $543e: $cb $40
	jr   nz, +                             ; $5440: $20 $03

// dont have item
	call clearOut2x2TileAtDE                                       ; $5442: $cd $50 $14

+
	inc  de                                          ; $5445: $13
	inc  de                                          ; $5446: $13
	srl  b                                           ; $5447: $cb $38
	inc  c                                           ; $5449: $0c
	ld   a, c                                        ; $544a: $79
	cp   $08                                         ; $544b: $fe $08
	jr   nz, @checkNextItem                             ; $544d: $20 $ef

	ret                                              ; $544f: $c9


clearOut2x2TileAtDE:
	push af                                          ; $5450: $f5
	push de                                          ; $5451: $d5
	push hl                                          ; $5452: $e5
	ld   a, $00                                      ; $5453: $3e $00
	ld   (de), a                                     ; $5455: $12
	inc  de                                          ; $5456: $13
	ld   (de), a                                     ; $5457: $12
	ld   hl, $001f                                   ; $5458: $21 $1f $00
	add  hl, de                                      ; $545b: $19
	ldi  (hl), a                                     ; $545c: $22
	ldi  (hl), a                                     ; $545d: $22
	pop  hl                                          ; $545e: $e1
	pop  de                                          ; $545f: $d1
	pop  af                                          ; $5460: $f1
	ret                                              ; $5461: $c9


func_04_1462:
	ld   hl, wArmorOfGodGotten                                   ; $5462: $21 $52 $c6
	ld   b, (hl)                                     ; $5465: $46
	ld   c, $00                                      ; $5466: $0e $00

jr_008_5468:
	bit  0, b                                        ; $5468: $cb $40
	jr   nz, jr_008_547e                             ; $546a: $20 $12

	ld   hl, $1153                                   ; $546c: $21 $53 $11
	push bc                                          ; $546f: $c5
	ld   b, $00                                      ; $5470: $06 $00
	add  hl, bc                                      ; $5472: $09
	add  hl, bc                                      ; $5473: $09
	pop  bc                                          ; $5474: $c1
	ld   e, (hl)                                     ; $5475: $5e
	inc  hl                                          ; $5476: $23
	ld   d, (hl)                                     ; $5477: $56
	call b4_dPlusEquValueIn_c6dd                                       ; $5478: $cd $01 $13
	call clearOut2x2TileAtDE                                       ; $547b: $cd $50 $14

jr_008_547e:
	srl  b                                           ; $547e: $cb $38
	inc  c                                           ; $5480: $0c
	ld   a, c                                        ; $5481: $79
	cp   $06                                         ; $5482: $fe $06
	jr   nz, jr_008_5468                             ; $5484: $20 $e2

	ret                                              ; $5486: $c9


data_04_1487:
	jr   nc, jr_008_54ba                             ; $5487: $30 $31

	ldd  (hl), a                                     ; $5489: $32
	inc  sp                                          ; $548a: $33
	inc  (hl)                                        ; $548b: $34
	dec  (hl)                                        ; $548c: $35
	ld   (hl), $37                                   ; $548d: $36 $37
	.db $38 $39

	ld   b, c                                        ; $5491: $41
	ld   b, d                                        ; $5492: $42
	ld   b, e                                        ; $5493: $43
	ld   b, h                                        ; $5494: $44
	ld   b, l                                        ; $5495: $45
	ld   b, (hl)                                     ; $5496: $46
	ld   b, a                                        ; $5497: $47
	ld   c, b                                        ; $5498: $48
	ld   c, c                                        ; $5499: $49
	ld   c, d                                        ; $549a: $4a
	ld   c, e                                        ; $549b: $4b
	ld   c, h                                        ; $549c: $4c
	ld   c, l                                        ; $549d: $4d
	ld   c, (hl)                                     ; $549e: $4e
	ld   c, a                                        ; $549f: $4f
	ld   d, b                                        ; $54a0: $50
	ld   d, c                                        ; $54a1: $51
	ld   d, d                                        ; $54a2: $52
	ld   d, e                                        ; $54a3: $53
	ld   d, h                                        ; $54a4: $54
	ld   d, l                                        ; $54a5: $55
	ld   d, (hl)                                     ; $54a6: $56
	ld   d, a                                        ; $54a7: $57
	ld   e, b                                        ; $54a8: $58
	ld   e, c                                        ; $54a9: $59
	ld   e, d                                        ; $54aa: $5a
	ld   h, c                                        ; $54ab: $61
	ld   h, d                                        ; $54ac: $62
	ld   h, e                                        ; $54ad: $63
	ld   h, h                                        ; $54ae: $64
	ld   h, l                                        ; $54af: $65
	ld   h, (hl)                                     ; $54b0: $66
	ld   h, a                                        ; $54b1: $67
	ld   l, b                                        ; $54b2: $68
	ld   l, c                                        ; $54b3: $69
	ld   l, d                                        ; $54b4: $6a
	ld   l, e                                        ; $54b5: $6b
	ld   l, h                                        ; $54b6: $6c
	ld   l, l                                        ; $54b7: $6d
	ld   l, (hl)                                     ; $54b8: $6e
	ld   l, a                                        ; $54b9: $6f

jr_008_54ba:
	ld   (hl), b                                     ; $54ba: $70
	ld   (hl), c                                     ; $54bb: $71
	ld   (hl), d                                     ; $54bc: $72
	ld   (hl), e                                     ; $54bd: $73
	ld   (hl), h                                     ; $54be: $74
	ld   (hl), l                                     ; $54bf: $75
	.db  $76                                         ; $54c0: $76
	ld   (hl), a                                     ; $54c1: $77
	ld   a, b                                        ; $54c2: $78
	ld   a, c                                        ; $54c3: $79
	ld   a, d                                        ; $54c4: $7a
	.db $21 $5c


drawPlayerNameInMap:
	ld   de, $9806
	call b4_dPlusEquValueIn_c6dd                                       ; $54ca: $cd $01 $13
	ld   bc, $0000                                   ; $54cd: $01 $00 $00

jr_008_54d0:
	ld   hl, wPlayerName                                   ; $54d0: $21 $49 $c6
	add  hl, bc                                      ; $54d3: $09

	push de                                          ; $54d4: $d5
	ld   e, (hl)                                     ; $54d5: $5e
	ld   d, $00                                      ; $54d6: $16 $00
	ld   hl, data_04_1487                                   ; $54d8: $21 $87 $14
	add  hl, de                                      ; $54db: $19
	ld   a, (hl)                                     ; $54dc: $7e
	pop  de                                          ; $54dd: $d1

	ld   (de), a                                     ; $54de: $12
	inc  de                                          ; $54df: $13
	inc  bc                                          ; $54e0: $03
	ld   a, c                                        ; $54e1: $79
	cp   $08                                         ; $54e2: $fe $08
	jr   nz, jr_008_54d0                             ; $54e4: $20 $ea

	ret                                              ; $54e6: $c9


drawCurrentLocationInMap:
	ld   hl, wCurrGroupMapVRamOffset                                   ; $54e7: $21 $da $c0
	ld   a, (hl)                                     ; $54ea: $7e
	cp   $ff                                         ; $54eb: $fe $ff
	jr   nz, @notFFFF                             ; $54ed: $20 $09

	ld   hl, wCurrGroupMapVRamOffset+1                                   ; $54ef: $21 $db $c0
	ld   a, (hl)                                     ; $54f2: $7e
	cp   $ff                                         ; $54f3: $fe $ff
	jr   nz, @notFFFF                             ; $54f5: $20 $01

	ret                                              ; $54f7: $c9

@notFFFF:
	ld   hl, wCurrRoomY                                   ; $54f8: $21 $35 $c0
	ld   c, (hl)                                     ; $54fb: $4e
	ld   e, $20                                      ; $54fc: $1e $20
	call ecEquEtimesC                                       ; $54fe: $cd $03 $08
	ld   hl, wCurrRoomX                                   ; $5501: $21 $34 $c0
	ld   a, (hl)                                     ; $5504: $7e
	call ecPlusEquA                                       ; $5505: $cd $3d $08
	ld   a, c                                        ; $5508: $79
	ld   hl, wCurrGroupMapVRamOffset                                   ; $5509: $21 $da $c0
	add  (hl)                                        ; $550c: $86

	push af                                          ; $550d: $f5
	ld   a, e                                        ; $550e: $7b
	ld   hl, wCurrGroupMapVRamOffset+1                                   ; $550f: $21 $db $c0
	adc  (hl)                                        ; $5512: $8e
	ld   d, a                                        ; $5513: $57
	pop  af                                          ; $5514: $f1

	ld   e, a                                        ; $5515: $5f
	call b4_dPlusEquValueIn_c6dd                                       ; $5516: $cd $01 $13
// 5b is the x on current location
	ld   a, $5b                                      ; $5519: $3e $5b
	ld   (de), a                                     ; $551b: $12
	ret                                              ; $551c: $c9


;;
	cp   d                                           ; $551d: $ba
	or   e                                           ; $551e: $b3
	cp   (hl)                                        ; $551f: $be
	nop                                              ; $5520: $00
	pop  af                                          ; $5521: $f1
	ld   (hl), b                                     ; $5522: $70
	ldh  a, (<$ff)                                   ; $5523: $f0 $ff
	inc  a                                           ; $5525: $3c
	cp   d                                           ; $5526: $ba
	or   b                                           ; $5527: $b0
	cp   (hl)                                        ; $5528: $be
	dec  de                                          ; $5529: $1b
	ldh  a, (<$f1)                                   ; $552a: $f0 $f1
	ld   l, a                                        ; $552c: $6f
	sub  a                                           ; $552d: $97
	ld   e, $ba                                      ; $552e: $1e $ba
	or   b                                           ; $5530: $b0
	cp   (hl)                                        ; $5531: $be
	dec  l                                           ; $5532: $2d
	ldh  a, (<$f1)                                   ; $5533: $f0 $f1
	ld   l, a                                        ; $5535: $6f
	sbc  a                                           ; $5536: $9f
	ld   e, $ba                                      ; $5537: $1e $ba
	or   c                                           ; $5539: $b1
	cp   (hl)                                        ; $553a: $be
	dec  c                                           ; $553b: $0d
	or   b                                           ; $553c: $b0
	pop  af                                          ; $553d: $f1
	ld   l, a                                        ; $553e: $6f
	sbc  h                                           ; $553f: $9c
	ld   e, $ba                                      ; $5540: $1e $ba
	or   b                                           ; $5542: $b0
	cp   (hl)                                        ; $5543: $be
	inc  de                                          ; $5544: $13
	nop                                              ; $5545: $00
	ldh  a, (<$e0)                                   ; $5546: $f0 $e0
	and  c                                           ; $5548: $a1
	ld   e, $ba                                      ; $5549: $1e $ba
	or   b                                           ; $554b: $b0
	cp   (hl)                                        ; $554c: $be
	sub  a                                           ; $554d: $97
	add  b                                           ; $554e: $80
	ldh  a, (<$e0)                                   ; $554f: $f0 $e0
	and  l                                           ; $5551: $a5
	ld   e, $ba                                      ; $5552: $1e $ba
	or   e                                           ; $5554: $b3
	cp   (hl)                                        ; $5555: $be
	nop                                              ; $5556: $00
	pop  af                                          ; $5557: $f1
	ld   b, b                                        ; $5558: $40
	rst  $38                                         ; $5559: $ff
	rst  $38                                         ; $555a: $ff
	ld   e, $ba                                      ; $555b: $1e $ba
	or   b                                           ; $555d: $b0
	cp   (hl)                                        ; $555e: $be
	sub  h                                           ; $555f: $94
	add  b                                           ; $5560: $80
	ldh  a, (<$00)                                   ; $5561: $f0 $00
	or   e                                           ; $5563: $b3
	ld   e, $ba                                      ; $5564: $1e $ba
	or   e                                           ; $5566: $b3
	cp   (hl)                                        ; $5567: $be
	nop                                              ; $5568: $00
	pop  af                                          ; $5569: $f1
	jr   z, -$10                                     ; $556a: $28 $f0

	rst  $38                                         ; $556c: $ff
	inc  a                                           ; $556d: $3c
	cp   d                                           ; $556e: $ba
	or   b                                           ; $556f: $b0
	cp   (hl)                                        ; $5570: $be
	ld   d, a                                        ; $5571: $57
	xor  a                                           ; $5572: $af
	ldh  a, (<$f0)                                   ; $5573: $f0 $f0
	xor  h                                           ; $5575: $ac
	ld   e, $ba                                      ; $5576: $1e $ba
	or   b                                           ; $5578: $b0
	cp   (hl)                                        ; $5579: $be
	scf                                              ; $557a: $37
	xor  a                                           ; $557b: $af
	ldh  a, (<$f0)                                   ; $557c: $f0 $f0
	xor  h                                           ; $557e: $ac
	ld   e, $ba                                      ; $557f: $1e $ba
	or   b                                           ; $5581: $b0
	cp   (hl)                                        ; $5582: $be
	ld   d, h                                        ; $5583: $54
	adc  a                                           ; $5584: $8f
	ldh  a, (<$d5)                                   ; $5585: $f0 $d5
	and  (hl)                                        ; $5587: $a6
	ld   e, $ba                                      ; $5588: $1e $ba
	or   b                                           ; $558a: $b0
	cp   (hl)                                        ; $558b: $be
	ld   b, (hl)                                     ; $558c: $46
	adc  a                                           ; $558d: $8f
	ldh  a, (<$45)                                   ; $558e: $f0 $45
	and  a                                           ; $5590: $a7
	ld   e, $ba                                      ; $5591: $1e $ba
	or   c                                           ; $5593: $b1
	cp   (hl)                                        ; $5594: $be
	nop                                              ; $5595: $00
	cp   l                                           ; $5596: $bd
	ld   a, ($ff00+c)                                ; $5597: $f2
	add  b                                           ; $5598: $80
	and  a                                           ; $5599: $a7
	ld   e, $ba                                      ; $559a: $1e $ba
	or   b                                           ; $559c: $b0
	cp   (hl)                                        ; $559d: $be
	xor  l                                           ; $559e: $ad
	add  b                                           ; $559f: $80
	.db  $f4                                         ; $55a0: $f4
	ld   h, b                                        ; $55a1: $60
	adc  e                                           ; $55a2: $8b
	ld   e, $ba                                      ; $55a3: $1e $ba
	or   b                                           ; $55a5: $b0
	cp   (hl)                                        ; $55a6: $be
	dec  d                                           ; $55a7: $15
	add  b                                           ; $55a8: $80
	ldh  a, (<$00)                                   ; $55a9: $f0 $00
	or   (hl)                                        ; $55ab: $b6
	ld   e, $ba                                      ; $55ac: $1e $ba
	or   c                                           ; $55ae: $b1
	cp   (hl)                                        ; $55af: $be
	dec  c                                           ; $55b0: $0d
	or   b                                           ; $55b1: $b0
	pop  af                                          ; $55b2: $f1
	ld   l, a                                        ; $55b3: $6f
	sbc  h                                           ; $55b4: $9c
	rrca                                             ; $55b5: $0f
	or   c                                           ; $55b6: $b1
	cp   (hl)                                        ; $55b7: $be
	dec  c                                           ; $55b8: $0d
	or   b                                           ; $55b9: $b0
	pop  af                                          ; $55ba: $f1
	ld   l, a                                        ; $55bb: $6f
	sbc  h                                           ; $55bc: $9c
	rrca                                             ; $55bd: $0f
	or   c                                           ; $55be: $b1
	cp   (hl)                                        ; $55bf: $be
	dec  c                                           ; $55c0: $0d
	or   b                                           ; $55c1: $b0
	pop  af                                          ; $55c2: $f1
	ld   l, a                                        ; $55c3: $6f
	sbc  h                                           ; $55c4: $9c
	rrca                                             ; $55c5: $0f
	or   c                                           ; $55c6: $b1
	cp   (hl)                                        ; $55c7: $be
	dec  c                                           ; $55c8: $0d
	or   b                                           ; $55c9: $b0
	pop  af                                          ; $55ca: $f1
	ld   l, a                                        ; $55cb: $6f
	sbc  h                                           ; $55cc: $9c
	rrca                                             ; $55cd: $0f
	or   c                                           ; $55ce: $b1
	cp   (hl)                                        ; $55cf: $be
	dec  c                                           ; $55d0: $0d
	or   b                                           ; $55d1: $b0
	pop  af                                          ; $55d2: $f1
	ld   l, a                                        ; $55d3: $6f
	sbc  h                                           ; $55d4: $9c
	rrca                                             ; $55d5: $0f
	cp   d                                           ; $55d6: $ba
	or   b                                           ; $55d7: $b0
	cp   (hl)                                        ; $55d8: $be
	dec  de                                          ; $55d9: $1b
	ldh  a, (<$f1)                                   ; $55da: $f0 $f1
	ld   l, a                                        ; $55dc: $6f
	sub  a                                           ; $55dd: $97
	ld   e, $ba                                      ; $55de: $1e $ba
	or   b                                           ; $55e0: $b0
	cp   (hl)                                        ; $55e1: $be
	xor  l                                           ; $55e2: $ad
	add  b                                           ; $55e3: $80
	.db  $f4                                         ; $55e4: $f4
	ld   h, b                                        ; $55e5: $60
	adc  e                                           ; $55e6: $8b
	ld   e, $ba                                      ; $55e7: $1e $ba
	or   b                                           ; $55e9: $b0
	cp   (hl)                                        ; $55ea: $be
	xor  l                                           ; $55eb: $ad
	add  b                                           ; $55ec: $80
	.db  $f4                                         ; $55ed: $f4
	ld   h, b                                        ; $55ee: $60
	adc  e                                           ; $55ef: $8b
	ld   e, $ba                                      ; $55f0: $1e $ba
	or   b                                           ; $55f2: $b0
	cp   (hl)                                        ; $55f3: $be
	ld   h, a                                        ; $55f4: $67
	add  b                                           ; $55f5: $80
	ret  nc                                          ; $55f6: $d0

	ret  nz                                          ; $55f7: $c0

	and  (hl)                                        ; $55f8: $a6
	inc  a                                           ; $55f9: $3c
	cp   d                                           ; $55fa: $ba
	or   e                                           ; $55fb: $b3
	cp   (hl)                                        ; $55fc: $be
	nop                                              ; $55fd: $00
	pop  de                                          ; $55fe: $d1
	adc  b                                           ; $55ff: $88
	ldh  a, (<$ff)                                   ; $5600: $f0 $ff
	inc  bc                                          ; $5602: $03
	cp   d                                           ; $5603: $ba
	or   b                                           ; $5604: $b0
	cp   (hl)                                        ; $5605: $be
	and  l                                           ; $5606: $a5
	add  b                                           ; $5607: $80
	ldh  a, (<$60)                                   ; $5608: $f0 $60
	and  a                                           ; $560a: $a7
	ld   ($b1ba), sp                                 ; $560b: $08 $ba $b1
	cp   (hl)                                        ; $560e: $be
	nop                                              ; $560f: $00
	nop                                              ; $5610: $00
	and  b                                           ; $5611: $a0
	inc  l                                           ; $5612: $2c
	add  h                                           ; $5613: $84
	inc  a                                           ; $5614: $3c
	cp   (hl)                                        ; $5615: $be
	nop                                              ; $5616: $00
	nop                                              ; $5617: $00
	rst  $38                                         ; $5618: $ff
	inc  l                                           ; $5619: $2c
	call nz, $ba0a                                   ; $561a: $c4 $0a $ba
	or   b                                           ; $561d: $b0
	cp   (hl)                                        ; $561e: $be
	nop                                              ; $561f: $00
	cp   l                                           ; $5620: $bd
	pop  af                                          ; $5621: $f1
	ret  nc                                          ; $5622: $d0

	cp   $08                                         ; $5623: $fe $08
	cp   d                                           ; $5625: $ba
	or   b                                           ; $5626: $b0
	cp   (hl)                                        ; $5627: $be
	rst  $38                                         ; $5628: $ff
	nop                                              ; $5629: $00
	or   $d0                                         ; $562a: $f6 $d0
	rst  $38                                         ; $562c: $ff
	inc  b                                           ; $562d: $04
	or   b                                           ; $562e: $b0
	cp   (hl)                                        ; $562f: $be
	rst  $38                                         ; $5630: $ff
	nop                                              ; $5631: $00
	or   $d0                                         ; $5632: $f6 $d0
	rst  $38                                         ; $5634: $ff
	inc  b                                           ; $5635: $04
	or   b                                           ; $5636: $b0
	cp   (hl)                                        ; $5637: $be
	rst  $38                                         ; $5638: $ff
	nop                                              ; $5639: $00
	or   $d0                                         ; $563a: $f6 $d0
	rst  $38                                         ; $563c: $ff
	inc  b                                           ; $563d: $04
	or   b                                           ; $563e: $b0
	cp   (hl)                                        ; $563f: $be
	rst  $38                                         ; $5640: $ff
	nop                                              ; $5641: $00
	or   $d0                                         ; $5642: $f6 $d0
	rst  $38                                         ; $5644: $ff
	.db  $10                                         ; $5645: $10
	cp   d                                           ; $5646: $ba
	or   e                                           ; $5647: $b3
	cp   (hl)                                        ; $5648: $be
	nop                                              ; $5649: $00
	rst  $30                                         ; $564a: $f7
	ld   (de), a                                     ; $564b: $12
	ldh  a, (<$ff)                                   ; $564c: $f0 $ff
	ld   ($beb3), sp                                 ; $564e: $08 $b3 $be

jr_008_5651:
	nop                                              ; $5651: $00
	rst  $30                                         ; $5652: $f7
	ld   (de), a                                     ; $5653: $12
	ldh  a, (<$ff)                                   ; $5654: $f0 $ff
	ld   ($b3ba), sp                                 ; $5656: $08 $ba $b3
	cp   (hl)                                        ; $5659: $be

jr_008_565a:
	nop                                              ; $565a: $00
	pop  af                                          ; $565b: $f1
	ld   b, c                                        ; $565c: $41
	ldh  a, (<$ff)                                   ; $565d: $f0 $ff
	inc  c                                           ; $565f: $0c
	cp   d                                           ; $5660: $ba
	or   e                                           ; $5661: $b3
	cp   (hl)                                        ; $5662: $be
	nop                                              ; $5663: $00
	pop  af                                          ; $5664: $f1
	ld   (hl), b                                     ; $5665: $70
	ldh  a, (<$ff)                                   ; $5666: $f0 $ff
	inc  b                                           ; $5668: $04
	cp   d                                           ; $5669: $ba
	or   b                                           ; $566a: $b0
	cp   (hl)                                        ; $566b: $be
	sub  l                                           ; $566c: $95
	add  b                                           ; $566d: $80
	ld   a, ($ff00+c)                                ; $566e: $f2
	nop                                              ; $566f: $00
	and  e                                           ; $5670: $a3
	inc  bc                                          ; $5671: $03
	cp   d                                           ; $5672: $ba
	or   b                                           ; $5673: $b0
	cp   (hl)                                        ; $5674: $be
	ld   h, a                                        ; $5675: $67
	sub  c                                           ; $5676: $91
	ret  nc                                          ; $5677: $d0

	or   b                                           ; $5678: $b0
	adc  a                                           ; $5679: $8f
	inc  b                                           ; $567a: $04
	cp   d                                           ; $567b: $ba
	or   b                                           ; $567c: $b0
	cp   (hl)                                        ; $567d: $be

jr_008_567e:
	ld   h, $c0                                      ; $567e: $26 $c0
	ret  nz                                          ; $5680: $c0

	ldh  a, (<$fd)                                   ; $5681: $f0 $fd
	inc  c                                           ; $5683: $0c
	cp   d                                           ; $5684: $ba
	or   b                                           ; $5685: $b0

jr_008_5686:
	cp   (hl)                                        ; $5686: $be

jr_008_5687:
	scf                                              ; $5687: $37
	add  b                                           ; $5688: $80
	ldh  a, (<$90)                                   ; $5689: $f0 $90
	rst  $38                                         ; $568b: $ff
	.db  $10                                         ; $568c: $10
	cp   d                                           ; $568d: $ba
	or   e                                           ; $568e: $b3

jr_008_568f:
	cp   (hl)                                        ; $568f: $be
	nop                                              ; $5690: $00
	and  d                                           ; $5691: $a2
	ld   b, b                                        ; $5692: $40
	rst  $38                                         ; $5693: $ff
	rst  $38                                         ; $5694: $ff
	jr   z, jr_008_5651                              ; $5695: $28 $ba

jr_008_5697:
	or   b                                           ; $5697: $b0
	cp   (hl)                                        ; $5698: $be
	or   l                                           ; $5699: $b5
	add  b                                           ; $569a: $80
	ld   a, ($ab00)                                  ; $569b: $fa $00 $ab
	jr   z, jr_008_565a                              ; $569e: $28 $ba

	or   b                                           ; $56a0: $b0
	cp   (hl)                                        ; $56a1: $be
	dec  sp                                          ; $56a2: $3b
	rst  $08                                         ; $56a3: $cf
	pop  af                                          ; $56a4: $f1
	nop                                              ; $56a5: $00

jr_008_56a6:
	push af                                          ; $56a6: $f5
	inc  d                                           ; $56a7: $14
	cp   d                                           ; $56a8: $ba
	or   b                                           ; $56a9: $b0
	cp   (hl)                                        ; $56aa: $be
	ld   h, a                                        ; $56ab: $67
	jr   nc, jr_008_567e                             ; $56ac: $30 $d0

	ld   b, b                                        ; $56ae: $40
	cp   $1e                                         ; $56af: $fe $1e
	or   b                                           ; $56b1: $b0
	cp   (hl)                                        ; $56b2: $be
	ld   h, a                                        ; $56b3: $67
	jr   nc, jr_008_5686                             ; $56b4: $30 $d0

	ld   b, b                                        ; $56b6: $40
	cp   $08                                         ; $56b7: $fe $08
	cp   d                                           ; $56b9: $ba
	or   b                                           ; $56ba: $b0
	cp   (hl)                                        ; $56bb: $be
	ld   h, a                                        ; $56bc: $67
	jr   nc, jr_008_568f                             ; $56bd: $30 $d0

	sub  b                                           ; $56bf: $90
	cp   $1e                                         ; $56c0: $fe $1e
	or   b                                           ; $56c2: $b0
	cp   (hl)                                        ; $56c3: $be
	ld   h, a                                        ; $56c4: $67
	jr   nc, jr_008_5697                             ; $56c5: $30 $d0

	sub  b                                           ; $56c7: $90
	cp   $08                                         ; $56c8: $fe $08
	cp   d                                           ; $56ca: $ba
	or   e                                           ; $56cb: $b3
	cp   (hl)                                        ; $56cc: $be
	nop                                              ; $56cd: $00
	ldh  a, (<$a8)                                   ; $56ce: $f0 $a8
	ldh  a, (<$ff)                                   ; $56d0: $f0 $ff
	jr   z, jr_008_5687                              ; $56d2: $28 $b3

	cp   (hl)                                        ; $56d4: $be
	nop                                              ; $56d5: $00
	ldh  a, (<$a8)                                   ; $56d6: $f0 $a8
	ldh  a, (<$ff)                                   ; $56d8: $f0 $ff

jr_008_56da:
	jr   z, jr_008_568f                              ; $56da: $28 $b3

	cp   (hl)                                        ; $56dc: $be
	nop                                              ; $56dd: $00
	ldh  a, (<$a8)                                   ; $56de: $f0 $a8
	ldh  a, (<$ff)                                   ; $56e0: $f0 $ff
	jr   z, jr_008_5697                              ; $56e2: $28 $b3

	cp   (hl)                                        ; $56e4: $be
	nop                                              ; $56e5: $00
	ld   a, ($ff00+c)                                ; $56e6: $f2
	xor  b                                           ; $56e7: $a8
	ldh  a, (<$ff)                                   ; $56e8: $f0 $ff
	jr   z, jr_008_56a6                              ; $56ea: $28 $ba

	or   e                                           ; $56ec: $b3
	cp   (hl)                                        ; $56ed: $be
	nop                                              ; $56ee: $00
	ld   a, ($ff00+c)                                ; $56ef: $f2
	ld   b, b                                        ; $56f0: $40
	add  b                                           ; $56f1: $80
	rst  $38                                         ; $56f2: $ff
	ld   (bc), a                                     ; $56f3: $02
	or   e                                           ; $56f4: $b3
	cp   (hl)                                        ; $56f5: $be
	nop                                              ; $56f6: $00
	ld   a, ($ff00+c)                                ; $56f7: $f2
	ld   b, c                                        ; $56f8: $41
	add  b                                           ; $56f9: $80
	rst  $38                                         ; $56fa: $ff
	ld   (bc), a                                     ; $56fb: $02

jr_008_56fc:
	or   e                                           ; $56fc: $b3
	cp   (hl)                                        ; $56fd: $be
	nop                                              ; $56fe: $00
	ld   a, ($ff00+c)                                ; $56ff: $f2
	ld   b, d                                        ; $5700: $42
	add  b                                           ; $5701: $80
	rst  $38                                         ; $5702: $ff
	ld   (bc), a                                     ; $5703: $02
	or   e                                           ; $5704: $b3

jr_008_5705:
	cp   (hl)                                        ; $5705: $be
	nop                                              ; $5706: $00
	ld   a, ($ff00+c)                                ; $5707: $f2
	ld   b, e                                        ; $5708: $43
	add  b                                           ; $5709: $80
	rst  $38                                         ; $570a: $ff
	ld   (bc), a                                     ; $570b: $02
	or   e                                           ; $570c: $b3
	cp   (hl)                                        ; $570d: $be
	nop                                              ; $570e: $00
	ld   a, ($ff00+c)                                ; $570f: $f2
	ld   b, h                                        ; $5710: $44
	add  b                                           ; $5711: $80
	rst  $38                                         ; $5712: $ff
	ld   (bc), a                                     ; $5713: $02
	or   e                                           ; $5714: $b3
	cp   (hl)                                        ; $5715: $be
	nop                                              ; $5716: $00
	ld   a, ($ff00+c)                                ; $5717: $f2
	ld   b, l                                        ; $5718: $45
	add  b                                           ; $5719: $80
	rst  $38                                         ; $571a: $ff
	ld   (bc), a                                     ; $571b: $02
	or   e                                           ; $571c: $b3
	cp   (hl)                                        ; $571d: $be
	nop                                              ; $571e: $00
	ld   a, ($ff00+c)                                ; $571f: $f2
	ld   b, (hl)                                     ; $5720: $46
	add  b                                           ; $5721: $80
	rst  $38                                         ; $5722: $ff
	ld   (bc), a                                     ; $5723: $02
	or   e                                           ; $5724: $b3
	cp   (hl)                                        ; $5725: $be
	nop                                              ; $5726: $00
	ld   a, ($ff00+c)                                ; $5727: $f2
	ld   b, a                                        ; $5728: $47
	add  b                                           ; $5729: $80
	rst  $38                                         ; $572a: $ff
	ld   (bc), a                                     ; $572b: $02
	cp   d                                           ; $572c: $ba
	or   e                                           ; $572d: $b3
	cp   (hl)                                        ; $572e: $be
	nop                                              ; $572f: $00
	ld   a, ($ff00+c)                                ; $5730: $f2
	inc  sp                                          ; $5731: $33
	add  b                                           ; $5732: $80
	rst  $38                                         ; $5733: $ff
	ld   d, b                                        ; $5734: $50
	cp   d                                           ; $5735: $ba
	or   b                                           ; $5736: $b0
	cp   (hl)                                        ; $5737: $be
	ld   (hl), l                                     ; $5738: $75
	ld   sp, hl                                      ; $5739: $f9
	or   c                                           ; $573a: $b1
	jr   nc, jr_008_56da                             ; $573b: $30 $9d

	ld   ($beb0), sp                                 ; $573d: $08 $b0 $be
	nop                                              ; $5740: $00
	nop                                              ; $5741: $00
	nop                                              ; $5742: $00
	nop                                              ; $5743: $00
	nop                                              ; $5744: $00
	ld   (bc), a                                     ; $5745: $02
	or   b                                           ; $5746: $b0
	cp   (hl)                                        ; $5747: $be
	ld   (hl), l                                     ; $5748: $75
	ld   sp, hl                                      ; $5749: $f9
	or   c                                           ; $574a: $b1
	jr   nc, -$62                                    ; $574b: $30 $9e

	ld   ($beb0), sp                                 ; $574d: $08 $b0 $be
	nop                                              ; $5750: $00
	nop                                              ; $5751: $00
	nop                                              ; $5752: $00
	nop                                              ; $5753: $00
	nop                                              ; $5754: $00
	ld   (bc), a                                     ; $5755: $02
	or   b                                           ; $5756: $b0
	cp   (hl)                                        ; $5757: $be
	ld   (hl), l                                     ; $5758: $75
	ld   sp, hl                                      ; $5759: $f9
	or   c                                           ; $575a: $b1
	jr   nc, jr_008_56fc                             ; $575b: $30 $9f

	inc  d                                           ; $575d: $14
	cp   d                                           ; $575e: $ba
	or   b                                           ; $575f: $b0
	cp   (hl)                                        ; $5760: $be
	add  $f9                                         ; $5761: $c6 $f9
	or   c                                           ; $5763: $b1
	jr   nc, jr_008_5705                             ; $5764: $30 $9f

	ld   ($b0ba), sp                                 ; $5766: $08 $ba $b0
	cp   (hl)                                        ; $5769: $be
	add  $f9                                         ; $576a: $c6 $f9
	or   c                                           ; $576c: $b1
	ld   d, b                                        ; $576d: $50
	sbc  h                                           ; $576e: $9c
	ld   ($b3ba), sp                                 ; $576f: $08 $ba $b3
	cp   (hl)                                        ; $5772: $be
	nop                                              ; $5773: $00
	ld   a, ($ff00+c)                                ; $5774: $f2
	ldi  (hl), a                                     ; $5775: $22
	add  b                                           ; $5776: $80
	rst  $38                                         ; $5777: $ff
	inc  b                                           ; $5778: $04
	or   e                                           ; $5779: $b3
	cp   (hl)                                        ; $577a: $be
	nop                                              ; $577b: $00
	nop                                              ; $577c: $00
	nop                                              ; $577d: $00
	nop                                              ; $577e: $00
	rrca                                             ; $577f: $0f
	ld   bc, $beb3                                   ; $5780: $01 $b3 $be
	nop                                              ; $5783: $00
	ld   a, ($ff00+c)                                ; $5784: $f2
	ldi  (hl), a                                     ; $5785: $22
	add  b                                           ; $5786: $80
	rst  $38                                         ; $5787: $ff
	inc  b                                           ; $5788: $04
	or   e                                           ; $5789: $b3
	cp   (hl)                                        ; $578a: $be
	nop                                              ; $578b: $00
	nop                                              ; $578c: $00
	nop                                              ; $578d: $00
	nop                                              ; $578e: $00
	rrca                                             ; $578f: $0f
	ld   bc, $beb3                                   ; $5790: $01 $b3 $be
	nop                                              ; $5793: $00
	ld   a, ($ff00+c)                                ; $5794: $f2
	ldi  (hl), a                                     ; $5795: $22
	add  b                                           ; $5796: $80
	rst  $38                                         ; $5797: $ff
	inc  b                                           ; $5798: $04
	or   e                                           ; $5799: $b3
	cp   (hl)                                        ; $579a: $be
	nop                                              ; $579b: $00
	nop                                              ; $579c: $00
	nop                                              ; $579d: $00
	nop                                              ; $579e: $00
	rrca                                             ; $579f: $0f
	ld   bc, $beb3                                   ; $57a0: $01 $b3 $be
	nop                                              ; $57a3: $00
	ld   a, ($ff00+c)                                ; $57a4: $f2
	ldi  (hl), a                                     ; $57a5: $22
	add  b                                           ; $57a6: $80
	rst  $38                                         ; $57a7: $ff
	inc  b                                           ; $57a8: $04
	or   e                                           ; $57a9: $b3
	cp   (hl)                                        ; $57aa: $be
	nop                                              ; $57ab: $00
	nop                                              ; $57ac: $00
	nop                                              ; $57ad: $00
	nop                                              ; $57ae: $00
	rrca                                             ; $57af: $0f
	ld   bc, $beb3                                   ; $57b0: $01 $b3 $be
	nop                                              ; $57b3: $00
	ld   a, ($ff00+c)                                ; $57b4: $f2
	ldi  (hl), a                                     ; $57b5: $22
	add  b                                           ; $57b6: $80
	rst  $38                                         ; $57b7: $ff
	inc  b                                           ; $57b8: $04
	or   e                                           ; $57b9: $b3
	cp   (hl)                                        ; $57ba: $be
	nop                                              ; $57bb: $00
	nop                                              ; $57bc: $00
	nop                                              ; $57bd: $00
	nop                                              ; $57be: $00
	rrca                                             ; $57bf: $0f
	ld   bc, $beb3                                   ; $57c0: $01 $b3 $be
	nop                                              ; $57c3: $00
	ld   a, ($ff00+c)                                ; $57c4: $f2
	ldi  (hl), a                                     ; $57c5: $22
	add  b                                           ; $57c6: $80
	rst  $38                                         ; $57c7: $ff
	inc  b                                           ; $57c8: $04
	or   e                                           ; $57c9: $b3
	cp   (hl)                                        ; $57ca: $be
	nop                                              ; $57cb: $00
	nop                                              ; $57cc: $00
	nop                                              ; $57cd: $00
	nop                                              ; $57ce: $00
	rrca                                             ; $57cf: $0f
	ld   bc, $beb3                                   ; $57d0: $01 $b3 $be
	nop                                              ; $57d3: $00
	ld   a, ($ff00+c)                                ; $57d4: $f2
	ldi  (hl), a                                     ; $57d5: $22
	add  b                                           ; $57d6: $80
	rst  $38                                         ; $57d7: $ff
	inc  b                                           ; $57d8: $04
	or   e                                           ; $57d9: $b3
	cp   (hl)                                        ; $57da: $be
	nop                                              ; $57db: $00
	nop                                              ; $57dc: $00
	nop                                              ; $57dd: $00
	nop                                              ; $57de: $00
	rrca                                             ; $57df: $0f
	ld   bc, $beb3                                   ; $57e0: $01 $b3 $be
	nop                                              ; $57e3: $00
	ld   a, ($ff00+c)                                ; $57e4: $f2
	ldi  (hl), a                                     ; $57e5: $22
	add  b                                           ; $57e6: $80
	rst  $38                                         ; $57e7: $ff
	inc  b                                           ; $57e8: $04
	or   e                                           ; $57e9: $b3
	cp   (hl)                                        ; $57ea: $be
	nop                                              ; $57eb: $00
	nop                                              ; $57ec: $00
	nop                                              ; $57ed: $00
	nop                                              ; $57ee: $00
	rrca                                             ; $57ef: $0f
	ld   bc, $beb3                                   ; $57f0: $01 $b3 $be
	nop                                              ; $57f3: $00
	ld   a, ($ff00+c)                                ; $57f4: $f2
	ldi  (hl), a                                     ; $57f5: $22
	add  b                                           ; $57f6: $80
	rst  $38                                         ; $57f7: $ff
	inc  b                                           ; $57f8: $04
	or   e                                           ; $57f9: $b3
	cp   (hl)                                        ; $57fa: $be
	nop                                              ; $57fb: $00
	nop                                              ; $57fc: $00
	nop                                              ; $57fd: $00
	nop                                              ; $57fe: $00
	rrca                                             ; $57ff: $0f
	ld   bc, $beb3                                   ; $5800: $01 $b3 $be
	nop                                              ; $5803: $00
	ld   a, ($ff00+c)                                ; $5804: $f2
	ldi  (hl), a                                     ; $5805: $22
	add  b                                           ; $5806: $80
	rst  $38                                         ; $5807: $ff
	inc  b                                           ; $5808: $04
	cp   d                                           ; $5809: $ba
	or   b                                           ; $580a: $b0
	cp   (hl)                                        ; $580b: $be
	sub  l                                           ; $580c: $95
	ret  nz                                          ; $580d: $c0

	cp   a                                           ; $580e: $bf
	ld   h, b                                        ; $580f: $60
	adc  (hl)                                        ; $5810: $8e
	inc  c                                           ; $5811: $0c
	cp   d                                           ; $5812: $ba
	or   b                                           ; $5813: $b0
	cp   (hl)                                        ; $5814: $be
	jp   z, $e149                                    ; $5815: $ca $49 $e1

	ldh  a, (<$9d)                                   ; $5818: $f0 $9d
	inc  d                                           ; $581a: $14
	cp   d                                           ; $581b: $ba
	or   b                                           ; $581c: $b0
	cp   (hl)                                        ; $581d: $be
	rla                                              ; $581e: $17
	adc  c                                           ; $581f: $89
	pop  de                                          ; $5820: $d1
	and  b                                           ; $5821: $a0
	cp   $08                                         ; $5822: $fe $08
	cp   d                                           ; $5824: $ba
	or   b                                           ; $5825: $b0
	cp   (hl)                                        ; $5826: $be
	inc  de                                          ; $5827: $13
	adc  c                                           ; $5828: $89
	pop  af                                          ; $5829: $f1
	nop                                              ; $582a: $00
	ld   a, ($ba10)                                  ; $582b: $fa $10 $ba
	or   b                                           ; $582e: $b0
	cp   (hl)                                        ; $582f: $be
	.db  $e4                                         ; $5830: $e4
	xor  a                                           ; $5831: $af
	pop  af                                          ; $5832: $f1
	nop                                              ; $5833: $00
	ld   hl, sp+$08                                  ; $5834: $f8 $08
	cp   d                                           ; $5836: $ba
	or   b                                           ; $5837: $b0
	cp   (hl)                                        ; $5838: $be
	ld   d, $09                                      ; $5839: $16 $09
	rst  $38                                         ; $583b: $ff
	or   b                                           ; $583c: $b0
	cp   $14                                         ; $583d: $fe $14
	cp   d                                           ; $583f: $ba
	or   b                                           ; $5840: $b0
	cp   (hl)                                        ; $5841: $be
	nop                                              ; $5842: $00
	ei                                               ; $5843: $fb
	rst  $38                                         ; $5844: $ff
	nop                                              ; $5845: $00
	rst  $38                                         ; $5846: $ff
	inc  b                                           ; $5847: $04
	or   b                                           ; $5848: $b0
	cp   (hl)                                        ; $5849: $be
	nop                                              ; $584a: $00
	nop                                              ; $584b: $00
	nop                                              ; $584c: $00
	nop                                              ; $584d: $00
	nop                                              ; $584e: $00
	inc  bc                                          ; $584f: $03
	or   b                                           ; $5850: $b0
	cp   (hl)                                        ; $5851: $be
	nop                                              ; $5852: $00
	ei                                               ; $5853: $fb
	rst  $38                                         ; $5854: $ff
	nop                                              ; $5855: $00
	cp   $04                                         ; $5856: $fe $04
	or   b                                           ; $5858: $b0
	cp   (hl)                                        ; $5859: $be
	nop                                              ; $585a: $00
	nop                                              ; $585b: $00
	nop                                              ; $585c: $00
	nop                                              ; $585d: $00
	nop                                              ; $585e: $00
	inc  bc                                          ; $585f: $03
	or   b                                           ; $5860: $b0
	cp   (hl)                                        ; $5861: $be
	nop                                              ; $5862: $00
	ei                                               ; $5863: $fb
	rst  $38                                         ; $5864: $ff
	nop                                              ; $5865: $00
	.db  $fd                                         ; $5866: $fd
	inc  b                                           ; $5867: $04
	or   b                                           ; $5868: $b0
	cp   (hl)                                        ; $5869: $be
	nop                                              ; $586a: $00
	nop                                              ; $586b: $00
	nop                                              ; $586c: $00
	nop                                              ; $586d: $00
	nop                                              ; $586e: $00
	inc  bc                                          ; $586f: $03
	or   b                                           ; $5870: $b0
	cp   (hl)                                        ; $5871: $be
	nop                                              ; $5872: $00
	ei                                               ; $5873: $fb
	rst  $38                                         ; $5874: $ff
	nop                                              ; $5875: $00
	ei                                               ; $5876: $fb
	inc  b                                           ; $5877: $04
	or   b                                           ; $5878: $b0
	cp   (hl)                                        ; $5879: $be
	nop                                              ; $587a: $00
	nop                                              ; $587b: $00
	nop                                              ; $587c: $00
	nop                                              ; $587d: $00
	nop                                              ; $587e: $00
	inc  bc                                          ; $587f: $03
	or   b                                           ; $5880: $b0
	cp   (hl)                                        ; $5881: $be
	nop                                              ; $5882: $00
	ei                                               ; $5883: $fb
	rst  $38                                         ; $5884: $ff
	nop                                              ; $5885: $00
	ld   a, ($b004)                                  ; $5886: $fa $04 $b0
	cp   (hl)                                        ; $5889: $be
	nop                                              ; $588a: $00
	nop                                              ; $588b: $00
	nop                                              ; $588c: $00
	nop                                              ; $588d: $00
	nop                                              ; $588e: $00
	inc  bc                                          ; $588f: $03
	or   b                                           ; $5890: $b0
	cp   (hl)                                        ; $5891: $be
	nop                                              ; $5892: $00
	ei                                               ; $5893: $fb
	rst  $38                                         ; $5894: $ff
	nop                                              ; $5895: $00
	ei                                               ; $5896: $fb
	inc  b                                           ; $5897: $04
	or   b                                           ; $5898: $b0
	cp   (hl)                                        ; $5899: $be
	nop                                              ; $589a: $00
	nop                                              ; $589b: $00
	nop                                              ; $589c: $00
	nop                                              ; $589d: $00
	nop                                              ; $589e: $00
	inc  bc                                          ; $589f: $03
	or   b                                           ; $58a0: $b0
	cp   (hl)                                        ; $58a1: $be
	nop                                              ; $58a2: $00
	ei                                               ; $58a3: $fb
	rst  $38                                         ; $58a4: $ff
	nop                                              ; $58a5: $00
	.db  $fc                                         ; $58a6: $fc
	inc  b                                           ; $58a7: $04
	or   b                                           ; $58a8: $b0
	cp   (hl)                                        ; $58a9: $be
	nop                                              ; $58aa: $00
	nop                                              ; $58ab: $00
	nop                                              ; $58ac: $00
	nop                                              ; $58ad: $00
	nop                                              ; $58ae: $00
	inc  bc                                          ; $58af: $03
	or   b                                           ; $58b0: $b0
	cp   (hl)                                        ; $58b1: $be
	nop                                              ; $58b2: $00
	ei                                               ; $58b3: $fb
	rst  $38                                         ; $58b4: $ff
	nop                                              ; $58b5: $00
	.db  $fd                                         ; $58b6: $fd
	inc  b                                           ; $58b7: $04
	or   b                                           ; $58b8: $b0
	cp   (hl)                                        ; $58b9: $be
	nop                                              ; $58ba: $00
	nop                                              ; $58bb: $00
	nop                                              ; $58bc: $00
	nop                                              ; $58bd: $00
	nop                                              ; $58be: $00
	inc  bc                                          ; $58bf: $03
	or   b                                           ; $58c0: $b0
	cp   (hl)                                        ; $58c1: $be
	nop                                              ; $58c2: $00
	ei                                               ; $58c3: $fb
	rst  $38                                         ; $58c4: $ff
	nop                                              ; $58c5: $00
	cp   $04                                         ; $58c6: $fe $04
	or   b                                           ; $58c8: $b0
	cp   (hl)                                        ; $58c9: $be
	nop                                              ; $58ca: $00
	nop                                              ; $58cb: $00
	nop                                              ; $58cc: $00
	nop                                              ; $58cd: $00
	nop                                              ; $58ce: $00
	inc  bc                                          ; $58cf: $03
	or   b                                           ; $58d0: $b0
	cp   (hl)                                        ; $58d1: $be
	nop                                              ; $58d2: $00
	ei                                               ; $58d3: $fb
	rst  $38                                         ; $58d4: $ff
	nop                                              ; $58d5: $00
	rst  $38                                         ; $58d6: $ff
	inc  b                                           ; $58d7: $04
	cp   d                                           ; $58d8: $ba
	or   b                                           ; $58d9: $b0
	and  c                                           ; $58da: $a1
	cp   e                                           ; $58db: $bb
	ld   ($1f2e), sp                                 ; $58dc: $08 $2e $1f
	ld   c, $53                                      ; $58df: $0e $53
	ccf                                              ; $58e1: $3f
	ld   l, $33                                      ; $58e2: $2e $33
	rra                                              ; $58e4: $1f
	dec  d                                           ; $58e5: $15
	ld   (hl), a                                     ; $58e6: $77
	ldd  a, (hl)                                     ; $58e7: $3a
	rra                                              ; $58e8: $1f
	ld   a, (de)                                     ; $58e9: $1a
	ld   a, d                                        ; $58ea: $7a
	scf                                              ; $58eb: $37
	rra                                              ; $58ec: $1f
	inc  de                                          ; $58ed: $13
	ld   (hl), l                                     ; $58ee: $75
	ld   l, $1f                                      ; $58ef: $2e $1f
	ld   c, $53                                      ; $58f1: $0e $53
	ccf                                              ; $58f3: $3f
	ldd  (hl), a                                     ; $58f4: $32
	inc  sp                                          ; $58f5: $33
	rra                                              ; $58f6: $1f
	dec  d                                           ; $58f7: $15
	ld   (hl), a                                     ; $58f8: $77
	ldd  a, (hl)                                     ; $58f9: $3a
	rra                                              ; $58fa: $1f
	ld   a, (de)                                     ; $58fb: $1a
	ld   a, d                                        ; $58fc: $7a
	dec  (hl)                                        ; $58fd: $35
	rra                                              ; $58fe: $1f
	rla                                              ; $58ff: $17
	ld   (hl), e                                     ; $5900: $73
	inc  sp                                          ; $5901: $33
	rra                                              ; $5902: $1f
	inc  de                                          ; $5903: $13
	ld   e, b                                        ; $5904: $58
	ccf                                              ; $5905: $3f
	jr   c, jr_008_5940                              ; $5906: $38 $38

	rra                                              ; $5908: $1f
	jr   jr_008_5983                                 ; $5909: $18 $78

	inc  sp                                          ; $590b: $33
	rra                                              ; $590c: $1f
	dec  d                                           ; $590d: $15
	ld   d, a                                        ; $590e: $57
	ccf                                              ; $590f: $3f
	scf                                              ; $5910: $37
	ldd  a, (hl)                                     ; $5911: $3a
	rra                                              ; $5912: $1f
	rla                                              ; $5913: $17
	ld   (hl), l                                     ; $5914: $75
	ldd  a, (hl)                                     ; $5915: $3a
	rra                                              ; $5916: $1f
	ld   a, (de)                                     ; $5917: $1a
	ld   e, d                                        ; $5918: $5a
	ccf                                              ; $5919: $3f
	scf                                              ; $591a: $37
	jr   c, jr_008_593c                              ; $591b: $38 $1f

	ld   a, (de)                                     ; $591d: $1a
	ld   a, h                                        ; $591e: $7c
	ldd  a, (hl)                                     ; $591f: $3a
	rra                                              ; $5920: $1f
	ld   a, (de)                                     ; $5921: $1a
	ld   a, d                                        ; $5922: $7a
	dec  (hl)                                        ; $5923: $35
	rra                                              ; $5924: $1f
	rla                                              ; $5925: $17
	ld   (hl), e                                     ; $5926: $73
	ld   l, $1f                                      ; $5927: $2e $1f
	ld   c, $4c                                      ; $5929: $0e $4c
	ld   d, c                                        ; $592b: $51
	ld   d, e                                        ; $592c: $53
	ld   d, l                                        ; $592d: $55
	ld   d, l                                        ; $592e: $55
	ld   d, l                                        ; $592f: $55
	ld   d, (hl)                                     ; $5930: $56
	ld   d, c                                        ; $5931: $51
	ld   d, e                                        ; $5932: $53
	ld   (hl), l                                     ; $5933: $75
	ld   e, a                                        ; $5934: $5f
	ld   d, l                                        ; $5935: $55
	ld   d, e                                        ; $5936: $53
	ld   d, d                                        ; $5937: $52
	ld   d, e                                        ; $5938: $53
	ld   d, l                                        ; $5939: $55
	ld   d, e                                        ; $593a: $53
	ld   d, c                                        ; $593b: $51

jr_008_593c:
	ld   d, b                                        ; $593c: $50
	ccf                                              ; $593d: $3f
	ld   l, $73                                      ; $593e: $2e $73

jr_008_5940:
	ld   e, a                                        ; $5940: $5f
	ld   c, h                                        ; $5941: $4c
	ld   d, c                                        ; $5942: $51
	ld   d, e                                        ; $5943: $53
	ld   d, l                                        ; $5944: $55
	ld   d, l                                        ; $5945: $55
	ld   d, l                                        ; $5946: $55
	ld   d, (hl)                                     ; $5947: $56
	ld   d, (hl)                                     ; $5948: $56
	ld   d, a                                        ; $5949: $57
	ld   a, b                                        ; $594a: $78
	ld   e, a                                        ; $594b: $5f
	ld   e, b                                        ; $594c: $58
	ld   d, (hl)                                     ; $594d: $56
	ld   d, l                                        ; $594e: $55
	ld   c, (hl)                                     ; $594f: $4e
	ld   d, e                                        ; $5950: $53
	ccf                                              ; $5951: $3f
	ld   sp, $5550                                   ; $5952: $31 $50 $55
	ccf                                              ; $5955: $3f
	inc  sp                                          ; $5956: $33
	ld   (hl), c                                     ; $5957: $71
	ld   e, a                                        ; $5958: $5f
	ld   d, l                                        ; $5959: $55
	ld   d, (hl)                                     ; $595a: $56
	ld   e, b                                        ; $595b: $58
	ld   d, l                                        ; $595c: $55
	ld   d, e                                        ; $595d: $53
	ld   d, c                                        ; $595e: $51
	ld   d, b                                        ; $595f: $50
	ccf                                              ; $5960: $3f
	ld   sp, $7553                                   ; $5961: $31 $53 $75
	ld   e, a                                        ; $5964: $5f
	ld   d, l                                        ; $5965: $55
	ld   d, (hl)                                     ; $5966: $56
	ld   e, b                                        ; $5967: $58
	ld   d, l                                        ; $5968: $55
	ld   d, e                                        ; $5969: $53
	ld   d, c                                        ; $596a: $51
	ld   c, (hl)                                     ; $596b: $4e
	ccf                                              ; $596c: $3f
	jr   nc, jr_008_59c0                             ; $596d: $30 $51

	ld   (hl), e                                     ; $596f: $73
	ld   e, a                                        ; $5970: $5f
	ld   c, h                                        ; $5971: $4c
	ld   d, c                                        ; $5972: $51
	ld   d, e                                        ; $5973: $53
	ld   d, l                                        ; $5974: $55
	ld   d, l                                        ; $5975: $55
	ld   d, l                                        ; $5976: $55
	ld   e, d                                        ; $5977: $5a
	ld   e, d                                        ; $5978: $5a
	ccf                                              ; $5979: $3f
	jr   c, jr_008_59f2                              ; $597a: $38 $76

	ld   e, a                                        ; $597c: $5f
	ld   d, (hl)                                     ; $597d: $56
	ld   d, l                                        ; $597e: $55
	ld   d, e                                        ; $597f: $53
	ld   c, (hl)                                     ; $5980: $4e
	ld   d, e                                        ; $5981: $53
	ccf                                              ; $5982: $3f

jr_008_5983:
	ld   sp, $5550                                   ; $5983: $31 $50 $55
	ccf                                              ; $5986: $3f
	inc  sp                                          ; $5987: $33
	ld   (hl), c                                     ; $5988: $71
	ld   c, h                                        ; $5989: $4c
	ld   sp, $5835                                   ; $598a: $31 $35 $58
	ld   d, l                                        ; $598d: $55
	dec  (hl)                                        ; $598e: $35
	inc  sp                                          ; $598f: $33
	ld   d, e                                        ; $5990: $53
	ld   d, l                                        ; $5991: $55
	ld   (hl), $36                                   ; $5992: $36 $36
	ld   d, (hl)                                     ; $5994: $56
	ld   d, e                                        ; $5995: $53
	ld   sp, $5130                                   ; $5996: $31 $30 $51
	ld   c, h                                        ; $5999: $4c
	ld   sp, $5835                                   ; $599a: $31 $35 $58
	ld   d, l                                        ; $599d: $55
	dec  (hl)                                        ; $599e: $35
	inc  sp                                          ; $599f: $33
	ld   d, e                                        ; $59a0: $53
	ld   d, l                                        ; $59a1: $55
	ld   (hl), $36                                   ; $59a2: $36 $36
	ld   d, (hl)                                     ; $59a4: $56
	ld   d, e                                        ; $59a5: $53
	ld   sp, $5130                                   ; $59a6: $31 $30 $51
	ld   e, b                                        ; $59a9: $58
	jr   c, jr_008_59e4                              ; $59aa: $38 $38

	ld   e, b                                        ; $59ac: $58
	ld   e, b                                        ; $59ad: $58
	ldd  a, (hl)                                     ; $59ae: $3a
	ldd  a, (hl)                                     ; $59af: $3a
	ld   e, d                                        ; $59b0: $5a
	ld   e, d                                        ; $59b1: $5a
	jr   c, jr_008_59e9                              ; $59b2: $38 $35

	ld   d, l                                        ; $59b4: $55
	ld   d, c                                        ; $59b5: $51
	dec  (hl)                                        ; $59b6: $35
	dec  (hl)                                        ; $59b7: $35
	ld   d, e                                        ; $59b8: $53
	ld   c, h                                        ; $59b9: $4c
	ld   sp, $5131                                   ; $59ba: $31 $31 $51
	ld   d, l                                        ; $59bd: $55
	inc  sp                                          ; $59be: $33
	inc  sp                                          ; $59bf: $33

jr_008_59c0:
	ld   (hl), c                                     ; $59c0: $71
	cp   c                                           ; $59c1: $b9
	or   c                                           ; $59c2: $b1
	and  b                                           ; $59c3: $a0
	cp   e                                           ; $59c4: $bb
	ld   ($1f27), sp                                 ; $59c5: $08 $27 $1f
	rlca                                             ; $59c8: $07
	ld   b, a                                        ; $59c9: $47
	daa                                              ; $59ca: $27
	daa                                              ; $59cb: $27
	daa                                              ; $59cc: $27
	rra                                              ; $59cd: $1f
	rlca                                             ; $59ce: $07
	ld   b, a                                        ; $59cf: $47
	ld   b, a                                        ; $59d0: $47
	dec  hl                                          ; $59d1: $2b
	rra                                              ; $59d2: $1f
	dec  bc                                          ; $59d3: $0b
	ld   c, e                                        ; $59d4: $4b
	ld   b, a                                        ; $59d5: $47
	daa                                              ; $59d6: $27
	rra                                              ; $59d7: $1f
	dec  bc                                          ; $59d8: $0b
	ld   c, (hl)                                     ; $59d9: $4e
	ld   b, d                                        ; $59da: $42
	ld   h, $1f                                      ; $59db: $26 $1f
	ld   b, $47                                      ; $59dd: $06 $47
	daa                                              ; $59df: $27
	daa                                              ; $59e0: $27
	daa                                              ; $59e1: $27
	rra                                              ; $59e2: $1f
	rlca                                             ; $59e3: $07

jr_008_59e4:
	ld   b, a                                        ; $59e4: $47
	ld   b, a                                        ; $59e5: $47
	dec  hl                                          ; $59e6: $2b
	rra                                              ; $59e7: $1f
	dec  bc                                          ; $59e8: $0b

jr_008_59e9:
	ld   c, c                                        ; $59e9: $49
	ld   b, d                                        ; $59ea: $42
	inc  l                                           ; $59eb: $2c
	rra                                              ; $59ec: $1f
	ld   c, $4b                                      ; $59ed: $0e $4b
	ld   b, a                                        ; $59ef: $47
	daa                                              ; $59f0: $27
	rra                                              ; $59f1: $1f

jr_008_59f2:
	rlca                                             ; $59f2: $07
	ld   b, a                                        ; $59f3: $47
	jr   nz, jr_008_5a1d                             ; $59f4: $20 $27

	daa                                              ; $59f6: $27
	rra                                              ; $59f7: $1f
	rlca                                             ; $59f8: $07
	ld   b, a                                        ; $59f9: $47
	ld   b, b                                        ; $59fa: $40
	daa                                              ; $59fb: $27
	rra                                              ; $59fc: $1f
	ld   b, $47                                      ; $59fd: $06 $47
	daa                                              ; $59ff: $27
	daa                                              ; $5a00: $27
	dec  hl                                          ; $5a01: $2b
	rra                                              ; $5a02: $1f
	ld   c, $4e                                      ; $5a03: $0e $4e
	ld   b, d                                        ; $5a05: $42
	inc  l                                           ; $5a06: $2c
	rra                                              ; $5a07: $1f
	inc  c                                           ; $5a08: $0c
	ld   c, e                                        ; $5a09: $4b
	daa                                              ; $5a0a: $27
	ld   l, $2c                                      ; $5a0b: $2e $2c
	rra                                              ; $5a0d: $1f
	dec  bc                                          ; $5a0e: $0b
	ld   c, h                                        ; $5a0f: $4c
	ld   b, b                                        ; $5a10: $40
	dec  hl                                          ; $5a11: $2b
	rra                                              ; $5a12: $1f
	dec  bc                                          ; $5a13: $0b
	ld   c, c                                        ; $5a14: $49
	ld   b, d                                        ; $5a15: $42
	inc  l                                           ; $5a16: $2c
	rra                                              ; $5a17: $1f
	ld   c, $4b                                      ; $5a18: $0e $4b
	ld   b, a                                        ; $5a1a: $47
	daa                                              ; $5a1b: $27
	rra                                              ; $5a1c: $1f

jr_008_5a1d:
	rlca                                             ; $5a1d: $07
	add  hl, hl                                      ; $5a1e: $29
	dec  h                                           ; $5a1f: $25
	add  hl, hl                                      ; $5a20: $29
	dec  h                                           ; $5a21: $25
	ldi  a, (hl)                                     ; $5a22: $2a
	dec  h                                           ; $5a23: $25
	inc  l                                           ; $5a24: $2c
	dec  h                                           ; $5a25: $25
	inc  l                                           ; $5a26: $2c
	dec  h                                           ; $5a27: $25
	dec  l                                           ; $5a28: $2d
	dec  h                                           ; $5a29: $25
	ld   l, $25                                      ; $5a2a: $2e $25
	ld   l, $25                                      ; $5a2c: $2e $25
	dec  l                                           ; $5a2e: $2d
	dec  h                                           ; $5a2f: $25
	ld   c, h                                        ; $5a30: $4c
	ld   b, l                                        ; $5a31: $45
	ld   c, h                                        ; $5a32: $4c
	inc  l                                           ; $5a33: $2c
	jr   nz, jr_008_5a60                             ; $5a34: $20 $2a

	jr   nz, jr_008_5a61                             ; $5a36: $20 $29

	jr   nz, jr_008_5a64                             ; $5a38: $20 $2a

	jr   nz, jr_008_5a68                             ; $5a3a: $20 $2c

	jr   nz, jr_008_5a68                             ; $5a3c: $20 $2a

	jr   nz, jr_008_5a69                             ; $5a3e: $20 $29

	dec  h                                           ; $5a40: $25
	ld   c, b                                        ; $5a41: $48
	dec  h                                           ; $5a42: $25
	add  hl, hl                                      ; $5a43: $29
	ld   b, a                                        ; $5a44: $47
	ld   b, h                                        ; $5a45: $44
	ld   c, d                                        ; $5a46: $4a
	add  hl, hl                                      ; $5a47: $29
	dec  h                                           ; $5a48: $25
	add  hl, hl                                      ; $5a49: $29
	dec  h                                           ; $5a4a: $25
	ldi  a, (hl)                                     ; $5a4b: $2a
	dec  h                                           ; $5a4c: $25
	inc  l                                           ; $5a4d: $2c
	dec  h                                           ; $5a4e: $25
	inc  l                                           ; $5a4f: $2c
	dec  h                                           ; $5a50: $25
	inc  l                                           ; $5a51: $2c
	inc  hl                                          ; $5a52: $23
	ldi  a, (hl)                                     ; $5a53: $2a
	ldi  (hl), a                                     ; $5a54: $22
	ldi  a, (hl)                                     ; $5a55: $2a
	ldi  (hl), a                                     ; $5a56: $22
	jr   z, jr_008_5a7a                              ; $5a57: $28 $21

	ld   c, c                                        ; $5a59: $49
	ld   b, b                                        ; $5a5a: $40
	ld   c, c                                        ; $5a5b: $49
	add  hl, hl                                      ; $5a5c: $29
	dec  h                                           ; $5a5d: $25
	daa                                              ; $5a5e: $27
	dec  h                                           ; $5a5f: $25

jr_008_5a60:
	dec  h                                           ; $5a60: $25

jr_008_5a61:
	dec  h                                           ; $5a61: $25
	daa                                              ; $5a62: $27
	ldi  a, (hl)                                     ; $5a63: $2a

jr_008_5a64:
	daa                                              ; $5a64: $27
	ldi  a, (hl)                                     ; $5a65: $2a
	ccf                                              ; $5a66: $3f
	daa                                              ; $5a67: $27

jr_008_5a68:
	daa                                              ; $5a68: $27

jr_008_5a69:
	jr   nz, jr_008_5a97                             ; $5a69: $20 $2c

	jr   nz, jr_008_5a8d                             ; $5a6b: $20 $20

	ldi  a, (hl)                                     ; $5a6d: $2a
	ld   c, c                                        ; $5a6e: $49
	ld   b, l                                        ; $5a6f: $45
	ld   b, l                                        ; $5a70: $45
	inc  l                                           ; $5a71: $2c
	dec  h                                           ; $5a72: $25
	inc  l                                           ; $5a73: $2c
	dec  h                                           ; $5a74: $25
	inc  l                                           ; $5a75: $2c
	dec  h                                           ; $5a76: $25
	inc  l                                           ; $5a77: $2c
	dec  h                                           ; $5a78: $25
	ldi  a, (hl)                                     ; $5a79: $2a

jr_008_5a7a:
	dec  h                                           ; $5a7a: $25
	add  hl, hl                                      ; $5a7b: $29
	dec  h                                           ; $5a7c: $25
	ld   b, a                                        ; $5a7d: $47
	jr   nz, jr_008_5aac                             ; $5a7e: $20 $2c

	inc  l                                           ; $5a80: $2c
	jr   nz, jr_008_5acf                             ; $5a81: $20 $4c

	ld   b, l                                        ; $5a83: $45
	ld   c, h                                        ; $5a84: $4c
	inc  l                                           ; $5a85: $2c
	dec  h                                           ; $5a86: $25
	daa                                              ; $5a87: $27
	dec  h                                           ; $5a88: $25
	add  hl, hl                                      ; $5a89: $29
	dec  h                                           ; $5a8a: $25
	inc  l                                           ; $5a8b: $2c
	dec  h                                           ; $5a8c: $25

jr_008_5a8d:
	ldi  a, (hl)                                     ; $5a8d: $2a
	jr   nz, jr_008_5ab9                             ; $5a8e: $20 $29

	ldi  (hl), a                                     ; $5a90: $22
	ld   b, a                                        ; $5a91: $47
	dec  h                                           ; $5a92: $25
	daa                                              ; $5a93: $27
	daa                                              ; $5a94: $27
	dec  h                                           ; $5a95: $25
	ld   b, a                                        ; $5a96: $47

jr_008_5a97:
	ld   b, b                                        ; $5a97: $40
	ld   c, d                                        ; $5a98: $4a
	add  hl, hl                                      ; $5a99: $29
	dec  h                                           ; $5a9a: $25
	add  hl, hl                                      ; $5a9b: $29
	dec  h                                           ; $5a9c: $25
	ldi  a, (hl)                                     ; $5a9d: $2a
	dec  h                                           ; $5a9e: $25
	inc  l                                           ; $5a9f: $2c
	dec  h                                           ; $5aa0: $25
	inc  l                                           ; $5aa1: $2c
	dec  h                                           ; $5aa2: $25
	inc  l                                           ; $5aa3: $2c
	inc  hl                                          ; $5aa4: $23
	add  hl, hl                                      ; $5aa5: $29
	ldi  (hl), a                                     ; $5aa6: $22
	ld   c, c                                        ; $5aa7: $49
	ld   l, $2e                                      ; $5aa8: $2e $2e
	ld   c, (hl)                                     ; $5aaa: $4e
	ld   b, a                                        ; $5aab: $47

jr_008_5aac:
	ld   c, (hl)                                     ; $5aac: $4e
	ld   l, $27                                      ; $5aad: $2e $27
	inc  l                                           ; $5aaf: $2c
	add  hl, hl                                      ; $5ab0: $29
	ldi  a, (hl)                                     ; $5ab1: $2a
	ldi  a, (hl)                                     ; $5ab2: $2a
	daa                                              ; $5ab3: $27
	ldi  a, (hl)                                     ; $5ab4: $2a
	daa                                              ; $5ab5: $27
	ldi  a, (hl)                                     ; $5ab6: $2a
	ccf                                              ; $5ab7: $3f
	daa                                              ; $5ab8: $27

jr_008_5ab9:
	daa                                              ; $5ab9: $27
	jr   nz, jr_008_5b08                             ; $5aba: $20 $4c

	jr   nz, $2a                                     ; $5abc: $20 $2a

	ld   c, c                                        ; $5abe: $49
	ld   b, l                                        ; $5abf: $45
	add  hl, hl                                      ; $5ac0: $29
	dec  h                                           ; $5ac1: $25
	add  hl, hl                                      ; $5ac2: $29
	inc  l                                           ; $5ac3: $2c
	inc  l                                           ; $5ac4: $2c
	add  hl, hl                                      ; $5ac5: $29
	inc  l                                           ; $5ac6: $2c
	dec  h                                           ; $5ac7: $25
	inc  l                                           ; $5ac8: $2c
	inc  l                                           ; $5ac9: $2c
	ld   c, h                                        ; $5aca: $4c
	inc  l                                           ; $5acb: $2c
	dec  h                                           ; $5acc: $25
	ld   l, $2e                                      ; $5acd: $2e $2e

jr_008_5acf:
	ld   l, $2a                                      ; $5acf: $2e $2a
	ldi  a, (hl)                                     ; $5ad1: $2a
	ldi  a, (hl)                                     ; $5ad2: $2a
	add  hl, hl                                      ; $5ad3: $29
	daa                                              ; $5ad4: $27
	add  hl, hl                                      ; $5ad5: $29
	dec  h                                           ; $5ad6: $25
	add  hl, hl                                      ; $5ad7: $29
	dec  h                                           ; $5ad8: $25
	add  hl, hl                                      ; $5ad9: $29
	inc  l                                           ; $5ada: $2c
	inc  l                                           ; $5adb: $2c
	add  hl, hl                                      ; $5adc: $29
	inc  l                                           ; $5add: $2c
	add  hl, hl                                      ; $5ade: $29
	inc  l                                           ; $5adf: $2c
	inc  l                                           ; $5ae0: $2c
	inc  l                                           ; $5ae1: $2c
	jr   nz, jr_008_5b10                             ; $5ae2: $20 $2c

	dec  h                                           ; $5ae4: $25
	ld   l, $2e                                      ; $5ae5: $2e $2e
	ld   l, $2a                                      ; $5ae7: $2e $2a
	ldi  a, (hl)                                     ; $5ae9: $2a
	ldi  a, (hl)                                     ; $5aea: $2a
	add  hl, hl                                      ; $5aeb: $29
	add  hl, hl                                      ; $5aec: $29
	add  hl, hl                                      ; $5aed: $29
	dec  h                                           ; $5aee: $25
	add  hl, hl                                      ; $5aef: $29
	dec  h                                           ; $5af0: $25
	add  hl, hl                                      ; $5af1: $29
	ldi  a, (hl)                                     ; $5af2: $2a
	inc  l                                           ; $5af3: $2c
	add  hl, hl                                      ; $5af4: $29
	add  hl, hl                                      ; $5af5: $29
	dec  h                                           ; $5af6: $25
	ldi  a, (hl)                                     ; $5af7: $2a
	ldi  a, (hl)                                     ; $5af8: $2a
	ldi  a, (hl)                                     ; $5af9: $2a
	ldi  a, (hl)                                     ; $5afa: $2a
	ld   c, d                                        ; $5afb: $4a
	inc  l                                           ; $5afc: $2c
	inc  l                                           ; $5afd: $2c
	inc  l                                           ; $5afe: $2c
	dec  h                                           ; $5aff: $25
	add  hl, hl                                      ; $5b00: $29
	dec  h                                           ; $5b01: $25
	inc  l                                           ; $5b02: $2c
	inc  l                                           ; $5b03: $2c
	inc  l                                           ; $5b04: $2c
	jr   nz, jr_008_5b2e                             ; $5b05: $20 $27

	ldi  a, (hl)                                     ; $5b07: $2a

jr_008_5b08:
	dec  h                                           ; $5b08: $25
	add  hl, hl                                      ; $5b09: $29
	ldi  a, (hl)                                     ; $5b0a: $2a
	ldi  a, (hl)                                     ; $5b0b: $2a
	inc  l                                           ; $5b0c: $2c
	add  hl, hl                                      ; $5b0d: $29
	inc  l                                           ; $5b0e: $2c
	ldi  a, (hl)                                     ; $5b0f: $2a

jr_008_5b10:
	ld   c, c                                        ; $5b10: $49
	ld   b, l                                        ; $5b11: $45
	cp   c                                           ; $5b12: $b9
	or   b                                           ; $5b13: $b0
	and  c                                           ; $5b14: $a1
	ld   c, h                                        ; $5b15: $4c
	ld   d, c                                        ; $5b16: $51
	ld   d, c                                        ; $5b17: $51
	ld   d, l                                        ; $5b18: $55
	inc  sp                                          ; $5b19: $33
	ld   sp, $5f73                                   ; $5b1a: $31 $73 $5f
	dec  (hl)                                        ; $5b1d: $35
	ld   (hl), $58                                   ; $5b1e: $36 $58
	ld   (hl), $35                                   ; $5b20: $36 $35
	ld   (hl), $30                                   ; $5b22: $36 $30
	ld   d, l                                        ; $5b24: $55
	ld   (hl), e                                     ; $5b25: $73
	ld   e, a                                        ; $5b26: $5f
	ld   e, b                                        ; $5b27: $58
	ld   d, l                                        ; $5b28: $55
	ld   d, c                                        ; $5b29: $51
	ld   d, e                                        ; $5b2a: $53
	ld   c, h                                        ; $5b2b: $4c
	ld   d, c                                        ; $5b2c: $51
	dec  (hl)                                        ; $5b2d: $35

jr_008_5b2e:
	ld   sp, $5858                                   ; $5b2e: $31 $58 $58
	ld   e, d                                        ; $5b31: $5a
	jr   c, jr_008_5b6a                              ; $5b32: $38 $36

	ld   d, l                                        ; $5b34: $55
	ld   d, e                                        ; $5b35: $53
	ld   (hl), c                                     ; $5b36: $71
	ld   e, a                                        ; $5b37: $5f
	ld   c, (hl)                                     ; $5b38: $4e
	ld   d, e                                        ; $5b39: $53
	ld   d, e                                        ; $5b3a: $53
	ld   d, a                                        ; $5b3b: $57
	dec  (hl)                                        ; $5b3c: $35
	inc  sp                                          ; $5b3d: $33
	ld   (hl), l                                     ; $5b3e: $75
	ld   e, a                                        ; $5b3f: $5f
	scf                                              ; $5b40: $37
	jr   c, jr_008_5b9d                              ; $5b41: $38 $5a

	jr   c, jr_008_5b78                              ; $5b43: $38 $33

	jr   nc, jr_008_5b79                             ; $5b45: $30 $32

	ld   d, e                                        ; $5b47: $53
	ld   (hl), l                                     ; $5b48: $75
	ld   e, a                                        ; $5b49: $5f
	ld   e, d                                        ; $5b4a: $5a
	ld   d, a                                        ; $5b4b: $57
	ld   d, e                                        ; $5b4c: $53
	ld   d, l                                        ; $5b4d: $55
	ld   c, (hl)                                     ; $5b4e: $4e
	ld   d, e                                        ; $5b4f: $53
	scf                                              ; $5b50: $37
	inc  sp                                          ; $5b51: $33
	ld   e, d                                        ; $5b52: $5a
	ld   e, d                                        ; $5b53: $5a
	ld   e, h                                        ; $5b54: $5c
	ldd  a, (hl)                                     ; $5b55: $3a
	jr   c, jr_008_5baf                              ; $5b56: $38 $57

	ld   d, l                                        ; $5b58: $55
	ld   (hl), e                                     ; $5b59: $73
	ld   e, a                                        ; $5b5a: $5f
	cp   c                                           ; $5b5b: $b9
	or   c                                           ; $5b5c: $b1
	and  b                                           ; $5b5d: $a0
	ld   b, b                                        ; $5b5e: $40
	ld   b, l                                        ; $5b5f: $45
	ld   b, l                                        ; $5b60: $45
	ld   b, l                                        ; $5b61: $45
	inc  h                                           ; $5b62: $24
	ldi  (hl), a                                     ; $5b63: $22
	ld   b, b                                        ; $5b64: $40
	ld   b, h                                        ; $5b65: $44
	ld   b, l                                        ; $5b66: $45
	dec  h                                           ; $5b67: $25
	daa                                              ; $5b68: $27
	ld   c, c                                        ; $5b69: $49

jr_008_5b6a:
	daa                                              ; $5b6a: $27
	dec  h                                           ; $5b6b: $25
	daa                                              ; $5b6c: $27
	inc  l                                           ; $5b6d: $2c
	ld   b, l                                        ; $5b6e: $45
	ld   b, b                                        ; $5b6f: $40

jr_008_5b70:
	ld   b, b                                        ; $5b70: $40
	ld   b, d                                        ; $5b71: $42
	ld   b, h                                        ; $5b72: $44

jr_008_5b73:
	ld   b, l                                        ; $5b73: $45
	ld   c, c                                        ; $5b74: $49
	ld   b, b                                        ; $5b75: $40
	ld   b, h                                        ; $5b76: $44
	ld   b, l                                        ; $5b77: $45

jr_008_5b78:
	ld   b, d                                        ; $5b78: $42

jr_008_5b79:
	ld   b, b                                        ; $5b79: $40

jr_008_5b7a:
	ld   b, b                                        ; $5b7a: $40
	ld   c, d                                        ; $5b7b: $4a
	jr   nz, jr_008_5ba8                             ; $5b7c: $20 $2a

	ld   b, b                                        ; $5b7e: $40
	ld   b, b                                        ; $5b7f: $40
	ld   b, l                                        ; $5b80: $45
	ld   c, c                                        ; $5b81: $49
	ld   b, l                                        ; $5b82: $45
	ld   b, d                                        ; $5b83: $42
	ld   c, e                                        ; $5b84: $4b
	ld   c, e                                        ; $5b85: $4b
	ld   b, a                                        ; $5b86: $47
	add  hl, hl                                      ; $5b87: $29
	inc  h                                           ; $5b88: $24
	ld   b, (hl)                                     ; $5b89: $46
	ld   b, d                                        ; $5b8a: $42
	ld   b, h                                        ; $5b8b: $44
	ld   l, $29                                      ; $5b8c: $2e $29

jr_008_5b8e:
	ld   c, (hl)                                     ; $5b8e: $4e
	ld   l, $27                                      ; $5b8f: $2e $27

jr_008_5b91:
	ld   c, h                                        ; $5b91: $4c
	ld   c, (hl)                                     ; $5b92: $4e
	ld   c, (hl)                                     ; $5b93: $4e
	ld   b, d                                        ; $5b94: $42
	ld   b, h                                        ; $5b95: $44
	ld   c, c                                        ; $5b96: $49

jr_008_5b97:
	ld   b, a                                        ; $5b97: $47
	ld   b, a                                        ; $5b98: $47
	ld   b, (hl)                                     ; $5b99: $46

jr_008_5b9a:
	ld   c, c                                        ; $5b9a: $49
	ld   c, e                                        ; $5b9b: $4b
	ld   b, a                                        ; $5b9c: $47

jr_008_5b9d:
	ld   c, c                                        ; $5b9d: $49
	ld   c, (hl)                                     ; $5b9e: $4e
	ld   c, h                                        ; $5b9f: $4c

jr_008_5ba0:
	ld   l, $30                                      ; $5ba0: $2e $30
	ld   c, (hl)                                     ; $5ba2: $4e

jr_008_5ba3:
	ld   c, h                                        ; $5ba3: $4c
	ld   c, e                                        ; $5ba4: $4b
	ld   b, a                                        ; $5ba5: $47
	ld   b, h                                        ; $5ba6: $44
	cp   c                                           ; $5ba7: $b9

jr_008_5ba8:
	or   e                                           ; $5ba8: $b3

jr_008_5ba9:
	cp   l                                           ; $5ba9: $bd
	jr   nz, jr_008_5b6a                             ; $5baa: $20 $be

jr_008_5bac:
	nop                                              ; $5bac: $00
	pop  af                                          ; $5bad: $f1
	ld   b, b                                        ; $5bae: $40

jr_008_5baf:
	rst  $38                                         ; $5baf: $ff
	rst  $38                                         ; $5bb0: $ff
	jr   nz, jr_008_5b70                             ; $5bb1: $20 $bd

	jr   nz, jr_008_5b73                             ; $5bb3: $20 $be

	nop                                              ; $5bb5: $00
	pop  af                                          ; $5bb6: $f1
	ld   b, b                                        ; $5bb7: $40
	rst  $38                                         ; $5bb8: $ff
	rst  $38                                         ; $5bb9: $ff
	jr   nz, jr_008_5b7a                             ; $5bba: $20 $be

jr_008_5bbc:
	nop                                              ; $5bbc: $00
	pop  af                                          ; $5bbd: $f1
	ld   b, b                                        ; $5bbe: $40
	rst  $38                                         ; $5bbf: $ff
	rst  $38                                         ; $5bc0: $ff
	.db  $10                                         ; $5bc1: $10
	cp   (hl)                                        ; $5bc2: $be
	nop                                              ; $5bc3: $00
	pop  af                                          ; $5bc4: $f1
	ld   b, b                                        ; $5bc5: $40
	rst  $38                                         ; $5bc6: $ff
	rst  $38                                         ; $5bc7: $ff
	.db  $10                                         ; $5bc8: $10
	cp   (hl)                                        ; $5bc9: $be
	nop                                              ; $5bca: $00
	pop  af                                          ; $5bcb: $f1

jr_008_5bcc:
	ld   b, b                                        ; $5bcc: $40
	rst  $38                                         ; $5bcd: $ff
	rst  $38                                         ; $5bce: $ff
	jr   nz, jr_008_5b8e                             ; $5bcf: $20 $bd

	jr   nz, jr_008_5b91                             ; $5bd1: $20 $be

	nop                                              ; $5bd3: $00
	pop  af                                          ; $5bd4: $f1

jr_008_5bd5:
	ld   b, b                                        ; $5bd5: $40
	rst  $38                                         ; $5bd6: $ff
	rst  $38                                         ; $5bd7: $ff
	jr   nz, jr_008_5b97                             ; $5bd8: $20 $bd

	jr   nz, jr_008_5b9a                             ; $5bda: $20 $be

	nop                                              ; $5bdc: $00
	pop  af                                          ; $5bdd: $f1

jr_008_5bde:
	ld   b, b                                        ; $5bde: $40
	rst  $38                                         ; $5bdf: $ff
	rst  $38                                         ; $5be0: $ff
	jr   nz, jr_008_5ba0                             ; $5be1: $20 $bd

	jr   nz, jr_008_5ba3                             ; $5be3: $20 $be

	nop                                              ; $5be5: $00
	pop  af                                          ; $5be6: $f1
	ld   b, b                                        ; $5be7: $40
	rst  $38                                         ; $5be8: $ff
	rst  $38                                         ; $5be9: $ff
	jr   nz, jr_008_5ba9                             ; $5bea: $20 $bd

	jr   nz, jr_008_5bac                             ; $5bec: $20 $be

jr_008_5bee:
	nop                                              ; $5bee: $00
	pop  af                                          ; $5bef: $f1
	ld   b, b                                        ; $5bf0: $40
	rst  $38                                         ; $5bf1: $ff
	rst  $38                                         ; $5bf2: $ff
	.db  $10                                         ; $5bf3: $10

jr_008_5bf4:
	cp   (hl)                                        ; $5bf4: $be
	nop                                              ; $5bf5: $00
	pop  af                                          ; $5bf6: $f1

jr_008_5bf7:
	ld   b, b                                        ; $5bf7: $40
	rst  $38                                         ; $5bf8: $ff
	rst  $38                                         ; $5bf9: $ff
	.db  $10                                         ; $5bfa: $10
	cp   l                                           ; $5bfb: $bd
	jr   nz, jr_008_5bbc                             ; $5bfc: $20 $be

	nop                                              ; $5bfe: $00
	pop  af                                          ; $5bff: $f1

jr_008_5c00:
	ld   b, b                                        ; $5c00: $40
	rst  $38                                         ; $5c01: $ff
	rst  $38                                         ; $5c02: $ff
	.db  $10                                         ; $5c03: $10
	cp   (hl)                                        ; $5c04: $be
	nop                                              ; $5c05: $00

jr_008_5c06:
	pop  af                                          ; $5c06: $f1
	ld   b, b                                        ; $5c07: $40
	rst  $38                                         ; $5c08: $ff

jr_008_5c09:
	rst  $38                                         ; $5c09: $ff
	.db  $10                                         ; $5c0a: $10
	cp   l                                           ; $5c0b: $bd
	jr   nz, jr_008_5bcc                             ; $5c0c: $20 $be

	nop                                              ; $5c0e: $00
	pop  af                                          ; $5c0f: $f1
	ld   b, b                                        ; $5c10: $40
	rst  $38                                         ; $5c11: $ff
	rst  $38                                         ; $5c12: $ff
	jr   nz, -$43                                    ; $5c13: $20 $bd

	jr   nz, jr_008_5bd5                             ; $5c15: $20 $be

	nop                                              ; $5c17: $00
	pop  af                                          ; $5c18: $f1
	ld   b, b                                        ; $5c19: $40
	rst  $38                                         ; $5c1a: $ff
	rst  $38                                         ; $5c1b: $ff
	jr   nz, -$43                                    ; $5c1c: $20 $bd

	jr   nz, jr_008_5bde                             ; $5c1e: $20 $be

	nop                                              ; $5c20: $00
	pop  af                                          ; $5c21: $f1
	ld   b, b                                        ; $5c22: $40
	rst  $38                                         ; $5c23: $ff
	rst  $38                                         ; $5c24: $ff
	.db  $10                                         ; $5c25: $10
	cp   (hl)                                        ; $5c26: $be
	nop                                              ; $5c27: $00
	pop  af                                          ; $5c28: $f1
	ld   b, b                                        ; $5c29: $40
	rst  $38                                         ; $5c2a: $ff
	rst  $38                                         ; $5c2b: $ff
	.db  $10                                         ; $5c2c: $10
	cp   l                                           ; $5c2d: $bd
	jr   nz, jr_008_5bee                             ; $5c2e: $20 $be

	nop                                              ; $5c30: $00
	pop  af                                          ; $5c31: $f1

jr_008_5c32:
	ld   b, b                                        ; $5c32: $40
	rst  $38                                         ; $5c33: $ff
	rst  $38                                         ; $5c34: $ff
	jr   nz, jr_008_5bf4                             ; $5c35: $20 $bd

	jr   nz, jr_008_5bf7                             ; $5c37: $20 $be

	nop                                              ; $5c39: $00
	pop  af                                          ; $5c3a: $f1

jr_008_5c3b:
	ld   b, b                                        ; $5c3b: $40
	rst  $38                                         ; $5c3c: $ff
	rst  $38                                         ; $5c3d: $ff
	jr   nz, -$43                                    ; $5c3e: $20 $bd

	jr   nz, jr_008_5c00                             ; $5c40: $20 $be

jr_008_5c42:
	nop                                              ; $5c42: $00
	pop  af                                          ; $5c43: $f1
	ld   b, b                                        ; $5c44: $40
	rst  $38                                         ; $5c45: $ff
	rst  $38                                         ; $5c46: $ff
	jr   nz, jr_008_5c06                             ; $5c47: $20 $bd

	jr   nz, jr_008_5c09                             ; $5c49: $20 $be

	nop                                              ; $5c4b: $00
	pop  af                                          ; $5c4c: $f1
	ld   b, b                                        ; $5c4d: $40
	rst  $38                                         ; $5c4e: $ff
	rst  $38                                         ; $5c4f: $ff
	.db  $10                                         ; $5c50: $10
	cp   (hl)                                        ; $5c51: $be
	nop                                              ; $5c52: $00
	pop  af                                          ; $5c53: $f1
	ld   b, b                                        ; $5c54: $40
	rst  $38                                         ; $5c55: $ff

jr_008_5c56:
	rst  $38                                         ; $5c56: $ff
	.db  $10                                         ; $5c57: $10
	cp   l                                           ; $5c58: $bd

jr_008_5c59:
	.db  $10                                         ; $5c59: $10
	cp   (hl)                                        ; $5c5a: $be
	nop                                              ; $5c5b: $00
	pop  af                                          ; $5c5c: $f1
	ld   b, b                                        ; $5c5d: $40
	rst  $38                                         ; $5c5e: $ff

jr_008_5c5f:
	rst  $38                                         ; $5c5f: $ff
	ld   ($00be), sp                                 ; $5c60: $08 $be $00
	pop  af                                          ; $5c63: $f1
	ld   b, b                                        ; $5c64: $40
	rst  $38                                         ; $5c65: $ff
	rst  $38                                         ; $5c66: $ff
	ld   ($00be), sp                                 ; $5c67: $08 $be $00
	pop  af                                          ; $5c6a: $f1

jr_008_5c6b:
	ld   b, b                                        ; $5c6b: $40
	rst  $38                                         ; $5c6c: $ff
	rst  $38                                         ; $5c6d: $ff
	.db  $10                                         ; $5c6e: $10
	cp   l                                           ; $5c6f: $bd
	.db  $10                                         ; $5c70: $10

jr_008_5c71:
	cp   l                                           ; $5c71: $bd
	jr   nz, jr_008_5c32                             ; $5c72: $20 $be

jr_008_5c74:
	nop                                              ; $5c74: $00
	pop  af                                          ; $5c75: $f1
	ld   b, b                                        ; $5c76: $40
	rst  $38                                         ; $5c77: $ff
	rst  $38                                         ; $5c78: $ff
	jr   nz, -$43                                    ; $5c79: $20 $bd

	jr   nz, jr_008_5c3b                             ; $5c7b: $20 $be

	nop                                              ; $5c7d: $00
	pop  af                                          ; $5c7e: $f1
	ld   b, b                                        ; $5c7f: $40
	rst  $38                                         ; $5c80: $ff
	rst  $38                                         ; $5c81: $ff
	jr   nz, jr_008_5c42                             ; $5c82: $20 $be

jr_008_5c84:
	nop                                              ; $5c84: $00
	pop  af                                          ; $5c85: $f1
	ld   b, b                                        ; $5c86: $40
	rst  $38                                         ; $5c87: $ff
	rst  $38                                         ; $5c88: $ff
	.db  $10                                         ; $5c89: $10
	cp   (hl)                                        ; $5c8a: $be
	nop                                              ; $5c8b: $00
	pop  af                                          ; $5c8c: $f1
	ld   b, b                                        ; $5c8d: $40
	rst  $38                                         ; $5c8e: $ff
	rst  $38                                         ; $5c8f: $ff
	.db  $10                                         ; $5c90: $10
	cp   (hl)                                        ; $5c91: $be
	nop                                              ; $5c92: $00
	pop  af                                          ; $5c93: $f1

jr_008_5c94:
	ld   b, b                                        ; $5c94: $40
	rst  $38                                         ; $5c95: $ff
	rst  $38                                         ; $5c96: $ff
	jr   nz, jr_008_5c56                             ; $5c97: $20 $bd

	jr   nz, jr_008_5c59                             ; $5c99: $20 $be

	nop                                              ; $5c9b: $00
	pop  af                                          ; $5c9c: $f1

jr_008_5c9d:
	ld   b, b                                        ; $5c9d: $40
	rst  $38                                         ; $5c9e: $ff
	rst  $38                                         ; $5c9f: $ff
	jr   nz, jr_008_5c5f                             ; $5ca0: $20 $bd

	jr   nz, -$42                                    ; $5ca2: $20 $be

	nop                                              ; $5ca4: $00
	pop  af                                          ; $5ca5: $f1

jr_008_5ca6:
	ld   b, b                                        ; $5ca6: $40
	rst  $38                                         ; $5ca7: $ff
	rst  $38                                         ; $5ca8: $ff
	jr   nz, -$43                                    ; $5ca9: $20 $bd

	jr   nz, jr_008_5c6b                             ; $5cab: $20 $be

	nop                                              ; $5cad: $00
	pop  af                                          ; $5cae: $f1
	ld   b, b                                        ; $5caf: $40
	rst  $38                                         ; $5cb0: $ff
	rst  $38                                         ; $5cb1: $ff
	jr   nz, jr_008_5c71                             ; $5cb2: $20 $bd

	jr   nz, jr_008_5c74                             ; $5cb4: $20 $be

jr_008_5cb6:
	nop                                              ; $5cb6: $00
	pop  af                                          ; $5cb7: $f1
	ld   b, b                                        ; $5cb8: $40
	rst  $38                                         ; $5cb9: $ff
	rst  $38                                         ; $5cba: $ff
	.db  $10                                         ; $5cbb: $10

jr_008_5cbc:
	cp   (hl)                                        ; $5cbc: $be
	nop                                              ; $5cbd: $00
	pop  af                                          ; $5cbe: $f1

jr_008_5cbf:
	ld   b, b                                        ; $5cbf: $40
	rst  $38                                         ; $5cc0: $ff
	rst  $38                                         ; $5cc1: $ff
	.db  $10                                         ; $5cc2: $10
	cp   l                                           ; $5cc3: $bd
	jr   nz, jr_008_5c84                             ; $5cc4: $20 $be

	nop                                              ; $5cc6: $00
	pop  af                                          ; $5cc7: $f1

jr_008_5cc8:
	ld   b, b                                        ; $5cc8: $40
	rst  $38                                         ; $5cc9: $ff
	rst  $38                                         ; $5cca: $ff
	.db  $10                                         ; $5ccb: $10
	cp   (hl)                                        ; $5ccc: $be
	nop                                              ; $5ccd: $00

jr_008_5cce:
	pop  af                                          ; $5cce: $f1
	ld   b, b                                        ; $5ccf: $40
	rst  $38                                         ; $5cd0: $ff

jr_008_5cd1:
	rst  $38                                         ; $5cd1: $ff
	.db  $10                                         ; $5cd2: $10
	cp   l                                           ; $5cd3: $bd
	jr   nz, jr_008_5c94                             ; $5cd4: $20 $be

	nop                                              ; $5cd6: $00
	pop  af                                          ; $5cd7: $f1
	ld   b, b                                        ; $5cd8: $40
	rst  $38                                         ; $5cd9: $ff
	rst  $38                                         ; $5cda: $ff
	jr   nz, -$43                                    ; $5cdb: $20 $bd

	jr   nz, jr_008_5c9d                             ; $5cdd: $20 $be

	nop                                              ; $5cdf: $00
	pop  af                                          ; $5ce0: $f1
	ld   b, b                                        ; $5ce1: $40
	rst  $38                                         ; $5ce2: $ff
	rst  $38                                         ; $5ce3: $ff
	jr   nz, -$43                                    ; $5ce4: $20 $bd

	jr   nz, jr_008_5ca6                             ; $5ce6: $20 $be

	nop                                              ; $5ce8: $00
	pop  af                                          ; $5ce9: $f1
	ld   b, b                                        ; $5cea: $40
	rst  $38                                         ; $5ceb: $ff
	rst  $38                                         ; $5cec: $ff
	.db  $10                                         ; $5ced: $10
	cp   (hl)                                        ; $5cee: $be
	nop                                              ; $5cef: $00
	pop  af                                          ; $5cf0: $f1
	ld   b, b                                        ; $5cf1: $40
	rst  $38                                         ; $5cf2: $ff
	rst  $38                                         ; $5cf3: $ff
	.db  $10                                         ; $5cf4: $10
	cp   l                                           ; $5cf5: $bd
	jr   nz, jr_008_5cb6                             ; $5cf6: $20 $be

	nop                                              ; $5cf8: $00
	pop  af                                          ; $5cf9: $f1
	ld   b, b                                        ; $5cfa: $40
	rst  $38                                         ; $5cfb: $ff
	rst  $38                                         ; $5cfc: $ff
	jr   nz, jr_008_5cbc                             ; $5cfd: $20 $bd

	jr   nz, jr_008_5cbf                             ; $5cff: $20 $be

	nop                                              ; $5d01: $00
	pop  af                                          ; $5d02: $f1
	ld   b, b                                        ; $5d03: $40
	rst  $38                                         ; $5d04: $ff
	rst  $38                                         ; $5d05: $ff
	jr   nz, -$43                                    ; $5d06: $20 $bd

	jr   nz, jr_008_5cc8                             ; $5d08: $20 $be

	nop                                              ; $5d0a: $00
	pop  af                                          ; $5d0b: $f1
	ld   b, b                                        ; $5d0c: $40
	rst  $38                                         ; $5d0d: $ff
	rst  $38                                         ; $5d0e: $ff
	jr   nz, jr_008_5cce                             ; $5d0f: $20 $bd

	jr   nz, jr_008_5cd1                             ; $5d11: $20 $be

	nop                                              ; $5d13: $00
	pop  af                                          ; $5d14: $f1
	ld   b, b                                        ; $5d15: $40
	rst  $38                                         ; $5d16: $ff
	rst  $38                                         ; $5d17: $ff
	.db  $10                                         ; $5d18: $10
	cp   (hl)                                        ; $5d19: $be
	nop                                              ; $5d1a: $00
	pop  af                                          ; $5d1b: $f1
	ld   b, b                                        ; $5d1c: $40
	rst  $38                                         ; $5d1d: $ff
	rst  $38                                         ; $5d1e: $ff
	.db  $10                                         ; $5d1f: $10
	cp   l                                           ; $5d20: $bd
	.db  $10                                         ; $5d21: $10
	cp   (hl)                                        ; $5d22: $be
	nop                                              ; $5d23: $00
	pop  af                                          ; $5d24: $f1
	ld   b, b                                        ; $5d25: $40
	rst  $38                                         ; $5d26: $ff
	rst  $38                                         ; $5d27: $ff
	ld   ($00be), sp                                 ; $5d28: $08 $be $00
	pop  af                                          ; $5d2b: $f1
	ld   b, b                                        ; $5d2c: $40
	rst  $38                                         ; $5d2d: $ff
	rst  $38                                         ; $5d2e: $ff
	ld   ($00be), sp                                 ; $5d2f: $08 $be $00
	pop  af                                          ; $5d32: $f1
	ld   b, b                                        ; $5d33: $40
	rst  $38                                         ; $5d34: $ff
	rst  $38                                         ; $5d35: $ff
	.db  $10                                         ; $5d36: $10
	cp   l                                           ; $5d37: $bd
	.db  $10                                         ; $5d38: $10
	cp   c                                           ; $5d39: $b9
	or   b                                           ; $5d3a: $b0
	and  c                                           ; $5d3b: $a1
	cp   e                                           ; $5d3c: $bb
	ld   ($3f58), sp                                 ; $5d3d: $08 $58 $3f
	jr   c, jr_008_5d7c                              ; $5d40: $38 $3a

	jr   c, jr_008_5d79                              ; $5d42: $38 $35

	ld   sp, $2e71                                   ; $5d44: $31 $71 $2e
	ld   sp, $4c5f                                   ; $5d47: $31 $5f $4c
	ccf                                              ; $5d4a: $3f
	ld   sp, $3135                                   ; $5d4b: $31 $35 $31
	jr   c, jr_008_5d85                              ; $5d4e: $38 $35

	ld   (hl), e                                     ; $5d50: $73
	ld   a, a                                        ; $5d51: $7f
	ld   e, b                                        ; $5d52: $58
	ccf                                              ; $5d53: $3f
	jr   c, jr_008_5d90                              ; $5d54: $38 $3a

	jr   c, jr_008_5d8d                              ; $5d56: $38 $35

	ld   sp, $2e71                                   ; $5d58: $31 $71 $2e
	ld   sp, $4c5f                                   ; $5d5b: $31 $5f $4c
	ccf                                              ; $5d5e: $3f
	ld   sp, $3335                                   ; $5d5f: $31 $35 $33
	ld   sp, $7130                                   ; $5d62: $31 $30 $71
	ld   a, a                                        ; $5d65: $7f
	ld   d, e                                        ; $5d66: $53
	ccf                                              ; $5d67: $3f
	ldd  (hl), a                                     ; $5d68: $32
	inc  sp                                          ; $5d69: $33
	dec  (hl)                                        ; $5d6a: $35
	ld   (hl), $33                                   ; $5d6b: $36 $33
	ld   (hl), l                                     ; $5d6d: $75
	ld   a, b                                        ; $5d6e: $78
	ld   e, d                                        ; $5d6f: $5a
	ccf                                              ; $5d70: $3f
	ldd  a, (hl)                                     ; $5d71: $3a
	jr   c, jr_008_5da9                              ; $5d72: $38 $35

	ld   (hl), $35                                   ; $5d74: $36 $35
	ld   (hl), e                                     ; $5d76: $73
	ld   a, a                                        ; $5d77: $7f
	ld   e, b                                        ; $5d78: $58

jr_008_5d79:
	ccf                                              ; $5d79: $3f
	jr   c, jr_008_5db6                              ; $5d7a: $38 $3a

jr_008_5d7c:
	jr   c, jr_008_5db3                              ; $5d7c: $38 $35

	ld   sp, $2e71                                   ; $5d7e: $31 $71 $2e
	ld   sp, $4c5f                                   ; $5d81: $31 $5f $4c
	ccf                                              ; $5d84: $3f

jr_008_5d85:
	ld   sp, $3335                                   ; $5d85: $31 $35 $33
	ld   sp, $7130                                   ; $5d88: $31 $30 $71
	ld   a, a                                        ; $5d8b: $7f
	cp   c                                           ; $5d8c: $b9

jr_008_5d8d:
	or   c                                           ; $5d8d: $b1
	and  b                                           ; $5d8e: $a0
	cp   e                                           ; $5d8f: $bb

jr_008_5d90:
	ld   ($2549), sp                                 ; $5d90: $08 $49 $25
	add  hl, hl                                      ; $5d93: $29
	ldi  a, (hl)                                     ; $5d94: $2a
	add  hl, hl                                      ; $5d95: $29
	inc  l                                           ; $5d96: $2c
	add  hl, hl                                      ; $5d97: $29
	ld   c, d                                        ; $5d98: $4a
	ld   c, d                                        ; $5d99: $4a
	ld   b, l                                        ; $5d9a: $45
	ld   c, d                                        ; $5d9b: $4a
	ld   c, c                                        ; $5d9c: $49
	dec  h                                           ; $5d9d: $25
	add  hl, hl                                      ; $5d9e: $29
	dec  h                                           ; $5d9f: $25
	add  hl, hl                                      ; $5da0: $29
	dec  h                                           ; $5da1: $25
	inc  l                                           ; $5da2: $2c
	ld   c, h                                        ; $5da3: $4c
	ld   b, b                                        ; $5da4: $40
	ld   b, d                                        ; $5da5: $42
	ld   b, h                                        ; $5da6: $44
	ld   c, c                                        ; $5da7: $49
	dec  h                                           ; $5da8: $25

jr_008_5da9:
	add  hl, hl                                      ; $5da9: $29
	ldi  a, (hl)                                     ; $5daa: $2a
	add  hl, hl                                      ; $5dab: $29

jr_008_5dac:
	inc  l                                           ; $5dac: $2c
	add  hl, hl                                      ; $5dad: $29
	ld   c, d                                        ; $5dae: $4a
	ld   c, d                                        ; $5daf: $4a
	ld   b, l                                        ; $5db0: $45
	ld   c, d                                        ; $5db1: $4a

jr_008_5db2:
	ld   b, l                                        ; $5db2: $45

jr_008_5db3:
	jr   nz, jr_008_5dde                             ; $5db3: $20 $29

jr_008_5db5:
	inc  l                                           ; $5db5: $2c

jr_008_5db6:
	ldi  a, (hl)                                     ; $5db6: $2a
	add  hl, hl                                      ; $5db7: $29
	daa                                              ; $5db8: $27
	ld   c, c                                        ; $5db9: $49
	ld   b, l                                        ; $5dba: $45

jr_008_5dbb:
	ld   b, a                                        ; $5dbb: $47
	ld   c, c                                        ; $5dbc: $49
	ld   c, h                                        ; $5dbd: $4c

jr_008_5dbe:
	jr   nz, jr_008_5dec                             ; $5dbe: $20 $2c

	jr   nz, jr_008_5dee                             ; $5dc0: $20 $2c

	jr   nz, jr_008_5df0                             ; $5dc2: $20 $2c

	ld   c, h                                        ; $5dc4: $4c
	ld   b, l                                        ; $5dc5: $45
	ld   c, c                                        ; $5dc6: $49
	ld   b, l                                        ; $5dc7: $45
	ld   c, d                                        ; $5dc8: $4a
	ldi  a, (hl)                                     ; $5dc9: $2a
	ldi  a, (hl)                                     ; $5dca: $2a
	add  hl, hl                                      ; $5dcb: $29
	dec  h                                           ; $5dcc: $25
	inc  h                                           ; $5dcd: $24

jr_008_5dce:
	dec  h                                           ; $5dce: $25
	ld   c, h                                        ; $5dcf: $4c
	ld   b, b                                        ; $5dd0: $40
	ld   b, d                                        ; $5dd1: $42
	ld   b, h                                        ; $5dd2: $44
	ld   c, c                                        ; $5dd3: $49

jr_008_5dd4:
	dec  h                                           ; $5dd4: $25
	add  hl, hl                                      ; $5dd5: $29
	ldi  a, (hl)                                     ; $5dd6: $2a

jr_008_5dd7:
	add  hl, hl                                      ; $5dd7: $29
	inc  l                                           ; $5dd8: $2c
	add  hl, hl                                      ; $5dd9: $29
	ld   c, d                                        ; $5dda: $4a
	ld   c, d                                        ; $5ddb: $4a
	ld   b, l                                        ; $5ddc: $45

jr_008_5ddd:
	ld   c, d                                        ; $5ddd: $4a

jr_008_5dde:
	ld   b, l                                        ; $5dde: $45
	jr   nz, jr_008_5e0a                             ; $5ddf: $20 $29

	inc  l                                           ; $5de1: $2c
	ldi  a, (hl)                                     ; $5de2: $2a
	add  hl, hl                                      ; $5de3: $29
	daa                                              ; $5de4: $27
	ld   c, c                                        ; $5de5: $49

jr_008_5de6:
	ld   b, l                                        ; $5de6: $45
	ld   b, a                                        ; $5de7: $47
	ld   b, l                                        ; $5de8: $45

jr_008_5de9:
	cp   c                                           ; $5de9: $b9
	or   e                                           ; $5dea: $b3
	cp   l                                           ; $5deb: $bd

jr_008_5dec:
	jr   nz, jr_008_5dac                             ; $5dec: $20 $be

jr_008_5dee:
	nop                                              ; $5dee: $00
	pop  af                                          ; $5def: $f1

jr_008_5df0:
	ld   b, b                                        ; $5df0: $40
	rst  $38                                         ; $5df1: $ff
	rst  $38                                         ; $5df2: $ff
	jr   nz, jr_008_5db2                             ; $5df3: $20 $bd

	jr   nz, jr_008_5db5                             ; $5df5: $20 $be

	nop                                              ; $5df7: $00
	pop  af                                          ; $5df8: $f1
	ld   b, b                                        ; $5df9: $40
	rst  $38                                         ; $5dfa: $ff
	rst  $38                                         ; $5dfb: $ff
	jr   nz, jr_008_5dbb                             ; $5dfc: $20 $bd

	jr   nz, jr_008_5dbe                             ; $5dfe: $20 $be

	nop                                              ; $5e00: $00
	pop  af                                          ; $5e01: $f1
	ld   b, b                                        ; $5e02: $40
	rst  $38                                         ; $5e03: $ff
	rst  $38                                         ; $5e04: $ff
	.db  $10                                         ; $5e05: $10
	cp   (hl)                                        ; $5e06: $be
	nop                                              ; $5e07: $00
	pop  af                                          ; $5e08: $f1
	ld   b, b                                        ; $5e09: $40

jr_008_5e0a:
	rst  $38                                         ; $5e0a: $ff
	rst  $38                                         ; $5e0b: $ff
	.db  $10                                         ; $5e0c: $10
	cp   l                                           ; $5e0d: $bd
	jr   nz, jr_008_5dce                             ; $5e0e: $20 $be

jr_008_5e10:
	nop                                              ; $5e10: $00
	pop  af                                          ; $5e11: $f1
	ld   b, b                                        ; $5e12: $40
	rst  $38                                         ; $5e13: $ff
	rst  $38                                         ; $5e14: $ff
	jr   nz, jr_008_5dd4                             ; $5e15: $20 $bd

	jr   nz, jr_008_5dd7                             ; $5e17: $20 $be

jr_008_5e19:
	nop                                              ; $5e19: $00
	pop  af                                          ; $5e1a: $f1
	ld   b, b                                        ; $5e1b: $40
	rst  $38                                         ; $5e1c: $ff
	rst  $38                                         ; $5e1d: $ff
	jr   nz, jr_008_5ddd                             ; $5e1e: $20 $bd

	jr   nz, -$42                                    ; $5e20: $20 $be

jr_008_5e22:
	nop                                              ; $5e22: $00
	pop  af                                          ; $5e23: $f1
	ld   b, b                                        ; $5e24: $40
	rst  $38                                         ; $5e25: $ff
	rst  $38                                         ; $5e26: $ff
	jr   nz, jr_008_5de6                             ; $5e27: $20 $bd

	jr   nz, jr_008_5de9                             ; $5e29: $20 $be

	nop                                              ; $5e2b: $00
	pop  af                                          ; $5e2c: $f1
	ld   b, b                                        ; $5e2d: $40
	rst  $38                                         ; $5e2e: $ff
	rst  $38                                         ; $5e2f: $ff
	jr   nz, jr_008_5df0                             ; $5e30: $20 $be

jr_008_5e32:
	nop                                              ; $5e32: $00
	pop  af                                          ; $5e33: $f1
	ld   b, b                                        ; $5e34: $40
	rst  $38                                         ; $5e35: $ff
	rst  $38                                         ; $5e36: $ff
	.db  $10                                         ; $5e37: $10

jr_008_5e38:
	cp   l                                           ; $5e38: $bd
	.db  $10                                         ; $5e39: $10
	cp   (hl)                                        ; $5e3a: $be

jr_008_5e3b:
	nop                                              ; $5e3b: $00
	pop  af                                          ; $5e3c: $f1
	ld   b, b                                        ; $5e3d: $40
	rst  $38                                         ; $5e3e: $ff
	rst  $38                                         ; $5e3f: $ff
	ld   ($00be), sp                                 ; $5e40: $08 $be $00
	pop  af                                          ; $5e43: $f1

jr_008_5e44:
	ld   b, b                                        ; $5e44: $40
	rst  $38                                         ; $5e45: $ff
	rst  $38                                         ; $5e46: $ff
	ld   ($00be), sp                                 ; $5e47: $08 $be $00

jr_008_5e4a:
	pop  af                                          ; $5e4a: $f1
	ld   b, b                                        ; $5e4b: $40
	rst  $38                                         ; $5e4c: $ff

jr_008_5e4d:
	rst  $38                                         ; $5e4d: $ff
	.db  $10                                         ; $5e4e: $10
	cp   l                                           ; $5e4f: $bd
	jr   nz, jr_008_5e10                             ; $5e50: $20 $be

	nop                                              ; $5e52: $00
	pop  af                                          ; $5e53: $f1

jr_008_5e54:
	ld   b, b                                        ; $5e54: $40
	rst  $38                                         ; $5e55: $ff
	rst  $38                                         ; $5e56: $ff
	jr   nz, -$43                                    ; $5e57: $20 $bd

	jr   nz, jr_008_5e19                             ; $5e59: $20 $be

	nop                                              ; $5e5b: $00
	pop  af                                          ; $5e5c: $f1
	ld   b, b                                        ; $5e5d: $40
	rst  $38                                         ; $5e5e: $ff
	rst  $38                                         ; $5e5f: $ff
	jr   nz, -$43                                    ; $5e60: $20 $bd

	jr   nz, jr_008_5e22                             ; $5e62: $20 $be

	nop                                              ; $5e64: $00
	pop  af                                          ; $5e65: $f1
	ld   b, b                                        ; $5e66: $40
	rst  $38                                         ; $5e67: $ff
	rst  $38                                         ; $5e68: $ff
	.db  $10                                         ; $5e69: $10
	cp   (hl)                                        ; $5e6a: $be
	nop                                              ; $5e6b: $00
	pop  af                                          ; $5e6c: $f1
	ld   b, b                                        ; $5e6d: $40
	rst  $38                                         ; $5e6e: $ff
	rst  $38                                         ; $5e6f: $ff
	.db  $10                                         ; $5e70: $10
	cp   l                                           ; $5e71: $bd
	jr   nz, jr_008_5e32                             ; $5e72: $20 $be

jr_008_5e74:
	nop                                              ; $5e74: $00
	pop  af                                          ; $5e75: $f1
	ld   b, b                                        ; $5e76: $40
	rst  $38                                         ; $5e77: $ff
	rst  $38                                         ; $5e78: $ff
	jr   nz, jr_008_5e38                             ; $5e79: $20 $bd

	jr   nz, jr_008_5e3b                             ; $5e7b: $20 $be

jr_008_5e7d:
	nop                                              ; $5e7d: $00
	pop  af                                          ; $5e7e: $f1
	ld   b, b                                        ; $5e7f: $40
	rst  $38                                         ; $5e80: $ff
	rst  $38                                         ; $5e81: $ff
	jr   nz, -$43                                    ; $5e82: $20 $bd

	jr   nz, jr_008_5e44                             ; $5e84: $20 $be

jr_008_5e86:
	nop                                              ; $5e86: $00
	pop  af                                          ; $5e87: $f1
	ld   b, b                                        ; $5e88: $40
	rst  $38                                         ; $5e89: $ff
	rst  $38                                         ; $5e8a: $ff
	jr   nz, jr_008_5e4a                             ; $5e8b: $20 $bd

	jr   nz, jr_008_5e4d                             ; $5e8d: $20 $be

	nop                                              ; $5e8f: $00
	pop  af                                          ; $5e90: $f1
	ld   b, b                                        ; $5e91: $40
	rst  $38                                         ; $5e92: $ff
	rst  $38                                         ; $5e93: $ff
	jr   nz, jr_008_5e54                             ; $5e94: $20 $be

jr_008_5e96:
	nop                                              ; $5e96: $00
	pop  af                                          ; $5e97: $f1
	ld   b, b                                        ; $5e98: $40
	rst  $38                                         ; $5e99: $ff
	rst  $38                                         ; $5e9a: $ff
	.db  $10                                         ; $5e9b: $10

jr_008_5e9c:
	cp   l                                           ; $5e9c: $bd
	.db  $10                                         ; $5e9d: $10
	cp   (hl)                                        ; $5e9e: $be

jr_008_5e9f:
	nop                                              ; $5e9f: $00
	pop  af                                          ; $5ea0: $f1
	ld   b, b                                        ; $5ea1: $40
	rst  $38                                         ; $5ea2: $ff
	rst  $38                                         ; $5ea3: $ff
	ld   ($00be), sp                                 ; $5ea4: $08 $be $00
	pop  af                                          ; $5ea7: $f1

jr_008_5ea8:
	ld   b, b                                        ; $5ea8: $40
	rst  $38                                         ; $5ea9: $ff
	rst  $38                                         ; $5eaa: $ff
	ld   ($00be), sp                                 ; $5eab: $08 $be $00

jr_008_5eae:
	pop  af                                          ; $5eae: $f1
	ld   b, b                                        ; $5eaf: $40
	rst  $38                                         ; $5eb0: $ff

jr_008_5eb1:
	rst  $38                                         ; $5eb1: $ff
	.db  $10                                         ; $5eb2: $10
	cp   l                                           ; $5eb3: $bd
	jr   nz, jr_008_5e74                             ; $5eb4: $20 $be

	nop                                              ; $5eb6: $00
	pop  af                                          ; $5eb7: $f1

jr_008_5eb8:
	ld   b, b                                        ; $5eb8: $40
	rst  $38                                         ; $5eb9: $ff
	rst  $38                                         ; $5eba: $ff
	jr   nz, -$43                                    ; $5ebb: $20 $bd

	jr   nz, jr_008_5e7d                             ; $5ebd: $20 $be

	nop                                              ; $5ebf: $00
	pop  af                                          ; $5ec0: $f1
	ld   b, b                                        ; $5ec1: $40
	rst  $38                                         ; $5ec2: $ff
	rst  $38                                         ; $5ec3: $ff
	jr   nz, -$43                                    ; $5ec4: $20 $bd

	jr   nz, jr_008_5e86                             ; $5ec6: $20 $be

	nop                                              ; $5ec8: $00
	pop  af                                          ; $5ec9: $f1
	ld   b, b                                        ; $5eca: $40
	rst  $38                                         ; $5ecb: $ff
	rst  $38                                         ; $5ecc: $ff
	.db  $10                                         ; $5ecd: $10
	cp   (hl)                                        ; $5ece: $be
	nop                                              ; $5ecf: $00
	pop  af                                          ; $5ed0: $f1
	ld   b, b                                        ; $5ed1: $40
	rst  $38                                         ; $5ed2: $ff
	rst  $38                                         ; $5ed3: $ff
	.db  $10                                         ; $5ed4: $10
	cp   l                                           ; $5ed5: $bd
	jr   nz, jr_008_5e96                             ; $5ed6: $20 $be

jr_008_5ed8:
	nop                                              ; $5ed8: $00
	pop  af                                          ; $5ed9: $f1
	ld   b, b                                        ; $5eda: $40
	rst  $38                                         ; $5edb: $ff
	rst  $38                                         ; $5edc: $ff
	jr   nz, jr_008_5e9c                             ; $5edd: $20 $bd

	jr   nz, jr_008_5e9f                             ; $5edf: $20 $be

jr_008_5ee1:
	nop                                              ; $5ee1: $00
	pop  af                                          ; $5ee2: $f1
	ld   b, b                                        ; $5ee3: $40
	rst  $38                                         ; $5ee4: $ff
	rst  $38                                         ; $5ee5: $ff
	jr   nz, -$43                                    ; $5ee6: $20 $bd

	jr   nz, jr_008_5ea8                             ; $5ee8: $20 $be

jr_008_5eea:
	nop                                              ; $5eea: $00
	pop  af                                          ; $5eeb: $f1
	ld   b, b                                        ; $5eec: $40
	rst  $38                                         ; $5eed: $ff
	rst  $38                                         ; $5eee: $ff
	jr   nz, jr_008_5eae                             ; $5eef: $20 $bd

	jr   nz, jr_008_5eb1                             ; $5ef1: $20 $be

jr_008_5ef3:
	nop                                              ; $5ef3: $00
	pop  af                                          ; $5ef4: $f1
	ld   b, b                                        ; $5ef5: $40
	rst  $38                                         ; $5ef6: $ff
	rst  $38                                         ; $5ef7: $ff
	jr   nz, jr_008_5eb8                             ; $5ef8: $20 $be

	nop                                              ; $5efa: $00
	pop  af                                          ; $5efb: $f1

jr_008_5efc:
	ld   b, b                                        ; $5efc: $40
	rst  $38                                         ; $5efd: $ff
	rst  $38                                         ; $5efe: $ff
	.db  $10                                         ; $5eff: $10
	cp   l                                           ; $5f00: $bd
	.db  $10                                         ; $5f01: $10

jr_008_5f02:
	cp   (hl)                                        ; $5f02: $be
	nop                                              ; $5f03: $00
	pop  af                                          ; $5f04: $f1

jr_008_5f05:
	ld   b, b                                        ; $5f05: $40
	rst  $38                                         ; $5f06: $ff
	rst  $38                                         ; $5f07: $ff
	ld   ($00be), sp                                 ; $5f08: $08 $be $00

jr_008_5f0b:
	pop  af                                          ; $5f0b: $f1
	ld   b, b                                        ; $5f0c: $40
	rst  $38                                         ; $5f0d: $ff

jr_008_5f0e:
	rst  $38                                         ; $5f0e: $ff
	ld   ($00be), sp                                 ; $5f0f: $08 $be $00
	pop  af                                          ; $5f12: $f1
	ld   b, b                                        ; $5f13: $40
	rst  $38                                         ; $5f14: $ff

jr_008_5f15:
	rst  $38                                         ; $5f15: $ff
	.db  $10                                         ; $5f16: $10
	cp   l                                           ; $5f17: $bd
	jr   nz, jr_008_5ed8                             ; $5f18: $20 $be

	nop                                              ; $5f1a: $00
	pop  af                                          ; $5f1b: $f1
	ld   b, b                                        ; $5f1c: $40
	rst  $38                                         ; $5f1d: $ff
	rst  $38                                         ; $5f1e: $ff
	jr   nz, -$43                                    ; $5f1f: $20 $bd

	jr   nz, jr_008_5ee1                             ; $5f21: $20 $be

	nop                                              ; $5f23: $00
	pop  af                                          ; $5f24: $f1
	ld   b, b                                        ; $5f25: $40
	rst  $38                                         ; $5f26: $ff
	rst  $38                                         ; $5f27: $ff
	jr   nz, -$43                                    ; $5f28: $20 $bd

	jr   nz, jr_008_5eea                             ; $5f2a: $20 $be

	nop                                              ; $5f2c: $00
	pop  af                                          ; $5f2d: $f1
	ld   b, b                                        ; $5f2e: $40
	rst  $38                                         ; $5f2f: $ff
	rst  $38                                         ; $5f30: $ff
	jr   nz, -$43                                    ; $5f31: $20 $bd

	jr   nz, jr_008_5ef3                             ; $5f33: $20 $be

	nop                                              ; $5f35: $00
	pop  af                                          ; $5f36: $f1
	ld   b, b                                        ; $5f37: $40
	rst  $38                                         ; $5f38: $ff
	rst  $38                                         ; $5f39: $ff
	jr   nz, -$43                                    ; $5f3a: $20 $bd

	jr   nz, jr_008_5efc                             ; $5f3c: $20 $be

	nop                                              ; $5f3e: $00
	pop  af                                          ; $5f3f: $f1
	ld   b, b                                        ; $5f40: $40
	rst  $38                                         ; $5f41: $ff
	rst  $38                                         ; $5f42: $ff
	jr   nz, jr_008_5f02                             ; $5f43: $20 $bd

	jr   nz, jr_008_5f05                             ; $5f45: $20 $be

	nop                                              ; $5f47: $00
	pop  af                                          ; $5f48: $f1
	ld   b, b                                        ; $5f49: $40
	rst  $38                                         ; $5f4a: $ff
	rst  $38                                         ; $5f4b: $ff
	jr   nz, jr_008_5f0b                             ; $5f4c: $20 $bd

	jr   nz, jr_008_5f0e                             ; $5f4e: $20 $be

	nop                                              ; $5f50: $00
	pop  af                                          ; $5f51: $f1
	ld   b, b                                        ; $5f52: $40
	rst  $38                                         ; $5f53: $ff
	rst  $38                                         ; $5f54: $ff
	jr   nz, jr_008_5f15                             ; $5f55: $20 $be

	nop                                              ; $5f57: $00
	pop  af                                          ; $5f58: $f1
	ld   b, b                                        ; $5f59: $40
	rst  $38                                         ; $5f5a: $ff
	rst  $38                                         ; $5f5b: $ff
	.db  $10                                         ; $5f5c: $10
	cp   l                                           ; $5f5d: $bd
	.db  $10                                         ; $5f5e: $10
	cp   (hl)                                        ; $5f5f: $be
	nop                                              ; $5f60: $00
	pop  af                                          ; $5f61: $f1
	ld   b, b                                        ; $5f62: $40
	rst  $38                                         ; $5f63: $ff
	rst  $38                                         ; $5f64: $ff
	ld   ($00be), sp                                 ; $5f65: $08 $be $00
	pop  af                                          ; $5f68: $f1
	ld   b, b                                        ; $5f69: $40
	rst  $38                                         ; $5f6a: $ff
	rst  $38                                         ; $5f6b: $ff
	ld   ($00be), sp                                 ; $5f6c: $08 $be $00
	pop  af                                          ; $5f6f: $f1
	ld   b, b                                        ; $5f70: $40
	rst  $38                                         ; $5f71: $ff
	rst  $38                                         ; $5f72: $ff
	.db  $10                                         ; $5f73: $10
	cp   c                                           ; $5f74: $b9
	or   b                                           ; $5f75: $b0
	and  c                                           ; $5f76: $a1
	ld   d, c                                        ; $5f77: $51
	ld   c, h                                        ; $5f78: $4c
	inc  sp                                          ; $5f79: $33
	jr   nc, jr_008_5fb1                             ; $5f7a: $30 $35

	ld   sp, $5156                                   ; $5f7c: $31 $56 $51
	ld   (hl), l                                     ; $5f7f: $75
	cp   d                                           ; $5f80: $ba
	or   c                                           ; $5f81: $b1
	and  b                                           ; $5f82: $a0
	ld   c, c                                        ; $5f83: $49
	ld   b, l                                        ; $5f84: $45
	inc  l                                           ; $5f85: $2c
	.db $20 $45

	ld   c, (hl)                                     ; $5f88: $4e
	ld   c, d                                        ; $5f89: $4a
	ld   l, h                                        ; $5f8a: $6c
	cp   d                                           ; $5f8b: $ba
	or   b                                           ; $5f8c: $b0
	and  c                                           ; $5f8d: $a1
	ld   e, d                                        ; $5f8e: $5a
	ccf                                              ; $5f8f: $3f
	dec  (hl)                                        ; $5f90: $35
	scf                                              ; $5f91: $37
	dec  (hl)                                        ; $5f92: $35
	ld   e, a                                        ; $5f93: $5f
	ld   e, d                                        ; $5f94: $5a
	ccf                                              ; $5f95: $3f
	dec  (hl)                                        ; $5f96: $35
	scf                                              ; $5f97: $37
	dec  (hl)                                        ; $5f98: $35
	ccf                                              ; $5f99: $3f
	cp   d                                           ; $5f9a: $ba
	or   c                                           ; $5f9b: $b1
	and  b                                           ; $5f9c: $a0
	ld   c, c                                        ; $5f9d: $49
	ccf                                              ; $5f9e: $3f
	add  hl, hl                                      ; $5f9f: $29
	daa                                              ; $5fa0: $27
	ld   h, $5f                                      ; $5fa1: $26 $5f
	ld   c, c                                        ; $5fa3: $49
	ccf                                              ; $5fa4: $3f
	add  hl, hl                                      ; $5fa5: $29
	daa                                              ; $5fa6: $27
	ld   h, $3f                                      ; $5fa7: $26 $3f
	cp   d                                           ; $5fa9: $ba
	or   b                                           ; $5faa: $b0
	and  c                                           ; $5fab: $a1
	ld   sp, $131f                                   ; $5fac: $31 $1f $13
	ld   d, c                                        ; $5faf: $51
	ccf                                              ; $5fb0: $3f

jr_008_5fb1:
	cpl                                              ; $5fb1: $2f
	ld   l, $2c                                      ; $5fb2: $2e $2c
	ld   l, (hl)                                     ; $5fb4: $6e
	cp   d                                           ; $5fb5: $ba
	or   c                                           ; $5fb6: $b1
	and  b                                           ; $5fb7: $a0
	ldi  (hl), a                                     ; $5fb8: $22
	rra                                              ; $5fb9: $1f
	inc  bc                                          ; $5fba: $03
	ld   c, d                                        ; $5fbb: $4a
	dec  h                                           ; $5fbc: $25
	inc  hl                                          ; $5fbd: $23
	ldi  (hl), a                                     ; $5fbe: $22
	jr   nz, $65                                     ; $5fbf: $20 $65

	cp   d                                           ; $5fc1: $ba


func_04_1fc2:
	call retZandTimes13ifAlt5                                       ; $5fc2: $cd $bb $23
	jp   z, +                                    ; $5fc5: $ca $c9 $1f

	ret                                              ; $5fc8: $c9

+
	ld   hl, $c800                                   ; $5fc9: $21 $00 $c8
	add  hl, bc                                      ; $5fcc: $09
	ld   a, (hl)                                     ; $5fcd: $7e
	bit  7, a                                        ; $5fce: $cb $7f
	jp   z, +                                    ; $5fd0: $ca $d7 $1f

	ld   a, $01                                      ; $5fd3: $3e $01
	or   a                                           ; $5fd5: $b7
	ret                                              ; $5fd6: $c9

+
	ld   a, $01                                      ; $5fd7: $3e $01
	ld   hl, $c801                                   ; $5fd9: $21 $01 $c8
	add  hl, bc                                      ; $5fdc: $09
	ld   (hl), a                                     ; $5fdd: $77
	ld   a, $00                                      ; $5fde: $3e $00
	ld   hl, $c806                                   ; $5fe0: $21 $06 $c8
	add  hl, bc                                      ; $5fe3: $09
	ld   (hl), a                                     ; $5fe4: $77
	ld   hl, $c802                                   ; $5fe5: $21 $02 $c8
	add  hl, bc                                      ; $5fe8: $09
	ld   (hl), e                                     ; $5fe9: $73
	ld   hl, $c804                                   ; $5fea: $21 $04 $c8
	add  hl, bc                                      ; $5fed: $09
	ld   (hl), e                                     ; $5fee: $73
	ld   hl, $c803                                   ; $5fef: $21 $03 $c8
	add  hl, bc                                      ; $5ff2: $09
	ld   (hl), d                                     ; $5ff3: $72
	ld   hl, $c805                                   ; $5ff4: $21 $05 $c8
	add  hl, bc                                      ; $5ff7: $09
	ld   (hl), d                                     ; $5ff8: $72
	ld   a, $c0                                      ; $5ff9: $3e $c0
	ld   hl, $c800                                   ; $5ffb: $21 $00 $c8
	add  hl, bc                                      ; $5ffe: $09
	ld   (hl), a                                     ; $5fff: $77
	ld   hl, $c72a                                   ; $6000: $21 $2a $c7
	ld   a, (hl)                                     ; $6003: $7e
	ld   hl, $c80c                                   ; $6004: $21 $0c $c8
	add  hl, bc                                      ; $6007: $09
	ld   (hl), a                                     ; $6008: $77
	ret                                              ; $6009: $c9


func_04_200a:
// if $ff, for values 0 to 4, times 13 into bc
// then go to below at $c800
	cp   $ff                                         ; $600a: $fe $ff
	jp   nz, ++                                   ; $600c: $c2 $21 $20

	ld   a, $00                                      ; $600f: $3e $00
-
	push af                                          ; $6011: $f5
	call func_04_200a                                       ; $6012: $cd $0a $20
	jp   nz, +                                   ; $6015: $c2 $1e $20

	pop  af                                          ; $6018: $f1
	add  $01                                         ; $6019: $c6 $01
	jp   -                                       ; $601b: $c3 $11 $20

+
	pop  af                                          ; $601e: $f1
	xor  a                                           ; $601f: $af
	ret                                              ; $6020: $c9

++
	call retZandTimes13ifAlt5                                       ; $6021: $cd $bb $23
	jp   z, +                                    ; $6024: $ca $28 $20

	ret                                              ; $6027: $c9

+
	ld   hl, $c800                                   ; $6028: $21 $00 $c8
	add  hl, bc                                      ; $602b: $09
	ld   a, (hl)                                     ; $602c: $7e
	bit  7, a                                        ; $602d: $cb $7f
	jr   z, @done                              ; $602f: $28 $5f

	and  $60                                         ; $6031: $e6 $60
	jp   z, +                                    ; $6033: $ca $40 $20

	ld   a, $00                                      ; $6036: $3e $00
	ld   hl, $c800                                   ; $6038: $21 $00 $c8
	add  hl, bc                                      ; $603b: $09
	ld   (hl), a                                     ; $603c: $77
	jp   @done                                       ; $603d: $c3 $90 $20

+
	ld   hl, $c800                                   ; $6040: $21 $00 $c8
	add  hl, bc                                      ; $6043: $09
	ld   a, (hl)                                     ; $6044: $7e
	push af                                          ; $6045: $f5
	ld   a, $00                                      ; $6046: $3e $00
	ld   hl, $c800                                   ; $6048: $21 $00 $c8
	add  hl, bc                                      ; $604b: $09
	ld   (hl), a                                     ; $604c: $77
	pop  af                                          ; $604d: $f1
	and  $1f                                         ; $604e: $e6 $1f
	ld   hl, $c09a                                   ; $6050: $21 $9a $c0
	ld   (hl), a                                     ; $6053: $77
	ld   bc, $0000                                   ; $6054: $01 $00 $00

@loop:
	push bc                                          ; $6057: $c5
	ld   hl, $c800                                   ; $6058: $21 $00 $c8
	add  hl, bc                                      ; $605b: $09
	ld   a, (hl)                                     ; $605c: $7e
	bit  7, a                                        ; $605d: $cb $7f
	jr   z, @func_2084                              ; $605f: $28 $23

	and  $20                                         ; $6061: $e6 $20
	jp   z, @func_2084                                    ; $6063: $ca $84 $20

	ld   hl, $c800                                   ; $6066: $21 $00 $c8
	add  hl, bc                                      ; $6069: $09
	ld   a, (hl)                                     ; $606a: $7e
	and  $1f                                         ; $606b: $e6 $1f
	ld   hl, $c09a                                   ; $606d: $21 $9a $c0
	xor  (hl)                                        ; $6070: $ae
	jp   nz, @func_2084                                   ; $6071: $c2 $84 $20

	pop  bc                                          ; $6074: $c1
	ld   hl, $c800                                   ; $6075: $21 $00 $c8
	add  hl, bc                                      ; $6078: $09
	ld   a, (hl)                                     ; $6079: $7e
	and  $df                                         ; $607a: $e6 $df
	ld   hl, $c800                                   ; $607c: $21 $00 $c8
	add  hl, bc                                      ; $607f: $09
	ld   (hl), a                                     ; $6080: $77
	jp   @done                                       ; $6081: $c3 $90 $20

@func_2084:
	pop  bc                                          ; $6084: $c1
	ld   a, $0d                                      ; $6085: $3e $0d
	call b4_addAtoBC                                       ; $6087: $cd $dc $23
	ld   a, c                                        ; $608a: $79
	cp   $41                                         ; $608b: $fe $41
	jp   c, @loop                                    ; $608d: $da $57 $20

@done:
	xor  a                                           ; $6090: $af
	ret                                              ; $6091: $c9


func_04_2092:
	ld   bc, $0000                                   ; $6092: $01 $00 $00
-
	ld   hl, $c800                                   ; $6095: $21 $00 $c8
	add  hl, bc                                      ; $6098: $09
	ld   a, (hl)                                     ; $6099: $7e
	bit  7, a                                        ; $609a: $cb $7f
	jr   z, +                              ; $609c: $28 $08

	ld   hl, $c801                                   ; $609e: $21 $01 $c8
	add  hl, bc                                      ; $60a1: $09
	dec  (hl)                                        ; $60a2: $35
	jp   z, ++                                    ; $60a3: $ca $b2 $20

+
	ld   a, $0d                                      ; $60a6: $3e $0d
	call b4_addAtoBC                                       ; $60a8: $cd $dc $23
	ld   a, c                                        ; $60ab: $79
	cp   $41                                         ; $60ac: $fe $41
	jp   c, -                                    ; $60ae: $da $95 $20

	ret                                              ; $60b1: $c9

++
	ld   hl, $c804                                   ; $60b2: $21 $04 $c8
	add  hl, bc                                      ; $60b5: $09
	ld   e, (hl)                                     ; $60b6: $5e
	ld   hl, $c805                                   ; $60b7: $21 $05 $c8
	add  hl, bc                                      ; $60ba: $09
	ld   d, (hl)                                     ; $60bb: $56
	ld   a, (de)                                     ; $60bc: $1a
	cp   $a0                                         ; $60bd: $fe $a0
	jp   nc, $20fe                                   ; $60bf: $d2 $fe $20

	call $2284                                       ; $60c2: $cd $84 $22
	ld   hl, $c806                                   ; $60c5: $21 $06 $c8
	add  hl, bc                                      ; $60c8: $09
	ld   a, (hl)                                     ; $60c9: $7e
	sla  a                                           ; $60ca: $cb $27
	ld   hl, $22b7                                   ; $60cc: $21 $b7 $22
	call b4_addAtoHL                                       ; $60cf: $cd $ea $23
	push de                                          ; $60d2: $d5
	call $23d3                                       ; $60d3: $cd $d3 $23
	ld   l, e                                        ; $60d6: $6b
	ld   h, d                                        ; $60d7: $62
	pop  de                                          ; $60d8: $d1
	ld   a, (de)                                     ; $60d9: $1a
	and  $1f                                         ; $60da: $e6 $1f
	cp   $1f                                         ; $60dc: $fe $1f
	jr   z, jr_008_60f8                              ; $60de: $28 $18

	sla  a                                           ; $60e0: $cb $27
	call b4_addAtoHL                                       ; $60e2: $cd $ea $23
	ld   a, (hl)                                     ; $60e5: $7e
	push hl                                          ; $60e6: $e5
	ld   hl, $c09c                                   ; $60e7: $21 $9c $c0
	ld   (hl), a                                     ; $60ea: $77
	pop  hl                                          ; $60eb: $e1
	inc  hl                                          ; $60ec: $23
	ld   a, (hl)                                     ; $60ed: $7e
	ld   hl, $c09d                                   ; $60ee: $21 $9d $c0
	ld   (hl), a                                     ; $60f1: $77
	call $234f                                       ; $60f2: $cd $4f $23
	call $2363                                       ; $60f5: $cd $63 $23

jr_008_60f8:
	call $238a                                       ; $60f8: $cd $8a $23
	jp   $20a6                                       ; $60fb: $c3 $a6 $20


	cp   $b0                                         ; $60fe: $fe $b0
	jp   nc, $211e                                   ; $6100: $d2 $1e $21

	cp   $a4                                         ; $6103: $fe $a4
	jp   c, $210a                                    ; $6105: $da $0a $21

	ld   a, $a3                                      ; $6108: $3e $a3
	sub  $a0                                         ; $610a: $d6 $a0
	ld   hl, $c806                                   ; $610c: $21 $06 $c8
	add  hl, bc                                      ; $610f: $09
	ld   (hl), a                                     ; $6110: $77
	call $2396                                       ; $6111: $cd $96 $23
	call $238a                                       ; $6114: $cd $8a $23
	jp   $20b2                                       ; $6117: $c3 $b2 $20


	nop                                              ; $611a: $00
	dec  b                                           ; $611b: $05
	ld   a, (bc)                                     ; $611c: $0a
	.db  $10                                         ; $611d: $10
	cp   $b4                                         ; $611e: $fe $b4
	jp   nc, $216e                                   ; $6120: $d2 $6e $21

	sub  $b0                                         ; $6123: $d6 $b0
	ld   hl, $211a                                   ; $6125: $21 $1a $21
	call b4_addAtoHL                                       ; $6128: $cd $ea $23
	ld   a, (hl)                                     ; $612b: $7e
	ld   hl, $c800                                   ; $612c: $21 $00 $c8
	add  hl, bc                                      ; $612f: $09
	or   (hl)                                        ; $6130: $b6
	and  $9f                                         ; $6131: $e6 $9f
	ld   hl, $c09e                                   ; $6133: $21 $9e $c0
	ld   (hl), a                                     ; $6136: $77
	push bc                                          ; $6137: $c5
	ld   bc, $0000                                   ; $6138: $01 $00 $00
	ld   hl, $c800                                   ; $613b: $21 $00 $c8
	add  hl, bc                                      ; $613e: $09
	ld   a, (hl)                                     ; $613f: $7e
	ld   hl, $c09e                                   ; $6140: $21 $9e $c0
	xor  (hl)                                        ; $6143: $ae
	jp   nz, $2153                                   ; $6144: $c2 $53 $21

	ld   hl, $c800                                   ; $6147: $21 $00 $c8
	add  hl, bc                                      ; $614a: $09
	ld   a, (hl)                                     ; $614b: $7e
	or   $20                                         ; $614c: $f6 $20
	ld   hl, $c800                                   ; $614e: $21 $00 $c8
	add  hl, bc                                      ; $6151: $09
	ld   (hl), a                                     ; $6152: $77
	ld   a, $0d                                      ; $6153: $3e $0d
	call b4_addAtoBC                                       ; $6155: $cd $dc $23
	ld   a, c                                        ; $6158: $79
	cp   $41                                         ; $6159: $fe $41
	jp   c, $213b                                    ; $615b: $da $3b $21

	pop  bc                                          ; $615e: $c1
	ld   hl, $c09e                                   ; $615f: $21 $9e $c0
	ld   a, (hl)                                     ; $6162: $7e
	ld   hl, $c800                                   ; $6163: $21 $00 $c8
	add  hl, bc                                      ; $6166: $09
	ld   (hl), a                                     ; $6167: $77
	call $238a                                       ; $6168: $cd $8a $23
	jp   $20b2                                       ; $616b: $c3 $b2 $20


	cp   $b9                                         ; $616e: $fe $b9
	jp   nc, $21a6                                   ; $6170: $d2 $a6 $21

	ld   hl, $c800                                   ; $6173: $21 $00 $c8
	add  hl, bc                                      ; $6176: $09
	ld   a, (hl)                                     ; $6177: $7e
	and  $60                                         ; $6178: $e6 $60
	jp   z, $2180                                    ; $617a: $ca $80 $21

	jp   $2199                                       ; $617d: $c3 $99 $21


	ld   hl, $c800                                   ; $6180: $21 $00 $c8
	add  hl, bc                                      ; $6183: $09
	ld   a, (hl)                                     ; $6184: $7e
	and  $1f                                         ; $6185: $e6 $1f
	ld   hl, $ff10                                   ; $6187: $21 $10 $ff
	call b4_addAtoHL                                       ; $618a: $cd $ea $23
	ld   a, (de)                                     ; $618d: $1a
	sub  $b4                                         ; $618e: $d6 $b4
	call b4_addAtoHL                                       ; $6190: $cd $ea $23
	inc  de                                          ; $6193: $13
	ld   a, (de)                                     ; $6194: $1a
	ldi  (hl), a                                     ; $6195: $22
	call $238a                                       ; $6196: $cd $8a $23
	call $238a                                       ; $6199: $cd $8a $23
	ld   a, $01                                      ; $619c: $3e $01
	ld   hl, $c801                                   ; $619e: $21 $01 $c8
	add  hl, bc                                      ; $61a1: $09
	ld   (hl), a                                     ; $61a2: $77
	jp   $20a6                                       ; $61a3: $c3 $a6 $20


	cp   $b9                                         ; $61a6: $fe $b9
	jp   nz, $21c2                                   ; $61a8: $c2 $c2 $21

	ld   hl, $c802                                   ; $61ab: $21 $02 $c8
	add  hl, bc                                      ; $61ae: $09
	ld   a, (hl)                                     ; $61af: $7e
	ld   hl, $c804                                   ; $61b0: $21 $04 $c8
	add  hl, bc                                      ; $61b3: $09
	ld   (hl), a                                     ; $61b4: $77
	ld   hl, $c803                                   ; $61b5: $21 $03 $c8
	add  hl, bc                                      ; $61b8: $09
	ld   a, (hl)                                     ; $61b9: $7e
	ld   hl, $c805                                   ; $61ba: $21 $05 $c8
	add  hl, bc                                      ; $61bd: $09
	ld   (hl), a                                     ; $61be: $77
	jp   $20b2                                       ; $61bf: $c3 $b2 $20


	cp   $ba                                         ; $61c2: $fe $ba
	jp   nz, $21cf                                   ; $61c4: $c2 $cf $21

	push bc                                          ; $61c7: $c5
	call $2028                                       ; $61c8: $cd $28 $20
	pop  bc                                          ; $61cb: $c1
	jp   $2199                                       ; $61cc: $c3 $99 $21


	cp   $bb                                         ; $61cf: $fe $bb
	jp   nz, $21ec                                   ; $61d1: $c2 $ec $21

	inc  de                                          ; $61d4: $13
	ld   a, (de)                                     ; $61d5: $1a
	sla  a                                           ; $61d6: $cb $27
	sla  a                                           ; $61d8: $cb $27
	sla  a                                           ; $61da: $cb $27
	sla  a                                           ; $61dc: $cb $27
	ld   hl, $c809                                   ; $61de: $21 $09 $c8
	add  hl, bc                                      ; $61e1: $09
	ldi  (hl), a                                     ; $61e2: $22
	call $238a                                       ; $61e3: $cd $8a $23
	call $238a                                       ; $61e6: $cd $8a $23
	jp   $20b2                                       ; $61e9: $c3 $b2 $20


	cp   $bc                                         ; $61ec: $fe $bc
	jr   nz, jr_008_6200                             ; $61ee: $20 $10

	inc  de                                          ; $61f0: $13
	push de                                          ; $61f1: $d5
	pop  hl                                          ; $61f2: $e1
	call $23d3                                       ; $61f3: $cd $d3 $23
	ld   hl, $c804                                   ; $61f6: $21 $04 $c8
	add  hl, bc                                      ; $61f9: $09
	call $23ce                                       ; $61fa: $cd $ce $23
	jp   $20b2                                       ; $61fd: $c3 $b2 $20


jr_008_6200:
	cp   $bd                                         ; $6200: $fe $bd
	jr   nz, jr_008_6211                             ; $6202: $20 $0d

	inc  de                                          ; $6204: $13
	ld   a, (de)                                     ; $6205: $1a
	ld   hl, $c801                                   ; $6206: $21 $01 $c8
	add  hl, bc                                      ; $6209: $09
	ld   (hl), a                                     ; $620a: $77
	call $238a                                       ; $620b: $cd $8a $23
	jp   $20f8                                       ; $620e: $c3 $f8 $20


jr_008_6211:
	cp   $be                                         ; $6211: $fe $be
	jr   nz, jr_008_625d                             ; $6213: $20 $48

	inc  de                                          ; $6215: $13
	ld   hl, $c800                                   ; $6216: $21 $00 $c8
	add  hl, bc                                      ; $6219: $09
	ld   a, (hl)                                     ; $621a: $7e
	and  $60                                         ; $621b: $e6 $60
	jp   nz, $224b                                   ; $621d: $c2 $4b $22

	ld   hl, $c800                                   ; $6220: $21 $00 $c8
	add  hl, bc                                      ; $6223: $09
	ld   a, (hl)                                     ; $6224: $7e
	and  $1f                                         ; $6225: $e6 $1f
	ld   hl, $ff10                                   ; $6227: $21 $10 $ff
	call b4_addAtoHL                                       ; $622a: $cd $ea $23
	ld   a, l                                        ; $622d: $7d
	cp   $20                                         ; $622e: $fe $20
	jr   nz, jr_008_6236                             ; $6230: $20 $04

	inc  hl                                          ; $6232: $23
	inc  de                                          ; $6233: $13
	jr   jr_008_6239                                 ; $6234: $18 $03

jr_008_6236:
	ld   a, (de)                                     ; $6236: $1a
	inc  de                                          ; $6237: $13
	ldi  (hl), a                                     ; $6238: $22

jr_008_6239:
	ld   a, (de)                                     ; $6239: $1a
	inc  de                                          ; $623a: $13
	ldi  (hl), a                                     ; $623b: $22
	ld   a, (de)                                     ; $623c: $1a
	inc  de                                          ; $623d: $13
	ldi  (hl), a                                     ; $623e: $22
	ld   a, (de)                                     ; $623f: $1a
	inc  de                                          ; $6240: $13
	ldi  (hl), a                                     ; $6241: $22
	ld   a, (de)                                     ; $6242: $1a
	inc  de                                          ; $6243: $13
	ldi  (hl), a                                     ; $6244: $22
	ld   a, (de)                                     ; $6245: $1a
	ld   hl, $c801                                   ; $6246: $21 $01 $c8
	add  hl, bc                                      ; $6249: $09
	ld   (hl), a                                     ; $624a: $77
	call $238a                                       ; $624b: $cd $8a $23
	call $238a                                       ; $624e: $cd $8a $23
	call $238a                                       ; $6251: $cd $8a $23
	call $238a                                       ; $6254: $cd $8a $23
	call $238a                                       ; $6257: $cd $8a $23
	jp   $2196                                       ; $625a: $c3 $96 $21


jr_008_625d:
	jp   $2199                                       ; $625d: $c3 $99 $21


	nop                                              ; $6260: $00
	ld   b, b                                        ; $6261: $40
	ldh  a, (<$b0)                                   ; $6262: $f0 $b0
	nop                                              ; $6264: $00
	nop                                              ; $6265: $00
	ldh  a, (<$b0)                                   ; $6266: $f0 $b0
	nop                                              ; $6268: $00
	add  b                                           ; $6269: $80
	ldh  a, (<$b0)                                   ; $626a: $f0 $b0
	ldh  a, (<$e0)                                   ; $626c: $f0 $e0
	ret  nc                                          ; $626e: $d0

	ret  nz                                          ; $626f: $c0

	ld   ($1001), sp                                 ; $6270: $08 $01 $10
	ld   (bc), a                                     ; $6273: $02
	jr   nz, jr_008_627a                             ; $6274: $20 $04

	ld   b, b                                        ; $6276: $40
	ld   b, $80                                      ; $6277: $06 $80
	rlca                                             ; $6279: $07

jr_008_627a:
	inc  b                                           ; $627a: $04
	ld   bc, $0108                                   ; $627b: $01 $08 $01
	.db  $10                                         ; $627e: $10
	ld   (bc), a                                     ; $627f: $02
	jr   nz, jr_008_6286                             ; $6280: $20 $04

	ld   b, b                                        ; $6282: $40
	ld   b, $cb                                      ; $6283: $06 $cb
	ccf                                              ; $6285: $3f

jr_008_6286:
	srl  a                                           ; $6286: $cb $3f
	srl  a                                           ; $6288: $cb $3f
	srl  a                                           ; $628a: $cb $3f
	and  $fe                                         ; $628c: $e6 $fe
	push af                                          ; $628e: $f5
	ld   hl, $c80c                                   ; $628f: $21 $0c $c8
	add  hl, bc                                      ; $6292: $09
	ld   a, (hl)                                     ; $6293: $7e
	or   a                                           ; $6294: $b7
	jp   z, $229c                                    ; $6295: $ca $9c $22

	pop  af                                          ; $6298: $f1
	add  $0a                                         ; $6299: $c6 $0a
	push af                                          ; $629b: $f5
	pop  af                                          ; $629c: $f1
	ld   hl, $2271                                   ; $629d: $21 $71 $22
	call b4_addAtoHL                                       ; $62a0: $cd $ea $23
	ldd  a, (hl)                                     ; $62a3: $3a
	push af                                          ; $62a4: $f5
	ld   a, (hl)                                     ; $62a5: $7e
	ld   hl, $c801                                   ; $62a6: $21 $01 $c8
	add  hl, bc                                      ; $62a9: $09
	ld   (hl), a                                     ; $62aa: $77
	ld   hl, $c809                                   ; $62ab: $21 $09 $c8
	add  hl, bc                                      ; $62ae: $09
	ld   a, (hl)                                     ; $62af: $7e
	and  $f0                                         ; $62b0: $e6 $f0
	ld   (hl), a                                     ; $62b2: $77
	pop  af                                          ; $62b3: $f1
	or   (hl)                                        ; $62b4: $b6
	ld   (hl), a                                     ; $62b5: $77
	ret                                              ; $62b6: $c9

	rst  $10                                         ; $62b7: $d7
	ldi  (hl), a                                     ; $62b8: $22
	rst  $10                                         ; $62b9: $d7
	ldi  (hl), a                                     ; $62ba: $22
	rst  $10                                         ; $62bb: $d7
	ldi  (hl), a                                     ; $62bc: $22
	rst  $10                                         ; $62bd: $d7
	ldi  (hl), a                                     ; $62be: $22
	jr   nz, jr_008_62c1                             ; $62bf: $20 $00

jr_008_62c1:
	sub  l                                           ; $62c1: $95
	nop                                              ; $62c2: $00
	.db  $fd                                         ; $62c3: $fd
	nop                                              ; $62c4: $00
	ld   (hl), b                                     ; $62c5: $70
	ld   bc, $01c2                                   ; $62c6: $01 $c2 $01
	ld   e, $02                                      ; $62c9: $1e $02
	ld   (hl), b                                     ; $62cb: $70
	ld   (bc), a                                     ; $62cc: $02
	rst  $00                                         ; $62cd: $c7
	ld   (bc), a                                     ; $62ce: $02
	inc  d                                           ; $62cf: $14
	inc  bc                                          ; $62d0: $03
	ld   e, c                                        ; $62d1: $59
	inc  bc                                          ; $62d2: $03
	and  b                                           ; $62d3: $a0
	inc  bc                                          ; $62d4: $03
	rst  $10                                         ; $62d5: $d7
	inc  bc                                          ; $62d6: $03
	jr   jr_008_62dd                                 ; $62d7: $18 $04

	ld   d, d                                        ; $62d9: $52
	inc  b                                           ; $62da: $04
	add  l                                           ; $62db: $85
	inc  b                                           ; $62dc: $04

jr_008_62dd:
	cp   b                                           ; $62dd: $b8
	inc  b                                           ; $62de: $04
	and  $04                                         ; $62df: $e6 $04
	inc  d                                           ; $62e1: $14
	dec  b                                           ; $62e2: $05
	inc  a                                           ; $62e3: $3c
	dec  b                                           ; $62e4: $05
	ld   h, h                                        ; $62e5: $64
	dec  b                                           ; $62e6: $05
	adc  d                                           ; $62e7: $8a
	dec  b                                           ; $62e8: $05
	xor  l                                           ; $62e9: $ad
	dec  b                                           ; $62ea: $05
	adc  $05                                         ; $62eb: $ce $05
	xor  $05                                         ; $62ed: $ee $05
	inc  c                                           ; $62ef: $0c
	ld   b, $27                                      ; $62f0: $06 $27
	ld   b, $43                                      ; $62f2: $06 $43
	ld   b, $5b                                      ; $62f4: $06 $5b
	ld   b, $73                                      ; $62f6: $06 $73
	ld   b, $89                                      ; $62f8: $06 $89
	ld   b, $9e                                      ; $62fa: $06 $9e
	ld   b, $b2                                      ; $62fc: $06 $b2
	ld   b, $c5                                      ; $62fe: $06 $c5
	ld   b, $d7                                      ; $6300: $06 $d7
	ld   b, $e7                                      ; $6302: $06 $e7
	ld   b, $f7                                      ; $6304: $06 $f7
	ld   b, $06                                      ; $6306: $06 $06
	rlca                                             ; $6308: $07
	inc  d                                           ; $6309: $14
	rlca                                             ; $630a: $07
	ld   hl, $2e07                                   ; $630b: $21 $07 $2e
	rlca                                             ; $630e: $07
	ldd  a, (hl)                                     ; $630f: $3a
	rlca                                             ; $6310: $07
	ld   b, l                                        ; $6311: $45
	rlca                                             ; $6312: $07
	ld   c, a                                        ; $6313: $4f
	rlca                                             ; $6314: $07
	ld   e, c                                        ; $6315: $59
	rlca                                             ; $6316: $07
	ld   h, e                                        ; $6317: $63
	rlca                                             ; $6318: $07
	ld   l, h                                        ; $6319: $6c
	rlca                                             ; $631a: $07
	ld   (hl), h                                     ; $631b: $74
	rlca                                             ; $631c: $07
	ld   a, h                                        ; $631d: $7c
	rlca                                             ; $631e: $07
	add  e                                           ; $631f: $83
	rlca                                             ; $6320: $07
	adc  d                                           ; $6321: $8a
	rlca                                             ; $6322: $07
	sub  c                                           ; $6323: $91
	rlca                                             ; $6324: $07
	sub  a                                           ; $6325: $97
	rlca                                             ; $6326: $07
	sbc  l                                           ; $6327: $9d
	rlca                                             ; $6328: $07
	and  e                                           ; $6329: $a3
	rlca                                             ; $632a: $07
	xor  b                                           ; $632b: $a8
	rlca                                             ; $632c: $07
	xor  l                                           ; $632d: $ad
	rlca                                             ; $632e: $07
	or   d                                           ; $632f: $b2
	rlca                                             ; $6330: $07
	or   (hl)                                        ; $6331: $b6
	rlca                                             ; $6332: $07
	cp   d                                           ; $6333: $ba
	rlca                                             ; $6334: $07
	cp   (hl)                                        ; $6335: $be
	rlca                                             ; $6336: $07
	jp   nz, $c507                                   ; $6337: $c2 $07 $c5

	rlca                                             ; $633a: $07
	ret                                              ; $633b: $c9


	rlca                                             ; $633c: $07
	call z, $cf07                                    ; $633d: $cc $07 $cf
	rlca                                             ; $6340: $07
	jp   nc, $d407                                   ; $6341: $d2 $07 $d4

	rlca                                             ; $6344: $07
	rst  $10                                         ; $6345: $d7
	rlca                                             ; $6346: $07
	reti                                             ; $6347: $d9


	rlca                                             ; $6348: $07
	.db  $db                                         ; $6349: $db
	rlca                                             ; $634a: $07
	.db  $dd                                         ; $634b: $dd
	rlca                                             ; $634c: $07
	rst  $18                                         ; $634d: $df
	rlca                                             ; $634e: $07
	ld   hl, $c09c                                   ; $634f: $21 $9c $c0
	ld   a, (hl)                                     ; $6352: $7e
	ld   hl, $c80a                                   ; $6353: $21 $0a $c8
	add  hl, bc                                      ; $6356: $09
	ldi  (hl), a                                     ; $6357: $22
	ld   a, (hl)                                     ; $6358: $7e
	and  $f0                                         ; $6359: $e6 $f0
	ld   (hl), a                                     ; $635b: $77
	ld   de, $c09d                                   ; $635c: $11 $9d $c0
	ld   a, (de)                                     ; $635f: $1a
	or   (hl)                                        ; $6360: $b6
	ld   (hl), a                                     ; $6361: $77
	ret                                              ; $6362: $c9


	ld   hl, $c800                                   ; $6363: $21 $00 $c8
	add  hl, bc                                      ; $6366: $09
	ld   a, (hl)                                     ; $6367: $7e
	and  $60                                         ; $6368: $e6 $60
	jp   nz, $2389                                   ; $636a: $c2 $89 $23

	ld   a, (hl)                                     ; $636d: $7e
	and  $1f                                         ; $636e: $e6 $1f
	ld   de, $ff10                                   ; $6370: $11 $10 $ff
	call $23e3                                       ; $6373: $cd $e3 $23
	ld   hl, $c807                                   ; $6376: $21 $07 $c8
	add  hl, bc                                      ; $6379: $09
	ldi  a, (hl)                                     ; $637a: $2a
	ld   (de), a                                     ; $637b: $12
	inc  de                                          ; $637c: $13
	ldi  a, (hl)                                     ; $637d: $2a
	ld   (de), a                                     ; $637e: $12
	inc  de                                          ; $637f: $13
	ldi  a, (hl)                                     ; $6380: $2a
	ld   (de), a                                     ; $6381: $12
	inc  de                                          ; $6382: $13
	ldi  a, (hl)                                     ; $6383: $2a
	ld   (de), a                                     ; $6384: $12
	inc  de                                          ; $6385: $13
	ldi  a, (hl)                                     ; $6386: $2a
	ld   (de), a                                     ; $6387: $12
	inc  de                                          ; $6388: $13
	ret                                              ; $6389: $c9


	ld   hl, $c804                                   ; $638a: $21 $04 $c8
	add  hl, bc                                      ; $638d: $09
	call $23d3                                       ; $638e: $cd $d3 $23
	inc  de                                          ; $6391: $13
	call $23ce                                       ; $6392: $cd $ce $23
	ret                                              ; $6395: $c9


	ld   hl, $c806                                   ; $6396: $21 $06 $c8
	add  hl, bc                                      ; $6399: $09
	ld   a, (hl)                                     ; $639a: $7e
	sla  a                                           ; $639b: $cb $27
	sla  a                                           ; $639d: $cb $27
	ld   de, $2260                                   ; $639f: $11 $60 $22
	call $23e3                                       ; $63a2: $cd $e3 $23
	ld   hl, $c807                                   ; $63a5: $21 $07 $c8
	add  hl, bc                                      ; $63a8: $09
	ld   a, (de)                                     ; $63a9: $1a
	inc  de                                          ; $63aa: $13
	ldi  (hl), a                                     ; $63ab: $22
	ld   a, (de)                                     ; $63ac: $1a
	inc  de                                          ; $63ad: $13
	ldi  (hl), a                                     ; $63ae: $22
	ld   a, (de)                                     ; $63af: $1a
	inc  de                                          ; $63b0: $13
	ldi  (hl), a                                     ; $63b1: $22
	inc  hl                                          ; $63b2: $23
	ld   a, (de)                                     ; $63b3: $1a
	ldi  (hl), a                                     ; $63b4: $22
	ret                                              ; $63b5: $c9


data_04_23b6:
	.db $00 $0d $1a $27 $34

retZandTimes13ifAlt5:
	cp   $05                                         ; $63bb: $fe $05
	jp   nc, +                                   ; $63bd: $d2 $cb $23

	ld   hl, data_04_23b6                                   ; $63c0: $21 $b6 $23
	call b4_addAtoHL                                       ; $63c3: $cd $ea $23
	ld   c, (hl)                                     ; $63c6: $4e
	ld   b, $00                                      ; $63c7: $06 $00
	xor  a                                           ; $63c9: $af
	ret                                              ; $63ca: $c9

+
	or   $ff                                         ; $63cb: $f6 $ff
	ret                                              ; $63cd: $c9


;;
	ld   (hl), e                                     ; $63ce: $73
	inc  hl                                          ; $63cf: $23
	ld   (hl), d                                     ; $63d0: $72
	dec  hl                                          ; $63d1: $2b
	ret                                              ; $63d2: $c9


	ld   de, $0000                                   ; $63d3: $11 $00 $00
	add  hl, de                                      ; $63d6: $19
	ld   e, (hl)                                     ; $63d7: $5e
	inc  hl                                          ; $63d8: $23
	ld   d, (hl)                                     ; $63d9: $56
	dec  hl                                          ; $63da: $2b
	ret                                              ; $63db: $c9


b4_addAtoBC:
	add  c                                           ; $63dc: $81
	ld   c, a                                        ; $63dd: $4f
	ld   a, b                                        ; $63de: $78
	adc  $00                                         ; $63df: $ce $00
	ld   b, a                                        ; $63e1: $47
	ret                                              ; $63e2: $c9


	add  e                                           ; $63e3: $83
	ld   e, a                                        ; $63e4: $5f
	ld   a, d                                        ; $63e5: $7a
	adc  $00                                         ; $63e6: $ce $00
	ld   d, a                                        ; $63e8: $57
	ret                                              ; $63e9: $c9


b4_addAtoHL:
	add  l                                           ; $63ea: $85
	ld   l, a                                        ; $63eb: $6f
	ld   a, h                                        ; $63ec: $7c
	adc  $00                                         ; $63ed: $ce $00
	ld   h, a                                        ; $63ef: $67
	ret                                              ; $63f0: $c9

