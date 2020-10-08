musicScreenLayout:
	.dw $9821-_SCRN0
	.asc "SPIRITUAL WARFARE"
	.db $ff

	.dw $9864-_SCRN0
	.asc "MUSIC  TEST"
	.db $ff

	.dw $98e2-_SCRN0
	.asc "Exit to game menu"
	.db $ff

	.dw $9902-_SCRN0
	.asc "Speed Change"
	.db $ff

	.dw $9922-_SCRN0
	.asc "Song"
	.db $ff

	.dw $9942-_SCRN0
	.asc "Sound"
	.db $ff

	.dw $99e0-_SCRN0
	.asc "B to pick, A to hear"
	.db $ff

	.dw $ffff


musicTestScreen:
	ld   hl, wMusicScreenSongVal
	ld   (hl), $00
	ld   hl, wMusicScreenSoundVal
	ld   (hl), $00
	call drawFullMusicTestScreen

	ld   a, $00
	ld   hl, wGenericMenuCursorIdx
	ld   (hl), a

	ld   hl, wMusicScreenIsTwiceSpeed
	ld   (hl), a

	ld   hl, wSoundToPlayIdx
	ld   (hl), a
	jp   @mainLoop


@toMainLoop:
// cursor, only y changes
	ld   hl, wOam+1
	ld   (hl), $0e
	ld   a, $2a
	ld   hl, wOam+2
	ld   (hl), a
	ld   a, $00
	ld   hl, wOam+3
	ld   (hl), a

	ld   a, $04
	ld   hl, wGenericMenuMaxCursorIdx
	ld   (hl), a

	ld   a, $40
	ld   hl, wMenuCursorBaseOamY
	ld   (hl), a

	call nonTitleScreenInputCheckLoop

// cursor idx
	ld   hl, wGenericMenuCursorIdx
	ld   a, (hl)
	cp   $00
	jr   nz, @not0

// exit to game menu
	jp   startTitleScreen

@not0:
	cp   $01
	jr   nz, @gt1

// speed change - flip it
	ld   hl, wMusicScreenIsTwiceSpeed
	ld   a, (hl)
	xor  $ff
	ld   hl, wMusicScreenIsTwiceSpeed
	ld   (hl), a
	jp   @mainLoop

@gt1:
	cp   $03
	jr   z, @sound

// song
	ld   hl, wMenuOptionButtonsPressed
	ld   a, (hl)
	cp   PADF_B
	jr   nz, @mainLoop

// picked song, so go to next one, looping 6 to 0
	ld   hl, wMusicScreenSongVal
	inc  (hl)
	ld   a, (hl)
	cp   NUM_MUSIC
	jr   c, @mainLoop

// otherwise, main loop
	ld   (hl), $00

@mainLoop:
	call drawFullMusicTestScreen
	call stopHWSoundChannels012
	ld   hl, wMusicScreenIsTwiceSpeed
	ld   a, (hl)
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a
	ld   hl, wMusicScreenSongVal
	ld   a, (hl)
	ld   hl, wSoundToPlayIdx
	ld   (hl), a
	call play3soundChannels_6choicesIdxed_c009
	jp   @toMainLoop

@sound:
	ld   hl, wMenuOptionButtonsPressed
	ld   a, (hl)
	cp   PADF_B
	jr   nz, +

// inc sound val if b pressed, looping $2a to be 0
	ld   hl, wMusicScreenSoundVal
	inc  (hl)
	ld   a, (hl)
	cp   NUM_SOUNDS
	jr   c, +

	ld   (hl), $00

+
	call stopHWSoundChannels012
	call drawFullMusicTestScreen

// play new sound
	ld   hl, wMusicScreenSoundVal
	ld   a, (hl)
	call playSoundEffectInTableIdxedA_channel3or4

	jp   @toMainLoop


drawFullMusicTestScreen:
	ld   hl, musicScreenLayout
	call initMusicScreenGfxOamAndLayout

// song value
	ld   de, $9927
	call dPlusEquScreen0displayOffset
	ld   hl, wMusicScreenSongVal
	ld   a, (hl)
	call drawBCDNumsNoLeading0s

// sound value
	ld   de, $9948
	call dPlusEquScreen0displayOffset
	ld   hl, wMusicScreenSoundVal
	ld   a, (hl)
	call drawBCDNumsNoLeading0s

	ld   a, $01
	jp   setLCDfromValue_c015equA


initMusicScreenGfxOamAndLayout:
// hl is music screen layout
	push hl
	call turnOffLCDstartOfVBlank
	call clear_c200_to_c2ff
	call copyA0hDataToOam
	call clearScreen0
	ld   hl, $001e
	call loadTilesetAndVramTileConversionTable_idxedHL
	pop  hl

@tryNextHLvalue:
	ld   e, (hl)
	inc  hl
	ld   d, (hl)
	inc  hl
	ld   a, e
	cp   $ff
	jr   nz, +

// go to done if de == $ffff
	ld   a, d
	cp   $ff
	jr   z, @done

+
// de is in screen 0
	ld   a, d
	add  >_SCRN0
	ld   d, a
	call dPlusEquScreen0displayOffset

@waitUntilHLequFF:
// if value to put in screen is $ff, place next tiles
	ldi  a, (hl)
	cp   $ff
	jr   z, @tryNextHLvalue

// copy each byte to vram
	ld   (de), a
	inc  de
	jp   @waitUntilHLequFF

@done:
	ret
