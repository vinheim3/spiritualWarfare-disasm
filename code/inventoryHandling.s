inventoryCursorXoffsets:
	.db $18 $28 $38 $48 $58 $68 $78 $88 $98

// returns nz if we choose to end game
handleInventoryScreen:
	call turnOffLCDstartOfVBlank
	call call_updateSounds
	call clear_c200_to_c2ff
	call copyA0hDataToOam
	call loadInventoryScreen

// on, bg9c00, spr 8x16, bg/spr on
	ld   hl, wLCDCvalue
	ld   a, $8f
	ld   (hl), a

// reset scroll
	ld   hl, rSCY
	ld   a, $00
	ldi  (hl), a
	ldi  (hl), a

	call updateInventoryLampOam
	call setNormalBGP_OBP0vals

	ld   a, $01
	call setLCDfromValue_c015equA

	ld   a, $01
	ld   hl, wInventoryBitemXChange
	ld   (hl), a

	call adjustCurrentSelectedBItem

	ld   a, $00
	ld   hl, wInvChangingTextIdx
	ld   (hl), a

	call displayAndLoopInvChangingDescrip

_inventoryScreenMainLoop:
	ld   hl, wInventorySelectedYIdx
	ld   a, (hl)
	cp   $00
	jr   nz, @cursorNotOnBrow

// cursor on b row, y always 20
	ld   hl, wInventorySelectedXIdx
	ld   c, (hl)
	ld   b, $00
	ld   hl, inventoryCursorXoffsets
	add  hl, bc
	ld   a, (hl)
	ld   c, a
	ld   b, $00
	ld   de, $0020
	call sendTowOamCursorXequC_YequE

	jp   @loopWaitingForInput

@cursorNotOnBrow:
	ld   hl, wInventorySelectedYIdx
	ld   c, (hl)
	ld   b, $00
	ld   a, c
	cp   $06
	jr   nz, +

// at exit game button
	ld   bc, $0013
	ld   de, $008f
	jp   @setInvCursorOam

+
// otherwise on fruit, offset using multiplication
	ld   de, $0010
	call ecEquEtimesC
	ld   a, c
	add  $28
	ld   e, a
	ld   d, $00
	ld   bc, $0010

@setInvCursorOam:
	call sendTowOamCursorXequC_YequE

@loopWaitingForInput:
// loop waiting for input
-	ld   e, $78
	call processInputInMenus
	push af
	call displayAndLoopInvChangingDescrip
	pop  af
	jr   z, -

	cp   PADF_START
	jr   z, +

	cp   PADF_SELECT
	jr   nz, @notExitingInventory

+
// exit inventory menu
	jp   exitingInventoryMenu

@notExitingInventory:
	cp   PADF_RIGHT
	jr   nz, @notPressedRight

// pressed right
	ld   hl, wInventorySelectedYIdx
	ld   a, (hl)
	cp   $00
	jr   nz, @pressedHorizNotOnBrow

// pressing right through b items
	ld   a, $01
	ld   hl, wInventoryBitemXChange
	ld   (hl), a
	ld   hl, wInventorySelectedXIdx
	inc  (hl)

@adjustBitemChangeTextScreenLoop:
	call adjustCurrentSelectedBItem
	ld   a, $00
	ld   hl, wInvChangingTextIdx
	ld   (hl), a
	call displayAndLoopInvChangingDescrip

@playSoundAndScreenLoop:
	call playSoundEffect20h
	jp   _inventoryScreenMainLoop

// pressed right/left when not at b row
@pressedHorizNotOnBrow:
	ld   hl, checkBitemsSelectable
	call jpHLinBank4
	ld   hl, wSpecialItemsGottenByte
	ld   a, (hl)
	cp   $00
	jr   z, @playSoundAndScreenLoop

	ld   a, $00
	ld   hl, wInventorySelectedYIdx
	ld   (hl), a
	jp   @adjustBitemChangeTextScreenLoop

@notPressedRight:
	cp   PADF_LEFT
	jr   nz, @notRightLeft

// pressing left
	ld   hl, wInventorySelectedYIdx
	ld   a, (hl)
	cp   $00
	jr   nz, @pressedHorizNotOnBrow

// in the b item region
	ld   a, $ff
	ld   hl, wInventoryBitemXChange
	ld   (hl), a
	ld   hl, wInventorySelectedXIdx
	dec  (hl)
	jp   @adjustBitemChangeTextScreenLoop

@notRightLeft:
	cp   PADF_UP
	jr   nz, @checkPressedDown

