
bank0begin:
	ld   bc, $0000
	ld   (bc), a
	jp   begin

.org $100

boot:
	jp   bank0begin

.org $148
// rom banks
	.db $00

.org $14d
// header checksum
	.db $e7


callHLinBankC:
	ld   b, $00
	ld   (bc), a
	ld   bc, @return
	push bc
	jp   hl

@return:
	ld   hl, $0000
	ld   (hl), a
	ret


loadFirst1000hVramTiles:
// jp to bank c
// if we dont find $ab, copy hl to de
// if bit 4 of d is nz ($9000+), jump to original bank b, otherwise loop
// if we find $ab at any point...
	push bc
	ld   b, $00
	ld   (bc), a
	ld   de, $8000

@copyNextByte:
	ldi  a, (hl)
	cp   $ab
	jr   z, @checkCopySequentialBytes

@copyIntoDestUntil9000h:
	ld   (de), a
	inc  de
	bit  4, d
	jr   z, @copyNextByte

@popAFjpBankA:
	pop  af
	ld   l, a
	ld   h, $00
	ld   (hl), a
	ret

@checkCopySequentialBytes:
// if we found $ab, if the next value is $ab, copy over
	ldi  a, (hl)
	cp   $ab
	jr   z, @copyIntoDestUntil9000h

// otherwise, copy the byte after $ab, number of times dictated
// by the byte after + 3
	push af
	ldi  a, (hl)
	add  $03
	ld   c, a
	pop  af

-
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	jr   @copyIntoDestUntil9000h


loadFirst800hVramTiles:
// jp to bank c
	push bc
	ld   b, $00
	ld   (bc), a
	ld   de, $8000

@nextByte:
	ldi  a, (hl)
	cp   $ab
	jr   z, @abFound

@copyIntoMemory:
	ld   (de), a
	inc  de
	bit  3, d
	jr   z, @nextByte

@done:
	jp   loadFirst1000hVramTiles@popAFjpBankA


@abFound:
	ldi  a, (hl)
	cp   $ab
	jr   z, @copyIntoMemory

	push af
	ldi  a, (hl)
	add  $03
	ld   c, a
	pop  af

@nextOfSameByte:
	ld   (de), a
	inc  de
	bit  3, d
	jr   nz, @done

	dec  c
	jr   nz, @nextOfSameByte

	jr   @copyIntoMemory


copyMemoryInBankA:
	push bc
	ld   c, a
	ld   b, $00
	ld   (bc), a
	pop  bc
// copy memory b
-
	ldi  a, (hl)
	ld   (de), a
	inc  de
	dec  b
	jr   nz, -

	ld   (bc), a
	ret


// sound-related functions
call_playSoundChannelADataInDE:
	ld   hl, :playSoundChannelADataInDE
	ld   (hl), a
	call playSoundChannelADataInDE
	ld   hl, $0000
	ld   (hl), a
	ret


call_stopHWSoundChannelA:
	ld   hl, :stopHWSoundChannelA
	ld   (hl), a
	call stopHWSoundChannelA
	ld   hl, $0000
	ld   (hl), a
	ret


call_updateSounds:
	ld   hl, :updateSounds
	ld   (hl), a
	call updateSounds
	ld   hl, $0000
	ld   (hl), a
	ret


// unused - 01e2
waitUntilNext2VBlankPeriods:
	call waitUntilNextVBlankPeriod

waitUntilNextVBlankPeriod:
	call waitUntilNotInVBlankPeriod

waitUntilStartOfVBlankPeriod:
	ld   hl, rLCDC
	bit  7, (hl)
	jr   z, _f

	ld   hl, rLY
-
	ld   a, (hl)
	cp   $90
	jr   nz, -

__	ret


waitUntilNotInVBlankPeriod:
	ld   hl, rLCDC
	bit  7, (hl)
	jp   z, _b

	ld   hl, rLY
-
	ld   a, (hl)
	cp   $90
	jp   nc, -

	ret


turnOffLCDstartOfVBlank:
	call waitUntilStartOfVBlankPeriod

turnOffLCD:
	ld   a, $7f
	jr   +

setLCDfromValue_c015equA:
	push hl
	ld   hl, wc015
	ld   (hl), a
	pop  hl
	ld   a, $ff

+
	push hl
	ld   hl, wLCDCvalue
	and  (hl)
	ld   hl, rLCDC
	ld   (hl), a
	pop  hl
	ret


copyBytesFromAnotherBankInto_c6d0:
// c0a1 is bank
	ld   hl, wCommonByteCopyFuncBank
	ld   l, (hl)
	ld   h, $00
	ld   (hl), a

// c0a0 is number of bytes
	ld   hl, wCommonByteCopyFuncNumBytes
	ld   e, (hl)

// c09a/b is source of bytes to copy
	ld   hl, wCommonByteCopyFuncSrc
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a

