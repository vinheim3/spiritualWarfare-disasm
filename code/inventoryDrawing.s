// bombs, jawbone, sword
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
	call drawNumBirdsAtOffset
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

drawNumBirdsAtOffset:
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
	call copyHLDDigitTileIdxIntoDE
	jr   @next_1299                                 ; $526b: $18 $2c

+
	cp   $02                                         ; $526d: $fe $02
	jr   nz, +                             ; $526f: $20 $0b

	ld   hl, $c0a1                                   ; $5271: $21 $a1 $c0
	call copyHLDDigitTileIdxIntoDE
	call copyHLDDigitTileIdxIntoDE
	jr   @next_1299                                 ; $527a: $18 $1d

+
	ld   hl, $c0a2                                   ; $527c: $21 $a2 $c0
	ld   a, (hl)                                     ; $527f: $7e
	cp   $00                                         ; $5280: $fe $00
	jr   nz, +                             ; $5282: $20 $0c

	dec  hl                                          ; $5284: $2b
	call copyHLDDigitTileIdxIntoDE
	call copyHLDDigitTileIdxIntoDE
	ld   a, $00                                      ; $528b: $3e $00
	ld   (de), a                                     ; $528d: $12
	jr   @next_1299                                 ; $528e: $18 $09

+
	call copyHLDDigitTileIdxIntoDE
	call copyHLDDigitTileIdxIntoDE
	call copyHLDDigitTileIdxIntoDE

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
	call copyHLDDigitBottomTileIdxIntoDE
	jr   @done                                 ; $52b2: $18 $2c

+
	cp   $02                                         ; $52b4: $fe $02
	jr   nz, +                             ; $52b6: $20 $0b

	ld   hl, $c0a1                                   ; $52b8: $21 $a1 $c0
	call copyHLDDigitBottomTileIdxIntoDE
	call copyHLDDigitBottomTileIdxIntoDE
	jr   @done                                 ; $52c1: $18 $1d

+
	ld   hl, $c0a2                                   ; $52c3: $21 $a2 $c0
	ld   a, (hl)                                     ; $52c6: $7e
	cp   $00                                         ; $52c7: $fe $00
	jr   nz, +                             ; $52c9: $20 $0c

	dec  hl                                          ; $52cb: $2b
	call copyHLDDigitBottomTileIdxIntoDE
	call copyHLDDigitBottomTileIdxIntoDE
	ld   a, $00                                      ; $52d2: $3e $00
	ld   (de), a                                     ; $52d4: $12
	jr   @done                                 ; $52d5: $18 $09

+
	call copyHLDDigitBottomTileIdxIntoDE
	call copyHLDDigitBottomTileIdxIntoDE
	call copyHLDDigitBottomTileIdxIntoDE

@done:
	ret


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
	.asc "0123456789"
	.asc "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.asc "abcdefghijklmnopqrstuvwxyz"
	.asc "!"
	.db $5c  // underscore filler


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
	ld   hl, wCurrGroupMapVRamOffset
	add  (hl)

	push af
	ld   a, e
	ld   hl, wCurrGroupMapVRamOffset+1
	adc  (hl)
	ld   d, a
	pop  af

	ld   e, a
	call b4_dEquDoffsetInScreen1
// 5b is the x on current location
	ld   a, $5b
	ld   (de), a
	ret