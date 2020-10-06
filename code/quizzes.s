
text_trueFalse:
	.asc "TrueFalse"

text_questionNum:
	.dw $9821
	.asc "Question #"

text_prize:
	.dw $9861
	.asc "Prize:"

// the following 6 dynamically loaded
quizVram_birdTop:
	.dw $9847
	.db $d4 $d6

quizVram_birdBottom:
	.dw $9867
	.db $d5 $d7
	
quizVram_10bird2heartsTop:
	.dw $9847
	.db $dc $de $e0 $e2 $e0 $e2
	
quizVram_10bird2heartsBottom:
	.dw $9867
	.db $dd $df $e1 $e3 $e1 $e3
	
quizVram_heartTop:
	.dw $9848
	.db $e0 $e2
	
quizVram_heartBottom:
	.dw $9868
	.db $e1 $e3

// the following 4 copied onto screen initially
quizVram_initialFaceRow1:
	.dw $982e
	.db $b4 $b6 $b8 $ba
	
quizVram_initialFaceRow2:
	.dw $984e
	.db $b5 $b7 $b9 $bb
	
quizVram_initialFaceRow3:
	.dw $986e
	.db $f4 $f6 $f8 $fa

quizVram_initialFaceRow4:
	.dw $988e
	.db $f5 $f7 $f9 $fb



drawQuizScreen:
	ld   hl, wQuizQuestionIdx
	ld   a, (hl)
	ld   hl, wNextQuizQuestionIdx
	ld   (hl), a

// if script param is ff, simply choose next question
	cp   $ff
	jr   nz, @afterSettingNextQuestionIdx

// c4df to hold quiz question #
// add 1 to it, there are only $f9 questions, so loop after that to 0
	ld   hl, wCurrQuizQuestionIdx
	ld   a, (hl)
	ld   hl, wNextQuizQuestionIdx
	ld   (hl), a
	add  $01
	cp   $fa
	jr   c, +

	ld   a, $00

+
	ld   hl, wCurrQuizQuestionIdx
	ld   (hl), a

@afterSettingNextQuestionIdx:
	call drawQuizText

	ld   hl, text_prize
	ld   c, $06
	call destAndCbytesToCopyToScreen1AtHL

	ld   hl, text_questionNum
	ld   c, $0a
	call destAndCbytesToCopyToScreen1AtHL

// copy face onto screen
	ld   c, $04
	ld   hl, quizVram_initialFaceRow1
	call destAndCbytesToCopyToScreen1AtHL
	ld   c, $04
	ld   hl, quizVram_initialFaceRow2
	call destAndCbytesToCopyToScreen1AtHL
	ld   c, $04
	ld   hl, quizVram_initialFaceRow3
	call destAndCbytesToCopyToScreen1AtHL
	ld   c, $04
	ld   hl, quizVram_initialFaceRow4
	call destAndCbytesToCopyToScreen1AtHL

// update prize only on the last question
	ld   hl, wNumQuestionsLeft
	ld   a, (hl)
	cp   $01
	jr   nz, @drawPrize

// draw prize immediately if bit 7 somehow set
	ld   hl, wPrizeCounter
	ld   a, (hl)
	bit  7, a
	jr   nz, @drawPrize

// check incorrect questions
	ld   hl, wNumIncorrectQuestions
	ld   a, (hl)
	cp   $00
	jr   nz, @drawPrize

// highest prize if no wrong answers
	ld   a, $03
	ld   hl, wPrizeCounter
	ld   (hl), a

@drawPrize:
	ld   hl, wPrizeCounter
	ld   a, (hl)
	bit  7, a
	jr   nz, @bit7setPrizeOfHeart

	cp   $03
	jr   nz, +

// param 3 equals 3
	ld   c, $06
	ld   hl, quizVram_10bird2heartsTop
	call destAndCbytesToCopyToScreen1AtHL
	ld   c, $06
	ld   hl, quizVram_10bird2heartsBottom
	call destAndCbytesToCopyToScreen1AtHL
	jp   @done

+
	ld   c, $02
	ld   hl, quizVram_birdTop
	call destAndCbytesToCopyToScreen1AtHL
	ld   c, $02
	ld   hl, quizVram_birdBottom
	call destAndCbytesToCopyToScreen1AtHL
	jp   @done

@bit7setPrizeOfHeart:
// bit 7 set of param 3 somehow set
	ld   c, $02
	ld   hl, quizVram_heartTop
	call destAndCbytesToCopyToScreen1AtHL
	ld   c, $02
	ld   hl, quizVram_heartBottom
	call destAndCbytesToCopyToScreen1AtHL
	
@done:
	ret