// dest is c6d0
	push bc
	ld   bc, wCommonByteCopyDestBytes

-
	ldi  a, (hl)
	ld   (bc), a
	inc  bc
	dec  e
	jr   nz, -

	pop  bc
	ld   hl, $0000
	ld   (hl), a
	ret


call_b0_getCurrRoomGroupsWidthAndHeight:
	push af
	ld   hl, $0000
	ld   (hl), a
	call getCurrRoomGroupsWidthAndHeight
	jp   loadFirst1000hVramTiles@popAFjpBankA


loadRoomStructData:
// $c006 currently points to a room struct

// wTileLayoutDataBank is the bank to get data from
	ld   hl, wTileLayoutDataBank
	ld   l, (hl)
	ld   h, $00
	ld   (hl), a

// get 1st room struct byte and store in c72b
	ld   de, $0000
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	ld   a, (hl)
	ld   hl, wFirstRoomStructByte
	ld   (hl), a

// pointing at 2nd byte now
	inc  de
	and  $80
	jr   z, @afterBGPpalettes

// if bit 7 set of 1st struct byte, set lamp BGP values
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)

// next byte into c5f0 and c5f4
	ld   hl, wBGPwhenLampOff
	ld   (hl), a
	ld   hl, wBGPwhenLampOn
	ld   (hl), a

// pointing at 3rd byte
	inc  de
	ld   hl, wCurrRoomStructPointer
	add  hl, de
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	ld   a, (hl)

// next byte into c5f1 and c5f5 (unused?)
	ld   hl, wBGPwhenLampOff+1
	ld   (hl), a
	ld   hl, wBGPwhenLampOn+1
	ld   (hl), a
	inc  de

@afterBGPpalettes:
	ld   hl, wFirstRoomStructByte
	ld   a, (hl)
	and  $40
	jr   z, @afterOBP0palettes

// bit 6 set of 1st struct byte, set lamp OBP0 values
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)

// next byte into c5f2 and c5f6
	ld   hl, wOBP0whenLampOff
	ld   (hl), a
	ld   hl, wOBP0whenLampOn
	ld   (hl), a

// pointing at 2nd unused byte
	inc  de
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)

// next byte into c5f3 and c5f7 (unused?)
	ld   hl, wOBP0whenLampOff+1
	ld   (hl), a
	ld   hl, wOBP0whenLampOn+1
	ld   (hl), a
	inc  de

@afterOBP0palettes:
// check if base empty tile is different, eg grass
	ld   hl, wFirstRoomStructByte
	ld   a, (hl)
	and  $04
	ld   hl, wBaseRoomFloorTile
	ld   (hl), a
	cp   $00
	jr   z, @after1stByteBit2check

// run the follow if the above bit 2 is set
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wBaseRoomFloorTile
	ld   (hl), a
	inc  de

@after1stByteBit2check:
// 2nd/next struct byte
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	inc  de

// store it in $c72c
	ld   hl, wSecondRoomStructByte
	ld   (hl), a
	and  $80

// store its bit 7 in $c5fe
	ld   hl, wSecondRoomStructByteBit7                                   ; $02e0: $21 $fe $c5
	ld   (hl), a                                     ; $02e3: $77

	ld   hl, wSecondRoomStructByte                                   ; $02e4: $21 $2c $c7
	ld   a, (hl)                                     ; $02e7: $7e
	and  $40                                         ; $02e8: $e6 $40
	jr   z, +                              ; $02ea: $28 $06

// TODO: run the following if 2nd byte's bit 6 is set
// c04a seems to be a Y offset for both player and NPCs (0 or 8 in some cases)
	ld   a, $00                                      ; $02ec: $3e $00
	ld   hl, wPlayerOrEntityYCollisionAdjust                                   ; $02ee: $21 $4a $c0
	ld   (hl), a                                     ; $02f1: $77

+
// 2nd byte's bit 4 in $c090
	ld   hl, wSecondRoomStructByte
	ld   a, (hl)
	and  $10
// has to do with oam
	ld   hl, wIsPlatformingLikeRoom
	ld   (hl), a

// 2nd byte's low nybble x2 in wTilesetIdx
	ld   hl, wSecondRoomStructByte
	ld   a, (hl)
	and  $0f
	sla  a
	ld   hl, wTilesetIdx
	ld   (hl), a
	ld   c, a
	ld   b, $00
.rept 5
	sla  c
	rl   b
.endr
// lower nybble * $40
	ld   hl, tileTypeConversionTable
	add  hl, bc
	push hl
	pop  bc
	ld   hl, wAddrOfRooms40hTileTypeConversionTable
	ld   (hl), c
	inc  hl
	ld   (hl), b

	ld   hl, wSecondRoomStructByte
	ld   a, (hl)
	and  $20
	jr   z, @afterLampOnPalettes

