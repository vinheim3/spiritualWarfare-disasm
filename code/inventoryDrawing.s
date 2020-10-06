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


// unused - 5223, draws 1 digit count of an item
	ld   hl, wInvItemCountsNumDigits
	ld   (hl), $01
	jr   +


drawBombsOrKeys:
	ld   hl, wInvItemCountsNumDigits
	ld   (hl), $02
	call aIsMax99
	jr   +

drawNumBirdsAtOffset:
	ld   hl, wInvItemCountsNumDigits
	ld   (hl), $03

+
// a is number of item
	ld   c, a
	ld   b, $00

// display in screen 1, store starting addr in c5fc
	call b4_dPlusEquScreen1displayOffset
	ld   hl, wInvItemCountsDigitsVramAddr
	ld   (hl), e
	inc  hl
	ld   (hl), d

// item count div 10
	ld   a, $0a
	call bcDivA_divInC_modInAB

// unit in c0a0
	ld   hl, wInvCountDigits
	ld   (hl), b

// div by 10 again
	ld   b, $00
	ld   a, $0a
	call bcDivA_divInC_modInAB

// tens in c0a1, hundreds in c0a2
	ld   hl, wInvCountDigits+1
	ld   (hl), b
	ld   hl, wInvCountDigits+2
	ld   (hl), c

	ld   hl, wInvItemCountsNumDigits
	ld   a, (hl)
	cp   $01
	jr   nz, +

// draw the 1 digit top half
	ld   hl, wInvCountDigits
	call copyHLDDigitTileIdxIntoDE
	jr   @drawBottomHalfOfDigits

+
	cp   $02
	jr   nz, +

// draw the 2 digits top halves
	ld   hl, wInvCountDigits+1
	call copyHLDDigitTileIdxIntoDE
	call copyHLDDigitTileIdxIntoDE
	jr   @drawBottomHalfOfDigits

+
	ld   hl, wInvCountDigits+2
	ld   a, (hl)
	cp   $00
	jr   nz, +

// draw 2 digits top halves if no hundreds
	dec  hl
	call copyHLDDigitTileIdxIntoDE
	call copyHLDDigitTileIdxIntoDE
	ld   a, $00
	ld   (de), a
	jr   @drawBottomHalfOfDigits

+
// otherwise draw all 3 digits top halves
	call copyHLDDigitTileIdxIntoDE
	call copyHLDDigitTileIdxIntoDE
	call copyHLDDigitTileIdxIntoDE

@drawBottomHalfOfDigits:
// start copying bottom half of tiles
	ld   hl, wInvItemCountsDigitsVramAddr
	ldi  a, (hl)
	add  <$0020
	ld   e, a
	ld   a, (hl)
	adc  >$0020
	ld   d, a

	ld   hl, wInvItemCountsNumDigits
	ld   a, (hl)
	cp   $01
	jr   nz, +

// draw the 1 digit bottom half
	ld   hl, wInvCountDigits
	call copyHLDDigitBottomTileIdxIntoDE
	jr   @done

+
	cp   $02
	jr   nz, +

// draw the 2 digits bottom halves
	ld   hl, wInvCountDigits+1
	call copyHLDDigitBottomTileIdxIntoDE
	call copyHLDDigitBottomTileIdxIntoDE
	jr   @done

+
	ld   hl, wInvCountDigits+2
	ld   a, (hl)
	cp   $00
	jr   nz, +

// if no hundrds, 2 digits bottom halves
	dec  hl
	call copyHLDDigitBottomTileIdxIntoDE
	call copyHLDDigitBottomTileIdxIntoDE
	ld   a, $00
	ld   (de), a
	jr   @done

+
// otherwise draw 3 digits bottom halves
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


b4_dPlusEquScreen1displayOffset:
	ld   hl, wScreen1displayOffset
	ld   a, d
	add  (hl)
	ld   d, a
	ret


drawScore:
	ld   de, $996a
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset

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
	call b4_dPlusEquScreen1displayOffset
	ld   hl, wRoomGroupNameLine1
	ld   c, $07
	call copyTextToVram_spaceIsTile0
	ld   de, $9a06
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset
	pop  af
	add  $01
	ld   (de), a
	ret


drawFruitAmounts:
	ld   de, $9882
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset
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
	call b4_dPlusEquScreen1displayOffset
// 5b is the x on current location
	ld   a, $5b
	ld   (de), a
	ret