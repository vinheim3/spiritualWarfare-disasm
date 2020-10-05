
playSoundChannelADataInDE:
// 13 bytes for each audio channel, and 5th thing
	call getChannelRamOffsetFromAandRetZ
	jp   z, +

	ret

+
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	bit  7, a
	jp   z, +

// bit 7 set (channel already in use), return Z clear
	ld   a, $01
	or   a
	ret

+
// set delay to 1, so it plays immediately
	ld   a, $01
	ld   hl, wSoundChannelA.delayCounter
	add  hl, bc
	ld   (hl), a

// use 1st preset (12.5% duty cycle, etc)
	ld   a, $00
	ld   hl, wSoundChannelA.presetIdx
	add  hl, bc
	ld   (hl), a

// e into byte 2 and 4
	ld   hl, wSoundChannelA.origSoundDataAddr
	add  hl, bc
	ld   (hl), e
	ld   hl, wSoundChannelA.currSoundDataAddr
	add  hl, bc
	ld   (hl), e

// d into byte 3 and 5
	ld   hl, wSoundChannelA.origSoundDataAddr+1
	add  hl, bc
	ld   (hl), d
	ld   hl, wSoundChannelA.currSoundDataAddr+1
	add  hl, bc
	ld   (hl), d

// c0 into byte 0 - channel in use + sound started playing
	ld   a, $c0
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   (hl), a

// set if currently selecting twice speed, a value given from bank0 or quizzes
	ld   hl, wSoundIsTwiceSpeed
	ld   a, (hl)
	ld   hl, wSoundChannelA.isTwiceSpeed
	add  hl, bc
	ld   (hl), a
	ret


stopHWSoundChannelA:
// if $ff, call this func for a = 0 to 4
// then go to below at wSoundChannelA.controlByteAndHWChannelAddr
	cp   $ff
	jp   nz, @processForSoundChannel

	ld   a, $00
-
	push af
	call stopHWSoundChannelA
	jp   nz, @doneFF

	pop  af
	add  $01
	jp   -

// done when a = 5
@doneFF:
	pop  af
	xor  a
	ret

@processForSoundChannel:
	call getChannelRamOffsetFromAandRetZ
	jp   z, _stopHWSoundChannel

	ret

_stopHWSoundChannel:
// if sound channel not even on, go to done
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	bit  7, a
	jr   z, @done

// only do stuff if.controlByteAndHWChannelAddr bit 7 set
	and  $60
	jp   z, +

// bit 5 or 6 set - free up sound channel struct and go to done
	ld   a, $00
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   (hl), a
	jp   @done

+
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)

// clear.controlByteAndHWChannelAddr, then..
	push af
	ld   a, $00
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   (hl), a
	pop  af

// ..$c09a is the hw register 1st address
	and  $1f
	ld   hl, wSoundHWReg1stAddr
	ld   (hl), a

// for every sound channel struct
// if bit 7 and bit 5 unset, and its on the same sound channel
// unset its bit 5, meaning it can be resumed
	ld   bc, $0000
@nextSoundChannelStruct:
	push bc
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc

	ld   a, (hl)
	bit  7, a
	jr   z, @gotoNextSoundChannelStruct

	and  $20
	jp   z, @gotoNextSoundChannelStruct

// go to next sound channel struct if bit 7 or 5 unset
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)

// if hw regs isn't the same as the one we're querying
// go to next sound channel struct
	and  $1f
	ld   hl, wSoundHWReg1stAddr
	xor  (hl)
	jp   nz, @gotoNextSoundChannelStruct

	pop  bc

// reset bit 5 of .controlByteAndHWChannelAddr
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	and  $df
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   (hl), a

	jp   @done

@gotoNextSoundChannelStruct:
	pop  bc
	ld   a, SoundChannel.end-SoundChannel.start
	call b4_addAtoBC
	ld   a, c
	cp   <wSoundChannelEnd
	jp   c, @nextSoundChannelStruct

@done:
	xor  a
	ret


updateSounds:
	ld   bc, $0000
// for each sound channel struct, we process only if bit 7 is set
-
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	bit  7, a
	jr   z, @firstNextSoundChannelStruct

