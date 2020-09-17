resetRoomFlagData:
	ld   a, $00
	ld   hl, wLastRoomFlagsIdxPlus1
	ld   (hl), a
	ld   hl, wNumberOfRoomsInRoomFlags
	ld   (hl), a
	ret


getRoomIdxWithinAllRooms:
// save the following 2
	ld   hl, wCurrRoomGroupWidth
	ld   a, (hl)
	push af
	ld   hl, wCurrRoomGroupHeight
	ld   a, (hl)
	push af
// room group into c00a
	ld   hl, wCurrRoomGroup
	ld   a, (hl)
	ld   hl, wActualRoomGroup
	ld   (hl), a
// clear c008 and c009
	ld   a, $00
	ld   hl, wRoomIdxFromGroup0
	ld   (hl), a
	ld   hl, wRoomIdxFromGroup0+1
	ld   (hl), a

// start at room group 0
	ld   hl, wCurrRoomGroup
	ld   (hl), a
-
	ld   hl, wCurrRoomGroup
	ld   a, (hl)
	ld   hl, wActualRoomGroup
	cp   (hl)
	jr   z, @nowAtActualCurrRoomGroup

// get size of earlier room groups, and add to c009/8
	ld   a, $01
	call call_b0_getCurrRoomGroupsWidthAndHeight
	ld   hl, wCurrRoomGroupWidth
	ld   c, (hl)
	ld   b, $00
	ld   hl, wCurrRoomGroupHeight
	ld   e, (hl)
	ld   d, $00
	call ecEquEtimesC
	call addECtoTotalRoomsFromRoom0
	ld   hl, wCurrRoomGroup
	inc  (hl)
	jp   -

@nowAtActualCurrRoomGroup:
// restore wCurrRoomGroup
	ld   hl, wActualRoomGroup
	ld   a, (hl)
	ld   hl, wCurrRoomGroup
	ld   (hl), a
// restore group height and width
	pop  af
	ld   hl, wCurrRoomGroupHeight
	ld   (hl), a
	pop  af
	ld   hl, wCurrRoomGroupWidth
	ld   (hl), a

// ec is idx of room within group
	ld   hl, wCurrRoomGroupWidth
	ld   c, (hl)
	ld   b, $00
	ld   hl, wCurrRoomY
	ld   e, (hl)
	ld   d, $00
	call ecEquEtimesC
	ld   hl, wCurrRoomX
	ld   a, (hl)
	call ecPlusEquA

addECtoTotalRoomsFromRoom0:
	ld   a, c
	ld   hl, wRoomIdxFromGroup0
	add  (hl)
	ld   (hl), a
	ld   a, e
	ld   hl, wRoomIdxFromGroup0+1
	adc  (hl)
	ld   (hl), a
	ret


createEntryForRoomInRoomFlagsIfNeeded:
	call checkRoomCurrentlyInRoomFlags
	jr   z, +

	call setupNewRoomInRoomFlagsStruct

+
// point to data byte
	inc  bc
	inc  bc
	ret


setRoomFlag:
	push bc
	call getRoomFlagByteAndAddrOffsetInABC
	ld   hl, wRoomFlags
	add  hl, bc
	or   (hl)
	ld   (hl), a
	pop  bc
	ret


checkRoomCurrentlyInRoomFlags:
// c008/9 is room idx within all rooms
	ld   bc, $0000
@bigLoop:
// c0ff - idx of last recorded room flags
	ld   hl, wLastRoomFlagsIdxPlus1
	ld   a, c
	cp   (hl)
	jr   z, @clearZflag

// compare c008/9 with each block of 3 bytes from c100
// the 3rd byte has the room flags
	ld   hl, wRoomFlags
	add  hl, bc
	ld   a, (hl)
	ld   hl, wRoomIdxFromGroup0
	cp   (hl)
	jr   nz, @notCurrentRoom

	ld   hl, wRoomFlags+1
	add  hl, bc
	ld   a, (hl)
	and  $0f
	ld   hl, wRoomIdxFromGroup0+1
	cp   (hl)
	jr   nz, @notCurrentRoom

// set z flag
	ret

@clearZflag:
	ld   a, $ff
	cp   $00
	ret

@notCurrentRoom:
// get higher nybble of room flags+1, previously ignored
	ld   hl, wRoomFlags+1
	add  hl, bc
	ld   a, (hl)
	call aDivEqu16

