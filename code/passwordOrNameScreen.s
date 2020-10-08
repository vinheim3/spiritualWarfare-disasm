nameOrPwCursorYvals:
	.db $24 $24 $24 $24 $24 $24 $24 $24 $24 $24
	.db $34 $34 $34 $34 $34 $34 $34 $34 $34 $34
	.db $44 $44 $44 $44 $44 $44 $44 $44 $44 $44
	.db $54 $54 $54 $54 $54 $54 $54 $54 $54 $54
	.db $64 $64 $64 $64 $64 $64 $64 $64 $64 $64
	.db $74 $74 $74 $74 $74 $74 $74 $74 $74 $74
	.db $84 $84 $84 $84 $84 $84 $84 $84


nameOrPwCursorXvals:
	.db $0c $1c $2c $3c $4c $5c $6c $7c $8c $9c
	.db $0c $1c $2c $3c $4c $5c $6c $7c $8c $9c
	.db $0c $1c $2c $3c $4c $5c $6c $7c $8c $9c
	.db $0c $1c $2c $3c $4c $5c $6c $7c $8c $9c
	.db $0c $1c $2c $3c $4c $5c $6c $7c $8c $9c
	.db $0c $1c $2c $3c $4c $5c $6c $7c $8c $9c
	.db $0c $1c $2c $3c     $5c     $7c $8c $9c


text_passwordOrNameChars:
	.asc "0123456789"
	.asc "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.asc "abcdefghijklmnopqrstuvwxyz"
	.asc "!."

text_name:
	.asc "NAME"
	.db $00 $00 $00 $00

// ret nz if exiting to title screen (not possible?)
enterPasswordScreen:
	ld   a, $20
	ld   hl, wPasswordOrNameMaxChars
	ld   (hl), a
	call nameOrPasswordInputCheck

@loop:
	call retZifPassCorrect
	jr   z, @correctPass

	call playSoundEffect29h
	call turnOffLCDstartOfVBlank
	call clear_c200_to_c2ff
	call copyA0hDataToOam

	ld   hl, text_badPassword
	call hlContainsScreenOffsetAndDataToCopyToScreen

	ld   hl, text_blankRow
	call hlContainsScreenOffsetAndDataToCopyToScreen

	ld   a, $01
	call setLCDfromValue_c015equA

	ld   e, $b4
	call processInputInMenus
	call _passwordInputCheck
	jp   @loop

@correctPass:
	call playSoundEffect12h
	xor  a
	ret


nameOrPasswordInputCheck:
	call clear_c200_to_c2ff
	ld   a, $ff
	ld   de, $0020
	ld   hl, wTextInputChars
	call setAtoHL_deBytes

_passwordInputCheck:
	call turnOffLCDstartOfVBlank
	call copyA0hDataToOam
	ld   hl, lyt_enterPasswordScreen
	call copyLayoutFromBank3toScreen0withOffset

// init arrow cursor pos
	ld   a, $00
	ld   hl, wPwOrNameInputCursorIdx
	ld   (hl), a

// cursor at END
	ld   a, $43
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   (hl), a

	ld   hl, $001c
	call loadTilesetAndVramTileConversionTable_idxedHL

// cursor idx is $20 for password, and $08 for name
	ld   hl, wPasswordOrNameMaxChars
	ld   a, (hl)
	cp   $08
	jr   nz, _passwordNameEntryLoop

// 8 so draw name text
	ld   de, $980c
	call dPlusEquScreen0displayOffset
	ld   hl, text_name
	ld   bc, $0008
	call copyMemoryBC

_passwordNameEntryLoop:
	ld   hl, wPasswordOrNameMaxChars
	ld   a, (hl)
	cp   $08
	jr   nz, +

// name cursor offset
	ld   de, $99e6
	call dPlusEquScreen0displayOffset
	jp   ++

+
// password cursor offset
	ld   de, $99e2
	call dPlusEquScreen0displayOffset

++
	ld   bc, $0000

