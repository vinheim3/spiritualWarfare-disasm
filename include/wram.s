; ========================================================================================
; Bank 0
; ========================================================================================

.ramsection "RAM 0" bank 0 slot 1

// these 1st few wram bytes seem to be multi-purpose, ie unions
wc000:
	dsb 6

.union
	wCurrGroupStructPointer: ; $c006
		dw
.nextu
	wCurrGroupRoomStructPointers: ; $c006
		dw
.nextu
	wCurrRoomStructPointer: ; $c006
		dw
.nextu
	wCurrRoomStructPointerAfterCompressedLayout: ; $c006
		dw
.nextu
	wCurrRoomStructPointerNPCData: ; $c006
		dw
.nextu
	wScriptCmdIdxOffset: ; $c006
		db
.nextu
	wCurrFruitWramVarAmount: ; $c006
		db

	wNewFruitsAmount: ; $c007
		db
.endu

.union
	wRoomIdxFromGroup0: ; $c008
		dw

	wActualRoomGroup: ; $c00a
		db
.nextu
	wCompressedLayoutCurrByteAddr: ; $c008
		dw

	wCurrCompressedByteProcessed: ; $c00a
		db

	wByteForOther2x2block: ; $c00b
		db

	wc00c:
		dsb $e-$c

	wTimesToCopyDecompressedTile: ; $c00e
		db
.nextu
	wc008_2:
		dsb $b-8

	wCountByteForCurrCompressedByte: ; $c00b
		db
.nextu
	wc008_3:
		dsb $a-8

	wDoneProcessingPushableObjects: ; $c00a
		db
.nextu
	wc008_4:
		dsb $b-8

	wNumDataBytesForCurrRoomsFlags: ; $c00b
		db
.endu

wc00f:
	dsb $11-$f

wNPCTextBank: ; $c011
	db

wc012:
	dsb 6-2

wKeysPressed: ; $c016
	db

wc017:
	db

wNewKeysPressed: ; $c018
	db

wc019:
	dsb $f-$9

wNPCScriptOpcode: ; $c01f
	db

wNPCScriptParam1: ; $c020
	db

wNPCScriptParam2: ; $c021
	db

wNPCScriptParam3: ; $c022
	db

// bit 7 set means...
wBaseDamageTaken: ; $c023
	db

wc024:
	dsb 8-4

.union
	wCurrDecompressedTile: ; $c028
		db
.endu

wc029:
	dsb $b-9

wPlayerScore: ; $c02b
	dsb 6
wPlayerScoreLastDigit: ; $c031
	db

wc032:
	db

wCurrRoomGroup: ; $c033
	db

wCurrRoomX: ; $c034
	db

wCurrRoomY: ; $c035
	db

wCurrRoomGroupWidth: ; $c036
	db

wCurrRoomGroupHeight: ; $c037
	db

wRoomStructAddress: ; $c038
	dw

// 00 - right
// 03 - up
// 06 - down
// 09 - left
// 0c - different group
wRoomTransitionType: ; $c03a
	db

wNumBombs: ; $c03b
	db

wc03c:
	dsb $49-$3c

// 00 - vial bombs
// 01 - jawbone
// 02 - sword
wEquippedBItem: ; $c049
	db

wc04a:
	dsb $52-$4a

wPlayerX: ; $c052
	db

wc053:
	db

wPlayerY: ; $c054
	db

wc055:
	dsb $b-5

// $ff if on
wIsLampOn: ; $c05b
	db

wTileLayoutDataBank: ; $c05c
	db

// c05d - ff when transitioning out of room group (screen transition)
wc05d:
	dsb $61-$5d

wScrollingTextByteDone: ; $c061
	db

wScrollingTextByteAddr: ; $c062
	dw

wScrollingTextVramOffset: ; $c064
	dw

wc066:
	dsb 8-6

wScrollingTextBytesBank: ; $c068
	db

wc069:
	dsb $72-$69

// every 2 health is a heart
wPlayerHealth: ; $c072
	db

wPlayerMaxHealth: ; $c073
	db

wc074:
	db

wRoomCompressedLayoutAddr: ; $c075
	dw

wc077:
	dsb 9-7

// ie 4 or 0
wRoomStructByteWhenFirstByteBitSet2: ; $c079
	db

wc07a:
	dsb $90-$7a

wSecondRoomStructByteBit4: ; $c090
	db

wAddrOfRooms40hTableAt_02_4acd: ; $c091
	dw

wc093:
	db