// pressing up
	ld   hl, wInventorySelectedYIdx
	dec  (hl)
	jr   z, @pressedUpToBrow

// go to end game if going up from b row
	bit  7, (hl)
	jr   z, @adjustBitemChangeTextScreenLoop

@noBitemsStayOnEndGame:
	ld   a, $06
	ld   hl, wInventorySelectedYIdx
	ld   (hl), a
	jp   @adjustBitemChangeTextScreenLoop

@pressedUpToBrow:
	ld   hl, checkBitemsSelectable
	call jpHLinBank4

	ld   hl, wSpecialItemsGottenByte
	ld   a, (hl)
	cp   $00
	jr   z, @noBitemsStayOnEndGame

	jp   @adjustBitemChangeTextScreenLoop

@checkPressedDown:
	cp   PADF_DOWN
	jr   nz, @checkPressingAorB

// pressing down
	ld   hl, wInventorySelectedYIdx
	inc  (hl)
	ld   a, (hl)
	cp   $07
	jr   nz, @adjustBitemChangeTextScreenLoop

// loop around
	ld   (hl), $00
	jp   @adjustBitemChangeTextScreenLoop

@checkPressingAorB:
	and  PADF_B|PADF_A
	jr   nz, @pressingAorB

	jp   @loopWaitingForInput

@pressingAorB:
	ld   hl, wInventorySelectedYIdx
	ld   a, (hl)
	cp   $00
	jr   z, @selectedOnBItemRow

	jp   @selectedNotOnBRow

@selectedOnBItemRow:
	ld   hl, wInventorySelectedXIdx
	ld   a, (hl)
	cp   $07
	jr   nz, @selectedBnotPraying

// selected praying
	ld   de, text_praying
	call drawInventoryItemDescription
	ld   hl, wPlayerHealth
	ld   a, (hl)
	ld   hl, wPlayerMaxHealth
	cp   (hl)
	jr   z, @afterHealingOrHealthAlreadyFull

	ld   c, 10

@takeBirdForPraying:
	ld   hl, wNumBirds
	dec  (hl)
	push bc
	call updateSoundsStartOfVBlank
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawNumBirds
	call jpHLinBank4
	call call_updateSounds
	call playSoundEffect20h
	pop  bc
	dec  c
	jr   nz, @takeBirdForPraying

// half heart
	ld   a, $01
	call addAtoPlayerHealth
	call playSoundChIfOff26hIfOn
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawHearts
	call jpHLinBank4
	call call_updateSounds
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawSelectableBitems
	call jpHLinBank4
	call call_updateSounds

@afterHealingOrHealthAlreadyFull:
	call adjustCurrentSelectedBItem
	call displayAndLoopInvChangingDescrip
	jp   _inventoryScreenMainLoop

@selectedBnotPraying:
	cp   $00
	jr   nz, @notSelectedPrayingBombs

// vial bombs
	ld   a, EQUIPB_BOMBS
	ld   hl, wEquippedBItem
	ld   (hl), a

@updateEquippedNewBItem:
	call playSoundEffect20h

// can immediately use b item
	ld   a, $00
	ld   hl, wJawboneOrSwordTimeUntilReuse
	ld   (hl), a

	call waitUntilStartOfVBlankPeriod
	ld   hl, drawBitem
	call jpHLinBank4
	call call_updateSounds
	jp   _inventoryScreenMainLoop

@notSelectedPrayingBombs:
	cp   $03
	jr   nz, @notLampOrBombs

// selected lamp
	ld   hl, wIsLampOn
	ld   a, (hl)
	xor  $ff
	ld   (hl), a
	call updateInventoryLampOam
	call playSoundEffect20h
	jp   _inventoryScreenMainLoop

@notLampOrBombs:
	cp   $01
	jr   nz, @notLampBombsJawbone

// jawbone
	ld   a, EQUIPB_JAWBONE
	ld   hl, wEquippedBItem
	ld   (hl), a
	jp   @updateEquippedNewBItem

@notLampBombsJawbone:
	cp   $04
	jr   nz, @notLampBombsJawboneRaft

// raft
	ld   hl, wIsEquippingRaft
	ld   a, (hl)
	cp   $00
	jr   z, @tryToUseRaft

// is equipping raft
	ld   hl, wIsUsingRaft
	ld   a, (hl)
	cp   $00
	jr   z, @unequipRaft

	ld   de, text_findLandFirst
	jp   @selectedSomethingOnInvScreenEnd

@unequipRaft:
	ld   a, $00
	jp   @setEquippingRaft

