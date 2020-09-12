
bank0begin:
	ld   bc, $0000
	ld   (bc), a
	jp   begin

.org $100

boot:
	jp   bank0begin

.org $148
// rom banks
	.db $00

.org $14d
// header checksum
	.db $e7


callHLinBankC:
	ld   b, $00
	ld   (bc), a
	ld   bc, @return
	push bc
	jp   hl

@return:
	ld   hl, $0000
	ld   (hl), a
	ret


loadFirst1000hVramTiles:
// jp to bank c
// if we dont find $ab, copy hl to de
// if bit 4 of d is nz ($9000+), jump to original bank b, otherwise loop
// if we find $ab at any point...
	push bc
	ld   b, $00
	ld   (bc), a
	ld   de, $8000

@copyNextByte:
	ldi  a, (hl)
	cp   $ab
	jr   z, @checkCopySequentialBytes

@copyIntoDestUntil9000h:
	ld   (de), a
	inc  de
	bit  4, d
	jr   z, @copyNextByte

@popAFjpBankA:
	pop  af
	ld   l, a
	ld   h, $00
	ld   (hl), a
	ret

@checkCopySequentialBytes:
// if we found $ab, if the next value is $ab, copy over
	ldi  a, (hl)
	cp   $ab
	jr   z, @copyIntoDestUntil9000h

// otherwise, copy the byte after $ab, number of times dictated
// by the byte after + 3
	push af
	ldi  a, (hl)
	add  $03
	ld   c, a
	pop  af

-
	ld   (de), a
	inc  de
	dec  c
	jr   nz, -

	jr   @copyIntoDestUntil9000h


loadFirst800hVramTiles:
// jp to bank c
	push bc
	ld   b, $00
	ld   (bc), a
	ld   de, $8000

@nextByte:
	ldi  a, (hl)
	cp   $ab
	jr   z, @abFound

@copyIntoMemory:
	ld   (de), a
	inc  de
	bit  3, d
	jr   z, @nextByte

@done:
	jp   loadFirst1000hVramTiles@popAFjpBankA


@abFound:
	ldi  a, (hl)
	cp   $ab
	jr   z, @copyIntoMemory

	push af
	ldi  a, (hl)
	add  $03
	ld   c, a
	pop  af

@nextOfSameByte:
	ld   (de), a
	inc  de
	bit  3, d
	jr   nz, @done

	dec  c
	jr   nz, @nextOfSameByte

	jr   @copyIntoMemory


copyMemoryInBankA:
	push bc
	ld   c, a
	ld   b, $00
	ld   (bc), a
	pop  bc
// copy memory b
-
	ldi  a, (hl)
	ld   (de), a
	inc  de
	dec  b
	jr   nz, -

	ld   (bc), a
	ret


// sound-related functions
commonSoundFunc0:
	ld   hl, :soundEngineFunc0                                   ; $01be: $21 $04 $00
	ld   (hl), a                                     ; $01c1: $77
	call soundEngineFunc0                               ; $01c2: $cd $c2 $1f
	ld   hl, $0000                                   ; $01c5: $21 $00 $00
	ld   (hl), a                                     ; $01c8: $77
	ret                                              ; $01c9: $c9


commonSoundFunc1:
	ld   hl, :soundEngineFunc1                                   ; $01ca: $21 $04 $00
	ld   (hl), a                                     ; $01cd: $77
	call soundEngineFunc1                                       ; $01ce: $cd $0a $20
	ld   hl, $0000                                   ; $01d1: $21 $00 $00
	ld   (hl), a                                     ; $01d4: $77
	ret                                              ; $01d5: $c9


commonSoundFunc2:
	ld   hl, :soundEngineFunc2                                   ; $01d6: $21 $04 $00
	ld   (hl), a                                     ; $01d9: $77
	call soundEngineFunc2                                       ; $01da: $cd $92 $20
	ld   hl, $0000                                   ; $01dd: $21 $00 $00
	ld   (hl), a                                     ; $01e0: $77
	ret                                              ; $01e1: $c9


;;
	call waitUntilNextVBlankPeriod                               ; $01e2: $cd $e5 $01

waitUntilNextVBlankPeriod:
	call waitUntilNotInVBlankPeriod

waitUntilStartOfVBlankPeriod:
	ld   hl, rLCDC
	bit  7, (hl)
	jr   z, _ret_01f7

	ld   hl, rLY
-
	ld   a, (hl)
	cp   $90
	jr   nz, -

_ret_01f7:
	ret


waitUntilNotInVBlankPeriod:
	ld   hl, rLCDC
	bit  7, (hl)
	jp   z, _ret_01f7

	ld   hl, rLY
-
	ld   a, (hl)
	cp   $90
	jp   nc, -

	ret


turnOffLCDstartOfVBlank:
	call waitUntilStartOfVBlankPeriod

turnOffLCD:
	ld   a, $7f
	jr   +

setLCDfromValue:
	push hl
	ld   hl, $c015
	ld   (hl), a
	pop  hl
	ld   a, $ff

+
	push hl
	ld   hl, wLCDCvalue
	and  (hl)
	ld   hl, rLCDC
	ld   (hl), a
	pop  hl
	ret


func_0224:
// c0a1 is bank
	ld   hl, $c0a1                                   ; $0224: $21 $a1 $c0
	ld   l, (hl)                                     ; $0227: $6e
	ld   h, $00                                      ; $0228: $26 $00
	ld   (hl), a                                     ; $022a: $77

// c0a0 is number of bytes
	ld   hl, $c0a0                                   ; $022b: $21 $a0 $c0
	ld   e, (hl)                                     ; $022e: $5e

// c09a/b is source of bytes to copy
	ld   hl, $c09a                                   ; $022f: $21 $9a $c0
	ldi  a, (hl)                                     ; $0232: $2a
	ld   h, (hl)                                     ; $0233: $66
	ld   l, a                                        ; $0234: $6f

// dest is c6d0
	push bc                                          ; $0235: $c5
	ld   bc, $c6d0                                   ; $0236: $01 $d0 $c6

-
	ldi  a, (hl)                                     ; $0239: $2a
	ld   (bc), a                                     ; $023a: $02
	inc  bc                                          ; $023b: $03
	dec  e                                           ; $023c: $1d
	jr   nz, -                             ; $023d: $20 $fa

	pop  bc                                          ; $023f: $c1
	ld   hl, $0000                                   ; $0240: $21 $00 $00
	ld   (hl), a                                     ; $0243: $77
	ret                                              ; $0244: $c9


call_b0_getCurrRoomGroupsWidthAndHeight:
	push af
	ld   hl, $0000
	ld   (hl), a
	call getCurrRoomGroupsWidthAndHeight
	jp   loadFirst1000hVramTiles@popAFjpBankA


loadRoomStructData:
// $c006 currently points to a room struct

// wTileLayoutDataBank is the bank to get data from
	ld   hl, wTileLayoutDataBank                                   ; $0250: $21 $5c $c0
	ld   l, (hl)                                     ; $0253: $6e
	ld   h, $00                                      ; $0254: $26 $00
	ld   (hl), a                                     ; $0256: $77

// get 1st room struct byte and store in c72b
	ld   de, $0000                                   ; $0257: $11 $00 $00
	ld   hl, $c006                                   ; $025a: $21 $06 $c0
	ldi  a, (hl)                                     ; $025d: $2a
	ld   h, (hl)                                     ; $025e: $66
	ld   l, a                                        ; $025f: $6f
	ld   a, (hl)                                     ; $0260: $7e
	ld   hl, wFirstRoomStructByte                                   ; $0261: $21 $2b $c7
	ld   (hl), a                                     ; $0264: $77

	inc  de                                          ; $0265: $13
	and  $80                                         ; $0266: $e6 $80
	jr   z, @after1stByteBit7check                              ; $0268: $28 $22

// bit 7 set of 1st struct byte
	ld   hl, $c006                                   ; $026a: $21 $06 $c0
	ldi  a, (hl)                                     ; $026d: $2a
	ld   h, (hl)                                     ; $026e: $66
	ld   l, a                                        ; $026f: $6f
	add  hl, de                                      ; $0270: $19
	ld   a, (hl)                                     ; $0271: $7e
// next byte into c5f0 and c5f4
	ld   hl, wRoomStructWord_whenFirstByteBit7set_1                                   ; $0272: $21 $f0 $c5
	ld   (hl), a                                     ; $0275: $77
	ld   hl, wRoomStructWord_whenFirstByteBit7set_2                                   ; $0276: $21 $f4 $c5
	ld   (hl), a                                     ; $0279: $77
	inc  de                                          ; $027a: $13
	ld   hl, $c006                                   ; $027b: $21 $06 $c0
	add  hl, de                                      ; $027e: $19
	ldi  a, (hl)                                     ; $027f: $2a
	ld   h, (hl)                                     ; $0280: $66
	ld   l, a                                        ; $0281: $6f
	ld   a, (hl)                                     ; $0282: $7e
// next byte into c5f1 and c5f5
	ld   hl, wRoomStructWord_whenFirstByteBit7set_1+1                                   ; $0283: $21 $f1 $c5
	ld   (hl), a                                     ; $0286: $77
	ld   hl, wRoomStructWord_whenFirstByteBit7set_2+1                                   ; $0287: $21 $f5 $c5
	ld   (hl), a                                     ; $028a: $77
	inc  de                                          ; $028b: $13

