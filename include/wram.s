; ========================================================================================
; Bank 0
; ========================================================================================

.ramsection "RAM 0" bank 0 slot 1

wInvItemCountsNumDigits: ; $c000
	db

// these 1st few wram bytes seem to be multi-purpose, ie unions
wc001:
	dsb 6-1

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
.nextu
	wNumGameOverScoreDigitsDrawn: ; $c006
		db
.nextu
	wQuizFaceOamTileAttr: ; $c006
		db
.nextu
	wParamWordForScriptDataCopy: ; $c006
		db
.nextu
	wCurrNPCoamDataAddr: ; $c006
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
		dsb 2

	wTimesToCopyDecompressedTile: ; $c00e
		db
.nextu
	wLastQuizCharCopiedToVram: ; $c008
		db

	wLastQuizCharForVramNonUnderscoreOrCaps: ; $c009
		db
.nextu
	wc008_1:
		db

	.union
		wSoundToPlayIdx: ; $c009
			db
	.nextu
		wScriptCopiedByte: ; $c009
			db

		wNumNonFFsRead: ; $c00a
			db
	.endu
.nextu
	wc008_2:
		dw

	.union
		wDoneProcessingHiddenItems: ; $c00a
			db
	.nextu
		wNextQuizQuestionIdx: ; $c00a
			db

		wc00b:
			dsb $d-$b

		wQuizCurrTextVramAddr: ; $c00d
			dw
	.endu
.nextu
	wc008_3:
		dsb 3

	.union
		wCountByteForCurrCompressedByte: ; $c00b
			db
	.nextu
		wNumDataBytesForCurrRoomsFlags: ; $c00b
			db
	.nextu
		wTimeUntilMenuInputProcessable: ; $c00b
			db

		wMenuOptionButtonsPressed: ; $c00c
			db
	.endu
.endu

wc00f:
	dsb $11-$f

wNPCTextBank: ; $c011
	db

wc012:
	dsb 4-2

wMainLoopCounter: ; $c014
	db

// Unused?
wc015:
	db

wKeysPressed: ; $c016
	db

wc017:
	db

wNewKeysPressed: ; $c018
	db

wInventoryLastBItemHoveredOver: ; $c019
	db

wc01a:
	dsb $f-$a

.union
	wNPCScriptOpcode: ; $c01f
		db

	wNPCScriptParam1: ; $c020
		db

	wNPCScriptParam2: ; $c021
		db

	wNPCScriptParam3: ; $c022
		db
.nextu
	wNumIncorrectQuestions: ; $c01f
		db

	wQuizQuestionIdx: ; $c020
		db

	wNumQuestionsLeft: ; $c021
		db

	wPrizeCounter: ; $c022
		db
.endu

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
	dsb $46-$3c

wCurrFruitAmount: ; $c046
	db

wCurrFruitOnScreen: ; $c047
	db

wc048:
	db

// 00 - vial bombs
// 01 - jawbone
// 02 - sword
wEquippedBItem: ; $c049
	db

wc04a:
	dsb $c-$a

wIsEquippingRaft: ; $c04c
	db

wc04d:
	db

wNextUsableOamIdx: ; $c04e
	db

wIsUsingRaft: ; $c04f
	db

wc050:
	dsb 2-0

wPlayerX: ; $c052
	db

wc053:
	db

wPlayerY: ; $c054
	db

wPlayerOamAttr: ; $c055
	db

wc056:
	db

// 0, 1 or 2, eg shows leg forward, or not
wPlayerAnimationIdx: ; $c057
	db

wc058:
	dsb $b-8

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
	dsb $8e-$7a

wCurrQuizQuestionAddr: ; $c08e
	dw

wIsPlatformingLikeRoom: ; $c090
	db

wAddrOfRooms40hTileTypeConversionTable: ; $c091
	dw

wc093:
	db

wRandomNumberTableIdx: ; $c094
	dw

wRandomNumber: ; $c096
	db

wGenericMenuCursorIdx: ; $c097
	db

wGenericMenuMaxCursorIdx: ; $c098
	db

wc099:
	db

.union
	wCommonByteCopyFuncSrc: ; $c09a
		dw
.nextu
	wSoundHWReg1stAddr: ; $c09a
		db
.endu

wNewSoundChannelFrequency: ; $c09c
	dw

wControlByteBit0AndHWReg: ; $c09e
	db

wc09f:
	dsb $a0-$9f

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
.nextu
	wc0a0_2:
		dsb 2

	wCurrMusicTestDigit: ; $c0a2
		db
