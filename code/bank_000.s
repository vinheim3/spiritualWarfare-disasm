
begin:
	ld   sp, wStackTop

	ld   hl, wLCDCvalue
	ld   a, $81
	ld   (hl), a

	call turnOffLCDstartOfVBlank
	call setScrollValues

	ld   hl, rBGP
	ld   (hl), $e4

	ld   hl, wScreen0displayOffset
	ld   (hl), $00
	ld   hl, wNextUsableOamIdx
	ld   (hl), $00

	ld   hl, wIsTitleScreen
	ld   (hl), $00

	call stopAllSounds

	ld   hl, lyt_introTradeMarkScreen
	call copyLayoutFromBank3toScreen0withOffset

	ld   hl, $001c
	call loadTilesetAndVramTileConversionTable_idxedHL

	call clear_c200_to_c2ff
	call copyA0hDataToOam

	ld   a, $01
	call setLCDfromValue_c015equA

	call stopSoundsPlaySound2AtTwiceSpeed

	ld   e, $ff
	call processInputInMenus

	call stopAllSounds
	call resetRandomNumberTableIdx

	ld   hl, wIsMusicOff
	ld   (hl), $00

	jp   startTitleScreen


text_badPassword:
	.dw $0200
	.asc "    BAD PASSWORD    "
	.db $ff


text_blankRow:
	.dw $01e0
	.asc "                    "
	.db $ff


// last 2 bytes unused (used as part of next table)
increaseScore0bytes:
	.db $00 $00 $00


// idx determines the rightmost of 4 bytes to add to score
increaseScoreAdditions:
	.db             $01
	.db $00 $00 $01 $00
	.db $00 $01 $00 $00
	.db $00 $02 $00 $00
	.db $00 $04 $00 $00
	.db $00 $05 $00 $00
	.db $00 $08 $00 $00
	.db $01 $00 $00 $00
	.db $01 $05 $00 $00
	.db $02 $00 $00 $00
	.db $03 $00 $00 $00
	.db $05 $00 $00 $00
	

data_09fc:
	.db $00

data_09fd:
	.db $fe $05 $ff $00 $17 $05 $10 $04
	.db $11 $04 $00 $00 $10 $05 $11 $04
	.db $00 $00 $17 $06 $49 $06 $4a $06
	.db $4b $78 $4b $00 $14 $06 $15 $04
	.db $16 $03 $00 $00 $17 $05 $fd $1a
	.db $00 $00 $14 $06 $15 $04 $16 $03
	.db $fd $0e $00 $00


fruitTileCollisions:
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f
	.dw fruitTileCollision_hitObstacle // 18
	.dw fruitTileCollision_19 // the ff 3 destroy tiles and replace it
	.dw fruitTileCollision_1a
	.dw fruitTileCollision_1b
	.dw fruitTileCollision_hitObstacle // 1c
	.dw fruitTileCollision_hitObstacle // 1d
	.dw fruitTileCollision_1e
	.dw fruitTileCollision_hitObstacle // 1f
	.dw fruitTileCollision_bounced // 20
	.dw fruitTileCollision_bounced // 21
	.dw fruitTileCollision_bounced // 22
	.dw fruitTileCollision_bounced // 23
	.dw fruitTileCollision_bounced // 24
	.dw fruitTileCollision_bounced // 25
	.dw fruitTileCollision_hitObstacle // 26
	.dw fruitTileCollision_27
	.dw fruitTileCollision_28
	.dw fruitTileCollision_29
	.dw fruitTileCollision_2a
	.dw fruitTileCollision_hitObstacle // 2b
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f


fruitFallingObjectCollisions:
	.dw setFruitHitObstacle2
	.dw fruitFallingObjectCollision_01
	.dw fruitFallingObjectCollision_02
	.dw fruitFallingObjectCollision_03
	.dw setFruitHitObstacle2
	.dw setFruitHitObstacle2
	.dw fruitFallingObjectCollision_06
	.dw setFruitHitObstacle2
	.dw setFruitBounced
	.dw setFruitBounced
	.dw setFruitBounced
	.dw setFruitBounced


tileTypeReactionOnExplosion:
	.dw explosionReaction_common
	.dw explosionReaction_1or2
	.dw explosionReaction_1or2
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_3736
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw explosionReaction_common
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw _ret_3736
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_1c
	.dw explosionReaction_common
	.dw explosionReaction_1eOr23
	.dw _ret_3736
	.dw explosionReaction_20
	.dw explosionReaction_21
	.dw explosionReaction_common
	.dw explosionReaction_1eOr23
	.dw explosionReaction_24
	.dw explosionReaction_common
	.dw _ret_3736
	.dw explosionReaction_27
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw explosionReaction_common
	.dw _ret_3736
	.dw _ret_3736
	.dw _ret_3736


table_0b05:
	.dw Jump_000_3925
	.dw func_38ee
	.dw func_38ee
	.dw func_38ee
	.dw func_391e
	.dw func_38ee
	.dw func_3891
	.dw Jump_000_3925
	.dw func_390f
	.dw func_3914
	.dw func_38ee
	.dw func_3891
	.dw func_3919
	.dw func_38ee
	.dw Jump_000_3925


collisionsTable:
	.dw _ret_5108
	.dw _collision_tele // 01
	.dw _collision_tele // 02
	.dw _collision_give7bombs
	.dw _collision_give3bombs
	.dw _collision_give5birds
	.dw _collision_give1bird
	.dw _collision_stub_07
	.dw _collision_stub_08
	.dw _collision_giveArmorOfGod
	.dw _collision_giveSpecialBitem
	.dw _collision_giveHeartContainer
	.dw _ret_525a
	.dw _collision_stub_0d
	.dw _collision_giveAnointingOil
	.dw _collision_giveKey
	.dw _collision_tele // 10
	.dw _collision_tele // 11
	.dw _collision_tele // 12
	.dw _collision_tele // 13
	.dw _ret_5108
	.dw _ret_5108
	.dw _ret_5108
	.dw _collision_tele // 17
	.dw _collision_giveHeart


reset:
	ld   sp, wStackTop

startTitleScreen:
	ld   a, $00
// unused
	ld   hl, w0whenStartingTitleScreen
	ld   (hl), a

	ld   hl, wGenericMenuCursorIdx
	ld   (hl), a

// on, obj/bg on, 8x16 sprites
	ld   hl, wLCDCvalue
	ld   a, $87
	ld   (hl), a

	call turnOffLCDstartOfVBlank
	ld   hl, $0020
	call loadTilesetAndVramTileConversionTable_idxedHL

// copy water, etc, animation tiles
	ld   de, wAnimatedTiles
	ld   c, (wAnimatedFlames-wAnimatedTiles)/2
	ld   hl, $8040
// copy memory 2*c
-
	ldi  a, (hl)
	ld   (de), a
	inc  de
	ldi  a, (hl)
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

// copy fire tiles on title screen
	ld   c, $40
	ld   hl, $87c0
-
	ldi  a, (hl)
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	call setNormalBGP_OBP0vals
	ld   hl, rOBP1
	ld   (hl), $1b

	call setScrollValues
	call clearScreen0

	ld   hl, lyt_titleScreen
	call copyLayoutFromBank3toScreen0withOffset
	call loadTileset1dh_sprites1ch

	call changeMusicOnTextAndPlaySound
	call clear_c200_to_c2ff
	call copyA0hDataToOam

// animate flames
	ld   hl, wCurrTileAnimationAddr
	ld   de, titleScreenFlamesAnimation
	ld   (hl), e
	inc  hl
	ld   (hl), d
// animation details
	ld   hl, wVBlanksPerTileAnimation
	ld   (hl), $02
	ld   hl, wCurrVBlanksUntilNextTileAnimation
	ld   (hl), $02

	ld   a, $01
	call setLCDfromValue_c015equA

	call stopAllSounds
	ld   hl, wNewKeysPressed
	ld   (hl), $00
	call stopSoundsPlaySound0AtNormalSpeed

// cursor
	ld   hl, wOam+1
	ld   (hl), $1e
	ld   hl, wOam+2
	ld   (hl), $2a
	ld   hl, wOam+3
	ld   (hl), $00
	ld   hl, wGenericMenuMaxCursorIdx
	ld   (hl), $04
	ld   hl, wMenuCursorBaseOamY
	ld   (hl), $68

@titleScreenLoop:
	ld   a, $3c
	ld   hl, wTimeUntilMenuInputProcessable
	ld   (hl), a
	ld   hl, wIsTitleScreen
	ld   (hl), $ff

// rets when a/b/start selected
	call genericMenuInputCheckLoop
	ld   hl, wIsTitleScreen
	ld   (hl), $00
	ld   hl, wMenuOptionButtonsPressed
	ld   a, (hl)
	cp   $00
	jr   nz, +

	jp   @titleScreenLoop

+
// button pressed
	call stopAllSounds

// unused
	ld   a, $00
	ld   hl, w0whenButtonPressedOnTitleScreen
	ld   (hl), a

// process input
	ld   hl, wGenericMenuCursorIdx
	ld   a, (hl)
	cp   $03
	jr   nz, +

// selected music test
	jp   musicTestScreen

+
	cp   $02
	jr   nz, +

// flip music on/off
	ld   hl, wIsMusicOff
	ld   a, (hl)
	xor  $ff
	ld   (hl), a
	call playSoundEffect20h
	call changeMusicOnTextAndPlaySound
	call stopSoundsPlaySound0AtNormalSpeed
	jp   @titleScreenLoop

+
	cp   $01
	jr   nz, @playGame

// enter password
	call enterPasswordScreen
	jr   z, +

// exited password screen, go back to title screen
	jp   startTitleScreen

+
// correct password
	call processCorrectPassword
	jp   postInitGame

@playGame:
	call enterNameScreen
	jp   initGame


text_musicOn:
	.db $38 $2e $00

text_musicOff:
	.db $38 $2f $2f

changeMusicOnTextAndPlaySound:
	ld   de, $99ca
	call dPlusEquScreen0displayOffset
	ld   hl, wIsMusicOff
	ld   a, (hl)
	ld   hl, text_musicOn
	cp   $00
	jr   z, +

	ld   hl, text_musicOff

+
	ld   c, $03
	jp   copyMemoryCinVBlank_updateSounds


// the following return when start/b/a selected
nonTitleScreenInputCheckLoop:
	ld   a, $00
	ld   hl, wTimeUntilMenuInputProcessable
	ld   (hl), a

genericMenuInputCheckLoop:
@loop:
// update cursor y
	ld   hl, wGenericMenuCursorIdx
	ld   a, (hl)
	sla  a
	sla  a
	sla  a
	ld   hl, wMenuCursorBaseOamY
	add  (hl)
	ld   hl, wOam
	ld   (hl), a

	ld   hl, wTimeUntilMenuInputProcessable
	ld   e, (hl)
	call processInputInMenus

// c00c is button pressed
	ld   hl, wMenuOptionButtonsPressed
	ld   (hl), a
	cp   $00
	jr   nz, +

	ret

+
	cp   PADF_DOWN
	jr   z, @selectOrDownPressed

	cp   PADF_SELECT
	jr   z, @selectOrDownPressed

	cp   PADF_UP
	jr   nz, @notUpDownSelectSelected

// pressed up
	call playSoundEffect20h
	ld   hl, wGenericMenuCursorIdx
	ld   a, (hl)
	cp   $00
	jr   nz, @processUp

// at 1st option, so should loop
	ld   hl, wGenericMenuMaxCursorIdx
	ld   a, (hl)
	ld   hl, wGenericMenuCursorIdx
	ld   (hl), a

@processUp:
	ld   hl, wGenericMenuCursorIdx
	dec  (hl)
	jp   @loop

@selectOrDownPressed:
	call playSoundEffect20h
	ld   hl, wGenericMenuCursorIdx
	inc  (hl)
	ld   hl, wGenericMenuCursorIdx
	ld   a, (hl)
	ld   hl, wGenericMenuMaxCursorIdx
	cp   (hl)
	jr   c, @loop

	ld   a, $00
	ld   hl, wGenericMenuCursorIdx
	ld   (hl), a
	jp   @loop

@notUpDownSelectSelected:
	and  PADF_START|PADF_B|PADF_A
	jr   z, @loop

	ret

.include "code/passwordOrNameScreen.s"
.include "code/musicTestScreen.s"

.include "garbage/b0_14a9.s"

play3soundChannels_6choicesIdxed_c009:
	ld   bc, musicChannel0
	ld   a, $00
	call playSoundChannelADataInBCIdxed_c009

	ld   bc, musicChannel1
	ld   a, $01
	call playSoundChannelADataInBCIdxed_c009

	ld   bc, musicChannel2
	ld   a, $02
	jp   playSoundChannelADataInBCIdxed_c009


stopHWSoundChannels012:
	ld   a, $00
	call call_stopHWSoundChannelA
	ld   a, $01
	call call_stopHWSoundChannelA
	ld   a, $02
	jp   call_stopHWSoundChannelA


playSoundChannelADataInBCIdxed_c009:
	push af
// val in c009 is double index into bc
	ld   hl, wSoundToPlayIdx
	ld   a, (hl)
	sla  a
	ld   l, a
	ld   h, $00
	add  hl, bc

// get de from bc, as sound data addr
	ld   e, (hl)
	inc  hl
	ld   d, (hl)
	pop  af
	jp   call_playSoundChannelADataInDE


retZifFirst3SoundChannelsOff:
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	ld   a, (hl)
	ld   hl, wSoundChannelB.controlByteAndHWChannelAddr
	or   (hl)
	ld   hl, wSoundChannelC.controlByteAndHWChannelAddr
	or   (hl)
	and  $80
	ret


playSoundEffectInTableIdxedA_channel3or4:
	sla  a
	ld   c, a
	ld   b, $00
	ld   hl, soundEffects
	add  hl, bc
	ld   e, (hl)
	inc  hl
	ld   d, (hl)

playSoundEffectInDE_channel3or4:
	ld   a, $00
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a

// if channel 3 not in use, use it, otherwise highjack channel 4
	ld   hl, wSoundChannelD.controlByteAndHWChannelAddr
	ld   a, (hl)
	and  $80
	jr   z, +

	push de
// stop audio channel 4
	ld   a, $04
	call call_stopHWSoundChannelA
	pop  de

// play it again with data in de
	ld   a, $04
	jp   call_playSoundChannelADataInDE

+
	ld   a, $03
	jp   call_playSoundChannelADataInDE


stopAllSounds:
	ld   a, $ff
	jp   call_stopHWSoundChannelA


copyLayoutFromBank3toScreen0withOffset:
	ld   de, wScreen0displayOffset
	ld   a, (de)
	add  >$9800
	ld   d, a
	ld   e, $00

copyLayoutFromBank3:
	ld   c, $12

-
	push bc
	ld   a, $03
	ld   b, $14
	ld   c, $00
	call copyMemoryInBankA
// de += $0c, ie next row
	ld   a, e
	add  $0c
	ld   e, a
	ld   a, d
	adc  $00
	ld   d, a
	pop  bc
	dec  c
	jr   nz, -

	ret


initData:
	// group - roomx - roomy - playerx - playery - direction
	.db $00 $01 $02 $40 $50 $06
	.db $10 $01 $04 $c0 $30 $06 // room with many doors

initGame:
	call clear_c200_to_c2ff
	ld   hl, wIsSecretPlayerName
	ld   c, (hl)
	ld   b, $00

	ld   hl, initData
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCurrRoomGroup
	ld   (hl), a

	ld   hl, initData+1
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCurrRoomX
	ld   (hl), a

	ld   hl, initData+2
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCurrRoomY
	ld   (hl), a

	ld   hl, initData+3
	add  hl, bc
	ld   a, (hl)
	ld   hl, wPlayerX
	ld   (hl), a

	ld   hl, initData+4
	add  hl, bc
	ld   a, (hl)
	ld   hl, wPlayerY
	ld   (hl), a

	ld   hl, initData+5
	add  hl, bc
	ld   a, (hl)
	ld   hl, wPlayerStartingDirection
	ld   (hl), a

	ld   a, $00
	ld   hl, wNumBombs
	ld   (hl), a
	ld   hl, wNumBirds
	ld   (hl), a
	ld   hl, wNumKeys
	ld   (hl), a
	ld   hl, wAnointingOilsGotten
	ld   (hl), a
	ld   hl, wArmorOfGodGotten
	ld   (hl), a
	ld   hl, wSpecialBitemsGotten
	ld   (hl), a
	ld   hl, wIsLampOn
	ld   (hl), a
	ld   hl, wEquippedBItem
	ld   (hl), a
	ld   hl, wFruitEquipped
	ld   (hl), a
	ld   hl, wFruitAmounts+1
	ld   (hl), a
	ld   hl, wFruitAmounts+2
	ld   (hl), a
	ld   hl, wFruitAmounts
	ld   (hl), a
	ld   hl, wCurrQuizQuestionIdx
	ld   (hl), a

// clear items gotten flags
	ld   bc, $0000
-
	ld   hl, wItemsGotten
	add  hl, bc
	ld   (hl), $00
	inc  bc
	ld   a, c
	cp   $0a
	jr   nz, -

	ld   hl, wPlayerMaxHealth
	ld   (hl), $06
	ld   hl, wPlayerHealth
	ld   (hl), $06

// straight here from correct password
postInitGame:
	call updateCurrFruitBaseData
	ld   hl, resetRoomFlagData
	call jpHLinBank1

// after continuing after dying
postInitGame2:
	ld   hl, wPlayerStartingDirection
	ld   a, (hl)

// reset animation
	ld   c, $00
	ld   hl, wPlayerAnimationIdx
	ld   (hl), c

	cp   DIR_LEFT
	jr   nz, +

// if left, oam attr is $20 (flipped)
	ld   c, $20
	ld   a, DIR_RIGHT

+
// base idx for player tiles is 40h
	add  $40
	ld   hl, wPlayerIdxIntoGenericVramForTile
	ld   (hl), a
	ld   hl, wPlayerOamAttr
	ld   (hl), c

	ld   hl, wRoomTransitionType
	ld   (hl), RTT_DIFF_GROUP

	call loadRoomGroupStruct

// set some UI defaults
	ld   a, $00
	ld   hl, wKeysPressed
	ld   (hl), a
	ld   hl, wInventorySelectedXIdx
	ld   (hl), a
	ld   hl, wInventorySelectedYIdx
	ld   (hl), a
	ld   hl, wIsEquippingRaft
	ld   (hl), a
	ld   hl, wCounterSo2ArmorIsAThirdDamageTaken
	ld   (hl), a

// clear score
	ld   hl, wPlayerScore
	ld   de, $0007
	call setAtoHL_deBytes

	ld   hl, wScreen0displayOffset2
	ld   (hl), $00
	ld   hl, wScreen1displayOffset
	ld   (hl), $04

// unused
	ld   hl, wFFbeforeMainGame
	ld   (hl), $ff

-
	call mainLoopCheckingForGameOver
	jr   nc, -

// game over
	call setScrollValues
	call reloadGfxClearLCDScreen_loadTileset1ch

	ld   hl, lyt_gameOverScreen
	call copyLayoutFromBank3toScreen0withOffset

	call drawGameOverScreenScore
	call generatePassword

// show current password line 1
	ld   de, $9962
	call dPlusEquScreen0displayOffset
	ld   bc, $0000
-
	ld   hl, wTextInputChars
	add  hl, bc
	ld   a, (hl)
	and  $3f
	ld   hl, text_passwordOrNameChars
	add  l
	ld   l, a
	ld   a, h
	adc  $00
	ld   h, a
	ld   a, (hl)
	ld   (de), a
	inc  de
	inc  bc
	ld   a, c
	cp   $10
	jr   nz, -

// password line 2
	ld   de, $9982
	call dPlusEquScreen0displayOffset

-
	ld   hl, wTextInputChars
	add  hl, bc
	ld   a, (hl)
	and  $3f
	ld   hl, text_passwordOrNameChars
	add  l
	ld   l, a
	ld   a, h
	adc  $00
	ld   h, a
	ld   a, (hl)
	ld   (de), a
	inc  de
	inc  bc
	ld   a, c
	cp   $20
	jr   nz, -

	ld   a, $01
	call setLCDfromValue_c015equA
	call stopSoundsPlaySound4AtNormalSpeed

// controls for selecting option from game over
	ld   hl, wOam+1
	ld   (hl), $34
	ld   hl, wOam+2
	ld   (hl), $a2
	ld   hl, wOam+3
	ld   (hl), $00

	ld   a, $02
	ld   hl, wGenericMenuMaxCursorIdx
	ld   (hl), a

	ld   a, $00
	ld   hl, wGenericMenuCursorIdx
	ld   (hl), a

	ld   a, $40
	ld   hl, wMenuCursorBaseOamY
	ld   (hl), a

	call nonTitleScreenInputCheckLoop
	call stopAllSounds

	ld   hl, wGenericMenuCursorIdx
	ld   a, (hl)
	cp   $00

// idx 1 is quit
	jr   z, +

	jp   startTitleScreen

+
// otherwise revive in game with 6 health
	ld   a, $06
	ld   hl, wPlayerHealth
	ld   (hl), a
	call setRevivePointInRoomGroup
	call clear_c200_to_c2ff
	jp   postInitGame2


reloadGfxClearLCDScreen_loadTileset1ch:
	call turnOffLCDstartOfVBlank
	ld   hl, rBGP
	ld   (hl), $1b
	ld   hl, rOBP0
	ld   (hl), $1b
	call clearScreen0
	call clear_c200_to_c2ff
	call copyA0hDataToOam
	ld   hl, $001c
	jp   loadTilesetAndVramTileConversionTable_idxedHL


loadTileset1dh_sprites1ch:
	ld   hl, $001d
	call loadTilesetAndVramTileConversionTable_idxedHL
	ld   hl, $001c
	jp   loadFirst800hVramTilesAndVramTileConversionTable


tilesetAddresses:
	.dw spr_04_5201
	.dw spr_04_5fb1
	.dw spr_05_094b
	.dw spr_05_1753
	.dw spr_06_1bfd
	.dw spr_06_2a45
	.dw spr_05_1f50
	.dw spr_05_2d63
	.dw spr_04_677c
	.dw spr_01_5e51
	.dw spr_05_354a
	.dw spr_05_431e
	.dw spr_05_4ace
	.dw spr_06_3240
	.dw spr_03_6b0f
	.dw spr_05_58c8
	.dw spr_06_39fe
	.dw spr_06_46ce
	.dw spr_02_6f53
	.dw spr_06_4e3d
	.dw spr_06_55dc
	.dw spr_06_640d
	.dw spr_07_094b
	.dw spr_07_173a
	.dw spr_07_1ec3
	.dw spr_07_2bc2
	.dw spr_07_32fa
	.dw spr_01_56a7
	.dw spr_titleScreen
	.dw spr_07_415a
	.dw spr_07_4ea3
	.dw spr_07_5c10
	.dw spr_05_607b

tilesetBanks:
	.db :spr_04_5201
	.db :spr_04_5fb1
	.db :spr_05_094b
	.db :spr_05_1753
	.db :spr_06_1bfd
	.db :spr_06_2a45
	.db :spr_05_1f50
	.db :spr_05_2d63
	.db :spr_04_677c
	.db :spr_01_5e51
	.db :spr_05_354a
	.db :spr_05_431e
	.db :spr_05_4ace
	.db :spr_06_3240
	.db :spr_03_6b0f
	.db :spr_05_58c8
	.db :spr_06_39fe
	.db :spr_06_46ce
	.db :spr_02_6f53
	.db :spr_06_4e3d
	.db :spr_06_55dc
	.db :spr_06_640d
	.db :spr_07_094b
	.db :spr_07_173a
	.db :spr_07_1ec3
	.db :spr_07_2bc2
	.db :spr_07_32fa
	.db :spr_01_56a7
	.db :spr_titleScreen
	.db :spr_07_415a
	.db :spr_07_4ea3
	.db :spr_07_5c10
	.db :spr_05_607b

loadTilesetAndVramTileConversionTable_idxedHL:
	push hl
	call getTileAddressAndBankIdxedByHL
	call loadFirst1000hVramTiles
	ld   hl, $8000
	ld   de, $9000
	ld   bc, $0800
	call copyMemoryBC
	pop  hl
	ld   de, wBGtileToVramConversionTable

load40hByte2x2tileToVramTileIdxConverstionTable:
// hl *= $40
	add  hl, hl
	add  hl, hl
	add  hl, hl
	add  hl, hl
	add  hl, hl
	add  hl, hl
	ld   bc, vramTileConversionTables
	add  hl, bc
	ld   a, $04
	ld   c, $00
	ld   b, $40
	jp   copyMemoryInBankA


loadFirst800hVramTilesAndVramTileConversionTable:
	push hl
	call getTileAddressAndBankIdxedByHL
	call loadFirst800hVramTiles
	pop  hl
	ld   de, wSprTileToVramConversionTable
	jp   load40hByte2x2tileToVramTileIdxConverstionTable


getTileAddressAndBankIdxedByHL:
	push hl
	ld   de, tilesetBanks
	add  hl, de
	ld   c, (hl)
	ld   b, $00
	pop  hl
	add  hl, hl
	ld   de, tilesetAddresses
	add  hl, de
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	ret


converTileIdxToBGvramTileValue:
	push hl
	push af
	srl  a
	srl  a

// hl += wBGtileToVramConversionTable
	add  <wBGtileToVramConversionTable
	ld   l, a
	ld   a, $00
	adc  >wBGtileToVramConversionTable
	ld   h, a
	ld   a, (hl)

// if ff, use original input
	cp   $ff
	jr   nz, +

	pop  af
	pop  hl
	ret

+
	pop  hl
	pop  hl
	ret


// c017 set if flipping oam horizontally
// if bit 0 set, convert using sprites
convertEntity2x2tileToTopLeftVramTile:
	bit  0, a
	jp   nz, +

	call converTileIdxToBGvramTileValue
	push hl
	ld   hl, wNpcTopLeftVramTile
	ld   (hl), a
	pop  hl
	ret

+
// conver vram tile
	push hl
	and  $fc
	push af
	srl  a
	srl  a
	add  <wSprTileToVramConversionTable
	ld   l, a
	ld   a, $00
	adc  >wSprTileToVramConversionTable
	ld   h, a
	ld   a, (hl)

// if ff, use original, like regular tiles
	cp   $ff
	jr   nz, +

	pop  af
	ld   hl, wNpcTopLeftVramTile
	ld   (hl), a
	pop  hl
	ret

+
	pop  hl
	ld   hl, wNpcTopLeftVramTile
	ld   (hl), a
	pop  hl
	ret


callMinimalMainLoop78hTimes:
	call callMinimalMainLoop3chTimes

callMinimalMainLoop3chTimes:
	call callMinimalMainLoop1ehTimes

callMinimalMainLoop1ehTimes:
	call callMinimalMainLoop0fhTimes

callMinimalMainLoop0fhTimes:
	ld   c, $0f

callMinimalMainLoopCTimes:
@loopC:
	push bc
	call minimalMainLoop
	pop  bc
	dec  c
	jr   nz, @loopC

	ret


waitUntilAllKeysReleased:
-
	call pollInput
	ld   hl, wKeysPressed
	ld   a, (hl)
	cp   $00
	jr   nz, -

	ret

.include "garbage/b0_182f.s"

loadRoomGroupStruct:
// load curr group's vram offset
	call getCurrRoomGroupsWidthAndHeight
	ld   de, $0002
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrGroupMapVRamOffset
	ld   (hl), a
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrGroupMapVRamOffset+1
	ld   (hl), a

// byte after pointer to room struct is the bank of tile layouts
	ld   de, $0014
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wTileLayoutDataBank
	ld   (hl), a

// Unused?
	ld   de, $001b
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrGroupStructByte1bh
	ld   (hl), a

// default palettes
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrGroupDefaultBGP
	ld   (hl), a
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrGroupDefaultBGP+1
	ld   (hl), a
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrGroupDefaultOBP0
	ld   (hl), a
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrGroupDefaultOBP0+1
	ld   (hl), a

// copies group name line 1 and 2
	ld   de, $0004
	ld   bc, $0000

-
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	inc  de
	ld   hl, wRoomGroupNameLine1
	add  hl, bc
	ld   (hl), a
	inc  bc
	ld   a, c
	cp   $0e
	jr   nz, -

// 2nd byte after pointer to room struct
	ld   de, $0015
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	cp   $ff
	jr   z, +

	ld   hl, wCurrRoomGroup
	ld   a, (hl)
	ld   hl, wLastReviveRoomGroup
	ld   (hl), a

+
	call getAddrOfCurrentRoomStructForGroup
	ld   hl, wRoomStructAddress
	ld   (hl), c
	ld   hl, wRoomStructAddress+1
	ld   (hl), e
	ret


getCurrRoomGroupsWidthAndHeight:
	call getAddrOfCurrGroupDataStruct
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrRoomGroupWidth
	ld   (hl), a
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrRoomGroupHeight
	ld   (hl), a
	ret


getAddrOfCurrentRoomStruct:
	call getAddrOfCurrGroupDataStruct

getAddrOfCurrentRoomStructForGroup:
// c006/7 now at pointer to room structs
	ld   de, $0012
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)

	push af
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrGroupRoomStructPointers+1
	ld   (hl), a
	pop  af

// get index into correct room struct
	ld   hl, wCurrGroupRoomStructPointers
	ld   (hl), a
	ld   hl, wCurrRoomY
	ld   c, (hl)
	ld   b, $00
	ld   hl, wCurrRoomGroupWidth
	ld   e, (hl)
	ld   d, $00
	call ecEquEtimesC
	ld   hl, wCurrRoomX
	ld   a, (hl)
	call ecPlusEquA
// ec *= 2
	ld   a, c
	sla  a
	ld   c, a
	ld   b, $00
	ld   a, e
	rl   a
	ld   e, a
	ld   d, $00

// $c006/7 += ec
	ld   a, c
	ld   hl, wCurrGroupRoomStructPointers
	add  (hl)
	ld   hl, wCurrRoomStructPointer
	ld   (hl), a
	ld   a, e
	ld   hl, wCurrGroupRoomStructPointers+1
	adc  (hl)
	ld   hl, wCurrRoomStructPointer+1
	ld   (hl), a

// ($c006) -> a, eventually into c
	ld   de, $0000
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	push af

// ($c006) + 1 -> e
	inc  de
	ld   hl, wCurrRoomStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   e, a
	ld   d, $00

	pop  af
	ld   c, a
	ld   b, $00
	ret


getAddrOfCurrGroupDataStruct:
	ld   hl, wCurrRoomGroup
	ld   c, (hl)
	ld   b, $00
	ld   de, $0020
	call ecEquEtimesC

// roomGroupStructsData += ec
	ld   a, c
	add  <roomGroupStructsData
	ld   hl, wCurrGroupStructPointer
	ld   (hl), a
	ld   a, e
	adc  >roomGroupStructsData
	ld   hl, wCurrGroupStructPointer+1
	ld   (hl), a

	ld   de, $0000
	ret


setRevivePointInRoomGroup:
// if last row group struct bytes byte 2 is not $ff
// $c715 is previous room group? (dont set revive points for inside areas?)
	ld   hl, wLastReviveRoomGroup
	ld   a, (hl)
	ld   hl, wCurrRoomGroup
	ld   (hl), a
	call getAddrOfCurrGroupDataStruct

// set curr room group to that byte
	ld   de, $0015
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrRoomGroup
	ld   (hl), a

// 3rd last row group struct byte into room x
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrRoomX
	ld   (hl), a

// 4th last row group struct byte into room y
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wCurrRoomY
	ld   (hl), a

// 5th last row group struct byte is player x
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wPlayerX
	ld   (hl), a

// 6th last row group struct byte is player y
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wPlayerY
	ld   (hl), a

// 6th last row group struct byte into c6df
// also the last byte in init data
	inc  de
	ld   hl, wCurrGroupStructPointer
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, wPlayerStartingDirection
	ld   (hl), a
	ret


;;
	ld   hl, $d001                                   ; $19f2: $21 $01 $d0
	ld   a, $ff                                      ; $19f5: $3e $ff
	ld   (hl), a                                     ; $19f7: $77

processInputInMenus:
// e/d002 is 0 if non title screen
// is $3c/60 if title screen
	ld   hl, wCounterUntilMenuInputProcessable
	ld   (hl), e

	ld   hl, $d001                                   ; $19fc: $21 $01 $d0
	ld   a, (hl)                                     ; $19ff: $7e
	or   a                                           ; $1a00: $b7
	jr   z, jr_000_1a24                              ; $1a01: $28 $21

Jump_000_1a03:
	call minimalMainLoop                               ; $1a03: $cd $5e $1a
	ld   hl, wCounterUntilMenuInputProcessable                                   ; $1a06: $21 $02 $d0
	ld   a, (hl)                                     ; $1a09: $7e
	or   a                                           ; $1a0a: $b7
	jr   z, jr_000_1a14                              ; $1a0b: $28 $07

	dec  (hl)                                        ; $1a0d: $35
	jr   nz, jr_000_1a14                             ; $1a0e: $20 $04

	ld   a, $00                                      ; $1a10: $3e $00
	jr   jr_000_1a49                                 ; $1a12: $18 $35

jr_000_1a14:
	call pollInput                                       ; $1a14: $cd $3b $5b
	jr   z, @noInput                              ; $1a17: $28 $03

	jp   Jump_000_1a03                               ; $1a19: $c3 $03 $1a

@noInput:
	call minimalMainLoop                               ; $1a1c: $cd $5e $1a
	call pollInput                                       ; $1a1f: $cd $3b $5b
	jr   nz, Jump_000_1a03                             ; $1a22: $20 $df

// again no input
jr_000_1a24:
	call minimalMainLoop                               ; $1a24: $cd $5e $1a
	ld   hl, wCounterUntilMenuInputProcessable                                   ; $1a27: $21 $02 $d0
	ld   a, (hl)                                     ; $1a2a: $7e
	or   a                                           ; $1a2b: $b7
	jr   z, jr_000_1a35                              ; $1a2c: $28 $07

	dec  (hl)                                        ; $1a2e: $35
	jr   nz, jr_000_1a35                             ; $1a2f: $20 $04

	ld   a, $00                                      ; $1a31: $3e $00
	jr   jr_000_1a45                                 ; $1a33: $18 $10

jr_000_1a35:
	call pollInput                                       ; $1a35: $cd $3b $5b
	jr   z, jr_000_1a24                              ; $1a38: $28 $ea

	ld   e, $01                                      ; $1a3a: $1e $01

jr_000_1a3c:
	cp   e                                           ; $1a3c: $bb
	jr   z, jr_000_1a45                              ; $1a3d: $28 $06

	sla  e                                           ; $1a3f: $cb $23
	jr   nc, jr_000_1a3c                             ; $1a41: $30 $f9

	jr   Jump_000_1a03                                 ; $1a43: $18 $be

jr_000_1a45:
	ld   hl, $d001                                   ; $1a45: $21 $01 $d0
	ld   (hl), a                                     ; $1a48: $77

jr_000_1a49:
	or   a                                           ; $1a49: $b7
	ret                                              ; $1a4a: $c9

.include "garbage/b0_1a4b.s"

minimalMainLoop:
	call waitUntilStartOfVBlankPeriod
	call copy50hDataToOam
	call flashOBP1every8timesCalled
	ld   hl, wIsTitleScreen
	ld   a, (hl)
	cp   $00
	jr   z, +

	call animateTile

+
	call call_updateSounds
	ret


updateSoundsStartOfVBlank:
	call waitUntilStartOfVBlankPeriod
	call call_updateSounds
	ret


flashOBP1every8timesCalled:
// flash OBP1 every 8 times this function is called
	ld   hl, wOBP1FlashCounter
	inc  (hl)
	ld   a, %00011011
	bit  3, (hl)
	jp   nz, +

	ld   a, %11100100

+
	ld   hl, rOBP1
	ld   (hl), a
	ret


copy50hDataToOam:
	ld   de, wOam
	ld   hl, $fe00
	ld   c, $02
	jr   _copy40bytesFromWramToOam

copyA0hDataToOam:
	ld   de, wOam
	ld   hl, $fe00
	ld   c, $04

_copy40bytesFromWramToOam:
-
.rept 40
	ld   a, (de)
	inc  de
	ldi  (hl), a
.endr
	dec  c
	jp   nz, -

	ret


// updates game state, deals with room transitions
mainLoopCheckingForGameOver:
// if this returns a carry, it's game over
	ld   a, $00
	ld   hl, wPlayerInvincibilityCounter
	ld   (hl), a                                     ; $1b23: $77
	ld   hl, $c027                                   ; $1b24: $21 $27 $c0
	ld   (hl), a                                     ; $1b27: $77
	ld   hl, $c02a                                   ; $1b28: $21 $2a $c0
	ld   (hl), a                                     ; $1b2b: $77
	ld   hl, wScrollingTextByteDone
	ld   (hl), a
	ld   hl, $c07e                                   ; $1b30: $21 $7e $c0
	ld   (hl), a                                     ; $1b33: $77
	ld   hl, $c6c8                                   ; $1b34: $21 $c8 $c6
	ld   (hl), a                                     ; $1b37: $77
	ld   hl, wPlayerMovementSlowed
	ld   (hl), a
	ld   hl, wJawboneOrSwordTimeUntilReuse
	ld   (hl), a
	ld   hl, wTimeUntilFrozenStateEnds
	ld   (hl), a
	ld   hl, $c05e                                   ; $1b44: $21 $5e $c0
	ld   (hl), a                                     ; $1b47: $77
	ld   hl, $c57f                                   ; $1b48: $21 $7f $c5
	ld   (hl), a                                     ; $1b4b: $77
	ld   hl, wGenericVramCopyOffset
	ld   (hl), a
	ld   hl, wGenericVramCopyLastIdx
	ld   (hl), a
	call setScrollValues
	ld   hl, wRoomTransitionType
	ld   a, (hl)
	cp   RTT_DIFF_GROUP
	jp   nz, @handleRoomTransitionInit

@loadScreen:
	call updateSoundsStartOfVBlank
	call turnOffLCD
	ld   hl, wScreen0displayOffset
	ld   (hl), $00
	ld   hl, wScreen0displayOffset2
	ld   (hl), $00
	ld   hl, wScreen1displayOffset
	ld   (hl), $04

	call loadRoomDataFromStruct
	call applyPalettesBasedOnLamp
	call loadNPCAttrs
	call clear_c200_to_c2ff
	call call_updateSounds
	call loadGameScreenTilesOntoScreen
	call call_updateSounds
	call copyPlayerDataOnto_wOam
	call copyRaftDataToOam

	ld   a, $06
	call setLCDfromValue_c015equA

	call processAllTeleports
	jp   @mainLoopAfterLoadScreen


@handleRoomTransitionInit:
	ld   hl, wRoomTransitionType
	ld   a, (hl)
	cp   DIR_LEFT
	jr   nz, +

// transitioned left
	ld   hl, wPlayerX
	ld   (hl), $f0
	ld   hl, wSCXvalue
	ld   (hl), $60
	jp   @loadScreen

+
	cp   DIR_RIGHT
	jr   nz, +

// transitioned right
	ld   hl, wPlayerX
	ld   (hl), $00
	ld   hl, wSCXvalue
	ld   (hl), $00
	jp   @loadScreen

+
	cp   DIR_UP
	jp   nz, +

// transitioned up
	ld   hl, wPlayerY
	ld   (hl), $a0
	ld   hl, wSCYvalue
	ld   (hl), $20
	jp   @loadScreen

+
// transitioned down
	ld   hl, wPlayerY
	ld   (hl), $00
	ld   hl, wSCYvalue
	ld   (hl), $00
	jp   @loadScreen

.include "garbage/b0_1be0.s"

@mainLoopAfterLoadScreen:
	call retZIfCanRaftOnScreen
	jr   z, +

// cant raft on screen, make sure unequip raft
	ld   a, $00
	ld   hl, wIsEquippingRaft
	ld   (hl), a

+
	call retZifFirst3SoundChannelsOff
	jr   nz, +

	call stopSoundsPlaySound5AtNormalSpeed

+
// screen loaded, main loop counter resets
	ld   a, $00
	ld   hl, wMainLoopCounter
	ld   (hl), a

	call pollInput
	ld   hl, wNewKeysPressed
	ld   (hl), a

mainLoop:
	call waitUntilStartOfVBlankPeriod
	ld   hl, wMainLoopCounter
	inc  (hl)
	call flashOBP1every8timesCalled
	ld   hl, wMainLoopCounter
	bit  0, (hl)
	jr   nz, +

// copy to oam and set scrolls every other main loop
	call copyA0hDataToOam
	ld   hl, wSCXvalue
	ld   e, (hl)
	ld   hl, wSCYvalue
	ld   a, (hl)
	ld   hl, rSCY
	ldi  (hl), a
	ld   (hl), e
	jr   @afterGfxMainLoopUpdates

+
// and the other main loops, vram copy, display text character and animate tiles
	call genericVramCopyUpTo6_2x2tiles
	call genericVramCopyUpTo6_2x2tiles
	call displayNextTextCharacter
	call animateTile

@afterGfxMainLoopUpdates:
	call call_updateSounds
	call pollInput
	ld   hl, wIsGamePaused
	ld   a, (hl)
	cp   $00
	jr   nz, @afterInvScreenCheck

// cant go to inventory if frozen
	ld   hl, wTimeUntilFrozenStateEnds
	ld   a, (hl)
	cp   $00
	jr   nz, @afterInvScreenCheck

// check if pressing select to go to inventory screen
	ld   hl, wNewKeysPressed
	ld   a, (hl)
	and  PADF_SELECT
	jr   z, @afterInvScreenCheck

	ld   hl, wKeysPressed
	ld   a, (hl)
	and  PADF_SELECT
	jr   z, @afterInvScreenCheck

	call handleInventoryScreen
	jr   z, mainLoop

	jp   @scfRetToGoToGameOverScreen


@afterInvScreenCheck:
	ld   hl, wNewKeysPressed
	ld   a, (hl)
	and  PADF_START
	jr   z, @afterPauseGameCheck

	ld   hl, wKeysPressed
	ld   a, (hl)
	and  PADF_START
	jr   z, @afterPauseGameCheck

// pause game
	ld   hl, wIsGamePaused
	ld   a, (hl)
	xor  $ff
	ld   hl, wIsGamePaused
	ld   (hl), a
	cp   $00
	jr   z, +

// game paused
	call stopSoundsPlaySound1AtNormalSpeed
	jp   @afterPauseGameCheck

+
// game not paused
	ld   hl, $c08b                                   ; $1c98: $21 $8b $c0
	ld   a, (hl)                                     ; $1c9b: $7e
	cp   $00                                         ; $1c9c: $fe $00
	jr   z, +                              ; $1c9e: $28 $06

// both branches are the same
	call stopSoundsPlaySound5AtNormalSpeed
	jp   @afterPauseGameCheck

+
	call stopSoundsPlaySound5AtNormalSpeed

@afterPauseGameCheck:
	ld   hl, wIsGamePaused
	ld   a, (hl)
	cp   $00
	jr   z, +

	jp   mainLoop

+
// if game not paused, dec time until frozen state ends
	ld   hl, wTimeUntilFrozenStateEnds
	ld   a, (hl)
	cp   $00
	jr   z, +

	dec  (hl)

+
// todo: decrease a timer
	ld   hl, $c6c8                                   ; $1cbd: $21 $c8 $c6
	ld   a, (hl)                                     ; $1cc0: $7e
	cp   $00                                         ; $1cc1: $fe $00
	jr   z, +                              ; $1cc3: $28 $01

	dec  (hl)                                        ; $1cc5: $35

+
// decrease invinvibility timer
	ld   hl, wPlayerInvincibilityCounter
	ld   a, (hl)
	cp   $00
	jr   z, +

	dec  (hl)

+
	ld   hl, wNextUsableOamIdx                                   ; $1ccf: $21 $4e $c0
	ld   a, (hl)                                     ; $1cd2: $7e
	add  $0a                                         ; $1cd3: $c6 $0a
	cp   $28                                         ; $1cd5: $fe $28
	jr   c, +                              ; $1cd7: $38 $02

	sub  $28                                         ; $1cd9: $d6 $28

+
	ld   hl, wNextUsableOamIdx                                   ; $1cdb: $21 $4e $c0
	ld   (hl), a                                     ; $1cde: $77

//
	ld   hl, $c08b                                   ; $1cdf: $21 $8b $c0
	ld   a, (hl)                                     ; $1ce2: $7e
	cp   $00                                         ; $1ce3: $fe $00
	jr   z, @func_1cfa                              ; $1ce5: $28 $13

	call Call_000_294f                               ; $1ce7: $cd $4f $29
	ld   hl, $c08d                                   ; $1cea: $21 $8d $c0
	ld   a, (hl)                                     ; $1ced: $7e
	cp   $00                                         ; $1cee: $fe $00
	jr   nz, @scfRetToGoToGameOverScreen                             ; $1cf0: $20 $03

	jp   @updateGameState                               ; $1cf2: $c3 $ca $1d

@scfRetToGoToGameOverScreen:
	call stopAllSounds
	scf
	ret

@func_1cfa:
	ld   hl, $c05d                                   ; $1cfa: $21 $5d $c0
	ld   a, (hl)                                     ; $1cfd: $7e
	cp   $fe                                         ; $1cfe: $fe $fe
	jp   nz, @func_1dad                           ; $1d00: $c2 $ad $1d

	ld   hl, $c57f                                   ; $1d03: $21 $7f $c5
	ld   a, (hl)                                     ; $1d06: $7e
	cp   $00                                         ; $1d07: $fe $00
	jr   z, @func_1d2a                              ; $1d09: $28 $1f

	ld   hl, $c57f                                   ; $1d0b: $21 $7f $c5
	dec  (hl)                                        ; $1d0e: $35
	jp   nz, @updateGameState                           ; $1d0f: $c2 $ca $1d

	ld   hl, $c6da                                   ; $1d12: $21 $da $c6
	ld   a, (hl)                                     ; $1d15: $7e
	ld   hl, wPlayerX                                   ; $1d16: $21 $52 $c0
	ld   (hl), a                                     ; $1d19: $77
	ld   hl, $c6db                                   ; $1d1a: $21 $db $c6
	ld   a, (hl)                                     ; $1d1d: $7e
	ld   hl, wPlayerY                                   ; $1d1e: $21 $54 $c0
	ld   (hl), a                                     ; $1d21: $77
	ld   hl, $c05e                                   ; $1d22: $21 $5e $c0
	ld   (hl), $00                                   ; $1d25: $36 $00
	jp   @updateGameState                               ; $1d27: $c3 $ca $1d

@func_1d2a:
	ld   hl, $c6d8                                   ; $1d2a: $21 $d8 $c6
	ld   a, (hl)                                     ; $1d2d: $7e
	ld   hl, $c6d9                                   ; $1d2e: $21 $d9 $c6
	or   (hl)                                        ; $1d31: $b6
	jr   z, @func_1da7                              ; $1d32: $28 $73

	ld   hl, $c6d9                                   ; $1d34: $21 $d9 $c6
	ld   a, (hl)                                     ; $1d37: $7e
	cp   $00                                         ; $1d38: $fe $00
	jr   z, @func_1d5f                              ; $1d3a: $28 $23

	bit  7, a                                        ; $1d3c: $cb $7f
	jr   nz, @func_1d51                             ; $1d3e: $20 $11

	ld   hl, wPlayerY                                   ; $1d40: $21 $54 $c0
	inc  (hl)                                        ; $1d43: $34
	ld   hl, $c6d9                                   ; $1d44: $21 $d9 $c6
	dec  (hl)                                        ; $1d47: $35
	ld   bc, $0046                                   ; $1d48: $01 $46 $00
	ld   de, $0000                                   ; $1d4b: $11 $00 $00
	jp   @func_1d5f                               ; $1d4e: $c3 $5f $1d

@func_1d51:
	ld   hl, wPlayerY                                   ; $1d51: $21 $54 $c0
	dec  (hl)                                        ; $1d54: $35
	ld   hl, $c6d9                                   ; $1d55: $21 $d9 $c6
	inc  (hl)                                        ; $1d58: $34
	ld   bc, $0043                                   ; $1d59: $01 $43 $00
	ld   de, $0000                                   ; $1d5c: $11 $00 $00

@func_1d5f:
	ld   hl, $c6d8                                   ; $1d5f: $21 $d8 $c6
	ld   a, (hl)                                     ; $1d62: $7e
	cp   $00                                         ; $1d63: $fe $00
	jr   z, @func_1d8a                              ; $1d65: $28 $23

	bit  7, a                                        ; $1d67: $cb $7f
	jr   nz, @func_1d7c                             ; $1d69: $20 $11

	ld   hl, wPlayerX                                   ; $1d6b: $21 $52 $c0
	inc  (hl)                                        ; $1d6e: $34
	ld   hl, $c6d8                                   ; $1d6f: $21 $d8 $c6
	dec  (hl)                                        ; $1d72: $35
	ld   bc, $0040                                   ; $1d73: $01 $40 $00
	ld   de, $0000                                   ; $1d76: $11 $00 $00
	jp   @func_1d8a                               ; $1d79: $c3 $8a $1d

@func_1d7c:
	ld   hl, wPlayerX                                   ; $1d7c: $21 $52 $c0
	dec  (hl)                                        ; $1d7f: $35
	ld   hl, $c6d8                                   ; $1d80: $21 $d8 $c6
	inc  (hl)                                        ; $1d83: $34
	ld   bc, $0040                                   ; $1d84: $01 $40 $00
	ld   de, $0020                                   ; $1d87: $11 $20 $00

@func_1d8a:
	ld   hl, wPlayerOamAttr                                   ; $1d8a: $21 $55 $c0
	ld   a, (hl)                                     ; $1d8d: $7e
	and  $df                                         ; $1d8e: $e6 $df
	ld   hl, wPlayerOamAttr                                   ; $1d90: $21 $55 $c0
	ld   (hl), a                                     ; $1d93: $77
	ld   a, e                                        ; $1d94: $7b
	ld   hl, wPlayerOamAttr                                   ; $1d95: $21 $55 $c0
	or   (hl)                                        ; $1d98: $b6
	ld   hl, wPlayerOamAttr                                   ; $1d99: $21 $55 $c0
	ld   (hl), a                                     ; $1d9c: $77
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $1d9d: $21 $56 $c0
	ld   (hl), c                                     ; $1da0: $71
	call Jump_001_4d69                                       ; $1da1: $cd $69 $4d
	jp   @updateGameState                               ; $1da4: $c3 $ca $1d

@func_1da7:
	ld   a, $00                                      ; $1da7: $3e $00
	ld   hl, $c05d                                   ; $1da9: $21 $5d $c0
	ld   (hl), a                                     ; $1dac: $77

@func_1dad:
	ld   hl, wTimeUntilFrozenStateEnds                                   ; $1dad: $21 $59 $c0
	ld   a, (hl)                                     ; $1db0: $7e
	cp   $00                                         ; $1db1: $fe $00
	jr   nz, @updateGameState                             ; $1db3: $20 $15

// not frozen
	call Call_000_29ea                               ; $1db5: $cd $ea $29
	ld   hl, $c05d                                   ; $1db8: $21 $5d $c0
	ld   a, (hl)                                     ; $1dbb: $7e
	cp   $00                                         ; $1dbc: $fe $00
	jr   z, @canUseItems_updateGameState                              ; $1dbe: $28 $07

	cp   $fe                                         ; $1dc0: $fe $fe
	jr   z, @canUseItems_updateGameState                              ; $1dc2: $28 $03

	scf                                              ; $1dc4: $37
	ccf                                              ; $1dc5: $3f
	ret                                              ; $1dc6: $c9

@canUseItems_updateGameState:
	call checkUsingItems

@updateGameState:
	call updateNPCs
	call loadNpcOamDataToWram
	call copyPlayerDataOnto_wOam
	call Call_000_3aa4	; $1dd3: explosion-related
	call updateFruits
	call updateBombs
	call updateJawboneOrSword
	call func_48ec	; $1ddf: falling object-related
	call updateFallingObjects
	call loadBWeaponDataToOam
	call updateFallingObjectsOam
	call checkRaftChanges_sendToOam
	jp   mainLoop


setScrollValues:
	ld   a, $00
	ld   hl, wSCXvalue
	ld   (hl), a
	inc  hl
	ld   (hl), a
	ld   hl, wSCYvalue
	ld   (hl), a
	ld   a, $00
	ld   hl, rSCY
	ld   (hl), a
	inc  hl
	ld   (hl), a
	ret


applyPalettesBasedOnLamp:
	ld   hl, wIsLampOn
	ld   a, (hl)
	cp   $00
	jr   nz, @on

// off
	ld   hl, wBGPwhenLampOff
	ld   a, (hl)
	ld   hl, rBGP
	ld   (hl), a
	ld   hl, wOBP0whenLampOff
	ld   a, (hl)
	ld   hl, rOBP0
	ld   (hl), a
	ret

@on:
	ld   hl, wBGPwhenLampOn
	ld   a, (hl)
	ld   hl, rBGP
	ld   (hl), a
	ld   hl, wOBP0whenLampOn
	ld   a, (hl)
	ld   hl, rOBP0
	ld   (hl), a
	ret


setNormalBGP_OBP0vals:
	ld   hl, rBGP
	ld   (hl), $1b
	ld   hl, rOBP0
	ld   (hl), $1b
	ret


loadGameScreenTilesOntoScreen:
	ld   de, $9800
	call dPlusEquValIn_c6de

copyGameScreenTilesOntoDE:
	ld   hl, wGameScreenTiles
	ld   bc, $02c0
	jp   copyMemoryBC


loadAllVramTilesAndConversionTableDataForTileset:
	ld   hl, wTilesetIdx
	ld   l, (hl)
	ld   h, $00
	push hl
	call loadTilesetAndVramTileConversionTable_idxedHL
	pop  hl
	inc  hl
	jp   loadFirst800hVramTilesAndVramTileConversionTable


// unused - 1e59
copyGameScreenTilesOnNon_c6de_screen:
	ld   de, $9800
	call dPlusEquValIn_c6de
	ld   a, d
	xor  $04
	ld   d, a
	jp   copyGameScreenTilesOntoDE


loadInventoryScreen:
	ld   de, $9800
	call dPlusEquScreen1displayOffset
	ld   hl, lyt_inventoryScreen
	call copyLayoutFromBank3
	ld   hl, drawInDynamicPartOfInventoryScreen
	call jpHLinBank4
	ld   hl, $001c
	call loadTilesetAndVramTileConversionTable_idxedHL
	ret


loadMapScreen:
	ld   de, $9800
	call dPlusEquScreen1displayOffset
	ld   hl, lyt_mapScreen
	call copyLayoutFromBank3
	ld   hl, drawInDynamicPartOfMap
	call jpHLinBank4
	ret


// unused - 1e92
c015_equ46h:
	ld   a, $46
	ld   hl, wc015
	ld   (hl), a
	ret


dPlusEquScreen0displayOffset:
	push hl
	ld   hl, wScreen0displayOffset
	ld   a, d
	add  (hl)
	ld   d, a
	pop  hl
	ret


dPlusEquValIn_c6de:
	ld   hl, wScreen0displayOffset2
	jp   dPlusEquValInHL


dPlusEquScreen1displayOffset:
	ld   hl, wScreen1displayOffset

dPlusEquValInHL:
	ld   a, d
	add  (hl)
	ld   d, a
	ret


loadRoomDataFromStruct:
// that contains, eg where to find the compressed room layout)
	ld   hl, wRoomStructAddress
	ld   a, (hl)
	ld   hl, wCurrRoomStructPointer
	ld   (hl), a
	ld   hl, wRoomStructAddress+1
	ld   a, (hl)
	ld   hl, wCurrRoomStructPointer+1
	ld   (hl), a

// set default bgps
	ld   hl, wCurrGroupDefaultBGP
	ld   a, (hl)
	ld   hl, wBGPwhenLampOff
	ld   (hl), a
	ld   hl, wBGPwhenLampOn
	ld   (hl), a
	ld   hl, wCurrGroupDefaultBGP+1
	ld   a, (hl)
	ld   hl, wBGPwhenLampOff+1
	ld   (hl), a
	ld   hl, wBGPwhenLampOn+1
	ld   (hl), a
	ld   hl, wCurrGroupDefaultOBP0
	ld   a, (hl)
	ld   hl, wOBP0whenLampOff
	ld   (hl), a
	ld   hl, wOBP0whenLampOn
	ld   (hl), a
	ld   hl, wCurrGroupDefaultOBP0+1
	ld   a, (hl)
	ld   hl, wOBP0whenLampOff+1
	ld   (hl), a
	ld   hl, wOBP0whenLampOn+1
	ld   (hl), a

//
	ld   hl, wPlayerOrEntityYCollisionAdjust                                   ; $1eef: $21 $4a $c0
	ld   (hl), $08                                   ; $1ef2: $36 $08

// clear stuff
	ld   a, $00
	ld   hl, wTimeUntilCanUseFruitAgain
	ld   (hl), a
	ld   hl, $c05d                                   ; $1efa: $21 $5d $c0
	ld   (hl), a                                     ; $1efd: $77
	ld   hl, $c08d                                   ; $1efe: $21 $8d $c0
	ld   (hl), a                                     ; $1f01: $77
	ld   hl, wIsGamePaused
	ld   (hl), a
	ld   hl, $c087                                   ; $1f06: $21 $87 $c0
	ld   (hl), a                                     ; $1f09: $77
	ld   hl, $c088                                   ; $1f0a: $21 $88 $c0
	ld   (hl), a                                     ; $1f0d: $77
	ld   hl, $c089                                   ; $1f0e: $21 $89 $c0
	ld   (hl), a                                     ; $1f11: $77
	ld   hl, $c08a                                   ; $1f12: $21 $8a $c0
	ld   (hl), a                                     ; $1f15: $77
	ld   hl, wPlayerAnimationIdx
	ld   (hl), a
	ld   hl, $c08b                                   ; $1f1a: $21 $8b $c0
	ld   (hl), a                                     ; $1f1d: $77
	ld   hl, wCurrFruitOnScreen
	ld   (hl), a

// clear fruit vars
	ld   hl, wCurrentFruitTiles
	ld   de, $001c
	call setAtoHL_deBytes

// clear bomb vars
	ld   hl, wBombTimers
	ld   de, $0048
	call setAtoHL_deBytes

// clear explosion vars
	ld   hl, wExplosionVar0
	ld   de, $0060
	call setAtoHL_deBytes

// clear room flag item vars
	ld   hl, wRoomFlagItemTypes
	ld   de, $003c
	call setAtoHL_deBytes

// unused anyway?
	ld   hl, wNextRoomFlagItemIdx
	ld   (hl), a

// clear falling object vars
	ld   hl, wFallingObjectID
	ld   de, $0018
	call setAtoHL_deBytes

	call loadRoomStructData
	call loadAllVramTilesAndConversionTableDataForTileset
	call loadAnimationParametersForTileset

// loads 2x2 tiles into vram
	ld   hl, w2x2gameScreenTiles
	ld   de, wGameScreenTiles
	ld   b, $0b
@nextRowOf2x2tiles:
	ld   c, $10
	push hl

// this is top row of a 2x2 tile
-
	ldi  a, (hl)
	call converTileIdxToBGvramTileValue
	and  $fc
	ld   (de), a
	inc  de
	add  $02
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	pop  hl
	ld   c, $10

// this is the bottom row of 2x2 tiles
-
	ldi  a, (hl)
	call converTileIdxToBGvramTileValue
	and  $fc
	inc  a
	ld   (de), a
	inc  de
	add  $02
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	dec  b
	jr   nz, @nextRowOf2x2tiles

	ret

.include "code/inventoryHandling.s"

retZIfCanRaftOnScreen:
	ld   bc, $0000

-
	ld   hl, w2x2tileTypes
	add  hl, bc
	ld   a, (hl)

// water
	cp   $2d
	jr   z, @done

	inc  bc
	ld   a, c
	cp   $b0
	jr   nz, -

// water
	cp   $2d

@done:
	ret


setFruitAsAmountToE:
// e is fruit amount, a is a script parameter
	ld   hl, wNewFruitsAmount
	ld   (hl), e
	push af
// 2 fruit amounts in 1 wram var
	srl  a
	ld   c, a
	ld   b, $00
	ld   hl, wFruitAmounts
	add  hl, bc
	ld   a, (hl)
// get 2nd fruit value in c006 (to or with
	and  $38
	ld   hl, wCurrFruitWramVarAmount
	ld   (hl), a
	pop  af
	and  $01
	jr   z, +

// 2nd fruit, so put the amounts in the upper 3 of 6 bits
// to or with the lower 3 bits (1st fruit's)
	ld   hl, wNewFruitsAmount
	sla  (hl)
	sla  (hl)
	sla  (hl)
	ld   hl, wFruitAmounts
	add  hl, bc
	ld   a, (hl)
	and  $07
	ld   hl, wCurrFruitWramVarAmount
	ld   (hl), a

+
	ld   hl, wCurrFruitWramVarAmount
	ld   a, (hl)
	ld   hl, wNewFruitsAmount
	or   (hl)
	ld   hl, wFruitAmounts
	add  hl, bc
	ld   (hl), a
	ret


// indexed by current fruit
fruitMaxDistance:
	.db $03 $05 $08 $09 $10

fruitSpeed:
	.db $02 $02 $01 $03 $04

fruitTileIdxes:
	.db $f9 $fd $fb $ff $f7
	
fruitFlags:
	.db $00 $c0 $10 $a0 $80

updateCurrFruitBaseData:
	ld   hl, wFruitEquipped
	ld   e, (hl)
	ld   hl, getFruitAmountFromWram
	call jpHLinBank4

// store here the fruit amount of current fruit
	ld   hl, wCurrFruitAmount
	ld   (hl), e

// c048 from fruitSpeed
	ld   hl, wFruitEquipped
	ld   c, (hl)
	ld   b, $00
	ld   hl, fruitSpeed
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCurrFruitBaseSpeed
	ld   (hl), a

// ec equals $10 * fruitMaxDistance
	ld   hl, fruitMaxDistance
	add  hl, bc
	ld   e, (hl)
	ld   d, $00
	ld   bc, $0010
	call ecEquEtimesC

// e into b, bc / (c048) into c045
	ld   a, e
	ld   b, a
	ld   hl, wCurrFruitBaseSpeed
	ld   a, (hl)
	call bcDivA_divInC_modInAB
	ld   hl, wCurrFruitTimeOnScreen
	ld   (hl), c

// c70f from fruitTileIdxes
	ld   hl, wFruitEquipped
	ld   c, (hl)
	ld   b, $00
	ld   hl, fruitTileIdxes
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCurrFruitTileIdx
	ld   (hl), a

// c712 from fruitFlags
	ld   hl, fruitFlags
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCurrFruitBaseFlags
	ld   (hl), a
	ret


text_pushAtoPickThis:
	.asc "Push A to pick this"
	.db $00

text_endGameChoice:
	.asc "End game?  Yes  No"
	.db $00

text_space:
	.asc " "
	.db $00

text_noRaftingHere:
	.asc "No rafting here!"
	.db $00

text_findLandFirst:
	.asc "Find land first!"
	.db $00

text_findThisOneFirst:
	.asc "Find this one first!"
	.db $00

text_strengthIsFull:
	.asc "Strength is full!"
	.db $00

text_praying:
	.asc "Praying..."
	.db $00


textDataList:
	.dw text_2523
	.dw text_2537
	.dw text_2548
	.dw text_255a
	.dw text_256d
	.dw text_2581
	.dw text_2594
	.dw text_25a6
	.dw text_25b5
	.dw text_25ba
	.dw text_25c7
	.dw text_25d5
	.dw text_25c7
	.dw text_25d5
	.dw text_25e5
	.dw text_25f3
	.dw text_2608
	.dw text_260c
	.dw text_261b
	.dw text_2630
	.dw text_2644
	.dw text_2658
	.dw text_2668
	.dw text_2676
	.dw text_268a
	.dw text_2699
	.dw text_26a8
	.dw text_26b7
	.dw text_26c8
	.dw text_26dd

text_2523:
	.asc "Vial of God's Wrath"
	.db $00

text_2537:
	.asc "Drop vial with B"
	.db $00

text_2548:
	.asc "Jawbone of Samson"
	.db $00

text_255a:
	.asc "Can pick up prizes"
	.db $00

text_256d:
	.asc "Sword of the Spirit"
	.db $00

text_2581:
	.asc "Use in demon level"
	.db $00

text_2594:
	.asc "Lamp for Darkness"
	.db $00

text_25a6:
	.asc "Turn on or off"
	.db $00

text_25b5:
	.asc "Raft"
	.db $00

text_25ba:
	.asc "Use in water"
	.db $00

text_25c7:
	.asc "Anointing Oil"
	.db $00

text_25d5:
	.asc "Restores health"
	.db $00

text_25e5:
	.asc "Praying Hands"
	.db $00

text_25f3:
	.asc "10 Points=Half Heart"
	.db $00

text_2608:
	.asc "Map"
	.db $00

text_260c:
	.asc "Shows location"
	.db $00

text_261b:
	.asc "Fruit of Spirit-Pear"
	.db $00

text_2630:
	.asc "Represents Meekness"
	.db $00

text_2644:
	.asc "Fruit - Pomegranate"
	.db $00

text_2658:
	.asc "Represents Love"
	.db $00

text_2668:
	.asc "Fruit - Apple"
	.db $00

text_2676:
	.asc "Represents Patience"
	.db $00

text_268a:
	.asc "Fruit - Grapes"
	.db $00

text_2699:
	.asc "Represents Joy"
	.db $00

text_26a8:
	.asc "Fruit - Banana"
	.db $00

text_26b7:
	.asc "Represents Faith"
	.db $00

text_26c8:
	.asc "Use this to end game"
	.db $00

text_26dd:
	.asc "and get a password"
	.db $00


drawInventoryItemDescription:
	push de
	ld   de, $9a20
	call dPlusEquScreen1displayOffset
	push de
	call waitUntilStartOfVBlankPeriod
	pop  de
	pop  hl
	ld   c, $14

-
	ldi  a, (hl)
	cp   $00
	jr   z, +

	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	ret

+
	ld   a, $20

-
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	ret


adjustCurrentSelectedBItem:
	ld   hl, checkBitemsSelectable
	call jpHLinBank4
	ld   hl, wSpecialItemsGottenByte
	ld   a, (hl)
	cp   $00
	jr   nz, @bigLoop

// no special items gotten
	ld   hl, wInventorySelectedYIdx
	ld   a, (hl)
	cp   $00
	jr   nz, @done

// y = 0, default to going to map
	ld   hl, wInventorySelectedXIdx
	ld   (hl), $08
	jr   @done

@bigLoop:
	ld   hl, wInventorySelectedXIdx
	ld   c, (hl)
	ld   b, $00

// correct ff to 8 (map)
	bit  7, c
	jr   nz, ++

// loop 9 to 0
	ld   a, c
	cp   $09
	jr   z, +

// if on 8 already, no need to do anything
	cp   $08
	jr   z, @done

// done if our cursor is on a b item we have
	ld   hl, bitTable
	add  hl, bc
	ld   a, (hl)
	ld   hl, wSpecialItemsGottenByte
	and  (hl)
	jr   nz, @done

// adjust cursor
	ld   hl, wInventorySelectedXIdx
	ld   a, (hl)
	ld   hl, wInventoryBitemXChange
	add  (hl)
	ld   hl, wInventorySelectedXIdx
	ld   (hl), a
	jp   @bigLoop

+
	ld   hl, wInventorySelectedXIdx
	ld   (hl), $00
	jp   @bigLoop

++
	ld   hl, wInventorySelectedXIdx
	ld   (hl), $08
	jp   @bigLoop

@done:
	ret


setAtoHL_deBytes:
-
	dec  de
	bit  7, d
	jr   nz, _f

	ldi  (hl), a
	jr   -

__	ret


copyMemoryBC:
-
	dec  bc
	bit  7, b
	jr   nz, _b

	ldi  a, (hl)
	ld   (de), a
	inc  de
	jr   -


copyMemoryCinVBlank_updateSounds:
	push hl
	call waitUntilNextVBlankPeriod
	pop  hl

-
	ldi  a, (hl)
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	call call_updateSounds
	ret


stopSoundsPlaySound0AtNormalSpeed:
	call stopHWSoundChannels012
	call onlyProcessInstructionsAfterIfMusicOn

	ld   a, SND_00
	ld   hl, wSoundToPlayIdx
	ld   (hl), a
	ld   a, $00
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a
	jp   play3soundChannels_6choicesIdxed_c009


onlyProcessInstructionsAfterIfMusicOn:
	ld   hl, wIsMusicOff
	ld   a, (hl)
	cp   $00
	jr   z, @done

	pop  hl

@done:
	ret


stopSoundsPlaySound5AtNormalSpeed:
	call stopHWSoundChannels012
	call onlyProcessInstructionsAfterIfMusicOn

	ld   a, SND_05
	ld   hl, wSoundToPlayIdx
	ld   (hl), a
	ld   a, $00
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a
	jp   play3soundChannels_6choicesIdxed_c009


stopSoundsPlaySound1AtNormalSpeed:
	call stopHWSoundChannels012
	call onlyProcessInstructionsAfterIfMusicOn

	ld   a, SND_01
	ld   hl, wSoundToPlayIdx
	ld   (hl), a
	ld   a, $00
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a
	jp   play3soundChannels_6choicesIdxed_c009


stopSoundsPlaySound2AtTwiceSpeed:
	call stopHWSoundChannels012
	ld   a, SND_02
	ld   hl, wSoundToPlayIdx
	ld   (hl), a
	ld   a, $ff
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a
	jp   play3soundChannels_6choicesIdxed_c009


stopSoundsPlaySound4AtNormalSpeed:
	call stopHWSoundChannels012
	call onlyProcessInstructionsAfterIfMusicOn

	ld   a, SND_04
	ld   hl, wSoundToPlayIdx
	ld   (hl), a
	ld   a, $00
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a
	jp   play3soundChannels_6choicesIdxed_c009


playSoundEffect20h:
	push af
	ld   a, SND_20
	jp   _safeplaySoundEffectInTableIdxedA_channel3or4


playSoundEffect12h:
	push af
	ld   a, SND_12
	jp   _safeplaySoundEffectInTableIdxedA_channel3or4


playSoundEffect22h:
	push af
	ld   a, SND_22
	jp   _safeplaySoundEffectInTableIdxedA_channel3or4


playSoundFhIfOff22hIfOn:
	push af
	ld   a, SND_0f
	push af
	ld   a, SND_22

play1stSoundIfMusicOff2ndIfOn:
	ld   hl, wSoundToPlayIdx
	ld   (hl), a
	ld   hl, wIsMusicOff
	ld   a, (hl)
	cp   $00
	jr   z, +

// music off
	pop  af
	ld   hl, wSoundToPlayIdx
	ld   (hl), a
	push af

+
	pop  af
	ld   hl, wSoundToPlayIdx
	ld   a, (hl)
	jp   _safeplaySoundEffectInTableIdxedA_channel3or4


playSoundEffect23h:
	push af
	ld   a, SND_23
	jp   _safeplaySoundEffectInTableIdxedA_channel3or4


playSoundEffect23h2:
	push af
	ld   a, SND_23
	jp   _safeplaySoundEffectInTableIdxedA_channel3or4


playSound1bhIfOff24hIfOn:
	push af
	ld   a, SND_1b
	push af
	ld   a, SND_24
	jp   play1stSoundIfMusicOff2ndIfOn


playSoundChIfOff25hIfOn:
	push af
	ld   a, SND_0c
	push af
	ld   a, SND_25
	jp   play1stSoundIfMusicOff2ndIfOn


playSoundChIfOff26hIfOn:
	push af
	ld   a, SND_0c
	push af
	ld   a, SND_26
	jp   play1stSoundIfMusicOff2ndIfOn


playSoundEffect27h:
	push af
	ld   a, SND_27
	jp   _safeplaySoundEffectInTableIdxedA_channel3or4


playSound9hIfOff28hIfOn:
	push af
	ld   a, SND_09
	push af
	ld   a, SND_28
	jp   play1stSoundIfMusicOff2ndIfOn


playSoundEffect29h:
	push af
	ld   a, SND_29

_safeplaySoundEffectInTableIdxedA_channel3or4:
	push bc
	push de
	push hl
	call playSoundEffectInTableIdxedA_channel3or4
	pop  hl
	pop  de
	pop  bc
	pop  af
	ret


playerTakeDamage:
	ld   hl, $c08b
	ld   e, (hl)                                     ; $2878: $5e
	ld   d, $00                                      ; $2879: $16 $00
	ld   a, e                                        ; $287b: $7b
	cp   $00                                         ; $287c: $fe $00
	jp   nz, @done                           ; $287e: $c2 $16 $29

// if base damage is ever ff, this is an insta-kill
	ld   hl, wBaseDamageTaken
	ld   a, (hl)
	cp   $ff
	jr   z, @afterPlayerDead

// always take damage if bit 7 set
	cp   $80                                         ; $2889: $fe $80
	jr   nc, +                             ; $288b: $30 $09

// bit 7 unset, dont apply damage if invincible
	ld   hl, wPlayerInvincibilityCounter
	ld   a, (hl)
	cp   $00
	jp   nz, @done

+
// start modifying damage from armours
	ld   hl, wBaseDamageTaken
	ld   a, (hl)
	and  $7f
	ld   hl, wModifiedDamageTaken
	ld   (hl), a

	ld   hl, wArmorOfGodGotten
	ld   a, (hl)
	and  AOG_SHIELD|AOG_ARMOUR
	jr   z, @takeDamage

// shield or armor gotten
	cp   AOG_SHIELD|AOG_ARMOUR
	jr   z, @bothShieldAndArmor

// 1 of shield or armor gotten
	call applyOneHalfDamage
	jp   @takeDamage

@bothShieldAndArmor:
	call applyOneThirdDamage

@takeDamage:
// c0a0 is damage player took
	ld   hl, wPlayerHealth
	ld   a, (hl)
	ld   hl, wModifiedDamageTaken
	sub  (hl)
	ld   hl, wPlayerHealth
	ld   (hl), a

	jr   z, @playerDead

	jr   nc, @playerAlive

@playerDead:
	ld   (hl), $00
	jp   @afterPlayerDead

@playerAlive:
// redundant copy into player health
	ld   (hl), a

// set inv counter
	ld   a, $4b
	ld   hl, wPlayerInvincibilityCounter
	ld   (hl), a

	ld   e, $00                                      ; $28d1: $1e $00

	ld   hl, wCurrNpcMovingDir                                   ; $28d3: $21 $24 $c0
	ld   a, (hl)                                     ; $28d6: $7e
	ld   hl, $c026                                   ; $28d7: $21 $26 $c0
	ld   (hl), a                                     ; $28da: $77
	cp   $ff                                         ; $28db: $fe $ff
	jr   z, +                              ; $28dd: $28 $05

	call playSoundEffect22h
	ld   e, $08

+
	ld   hl, $c027                                   ; $28e4: $21 $27 $c0
	ld   (hl), e                                     ; $28e7: $73
	jp   @done                               ; $28e8: $c3 $16 $29

@afterPlayerDead:
	ld   de, $0013                                   ; $28eb: $11 $13 $00
	ld   hl, data_09fd                                   ; $28ee: $21 $fd $09
	add  hl, de                                      ; $28f1: $19

// $06
	ld   a, (hl)                                     ; $28f2: $7e
	ld   hl, $c08c                                   ; $28f3: $21 $8c $c0
	ld   (hl), a                                     ; $28f6: $77

// $13
	ld   hl, $c08b                                   ; $28f7: $21 $8b $c0
	ld   (hl), e                                     ; $28fa: $73

// face down
	ld   a, $40|DIR_DOWN
	ld   hl, wPlayerIdxIntoGenericVramForTile
	ld   (hl), a

// base animation idx is death
	ld   a, $00
	ld   hl, wPlayerAnimationIdx
	ld   (hl), a

// reset attr if facing left
	ld   a, $00
	ld   hl, wPlayerOamAttr
	ld   (hl), a

// set to flash player
	ld   a, $ff
	ld   hl, wPlayerInvincibilityCounter
	ld   (hl), a
	call stopSoundsPlaySound2AtTwiceSpeed

@done:
	ret


// wCounterSo2ArmorIsAThirdDamageTaken is incremented in a way
// such that over time only 1/3 damage is taken with 2 armors equipped
applyOneHalfDamage:
	ld   a, $02
	call halveDamageTaken
	ld   hl, wCounterSo2ArmorIsAThirdDamageTaken
	ld   a, (hl)
	cp   $04
	jr   c, +

	ld   hl, wModifiedDamageTaken
	inc  (hl)

+
	and  $03
	ld   hl, wCounterSo2ArmorIsAThirdDamageTaken
	ld   (hl), a
	ret


halveDamageTaken:
	ld   hl, wDamageModifierParam
	ld   (hl), a
	ld   hl, wModifiedDamageTaken
	srl  (hl)
	jr   nc, @done

// c0d9 += function param
	ld   hl, wCounterSo2ArmorIsAThirdDamageTaken
	ld   a, (hl)
	ld   hl, wDamageModifierParam
	add  (hl)
	ld   hl, wCounterSo2ArmorIsAThirdDamageTaken
	ld   (hl), a

@done:
	ret


applyOneThirdDamage:
	ld   a, $01
	call halveDamageTaken
	jp   applyOneHalfDamage


Call_000_294f:
	ld   hl, $c08c                                   ; $294f: $21 $8c $c0
	dec  (hl)                                        ; $2952: $35
	jr   nz, @done                             ; $2953: $20 $2c

	add  $02                                         ; $2955: $c6 $02
	ld   hl, $c08b                                   ; $2957: $21 $8b $c0
	ld   (hl), a                                     ; $295a: $77

	ld   e, a                                        ; $295b: $5f
	ld   d, $00                                      ; $295c: $16 $00
	ld   hl, data_09fd                                   ; $295e: $21 $fd $09
	add  hl, de                                      ; $2961: $19
	ld   a, (hl)                                     ; $2962: $7e
	cp   $00                                         ; $2963: $fe $00
	jr   nz, +                             ; $2965: $20 $0d

	ld   hl, $c08b                                   ; $2967: $21 $8b $c0
	ld   (hl), a                                     ; $296a: $77

	ld   a, $01                                      ; $296b: $3e $01
	ld   hl, $c08d                                   ; $296d: $21 $8d $c0
	ld   (hl), a                                     ; $2970: $77
	jp   @next_2978                               ; $2971: $c3 $78 $29

+
	ld   hl, $c08c                                   ; $2974: $21 $8c $c0
	ld   (hl), a                                     ; $2977: $77

@next_2978:
	ld   hl, data_09fc                                   ; $2978: $21 $fc $09
	add  hl, de                                      ; $297b: $19
	ld   a, (hl)                                     ; $297c: $7e
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $297d: $21 $56 $c0
	ld   (hl), a                                     ; $2980: $77

@done:
	ret                                              ; $2981: $c9


checkUsingItems:
	ld   hl, $c05d                                   ; $2982: $21 $5d $c0
	ld   a, (hl)                                     ; $2985: $7e
	cp   $00                                         ; $2986: $fe $00
	jr   nz, @ret                             ; $2988: $20 $4f

	ld   hl, wNewKeysPressed
	ld   a, (hl)
	and  PADF_A
	jr   z, @notUsingFruit

	ld   hl, wKeysPressed
	ld   a, (hl)
	and  PADF_A
	jr   z, @notUsingFruit

// using A item (fruit)
	ld   hl, wCurrFruitOnScreen
	ld   a, (hl)
	ld   hl, wCurrFruitAmount
	cp   (hl)
	jr   nc, @notUsingFruit

	call processUsingFruit
	ret

@notUsingFruit:
	ld   hl, wNewKeysPressed
	ld   a, (hl)
	and  PADF_B
	jr   z, @ret

	ld   hl, wKeysPressed
	ld   a, (hl)
	and  PADF_B
	jr   z, @ret

	ld   hl, wEquippedBItem
	ld   a, (hl)
	cp   EQUIPB_BOMBS
	jr   nz, @usingNonBombBitem

// b item is vial bombs
	ld   hl, $c02a                                   ; $29c0: $21 $2a $c0
	ld   a, (hl)                                     ; $29c3: $7e
	cp   $00                                         ; $29c4: $fe $00
	jr   nz, @ret                             ; $29c6: $20 $11

	ld   hl, wNumBombs                                   ; $29c8: $21 $3b $c0
	ld   a, (hl)                                     ; $29cb: $7e
	cp   $00                                         ; $29cc: $fe $00
	jr   z, @ret                              ; $29ce: $28 $09

// have more than 0 bombs
	ld   a, $00                                      ; $29d0: $3e $00

@Jump_000_29d2:
	ld   hl, wMenuCursorIdx                                   ; $29d2: $21 $11 $c7
	ld   (hl), a                                     ; $29d5: $77
	call processUsingBombs                               ; $29d6: $cd $51 $34

@ret:
	ret                                              ; $29d9: $c9

@usingNonBombBitem:
	cp   EQUIPB_JAWBONE                                         ; $29da: $fe $01
	jr   z, +                              ; $29dc: $28 $08

// throwing sword
	ld   hl, $c02a                                   ; $29de: $21 $2a $c0
	ld   a, (hl)                                     ; $29e1: $7e
	cp   $00                                         ; $29e2: $fe $00
	jr   nz, @ret                             ; $29e4: $20 $f3

+
	call processUsingJawboneOrSword                               ; $29e6: $cd $6d $2c
	ret                                              ; $29e9: $c9


Call_000_29ea:
	ld   hl, $c027                                   ; $29ea: $21 $27 $c0
	ld   a, (hl)                                     ; $29ed: $7e
	cp   $00                                         ; $29ee: $fe $00
	jr   z, jr_000_2a5a                              ; $29f0: $28 $68

	ld   hl, $c027                                   ; $29f2: $21 $27 $c0
	dec  (hl)                                        ; $29f5: $35
	ld   hl, $c026                                   ; $29f6: $21 $26 $c0
	ld   a, (hl)                                     ; $29f9: $7e
	cp   $09                                         ; $29fa: $fe $09
	jr   z, jr_000_2a45                              ; $29fc: $28 $47

	cp   $06                                         ; $29fe: $fe $06
	jr   z, jr_000_2a30                              ; $2a00: $28 $2e

	cp   $03                                         ; $2a02: $fe $03
	jr   z, jr_000_2a1b                              ; $2a04: $28 $15

	ld   hl, wPlayerInvincibilityCounter                                   ; $2a06: $21 $25 $c0
	ld   a, (hl)                                     ; $2a09: $7e
	cp   $00                                         ; $2a0a: $fe $00
	jr   z, jr_000_2a17                              ; $2a0c: $28 $09

	call func_4f43                                       ; $2a0e: $cd $43 $4f
	call func_4f43                                       ; $2a11: $cd $43 $4f
	call func_4f43                                       ; $2a14: $cd $43 $4f

jr_000_2a17:
	call func_4f43                                       ; $2a17: $cd $43 $4f
	ret                                              ; $2a1a: $c9


jr_000_2a1b:
	ld   hl, wPlayerInvincibilityCounter                                   ; $2a1b: $21 $25 $c0
	ld   a, (hl)                                     ; $2a1e: $7e
	cp   $00                                         ; $2a1f: $fe $00
	jr   z, jr_000_2a2c                              ; $2a21: $28 $09

	call func_4f87                                       ; $2a23: $cd $87 $4f
	call func_4f87                                       ; $2a26: $cd $87 $4f
	call func_4f87                                       ; $2a29: $cd $87 $4f

jr_000_2a2c:
	call func_4f87                                       ; $2a2c: $cd $87 $4f
	ret                                              ; $2a2f: $c9


jr_000_2a30:
	ld   hl, wPlayerInvincibilityCounter                                   ; $2a30: $21 $25 $c0
	ld   a, (hl)                                     ; $2a33: $7e
	cp   $00                                         ; $2a34: $fe $00
	jr   z, jr_000_2a41                              ; $2a36: $28 $09

	call func_4fb7                                       ; $2a38: $cd $b7 $4f
	call func_4fb7                                       ; $2a3b: $cd $b7 $4f
	call func_4fb7                                       ; $2a3e: $cd $b7 $4f

jr_000_2a41:
	call func_4fb7                                       ; $2a41: $cd $b7 $4f
	ret                                              ; $2a44: $c9


jr_000_2a45:
	ld   hl, wPlayerInvincibilityCounter                                   ; $2a45: $21 $25 $c0
	ld   a, (hl)                                     ; $2a48: $7e
	cp   $00                                         ; $2a49: $fe $00
	jr   z, jr_000_2a56                              ; $2a4b: $28 $09

	call func_4f13                                       ; $2a4d: $cd $13 $4f
	call func_4f13                                       ; $2a50: $cd $13 $4f
	call func_4f13                                       ; $2a53: $cd $13 $4f

jr_000_2a56:
	call func_4f13                                       ; $2a56: $cd $13 $4f
	ret                                              ; $2a59: $c9


jr_000_2a5a:
// if c714 non-zero (eg on stairs), or using raft, only process input every main loop
	ld   hl, wPlayerMovementSlowed
	ld   a, (hl)
	ld   hl, wIsUsingRaft
	or   (hl)
	ld   hl, wMainLoopCounter
	and  (hl)
	and  $01
	jr   z, +

	ret

+
	ld   a, $00                                      ; $2a6b: $3e $00
	ld   hl, $c04d                                   ; $2a6d: $21 $4d $c0
	ld   (hl), a                                     ; $2a70: $77
	ld   hl, wKeysPressed                                   ; $2a71: $21 $16 $c0
	ld   a, (hl)                                     ; $2a74: $7e
	and  PADF_DOWN|PADF_UP|PADF_LEFT|PADF_RIGHT                                         ; $2a75: $e6 $f0
	jr   nz, jr_000_2a7f                             ; $2a77: $20 $06

// no directionals pressed
	ld   a, $00                                      ; $2a79: $3e $00
	ld   hl, $c053                                   ; $2a7b: $21 $53 $c0
	ld   (hl), a                                     ; $2a7e: $77

jr_000_2a7f:
	cp   $20                                         ; $2a7f: $fe $20
	jr   z, jr_000_2a8c                              ; $2a81: $28 $09

	ld   a, $00                                      ; $2a83: $3e $00
	ld   hl, $c083                                   ; $2a85: $21 $83 $c0
	ld   (hl), a                                     ; $2a88: $77
	jp   Jump_000_2a98                               ; $2a89: $c3 $98 $2a


jr_000_2a8c:
	ld   hl, $c087                                   ; $2a8c: $21 $87 $c0
	inc  (hl)                                        ; $2a8f: $34
	jr   nz, jr_000_2a98                             ; $2a90: $20 $06

	ld   a, $01                                      ; $2a92: $3e $01
	ld   hl, $c087                                   ; $2a94: $21 $87 $c0
	ld   (hl), a                                     ; $2a97: $77

Jump_000_2a98:
jr_000_2a98:
	ld   hl, wKeysPressed                                   ; $2a98: $21 $16 $c0
	ld   a, (hl)                                     ; $2a9b: $7e
	and  PADF_DOWN|PADF_UP|PADF_LEFT|PADF_RIGHT                                         ; $2a9c: $e6 $f0
	cp   PADF_RIGHT                                         ; $2a9e: $fe $10
	jr   z, jr_000_2aab                              ; $2aa0: $28 $09

	ld   a, $00                                      ; $2aa2: $3e $00
	ld   hl, $c084                                   ; $2aa4: $21 $84 $c0
	ld   (hl), a                                     ; $2aa7: $77
	jp   Jump_000_2ab7                               ; $2aa8: $c3 $b7 $2a

// only direction pressed is right
jr_000_2aab:
	ld   hl, $c088                                   ; $2aab: $21 $88 $c0
	inc  (hl)                                        ; $2aae: $34
	jr   nz, Jump_000_2ab7                             ; $2aaf: $20 $06

	ld   a, $01                                      ; $2ab1: $3e $01
	ld   hl, $c088                                   ; $2ab3: $21 $88 $c0
	ld   (hl), a                                     ; $2ab6: $77

Jump_000_2ab7:
	ld   hl, wKeysPressed                                   ; $2ab7: $21 $16 $c0
	ld   a, (hl)                                     ; $2aba: $7e
	and  PADF_DOWN|PADF_UP|PADF_LEFT|PADF_RIGHT                                         ; $2abb: $e6 $f0
	cp   PADF_UP                                         ; $2abd: $fe $40
	jr   z, jr_000_2aca                              ; $2abf: $28 $09

	ld   a, $00                                      ; $2ac1: $3e $00
	ld   hl, $c085                                   ; $2ac3: $21 $85 $c0
	ld   (hl), a                                     ; $2ac6: $77
	jp   Jump_000_2ad6                               ; $2ac7: $c3 $d6 $2a

// only direction pressed is up
jr_000_2aca:
	ld   hl, $c089                                   ; $2aca: $21 $89 $c0
	inc  (hl)                                        ; $2acd: $34
	jr   nz, Jump_000_2ad6                             ; $2ace: $20 $06

	ld   a, $01                                      ; $2ad0: $3e $01
	ld   hl, $c089                                   ; $2ad2: $21 $89 $c0
	ld   (hl), a                                     ; $2ad5: $77

Jump_000_2ad6:
	ld   hl, wKeysPressed                                   ; $2ad6: $21 $16 $c0
	ld   a, (hl)                                     ; $2ad9: $7e
	and  PADF_DOWN|PADF_UP|PADF_LEFT|PADF_RIGHT                                         ; $2ada: $e6 $f0
	cp   PADF_DOWN                                         ; $2adc: $fe $80
	jr   z, @pressedNonDownDirection                              ; $2ade: $28 $09

// pressed down
	ld   a, $00                                      ; $2ae0: $3e $00
	ld   hl, $c086                                   ; $2ae2: $21 $86 $c0
	ld   (hl), a                                     ; $2ae5: $77
	jp   Jump_000_2af5                               ; $2ae6: $c3 $f5 $2a

// only direction pressed is down
@pressedNonDownDirection:
	ld   hl, $c08a                                   ; $2ae9: $21 $8a $c0
	inc  (hl)                                        ; $2aec: $34
	jr   nz, Jump_000_2af5                             ; $2aed: $20 $06

	ld   a, $01                                      ; $2aef: $3e $01
	ld   hl, $c08a                                   ; $2af1: $21 $8a $c0
	ld   (hl), a                                     ; $2af4: $77

Jump_000_2af5:
	ld   hl, wKeysPressed                                   ; $2af5: $21 $16 $c0
	ld   a, (hl)                                     ; $2af8: $7e
	and  PADF_LEFT                                         ; $2af9: $e6 $20
	jr   z, @notPressedLeft                              ; $2afb: $28 $06

	call checkTransitioningToLeftScreen                                       ; $2afd: $cd $5b $4c
	jp   @afterHorizButtonCheck                               ; $2b00: $c3 $0e $2b

@notPressedLeft:
	ld   hl, wKeysPressed                                   ; $2b03: $21 $16 $c0
	ld   a, (hl)                                     ; $2b06: $7e
	and  PADF_RIGHT                                         ; $2b07: $e6 $10
	jr   z, @afterHorizButtonCheck                              ; $2b09: $28 $03

	call checkTransitioningToRightScreen                                       ; $2b0b: $cd $de $4c

@afterHorizButtonCheck:
	ld   hl, wKeysPressed                                   ; $2b0e: $21 $16 $c0
	ld   a, (hl)                                     ; $2b11: $7e
	and  PADF_UP                                         ; $2b12: $e6 $40
	jr   z, @notPressedUp                              ; $2b14: $28 $06

	call checkTransitioningToAboveScreen                                       ; $2b16: $cd $89 $4d
	jp   @afterVertButtonCheck                               ; $2b19: $c3 $27 $2b

@notPressedUp:
	ld   hl, wKeysPressed                                   ; $2b1c: $21 $16 $c0
	ld   a, (hl)                                     ; $2b1f: $7e
	and  PADF_DOWN                                         ; $2b20: $e6 $80
	jr   z, @afterVertButtonCheck                              ; $2b22: $28 $03

	call checkTransitioningToBelowScreen                                       ; $2b24: $cd $0c $4e

@afterVertButtonCheck:
	ld   a, $00                                      ; $2b27: $3e $00
	ld   hl, wMenuCursorIdx                                   ; $2b29: $21 $11 $c7
	ld   (hl), a                                     ; $2b2c: $77

	ld   hl, wPlayerX                                   ; $2b2d: $21 $52 $c0
	ld   c, (hl)                                     ; $2b30: $4e
	ld   b, $00                                      ; $2b31: $06 $00
	ld   hl, wPlayerY                                   ; $2b33: $21 $54 $c0
	ld   e, (hl)                                     ; $2b36: $5e
	ld   d, $00                                      ; $2b37: $16 $00

	call splitCEintoItsNybbles
	call getTileCoordsPlayerOrBItemIsOnAndCheckCollision
	ret


deEquPlayerYplus_c04a:
	ld   hl, wPlayerY
	ld   a, (hl)                                     ; $2b43: $7e
	ld   hl, wPlayerOrEntityYCollisionAdjust                                   ; $2b44: $21 $4a $c0
	add  (hl)                                        ; $2b47: $86
	ld   e, a                                        ; $2b48: $5f
	ld   d, $00                                      ; $2b49: $16 $00
	ret                                              ; $2b4b: $c9


processUsingFruit:
	ld   hl, wTimeUntilCanUseFruitAgain
	ld   a, (hl)
	cp   $00
	jr   z, +

	ret

+
	ld   bc, $0000

@loop:
	ld   hl, wCurrentFruitTiles
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   z, @setNewFruitDetails

	inc  bc
	ld   a, c
	cp   NUM_FRUITS_ON_SCREEN
	jr   c, @loop

	ret

@notCreateFruit:
	ld   a, $00
	ld   hl, wCurrentFruitTiles
	add  hl, bc
	ld   (hl), a
	ret

@setNewFruitDetails:
// set fruit's tile
	ld   hl, wCurrFruitTileIdx
	ld   a, (hl)
	ld   hl, wCurrentFruitTiles
	add  hl, bc
	ld   (hl), a

	ld   hl, wNumFruitsCreated
	inc  (hl)

	ld   hl, wNewItemTypeBaseXoffset
	ld   (hl), $04
	ld   hl, wNewItemTypeDirXoffset
	ld   (hl), $02
	ld   hl, wNewItemTypeDirYoffset
	ld   (hl), $04
	call setItemInitialPositionAndDir
	jr   c, @notCreateFruit

// item was created due to being on-screen, set pos and dir
	ld   hl, wNewItemInitialX
	ld   a, (hl)
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   (hl), a

	ld   hl, wNewItemInitialY
	ld   a, (hl)
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   (hl), a

	ld   hl, wNewItemInitialDir
	ld   a, (hl)
	ld   hl, wCurrFruitDirs
	add  hl, bc
	ld   (hl), a

// copy base data
	ld   hl, wCurrFruitTimeOnScreen
	ld   a, (hl)
	ld   hl, wCurrFruitOnScreenCounter
	add  hl, bc
	ld   (hl), a

	ld   hl, wCurrFruitBaseSpeed
	ld   a, (hl)
	ld   hl, wCurrFruitSpeeds
	add  hl, bc
	ld   (hl), a

// copy fruit flags
	ld   hl, wCurrFruitBaseFlags
	ld   a, (hl)
	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   (hl), a

	and  $20
	jr   z, @afterCheckingIfGrape

// grape
	ld   hl, wNumFruitsCreated
	ld   a, (hl)
	and  $03

// get 1 of 3 angles
	ld   e, a
	ld   d, $00
	ld   hl, @grapeAngles
	add  hl, de
	ld   a, (hl)

// or with c0f4
	ld   hl, wCurrFruitFlags
	add  hl, bc
	or   (hl)
	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   (hl), a

@afterCheckingIfGrape:
	ld   a, $04
	ld   hl, wTimeUntilCanUseFruitAgain
	ld   (hl), a

// 1 extra fruit on screen
	ld   hl, wCurrFruitOnScreen
	inc  (hl)
	call playSound1bhIfOff24hIfOn
	ret

@grapeAngles:
	.db $00 $01 $00 $02


// get offsets for b/a item
// c009/a/b is 4/2/4 for fuit, 0/0/0 for b item
setItemInitialPositionAndDir:
// x offset for item into c006
	ld   hl, wPlayerX
	ld   a, (hl)
	ld   hl, wNewItemTypeBaseXoffset
	add  (hl)
	ld   hl, wNewItemInitialX
	ld   (hl), a

	ld   hl, wPlayerIdxIntoGenericVramForTile
	ld   a, (hl)
	cp   $40|DIR_DOWN
	jr   c, @notDown

// if down, add y offset into c007
	ld   hl, wPlayerY
	ld   a, (hl)
	ld   hl, wNewItemTypeDirYoffset
	add  (hl)
	ld   hl, wNewItemInitialY
	ld   (hl), a

	ld   a, DIR_DOWN

@setDir_clearCF:
	ld   hl, wNewItemInitialDir
	ld   (hl), a
	scf
	ccf
	ret

@notDown:
	cp   $40|DIR_UP
	jr   c, @horiz

// up
	ld   hl, wPlayerY
	ld   a, (hl)
	ld   hl, wNewItemTypeDirYoffset
	sub  (hl)
	jr   c, @scfRet

	ld   hl, wNewItemInitialY
	ld   (hl), a
	ld   a, DIR_UP
	jp   @setDir_clearCF

@horiz:
	ld   hl, wPlayerY
	ld   a, (hl)
	ld   hl, wNewItemInitialY
	ld   (hl), a
	ld   hl, wPlayerOamAttr
	ld   a, (hl)
	and  $20
	jr   z, @right

// facing left
	ld   hl, wNewItemInitialX
	ld   a, (hl)
	ld   hl, wNewItemTypeDirXoffset
	sub  (hl)
	jr   c, @scfRet

	ld   hl, wNewItemInitialX
	ld   (hl), a
	ld   a, DIR_LEFT
	jp   @setDir_clearCF

@right:
	ld   hl, wNewItemInitialX
	ld   a, (hl)
	ld   hl, wNewItemTypeDirXoffset
	add  (hl)
	jr   c, @scfRet

	ld   hl, wNewItemInitialX
	ld   (hl), a
	ld   a, DIR_RIGHT
	jp   @setDir_clearCF

@scfRet:
	scf
	ret


processUsingJawboneOrSword:
	ld   hl, wJawboneOrSwordTimeUntilReuse
	ld   a, (hl)
	cp   $00
	jr   nz, @done

// can reuse jawbone/sword
	ld   hl, wNewItemTypeBaseXoffset
	ld   (hl), $00
	ld   hl, wNewItemTypeDirXoffset
	ld   (hl), $00
	ld   hl, wNewItemTypeDirYoffset
	ld   (hl), $00
// dont proceed if out of bounds
	call setItemInitialPositionAndDir
	jr   c, @done

	ld   hl, wNewItemInitialX
	ld   a, (hl)
	ld   hl, wJawboneOrSwordXval
	ld   (hl), a

	ld   hl, wNewItemInitialY
	ld   a, (hl)
	ld   hl, wJawboneOrSwordYval
	ld   (hl), a

	ld   hl, wNewItemInitialDir
	ld   a, (hl)
	ld   hl, wJawboneOrSwordDir
	ld   (hl), a

	ld   hl, wEquippedBItem
	ld   a, (hl)
	cp   EQUIPB_JAWBONE
	jr   z, @jawbone

// sword
	ld   a, $1e
	ld   hl, wJawboneOrSwordTimeUntilReuse
	ld   (hl), a
	jp   @done

@jawbone:
	ld   a, $5a
	ld   hl, wJawboneOrSwordTimeUntilReuse
	ld   (hl), a

	ld   de, sound_1771
	call playSoundEffectInDE_channel3or4

@done:
	ret


updateJawboneOrSword:
	ld   hl, wJawboneOrSwordTimeUntilReuse
	ld   a, (hl)
	cp   $00
	jr   nz, +

	ret

+
// proceed if item exists
	bit  7, a
	jr   nz, @previouslySetOutOfBounds

// bit 7 clear on reuse time
	ld   hl, wJawboneOrSwordTimeUntilReuse
	dec  (hl)
	jr   z, @outOfBounds

// c00d is 2 for jawbone, 4 for sword (speed)
	ld   hl, wEquippedBItem
	ld   a, (hl)
	sla  a
	ld   hl, wJawboneOrSwordMoveOffset
	ld   (hl), a

	ld   hl, wJawboneOrSwordDir
	ld   a, (hl)
	cp   DIR_UP
	jr   nz, +

// item going up
	ld   hl, wJawboneOrSwordYval
	ld   a, (hl)
	ld   hl, wJawboneOrSwordMoveOffset
	sub  (hl)
	jr   c, @outOfBounds

	ld   hl, wJawboneOrSwordYval
	ld   (hl), a
	jp   @afterMoving

+
	cp   DIR_DOWN
	jr   nz, +

// item going down
	ld   hl, wJawboneOrSwordYval
	ld   a, (hl)
	ld   hl, wJawboneOrSwordMoveOffset
	add  (hl)
	cp   $a0
	jr   nc, @outOfBounds

	ld   hl, wJawboneOrSwordYval
	ld   (hl), a
	jp   @afterMoving

+
	cp   DIR_LEFT
	jr   nz, +

// item going left
	ld   hl, wJawboneOrSwordXval
	ld   a, (hl)
	ld   hl, wJawboneOrSwordMoveOffset
	sub  (hl)
	jr   c, @outOfBounds

	ld   hl, wJawboneOrSwordXval
	ld   (hl), a
	jp   @afterMoving

+
// item going right
	ld   hl, wJawboneOrSwordXval
	ld   a, (hl)
	ld   hl, wJawboneOrSwordMoveOffset
	add  (hl)
	cp   $f0
	jr   nc, @outOfBounds

	ld   hl, wJawboneOrSwordXval
	ld   (hl), a
	jp   @afterMoving

@outOfBounds:
	ld   a, $ff
	ld   hl, wJawboneOrSwordTimeUntilReuse
	ld   (hl), a

	ld   hl, wEquippedBItem
	ld   a, (hl)
	cp   EQUIPB_JAWBONE
	jr   z, @afterMoving

	jp   @swordJustOutOfBounds

@previouslySetOutOfBounds:
// counter for axis jawbone shares with player, ie 2 means returned
	ld   bc, $0000

	ld   hl, wPlayerX
	ld   a, (hl)
	ld   hl, wJawboneOrSwordXval
	sub  (hl)
	jr   c, @playerLeftOfItem

	cp   $08
	jr   nc, @playerRightOfItem

	inc  bc

@playerRightOfItem:
// move to player
	inc  (hl)
	inc  (hl)
	jp   @afterMovingHorizToPlayer

@playerLeftOfItem:
	cp   $f8
	jr   c, +

// player similar x to jawbone
	inc  bc

+
	dec  (hl)
	jr   z, @afterMovingHorizToPlayer

	dec  (hl)

@afterMovingHorizToPlayer:
	ld   hl, wPlayerY
	ld   a, (hl)
	ld   hl, wJawboneOrSwordYval
	sub  (hl)
	jr   c, @playerAboveItem

	cp   $08
	jr   nc, @playerBelowItem

	inc  bc

@playerBelowItem:
// move jawbone south to player
	inc  (hl)
	inc  (hl)
	jp   @afterMovingVerticallyToPlayer

@playerAboveItem:
	cp   $f8
	jr   c, +

	inc  bc

+
	ld   hl, wJawboneOrSwordYval
	dec  (hl)
	jr   z, @afterMovingVerticallyToPlayer

	dec  (hl)
	ld   a, c

@afterMovingVerticallyToPlayer:
	cp   $02
	jr   nz, @afterMoving

// returned to player
	ld   a, $00
	ld   hl, wJawboneOrSwordTimeUntilReuse
	ld   (hl), a
	ret

@afterMoving:
// from here check npcs within bounding box
	ld   a, $ff                                      ; $2d91: $3e $ff
	ld   hl, wMenuCursorIdx                                   ; $2d93: $21 $11 $c7
	ld   (hl), a                                     ; $2d96: $77

// player coords in ec
	ld   hl, wPlayerX
	ld   c, (hl)
	ld   b, $00
	ld   hl, wPlayerY
	ld   e, (hl)
	ld   d, $00

// jawbone can collect items
	ld   hl, wJawboneOrSwordXval
	ld   c, (hl)
	ld   b, $00
	ld   hl, wJawboneOrSwordYval
	ld   e, (hl)
	ld   d, $00
	call splitCEintoItsNybbles
	call getTileCoordsPlayerOrBItemIsOnAndCheckCollision

// set top bounding box side
	ld   hl, wJawboneOrSwordYval
	ld   a, (hl)
	sub  $0e
	jr   nc, +
	ld   a, $00
+
	ld   hl, wItemTopBoundingBox
	ld   (hl), a

// bottom bounding box
	ld   hl, wJawboneOrSwordYval
	ld   a, (hl)
	add  $0e
	ld   hl, wItemBottomBoundingBox
	ld   (hl), a

// left bounding box
	ld   hl, wJawboneOrSwordXval
	ld   a, (hl)
	sub  $0e
	jr   nc, +
	ld   a, $00
+
	ld   hl, wItemLeftBoundingBox
	ld   (hl), a

// right bounding box
	ld   hl, wJawboneOrSwordXval
	ld   a, (hl)
	add  $0e
	jr   nc, +
	ld   a, $ff
+
	ld   hl, wItemRightBoundingBox
	ld   (hl), a

// check collision with npcs
	ld   bc, $0000

@checkNextNPC:
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)
	cp   $ff
	jr   nz, @processNPC

@gotoCheckNextNPC:
	inc  bc
	ld   a, c
	cp   NUM_NPCS
	jr   c, @checkNextNPC

	ret

@processNPC:
// check if npc is within bounding box
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wItemTopBoundingBox
	cp   (hl)
	jr   c, @gotoCheckNextNPC

	ld   hl, wItemBottomBoundingBox
	cp   (hl)
	jr   nc, @gotoCheckNextNPC

	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wItemLeftBoundingBox
	cp   (hl)
	jr   c, @gotoCheckNextNPC

	ld   hl, wItemRightBoundingBox
	cp   (hl)
	jr   nc, @gotoCheckNextNPC

// npc within bounding box
	ld   hl, wNPC2ndByteLower6Bits                                   ; $2e1e: $21 $84 $cb
	add  hl, bc                                      ; $2e21: $09
	ld   a, (hl)                                     ; $2e22: $7e
	or   $40                                         ; $2e23: $f6 $40
	ld   hl, wNPC2ndByteLower6Bits                                   ; $2e25: $21 $84 $cb
	add  hl, bc                                      ; $2e28: $09
	ld   (hl), a                                     ; $2e29: $77

	call getBit4ofNPCBytes_cb60                                       ; $2e2a: $cd $72 $73
	jr   nz, @gotoCheckNextNPC                             ; $2e2d: $20 $c6

// if bit 4 of cb60 set..
	ld   hl, wEquippedBItem                                   ; $2e2f: $21 $49 $c0
	ld   a, (hl)                                     ; $2e32: $7e
	cp   EQUIPB_SWORD                                         ; $2e33: $fe $02
	jr   nz, @bItemIsNotSword                             ; $2e35: $20 $14

// sword, if bit 2 set, ignore
	ld   hl, wNPCBytes_cbe4                                   ; $2e37: $21 $e4 $cb
	add  hl, bc                                      ; $2e3a: $09
	ld   a, (hl)                                     ; $2e3b: $7e
	and  $04                                         ; $2e3c: $e6 $04
	jr   nz, @gotoCheckNextNPC                             ; $2e3e: $20 $b5

@swordJustOutOfBounds:
	ld   a, $00                                      ; $2e40: $3e $00
	ld   hl, wJawboneOrSwordTimeUntilReuse                                   ; $2e42: $21 $cb $c6
	ld   (hl), a                                     ; $2e45: $77

// explosion immediately
	ld   a, $80                                      ; $2e46: $3e $80
	jp   checkUsingItems@Jump_000_29d2                               ; $2e48: $c3 $d2 $29

@bItemIsNotSword:
	ld   hl, wNPC2ndByteLower6Bits                                   ; $2e4b: $21 $84 $cb
	add  hl, bc                                      ; $2e4e: $09
	ld   a, (hl)                                     ; $2e4f: $7e
	bit  7, a                                        ; $2e50: $cb $7f
	jr   z, @gotoCheckNextNPC                              ; $2e52: $28 $a1

	call copy8npcMetadataBytesInto_c6d0                                       ; $2e54: $cd $c6 $72
	ld   hl, wCommonByteCopyDestBytes+4                                   ; $2e57: $21 $d4 $c6
	ld   a, (hl)                                     ; $2e5a: $7e
	cp   $ff                                         ; $2e5b: $fe $ff
	jr   z, @gotoCheckNextNPC                              ; $2e5d: $28 $96

	ld   hl, wNPCBytes_newID                                   ; $2e5f: $21 $c0 $cb
	add  hl, bc                                      ; $2e62: $09
	ld   (hl), a                                     ; $2e63: $77
	jp   @gotoCheckNextNPC                               ; $2e64: $c3 $f5 $2d


loadBWeaponDataToOam:
	ld   a, $20
	call getLastUsableOamIdx_fromA
	call clear2spritesInOam_1stIdxedE

	ld   hl, wJawboneOrSwordTimeUntilReuse
	ld   a, (hl)
	cp   $00
	jr   nz, +

	ret

+
// b item y
	ld   hl, wJawboneOrSwordYval
	ld   a, (hl)
	add  $10
	ld   hl, wSCYvalue
	sub  (hl)
	ld   hl, wOam
	add  hl, de
	ld   (hl), a
	ld   hl, wOam+4
	add  hl, de
	ld   (hl), a

// b item x
	ld   hl, wJawboneOrSwordXval
	ld   a, (hl)
	ld   hl, wSCXvalue
	sub  (hl)
	add  $08
	ld   hl, wOam+1
	add  hl, de
	ld   (hl), a
	add  $08
	ld   hl, wOam+5
	add  hl, de
	ld   (hl), a

// jawbone tiles
	ld   hl, wBitemTileIdxLeft
	ld   (hl), $90
	ld   hl, wBitemTileIdxRight
	ld   (hl), $92

	ld   hl, wEquippedBItem
	ld   a, (hl)
	cp   EQUIPB_JAWBONE
	jr   z, @jawboneEquipped

// sword equipped - horiz tiles first
	ld   hl, wBitemTileIdxLeft
	ld   (hl), $b4
	ld   hl, wBitemTileIdxRight
	ld   (hl), $b6

	ld   hl, wJawboneOrSwordDir
	ld   a, (hl)
	cp   DIR_RIGHT

// attr 0 if right
	ld   a, $00
	jr   z, @setTileAttr

// attr 20 if left (flip x)
	ld   a, (hl)
	cp   DIR_LEFT
	ld   a, $20
	jr   z, @setTileAttr

// vertical
	ld   hl, wBitemTileIdxLeft
	ld   (hl), $b8
	ld   hl, wBitemTileIdxRight
	ld   (hl), $ba

	ld   hl, wJawboneOrSwordDir
	ld   a, (hl)
	cp   DIR_UP
	ld   a, $00
	jr   z, @setTileAttr

// attr 40 if down (flip y)
	ld   a, $40
	jp   @setTileAttr

@jawboneEquipped:
	call getRotatedItemsOamAttr
	push af
	ld   hl, wJawboneOrSwordDir
	ld   a, (hl)
	cp   DIR_LEFT
	jr   nz, +

// flip x if facing left
	pop  af
	xor  $20
	push af

+
	pop  af

@setTileAttr:
	ld   hl, wOam+3
	add  hl, de
	ld   (hl), a
	ld   hl, wOam+7
	add  hl, de
	ld   (hl), a
	and  $20
	jr   z, +

// facing left
	ld   hl, wBitemTileIdxRight
	ld   a, (hl)
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a
	ld   hl, wBitemTileIdxLeft
	ld   a, (hl)
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a
	jp   @done

+
	ld   hl, wBitemTileIdxLeft
	ld   a, (hl)
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a
	ld   hl, wBitemTileIdxRight
	ld   a, (hl)
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a

@done:
	ret

.include "garbage/b0_2f2f.s"

updateFruits:
// dec c0b0 every fruit update
	ld   hl, wTimeUntilCanUseFruitAgain
	ld   a, (hl)
	cp   $00
	jr   z, +

	ld   hl, wTimeUntilCanUseFruitAgain
	dec  (hl)

+
	ld   bc, $0000

@nextFruit:
	ld   hl, wCurrentFruitTiles
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   nz, @processFruit

@clearFruitOam:
// oam usable for fruits is 24-27
	ld   a, c
	add  $24
	call getLastUsableOamIdx_fromA
	call clearWoamOffsetE

@toNextFruit:
	inc  bc
	ld   a, c
	cp   NUM_FRUITS_ON_SCREEN
	jr   c, @nextFruit

	ret

@processFruit:
	ld   hl, wCurrFruitOnScreenCounter
	add  hl, bc
	dec  (hl)
	jr   nz, @notRemovedFruit

@removeFruit:
// clear the item from updating
	ld   a, $00
	ld   hl, wCurrentFruitTiles
	add  hl, bc
	ld   (hl), a

// fruit faded out
	ld   hl, wCurrFruitOnScreen
	dec  (hl)
	jp   @clearFruitOam

@notRemovedFruit:
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	ld   hl, wOrigCurrFruitXval
	ld   (hl), a

	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	ld   hl, wOrigCurrFruitYval
	ld   (hl), a

	ld   hl, wCurrFruitDirs
	add  hl, bc
	ld   a, (hl)
	and  $7f
// jump if down/left
	cp   DIR_DOWN
	jr   nc, @fruitMovingDownOrLeft

// jump if up
	cp   DIR_UP
	jr   nc, @fruitMovingUp

// right
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	cp   $f7
	jr   c, +

@toRemoveFruit:
	jp   @removeFruit

+
// add speed onto fruit x val
	ld   hl, wCurrFruitSpeeds
	add  hl, bc
	add  (hl)
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   (hl), a
	jp   @afterMovingHoriz

@fruitMovingUp:
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	cp   $04
	jr   c, @toRemoveFruit

// sub speed from fruit y val
	ld   hl, wCurrFruitSpeeds
	add  hl, bc
	sub  (hl)
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   (hl), a
	jp   @afterMovingVertically

@fruitMovingDownOrLeft:
	cp   DIR_LEFT
	jp   nc, @fruitMovingLeft

// moving down
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	cp   $9c
	jr   nc, @toRemoveFruit

// add speed onto fruit y val
	ld   hl, wCurrFruitSpeeds
	add  hl, bc
	add  (hl)
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   (hl), a

@afterMovingVertically:
	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   a, (hl)
	and  $20
	jr   nz, @grapeAfterMovingVertically

// not grape
	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   a, (hl)
	and  $40
	jr   z, @toafterProcessingMovementOffsets

// pomegranate
	ld   hl, wMainLoopCounter
	ld   a, (hl)
	and  $08
	jr   nz, @pomegranateSwingingRight

// swinging left
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	cp   $02
	jr   c, @toRemoveFruit2

// dec x val twice
	ld   hl, wCurrFruitXvals
	add  hl, bc
	dec  (hl)
	ld   hl, wCurrFruitXvals
	add  hl, bc
	dec  (hl)

@toafterProcessingMovementOffsets:
	jp   @afterProcessingMovementOffsets

@pomegranateSwingingRight:
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	cp   $f9
	jr   nc, @toRemoveFruit2

// inc x twice
	ld   hl, wCurrFruitXvals
	add  hl, bc
	inc  (hl)
	ld   hl, wCurrFruitXvals
	add  hl, bc
	inc  (hl)
	jp   @afterProcessingMovementOffsets

@grapeAfterMovingVertically:
	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   a, (hl)

// 0 means moving straight
	and  $03
	jp   z, @afterProcessingMovementOffsets

	cp   $02
	jr   z, @grapeSwingingRight

// grape swinging left
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	cp   $04
	jr   c, @toRemoveFruit2

// dec x val once
	ld   hl, wCurrFruitXvals
	add  hl, bc
	dec  (hl)
	jp   @afterProcessingMovementOffsets

@toRemoveFruit2:
	jp   @removeFruit

@grapeSwingingRight:
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	cp   $f7
	jr   nc, @toRemoveFruit2

// inc x val once
	ld   hl, wCurrFruitXvals
	add  hl, bc
	inc  (hl)
	jp   @afterProcessingMovementOffsets

@fruitMovingLeft:
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	cp   $04
	jr   c, @toRemoveFruit3

// add speed onto fruit x val
	ld   hl, wCurrFruitSpeeds
	add  hl, bc
	sub  (hl)
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   (hl), a

@afterMovingHoriz:
	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   a, (hl)
	and  $20
	jr   nz, @grapeAfterMovingHoriz

	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   a, (hl)
	and  $40
	jr   z, @afterProcessingMovementOffsets

// pomegranate
	ld   hl, wMainLoopCounter
	ld   a, (hl)
	and  $08
	jr   nz, @pomegranateSwingingDown

// moving up
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	cp   $02
	jr   c, @toRemoveFruit3

// dec y val twice
	ld   hl, wCurrFruitYvals
	add  hl, bc
	dec  (hl)
	dec  (hl)
	jp   @afterProcessingMovementOffsets

@pomegranateSwingingDown:
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	cp   $9e
	jr   nc, @toRemoveFruit3

// inc y val twice
	ld   hl, wCurrFruitYvals
	add  hl, bc
	inc  (hl)
	ld   hl, wCurrFruitYvals
	add  hl, bc
	inc  (hl)
	jp   @afterProcessingMovementOffsets

@grapeAfterMovingHoriz:
	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   a, (hl)
// 0 means straight
	and  $03
	jr   z, @afterProcessingMovementOffsets

	cp   $02
	jr   z, @grapeSwingingDown

// moving up
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	cp   $04
	jr   c, @toRemoveFruit3

// dec y val once
	ld   hl, wCurrFruitYvals
	add  hl, bc
	dec  (hl)
	jp   @afterProcessingMovementOffsets

@toRemoveFruit3:
	jp   @removeFruit

@grapeSwingingDown:
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	cp   $9c
	jr   nc, @toRemoveFruit3

// inc y val once
	ld   hl, wCurrFruitYvals
	add  hl, bc
	inc  (hl)

@afterProcessingMovementOffsets:
	push bc
	ld   a, $00
	ld   hl, wCurrFruitHitObstacle
	ld   (hl), a
	ld   hl, wCurrFruitBounced
	ld   (hl), a

// c711 is non-0 if pomegranate, grape or banana (cant affect rubble?)
	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   a, (hl)
	and  $80
	ld   hl, wFruitFlagBit7
	ld   (hl), a

// curr fruit x eventually into bc
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	ld   hl, wTempFruitX
	ld   (hl), a

// curr fruit y into de
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	add  $08
	ld   e, a
	ld   d, $00

	ld   hl, wTempFruitX
	ld   c, (hl)
	ld   b, $00

// c006-c009 - c low, e low, c high, e high
	call splitCEintoItsNybbles
	call checkFruitTileCollisions

	pop  bc                                          ; $3127: $c1
	push bc                                          ; $3128: $c5
// checks fruit collisions within a radius??
	call checkFruitCollisionsFallingObjAndEntities                               ; $3129: $cd $90 $32
	pop  bc                                          ; $312c: $c1

// check if obstacle hit
	ld   hl, wCurrFruitHitObstacle
	ld   a, (hl)
	cp   $00
	jr   z, +

// if fruit on obstacle, delete if not apple
	ld   hl, wCurrFruitFlags
	add  hl, bc
	ld   a, (hl)
	and  $10
	jr   nz, +

	jp   @removeFruit

+
	ld   hl, wCurrFruitBounced
	ld   a, (hl)
	cp   $00
	jr   z, @copyFruitTo_wOam

// reset fruit position
	ld   hl, wOrigCurrFruitXval
	ld   a, (hl)
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   (hl), a

	ld   hl, wOrigCurrFruitYval
	ld   a, (hl)
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   (hl), a

// if bit 7 set, dont bounce again if already bounced
	ld   hl, wCurrFruitDirs
	add  hl, bc
	ld   a, (hl)
	bit  7, a
	jr   nz, @copyFruitTo_wOam

	and  $7f
	cp   DIR_DOWN
	jr   nc, @downLeft2

	cp   DIR_UP
	jr   nc, @up2

// right becomes left
	ld   a, DIR_LEFT
	jp   @afterSettingBounceDir

@up2:
	ld   a, DIR_DOWN
	jp   @afterSettingBounceDir

@downLeft2:
// 9+ becomes 0 (ie left becomes right)
	cp   DIR_LEFT
	jr   nc, +

// otherwise 3 (down becomes up)
	ld   a, DIR_UP
	jp   @afterSettingBounceDir

+
	ld   a, DIR_RIGHT

@afterSettingBounceDir:
// set bit 7 (bounced)
	or   $80
	ld   hl, wCurrFruitDirs
	add  hl, bc
	ld   (hl), a

	call playSoundEffect23h2

@copyFruitTo_wOam:
// item oam from 24-27
	ld   a, c
	add  $24
	call getLastUsableOamIdx_fromA
	call clearWoamOffsetE

// tile
	ld   hl, wCurrentFruitTiles
	add  hl, bc
	ld   a, (hl)
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a

// preserve c and a
	ld   a, c
	push af

// attr
	call getRotatedItemsOamAttr
	ld   hl, wOam+3
	add  hl, de
	ld   (hl), a

// xval
	pop  af
	ld   c, a
	ld   b, $00
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	ld   hl, wSCXvalue
	sub  (hl)
	add  $08
	ld   hl, wOam+1
	add  hl, de
	ld   (hl), a

// yval
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	add  $10
	ld   hl, wSCYvalue
	sub  (hl)
	ld   hl, wOam
	add  hl, de
	ld   (hl), a
	jp   @toNextFruit


getRotatedItemsOamAttr:
	ld   hl, wMainLoopCounter
	ld   a, (hl)
	ld   hl, @rotatingItemTileAttrs

// if bit 2 set, add 1
	bit  2, a
	jr   z, +

	inc  hl

+
// if bit 3 set, add 2
	bit  3, a
	jr   z, +

	inc  hl
	inc  hl

+
	ld   a, (hl)
	ret

@rotatingItemTileAttrs:
	// normal, x/y, y, x
	.db $00 $60 $40 $20


checkFruitTileCollisions:
// c008-x high, c009-y high
	ld   hl, wChighNybble
	ld   c, (hl)
	ld   b, $00
	ld   hl, wEhighNybble
	ld   e, (hl)
	ld   d, $00
	call checkFruitTileCollisionAtBC

-	ret


checkFruitTileCollisionAtBC:
	call getTileEntityOrPlayerIsOn                               ; $31f9: $cd $ed $3f
// save col
	ld   hl, wGenericColVal                                   ; $31fc: $21 $0c $c0
	ld   (hl), c                                     ; $31ff: $71

// check tile, 2f+ can ignore
	cp   $2f                                         ; $3200: $fe $2f
	jr   nc, -                             ; $3202: $30 $f4

// always interact with 27 and 1e
	push af                                          ; $3204: $f5
	cp   $27                                         ; $3205: $fe $27
	jr   z, @interactWithTile                              ; $3207: $28 $0e

	cp   $1e                                         ; $3209: $fe $1e
	jr   z, @interactWithTile                              ; $320b: $28 $0a

// otherwise only interact if pear/apple
	ld   hl, wFruitFlagBit7                                   ; $320d: $21 $11 $c7
	ld   a, (hl)                                     ; $3210: $7e
	cp   $00                                         ; $3211: $fe $00
	jr   z, @interactWithTile                              ; $3213: $28 $02

	pop  af                                          ; $3215: $f1
	ret                                              ; $3216: $c9

@interactWithTile:
	pop  af
	push af
	sla  a
	ld   c, a
	ld   b, $00
	ld   hl, fruitTileCollisions
	add  hl, bc
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	push hl

// restore col val, and jump
	ld   hl, wGenericColVal
	ld   c, (hl)
	pop  hl
	pop  af
	jp   hl


fruitTileCollision_27:
	call Call_000_3650                               ; $322d: $cd $50 $36
	ld   a, $00                                      ; $3230: $3e $00
	jp   Jump_000_3237                               ; $3232: $c3 $37 $32


fruitTileCollision_1e:
	ld   a, $80                                      ; $3235: $3e $80

Jump_000_3237:
	ld   hl, $c04b                                   ; $3237: $21 $4b $c0
	ld   (hl), a                                     ; $323a: $77
	ld   a, $06                                      ; $323b: $3e $06
	call Call_001_6244                                       ; $323d: $cd $44 $62
	jp   fruitTileCollision_hitObstacle                               ; $3240: $c3 $89 $32


fruitTileCollision_1b:
fruitTileCollision_28:
fruitTileCollision_2a:
	ld   a, $05
	call Call_000_39ea                               ; $3245: $cd $ea $39
	call playSoundFhIfOff22hIfOn                               ; $3248: $cd $11 $28
	jp   Jump_000_3286                               ; $324b: $c3 $86 $32


// 20 to 25
fruitTileCollision_bounced:
	ld   a, $ff
	ld   hl, wCurrFruitBounced                                   ; $3250: $21 $b3 $c0
	ld   (hl), a                                     ; $3253: $77
	jp   _ret_328f                               ; $3254: $c3 $8f $32


fruitTileCollision_19:
	ld   a, $1a                                      ; $3257: $3e $1a
	jp   _fruitDestroyedTile                               ; $3259: $c3 $68 $32


fruitTileCollision_1a:
	ld   a, $1b                                      ; $325c: $3e $1b
	jp   _fruitDestroyedTile                               ; $325e: $c3 $68 $32


fruitTileCollision_29:
	ld   a, $2a                                      ; $3261: $3e $2a
	jp   _fruitDestroyedTile                               ; $3263: $c3 $68 $32

;;
	ld   a, $2b                                      ; $3266: $3e $2b

_fruitDestroyedTile:
	call c028_equGameScreenTileIdx_16ePlusC
	call replaceTileHere
	jp   fruitTileCollision_hitObstacle

.include "garbage/b0_3271.s"

Jump_000_3286:
	call Call_000_3a0c                               ; $3286: $cd $0c $3a

fruitTileCollision_hitObstacle:
	ld   a, $ff
	ld   hl, wCurrFruitHitObstacle
	ld   (hl), a

_ret_328f:
	ret


checkFruitCollisionsFallingObjAndEntities:
// y -= $0c in c0a7
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	sub  $0c
	jr   nc, +
	ld   a, $00
+
	ld   hl, wItemTopBoundingBox
	ld   (hl), a

// y += c in c0a8
	ld   hl, wCurrFruitYvals
	add  hl, bc
	ld   a, (hl)
	add  $0c
	ld   hl, wItemBottomBoundingBox
	ld   (hl), a

// x -= c in c0a9
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	sub  $0c
	jr   nc, +
	ld   a, $00
+
	ld   hl, wItemLeftBoundingBox
	ld   (hl), a

// x += c in c0aa
	ld   hl, wCurrFruitXvals
	add  hl, bc
	ld   a, (hl)
	add  $0c
	jr   nc, +
	ld   a, $ff
+
	ld   hl, wItemRightBoundingBox
	ld   (hl), a

// check against every falling object
	ld   bc, $0000

@nextFallingObj:
	ld   hl, wFallingObjectID
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   nz, @checkAgainstFallingObj

@toNextFallingObj:
	inc  bc
	ld   a, c
	cp   NUM_FALLING_OBJECTS
	jr   c, @nextFallingObj

	jp   @afterFallingObjCollisionCheck

@checkAgainstFallingObj:
// ignore falling objects with ID < 18h completely
	cp   $18                                         ; $32dd: $fe $18
	jr   c, @toNextFallingObj                              ; $32df: $38 $f3

// vertical bounds
	ld   hl, wFallingObjectYval
	add  hl, bc
	ld   a, (hl)
	ld   hl, wItemTopBoundingBox
	cp   (hl)
	jr   c, @toNextFallingObj

	ld   hl, wItemBottomBoundingBox
	cp   (hl)
	jr   nc, @toNextFallingObj

// horizontal bounds
	ld   hl, wFallingObjectXval
	add  hl, bc
	ld   a, (hl)
	ld   hl, wItemLeftBoundingBox
	cp   (hl)
	jr   c, @toNextFallingObj

	ld   hl, wFallingObjectXval
	add  hl, bc
	ld   a, (hl)
	ld   hl, wItemRightBoundingBox
	cp   (hl)
	jr   nc, @toNextFallingObj

// if fruit within bounding box, ignore if id >= 24h
	ld   hl, wFallingObjectID                                   ; $3308: $21 $60 $c6
	add  hl, bc                                      ; $330b: $09
	ld   a, (hl)                                     ; $330c: $7e
	cp   $24                                         ; $330d: $fe $24
	jr   nc, @toNextFallingObj                             ; $330f: $30 $c3

// normalize val to 0-11
	sub  $18                                         ; $3311: $d6 $18
	ld   hl, $c00c                                   ; $3313: $21 $0c $c0
	ld   (hl), c                                     ; $3316: $71
	push af                                          ; $3317: $f5
	sla  a                                           ; $3318: $cb $27
	ld   c, a                                        ; $331a: $4f
	ld   b, $00                                      ; $331b: $06 $00

// bc is a double idx, put a word here into c004/c005
	ld   hl, fruitFallingObjectCollisions
	add  hl, bc
	ld   a, (hl)
	ld   hl, wFruitFallingObjectCollisionAddr
	ld   (hl), a

	ld   hl, fruitFallingObjectCollisions+1
	add  hl, bc
	ld   a, (hl)
	ld   hl, wFruitFallingObjectCollisionAddr+1
	ld   (hl), a

//
	ld   hl, $c00c                                   ; $332f: $21 $0c $c0
	ld   c, (hl)                                     ; $3332: $4e
	ld   b, $00                                      ; $3333: $06 $00

// word in fruitFallingObjectCollisions
	ld   hl, wFruitFallingObjectCollisionAddr
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	pop  af
	jp   hl

@afterFallingObjCollisionCheck:
// now check against npcs
	ld   bc, $0000

@checkNextNPC:
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)
	cp   $ff
	jr   nz, @processNPC

@gotoCheckNextNPC:
	inc  bc
	ld   a, c
	cp   NUM_NPCS
	jr   c, @checkNextNPC

	ret

@processNPC:
// vertical bounds
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wItemTopBoundingBox
	cp   (hl)
	jr   c, @gotoCheckNextNPC

	ld   hl, wItemBottomBoundingBox
	cp   (hl)
	jr   nc, @gotoCheckNextNPC

// horizontal bounds
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wItemLeftBoundingBox
	cp   (hl)
	jr   c, @gotoCheckNextNPC

	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wItemRightBoundingBox
	cp   (hl)
	jr   nc, @gotoCheckNextNPC

// fruit collided with enemy, if bit 4 unset..
	call getBit4ofNPCBytes_cb60                                       ; $3377: $cd $72 $73
	jr   nz, @gotoCheckNextNPC                             ; $337a: $20 $cd

	ld   hl, wNPCBytes_cbe4                                   ; $337c: $21 $e4 $cb
	add  hl, bc                                      ; $337f: $09
	ld   a, (hl)                                     ; $3380: $7e
	and  $04                                         ; $3381: $e6 $04
	jr   nz, @gotoCheckNextNPC                             ; $3383: $20 $c4

// if bit 2 unset, we can change npc due to being hit by fruit

// if bit 7 set of cb60, fruit bounces off
	ld   hl, wNPCBytes_cb60                                   ; $3385: $21 $60 $cb
	add  hl, bc                                      ; $3388: $09
	ld   a, (hl)                                     ; $3389: $7e
	bit  7, a                                        ; $338a: $cb $7f
	jr   nz, +                             ; $338c: $20 $13

// 1st non-addr byte ff, treat as if it hit an obstacle
	call copy8npcMetadataBytesInto_c6d0
	ld   hl, wCommonByteCopyDestBytes+4
	ld   a, (hl)
	cp   $ff
	jr   z, @fruitHitObstacle

// no special conditions, change id
	ld   hl, wNPCBytes_newID
	add  hl, bc
	ld   (hl), a
	jp   @fruitHitObstacle

+
	ld   a, $ff
	ld   hl, wCurrFruitBounced
	ld   (hl), a
	jp   @done

@fruitHitObstacle:
	ld   a, $ff
	ld   hl, wCurrFruitHitObstacle
	ld   (hl), a

@done:
	ret


fruitFallingObjectCollision_06:
	ld   a, c                                        ; $33b1: $79
	push af                                          ; $33b2: $f5
	ld   hl, wFallingObjectVar4                                   ; $33b3: $21 $6c $c6
	add  hl, bc                                      ; $33b6: $09
	ld   a, (hl)                                     ; $33b7: $7e
	push af                                          ; $33b8: $f5
	ld   hl, wFallingObjectYval                                   ; $33b9: $21 $69 $c6
	add  hl, bc                                      ; $33bc: $09
	ld   e, (hl)                                     ; $33bd: $5e
	ld   d, $00                                      ; $33be: $16 $00
	ld   hl, wFallingObjectXval                                   ; $33c0: $21 $63 $c6
	add  hl, bc                                      ; $33c3: $09
	ld   a, (hl)                                     ; $33c4: $7e
	ld   c, a                                        ; $33c5: $4f
	ld   b, $00                                      ; $33c6: $06 $00
	call splitCEintoItsNybbles                                       ; $33c8: $cd $1c $55
	ld   hl, wChighNybble                                   ; $33cb: $21 $08 $c0
	ld   c, (hl)                                     ; $33ce: $4e
	ld   b, $00                                      ; $33cf: $06 $00
	ld   hl, wEhighNybble                                   ; $33d1: $21 $09 $c0
	ld   e, (hl)                                     ; $33d4: $5e
	ld   d, $00                                      ; $33d5: $16 $00
	pop  af                                          ; $33d7: $f1
	cp   $06                                         ; $33d8: $fe $06
	jr   z, jr_000_33f6                              ; $33da: $28 $1a

	jr   c, jr_000_33ea                              ; $33dc: $38 $0c

	ld   hl, wClowNybble                                   ; $33de: $21 $06 $c0
	ld   a, (hl)                                     ; $33e1: $7e
	cp   $09                                         ; $33e2: $fe $09
	jr   c, Jump_000_33ff                              ; $33e4: $38 $19

	inc  bc                                          ; $33e6: $03
	jp   Jump_000_33ff                               ; $33e7: $c3 $ff $33


jr_000_33ea:
	ld   hl, wClowNybble                                   ; $33ea: $21 $06 $c0
	ld   a, (hl)                                     ; $33ed: $7e
	cp   $08                                         ; $33ee: $fe $08
	jr   c, Jump_000_33ff                              ; $33f0: $38 $0d

	inc  bc                                          ; $33f2: $03
	jp   Jump_000_33ff                               ; $33f3: $c3 $ff $33


jr_000_33f6:
	ld   hl, wElowNybble                                   ; $33f6: $21 $07 $c0
	ld   a, (hl)                                     ; $33f9: $7e
	cp   $08                                         ; $33fa: $fe $08
	jr   c, Jump_000_33ff                              ; $33fc: $38 $01

	inc  de                                          ; $33fe: $13

Jump_000_33ff:
	ld   a, $80                                      ; $33ff: $3e $80
	ld   hl, $c04b                                   ; $3401: $21 $4b $c0
	ld   (hl), a                                     ; $3404: $77
	ld   a, $06                                      ; $3405: $3e $06
	call Call_001_6244                                       ; $3407: $cd $44 $62
	pop  af                                          ; $340a: $f1
	ld   c, a                                        ; $340b: $4f
	ld   b, $00                                      ; $340c: $06 $00

fruitFallingObjectCollision_03:
	ld   a, $05                                      ; $340e: $3e $05
	ld   hl, wFallingObjectVar4                                   ; $3410: $21 $6c $c6
	add  hl, bc                                      ; $3413: $09
	ld   (hl), a                                     ; $3414: $77
	ld   e, a                                        ; $3415: $5f
	ld   d, $00                                      ; $3416: $16 $00
	ld   hl, data_09fc                                   ; $3418: $21 $fc $09
	add  hl, de                                      ; $341b: $19
	ld   a, (hl)                                     ; $341c: $7e
	ld   hl, wFallingObjectID                                   ; $341d: $21 $60 $c6
	add  hl, bc                                      ; $3420: $09
	ld   (hl), a                                     ; $3421: $77
	ld   hl, data_09fd                                   ; $3422: $21 $fd $09
	add  hl, de                                      ; $3425: $19
	ld   a, (hl)                                     ; $3426: $7e
	ld   hl, wFallingObjectVar5                                   ; $3427: $21 $6f $c6
	add  hl, bc                                      ; $342a: $09
	ld   (hl), a                                     ; $342b: $77
	call playSoundFhIfOff22hIfOn                               ; $342c: $cd $11 $28
	jp   setFruitHitObstacle2                               ; $342f: $c3 $4a $34


fruitFallingObjectCollision_01:
	ld   a, $1a                                      ; $3432: $3e $1a
	jp   +                               ; $3434: $c3 $39 $34


fruitFallingObjectCollision_02:
	ld   a, $1b                                      ; $3437: $3e $1b

+
	ld   hl, wFallingObjectID                                   ; $3439: $21 $60 $c6
	add  hl, bc                                      ; $343c: $09
	ld   (hl), a                                     ; $343d: $77
	jp   setFruitHitObstacle2                               ; $343e: $c3 $4a $34


setFruitBounced:
	ld   a, $ff
	ld   hl, wCurrFruitBounced
	ld   (hl), a
	jp   +


setFruitHitObstacle2:
	ld   a, $ff
	ld   hl, wCurrFruitHitObstacle
	ld   (hl), a

+
	ret


// also for explosions, eg via sword
processUsingBombs:
	ld   bc, $0000

@loop:
	ld   hl, wBombTimers
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   z, @processBomb

	inc  bc
	ld   a, c
	cp   NUM_BOMBS
	jp   nc, @ret

	jp   @loop

@processBomb:
// push idx
	ld   a, c
	push af

// player x in bc, player y in de
	ld   hl, wPlayerX
	ld   c, (hl)
	ld   b, $00
	ld   hl, wPlayerY
	ld   e, (hl)
	ld   d, $00

//
	ld   hl, wMenuCursorIdx                                   ; $3475: $21 $11 $c7
	ld   a, (hl)                                     ; $3478: $7e
	cp   $00                                         ; $3479: $fe $00
	jr   z, +                              ; $347b: $28 $0c

// jawbone/sword in bc/de
	ld   hl, wJawboneOrSwordXval                                   ; $347d: $21 $cc $c6
	ld   c, (hl)                                     ; $3480: $4e
	ld   b, $00                                      ; $3481: $06 $00
	ld   hl, wJawboneOrSwordYval                                   ; $3483: $21 $cd $c6
	ld   e, (hl)                                     ; $3486: $5e
	ld   d, $00                                      ; $3487: $16 $00

+
	call splitCEintoItsNybbles                                       ; $3489: $cd $1c $55
	ld   hl, wChighNybble                                   ; $348c: $21 $08 $c0
	ld   c, (hl)                                     ; $348f: $4e
	ld   b, $00                                      ; $3490: $06 $00
	ld   hl, wClowNybble                                   ; $3492: $21 $06 $c0
	ld   a, (hl)                                     ; $3495: $7e
	cp   $08                                         ; $3496: $fe $08
	jr   c, +                              ; $3498: $38 $0b

	jr   nz, @incBCnext                             ; $349a: $20 $08

	ld   hl, wPlayerOamAttr                                   ; $349c: $21 $55 $c0
	ld   a, (hl)                                     ; $349f: $7e
	and  $20                                         ; $34a0: $e6 $20
	jr   z, +                              ; $34a2: $28 $01

@incBCnext:
	inc  bc

+
	ld   hl, wEhighNybble                                   ; $34a5: $21 $09 $c0
	ld   e, (hl)                                     ; $34a8: $5e
	ld   d, $00                                      ; $34a9: $16 $00
	ld   hl, wElowNybble                                   ; $34ab: $21 $07 $c0
	ld   a, (hl)                                     ; $34ae: $7e
	cp   $08                                         ; $34af: $fe $08
	jr   c, +                              ; $34b1: $38 $0b

	jr   nz, @incDEnext                             ; $34b3: $20 $08

	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $34b5: $21 $56 $c0
	ld   a, (hl)                                     ; $34b8: $7e
	cp   $40|DIR_DOWN                                         ; $34b9: $fe $46
	jr   nc, +                             ; $34bb: $30 $01

@incDEnext:
	inc  de                                          ; $34bd: $13

+
	ld   hl, wMenuCursorIdx                                   ; $34be: $21 $11 $c7
	ld   a, (hl)                                     ; $34c1: $7e
	cp   $00                                         ; $34c2: $fe $00
	jr   nz, +                             ; $34c4: $20 $17

	call getTileEntityOrPlayerIsOn                               ; $34c6: $cd $ed $3f
	cp   $03                                         ; $34c9: $fe $03
	jr   nc, @popAFret                             ; $34cb: $30 $45

	call Call_000_3514                               ; $34cd: $cd $14 $35
	jr   c, @popAFret                              ; $34d0: $38 $40

// makes c028 become bomb tile idx
	ld   a, GVT_BOMB
	call getTileIdxForGenericVramCopy
// 2x2 yx of bomb tile is ec, this func copies to generic vram bytes
	call replaceTileHere
	call clearExplosionHere

+
	ld   hl, $c00c                                   ; $34dd: $21 $0c $c0
	ld   (hl), c                                     ; $34e0: $71
	pop  af                                          ; $34e1: $f1
	ld   c, a                                        ; $34e2: $4f
	ld   b, $00                                      ; $34e3: $06 $00

// default timer is immediate
	ld   a, $06
	ld   hl, wBombTimers
	add  hl, bc
	ld   (hl), a

	ld   hl, $c00c                                   ; $34ec: $21 $0c $c0
	ld   a, (hl)                                     ; $34ef: $7e
	ld   hl, wBombXvals                                   ; $34f0: $21 $18 $c6
	add  hl, bc                                      ; $34f3: $09
	ld   (hl), a                                     ; $34f4: $77

	ld   a, e                                        ; $34f5: $7b
	ld   hl, wMenuCursorIdx                                   ; $34f6: $21 $11 $c7
	or   (hl)                                        ; $34f9: $b6
	ld   hl, wBombYvals                                   ; $34fa: $21 $30 $c6
	add  hl, bc                                      ; $34fd: $09
	ld   (hl), a                                     ; $34fe: $77

// if actual bomb, start a countdown before explosions
	bit  7, a
	jr   nz, @ret

// initial bomb countdown
	ld   a, $f5
	ld   hl, wBombTimers
	add  hl, bc
	ld   (hl), a

// decrease bombs
	ld   hl, wNumBombs
	dec  (hl)
	call playSound9hIfOff28hIfOn

@ret:
	ret

@popAFret:
	pop  af
	ret


Call_000_3514:
	ld   a, e                                        ; $3514: $7b
	push af                                          ; $3515: $f5
	sla  a                                           ; $3516: $cb $27
	sla  a                                           ; $3518: $cb $27
	sla  a                                           ; $351a: $cb $27
	sla  a                                           ; $351c: $cb $27
	ld   hl, $c0a8                                   ; $351e: $21 $a8 $c0
	ld   (hl), a                                     ; $3521: $77
	sub  $0f                                         ; $3522: $d6 $0f
	jr   nc, jr_000_3528                             ; $3524: $30 $02

	ld   a, $00                                      ; $3526: $3e $00

jr_000_3528:
	ld   hl, $c0a7                                   ; $3528: $21 $a7 $c0
	ld   (hl), a                                     ; $352b: $77
	ld   hl, $c0a8                                   ; $352c: $21 $a8 $c0
	ld   a, (hl)                                     ; $352f: $7e
	add  $10                                         ; $3530: $c6 $10
	ld   hl, $c0a8                                   ; $3532: $21 $a8 $c0
	ld   (hl), a                                     ; $3535: $77
	ld   a, c                                        ; $3536: $79
	push af                                          ; $3537: $f5
	sla  a                                           ; $3538: $cb $27
	sla  a                                           ; $353a: $cb $27
	sla  a                                           ; $353c: $cb $27
	sla  a                                           ; $353e: $cb $27
	ld   hl, $c0a9                                   ; $3540: $21 $a9 $c0
	ld   (hl), a                                     ; $3543: $77
	ld   hl, $c0aa                                   ; $3544: $21 $aa $c0
	ld   (hl), a                                     ; $3547: $77
	ld   hl, $c0a9                                   ; $3548: $21 $a9 $c0
	ld   a, (hl)                                     ; $354b: $7e
	sub  $0f                                         ; $354c: $d6 $0f
	jr   nc, jr_000_3552                             ; $354e: $30 $02

	ld   a, $00                                      ; $3550: $3e $00

jr_000_3552:
	ld   hl, $c0a9                                   ; $3552: $21 $a9 $c0
	ld   (hl), a                                     ; $3555: $77
	ld   hl, $c0aa                                   ; $3556: $21 $aa $c0
	ld   a, (hl)                                     ; $3559: $7e
	add  $10                                         ; $355a: $c6 $10
	jr   nc, jr_000_3560                             ; $355c: $30 $02

	ld   a, $ff                                      ; $355e: $3e $ff

jr_000_3560:
	ld   hl, $c0aa                                   ; $3560: $21 $aa $c0
	ld   (hl), a                                     ; $3563: $77
	ld   bc, $0000                                   ; $3564: $01 $00 $00

jr_000_3567:
	ld   hl, wFallingObjectID                                   ; $3567: $21 $60 $c6
	add  hl, bc                                      ; $356a: $09
	ld   a, (hl)                                     ; $356b: $7e
	cp   $00                                         ; $356c: $fe $00
	jr   z, jr_000_3597                              ; $356e: $28 $27

	ld   hl, wFallingObjectYval                                   ; $3570: $21 $69 $c6
	add  hl, bc                                      ; $3573: $09
	ld   a, (hl)                                     ; $3574: $7e
	ld   hl, $c0a7                                   ; $3575: $21 $a7 $c0
	cp   (hl)                                        ; $3578: $be
	jr   c, jr_000_3597                              ; $3579: $38 $1c

	ld   hl, $c0a8                                   ; $357b: $21 $a8 $c0
	cp   (hl)                                        ; $357e: $be
	jr   nc, jr_000_3597                             ; $357f: $30 $16

	ld   hl, wFallingObjectXval                                   ; $3581: $21 $63 $c6
	add  hl, bc                                      ; $3584: $09
	ld   a, (hl)                                     ; $3585: $7e
	ld   hl, $c0a9                                   ; $3586: $21 $a9 $c0
	cp   (hl)                                        ; $3589: $be
	jr   c, jr_000_3597                              ; $358a: $38 $0b

	ld   hl, wFallingObjectXval                                   ; $358c: $21 $63 $c6
	add  hl, bc                                      ; $358f: $09
	ld   a, (hl)                                     ; $3590: $7e
	ld   hl, $c0aa                                   ; $3591: $21 $aa $c0
	cp   (hl)                                        ; $3594: $be
	jr   c, jr_000_35a8                              ; $3595: $38 $11

jr_000_3597:
	inc  bc                                          ; $3597: $03
	ld   a, c                                        ; $3598: $79
	cp   $03                                         ; $3599: $fe $03
	jr   c, jr_000_3567                              ; $359b: $38 $ca

	pop  af                                          ; $359d: $f1
	ld   c, a                                        ; $359e: $4f
	ld   b, $00                                      ; $359f: $06 $00
	pop  af                                          ; $35a1: $f1
	ld   e, a                                        ; $35a2: $5f
	ld   d, $00                                      ; $35a3: $16 $00
	scf                                              ; $35a5: $37
	ccf                                              ; $35a6: $3f
	ret                                              ; $35a7: $c9


jr_000_35a8:
	pop  af                                          ; $35a8: $f1
	ld   c, a                                        ; $35a9: $4f
	ld   b, $00                                      ; $35aa: $06 $00
	pop  af                                          ; $35ac: $f1
	ld   e, a                                        ; $35ad: $5f
	ld   d, $00                                      ; $35ae: $16 $00
	scf                                              ; $35b0: $37
	ret                                              ; $35b1: $c9


updateBombs:
	ld   bc, $0000

@nextBomb:
	ld   hl, wBombTimers
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   nz, @processBomb

@toNextBomb:
	inc  bc
	ld   a, c
	cp   NUM_BOMBS
	jr   c, @nextBomb

	ret

@processBomb:
// dec timer
	dec  (hl)
	ld   a, (hl)

// still 6+ ticks, nothing special
	cp   $06
	jr   nc, @toNextBomb

// explode at current tile, then sides, then corners (5,2,0)
	cp   $05
	jr   z, @bombTimerAt5

	cp   $02
	jr   z, @bombTimerAt2

// at 1 dont process
	cp   $00
	jr   nz, @toNextBomb

// timer at 0
	push bc

// get low 7 bits for coords and explode at corners
	ld   hl, wBombYvals
	add  hl, bc
	ld   a, (hl)
	and  $7f
	ld   e, a
	ld   d, $00

	ld   hl, wBombXvals
	add  hl, bc
	ld   a, (hl)
	and  $7f
	ld   c, a
	ld   b, $00

	call placeExplosionAtCorners
	pop  bc
	jp   @toNextBomb

@bombTimerAt2:
	push bc
	ld   hl, wBombYvals
	add  hl, bc
	ld   a, (hl)
	and  $7f
	ld   e, a
	ld   d, $00

	ld   hl, wBombXvals
	add  hl, bc
	ld   a, (hl)
	and  $7f
	ld   c, a
	ld   b, $00

	call placeExplosionAtSides
	pop  bc
	jp   @toNextBomb

@bombTimerAt5:
	push bc

// non-bit 7 y val in de
	ld   hl, wBombYvals
	add  hl, bc
	ld   a, (hl)
	push af
	and  $7f
	ld   e, a
	ld   d, $00

// bomb xval bit 7 in c04b (should explode immediately)
	ld   hl, wBombXvals                                   ; $361b: $21 $18 $c6
	add  hl, bc                                      ; $361e: $09
	ld   a, (hl)                                     ; $361f: $7e
	and  $80                                         ; $3620: $e6 $80
	ld   hl, $c04b                                   ; $3622: $21 $4b $c0
	ld   (hl), a                                     ; $3625: $77

// non-bit 7 x val in bc
	ld   hl, wBombXvals                                   ; $3626: $21 $18 $c6
	add  hl, bc                                      ; $3629: $09
	ld   a, (hl)                                     ; $362a: $7e
	and  $7f                                         ; $362b: $e6 $7f
	ld   c, a                                        ; $362d: $4f
	ld   b, $00                                      ; $362e: $06 $00

// check y bit 7 set
	pop  af
	bit  7, a
	jr   z, +

// if y bit 7 set, due to using sword, just explode
	call placeExplosion
	jp   @next

+
// otherwise
	call clearExplosionHere                               ; $363b: $cd $68 $3a
	ld   a, $05                                      ; $363e: $3e $05
	call Call_000_39ea                               ; $3640: $cd $ea $39
	call Call_000_3a0c                               ; $3643: $cd $0c $3a

@next:
	call Call_000_3737                               ; $3646: $cd $37 $37
	call playSoundEffect12h                               ; $3649: $cd $05 $28

	pop  bc                                          ; $364c: $c1
	jp   @toNextBomb                               ; $364d: $c3 $be $35


Call_000_3650:
	ld   hl, $c00c                                   ; $3650: $21 $0c $c0
	ld   (hl), c                                     ; $3653: $71
	ld   hl, $c00d                                   ; $3654: $21 $0d $c0
	ld   (hl), e                                     ; $3657: $73
	ld   bc, $0000                                   ; $3658: $01 $00 $00

Jump_000_365b:
	ld   hl, wBombTimers                                   ; $365b: $21 $00 $c6
	add  hl, bc                                      ; $365e: $09
	ld   a, (hl)                                     ; $365f: $7e
	cp   $00                                         ; $3660: $fe $00
	jr   nz, jr_000_366d                             ; $3662: $20 $09

jr_000_3664:
	inc  bc                                          ; $3664: $03
	ld   a, c                                        ; $3665: $79
	cp   $18                                         ; $3666: $fe $18
	jr   nc, jr_000_368e                             ; $3668: $30 $24

	jp   Jump_000_365b                               ; $366a: $c3 $5b $36


jr_000_366d:
	ld   hl, wBombXvals                                   ; $366d: $21 $18 $c6
	add  hl, bc                                      ; $3670: $09
	ld   a, (hl)                                     ; $3671: $7e
	and  $7f                                         ; $3672: $e6 $7f
	ld   hl, $c00c                                   ; $3674: $21 $0c $c0
	cp   (hl)                                        ; $3677: $be
	jr   nz, jr_000_3664                             ; $3678: $20 $ea

	ld   hl, wBombYvals                                   ; $367a: $21 $30 $c6
	add  hl, bc                                      ; $367d: $09
	ld   a, (hl)                                     ; $367e: $7e
	and  $7f                                         ; $367f: $e6 $7f
	ld   hl, $c00d                                   ; $3681: $21 $0d $c0
	cp   (hl)                                        ; $3684: $be
	jr   nz, jr_000_3664                             ; $3685: $20 $dd

	ld   a, $00                                      ; $3687: $3e $00
	ld   hl, wBombTimers                                   ; $3689: $21 $00 $c6
	add  hl, bc                                      ; $368c: $09
	ld   (hl), a                                     ; $368d: $77

jr_000_368e:
	ld   hl, $c00c                                   ; $368e: $21 $0c $c0
	ld   c, (hl)                                     ; $3691: $4e
	ld   b, $00                                      ; $3692: $06 $00
	ret                                              ; $3694: $c9


placeExplosionAtSides:
	dec  de
	call placeExplosion
	inc  de
	dec  bc
	call placeExplosion
	inc  bc
	inc  de
	call placeExplosion
	dec  de
	inc  bc
	call placeExplosion
	dec  bc
	ret


placeExplosionAtCorners:
	dec  bc
	dec  de
	call placeExplosion
	inc  de
	inc  de
	call placeExplosion
	dec  de
	inc  bc
	inc  bc
	inc  de
	call placeExplosion
	dec  de
	dec  de
	call placeExplosion
	inc  de
	dec  bc
	ret


placeExplosion:
// right side
	ld   a, c
	cp   $10
	jr   nc, @done

// bottom bounds
	ld   a, e
	cp   $0b
	jr   nc, @done

// dont place on walls, etc
	call getTileEntityOrPlayerIsOn
	cp   $2f
	jr   nc, @done

// do something different based on which tile we're exploding on
	push af
	push bc
	sla  a
	ld   c, a
	ld   b, $00
	ld   hl, tileTypeReactionOnExplosion
	add  hl, bc
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	pop  bc
	pop  af
	jp   hl

@done:
	ret


explosionReaction_27:
	call Call_000_3650                               ; $36e6: $cd $50 $36
	ld   a, $00                                      ; $36e9: $3e $00
	jp   +                               ; $36eb: $c3 $f0 $36

explosionReaction_1eOr23:
	ld   a, $80

+
	ld   hl, $c04b                                   ; $36f0: $21 $4b $c0
	ld   (hl), a                                     ; $36f3: $77
	ld   a, $06                                      ; $36f4: $3e $06
	call Call_001_6244                                       ; $36f6: $cd $44 $62
	jp   _ret_3736                               ; $36f9: $c3 $36 $37

_ret_36fc:
	ret                                              ; _ret_36fc: $c9


explosionReaction_common:
	call clearExplosionHere
	ld   a, $05                                      ; $3700: $3e $05
	call Call_000_39ea                               ; $3702: $cd $ea $39
	jp   Jump_000_3733                               ; $3705: $c3 $33 $37


explosionReaction_1c:
	ld   a, $1d                                      ; $3708: $3e $1d
	jp   Jump_000_371c                               ; $370a: $c3 $1c $37


explosionReaction_20:
	ld   a, $21                                      ; $370d: $3e $21
	jp   Jump_000_371c                               ; $370f: $c3 $1c $37


explosionReaction_21:
	ld   a, $22                                      ; $3712: $3e $22
	jp   Jump_000_371c                               ; $3714: $c3 $1c $37


explosionReaction_24:
	ld   a, $25                                      ; $3717: $3e $25
	jp   Jump_000_371c                               ; $3719: $c3 $1c $37


Jump_000_371c:
	ld   hl, $c00c                                   ; $371c: $21 $0c $c0
	ld   (hl), e                                     ; $371f: $73

	ld   de, $0000                                   ; $3720: $11 $00 $00

	ld   hl, $c00a                                   ; $3723: $21 $0a $c0
	ldi  a, (hl)                                     ; $3726: $2a
	ld   h, (hl)                                     ; $3727: $66
	ld   l, a                                        ; $3728: $6f
	add  hl, de                                      ; $3729: $19
	ld   (hl), a                                     ; $372a: $77

	ld   hl, $c00c                                   ; $372b: $21 $0c $c0
	ld   e, (hl)                                     ; $372e: $5e
	ld   d, $00                                      ; $372f: $16 $00
	
explosionReaction_1or2:
	ld   a, $01

Jump_000_3733:
	call Call_000_3a0c                               ; $3733: $cd $0c $3a

_ret_3736:
	ret


Call_000_3737:
// popped later into de
	ld   a, e                                        ; $3737: $7b
	push af                                          ; $3738: $f5

	sla  a                                           ; $3739: $cb $27
	sla  a                                           ; $373b: $cb $27
	sla  a                                           ; $373d: $cb $27
	sla  a                                           ; $373f: $cb $27
	ld   hl, $c0a8                                   ; $3741: $21 $a8 $c0
	ld   (hl), a                                     ; $3744: $77
	sub  $1a                                         ; $3745: $d6 $1a
	jr   nc, jr_000_374b                             ; $3747: $30 $02

	ld   a, $00                                      ; $3749: $3e $00

jr_000_374b:
	ld   hl, $c0a7                                   ; $374b: $21 $a7 $c0
	ld   (hl), a                                     ; $374e: $77
	ld   hl, $c0a8                                   ; $374f: $21 $a8 $c0
	ld   a, (hl)                                     ; $3752: $7e
	add  $1b                                         ; $3753: $c6 $1b
	ld   hl, $c0a8                                   ; $3755: $21 $a8 $c0
	ld   (hl), a                                     ; $3758: $77

// popped later into bc
	ld   a, c                                        ; $3759: $79
	push af                                          ; $375a: $f5

	sla  a                                           ; $375b: $cb $27
	sla  a                                           ; $375d: $cb $27
	sla  a                                           ; $375f: $cb $27
	sla  a                                           ; $3761: $cb $27
	ld   hl, $c0a9                                   ; $3763: $21 $a9 $c0
	ld   (hl), a                                     ; $3766: $77
	ld   hl, $c0aa                                   ; $3767: $21 $aa $c0
	ld   (hl), a                                     ; $376a: $77
	ld   hl, $c0a9                                   ; $376b: $21 $a9 $c0
	ld   a, (hl)                                     ; $376e: $7e
	sub  $1a                                         ; $376f: $d6 $1a
	jr   nc, jr_000_3775                             ; $3771: $30 $02

	ld   a, $00                                      ; $3773: $3e $00

jr_000_3775:
	ld   hl, $c0a9                                   ; $3775: $21 $a9 $c0
	ld   (hl), a                                     ; $3778: $77
	ld   hl, $c0aa                                   ; $3779: $21 $aa $c0
	ld   a, (hl)                                     ; $377c: $7e
	add  $1b                                         ; $377d: $c6 $1b
	jr   nc, jr_000_3783                             ; $377f: $30 $02

	ld   a, $ff                                      ; $3781: $3e $ff

jr_000_3783:
	ld   hl, $c0aa                                   ; $3783: $21 $aa $c0
	ld   (hl), a                                     ; $3786: $77
	ld   hl, $c04b                                   ; $3787: $21 $4b $c0
	ld   a, (hl)                                     ; $378a: $7e
	cp   $00                                         ; $378b: $fe $00
	jr   z, jr_000_37c2                              ; $378d: $28 $33

// continue if player y > c0a7
	ld   hl, wPlayerY                                   ; $378f: $21 $54 $c0
	ld   a, (hl)                                     ; $3792: $7e
	ld   hl, $c0a7                                   ; $3793: $21 $a7 $c0
	cp   (hl)                                        ; $3796: $be
	jr   c, jr_000_37c2                              ; $3797: $38 $29

// continue if player y < c0a8
	ld   hl, $c0a8                                   ; $3799: $21 $a8 $c0
	cp   (hl)                                        ; $379c: $be
	jr   nc, jr_000_37c2                             ; $379d: $30 $23

// continue if player x > c0a9
	ld   hl, wPlayerX                                   ; $379f: $21 $52 $c0
	ld   a, (hl)                                     ; $37a2: $7e
	ld   hl, $c0a9                                   ; $37a3: $21 $a9 $c0
	cp   (hl)                                        ; $37a6: $be
	jr   c, jr_000_37c2                              ; $37a7: $38 $19

// continue if player x < c0aa
	ld   hl, wPlayerX                                   ; $37a9: $21 $52 $c0
	ld   a, (hl)                                     ; $37ac: $7e
	ld   hl, $c0aa                                   ; $37ad: $21 $aa $c0
	cp   (hl)                                        ; $37b0: $be
	jr   nc, jr_000_37c2                             ; $37b1: $30 $0f

// player in between above 4 variables
	ld   a, $84                                      ; $37b3: $3e $84
	ld   hl, wBaseDamageTaken                                   ; $37b5: $21 $23 $c0
	ld   (hl), a                                     ; $37b8: $77
	ld   a, $ff                                      ; $37b9: $3e $ff
	ld   hl, wCurrNpcMovingDir                                   ; $37bb: $21 $24 $c0
	ld   (hl), a                                     ; $37be: $77
	call playerTakeDamage                               ; $37bf: $cd $75 $28

jr_000_37c2:
	ld   bc, $0000                                   ; $37c2: $01 $00 $00

jr_000_37c5:
	ld   hl, wFallingObjectID                                   ; $37c5: $21 $60 $c6
	add  hl, bc                                      ; $37c8: $09
	ld   a, (hl)                                     ; $37c9: $7e
	cp   $00                                         ; $37ca: $fe $00
	jr   nz, jr_000_37d7                             ; $37cc: $20 $09

Jump_000_37ce:
	inc  bc                                          ; $37ce: $03
	ld   a, c                                        ; $37cf: $79
	cp   $03                                         ; $37d0: $fe $03
	jr   c, jr_000_37c5                              ; $37d2: $38 $f1

	jp   setNpcNewIDBasedOnNpcByte6                               ; $37d4: $c3 $37 $38


jr_000_37d7:
	cp   $18                                         ; $37d7: $fe $18
	jr   c, Jump_000_37ce                              ; $37d9: $38 $f3

	ld   hl, wFallingObjectYval                                   ; $37db: $21 $69 $c6
	add  hl, bc                                      ; $37de: $09
	ld   a, (hl)                                     ; $37df: $7e
	ld   hl, $c0a7                                   ; $37e0: $21 $a7 $c0
	cp   (hl)                                        ; $37e3: $be
	jr   c, Jump_000_37ce                              ; $37e4: $38 $e8

	ld   hl, $c0a8                                   ; $37e6: $21 $a8 $c0
	cp   (hl)                                        ; $37e9: $be
	jr   nc, Jump_000_37ce                             ; $37ea: $30 $e2

	ld   hl, wFallingObjectXval                                   ; $37ec: $21 $63 $c6
	add  hl, bc                                      ; $37ef: $09
	ld   a, (hl)                                     ; $37f0: $7e
	ld   hl, $c0a9                                   ; $37f1: $21 $a9 $c0
	cp   (hl)                                        ; $37f4: $be
	jr   c, Jump_000_37ce                              ; $37f5: $38 $d7

	ld   hl, wFallingObjectXval                                   ; $37f7: $21 $63 $c6
	add  hl, bc                                      ; $37fa: $09
	ld   a, (hl)                                     ; $37fb: $7e
	ld   hl, $c0aa                                   ; $37fc: $21 $aa $c0
	cp   (hl)                                        ; $37ff: $be
	jr   nc, Jump_000_37ce                             ; $3800: $30 $cc

	ld   hl, wFallingObjectID                                   ; $3802: $21 $60 $c6
	add  hl, bc                                      ; $3805: $09
	ld   a, (hl)                                     ; $3806: $7e
	cp   $27                                         ; $3807: $fe $27
	jr   nc, Jump_000_37ce                             ; $3809: $30 $c3

	sub  $18                                         ; $380b: $d6 $18
	ld   hl, $c00c                                   ; $380d: $21 $0c $c0
	ld   (hl), c                                     ; $3810: $71
	push af                                          ; $3811: $f5

// a is double idx
// c004 is a word from the table
	sla  a                                           ; $3812: $cb $27
	ld   c, a                                        ; $3814: $4f
	ld   b, $00                                      ; $3815: $06 $00
	ld   hl, table_0b05                                   ; $3817: $21 $05 $0b
	add  hl, bc                                      ; $381a: $09
	ld   a, (hl)                                     ; $381b: $7e
	ld   hl, $c004                                   ; $381c: $21 $04 $c0
	ld   (hl), a                                     ; $381f: $77
	ld   hl, table_0b05+1                                   ; $3820: $21 $06 $0b
	add  hl, bc                                      ; $3823: $09
	ld   a, (hl)                                     ; $3824: $7e
	ld   hl, $c005                                   ; $3825: $21 $05 $c0
	ld   (hl), a                                     ; $3828: $77

//
	ld   hl, $c00c                                   ; $3829: $21 $0c $c0
	ld   c, (hl)                                     ; $382c: $4e
	ld   b, $00                                      ; $382d: $06 $00
	ld   hl, $c004                                   ; $382f: $21 $04 $c0
	ldi  a, (hl)                                     ; $3832: $2a
	ld   h, (hl)                                     ; $3833: $66
	ld   l, a                                        ; $3834: $6f
	pop  af                                          ; $3835: $f1
	jp   hl                                          ; $3836: $e9


setNpcNewIDBasedOnNpcByte6:
	ld   bc, $0000

@checkNextNPC:
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)
	cp   $ff
	jr   nz, @processNPC

@gotoCheckNextNPC:
	inc  bc
	ld   a, c
	cp   NUM_NPCS
	jr   c, @checkNextNPC

	pop  af                                          ; $3849: $f1
	ld   c, a                                        ; $384a: $4f
	ld   b, $00                                      ; $384b: $06 $00
	pop  af                                          ; $384d: $f1
	ld   e, a                                        ; $384e: $5f
	ld   d, $00                                      ; $384f: $16 $00
	ret                                              ; $3851: $c9

@processNPC:
	ld   hl, wNPC_yCoord                                   ; $3852: $21 $48 $cb
	add  hl, bc                                      ; $3855: $09
	ld   a, (hl)                                     ; $3856: $7e
	ld   hl, $c0a7                                   ; $3857: $21 $a7 $c0
	cp   (hl)                                        ; $385a: $be
	jr   c, @gotoCheckNextNPC                              ; $385b: $38 $e6

	ld   hl, $c0a8                                   ; $385d: $21 $a8 $c0
	cp   (hl)                                        ; $3860: $be
	jr   nc, @gotoCheckNextNPC                             ; $3861: $30 $e0

	ld   hl, wNPC_xCoord                                   ; $3863: $21 $3c $cb
	add  hl, bc                                      ; $3866: $09
	ld   a, (hl)                                     ; $3867: $7e
	ld   hl, $c0a9                                   ; $3868: $21 $a9 $c0
	cp   (hl)                                        ; $386b: $be
	jr   c, @gotoCheckNextNPC                              ; $386c: $38 $d5

	ld   hl, wNPC_xCoord                                   ; $386e: $21 $3c $cb
	add  hl, bc                                      ; $3871: $09
	ld   a, (hl)                                     ; $3872: $7e
	ld   hl, $c0aa                                   ; $3873: $21 $aa $c0
	cp   (hl)                                        ; $3876: $be
	jr   nc, @gotoCheckNextNPC                             ; $3877: $30 $ca

	call getBit4ofNPCBytes_cb60                                       ; $3879: $cd $72 $73
	jr   nz, @gotoCheckNextNPC                             ; $387c: $20 $c5

	call copy8npcMetadataBytesInto_c6d0                                       ; $387e: $cd $c6 $72
	ld   hl, wCommonByteCopyDestBytes+6                                   ; $3881: $21 $d6 $c6
	ld   a, (hl)                                     ; $3884: $7e
	cp   $ff                                         ; $3885: $fe $ff
	jr   z, +                              ; $3887: $28 $05

	ld   hl, wNPCBytes_newID                                   ; $3889: $21 $c0 $cb
	add  hl, bc                                      ; $388c: $09
	ld   (hl), a                                     ; $388d: $77

+
	jp   @gotoCheckNextNPC                               ; $388e: $c3 $43 $38


func_3891:
	ld   a, c
	push af                                          ; $3892: $f5
	ld   hl, wFallingObjectVar4                                   ; $3893: $21 $6c $c6
	add  hl, bc                                      ; $3896: $09
	ld   a, (hl)                                     ; $3897: $7e
	push af                                          ; $3898: $f5
	ld   hl, wFallingObjectYval                                   ; $3899: $21 $69 $c6
	add  hl, bc                                      ; $389c: $09
	ld   e, (hl)                                     ; $389d: $5e
	ld   d, $00                                      ; $389e: $16 $00
	ld   hl, wFallingObjectXval                                   ; $38a0: $21 $63 $c6
	add  hl, bc                                      ; $38a3: $09
	ld   a, (hl)                                     ; $38a4: $7e
	ld   c, a                                        ; $38a5: $4f
	ld   b, $00                                      ; $38a6: $06 $00
	call splitCEintoItsNybbles                                       ; $38a8: $cd $1c $55
	ld   hl, wChighNybble                                   ; $38ab: $21 $08 $c0
	ld   c, (hl)                                     ; $38ae: $4e
	ld   b, $00                                      ; $38af: $06 $00
	ld   hl, wEhighNybble                                   ; $38b1: $21 $09 $c0
	ld   e, (hl)                                     ; $38b4: $5e
	ld   d, $00                                      ; $38b5: $16 $00
	pop  af                                          ; $38b7: $f1
	cp   $06                                         ; $38b8: $fe $06
	jr   z, jr_000_38d6                              ; $38ba: $28 $1a

	jr   c, jr_000_38ca                              ; $38bc: $38 $0c

	ld   hl, wClowNybble                                   ; $38be: $21 $06 $c0
	ld   a, (hl)                                     ; $38c1: $7e
	cp   $09                                         ; $38c2: $fe $09
	jr   c, Jump_000_38df                              ; $38c4: $38 $19

	inc  bc                                          ; $38c6: $03
	jp   Jump_000_38df                               ; $38c7: $c3 $df $38


jr_000_38ca:
	ld   hl, wClowNybble                                   ; $38ca: $21 $06 $c0
	ld   a, (hl)                                     ; $38cd: $7e
	cp   $08                                         ; $38ce: $fe $08
	jr   c, Jump_000_38df                              ; $38d0: $38 $0d

	inc  bc                                          ; $38d2: $03
	jp   Jump_000_38df                               ; $38d3: $c3 $df $38


jr_000_38d6:
	ld   hl, wElowNybble                                   ; $38d6: $21 $07 $c0
	ld   a, (hl)                                     ; $38d9: $7e
	cp   $08                                         ; $38da: $fe $08
	jr   c, Jump_000_38df                              ; $38dc: $38 $01

	inc  de                                          ; $38de: $13

Jump_000_38df:
	ld   a, $80                                      ; $38df: $3e $80
	ld   hl, $c04b                                   ; $38e1: $21 $4b $c0
	ld   (hl), a                                     ; $38e4: $77
	ld   a, $06                                      ; $38e5: $3e $06
	call Call_001_6244                                       ; $38e7: $cd $44 $62
	pop  af                                          ; $38ea: $f1
	ld   c, a                                        ; $38eb: $4f
	ld   b, $00                                      ; $38ec: $06 $00

func_38ee:
	ld   a, $05                                      ; func_38ee: $3e $05
	ld   hl, wFallingObjectVar4                                   ; $38f0: $21 $6c $c6
	add  hl, bc                                      ; $38f3: $09
	ld   (hl), a                                     ; $38f4: $77
	ld   e, a                                        ; $38f5: $5f
	ld   d, $00                                      ; $38f6: $16 $00
	ld   hl, data_09fc                                   ; $38f8: $21 $fc $09
	add  hl, de                                      ; $38fb: $19
	ld   a, (hl)                                     ; $38fc: $7e
	ld   hl, wFallingObjectID                                   ; $38fd: $21 $60 $c6
	add  hl, bc                                      ; $3900: $09
	ld   (hl), a                                     ; $3901: $77
	ld   hl, data_09fd                                   ; $3902: $21 $fd $09
	add  hl, de                                      ; $3905: $19
	ld   a, (hl)                                     ; $3906: $7e
	ld   hl, wFallingObjectVar5                                   ; $3907: $21 $6f $c6
	add  hl, bc                                      ; $390a: $09
	ld   (hl), a                                     ; $390b: $77
	jp   Jump_000_3925                               ; $390c: $c3 $25 $39


func_390f:
	ld   a, $21                                      ; $390f: $3e $21
	jp   Jump_000_3920                               ; $3911: $c3 $20 $39


func_3914:
	ld   a, $22                                      ; $3914: $3e $22
	jp   Jump_000_3920                               ; $3916: $c3 $20 $39


func_3919:
	ld   a, $25                                      ; $3919: $3e $25
	jp   Jump_000_3920                               ; $391b: $c3 $20 $39


func_391e:
	ld   a, $1d                                      ; $391e: $3e $1d

Jump_000_3920:
	ld   hl, wFallingObjectID                                   ; $3920: $21 $60 $c6
	add  hl, bc                                      ; $3923: $09
	ld   (hl), a                                     ; $3924: $77

Jump_000_3925:
	jp   Jump_000_37ce


clearRoomFlagItem:
	ld   hl, wHiddenItemCol
	ld   (hl), c
	ld   bc, $0000

// loop and check which we collided with
@nextItem:
	ld   hl, wRoomFlagItemTypes
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   nz, +

@loop:
	inc  bc
	ld   a, c
	cp   NUM_ROOM_FLAG_ITEMS
	jr   nc, @done

	jp   @nextItem

+
// check col, then row
	ld   hl, wHiddenItemCol
	ld   a, (hl)
	ld   hl, wRoomFlagTileCol
	add  hl, bc
	cp   (hl)
	jr   nz, @loop

	ld   a, e
	ld   hl, wRoomFlagTileRow
	add  hl, bc
	cp   (hl)
	jr   nz, @loop

// clear item id so no more processing
	ld   a, $00
	ld   hl, wRoomFlagItemTypes
	add  hl, bc
	ld   (hl), a

// clear room flag
	ld   hl, wRoomFlagItemFlagIdx
	add  hl, bc
	ld   a, (hl)
	ld   hl, wRoomFlagIdxToCheck
	ld   (hl), a

	ld   hl, setRoomFlag
	call jpHLinBank1

@done:
// restore bc
	ld   hl, wHiddenItemCol
	ld   c, (hl)
	ld   b, $00
	ret


// returns 3-9 if hidden item here, and stores tile in c028
// otherwise, returns 1 if item on tele tile, or
// 0 if player not on item tile
getHiddenItemAtBC_DE:
	ld   hl, wHiddenItemCol
	ld   (hl), c
	ld   bc, $0000

@nextItem:
	ld   hl, wRoomFlagItemTypes
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   nz, @processItem

@toNextItem:
	inc  bc
	ld   a, c
	cp   NUM_ROOM_FLAG_ITEMS
	jr   c, @nextItem

// when done restore bc, and check if z should be set based on tele tiles
	ld   hl, wHiddenItemCol
	ld   c, (hl)
	ld   b, $00
	call retZifBC_DEonTeleTile
	ret

@processItem:
// the thing we're querying is not this item in wram
	ld   hl, wHiddenItemCol
	ld   a, (hl)
	ld   hl, wRoomFlagTileCol
	add  hl, bc
	cp   (hl)
	jr   nz, @toNextItem

// again different row, so try next
	ld   a, e
	ld   hl, wRoomFlagTileRow
	add  hl, bc
	cp   (hl)
	jr   nz, @toNextItem

// if the item we're querying is this item in wram, get its tile idx 
	ld   hl, wRoomFlagItemTileIdx
	add  hl, bc
	ld   a, (hl)
	ld   hl, wGenericVramCopyTileIdx
	ld   (hl), a

// get in A its base ID from 3-9
	ld   hl, wRoomFlagItemTypes
	add  hl, bc
	ld   a, (hl)

// restore bc
	ld   hl, wHiddenItemCol
	ld   c, (hl)
	ld   b, $00
	ret


retZifBC_DEonTeleTile:
	ld   a, $00
	ld   hl, wRoomCurrTeleportIdx
	ld   (hl), a

@checkNextTele:
	push de
	push bc
	call setTeleportDetails_retZifNotPossible
	pop  bc
	pop  de
	jr   nz, @checkIfPlayerAtPos

// not possible to set tele details
	ld   a, $00
	jp   @done

// able to teleport
@checkIfPlayerAtPos:
// bc is player x
	ld   hl, wCurrTeleportsTileX
	ld   a, c
	cp   (hl)
	jr   nz, @notAtTeleportCheckNext

// de is player y
	ld   hl, wCurrTeleportsTileY
	ld   a, e
	cp   (hl)
	jr   nz, @notAtTeleportCheckNext

	ld   a, $01
	jp   @done

@notAtTeleportCheckNext:
	ld   hl, wRoomCurrTeleportIdx
	inc  (hl)
	jp   @checkNextTele

@done:
	cp   $01
	ret


Call_000_39ea:
	cp   $05                                         ; $39ea: $fe $05
	jr   nz, @done                             ; $39ec: $20 $0c

	call getHiddenItemAtBC_DE                               ; $39ee: $cd $71 $39
	cp   $00                                         ; $39f1: $fe $00
	jr   z, @noHiddenItemNotOnTeleTile                              ; $39f3: $28 $03

	ld   a, $25                                      ; $39f5: $3e $25
	ret                                              ; $39f7: $c9

@noHiddenItemNotOnTeleTile:
	ld   a, $05                                      ; $39f8: $3e $05

@done:
	ret                                              ; $39fa: $c9


func_39fb:
	cp   $1d
	jr   nz, @done                             ; $39fd: $20 $0c

	call getHiddenItemAtBC_DE                               ; $39ff: $cd $71 $39
	cp   $00                                         ; $3a02: $fe $00
	jr   z, @noHiddenItemNotOnTeleTile                              ; $3a04: $28 $03

	ld   a, $2b                                      ; $3a06: $3e $2b
	ret                                              ; $3a08: $c9

@noHiddenItemNotOnTeleTile:
	ld   a, $1d                                      ; $3a09: $3e $1d

@done:
	ret                                              ; $3a0b: $c9


Call_000_3a0c:
// pushed a goes into bar 0
	push af

// pushed e goes into x val
	ld   a, e                                        ; $3a0d: $7b
	push af                                          ; $3a0e: $f5

// pushed c goes into y val
	ld   a, c                                        ; $3a0f: $79
	push af                                          ; $3a10: $f5

Jump_000_3a11:
	ld   bc, $0000                                   ; $3a11: $01 $00 $00

@nextExplosion:
	ld   hl, wExplosionVar0                                   ; $3a14: $21 $80 $c5
	add  hl, bc                                      ; $3a17: $09
	ld   a, (hl)                                     ; $3a18: $7e
	cp   $00                                         ; $3a19: $fe $00
	jr   z, @createExplosion                              ; $3a1b: $28 $0c

	inc  bc                                          ; $3a1d: $03
	ld   a, c                                        ; $3a1e: $79
	cp   NUM_EXPLOSIONS                                         ; $3a1f: $fe $18
	jr   c, @nextExplosion                              ; $3a21: $38 $f1

// no explosions could be placed
	call Call_000_3aa4                               ; $3a23: $cd $a4 $3a
	jp   Jump_000_3a11                               ; $3a26: $c3 $11 $3a

@createExplosion:
// set explosion vals
	pop  af                                          ; $3a29: $f1
	ld   hl, wExplosionYvals                                   ; $3a2a: $21 $98 $c5
	add  hl, bc                                      ; $3a2d: $09
	ld   (hl), a                                     ; $3a2e: $77

	pop  af                                          ; $3a2f: $f1
	ld   hl, wExplosionXvals                                   ; $3a30: $21 $b0 $c5
	add  hl, bc                                      ; $3a33: $09
	ld   (hl), a                                     ; $3a34: $77

	pop  af                                          ; $3a35: $f1
	ld   hl, wExplosionVar0                                   ; $3a36: $21 $80 $c5
	add  hl, bc                                      ; $3a39: $09
	ld   (hl), a                                     ; $3a3a: $77

	ld   e, a                                        ; $3a3b: $5f
	ld   d, $00                                      ; $3a3c: $16 $00
	ld   hl, data_09fd                                   ; $3a3e: $21 $fd $09
	add  hl, de                                      ; $3a41: $19
	ld   a, (hl)                                     ; $3a42: $7e
	ld   hl, wExplosionVar3                                   ; $3a43: $21 $c8 $c5
	add  hl, bc                                      ; $3a46: $09
	ld   (hl), a                                     ; $3a47: $77

// tile idx to generic copy to vram
	ld   hl, data_09fc                                   ; $3a48: $21 $fc $09
	add  hl, de                                      ; $3a4b: $19
	ld   a, (hl)                                     ; $3a4c: $7e
	push af                                          ; $3a4d: $f5

// coords for generic vram copy
	ld   hl, wExplosionXvals                                   ; $3a4e: $21 $b0 $c5
	add  hl, bc                                      ; $3a51: $09
	ld   e, (hl)                                     ; $3a52: $5e
	ld   d, $00                                      ; $3a53: $16 $00

	ld   hl, wExplosionYvals                                   ; $3a55: $21 $98 $c5
	add  hl, bc                                      ; $3a58: $09
	ld   a, (hl)                                     ; $3a59: $7e
	ld   c, a                                        ; $3a5a: $4f
	ld   b, $00                                      ; $3a5b: $06 $00

// get tile under explosion to replace
	call getTileEntityOrPlayerIsOn                               ; $3a5d: $cd $ed $3f
	pop  af                                          ; $3a60: $f1
	call getTileIdxForGenericVramCopy                               ; $3a61: $cd $fc $08
	call replaceTileHere                                       ; $3a64: $cd $f4 $58
	ret


clearExplosionHere:
	push af

// preserve c
	ld   hl, $c00c                                   ; $3a69: $21 $0c $c0
	ld   (hl), c                                     ; $3a6c: $71

	ld   bc, $0000

@nextExplosion:
	ld   hl, wExplosionVar0                                   ; $3a70: $21 $80 $c5
	add  hl, bc                                      ; $3a73: $09
	ld   a, (hl)                                     ; $3a74: $7e
	cp   $00                                         ; $3a75: $fe $00
	jr   nz, @processExplosion                             ; $3a77: $20 $09

@toNextExplosion:
	inc  bc
	ld   a, c
	cp   NUM_EXPLOSIONS
	jr   nc, @done

	jp   @nextExplosion

@processExplosion:
	ld   hl, $c00c                                   ; $3a82: $21 $0c $c0
	ld   a, (hl)                                     ; $3a85: $7e
	ld   hl, wExplosionYvals                                   ; $3a86: $21 $98 $c5
	add  hl, bc                                      ; $3a89: $09
	cp   (hl)                                        ; $3a8a: $be
	jr   nz, @toNextExplosion                             ; $3a8b: $20 $ec

	ld   a, e                                        ; $3a8d: $7b
	ld   hl, wExplosionXvals                                   ; $3a8e: $21 $b0 $c5
	add  hl, bc                                      ; $3a91: $09
	cp   (hl)                                        ; $3a92: $be
	jr   nz, @toNextExplosion                             ; $3a93: $20 $e4

	ld   a, $00                                      ; $3a95: $3e $00
	ld   hl, wExplosionVar0                                   ; $3a97: $21 $80 $c5
	add  hl, bc                                      ; $3a9a: $09
	ld   (hl), a                                     ; $3a9b: $77

@done:
	ld   hl, $c00c                                   ; $3a9c: $21 $0c $c0
	ld   c, (hl)                                     ; $3a9f: $4e
	ld   b, $00                                      ; $3aa0: $06 $00
	pop  af                                          ; $3aa2: $f1
	ret                                              ; $3aa3: $c9


Call_000_3aa4:
	ld   bc, $0000                                   ; $3aa4: $01 $00 $00

@nextExplosion:
	ld   hl, wExplosionVar0                                   ; $3aa7: $21 $80 $c5
	add  hl, bc                                      ; $3aaa: $09
	ld   a, (hl)                                     ; $3aab: $7e
	cp   $00                                         ; $3aac: $fe $00
	jr   z, @toNextExplosion                              ; $3aae: $28 $5a

	ld   hl, wExplosionVar3                                   ; $3ab0: $21 $c8 $c5
	add  hl, bc                                      ; $3ab3: $09
	dec  (hl)                                        ; $3ab4: $35
	jr   nz, @toNextExplosion                             ; $3ab5: $20 $53

	add  $02                                         ; $3ab7: $c6 $02
	ld   hl, wExplosionVar0                                   ; $3ab9: $21 $80 $c5
	add  hl, bc                                      ; $3abc: $09
	ld   (hl), a                                     ; $3abd: $77
	ld   e, a                                        ; $3abe: $5f
	ld   d, $00                                      ; $3abf: $16 $00
	ld   hl, data_09fd                                   ; $3ac1: $21 $fd $09
	add  hl, de                                      ; $3ac4: $19
	ld   a, (hl)                                     ; $3ac5: $7e
	cp   $00                                         ; $3ac6: $fe $00
	jr   nz, +                             ; $3ac8: $20 $08

	ld   hl, wExplosionVar0                                   ; $3aca: $21 $80 $c5
	add  hl, bc                                      ; $3acd: $09
	ld   (hl), a                                     ; $3ace: $77
	jp   @next                               ; $3acf: $c3 $d7 $3a

+
	ld   hl, wExplosionVar3                                   ; $3ad2: $21 $c8 $c5
	add  hl, bc                                      ; $3ad5: $09
	ld   (hl), a                                     ; $3ad6: $77

@next:
	ld   hl, data_09fc                                   ; $3ad7: $21 $fc $09
	add  hl, de                                      ; $3ada: $19
	ld   a, (hl)                                     ; $3adb: $7e
	ld   hl, $c00d                                   ; $3adc: $21 $0d $c0
	ld   (hl), a                                     ; $3adf: $77
	ld   hl, wExplosionXvals                                   ; $3ae0: $21 $b0 $c5
	add  hl, bc                                      ; $3ae3: $09
	ld   e, (hl)                                     ; $3ae4: $5e
	ld   d, $00                                      ; $3ae5: $16 $00
	push bc                                          ; $3ae7: $c5
	ld   hl, wExplosionYvals                                   ; $3ae8: $21 $98 $c5
	add  hl, bc                                      ; $3aeb: $09
	ld   a, (hl)                                     ; $3aec: $7e
	ld   c, a                                        ; $3aed: $4f
	ld   b, $00                                      ; $3aee: $06 $00
	call getTileEntityOrPlayerIsOn                               ; $3af0: $cd $ed $3f
	ld   hl, $c00d                                   ; $3af3: $21 $0d $c0
	ld   a, (hl)                                     ; $3af6: $7e
	cp   $00                                         ; $3af7: $fe $00
	jr   nz, +                             ; $3af9: $20 $08

// gets something from compressed layout (destroys tile?)
	call Call_000_078b                               ; $3afb: $cd $8b $07
	ld   a, $00
	jp   @replaceTileThenNext

+
	call getTileIdxForGenericVramCopy

@replaceTileThenNext:
	call replaceTileHere
	pop  bc

@toNextExplosion:
	inc  bc
	ld   a, c
	cp   NUM_EXPLOSIONS
	jr   c, @nextExplosion

	ret


updateFallingObjectsOam:
	ld   bc, $0000

// loop 3 times
@next:
// start from idx 2, and clear out for this
	ld   a, c
	sla  a
	add  $02
	call getLastUsableOamIdx_fromA
	call clear2spritesInOam_1stIdxedE

	ld   hl, wFallingObjectID
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   z, @toNext

// send tile idx to oam
	ld   hl, wFallingObjectTileIdx
	add  hl, bc
	ld   a, (hl)
	call converTileIdxToBGvramTileValue
	and  $fc
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a
	add  $02
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a

// attrs are 0
	ld   hl, wOam+3
	add  hl, de
	ld   (hl), $00
	ld   hl, wOam+7
	add  hl, de
	ld   (hl), $00

// send x vals
	ld   hl, wFallingObjectXval
	add  hl, bc
	ld   a, (hl)
	ld   hl, wSCXvalue
	sub  (hl)
	add  $08
	ld   hl, wOam+1
	add  hl, de
	ld   (hl), a
	add  $08
	ld   hl, wOam+5
	add  hl, de
	ld   (hl), a

// send y vals
	ld   hl, wFallingObjectYval
	add  hl, bc
	ld   a, (hl)
	add  $10
	ld   hl, wSCYvalue
	sub  (hl)
	ld   hl, wOam
	add  hl, de
	ld   (hl), a
	ld   hl, wOam+4
	add  hl, de
	ld   (hl), a

@toNext:
	inc  bc
	ld   a, c
	cp   NUM_FALLING_OBJECTS
	jr   c, @next

	ret


checkFallingObjectCollisions:
	ld   a, c                                        ; $3b7d: $79
	push af                                          ; $3b7e: $f5
	ld   hl, wFallingObjectYval                                   ; $3b7f: $21 $69 $c6
	add  hl, bc                                      ; $3b82: $09
	ld   a, (hl)                                     ; $3b83: $7e
	add  $0b                                         ; $3b84: $c6 $0b
	ld   hl, $c0c9                                   ; $3b86: $21 $c9 $c0
	ld   (hl), a                                     ; $3b89: $77

	sub  $17                                         ; $3b8a: $d6 $17
	ld   hl, $c0c8                                   ; $3b8c: $21 $c8 $c0
	ld   (hl), a                                     ; $3b8f: $77
	ld   hl, wFallingObjectXval                                   ; $3b90: $21 $63 $c6
	add  hl, bc                                      ; $3b93: $09
	ld   a, (hl)                                     ; $3b94: $7e
	add  $0f                                         ; $3b95: $c6 $0f
	ld   hl, $c0cb                                   ; $3b97: $21 $cb $c0
	ld   (hl), a                                     ; $3b9a: $77

	ld   hl, wFallingObjectXval                                   ; $3b9b: $21 $63 $c6
	add  hl, bc                                      ; $3b9e: $09
	ld   a, (hl)                                     ; $3b9f: $7e
	sub  $10                                         ; $3ba0: $d6 $10
	ld   hl, $c0ca                                   ; $3ba2: $21 $ca $c0
	ld   (hl), a                                     ; $3ba5: $77

	ld   hl, wFallingObjectXval                                   ; $3ba6: $21 $63 $c6
	add  hl, bc                                      ; $3ba9: $09
	ld   a, (hl)                                     ; $3baa: $7e
	add  $0b                                         ; $3bab: $c6 $0b
	ld   hl, $c0cd                                   ; $3bad: $21 $cd $c0
	ld   (hl), a                                     ; $3bb0: $77

	ld   hl, wFallingObjectXval                                   ; $3bb1: $21 $63 $c6
	add  hl, bc                                      ; $3bb4: $09
	ld   a, (hl)                                     ; $3bb5: $7e
	sub  $0c                                         ; $3bb6: $d6 $0c
	ld   hl, $c0cc                                   ; $3bb8: $21 $cc $c0
	ld   (hl), a                                     ; $3bbb: $77

//
	ld   hl, $c0c9                                   ; $3bbc: $21 $c9 $c0
	ld   a, (hl)                                     ; $3bbf: $7e
	ld   hl, wPlayerY                                   ; $3bc0: $21 $54 $c0
	cp   (hl)                                        ; $3bc3: $be
	jp   c, @next_3c56                            ; $3bc4: $da $56 $3c

	ld   hl, $c0c8                                   ; $3bc7: $21 $c8 $c0
	ld   a, (hl)                                     ; $3bca: $7e
	ld   hl, wPlayerY                                   ; $3bcb: $21 $54 $c0
	cp   (hl)                                        ; $3bce: $be
	jp   nc, @next_3c56                           ; $3bcf: $d2 $56 $3c

	ld   hl, $c0cb                                   ; $3bd2: $21 $cb $c0
	ld   a, (hl)                                     ; $3bd5: $7e
	ld   hl, wPlayerX                                   ; $3bd6: $21 $52 $c0
	cp   (hl)                                        ; $3bd9: $be
	jr   c, @next_3c56                              ; $3bda: $38 $7a

	ld   hl, $c0ca                                   ; $3bdc: $21 $ca $c0
	ld   a, (hl)                                     ; $3bdf: $7e
	ld   hl, wPlayerX                                   ; $3be0: $21 $52 $c0
	cp   (hl)                                        ; $3be3: $be
	jr   nc, @next_3c56                             ; $3be4: $30 $70

	ld   hl, wFallingObjectID                                   ; $3be6: $21 $60 $c6
	add  hl, bc                                      ; $3be9: $09
	ld   a, (hl)                                     ; $3bea: $7e
	cp   $18                                         ; $3beb: $fe $18
	jr   nz, +                             ; $3bed: $20 $24

	ld   a, $1d                                      ; $3bef: $3e $1d
	ld   hl, wFallingObjectVar4                                   ; $3bf1: $21 $6c $c6
	add  hl, bc                                      ; $3bf4: $09
	ld   (hl), a                                     ; $3bf5: $77
	ld   e, a                                        ; $3bf6: $5f
	ld   d, $00                                      ; $3bf7: $16 $00
	ld   hl, data_09fc                                   ; $3bf9: $21 $fc $09
	add  hl, de                                      ; $3bfc: $19
	ld   a, (hl)                                     ; $3bfd: $7e
	ld   hl, wFallingObjectID                                   ; $3bfe: $21 $60 $c6
	add  hl, bc                                      ; $3c01: $09
	ld   (hl), a                                     ; $3c02: $77
	ld   hl, data_09fd                                   ; $3c03: $21 $fd $09
	add  hl, de                                      ; $3c06: $19
	ld   a, (hl)                                     ; $3c07: $7e
	ld   hl, wFallingObjectVar5                                   ; $3c08: $21 $6f $c6
	add  hl, bc                                      ; $3c0b: $09
	ld   (hl), a                                     ; $3c0c: $77
	call add2toPlayerHealth                                       ; $3c0d: $cd $84 $50
	jp   @done                               ; $3c10: $c3 $68 $3c

+
	ld   hl, $c093                                   ; $3c13: $21 $93 $c0
	ld   a, (hl)                                     ; $3c16: $7e
	cp   $09                                         ; $3c17: $fe $09
	jr   z, @func_3c49                              ; $3c19: $28 $2e

	cp   $00                                         ; $3c1b: $fe $00
	jr   z, @func_3c51                              ; $3c1d: $28 $32

	cp   $03                                         ; $3c1f: $fe $03
	jr   z, @next_3c56                              ; $3c21: $28 $33

@loop_3c23:
// check hit player
	ld   hl, $c0cd                                   ; $3c23: $21 $cd $c0
	ld   a, (hl)                                     ; $3c26: $7e
	ld   hl, wPlayerX                                   ; $3c27: $21 $52 $c0
	cp   (hl)                                        ; $3c2a: $be
	jr   c, @next_3c56                              ; $3c2b: $38 $29

	ld   hl, $c0cc                                   ; $3c2d: $21 $cc $c0
	ld   a, (hl)                                     ; $3c30: $7e
	ld   hl, wPlayerX                                   ; $3c31: $21 $52 $c0
	cp   (hl)                                        ; $3c34: $be
	jr   nc, @next_3c56                             ; $3c35: $30 $1f

	ld   a, $81                                      ; $3c37: $3e $81
	ld   hl, wBaseDamageTaken                                   ; $3c39: $21 $23 $c0
	ld   (hl), a                                     ; $3c3c: $77
	ld   a, $ff                                      ; $3c3d: $3e $ff
	ld   hl, wCurrNpcMovingDir                                   ; $3c3f: $21 $24 $c0
	ld   (hl), a                                     ; $3c42: $77
	call playerTakeDamage                               ; $3c43: $cd $75 $28
	jp   @next_3c56                               ; $3c46: $c3 $56 $3c

@func_3c49:
	call func_4fe8                                       ; $3c49: $cd $e8 $4f
	jr   c, @loop_3c23                              ; $3c4c: $38 $d5

	jp   @next_3c56                               ; $3c4e: $c3 $56 $3c

@func_3c51:
	call func_5034                                       ; $3c51: $cd $34 $50
	jr   c, @loop_3c23                              ; $3c54: $38 $cd

@next_3c56:
// check hit npc
	ld   bc, $0000

@checkNextNPC:
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)
	cp   $ff
	jr   nz, @processNPC

@gotoCheckNextNPC:
	inc  bc
	ld   a, c
	cp   NUM_NPCS
	jr   c, @checkNextNPC

@done:
	pop  af
	ld   c, a
	ld   b, $00
	ret

@processNPC:
	ld   hl, wNPCBytes_cb60
	add  hl, bc                                      ; $3c70: $09
	ld   a, (hl)                                     ; $3c71: $7e
	and  $30                                         ; $3c72: $e6 $30
	jr   nz, @gotoCheckNextNPC                             ; $3c74: $20 $ec

	ld   hl, $c0c9                                   ; $3c76: $21 $c9 $c0
	ld   a, (hl)                                     ; $3c79: $7e
	ld   hl, wNPC_yCoord                                   ; $3c7a: $21 $48 $cb
	add  hl, bc                                      ; $3c7d: $09
	cp   (hl)                                        ; $3c7e: $be
	jr   c, @gotoCheckNextNPC                              ; $3c7f: $38 $e1

	ld   hl, $c0c8                                   ; $3c81: $21 $c8 $c0
	ld   a, (hl)                                     ; $3c84: $7e
	ld   hl, wNPC_yCoord                                   ; $3c85: $21 $48 $cb
	add  hl, bc                                      ; $3c88: $09
	cp   (hl)                                        ; $3c89: $be
	jr   nc, @gotoCheckNextNPC                             ; $3c8a: $30 $d6

	ld   hl, $c0cb                                   ; $3c8c: $21 $cb $c0
	ld   a, (hl)                                     ; $3c8f: $7e
	ld   hl, wNPC_xCoord                                   ; $3c90: $21 $3c $cb
	add  hl, bc                                      ; $3c93: $09
	cp   (hl)                                        ; $3c94: $be
	jr   c, @gotoCheckNextNPC                              ; $3c95: $38 $cb

	ld   hl, $c0ca                                   ; $3c97: $21 $ca $c0
	ld   a, (hl)                                     ; $3c9a: $7e
	ld   hl, wNPC_xCoord                                   ; $3c9b: $21 $3c $cb
	add  hl, bc                                      ; $3c9e: $09
	cp   (hl)                                        ; $3c9f: $be
	jr   nc, @gotoCheckNextNPC                             ; $3ca0: $30 $c0

	ld   hl, $c093                                   ; $3ca2: $21 $93 $c0
	ld   a, (hl)                                     ; $3ca5: $7e
	cp   $09                                         ; $3ca6: $fe $09
	jr   z, @func_3ce1                              ; $3ca8: $28 $37

	cp   $00                                         ; $3caa: $fe $00
	jr   z, @func_3cf3                              ; $3cac: $28 $45

@loop_3cae:
	ld   hl, $c0cd                                   ; $3cae: $21 $cd $c0
	ld   a, (hl)                                     ; $3cb1: $7e
	ld   hl, wNPC_xCoord                                   ; $3cb2: $21 $3c $cb
	add  hl, bc                                      ; $3cb5: $09
	cp   (hl)                                        ; $3cb6: $be
	jr   c, @gotoCheckNextNPC                              ; $3cb7: $38 $a9

	ld   hl, $c0cc                                   ; $3cb9: $21 $cc $c0
	ld   a, (hl)                                     ; $3cbc: $7e
	ld   hl, wNPC_xCoord                                   ; $3cbd: $21 $3c $cb
	add  hl, bc                                      ; $3cc0: $09
	cp   (hl)                                        ; $3cc1: $be
	jr   nc, @gotoCheckNextNPC                             ; $3cc2: $30 $9e

// bit 4 or 5 set, not affected
	call getBit4ofNPCBytes_cb60
	jr   nz, @gotoCheckNextNPC

	call getBit5ofNPCBytes_cb60
	jr   nz, @gotoCheckNextNPC

// set new npc id from bit 5
	call copy8npcMetadataBytesInto_c6d0
	ld   hl, wCommonByteCopyDestBytes+5
	ld   a, (hl)
	cp   $ff
	jr   z, @gotoCheckNextNPC

	ld   hl, wNPCBytes_newID
	add  hl, bc
	ld   (hl), a
	jp   @gotoCheckNextNPC

@func_3ce1:
	ld   hl, wCurrNpcIdx                                   ; $3ce1: $21 $a6 $c0
	ld   (hl), c                                     ; $3ce4: $71
	call func_47ed                                       ; $3ce5: $cd $ed $47
	ld   hl, wCurrNpcIdx                                   ; $3ce8: $21 $a6 $c0
	ld   c, (hl)                                     ; $3ceb: $4e
	ld   b, $00                                      ; $3cec: $06 $00
	jr   c, @loop_3cae                              ; $3cee: $38 $be

	jp   @gotoCheckNextNPC                               ; $3cf0: $c3 $62 $3c

@func_3cf3:
	ld   hl, wCurrNpcIdx                                   ; $3cf3: $21 $a6 $c0
	ld   (hl), c                                     ; $3cf6: $71
	call func_4849                                       ; $3cf7: $cd $49 $48
	ld   hl, wCurrNpcIdx                                   ; $3cfa: $21 $a6 $c0
	ld   c, (hl)                                     ; $3cfd: $4e
	ld   b, $00                                      ; $3cfe: $06 $00
	jr   c, @loop_3cae                              ; $3d00: $38 $ac

	jp   @gotoCheckNextNPC                               ; $3d02: $c3 $62 $3c


Call_000_3d05:
	ld   a, c                                        ; $3d05: $79
	push af                                          ; $3d06: $f5
	ld   hl, wFallingObjectYval                                   ; $3d07: $21 $69 $c6
	add  hl, bc                                      ; $3d0a: $09
	ld   a, (hl)                                     ; $3d0b: $7e
	add  $0b                                         ; $3d0c: $c6 $0b
	ld   hl, $c0c9                                   ; $3d0e: $21 $c9 $c0
	ld   (hl), a                                     ; $3d11: $77
	sub  $17                                         ; $3d12: $d6 $17
	ld   hl, $c0c8                                   ; $3d14: $21 $c8 $c0
	ld   (hl), a                                     ; $3d17: $77
	ld   hl, wFallingObjectXval                                   ; $3d18: $21 $63 $c6
	add  hl, bc                                      ; $3d1b: $09
	ld   a, (hl)                                     ; $3d1c: $7e
	add  $0b                                         ; $3d1d: $c6 $0b
	ld   hl, $c0cb                                   ; $3d1f: $21 $cb $c0
	ld   (hl), a                                     ; $3d22: $77
	ld   hl, wFallingObjectXval                                   ; $3d23: $21 $63 $c6
	add  hl, bc                                      ; $3d26: $09
	ld   a, (hl)                                     ; $3d27: $7e
	sub  $0c                                         ; $3d28: $d6 $0c
	ld   hl, $c0ca                                   ; $3d2a: $21 $ca $c0
	ld   (hl), a                                     ; $3d2d: $77
	ld   hl, $c0c9                                   ; $3d2e: $21 $c9 $c0
	ld   a, (hl)                                     ; $3d31: $7e
	ld   hl, wPlayerY                                   ; $3d32: $21 $54 $c0
	cp   (hl)                                        ; $3d35: $be
	jr   c, @next_3d97                              ; $3d36: $38 $5f

	ld   hl, $c0c8                                   ; $3d38: $21 $c8 $c0
	ld   a, (hl)                                     ; $3d3b: $7e
	ld   hl, wPlayerY                                   ; $3d3c: $21 $54 $c0
	cp   (hl)                                        ; $3d3f: $be
	jr   nc, @next_3d97                             ; $3d40: $30 $55

	ld   hl, $c0cb                                   ; $3d42: $21 $cb $c0
	ld   a, (hl)                                     ; $3d45: $7e
	ld   hl, wPlayerX                                   ; $3d46: $21 $52 $c0
	cp   (hl)                                        ; $3d49: $be
	jr   c, @next_3d97                              ; $3d4a: $38 $4b

	ld   hl, $c0ca                                   ; $3d4c: $21 $ca $c0
	ld   a, (hl)                                     ; $3d4f: $7e
	ld   hl, wPlayerX                                   ; $3d50: $21 $52 $c0
	cp   (hl)                                        ; $3d53: $be
	jr   nc, @next_3d97                             ; $3d54: $30 $41

	ld   hl, wFallingObjectID                                   ; $3d56: $21 $60 $c6
	add  hl, bc                                      ; $3d59: $09
	ld   a, (hl)                                     ; $3d5a: $7e
	cp   $18                                         ; $3d5b: $fe $18
	jr   nz, +                             ; $3d5d: $20 $24

	ld   a, $1d                                      ; $3d5f: $3e $1d
	ld   hl, wFallingObjectVar4                                   ; $3d61: $21 $6c $c6
	add  hl, bc                                      ; $3d64: $09
	ld   (hl), a                                     ; $3d65: $77
	ld   e, a                                        ; $3d66: $5f
	ld   d, $00                                      ; $3d67: $16 $00
	ld   hl, data_09fc                                   ; $3d69: $21 $fc $09
	add  hl, de                                      ; $3d6c: $19
	ld   a, (hl)                                     ; $3d6d: $7e
	ld   hl, wFallingObjectID                                   ; $3d6e: $21 $60 $c6
	add  hl, bc                                      ; $3d71: $09
	ld   (hl), a                                     ; $3d72: $77
	ld   hl, data_09fd                                   ; $3d73: $21 $fd $09
	add  hl, de                                      ; $3d76: $19
	ld   a, (hl)                                     ; $3d77: $7e
	ld   hl, wFallingObjectVar5                                   ; $3d78: $21 $6f $c6
	add  hl, bc                                      ; $3d7b: $09
	ld   (hl), a                                     ; $3d7c: $77
	call add2toPlayerHealth                                       ; $3d7d: $cd $84 $50
	jp   @done                               ; $3d80: $c3 $a9 $3d

+
	ld   hl, wFallingObjectVar4                                   ; $3d83: $21 $6c $c6
	add  hl, bc                                      ; $3d86: $09
	ld   a, (hl)                                     ; $3d87: $7e
	cp   $06                                         ; $3d88: $fe $06
	jr   nz, @next_3d97                             ; $3d8a: $20 $0b

	ld   a, $81                                      ; $3d8c: $3e $81
	ld   a, $ff                                      ; $3d8e: $3e $ff
	ld   hl, wCurrNpcMovingDir                                   ; $3d90: $21 $24 $c0
	ld   (hl), a                                     ; $3d93: $77
	call playerTakeDamage                               ; $3d94: $cd $75 $28

@next_3d97:
	ld   bc, $0000                                   ; $3d97: $01 $00 $00

@checkNextNPC:
	ld   hl, wNPCBytes_ID                                   ; $3d9a: $21 $30 $cb
	add  hl, bc                                      ; $3d9d: $09
	ld   a, (hl)                                     ; $3d9e: $7e
	cp   $ff                                         ; $3d9f: $fe $ff
	jr   nz, @processNPC                             ; $3da1: $20 $0b

@gotoCheckNextNPC:
	inc  bc                                          ; $3da3: $03
	ld   a, c                                        ; $3da4: $79
	cp   $0c                                         ; $3da5: $fe $0c
	jr   c, @checkNextNPC                              ; $3da7: $38 $f1

@done:
	pop  af                                          ; $3da9: $f1
	ld   c, a                                        ; $3daa: $4f
	ld   b, $00                                      ; $3dab: $06 $00
	ret                                              ; $3dad: $c9

@processNPC:
	ld   hl, $c0c9                                   ; $3dae: $21 $c9 $c0
	ld   a, (hl)                                     ; $3db1: $7e
	ld   hl, wNPC_yCoord                                   ; $3db2: $21 $48 $cb
	add  hl, bc                                      ; $3db5: $09
	cp   (hl)                                        ; $3db6: $be
	jr   c, @gotoCheckNextNPC                              ; $3db7: $38 $ea

	ld   hl, $c0c8                                   ; $3db9: $21 $c8 $c0
	ld   a, (hl)                                     ; $3dbc: $7e
	ld   hl, wNPC_yCoord                                   ; $3dbd: $21 $48 $cb
	add  hl, bc                                      ; $3dc0: $09
	cp   (hl)                                        ; $3dc1: $be
	jr   nc, @gotoCheckNextNPC                             ; $3dc2: $30 $df

	ld   hl, $c0cb                                   ; $3dc4: $21 $cb $c0
	ld   a, (hl)                                     ; $3dc7: $7e
	ld   hl, wNPC_xCoord                                   ; $3dc8: $21 $3c $cb
	add  hl, bc                                      ; $3dcb: $09
	cp   (hl)                                        ; $3dcc: $be
	jr   c, @gotoCheckNextNPC                              ; $3dcd: $38 $d4

	ld   hl, $c0ca                                   ; $3dcf: $21 $ca $c0
	ld   a, (hl)                                     ; $3dd2: $7e
	ld   hl, wNPC_xCoord                                   ; $3dd3: $21 $3c $cb
	add  hl, bc                                      ; $3dd6: $09
	cp   (hl)                                        ; $3dd7: $be
	jr   nc, @gotoCheckNextNPC                             ; $3dd8: $30 $c9

	call getBit4ofNPCBytes_cb60                                       ; $3dda: $cd $72 $73
	jr   nz, @gotoCheckNextNPC                             ; $3ddd: $20 $c4

	call getBit5ofNPCBytes_cb60                                       ; $3ddf: $cd $7a $73
	jr   nz, @gotoCheckNextNPC                             ; $3de2: $20 $bf

	call copy8npcMetadataBytesInto_c6d0                                       ; $3de4: $cd $c6 $72
	ld   hl, wCommonByteCopyDestBytes+5                                   ; $3de7: $21 $d5 $c6
	ld   a, (hl)                                     ; $3dea: $7e
	cp   $ff                                         ; $3deb: $fe $ff
	jr   z, @gotoCheckNextNPC                              ; $3ded: $28 $b4

	ld   hl, wNPCBytes_newID                                   ; $3def: $21 $c0 $cb
	add  hl, bc                                      ; $3df2: $09
	ld   (hl), a                                     ; $3df3: $77
	jp   @gotoCheckNextNPC                               ; $3df4: $c3 $a3 $3d


Call_000_3df7:
	ld   hl, wFallingObjectVar5                                   ; $3df7: $21 $6f $c6
	add  hl, bc                                      ; $3dfa: $09
	dec  (hl)                                        ; $3dfb: $35
	jr   nz, @done                             ; $3dfc: $20 $34

	ld   hl, wFallingObjectVar4                                   ; $3dfe: $21 $6c $c6
	add  hl, bc                                      ; $3e01: $09
	ld   a, (hl)                                     ; $3e02: $7e
	add  $02                                         ; $3e03: $c6 $02
	ld   hl, wFallingObjectVar4                                   ; $3e05: $21 $6c $c6
	add  hl, bc                                      ; $3e08: $09
	ld   (hl), a                                     ; $3e09: $77
	ld   e, a                                        ; $3e0a: $5f
	ld   d, $00                                      ; $3e0b: $16 $00
	ld   hl, data_09fd                                   ; $3e0d: $21 $fd $09
	add  hl, de                                      ; $3e10: $19
	ld   a, (hl)                                     ; $3e11: $7e
	cp   $00                                         ; $3e12: $fe $00
	jr   nz, @func_3e23                             ; $3e14: $20 $0d

	ld   a, $00                                      ; $3e16: $3e $00
	ld   hl, wFallingObjectID                                   ; $3e18: $21 $60 $c6
	add  hl, bc                                      ; $3e1b: $09
	ld   (hl), a                                     ; $3e1c: $77
	ld   hl, wFallingObjectVar4                                   ; $3e1d: $21 $6c $c6
	add  hl, bc                                      ; $3e20: $09
	ld   (hl), a                                     ; $3e21: $77
	ret                                              ; $3e22: $c9

@func_3e23:
	ld   hl, wFallingObjectVar5                                   ; $3e23: $21 $6f $c6
	add  hl, bc                                      ; $3e26: $09
	ld   (hl), a                                     ; $3e27: $77
	ld   hl, data_09fc                                   ; $3e28: $21 $fc $09
	add  hl, de                                      ; $3e2b: $19
	ld   a, (hl)                                     ; $3e2c: $7e
	ld   hl, wFallingObjectID                                   ; $3e2d: $21 $60 $c6
	add  hl, bc                                      ; $3e30: $09
	ld   (hl), a                                     ; $3e31: $77

@done:
	ret


updateFallingObjects:
	ld   bc, $0000

@nextFallingObject:
	ld   hl, wFallingObjectID
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   nz, @processFallingObject

@toNextFallingObject:
	inc  bc
	ld   a, c
	cp   NUM_FALLING_OBJECTS
	jr   c, @nextFallingObject

	ret

@func_3e46:
	call Call_000_3df7                               ; $3e46: $cd $f7 $3d
	jp   @toNextFallingObject                               ; $3e49: $c3 $3f $3e


@processFallingObject:
	cp   $18                                         ; $3e4c: $fe $18
	jr   c, @func_3e46                              ; $3e4e: $38 $f6

	ld   hl, wFallingObjectVar4                                   ; $3e50: $21 $6c $c6
	add  hl, bc                                      ; $3e53: $09
	ld   a, (hl)                                     ; $3e54: $7e
	cp   $06                                         ; $3e55: $fe $06
	jr   z, @func_3e94                              ; $3e57: $28 $3b

	cp   $09                                         ; $3e59: $fe $09
	jr   z, @func_3e64                              ; $3e5b: $28 $07

	cp   $00                                         ; $3e5d: $fe $00
	jr   z, @func_3e7c                              ; $3e5f: $28 $1b

	jp   @func_3f20                               ; $3e61: $c3 $20 $3f

@func_3e64:
	ld   hl, wFallingObjectXval                                   ; $3e64: $21 $63 $c6
	add  hl, bc                                      ; $3e67: $09
	dec  (hl)                                        ; $3e68: $35
	ld   a, $09                                      ; $3e69: $3e $09
	ld   hl, $c093                                   ; $3e6b: $21 $93 $c0
	ld   (hl), a                                     ; $3e6e: $77
	call checkFallingObjectCollisions                               ; $3e6f: $cd $7d $3b
	ld   hl, wFallingObjectVar5                                   ; $3e72: $21 $6f $c6
	add  hl, bc                                      ; $3e75: $09
	dec  (hl)                                        ; $3e76: $35
	jr   nz, @toNextFallingObject                             ; $3e77: $20 $c6

	jp   @func_3eb2                               ; $3e79: $c3 $b2 $3e

@func_3e7c:
	ld   hl, wFallingObjectXval                                   ; $3e7c: $21 $63 $c6
	add  hl, bc                                      ; $3e7f: $09
	inc  (hl)                                        ; $3e80: $34
	ld   a, $00                                      ; $3e81: $3e $00
	ld   hl, $c093                                   ; $3e83: $21 $93 $c0
	ld   (hl), a                                     ; $3e86: $77
	call checkFallingObjectCollisions                               ; $3e87: $cd $7d $3b
	ld   hl, wFallingObjectVar5                                   ; $3e8a: $21 $6f $c6
	add  hl, bc                                      ; $3e8d: $09
	dec  (hl)                                        ; $3e8e: $35
	jr   nz, @toNextFallingObject                             ; $3e8f: $20 $ae

	jp   @func_3eb2                               ; $3e91: $c3 $b2 $3e

@func_3e94:
	ld   hl, wFallingObjectYval                                   ; $3e94: $21 $69 $c6
	add  hl, bc                                      ; $3e97: $09
	ld   a, (hl)                                     ; $3e98: $7e
	cp   $a0                                         ; $3e99: $fe $a0
	jr   nc, @func_3eb2                             ; $3e9b: $30 $15

	ld   hl, wFallingObjectYval                                   ; $3e9d: $21 $69 $c6
	add  hl, bc                                      ; $3ea0: $09
	inc  (hl)                                        ; $3ea1: $34
	ld   a, $06                                      ; $3ea2: $3e $06
	ld   hl, $c093                                   ; $3ea4: $21 $93 $c0
	ld   (hl), a                                     ; $3ea7: $77
	call Call_000_3d05                               ; $3ea8: $cd $05 $3d
	ld   hl, wFallingObjectVar5                                   ; $3eab: $21 $6f $c6
	add  hl, bc                                      ; $3eae: $09
	dec  (hl)                                        ; $3eaf: $35
	jr   nz, @toNextFallingObject2                             ; $3eb0: $20 $6b

@func_3eb2:
	ld   a, c                                        ; $3eb2: $79
	push af                                          ; $3eb3: $f5
	ld   hl, wFallingObjectVar4                                   ; $3eb4: $21 $6c $c6
	add  hl, bc                                      ; $3eb7: $09
	ld   a, (hl)                                     ; $3eb8: $7e
	push af                                          ; $3eb9: $f5
	ld   hl, wFallingObjectID                                   ; $3eba: $21 $60 $c6
	add  hl, bc                                      ; $3ebd: $09
	ld   a, (hl)                                     ; $3ebe: $7e
	push af                                          ; $3ebf: $f5
	ld   a, $00                                      ; $3ec0: $3e $00
	ld   hl, wFallingObjectID                                   ; $3ec2: $21 $60 $c6
	add  hl, bc                                      ; $3ec5: $09
	ld   (hl), a                                     ; $3ec6: $77
	ld   hl, wFallingObjectTileIdx                                   ; $3ec7: $21 $66 $c6
	add  hl, bc                                      ; $3eca: $09
	ld   a, (hl)                                     ; $3ecb: $7e
	push af                                          ; $3ecc: $f5
	ld   hl, wFallingObjectYval                                   ; $3ecd: $21 $69 $c6
	add  hl, bc                                      ; $3ed0: $09
	ld   e, (hl)                                     ; $3ed1: $5e
	ld   d, $00                                      ; $3ed2: $16 $00
	ld   hl, wFallingObjectXval                                   ; $3ed4: $21 $63 $c6
	add  hl, bc                                      ; $3ed7: $09
	ld   a, (hl)                                     ; $3ed8: $7e
	ld   c, a                                        ; $3ed9: $4f
	ld   b, $00                                      ; $3eda: $06 $00
	call splitCEintoItsNybbles                                       ; $3edc: $cd $1c $55
	ld   hl, wChighNybble                                   ; $3edf: $21 $08 $c0
	ld   c, (hl)                                     ; $3ee2: $4e
	ld   b, $00                                      ; $3ee3: $06 $00
	ld   hl, wEhighNybble                                   ; $3ee5: $21 $09 $c0
	ld   e, (hl)                                     ; $3ee8: $5e
	ld   d, $00                                      ; $3ee9: $16 $00
	call getTileEntityOrPlayerIsOn                               ; $3eeb: $cd $ed $3f
	pop  af                                          ; $3eee: $f1
	ld   hl, $c028                                   ; $3eef: $21 $28 $c0
	ld   (hl), a                                     ; $3ef2: $77
	pop  af                                          ; $3ef3: $f1
	or   $80                                         ; $3ef4: $f6 $80
	call replaceTileHere                                       ; $3ef6: $cd $f4 $58
	call clearExplosionHere                               ; $3ef9: $cd $68 $3a
	cp   $1f                                         ; $3efc: $fe $1f
	jr   nz, @func_3f18                             ; $3efe: $20 $18

	pop  af                                          ; $3f00: $f1
	cp   $06                                         ; $3f01: $fe $06
	jr   nz, @func_3f19                             ; $3f03: $20 $14

	inc  de                                          ; $3f05: $13
	call getTileEntityOrPlayerIsOn                               ; $3f06: $cd $ed $3f
	cp   $18                                         ; $3f09: $fe $18
	jr   nz, @func_3f19                             ; $3f0b: $20 $0c

	ld   a, $0d                                      ; $3f0d: $3e $0d
	call Call_000_3a0c                               ; $3f0f: $cd $0c $3a
	call playSoundEffect27h                               ; $3f12: $cd $58 $28
	jp   @func_3f19                               ; $3f15: $c3 $19 $3f

@func_3f18:
	pop  af                                          ; $3f18: $f1

@func_3f19:
	pop  af                                          ; $3f19: $f1
	ld   c, a                                        ; $3f1a: $4f
	ld   b, $00                                      ; $3f1b: $06 $00

@toNextFallingObject2:
	jp   @toNextFallingObject                               ; $3f1d: $c3 $3f $3e

@func_3f20:
	ld   hl, wFallingObjectYval                                   ; $3f20: $21 $69 $c6
	add  hl, bc                                      ; $3f23: $09
	ld   a, (hl)                                     ; $3f24: $7e
	cp   $00                                         ; $3f25: $fe $00
	jr   z, @func_3eb2                              ; $3f27: $28 $89

	ld   hl, wFallingObjectYval                                   ; $3f29: $21 $69 $c6
	add  hl, bc                                      ; $3f2c: $09
	dec  (hl)                                        ; $3f2d: $35
	ld   a, $03                                      ; $3f2e: $3e $03
	ld   hl, $c093                                   ; $3f30: $21 $93 $c0
	ld   (hl), a                                     ; $3f33: $77
	call Call_000_3d05                               ; $3f34: $cd $05 $3d
	ld   hl, wFallingObjectVar5                                   ; $3f37: $21 $6f $c6
	add  hl, bc                                      ; $3f3a: $09
	dec  (hl)                                        ; $3f3b: $35
	jr   nz, @toNextFallingObject2                             ; $3f3c: $20 $df

	jp   @func_3eb2                               ; $3f3e: $c3 $b2 $3e


func_3f41:
	call getTileEntityOrPlayerIsOn                               ; func_3f41: $cd $ed $3f
	cp   $10                                         ; $3f44: $fe $10
	jr   c, +                              ; $3f46: $38 $02

	scf                                              ; $3f48: $37
	ret                                              ; $3f49: $c9

+
	push bc                                          ; $3f4a: $c5
	ld   hl, $c00c                                   ; $3f4b: $21 $0c $c0
	ld   (hl), c                                     ; $3f4e: $71
	ld   hl, $c00d                                   ; $3f4f: $21 $0d $c0
	ld   (hl), e                                     ; $3f52: $73
	ld   bc, $0000                                   ; $3f53: $01 $00 $00

@nextFallingObject:
	ld   hl, wFallingObjectID                                   ; $3f56: $21 $60 $c6
	add  hl, bc                                      ; $3f59: $09
	ld   a, (hl)                                     ; $3f5a: $7e
	cp   $00                                         ; $3f5b: $fe $00
	jp   z, @toNextFallingObject                            ; $3f5d: $ca $e2 $3f

	cp   $18                                         ; $3f60: $fe $18
	jp   c, @toNextFallingObject                            ; $3f62: $da $e2 $3f

	ld   hl, wFallingObjectVar4                                   ; $3f65: $21 $6c $c6
	add  hl, bc                                      ; $3f68: $09
	ld   a, (hl)                                     ; $3f69: $7e
	cp   $06                                         ; $3f6a: $fe $06
	jr   z, @func_3fd4                              ; $3f6c: $28 $66

	jr   c, @func_3fa1                              ; $3f6e: $38 $31

	ld   hl, wFallingObject2x2xVal                                   ; $3f70: $21 $72 $c6
	add  hl, bc                                      ; $3f73: $09
	ld   a, (hl)                                     ; $3f74: $7e
	ld   hl, $c00c                                   ; $3f75: $21 $0c $c0
	cp   (hl)                                        ; $3f78: $be
	jr   nz, @func_3f89                             ; $3f79: $20 $0e

	ld   hl, wFallingObject2x2yVal                                   ; $3f7b: $21 $75 $c6
	add  hl, bc                                      ; $3f7e: $09
	ld   a, (hl)                                     ; $3f7f: $7e

@func_3f80:
	ld   hl, $c00d                                   ; $3f80: $21 $0d $c0
	cp   (hl)                                        ; $3f83: $be
	jr   nz, @toNextFallingObject                             ; $3f84: $20 $5c

	jp   @aEqu26h_scf                               ; $3f86: $c3 $b7 $3f

@func_3f89:
	sub  $01                                         ; $3f89: $d6 $01
	ld   hl, $c00c                                   ; $3f8b: $21 $0c $c0
	cp   (hl)                                        ; $3f8e: $be
	jr   nz, @toNextFallingObject                             ; $3f8f: $20 $51

	ld   hl, wFallingObject2x2yVal                                   ; $3f91: $21 $75 $c6
	add  hl, bc                                      ; $3f94: $09
	ld   a, (hl)                                     ; $3f95: $7e
	ld   hl, $c00d                                   ; $3f96: $21 $0d $c0
	cp   (hl)                                        ; $3f99: $be
	jr   z, @aEqu26h_scf                              ; $3f9a: $28 $1b

	add  $01                                         ; $3f9c: $c6 $01
	jp   @func_3f80                               ; $3f9e: $c3 $80 $3f

@func_3fa1:
	ld   hl, wFallingObject2x2xVal                                   ; $3fa1: $21 $72 $c6
	add  hl, bc                                      ; $3fa4: $09
	ld   a, (hl)                                     ; $3fa5: $7e
	ld   hl, $c00c                                   ; $3fa6: $21 $0c $c0
	cp   (hl)                                        ; $3fa9: $be
	jr   nz, @func_3fbc                             ; $3faa: $20 $10

	ld   hl, wFallingObject2x2yVal                                   ; $3fac: $21 $75 $c6
	add  hl, bc                                      ; $3faf: $09
	ld   a, (hl)                                     ; $3fb0: $7e

@func_3fb1:
	ld   hl, $c00d                                   ; $3fb1: $21 $0d $c0
	cp   (hl)                                        ; $3fb4: $be
	jr   nz, @toNextFallingObject                             ; $3fb5: $20 $2b

@aEqu26h_scf:
	pop  bc                                          ; $3fb7: $c1
	ld   a, $26                                      ; $3fb8: $3e $26
	scf                                              ; $3fba: $37
	ret                                              ; $3fbb: $c9

@func_3fbc:
	add  $01                                         ; $3fbc: $c6 $01
	ld   hl, $c00c                                   ; $3fbe: $21 $0c $c0
	cp   (hl)                                        ; $3fc1: $be
	jr   nz, @toNextFallingObject                             ; $3fc2: $20 $1e

@func_3fc4:
	ld   hl, wFallingObject2x2yVal                                   ; $3fc4: $21 $75 $c6
	add  hl, bc                                      ; $3fc7: $09
	ld   a, (hl)                                     ; $3fc8: $7e
	ld   hl, $c00d                                   ; $3fc9: $21 $0d $c0
	cp   (hl)                                        ; $3fcc: $be
	jr   z, @aEqu26h_scf                              ; $3fcd: $28 $e8

	add  $01                                         ; $3fcf: $c6 $01
	jp   @func_3fb1                               ; $3fd1: $c3 $b1 $3f

@func_3fd4:
	ld   hl, wFallingObject2x2xVal                                   ; $3fd4: $21 $72 $c6
	add  hl, bc                                      ; $3fd7: $09
	ld   a, (hl)                                     ; $3fd8: $7e
	ld   hl, $c00c                                   ; $3fd9: $21 $0c $c0
	cp   (hl)                                        ; $3fdc: $be
	jr   nz, @toNextFallingObject                             ; $3fdd: $20 $03

	jp   @func_3fc4                               ; $3fdf: $c3 $c4 $3f

@toNextFallingObject:
	inc  bc
	ld   a, c
	cp   NUM_FALLING_OBJECTS
	jp   c, @nextFallingObject

	pop  bc
	scf
	ccf
	ret


// c008 is x coord, c009 is y coord
getTileEntityOrPlayerIsOn:
	push de
	call c028_equGameScreenTileIdx_16ePlusC
// c01e equals 16e+c
	ld   hl, wECbyte
	ld   e, (hl)
	ld   d, $00
	ld   hl, w2x2tileTypes
	add  hl, de
	push hl
	pop  de
// de is tile type
// full tile type in c0af
	ld   a, (hl)                                     ; $3ffd: $7e
	ld   hl, $c0af                                         ; $3ffe: $21
	ld   (hl), a                                     ; $4001: $77
	and  $7f                                         ; $4002: $e6 $7f

// tile type addr in c00a/b
	ld   hl, $c00a                                   ; $4004: $21 $0a $c0
	ld   (hl), e                                     ; $4007: $73
	inc  hl                                          ; $4008: $23
	ld   (hl), d                                     ; $4009: $72
	
// a is tile type with no bit 7
	pop  de                                          ; $400a: $d1
	ret                                              ; $400b: $c9


c028_equGameScreenTileIdx_16ePlusC:
	push af
	push bc
	call store16ePlusCin_c01e
	ld   hl, wECbyte
	ld   c, (hl)
	ld   b, $00
	ld   hl, w2x2gameScreenTiles
	add  hl, bc
	ld   a, (hl)
	ld   hl, wGenericGameScreenTileIdx
	ld   (hl), a
	pop  bc
	pop  af
	ret


Call_001_4023:
	ld   a, c                                        ; $4023: $79
	push af                                          ; $4024: $f5
	sla  a                                           ; $4025: $cb $27
	sla  a                                           ; $4027: $cb $27
	sla  a                                           ; $4029: $cb $27
	sla  a                                           ; $402b: $cb $27
	ld   hl, $c006                                   ; $402d: $21 $06 $c0
	ld   (hl), a                                     ; $4030: $77
	ld   hl, $c008                                   ; $4031: $21 $08 $c0
	ld   (hl), a                                     ; $4034: $77
	ld   a, $00                                      ; $4035: $3e $00
	rl   a                                           ; $4037: $cb $17
	ld   hl, $c007                                   ; $4039: $21 $07 $c0
	ld   (hl), a                                     ; $403c: $77
	ld   hl, $c009                                   ; $403d: $21 $09 $c0
	ld   (hl), a                                     ; $4040: $77
	ld   hl, $c006                                   ; $4041: $21 $06 $c0
	ld   a, (hl)                                     ; $4044: $7e
	sub  $0b                                         ; $4045: $d6 $0b
	ld   hl, $c006                                   ; $4047: $21 $06 $c0
	ld   (hl), a                                     ; $404a: $77
	ld   hl, $c007                                   ; $404b: $21 $07 $c0
	ld   a, (hl)                                     ; $404e: $7e
	sbc  $00                                         ; $404f: $de $00
	ld   hl, $c007                                   ; $4051: $21 $07 $c0
	ld   (hl), a                                     ; $4054: $77
	ld   hl, $c008                                   ; $4055: $21 $08 $c0
	ld   a, (hl)                                     ; $4058: $7e
	add  $0c                                         ; $4059: $c6 $0c
	ld   hl, $c008                                   ; $405b: $21 $08 $c0
	ld   (hl), a                                     ; $405e: $77
	ld   hl, $c009                                   ; $405f: $21 $09 $c0
	ld   a, (hl)                                     ; $4062: $7e
	adc  $00                                         ; $4063: $ce $00
	ld   hl, $c009                                   ; $4065: $21 $09 $c0
	ld   (hl), a                                     ; $4068: $77
	ld   a, e                                        ; $4069: $7b
	sla  a                                           ; $406a: $cb $27
	sla  a                                           ; $406c: $cb $27
	sla  a                                           ; $406e: $cb $27
	sla  a                                           ; $4070: $cb $27
	ld   hl, $c00b                                   ; $4072: $21 $0b $c0
	ld   (hl), a                                     ; $4075: $77
	ld   hl, $c00b                                   ; $4076: $21 $0b $c0
	inc  (hl)                                        ; $4079: $34
	sub  $04                                         ; $407a: $d6 $04
	ld   hl, $c00a                                   ; $407c: $21 $0a $c0
	ld   (hl), a                                     ; $407f: $77

Jump_001_4080:
// check player in bounding box
	ld   hl, wPlayerY                                   ; $4080: $21 $54 $c0
	ld   a, (hl)                                     ; $4083: $7e
	ld   hl, $c00a                                   ; $4084: $21 $0a $c0
	cp   (hl)                                        ; $4087: $be
	jr   c, @next_40ac                              ; $4088: $38 $22

	ld   hl, $c00b                                   ; $408a: $21 $0b $c0
	cp   (hl)                                        ; $408d: $be
	jr   nc, @next_40ac                             ; $408e: $30 $1c

	ld   hl, wPlayerX                                   ; $4090: $21 $52 $c0
	ld   a, (hl)                                     ; $4093: $7e
	ld   hl, $c006                                   ; $4094: $21 $06 $c0
	cp   (hl)                                        ; $4097: $be
	jr   c, @next_40ac                              ; $4098: $38 $12

	ld   hl, wPlayerX                                   ; $409a: $21 $52 $c0
	ld   a, (hl)                                     ; $409d: $7e
	ld   hl, $c008                                   ; $409e: $21 $08 $c0
	cp   (hl)                                        ; $40a1: $be
	jr   nc, @next_40ac                             ; $40a2: $30 $08

	pop  af                                          ; $40a4: $f1
	ld   c, a                                        ; $40a5: $4f
	ld   b, $00                                      ; $40a6: $06 $00
	ld   a, $00                                      ; $40a8: $3e $00
	scf                                              ; $40aa: $37
	ret                                              ; $40ab: $c9

@next_40ac:
	ld   bc, $0000                                   ; $40ac: $01 $00 $00

@checkNextNPC:
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)                                     ; $40b3: $7e
	cp   $ff
	jr   nz, @processNPC                             ; $40b6: $20 $17

@gotoCheckNextNPC:
	inc  bc                                          ; $40b8: $03
	ld   a, c                                        ; $40b9: $79
	cp   NUM_NPCS                                         ; $40ba: $fe $0c
	jr   c, @checkNextNPC                              ; $40bc: $38 $f1

	pop  af                                          ; $40be: $f1
	ld   c, a                                        ; $40bf: $4f
	ld   b, $00                                      ; $40c0: $06 $00
	ld   a, $ff                                      ; $40c2: $3e $ff
	scf                                              ; $40c4: $37
	ccf                                              ; $40c5: $3f
	ret                                              ; $40c6: $c9

@done:
	pop  af                                          ; $40c7: $f1
	ld   c, a                                        ; $40c8: $4f
	ld   b, $00                                      ; $40c9: $06 $00
	ld   a, $01                                      ; $40cb: $3e $01
	scf                                              ; $40cd: $37
	ret                                              ; $40ce: $c9

@processNPC:
	ld   hl, wNPC_yCoord                                   ; $40cf: $21 $48 $cb
	add  hl, bc                                      ; $40d2: $09
	ld   a, (hl)                                     ; $40d3: $7e
	ld   hl, $c00a                                   ; $40d4: $21 $0a $c0
	cp   (hl)                                        ; $40d7: $be
	jr   c, @gotoCheckNextNPC                              ; $40d8: $38 $de

	ld   hl, $c00b                                   ; $40da: $21 $0b $c0
	cp   (hl)                                        ; $40dd: $be
	jr   nc, @gotoCheckNextNPC                             ; $40de: $30 $d8

	ld   hl, wNPC_xCoord                                   ; $40e0: $21 $3c $cb
	add  hl, bc                                      ; $40e3: $09
	ld   a, (hl)                                     ; $40e4: $7e
	ld   hl, $c006                                   ; $40e5: $21 $06 $c0
	cp   (hl)                                        ; $40e8: $be
	jr   c, @gotoCheckNextNPC                              ; $40e9: $38 $cd

	ld   hl, wNPC_xCoord                                   ; $40eb: $21 $3c $cb
	add  hl, bc                                      ; $40ee: $09
	ld   a, (hl)                                     ; $40ef: $7e
	ld   hl, $c008                                   ; $40f0: $21 $08 $c0
	cp   (hl)                                        ; $40f3: $be
	jr   c, +                              ; $40f4: $38 $03

	jp   @gotoCheckNextNPC                               ; $40f6: $c3 $b8 $40

+
	call getBit5ofNPCBytes_cb60                               ; $40f9: $cd $7a $73
	jr   nz, @gotoCheckNextNPC                             ; $40fc: $20 $ba

	call getBit4ofNPCBytes_cb60                               ; $40fe: $cd $72 $73
	jr   nz, @gotoCheckNextNPC                             ; $4101: $20 $b5

	jp   @done                               ; $4103: $c3 $c7 $40


Call_001_4106:
	ld   a, c                                        ; $4106: $79
	push af                                          ; $4107: $f5
	sla  a                                           ; $4108: $cb $27
	sla  a                                           ; $410a: $cb $27
	sla  a                                           ; $410c: $cb $27
	sla  a                                           ; $410e: $cb $27
	ld   hl, $c006                                   ; $4110: $21 $06 $c0
	ld   (hl), a                                     ; $4113: $77
	ld   hl, $c008                                   ; $4114: $21 $08 $c0
	ld   (hl), a                                     ; $4117: $77
	ld   a, $00                                      ; $4118: $3e $00
	rl   a                                           ; $411a: $cb $17
	ld   hl, $c007                                   ; $411c: $21 $07 $c0
	ld   (hl), a                                     ; $411f: $77
	ld   hl, $c009                                   ; $4120: $21 $09 $c0
	ld   (hl), a                                     ; $4123: $77
	ld   hl, $c006                                   ; $4124: $21 $06 $c0
	ld   a, (hl)                                     ; $4127: $7e
	sub  $04                                         ; $4128: $d6 $04
	ld   hl, $c006                                   ; $412a: $21 $06 $c0
	ld   (hl), a                                     ; $412d: $77
	ld   hl, $c007                                   ; $412e: $21 $07 $c0
	ld   a, (hl)                                     ; $4131: $7e
	sbc  $00                                         ; $4132: $de $00
	ld   hl, $c007                                   ; $4134: $21 $07 $c0
	ld   (hl), a                                     ; $4137: $77
	ld   hl, $c008                                   ; $4138: $21 $08 $c0
	ld   a, (hl)                                     ; $413b: $7e
	add  $05                                         ; $413c: $c6 $05
	ld   hl, $c008                                   ; $413e: $21 $08 $c0
	ld   (hl), a                                     ; $4141: $77
	ld   hl, $c009                                   ; $4142: $21 $09 $c0
	ld   a, (hl)                                     ; $4145: $7e
	adc  $00                                         ; $4146: $ce $00
	ld   hl, $c009                                   ; $4148: $21 $09 $c0
	ld   (hl), a                                     ; $414b: $77

Jump_001_414c:
	ld   a, e                                        ; $414c: $7b
	sla  a                                           ; $414d: $cb $27
	sla  a                                           ; $414f: $cb $27
	sla  a                                           ; $4151: $cb $27
	sla  a                                           ; $4153: $cb $27
	ld   hl, $c00a                                   ; $4155: $21 $0a $c0
	ld   (hl), a                                     ; $4158: $77
	ld   hl, $c00b                                   ; $4159: $21 $0b $c0
	ld   (hl), a                                     ; $415c: $77
	ld   hl, $c00a                                   ; $415d: $21 $0a $c0
	ld   a, (hl)                                     ; $4160: $7e
	sub  $0f                                         ; $4161: $d6 $0f
	ld   hl, $c00a                                   ; $4163: $21 $0a $c0
	ld   (hl), a                                     ; $4166: $77
	ld   hl, $c00b                                   ; $4167: $21 $0b $c0
	ld   a, (hl)                                     ; $416a: $7e
	add  $11                                         ; $416b: $c6 $11
	ld   hl, $c00b                                   ; $416d: $21 $0b $c0
	ld   (hl), a                                     ; $4170: $77
	jp   Jump_001_4080                               ; $4171: $c3 $80 $40


Call_001_4174:
	ld   a, c                                        ; $4174: $79
	push af                                          ; $4175: $f5
	sla  a                                           ; $4176: $cb $27
	sla  a                                           ; $4178: $cb $27
	sla  a                                           ; $417a: $cb $27
	sla  a                                           ; $417c: $cb $27
	ld   hl, $c006                                   ; $417e: $21 $06 $c0
	ld   (hl), a                                     ; $4181: $77
	ld   hl, $c008                                   ; $4182: $21 $08 $c0
	ld   (hl), a                                     ; $4185: $77
	ld   a, $00                                      ; $4186: $3e $00
	rl   a                                           ; $4188: $cb $17
	ld   hl, $c007                                   ; $418a: $21 $07 $c0
	ld   (hl), a                                     ; $418d: $77
	ld   hl, $c009                                   ; $418e: $21 $09 $c0
	ld   (hl), a                                     ; $4191: $77
	ld   hl, $c006                                   ; $4192: $21 $06 $c0
	ld   a, (hl)                                     ; $4195: $7e
	sub  $04                                         ; $4196: $d6 $04

Call_001_4198:
	ld   hl, $c006                                   ; $4198: $21 $06 $c0
	ld   (hl), a                                     ; $419b: $77
	ld   hl, $c007                                   ; $419c: $21 $07 $c0
	ld   a, (hl)                                     ; $419f: $7e
	sbc  $00                                         ; $41a0: $de $00
	ld   hl, $c007                                   ; $41a2: $21 $07 $c0
	ld   (hl), a                                     ; $41a5: $77
	ld   hl, $c008                                   ; $41a6: $21 $08 $c0
	ld   a, (hl)                                     ; $41a9: $7e
	add  $05                                         ; $41aa: $c6 $05
	ld   hl, $c008                                   ; $41ac: $21 $08 $c0
	ld   (hl), a                                     ; $41af: $77
	ld   hl, $c009                                   ; $41b0: $21 $09 $c0
	ld   a, (hl)                                     ; $41b3: $7e
	adc  $00                                         ; $41b4: $ce $00
	ld   hl, $c009                                   ; $41b6: $21 $09 $c0
	ld   (hl), a                                     ; $41b9: $77
	jp   Jump_001_414c                               ; $41ba: $c3 $4c $41


loadNpcOamDataToWram:
	ld   bc, $0000

@checkNextNPC:
// $1e is last idx of npcs
	ld   a, $1e
	sub  c
	sub  c
	call getLastUsableOamIdx_fromA
	call clear2spritesInOam_1stIdxedE

	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)
	cp   $ff
	jp   z, @gotoCheckNextNPC

// NPC exists at offset BC
	call getBit4ofNPCBytes_cb60                               ; $41d4: $cd $72 $73
	jp   nz, @gotoCheckNextNPC                           ; $41d7: $c2 $68 $42

// bit 4 unset of control byte, and bit 1 set of cbe4, go to next
	ld   hl, wNPCBytes_cbe4                                   ; $41da: $21 $e4 $cb
	add  hl, bc                                      ; $41dd: $09
	bit  1, (hl)                                     ; $41de: $cb $4e
	jp   nz, @gotoCheckNextNPC                           ; $41e0: $c2 $68 $42

	push de
	call getNpcOamTileAndAttr
	pop  de

// attr
	ld   hl, wNpcOamTileAttr
	ld   a, (hl)
	and  $20
	jr   z, @facingRight

// facing left, convert, if bit 0 set, flip tiles
	ld   hl, wNpcOamTileIdx
	ld   a, (hl)
	call convertEntity2x2tileToTopLeftVramTile
	bit  0, a
	jr   nz, @facingRightTiles

@facingLeftTiles:
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a
	add  $02
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a
	jp   @loadAttrsXandY

// if bit 0 set, flip tiles
@facingRight:
	ld   hl, wNpcOamTileIdx
	ld   a, (hl)
	call convertEntity2x2tileToTopLeftVramTile
	bit  0, a
	jr   nz, @facingLeftTiles

@facingRightTiles:
// load tile chosen
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a
	add  $02
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a

@loadAttrsXandY:
// attr left half
	ld   hl, wNpcOamTileAttr
	ld   a, (hl)

// if bit 0 set of top-left vram tile, we're facing left
	ld   hl, wNpcTopLeftVramTile
	bit  0, (hl)
	jr   z, +

	xor  $20

+
	ld   hl, wOam+3
	add  hl, de
	ld   (hl), a

// attr right half
	ld   hl, wOam+7
	add  hl, de
	ld   (hl), a

// x for both halves affected by scx
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wSCXvalue
	sub  (hl)
	add  $08
	ld   hl, wOam+1
	add  hl, de
	ld   (hl), a

// dont scroll
	add  $08
	jr   nc, +

	ld   a, $ff

+
	ld   hl, wOam+5
	add  hl, de
	ld   (hl), a

// y for both halves affected by scy
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   a, (hl)
	add  $10
	ld   hl, wSCYvalue
	sub  (hl)
	ld   hl, wOam
	add  hl, de
	ld   (hl), a
	ld   hl, wOam+4
	add  hl, de
	ld   (hl), a

@gotoCheckNextNPC:
	inc  bc
	ld   a, c
	cp   NUM_NPCS
	jr   nc, @done

	jp   @checkNextNPC

@done:
	ret


updateNPCs:
// skip the 1st npc half the time
	ld   hl, wUpdateNpcsCallCount
	ld   a, (hl)
	and  $01
	ld   c, a
	ld   b, $00

	ld   hl, wUpdateNpcsCallCount
	inc  (hl)

@checkNextNPC:
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)
	cp   $ff
	jr   nz, @processNPC

@gotoCheckNextNPC:
	inc  bc
	inc  bc
	ld   a, c
	cp   NUM_NPCS
	jr   c, @checkNextNPC

	ret

@processNPC:
	ld   hl, wCurrNpcIdx
	ld   (hl), c

// transform npc if specified
	ld   hl, wNPCBytes_newID
	add  hl, bc
	ld   a, (hl)
	cp   $ff
	jr   z, +
	call setNPCsNewID
+

//
	call Call_001_4324                               ; $42a0: $cd $24 $43
	jr   nz, @afterAnimationFrameCheck                             ; $42a3: $20 $42

	call getBit6ofNPCBytes_cb60
	jr   nz, @npcHasNoVertTiles

// npc has vert directions
	ld   hl, wNPCBytes_pixelsToMove
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   z, @afterAnimationFrameCheck

// npc still has pixels to move
	ld   hl, wNPCBytes_animationFrameIdx
	add  hl, bc
	inc  (hl)
	ld   hl, wNPCBytes_animationFrameIdx
	add  hl, bc
	ld   a, (hl)
	cp   $03
	jr   nc, @resetAnimationFrameIdx

	jp   @afterAnimationFrameCheck

@npcHasNoVertTiles:
	ld   hl, wNPCBytes_animationFrameIdx
	add  hl, bc
	inc  (hl)
	call getNpcOamTileAndAttr

	ld   hl, $c009                                   ; $42cc: $21 $09 $c0
	ld   a, (hl)                                     ; $42cf: $7e
	cp   $02                                         ; $42d0: $fe $02
	jr   z, @resetAnimationFrameIdx                              ; $42d2: $28 $0c

	cp   $01                                         ; $42d4: $fe $01
	jr   nz, @afterAnimationFrameCheck                             ; $42d6: $20 $0f

	ld   hl, wNPCBytes_animationFrameIdx                                   ; $42d8: $21 $6c $cb
	add  hl, bc                                      ; $42db: $09
	dec  (hl)                                        ; $42dc: $35
	jp   @afterAnimationFrameCheck                               ; $42dd: $c3 $e7 $42

@resetAnimationFrameIdx:
	ld   a, $00
	ld   hl, wNPCBytes_animationFrameIdx
	add  hl, bc
	ld   (hl), a

@afterAnimationFrameCheck:
-
// if cb78 or cba8 are non-zero, before or after executing opcodes
// jump to their relevant function
	ld   hl, wNPCBytes_timeToWait
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   nz, @needToWait

	ld   hl, wNPCBytes_pixelsToMove
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   nz, @stillHasPixelsToMove

// execute next opcode if no need to wait/move anymore
	call executeNPCScriptCode
	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00

// if now need to wait/move, execute those funcs
	ld   hl, wNPCBytes_timeToWait
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCBytes_pixelsToMove
	add  hl, bc
	or   (hl)
	jr   nz, -

// cb78 and cba8 are 0
	call Call_001_4346                               ; $430e: $cd $46 $43
	jp   @gotoCheckNextNPC

@needToWait:
	call npcWaitFunc
	jp   @gotoCheckNextNPC

@stillHasPixelsToMove:
	call npcMovePixelFunc
	jp   @gotoCheckNextNPC


data_4320:
	.db $00 $02 06 $0e

Call_001_4324:
// bits chosen indexed by cb60 low 2 bits
	ld   hl, wNPCBytes_cb60                                   ; $4324: $21 $60 $cb
	add  hl, bc                                      ; $4327: $09
	ld   a, (hl)                                     ; $4328: $7e
	and  $03                                         ; $4329: $e6 $03
	ld   e, a                                        ; $432b: $5f
	ld   d, $00                                      ; $432c: $16 $00
	ld   hl, data_4320                                   ; $432e: $21 $20 $43
	add  hl, de                                      ; $4331: $19
	ld   a, (hl)                                     ; $4332: $7e

// turn off the above bits from c014
	ld   hl, wMainLoopCounter                                   ; $4333: $21 $14 $c0
	and  (hl)                                        ; $4336: $a6
	ld   hl, data_4320                                   ; $4337: $21 $20 $43
	add  hl, de                                      ; $433a: $19
	xor  (hl)                                        ; $433b: $ae
	ret                                              ; $433c: $c9


npcWaitFunc:
	call Call_001_4346                               ; $433d: $cd $46 $43
	ld   hl, wNPCBytes_timeToWait                                   ; $4340: $21 $78 $cb
	add  hl, bc                                      ; $4343: $09
	dec  (hl)                                        ; $4344: $35
	ret                                              ; $4345: $c9


// called 1st thing in wait func, and also after done with opcodes
Call_001_4346:
// de = (c0b2)
	ld   hl, $c0b2                                   ; $4346: $21 $b2 $c0
	ld   e, (hl)                                     ; $4349: $5e
	ld   d, $00                                      ; $434a: $16 $00

// c024 = (backwards data+de)
	ld   hl, npcBackwardsData                                   ; $434c: $21 $15 $65
	add  hl, de                                      ; $434f: $19
	ld   a, (hl)                                     ; $4350: $7e
	ld   hl, wCurrNpcMovingDir                                   ; $4351: $21 $24 $c0
	ld   (hl), a                                     ; $4354: $77

//
	ld   hl, wNPCBytes_damageAndMovementSpeed                                   ; $4355: $21 $54 $cb
	add  hl, bc                                      ; $4358: $09
	ld   a, (hl)                                     ; $4359: $7e
	call aDivEqu16                                       ; $435a: $cd $fa $07
	ld   hl, wBaseDamageTaken                                   ; $435d: $21 $23 $c0
	ld   (hl), a                                     ; $4360: $77
	ld   hl, wNPC_yCoord                                   ; $4361: $21 $48 $cb
	add  hl, bc                                      ; $4364: $09
	ld   e, (hl)                                     ; $4365: $5e
	ld   d, $00                                      ; $4366: $16 $00
	call c044_equBit2of_cb60                               ; $4368: $cd $80 $43
	ld   hl, wNPC_xCoord                                   ; $436b: $21 $3c $cb
	add  hl, bc                                      ; $436e: $09
	ld   a, (hl)                                     ; $436f: $7e
	ld   c, a                                        ; $4370: $4f
	ld   b, $00                                      ; $4371: $06 $00
	call checkPlayerCollisionWithEnemy                               ; $4373: $cd $a7 $4a
	call Call_001_438c                               ; $4376: $cd $8c $43
	ld   hl, wCurrNpcIdx                                   ; $4379: $21 $a6 $c0
	ld   c, (hl)                                     ; $437c: $4e
	ld   b, $00                                      ; $437d: $06 $00
	ret                                              ; $437f: $c9


c044_equBit2of_cb60:
	ld   hl, wNPCBytes_cb60                                   ; $4380: $21 $60 $cb
	add  hl, bc                                      ; $4383: $09
	ld   a, (hl)                                     ; $4384: $7e
	and  $04                                         ; $4385: $e6 $04
	ld   hl, $c044                                   ; $4387: $21 $44 $c0
	ld   (hl), a                                     ; $438a: $77
	ret                                              ; $438b: $c9


Call_001_438c:
	jr   nc, @doneIfNoCollision

// player took damage
// preserve vars
	push af
	ld   a, c
	push af
	ld   a, e
	push af

	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00

// last byte in entity struct used to transform npc
	call copy8npcMetadataBytesInto_c6d0
	ld   hl, wCommonByteCopyDestBytes+7
	ld   a, (hl)
	cp   $ff
	jr   z, +

	ld   hl, wNPCBytes_newID
	add  hl, bc
	ld   (hl), a

+
// restore orig e
	pop  af
	ld   e, a
	ld   d, $00
// restore orig c
	pop  af
	ld   c, a
	ld   b, $00
	pop  af
// restore orig a

@doneIfNoCollision:
// not within bounds
	jr   z, @done

// not took damage, but collided
	ld   hl, $c08b                                   ; $43b4: $21 $8b $c0
	ld   a, (hl)                                     ; $43b7: $7e
	cp   $00                                         ; $43b8: $fe $00
	jr   nz, @done                             ; $43ba: $20 $18

// player not dead??
	ld   a, c                                        ; $43bc: $79
	push af                                          ; $43bd: $f5

	ld   hl, wCurrNpcIdx                                   ; $43be: $21 $a6 $c0
	ld   c, (hl)                                     ; $43c1: $4e
	ld   b, $00                                      ; $43c2: $06 $00

// set bit 5 of npc 2nd byte low 6 bits
	ld   hl, wNPC2ndByteLower6Bits                                   ; $43c4: $21 $84 $cb
	add  hl, bc                                      ; $43c7: $09
	ld   a, (hl)                                     ; $43c8: $7e
	or   $20                                         ; $43c9: $f6 $20
	ld   hl, wNPC2ndByteLower6Bits                                   ; $43cb: $21 $84 $cb
	add  hl, bc                                      ; $43ce: $09
	ld   (hl), a                                     ; $43cf: $77

	pop  af                                          ; $43d0: $f1
	ld   c, a                                        ; $43d1: $4f
	ld   b, $00                                      ; $43d2: $06 $00

@done:
	ret


npcMovePixelFunc:
// reset bit 4
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   a, (hl)
	and  $ef
	ld   (hl), a

// direction in c024
	and  $0f
	ld   hl, wCurrNpcMovingDir
	ld   (hl), a

// cb54 upper nybble into players damage taken
	ld   hl, wNPCBytes_damageAndMovementSpeed
	add  hl, bc
	ld   a, (hl)
	call aDivEqu16
	ld   hl, wBaseDamageTaken
	ld   (hl), a

// movement speed into c06e
	ld   hl, wNPCBytes_damageAndMovementSpeed                                   ; $43ef: $21 $54 $cb
	add  hl, bc                                      ; $43f2: $09
	ld   a, (hl)                                     ; $43f3: $7e
	and  $0f                                         ; $43f4: $e6 $0f
	ld   hl, $c06e                                   ; $43f6: $21 $6e $c0
	ld   (hl), a                                     ; $43f9: $77

	inc  (hl)                                        ; $43fa: $34

// if bit 3 not set, move to player?
	ld   hl, wNPCBytes_cbe4                                   ; $43fb: $21 $e4 $cb
	add  hl, bc                                      ; $43fe: $09
	ld   a, (hl)                                     ; $43ff: $7e
	and  $08                                         ; $4400: $e6 $08
	jr   nz, @func_4424                                     ; $4402: $20 $20

// c050 is right->2, up->4, down->8, left->1
	ld   hl, wNPC2ndByteLower6Bits                                   ; $4404: $21 $84 $cb
	add  hl, bc                                      ; $4407: $09
	ld   a, (hl)                                     ; $4408: $7e
	and  $0f                                         ; $4409: $e6 $0f
	ld   e, a                                        ; $440b: $5f
	ld   d, $00                                      ; $440c: $16 $00
	ld   hl, @data_441a                                   ; $440e: $21 $1a $44
	add  hl, de                                      ; $4411: $19
	ld   a, (hl)                                     ; $4412: $7e
	ld   hl, $c050                                   ; $4413: $21 $50 $c0
	ld   (hl), a                                     ; $4416: $77

	jp   @bigNext_450e                               ; $4417: $c3 $0e $45

@data_441a:
	.db $02 $02 $02
	.db $04 $04 $04
	.db $08 $08 $08
	.db $01

@func_4424:
	ld   de, $0001
	ld   hl, wNPC_xCoord                                   ; $4427: $21 $3c $cb
	add  hl, bc                                      ; $442a: $09
	ld   a, (hl)                                     ; $442b: $7e

// a = npc x - player x
	ld   hl, wPlayerX                                   ; $442c: $21 $52 $c0
	sub  (hl)                                        ; $442f: $96
	jr   nc, @rightOfPlayer                             ; $4430: $30 $07

// left of player
	ld   de, $0002                                   ; $4432: $11 $02 $00
// neg a (a = player x - npc x, ie diff)
	xor  $ff                                         ; $4435: $ee $ff
	add  $01                                         ; $4437: $c6 $01

@rightOfPlayer:
	ld   hl, wNpcPlayerXDiff                                   ; $4439: $21 $07 $c0
	ld   (hl), a                                     ; $443c: $77

// de is 1 if right of player, 2 if left, 0 if within 3 px of player
	cp   $03                                         ; $443d: $fe $03
	jr   nc, +                             ; $443f: $30 $03

	ld   de, $0000                                   ; $4441: $11 $00 $00

+
	ld   hl, $c050                                   ; $4444: $21 $50 $c0
	ld   (hl), e                                     ; $4447: $73

// vertical, a is diff between npc y and player y
	ld   de, $0004                                   ; $4448: $11 $04 $00
	ld   hl, wNPC_yCoord                                   ; $444b: $21 $48 $cb
	add  hl, bc                                      ; $444e: $09
	ld   a, (hl)                                     ; $444f: $7e
	ld   hl, wPlayerY                                   ; $4450: $21 $54 $c0
	sub  (hl)                                        ; $4453: $96
	jr   nc, @belowPlayer                             ; $4454: $30 $07

// above player
	ld   de, $0008                                   ; $4456: $11 $08 $00
// neg a
	xor  $ff                                         ; $4459: $ee $ff
	add  $01                                         ; $445b: $c6 $01

@belowPlayer:
	ld   hl, wNpcPlayerYDiff                                   ; $445d: $21 $08 $c0
	ld   (hl), a                                     ; $4460: $77

// de is 8 if above, 4 if below, 0 if within 3 px of player
	cp   $03                                         ; $4461: $fe $03
	jr   nc, +                             ; $4463: $30 $03

	ld   de, $0000                                   ; $4465: $11 $00 $00

+
	ld   a, e                                        ; $4468: $7b

// c050 upper 2 bits is based on vertical, low 2 based on horiz
	ld   hl, $c050                                   ; $4469: $21 $50 $c0
	or   (hl)                                        ; $446c: $b6
	ld   hl, $c050                                   ; $446d: $21 $50 $c0
	ld   (hl), a                                     ; $4470: $77

// de is based on horiz
	and  $03                                         ; $4471: $e6 $03
	ld   e, a                                        ; $4473: $5f
	ld   d, $00                                      ; $4474: $16 $00

// if closer to player's x than y..
	ld   hl, wNpcPlayerXDiff                                   ; $4476: $21 $07 $c0
	ld   a, (hl)                                     ; $4479: $7e
	ld   hl, wNpcPlayerYDiff                                   ; $447a: $21 $08 $c0
	cp   (hl)                                        ; $447d: $be
	jr   nc, @closerToPlayersY                             ; $447e: $30 $1a

// set y diff to x diff
	ld   hl, wNpcPlayerYDiff                                   ; $4480: $21 $08 $c0
	ld   c, (hl)                                     ; $4483: $4e
	ld   b, $00                                      ; $4484: $06 $00
	ld   hl, wNpcPlayerYDiff                                   ; $4486: $21 $08 $c0
	ld   (hl), a                                     ; $4489: $77

// de is vertical bits only
	ld   hl, $c050                                   ; $448a: $21 $50 $c0
	ld   a, (hl)                                     ; $448d: $7e
	and  $0c                                         ; $448e: $e6 $0c
	ld   e, a                                        ; $4490: $5f
	ld   d, $00                                      ; $4491: $16 $00

// c is player y diff
	ld   a, c                                        ; $4493: $79
	ld   hl, wCurrNpcIdx                                   ; $4494: $21 $a6 $c0
	ld   c, (hl)                                     ; $4497: $4e
	ld   b, $00                                      ; $4498: $06 $00

@closerToPlayersY:
	srl  a                                           ; $449a: $cb $3f
	ld   hl, wNpcPlayerYDiff                                   ; $449c: $21 $08 $c0
	cp   (hl)                                        ; $449f: $be
	jr   nc, +                             ; $44a0: $30 $03

	ld   de, $0000                                   ; $44a2: $11 $00 $00

+
	ld   a, e                                        ; $44a5: $7b
	sla  a                                           ; $44a6: $cb $27
	sla  a                                           ; $44a8: $cb $27
	sla  a                                           ; $44aa: $cb $27
	sla  a                                           ; $44ac: $cb $27

	ld   hl, $c050                                   ; $44ae: $21 $50 $c0
	or   (hl)                                        ; $44b1: $b6
	ld   hl, $c050                                   ; $44b2: $21 $50 $c0
	ld   (hl), a                                     ; $44b5: $77

	call aDivEqu16                                       ; $44b6: $cd $fa $07
	ld   hl, $c050                                   ; $44b9: $21 $50 $c0
	and  (hl)                                        ; $44bc: $a6
	jr   nz, +                             ; $44bd: $20 $04

	ld   hl, $c050                                   ; $44bf: $21 $50 $c0
	ld   a, (hl)                                     ; $44c2: $7e

+
	ld   e, a                                        ; $44c3: $5f
	ld   d, $00                                      ; $44c4: $16 $00
	ld   hl, wUpdateNpcsCallCount                                   ; $44c6: $21 $5e $c6
	ld   a, (hl)                                     ; $44c9: $7e
	and  $0e                                         ; $44ca: $e6 $0e
	cp   $08                                         ; $44cc: $fe $08
	jr   nz, @func_44dd                             ; $44ce: $20 $0d

// set npc new direction, idxed de
	call keepUpperNybbleOfNPC2ndByteLower6Bits
	ld   hl, @moveFuncNewDirs
	add  hl, de
	or   (hl)
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   (hl), a

@func_44dd:
	ld   hl, $c06e                                   ; $44dd: $21 $6e $c0
	ld   a, (hl)                                     ; $44e0: $7e
	cp   $01                                         ; $44e1: $fe $01
	jr   nz, @bigNext_450e                             ; $44e3: $20 $29

	ld   hl, wUpdateNpcsCallCount                                   ; $44e5: $21 $5e $c6
	ld   a, (hl)                                     ; $44e8: $7e
	and  $02                                         ; $44e9: $e6 $02
	jr   nz, @bigNext_450e                             ; $44eb: $20 $21

	ld   hl, $c050                                   ; $44ed: $21 $50 $c0
	ld   a, (hl)                                     ; $44f0: $7e
	call aDivEqu16                                       ; $44f1: $cd $fa $07
	jr   z, @bigNext_450e                              ; $44f4: $28 $18

	ld   hl, $c050                                   ; $44f6: $21 $50 $c0
	and  (hl)                                        ; $44f9: $a6
	ld   (hl), a                                     ; $44fa: $77
	jp   @bigNext_450e                               ; $44fb: $c3 $0e $45

@moveFuncNewDirs:
	.db DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT
	.db DIR_UP,    DIR_LEFT, DIR_RIGHT, DIR_LEFT
	.db DIR_DOWN,  DIR_LEFT, DIR_RIGHT, DIR_LEFT
	.db DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT

@bigNext_450e:
	call Call_001_4562                               ; $450e: $cd $62 $45
	jr   c, @noPixelsToMove                              ; $4511: $38 $3b

	ld   hl, wNPCBytes_pixelsToMove                                   ; $4513: $21 $a8 $cb
	add  hl, bc                                      ; $4516: $09
	dec  (hl)                                        ; $4517: $35
	jr   z, @done                              ; $4518: $28 $47

	ld   hl, $c06e                                   ; $451a: $21 $6e $c0
	dec  (hl)                                        ; $451d: $35
	jr   nz, +                             ; $451e: $20 $01

	ret                                              ; $4520: $c9

+
	ld   hl, $c050                                   ; $4521: $21 $50 $c0
	ld   a, (hl)                                     ; $4524: $7e
	call aDivEqu16                                       ; $4525: $cd $fa $07
	jr   z, @bigNext_450e                              ; $4528: $28 $e4

//
	ld   hl, $c050                                   ; $452a: $21 $50 $c0
	ld   e, (hl)                                     ; $452d: $5e
	ld   d, $00                                      ; $452e: $16 $00
	ld   hl, $c050                                   ; $4530: $21 $50 $c0
	ld   (hl), a                                     ; $4533: $77
	ld   a, e                                        ; $4534: $7b
	push af                                          ; $4535: $f5
	call Call_001_4562                               ; $4536: $cd $62 $45
	pop  af                                          ; $4539: $f1
	ld   hl, $c050                                   ; $453a: $21 $50 $c0
	ld   (hl), a                                     ; $453d: $77
	jr   c, @noPixelsToMove                              ; $453e: $38 $0e

	ld   hl, wNPCBytes_pixelsToMove                                   ; $4540: $21 $a8 $cb
	add  hl, bc                                      ; $4543: $09
	dec  (hl)                                        ; $4544: $35
	jr   z, @done                              ; $4545: $28 $1a

	ld   hl, $c06e                                   ; $4547: $21 $6e $c0
	dec  (hl)                                        ; $454a: $35
	jr   nz, @bigNext_450e                             ; $454b: $20 $c1

	ret

@noPixelsToMove:
	ld   a, $00
	ld   hl, wNPCBytes_pixelsToMove
	add  hl, bc
	ld   (hl), a

// set bit 4
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   a, (hl)
	or   $10
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   (hl), a

@done:
	ret


Call_001_4562:
	ld   a, $00                                      ; $4562: $3e $00
	ld   hl, $c032                                   ; $4564: $21 $32 $c0
	ld   (hl), a                                     ; $4567: $77
	ld   hl, $c050                                   ; $4568: $21 $50 $c0
	ld   a, (hl)                                     ; $456b: $7e
	and  $01                                         ; $456c: $e6 $01
	jr   z, jr_001_457f                              ; $456e: $28 $0f

	call Call_001_4655                               ; $4570: $cd $55 $46
	ld   hl, wCurrNpcIdx                                   ; $4573: $21 $a6 $c0
	ld   c, (hl)                                     ; $4576: $4e
	ld   b, $00                                      ; $4577: $06 $00
	jr   c, jr_001_457f                              ; $4579: $38 $04

	ld   hl, $c032                                   ; $457b: $21 $32 $c0
	inc  (hl)                                        ; $457e: $34

jr_001_457f:
	ld   hl, $c050                                   ; $457f: $21 $50 $c0
	ld   a, (hl)                                     ; $4582: $7e
	and  $02                                         ; $4583: $e6 $02
	jr   z, jr_001_4596                              ; $4585: $28 $0f

	call Call_001_46c4                               ; $4587: $cd $c4 $46
	ld   hl, wCurrNpcIdx                                   ; $458a: $21 $a6 $c0
	ld   c, (hl)                                     ; $458d: $4e
	ld   b, $00                                      ; $458e: $06 $00
	jr   c, jr_001_4596                              ; $4590: $38 $04

	ld   hl, $c032                                   ; $4592: $21 $32 $c0
	inc  (hl)                                        ; $4595: $34

jr_001_4596:
	ld   hl, $c050                                   ; $4596: $21 $50 $c0
	ld   a, (hl)                                     ; $4599: $7e
	and  $04                                         ; $459a: $e6 $04
	jr   z, jr_001_45ad                              ; $459c: $28 $0f

	call Call_001_472a                               ; $459e: $cd $2a $47
	ld   hl, wCurrNpcIdx                                   ; $45a1: $21 $a6 $c0
	ld   c, (hl)                                     ; $45a4: $4e
	ld   b, $00                                      ; $45a5: $06 $00
	jr   c, jr_001_45ad                              ; $45a7: $38 $04

	ld   hl, $c032                                   ; $45a9: $21 $32 $c0
	inc  (hl)                                        ; $45ac: $34

jr_001_45ad:
	ld   hl, $c050                                   ; $45ad: $21 $50 $c0
	ld   a, (hl)                                     ; $45b0: $7e
	and  $08                                         ; $45b1: $e6 $08
	jr   z, jr_001_45c4                              ; $45b3: $28 $0f

	call Call_001_478a                               ; $45b5: $cd $8a $47
	ld   hl, wCurrNpcIdx                                   ; $45b8: $21 $a6 $c0
	ld   c, (hl)                                     ; $45bb: $4e
	ld   b, $00                                      ; $45bc: $06 $00
	jr   c, jr_001_45c4                              ; $45be: $38 $04

	ld   hl, $c032                                   ; $45c0: $21 $32 $c0
	inc  (hl)                                        ; $45c3: $34

jr_001_45c4:
	ld   hl, $c032                                   ; $45c4: $21 $32 $c0
	ld   a, (hl)                                     ; $45c7: $7e
	cp   $00                                         ; $45c8: $fe $00
	scf                                              ; $45ca: $37
	jr   z, jr_001_45ce                              ; $45cb: $28 $01

	ccf                                              ; $45cd: $3f

jr_001_45ce:
	ret                                              ; $45ce: $c9


retCifNot0:
	cp   $01                                         ; $45cf: $fe $01
	ccf                                              ; $45d1: $3f
	ret                                              ; $45d2: $c9


Call_001_45d3:
	ld   hl, $c008                                   ; $45d3: $21 $08 $c0
	ld   c, (hl)                                     ; $45d6: $4e
	ld   b, $00                                      ; $45d7: $06 $00

	ld   hl, $c009                                   ; $45d9: $21 $09 $c0
	ld   e, (hl)                                     ; $45dc: $5e
	ld   d, $00                                      ; $45dd: $16 $00

	ld   hl, $c007                                   ; $45df: $21 $07 $c0
	ld   a, (hl)                                     ; $45e2: $7e
	ld   hl, wPlayerOrEntityYCollisionAdjust                                   ; $45e3: $21 $4a $c0
	cp   (hl)                                        ; $45e6: $be
	jr   z, +                              ; $45e7: $28 $02

	jr   nc, ++                             ; $45e9: $30 $0b

+
	call getTileEntityOrPlayerIsOn                                       ; $45eb: $cd $ed $3f
	call retCifNot0                               ; $45ee: $cd $cf $45
	jr   c, @retCFset                              ; $45f1: $38 $21

	jp   @retCFunset                               ; $45f3: $c3 $11 $46

++
	call getTileEntityOrPlayerIsOn                                       ; $45f6: $cd $ed $3f
	call retCifNot0                               ; $45f9: $cd $cf $45
	jr   nc, +                             ; $45fc: $30 $0a

	inc  de                                          ; $45fe: $13
	call getTileEntityOrPlayerIsOn                                       ; $45ff: $cd $ed $3f
	call retCifNot0                               ; $4602: $cd $cf $45
	jp   @retCFset                               ; $4605: $c3 $14 $46

+
	inc  de                                          ; $4608: $13
	call getTileEntityOrPlayerIsOn                                       ; $4609: $cd $ed $3f
	call retCifNot0                               ; $460c: $cd $cf $45
	jr   c, @retCFset                              ; $460f: $38 $03

@retCFunset:
	scf                                              ; $4611: $37
	ccf                                              ; $4612: $3f
	ret                                              ; $4613: $c9

@retCFset:
	scf                                              ; $4614: $37
	ret                                              ; $4615: $c9


Call_001_4616:
	ld   hl, $c008                                   ; $4616: $21 $08 $c0
	ld   c, (hl)                                     ; $4619: $4e
	ld   b, $00                                      ; $461a: $06 $00
	ld   hl, $c009                                   ; $461c: $21 $09 $c0
	ld   e, (hl)                                     ; $461f: $5e
	ld   d, $00                                      ; $4620: $16 $00
	ld   hl, $c006                                   ; $4622: $21 $06 $c0
	ld   a, (hl)                                     ; $4625: $7e
	cp   $01                                         ; $4626: $fe $01
	jr   nc, +                             ; $4628: $30 $0b

	call getTileEntityOrPlayerIsOn                                       ; $462a: $cd $ed $3f
	call retCifNot0                               ; $462d: $cd $cf $45
	jr   c, @retCFset                              ; $4630: $38 $21

	jp   @retCFunset                               ; $4632: $c3 $50 $46

+
	call getTileEntityOrPlayerIsOn                                       ; $4635: $cd $ed $3f
	call retCifNot0                               ; $4638: $cd $cf $45
	jr   nc, +                             ; $463b: $30 $0a

	inc  bc                                          ; $463d: $03
	call getTileEntityOrPlayerIsOn                                       ; $463e: $cd $ed $3f
	call retCifNot0                               ; $4641: $cd $cf $45
	jp   @retCFset                               ; $4644: $c3 $53 $46

+
	inc  bc                                          ; $4647: $03
	call getTileEntityOrPlayerIsOn                                       ; $4648: $cd $ed $3f
	call retCifNot0                               ; $464b: $cd $cf $45
	jr   c, @retCFset                              ; $464e: $38 $03

@retCFunset:
	scf                                              ; $4650: $37
	ccf                                              ; $4651: $3f
	ret                                              ; $4652: $c9

@retCFset:
	scf                                              ; $4653: $37
	ret                                              ; $4654: $c9


Call_001_4655:
	call getBit5ofNPCBytes_cb60                               ; $4655: $cd $7a $73
	push af                                          ; $4658: $f5
	ld   hl, wNPC_yCoord                                   ; $4659: $21 $48 $cb
	add  hl, bc                                      ; $465c: $09
	ld   e, (hl)                                     ; $465d: $5e
	ld   d, $00                                      ; $465e: $16 $00
	call c044_equBit2of_cb60                               ; $4660: $cd $80 $43
	ld   hl, wNPC_xCoord                                   ; $4663: $21 $3c $cb
	add  hl, bc                                      ; $4666: $09
	ld   a, (hl)                                     ; $4667: $7e
	cp   $00                                         ; $4668: $fe $00
	jr   z, jr_001_46b1                              ; $466a: $28 $45

	ld   c, a                                        ; $466c: $4f
	ld   b, $00                                      ; $466d: $06 $00
	dec  bc                                          ; $466f: $0b
	call checkPlayerCollisionWithEnemy                               ; $4670: $cd $a7 $4a
	call Call_001_438c                               ; $4673: $cd $8c $43
	pop  af                                          ; $4676: $f1
	jr   nz, jr_001_46a3                             ; $4677: $20 $2a

	call deEquEplusYCollisionAdjust                               ; $4679: $cd $bb $46
	call splitCEintoItsNybbles                               ; $467c: $cd $1c $55
	call Call_001_45d3                               ; $467f: $cd $d3 $45
	jr   c, jr_001_46b2                              ; $4682: $38 $2e

	ld   hl, wCurrNpcIdx                                   ; $4684: $21 $a6 $c0
	ld   c, (hl)                                     ; $4687: $4e
	ld   b, $00                                      ; $4688: $06 $00
	call deEquNpcYAddCollisionAdjust                               ; $468a: $cd $b4 $46
	ld   hl, wNPC_xCoord                                   ; $468d: $21 $3c $cb
	add  hl, bc                                      ; $4690: $09
	ld   a, (hl)                                     ; $4691: $7e
	ld   c, a                                        ; $4692: $4f
	ld   b, $00                                      ; $4693: $06 $00
	dec  bc                                          ; $4695: $0b
	call Call_001_4bea                               ; $4696: $cd $ea $4b
	ld   hl, wCurrNpcIdx                                   ; $4699: $21 $a6 $c0
	ld   c, (hl)                                     ; $469c: $4e
	ld   b, $00                                      ; $469d: $06 $00
	cp   $00                                         ; $469f: $fe $00
	jr   nz, jr_001_46b2                             ; $46a1: $20 $0f

jr_001_46a3:
	ld   hl, wCurrNpcIdx                                   ; $46a3: $21 $a6 $c0
	ld   c, (hl)                                     ; $46a6: $4e
	ld   b, $00                                      ; $46a7: $06 $00
	ld   hl, wNPC_xCoord                                   ; $46a9: $21 $3c $cb
	add  hl, bc                                      ; $46ac: $09
	dec  (hl)                                        ; $46ad: $35
	scf                                              ; $46ae: $37
	ccf                                              ; $46af: $3f
	ret                                              ; $46b0: $c9


jr_001_46b1:
	pop  af                                          ; $46b1: $f1

jr_001_46b2:
	scf                                              ; $46b2: $37
	ret                                              ; $46b3: $c9


deEquNpcYAddCollisionAdjust:
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   e, (hl)
	ld   d, $00

deEquEplusYCollisionAdjust:
	ld   a, e
	ld   hl, wPlayerOrEntityYCollisionAdjust
	add  (hl)
	ld   e, a
	ld   d, $00
	ret


Call_001_46c4:
	call getBit5ofNPCBytes_cb60                               ; $46c4: $cd $7a $73
	push af                                          ; $46c7: $f5
	ld   hl, wNPC_yCoord                                   ; $46c8: $21 $48 $cb
	add  hl, bc                                      ; $46cb: $09
	ld   e, (hl)                                     ; $46cc: $5e
	ld   d, $00                                      ; $46cd: $16 $00
	call c044_equBit2of_cb60                               ; $46cf: $cd $80 $43
	ld   hl, wNPC_xCoord                                   ; $46d2: $21 $3c $cb
	add  hl, bc                                      ; $46d5: $09
	ld   a, (hl)                                     ; $46d6: $7e
	ld   c, a                                        ; $46d7: $4f
	ld   b, $00                                      ; $46d8: $06 $00
	cp   $f0                                         ; $46da: $fe $f0
	jr   nc, jr_001_4727                             ; $46dc: $30 $49

	inc  bc                                          ; $46de: $03
	call checkPlayerCollisionWithEnemy                               ; $46df: $cd $a7 $4a
	call Call_001_438c                               ; $46e2: $cd $8c $43
	pop  af                                          ; $46e5: $f1
	jr   nz, jr_001_4719                             ; $46e6: $20 $31

	ld   a, c                                        ; $46e8: $79
	add  $0f                                         ; $46e9: $c6 $0f
	ld   c, a                                        ; $46eb: $4f
	ld   b, $00                                      ; $46ec: $06 $00
	call deEquEplusYCollisionAdjust                               ; $46ee: $cd $bb $46
	call splitCEintoItsNybbles                               ; $46f1: $cd $1c $55
	call Call_001_45d3                               ; $46f4: $cd $d3 $45
	jr   c, jr_001_4728                              ; $46f7: $38 $2f

	ld   hl, wCurrNpcIdx                                   ; $46f9: $21 $a6 $c0
	ld   c, (hl)                                     ; $46fc: $4e
	ld   b, $00                                      ; $46fd: $06 $00
	call deEquNpcYAddCollisionAdjust                               ; $46ff: $cd $b4 $46
	ld   hl, wNPC_xCoord                                   ; $4702: $21 $3c $cb
	add  hl, bc                                      ; $4705: $09
	ld   a, (hl)                                     ; $4706: $7e
	add  $01                                         ; $4707: $c6 $01
	ld   c, a                                        ; $4709: $4f
	ld   b, $00                                      ; $470a: $06 $00
	call Call_001_4bea                               ; $470c: $cd $ea $4b
	ld   hl, wCurrNpcIdx                                   ; $470f: $21 $a6 $c0
	ld   c, (hl)                                     ; $4712: $4e
	ld   b, $00                                      ; $4713: $06 $00
	cp   $00                                         ; $4715: $fe $00
	jr   nz, jr_001_4728                             ; $4717: $20 $0f

jr_001_4719:
	ld   hl, wCurrNpcIdx                                   ; $4719: $21 $a6 $c0
	ld   c, (hl)                                     ; $471c: $4e
	ld   b, $00                                      ; $471d: $06 $00
	ld   hl, wNPC_xCoord                                   ; $471f: $21 $3c $cb
	add  hl, bc                                      ; $4722: $09
	inc  (hl)                                        ; $4723: $34
	scf                                              ; $4724: $37
	ccf                                              ; $4725: $3f
	ret                                              ; $4726: $c9


jr_001_4727:
	pop  af                                          ; $4727: $f1

jr_001_4728:
	scf                                              ; $4728: $37
	ret                                              ; $4729: $c9


Call_001_472a:
	call getBit5ofNPCBytes_cb60                               ; $472a: $cd $7a $73
	push af                                          ; $472d: $f5
	ld   hl, wNPC_yCoord                                   ; $472e: $21 $48 $cb
	add  hl, bc                                      ; $4731: $09
	ld   e, (hl)                                     ; $4732: $5e
	ld   d, $00                                      ; $4733: $16 $00
	ld   a, e                                        ; $4735: $7b
	cp   $00                                         ; $4736: $fe $00
	jr   z, jr_001_4787                              ; $4738: $28 $4d

	dec  de                                          ; $473a: $1b
	call c044_equBit2of_cb60                               ; $473b: $cd $80 $43
	ld   hl, wNPC_xCoord                                   ; $473e: $21 $3c $cb
	add  hl, bc                                      ; $4741: $09
	ld   a, (hl)                                     ; $4742: $7e
	ld   c, a                                        ; $4743: $4f
	ld   b, $00                                      ; $4744: $06 $00
	call checkPlayerCollisionWithEnemy                               ; $4746: $cd $a7 $4a
	call Call_001_438c                               ; $4749: $cd $8c $43
	pop  af                                          ; $474c: $f1
	jr   nz, jr_001_4779                             ; $474d: $20 $2a

	call deEquEplusYCollisionAdjust                               ; $474f: $cd $bb $46
	call splitCEintoItsNybbles                               ; $4752: $cd $1c $55
	call Call_001_4616                               ; $4755: $cd $16 $46
	jr   c, jr_001_4788                              ; $4758: $38 $2e

	ld   hl, wCurrNpcIdx                                   ; $475a: $21 $a6 $c0
	ld   c, (hl)                                     ; $475d: $4e
	ld   b, $00                                      ; $475e: $06 $00
	call deEquNpcYAddCollisionAdjust                               ; $4760: $cd $b4 $46
	dec  de                                          ; $4763: $1b
	ld   hl, wNPC_xCoord                                   ; $4764: $21 $3c $cb
	add  hl, bc                                      ; $4767: $09
	ld   a, (hl)                                     ; $4768: $7e
	ld   c, a                                        ; $4769: $4f
	ld   b, $00                                      ; $476a: $06 $00
	call Call_001_4bea                               ; $476c: $cd $ea $4b
	ld   hl, wCurrNpcIdx                                   ; $476f: $21 $a6 $c0
	ld   c, (hl)                                     ; $4772: $4e
	ld   b, $00                                      ; $4773: $06 $00
	cp   $00                                         ; $4775: $fe $00
	jr   nz, jr_001_4788                             ; $4777: $20 $0f

jr_001_4779:
	ld   hl, wCurrNpcIdx                                   ; $4779: $21 $a6 $c0
	ld   c, (hl)                                     ; $477c: $4e
	ld   b, $00                                      ; $477d: $06 $00
	ld   hl, wNPC_yCoord                                   ; $477f: $21 $48 $cb
	add  hl, bc                                      ; $4782: $09
	dec  (hl)                                        ; $4783: $35
	scf                                              ; $4784: $37
	ccf                                              ; $4785: $3f
	ret                                              ; $4786: $c9


jr_001_4787:
	pop  af                                          ; $4787: $f1

jr_001_4788:
	scf                                              ; $4788: $37
	ret                                              ; $4789: $c9


Call_001_478a:
	call getBit5ofNPCBytes_cb60                               ; $478a: $cd $7a $73
	push af                                          ; $478d: $f5
	ld   hl, wNPC_yCoord                                   ; $478e: $21 $48 $cb
	add  hl, bc                                      ; $4791: $09
	ld   e, (hl)                                     ; $4792: $5e
	ld   d, $00                                      ; $4793: $16 $00
	ld   a, e                                        ; $4795: $7b
	cp   $a0                                         ; $4796: $fe $a0
	jr   nc, jr_001_47ea                             ; $4798: $30 $50

	inc  de                                          ; $479a: $13
	call c044_equBit2of_cb60                               ; $479b: $cd $80 $43
	ld   hl, wNPC_xCoord                                   ; $479e: $21 $3c $cb
	add  hl, bc                                      ; $47a1: $09
	ld   a, (hl)                                     ; $47a2: $7e
	ld   c, a                                        ; $47a3: $4f
	ld   b, $00                                      ; $47a4: $06 $00
	call checkPlayerCollisionWithEnemy                               ; $47a6: $cd $a7 $4a
	call Call_001_438c                               ; $47a9: $cd $8c $43
	pop  af                                          ; $47ac: $f1
	jr   nz, jr_001_47dc                             ; $47ad: $20 $2d

	ld   a, e                                        ; $47af: $7b
	add  $0f                                         ; $47b0: $c6 $0f
	ld   e, a                                        ; $47b2: $5f
	ld   d, $00                                      ; $47b3: $16 $00
	call splitCEintoItsNybbles                               ; $47b5: $cd $1c $55
	call Call_001_4616                               ; $47b8: $cd $16 $46
	jr   c, jr_001_47eb                              ; $47bb: $38 $2e

	ld   hl, wCurrNpcIdx                                   ; $47bd: $21 $a6 $c0
	ld   c, (hl)                                     ; $47c0: $4e
	ld   b, $00                                      ; $47c1: $06 $00
	call deEquNpcYAddCollisionAdjust                               ; $47c3: $cd $b4 $46
	inc  de                                          ; $47c6: $13
	ld   hl, wNPC_xCoord                                   ; $47c7: $21 $3c $cb
	add  hl, bc                                      ; $47ca: $09
	ld   a, (hl)                                     ; $47cb: $7e
	ld   c, a                                        ; $47cc: $4f
	ld   b, $00                                      ; $47cd: $06 $00
	call Call_001_4bea                               ; $47cf: $cd $ea $4b
	ld   hl, wCurrNpcIdx                                   ; $47d2: $21 $a6 $c0
	ld   c, (hl)                                     ; $47d5: $4e
	ld   b, $00                                      ; $47d6: $06 $00
	cp   $00                                         ; $47d8: $fe $00
	jr   nz, jr_001_47eb                             ; $47da: $20 $0f

jr_001_47dc:
	ld   hl, wCurrNpcIdx                                   ; $47dc: $21 $a6 $c0
	ld   c, (hl)                                     ; $47df: $4e
	ld   b, $00                                      ; $47e0: $06 $00
	ld   hl, wNPC_yCoord                                   ; $47e2: $21 $48 $cb
	add  hl, bc                                      ; $47e5: $09
	inc  (hl)                                        ; $47e6: $34
	scf                                              ; $47e7: $37
	ccf                                              ; $47e8: $3f
	ret                                              ; $47e9: $c9


jr_001_47ea:
	pop  af                                          ; $47ea: $f1

jr_001_47eb:
	scf                                              ; $47eb: $37
	ret                                              ; $47ec: $c9


func_47ed:
	ld   hl, wNPC_xCoord                                   ; func_47ed: $21 $3c $cb
	add  hl, bc                                      ; $47f0: $09
	ld   e, (hl)                                     ; $47f1: $5e
	ld   d, $00                                      ; $47f2: $16 $00
	ld   a, e                                        ; $47f4: $7b
	cp   $00                                         ; $47f5: $fe $00
	jr   z, jr_001_4847                              ; $47f7: $28 $4e

	dec  de                                          ; $47f9: $1b
	ld   a, e                                        ; $47fa: $7b
	push af                                          ; $47fb: $f5
	ld   hl, wNPC_yCoord                                   ; $47fc: $21 $48 $cb
	add  hl, bc                                      ; $47ff: $09
	ld   e, (hl)                                     ; $4800: $5e
	ld   d, $00                                      ; $4801: $16 $00
	call c044_equBit2of_cb60                               ; $4803: $cd $80 $43
	pop  af                                          ; $4806: $f1
	ld   c, a                                        ; $4807: $4f
	ld   b, $00                                      ; $4808: $06 $00
	call checkPlayerCollisionWithEnemy                               ; $480a: $cd $a7 $4a
	call Call_001_438c                               ; $480d: $cd $8c $43
	call deEquEplusYCollisionAdjust                               ; $4810: $cd $bb $46
	call splitCEintoItsNybbles                               ; $4813: $cd $1c $55
	call Call_001_45d3                               ; $4816: $cd $d3 $45
	jr   c, jr_001_4847                              ; $4819: $38 $2c

	ld   hl, wCurrNpcIdx                                   ; $481b: $21 $a6 $c0
	ld   c, (hl)                                     ; $481e: $4e
	ld   b, $00                                      ; $481f: $06 $00
	ld   hl, wNPC_xCoord                                   ; $4821: $21 $3c $cb
	add  hl, bc                                      ; $4824: $09
	ld   e, (hl)                                     ; $4825: $5e
	ld   d, $00                                      ; $4826: $16 $00
	dec  de                                          ; $4828: $1b
	ld   a, e                                        ; $4829: $7b
	push af                                          ; $482a: $f5
	call deEquNpcYAddCollisionAdjust                               ; $482b: $cd $b4 $46
	pop  af                                          ; $482e: $f1
	ld   c, a                                        ; $482f: $4f
	ld   b, $00                                      ; $4830: $06 $00
	call Call_001_4bea                               ; $4832: $cd $ea $4b
	cp   $00                                         ; $4835: $fe $00
	jr   nz, jr_001_4847                             ; $4837: $20 $0e

	ld   hl, wCurrNpcIdx                                   ; $4839: $21 $a6 $c0
	ld   c, (hl)                                     ; $483c: $4e
	ld   b, $00                                      ; $483d: $06 $00
	ld   hl, wNPC_xCoord                                   ; $483f: $21 $3c $cb
	add  hl, bc                                      ; $4842: $09
	dec  (hl)                                        ; $4843: $35
	scf                                              ; $4844: $37
	ccf                                              ; $4845: $3f
	ret                                              ; $4846: $c9


jr_001_4847:
	scf                                              ; $4847: $37
	ret                                              ; $4848: $c9


func_4849:
	ld   hl, wNPC_yCoord                                   ; func_4849: $21 $48 $cb
	add  hl, bc                                      ; $484c: $09
	ld   e, (hl)                                     ; $484d: $5e
	ld   d, $00                                      ; $484e: $16 $00
	call c044_equBit2of_cb60                               ; $4850: $cd $80 $43
	ld   hl, wNPC_xCoord                                   ; $4853: $21 $3c $cb
	add  hl, bc                                      ; $4856: $09
	ld   a, (hl)                                     ; $4857: $7e
	add  $01                                         ; $4858: $c6 $01
	jr   z, jr_001_48a4                              ; $485a: $28 $48

	ld   c, a                                        ; $485c: $4f
	ld   b, $00                                      ; $485d: $06 $00
	call checkPlayerCollisionWithEnemy                               ; $485f: $cd $a7 $4a
	call Call_001_438c                               ; $4862: $cd $8c $43
	ld   a, c                                        ; $4865: $79
	add  $0f                                         ; $4866: $c6 $0f
	ld   c, a                                        ; $4868: $4f
	ld   b, $00                                      ; $4869: $06 $00
	call deEquEplusYCollisionAdjust                               ; $486b: $cd $bb $46
	call splitCEintoItsNybbles                               ; $486e: $cd $1c $55
	call Call_001_45d3                               ; $4871: $cd $d3 $45
	jr   c, jr_001_48a4                              ; $4874: $38 $2e

	ld   hl, wCurrNpcIdx                                   ; $4876: $21 $a6 $c0
	ld   c, (hl)                                     ; $4879: $4e
	ld   b, $00                                      ; $487a: $06 $00
	ld   hl, wNPC_xCoord                                   ; $487c: $21 $3c $cb
	add  hl, bc                                      ; $487f: $09
	ld   a, (hl)                                     ; $4880: $7e
	add  $01                                         ; $4881: $c6 $01
	ld   e, a                                        ; $4883: $5f
	ld   d, $00                                      ; $4884: $16 $00
	ld   a, e                                        ; $4886: $7b
	push af                                          ; $4887: $f5
	call deEquNpcYAddCollisionAdjust                               ; $4888: $cd $b4 $46
	pop  af                                          ; $488b: $f1
	ld   c, a                                        ; $488c: $4f
	ld   b, $00                                      ; $488d: $06 $00
	call Call_001_4bea                               ; $488f: $cd $ea $4b
	cp   $00                                         ; $4892: $fe $00
	jr   nz, jr_001_48a4                             ; $4894: $20 $0e

	ld   hl, wCurrNpcIdx                                   ; $4896: $21 $a6 $c0
	ld   c, (hl)                                     ; $4899: $4e
	ld   b, $00                                      ; $489a: $06 $00
	ld   hl, wNPC_xCoord                                   ; $489c: $21 $3c $cb
	add  hl, bc                                      ; $489f: $09
	inc  (hl)                                        ; $48a0: $34
	scf                                              ; $48a1: $37
	ccf                                              ; $48a2: $3f
	ret                                              ; $48a3: $c9


jr_001_48a4:
	scf                                              ; $48a4: $37
	ret                                              ; $48a5: $c9


resetRandomNumberTableIdx:
	ld   hl, wRandomNumberTableIdx
	ld   (hl), $00
	ld   hl, wRandomNumberTableIdx+1
	ld   (hl), $00
	ret


;;
	ret


getNextRandomNumber:
// c0a1 is bank
	ld   hl, wCommonByteCopyFuncBank
	ld   (hl), :randomNumberTable

// number of bytes
	ld   hl, wCommonByteCopyFuncNumBytes
	ld   (hl), $01

// get next number
	ld   hl, wRandomNumberTableIdx
	ld   e, (hl)
	ld   hl, wRandomNumberTableIdx+1
	ld   d, (hl)
	inc  de

// loop $400 bytes from 094b to 0d4a
	bit  2, d
	jr   z, +
	ld   de, $0000
+
	ld   (hl), d
	ld   hl, wRandomNumberTableIdx
	ld   (hl), e

//
	ld   hl, randomNumberTable
	add  hl, de
	push hl
	pop  de

// copy from offset in randomNumberTable
	ld   hl, wCommonByteCopyFuncSrc
	ld   (hl), e
	ld   hl, wCommonByteCopyFuncSrc+1
	ld   (hl), d

// copy bytes
	call copyBytesFromAnotherBankInto_c6d0

// c096 is the byte copied
	ld   hl, wCommonByteCopyDestBytes
	ld   a, (hl)
	ld   hl, wRandomNumber
	ld   (hl), a
	ret


;;
	ret


func_48ec:
	ld   hl, wSecondRoomStructByteBit7
	ld   a, (hl)                                     ; $48ef: $7e
	cp   $00                                         ; $48f0: $fe $00
	jr   z, @done                              ; $48f2: $28 $55

	ld   hl, $c07d                                   ; $48f4: $21 $7d $c0
	ld   a, (hl)                                     ; $48f7: $7e
	cp   $00                                         ; $48f8: $fe $00
	jr   nz, +                             ; $48fa: $20 $12

	ld   a, $00                                      ; $48fc: $3e $00
	ld   hl, $c07f                                   ; $48fe: $21 $7f $c0
	ld   (hl), a                                     ; $4901: $77
	ld   a, $01                                      ; $4902: $3e $01
	ld   hl, $c07d                                   ; $4904: $21 $7d $c0
	ld   (hl), a                                     ; $4907: $77
	ld   a, $09                                      ; $4908: $3e $09
	ld   hl, $c080                                   ; $490a: $21 $80 $c0
	ld   (hl), a                                     ; $490d: $77

+
	ld   hl, $c07f                                   ; $490e: $21 $7f $c0
	ld   c, (hl)                                     ; $4911: $4e
	ld   b, $00                                      ; $4912: $06 $00
	ld   hl, $c080                                   ; $4914: $21 $80 $c0
	ld   e, (hl)                                     ; $4917: $5e
	ld   d, $00                                      ; $4918: $16 $00
	ld   a, $0c                                      ; $491a: $3e $0c
	ld   hl, $c081                                   ; $491c: $21 $81 $c0
	ld   (hl), a                                     ; $491f: $77

@loop_4920:
	ld   hl, $c081                                   ; $4920: $21 $81 $c0
	dec  (hl)                                        ; $4923: $35
	jr   z, @c081_0                              ; $4924: $28 $24

	call getTileEntityOrPlayerIsOn                                       ; $4926: $cd $ed $3f
	cp   $23                                         ; $4929: $fe $23
	jr   z, @a18to23                              ; $492b: $28 $26

	cp   $18                                         ; $492d: $fe $18
	jr   c, @func_4935                              ; $492f: $38 $04

	cp   $24                                         ; $4931: $fe $24
	jr   c, @a18to23                              ; $4933: $38 $1e

@func_4935:
	inc  bc                                          ; $4935: $03
	ld   a, c                                        ; $4936: $79
	cp   $10                                         ; $4937: $fe $10
	jr   c, @loop_4920                              ; $4939: $38 $e5

	ld   bc, $0000                                   ; $493b: $01 $00 $00
	dec  de                                          ; $493e: $1b
	bit  7, d                                        ; $493f: $cb $7a
	jr   z, @loop_4920                              ; $4941: $28 $dd

	ld   a, $00                                      ; $4943: $3e $00
	ld   hl, $c07d                                   ; $4945: $21 $7d $c0
	ld   (hl), a                                     ; $4948: $77

@done:
	ret                                              ; $4949: $c9

@c081_0:
	ld   hl, $c07f                                   ; $494a: $21 $7f $c0
	ld   (hl), c                                     ; $494d: $71
	ld   hl, $c080                                   ; $494e: $21 $80 $c0
	ld   (hl), e                                     ; $4951: $73
	ret                                              ; $4952: $c9

@a18to23:
	push af                                          ; $4953: $f5
	inc  de                                          ; $4954: $13
	ld   hl, $c00d                                   ; $4955: $21 $0d $c0
	ld   (hl), e                                     ; $4958: $73
	ld   de, $0000                                   ; $4959: $11 $00 $00
	ld   hl, $c00a                                   ; $495c: $21 $0a $c0
	ldi  a, (hl)                                     ; $495f: $2a
	ld   h, (hl)                                     ; $4960: $66
	ld   l, a                                        ; $4961: $6f
	add  hl, de                                      ; $4962: $19
	pop  af                                          ; $4963: $f1
	push af                                          ; $4964: $f5
	ld   (hl), a                                     ; $4965: $77
	ld   hl, $c00d                                   ; $4966: $21 $0d $c0
	ld   e, (hl)                                     ; $4969: $5e
	ld   d, $00                                      ; $496a: $16 $00
	ld   hl, $c0af                                   ; $496c: $21 $af $c0
	ld   a, (hl)                                     ; $496f: $7e
	push af                                          ; $4970: $f5
	call func_3f41                                       ; $4971: $cd $41 $3f
	jr   c, @cfFromFunc3f41                              ; $4974: $38 $2e

	pop  af                                          ; $4976: $f1
	bit  7, a                                        ; $4977: $cb $7f
	jr   nz, @bit7_a                             ; $4979: $20 $15

	call Call_001_4023                               ; $497b: $cd $23 $40
	dec  de                                          ; $497e: $1b
	jr   c, @func_49da                              ; $497f: $38 $59

@loop_4981:
	ld   a, $06                                      ; $4981: $3e $06
	ld   hl, $c00d                                   ; $4983: $21 $0d $c0
	ld   (hl), a                                     ; $4986: $77
	pop  af                                          ; $4987: $f1
	call createFallingObject_retCifCant                               ; $4988: $cd $0c $4a
	jr   c, @done                              ; $498b: $38 $bc

	jp   @func_4935                               ; $498d: $c3 $35 $49

@bit7_a:
	cp   $98                                         ; $4990: $fe $98
	jr   nz, +                             ; $4992: $20 $0c

	call Call_001_4023                               ; $4994: $cd $23 $40
	dec  de                                          ; $4997: $1b
	cp   $00                                         ; $4998: $fe $00
	jr   nz, @loop_4981                             ; $499a: $20 $e5

	pop  af                                          ; $499c: $f1
	jp   @func_4935                               ; $499d: $c3 $35 $49

+
	dec  de                                          ; $49a0: $1b
	jp   @loop_4981                               ; $49a1: $c3 $81 $49

@cfFromFunc3f41:
	dec  de                                          ; $49a4: $1b
	cp   $18                                         ; $49a5: $fe $18
	jr   c, @aNot18to23                              ; $49a7: $38 $30

	cp   $24                                         ; $49a9: $fe $24
	jr   nc, @aNot18to23                             ; $49ab: $30 $2c

	pop  af                                          ; $49ad: $f1
	ld   a, c                                        ; $49ae: $79
	cp   $00                                         ; $49af: $fe $00
	jr   z, @func_49da                              ; $49b1: $28 $27

	dec  bc                                          ; $49b3: $0b
	call func_3f41                                       ; $49b4: $cd $41 $3f
	inc  bc                                          ; $49b7: $03
	jr   c, @cfFunc3f41_2                              ; $49b8: $38 $24

	dec  bc                                          ; $49ba: $0b
	inc  de                                          ; $49bb: $13
	call func_3f41                                       ; $49bc: $cd $41 $3f
	inc  bc                                          ; $49bf: $03
	dec  de                                          ; $49c0: $1b
	jr   c, @cfFunc3f41_2                              ; $49c1: $38 $1b

	dec  bc                                          ; $49c3: $0b
	call Call_001_4174                               ; $49c4: $cd $74 $41
	inc  bc                                          ; $49c7: $03
	jr   c, @func_49da                              ; $49c8: $38 $10

	ld   a, $09                                      ; $49ca: $3e $09
	ld   hl, $c00d                                   ; $49cc: $21 $0d $c0
	ld   (hl), a                                     ; $49cf: $77
	pop  af                                          ; $49d0: $f1
	call createFallingObject_retCifCant                               ; $49d1: $cd $0c $4a
	jr   c, @cfCall4a0c                              ; $49d4: $38 $33

	jp   @func_4935                               ; $49d6: $c3 $35 $49

@aNot18to23:
	pop  af                                          ; $49d9: $f1

@func_49da:
	pop  af                                          ; $49da: $f1
	jp   @func_4935                               ; $49db: $c3 $35 $49

@cfFunc3f41_2:
	ld   a, c                                        ; $49de: $79
	cp   $0f                                         ; $49df: $fe $0f
	jr   nc, @func_49da                             ; $49e1: $30 $f7

	inc  bc                                          ; $49e3: $03
	call func_3f41                                       ; $49e4: $cd $41 $3f
	dec  bc                                          ; $49e7: $0b
	jr   c, @func_49da                              ; $49e8: $38 $f0

	inc  bc                                          ; $49ea: $03
	inc  de                                          ; $49eb: $13
	call func_3f41                                       ; $49ec: $cd $41 $3f
	dec  bc                                          ; $49ef: $0b
	dec  de                                          ; $49f0: $1b
	jr   c, @func_49da                              ; $49f1: $38 $e7

	inc  bc                                          ; $49f3: $03
	call Call_001_4106                               ; $49f4: $cd $06 $41
	dec  bc                                          ; $49f7: $0b
	jr   c, @func_49da                              ; $49f8: $38 $e0

	ld   a, $00                                      ; $49fa: $3e $00
	ld   hl, $c00d                                   ; $49fc: $21 $0d $c0
	ld   (hl), a                                     ; $49ff: $77
	pop  af                                          ; $4a00: $f1
	call createFallingObject_retCifCant                               ; $4a01: $cd $0c $4a
	jr   c, @cfCall4a0c                              ; $4a04: $38 $03

	jp   @func_4935                               ; $4a06: $c3 $35 $49

@cfCall4a0c:
	jp   @done                               ; $4a09: $c3 $49 $49


createFallingObject_retCifCant:
// a used later for ID, preserve c
	ld   hl, $c00c                                   ; $4a0c: $21 $0c $c0
	ld   (hl), a                                     ; $4a0f: $77
	ld   a, c                                        ; $4a10: $79
	push af                                          ; $4a11: $f5
	ld   bc, $0000                                   ; $4a12: $01 $00 $00

@nextFallingObject:
	ld   hl, wFallingObjectID
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   z, @create

	inc  bc
	ld   a, c
	cp   NUM_FALLING_OBJECTS
	jr   c, @nextFallingObject

// restore c
	pop  af
	ld   c, a
	ld   b, $00
	scf
	ret

@create:
// original a
	ld   hl, $c00c                                   ; $4a2a: $21 $0c $c0
	ld   a, (hl)                                     ; $4a2d: $7e
	ld   hl, wFallingObjectID                                   ; $4a2e: $21 $60 $c6
	add  hl, bc                                      ; $4a31: $09
	ld   (hl), a                                     ; $4a32: $77

// pushed c val, save it
	pop  af                                          ; $4a33: $f1
	ld   hl, $c00c                                   ; $4a34: $21 $0c $c0
	ld   (hl), a                                     ; $4a37: $77

// a = 16e + c, c00c = idx of usable slot
	push af                                          ; $4a38: $f5
	ld   a, e                                        ; $4a39: $7b
	sla  a                                           ; $4a3a: $cb $27
	sla  a                                           ; $4a3c: $cb $27
	sla  a                                           ; $4a3e: $cb $27
	sla  a                                           ; $4a40: $cb $27
	ld   hl, $c00c                                   ; $4a42: $21 $0c $c0
	add  (hl)                                        ; $4a45: $86
	ld   hl, $c00c                                   ; $4a46: $21 $0c $c0
	ld   (hl), c                                     ; $4a49: $71

// a = current 2x2 game screen tile
	ld   c, a
	ld   b, $00
	ld   hl, w2x2gameScreenTiles
	add  hl, bc
	ld   a, (hl)

// idx of usable slot, we store the game screen tile
	ld   hl, $c00c                                   ; $4a52: $21 $0c $c0
	ld   c, (hl)                                     ; $4a55: $4e
	ld   b, $00                                      ; $4a56: $06 $00
	ld   hl, wFallingObjectTileIdx                                   ; $4a58: $21 $66 $c6
	add  hl, bc                                      ; $4a5b: $09
	ld   (hl), a                                     ; $4a5c: $77

// get pushed c val for x
	pop  af
	push af
	sla  a
	sla  a
	sla  a
	sla  a
	ld   hl, wFallingObjectXval
	add  hl, bc
	ld   (hl), a

// e is y
	ld   a, e
	sla  a
	sla  a
	sla  a
	sla  a
	ld   hl, wFallingObjectYval
	add  hl, bc
	ld   (hl), a

// 
	ld   hl, $c00d                                   ; $4a7a: $21 $0d $c0
	ld   a, (hl)                                     ; $4a7d: $7e
	ld   hl, wFallingObjectVar4                                   ; $4a7e: $21 $6c $c6
	add  hl, bc                                      ; $4a81: $09
	ld   (hl), a                                     ; $4a82: $77

// some kind of timer?
	ld   a, $10                                      ; $4a83: $3e $10
	ld   hl, wFallingObjectVar5                                   ; $4a85: $21 $6f $c6
	add  hl, bc                                      ; $4a88: $09
	ld   (hl), a                                     ; $4a89: $77

// orig e (2x2 y val)
	ld   a, e                                        ; $4a8a: $7b
	ld   hl, wFallingObject2x2yVal                                   ; $4a8b: $21 $75 $c6
	add  hl, bc                                      ; $4a8e: $09
	ld   (hl), a                                     ; $4a8f: $77

// orig c (2x2 x val)
	pop  af                                          ; $4a90: $f1
	ld   hl, wFallingObject2x2xVal                                   ; $4a91: $21 $72 $c6
	add  hl, bc                                      ; $4a94: $09
	ld   (hl), a                                     ; $4a95: $77

	ld   c, a                                        ; $4a96: $4f
	ld   b, $00                                      ; $4a97: $06 $00
	call getTileEntityOrPlayerIsOn                                       ; $4a99: $cd $ed $3f
	call Call_000_078b                                       ; $4a9c: $cd $8b $07
	ld   a, $00                                      ; $4a9f: $3e $00
	call replaceTileHere                               ; $4aa1: $cd $f4 $58
	scf                                              ; $4aa4: $37
	ccf                                              ; $4aa5: $3f
	ret                                              ; $4aa6: $c9


// ret z set if not within bounds
// ret c set if player took damage
checkPlayerCollisionWithEnemy:
// bc is x of npc, de is y of npc
// save y, then x below
	push de

// sub c to get top bounding box
	ld   a, e
	sub  $0c
	jr   nc, +
	ld   a, $00
+
	ld   hl, wItemTopBoundingBox
	ld   (hl), a

// bottom
	ld   a, e
	add  $0b
	ld   hl, wItemBottomBoundingBox
	ld   (hl), a

	push bc

// left
	ld   a, c
	sub  $0c
	jr   nc, +
	ld   a, $00
+
	ld   hl, wItemLeftBoundingBox
	ld   (hl), a

// right
	ld   a, c
	add  $0b
	jr   nc, +
	ld   a, $ff
+
	ld   hl, wItemRightBoundingBox
	ld   (hl), a

// check player within bounds
	ld   hl, wPlayerY
	ld   a, (hl)
	ld   hl, wItemTopBoundingBox
	cp   (hl)
	jr   c, @notCollided_retZset

	ld   hl, wItemBottomBoundingBox
	cp   (hl)
	jr   nc, @notCollided_retZset

// now horiz
	ld   hl, wPlayerX
	ld   a, (hl)
	ld   hl, wItemLeftBoundingBox
	cp   (hl)
	jr   c, @notCollided_retZset

	ld   hl, wPlayerX
	ld   a, (hl)
	ld   hl, wItemRightBoundingBox
	cp   (hl)
	jr   nc, @notCollided_retZset

// collision happened
	ld   hl, wBaseDamageTaken
	ld   a, (hl)
	cp   $00
	jr   nz, @playerTakingDamage

// 0 base damage, eg not an enemy
	scf
	ccf

// if bit 2 set of cb60, and transferred to c044, ignore
	ld   hl, $c044                                   ; $4aff: $21 $44 $c0
	ld   a, (hl)                                     ; $4b02: $7e
	cp   $00                                         ; $4b03: $fe $00
	jr   z, @retZunset                              ; $4b05: $28 $1f

	ld   hl, $c027                                   ; $4b07: $21 $27 $c0
	ld   a, (hl)                                     ; $4b0a: $7e
	cp   $00                                         ; $4b0b: $fe $00
	jr   nz, @retZunset                             ; $4b0d: $20 $17

// c027 0, set to 2
	ld   hl, wCurrNpcMovingDir                                   ; $4b0f: $21 $24 $c0
	ld   a, (hl)                                     ; $4b12: $7e
	ld   hl, $c026                                   ; $4b13: $21 $26 $c0
	ld   (hl), a                                     ; $4b16: $77

	ld   a, $02                                      ; $4b17: $3e $02
	ld   hl, $c027                                   ; $4b19: $21 $27 $c0
	ld   (hl), a                                     ; $4b1c: $77
	scf                                              ; $4b1d: $37
	ccf                                              ; $4b1e: $3f
	jp   @retZunset                               ; $4b1f: $c3 $26 $4b

@playerTakingDamage:
	call playerTakeDamage
	scf

// carry set when player taking damage
@retZunset:
	pop  bc
	pop  de
	ld   a, $ff
	or   a
	ret

@notCollided_retZset:
	pop  bc
	pop  de
	ld   a, $00
	or   a
	scf
	ccf
	ret


Call_001_4b34:
	ld   a, e                                        ; $4b34: $7b
	ld   hl, $c0a8                                   ; $4b35: $21 $a8 $c0
	ld   (hl), a                                     ; $4b38: $77
	sub  $0f                                         ; $4b39: $d6 $0f
	jr   nc, jr_001_4b3f                             ; $4b3b: $30 $02

	ld   a, $00                                      ; $4b3d: $3e $00

jr_001_4b3f:
	ld   hl, $c0a7                                   ; $4b3f: $21 $a7 $c0
	ld   (hl), a                                     ; $4b42: $77
	ld   hl, $c0a8                                   ; $4b43: $21 $a8 $c0
	ld   a, (hl)                                     ; $4b46: $7e
	add  $10                                         ; $4b47: $c6 $10
	ld   hl, $c0a8                                   ; $4b49: $21 $a8 $c0
	ld   (hl), a                                     ; $4b4c: $77
	ld   a, c                                        ; $4b4d: $79
	sub  $0f                                         ; $4b4e: $d6 $0f
	jr   nc, jr_001_4b54                             ; $4b50: $30 $02

	ld   a, $00                                      ; $4b52: $3e $00

jr_001_4b54:
	ld   hl, $c0a9                                   ; $4b54: $21 $a9 $c0
	ld   (hl), a                                     ; $4b57: $77
	ld   a, c                                        ; $4b58: $79
	add  $10                                         ; $4b59: $c6 $10
	jr   nc, jr_001_4b5f                             ; $4b5b: $30 $02

	ld   a, $ff                                      ; $4b5d: $3e $ff

jr_001_4b5f:
	ld   hl, $c0aa                                   ; $4b5f: $21 $aa $c0
	ld   (hl), a                                     ; $4b62: $77
	ld   a, e                                        ; $4b63: $7b
	sub  $0b                                         ; $4b64: $d6 $0b
	ld   hl, $c0ab                                   ; $4b66: $21 $ab $c0
	ld   (hl), a                                     ; $4b69: $77
	add  $17                                         ; $4b6a: $c6 $17
	ld   hl, $c0ac                                   ; $4b6c: $21 $ac $c0
	ld   (hl), a                                     ; $4b6f: $77
	ld   a, c                                        ; $4b70: $79
	sub  $0b                                         ; $4b71: $d6 $0b
	ld   hl, $c0ad                                   ; $4b73: $21 $ad $c0
	ld   (hl), a                                     ; $4b76: $77
	ld   a, c                                        ; $4b77: $79
	add  $0c                                         ; $4b78: $c6 $0c
	ld   hl, $c0ae                                   ; $4b7a: $21 $ae $c0
	ld   (hl), a                                     ; $4b7d: $77
	ld   bc, $0000                                   ; $4b7e: $01 $00 $00

jr_001_4b81:
	ld   hl, wFallingObjectID                                   ; $4b81: $21 $60 $c6
	add  hl, bc                                      ; $4b84: $09
	ld   a, (hl)                                     ; $4b85: $7e
	cp   $00                                         ; $4b86: $fe $00
	jr   z, Jump_001_4bb1                              ; $4b88: $28 $27

	ld   hl, wFallingObjectYval                                   ; $4b8a: $21 $69 $c6
	add  hl, bc                                      ; $4b8d: $09
	ld   a, (hl)                                     ; $4b8e: $7e
	ld   hl, $c0a7                                   ; $4b8f: $21 $a7 $c0
	cp   (hl)                                        ; $4b92: $be
	jr   c, Jump_001_4bb1                              ; $4b93: $38 $1c

	ld   hl, $c0a8                                   ; $4b95: $21 $a8 $c0
	cp   (hl)                                        ; $4b98: $be
	jr   nc, Jump_001_4bb1                             ; $4b99: $30 $16

	ld   hl, wFallingObjectXval                                   ; $4b9b: $21 $63 $c6
	add  hl, bc                                      ; $4b9e: $09
	ld   a, (hl)                                     ; $4b9f: $7e
	ld   hl, $c0a9                                   ; $4ba0: $21 $a9 $c0
	cp   (hl)                                        ; $4ba3: $be
	jr   c, Jump_001_4bb1                              ; $4ba4: $38 $0b

	ld   hl, wFallingObjectXval                                   ; $4ba6: $21 $63 $c6
	add  hl, bc                                      ; $4ba9: $09
	ld   a, (hl)                                     ; $4baa: $7e
	ld   hl, $c0aa                                   ; $4bab: $21 $aa $c0
	cp   (hl)                                        ; $4bae: $be
	jr   c, jr_001_4bba                              ; $4baf: $38 $09

Jump_001_4bb1:
	inc  bc                                          ; $4bb1: $03
	ld   a, c                                        ; $4bb2: $79
	cp   $03                                         ; $4bb3: $fe $03
	jr   c, jr_001_4b81                              ; $4bb5: $38 $ca

	ld   a, $00                                      ; $4bb7: $3e $00
	ret                                              ; $4bb9: $c9


jr_001_4bba:
	ld   hl, wFallingObjectYval                                   ; $4bba: $21 $69 $c6
	add  hl, bc                                      ; $4bbd: $09
	ld   a, (hl)                                     ; $4bbe: $7e
	ld   hl, $c0ab                                   ; $4bbf: $21 $ab $c0
	cp   (hl)                                        ; $4bc2: $be
	jr   c, jr_001_4bd1                              ; $4bc3: $38 $0c

	ld   hl, $c0ac                                   ; $4bc5: $21 $ac $c0
	cp   (hl)                                        ; $4bc8: $be
	jr   nc, jr_001_4bd1                             ; $4bc9: $30 $06

jr_001_4bcb:
	ld   hl, wFallingObjectID                                   ; $4bcb: $21 $60 $c6
	add  hl, bc                                      ; $4bce: $09
	ld   a, (hl)                                     ; $4bcf: $7e
	ret                                              ; $4bd0: $c9


jr_001_4bd1:
	ld   hl, wFallingObjectXval                                   ; $4bd1: $21 $63 $c6
	add  hl, bc                                      ; $4bd4: $09
	ld   a, (hl)                                     ; $4bd5: $7e
	ld   hl, $c0ad                                   ; $4bd6: $21 $ad $c0
	cp   (hl)                                        ; $4bd9: $be
	jr   c, Jump_001_4bb1                              ; $4bda: $38 $d5

	ld   hl, wFallingObjectXval                                   ; $4bdc: $21 $63 $c6
	add  hl, bc                                      ; $4bdf: $09
	ld   a, (hl)                                     ; $4be0: $7e
	ld   hl, $c0ae                                   ; $4be1: $21 $ae $c0
	cp   (hl)                                        ; $4be4: $be
	jr   c, jr_001_4bcb                              ; $4be5: $38 $e4

	jp   Jump_001_4bb1                               ; $4be7: $c3 $b1 $4b


Call_001_4bea:
	ld   a, e                                        ; $4bea: $7b
	ld   hl, $c0a8                                   ; $4beb: $21 $a8 $c0
	ld   (hl), a                                     ; $4bee: $77
	sub  $0f                                         ; $4bef: $d6 $0f
	jr   nc, jr_001_4bf5                             ; $4bf1: $30 $02

	ld   a, $00                                      ; $4bf3: $3e $00

jr_001_4bf5:
	ld   hl, $c0a7                                   ; $4bf5: $21 $a7 $c0
	ld   (hl), a                                     ; $4bf8: $77
	ld   hl, $c0a8                                   ; $4bf9: $21 $a8 $c0
	ld   a, (hl)                                     ; $4bfc: $7e
	add  $10                                         ; $4bfd: $c6 $10
	ld   hl, $c0a8                                   ; $4bff: $21 $a8 $c0
	ld   (hl), a                                     ; $4c02: $77
	ld   a, c                                        ; $4c03: $79
	sub  $0f                                         ; $4c04: $d6 $0f
	jr   nc, jr_001_4c0a                             ; $4c06: $30 $02

	ld   a, $00                                      ; $4c08: $3e $00

jr_001_4c0a:
	ld   hl, $c0a9                                   ; $4c0a: $21 $a9 $c0
	ld   (hl), a                                     ; $4c0d: $77
	ld   a, c                                        ; $4c0e: $79
	add  $10                                         ; $4c0f: $c6 $10
	jr   nc, jr_001_4c15                             ; $4c11: $30 $02

	ld   a, $ff                                      ; $4c13: $3e $ff

jr_001_4c15:
	ld   hl, $c0aa                                   ; $4c15: $21 $aa $c0
	ld   (hl), a                                     ; $4c18: $77
	ld   bc, $0000                                   ; $4c19: $01 $00 $00

jr_001_4c1c:
	ld   hl, wFallingObjectID                                   ; $4c1c: $21 $60 $c6
	add  hl, bc                                      ; $4c1f: $09
	ld   a, (hl)                                     ; $4c20: $7e
	cp   $00                                         ; $4c21: $fe $00
	jr   z, jr_001_4c4c                              ; $4c23: $28 $27

	ld   hl, wFallingObjectYval                                   ; $4c25: $21 $69 $c6
	add  hl, bc                                      ; $4c28: $09
	ld   a, (hl)                                     ; $4c29: $7e
	ld   hl, $c0a7                                   ; $4c2a: $21 $a7 $c0
	cp   (hl)                                        ; $4c2d: $be
	jr   c, jr_001_4c4c                              ; $4c2e: $38 $1c

	ld   hl, $c0a8                                   ; $4c30: $21 $a8 $c0
	cp   (hl)                                        ; $4c33: $be
	jr   nc, jr_001_4c4c                             ; $4c34: $30 $16

	ld   hl, wFallingObjectXval                                   ; $4c36: $21 $63 $c6
	add  hl, bc                                      ; $4c39: $09
	ld   a, (hl)                                     ; $4c3a: $7e
	ld   hl, $c0a9                                   ; $4c3b: $21 $a9 $c0
	cp   (hl)                                        ; $4c3e: $be
	jr   c, jr_001_4c4c                              ; $4c3f: $38 $0b

	ld   hl, wFallingObjectXval                                   ; $4c41: $21 $63 $c6
	add  hl, bc                                      ; $4c44: $09
	ld   a, (hl)                                     ; $4c45: $7e
	ld   hl, $c0aa                                   ; $4c46: $21 $aa $c0
	cp   (hl)                                        ; $4c49: $be
	jr   c, jr_001_4c55                              ; $4c4a: $38 $09

jr_001_4c4c:
	inc  bc                                          ; $4c4c: $03
	ld   a, c                                        ; $4c4d: $79
	cp   $03                                         ; $4c4e: $fe $03
	jr   c, jr_001_4c1c                              ; $4c50: $38 $ca

	ld   a, $00                                      ; $4c52: $3e $00
	ret                                              ; $4c54: $c9


jr_001_4c55:
	ld   hl, wFallingObjectID                                   ; $4c55: $21 $60 $c6
	add  hl, bc                                      ; $4c58: $09
	ld   a, (hl)                                     ; $4c59: $7e
	ret                                              ; $4c5a: $c9


checkTransitioningToLeftScreen:
	ld   hl, wPlayerX
	ld   a, (hl)
	cp   $00
	jr   nz, @notTransitioningLeft

// x = 0, always look left
	ld   hl, wPlayerOamAttr
	ld   a, (hl)
	or   $20
	ld   hl, wPlayerOamAttr
	ld   (hl), a

// use tile idx 40h
	ld   a, $40                                      ; $4c6d: $3e $40
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $4c6f: $21 $56 $c0
	ld   (hl), a                                     ; $4c72: $77

// transitioning to left
	ld   bc, $0009                                   ; $4c73: $01 $09 $00
	jp   _screenTransition                               ; $4c76: $c3 $87 $4e

@notTransitioningLeft:
// bc = player x - 1
	ld   hl, wPlayerX                                   ; $4c79: $21 $52 $c0
	ld   c, (hl)                                     ; $4c7c: $4e
	ld   b, $00                                      ; $4c7d: $06 $00
	dec  bc                                          ; $4c7f: $0b

// de is player's collision box top edge
	call deEquPlayerYplus_c04a                                       ; $4c80: $cd $40 $2b
	call splitCEintoItsNybbles                               ; $4c83: $cd $1c $55

// clear some vars
	ld   a, $00                                      ; $4c86: $3e $00
	ld   hl, $c088                                   ; $4c88: $21 $88 $c0
	ld   (hl), a                                     ; $4c8b: $77
	ld   hl, $c089                                   ; $4c8c: $21 $89 $c0
	ld   (hl), a                                     ; $4c8f: $77
	ld   hl, $c08a                                   ; $4c90: $21 $8a $c0
	ld   (hl), a                                     ; $4c93: $77

// set some vars to 9
	ld   a, $09                                      ; $4c94: $3e $09
	ld   hl, $c082                                   ; $4c96: $21 $82 $c0
	ld   (hl), a                                     ; $4c99: $77
	ld   hl, $c0b2                                   ; $4c9a: $21 $b2 $c0
	ld   (hl), a                                     ; $4c9d: $77

	call Call_001_53d8                               ; $4c9e: $cd $d8 $53
	jr   c, Jump_001_4cca                              ; $4ca1: $38 $27

	ld   hl, wPlayerX                                   ; $4ca3: $21 $52 $c0
	ld   c, (hl)                                     ; $4ca6: $4e
	ld   b, $00                                      ; $4ca7: $06 $00
	dec  bc                                          ; $4ca9: $0b
	call deEquPlayerYplus_c04a                                       ; $4caa: $cd $40 $2b
	call Call_001_4b34                               ; $4cad: $cd $34 $4b
	cp   $20                                         ; $4cb0: $fe $20
	jr   c, jr_001_4cbb                              ; $4cb2: $38 $07

	cp   $26                                         ; $4cb4: $fe $26
	jr   nc, Jump_001_4cca                             ; $4cb6: $30 $12

	jp   Jump_001_4cca                               ; $4cb8: $c3 $ca $4c


jr_001_4cbb:
	cp   $00                                         ; $4cbb: $fe $00
	jr   nz, Jump_001_4cca                             ; $4cbd: $20 $0b

	ld   hl, wPlayerX                                   ; $4cbf: $21 $52 $c0
	dec  (hl)                                        ; $4cc2: $35
	ld   hl, $c04d                                   ; $4cc3: $21 $4d $c0
	inc  (hl)                                        ; $4cc6: $34
	jp   Jump_001_4cd5                               ; $4cc7: $c3 $d5 $4c


Jump_001_4cca:
	ld   hl, wKeysPressed                                   ; $4cca: $21 $16 $c0
	ld   a, (hl)                                     ; $4ccd: $7e
	and  PADF_DOWN|PADF_UP                                         ; $4cce: $e6 $c0
	jr   z, Jump_001_4cd5                              ; $4cd0: $28 $03

	jp   Jump_001_4d69                               ; $4cd2: $c3 $69 $4d

Jump_001_4cd5:
	ld   hl, wPlayerOamAttr                                   ; $4cd5: $21 $55 $c0
	ld   a, (hl)                                     ; $4cd8: $7e
	or   $20                                         ; $4cd9: $f6 $20
	jp   Jump_001_4d5f                               ; $4cdb: $c3 $5f $4d


checkTransitioningToRightScreen:
	ld   hl, wPlayerX                                   ; $4cde: $21 $52 $c0
	ld   a, (hl)                                     ; $4ce1: $7e
	cp   $f0                                         ; $4ce2: $fe $f0
	jr   c, @notTransitioningRight                              ; $4ce4: $38 $16

// player x is past right edge of screen
	ld   hl, wPlayerOamAttr                                   ; $4ce6: $21 $55 $c0
	ld   a, (hl)                                     ; $4ce9: $7e
	and  $df                                         ; $4cea: $e6 $df
	ld   hl, wPlayerOamAttr                                   ; $4cec: $21 $55 $c0
	ld   (hl), a                                     ; $4cef: $77
	ld   a, $40                                      ; $4cf0: $3e $40
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $4cf2: $21 $56 $c0
	ld   (hl), a                                     ; $4cf5: $77

// transitioning right
	ld   bc, $0000                                   ; $4cf6: $01 $00 $00
	jp   _screenTransition                               ; $4cf9: $c3 $87 $4e

@notTransitioningRight:
	ld   hl, wPlayerX                                   ; $4cfc: $21 $52 $c0
	ld   a, (hl)                                     ; $4cff: $7e
	add  $10                                         ; $4d00: $c6 $10
	ld   c, a                                        ; $4d02: $4f
	ld   b, $00                                      ; $4d03: $06 $00
	call deEquPlayerYplus_c04a                                       ; $4d05: $cd $40 $2b
	call splitCEintoItsNybbles                               ; $4d08: $cd $1c $55
	ld   a, $00                                      ; $4d0b: $3e $00
	ld   hl, $c087                                   ; $4d0d: $21 $87 $c0
	ld   (hl), a                                     ; $4d10: $77
	ld   hl, $c089                                   ; $4d11: $21 $89 $c0
	ld   (hl), a                                     ; $4d14: $77
	ld   hl, $c08a                                   ; $4d15: $21 $8a $c0
	ld   (hl), a                                     ; $4d18: $77
	ld   a, $00                                      ; $4d19: $3e $00
	ld   hl, $c082                                   ; $4d1b: $21 $82 $c0
	ld   (hl), a                                     ; $4d1e: $77
	ld   hl, $c0b2                                   ; $4d1f: $21 $b2 $c0
	ld   (hl), a                                     ; $4d22: $77
	call Call_001_53d8                               ; $4d23: $cd $d8 $53
	jr   c, jr_001_4d51                              ; $4d26: $38 $29

	ld   hl, wPlayerX                                   ; $4d28: $21 $52 $c0
	ld   a, (hl)                                     ; $4d2b: $7e
	add  $01                                         ; $4d2c: $c6 $01
	ld   c, a                                        ; $4d2e: $4f
	ld   b, $00                                      ; $4d2f: $06 $00
	call deEquPlayerYplus_c04a                                       ; $4d31: $cd $40 $2b
	call Call_001_4b34                               ; $4d34: $cd $34 $4b
	cp   $20                                         ; $4d37: $fe $20
	jr   c, jr_001_4d42                              ; $4d39: $38 $07

	cp   $26                                         ; $4d3b: $fe $26
	jr   nc, jr_001_4d51                             ; $4d3d: $30 $12

	jp   Jump_001_4d51                               ; $4d3f: $c3 $51 $4d


jr_001_4d42:
	cp   $00                                         ; $4d42: $fe $00
	jr   nz, jr_001_4d51                             ; $4d44: $20 $0b

	ld   hl, wPlayerX                                   ; $4d46: $21 $52 $c0
	inc  (hl)                                        ; $4d49: $34
	ld   hl, $c04d                                   ; $4d4a: $21 $4d $c0
	inc  (hl)                                        ; $4d4d: $34
	jp   Jump_001_4d59                               ; $4d4e: $c3 $59 $4d


Jump_001_4d51:
jr_001_4d51:
	ld   hl, wKeysPressed                                   ; $4d51: $21 $16 $c0
	ld   a, (hl)                                     ; $4d54: $7e
	and  PADF_DOWN|PADF_UP                                         ; $4d55: $e6 $c0
	jr   nz, Jump_001_4d69                             ; $4d57: $20 $10

Jump_001_4d59:
	ld   hl, wPlayerOamAttr                                   ; $4d59: $21 $55 $c0
	ld   a, (hl)                                     ; $4d5c: $7e
	and  $df                                         ; $4d5d: $e6 $df

Jump_001_4d5f:
	ld   hl, wPlayerOamAttr                                   ; $4d5f: $21 $55 $c0
	ld   (hl), a                                     ; $4d62: $77
	ld   a, $40                                      ; $4d63: $3e $40
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $4d65: $21 $56 $c0
	ld   (hl), a                                     ; $4d68: $77

Jump_001_4d69:
	ld   hl, $c707                                   ; Jump_001_4d69: $21 $07 $c7
	inc  (hl)                                        ; $4d6c: $34
	ld   hl, $c707                                   ; $4d6d: $21 $07 $c7
	ld   a, (hl)                                     ; $4d70: $7e
	and  $03                                         ; $4d71: $e6 $03
	jr   nz, jr_001_4d88                             ; $4d73: $20 $13

	ld   hl, wPlayerAnimationIdx                                   ; $4d75: $21 $57 $c0
	ld   e, (hl)                                     ; $4d78: $5e
	ld   d, $00                                      ; $4d79: $16 $00
	ld   a, e                                        ; $4d7b: $7b
	cp   $02                                         ; $4d7c: $fe $02
	jr   c, jr_001_4d83                              ; $4d7e: $38 $03

	ld   de, $00ff                                   ; $4d80: $11 $ff $00

jr_001_4d83:
	inc  de                                          ; $4d83: $13
	ld   hl, wPlayerAnimationIdx                                   ; $4d84: $21 $57 $c0
	ld   (hl), e                                     ; $4d87: $73

jr_001_4d88:
	ret                                              ; $4d88: $c9


checkTransitioningToAboveScreen:
	ld   hl, wPlayerY                                   ; $4d89: $21 $54 $c0
	ld   a, (hl)                                     ; $4d8c: $7e
	cp   $00                                         ; $4d8d: $fe $00
	jr   nz, @notTransitioningUp                             ; $4d8f: $20 $16

	ld   a, $40|DIR_UP                                      ; $4d91: $3e $43
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $4d93: $21 $56 $c0
	ld   (hl), a                                     ; $4d96: $77
	ld   hl, wPlayerOamAttr                                   ; $4d97: $21 $55 $c0
	ld   a, (hl)                                     ; $4d9a: $7e
	and  $df                                         ; $4d9b: $e6 $df
	ld   hl, wPlayerOamAttr                                   ; $4d9d: $21 $55 $c0
	ld   (hl), a                                     ; $4da0: $77

// transitioning up
	ld   bc, $0003                                   ; $4da1: $01 $03 $00
	jp   _screenTransition                               ; $4da4: $c3 $87 $4e

@notTransitioningUp:
	call deEquPlayerYplus_c04a                                       ; $4da7: $cd $40 $2b
	dec  de                                          ; $4daa: $1b
	ld   hl, wPlayerX                                   ; $4dab: $21 $52 $c0
	ld   c, (hl)                                     ; $4dae: $4e
	ld   b, $00                                      ; $4daf: $06 $00
	call splitCEintoItsNybbles                               ; $4db1: $cd $1c $55
	ld   a, $00                                      ; $4db4: $3e $00
	ld   hl, $c087                                   ; $4db6: $21 $87 $c0
	ld   (hl), a                                     ; $4db9: $77
	ld   hl, $c088                                   ; $4dba: $21 $88 $c0
	ld   (hl), a                                     ; $4dbd: $77
	ld   hl, $c08a                                   ; $4dbe: $21 $8a $c0
	ld   (hl), a                                     ; $4dc1: $77
	ld   a, $03                                      ; $4dc2: $3e $03
	ld   hl, $c082                                   ; $4dc4: $21 $82 $c0
	ld   (hl), a                                     ; $4dc7: $77
	ld   hl, $c0b2                                   ; $4dc8: $21 $b2 $c0
	ld   (hl), a                                     ; $4dcb: $77
	call Call_001_549f                               ; $4dcc: $cd $9f $54
	jr   c, jr_001_4df1                              ; $4dcf: $38 $20

	call deEquPlayerYplus_c04a                                       ; $4dd1: $cd $40 $2b
	dec  de                                          ; $4dd4: $1b
	ld   hl, wPlayerX                                   ; $4dd5: $21 $52 $c0
	ld   c, (hl)                                     ; $4dd8: $4e
	ld   b, $00                                      ; $4dd9: $06 $00
	call Call_001_4b34                               ; $4ddb: $cd $34 $4b
	cp   $20                                         ; $4dde: $fe $20
	jr   c, jr_001_4de9                              ; $4de0: $38 $07

	cp   $26                                         ; $4de2: $fe $26
	jr   nc, jr_001_4df1                             ; $4de4: $30 $0b

	jp   Jump_001_4df1                               ; $4de6: $c3 $f1 $4d


jr_001_4de9:
	cp   $00                                         ; $4de9: $fe $00
	jr   nz, jr_001_4df1                             ; $4deb: $20 $04

	ld   hl, wPlayerY                                   ; $4ded: $21 $54 $c0
	dec  (hl)                                        ; $4df0: $35

Jump_001_4df1:
jr_001_4df1:
	ld   hl, $c04d                                   ; $4df1: $21 $4d $c0
	ld   a, (hl)                                     ; $4df4: $7e
	cp   $00                                         ; $4df5: $fe $00
	jr   nz, jr_001_4e09                             ; $4df7: $20 $10

	ld   a, $40|DIR_UP                                      ; $4df9: $3e $43
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $4dfb: $21 $56 $c0
	ld   (hl), a                                     ; $4dfe: $77

Jump_001_4dff:
	ld   hl, wPlayerOamAttr                                   ; $4dff: $21 $55 $c0
	ld   a, (hl)                                     ; $4e02: $7e
	and  $df                                         ; $4e03: $e6 $df
	ld   hl, wPlayerOamAttr                                   ; $4e05: $21 $55 $c0
	ld   (hl), a                                     ; $4e08: $77

jr_001_4e09:
	jp   Jump_001_4d69                               ; $4e09: $c3 $69 $4d


checkTransitioningToBelowScreen:
	ld   hl, wPlayerY                                   ; $4e0c: $21 $54 $c0
	ld   a, (hl)                                     ; $4e0f: $7e
	add  $10                                         ; $4e10: $c6 $10
	cp   $af                                         ; $4e12: $fe $af
	jr   c, @notTransitioningDown                              ; $4e14: $38 $16

	ld   a, $40|DIR_DOWN                                      ; $4e16: $3e $46
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $4e18: $21 $56 $c0
	ld   (hl), a                                     ; $4e1b: $77
	ld   hl, wPlayerOamAttr                                   ; $4e1c: $21 $55 $c0
	ld   a, (hl)                                     ; $4e1f: $7e
	and  $df                                         ; $4e20: $e6 $df
	ld   hl, wPlayerOamAttr                                   ; $4e22: $21 $55 $c0
	ld   (hl), a                                     ; $4e25: $77

// transitioning down
	ld   bc, $0006                                   ; $4e26: $01 $06 $00
	jp   _screenTransition                               ; $4e29: $c3 $87 $4e

@notTransitioningDown:
	ld   e, a                                        ; $4e2c: $5f
	ld   d, $00                                      ; $4e2d: $16 $00
	ld   hl, wPlayerX                                   ; $4e2f: $21 $52 $c0
	ld   c, (hl)                                     ; $4e32: $4e
	ld   b, $00                                      ; $4e33: $06 $00
	call splitCEintoItsNybbles                               ; $4e35: $cd $1c $55
	ld   a, $00                                      ; $4e38: $3e $00
	ld   hl, $c087                                   ; $4e3a: $21 $87 $c0
	ld   (hl), a                                     ; $4e3d: $77
	ld   hl, $c088                                   ; $4e3e: $21 $88 $c0
	ld   (hl), a                                     ; $4e41: $77
	ld   hl, $c089                                   ; $4e42: $21 $89 $c0
	ld   (hl), a                                     ; $4e45: $77
	ld   a, $06                                      ; $4e46: $3e $06
	ld   hl, $c082                                   ; $4e48: $21 $82 $c0
	ld   (hl), a                                     ; $4e4b: $77
	ld   hl, $c0b2                                   ; $4e4c: $21 $b2 $c0
	ld   (hl), a                                     ; $4e4f: $77
	call Call_001_549f                               ; $4e50: $cd $9f $54
	jr   c, jr_001_4e76                              ; $4e53: $38 $21

	ld   hl, wPlayerY                                   ; $4e55: $21 $54 $c0
	ld   a, (hl)                                     ; $4e58: $7e
	inc  de                                          ; $4e59: $13
	ld   hl, wPlayerX                                   ; $4e5a: $21 $52 $c0
	ld   c, (hl)                                     ; $4e5d: $4e
	ld   b, $00                                      ; $4e5e: $06 $00
	call Call_001_4b34                               ; $4e60: $cd $34 $4b
	cp   $20                                         ; $4e63: $fe $20
	jr   c, jr_001_4e6e                              ; $4e65: $38 $07

	cp   $26                                         ; $4e67: $fe $26
	jr   nc, jr_001_4e76                             ; $4e69: $30 $0b

	jp   Jump_001_4e76                               ; $4e6b: $c3 $76 $4e


jr_001_4e6e:
	cp   $00                                         ; $4e6e: $fe $00
	jr   nz, jr_001_4e76                             ; $4e70: $20 $04

	ld   hl, wPlayerY                                   ; $4e72: $21 $54 $c0
	inc  (hl)                                        ; $4e75: $34

Jump_001_4e76:
jr_001_4e76:
	ld   hl, $c04d                                   ; $4e76: $21 $4d $c0
	ld   a, (hl)                                     ; $4e79: $7e
	cp   $00                                         ; $4e7a: $fe $00
	jr   nz, jr_001_4e09                             ; $4e7c: $20 $8b

	ld   a, $40|DIR_DOWN                                      ; $4e7e: $3e $46
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $4e80: $21 $56 $c0
	ld   (hl), a                                     ; $4e83: $77
	jp   Jump_001_4dff                               ; $4e84: $c3 $ff $4d


_screenTransition:
	ld   hl, $c05d                                   ; $4e87: $21 $5d $c0
	ld   a, (hl)                                     ; $4e8a: $7e
	cp   $00                                         ; $4e8b: $fe $00
	jr   nz, _ret_4eb8                             ; $4e8d: $20 $29

	ld   hl, wRoomTransitionType                                   ; $4e8f: $21 $3a $c0
	ld   (hl), c                                     ; $4e92: $71
	ld   a, c                                        ; $4e93: $79
	cp   $03                                         ; $4e94: $fe $03
	jr   nz, _notTransitioningToUpRoom                             ; $4e96: $20 $33

	ld   hl, wCurrRoomY                                   ; $4e98: $21 $35 $c0
	ld   a, (hl)                                     ; $4e9b: $7e
	cp   $00                                         ; $4e9c: $fe $00
	jr   z, _ret_4eb8                              ; $4e9e: $28 $18

	call Call_001_4eaa                               ; $4ea0: $cd $aa $4e
	ld   hl, wCurrRoomY                                   ; $4ea3: $21 $35 $c0
	dec  (hl)                                        ; $4ea6: $35
	jp   transitioningOutOfRoomGroup                               ; $4ea7: $c3 $b9 $4e


Call_001_4eaa:
	ld   hl, $c053                                   ; $4eaa: $21 $53 $c0
	inc  (hl)                                        ; $4ead: $34
	ld   hl, $c053                                   ; $4eae: $21 $53 $c0
	ld   a, (hl)                                     ; $4eb1: $7e
	cp   $0f                                         ; $4eb2: $fe $0f
	jr   nc, _ret_4eb8                             ; $4eb4: $30 $02

	pop  af                                          ; $4eb6: $f1
	pop  af                                          ; $4eb7: $f1

_ret_4eb8:
	ret                                              ; $4eb8: $c9


transitioningOutOfRoomGroup:
	ld   a, $ff                                      ; $4eb9: $3e $ff
	ld   hl, $c05d                                   ; $4ebb: $21 $5d $c0
	ld   (hl), a                                     ; $4ebe: $77
	call getAddrOfCurrentRoomStruct                                       ; $4ebf: $cd $06 $19
	ld   hl, wRoomStructAddress                                   ; $4ec2: $21 $38 $c0
	ld   (hl), c                                     ; $4ec5: $71
	ld   hl, wRoomStructAddress+1                                   ; $4ec6: $21 $39 $c0
	ld   (hl), e                                     ; $4ec9: $73
	ret                                              ; $4eca: $c9


_notTransitioningToUpRoom:
	ld   a, c                                        ; $4ecb: $79
	cp   $06                                         ; $4ecc: $fe $06
	jr   nz, _transitioningToLeftOrRightRoom                             ; $4ece: $20 $16

	ld   hl, wCurrRoomY                                   ; $4ed0: $21 $35 $c0
	ld   a, (hl)                                     ; $4ed3: $7e
	add  $01                                         ; $4ed4: $c6 $01
	ld   hl, wCurrRoomGroupHeight                                   ; $4ed6: $21 $37 $c0
	cp   (hl)                                        ; $4ed9: $be
	jr   nc, _ret_4eb8                             ; $4eda: $30 $dc

	call Call_001_4eaa                               ; $4edc: $cd $aa $4e
	ld   hl, wCurrRoomY                                   ; $4edf: $21 $35 $c0
	inc  (hl)                                        ; $4ee2: $34
	jp   transitioningOutOfRoomGroup                               ; $4ee3: $c3 $b9 $4e


_transitioningToLeftOrRightRoom:
	ld   a, c                                        ; $4ee6: $79
	cp   $09                                         ; $4ee7: $fe $09
	jr   nz, _transitioningToRightRoom                             ; $4ee9: $20 $12

	ld   hl, wCurrRoomX                                   ; $4eeb: $21 $34 $c0
	ld   a, (hl)                                     ; $4eee: $7e
	cp   $00                                         ; $4eef: $fe $00
	jr   z, _ret_4eb8                              ; $4ef1: $28 $c5

	call Call_001_4eaa                               ; $4ef3: $cd $aa $4e

// transitioning left
	ld   hl, wCurrRoomX                                   ; $4ef6: $21 $34 $c0
	dec  (hl)                                        ; $4ef9: $35
	jp   transitioningOutOfRoomGroup                               ; $4efa: $c3 $b9 $4e


_transitioningToRightRoom:
	ld   hl, wCurrRoomX                                   ; $4efd: $21 $34 $c0
	ld   a, (hl)                                     ; $4f00: $7e
	add  $01                                         ; $4f01: $c6 $01
	ld   hl, wCurrRoomGroupWidth                                   ; $4f03: $21 $36 $c0
	cp   (hl)                                        ; $4f06: $be
	jr   nc, _ret_4eb8                             ; $4f07: $30 $af

	call Call_001_4eaa                               ; $4f09: $cd $aa $4e
	ld   hl, wCurrRoomX                                   ; $4f0c: $21 $34 $c0
	inc  (hl)                                        ; $4f0f: $34
	jp   transitioningOutOfRoomGroup                               ; $4f10: $c3 $b9 $4e


func_4f13:
	ld   hl, wPlayerX                                   ; func_4f13: $21 $52 $c0
	ld   a, (hl)                                     ; $4f16: $7e
	cp   $00                                         ; $4f17: $fe $00
	jr   z, jr_001_4f77                              ; $4f19: $28 $5c

	ld   hl, wPlayerX                                   ; $4f1b: $21 $52 $c0
	ld   c, (hl)                                     ; $4f1e: $4e
	ld   b, $00                                      ; $4f1f: $06 $00
	dec  bc                                          ; $4f21: $0b
	call deEquPlayerYplus_c04a                                       ; $4f22: $cd $40 $2b
	call splitCEintoItsNybbles                               ; $4f25: $cd $1c $55
	call Call_001_53d8                               ; $4f28: $cd $d8 $53
	jr   c, jr_001_4f77                              ; $4f2b: $38 $4a

	ld   hl, wPlayerX                                   ; $4f2d: $21 $52 $c0
	ld   c, (hl)                                     ; $4f30: $4e
	ld   b, $00                                      ; $4f31: $06 $00
	dec  bc                                          ; $4f33: $0b
	call deEquPlayerYplus_c04a                                       ; $4f34: $cd $40 $2b
	call Call_001_4b34                               ; $4f37: $cd $34 $4b
	cp   $00                                         ; $4f3a: $fe $00
	jr   nz, jr_001_4f77                             ; $4f3c: $20 $39

	ld   hl, wPlayerX                                   ; $4f3e: $21 $52 $c0
	dec  (hl)                                        ; $4f41: $35
	ret                                              ; $4f42: $c9


func_4f43:
	ld   hl, wPlayerX                                   ; func_4f43: $21 $52 $c0
	ld   a, (hl)                                     ; $4f46: $7e
	cp   $f0                                         ; $4f47: $fe $f0
	jr   nc, jr_001_4f77                             ; $4f49: $30 $2c

	ld   hl, wPlayerX                                   ; $4f4b: $21 $52 $c0
	ld   a, (hl)                                     ; $4f4e: $7e
	add  $10                                         ; $4f4f: $c6 $10
	ld   c, a                                        ; $4f51: $4f
	ld   b, $00                                      ; $4f52: $06 $00
	call deEquPlayerYplus_c04a                                       ; $4f54: $cd $40 $2b
	call splitCEintoItsNybbles                               ; $4f57: $cd $1c $55
	call Call_001_53d8                               ; $4f5a: $cd $d8 $53
	jr   c, jr_001_4f77                              ; $4f5d: $38 $18

	ld   hl, wPlayerX                                   ; $4f5f: $21 $52 $c0
	ld   a, (hl)                                     ; $4f62: $7e
	add  $01                                         ; $4f63: $c6 $01
	ld   c, a                                        ; $4f65: $4f
	ld   b, $00                                      ; $4f66: $06 $00
	call deEquPlayerYplus_c04a                                       ; $4f68: $cd $40 $2b
	call Call_001_4b34                               ; $4f6b: $cd $34 $4b
	cp   $00                                         ; $4f6e: $fe $00
	jr   nz, jr_001_4f77                             ; $4f70: $20 $05

	ld   hl, wPlayerX                                   ; $4f72: $21 $52 $c0
	inc  (hl)                                        ; $4f75: $34
	ret                                              ; $4f76: $c9


jr_001_4f77:
	ld   hl, $c026                                   ; $4f77: $21 $26 $c0
	ld   e, (hl)                                     ; $4f7a: $5e
	ld   d, $00                                      ; $4f7b: $16 $00
	ld   hl, npcTurnLeftData                                   ; $4f7d: $21 $01 $65
	add  hl, de                                      ; $4f80: $19
	ld   a, (hl)                                     ; $4f81: $7e
	ld   hl, $c026                                   ; $4f82: $21 $26 $c0
	ld   (hl), a                                     ; $4f85: $77
	ret                                              ; $4f86: $c9


func_4f87:
	ld   hl, wPlayerY                                   ; func_4f87: $21 $54 $c0
	ld   a, (hl)                                     ; $4f8a: $7e
	cp   $00                                         ; $4f8b: $fe $00
	jr   z, jr_001_4f77                              ; $4f8d: $28 $e8

	call deEquPlayerYplus_c04a                                       ; $4f8f: $cd $40 $2b
	dec  de                                          ; $4f92: $1b
	ld   hl, wPlayerX                                   ; $4f93: $21 $52 $c0
	ld   c, (hl)                                     ; $4f96: $4e
	ld   b, $00                                      ; $4f97: $06 $00
	call splitCEintoItsNybbles                               ; $4f99: $cd $1c $55
	call Call_001_549f                               ; $4f9c: $cd $9f $54
	jr   c, jr_001_4f77                              ; $4f9f: $38 $d6

	call deEquPlayerYplus_c04a                                       ; $4fa1: $cd $40 $2b
	dec  de                                          ; $4fa4: $1b
	ld   hl, wPlayerX                                   ; $4fa5: $21 $52 $c0
	ld   c, (hl)                                     ; $4fa8: $4e
	ld   b, $00                                      ; $4fa9: $06 $00
	call Call_001_4b34                               ; $4fab: $cd $34 $4b
	cp   $00                                         ; $4fae: $fe $00
	jr   nz, jr_001_4f77                             ; $4fb0: $20 $c5

	ld   hl, wPlayerY                                   ; $4fb2: $21 $54 $c0
	dec  (hl)                                        ; $4fb5: $35
	ret                                              ; $4fb6: $c9


func_4fb7:
	ld   hl, wPlayerY                                   ; func_4fb7: $21 $54 $c0
	ld   a, (hl)                                     ; $4fba: $7e
	add  $10                                         ; $4fbb: $c6 $10
	cp   $af                                         ; $4fbd: $fe $af
	jr   nc, jr_001_4f77                             ; $4fbf: $30 $b6

	ld   e, a                                        ; $4fc1: $5f
	ld   d, $00                                      ; $4fc2: $16 $00
	ld   hl, wPlayerX                                   ; $4fc4: $21 $52 $c0
	ld   c, (hl)                                     ; $4fc7: $4e
	ld   b, $00                                      ; $4fc8: $06 $00
	call splitCEintoItsNybbles                               ; $4fca: $cd $1c $55
	call Call_001_549f                               ; $4fcd: $cd $9f $54
	jr   c, jr_001_4f77                              ; $4fd0: $38 $a5

	call deEquPlayerYplus_c04a                                       ; $4fd2: $cd $40 $2b
	inc  de                                          ; $4fd5: $13
	ld   hl, wPlayerX                                   ; $4fd6: $21 $52 $c0
	ld   c, (hl)                                     ; $4fd9: $4e
	ld   b, $00                                      ; $4fda: $06 $00
	call Call_001_4b34                               ; $4fdc: $cd $34 $4b
	cp   $00                                         ; $4fdf: $fe $00
	jr   nz, jr_001_4f77                             ; $4fe1: $20 $94

	ld   hl, wPlayerY                                   ; $4fe3: $21 $54 $c0
	inc  (hl)                                        ; $4fe6: $34
	ret                                              ; $4fe7: $c9


func_4fe8:
	ld   hl, wPlayerX                                   ; $4fe8: $21 $52 $c0
	ld   a, (hl)                                     ; $4feb: $7e
	cp   $00                                         ; $4fec: $fe $00
	jr   nz, jr_001_4ff3                             ; $4fee: $20 $03

	jp   Jump_001_5032                               ; $4ff0: $c3 $32 $50


jr_001_4ff3:
	ld   hl, wPlayerX                                   ; $4ff3: $21 $52 $c0
	ld   c, (hl)                                     ; $4ff6: $4e
	ld   b, $00                                      ; $4ff7: $06 $00
	dec  bc                                          ; $4ff9: $0b
	call deEquPlayerYplus_c04a                                       ; $4ffa: $cd $40 $2b
	call splitCEintoItsNybbles                               ; $4ffd: $cd $1c $55
	ld   a, $09                                      ; $5000: $3e $09
	ld   hl, $c082                                   ; $5002: $21 $82 $c0
	ld   (hl), a                                     ; $5005: $77
	ld   hl, $c0b2                                   ; $5006: $21 $b2 $c0
	ld   (hl), a                                     ; $5009: $77
	call Call_001_53d8                               ; $500a: $cd $d8 $53
	jr   c, jr_001_5032                              ; $500d: $38 $23

	ld   hl, wPlayerX                                   ; $500f: $21 $52 $c0
	ld   c, (hl)                                     ; $5012: $4e
	ld   b, $00                                      ; $5013: $06 $00
	dec  bc                                          ; $5015: $0b
	call deEquPlayerYplus_c04a                                       ; $5016: $cd $40 $2b
	call Call_001_4b34                               ; $5019: $cd $34 $4b
	cp   $20                                         ; $501c: $fe $20
	jr   c, jr_001_5027                              ; $501e: $38 $07

	cp   $26                                         ; $5020: $fe $26
	jr   nc, jr_001_5032                             ; $5022: $30 $0e

	jp   Jump_001_5032                               ; $5024: $c3 $32 $50


jr_001_5027:
	cp   $00                                         ; $5027: $fe $00
	jr   nz, jr_001_5032                             ; $5029: $20 $07

	ld   hl, wPlayerX                                   ; $502b: $21 $52 $c0
	dec  (hl)                                        ; $502e: $35
	scf                                              ; $502f: $37
	ccf                                              ; $5030: $3f
	ret                                              ; $5031: $c9


Jump_001_5032:
jr_001_5032:
	scf                                              ; $5032: $37
	ret                                              ; $5033: $c9


func_5034:
	ld   hl, wPlayerX                                   ; $5034: $21 $52 $c0
	ld   a, (hl)                                     ; $5037: $7e
	cp   $f0                                         ; $5038: $fe $f0
	jr   c, jr_001_503f                              ; $503a: $38 $03

	jp   Jump_001_5082                               ; $503c: $c3 $82 $50


jr_001_503f:
	ld   hl, wPlayerX                                   ; $503f: $21 $52 $c0
	ld   a, (hl)                                     ; $5042: $7e
	add  $10                                         ; $5043: $c6 $10
	ld   c, a                                        ; $5045: $4f
	ld   b, $00                                      ; $5046: $06 $00
	call deEquPlayerYplus_c04a                                       ; $5048: $cd $40 $2b
	call splitCEintoItsNybbles                               ; $504b: $cd $1c $55
	ld   a, $00                                      ; $504e: $3e $00
	ld   hl, $c082                                   ; $5050: $21 $82 $c0
	ld   (hl), a                                     ; $5053: $77
	ld   hl, $c0b2                                   ; $5054: $21 $b2 $c0
	ld   (hl), a                                     ; $5057: $77
	call Call_001_53d8                               ; $5058: $cd $d8 $53
	jr   c, jr_001_5082                              ; $505b: $38 $25

	ld   hl, wPlayerX                                   ; $505d: $21 $52 $c0
	ld   a, (hl)                                     ; $5060: $7e
	add  $01                                         ; $5061: $c6 $01
	ld   c, a                                        ; $5063: $4f
	ld   b, $00                                      ; $5064: $06 $00
	call deEquPlayerYplus_c04a                                       ; $5066: $cd $40 $2b
	call Call_001_4b34                               ; $5069: $cd $34 $4b
	cp   $20                                         ; $506c: $fe $20
	jr   c, jr_001_5077                              ; $506e: $38 $07

	cp   $26                                         ; $5070: $fe $26
	jr   nc, jr_001_5082                             ; $5072: $30 $0e

	jp   Jump_001_5082                               ; $5074: $c3 $82 $50


jr_001_5077:
	cp   $00                                         ; $5077: $fe $00
	jr   nz, jr_001_5082                             ; $5079: $20 $07

	ld   hl, wPlayerX                                   ; $507b: $21 $52 $c0
	inc  (hl)                                        ; $507e: $34
	scf                                              ; $507f: $37
	ccf                                              ; $5080: $3f
	ret                                              ; $5081: $c9


Jump_001_5082:
jr_001_5082:
	scf                                              ; $5082: $37
	ret                                              ; $5083: $c9


add2toPlayerHealth:
	ld   a, $02

addAtoPlayerHealth:
// add A to health
	ld   hl, wPlayerHealth
	add  (hl)
	jr   nc, +
// no overflow
	ld   a, $ff

+
	ld   hl, wPlayerMaxHealth
	cp   (hl)
	jr   c, +

	ld   hl, wPlayerMaxHealth
	ld   a, (hl)

+
	ld   hl, wPlayerHealth
	ld   (hl), a
	ret


getTileCoordsPlayerOrBItemIsOnAndCheckCollision:
// if bc was player x and de was player y
// c008 = player x high nybble, c009 = player y high nybble
	ld   hl, wChighNybble
	ld   c, (hl)
	ld   b, $00
	ld   hl, wEhighNybble
	ld   e, (hl)
	ld   d, $00

// c006 would be player x low nybble
// if > 8, consider the tile to the right of player
	ld   hl, wClowNybble
	ld   a, (hl)
	cp   $08
	jr   c, +

	inc  bc

+
// same with c007 (player y low nybble)
	ld   hl, wElowNybble
	ld   a, (hl)
	cp   $08
	jr   c, +

	inc  de

+
	call processPlayerCollision
	ret


processPlayerCollision:
// eg bc = x coord of tile player is considered on
// and de = y coord of tile player is considered on
	ld   hl, $c05d                                   ; $50bf: $21 $5d $c0
	ld   a, (hl)                                     ; $50c2: $7e
	cp   $00                                         ; $50c3: $fe $00
	jr   nz, @done                             ; $50c5: $20 $40

	ld   hl, $c6c8                                   ; $50c7: $21 $c8 $c6
	ld   a, (hl)                                     ; $50ca: $7e
	cp   $00                                         ; $50cb: $fe $00
	jr   z, @func_50ef                              ; $50cd: $28 $20

	ld   hl, $c6c9                                   ; $50cf: $21 $c9 $c6
	ld   a, c                                        ; $50d2: $79
	cp   (hl)                                        ; $50d3: $be
	jr   nz, @func_50ef                             ; $50d4: $20 $19

	ld   hl, $c6ca                                   ; $50d6: $21 $ca $c6
	ld   a, e                                        ; $50d9: $7b
	cp   (hl)                                        ; $50da: $be
	jr   nz, @func_50ef                             ; $50db: $20 $12

	call getTileEntityOrPlayerIsOn                                       ; $50dd: $cd $ed $3f
	cp   $10                                         ; $50e0: $fe $10
	jr   z, @next_50f2                              ; $50e2: $28 $0e

	cp   $11                                         ; $50e4: $fe $11
	jr   z, @next_50f2                              ; $50e6: $28 $0a

	cp   $17                                         ; $50e8: $fe $17
	jr   z, @next_50f2                              ; $50ea: $28 $06

	jp   @done                               ; $50ec: $c3 $07 $51

@func_50ef:
	call getTileEntityOrPlayerIsOn                                       ; $50ef: $cd $ed $3f

@next_50f2:
// check out of bounds of table
	cp   $19
	jr   nc, @done                             ; $50f4: $30 $11

	push af                                          ; $50f6: $f5
	push bc                                          ; $50f7: $c5
	sla  a                                           ; $50f8: $cb $27
	ld   c, a                                        ; $50fa: $4f
	ld   b, $00                                      ; $50fb: $06 $00
	ld   hl, collisionsTable                                   ; $50fd: $21 $23 $0b
	add  hl, bc                                      ; $5100: $09
	ldi  a, (hl)                                     ; $5101: $2a
	ld   h, (hl)                                     ; $5102: $66
	ld   l, a                                        ; $5103: $6f
	pop  bc                                          ; $5104: $c1
	pop  af                                          ; $5105: $f1
	jp   hl                                          ; $5106: $e9

@done:
	ret                                              ; $5107: $c9


// $00, $14, $15, $16
_ret_5108:
	ret


// 1, 2, 10, 11, 12, 13, 17
_collision_tele:
	ld   hl, $c05d                                   ; $5109: $21 $5d $c0
	ld   a, (hl)                                     ; $510c: $7e
	cp   $00                                         ; $510d: $fe $00
	jr   nz, _ret_5108                             ; $510f: $20 $f7

	ld   hl, wMenuCursorIdx                                   ; $5111: $21 $11 $c7
	ld   a, (hl)                                     ; $5114: $7e
	cp   $00                                         ; $5115: $fe $00
	jr   nz, _ret_5108                             ; $5117: $20 $ef

	call retZifBC_DEonTeleTile                                       ; $5119: $cd $b9 $39
	jr   nz, _ret_5108                             ; $511c: $20 $ea

	call Call_001_5488                               ; $511e: $cd $88 $54
	jr   nz, _ret_5108                             ; $5121: $20 $e5

teleportPlayer:
	ld   a, $ff                                      ; $5123: $3e $ff
	ld   hl, $c05d                                   ; $5125: $21 $5d $c0
	ld   (hl), a                                     ; $5128: $77

	ld   hl, wScriptTeleGroup                                   ; $5129: $21 $bb $c0
	ld   a, (hl)                                     ; $512c: $7e
	cp   $fe                                         ; $512d: $fe $fe
	jr   nz, +                             ; $512f: $20 $30

// tele group is $fe - in the same room
	ld   hl, $c05d                                   ; $5131: $21 $5d $c0
	ld   (hl), a                                     ; $5134: $77
	ld   hl, $c05e                                   ; $5135: $21 $5e $c0
	ld   (hl), $ff                                   ; $5138: $36 $ff
	ld   a, $3c                                      ; $513a: $3e $3c
	ld   hl, $c57f                                   ; $513c: $21 $7f $c5
	ld   (hl), a                                     ; $513f: $77
	ld   hl, wScriptTeleRoomX                                   ; $5140: $21 $bc $c0
	ld   a, (hl)                                     ; $5143: $7e
	ld   hl, $c6d8                                   ; $5144: $21 $d8 $c6
	ld   (hl), a                                     ; $5147: $77
	ld   hl, wScriptTeleRoomY                                   ; $5148: $21 $bd $c0
	ld   a, (hl)                                     ; $514b: $7e
	ld   hl, $c6d9                                   ; $514c: $21 $d9 $c6
	ld   (hl), a                                     ; $514f: $77
	ld   hl, wScriptTelePlayerX                                   ; $5150: $21 $be $c0
	ld   a, (hl)                                     ; $5153: $7e
	ld   hl, $c6da                                   ; $5154: $21 $da $c6
	ld   (hl), a                                     ; $5157: $77
	ld   hl, wScriptTelePlayerY                                   ; $5158: $21 $bf $c0
	ld   a, (hl)                                     ; $515b: $7e
	ld   hl, $c6db                                   ; $515c: $21 $db $c6
	ld   (hl), a                                     ; $515f: $77
	ret                                              ; $5160: $c9

+
	cp   $ff
	jr   z, +

// if ff, dont change group
	ld   hl, wCurrRoomGroup
	ld   (hl), a

+
	ld   hl, wScriptTeleRoomX
	ld   a, (hl)
	ld   hl, wCurrRoomX
	ld   (hl), a

	ld   hl, wScriptTeleRoomY
	ld   a, (hl)
	ld   hl, wCurrRoomY
	ld   (hl), a

	ld   hl, wScriptTelePlayerX
	ld   a, (hl)
	ld   hl, wPlayerX
	ld   (hl), a

	ld   hl, wScriptTelePlayerY
	ld   a, (hl)
	ld   hl, wPlayerY
	ld   (hl), a

	call loadRoomGroupStruct
	ld   hl, wRoomTransitionType
	ld   (hl), RTT_DIFF_GROUP
	ret


_collision_give7bombs:
	ld   a, $07

giveBombs:
// $ff is max
	ld   hl, wNumBombs
	add  (hl)
	jr   nc, +
	ld   a, $ff
+
	ld   hl, wNumBombs
	ld   (hl), a

// deal with flag and tiles
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	call playSoundChIfOff26hIfOn
	ret


_collision_give3bombs:
	ld   a, $03
	jp   giveBombs


_collision_give1bird:
	ld   a, $01

giveBirds:
	push af
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	pop  af

// $ff is max
	ld   hl, wNumBirds
	add  (hl)
	jr   nc, +
	ld   a, $ff
+
	ld   hl, wNumBirds
	ld   (hl), a

// sound
	call playSoundChIfOff26hIfOn
	ret


_collision_give5birds:
	ld   a, $05
	jp   giveBirds


_collision_stub_07:
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	call playSoundChIfOff26hIfOn
	ret


_collision_stub_08:
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	call playSoundChIfOff26hIfOn
	ret


tilesetsAvailableForAog:
	.db $01 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	
_collision_giveArmorOfGod:
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	call bcEquTilesetIdxDiv2

// only give armor of God is on tileset 0
	ld   hl, tilesetsAvailableForAog
	add  hl, bc
	ld   a, (hl)
	ld   hl, wArmorOfGodGotten
	or   (hl)
	ld   hl, wArmorOfGodGotten
	ld   (hl), a
	call playSoundChIfOff26hIfOn
	ret


tilesetsAvailableForSpecialBitems:
	.db $01 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	
_collision_giveSpecialBitem:
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	call bcEquTilesetIdxDiv2

// only available for tileset 0
	ld   hl, tilesetsAvailableForSpecialBitems
	add  hl, bc
	ld   a, (hl)
	ld   hl, wSpecialBitemsGotten
	or   (hl)
	ld   hl, wSpecialBitemsGotten
	ld   (hl), a
	call playSoundChIfOff26hIfOn
	ret


bcEquTilesetIdxDiv2:
	ld   hl, wTilesetIdx
	ld   a, (hl)
	srl  a
	ld   c, a
	ld   b, $00
	ret


_collision_giveHeartContainer:
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	call playSoundChIfOff26hIfOn

giveHeartContainer:
	ld   hl, wPlayerMaxHealth
	ld   a, (hl)
// plus 2 halves
	add  $02
	cp   MAX_HEALTH
	jr   c, +

	ld   a, MAX_HEALTH

+
	ld   hl, wPlayerMaxHealth
	ld   (hl), a
	ret


_ret_525a:
	ret


_collision_stub_0d:
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	ret


_collision_giveAnointingOil:
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	call playSoundChIfOff25hIfOn

incAnointingOilsGotten:
	ld   hl, wAnointingOilsGotten
	ld   a, (hl)
	cp   $03
	jr   nc, @done

// inc oils based on bits set
	and  $02
	jr   nz, +

	ld   hl, wAnointingOilsGotten
	inc  (hl)

+
	ld   hl, wAnointingOilsGotten
	inc  (hl)

@done:
	ret


_collision_giveKey:
	call clearRoomFlagItem
	call replaceRoomFlagItemTile
	call playSoundChIfOff26hIfOn

giveKey:
	ld   hl, wNumKeys
	inc  (hl)
	ld   hl, wNumKeys
	ld   a, (hl)
	call aIsMax3fh
	ld   hl, wNumKeys
	ld   (hl), a
	ret


_collision_giveHeart:
	call replaceRoomFlagItemTile
	ld   a, $1d                                      ; $529c: $3e $1d
	call func_39fb                                       ; $529e: $cd $fb $39
	call Call_000_3a0c                                       ; $52a1: $cd $0c $3a
	call add2toPlayerHealth
	call playSoundChIfOff25hIfOn
	ret


Call_001_52ab:
	jp   nc, @done                           ; $52ab: $d2 $41 $53

	push af                                          ; $52ae: $f5
	push af                                          ; $52af: $f5
	cp   $19                                         ; $52b0: $fe $19
	jp   c, @popAFtwiceDone                            ; $52b2: $da $3f $53

	cp   $24                                         ; $52b5: $fe $24
	jp   nc, @popAFtwiceDone                           ; $52b7: $d2 $3f $53

	ld   hl, wArmorOfGodGotten                                   ; $52ba: $21 $52 $c6
	ld   a, (hl)                                     ; $52bd: $7e
	and  AOG_BELT                                         ; $52be: $e6 $01
	jr   z, @popAFtwiceDone                              ; $52c0: $28 $7d

	ld   hl, $c082                                   ; $52c2: $21 $82 $c0
	ld   a, (hl)                                     ; $52c5: $7e
	cp   $09                                         ; $52c6: $fe $09
	jr   nz, @func_5304                             ; $52c8: $20 $3a

	ld   hl, $c083                                   ; $52ca: $21 $83 $c0
	ld   a, (hl)                                     ; $52cd: $7e
	cp   $00                                         ; $52ce: $fe $00
	jr   nz, +                             ; $52d0: $20 $0f

	ld   a, $00                                      ; $52d2: $3e $00
	ld   hl, $c087                                   ; $52d4: $21 $87 $c0
	ld   (hl), a                                     ; $52d7: $77
	ld   a, $01                                      ; $52d8: $3e $01
	ld   hl, $c083                                   ; $52da: $21 $83 $c0
	ld   (hl), a                                     ; $52dd: $77
	jp   @popAFtwiceDone                               ; $52de: $c3 $3f $53

+
	ld   hl, $c087                                   ; $52e1: $21 $87 $c0
	ld   a, (hl)                                     ; $52e4: $7e
	cp   $0f                                         ; $52e5: $fe $0f
	jr   c, @popAFtwiceDone                              ; $52e7: $38 $56

	ld   a, c                                        ; $52e9: $79
	cp   $00                                         ; $52ea: $fe $00
	jr   z, @popAFtwiceDone                              ; $52ec: $28 $51

	dec  bc                                          ; $52ee: $0b
	call func_3f41                                       ; $52ef: $cd $41 $3f
	inc  bc                                          ; $52f2: $03
	jr   c, @popAFtwiceDone                              ; $52f3: $38 $4a

	ld   a, $09                                      ; $52f5: $3e $09
	ld   hl, $c00d                                   ; $52f7: $21 $0d $c0
	ld   (hl), a                                     ; $52fa: $77
	pop  af                                          ; $52fb: $f1
	call createFallingObject_retCifCant                               ; $52fc: $cd $0c $4a
	jr   c, @popAFdone                              ; $52ff: $38 $3f

	jp   @unsetCFdone                               ; $5301: $c3 $3b $53

@func_5304:
	ld   hl, $c084                                   ; $5304: $21 $84 $c0
	ld   a, (hl)                                     ; $5307: $7e
	cp   $00                                         ; $5308: $fe $00
	jr   nz, +                             ; $530a: $20 $0f

	ld   a, $00                                      ; $530c: $3e $00
	ld   hl, $c088                                   ; $530e: $21 $88 $c0
	ld   (hl), a                                     ; $5311: $77
	ld   a, $01                                      ; $5312: $3e $01
	ld   hl, $c084                                   ; $5314: $21 $84 $c0
	ld   (hl), a                                     ; $5317: $77
	jp   @popAFtwiceDone                               ; $5318: $c3 $3f $53

+
	ld   hl, $c088                                   ; $531b: $21 $88 $c0
	ld   a, (hl)                                     ; $531e: $7e
	cp   $0f                                         ; $531f: $fe $0f
	jr   c, @popAFtwiceDone                              ; $5321: $38 $1c

	ld   a, c                                        ; $5323: $79
	cp   $0f                                         ; $5324: $fe $0f
	jr   nc, @popAFtwiceDone                             ; $5326: $30 $17

	inc  bc                                          ; $5328: $03
	call func_3f41                                       ; $5329: $cd $41 $3f
	dec  bc                                          ; $532c: $0b
	jr   c, @popAFtwiceDone                              ; $532d: $38 $10

	ld   a, $00                                      ; $532f: $3e $00
	ld   hl, $c00d                                   ; $5331: $21 $0d $c0
	ld   (hl), a                                     ; $5334: $77
	pop  af                                          ; $5335: $f1
	call createFallingObject_retCifCant                               ; $5336: $cd $0c $4a
	jr   c, @popAFdone                              ; $5339: $38 $05

@unsetCFdone:
	pop  af                                          ; $533b: $f1
	scf                                              ; $533c: $37
	ccf                                              ; $533d: $3f
	ret                                              ; $533e: $c9

@popAFtwiceDone:
	pop  af                                          ; $533f: $f1

@popAFdone:
	pop  af                                          ; $5340: $f1

@done:
	ret                                              ; $5341: $c9


Call_001_5342:
	jp   nc, Jump_001_53d7                           ; $5342: $d2 $d7 $53

	push af                                          ; $5345: $f5
	push af                                          ; $5346: $f5
	cp   $19                                         ; $5347: $fe $19
	jp   c, Jump_001_53d5                            ; $5349: $da $d5 $53

	cp   $24                                         ; $534c: $fe $24
	jp   nc, Jump_001_53d5                           ; $534e: $d2 $d5 $53

	ld   hl, wArmorOfGodGotten                                   ; $5351: $21 $52 $c6
	ld   a, (hl)                                     ; $5354: $7e
	and  $01                                         ; $5355: $e6 $01
	jr   z, Jump_001_53d5                              ; $5357: $28 $7c

	ld   hl, $c082                                   ; $5359: $21 $82 $c0
	ld   a, (hl)                                     ; $535c: $7e
	cp   $03                                         ; $535d: $fe $03
	jr   nz, jr_001_539a                             ; $535f: $20 $39

	ld   hl, $c085                                   ; $5361: $21 $85 $c0
	ld   a, (hl)                                     ; $5364: $7e
	cp   $00                                         ; $5365: $fe $00
	jr   nz, jr_001_5378                             ; $5367: $20 $0f

	ld   a, $00                                      ; $5369: $3e $00
	ld   hl, $c089                                   ; $536b: $21 $89 $c0
	ld   (hl), a                                     ; $536e: $77
	ld   a, $01                                      ; $536f: $3e $01
	ld   hl, $c085                                   ; $5371: $21 $85 $c0
	ld   (hl), a                                     ; $5374: $77
	jp   Jump_001_53d5                               ; $5375: $c3 $d5 $53


jr_001_5378:
	ld   hl, $c089                                   ; $5378: $21 $89 $c0
	ld   a, (hl)                                     ; $537b: $7e
	cp   $0f                                         ; $537c: $fe $0f
	jr   c, Jump_001_53d5                              ; $537e: $38 $55

	dec  de                                          ; $5380: $1b
	bit  7, d                                        ; $5381: $cb $7a
	jr   nz, Jump_001_53d5                             ; $5383: $20 $50

	call func_3f41                                       ; $5385: $cd $41 $3f
	inc  de                                          ; $5388: $13
	jr   c, Jump_001_53d5                              ; $5389: $38 $4a

	ld   a, $03                                      ; $538b: $3e $03
	ld   hl, $c00d                                   ; $538d: $21 $0d $c0
	ld   (hl), a                                     ; $5390: $77
	pop  af                                          ; $5391: $f1
	call createFallingObject_retCifCant                               ; $5392: $cd $0c $4a
	jr   c, jr_001_53d6                              ; $5395: $38 $3f

	jp   Jump_001_53d1                               ; $5397: $c3 $d1 $53


jr_001_539a:
	ld   hl, $c086                                   ; $539a: $21 $86 $c0
	ld   a, (hl)                                     ; $539d: $7e
	cp   $00                                         ; $539e: $fe $00
	jr   nz, jr_001_53b1                             ; $53a0: $20 $0f

	ld   a, $00                                      ; $53a2: $3e $00
	ld   hl, $c08a                                   ; $53a4: $21 $8a $c0
	ld   (hl), a                                     ; $53a7: $77
	ld   a, $01                                      ; $53a8: $3e $01
	ld   hl, $c086                                   ; $53aa: $21 $86 $c0
	ld   (hl), a                                     ; $53ad: $77
	jp   Jump_001_53d5                               ; $53ae: $c3 $d5 $53


jr_001_53b1:
	ld   hl, $c08a                                   ; $53b1: $21 $8a $c0
	ld   a, (hl)                                     ; $53b4: $7e
	cp   $0f                                         ; $53b5: $fe $0f
	jr   c, Jump_001_53d5                              ; $53b7: $38 $1c

	inc  de                                          ; $53b9: $13
	ld   a, e                                        ; $53ba: $7b
	cp   $0b                                         ; $53bb: $fe $0b
	jr   z, Jump_001_53d5                              ; $53bd: $28 $16

	call func_3f41                                       ; $53bf: $cd $41 $3f
	dec  de                                          ; $53c2: $1b
	jr   c, Jump_001_53d5                              ; $53c3: $38 $10

	ld   a, $06                                      ; $53c5: $3e $06
	ld   hl, $c00d                                   ; $53c7: $21 $0d $c0
	ld   (hl), a                                     ; $53ca: $77
	pop  af                                          ; $53cb: $f1
	call createFallingObject_retCifCant                               ; $53cc: $cd $0c $4a
	jr   c, jr_001_53d6                              ; $53cf: $38 $05

Jump_001_53d1:
	pop  af                                          ; $53d1: $f1
	scf                                              ; $53d2: $37
	ccf                                              ; $53d3: $3f
	ret                                              ; $53d4: $c9

Jump_001_53d5:
	pop  af                                          ; $53d5: $f1

jr_001_53d6:
	pop  af                                          ; $53d6: $f1

Jump_001_53d7:
	ret                                              ; $53d7: $c9


Call_001_53d8:
	ld   hl, $c008                                   ; $53d8: $21 $08 $c0
	ld   c, (hl)                                     ; $53db: $4e
	ld   b, $00                                      ; $53dc: $06 $00
	ld   hl, $c009                                   ; $53de: $21 $09 $c0
	ld   e, (hl)                                     ; $53e1: $5e
	ld   d, $00                                      ; $53e2: $16 $00
	ld   a, $05                                      ; $53e4: $3e $05
	ld   hl, wPlayerOrEntityYCollisionAdjust                                   ; $53e6: $21 $4a $c0
	add  (hl)                                        ; $53e9: $86
	ld   hl, $c0a0                                   ; $53ea: $21 $a0 $c0
	ld   (hl), a                                     ; $53ed: $77
	ld   hl, $c007                                   ; $53ee: $21 $07 $c0
	ld   a, (hl)                                     ; $53f1: $7e
	ld   hl, $c0a0                                   ; $53f2: $21 $a0 $c0
	cp   (hl)                                        ; $53f5: $be
	jr   nc, jr_001_541f                             ; $53f6: $30 $27

	call getTileEntityOrPlayerIsOn                                       ; $53f8: $cd $ed $3f
	call Call_001_553b                               ; $53fb: $cd $3b $55
	call Call_001_52ab                               ; $53fe: $cd $ab $52
	jr   c, Jump_001_5463                              ; $5401: $38 $60

	ld   hl, $c007                                   ; $5403: $21 $07 $c0
	ld   a, (hl)                                     ; $5406: $7e
	ld   hl, wPlayerOrEntityYCollisionAdjust                                   ; $5407: $21 $4a $c0
	cp   (hl)                                        ; $540a: $be
	jr   c, Jump_001_545d                              ; $540b: $38 $50

	jr   z, Jump_001_545d                              ; $540d: $28 $4e

	inc  de                                          ; $540f: $13
	call getTileEntityOrPlayerIsOn                                       ; $5410: $cd $ed $3f
	call Call_001_553b                               ; $5413: $cd $3b $55
	jr   nc, Jump_001_545d                             ; $5416: $30 $45

	ld   hl, wPlayerY                                   ; $5418: $21 $54 $c0
	dec  (hl)                                        ; $541b: $35
	jp   Jump_001_545d                               ; $541c: $c3 $5d $54

jr_001_541f:
	cp   $0c                                         ; $541f: $fe $0c
	jr   c, jr_001_543f                              ; $5421: $38 $1c

	inc  de                                          ; $5423: $13
	call getTileEntityOrPlayerIsOn                                       ; $5424: $cd $ed $3f
	call Call_001_553b                               ; $5427: $cd $3b $55
	call Call_001_52ab                               ; $542a: $cd $ab $52
	jr   c, Jump_001_5463                              ; $542d: $38 $34

	dec  de                                          ; $542f: $1b
	call getTileEntityOrPlayerIsOn                                       ; $5430: $cd $ed $3f
	call Call_001_553b                               ; $5433: $cd $3b $55
	jr   nc, Jump_001_545d                             ; $5436: $30 $25

	ld   hl, wPlayerY                                   ; $5438: $21 $54 $c0
	inc  (hl)                                        ; $543b: $34
	jp   Jump_001_545d                               ; $543c: $c3 $5d $54

jr_001_543f:
	call getTileEntityOrPlayerIsOn                                       ; $543f: $cd $ed $3f
	call Call_001_553b                               ; $5442: $cd $3b $55
	jr   nc, jr_001_5451                             ; $5445: $30 $0a

	inc  de                                          ; $5447: $13
	call getTileEntityOrPlayerIsOn                                       ; $5448: $cd $ed $3f
	call Call_001_553b                               ; $544b: $cd $3b $55
	jp   Jump_001_5463                               ; $544e: $c3 $63 $54

jr_001_5451:
	inc  de                                          ; $5451: $13
	call getTileEntityOrPlayerIsOn                                       ; $5452: $cd $ed $3f
	call Call_001_553b                               ; $5455: $cd $3b $55
	call Call_001_52ab                               ; $5458: $cd $ab $52
	jr   c, Jump_001_5463                              ; $545b: $38 $06

Jump_001_545d:
	scf                                              ; $545d: $37
	ccf                                              ; $545e: $3f
	call Call_001_5465                               ; $545f: $cd $65 $54
	ret                                              ; $5462: $c9

Jump_001_5463:
	scf                                              ; $5463: $37
	ret                                              ; $5464: $c9


Call_001_5465:
	ld   hl, $c07e                                   ; $5465: $21 $7e $c0
	ld   a, (hl)                                     ; $5468: $7e
	cp   $00                                         ; $5469: $fe $00
	jr   z, jr_001_5485                              ; $546b: $28 $18

	ld   hl, $c008                                   ; $546d: $21 $08 $c0
	ld   c, (hl)                                     ; $5470: $4e
	ld   b, $00                                      ; $5471: $06 $00
	ld   hl, $c009                                   ; $5473: $21 $09 $c0
	ld   e, (hl)                                     ; $5476: $5e
	ld   d, $00                                      ; $5477: $16 $00
	call retZifBC_DEonTeleTile                                       ; $5479: $cd $b9 $39
	jr   nz, jr_001_5485                             ; $547c: $20 $07

	call Call_001_5488                               ; $547e: $cd $88 $54
	jr   z, jr_001_5485                              ; $5481: $28 $02

	scf                                              ; $5483: $37
	ret                                              ; $5484: $c9


jr_001_5485:
	scf                                              ; $5485: $37
	ccf                                              ; $5486: $3f
	ret                                              ; $5487: $c9


Call_001_5488:
	ld   hl, wRoomCurrTeleportIdx                                   ; $5488: $21 $b7 $c0
	ld   e, (hl)                                     ; $548b: $5e
	ld   d, $00                                      ; $548c: $16 $00
	ld   a, $00                                      ; $548e: $3e $00
	ld   a, e                                        ; $5490: $7b
	cp   $08                                         ; $5491: $fe $08
	jr   nc, jr_001_549a                             ; $5493: $30 $05

	ld   hl, bitTable                                   ; $5495: $21 $41 $07
	add  hl, de                                      ; $5498: $19
	ld   a, (hl)                                     ; $5499: $7e

jr_001_549a:
	ld   hl, $c07e                                   ; $549a: $21 $7e $c0
	and  (hl)                                        ; $549d: $a6
	ret                                              ; $549e: $c9


Call_001_549f:
	ld   hl, $c008                                   ; $549f: $21 $08 $c0
	ld   c, (hl)                                     ; $54a2: $4e
	ld   b, $00                                      ; $54a3: $06 $00
	ld   hl, $c009                                   ; $54a5: $21 $09 $c0
	ld   e, (hl)                                     ; $54a8: $5e
	ld   d, $00                                      ; $54a9: $16 $00
	ld   hl, $c006                                   ; $54ab: $21 $06 $c0
	ld   a, (hl)                                     ; $54ae: $7e
	cp   $05                                         ; $54af: $fe $05
	jr   nc, jr_001_54d6                             ; $54b1: $30 $23

	call getTileEntityOrPlayerIsOn                                       ; $54b3: $cd $ed $3f
	call Call_001_553b                               ; $54b6: $cd $3b $55
	call Call_001_5342                               ; $54b9: $cd $42 $53
	jr   c, Jump_001_551a                              ; $54bc: $38 $5c

	ld   hl, $c006                                   ; $54be: $21 $06 $c0
	ld   a, (hl)                                     ; $54c1: $7e
	cp   $00                                         ; $54c2: $fe $00
	jr   z, Jump_001_5514                              ; $54c4: $28 $4e

	inc  bc                                          ; $54c6: $03
	call getTileEntityOrPlayerIsOn                                       ; $54c7: $cd $ed $3f
	call Call_001_553b                               ; $54ca: $cd $3b $55
	jr   nc, Jump_001_5514                             ; $54cd: $30 $45

	ld   hl, wPlayerX                                   ; $54cf: $21 $52 $c0
	dec  (hl)                                        ; $54d2: $35
	jp   Jump_001_5514                               ; $54d3: $c3 $14 $55


jr_001_54d6:
	cp   $0c                                         ; $54d6: $fe $0c
	jr   c, jr_001_54f6                              ; $54d8: $38 $1c

	inc  bc                                          ; $54da: $03
	call getTileEntityOrPlayerIsOn                                       ; $54db: $cd $ed $3f
	call Call_001_553b                               ; $54de: $cd $3b $55
	call Call_001_5342                               ; $54e1: $cd $42 $53
	jr   c, Jump_001_551a                              ; $54e4: $38 $34

	dec  bc                                          ; $54e6: $0b
	call getTileEntityOrPlayerIsOn                                       ; $54e7: $cd $ed $3f
	call Call_001_553b                               ; $54ea: $cd $3b $55
	jr   nc, Jump_001_5514                             ; $54ed: $30 $25

	ld   hl, wPlayerX                                   ; $54ef: $21 $52 $c0
	inc  (hl)                                        ; $54f2: $34
	jp   Jump_001_5514                               ; $54f3: $c3 $14 $55


jr_001_54f6:
	call getTileEntityOrPlayerIsOn                                       ; $54f6: $cd $ed $3f
	call Call_001_553b                               ; $54f9: $cd $3b $55
	jr   nc, jr_001_5508                             ; $54fc: $30 $0a

	inc  bc                                          ; $54fe: $03
	call getTileEntityOrPlayerIsOn                                       ; $54ff: $cd $ed $3f
	call Call_001_553b                               ; $5502: $cd $3b $55
	jp   Jump_001_551a                               ; $5505: $c3 $1a $55


jr_001_5508:
	inc  bc                                          ; $5508: $03
	call getTileEntityOrPlayerIsOn                                       ; $5509: $cd $ed $3f
	call Call_001_553b                               ; $550c: $cd $3b $55
	call Call_001_5342                               ; $550f: $cd $42 $53
	jr   c, Jump_001_551a                              ; $5512: $38 $06

Jump_001_5514:
	scf                                              ; $5514: $37
	ccf                                              ; $5515: $3f
	call Call_001_5465                               ; $5516: $cd $65 $54
	ret                                              ; $5519: $c9

Jump_001_551a:
	scf                                              ; $551a: $37
	ret                                              ; $551b: $c9


splitCEintoItsNybbles:
// c high nybble in c008
	ld   a, c
	call aDivEqu16
	ld   hl, wChighNybble
	ld   (hl), a

// c low nybble in c006
	ld   a, c
	and  $0f
	ld   hl, wClowNybble
	ld   (hl), a

// e high nybble in c009
	ld   a, e
	call aDivEqu16
	ld   hl, wEhighNybble
	ld   (hl), a

// e low nybble in c007
	ld   a, e
	and  $0f
	ld   hl, wElowNybble
	ld   (hl), a
	ret


Call_001_553b:
	cp   $2d                                         ; $553b: $fe $2d
	jr   z, jr_001_554f                              ; $553d: $28 $10

	cp   $2e                                         ; $553f: $fe $2e
	jr   z, jr_001_555a                              ; $5541: $28 $17

	cp   $2c                                         ; $5543: $fe $2c
	jr   nc, jr_001_55a7                             ; $5545: $30 $60

	cp   $27                                         ; $5547: $fe $27
	jr   z, jr_001_5565                              ; $5549: $28 $1a

	cp   $19                                         ; $554b: $fe $19
	ccf                                              ; $554d: $3f
	ret                                              ; $554e: $c9

jr_001_554f:
	ld   hl, wIsEquippingRaft                                   ; $554f: $21 $4c $c0
	ld   a, (hl)                                     ; $5552: $7e
	cp   $00                                         ; $5553: $fe $00
	jr   z, jr_001_55a7                              ; $5555: $28 $50

	scf                                              ; $5557: $37
	ccf                                              ; $5558: $3f
	ret                                              ; $5559: $c9


jr_001_555a:
	ld   hl, wArmorOfGodGotten                                   ; $555a: $21 $52 $c6
	ld   a, (hl)                                     ; $555d: $7e
	and  $04                                         ; $555e: $e6 $04
	jr   z, jr_001_55a7                              ; $5560: $28 $45

	scf                                              ; $5562: $37
	ccf                                              ; $5563: $3f
	ret                                              ; $5564: $c9


jr_001_5565:
	push af                                          ; $5565: $f5
	ld   hl, $c0b2                                   ; $5566: $21 $b2 $c0
	ld   a, (hl)                                     ; $5569: $7e
	cp   $06                                         ; $556a: $fe $06
	jr   nc, jr_001_5588                             ; $556c: $30 $1a

	cp   $03                                         ; $556e: $fe $03
	jr   nc, jr_001_557d                             ; $5570: $30 $0b

	ld   hl, $c006                                   ; $5572: $21 $06 $c0
	ld   a, (hl)                                     ; $5575: $7e
	cp   $04                                         ; $5576: $fe $04
	jr   c, jr_001_55a6                              ; $5578: $38 $2c

	jp   Jump_001_55a2                               ; $557a: $c3 $a2 $55


jr_001_557d:
	ld   hl, $c007                                   ; $557d: $21 $07 $c0
	ld   a, (hl)                                     ; $5580: $7e
	cp   $0c                                         ; $5581: $fe $0c
	jr   nc, jr_001_55a6                             ; $5583: $30 $21

	jp   Jump_001_55a2                               ; $5585: $c3 $a2 $55


jr_001_5588:
	cp   $09                                         ; $5588: $fe $09
	jr   nc, jr_001_5597                             ; $558a: $30 $0b

	ld   hl, $c007                                   ; $558c: $21 $07 $c0
	ld   a, (hl)                                     ; $558f: $7e
	cp   $04                                         ; $5590: $fe $04
	jr   c, jr_001_55a6                              ; $5592: $38 $12

	jp   Jump_001_55a2                               ; $5594: $c3 $a2 $55


jr_001_5597:
	ld   hl, $c006                                   ; $5597: $21 $06 $c0
	ld   a, (hl)                                     ; $559a: $7e
	cp   $0c                                         ; $559b: $fe $0c
	jr   nc, jr_001_55a6                             ; $559d: $30 $07

	jp   Jump_001_55a2                               ; $559f: $c3 $a2 $55


Jump_001_55a2:
	pop  af                                          ; $55a2: $f1
	scf                                              ; $55a3: $37
	ccf                                              ; $55a4: $3f
	ret                                              ; $55a5: $c9


jr_001_55a6:
	pop  af                                          ; $55a6: $f1

jr_001_55a7:
	scf                                              ; $55a7: $37

_ret_55a8:
	ret                                              ; $55a8: $c9


checkRaftChanges_sendToOam:
	ld   hl, wIsUsingRaft
	ld   a, (hl)
	ld   hl, wPreviousUsingRaft
	ld   (hl), a

	ld   a, $00
	ld   hl, wIsUsingRaft
	ld   (hl), a
	ld   hl, wIsEquippingRaft
	ld   a, (hl)
	cp   $00
	jr   z, _ret_55a8

// equipping raft, coords slightly south of player
	ld   hl, wPlayerX
	ld   a, (hl)
	add  $08
	ld   c, a
	ld   b, $00

	ld   hl, wPlayerY
	ld   a, (hl)
	add  $0f
	ld   e, a
	ld   d, $00

	call splitCEintoItsNybbles
	ld   hl, wChighNybble
	ld   c, (hl)
	ld   b, $00

	ld   hl, wEhighNybble
	ld   e, (hl)
	ld   d, $00
	call getTileEntityOrPlayerIsOn
	cp   $2d
	jr   nz, +

// set using raft if current tile is $2d (water)
	ld   a, $ff
	ld   hl, wIsUsingRaft
	ld   (hl), a

+
	ld   hl, wIsUsingRaft
	ld   a, (hl)
	ld   hl, wPreviousUsingRaft
	xor  (hl)
	jr   z, copyRaftDataToOam

// play sound if entering or exiting water
	ld   de, sound_168e
	call playSoundEffectInDE_channel3or4

copyRaftDataToOam:
	ld   hl, wIsEquippingRaft
	ld   a, (hl)
	cp   $00
	jr   z, _ret_55a8

// equipping raft
	ld   a, $22
	call getLastUsableOamIdx_fromA
	call clear2spritesInOam_1stIdxedE

// tile idx
	ld   a, $b1
	call convertEntity2x2tileToTopLeftVramTile
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a
	add  $02
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a

// attr
	ld   hl, wOam+3
	add  hl, de
	ld   (hl), $00
	ld   hl, wOam+7
	add  hl, de
	ld   (hl), $00

	ld   hl, wIsUsingRaft
	ld   a, (hl)
	cp   $00
	jr   z, @notUsingRaft

// using raft
	ld   hl, wPlayerX
	ld   a, (hl)
	ld   hl, wSCXvalue
	sub  (hl)
	add  $08
	ld   hl, wOam+1
	add  hl, de
	ld   (hl), a
	add  $08
	ld   hl, wOam+5
	add  hl, de
	ld   (hl), a
	ld   hl, wPlayerY
	ld   a, (hl)
	add  $10
	add  $08
	ld   hl, wSCYvalue
	sub  (hl)
	ld   hl, wOam
	add  hl, de
	ld   (hl), a
	ld   hl, wOam+4
	add  hl, de
	ld   (hl), a
	ret

@notUsingRaft:
// offsets, etc for holding raft
	ld   hl, wPlayerOamAttr
	ld   a, (hl)
	and  $20
	jr   z, @facingRight

// facing left
	ld   hl, wPlayerX
	ld   a, (hl)
	ld   hl, wSCXvalue
	sub  (hl)
	add  $08
	sub  $0a
	jr   nc, @sendTo_wOam

	ld   a, $00
	ld   hl, wOam+1
	add  hl, de
	ld   (hl), a
	jp   @sendTo_wOam

@facingRight:
	ld   hl, wPlayerX
	ld   a, (hl)
	ld   hl, wSCXvalue
	sub  (hl)
	add  $12

@sendTo_wOam:
	ld   hl, wOam+1
	add  hl, de
	ld   (hl), a
	add  $08
	ld   hl, wOam+5
	add  hl, de
	ld   (hl), a
	ld   hl, wPlayerY
	ld   a, (hl)
	add  $10
	ld   hl, wSCYvalue
	sub  (hl)
	ld   hl, wOam
	add  hl, de
	ld   (hl), a
	ld   hl, wOam+4
	add  hl, de
	ld   (hl), a
	ret


copyPlayerDataOnto_wOam:
	ld   a, $00
	call getLastUsableOamIdx_fromA
	ld   e, a
	ld   d, $00
	ld   hl, wIsPlatformingLikeRoom
	ld   a, (hl)
	cp   $00
	jr   z, @notPlatforming_orGoingLeftRight

// is platforming-looking room, use base tile 4c (ladder climbing)
	ld   c, $4c
	ld   hl, wPlayerIdxIntoGenericVramForTile
	ld   a, (hl)
	cp   $40|DIR_UP
	jr   z, @notUsingRaftOr_platformingLadderAnimation

	cp   $40|DIR_DOWN
	jr   z, @notUsingRaftOr_platformingLadderAnimation

@notPlatforming_orGoingLeftRight:
// eg uses non-platforming sprites
	ld   hl, wPlayerIdxIntoGenericVramForTile
	ld   c, (hl)

// use c056 as offset into generic vram tile idxes if using raft
// ie dont animate
	ld   hl, wIsUsingRaft
	ld   a, (hl)
	cp   $00
	jr   nz, @after_getting_genericVramTileIdxes_offset

@notUsingRaftOr_platformingLadderAnimation:
	ld   hl, wPlayerAnimationIdx
	ld   a, (hl)
	add  c
	ld   c, a

@after_getting_genericVramTileIdxes_offset:
	ld   hl, wPlayerOamAttr
	ld   a, (hl)
	and  $20
	jr   nz, @facingLeft

	ld   hl, genericVramTileIdxes
	ld   b, $00
	add  hl, bc
	ld   a, (hl)
	call convertEntity2x2tileToTopLeftVramTile

	bit  0, a
	jr   nz, @reversedOamTiles

@regularOamTiles:
	and  $fe
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a
	add  $02
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a
	jp   @afterSettingOamTiles

@facingLeft:
	ld   hl, genericVramTileIdxes
	ld   b, $00
	add  hl, bc
	ld   a, (hl)
	call convertEntity2x2tileToTopLeftVramTile

	bit  0, a
	jr   nz, @regularOamTiles

@reversedOamTiles:
	and  $fe
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a
	add  $02
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a

@afterSettingOamTiles:
// if invincible, flip to obp1 (flashing)
	ld   hl, wPlayerInvincibilityCounter
	ld   a, (hl)
	cp   $00
	jr   z, +

	ld   a, $10

+
	ld   hl, wPlayerOamAttr
	or   (hl)

// if bit 0 set, reflip/tiles to look proper
	ld   hl, wNpcTopLeftVramTile
	bit  0, (hl)
	jr   z, +

	xor  $20

+
	ld   hl, wOam+3
	add  hl, de
	ld   (hl), a
	ld   hl, wOam+7
	add  hl, de
	ld   (hl), a

// player y
// if 0 y scroll, simply set from y
	ld   hl, wSCYvalue                                   ; $573e: $21 $11 $cb
	ld   a, (hl)                                     ; $5741: $7e
	or   a                                           ; $5742: $b7
	jr   z, jr_001_5760                              ; $5743: $28 $1b

// jump if player y above y scroll
	ld   hl, wPlayerY                                   ; $5745: $21 $54 $c0
	ld   a, (hl)                                     ; $5748: $7e
	ld   hl, wSCYvalue                                   ; $5749: $21 $11 $cb
	sub  (hl)                                        ; $574c: $96
	jr   nc, jr_001_5753                             ; $574d: $30 $04

// set y scroll to be 0, if below y scroll
	ld   a, $00                                      ; $574f: $3e $00
	jr   jr_001_5773                                 ; $5751: $18 $20

jr_001_5753:
// jump if distance between player y and scroll y is >= 28
	sub  $28                                         ; $5753: $d6 $28
	jr   nc, jr_001_5760                             ; $5755: $30 $09

// far below y scroll
	add  (hl)                                        ; $5757: $86
	bit  7, a                                        ; $5758: $cb $7f
	jr   z, jr_001_5773                              ; $575a: $28 $17

	ld   a, $00                                      ; $575c: $3e $00
	jr   jr_001_5773                                 ; $575e: $18 $13

jr_001_5760:
	ld   hl, wPlayerY                                   ; $5760: $21 $54 $c0
	ld   a, (hl)                                     ; $5763: $7e
	ld   hl, wSCYvalue                                   ; $5764: $21 $11 $cb
	sub  (hl)                                        ; $5767: $96
	sub  $59                                         ; $5768: $d6 $59
	jr   c, jr_001_5774                              ; $576a: $38 $08

	add  (hl)                                        ; $576c: $86
	cp   $20                                         ; $576d: $fe $20
	jr   c, jr_001_5773                              ; $576f: $38 $02

	ld   a, $20                                      ; $5771: $3e $20

jr_001_5773:
	ld   (hl), a                                     ; $5773: $77

jr_001_5774:
	ld   hl, $c05e                                   ; $5774: $21 $5e $c0
	ld   a, (hl)                                     ; $5777: $7e
	cp   $00                                         ; $5778: $fe $00
	jr   z, jr_001_5780                              ; $577a: $28 $04

	ld   a, $00                                      ; $577c: $3e $00
	jr   jr_001_578a                                 ; $577e: $18 $0a

jr_001_5780:
	ld   hl, wPlayerY                                   ; $5780: $21 $54 $c0
	ld   a, (hl)                                     ; $5783: $7e
	ld   hl, wSCYvalue                                   ; $5784: $21 $11 $cb
	sub  (hl)                                        ; $5787: $96
	add  $10                                         ; $5788: $c6 $10

jr_001_578a:
	ld   hl, wOam                                   ; $578a: $21 $00 $c2
	add  hl, de                                      ; $578d: $19
	ld   (hl), a                                     ; $578e: $77
	ld   hl, wOam+4                                   ; $578f: $21 $04 $c2
	add  hl, de                                      ; $5792: $19
	ld   (hl), a                                     ; $5793: $77
	ld   hl, wPlayerX                                   ; $5794: $21 $52 $c0
	ld   a, (hl)                                     ; $5797: $7e

Jump_001_5798:
	ld   hl, wSCXvalue                                   ; $5798: $21 $10 $cb
	sub  (hl)                                        ; $579b: $96
	jr   nc, jr_001_57a2                             ; $579c: $30 $04

	ld   a, $00                                      ; $579e: $3e $00
	jr   jr_001_57c2                                 ; $57a0: $18 $20

jr_001_57a2:
	sub  $28                                         ; $57a2: $d6 $28
	jr   nc, jr_001_57af                             ; $57a4: $30 $09

	add  (hl)                                        ; $57a6: $86
	bit  7, a                                        ; $57a7: $cb $7f
	jr   z, jr_001_57c2                              ; $57a9: $28 $17

	ld   a, $00                                      ; $57ab: $3e $00
	jr   jr_001_57c2                                 ; $57ad: $18 $13

jr_001_57af:
	ld   hl, wPlayerX                                   ; $57af: $21 $52 $c0
	ld   a, (hl)                                     ; $57b2: $7e
	ld   hl, wSCXvalue                                   ; $57b3: $21 $10 $cb
	sub  (hl)                                        ; $57b6: $96
	sub  $69                                         ; $57b7: $d6 $69
	jr   c, jr_001_57c3                              ; $57b9: $38 $08

	add  (hl)                                        ; $57bb: $86
	cp   $60                                         ; $57bc: $fe $60
	jr   c, jr_001_57c2                              ; $57be: $38 $02

	ld   a, $60                                      ; $57c0: $3e $60

jr_001_57c2:
	ld   (hl), a                                     ; $57c2: $77

jr_001_57c3:
// de = offset to the 4-byte attribute for player's details

// store player's current position in wOam
	ld   hl, wPlayerX                                   ; $57c3: $21 $52 $c0
	ld   a, (hl)                                     ; $57c6: $7e
	ld   hl, wSCXvalue                                   ; $57c7: $21 $10 $cb
	sub  (hl)                                        ; $57ca: $96
	add  $08                                         ; $57cb: $c6 $08
	ld   hl, wOam+1                                   ; $57cd: $21 $01 $c2
	add  hl, de                                      ; $57d0: $19
	ld   (hl), a                                     ; $57d1: $77
	add  $08                                         ; $57d2: $c6 $08
	ld   hl, wOam+5                                   ; $57d4: $21 $05 $c2
	add  hl, de                                      ; $57d7: $19
	ld   (hl), a                                     ; $57d8: $77

// if player health 1, every few main loops, remove from oam (flash)
	ld   hl, wPlayerHealth
	ld   a, (hl)
	cp   $01
	jr   nz, @done

	ld   hl, wMainLoopCounter
	bit  4, (hl)
	jr   nz, @done

	ld   a, $00
	call getLastUsableOamIdx_fromA
	call clear2spritesInOam_1stIdxedE

@done:
	ret


getLastUsableOamIdx_fromA:
	ld   hl, wNextUsableOamIdx
	add  (hl)
	cp   $28
	jr   c, +

	sub  $28

+
// loop and use $00, etc
	sla  a
	sla  a
	ret


clear2spritesInOam_1stIdxedE:
	ld   e, a
	ld   d, $00
	ld   hl, wOam
	add  hl, de
	ld   (hl), $00
	ld   hl, wOam+4
	add  hl, de
	ld   (hl), $00
	ret


clearWoamOffsetE:
	ld   e, a
	ld   d, $00
	ld   hl, wOam
	add  hl, de
	ld   (hl), $00
	ret


processAllTeleports:
// teleport idx to 0, we inc it in below loop
	ld   a, $00
	ld   hl, wRoomCurrTeleportIdx
	ld   (hl), a

-
	call processTeleportsRetZwhenDone
	jr   nz, -

	ret


processTeleportsRetZwhenDone:
	call setTeleportDetails_retZifNotPossible
	jr   z, @done

// curr teleports x, y in bc
	ld   hl, wCurrTeleportsTileX
	ld   c, (hl)
	ld   b, $00
	ld   hl, wCurrTeleportsTileY
	ld   e, (hl)
	ld   d, $00

// water
	call getTileEntityOrPlayerIsOn
	cp   $2d
	jr   z, @isWaterOrNothing

// nothing
	cp   $00
	jr   nz, @toNextTeleIdx

// dont allow teletiles on obstacles, etc
@isWaterOrNothing:
	ld   hl, wCurrTeleportsTileTrigger                                   ; $5842: $21 $ba $c0
	ld   a, (hl)                                     ; $5845: $7e
	ld   hl, $c028                                   ; $5846: $21 $28 $c0
	ld   (hl), a                                     ; $5849: $77

	ld   a, $01                                      ; $584a: $3e $01
	call replaceTileHere                               ; $584c: $cd $f4 $58

@toNextTeleIdx:
	ld   hl, wRoomCurrTeleportIdx
	inc  (hl)

@done:
	ret


teleport7byteIndexes:
.rept 24 index count
	.db count*7
.endr

setTeleportDetails_retZifNotPossible:
// c0a1 is bank
	ld   hl, wTileLayoutDataBank
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncBank
	ld   (hl), a

// c0b7 is idx of entrance we are setting ourself at
	ld   hl, wRoomCurrTeleportIdx
	ld   e, (hl)
	ld   d, $00
	ld   hl, teleport7byteIndexes
	add  hl, de

// source of bytes is $c0b6/5 + value in 5854
	ld   a, (hl)
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr
	add  (hl)
	ld   hl, wCommonByteCopyFuncSrc
	ld   (hl), a

// next byte
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr+1
	ld   a, (hl)
	adc  $00
	ld   hl, wCommonByteCopyFuncSrc+1
	ld   (hl), a

// copy 7 bytes
	ld   hl, wCommonByteCopyFuncNumBytes
	ld   (hl), $07
	call copyBytesFromAnotherBankInto_c6d0

// nybbles of x and y (2x2 tile)
	ld   hl, wCommonByteCopyDestBytes
	ld   a, (hl)
	ld   hl, wCurrTeleportsTileX
	ld   (hl), a

	cp   $ff
	jr   z, @end

// x in c0b8
	call aDivEqu16
	ld   (hl), a

// y in c0b9
	ld   hl, wCommonByteCopyDestBytes
	ld   a, (hl)
	and  $0f
	ld   hl, wCurrTeleportsTileY
	ld   (hl), a

// tile to trigger teleport in c0ba
	ld   hl, wCommonByteCopyDestBytes+1
	ld   a, (hl)
	ld   hl, wCurrTeleportsTileTrigger
	ld   (hl), a

// group, room x,y, player x, y
	ld   hl, wCommonByteCopyDestBytes+2
	ld   a, (hl)
	ld   hl, wScriptTeleGroup
	ld   (hl), a

	ld   hl, wCommonByteCopyDestBytes+3
	ld   a, (hl)
	ld   hl, wScriptTeleRoomX
	ld   (hl), a

	ld   hl, wCommonByteCopyDestBytes+4
	ld   a, (hl)
	ld   hl, wScriptTeleRoomY
	ld   (hl), a

	ld   hl, wCommonByteCopyDestBytes+5
	ld   a, (hl)
	ld   hl, wScriptTelePlayerX
	ld   (hl), a

	ld   hl, wCommonByteCopyDestBytes+6
	ld   a, (hl)
	ld   hl, wScriptTelePlayerY
	ld   (hl), a

@end:
	ld   hl, wCurrTeleportsTileX
	ld   a, (hl)
	cp   $ff
	ret


replaceRoomFlagItemTile:
// get base room floor tile to place here
	ld   hl, wBaseRoomFloorTile
	ld   a, (hl)
	ld   hl, wGenericVramCopyTileIdx
	ld   (hl), a

	ld   a, $00

replaceTileHere:
	push af

// coords bytes in c01e byte
	ld   hl, wGenericTile2x2_x
	ld   (hl), c
	ld   hl, wGenericTile2x2_y
	ld   (hl), e
	call store16ePlusCin_c01e

// check orig a
	cp   $fd                                         ; $5900: $fe $fd
	jr   nz, @notFD                             ; $5902: $20 $1b

// fd
	call getHiddenItemAtBC_DE                                       ; $5904: $cd $71 $39
	cp   $00                                         ; $5907: $fe $00
	jr   z, @nextForNonFF                              ; $5909: $28 $7b

// item on tele tile, or hidden item here
	call Call_001_59a1                               ; $590b: $cd $a1 $59
	cp   $01                                         ; $590e: $fe $01
	jr   nz, @nextForNonFF                             ; $5910: $20 $74

// item on tele tile, copy tele tile here instead
	push af                                          ; $5912: $f5
	ld   hl, wCurrTeleportsTileTrigger                                   ; $5913: $21 $ba $c0
	ld   a, (hl)                                     ; $5916: $7e
	ld   hl, wGenericVramCopyTileIdx                                   ; $5917: $21 $28 $c0
	ld   (hl), a                                     ; $591a: $77
	pop  af                                          ; $591b: $f1
	jp   @nextForNonFF                               ; $591c: $c3 $86 $59

@notFD:
	cp   $00                                         ; $591f: $fe $00
	jr   nz, @notFDor0                             ; $5921: $20 $18

// orig A = 0 (eg replacing room flag tile)
	call getHiddenItemAtBC_DE                                       ; $5923: $cd $71 $39
	cp   $00                                         ; $5926: $fe $00
	jr   z, @notFDor0                              ; $5928: $28 $11

// item on tele tile, or hidden item here
	call Call_001_59a1                               ; $592a: $cd $a1 $59
	cp   $01                                         ; $592d: $fe $01
	jr   nz, @notFDor0                             ; $592f: $20 $0a

// item on tele tile
	push af                                          ; $5931: $f5
	ld   hl, wCurrTeleportsTileTrigger                                   ; $5932: $21 $ba $c0
	ld   a, (hl)                                     ; $5935: $7e
	ld   hl, wGenericVramCopyTileIdx                                   ; $5936: $21 $28 $c0
	ld   (hl), a                                     ; $5939: $77
	pop  af                                          ; $593a: $f1

@notFDor0:
	cp   $fe                                         ; $593b: $fe $fe
	jr   nz, @notFD_FEor0                             ; $593d: $20 $08

// fe
	ld   a, $17                                      ; $593f: $3e $17
	call getTileIdxForGenericVramCopy                                       ; $5941: $cd $fc $08
	jp   @nextForNonFF                               ; $5944: $c3 $86 $59

@notFD_FEor0
	cp   $ff                                         ; $5947: $fe $ff
	jr   nz, @notFDtoFFor0                             ; $5949: $20 $1f

// ff

// x and y, get tile there, and copy to vram
	ld   hl, wECbyte                                   ; $594b: $21 $1e $c0
	ld   e, (hl)                                     ; $594e: $5e
	ld   d, $00                                      ; $594f: $16 $00

	ld   hl, w2x2gameScreenTiles                                   ; $5951: $21 $b0 $c3
	add  hl, de                                      ; $5954: $19
	ld   a, (hl)                                     ; $5955: $7e
	ld   hl, wGenericVramCopyTileIdx                                   ; $5956: $21 $28 $c0
	ld   (hl), a                                     ; $5959: $77

	ld   de, $0000                                   ; $595a: $11 $00 $00
	ld   hl, $c00a                                   ; $595d: $21 $0a $c0
	ldi  a, (hl)                                     ; $5960: $2a
	ld   h, (hl)                                     ; $5961: $66
	ld   l, a                                        ; $5962: $6f
	add  hl, de                                      ; $5963: $19
	ld   a, (hl)                                     ; $5964: $7e
	and  $7f                                         ; $5965: $e6 $7f
	jp   @copyToVramCopy                               ; $5967: $c3 $90 $59

@notFDtoFFor0:
	push af                                          ; $596a: $f5
	ld   hl, $c00a                                   ; $596b: $21 $0a $c0
	ldi  a, (hl)                                     ; $596e: $2a
	ld   h, (hl)                                     ; $596f: $66
	ld   l, a                                        ; $5970: $6f
	pop  af                                          ; $5971: $f1

	ld   (hl), a                                     ; $5972: $77
	push af                                          ; $5973: $f5

// x and y, get tile there and copy to vram later
	ld   hl, wECbyte                                   ; $5974: $21 $1e $c0
	ld   e, (hl)                                     ; $5977: $5e
	ld   d, $00                                      ; $5978: $16 $00

	ld   hl, wGenericVramCopyTileIdx                                   ; $597a: $21 $28 $c0
	ld   a, (hl)                                     ; $597d: $7e
	ld   hl, w2x2gameScreenTiles                                   ; $597e: $21 $b0 $c3
	add  hl, de                                      ; $5981: $19
	ld   (hl), a                                     ; $5982: $77

	pop  af                                          ; $5983: $f1
	and  $7f                                         ; $5984: $e6 $7f

@nextForNonFF:
	cp   $0c                                         ; $5986: $fe $0c
	jr   nz, @copyToVramCopy                             ; $5988: $20 $06

// c
	ld   a, $00                                      ; $598a: $3e $00
	ld   hl, wGenericVramCopyTileIdx                                   ; $598c: $21 $28 $c0
	ld   (hl), a                                     ; $598f: $77

@copyToVramCopy:
	call copy_c028_tileDetailsToGenericVramCopy

// restore bc, de
	ld   hl, wGenericTile2x2_x
	ld   c, (hl)
	ld   b, $00
	ld   hl, wGenericTile2x2_y
	ld   e, (hl)
	ld   d, $00
	pop  af
	ret


Call_001_59a1:
	push af                                          ; $59a1: $f5

// when checking player collision, this is the x
	ld   hl, wGenericTile2x2_x                                   ; $59a2: $21 $0c $c0
	ld   a, (hl)                                     ; $59a5: $7e
	ld   hl, $c6c9                                   ; $59a6: $21 $c9 $c6
	ld   (hl), a                                     ; $59a9: $77

// this is y
	ld   hl, wGenericTile2x2_y                                   ; $59aa: $21 $0d $c0
	ld   a, (hl)                                     ; $59ad: $7e
	ld   hl, $c6ca                                   ; $59ae: $21 $ca $c6
	ld   (hl), a                                     ; $59b1: $77

// this is a timer
	ld   a, $20                                      ; $59b2: $3e $20
	ld   hl, $c6c8                                   ; $59b4: $21 $c8 $c6
	ld   (hl), a                                     ; $59b7: $77

	pop  af                                          ; $59b8: $f1
	ret                                              ; $59b9: $c9


copy_c028_tileDetailsToGenericVramCopy:
	call copy18_2x2tilesIfLastIdxLaggingBehindBy1group
	call getSrcDestOfBottomTilesGenericVramCopyFrom_c028

// this hl is dest for 2 bottom tiles
// this bc is the 2 bottom tile idxes
	push hl
	push bc

// offset to get the top 2 tiles dest and tile idxes
	ld   de, -$20
	add  hl, de

// this hl is dest to copy to
	push hl
	dec  c
	dec  b

// this bc is 2 tile indexes
	push bc
	ld   hl, wGenericVramCopyLastIdx
	ld   e, (hl)
	ld   d, $00
	ld   hl, wGenericVramCopyData
	add  hl, de
	pop  bc

	pop  de

// eg copies details for where to place bomb during vblank
// de is dest, bc is 2 tiles
	ld   (hl), e
	inc  hl
	ld   (hl), d
	inc  hl
	ld   (hl), c
	inc  hl
	ld   (hl), b
	inc  hl
	pop  bc
	pop  de

// de is dest for bottom 2 tiles, bc are those 2 tiles
	ld   (hl), e
	inc  hl
	ld   (hl), d
	inc  hl
	ld   (hl), c
	inc  hl
	ld   (hl), b
	inc  hl

// update last idx to cover this 2x2 tile
	ld   hl, wGenericVramCopyLastIdx
	ld   a, (hl)
	add  $08
	ld   (hl), a
	ret


// todo: is this condition ever met?
copy18_2x2tilesIfLastIdxLaggingBehindBy1group:
	ld   hl, wGenericVramCopyLastIdx
	ld   a, (hl)
	add  $08
	ld   hl, wGenericVramCopyOffset
	cp   (hl)
	jr   nz, @done

	call waitUntilStartOfVBlankPeriod
	call genericVramCopyUpTo6_2x2tiles
	call genericVramCopyUpTo6_2x2tiles
	call genericVramCopyUpTo6_2x2tiles

@done:
	ret


getSrcDestOfBottomTilesGenericVramCopyFrom_c028:
// place c028 tile at c00c/d
	ld   de, $9820
	call dPlusEquValIn_c6de

// c00d as high byte in bc, bc // 4
// ie y idx *= $40 cause 2x2 tiles
	ld   hl, wGenericTile2x2_y
	ld   b, (hl)
	ld   c, $00
	srl  b
	rr   c
	srl  b
	rr   c

// c00c as a, a * 2, as 2 tile-wide
	ld   hl, wGenericTile2x2_x
	ld   a, (hl)
	sla  a

// hl equals vram offset of bottom tile
	push de
	pop  hl

// add adjusted c00d, then add doubled c00c
	add  hl, bc
	add  l
	ld   l, a
	ld   a, h
	adc  $00
	ld   h, a

// get actual vram tile values
	ld   de, wGenericVramCopyTileIdx
	ld   a, (de)
	call converTileIdxToBGvramTileValue
	and  $fc
	ld   c, a
// bottom tiles are 2nd and 4th
	inc  c
	add  $03
	ld   b, a
	ret


genericVramCopyUpTo6_2x2tiles:
	ld   hl, wGenericVramCopyLastIdx
	ld   a, (hl)
	ld   hl, wGenericVramCopyOffset
	sub  (hl)
	jr   nz, +

	ret

+
// a = number of tiles left to copy
// divide by 8 since there are 8 bytes per tile copy
	srl  a
	srl  a
	srl  a
	cp   $07
	jr   c, +

	ld   a, $06

+
// c = 0 to 6 (number of 2x2 tiles to copy)
	ld   c, a

// cefe has offset into cf00 block to copy data onto vram
	ld   hl, wGenericVramCopyOffset
	ld   e, (hl)
	ld   d, $00
	ld   hl, wGenericVramCopyData
	add  hl, de

@loop:
// eg copies bomb onto vram
// hl contains de, src to put bombs
	ld   e, (hl)
	inc  hl
	ld   d, (hl)
	inc  hl

// eg copy top 2 tiles of bomb
	ldi  a, (hl)
	ld   (de), a
	inc  de
	ldi  a, (hl)
	ld   (de), a

// hl contains de, src to put bombs
	ld   e, (hl)
	inc  hl
	ld   d, (hl)
	inc  hl

// copy bottom 2 tiles of bomb
	ldi  a, (hl)
	ld   (de), a
	inc  de
	ldi  a, (hl)
	ld   (de), a

// if l is 0, dec h
	ld   a, l
	cp   $00
	jr   nz, +

	dec  h

+
	dec  c
	jr   nz, @loop

// c tiles copied, update next copy offset
	ld   a, l
	ld   hl, wGenericVramCopyOffset
	ld   (hl), a
	ret


npcHelper_increaseScore:
// de is param of script command calling this
	ld   bc, wPlayerScoreLastDigit
	ld   hl, increaseScoreAdditions
	add  hl, de
	call @scoreDigitInBCplusEquValInHL
	dec  hl
	call @scoreDigitInBCplusEquValInHL
	dec  hl
	call @scoreDigitInBCplusEquValInHL
	dec  hl
	call @scoreDigitInBCplusEquValInHL
	ld   hl, increaseScore0bytes
	call @scoreDigitInBCplusEquValInHL
	call @scoreDigitInBCplusEquValInHL
	ld   a, (bc)
	cp   $0a
	jr   c, @done

// max score
	ld   hl, wPlayerScore
	ld   a, $09
	ld   de, $0007
	call setAtoHL_deBytes

@done:
	ret

@scoreDigitInBCplusEquValInHL:
// val in bc += val in hl
	ld   a, (bc)
	add  (hl)
	ld   (bc), a
	cp   10
	jr   c, +

// if >= 10, inc the val in bc-1
	sub  10
	ld   (bc), a
	dec  bc
	ld   a, (bc)
	inc  a
	ld   (bc), a
	ret

+
	dec  bc
	ret


drawGameOverScreenScore:
	ld   de, $988c
	call dPlusEquScreen0displayOffset

// c006 is idx of current score digit
	ld   bc, $0000
	ld   hl, wNumGameOverScoreDigitsDrawn
	ld   (hl), b

@nextDigit:
	ld   hl, wPlayerScore
	add  hl, bc
	ld   a, (hl)
	push af

// draw digit if number isn't 0
	cp   $00
	jr   nz, @drawDigit

// draw digit if the last digit
	ld   a, c
	cp   $06
	jr   z, @drawDigit

// draw digit if 0, if other digits have been drawn
	ld   hl, wNumGameOverScoreDigitsDrawn
	ld   a, (hl)
	cp   $00
	jr   nz, @drawDigit

	pop  af
	jr   @toNextDigit

@drawDigit:
	pop  af
	ld   hl, wNumGameOverScoreDigitsDrawn
	inc  (hl)
	add  $30
	ld   (de), a
	inc  de

@toNextDigit:
	inc  bc
	ld   a, c
	cp   $07
	jr   nz, @nextDigit

	ret


// unused - 5af6
drawBCDNumsPlus1NoLeading0s:
	add  $01

drawBCDNumsNoLeading0s:
// value in a / 100, put in c
	ld   c, a
	ld   b, $00
	ld   a, 100
	call bcDivA_divInC_modInAB
	ld   hl, wCurrMusicTestDigit
	ld   (hl), c

// draw if non-zero
	ld   a, c
	cp   $00
	jr   z, +

	call @drawDigit

+
// mod val / 10, put in c
	ld   a, b
	ld   c, a
	ld   b, $00
	ld   a, 10
	call bcDivA_divInC_modInAB
	ld   a, c
	ld   hl, wCurrMusicTestDigit
// draw tens, if non-zero or hundreds drawn
	or   (hl)
	jr   z, +

	ld   a, c
	call @drawDigit

+
// draw digit always
	ld   a, b

@drawDigit:
	add  $30
	ld   (de), a
	inc  de
	ret


hlContainsScreenOffsetAndDataToCopyToScreen:
	ld   e, (hl)
	inc  hl
	ld   a, (hl)
	add  >$9800
	ld   d, a
	inc  hl
	call dPlusEquScreen0displayOffset

-
	ldi  a, (hl)
	cp   $ff
	jr   z, @done

	ld   (de), a
	inc  de
	jp   -

@done:
	ret


pollInput:
	ld   hl, wKeysPressed
	ld   e, (hl)
	call pollInputHW
	ld   hl, wKeysPressed
	ld   (hl), a
	push af
	xor  e
	ld   hl, wNewKeysPressed
	ld   (hl), a
	pop  af
	cp   PADF_START|PADF_SELECT|PADF_B|PADF_A
	jp   z, reset

	or   a
	ret


pollInputHW:
	call _getP1_20hportValue
	call _getP1_10hportValue
	or   b
	cpl
	ret


_getP1_20hportValue:
	ld   a, $20
	call _getP1portValue
	ld   b, a
	sla  b
	sla  b
	sla  b
	sla  b
	ret


_getP1_10hportValue:
	ld   a, $10

_getP1portValue:
	ld   hl, rP1
	ld   (hl), a
	nop
	nop
	nop
	nop
	ld   a, $0f
	and  (hl)
	ret

.include "garbage/b0_5b7a.s"

// Unused?
clearScreen1:
	ld   de, $9800
	call dPlusEquScreen1displayOffset
	jp   +


clearScreen0:
	ld   de, $9800
	call dPlusEquScreen0displayOffset

+
	push de
	pop  hl
	ld   de, $0400
	ld   a, $00
	jp   setAtoHL_deBytes


clear_c200_to_c2ff:
	ld   hl, wOam
	ld   de, $0100
	ld   a, $00
	jp   setAtoHL_deBytes

.include "code/tileAnimations.s"

jpHLinBank1:
	ld   c, $01
	jp   callHLinBankC


jpHLinBank4:
	ld   c, $04
	jp   callHLinBankC


aIsMax3fh:
	cp   $40
	jr   c, +
	ld   a, $3f
+
	ret


// the following 2 funcs unused
aEqu2APlus10:
	sla  a
	add  $0a
	ret

aEqu2APlus11:
	call aEqu2APlus10
	add  $01
	ret