@processUntilMaxChars:
	ld   hl, wTextInputChars
	add  hl, bc
	ld   a, (hl)
	bit  7, (hl)
	jr   nz, @ffSet

// get char value
	and  $3f
	ld   hl, text_passwordOrNameChars
	add  l
	ld   l, a
	ld   a, h
	adc  $00
	ld   h, a
	ld   a, (hl)
	jp   +

@ffSet:
// underscore
	ld   a, $5f

+
	ld   (de), a

// next vram offset, next input char idx
	inc  de
	inc  bc
	ld   a, c

// next line if 16 done this row
	cp   $10
	jr   nz, +

// vram offset += 20
	ld   a, e
	add  $10
	ld   e, a
	ld   a, d
	adc  $00
	ld   d, a

+
	ld   hl, wPasswordOrNameMaxChars
	ld   a, c
	cp   (hl)
	jr   nz, @processUntilMaxChars

// done displaying input so far
	ld   a, $01
	call setLCDfromValue_c015equA

@loopAfterPressedSomething:
// process input arrow cursor, tile is $5c, attr is $10
	ld   hl, wOam+$1e
	ld   (hl), $5c
	ld   hl, wOam+$1f
	ld   (hl), $10

// set y, 88 if 1st row, 90 if 2nd
	ld   b, $88
	ld   hl, wPwOrNameInputCursorIdx
	ld   a, (hl)
	cp   $10
	jr   c, +

	ld   b, $90

+
	ld   hl, wOam+$1c

// set x, base is 2 if on password screen..
	ld   (hl), b
	ld   b, $02
	ld   hl, wPasswordOrNameMaxChars
	ld   a, (hl)
	cp   $08
	jr   nz, +

// 6 if name screen
	ld   b, $06

+
	ld   hl, wPwOrNameScreenArrowCursorX
	ld   (hl), b

// add cursor idx*8
	ld   hl, wPwOrNameInputCursorIdx
	ld   a, (hl)
	and  $0f
	ld   hl, wPwOrNameScreenArrowCursorX
	add  (hl)
	sla  a
	sla  a
	sla  a
// then plus 8 into x var
	add  $08
	ld   hl, wOam+$1d
	ld   (hl), a

// set y and x oam details for flashing square cursor
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   c, (hl)
	ld   b, $00
	ld   hl, nameOrPwCursorYvals
	add  hl, bc
	ld   e, (hl)
	ld   d, $00

	ld   hl, nameOrPwCursorXvals
	add  hl, bc
	ld   a, (hl)
	ld   c, a
	ld   b, $00
	call sendTowOamCursorXequC_YequE

@loopAfterPressingNothing:
	ld   e, $00
	call processInputInMenus
	cp   PADF_SELECT
	jr   nz, +

// pressed select, a, b, start
-
	jp   _pwOrName_selectedOption

+
	cp   PADF_A
	jr   z, -

	cp   PADF_B
	jr   z, -

	cp   PADF_START
	jr   z, -

// pressed directionals
	push af
	ld   a, 10
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   c, (hl)
	ld   b, $00
// c = y idx, b = x idx
	call bcDivA_divInC_modInAB
// c = y idx, e = x idx
	ld   a, b
	ld   e, a
	pop  af

// a = button pressed
	cp   PADF_RIGHT
	jr   nz, @notPressedRight

	ld   a, e
	cp   $09
	jr   nz, @processRightNoLoop

// x == 9 when pressing right, sub 9 to loop
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   a, (hl)
	sub  $09
	ld   (hl), a
	jp   @endDirButtonProcessing

@processRightNoLoop:
	ld   hl, wPwOrNameCharSelectCursorIdx
	inc  (hl)
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   a, (hl)
	cp   $44
	jr   nz, @endDirButtonProcessing

// last row has less chars, loop 44 to 3c
	ld   a, $3c
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   (hl), a

@endDirButtonProcessing:
	call playSoundEffect20h
	jp   @loopAfterPressedSomething

