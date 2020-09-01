; Disassembly of "OR"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3

//
bItemTopLeftTileIdxs:
	.db $c8 $84 $d8


// fruits
aItemTopTileIdxs:
	.db $92 $96 $94 $98 $90


armorOfGodVramLocs:
	.dw $98aa
	.dw $98ad
	.dw $98b0
	.dw $98f0
	.dw $98ea
	.dw $98ed


drawInDynamicPartOfInventoryScreen:
	ld   hl, wNumBombs
	ld   a, (hl)
	ld   de, $99ec
	call drawBombsOrKeys

	ld   hl, wNumKeys
	ld   a, (hl)
	ld   de, $99e7
	call drawBombsOrKeys

	call drawNumBirds
	call drawHearts
	call drawFruitAmounts
	call drawScore
	call drawBitem
	call drawAitem
	call drawRailroadTicketIfRetrieved
	call drawSelectableBitems
	call drawArmorOfGod
	ret


drawNumBirds:
	ld   hl, wNumBirds
	ld   a, (hl)
	ld   de, $99f1
	call func_04_1234
	ret


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
	ld   hl, wSpecialItemsGottenByte
	ld   (hl), a

// bit 0 set of special items byte, put in bit 3
	ld   hl, wSpecialBitemsGotten
	ld   a, (hl)
	and  $01
	sla  a
	sla  a
	sla  a
	ld   hl, wSpecialItemsGottenByte
	or   (hl)

	ld   hl, wSpecialItemsGottenByte
	ld   (hl), a

// bit 1 set of special items byte, put in bit 1
	ld   hl, wSpecialBitemsGotten
	ld   a, (hl)
	and  $02
	ld   hl, wSpecialItemsGottenByte
	or   (hl)

	ld   hl, wSpecialItemsGottenByte
	ld   (hl), a

// bit 2 set of special items byte, put in bit 4
	ld   hl, wSpecialBitemsGotten
	ld   a, (hl)
	and  $04
	sla  a
	sla  a
	ld   hl, wSpecialItemsGottenByte
	or   (hl)

	ld   hl, wSpecialItemsGottenByte
	ld   (hl), a

// bit 5 and 6 - anointing oils
	ld   hl, wAnointingOilsGotten
	ld   a, (hl)
	and  $03
	sla  a
	sla  a
	sla  a
	sla  a
	sla  a
	ld   hl, wSpecialItemsGottenByte
	or   (hl)

	ld   hl, wSpecialItemsGottenByte
	ld   (hl), a

// bit 2 - sword of the spirit
	ld   hl, wArmorOfGodGotten
	ld   a, (hl)
	and  $20
	srl  a
	srl  a
	srl  a
	ld   hl, wSpecialItemsGottenByte
	or   (hl)
	ld   hl, wSpecialItemsGottenByte
	ld   (hl), a
	ret


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
	call b4_dEquDoffsetInScreen1                                       ; $523c: $cd $01 $13
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
// start copying bottom half of tiles
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
	jr   nz, +                             ; $52aa: $20 $08

	ld   hl, $c0a0                                   ; $52ac: $21 $a0 $c0
	call copyHLDDigitBottomTileIdxIntoDE                                       ; $52af: $cd $e8 $12
	jr   @done                                 ; $52b2: $18 $2c

+
	cp   $02                                         ; $52b4: $fe $02
	jr   nz, +                             ; $52b6: $20 $0b

	ld   hl, $c0a1                                   ; $52b8: $21 $a1 $c0
	call copyHLDDigitBottomTileIdxIntoDE                                       ; $52bb: $cd $e8 $12
	call copyHLDDigitBottomTileIdxIntoDE                                       ; $52be: $cd $e8 $12
	jr   @done                                 ; $52c1: $18 $1d