// 2nd byte's bit 5 is set
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wBGPwhenLampOn
	ld   (hl), a

	inc  de
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wBGPwhenLampOn+1
	ld   (hl), a

	inc  de
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wOBP0whenLampOn
	ld   (hl), a

	inc  de
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wOBP0whenLampOn+1
	ld   (hl), a
	inc  de

@afterLampOnPalettes:
// (word in $c006) + de -> $c075 and $c008
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wRoomCompressedLayoutAddr
	ld   (hl), a
	ld   hl, wCompressedLayoutCurrByteAddr
	ld   (hl), a

// (word in $c006) + de + 1 -> $c076 and $c009
	inc  de
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wRoomCompressedLayoutAddr+1
	ld   (hl), a
	ld   hl, wCompressedLayoutCurrByteAddr+1
	ld   (hl), a

// c007/6 and c0b6/5 = current addr in room struct
	inc  de
	ld   a, e
	ld   hl, wCurrRoomStructPointer
	add  (hl)
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr
	ld   (hl), a
	ld   hl, wCurrRoomStructPointerAfterCompressedLayout
	ld   (hl), a
	ld   hl, wCurrRoomStructPointerAfterCompressedLayout+1
	ld   a, (hl)
	adc  $00
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr+1
	ld   (hl), a
	ld   hl, wCurrRoomStructPointerAfterCompressedLayout+1
	ld   (hl), a

// offset back to 0
	ld   de, $0000
	ld   hl, wFirstRoomStructByte
	ld   a, (hl)
	and  $20
	jr   z, @after1stByteBit5check

// first struct byte bit 5 set
	ld   a, <@terminator
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr
	ld   (hl), a
	ld   a, >@terminator
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr+1
	ld   (hl), a
	jp   @afterBytePattern

@terminator:
	.db $ff  // no entrances to process

@after1stByteBit5check:
// first struct byte bit 5 not set
-
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	cp   $ff
	jr   z, @noMoreEntrances

	ld   a, e
	add  $07
	ld   e, a
	jp   -

@noMoreEntrances:
// c006/7 now at byte after previous byte pattern
// store pointer to npc data
	inc  de
	ld   a, e
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr
	add  (hl)
	ld   hl, wCurrRoomStructPointerNPCData
	ld   (hl), a
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr+1
	ld   a, (hl)
	adc  $00
	ld   hl, wCurrRoomStructPointerNPCData+1
	ld   (hl), a

; ==============================================================================
; Decompressing layout
; ==============================================================================
@afterBytePattern:
	ld   bc, $0000

@keepFilling2x2TileData:
// if at next row, set current compressed byte to $ff
	ld   a, c
	and  $0f
	jr   nz, +

	ld   a, $ff
	ld   hl, wCurrCompressedByteProcessed
	ld   (hl), a

+
// looking at bank 2 for the 1st screen
	ld   de, $0000
	ld   hl, wCompressedLayoutCurrByteAddr
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
// lower 2 bytes+1 into $c00e
	ld   a, (hl)
	and  $03
	ld   hl, wTimesToCopyDecompressedTile
	ld   (hl), a
	inc  (hl)
// $c008 is word location of tile to decompress
	ld   hl, wCompressedLayoutCurrByteAddr
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
// upper 6 bits into c028
	ld   a, (hl)
	and  $fc
	ld   hl, wCurrDecompressedTile
	ld   (hl), a

	ld   hl, wTileLayoutDataBank
	ld   a, (hl)
	call convertCurrTileToTileType

	ld   hl, wByteForOther2x2block
	ld   (hl), e
	ld   hl, wCurrDecompressedTile
	ld   a, (hl)

// is byte we are decompressing, same as last?
	ld   hl, wCurrCompressedByteProcessed
	cp   (hl)
	jr   nz, +

// if so, lay out 4 times the normal count
	ld   hl, wTimesToCopyDecompressedTile
	sla  (hl)
	sla  (hl)

+
// either way, set this as the current byte being processed
	ld   hl, wCurrCompressedByteProcessed
	ld   (hl), a

// loop below is $c00e times
	ld   hl, wTimesToCopyDecompressedTile
	ld   e, (hl)
	ld   d, $00
-
// c028 is current tile considered in decompression?
	ld   hl, wCurrDecompressedTile
	ld   a, (hl)
	ld   hl, w2x2gameScreenTiles
	add  hl, bc
	ld   (hl), a
	ld   hl, wByteForOther2x2block
	ld   a, (hl)
	ld   hl, w2x2tileTypes
	add  hl, bc
	ld   (hl), a
	inc  bc

	dec  de
	ld   a, e
	or   d
	jr   nz, -