@notPressedRight:
	cp   PADF_LEFT
	jr   nz, @notPressedLeft

	ld   a, e
	cp   $00
	jr   nz, @processLeftNoLoop

// if 0, loop around
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   a, (hl)
	cp   $3c
	jr   z, @pressLeftLastRow

// if not last row, just add 9
	add  $09
	ld   (hl), a
	jp   @endDirButtonProcessing

@pressLeftLastRow:
// END button
	ld   (hl), $43
	jp   @endDirButtonProcessing

@processLeftNoLoop:
	ld   hl, wPwOrNameCharSelectCursorIdx
	dec  (hl)
	jp   @endDirButtonProcessing

@notPressedLeft:
	cp   PADF_DOWN
	jr   nz, @notPressedDown

// c is value to add
	ld   c, $0a
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   a, (hl)

// add 10 if left side of quit and gap (not bottom row)
	cp   $36
	jr   c, @cursorIdxPlusEquC

// add 9 if quit column (not bottom row)
	ld   c, $09
	cp   $37
	jr   z, @cursorIdxPlusEquC

// f74 if shorter column
	cp   $39
	jr   c, @pressedDownIdxEquXval

// add 8 if right of quit column and gap (not bottom row)
	ld   c, $08
	cp   $3c
	jr   nc, @pressingDownBottomRow

@cursorIdxPlusEquC:
	ld   a, c
	ld   hl, wPwOrNameCharSelectCursorIdx
	add  (hl)
	ld   (hl), a
	jp   @endDirButtonProcessing

@pressingDownBottomRow:
// jump if left side
	cp   $40
	jr   c, @pressedDownIdxEquXval

// jump if on QUIT
	jr   nz, +

// on right side, inc 3 twice for idx to be new x val
	inc  e
	jp   @pressedDownIdxEquXval

+
	inc  e
	inc  e

@pressedDownIdxEquXval:
// loop by setting x val
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   (hl), e
	jp   @endDirButtonProcessing

@notPressedDown:
	cp   PADF_UP
	jr   nz, @pressedNothing

// pressed up
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   a, (hl)

// number - top row
	cp   $0a
	jr   c, @pressingUpTopRow

// jump if not on Quit button or right of that
	ld   c, -$0a
	cp   $40
	jr   c, @cursorIdxPlusEquC

// right of quit option
	ld   c, -$08
	cp   $40
	jr   nz, @cursorIdxPlusEquC

// quit
	ld   c, -$09
	jp   @cursorIdxPlusEquC

@pressingUpTopRow:
// left of left short column
	ld   c, $3c
	cp   $04
	jr   c, @pressingUpTopRowSetIdx

// quit column
	ld   c, $3b
	cp   $05
	jr   z, @pressingUpTopRowSetIdx

// right of right short column
	ld   c, $32
	cp   $07
	jr   c, @pressingUpTopRowSetIdx

// short column
	ld   c, $3a

@pressingUpTopRowSetIdx:
	ld   a, c
	ld   hl, wPwOrNameCharSelectCursorIdx
	add  (hl)
	ld   (hl), a
	jp   @endDirButtonProcessing

@pressedNothing:
	jp   @loopAfterPressingNothing


__	ret


_pwOrName_selectedOption:
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   a, (hl)

// end
	cp   $43
	jr   z, _b

// right
	cp   $42
	jr   z, @selectedRight

// left
	cp   $41
	jr   z, @selectedLeft

// quit
	cp   $40
	jr   nz, @selectedInputChar

// selected 40h
	jp   reset

@selectedLeft:
	ld   hl, wPwOrNameInputCursorIdx
	dec  (hl)
	bit  7, (hl)
	jr   z, @playSound_backToLoop

// loop back to max chars-1 if we pressed left at cursor idx 0
	ld   hl, wPasswordOrNameMaxChars
	ld   a, (hl)
	ld   hl, wPwOrNameInputCursorIdx
	ld   (hl), a
	ld   hl, wPwOrNameInputCursorIdx
	dec  (hl)
	jp   @playSound_backToLoop

