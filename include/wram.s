; ========================================================================================
; Bank 0
; ========================================================================================

.ramsection "RAM 0" bank 0 slot 1

wInvItemCountsNumDigits: ; $c000
	db

// these 1st few wram bytes seem to be multi-purpose, ie unions
wc001:
	dsb 4-1

wFruitFallingObjectCollisionAddr: ; $c004
	dw

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
.nextu
	wNewItemInitialX: ; $c006
		db

	wNewItemInitialY: ; $c007
		db
.nextu
	wClowNybble: ; $c006
		db

	wElowNybble: ; $c007
		db
.nextu
	wPwOrNameScreenArrowCursorX: ; $c006
		db
.nextu
	wCalcdPasswordSumVal: ; $c006
		dw
.nextu
	wNpcOamTileIdx: ; $c006
		db

	wNpcOamTileAttr: ; $c007
		db
.nextu
	wc006:
		db

	.union
		wBitemTileIdxLeft: ; $c007
			db
	.nextu
		wNpcPlayerXDiff: ; $c007
			db
	.endu
.endu

.union
	wNpcPlayerYDiff: ; $c008
		db
.nextu
	wBitemTileIdxRight: ; $c008
		db
.nextu
// copied to above
	wNpcOamTileAttr2: ; $c008
		db
.nextu
	wCalcdPasswordChecsum: ; $c008
		db
.nextu
	wChighNybble: ; $c008
		db

	wEhighNybble: ; $c009
		db
.nextu
	wNewItemInitialDir: ; $c008
		db

	wNewItemTypeBaseXoffset: ; $c009
		db

	wNewItemTypeDirXoffset: ; $c00a
		db

	wNewItemTypeDirYoffset: ; $c00b
		db
.nextu
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
.nextu
	wc008_4:
		dsb 4

	.union
		wGenericTile2x2_x: ; $c00c
			db

		wGenericTile2x2_y: ; $c00d
			db
	.nextu
		wHiddenItemID: ; $c00c
			db
	.nextu
		wHiddenItemCol: ; $c00c
			db
	.nextu
		wGenericColVal: ; $c00c
			db
	.nextu
		wTempFruitX: ; $c00c
			db
	.endu
.nextu
	wc008_5:
		dsb 5

	wJawboneOrSwordMoveOffset: ; $c00d
		db
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

wNpcTopLeftVramTile: ; $c017
	db

wNewKeysPressed: ; $c018
	db

wInventoryBitemXChange: ; $c019
	db

wc01a:
	dsb $e-$a

wECbyte: ; $c01e
	db

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

wCurrNpcMovingDir: ; $c024
	db

wPlayerInvincibilityCounter: ; $c025
	db

wc026:
	dsb 2

.union
	wCurrDecompressedTile: ; $c028
		db
.nextu
// not converted to vram idx, eg $2d = water
	wGenericVramCopyTileIdx: ; $c028
		db
.nextu
	wGenericGameScreenTileIdx: ; $c028
		db
.endu

// unused
w0whenStartingTitleScreen: ; $c029
	db

wc02a:
	db

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
	dsb $45-$3c

wCurrFruitTimeOnScreen: ; $c045
	db

wCurrFruitAmount: ; $c046
	db

wCurrFruitOnScreen: ; $c047
	db

wCurrFruitBaseSpeed: ; $c048
	db

// 00 - vial bombs
// 01 - jawbone
// 02 - sword
wEquippedBItem: ; $c049
	db

// ie allows player to stand in front of a building
wPlayerOrEntityYCollisionAdjust: ; $c04a
	db

wc04b:
	db

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

wPlayerIdxIntoGenericVramForTile: ; $c056
	db

// 0, 1 or 2, eg shows leg forward, or not
wPlayerAnimationIdx: ; $c057
	db

wIsGamePaused: ; $c058
	db

wTimeUntilFrozenStateEnds: ; $c059
	db

wc05a:
	db

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

wScrollingTextYStart: ; $c066
	db

wScrollingTextXStart: ; $c067
	db

wScrollingTextBytesBank: ; $c068
	db

wc069:
	dsb $e-9

// set from movement speed+1
wc06e: ; $c06e
	db

wc06f:
	dsb $72-$6f

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
wBaseRoomFloorTile: ; $c079
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

.union
	wGenericMenuCursorIdx: ; $c097
		db
.nextu
	wPasswordOrNameMaxChars: ; $c097
		db
.endu

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
.nextu
	wCurrColForClearingItemTiles: ; $c0a0
		db
.endu

wc0a3:
	dsb 6-3

wCurrNpcIdx: ; $c0a6
	db

.union
	wMusicScreenSongVal: ; $c0a7
		db

	wc0a8:
		db

	wMusicScreenSoundVal: ; $c0a9
		db