// $c009/$c008 += 1
	ld   hl, wCompressedLayoutCurrByteAddr
	ld   a, (hl)
	add  <$0001
	ld   (hl), a
	ld   hl, wCompressedLayoutCurrByteAddr+1
	ld   a, (hl)
	adc  >$0001
	ld   (hl), a

	ld   a, c
	cp   $b0
	jp   c, @keepFilling2x2TileData

// after loading compressed layout data
// store that address in c009/c008 again
	ld   hl, wRoomCompressedLayoutAddr
	ld   a, (hl)
	ld   hl, wCompressedLayoutCurrByteAddr
	ld   (hl), a
	ld   hl, wRoomCompressedLayoutAddr+1
	ld   a, (hl)
	ld   hl, wCompressedLayoutCurrByteAddr+1
	ld   (hl), a

; ==============================================================================
; Storing offsets into compressed rows
; ==============================================================================
// similar to loading the compressed room layout data
	ld   de, $0000
	ld   bc, $0000

@checkNextCompressedRowOffset:
// store offset of 1st compressed byte per row
	ld   hl, wOffsetIntoCompressedRoomLayoutPerScreenRow
	add  hl, bc
	ld   (hl), e
	inc  bc
	ld   a, c
	cp   $0b
	jr   z, @afterStoringCompressedRowOffsets

	ld   a, $ff
	ld   hl, wCurrCompressedByteProcessed
	ld   (hl), a
	ld   a, $00
	ld   hl, wOffsetIntoCompressedRoomLayoutPerScreenRow
	add  hl, bc
	ld   (hl), a

@stillCheckingCurrentRow:
// low 2 bits of compressed byte into $c00b and + 1
	ld   hl, wCompressedLayoutCurrByteAddr
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	and  $03
	ld   hl, wCountByteForCurrCompressedByte
	ld   (hl), a
	inc  (hl)

// check upper 6 bits are equal to upper 6 bits
	ld   hl, wCompressedLayoutCurrByteAddr
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	inc  de
	and  $fc
	ld   hl, wCurrCompressedByteProcessed
	cp   (hl)
	jr   nz, +

// if same, multiply c00b by 4
	ld   hl, wCountByteForCurrCompressedByte
	sla  (hl)
	sla  (hl)

+
// set curr byte
	ld   hl, wCurrCompressedByteProcessed
	ld   (hl), a

// add the count byte (reuse $c5e0, it is re-written over at bigLoop)
	ld   hl, wCountByteForCurrCompressedByte
	ld   a, (hl)
	ld   hl, wOffsetIntoCompressedRoomLayoutPerScreenRow
// bc inc'ed every big loop (when on new row)
	add  hl, bc
	add  (hl)
	ld   (hl), a
	cp   $10
	jr   c, @stillCheckingCurrentRow

	jp   @checkNextCompressedRowOffset

@afterStoringCompressedRowOffsets:
// save c007/6 (pointing at npc byte pattern after address to compressed tiles)
	ld   hl, wCurrRoomStructPointerNPCData+1
	ld   a, (hl)
	push af
	ld   hl, wCurrRoomStructPointerNPCData
	ld   a, (hl)
	push af

; ==============================================================================
; Counting room flag item tiles
; ==============================================================================
// c0fc to be count of values between 3 and 9 in other 2x2 block
	ld   bc, $0000
	ld   hl, wNumRoomFlagObjects
	ld   (hl), c

@loopCountingRoomFlagObjects:
	ld   hl, w2x2tileTypes
	add  hl, bc
	ld   a, (hl)
	cp   $10
	jr   nc, +

	cp   $03
	jr   c, +

// other 2x2 block value is between 3 and 9
	call incPositiveNumRoomFlagObjects

+
	inc  bc
	ld   a, c
	cp   $b0
	jr   nz, @loopCountingRoomFlagObjects

// count up the number of room flag objects, hidden items or npcs
	ld   de, $0000
	ld   hl, wDoneProcessingHiddenItems
	ld   (hl), e
	ld   hl, wFirstRoomStructByte
	ld   a, (hl)
	and  $10
	jr   nz, @checkDone

@loopCheckForMoreRoomFlagObjects:
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	cp   $ff
	jr   z, @nextByteCheckDone

	call incPositiveNumRoomFlagObjects
	ld   a, $02
	ld   hl, wNumBytesForRoomFlagEntity
	ld   (hl), a
	ld   hl, wDoneProcessingHiddenItems
	ld   a, (hl)
	cp   $00
	jr   z, @afterNPCbit7check

// 3 bytes per npc
	ld   hl, wNumBytesForRoomFlagEntity
	inc  (hl)

// check 2nd byte of npc (normally bit 7 is set)
	inc  de
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	dec  de
	and  $80
	bit  7, a
	jr   nz, @afterNPCbit7check

// npc takes up another room flag if its bit 7 is unset
	ld   hl, wNumBytesForRoomFlagEntity
	inc  (hl)