destAndCbytesToCopyToScreen1AtHL:
// screen 1 word in hl
	ld   de, wScreen1displayOffset
	ld   a, (de)
	ld   e, (hl)
	inc  hl
	add  (hl)
	ld   d, a
	inc  hl
// copy memory C
-
	ldi  a, (hl)
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	ret


drawQuizText:
// hl = $9c00
	ld   hl, wScreen1displayOffset
	ld   a, (hl)
	add  >$9800
	ld   h, a
	ld   l, $00

// clear screen 1
	ld   bc, $0240
	ld   a, $00
-
	ldi  (hl), a
	dec  bc
	bit  7, b
	jr   z, -

// bc is address of text for quiz
	ld   hl, wNextQuizQuestionIdx
	ld   e, (hl)
	ld   d, $00
	ld   hl, bank1textData
	add  hl, de
	add  hl, de
	ld   c, (hl)
	inc  hl
	ld   b, (hl)

// store in c08e/c08f
	ld   hl, wCurrQuizQuestionAddr
	ld   (hl), c
	inc  hl
	ld   (hl), b

// quiz text offset in c00d/e
	ld   de, $98e1
	ld   hl, wScreen1displayOffset
	ld   a, (hl)
	add  d
	ld   d, a
	ld   hl, wQuizCurrTextVramAddr
	ld   (hl), e
	inc  hl
	ld   (hl), d

// start c008 with ff
	ld   hl, wLastQuizCharCopiedToVram
	ld   (hl), $ff

// ret 1 if newline, otherwise ret control byte
-
	call drawNextRowQuizTextBytes
	cp   $01
	jr   z, -

// pushed a is the current read byte
	push af
// 2 options for true/false
	ld   a, $02
	ld   hl, wGenericMenuMaxCursorIdx
	ld   (hl), a

// default correct answer to 1st
	ld   a, $00
	ld   hl, wCorrectQuizAnswerIdx
	ld   (hl), a

// set vram addr to where the answers would start drawing from
	ld   de, $99c3
	ld   hl, wScreen1displayOffset
	ld   a, (hl)
	add  d
	ld   d, a
	ld   hl, wQuizCurrTextVramAddr
	ld   (hl), e
	inc  hl
	ld   (hl), d
	pop  af

	cp   $06
	jr   z, @trueFalseOptions

	cp   $07
	jr   nz, @notTrueFalseOpts

// a == 7
	ld   hl, wCorrectQuizAnswerIdx
	inc  (hl)

@trueFalseOptions:
	call deEquCurrQuizVramAddr
	call quizVramTextAddrGoToNextRow
	ld   bc, $0000

@copyingTrueFalseText:
	ld   hl, text_trueFalse
	add  hl, bc
	ld   a, (hl)
	ld   (de), a
	inc  de
	inc  bc
	ld   a, c
// split to new line after True
	cp   $04
	jr   nz, +

	call deEquCurrQuizVramAddr

+
// only 9 chars
	ld   a, c
	cp   $09
	jr   nz, @copyingTrueFalseText

	ret

@notTrueFalseOpts:
// default max cursor to 0, then we inc for every answer
	ld   a, $00
	ld   hl, wGenericMenuMaxCursorIdx
	ld   (hl), a

	ld   hl, wLastQuizCharCopiedToVram
	ld   (hl), $00

@loop:
	call drawNextRowQuizTextBytes

// bc is curr max menu opts, pre-inc, in case this is correct answer idx
	ld   hl, wGenericMenuMaxCursorIdx
	ld   c, (hl)
	ld   b, $00

// selectable options += 1
	ld   hl, wGenericMenuMaxCursorIdx
	inc  (hl)

// byte 2 means not a correct answer, just loop
	cp   $02
	jr   z, @loop

// byte 5 for non-true/false is done marker
	cp   $05
	jr   z, @done

// otherwise, this is the correct answer
// if byte was 4 instead of 3, this is also an end marker
	ld   hl, wCorrectQuizAnswerIdx
	ld   (hl), c
	cp   $03
	jr   z, @loop

@done:
	ret


drawNextRowQuizTextBytes:
	call deEquCurrQuizVramAddr
	call quizVramTextAddrGoToNextRow
	jp   drawQuizTextBytes


quizVramTextAddrGoToNextRow:
	ld   hl, wQuizCurrTextVramAddr
	ld   a, (hl)
	add  <$0020
	ld   hl, wQuizCurrTextVramAddr
	ld   (hl), a

	ld   hl, wQuizCurrTextVramAddr+1
	ld   a, (hl)
	adc  >$0020
	ld   hl, wQuizCurrTextVramAddr+1
	ld   (hl), a
	ret


deEquCurrQuizVramAddr:
	ld   hl, wQuizCurrTextVramAddr
	ld   e, (hl)
	inc  hl
	ld   d, (hl)
	ret