+
	ld   hl, $c0a2                                   ; $52c3: $21 $a2 $c0
	ld   a, (hl)                                     ; $52c6: $7e
	cp   $00                                         ; $52c7: $fe $00
	jr   nz, +                             ; $52c9: $20 $0c

	dec  hl                                          ; $52cb: $2b
	call copyHLDDigitBottomTileIdxIntoDE                                       ; $52cc: $cd $e8 $12
	call copyHLDDigitBottomTileIdxIntoDE                                       ; $52cf: $cd $e8 $12
	ld   a, $00                                      ; $52d2: $3e $00
	ld   (de), a                                     ; $52d4: $12
	jr   @done                                 ; $52d5: $18 $09

+
	call copyHLDDigitBottomTileIdxIntoDE                                       ; $52d7: $cd $e8 $12
	call copyHLDDigitBottomTileIdxIntoDE                                       ; $52da: $cd $e8 $12
	call copyHLDDigitBottomTileIdxIntoDE                                       ; $52dd: $cd $e8 $12

@done:
	ret                                              ; $52e0: $c9


// draws the number of bombs
copyHLDDigitTileIdxIntoDE:
	ldd  a, (hl)
	call convDigitIntoTileIdx
	ld   (de), a
	inc  de
	ret


copyHLDDigitBottomTileIdxIntoDE:
	ldd  a, (hl)
	call convDigitIntoBottomHalfTileIdx
	ld   (de), a
	inc  de
	ret


aIsMax99:
	cp   100
	jr   c, +

	ld   a, 99

+
	ret


convDigitIntoTileIdx:
	sla  a
	add  $0a
	ret


convDigitIntoBottomHalfTileIdx:
	call convDigitIntoTileIdx
	add  $01
	ret


b4_dEquDoffsetInScreen1:
	ld   hl, wScreen1displayOffset
	ld   a, d
	add  (hl)
	ld   d, a
	ret


drawScore:
	ld   de, $996a
	call b4_dEquDoffsetInScreen1
	ld   bc, $0000

-
	ld   hl, wPlayerScore
	add  hl, bc
	ld   a, (hl)
	add  $30
	ld   (de), a
	inc  de
	inc  bc
	ld   a, c
	cp   $07
	jr   nz, -

	ret


drawHearts:
	ld   de, $99a8
	call b4_dEquDoffsetInScreen1

	ld   a, 12
	ld   hl, wCurrentHeartDrawn
	ld   (hl), a

	ld   hl, wPlayerMaxHealth
	ld   b, (hl)
	srl  b
	ld   hl, wPlayerHealth
	ld   c, (hl)

@nextHeart:
	inc  c
// empty heart
	ld   a, $ea
	dec  c
	jr   z, @drawHeart

// half heart
	ld   a, $e9
	dec  c
	jr   z, @drawHeart

// full heart
	ld   a, $e8
	dec  c

@drawHeart:
	ld   (de), a
	inc  de

	ld   hl, wCurrentHeartDrawn
	dec  (hl)
	dec  b
	jr   nz, @nextHeart

// clear hearts not yet gotten
	ld   hl, wCurrentHeartDrawn
	ld   c, (hl)
	inc  c
	ld   a, $00

@loopC:
	dec  c
	jr   z, @done

	ld   (de), a
	inc  de
	jr   @loopC

@done:
	ret


drawAreaTextInMapScreen:
	ld   de, $99e6
	call b4_dEquDoffsetInScreen1
	ld   hl, wRoomGroupNameLine1
	ld   c, $07
	call copyTextToVram_spaceIsTile0
	ld   de, $9a06
	call b4_dEquDoffsetInScreen1
	ld   hl, wRoomGroupNameLine2
	ld   c, $07

copyTextToVram_spaceIsTile0:
-
	ldi  a, (hl)
	cp   $20
	jr   nz, +

	ld   a, $00

+
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	ret


drawBitem:
	ld   de, $98c5
	call b4_dEquDoffsetInScreen1
	ld   hl, wEquippedBItem
	ld   c, (hl)
	ld   b, $00
	ld   hl, bItemTopLeftTileIdxs
	add  hl, bc
	ld   a, (hl)
	ld   (de), a
	inc  de
	add  $02
	ld   (de), a
	push af
	ld   de, $98e5
	call b4_dEquDoffsetInScreen1
	pop  af
	dec  a
	ld   (de), a
	inc  de
	add  $02
	ld   (de), a
	ret