@tryToUseRaft:
	call retZIfCanRaftOnScreen
	jr   z, @canRaftOnScreen

	ld   de, text_noRaftingHere
	jp   @selectedSomethingOnInvScreenEnd

@canRaftOnScreen:
	ld   a, $ff

@setEquippingRaft:
	ld   hl, wIsEquippingRaft
	ld   (hl), a
	call playSoundEffect20h
	jp   _inventoryScreenMainLoop


@notLampBombsJawboneRaft:
	cp   $02
	jr   nz, @oilOrMap

// sword
	ld   a, EQUIPB_SWORD
	ld   hl, wEquippedBItem
	ld   (hl), a
	jp   @updateEquippedNewBItem

@oilOrMap:
	cp   $08
	jp   z, @transitionToMapScreen

// oil
	ld   hl, wPlayerHealth
	ld   a, (hl)
	ld   hl, wPlayerMaxHealth
	cp   (hl)
	jr   nz, @sanityCheckHealth

	ld   de, text_strengthIsFull
	jp   @selectedSomethingOnInvScreenEnd


@sanityCheckHealth:
	ld   hl, wPlayerHealth
	ld   a, (hl)
	ld   hl, wPlayerMaxHealth
	cp   (hl)
	jr   c, @usingOil

	ld   de, text_strengthIsFull
	jp   @selectedSomethingOnInvScreenEnd


@usingOil:
	call playSoundEffect20h
	ld   hl, wPlayerHealth
	inc  (hl)
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawHearts
	call jpHLinBank4
	call call_updateSounds
	call updateSoundsStartOfVBlank
	call updateSoundsStartOfVBlank
	ld   hl, wPlayerHealth
	ld   a, (hl)
	ld   hl, wPlayerMaxHealth
	cp   (hl)
	jr   c, @usingOil

// dec based on oil gotten
	ld   hl, wInventorySelectedXIdx
	ld   a, (hl)
	cp   $06
	jr   nz, +

	ld   hl, wAnointingOilsGotten
	dec  (hl)

+
	ld   hl, wAnointingOilsGotten
	dec  (hl)

// update b items
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawSelectableBitems
	call jpHLinBank4
	call call_updateSounds
	jp   @adjustBitemChangeTextScreenLoop

@transitionToMapScreen:
	call turnOffLCDstartOfVBlank
	call call_updateSounds
	call clear_c200_to_c2ff
	call copyA0hDataToOam
	call loadMapScreen
	ld   a, $01
	call setLCDfromValue_c015equA
	ld   e, $00
	call processInputInMenus
	jp   handleInventoryScreen

@selectedNotOnBRow:
	ld   hl, wInventorySelectedYIdx
	ld   e, (hl)
	ld   d, $00
	cp   $06
	jr   nz, +

// on exit game
	jp   exitGamePrompt

+
	dec  de
	ld   hl, getFruitAmountFromWram
	call jpHLinBank4
	ld   a, e
	cp   $00
	jr   z, @0ofSelectedFruit

// fruit equipped is y idx-1
	ld   hl, wInventorySelectedYIdx
	ld   a, (hl)
	ld   hl, wFruitEquipped
	ld   (hl), a
	ld   hl, wFruitEquipped
	dec  (hl)

	call updateCurrFruitBaseData
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawAitem
	call jpHLinBank4
	call call_updateSounds
	jp   @playSoundAndScreenLoop

@0ofSelectedFruit:
	ld   de, text_findThisOneFirst

@selectedSomethingOnInvScreenEnd:
	call drawInventoryItemDescription
	call playSoundEffect23h
	jp   _inventoryScreenMainLoop


displayAndLoopInvChangingDescrip:
	ld   hl, wInvChangingTextIdx
	ld   a, (hl)
	cp   $02
	jr   nz, @itemDescription

// if at 2 currently, next text (0) is push A
	ld   de, text_pushAtoPickThis
	jp   @drawChangingItemDescription

@itemDescription:
// text list index is 0-7 for b items
	ld   hl, wInventorySelectedYIdx
	ld   a, (hl)
	cp   $00
	jr   z, @onBRow

// 8+ for non-b items
	add  $08
	jr   @afterTextListIdx

@onBRow:
	ld   hl, wInventorySelectedXIdx
	ld   a, (hl)

@afterTextListIdx:
	sla  a
	sla  a
	ld   c, a
	ld   b, $00
	ld   hl, wInvChangingTextIdx
	ld   a, (hl)
	and  $01
	jr   z, +
// next text if at $01
	inc  bc
	inc  bc