@afterNPCbit7check:
// de = e + val in c0a0
	ld   a, e
	ld   hl, wNumBytesForRoomFlagEntity
	add  (hl)
	ld   e, a
	ld   d, $00
	jr   nc, @loopCheckForMoreRoomFlagObjects

// if addr offset loops to 0, inc pointer high byte
	ld   hl, wCurrRoomStructPointerNPCData+1
	inc  (hl)
	jp   @loopCheckForMoreRoomFlagObjects

@nextByteCheckDone:
	inc  de

@checkDone:
	ld   hl, wDoneProcessingHiddenItems
	ld   a, (hl)
	cp   $00
	jr   nz, +

	ld   (hl), $01
	ld   hl, wFirstRoomStructByte
	ld   a, (hl)
	and  $08
	jr   z, @loopCheckForMoreRoomFlagObjects

+

; ==============================================================================
; Storing room flags
; ==============================================================================
// func is in bank 1
	ld   hl, $0001
	ld   (hl), a

// save the entry of curr room's flags, and repurpose c0fc from here on
	call getRoomIdxWithinAllRooms
	call createEntryForRoomInRoomFlagsIfNeeded
	ld   hl, wCurrRoomFlagDataByte
	ld   (hl), c

// back to tile layout data bank
	ld   hl, wTileLayoutDataBank
	ld   l, (hl)
	ld   h, $00
	ld   (hl), a

// c007/6 back to address pointing to npc bytes
	pop  af
	ld   hl, wCurrRoomStructPointerNPCData
	ld   (hl), a
	pop  af
	ld   hl, wCurrRoomStructPointerNPCData+1
	ld   (hl), a

; ==============================================================================
; Hidden items
; ==============================================================================
	ld   de, $0000
	ld   hl, wRoomFlagIdxToCheck
	ld   (hl), e
	ld   hl, wFirstRoomStructByte
	ld   a, (hl)
	and  $10
// jump if no hidden items
	jr   nz, @noHiddenItems

@nextHiddenItem:
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	cp   $ff
	jr   z, @noMoreHiddenItems

	call retCFifRoomFlagSet
	jr   c, @skipHiddenItem

// npc should be present
// c00c is npc ID
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wHiddenItemID
	ld   (hl), a

	push de
// bc is upper nybble of 2nd npc byte (x val)
	inc  de
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	call aDivEqu16
	ld   c, a
	ld   b, $00

// de is lower nybble of 2nd npc byte (y val)
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	and  $0f
	ld   e, a
	ld   d, $00

// set id later in func
	ld   hl, wHiddenItemID
	ld   a, (hl)
	call storeHiddenItemAttrs
	pop  de

@skipHiddenItem:
	inc  de
	inc  de
	call incPositiveNumRoomFlagObjects
	jp   @nextHiddenItem

@noMoreHiddenItems:
	inc  de

@noHiddenItems:
// skip past hidden items to npcs
	ld   a, e
	ld   hl, wCurrRoomStructPointerNPCData
	add  (hl)
	ld   (hl), a
	jr   nc, +

	ld   hl, wCurrRoomStructPointerNPCData+1
	inc  (hl)

+

; ==============================================================================
; Load NPCs
; ==============================================================================
// actually load the npcs
	ld   de, $0000
	ld   bc, $0000
	ld   hl, wFirstRoomStructByte
	ld   a, (hl)
	and  $08
	jp   nz, @noNPCsToLoad

@nextNPCtoLoad:
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	cp   $ff
	jp   z, @noNPCsToLoad

// only load up to 12 npcs
	ld   a, c
	cp   NUM_NPCS
	jp   nc, @noNPCsToLoad

	call retCFifRoomFlagSet
	jr   nc, ++

// room flag set (so dont load?)
	inc  de
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	bit  7, a
	jr   nz, +

	inc  de

+
	inc  de
	inc  de
	jp   @gotoNextNPCtoLoad

++
// npc 1st byte is max $f5
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	cp   $f6
	jr   c, +

	ld   a, $00

+
// store NPC 1st byte into cb30
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   (hl), a
	inc  de

// get 2nd byte
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	inc  de

// lower 6 bits into cb84 region
	push af
	and  $3f
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   (hl), a

// 3rd byte into cb3c region
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   (hl), a
	inc  de

// 4th byte into cb48 region
	ld   hl, wCurrRoomStructPointerNPCData
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   (hl), a
	inc  de
	pop  af

// check 2nd NPC byte bit 7
// if not set, this is a 3 byte NPC, with 3rd byte containing x/y in nybbles
	push af
	bit  7, a
	jr   z, +

// get npc 3rd byte
	dec  de
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	push af
// put lower nybble in upper nybble, and store in cb48
	and  $0f
	sla  a
	sla  a
	sla  a
	sla  a
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   (hl), a
// put upper nybble in cb3c
	pop  af
	and  $f0
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   (hl), a