wRandomNumberTableIdx: ; $c094
	dw

wRandomNumber: ; $c096
	db

wc097:
	dsb $a-7

.union
	wCommonByteCopyFuncSrc: ; $c09a
		dw
.endu

wc09c:
	dsb $a0-$9c

.union
	wSpecialItemsGottenByte: ; $c0a0
		db
.nextu
	// so when max health loop ends, it can fill the rest with 0's
	wCurrentHeartDrawn: ; $c0a0
		db
.nextu
	// for ecEquEtimesC
	wEbits: ; $c0a0
		db

	wHighByteOfProduct: ; $c0a1
		db

	wOrigC: ; $c0a2
		db
.nextu
	// for common byte copy function
	wCommonByteCopyFuncNumBytes: ; $c0a0
		db

	// for common byte copy function
	wCommonByteCopyFuncBank: ; $c0a1
		db
.nextu
	wModifiedDamageTaken: ; $c0a0
		db

	wDamageModifierParam: ; $c0a1
		db
.nextu
	wNumBytesForRoomFlagEntity: ; $c0a0
		db
.endu

wc0a3:
	dsb 6-3

wCurrNpcIdx: ; $c0a6
	db

wc0a7:
	dsb $b5-$a7

wBytePatternInRoomStructAfterlayoutAddr: ; $c0b5
	dw

wc0b7:
	dsb $b-$7

wScriptTeleGroup: ; $c0bb
	db

wScriptTeleRoomX: ; $c0bc
	db

wScriptTeleRoomY: ; $c0bd
	db

wScriptTelePlayerX: ; $c0be
	db

wScriptTelePlayerY: ; $c0bf
	db

wc0c0:
	dsb $d9-$c0

wCounterSo2ArmorIsAThirdDamageTaken: ; $c0d9
	db

wCurrGroupMapVRamOffset: ; $c0da
	dw

wc0dc:
	dsb $f9-$dc

wScrollingTextCurrRowVramStart: ; $c0f9
	dw

wc0fb:
	db

// used for other purposes?
.union
	wNumRoomFlagObjects: ; $c0fc
		db
.nextu
	wRoomFlagIdxToCheck: ; $c0fc
		db
.endu

wCurrRoomFlagDataByte: ; $c0fd
	db

wNumberOfRoomsInRoomFlags: ; $c0fe
	db

wLastRoomFlagsIdxPlus1: ; $c0ff
	db

wRoomFlags: ; $c100
	dsb $40

wc140:
	dsb $200-$140

wOam: ; $c200
	dsb $a0

wc2a0:
	dsb $300-$2a0

wAnother2x2blockForGameScreenTilesTODO: ; $c300
	dsb $b0

w2x2gameScreenTiles: ; $c3b0
	dsb $b0

wc460:
	dsb $dd-$60

// $ff if off
wIsMusicOff: ; $c4dd
	db

wc4de:
	dsb $5e0-$4de

wOffsetIntoCompressedRoomLayoutPerScreenRow: ; $c5e0
	dsb $b

wc5eb:
	dsb $f0-$eb

wBGPwhenLampOff: ; $c5f0
	dw

wOBP0whenLampOff: ; $c5f2
	dw

wBGPwhenLampOn: ; $c5f4
	dw

wOBP0whenLampOn: ; $c5f6
	dw

wc5f8:
	dsb $a-8

wNumKeys: ; $c5fa
	db

wc5fb:
	dsb $e-$b

wSecondRoomStructByteBit7: ; $c5fe
	db

wTilesetIdx: ; $c5ff
	db

wc600:
	dsb $48

// ie times 2 to get the double index for its item description
wInventoryItemSelectedIdx: ; $c648
	db

wPlayerName: ; $c649
	dsb 8

// bit 0/1 set - 1 anointing oil each
wAnointingOilsGotten: ; $c651
	db

// bit 0 - belt
// bit 1 - armour
// bit 2 - boots
// bit 3 - shield
// bit 4 - helm
// bit 5 - sword of the spirit
wArmorOfGodGotten: ; $c652
	db

// bit 0 set - got lamp for darkness
// bit 1 set - got jawbone
// bit 2 set - got raft
// bit 3 set - got railroad ticket
wSpecialBitemsGotten: ; $c653
	db

// TODO: unknown size
wItemsGotten:
	dsb $d0-$54

wCommonByteCopyDestBytes: ; $c6d0
	dsb $c

// seems to always be 0
wScreen0displayOffset: ; $c6dc
	db