// bit 7 of byte 0 set, dec .delayCounter
// byte 1 acts as a sort of delay, we process once it's 0
	ld   hl, wSoundChannelA.delayCounter
	add  hl, bc
	dec  (hl)
	jp   z, @processSoundChannelStruct

// bit 7 unset, go to next sound channel struct
@firstNextSoundChannelStruct:
	ld   a, SoundChannel.end-SoundChannel.start
	call b4_addAtoBC
	ld   a, c
	cp   <wSoundChannelEnd
	jp   c, -

	ret

@processSoundChannelStruct:
// de is currSoundDataAddr
	ld   hl, wSoundChannelA.currSoundDataAddr
	add  hl, bc
	ld   e, (hl)
	ld   hl, wSoundChannelA.currSoundDataAddr+1
	add  hl, bc
	ld   d, (hl)

// check data byte
	ld   a, (de)
	cp   $a0
	jp   nc, @currSoundDataAddrGTEa0h

// val in de < $a0
// upper 3 bits for delay and len
	call setSoundChannelDelayAndLen

// frequency table does not depend on presetIdx
	ld   hl, wSoundChannelA.presetIdx
	add  hl, bc
	ld   a, (hl)
	sla  a
	ld   hl, freqTablesIdxedByte6
	call b4_addAtoHL

// hl is word in hl -> 22d7
	push de
	call b4_deEquWordInHL
	ld   l, e
	ld   h, d
	pop  de

// choose frequency from 32 choices
	ld   a, (de)
	and  $1f
	cp   $1f
	jr   z, @incDataAddrthenNextSoundChannelStruct

// double index into hl, get 2 bytes..
	sla  a
	call b4_addAtoHL
	ld   a, (hl)

// store as new frequency
	push hl
	ld   hl, wNewSoundChannelFrequency
	ld   (hl), a
	pop  hl

// high byte of frequency
	inc  hl
	ld   a, (hl)
	ld   hl, wNewSoundChannelFrequency+1
	ld   (hl), a
	call updateSoundChannelsFrequency

// copy 5 new bytes, then go to next sound struct
	call copy5bytesToSoundRegGroup

@incDataAddrthenNextSoundChannelStruct:
	call incSoundStructCurrDataAddr
	jp   @firstNextSoundChannelStruct

@currSoundDataAddrGTEa0h:
	cp   $b0
	jp   nc, @currSoundDataAddrGTEb0h

// currSoundDataAddr value between $a0 and $af
// $a4 to $af change to $a3
	cp   $a4
	jp   c, +

	ld   a, $a3
+
// value to be between 0 to 3, get bytes from preset into struct
	sub  $a0
	ld   hl, wSoundChannelA.presetIdx
	add  hl, bc
	ld   (hl), a
	call loadPresetIntoStructHWBytes
	call incSoundStructCurrDataAddr
	jp   @processSoundChannelStruct

@soundChannelRegOffsets:
	.db rAUD1SWEEP-$ff10
	.db rAUD2LEN-$ff10-1 // has only 4 bytes
	.db rAUD3ENA-$ff10
	.db rAUD4LEN-$ff10
	
@currSoundDataAddrGTEb0h:
	cp   $b4
	jp   nc, @gteB4

// b0 to b3, use new hw channel
	sub  $b0
	ld   hl, @soundChannelRegOffsets
	call b4_addAtoHL
	ld   a, (hl)

// set new hw sound channel we will change to, clearing bit 5 and 6
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	or   (hl)
	and  $9f
	ld   hl, wControlByteBit0AndHWReg
	ld   (hl), a

// for every other sound channel
	push bc
	ld   bc, $0000
@nextSoundChannelStruct:
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	ld   hl, wControlByteBit0AndHWReg
	xor  (hl)
	jp   nz, +

// if this sound channel struct is the same as the one we're changing to
// set bit 5 of byte 0
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	or   $20
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   (hl), a
+
	ld   a, SoundChannel.end-SoundChannel.start
	call b4_addAtoBC
	ld   a, c
	cp   <wSoundChannelEnd
	jp   c, @nextSoundChannelStruct

	pop  bc