@after1stByteBit7check:
	ld   hl, wFirstRoomStructByte                                   ; $028c: $21 $2b $c7
	ld   a, (hl)                                     ; $028f: $7e
	and  $40                                         ; $0290: $e6 $40
	jr   z, @after1stByteBit6check                              ; $0292: $28 $22

// bit 6 set of 1st struct byte
	ld   hl, $c006                                   ; $0294: $21 $06 $c0
	ldi  a, (hl)                                     ; $0297: $2a
	ld   h, (hl)                                     ; $0298: $66
	ld   l, a                                        ; $0299: $6f
	add  hl, de                                      ; $029a: $19
	ld   a, (hl)                                     ; $029b: $7e
// next byte into c5f2 and c5f6
	ld   hl, wRoomStructWord_whenFirstByteBit6set_1                                   ; $029c: $21 $f2 $c5
	ld   (hl), a                                     ; $029f: $77
	ld   hl, wRoomStructWord_whenFirstByteBit6set_2                                   ; $02a0: $21 $f6 $c5
	ld   (hl), a                                     ; $02a3: $77
	inc  de                                          ; $02a4: $13
	ld   hl, $c006                                   ; $02a5: $21 $06 $c0
	ldi  a, (hl)                                     ; $02a8: $2a
	ld   h, (hl)                                     ; $02a9: $66
	ld   l, a                                        ; $02aa: $6f
	add  hl, de                                      ; $02ab: $19
	ld   a, (hl)                                     ; $02ac: $7e
// next byte into c5f3 and c5f7
	ld   hl, wRoomStructWord_whenFirstByteBit6set_1+1                                   ; $02ad: $21 $f3 $c5
	ld   (hl), a                                     ; $02b0: $77
	ld   hl, wRoomStructWord_whenFirstByteBit6set_2+1                                   ; $02b1: $21 $f7 $c5
	ld   (hl), a                                     ; $02b4: $77
	inc  de                                          ; $02b5: $13

@after1stByteBit6check:
// $c079 is 1st struct byte's bit 2
	ld   hl, wFirstRoomStructByte                                   ; $02b6: $21 $2b $c7
	ld   a, (hl)                                     ; $02b9: $7e
	and  $04                                         ; $02ba: $e6 $04
	ld   hl, wRoomStructByteWhenFirstByteBitSet2                                   ; $02bc: $21 $79 $c0
	ld   (hl), a                                     ; $02bf: $77
	cp   $00                                         ; $02c0: $fe $00
	jr   z, @after1stByteBit2check                              ; $02c2: $28 $0d

// run the follow if the above bit 2 is set
	ld   hl, $c006                                   ; $02c4: $21 $06 $c0
	ldi  a, (hl)                                     ; $02c7: $2a
	ld   h, (hl)                                     ; $02c8: $66
	ld   l, a                                        ; $02c9: $6f
	add  hl, de                                      ; $02ca: $19
	ld   a, (hl)                                     ; $02cb: $7e
	ld   hl, wRoomStructByteWhenFirstByteBitSet2                                   ; $02cc: $21 $79 $c0
	ld   (hl), a                                     ; $02cf: $77
	inc  de                                          ; $02d0: $13

@after1stByteBit2check:
// 2nd/next struct byte
	ld   hl, $c006                                   ; $02d1: $21 $06 $c0
	ldi  a, (hl)                                     ; $02d4: $2a
	ld   h, (hl)                                     ; $02d5: $66
	ld   l, a                                        ; $02d6: $6f
	add  hl, de                                      ; $02d7: $19
	ld   a, (hl)                                     ; $02d8: $7e
	inc  de                                          ; $02d9: $13

// store it in $c72c
	ld   hl, wSecondRoomStructByte                                   ; $02da: $21 $2c $c7
	ld   (hl), a                                     ; $02dd: $77
	and  $80                                         ; $02de: $e6 $80
// store its bit 7 in $c5fe
	ld   hl, wSecondRoomStructByteBit7                                   ; $02e0: $21 $fe $c5
	ld   (hl), a                                     ; $02e3: $77
	ld   hl, wSecondRoomStructByte                                   ; $02e4: $21 $2c $c7
	ld   a, (hl)                                     ; $02e7: $7e
	and  $40                                         ; $02e8: $e6 $40
	jr   z, +                              ; $02ea: $28 $06

// TODO: run the following if 2nd byte's bit 6 is set
	ld   a, $00                                      ; $02ec: $3e $00
	ld   hl, $c04a                                   ; $02ee: $21 $4a $c0
	ld   (hl), a                                     ; $02f1: $77

+
// 2nd byte's bit 4 in $c090
	ld   hl, wSecondRoomStructByte                                   ; $02f2: $21 $2c $c7
	ld   a, (hl)                                     ; $02f5: $7e
	and  $10                                         ; $02f6: $e6 $10
	ld   hl, wSecondRoomStructByteBit4                                   ; $02f8: $21 $90 $c0
	ld   (hl), a                                     ; $02fb: $77

// 2nd byte's low nybble x2 in wTilesetIdx
	ld   hl, wSecondRoomStructByte                                   ; $02fc: $21 $2c $c7
	ld   a, (hl)                                     ; $02ff: $7e
	and  $0f                                         ; $0300: $e6 $0f
	sla  a                                           ; $0302: $cb $27
	ld   hl, wTilesetIdx                                   ; $0304: $21 $ff $c5
	ld   (hl), a                                     ; $0307: $77
	ld   c, a                                        ; $0308: $4f
	ld   b, $00                                      ; $0309: $06 $00
.rept 5
	sla  c                                           ; $030b: $cb $21
	rl   b                                           ; $030d: $cb $10
.endr
// lower nybble * $40
	ld   hl, data_02_4acd                                   ; $031f: $21 $cd $4a
	add  hl, bc                                      ; $0322: $09
	push hl                                          ; $0323: $e5
	pop  bc                                          ; $0324: $c1
	ld   hl, wAddrOfRooms40hTableAt_02_4acd                                   ; $0325: $21 $91 $c0
	ld   (hl), c                                     ; $0328: $71
	inc  hl                                          ; $0329: $23
	ld   (hl), b                                     ; $032a: $70

	ld   hl, wSecondRoomStructByte                                   ; $032b: $21 $2c $c7
	ld   a, (hl)                                     ; $032e: $7e
	and  $20                                         ; $032f: $e6 $20
	jr   z, @after2ndByteBit5check                              ; $0331: $28 $34

// 2nd byte's bit 5 is set
	ld   hl, $c006                                   ; $0333: $21 $06 $c0
	ldi  a, (hl)                                     ; $0336: $2a
	ld   h, (hl)                                     ; $0337: $66
	ld   l, a                                        ; $0338: $6f
	add  hl, de                                      ; $0339: $19
	ld   a, (hl)                                     ; $033a: $7e
	ld   hl, wRoomStructWord_whenFirstByteBit7set_2                                   ; $033b: $21 $f4 $c5
	ld   (hl), a                                     ; $033e: $77
	inc  de                                          ; $033f: $13
	ld   hl, $c006                                   ; $0340: $21 $06 $c0
	ldi  a, (hl)                                     ; $0343: $2a
	ld   h, (hl)                                     ; $0344: $66
	ld   l, a                                        ; $0345: $6f
	add  hl, de                                      ; $0346: $19
	ld   a, (hl)                                     ; $0347: $7e
	ld   hl, wRoomStructWord_whenFirstByteBit7set_2+1                                   ; $0348: $21 $f5 $c5
	ld   (hl), a                                     ; $034b: $77
	inc  de                                          ; $034c: $13
	ld   hl, $c006                                   ; $034d: $21 $06 $c0
	ldi  a, (hl)                                     ; $0350: $2a
	ld   h, (hl)                                     ; $0351: $66
	ld   l, a                                        ; $0352: $6f
	add  hl, de                                      ; $0353: $19
	ld   a, (hl)                                     ; $0354: $7e
	ld   hl, wRoomStructWord_whenFirstByteBit6set_2                                   ; $0355: $21 $f6 $c5
	ld   (hl), a                                     ; $0358: $77
	inc  de                                          ; $0359: $13
	ld   hl, $c006                                   ; $035a: $21 $06 $c0
	ldi  a, (hl)                                     ; $035d: $2a
	ld   h, (hl)                                     ; $035e: $66
	ld   l, a                                        ; $035f: $6f
	add  hl, de                                      ; $0360: $19
	ld   a, (hl)                                     ; $0361: $7e
	ld   hl, wRoomStructWord_whenFirstByteBit6set_2+1                                   ; $0362: $21 $f7 $c5
	ld   (hl), a                                     ; $0365: $77
	inc  de                                          ; $0366: $13