// seems to always be 4
wScreen1displayOffset: ; $c6dd
	db

wc6de:
	dsb $708-$6de

wNumBirds: ; $c708
	db

// bit 0-2 of c709 is fruit 1
// bit 3-5 of c709 is fruit 2
// bit 0-2 of c70a is fruit 3
// bit 3-5 of c70a is fruit 4
// bit 0-2 of c70b is fruit 5
wFruitAmounts: ; $c709
	dsb 3

wFruitEquipped: ; $c70c
	db

wc70d:
	dsb $16-$d

wRoomGroupNameLine1: ; $c716
	dsb 7

wRoomGroupNameLine2: ; $c71d
	dsb 7

wCurrGroupStruct2ndLastWord: ; $c724
	dw

wCurrGroupStructLastWord: ; $c726
	dw

wCurrGroupStructByte1bh: ; $c728
	db

wc729:
	dsb $b-9

// bit 7 set - load BGP vals
// bit 6 set - load OBP0 vals
// bit 5 set - no entrances
// bit 4 set - no pushable objects
// bit 3 set - no npcs
// bit 2 loaded into c079, if set, next 2 bytes is a word, get data from it into c079
wFirstRoomStructByte: ; $c72b
	db

// bit 7 set
// bit 6 set
// bit 5 set - set palettes when lamp is on
// bit 4 set
wSecondRoomStructByte: ; $c72c
	db

wc72d:
	dsb $800-$72d

wSoundChannelA: ; $c800
	instanceof SoundChannel
wSoundChannelB: ; $c80d
	instanceof SoundChannel
wSoundChannelC: ; $c81a
	instanceof SoundChannel
wSoundChannelD: ; $c827
	instanceof SoundChannel
wSoundChannelE: ; $c834
	instanceof SoundChannel
wSoundChannelEnd:
	.db

wc841:
	dsb $50-$41

wGameScreenTiles: ; $c850
	dsb $2c0

wSCXvalue: ; $cb10
	db

wSCYvalue: ; $cb11
	db

// unused?
wcb12:
	dsb $30-$12

// NPC ID
wNPCBytes_ID: ; $cb30
	dsb NUM_NPCS

wNPC_xCoord: ; $cb3c
	dsb NUM_NPCS

wNPC_yCoord: ; $cb48
	dsb NUM_NPCS

wNPCBytes_cb54: ; $cb54
	dsb NUM_NPCS

wNPCBytes_cb60: ; $cb60
	dsb NUM_NPCS

wNPCBytes_cb6c: ; $cb6c
	dsb NUM_NPCS

wNPCBytes_cb78: ; $cb78
	dsb NUM_NPCS

// this whole byte uses upper nybble for some controls
// lower nybble is mostly direction
wNPC2ndByteLower6Bits: ; $cb84
	dsb NUM_NPCS

// the following combine to a word that contains the next script opcode
wNPCScriptPointerLowByte: ; $cb90
	dsb NUM_NPCS
wNPCScriptPointerHighByte: ; $cb9c
	dsb NUM_NPCS

wNPCBytes_cba8: ; $cba8
	dsb NUM_NPCS

wNPCBytes_scriptLoopCounter: ; $cbb4
	dsb NUM_NPCS

wNPCBytes_newID: ; $cbc0
	dsb NUM_NPCS

// used as a return point
wNPCScriptPointerReturnLowByte: ; $cbcc
	dsb NUM_NPCS
wNPCScriptPointerReturnHighByte: ; $cbd8
	dsb NUM_NPCS

wNPCBytes_cbe4: ; $cbe4
	dsb NUM_NPCS

wNPCBytes_cbf0: ; $cbf0
	dsb NUM_NPCS

wNPCScriptBytesBank: ; $cbfc
	dsb NUM_NPCS

.ends

; ========================================================================================
; Bank 1
; ========================================================================================

.ramsection "RAM 1" bank 1 slot 2

wLCDCvalue: ; $d000
	db

wd001:
	dsb 6-1

wCurrent2x2tileToVramTileIdxConversionTable: ; $d006
	dsb $40

wVramTileConversionTables: ; $d046
	dsb $40

wd086:
	dsb $fc-$86

wVBlanksPerTileAnimation: ; $d0fc
	db

wCurrVBlanksUntilNextTileAnimation: ; $d0fd
	db

wCurrTileAnimationAddr: ; $d0fe
	dw

wd100:
	dsb $fff-$100

wStackTop: ; $dfff
	db

.ends