.nextu
	wInvCountDigits: ; $c0a0
		dsb 3
.endu

wc0a3:
	dsb 6-3

wCurrNpcIdx: ; $c0a6
	db

wMusicScreenSongVal: ; $c0a7
	db

wc0a8:
	db

wMusicScreenSoundVal: ; $c0a9
	db

wc0aa:
	dsb $b1-$aa

wMenuCursorBaseOamY: ; $c0b1
	db

wc0b2:
	dsb 5-2

wBytePatternInRoomStructAfterlayoutAddr: ; $c0b5
	dw

wRoomCurrTeleportIdx: ; $c0b7
	db

wCurrTeleportsTileX: ; $c0b8
	db

wCurrTeleportsTileY: ; $c0b9
	db

wCurrTeleportsTileTrigger: ; $c0ba
	db

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
	dsb 4-0

wCorrectQuizAnswerIdx: ; $c0c4
	db

wc0c5:
	dsb $d9-$c5

wCounterSo2ArmorIsAThirdDamageTaken: ; $c0d9
	db

wCurrGroupMapVRamOffset: ; $c0da
	dw

wc0dc:
	dsb $f8-$dc

wIsSecretPlayerName: ; $c0f8
	db

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

w2x2tileTypes: ; $c300
	dsb $b0

w2x2gameScreenTiles: ; $c3b0
	dsb $b0

wc460:
	dsb $dd-$60

// $ff if off
wIsMusicOff: ; $c4dd
	db

wc4de:
	db

wCurrQuizQuestionIdx: ; $c4df
	db

wTextInputChars: ; $c4e0
	dsb $20

w500:
	dsb $e0

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
	db

wInvItemCountsDigitsVramAddr: ; $c5fc
	dw

wSecondRoomStructByteBit7: ; $c5fe
	db

wTilesetIdx: ; $c5ff
	db

wc600:
	dsb $48

// ie times 2 to get the double index for its item description
wInventorySelectedXIdx: ; $c648
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

// eg cause you cant tell which fruits you've already gotten
// from just the amounts variable
wItemsGotten: ; $c654
	dsb $a

wc65e:
	db

wInventorySelectedYIdx: ; $c65f
	db

wc660:
	dsb $d0-$60

wCommonByteCopyDestBytes: ; $c6d0
	dsb $c

// seems to always be 0
wScreen0displayOffset: ; $c6dc
	db

// seems to always be 4
wScreen1displayOffset: ; $c6dd
	db

wScreen0displayOffset2: ; $c6de
	db

wPlayerStartingDirection: ; $c6df
	db

wc6e0:
	dsb $708-$6e0

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
	dsb $11-$d

.union
	wMenuCursorIdx: ; $c711
		db
.nextu
	wPreviousUsingRaft: ; $c711
		db
.nextu
	wMusicScreenIsTwiceSpeed: ; $c711
		db
.endu

wc712:
	dsb 5-2

wLastReviveRoomGroup: ; $c715
	db

wRoomGroupNameLine1: ; $c716
	dsb 7

wRoomGroupNameLine2: ; $c71d
	dsb 7

wCurrGroupDefaultBGP: ; $c724
	dw

wCurrGroupDefaultOBP0: ; $c726
	dw

// unused?
wCurrGroupStructByte1bh: ; $c728
	db

wc729:
	db

wSoundIsTwiceSpeed: ; $c72a
	db

// bit 7 set - load BGP vals
// bit 6 set - load OBP0 vals
// bit 5 set - no entrances
// bit 4 set - no hidden items
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

// high nybble - damage
// low nybble - movement speed
wNPCBytes_damageAndMovementSpeed: ; $cb54
	dsb NUM_NPCS

wNPCBytes_cb60: ; $cb60
	dsb NUM_NPCS

// todo: a guess
wNPCBytes_animationFrameIdx: ; $cb6c
	dsb NUM_NPCS

wNPCBytes_timeToWait: ; $cb78
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

wNPCBytes_pixelsToMove: ; $cba8
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

wNPCBytes_roomFlagIdx: ; $cbf0
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
	db

// todo: just a guess
wCounterUntilMenuInputProcessable: ; $d002
	db

wOBP1FlashCounter: ; $d003
	db

wd004:
	dsb 6-4

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
	dsb $400-$100

wIsTitleScreen: ; $d400
	db

wd401:
	dsb $fff-$401

wStackTop: ; $dfff
	db

.ends