@after2ndByteBit5check:
// (word in $c006) + de -> $c075 and $c008
	ld   hl, $c006                                   ; $0367: $21 $06 $c0
	ldi  a, (hl)                                     ; $036a: $2a
	ld   h, (hl)                                     ; $036b: $66
	ld   l, a                                        ; $036c: $6f
	add  hl, de                                      ; $036d: $19
	ld   a, (hl)                                     ; $036e: $7e
	ld   hl, wRoomCompressedLayoutAddr                                   ; $036f: $21 $75 $c0
	ld   (hl), a                                     ; $0372: $77
	ld   hl, $c008                                   ; $0373: $21 $08 $c0
	ld   (hl), a                                     ; $0376: $77

// (word in $c006) + de + 1 -> $c076 and $c009
	inc  de                                          ; $0377: $13
	ld   hl, $c006                                   ; $0378: $21 $06 $c0
	ldi  a, (hl)                                     ; $037b: $2a
	ld   h, (hl)                                     ; $037c: $66
	ld   l, a                                        ; $037d: $6f
	add  hl, de                                      ; $037e: $19
	ld   a, (hl)                                     ; $037f: $7e
	ld   hl, wRoomCompressedLayoutAddr+1                                   ; $0380: $21 $76 $c0
	ld   (hl), a                                     ; $0383: $77
	ld   hl, $c009                                   ; $0384: $21 $09 $c0
	ld   (hl), a                                     ; $0387: $77

// c007/6 and c0b6/5 = current addr in room struct
	inc  de                                          ; $0388: $13
	ld   a, e                                        ; $0389: $7b
	ld   hl, $c006                                   ; $038a: $21 $06 $c0
	add  (hl)                                        ; $038d: $86
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr                                   ; $038e: $21 $b5 $c0
	ld   (hl), a                                     ; $0391: $77
	ld   hl, $c006                                   ; $0392: $21 $06 $c0
	ld   (hl), a                                     ; $0395: $77
	ld   hl, $c007                                   ; $0396: $21 $07 $c0
	ld   a, (hl)                                     ; $0399: $7e
	adc  $00                                         ; $039a: $ce $00
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr+1                                   ; $039c: $21 $b6 $c0
	ld   (hl), a                                     ; $039f: $77
	ld   hl, $c007                                   ; $03a0: $21 $07 $c0
	ld   (hl), a                                     ; $03a3: $77

// offset back to 0
	ld   de, $0000                                   ; $03a4: $11 $00 $00
	ld   hl, wFirstRoomStructByte                                   ; $03a7: $21 $2b $c7
	ld   a, (hl)                                     ; $03aa: $7e
	and  $20                                         ; $03ab: $e6 $20
	jr   z, @after1stByteBit5check                              ; $03ad: $28 $10

// first struct byte bit 5 set
	ld   a, <@terminator                                      ; $03af: $3e $be
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr                                   ; $03b1: $21 $b5 $c0
	ld   (hl), a                                     ; $03b4: $77
	ld   a, >@terminator                                      ; $03b5: $3e $03
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr+1                                   ; $03b7: $21 $b6 $c0
	ld   (hl), a                                     ; $03ba: $77
	jp   @afterBytePattern                               ; $03bb: $c3 $e6 $03

@terminator:
	.db $ff  // no byte pattern to process

@after1stByteBit5check:
// first struct byte bit 5 not set
-
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr                                   ; $03bf: $21 $b5 $c0
	ldi  a, (hl)                                     ; $03c2: $2a
	ld   h, (hl)                                     ; $03c3: $66
	ld   l, a                                        ; $03c4: $6f
	add  hl, de                                      ; $03c5: $19
	ld   a, (hl)                                     ; $03c6: $7e
	cp   $ff                                         ; $03c7: $fe $ff
	jr   z, +                              ; $03c9: $28 $07

	ld   a, e                                        ; $03cb: $7b
	add  $07                                         ; $03cc: $c6 $07
	ld   e, a                                        ; $03ce: $5f
	jp   -                               ; $03cf: $c3 $bf $03

+
// c006/7 now at byte after previous byte pattern
	inc  de                                          ; $03d2: $13
	ld   a, e                                        ; $03d3: $7b
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr                                   ; $03d4: $21 $b5 $c0
	add  (hl)                                        ; $03d7: $86
	ld   hl, $c006                                   ; $03d8: $21 $06 $c0
	ld   (hl), a                                     ; $03db: $77
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr+1                                   ; $03dc: $21 $b6 $c0
	ld   a, (hl)                                     ; $03df: $7e
	adc  $00                                         ; $03e0: $ce $00
	ld   hl, $c007                                   ; $03e2: $21 $07 $c0
	ld   (hl), a                                     ; $03e5: $77

@afterBytePattern:
	ld   bc, $0000                                   ; $03e6: $01 $00 $00

@keepFilling2x2TileData:
	ld   a, c                                        ; $03e9: $79
	and  $0f                                         ; $03ea: $e6 $0f
	jr   nz, +                             ; $03ec: $20 $06

	ld   a, $ff                                      ; $03ee: $3e $ff
	ld   hl, $c00a                                   ; $03f0: $21 $0a $c0
	ld   (hl), a                                     ; $03f3: $77

+
// looking at bank 2 for the 1st screen
	ld   de, $0000                                   ; $03f4: $11 $00 $00
	ld   hl, $c008                                   ; $03f7: $21 $08 $c0
	ldi  a, (hl)                                     ; $03fa: $2a
	ld   h, (hl)                                     ; $03fb: $66
	ld   l, a                                        ; $03fc: $6f
	add  hl, de                                      ; $03fd: $19
// lower 2 bytes+1 into $c00e
	ld   a, (hl)                                     ; $03fe: $7e
	and  $03                                         ; $03ff: $e6 $03
	ld   hl, $c00e                                   ; $0401: $21 $0e $c0
	ld   (hl), a                                     ; $0404: $77
	inc  (hl)                                        ; $0405: $34
// $c008 is word location of tile to decompress
	ld   hl, $c008                                   ; $0406: $21 $08 $c0
	ldi  a, (hl)                                     ; $0409: $2a
	ld   h, (hl)                                     ; $040a: $66
	ld   l, a                                        ; $040b: $6f
	add  hl, de                                      ; $040c: $19
// upper 6 bits into $c028
	ld   a, (hl)                                     ; $040d: $7e
	and  $fc                                         ; $040e: $e6 $fc
	ld   hl, $c028                                   ; $0410: $21 $28 $c0
	ld   (hl), a                                     ; $0413: $77

	ld   hl, wTileLayoutDataBank                                   ; $0414: $21 $5c $c0
	ld   a, (hl)                                     ; $0417: $7e
	call convertCurrTileUsingTable_02_4acd                               ; $0418: $cd $6b $07

	ld   hl, $c00b                                   ; $041b: $21 $0b $c0
	ld   (hl), e                                     ; $041e: $73
	ld   hl, $c028                                   ; $041f: $21 $28 $c0
	ld   a, (hl)                                     ; $0422: $7e

// is byte we are decompressing, same as last?
	ld   hl, $c00a                                   ; $0423: $21 $0a $c0
	cp   (hl)                                        ; $0426: $be
	jr   nz, +                             ; $0427: $20 $07

	ld   hl, $c00e                                   ; $0429: $21 $0e $c0
	sla  (hl)                                        ; $042c: $cb $26
	sla  (hl)                                        ; $042e: $cb $26

+
	ld   hl, $c00a                                   ; $0430: $21 $0a $c0
	ld   (hl), a                                     ; $0433: $77

// loop below is $c00e times
	ld   hl, $c00e                                   ; $0434: $21 $0e $c0
	ld   e, (hl)                                     ; $0437: $5e
	ld   d, $00                                      ; $0438: $16 $00
-
// $c028 is current tile considered in decompression?
	ld   hl, $c028                                   ; $043a: $21 $28 $c0
	ld   a, (hl)                                     ; $043d: $7e
	ld   hl, w2x2gameScreenTiles                                   ; $043e: $21 $b0 $c3
	add  hl, bc                                      ; $0441: $09
	ld   (hl), a                                     ; $0442: $77
	ld   hl, $c00b                                   ; $0443: $21 $0b $c0
	ld   a, (hl)                                     ; $0446: $7e
	ld   hl, wAnother2x2blockForGameScreenTilesTODO                                   ; $0447: $21 $00 $c3
	add  hl, bc                                      ; $044a: $09
	ld   (hl), a                                     ; $044b: $77
	inc  bc                                          ; $044c: $03

	dec  de                                          ; $044d: $1b
	ld   a, e                                        ; $044e: $7b
	or   d                                           ; $044f: $b2
	jr   nz, -                             ; $0450: $20 $e8

// $c009/$c008 += 1
	ld   hl, $c008                                   ; $0452: $21 $08 $c0
	ld   a, (hl)                                     ; $0455: $7e
	add  $01                                         ; $0456: $c6 $01
	ld   (hl), a                                     ; $0458: $77
	ld   hl, $c009                                   ; $0459: $21 $09 $c0
	ld   a, (hl)                                     ; $045c: $7e
	adc  $00                                         ; $045d: $ce $00
	ld   (hl), a                                     ; $045f: $77

	ld   a, c                                        ; $0460: $79
	cp   $b0                                         ; $0461: $fe $b0
	jp   c, @keepFilling2x2TileData                            ; $0463: $da $e9 $03

