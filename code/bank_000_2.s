displayNextTextCharacter:
// c061 - marker to tell when done
	ld   hl, wScrollingTextByteDone
	ld   a, (hl)
	cp   $00
	jr   nz, +

	ret

+
// c064/5 - vram offset of text character?
	ld   hl, wScrollingTextVramOffset
	ld   e, (hl)
	inc  hl
	ld   a, (hl)
	add  >$9800
	ld   d, a
// $c6de - row of vram?
	call dPlusEquValIn_c6de

// gets the next byte of text
	push de
	ld   de, $0000
	call loadScrollingTextByteIdxedE
	ld   a, e
	pop  de

// byte 1 is signal to progress to next line
	cp   $01
	jr   z, @byteReadEqu1

// if not terminator, read byte
	cp   $ff
	jr   nz, storeScrollingTextByteIncVramIncVramGotoNextByte

// byte read is $ff - next bytes are control bytes
	ld   hl, wScrollingTextByteDone
	ld   (hl), $00
	jp   scrollingTextIncVramOffsetNextTextBytes

@byteReadEqu1:
	call scrollingTextGoToNewLine
	jp   scrollingTextStartNextByte


scrollingTextGoToNewLine:
// c0fa/9 += $20
// store also in c065/4
	ld   hl, wScrollingTextCurrRowVramStart
	ld   a, (hl)
	add  <$0020
	ld   (hl), a
	ld   hl, wScrollingTextVramOffset
	ld   (hl), a
	ld   hl, wScrollingTextCurrRowVramStart+1
	ld   a, (hl)
	adc  >$0020
	ld   (hl), a
	ld   hl, wScrollingTextVramOffset+1
	ld   (hl), a
	ret


storeScrollingTextByteIncVramIncVramGotoNextByte:
	ld   hl, wScrollingTextVramOffset+1
	ld   l, (hl)
	bit  2, h
// bug: this jump never done
// intention is if it goes from screen 0 to screen 1, to ignore
	jr   nc, +

	ld   (de), a

+
scrollingTextIncVramOffsetNextTextBytes:
	ld   hl, wScrollingTextVramOffset
	ld   a, (hl)
	add  $01
	ld   (hl), a
	jr   nc, +

	inc  hl
	inc  (hl)

+
scrollingTextStartNextByte:
	ld   hl, wScrollingTextByteAddr
	ld   a, (hl)
	add  $01
	ld   (hl), a
	jr   nz, +

	inc  hl
	inc  (hl)

+
	ld   hl, wScrollingTextByteDone
	ld   a, (hl)
	cp   $00
	jr   nz, @done

	call scrollingTextProcessControlBytes

@done:
	ret