drawAitem:
// 2 fruit tiles
	ld   de, $9945
	call b4_dEquDoffsetInScreen1
	ld   hl, wFruitEquipped
	ld   c, (hl)
	ld   b, $00
	ld   hl, aItemTopTileIdxs
	add  hl, bc
	ld   a, (hl)
	ld   (de), a
	inc  de
	push af

// fruit amounts
	ld   a, c
	push de
	ld   e, a
	call getFruitAmountFromWram
	add  $30
	pop  de
	ld   (de), a
	ld   de, $9965
	call b4_dEquDoffsetInScreen1
	pop  af
	add  $01
	ld   (de), a
	ret


drawFruitAmounts:
	ld   de, $9882
	call b4_dEquDoffsetInScreen1
	ld   bc, $0000

@loop:
	push de
	push bc
	push bc
	pop  de
	call getFruitAmountFromWram
	ld   a, e
	pop  bc
	pop  de

// turn fruit nums into the tile idxes
	call convDigitIntoTileIdx
	ld   (de), a
	call b4_dePlusEqu20h
	inc  a
	ld   (de), a
	call b4_dePlusEqu20h

// 5 fruits?
	inc  bc
	ld   a, c
	cp   $05
	jr   nz, @loop

	ret

b4_dePlusEqu20h:
	ld   hl, $0020
	add  hl, de
	push hl
	pop  de
	ret


getFruitAmountFromWram:
	ld   a, e
	push af
	srl  e
	ld   d, $00
	ld   hl, wFruitAmounts
	add  hl, de
	ld   e, (hl)
	pop  af
	and  $01
	jr   z, +

	srl  e
	srl  e
	srl  e

+
	ld   a, e
	and  $07
	ld   e, a
	ret


drawRailroadTicketIfRetrieved:
	ld   hl, wSpecialBitemsGotten
	ld   a, (hl)
	and  $08
	jr   nz, +

// clear railroad ticket text
	ld   de, $99a4
	call b4_dEquDoffsetInScreen1
	ld   a, $00
	ld   (de), a
	inc  de
	ld   (de), a
	inc  de
	ld   (de), a
	inc  de
	ld   (de), a
	inc  de

+
	ret


drawSelectableBitems:
	ld   de, $9821
	call b4_dEquDoffsetInScreen1
	call checkBitemsSelectable
	ld   b, a
	ld   c, $00

@checkNextItem:
	bit  0, b
	jr   nz, +

// dont have item
	call clearOut2x2TileAtDE

+
	inc  de
	inc  de
	srl  b
	inc  c
	ld   a, c
	cp   $08
	jr   nz, @checkNextItem

	ret


clearOut2x2TileAtDE:
	push af
	push de
	push hl
	ld   a, $00
	ld   (de), a
	inc  de
	ld   (de), a
	ld   hl, $001f
	add  hl, de
	ldi  (hl), a
	ldi  (hl), a
	pop  hl
	pop  de
	pop  af
	ret


drawArmorOfGod:
	ld   hl, wArmorOfGodGotten
	ld   b, (hl)
	ld   c, $00

@nextArmorOfGod:
	bit  0, b
	jr   nz, +

	ld   hl, armorOfGodVramLocs
	push bc
	ld   b, $00
	add  hl, bc
	add  hl, bc
	pop  bc
	ld   e, (hl)
	inc  hl
	ld   d, (hl)
	call b4_dEquDoffsetInScreen1
	call clearOut2x2TileAtDE

+
	srl  b
	inc  c
	ld   a, c
	cp   $06
	jr   nz, @nextArmorOfGod

	ret