@selectedInputChar:
// store letter at current input cursor idx
	ld   hl, wPwOrNameInputCursorIdx
	ld   c, (hl)
	ld   b, $00
	ld   hl, wTextInputChars
	add  hl, bc
	ld   (hl), a

@selectedRight:
	ld   hl, wPwOrNameInputCursorIdx
	inc  (hl)
	ld   a, (hl)
	ld   hl, wPasswordOrNameMaxChars
	cp   (hl)
	jr   nz, @playSound_backToLoop

// loop back to 0 if we're at max chars
// put cursor at END at this point, eg we typed it all out
	ld   a, $00
	ld   hl, wPwOrNameInputCursorIdx
	ld   (hl), a
	ld   a, $43
	ld   hl, wPwOrNameCharSelectCursorIdx
	ld   (hl), a

@playSound_backToLoop:
	call playSoundChIfOff26hIfOn
	call turnOffLCDstartOfVBlank
	jp   _passwordNameEntryLoop


enterNameScreen:
	ld   a, $08
	ld   hl, wPasswordOrNameMaxChars
	ld   (hl), a
	ld   hl, wIsSecretPlayerName
	ld   (hl), $00
	call nameOrPasswordInputCheck

	ld   bc, $0000
@copyIntoPlayerName:
	ld   hl, wTextInputChars
	add  hl, bc
	ld   a, (hl)
	and  $3f
	ld   hl, wPlayerName
	add  hl, bc
	ld   (hl), a
	inc  bc
	ld   a, c
	cp   $08
	jr   nz, @copyIntoPlayerName

// check secret player name
	ld   bc, $0000

@nextLetter:
	ld   hl, wPlayerName
	add  hl, bc
	ld   a, (hl)
	ld   hl, @secretPlayerName
	add  hl, bc
	cp   (hl)
	jr   nz, @done

	inc  bc
	ld   a, c
	cp   $08
	jr   nz, @nextLetter

	ld   a, $06
	ld   hl, wIsSecretPlayerName
	ld   (hl), a

@done:
	ret

@secretPlayerName:
	// TeStRoOm
	.db $1d $28 $1c $37 $1b $32 $18 $30


sendTowOamCursorXequC_YequE:
// tile x
	ld   a, c
	sub  $0c
	ld   hl, wOam+5
	ld   (hl), a
	ld   hl, wOam+17
	ld   (hl), a
	add  $08
	ld   hl, wOam+9
	ld   (hl), a
	ld   hl, wOam+21
	ld   (hl), a
	add  $08
	ld   hl, wOam+13
	ld   (hl), a
	ld   hl, wOam+25
	ld   (hl), a

// tile y
	ld   a, e
	sub  $0d
	ld   hl, wOam+4
	ld   (hl), a
	ld   hl, wOam+8
	ld   (hl), a
	ld   hl, wOam+12
	ld   (hl), a
	add  $10
	ld   hl, wOam+16
	ld   (hl), a
	ld   hl, wOam+20
	ld   (hl), a
	ld   hl, wOam+24
	ld   (hl), a

// attributes - use OBP1 (flashing)
	ld   a, $10
	ld   hl, wOam+7
	ld   (hl), a
	ld   hl, wOam+11
	ld   (hl), a
	ld   hl, wOam+15
	ld   (hl), a
	ld   hl, wOam+19
	ld   (hl), a
	ld   hl, wOam+23
	ld   (hl), a
	ld   hl, wOam+27
	ld   (hl), a

// cursor tiles
	ld   a, $ae
	ld   hl, wOam+6
	ld   (hl), a
	ld   a, $7c
	ld   hl, wOam+10
	ld   (hl), a
	ld   a, $7e
	ld   hl, wOam+14
	ld   (hl), a
	ld   a, $a8
	ld   hl, wOam+18
	ld   (hl), a
	ld   a, $aa
	ld   hl, wOam+22
	ld   (hl), a
	ld   a, $ac
	ld   hl, wOam+26
	ld   (hl), a
	ret