// start using new hw sound channel
	ld   hl, wControlByteBit0AndHWReg
	ld   a, (hl)
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   (hl), a

	call incSoundStructCurrDataAddr
	jp   @processSoundChannelStruct

@gteB4:
	cp   $b9
	jp   nc, @gteB9

// b4 to b8, eg indexes 0 to 4, set hw channel reg for curr channel
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	and  $60
	jp   z, +

	jp   @incDataAddrSetDelayTo1

+
// if bit 5 and 6 not set..
// hl = 1st hardware sound reg
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	and  $1f
	ld   hl, $ff10
	call b4_addAtoHL

// val in de, -$b4, is offset into hw reg we want to modify
	ld   a, (de)
	sub  $b4
	call b4_addAtoHL
// next byte in de is value to store in that hw reg
	inc  de
	ld   a, (de)
	ldi  (hl), a

// big loops
@incDataAddrTwiceSetDelayTo1:
	call incSoundStructCurrDataAddr

@incDataAddrSetDelayTo1:
	call incSoundStructCurrDataAddr
	ld   a, $01
	ld   hl, wSoundChannelA.delayCounter
	add  hl, bc
	ld   (hl), a
	jp   @firstNextSoundChannelStruct

@gteB9:
	cp   $b9
	jp   nz, @gteBA

// b9 means loop back to beginning of data, copy word 2/3 into word 4/5
	ld   hl, wSoundChannelA.origSoundDataAddr
	add  hl, bc
	ld   a, (hl)
	ld   hl, wSoundChannelA.currSoundDataAddr
	add  hl, bc
	ld   (hl), a

	ld   hl, wSoundChannelA.origSoundDataAddr+1
	add  hl, bc
	ld   a, (hl)
	ld   hl, wSoundChannelA.currSoundDataAddr+1
	add  hl, bc
	ld   (hl), a
	jp   @processSoundChannelStruct

@gteBA:
	cp   $ba
	jp   nz, @gteBB

// if control byte is $ba, stop
	push bc
	call _stopHWSoundChannel
	pop  bc
	jp   @incDataAddrSetDelayTo1

@gteBB:
	cp   $bb
	jp   nz, @gteBC

// if bb, next byte *= 16,
// set initial value of envelope
// 3's output level
// 4's poly shift clock freq
	inc  de
	ld   a, (de)
	sla  a
	sla  a
	sla  a
	sla  a
	ld   hl, wSoundChannelA.hwReg2
	add  hl, bc
	ldi  (hl), a
// past opcode and param
	call incSoundStructCurrDataAddr
	call incSoundStructCurrDataAddr
	jp   @processSoundChannelStruct

@gteBC:
	cp   $bc
	jr   nz, @gteBD

// if bc, sound data addr is next word (jump)
	inc  de
	push de
	pop  hl
	call b4_deEquWordInHL
	ld   hl, wSoundChannelA.currSoundDataAddr
	add  hl, bc
	call b4_deIntoHL
	jp   @processSoundChannelStruct

@gteBD:
	cp   $bd
	jr   nz, @gteBE

// if byte is bd, the next byte is the next delay counter
	inc  de
	ld   a, (de)
	ld   hl, wSoundChannelA.delayCounter
	add  hl, bc
	ld   (hl), a
	call incSoundStructCurrDataAddr
	jp   @incDataAddrthenNextSoundChannelStruct

@gteBE:
	cp   $be
	jr   nz, @to_incDataAddrSetDelayTo1

// if control byte is be..
	inc  de
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	and  $60
	jp   nz, @incDataAddrBy7SetDelayTo1

// if bit 5 and 6 unset..
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	and  $1f
	ld   hl, $ff10
	call b4_addAtoHL
	ld   a, l
	cp   <rAUD4LEN
	jr   nz, +

// audio 4 - skip it, copy only 4 bytes
	inc  hl
	inc  de
	jr   @copyNext4bytesIntoHWRegs

+
// otherwise copy next 5 bytes into hw regs
	ld   a, (de)
	inc  de
	ldi  (hl), a