+
// check NPC 2nd byte bit 6
	pop  af
	and  $40
	jr   z, +

// if set, adjust cb48 by 8 (lower NPC by 8 pixels down?)
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   a, (hl)
	add  $08
	ld   (hl), a

+
// copy c0fc into npc's room flag idx
	ld   hl, wNumRoomFlagObjects
	ld   a, (hl)
	ld   hl, wNPCBytes_roomFlagIdx
	add  hl, bc
	ld   (hl), a
	inc  bc

@gotoNextNPCtoLoad:
	call incPositiveNumRoomFlagObjects
	jp   @nextNPCtoLoad

@noNPCsToLoad:
// fill the rest of npc 1st byte with $ff to not process them
-
	ld   a, c
	cp   NUM_NPCS
	jp   nc, +

	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   (hl), $ff
	inc  bc
	jp   -

+

; ==============================================================================
; Clearing item tiles when room flag set
; ==============================================================================
// de is row (11 rows)
	ld   de, $0000
@hideGottenTiles_nextRow:

// bc is col (32 cols)
	ld   bc, $0000
@hideGottenTiles_nextTile:
	call store16ePlusCin_c01e

// curr col in c0a0
	ld   hl, wCurrColForClearingItemTiles
	ld   (hl), c

// get tile type at location
	ld   hl, wECbyte
	ld   c, (hl)
	ld   b, $00
	ld   hl, w2x2tileTypes
	add  hl, bc
	ld   a, (hl)

// get col in bc
	ld   hl, wCurrColForClearingItemTiles
	ld   c, (hl)
	ld   b, $00
	cp   $27
	jr   nz, +

// if tile type is 27h, jump (covered by next anyway)
	jp   @hideGottenTiles_toNextTile

+
// if tile type not between 3 and 9, go to next tile
	cp   $10
	jr   nc, @hideGottenTiles_toNextTile

	cp   $03
	jr   c, @hideGottenTiles_toNextTile

	push af
	call retCFifRoomFlagSet
	jr   nc, @hideGottenTiles_roomFlagNotSet

// room flag set, proceed to hide tile
	pop  af
	ld   a, c

	push af
// tile type in bc
	ld   hl, wECbyte
	ld   c, (hl)
	ld   b, $00
// zero it out
	ld   a, $00
	ld   hl, w2x2tileTypes
	add  hl, bc
	ld   (hl), a
// set base game screen tiles
	ld   hl, wBaseRoomFloorTile
	ld   a, (hl)
	ld   hl, w2x2gameScreenTiles
	add  hl, bc
	ld   (hl), a
	pop  af

// inc still to keep the same flag idx, restore bc (current col)
	ld   c, a
	ld   b, $00
	jp   @incRoomFlagObjects_toNextTile

@hideGottenTiles_roomFlagNotSet:
	pop  af
	call storeHiddenItemAttrs

@incRoomFlagObjects_toNextTile:
	call incPositiveNumRoomFlagObjects

@hideGottenTiles_toNextTile:
	inc  bc
	ld   a, c
	cp   $10
	jr   c, @hideGottenTiles_nextTile

	inc  de
	ld   a, e
	cp   $0b
	jr   c, @hideGottenTiles_nextRow

; ==============================================================================
; Falling objects, and...
; ==============================================================================
// clear c660-c662
	ld   bc, $0003                                   ; $0716: $01 $03 $00
	ld   a, $00                                      ; $0719: $3e $00
-
	dec  bc                                          ; $071b: $0b
	ld   hl, wFallingObjectID                                   ; $071c: $21 $60 $c6
	add  hl, bc                                      ; $071f: $09
	ld   (hl), a                                     ; $0720: $77
	jr   nz, -                             ; $0721: $20 $f8

// clear c07d, back to bank 0
	ld   hl, $c07d                                   ; $0723: $21 $7d $c0
	ld   (hl), a                                     ; $0726: $77

	ld   hl, $0000
	ld   (hl), a
	ret


// called from above room struct loading function
retCFifRoomFlagSet:
	push bc
	call getRoomFlagByteAndAddrOffsetInABC
	ld   hl, wRoomFlags
	add  hl, bc
	and  (hl)
	cp   $01
// room flag not set, carry flag is set
	ccf
	pop  bc
	ret


incPositiveNumRoomFlagObjects:
	ld   hl, wNumRoomFlagObjects
	inc  (hl)
	res  7, (hl)
	ret


bitTable:
	.db $01 $02 $04 $08 $10 $20 $40 $80


getRoomFlagByteAndAddrOffsetInABC:
// low 3 bits of c0fc go into returned a
// (value to check against room flags?)
	ld   hl, wRoomFlagIdxToCheck
	ld   a, (hl)
	and  $07
	ld   c, a
	ld   b, $00
	ld   hl, bitTable
	add  hl, bc
	ld   a, (hl)

	push af