processCorrectPassword:
	ld   bc, $0000

// 1st get correct player name
@loop:
// for each c = 0 to 7, *2 + $20, and store player name
	ld   a, c
	sla  a
	or   $20
	ld   hl, wPlayerName
	add  hl, bc
	ld   (hl), a

// get the diff between what's inputted for name in pw
// sub the above (get rid of the difference when gen'ing password)
	ld   hl, wPasswordInputName
	add  hl, bc
	ld   a, (hl)
	ld   hl, wPlayerName
	add  hl, bc
	sub  (hl)
	and  $3f
	ld   (hl), a

// next letter
	inc  bc
	ld   a, c
	cp   $08
	jr   nz, @loop

	ld   hl, wPasswordReviveRoomGroup
	ld   a, (hl)
	ld   hl, wLastReviveRoomGroup
	ld   (hl), a
	call setRevivePointInRoomGroup

	ld   hl, wPasswordArmourOfGod
	ld   a, (hl)
	ld   hl, wArmorOfGodGotten
	ld   (hl), a

	ld   hl, wPasswordBombsUpper2bitsAndSpecialBitems
	ld   a, (hl)
	and  $0f
	ld   hl, wSpecialBitemsGotten
	ld   (hl), a

	ld   hl, wPasswordOilsAndHCs
	ld   a, (hl)
	and  $0f
	sla  a
	ld   de, wPlayerMaxHealth
	ld   (de), a

	ld   a, (hl)
	and  $30
	call aDivEqu16
	ld   hl, wAnointingOilsGotten
	ld   (hl), a

// restored health is 6
	ld   hl, wPasswordPlayerHealth
	ld   a, (hl)
	and  $1f
	cp   $06
	jr   nc, +

	ld   a, $06

+
	ld   hl, wPlayerHealth
	ld   (hl), a

	ld   hl, wPasswordKeys
	ld   a, (hl)
	ld   hl, wNumKeys
	ld   (hl), a

// combine bomb amount
	ld   hl, wPasswordBombsUpper2bitsAndSpecialBitems
	ld   a, (hl)
	sla  a
	sla  a
	and  $c0
	ld   hl, wPasswordBombsLow6bits
	or   (hl)
	ld   hl, wNumBombs
	ld   (hl), a

// combine bird amount
	ld   hl, wPasswordBirdsUpper2bits5thFruit
	ld   a, (hl)
	sla  a
	sla  a
	and  $c0
	ld   hl, wPasswordBirdsLow6bits
	or   (hl)
	ld   hl, wNumBirds
	ld   (hl), a

// set items gotten
	ld   bc, $0000
-
	ld   hl, wPasswordItemsGotten
	add  hl, bc
	ld   a, (hl)
	ld   hl, wItemsGotten
	add  hl, bc
	ld   (hl), a
	inc  bc
	ld   a, c
	cp   $09
	jr   nz, -

// restore curr block of 5 quizzes
	ld   hl, wPasswordCurrQuizNoDiv5
	ld   c, (hl)
	ld   b, $00
	ld   de, $0005
	call ecEquEtimesC
	ld   hl, wCurrQuizQuestionIdx
	ld   (hl), c

// fruits
	ld   hl, wPassword1st2FruitAmounts
	ld   a, (hl)
	ld   hl, wFruitAmounts
	ld   (hl), a
	ld   hl, wPassword2nd2FruitAmounts
	ld   a, (hl)
	ld   hl, wFruitAmounts+1
	ld   (hl), a
	ld   hl, wPasswordBirdsUpper2bits5thFruit
	ld   a, (hl)
	and  $07
	ld   hl, wFruitAmounts+2
	ld   (hl), a

// reset some vars
	ld   hl, wFruitEquipped
	ld   (hl), $00
	ld   hl, wIsLampOn
	ld   (hl), $00
	ld   hl, wEquippedBItem
	ld   (hl), $00
	ret