// after loading compressed layout data
// store that address in c009/c008
	ld   hl, wRoomCompressedLayoutAddr                                   ; $0466: $21 $75 $c0
	ld   a, (hl)                                     ; $0469: $7e
	ld   hl, $c008                                   ; $046a: $21 $08 $c0
	ld   (hl), a                                     ; $046d: $77
	ld   hl, wRoomCompressedLayoutAddr+1                                   ; $046e: $21 $76 $c0
	ld   a, (hl)                                     ; $0471: $7e
	ld   hl, $c009                                   ; $0472: $21 $09 $c0
	ld   (hl), a                                     ; $0475: $77

// similar to loading the compressed room layout data
	ld   de, $0000                                   ; $0476: $11 $00 $00
	ld   bc, $0000                                   ; $0479: $01 $00 $00

@checkNextCompressedRowOffset:
// store offset of 1st compressed byte per row
	ld   hl, wOffsetIntoCompressedRoomLayoutPerScreenRow                                   ; $047c: $21 $e0 $c5
	add  hl, bc                                      ; $047f: $09
	ld   (hl), e                                     ; $0480: $73
	inc  bc                                          ; $0481: $03
	ld   a, c                                        ; $0482: $79
	cp   $0b                                         ; $0483: $fe $0b
	jr   z, @afterStoringCompressedRowOffsets                              ; $0485: $28 $49

	ld   a, $ff                                      ; $0487: $3e $ff
	ld   hl, $c00a                                   ; $0489: $21 $0a $c0
	ld   (hl), a                                     ; $048c: $77
	ld   a, $00                                      ; $048d: $3e $00
	ld   hl, wOffsetIntoCompressedRoomLayoutPerScreenRow                                   ; $048f: $21 $e0 $c5
	add  hl, bc                                      ; $0492: $09
	ld   (hl), a                                     ; $0493: $77

@stillCheckingCurrentRow:
// low 2 bits of compressed byte into $c00b and + 1
	ld   hl, $c008                                   ; $0494: $21 $08 $c0
	ldi  a, (hl)                                     ; $0497: $2a
	ld   h, (hl)                                     ; $0498: $66
	ld   l, a                                        ; $0499: $6f
	add  hl, de                                      ; $049a: $19
	ld   a, (hl)                                     ; $049b: $7e
	and  $03                                         ; $049c: $e6 $03
	ld   hl, $c00b                                   ; $049e: $21 $0b $c0
	ld   (hl), a                                     ; $04a1: $77
	inc  (hl)                                        ; $04a2: $34

// check upper 6 bits are equal to upper 6 bits
	ld   hl, $c008                                   ; $04a3: $21 $08 $c0
	ldi  a, (hl)                                     ; $04a6: $2a
	ld   h, (hl)                                     ; $04a7: $66
	ld   l, a                                        ; $04a8: $6f
	add  hl, de                                      ; $04a9: $19
	ld   a, (hl)                                     ; $04aa: $7e
	inc  de                                          ; $04ab: $13
	and  $fc                                         ; $04ac: $e6 $fc
	ld   hl, $c00a                                   ; $04ae: $21 $0a $c0
	cp   (hl)                                        ; $04b1: $be
	jr   nz, +                             ; $04b2: $20 $07

// if same, multiply c00b by 4
	ld   hl, $c00b                                   ; $04b4: $21 $0b $c0
	sla  (hl)                                        ; $04b7: $cb $26
	sla  (hl)                                        ; $04b9: $cb $26

+
// set curr byte
	ld   hl, $c00a                                   ; $04bb: $21 $0a $c0
	ld   (hl), a                                     ; $04be: $77

// add the count byte (reuse $c5e0, it is re-written over at bigLoop)
	ld   hl, $c00b                                   ; $04bf: $21 $0b $c0
	ld   a, (hl)                                     ; $04c2: $7e
	ld   hl, wOffsetIntoCompressedRoomLayoutPerScreenRow                                   ; $04c3: $21 $e0 $c5
// bc inc'ed every big loop (when on new row)
	add  hl, bc                                      ; $04c6: $09
	add  (hl)                                        ; $04c7: $86
	ld   (hl), a                                     ; $04c8: $77
	cp   $10                                         ; $04c9: $fe $10
	jr   c, @stillCheckingCurrentRow                              ; $04cb: $38 $c7

	jp   @checkNextCompressedRowOffset                               ; $04cd: $c3 $7c $04

//
@afterStoringCompressedRowOffsets:
// save c007/6 (pointing at byte pattern after address to compressed tiles)
	ld   hl, $c007                                   ; $04d0: $21 $07 $c0
	ld   a, (hl)                                     ; $04d3: $7e
	push af                                          ; $04d4: $f5
	ld   hl, $c006                                   ; $04d5: $21 $06 $c0
	ld   a, (hl)                                     ; $04d8: $7e
	push af                                          ; $04d9: $f5

// c0fc to be count of values between 3 and 9 in other 2x2 block
	ld   bc, $0000                                   ; $04da: $01 $00 $00
	ld   hl, $c0fc                                   ; $04dd: $21 $fc $c0
	ld   (hl), c                                     ; $04e0: $71

@loop_04e1:
	ld   hl, wAnother2x2blockForGameScreenTilesTODO                                   ; $04e1: $21 $00 $c3
	add  hl, bc                                      ; $04e4: $09
	ld   a, (hl)                                     ; $04e5: $7e
	cp   $10                                         ; $04e6: $fe $10
	jr   nc, +                             ; $04e8: $30 $07

	cp   $03                                         ; $04ea: $fe $03
	jr   c, +                              ; $04ec: $38 $03

// other 2x2 block value is between 3 and 9
	call inc_c0fc_wrap127to0                               ; $04ee: $cd $3a $07

+
	inc  bc                                          ; $04f1: $03
	ld   a, c                                        ; $04f2: $79
	cp   $b0                                         ; $04f3: $fe $b0
	jr   nz, @loop_04e1                             ; $04f5: $20 $ea

// TODO:
	ld   de, $0000                                   ; $04f7: $11 $00 $00
	ld   hl, $c00a                                   ; $04fa: $21 $0a $c0
	ld   (hl), e                                     ; $04fd: $73
	ld   hl, wFirstRoomStructByte                                   ; $04fe: $21 $2b $c7
	ld   a, (hl)                                     ; $0501: $7e
	and  $10                                         ; $0502: $e6 $10
	jr   nz, @func_054d                             ; $0504: $20 $47

@bigLoop_0506:
	ld   hl, $c006                                   ; $0506: $21 $06 $c0
	ldi  a, (hl)                                     ; $0509: $2a
	ld   h, (hl)                                     ; $050a: $66
	ld   l, a                                        ; $050b: $6f
	add  hl, de                                      ; $050c: $19
	ld   a, (hl)                                     ; $050d: $7e
	cp   $ff                                         ; $050e: $fe $ff
	jr   z, @func_054c                              ; $0510: $28 $3a

	call inc_c0fc_wrap127to0                               ; $0512: $cd $3a $07
	ld   a, $02                                      ; $0515: $3e $02
	ld   hl, $c0a0                                   ; $0517: $21 $a0 $c0
	ld   (hl), a                                     ; $051a: $77
	ld   hl, $c00a                                   ; $051b: $21 $0a $c0
	ld   a, (hl)                                     ; $051e: $7e
	cp   $00                                         ; $051f: $fe $00
	jr   z, @next_053b                              ; $0521: $28 $18

	ld   hl, $c0a0                                   ; $0523: $21 $a0 $c0
	inc  (hl)                                        ; $0526: $34
	inc  de                                          ; $0527: $13
	ld   hl, $c006                                   ; $0528: $21 $06 $c0
	ldi  a, (hl)                                     ; $052b: $2a
	ld   h, (hl)                                     ; $052c: $66
	ld   l, a                                        ; $052d: $6f
	add  hl, de                                      ; $052e: $19
	ld   a, (hl)                                     ; $052f: $7e
	dec  de                                          ; $0530: $1b
	and  $80                                         ; $0531: $e6 $80
	bit  7, a                                        ; $0533: $cb $7f
	jr   nz, @next_053b                             ; $0535: $20 $04

	ld   hl, $c0a0                                   ; $0537: $21 $a0 $c0
	inc  (hl)                                        ; $053a: $34

@next_053b:
	ld   a, e                                        ; $053b: $7b
	ld   hl, $c0a0                                   ; $053c: $21 $a0 $c0
	add  (hl)                                        ; $053f: $86
	ld   e, a                                        ; $0540: $5f
	ld   d, $00                                      ; $0541: $16 $00
	jr   nc, @bigLoop_0506                             ; $0543: $30 $c1

	ld   hl, $c007                                   ; $0545: $21 $07 $c0
	inc  (hl)                                        ; $0548: $34
	jp   @bigLoop_0506                               ; $0549: $c3 $06 $05

@func_054c:
	inc  de                                          ; $054c: $13

@func_054d:
	ld   hl, $c00a                                   ; $054d: $21 $0a $c0
	ld   a, (hl)                                     ; $0550: $7e
	cp   $00                                         ; $0551: $fe $00
	jr   nz, +                             ; $0553: $20 $0a

	ld   (hl), $01                                   ; $0555: $36 $01
	ld   hl, wFirstRoomStructByte                                   ; $0557: $21 $2b $c7
	ld   a, (hl)                                     ; $055a: $7e
	and  $08                                         ; $055b: $e6 $08
	jr   z, @bigLoop_0506                              ; $055d: $28 $a7