.nextu
	wItemTopBoundingBox: ; $c0a7
		db

	wItemBottomBoundingBox: ; $c0a8
		db

	wItemLeftBoundingBox: ; $c0a9
		db

	wItemRightBoundingBox: ; $c0aa
		db
.endu

wc0ab:
	dsb $b0-$ab

wTimeUntilCanUseFruitAgain: ; $c0b0
	db

wMenuCursorBaseOamY: ; $c0b1
	db

wc0b2:
	db

wCurrFruitBounced: ; $c0b3
	db

wc0b4:
	db

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

wPwOrNameCharSelectCursorIdx: ; $c0c0
	db

wOrigCurrFruitXval: ; $c0c1
	db

wc0c2:
	db

wOrigCurrFruitYval: ; $c0c3
	db

wCorrectQuizAnswerIdx: ; $c0c4
	db

wc0c5:
	db

// 0 is push A, 1/2 is the alternating text for the item
wInvChangingTextIdx: ; $c0c6
	db

wPwOrNameInputCursorIdx: ; $c0c7
	db

wc0c8:
	dsb $d6-$c8

// unused
wFFbeforeMainGame: ; $c0d6
	db

wc0d7:
	dsb 2

wCounterSo2ArmorIsAThirdDamageTaken: ; $c0d9
	db

wCurrGroupMapVRamOffset: ; $c0da
	dw

// fruit-related structs
wCurrentFruitTiles: ; $c0dc
	dsb NUM_FRUITS_ON_SCREEN
wCurrFruitXvals: ; $c0e0
	dsb NUM_FRUITS_ON_SCREEN
wCurrFruitYvals: ; $c0e4
	dsb NUM_FRUITS_ON_SCREEN
wCurrFruitDirs: ; $c0e8
	dsb NUM_FRUITS_ON_SCREEN
wCurrFruitOnScreenCounter: ; $c0ec
	dsb NUM_FRUITS_ON_SCREEN
wCurrFruitSpeeds: ; $c0f0
	dsb NUM_FRUITS_ON_SCREEN
wCurrFruitFlags: ; $c0f4
	dsb NUM_FRUITS_ON_SCREEN

wIsSecretPlayerName: ; $c0f8
	db

wScrollingTextCurrRowVramStart: ; $c0f9
	dw

// unused
w0whenButtonPressedOnTitleScreen: ; $c0fb
	db

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
	dsb $96-$60

// room flag items
wRoomFlagItemTypes: ; $c496
	dsb NUM_ROOM_FLAG_ITEMS
wRoomFlagTileCol: ; $c4a2
	dsb NUM_ROOM_FLAG_ITEMS
wRoomFlagTileRow: ; $c4ae
	dsb NUM_ROOM_FLAG_ITEMS
wRoomFlagItemTileIdx: ; $c4ba
	dsb NUM_ROOM_FLAG_ITEMS
wRoomFlagItemFlagIdx: ; $c4c6
	dsb NUM_ROOM_FLAG_ITEMS

wc4d2:
	dsb $d-2

// $ff if off
wIsMusicOff: ; $c4dd
	db

wc4de:
	db

wCurrQuizQuestionIdx: ; $c4df
	db

.union
	wTextInputChars: ; $c4e0
		dsb $20
.nextu
	wPasswordInputName: ; $c4e0
		dsb 8

	wPasswordReviveRoomGroup: ; $c4e8
		db

	wPasswordArmourOfGod: ; $c4e9
		db

	wPasswordBombsUpper2bitsAndSpecialBitems: ; $c4ea
		db

	wPasswordOilsAndHCs: ; $c4eb
		db

	wPasswordPlayerHealth: ; $c4ec
		db

	wPasswordKeys: ; $c4ed
		db

	wPasswordBombsLow6bits: ; $c4ee
		db

	wPasswordBirdsLow6bits: ; $c4ef
		db

	wPasswordItemsGotten: ; $c4f0
		dsb 9

	wPasswordCurrQuizNoDiv5: ; $c4f9
		db

	wPassword1st2FruitAmounts: ; $c4fa
		db

	wPassword2nd2FruitAmounts: ; $c4fb
		db

	wPasswordBirdsUpper2bits5thFruit: ; $c4fc
		db

	wPasswordSumVal: ; $c4fd
		dw

	wPasswordChecksum: ; $c4ff
		db
.endu

wc500:
	dsb $7e

// unused?
wNextRoomFlagItemIdx: ; $c57e
	db

wc57f:
	db

// cleared when loading room data
wExplosionVar0: ; $c580 // tile type?
	dsb $18
wExplosionYvals: ; $c598
	dsb $18