@copyNext4bytesIntoHWRegs:
.rept 4
	ld   a, (de)
	inc  de
	ldi  (hl), a
.endr

// then byte after is delay counter
	ld   a, (de)
	ld   hl, wSoundChannelA.delayCounter
	add  hl, bc
	ld   (hl), a

@incDataAddrBy7SetDelayTo1:
// skip 5 bytes of main sound parameters, then 2 for delay and opcode
	call incSoundStructCurrDataAddr
	call incSoundStructCurrDataAddr
	call incSoundStructCurrDataAddr
	call incSoundStructCurrDataAddr
	call incSoundStructCurrDataAddr
	jp   @incDataAddrTwiceSetDelayTo1

@to_incDataAddrSetDelayTo1:
	jp   @incDataAddrSetDelayTo1


hwRegValsBytes0124:
// 1 - sweep - len - env - high
// 2 - n/a - len - env - high
// 3 - ena - len - level - high
// 4 - len - env - poly - audvol
	.db $00 $40 $f0 $b0
	.db $00 $00 $f0 $b0
// the following 2 unused
	.db $00 $80 $f0 $b0
	.db $f0 $e0 $d0 $c0
	
	
data_noteDelayAndLength:
// delayCounter - or'd with hwReg2's high nybble (length)
	.db $08 $01
	.db $10 $02
	.db $20 $04
	.db $40 $06
	.db $80 $07
	
	.db $04 $01
	.db $08 $01
	.db $10 $02
	.db $20 $04
	.db $40 $06
	
	
setSoundChannelDelayAndLen:
// a = high 3 bits of a in low nybble
// ignore that low bit, used for frequency
	srl  a
	srl  a
	srl  a
	srl  a
	and  $fe

	push af
	ld   hl, wSoundChannelA.isTwiceSpeed
	add  hl, bc
	ld   a, (hl)
	or   a
	jp   z, +
// if byteC is 0, a is the original even nums from 0 to e
// else, it's byteC+10 ($0a, $0c, $0e, etc)
	pop  af
	add  $0a
	push af
+
	pop  af

// adjusted byteC means shorter delays, and shorter sound length
	ld   hl, data_noteDelayAndLength+1
	call b4_addAtoHL
	ldd  a, (hl)

	push af
	ld   a, (hl)
	ld   hl, wSoundChannelA.delayCounter
	add  hl, bc
	ld   (hl), a

// byte 9 is its high nybble with 2nd byte
	ld   hl, wSoundChannelA.hwReg2
	add  hl, bc
	ld   a, (hl)
	and  $f0
	ld   (hl), a
	pop  af

	or   (hl)
	ld   (hl), a
	ret


// frequency tables, low byte, high byte
freqTablesIdxedByte6:
	.dw mainFrequencyTable
	.dw mainFrequencyTable
	.dw mainFrequencyTable
	.dw mainFrequencyTable

// 22bf - C 3 to B 3
	.db $20 $00
	.db $95 $00
	.db $fd $00
	.db $70 $01
	.db $c2 $01
	.db $1e $02
	.db $70 $02
	.db $c7 $02
	.db $14 $03
	.db $59 $03
	.db $a0 $03
	.db $d7 $03
	
mainFrequencyTable:
	.db $18 $04 // C 4
	.db $52 $04 // C# 4
	.db $85 $04 // D 4
	.db $b8 $04 // D# 4
	.db $e6 $04
	.db $14 $05
	.db $3c $05
	.db $64 $05
	.db $8a $05
	.db $ad $05
	.db $ce $05
	.db $ee $05

	.db $0c $06
	.db $27 $06
	.db $43 $06
	.db $5b $06
	.db $73 $06
	.db $89 $06
	.db $9e $06
	.db $b2 $06
	.db $c5 $06
	.db $d7 $06
	.db $e7 $06
	.db $f7 $06

	.db $06 $07
	.db $14 $07
	.db $21 $07
	.db $2e $07
	.db $3a $07
	.db $45 $07
	.db $4f $07
	.db $59 $07 // G 6