+
// get addr of text data
	ld   hl, textDataList
	add  hl, bc
	ld   e, (hl)
	inc  hl
	ld   d, (hl)

@drawChangingItemDescription:
	call drawInventoryItemDescription
	ld   hl, wInvChangingTextIdx
	inc  (hl)

// loop 3 to 0
	ld   hl, wInvChangingTextIdx
	ld   a, (hl)
	cp   $03
	jr   c, @done

	ld   a, $00
	ld   hl, wInvChangingTextIdx
	ld   (hl), a

@done:
	ret


exitGamePromptCursorX:
	.db $6c $8f

exitGamePrompt:
	call playSoundEffect20h
	ld   de, text_endGameChoice
	call drawInventoryItemDescription
	ld   a, $01
	ld   hl, wMenuCursorIdx
	ld   (hl), a

@exitGameLoop:
	ld   hl, wMenuCursorIdx
	ld   c, (hl)
	ld   b, $00

// set x val
	ld   hl, exitGamePromptCursorX
	add  hl, bc
	ld   a, (hl)
	ld   c, a
	ld   b, $00

	ld   de, $009d
	call sendTowOamCursorXequC_YequE

	ld   e, $00
	call processInputInMenus

// check input
	ld   c, a
	ld   b, $00
	and  PADF_LEFT|PADF_RIGHT
	jr   z, @notLeftRight

// left or right, swap idx
	ld   hl, wMenuCursorIdx
	ld   a, (hl)
	xor  $01
	ld   hl, wMenuCursorIdx
	ld   (hl), a
	call playSoundEffect20h
	jp   @exitGameLoop

@notLeftRight:
	ld   a, c
	and  PADF_B|PADF_A
	jr   nz, @pressedAorB

// go back
	ld   de, text_space
	call drawInventoryItemDescription
	jp   _inventoryScreenMainLoop

@pressedAorB:
	ld   hl, wMenuCursorIdx
	ld   a, (hl)
	cp   $00
	jr   nz, exitingInventoryMenu

// yes - exit game
	or   $ff
	jr   backToGameFromMenuQuizText

exitingInventoryMenu:
	ld   de, text_space
	call drawInventoryItemDescription
	call clear_c200_to_c2ff
	xor  a

backToGameFromMenuQuizText:
	push af
	call turnOffLCDstartOfVBlank
	call applyPalettesBasedOnLamp
	call copyPlayerDataOnto_wOam
	call checkRaftChanges_sendToOam
	call loadNpcOamDataToWram
	call loadBWeaponDataToOam
	call updateFallingObjectsOam
	call copyA0hDataToOam
	call loadAllVramTilesAndConversionTableDataForTileset

// on, bg/spr on, 8x16 spr
	ld   hl, wLCDCvalue
	ld   a, $87
	ld   (hl), a

// set scrolls
	ld   hl, wSCXvalue
	ld   e, (hl)
	ld   hl, wSCYvalue
	ld   a, (hl)
	ld   hl, rSCY
	ldi  (hl), a
	ld   (hl), e

	ld   a, $06
	call setLCDfromValue_c015equA
	pop  af
	ret


updateInventoryLampOam:
	call waitUntilStartOfVBlankPeriod
// clear lamp by default
	ld   hl, wOam+$1c
	ld   (hl), $00
	ld   hl, wOam+$20
	ld   (hl), $00
	ld   hl, checkBitemsSelectable
	call jpHLinBank4

// skip if not gotten the lamp
	ld   hl, wSpecialItemsGottenByte
	bit  3, (hl)
	jr   z, @done

	ld   hl, wIsLampOn
	ld   a, (hl)
	cp   $00
	jr   z, @done

// lamp on, copy y to oam
	ld   hl, wOam+$1c
	ld   (hl), $18
	ld   hl, wOam+$20
	ld   (hl), $18

// copy x to oam
	ld   hl, wOam+$1d
	ld   (hl), $40
	ld   hl, wOam+$21
	ld   (hl), $48

// copy tile idxes to oam
	ld   hl, wOam+$1e
	ld   (hl), $8c
	ld   hl, wOam+$22
	ld   (hl), $8e

// lamp attrs - use $90, or OBP1 (flashing)
	ld   b, $80
	ld   hl, wIsLampOn
	ld   a, (hl)
	cp   $00
	jr   z, +

// lamp is on
	ld   b, $90

+
	ld   hl, wOam+$1f
	ld   (hl), b
	ld   hl, wOam+$23
	ld   (hl), b

@done:
	ret