// bc is current index into c100
// c00b = upper nybble + 1
	ld   hl, wNumDataBytesForCurrRoomsFlags
	ld   (hl), a
	inc  (hl)
// bc += (upper nybble + 1) + 1 (start of next set of bytes)
	scf
	ld   a, c
	adc  (hl)
	ld   c, a
	ld   b, $00
	jp   @bigLoop


setupNewRoomInRoomFlagsStruct:
@bigLoop:
// round up to nearest multiple of 8 and divide by 8, store in c00b
	ld   hl, wNumRoomFlagObjects
	ld   a, (hl)
	add  $07
	srl  a
	srl  a
	srl  a
	ld   hl, wNumDataBytesForCurrRoomsFlags
	ld   (hl), a

// check number of unique rooms
	ld   hl, wNumberOfRoomsInRoomFlags
	ld   a, (hl)
	cp   MAX_ROOMS_IN_ROOM_FLAGS
	jr   c, @createEntryInRoomFlags

// once visited 10 unique rooms...
@shiftStructBackToMakeSpaceForNewRoom:
// get number of bytes of data the 1st store room takes up
	ld   hl, wRoomFlags+1
	ld   a, (hl)
	call aDivEqu16

// de is that number + 2
	add  $02
	ld   e, a
	ld   d, $00

// move everything back to make space for next room
	ld   bc, $0000
-
	ld   hl, wLastRoomFlagsIdxPlus1
	ld   a, e
	cp   (hl)
	jr   nc, +

	ld   hl, wRoomFlags
	add  hl, de
	ld   a, (hl)
	ld   hl, wRoomFlags
	add  hl, bc
	ld   (hl), a
	inc  bc
	inc  de
	jp   -

+
// num rooms used -= 1 now that we've cleared the 1st one off
	ld   hl, wLastRoomFlagsIdxPlus1
	ld   (hl), c
	ld   hl, wNumberOfRoomsInRoomFlags
	dec  (hl)

// sanity checks?
// big loop to create new entry in wRoomFlags
	bit  7, (hl)
	jr   z, @bigLoop

	call resetRoomFlagData
	jp   @bigLoop

@createEntryInRoomFlags:
	ld   a, MAX_BYTES_FOR_ROOM_FLAGS
	ld   hl, wLastRoomFlagsIdxPlus1
	sub  (hl)
	jr   c, @shiftStructBackToMakeSpaceForNewRoom

// continue here if next room flags idx to be used is <= $40
	sbc  $02
	jr   c, @shiftStructBackToMakeSpaceForNewRoom

// continue here if next room flags idx to be used is <= $3e
	ld   hl, wNumDataBytesForCurrRoomsFlags
	sbc  (hl)
	jr   c, @shiftStructBackToMakeSpaceForNewRoom

// continue here if next room flags idx to be used is
// <= $3e-(number of 8's the total interactible tiles can fit in)

// bc is next room flags idx to be used
	ld   hl, wLastRoomFlagsIdxPlus1
	ld   c, (hl)
	ld   b, $00

// store room idx into next idx (as a key for lookup later)
	ld   hl, wRoomIdxFromGroup0
	ld   a, (hl)
	ld   hl, wRoomFlags
	add  hl, bc
	ld   (hl), a

// next byte contains num bytes of flags as upper nybble, and upper byte of room idx as low nybble
	ld   hl, wNumDataBytesForCurrRoomsFlags
	ld   a, (hl)
	sla  a
	sla  a
	sla  a
	sla  a
	ld   hl, wRoomIdxFromGroup0+1
	or   (hl)
	ld   hl, wRoomFlags+1
	add  hl, bc
	ld   (hl), a

// bc at byte containing data for room
	inc  bc
	inc  bc

// de = number of bytes of data this takes up
	ld   hl, wNumDataBytesForCurrRoomsFlags
	ld   e, (hl)
	ld   d, $00
	ld   a, e
	cp   $00
	jr   z, +

// clear room flags de, starting offset bc (reserving space for this current room)
	ld   a, $00
-
	ld   hl, wRoomFlags
	add  hl, bc
	ld   (hl), a
	inc  bc
	dec  de
	ld   a, e
	or   d
	jr   nz, -

+
// update last room flags idx
	ld   a, c
	ld   hl, wLastRoomFlagsIdxPlus1
	ld   c, (hl)
	ld   b, $00
	ld   (hl), a

// inc c0fe
	ld   hl, wNumberOfRoomsInRoomFlags
	inc  (hl)
	ret