+
	ld   hl, $0001                                   ; $055f: $21 $01 $00
	ld   (hl), a                                     ; $0562: $77
	call getRoomIdxWithinAllRooms                                       ; $0563: $cd $56 $09
	call func_01_09d3                                       ; $0566: $cd $d3 $09
	ld   hl, $c0fd                                   ; $0569: $21 $fd $c0
	ld   (hl), c                                     ; $056c: $71
// back to tile layout data bank
	ld   hl, wTileLayoutDataBank                                   ; $056d: $21 $5c $c0
	ld   l, (hl)                                     ; $0570: $6e
	ld   h, $00                                      ; $0571: $26 $00
	ld   (hl), a                                     ; $0573: $77

// c007/6 back to address pointing to byte pattern after addr to compressed layout
	pop  af                                          ; $0574: $f1
	ld   hl, $c006                                   ; $0575: $21 $06 $c0
	ld   (hl), a                                     ; $0578: $77
	pop  af                                          ; $0579: $f1
	ld   hl, $c007                                   ; $057a: $21 $07 $c0
	ld   (hl), a                                     ; $057d: $77
	ld   de, $0000                                   ; $057e: $11 $00 $00
	ld   hl, $c0fc                                   ; $0581: $21 $fc $c0
	ld   (hl), e                                     ; $0584: $73
	ld   hl, wFirstRoomStructByte                                   ; $0585: $21 $2b $c7
	ld   a, (hl)                                     ; $0588: $7e
	and  $10                                         ; $0589: $e6 $10
	jr   nz, @next_05d8                             ; $058b: $20 $4b

@bigLoop_058d:
	ld   hl, $c006                                   ; $058d: $21 $06 $c0
	ldi  a, (hl)                                     ; $0590: $2a
	ld   h, (hl)                                     ; $0591: $66
	ld   l, a                                        ; $0592: $6f
	add  hl, de                                      ; $0593: $19
	ld   a, (hl)                                     ; $0594: $7e
	cp   $ff                                         ; $0595: $fe $ff
	jr   z, @next_05d7                              ; $0597: $28 $3e

	call Call_000_072c                               ; $0599: $cd $2c $07
	jr   c, @skip_05cf                              ; $059c: $38 $31

	ld   hl, $c006                                   ; $059e: $21 $06 $c0
	ldi  a, (hl)                                     ; $05a1: $2a
	ld   h, (hl)                                     ; $05a2: $66
	ld   l, a                                        ; $05a3: $6f
	add  hl, de                                      ; $05a4: $19
	ld   a, (hl)                                     ; $05a5: $7e
	ld   hl, $c00c                                   ; $05a6: $21 $0c $c0
	ld   (hl), a                                     ; $05a9: $77
	push de                                          ; $05aa: $d5
	inc  de                                          ; $05ab: $13
	ld   hl, $c006                                   ; $05ac: $21 $06 $c0
	ldi  a, (hl)                                     ; $05af: $2a
	ld   h, (hl)                                     ; $05b0: $66
	ld   l, a                                        ; $05b1: $6f
	add  hl, de                                      ; $05b2: $19
	ld   a, (hl)                                     ; $05b3: $7e
	call aDivEqu16                               ; $05b4: $cd $fa $07
	ld   c, a                                        ; $05b7: $4f
	ld   b, $00                                      ; $05b8: $06 $00
	ld   hl, $c006                                   ; $05ba: $21 $06 $c0
	ldi  a, (hl)                                     ; $05bd: $2a
	ld   h, (hl)                                     ; $05be: $66
	ld   l, a                                        ; $05bf: $6f
	add  hl, de                                      ; $05c0: $19
	ld   a, (hl)                                     ; $05c1: $7e
	and  $0f                                         ; $05c2: $e6 $0f
	ld   e, a                                        ; $05c4: $5f
	ld   d, $00                                      ; $05c5: $16 $00
	ld   hl, $c00c                                   ; $05c7: $21 $0c $c0
	ld   a, (hl)                                     ; $05ca: $7e
	call Call_000_085c                               ; $05cb: $cd $5c $08
	pop  de                                          ; $05ce: $d1

@skip_05cf:
	inc  de                                          ; $05cf: $13
	inc  de                                          ; $05d0: $13
	call inc_c0fc_wrap127to0                               ; $05d1: $cd $3a $07
	jp   @bigLoop_058d                               ; $05d4: $c3 $8d $05

@next_05d7:
	inc  de                                          ; $05d7: $13

@next_05d8:
	ld   a, e                                        ; $05d8: $7b
	ld   hl, $c006                                   ; $05d9: $21 $06 $c0
	add  (hl)                                        ; $05dc: $86
	ld   (hl), a                                     ; $05dd: $77
	jr   nc, +                             ; $05de: $30 $04

	ld   hl, $c007                                   ; $05e0: $21 $07 $c0
	inc  (hl)                                        ; $05e3: $34

+
	ld   de, $0000                                   ; $05e4: $11 $00 $00
	ld   bc, $0000                                   ; $05e7: $01 $00 $00
	ld   hl, wFirstRoomStructByte                                   ; $05ea: $21 $2b $c7
	ld   a, (hl)                                     ; $05ed: $7e
	and  $08                                         ; $05ee: $e6 $08
	jp   nz, @next_06a0                           ; $05f0: $c2 $a0 $06

@bigLoop_05f3:
	ld   hl, $c006                                   ; $05f3: $21 $06 $c0
	ldi  a, (hl)                                     ; $05f6: $2a
	ld   h, (hl)                                     ; $05f7: $66
	ld   l, a                                        ; $05f8: $6f
	add  hl, de                                      ; $05f9: $19
	ld   a, (hl)                                     ; $05fa: $7e
	cp   $ff                                         ; $05fb: $fe $ff
	jp   z, @next_06a0                            ; $05fd: $ca $a0 $06

// only load up to 12 npcs?
	ld   a, c                                        ; $0600: $79
	cp   $0c                                         ; $0601: $fe $0c
	jp   nc, @next_06a0                           ; $0603: $d2 $a0 $06

	call Call_000_072c                               ; $0606: $cd $2c $07
	jr   nc, ++                             ; $0609: $30 $13

	inc  de                                          ; $060b: $13
	ld   hl, $c006                                   ; $060c: $21 $06 $c0
	ldi  a, (hl)                                     ; $060f: $2a
	ld   h, (hl)                                     ; $0610: $66
	ld   l, a                                        ; $0611: $6f
	add  hl, de                                      ; $0612: $19
	ld   a, (hl)                                     ; $0613: $7e
	bit  7, a                                        ; $0614: $cb $7f
	jr   nz, +                             ; $0616: $20 $01

	inc  de                                          ; $0618: $13

+
	inc  de                                          ; $0619: $13
	inc  de                                          ; $061a: $13
	jp   @next_069a                               ; $061b: $c3 $9a $06

++
// npc 1st byte is max $f5
	ld   hl, $c006                                   ; $061e: $21 $06 $c0
	ldi  a, (hl)                                     ; $0621: $2a
	ld   h, (hl)                                     ; $0622: $66
	ld   l, a                                        ; $0623: $6f
	add  hl, de                                      ; $0624: $19
	ld   a, (hl)                                     ; $0625: $7e
	cp   $f6                                         ; $0626: $fe $f6
	jr   c, +                              ; $0628: $38 $02

	ld   a, $00                                      ; $062a: $3e $00

+
// store NPC 1st byte into cb30
	ld   hl, wNPC1stBytes                                   ; $062c: $21 $30 $cb
	add  hl, bc                                      ; $062f: $09
	ld   (hl), a                                     ; $0630: $77
	inc  de                                          ; $0631: $13

// get 2nd byte
	ld   hl, $c006                                   ; $0632: $21 $06 $c0
	ldi  a, (hl)                                     ; $0635: $2a
	ld   h, (hl)                                     ; $0636: $66
	ld   l, a                                        ; $0637: $6f
	add  hl, de                                      ; $0638: $19
	ld   a, (hl)                                     ; $0639: $7e
	inc  de                                          ; $063a: $13

// lower 6 bits into cb84 region
	push af                                          ; $063b: $f5
	and  $3f                                         ; $063c: $e6 $3f
	ld   hl, wNPC2ndByteLower6Bits                                   ; $063e: $21 $84 $cb
	add  hl, bc                                      ; $0641: $09
	ld   (hl), a                                     ; $0642: $77

// 3rd byte into cb3c region
	ld   hl, $c006                                   ; $0643: $21 $06 $c0
	ldi  a, (hl)                                     ; $0646: $2a
	ld   h, (hl)                                     ; $0647: $66
	ld   l, a                                        ; $0648: $6f
	add  hl, de                                      ; $0649: $19
	ld   a, (hl)                                     ; $064a: $7e
	ld   hl, wNPC3rdBytesOrXCoords                                   ; $064b: $21 $3c $cb
	add  hl, bc                                      ; $064e: $09
	ld   (hl), a                                     ; $064f: $77
	inc  de                                          ; $0650: $13