retZifPassCorrect:
	call generateEncryptValues
	ld   hl, wPasswordSumVal
	ld   a, (hl)
	and  $3f
	ld   hl, wCalcdPasswordSumVal
	cp   (hl)
	jr   nz, @done

	ld   hl, wPasswordSumVal+1
	ld   a, (hl)
	and  $3f
	ld   hl, wCalcdPasswordSumVal+1
	cp   (hl)
	jr   nz, @done

	ld   hl, wPasswordChecksum
	ld   a, (hl)
	and  $3f
	ld   hl, wCalcdPasswordChecsum
	cp   (hl)

@done:
	ret


generatePassword:
	ld   bc, $0000

-
// for every letter of the player name..
	ld   hl, wPlayerName
	add  hl, bc
	ld   a, (hl)
// add $20 and store in c4e0
	add  $20
	ld   hl, wPasswordInputName
	add  hl, bc
	ld   (hl), a
// get its idx*2 and add on to that value in c4e0
	ld   a, c
	sla  a
	ld   hl, wPasswordInputName
	add  hl, bc
	add  (hl)
	ld   (hl), a
// loop for each 8 characters
	inc  bc
	ld   a, c
	cp   $08
	jr   nz, -

// room group to revive to in c4e8
	ld   hl, wLastReviveRoomGroup
	ld   a, (hl)
	ld   hl, wPasswordReviveRoomGroup
	ld   (hl), a

// c4eb low nybble is max health/2 (1 hc is 2 health)
	ld   hl, wPlayerMaxHealth
	ld   a, (hl)
	srl  a
	and  $0f
	ld   hl, wPasswordOilsAndHCs
	ld   (hl), a

// oils is low 2 bits, put in low 2 bits of upper nybble
	ld   hl, wAnointingOilsGotten
	ld   a, (hl)
	sla  a
	sla  a
	sla  a
	sla  a
	and  $30
// and or with c4eb with health
	ld   hl, wPasswordOilsAndHCs
	or   (hl)
	ld   (hl), a

// curr health in c4ec
	ld   hl, wPlayerHealth
	ld   a, (hl)
	ld   hl, wPasswordPlayerHealth
	ld   (hl), a

// keys in c4ed
	ld   hl, wNumKeys
	ld   a, (hl)
	call aIsMax3fh
	ld   hl, wPasswordKeys
	ld   (hl), a

// bombs in c4ee
	ld   hl, wNumBombs
	ld   a, (hl)
	ld   hl, wPasswordBombsLow6bits
	ld   (hl), a

// birds in c4ef
	ld   hl, wNumBirds
	ld   a, (hl)
	ld   hl, wPasswordBirdsLow6bits
	ld   (hl), a

// clear c4f0, dummy read from bombs
	ld   hl, wNumBombs
	ld   a, (hl)
	ld   hl, wPasswordItemsGotten
	ld   (hl), $00

// aog in c4e9
	ld   hl, wArmorOfGodGotten
	ld   a, (hl)
	ld   hl, wPasswordArmourOfGod
	ld   (hl), a

// bombs upper 2 bits only, stored in c4ea (in low 2 bits of upper nybble)
	ld   hl, wNumBombs
	ld   a, (hl)
	srl  a
	srl  a
	and  $30
	ld   hl, wPasswordBombsUpper2bitsAndSpecialBitems
	ld   (hl), a

// low nybble of c4ea is special b items gotten
	ld   hl, wSpecialBitemsGotten
	ld   a, (hl)
	and  $0f
	ld   hl, wPasswordBombsUpper2bitsAndSpecialBitems
	or   (hl)
	ld   (hl), a

// for 9 bytes of items gotten (game allocates 10, uses just 9)
// flags are stored in low 6 bits
	ld   bc, $0000
-
	ld   hl, wItemsGotten
	add  hl, bc
	ld   a, (hl)
	and  $3f