playerNameCharToTileIdx:
	.db $30 $31 $32 $33 $34 $35 $36 $37
	.db $38 $39 $41 $42 $43 $44 $45 $46
	.db $47 $48 $49 $4a $4b $4c $4d $4e
	.db $4f $50 $51 $52 $53 $54 $55 $56
	.db $57 $58 $59 $5a $61 $62 $63 $64
	.db $65 $66 $67 $68 $69 $6a $6b $6c
	.db $6d $6e $6f $70 $71 $72 $73 $74
	.db $75 $76 $77 $78 $79 $7a $21 $5c


drawPlayerNameInMap:
	ld   de, $9806
	call b4_dEquDoffsetInScreen1
	ld   bc, $0000

-
	ld   hl, wPlayerName
	add  hl, bc

	push de
	ld   e, (hl)
	ld   d, $00
	ld   hl, playerNameCharToTileIdx
	add  hl, de
	ld   a, (hl)
	pop  de

	ld   (de), a
	inc  de
	inc  bc
	ld   a, c
	cp   $08
	jr   nz, -

	ret


drawCurrentLocationInMap:
// check if group vram offset is not listed as $ffff, eg indoors
	ld   hl, wCurrGroupMapVRamOffset
	ld   a, (hl)
	cp   $ff
	jr   nz, @notFFFF

	ld   hl, wCurrGroupMapVRamOffset+1
	ld   a, (hl)
	cp   $ff
	jr   nz, @notFFFF

	ret

@notFFFF:
	ld   hl, wCurrRoomY
	ld   c, (hl)
	ld   e, $20
	call ecEquEtimesC
	ld   hl, wCurrRoomX
	ld   a, (hl)
	call ecPlusEquA
	ld   a, c


.include "data/bank_004.s"


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
	jr   z, @func_20a6                              ; $609c: $28 $08

	ld   hl, $c801                                   ; $609e: $21 $01 $c8
	add  hl, bc                                      ; $60a1: $09
	dec  (hl)                                        ; $60a2: $35
	jp   z, @func_20b2                                    ; $60a3: $ca $b2 $20

@func_20a6:
	ld   a, $0d                                      ; $60a6: $3e $0d
	call b4_addAtoBC                                       ; $60a8: $cd $dc $23
	ld   a, c                                        ; $60ab: $79
	cp   $41                                         ; $60ac: $fe $41
	jp   c, -                                    ; $60ae: $da $95 $20

	ret                                              ; $60b1: $c9

@func_20b2:
	ld   hl, $c804                                   ; $60b2: $21 $04 $c8
	add  hl, bc                                      ; $60b5: $09
	ld   e, (hl)                                     ; $60b6: $5e
	ld   hl, $c805                                   ; $60b7: $21 $05 $c8
	add  hl, bc                                      ; $60ba: $09
	ld   d, (hl)                                     ; $60bb: $56
	ld   a, (de)                                     ; $60bc: $1a
	cp   $a0                                         ; $60bd: $fe $a0
	jp   nc, @func_20fe                                   ; $60bf: $d2 $fe $20

	call func_04_2284                                       ; $60c2: $cd $84 $22
	ld   hl, $c806                                   ; $60c5: $21 $06 $c8
	add  hl, bc                                      ; $60c8: $09
	ld   a, (hl)                                     ; $60c9: $7e
	sla  a                                           ; $60ca: $cb $27
	ld   hl, data_04_22b7                                   ; $60cc: $21 $b7 $22
	call b4_addAtoHL                                       ; $60cf: $cd $ea $23
	push de                                          ; $60d2: $d5
	call b4_deEquWordInHL                                       ; $60d3: $cd $d3 $23
	ld   l, e                                        ; $60d6: $6b
	ld   h, d                                        ; $60d7: $62
	pop  de                                          ; $60d8: $d1
	ld   a, (de)                                     ; $60d9: $1a
	and  $1f                                         ; $60da: $e6 $1f
	cp   $1f                                         ; $60dc: $fe $1f
	jr   z, +                              ; $60de: $28 $18

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
	call func_04_234f                                       ; $60f2: $cd $4f $23
	call func_04_2363                                       ; $60f5: $cd $63 $23