// 4th byte into cb48 region
	ld   hl, $c006                                   ; $0651: $21 $06 $c0
	ldi  a, (hl)                                     ; $0654: $2a
	ld   h, (hl)                                     ; $0655: $66
	ld   l, a                                        ; $0656: $6f
	add  hl, de                                      ; $0657: $19
	ld   a, (hl)                                     ; $0658: $7e
	ld   hl, wNPC4thBytesOrYCoords                                   ; $0659: $21 $48 $cb
	add  hl, bc                                      ; $065c: $09
	ld   (hl), a                                     ; $065d: $77
	inc  de                                          ; $065e: $13
	pop  af                                          ; $065f: $f1

// check 2nd NPC byte bit 7
// if not set, have DE inc'ed
	push af                                          ; $0660: $f5
	bit  7, a                                        ; $0661: $cb $7f
	jr   z, +                              ; $0663: $28 $1e

// get npc 3rd byte
	dec  de                                          ; $0665: $1b
	ld   hl, wNPC3rdBytesOrXCoords                                   ; $0666: $21 $3c $cb
	add  hl, bc                                      ; $0669: $09
	ld   a, (hl)                                     ; $066a: $7e
	push af                                          ; $066b: $f5
// put lower nybble in upper nybble, and store in cb48
	and  $0f                                         ; $066c: $e6 $0f
	sla  a                                           ; $066e: $cb $27
	sla  a                                           ; $0670: $cb $27
	sla  a                                           ; $0672: $cb $27
	sla  a                                           ; $0674: $cb $27
	ld   hl, wNPC4thBytesOrYCoords                                   ; $0676: $21 $48 $cb
	add  hl, bc                                      ; $0679: $09
	ld   (hl), a                                     ; $067a: $77
// put upper nybble in cb3c
	pop  af                                          ; $067b: $f1
	and  $f0                                         ; $067c: $e6 $f0
	ld   hl, wNPC3rdBytesOrXCoords                                   ; $067e: $21 $3c $cb
	add  hl, bc                                      ; $0681: $09
	ld   (hl), a                                     ; $0682: $77

+
// check NPC 2nd byte bit 6
	pop  af                                          ; $0683: $f1
	and  $40                                         ; $0684: $e6 $40
	jr   z, +                              ; $0686: $28 $08

// if set, adjust cb48 by 8 (lower NPC by 8 pixels down?)
	ld   hl, wNPC4thBytesOrYCoords                                   ; $0688: $21 $48 $cb
	add  hl, bc                                      ; $068b: $09
	ld   a, (hl)                                     ; $068c: $7e
	add  $08                                         ; $068d: $c6 $08
	ld   (hl), a                                     ; $068f: $77

+
	ld   hl, $c0fc                                   ; $0690: $21 $fc $c0
	ld   a, (hl)                                     ; $0693: $7e
	ld   hl, $cbf0                                   ; $0694: $21 $f0 $cb
	add  hl, bc                                      ; $0697: $09
	ld   (hl), a                                     ; $0698: $77
	inc  bc                                          ; $0699: $03

@next_069a:
	call inc_c0fc_wrap127to0                               ; $069a: $cd $3a $07
	jp   @bigLoop_05f3                               ; $069d: $c3 $f3 $05

@next_06a0:
// fill the rest of npc 1st byte with $ff to not process them
-
	ld   a, c                                        ; $06a0: $79
	cp   $0c                                         ; $06a1: $fe $0c
	jp   nc, +                           ; $06a3: $d2 $b0 $06

	ld   hl, wNPC1stBytes                                   ; $06a6: $21 $30 $cb
	add  hl, bc                                      ; $06a9: $09
	ld   (hl), $ff                                   ; $06aa: $36 $ff
	inc  bc                                          ; $06ac: $03
	jp   -                               ; $06ad: $c3 $a0 $06

+
//
	ld   de, $0000                                   ; $06b0: $11 $00 $00

@bigLoop_06b3:
	ld   bc, $0000                                   ; $06b3: $01 $00 $00

@slightlySmallerLoop_06b6:
	call store16ePlusCin_c01e                               ; $06b6: $cd $0d $09
	ld   hl, $c0a0                                   ; $06b9: $21 $a0 $c0
	ld   (hl), c                                     ; $06bc: $71
	ld   hl, $c01e                                   ; $06bd: $21 $1e $c0
	ld   c, (hl)                                     ; $06c0: $4e
	ld   b, $00                                      ; $06c1: $06 $00
	ld   hl, wAnother2x2blockForGameScreenTilesTODO                                   ; $06c3: $21 $00 $c3
	add  hl, bc                                      ; $06c6: $09
	ld   a, (hl)                                     ; $06c7: $7e
	ld   hl, $c0a0                                   ; $06c8: $21 $a0 $c0
	ld   c, (hl)                                     ; $06cb: $4e
	ld   b, $00                                      ; $06cc: $06 $00
	cp   $27                                         ; $06ce: $fe $27
	jr   nz, +                             ; $06d0: $20 $03

	jp   @next_070a                               ; $06d2: $c3 $0a $07

+
	cp   $10                                         ; $06d5: $fe $10
	jr   nc, @next_070a                             ; $06d7: $30 $31

	cp   $03                                         ; $06d9: $fe $03
	jr   c, @next_070a                              ; $06db: $38 $2d

	push af                                          ; $06dd: $f5
	call Call_000_072c                               ; $06de: $cd $2c $07
	jr   nc, +                             ; $06e1: $30 $20

// deals with clearing tiles, eg bombs if bombs gotten
	pop  af                                          ; $06e3: $f1
	ld   a, c                                        ; $06e4: $79
	push af                                          ; $06e5: $f5
	ld   hl, $c01e                                   ; $06e6: $21 $1e $c0
	ld   c, (hl)                                     ; $06e9: $4e
	ld   b, $00                                      ; $06ea: $06 $00
	ld   a, $00                                      ; $06ec: $3e $00
	ld   hl, wAnother2x2blockForGameScreenTilesTODO                                   ; $06ee: $21 $00 $c3
	add  hl, bc                                      ; $06f1: $09
	ld   (hl), a                                     ; $06f2: $77
	ld   hl, wRoomStructByteWhenFirstByteBitSet2                                   ; $06f3: $21 $79 $c0
	ld   a, (hl)                                     ; $06f6: $7e
	ld   hl, w2x2gameScreenTiles                                   ; $06f7: $21 $b0 $c3
	add  hl, bc                                      ; $06fa: $09
	ld   (hl), a                                     ; $06fb: $77
	pop  af                                          ; $06fc: $f1
	ld   c, a                                        ; $06fd: $4f
	ld   b, $00                                      ; $06fe: $06 $00
	jp   @next_0707                               ; $0700: $c3 $07 $07

+
	pop  af                                          ; $0703: $f1
	call Call_000_085c                               ; $0704: $cd $5c $08

@next_0707:
	call inc_c0fc_wrap127to0                               ; $0707: $cd $3a $07

@next_070a:
	inc  bc                                          ; $070a: $03
	ld   a, c                                        ; $070b: $79
	cp   $10                                         ; $070c: $fe $10
	jr   c, @slightlySmallerLoop_06b6                              ; $070e: $38 $a6

	inc  de                                          ; $0710: $13
	ld   a, e                                        ; $0711: $7b
	cp   $0b                                         ; $0712: $fe $0b
	jr   c, @bigLoop_06b3                              ; $0714: $38 $9d

// clear c660-c663
	ld   bc, $0003                                   ; $0716: $01 $03 $00
	ld   a, $00                                      ; $0719: $3e $00
-
	dec  bc                                          ; $071b: $0b
	ld   hl, $c660                                   ; $071c: $21 $60 $c6
	add  hl, bc                                      ; $071f: $09
	ld   (hl), a                                     ; $0720: $77
	jr   nz, -                             ; $0721: $20 $f8

// clear c07d, back to bank 0
	ld   hl, $c07d                                   ; $0723: $21 $7d $c0
	ld   (hl), a                                     ; $0726: $77
	ld   hl, $0000                                   ; $0727: $21 $00 $00
	ld   (hl), a                                     ; $072a: $77
	ret                                              ; $072b: $c9


//----------------- seems to be room flags-related
Call_000_072c:
	push bc                                          ; $072c: $c5
	call Call_000_0749                               ; $072d: $cd $49 $07
	ld   hl, wRoomFlags                                   ; $0730: $21 $00 $c1
	add  hl, bc                                      ; $0733: $09
	and  (hl)                                        ; $0734: $a6
	cp   $01                                         ; $0735: $fe $01
	ccf                                              ; $0737: $3f
	pop  bc                                          ; $0738: $c1
	ret                                              ; $0739: $c9


inc_c0fc_wrap127to0:
	ld   hl, $c0fc                                   ; $073a: $21 $fc $c0
	inc  (hl)                                        ; $073d: $34
	res  7, (hl)                                     ; $073e: $cb $be
	ret                                              ; $0740: $c9


bitTable:
	.db $01 $02 $04 $08 $10 $20 $40 $80