wExplosionXvals: ; $c5b0
	dsb $18
wExplosionVar3: ; $c5c8 // timer?
	dsb $18

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

wCurrFruitHitObstacle: ; $c5f8
	db

wc5f9:
	db

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

wBombTimers: ; $c600
	dsb $18
// bit 7 for both used for something?
wBombXvals: ; $c618
	dsb $18
wBombYvals: ; $c630
	dsb $18

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

wUpdateNpcsCallCount: ; $c65e
	db

wInventorySelectedYIdx: ; $c65f
	db

wFallingObjectID: ; $c660
	dsb 3
wFallingObjectXval: ; $c663
	dsb 3
wFallingObjectTileIdx: ; $c666
	dsb 3
wFallingObjectYval: ; $c669
	dsb 3
wFallingObjectVar4: ; $c66c
	dsb 3
wFallingObjectVar5: ; $c66f
	dsb 3
wFallingObject2x2xVal: ; $c672
	dsb 3
wFallingObject2x2yVal: ; $c675
	dsb 3

wc678:
	dsb $cb-$78

wJawboneOrSwordTimeUntilReuse: ; $c6cb
	db

wJawboneOrSwordXval: ; $c6cc
	db

wJawboneOrSwordYval: ; $c6cd
	db

wJawboneOrSwordDir: ; $c6ce
	db

wc6cf:
	db

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
	dsb 2

wCurrFruitTileIdx: ; $c70f
	db

wc710:
	db

.union
	wMenuCursorIdx: ; $c711
		db
.nextu
	wPreviousUsingRaft: ; $c711
		db
.nextu
	wMusicScreenIsTwiceSpeed: ; $c711
		db
.nextu
	wFruitFlagBit7: ; $c711
		db
.endu

// bits 0-2 are the angle if bit 5 set
// bit 4 set if it can pass through obstacles
// bit 5 set if affected by angles
// bit 6 set if zig-zag pattern
// bit 7 set if cant destroy certain tiles
wCurrFruitBaseFlags: ; $c712
	db

wNumFruitsCreated: ; $c713
	db

wPlayerMovementSlowed: ; $c714
	db

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

// if bit 3 set, inc oam tile idx (eg walking)
// bit 4 set initially
// if bit 4 set, not affected by jawbone/sword/fruit
// if bit 4 or 5 set, not affected by falling objects
// if bit 6 set, ignore vert directions when getting its tiles
// if bit 7 set, fruits bounce off
wNPCBytes_cb60: ; $cb60
	dsb NUM_NPCS

// todo: a guess
wNPCBytes_animationFrameIdx: ; $cb6c
	dsb NUM_NPCS

wNPCBytes_timeToWait: ; $cb78
	dsb NUM_NPCS

// this whole byte uses upper nybble for some controls
// bit 4 unset when pixels to move, set when done (unused?)
// bit 5 set means player colliding with it
// bit 6 set when using a b item on it
// if bit 7 set, it will transform into npc byte 4 if specified
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

// if bit 1 set here, dont draw
// if bit 2 unset, change npc due to being hit by fruit
// if bit 3 set, npc movement func tries to move to player
// if bit 4 set here, unaffected by sword
wNPCBytes_cbe4: ; $cbe4
	dsb NUM_NPCS

wNPCBytes_roomFlagIdx: ; $cbf0
	dsb NUM_NPCS

wNPCScriptBytesBank: ; $cbfc
	dsb NUM_NPCS

wcc08:
	dsb $efe-$c08

wGenericVramCopyOffset: ; $cefe
	db

wGenericVramCopyLastIdx: ; $ceff
	db

wGenericVramCopyData: ; $cf00
	dsb $100

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

wBGtileToVramConversionTable: ; $d006
	dsb $40

wSprTileToVramConversionTable: ; $d046
	dsb $40

wd086:
	dsb $fc-$86

wVBlanksPerTileAnimation: ; $d0fc
	db

wCurrVBlanksUntilNextTileAnimation: ; $d0fd
	db

wCurrTileAnimationAddr: ; $d0fe
	dw

wAnimatedTiles:
	.db
wAnimatedWaterTiles: ; $d100
	dsb $80
wAnimatedLavaTiles: ; $d180
	dsb $80
wAnimatedBlockCracking: ; $d200
	dsb $40
wAnimatedBigBubble: ; $d240
	dsb $40
wAnimatedSmallBubble: ; $d280
	dsb $40
wBlankTile: ; $d2c0
	dsb $10
wAnimatedFlames: ; $d2d0
	dsb $40

wd310:
	dsb $400-$310

wIsTitleScreen: ; $d400
	db

wd401:
	dsb $fff-$401

wStackTop: ; $dfff
	db

.ends