// upper 5 bits of c0fc, add to (c0fd), put into c
// byte checked against above, to see if room flag set?
	ld   hl, wRoomFlagIdxToCheck
	ld   a, (hl)
	srl  a
	srl  a
	srl  a
	ld   hl, wCurrRoomFlagDataByte
	add  (hl)
	ld   c, a
	ld   b, $00
	pop  af
	ret


convertCurrTileToTileType:
	push af
// bank 2
	ld   hl, $0002
	ld   (hl), a
// de = (c028 - address of layout data) // 4
	ld   hl, wCurrDecompressedTile
	ld   a, (hl)
	srl  a
	srl  a
	ld   e, a
	ld   d, $00
// word in $c091 + layout data byte in de, store in
	ld   hl, wAddrOfRooms40hTileTypeConversionTable
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   e, (hl)
	ld   d, $00
	pop  af
	ld   l, a
	ld   h, $00
	ld   (hl), a
	ret


Call_000_078b:
	push de
	push bc

// working on compressed layout data
	ld   hl, wTileLayoutDataBank
	ld   l, (hl)
	ld   h, $00
	ld   (hl), a

// de is offset into compressed layout, row idxed orig de
	ld   hl, wOffsetIntoCompressedRoomLayoutPerScreenRow                                   ; $0794: $21 $e0 $c5
	add  hl, de                                      ; $0797: $19
	ld   a, (hl)                                     ; $0798: $7e
	ld   e, a                                        ; $0799: $5f
	ld   d, $00                                      ; $079a: $16 $00

//
	ld   a, $00                                      ; $079c: $3e $00
	ld   hl, $c0a1                                   ; $079e: $21 $a1 $c0
	ld   (hl), a                                     ; $07a1: $77
	ld   a, $ff                                      ; $07a2: $3e $ff
	ld   hl, $c0a2                                   ; $07a4: $21 $a2 $c0
	ld   (hl), a                                     ; $07a7: $77

@loop:
// get compressed bytes for current row
	ld   hl, wRoomCompressedLayoutAddr                                   ; $07a8: $21 $75 $c0
	ldi  a, (hl)                                     ; $07ab: $2a
	ld   h, (hl)                                     ; $07ac: $66
	ld   l, a                                        ; $07ad: $6f
	add  hl, de                                      ; $07ae: $19

// get count of tiles and push
	ld   a, (hl)                                     ; $07af: $7e
	and  $03                                         ; $07b0: $e6 $03
	add  $01                                         ; $07b2: $c6 $01
	push af                                          ; $07b4: $f5

// get tile idx, and compare with last seen tile idx
	ld   a, (hl)                                     ; $07b5: $7e
	and  $fc                                         ; $07b6: $e6 $fc
	ld   b, a                                        ; $07b8: $47
	ld   hl, $c0a2                                   ; $07b9: $21 $a2 $c0
	cp   (hl)                                        ; $07bc: $be
	jr   nz, +                             ; $07bd: $20 $07

// if same as last tile, *= 4, and push
	pop  af                                          ; $07bf: $f1
	sla  a                                           ; $07c0: $cb $27
	sla  a                                           ; $07c2: $cb $27
	push af                                          ; $07c4: $f5

// last tile seen is b?
	ld   a, b                                        ; $07c5: $78

+
	ld   hl, $c0a2                                   ; $07c6: $21 $a2 $c0
	ld   (hl), a                                     ; $07c9: $77

// popped af is count of tiles
// c0a1 = c0a1-1+count of tiles (eg sum duplicated tiles)
	pop  af                                          ; $07ca: $f1
	ld   hl, $c0a1                                   ; $07cb: $21 $a1 $c0
	dec  (hl)                                        ; $07ce: $35
	add  (hl)                                        ; $07cf: $86
	ld   (hl), a                                     ; $07d0: $77

// only do up to c
	cp   c                                           ; $07d1: $b9
	jr   nc, @genericVramCopyTileIdxEquB                             ; $07d2: $30 $08

// include non-dupe tile
	ld   hl, $c0a1                                   ; $07d4: $21 $a1 $c0
	inc  (hl)                                        ; $07d7: $34
	inc  de                                          ; $07d8: $13
	jp   @loop                               ; $07d9: $c3 $a8 $07

@genericVramCopyTileIdxEquB:
	ld   a, b                                        ; $07dc: $78
	ld   hl, wGenericVramCopyTileIdx                                   ; $07dd: $21 $28 $c0
	ld   (hl), a                                     ; $07e0: $77
	ld   a, $00                                      ; $07e1: $3e $00

	call convertCurrTileToTileType
	ld   a, e
	cp   $00
	jr   z, +

// for tile type 0, vram copy base floor tile specified
	ld   hl, wBaseRoomFloorTile
	ld   a, (hl)
	ld   hl, wGenericVramCopyTileIdx
	ld   (hl), a