Call_000_0749:
// low 3 bits of c0fc go into returned a
// (value to check against room flags?)
	ld   hl, $c0fc                                   ; $0749: $21 $fc $c0
	ld   a, (hl)                                     ; $074c: $7e
	and  $07                                         ; $074d: $e6 $07
	ld   c, a                                        ; $074f: $4f
	ld   b, $00                                      ; $0750: $06 $00
	ld   hl, bitTable                                   ; $0752: $21 $41 $07
	add  hl, bc                                      ; $0755: $09
	ld   a, (hl)                                     ; $0756: $7e
	push af                                          ; $0757: $f5
// upper 5 bits of c0fc, add to (c0fd), put into c
// byte checked against above, to see if room flag set?
	ld   hl, $c0fc                                   ; $0758: $21 $fc $c0
	ld   a, (hl)                                     ; $075b: $7e
	srl  a                                           ; $075c: $cb $3f
	srl  a                                           ; $075e: $cb $3f
	srl  a                                           ; $0760: $cb $3f
	ld   hl, $c0fd                                   ; $0762: $21 $fd $c0
	add  (hl)                                        ; $0765: $86
	ld   c, a                                        ; $0766: $4f
	ld   b, $00                                      ; $0767: $06 $00
	pop  af                                          ; $0769: $f1
	ret                                              ; $076a: $c9


convertCurrTileUsingTable_02_4acd:
	push af                                          ; $076b: $f5
// bank 2
	ld   hl, $0002                                   ; $076c: $21 $02 $00
	ld   (hl), a                                     ; $076f: $77
// de = ($c028 - address of layout data) // 4
	ld   hl, $c028                                   ; $0770: $21 $28 $c0
	ld   a, (hl)                                     ; $0773: $7e
	srl  a                                           ; $0774: $cb $3f
	srl  a                                           ; $0776: $cb $3f
	ld   e, a                                        ; $0778: $5f
	ld   d, $00                                      ; $0779: $16 $00
// word in $c091 + layout data byte in de, store in
	ld   hl, wAddrOfRooms40hTableAt_02_4acd                                   ; $077b: $21 $91 $c0
	ldi  a, (hl)                                     ; $077e: $2a
	ld   h, (hl)                                     ; $077f: $66
	ld   l, a                                        ; $0780: $6f
	add  hl, de                                      ; $0781: $19
	ld   e, (hl)                                     ; $0782: $5e
	ld   d, $00                                      ; $0783: $16 $00
	pop  af                                          ; $0785: $f1
	ld   l, a                                        ; $0786: $6f
	ld   h, $00                                      ; $0787: $26 $00
	ld   (hl), a                                     ; $0789: $77
	ret                                              ; $078a: $c9


Call_000_078b:
	push de                                          ; $078b: $d5
	push bc                                          ; $078c: $c5
	ld   hl, wTileLayoutDataBank                                   ; $078d: $21 $5c $c0
	ld   l, (hl)                                     ; $0790: $6e
	ld   h, $00                                      ; $0791: $26 $00
	ld   (hl), a                                     ; $0793: $77

//
	ld   hl, wOffsetIntoCompressedRoomLayoutPerScreenRow                                   ; $0794: $21 $e0 $c5
	add  hl, de                                      ; $0797: $19
	ld   a, (hl)                                     ; $0798: $7e
	ld   e, a                                        ; $0799: $5f
	ld   d, $00                                      ; $079a: $16 $00
	ld   a, $00                                      ; $079c: $3e $00
	ld   hl, $c0a1                                   ; $079e: $21 $a1 $c0
	ld   (hl), a                                     ; $07a1: $77
	ld   a, $ff                                      ; $07a2: $3e $ff
	ld   hl, $c0a2                                   ; $07a4: $21 $a2 $c0
	ld   (hl), a                                     ; $07a7: $77

@loop_07a8:
	ld   hl, wRoomCompressedLayoutAddr                                   ; $07a8: $21 $75 $c0
	ldi  a, (hl)                                     ; $07ab: $2a
	ld   h, (hl)                                     ; $07ac: $66
	ld   l, a                                        ; $07ad: $6f
	add  hl, de                                      ; $07ae: $19
	ld   a, (hl)                                     ; $07af: $7e
	and  $03                                         ; $07b0: $e6 $03
	add  $01                                         ; $07b2: $c6 $01
	push af                                          ; $07b4: $f5
	ld   a, (hl)                                     ; $07b5: $7e
	and  $fc                                         ; $07b6: $e6 $fc
	ld   b, a                                        ; $07b8: $47
	ld   hl, $c0a2                                   ; $07b9: $21 $a2 $c0
	cp   (hl)                                        ; $07bc: $be
	jr   nz, +                             ; $07bd: $20 $07

	pop  af                                          ; $07bf: $f1
	sla  a                                           ; $07c0: $cb $27
	sla  a                                           ; $07c2: $cb $27
	push af                                          ; $07c4: $f5
	ld   a, b                                        ; $07c5: $78

+
	ld   hl, $c0a2                                   ; $07c6: $21 $a2 $c0
	ld   (hl), a                                     ; $07c9: $77
	pop  af                                          ; $07ca: $f1
	ld   hl, $c0a1                                   ; $07cb: $21 $a1 $c0
	dec  (hl)                                        ; $07ce: $35
	add  (hl)                                        ; $07cf: $86
	ld   (hl), a                                     ; $07d0: $77
	cp   c                                           ; $07d1: $b9
	jr   nc, @next_07dc                             ; $07d2: $30 $08

	ld   hl, $c0a1                                   ; $07d4: $21 $a1 $c0
	inc  (hl)                                        ; $07d7: $34
	inc  de                                          ; $07d8: $13
	jp   @loop_07a8                               ; $07d9: $c3 $a8 $07

@next_07dc:
	ld   a, b                                        ; $07dc: $78
	ld   hl, $c028                                   ; $07dd: $21 $28 $c0
	ld   (hl), a                                     ; $07e0: $77
	ld   a, $00                                      ; $07e1: $3e $00
	call convertCurrTileUsingTable_02_4acd                               ; $07e3: $cd $6b $07
	ld   a, e                                        ; $07e6: $7b
	cp   $00                                         ; $07e7: $fe $00
	jr   z, +                              ; $07e9: $28 $08

	ld   hl, wRoomStructByteWhenFirstByteBitSet2                                   ; $07eb: $21 $79 $c0
	ld   a, (hl)                                     ; $07ee: $7e
	ld   hl, $c028                                   ; $07ef: $21 $28 $c0
	ld   (hl), a                                     ; $07f2: $77

+
	ld   hl, $0000                                   ; $07f3: $21 $00 $00
	ld   (hl), a                                     ; $07f6: $77
	pop  bc                                          ; $07f7: $c1
	pop  de                                          ; $07f8: $d1
	ret                                              ; $07f9: $c9


aDivEqu16:
	srl  a
	srl  a
	srl  a
	srl  a
	ret


ecEquEtimesC:
// c0a0/2 into ec
// clear $c0a1
	ld   hl, $c0a0                                   ; $0803: $21 $a0 $c0
	ld   (hl), e                                     ; $0806: $73
	ld   hl, $c0a2                                   ; $0807: $21 $a2 $c0
	ld   (hl), c                                     ; $080a: $71
	ld   a, $00                                      ; $080b: $3e $00
	ld   hl, $c0a1                                   ; $080d: $21 $a1 $c0
	ld   (hl), a                                     ; $0810: $77

	ld   bc, $0008                                   ; $0811: $01 $08 $00
@loop:
// shift left word, $c0a1 / a
	sla  a                                           ; $0814: $cb $27
	ld   hl, $c0a1                                   ; $0816: $21 $a1 $c0
	rl   (hl)                                        ; $0819: $cb $16

// if bit set in $c0a0 (orig e)...
	ld   hl, $c0a0                                   ; $081b: $21 $a0 $c0
	sla  (hl)                                        ; $081e: $cb $26
	jr   nc, +                             ; $0820: $30 $0a

// a += orig c
	ld   hl, $c0a2                                   ; $0822: $21 $a2 $c0
	add  (hl)                                        ; $0825: $86
	jr   nc, +                             ; $0826: $30 $04

// because it's a word, if a carry found, $c0a1 += 1
	ld   hl, $c0a1                                   ; $0828: $21 $a1 $c0
	inc  (hl)                                        ; $082b: $34

+
// loop bc, preserve a
	ld   l, a                                        ; $082c: $6f
	dec  bc                                          ; $082d: $0b
	ld   a, c                                        ; $082e: $79
	or   b                                           ; $082f: $b0
	ld   a, l                                        ; $0830: $7d
	jr   nz, @loop                             ; $0831: $20 $e1

// c from a is part of algo bits shifting in
// e is $c0a1
// ec is the word $c0a1/a (e*c)
	ld   c, a                                        ; $0833: $4f
	ld   b, $00                                      ; $0834: $06 $00
	ld   hl, $c0a1                                   ; $0836: $21 $a1 $c0
	ld   e, (hl)                                     ; $0839: $5e
	ld   d, $00                                      ; $083a: $16 $00
	ret                                              ; $083c: $c9