+
	call func_04_238a                                       ; $60f8: $cd $8a $23
	jp   @func_20a6                                       ; $60fb: $c3 $a6 $20

@func_20fe:
	cp   $b0                                         ; $60fe: $fe $b0
	jp   nc, func_04_211e                                   ; $6100: $d2 $1e $21

	cp   $a4                                         ; $6103: $fe $a4
	jp   c, +                                    ; $6105: $da $0a $21

	ld   a, $a3                                      ; $6108: $3e $a3
+
	sub  $a0                                         ; $610a: $d6 $a0
	ld   hl, $c806                                   ; $610c: $21 $06 $c8
	add  hl, bc                                      ; $610f: $09
	ld   (hl), a                                     ; $6110: $77
	call func_04_2396                                       ; $6111: $cd $96 $23
	call func_04_238a                                       ; $6114: $cd $8a $23
	jp   @func_20b2                                       ; $6117: $c3 $b2 $20


	nop                                              ; $611a: $00
	dec  b                                           ; $611b: $05
	ld   a, (bc)                                     ; $611c: $0a
	.db  $10                                         ; $611d: $10
	
func_04_211e:
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
	call func_04_238a                                       ; $6168: $cd $8a $23
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
	call func_04_238a                                       ; $6196: $cd $8a $23
	call func_04_238a                                       ; $6199: $cd $8a $23
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
	call func_04_238a                                       ; $61e3: $cd $8a $23
	call func_04_238a                                       ; $61e6: $cd $8a $23
	jp   $20b2                                       ; $61e9: $c3 $b2 $20


	cp   $bc                                         ; $61ec: $fe $bc
	jr   nz, jr_008_6200                             ; $61ee: $20 $10

	inc  de                                          ; $61f0: $13
	push de                                          ; $61f1: $d5
	pop  hl                                          ; $61f2: $e1
	call b4_deEquWordInHL                                       ; $61f3: $cd $d3 $23
	ld   hl, $c804                                   ; $61f6: $21 $04 $c8
	add  hl, bc                                      ; $61f9: $09
	call b4_deIntoHL                                       ; $61fa: $cd $ce $23
	jp   $20b2                                       ; $61fd: $c3 $b2 $20


jr_008_6200:
	cp   $bd                                         ; $6200: $fe $bd
	jr   nz, jr_008_6211                             ; $6202: $20 $0d

	inc  de                                          ; $6204: $13
	ld   a, (de)                                     ; $6205: $1a
	ld   hl, $c801                                   ; $6206: $21 $01 $c8
	add  hl, bc                                      ; $6209: $09
	ld   (hl), a                                     ; $620a: $77
	call func_04_238a                                       ; $620b: $cd $8a $23
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
	call func_04_238a                                       ; $624b: $cd $8a $23
	call func_04_238a                                       ; $624e: $cd $8a $23
	call func_04_238a                                       ; $6251: $cd $8a $23
	call func_04_238a                                       ; $6254: $cd $8a $23
	call func_04_238a                                       ; $6257: $cd $8a $23
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
	.db $06
	
	
func_04_2284:
	.db $cb
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


data_04_22b7:
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
	
	
func_04_234f:
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


func_04_2363:
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


func_04_238a:
	ld   hl, $c804                                   ; $638a: $21 $04 $c8
	add  hl, bc                                      ; $638d: $09
	call b4_deEquWordInHL                                       ; $638e: $cd $d3 $23
	inc  de                                          ; $6391: $13
	call b4_deIntoHL                                       ; $6392: $cd $ce $23
	ret                                              ; $6395: $c9


func_04_2396:
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


b4_deIntoHL:
	ld   (hl), e                                     ; $63ce: $73
	inc  hl                                          ; $63cf: $23
	ld   (hl), d                                     ; $63d0: $72
	dec  hl                                          ; $63d1: $2b
	ret                                              ; $63d2: $c9


b4_deEquWordInHL:
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