+
// back to bank 0
	ld   hl, $0000
	ld   (hl), a
	pop  bc
	pop  de
	ret


aDivEqu16:
	srl  a
	srl  a
	srl  a
	srl  a
	ret


ecEquEtimesC:
// c0a0/2 into ec
// clear c0a1
	ld   hl, wEbits
	ld   (hl), e
	ld   hl, wOrigC
	ld   (hl), c
	ld   a, $00
	ld   hl, wHighByteOfProduct
	ld   (hl), a

	ld   bc, $0008
@loop:
// shift left word, c0a1 / a
	sla  a
	ld   hl, wHighByteOfProduct
	rl   (hl)

// if bit set in c0a0 (orig e)...
	ld   hl, wEbits
	sla  (hl)
	jr   nc, +

// a += orig c
	ld   hl, wOrigC
	add  (hl)
	jr   nc, +

// because it's a word, if a carry found, c0a1 += 1
	ld   hl, wHighByteOfProduct
	inc  (hl)

+
// loop bc, preserve a
	ld   l, a
	dec  bc
	ld   a, c
	or   b
	ld   a, l
	jr   nz, @loop

// c from a is part of algo bits shifting in
// e is c0a1
// ec is the word c0a1/a (e*c)
	ld   c, a
	ld   b, $00
	ld   hl, wHighByteOfProduct
	ld   e, (hl)
	ld   d, $00
	ret


ecPlusEquA:
	add  c
	ld   c, a
	ld   a, e
	adc  $00
	ld   e, a
	ret


bcDivA_divInC_modInAB:
	push de
	push hl
	ld   d, a
	ld   a, b
	ld   e, $08

// a in d, b in a
// if word is ac, ac *= 2
// if bit carried from a, or a >= d, a -= d, c += 1
@nextBit:
	sla  c
	rl   a
	jr   c, +

	cp   d
	jr   c, ++

+
	sub  d
	inc  c

++
	dec  e
	jr   nz, @nextBit

	ld   b, a
	pop  hl
	pop  de
	ret


storeHiddenItemAttrs:
// eg c is column when clearing gotten tiles
// pushed af here is a value from 3-9
	push af
	ld   hl, wHiddenItemCol
	ld   (hl), c

// loop through to fill next slot
	ld   bc, $0000
-
	ld   hl, wRoomFlagItemTypes
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   z, @processItem

	inc  bc
	ld   a, c
	cp   NUM_ROOM_FLAG_ITEMS
	jr   c, -

	pop  af
	jp   @done

@processItem:
// eg c496+ is tile idx for item tile (3-9)
	pop  af
	ld   hl, wRoomFlagItemTypes
	add  hl, bc
	ld   (hl), a

// convert 3-9 idx into a 2x2 tile idx
	call getTileIdxForGenericVramCopy
	ld   hl, wGenericVramCopyTileIdx
	ld   a, (hl)
	ld   hl, wRoomFlagItemTileIdx
	add  hl, bc
	ld   (hl), a

// set x val
	ld   hl, wHiddenItemCol
	ld   a, (hl)
	ld   hl, wRoomFlagTileCol
	add  hl, bc
	ld   (hl), a

// set y val
	ld   a, e
	ld   hl, wRoomFlagTileRow
	add  hl, bc
	ld   (hl), a

// room flag is set, store its idx here
	ld   hl, wRoomFlagIdxToCheck
	ld   a, (hl)
	ld   hl, wRoomFlagItemFlagIdx
	add  hl, bc
	ld   (hl), a

// possibly unused? stores num actual room flag items
	inc  bc
	ld   hl, wNextRoomFlagItemIdx
	ld   (hl), c

@done:
// restore bc
	ld   hl, wHiddenItemCol
	ld   c, (hl)
	ld   b, $00
	ret


genericVramTileIdxes:
	.db $00 $ff $ff $98 $d8 $d4 $c4 $80 $ff $d0 $40 $dc $ff $ff $e4 $c0
	.db $7c $7c $ff $ff $fc $7c $7c $fc $e0 $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $c8 $ff $ff $ff $28 $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $01 $05 $09 $0d $11 $15 $19 $1d $21 $b5 $b9 $bd $91 $95 $99

getTileIdxForGenericVramCopy:
// should be npc ID
	push bc
	push af
	ld   c, a
	ld   b, $00
	ld   hl, genericVramTileIdxes
	add  hl, bc
	ld   a, (hl)
	ld   hl, wGenericVramCopyTileIdx
	ld   (hl), a
	pop  af
	pop  bc
	ret


store16ePlusCin_c01e:
	push af
	ld   a, e
// a *= 16
	sla  a
	sla  a
	sla  a
	sla  a
	add  c
	ld   hl, wECbyte
	ld   (hl), a
	pop  af
	ret