ecPlusEquA:
	add  c
	ld   c, a
	ld   a, e
	adc  $00
	ld   e, a
	ret


bcDivA_divInC_modInAB:
	push de
	push hl
	ld   d, a
	ld   a, b
	ld   e, $08

// a in d, b in a
// if word is ac, ac *= 2
// if bit carried from a, or a >= d, a -= d, c += 1
@nextBit:
	sla  c
	rl   a
	jr   c, +

	cp   d
	jr   c, ++

+
	sub  d
	inc  c

++
	dec  e
	jr   nz, @nextBit

	ld   b, a
	pop  hl
	pop  de
	ret


Call_000_085c:
	push af                                          ; $085c: $f5
	ld   hl, $c00c                                   ; $085d: $21 $0c $c0
	ld   (hl), c                                     ; $0860: $71
	ld   bc, $0000                                   ; $0861: $01 $00 $00

-
	ld   hl, $c496                                   ; $0864: $21 $96 $c4
	add  hl, bc                                      ; $0867: $09
	ld   a, (hl)                                     ; $0868: $7e
	cp   $00                                         ; $0869: $fe $00
	jr   z, @next_0877                              ; $086b: $28 $0a

	inc  bc                                          ; $086d: $03
	ld   a, c                                        ; $086e: $79
	cp   $0c                                         ; $086f: $fe $0c
	jr   c, -                              ; $0871: $38 $f1

	pop  af                                          ; $0873: $f1
	jp   @done                               ; $0874: $c3 $a6 $08

@next_0877:
	pop  af                                          ; $0877: $f1
	ld   hl, $c496                                   ; $0878: $21 $96 $c4
	add  hl, bc                                      ; $087b: $09
	ld   (hl), a                                     ; $087c: $77
	call Call_000_08fc                               ; $087d: $cd $fc $08
	ld   hl, $c028                                   ; $0880: $21 $28 $c0
	ld   a, (hl)                                     ; $0883: $7e
	ld   hl, $c4ba                                   ; $0884: $21 $ba $c4
	add  hl, bc                                      ; $0887: $09
	ld   (hl), a                                     ; $0888: $77
	ld   hl, $c00c                                   ; $0889: $21 $0c $c0
	ld   a, (hl)                                     ; $088c: $7e
	ld   hl, $c4a2                                   ; $088d: $21 $a2 $c4
	add  hl, bc                                      ; $0890: $09
	ld   (hl), a                                     ; $0891: $77
	ld   a, e                                        ; $0892: $7b
	ld   hl, $c4ae                                   ; $0893: $21 $ae $c4
	add  hl, bc                                      ; $0896: $09
	ld   (hl), a                                     ; $0897: $77
	ld   hl, $c0fc                                   ; $0898: $21 $fc $c0
	ld   a, (hl)                                     ; $089b: $7e
	ld   hl, $c4c6                                   ; $089c: $21 $c6 $c4
	add  hl, bc                                      ; $089f: $09
	ld   (hl), a                                     ; $08a0: $77
	inc  bc                                          ; $08a1: $03
	ld   hl, $c57e                                   ; $08a2: $21 $7e $c5
	ld   (hl), c                                     ; $08a5: $71

@done:
	ld   hl, $c00c                                   ; $08a6: $21 $0c $c0
	ld   c, (hl)                                     ; $08a9: $4e
	ld   b, $00                                      ; $08aa: $06 $00
	ret                                              ; $08ac: $c9


data_08ad:
	nop                                              ; $08ad: $00
	rst  $38                                         ; $08ae: $ff
	rst  $38                                         ; $08af: $ff
	sbc  b                                           ; $08b0: $98
	ret  c                                           ; $08b1: $d8

	call nc, $80c4                                   ; $08b2: $d4 $c4 $80
	rst  $38                                         ; $08b5: $ff
	ret  nc                                          ; $08b6: $d0

	ld   b, b                                        ; $08b7: $40
	call c, $ffff                                    ; $08b8: $dc $ff $ff
	.db  $e4                                         ; $08bb: $e4
	ret  nz                                          ; $08bc: $c0

	ld   a, h                                        ; $08bd: $7c
	ld   a, h                                        ; $08be: $7c
	rst  $38                                         ; $08bf: $ff
	rst  $38                                         ; $08c0: $ff
	.db  $fc                                         ; $08c1: $fc
	ld   a, h                                        ; $08c2: $7c
	ld   a, h                                        ; $08c3: $7c
	.db  $fc                                         ; $08c4: $fc
	ldh  (<$ff), a                                   ; $08c5: $e0 $ff
	rst  $38                                         ; $08c7: $ff
	rst  $38                                         ; $08c8: $ff
	rst  $38                                         ; $08c9: $ff
	rst  $38                                         ; $08ca: $ff
	rst  $38                                         ; $08cb: $ff
	rst  $38                                         ; $08cc: $ff
	rst  $38                                         ; $08cd: $ff
	rst  $38                                         ; $08ce: $ff
	rst  $38                                         ; $08cf: $ff
	rst  $38                                         ; $08d0: $ff
	rst  $38                                         ; $08d1: $ff
	rst  $38                                         ; $08d2: $ff
	rst  $38                                         ; $08d3: $ff
	ret  z                                           ; $08d4: $c8

	rst  $38                                         ; $08d5: $ff
	rst  $38                                         ; $08d6: $ff
	rst  $38                                         ; $08d7: $ff
	jr   z, -$01                                      ; $08d8: $28 $ff

	rst  $38                                         ; $08da: $ff
	rst  $38                                         ; $08db: $ff
	rst  $38                                         ; $08dc: $ff
	rst  $38                                         ; $08dd: $ff
	rst  $38                                         ; $08de: $ff
	rst  $38                                         ; $08df: $ff
	rst  $38                                         ; $08e0: $ff
	rst  $38                                         ; $08e1: $ff
	rst  $38                                         ; $08e2: $ff
	rst  $38                                         ; $08e3: $ff
	rst  $38                                         ; $08e4: $ff
	rst  $38                                         ; $08e5: $ff
	rst  $38                                         ; $08e6: $ff
	rst  $38                                         ; $08e7: $ff
	rst  $38                                         ; $08e8: $ff
	rst  $38                                         ; $08e9: $ff
	rst  $38                                         ; $08ea: $ff
	rst  $38                                         ; $08eb: $ff
	rst  $38                                         ; $08ec: $ff
	ld   bc, $0905                                   ; $08ed: $01 $05 $09
	dec  c                                           ; $08f0: $0d
	ld   de, $1915                                   ; $08f1: $11 $15 $19
	dec  e                                           ; $08f4: $1d
	ld   hl, $b9b5                                   ; $08f5: $21 $b5 $b9
	cp   l                                           ; $08f8: $bd
	sub  c                                           ; $08f9: $91
	sub  l                                           ; $08fa: $95
	sbc  c                                           ; $08fb: $99

Call_000_08fc:
	push bc                                          ; $08fc: $c5
	push af                                          ; $08fd: $f5
	ld   c, a                                        ; $08fe: $4f
	ld   b, $00                                      ; $08ff: $06 $00
	ld   hl, data_08ad                                   ; $0901: $21 $ad $08
	add  hl, bc                                      ; $0904: $09
	ld   a, (hl)                                     ; $0905: $7e
	ld   hl, $c028                                   ; $0906: $21 $28 $c0
	ld   (hl), a                                     ; $0909: $77
	pop  af                                          ; $090a: $f1
	pop  bc                                          ; $090b: $c1
	ret                                              ; $090c: $c9


store16ePlusCin_c01e:
	push af
	ld   a, e
// a *= 16
	sla  a
	sla  a
	sla  a
	sla  a
	add  c
	ld   hl, $c01e
	ld   (hl), a
	pop  af
	ret


;;
	ret                                              ; $091e: $c9


	ld   hl, $c068                                   ; $091f: $21 $68 $c0
	ld   a, (hl)                                     ; $0922: $7e
	ld   l, a                                        ; $0923: $6f
	ld   h, $00                                      ; $0924: $26 $00
	ld   (hl), a                                     ; $0926: $77
	ld   de, $0000                                   ; $0927: $11 $00 $00

-
	ld   hl, $c062                                   ; $092a: $21 $62 $c0
	ldi  a, (hl)                                     ; $092d: $2a
	ld   h, (hl)                                     ; $092e: $66
	ld   l, a                                        ; $092f: $6f
	add  hl, de                                      ; $0930: $19
	ld   a, (hl)                                     ; $0931: $7e
	inc  de                                          ; $0932: $13
	cp   $ff                                         ; $0933: $fe $ff
	jr   z, +                              ; $0935: $28 $0b

	cp   $01                                         ; $0937: $fe $01
	jr   z, +                              ; $0939: $28 $07

	ld   hl, $2007                                   ; $093b: $21 $07 $20
	ld   (hl), a                                     ; $093e: $77
	jp   -                               ; $093f: $c3 $2a $09

+
	ld   hl, $c09a                                   ; $0942: $21 $9a $c0
	ld   (hl), a                                     ; $0945: $77
	ld   hl, $0004                                   ; $0946: $21 $04 $00
	ld   (hl), a                                     ; $0949: $77
	ret                                              ; $094a: $c9