// 2317 - G# 6 to B 8
	.db $63 $07
	.db $6c $07
	.db $74 $07
	.db $7c $07

	.db $83 $07
	.db $8a $07
	.db $91 $07
	.db $97 $07
	.db $9d $07
	.db $a3 $07
	.db $a8 $07
	.db $ad $07
	.db $b2 $07
	.db $b6 $07
	.db $ba $07
	.db $be $07

	.db $c2 $07
	.db $c5 $07
	.db $c9 $07
	.db $cc $07
	.db $cf $07
	.db $d2 $07
	.db $d4 $07
	.db $d7 $07
	.db $d9 $07
	.db $db $07
	.db $dd $07
	.db $df $07
	
	
updateSoundChannelsFrequency:
// $c09c into wSoundChannelA.hwReg3
	ld   hl, wNewSoundChannelFrequency
	ld   a, (hl)

	ld   hl, wSoundChannelA.hwReg3
	add  hl, bc
	ldi  (hl), a

// high nybble of wSoundChannelA.hwReg4
	ld   a, (hl)
	and  $f0
	ld   (hl), a

// then or c09d with c80b into c80b
	ld   de, wNewSoundChannelFrequency+1
	ld   a, (de)
	or   (hl)
	ld   (hl), a
	ret


copy5bytesToSoundRegGroup:
	ld   hl, wSoundChannelA.controlByteAndHWChannelAddr
	add  hl, bc
	ld   a, (hl)
	and  $60
	jp   nz, @done

// only copy if bit 5 and 6 unset

// destination set of sound regs
	ld   a, (hl)
	and  $1f
	ld   de, $ff10
	call b4_addAtoDE

// source set of bytes
	ld   hl, wSoundChannelA.hwReg0
	add  hl, bc
.rept 5
	ldi  a, (hl)
	ld   (de), a
	inc  de
.endr
@done:
	ret


incSoundStructCurrDataAddr:
	ld   hl, wSoundChannelA.currSoundDataAddr
	add  hl, bc
	call b4_deEquWordInHL
	inc  de
	call b4_deIntoHL
	ret


loadPresetIntoStructHWBytes:
	ld   hl, wSoundChannelA.presetIdx
	add  hl, bc
	ld   a, (hl)
	sla  a
	sla  a
	ld   de, hwRegValsBytes0124
	call b4_addAtoDE
	ld   hl, wSoundChannelA.hwReg0
	add  hl, bc

// de into byte 7
	ld   a, (de)
	inc  de
	ldi  (hl), a

// next de into byte 8
	ld   a, (de)
	inc  de
	ldi  (hl), a

// next de into byte 9
	ld   a, (de)
	inc  de
	ldi  (hl), a

// next de into byte B
	inc  hl
	ld   a, (de)
	ldi  (hl), a
	ret


soundChannelStructOffsets:
	.db wSoundChannelA-wSoundChannelA
	.db wSoundChannelB-wSoundChannelA
	.db wSoundChannelC-wSoundChannelA
	.db wSoundChannelD-wSoundChannelA
	.db wSoundChannelE-wSoundChannelA


getChannelRamOffsetFromAandRetZ:
	cp   $05
	jp   nc, +

	ld   hl, soundChannelStructOffsets
	call b4_addAtoHL
	ld   c, (hl)
	ld   b, $00
	xor  a
	ret

+
	or   $ff
	ret

// utilities for sound engine
b4_deIntoHL:
	ld   (hl), e
	inc  hl
	ld   (hl), d
	dec  hl
	ret


b4_deEquWordInHL:
	ld   de, $0000
	add  hl, de
	ld   e, (hl)
	inc  hl
	ld   d, (hl)
	dec  hl
	ret


b4_addAtoBC:
	add  c
	ld   c, a
	ld   a, b
	adc  $00
	ld   b, a
	ret


b4_addAtoDE:
	add  e
	ld   e, a
	ld   a, d
	adc  $00
	ld   d, a
	ret


b4_addAtoHL:
	add  l
	ld   l, a
	ld   a, h
	adc  $00
	ld   h, a
	ret

