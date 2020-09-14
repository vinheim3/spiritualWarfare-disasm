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
.endu

.union
	wTotalRoomsFromGroup0beforeCurrRoomIdx: ; $c008
		dw

	wActualRoomGroup: ; $c00a
		db
.endu

wc00b:
	dsb $16-$b

wKeysPressed: ; $c016
	db

wc017:
	db

wNewKeysPressed: ; $c018
	db

wc019:
	dsb $2b-$19

wPlayerScore: ; $c02b
	dsb 7

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
	dsb $c-5

wTileLayoutDataBank: ; $c05c
	db

// c05d - ff when transitioning out of room group (screen transition)
wc05d:
	dsb $72-$5d

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
	dsb $a0-$93

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
.endu

wc0a3:
	dsb $b5-$a3

wBytePatternInRoomStructAfterlayoutAddr: ; $c0b5
	dw

wc0b7:
	dsb $da-$b7

wCurrGroupMapVRamOffset: ; $c0da
	dw

wc0dc:
	dsb $100-$dc

// TODO: unknown size, could be global flags
wRoomFlags: ; $c100
	dsb $100

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

wRoomStructWord_whenFirstByteBit7set_1: ; $c5f0
	dw

wRoomStructWord_whenFirstByteBit6set_1: ; $c5f2
	dw

// if 2nd byte's bit 5 is set, this is overridden with the word after it
wRoomStructWord_whenFirstByteBit7set_2: ; $c5f4
	dw

// if 2nd byte's bit 5 is set, this is overridden with the word after above
wRoomStructWord_whenFirstByteBit6set_2: ; $c5f6
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

wc654:
	dsb $dc-$54

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

wFirstRoomStructByte: ; $c72b
	db

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

wcb12:
	dsb $30-$12

wNPC1stBytes: ; $cb30
	dsb $0c

wNPC3rdBytesOrXCoords: ; $cb3c
	dsb $0c

wNPC4thBytesOrYCoords: ; $cb48
	dsb $0c

wcb54:
	dsb $84-$54

wNPC2ndByteLower6Bits: ; $cb84
	dsb $0c

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