drawQuizTextBytes:
// $22 = "
	ld   hl, wLastQuizCharForVramNonUnderscoreOrCaps
	ld   (hl), $22

@bigLoop:
// done if control byte
	call getNextByteFromQuizText
	cp   $08
	jr   c, @done

// if underscore..
	cp   $5f
	jr   z, +

// or A-Z..
	cp   $41
	jr   c, @copyToVram

	cp   $5b
	jr   nc, @copyToVram

+
// check last char
	push af
	ld   hl, wLastQuizCharForVramNonUnderscoreOrCaps
	ld   a, (hl)

// " , space
	cp   $22
	jr   z, +

	cp   $2c
	jr   z, +

	cp   $20
	jr   z, +

// if not punctuation, stay here, and place a space
	pop  af
	call decQuizQuestionAddr
	ld   a, $20
	push af

+
	pop  af

// also jump here if not underscore and not A-Z
@copyToVram:
	ld   (de), a
	inc  de
	ld   hl, wLastQuizCharForVramNonUnderscoreOrCaps
	ld   (hl), a
	cp   $5f
	jr   nz, +

// if $5f, copy 4 underscores to vram
	ld   (de), a
	inc  de
	ld   (de), a
	inc  de
	ld   (de), a
	inc  de
	ld   (de), a
	inc  de

+
// , ; ? !
	cp   $2c
	jr   z, +

	cp   $3b
	jr   z, +

	cp   $3f
	jr   z, +

	cp   $21
	jr   nz, @afterPunctuationCheck

+
// if punctiation, store space after
	ld   a, $20
	ld   (de), a
	inc  de

@afterPunctuationCheck:
// c008 is $ff if this is a true/false question, else 0
	ld   c, a

	ld   hl, wLastQuizCharCopiedToVram
	ld   a, (hl)
	cp   $00
	jr   z, @bigLoop

// if last copied char was a space, get the next word
	ld   a, c
	cp   $20
	jr   nz, @bigLoop

// loop if curr vram addr + word length is within the screen
	call getWordLength
	ld   a, e
	and  $1f
	add  l
	cp   $15
	jr   c, @bigLoop

// ret 1 when newline
	ld   a, $01

@done:
	ret


getWordLength:
// quiz question addr in bc
	ld   hl, wCurrQuizQuestionAddr
	ld   c, (hl)
	inc  hl
	ld   b, (hl)

// h = last character seen
// l = number of characters
	ld   l, $00
	ld   h, $00
@bigLoop:
// if byte is $20 (space), go to done
	ld   a, (bc)
	inc  bc
	cp   $20
	jr   z, @done

// if byte < 8 (control byte), go to done
	cp   $08
	jr   c, @done

// next l as word is at least 1
	inc  l
	cp   $5f
	jr   nz, @notUnderscores

// byte read is $5f or _
// h = $5f
	ld   h, a
	ld   a, l
	cp   $01
	jr   nz, @done
// if l == 1 (start of line), l+=4 and loop more chars
// otherwise, finish
	inc  l
	inc  l
	inc  l
	inc  l
	jr   @bigLoop

@notUnderscores:

// in order: , ; ? !, marks the end of a word
	cp   $2c
	jr   z, @done

	cp   $3b
	jr   z, @done

	cp   $3f
	jr   z, @done

	cp   $21
	jr   z, @done

// if eg lowercase, set last char seen, then loop more chars
	cp   $41
	jr   c, @setLastCharSeen_loop

	cp   $5b
	jr   nc, @setLastCharSeen_loop

// a is between A and Z inclusive
	push af
	ld   a, h

// quote or comma was last char seen, keep looping
	cp   $22
	jr   z, @popAF_setLastCharSeen_loop

	cp   $2c
	jr   z, @popAF_setLastCharSeen_loop

// non-quote or comma, if not the beginning of the line, finish
	ld   a, l
	cp   $01
	jr   z, @popAF_setLastCharSeen_loop

	pop  af
	ret


@popAF_setLastCharSeen_loop:
	pop  af

@setLastCharSeen_loop:
	ld   h, a
	jr   @bigLoop

@done:
	ret


getNextByteFromQuizText:
// quiz question addr in bc
	ld   hl, wCurrQuizQuestionAddr
	ld   c, (hl)
	inc  hl
	ld   b, (hl)

// get val in a, and inc question addr to next byte
	ld   a, (bc)
	inc  bc
	ld   (hl), b
	dec  hl
	ld   (hl), c
	ret


decQuizQuestionAddr:
	ld   hl, wCurrQuizQuestionAddr
	ld   c, (hl)
	inc  hl
	ld   b, (hl)

	dec  bc
	ld   (hl), b
	dec  hl
	ld   (hl), c
	ret