// store in c4f0+
	ld   hl, wPasswordItemsGotten
	add  hl, bc
	ld   (hl), a
	inc  bc
	ld   a, c
	cp   $09
	jr   nz, -

// c4df // 5 into c4f9
	ld   hl, wCurrQuizQuestionIdx
	ld   c, (hl)
	ld   b, $00
	ld   a, $05
	call bcDivA_divInC_modInAB
	ld   hl, wPasswordCurrQuizNoDiv5
	ld   (hl), c

// first 2 fruits in c4fa
	ld   hl, wFruitAmounts
	ld   a, (hl)
	ld   hl, wPassword1st2FruitAmounts
	ld   (hl), a

// next 2 fruits in c4fb
	ld   hl, wFruitAmounts+1
	ld   a, (hl)
	ld   hl, wPassword2nd2FruitAmounts
	ld   (hl), a

// just the value for 5th fruit in c4fc
	ld   hl, wFruitAmounts+2
	ld   a, (hl)
	and  $07
	ld   hl, wPasswordBirdsUpper2bits5thFruit
	ld   (hl), a

// birds again, but upper 2 nybbles or'd with c4fc
	ld   hl, wNumBirds
	ld   a, (hl)
	srl  a
	srl  a
	and  $30
	ld   hl, wPasswordBirdsUpper2bits5thFruit
	or   (hl)
	ld   (hl), a

// store encrypt values in c4fd to c4ff
	call generateEncryptValues
	ld   hl, wCalcdPasswordSumVal
	ld   a, (hl)
	ld   hl, wPasswordSumVal
	ld   (hl), a
	ld   hl, wCalcdPasswordSumVal+1
	ld   a, (hl)
	ld   hl, wPasswordSumVal+1
	ld   (hl), a
	ld   hl, wCalcdPasswordChecsum
	ld   a, (hl)
	ld   hl, wPasswordChecksum
	ld   (hl), a
	ret


generateEncryptValues:
	ld   bc, $0000
	ld   hl, wCalcdPasswordSumVal
	ld   (hl), $00
	ld   hl, wCalcdPasswordSumVal+1
	ld   (hl), $00

-
// get a byte generated for password
	ld   hl, wTextInputChars
	add  hl, bc
	ld   a, (hl)

// add its low 6 bits only into c006/c007
	and  $3f
	ld   hl, wCalcdPasswordSumVal
	add  (hl)
	ld   (hl), a
	ld   hl, wCalcdPasswordSumVal+1
	ld   a, (hl)
	adc  $00
	ld   (hl), a

// loop c4e0 to c4fc
	inc  bc
	ld   a, c
	cp   $1d
	jr   nz, -

// c006 is its low 6 bits only
	ld   hl, wCalcdPasswordSumVal
	ld   a, (hl)
	push af
	and  $3f
	ld   hl, wCalcdPasswordSumVal
	ld   (hl), a

// rotate upper 2 bits of c006 into c007
	pop  af
	rl   a
	ld   hl, wCalcdPasswordSumVal+1
	rl   (hl)
	rl   a
	rl   (hl)

// low 6 bits of c007 (orig low 4 bits, and upper 2 bits of c006)
// into c007
	ld   a, (hl)
	and  $3f
	ld   (hl), a

// 42 is the xor cypher
	ld   bc, $0000
	ld   a, $2a

-
// starting from a = $2a, xor it with each password byte
	ld   hl, wTextInputChars
	add  hl, bc
	xor  (hl)

// loop c4e0 to c4fc, preserve a
	inc  bc
	ld   e, a
	ld   a, c
	cp   $1d
	ld   a, e
	jr   nz, -

// finally xor the final value with c006 and c007
	ld   hl, wCalcdPasswordSumVal
	xor  (hl)
	ld   hl, wCalcdPasswordSumVal+1
	xor  (hl)
// put the xor value into c008
	and  $3f
	ld   hl, wCalcdPasswordChecsum
	ld   (hl), a
	ret
