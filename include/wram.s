; ========================================================================================
; Bank 0
; ========================================================================================

.ramsection "RAM 0" bank 0 slot 1

// these 1st few wram bytes seem to be multi-purpose, ie unions
wc000:
	dsb 8

.union
	wTotalRoomsFromGroup0beforeCurrRoomIdx: ; $c008
		dw

	wActualRoomGroup: ; $c00a
		db
.endu

wc00b:
	dsb $2b-$b

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

wc05d:
	dsb $72-$5d

// every 2 health is a heart
wPlayerHealth: ; $c072
	db

wPlayerMaxHealth: ; $c073
	db

wc074:
	dsb $da-$74

wCurrGroupMapVRamOffset: ; $c0da
	dw

wc0dc:
	dsb $a0-$dc

.union
	wSpecialItemsGottenByte: ; $c0a0
		db
.nextu
	// so when max health loop ends, it can fill the rest with 0's
	wCurrentHeartDrawn: ; $c0a0
		db
.endu

wc0a1:
	dsb $100-$a1

wRoomFlags: ; $c100
	dsb $100 // TODO: unknown size

wOam: ; $c200
	dsb $a0

wc2a0:
	dsb $300-$2a0

wAnother2x2blockForGameScreenTilesTODO: ; $c300
	dsb $b0

w2x2gameScreenTiles: ; $c3b0
	dsb $b0

wc460:
	dsb $5fa-$460

wNumKeys: ; $c5fa
	db

wc5fb:
	dsb $f-$b

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

wc724:
	dsb $850-$724

wGameScreenTiles: ; $c850
	dsb $2c0

wSCXvalue: ; $cb10
	db

wSCYvalue: ; $cb11
	db

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

wd046:
	dsb $fff-$46

wStackTop: ; $dfff
	db

.ends