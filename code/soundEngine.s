; Disassembly of "OR"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3


soundEngineFunc0:
// 13 bytes for each audio channel, and 5th thing
	call getChannelRamOffsetFromAandRetZ                                       ; $5fc2: $cd $bb $23
	jp   z, +                                    ; $5fc5: $ca $c9 $1f

	ret                                              ; $5fc8: $c9

+
	ld   hl, wSoundChannelA.byte0                                   ; $5fc9: $21 $00 $c8
	add  hl, bc                                      ; $5fcc: $09
	ld   a, (hl)                                     ; $5fcd: $7e
	bit  7, a                                        ; $5fce: $cb $7f
	jp   z, +                                    ; $5fd0: $ca $d7 $1f

// bit 7 set, return Z clear
	ld   a, $01                                      ; $5fd3: $3e $01
	or   a                                           ; $5fd5: $b7
	ret                                              ; $5fd6: $c9

+
	ld   a, $01                                      ; $5fd7: $3e $01
	ld   hl, wSoundChannelA.byte1                                   ; $5fd9: $21 $01 $c8
	add  hl, bc                                      ; $5fdc: $09
	ld   (hl), a                                     ; $5fdd: $77

	ld   a, $00                                      ; $5fde: $3e $00
	ld   hl, wSoundChannelA.byte6                                   ; $5fe0: $21 $06 $c8
	add  hl, bc                                      ; $5fe3: $09
	ld   (hl), a                                     ; $5fe4: $77

// e into byte 2 and 4
	ld   hl, wSoundChannelA.word23                                   ; $5fe5: $21 $02 $c8
	add  hl, bc                                      ; $5fe8: $09
	ld   (hl), e                                     ; $5fe9: $73
	ld   hl, wSoundChannelA.word45                                   ; $5fea: $21 $04 $c8
	add  hl, bc                                      ; $5fed: $09
	ld   (hl), e                                     ; $5fee: $73

// d into byte 3 and 5
	ld   hl, wSoundChannelA.word23+1                                   ; $5fef: $21 $03 $c8
	add  hl, bc                                      ; $5ff2: $09
	ld   (hl), d                                     ; $5ff3: $72
	ld   hl, wSoundChannelA.word45+1                                   ; $5ff4: $21 $05 $c8
	add  hl, bc                                      ; $5ff7: $09
	ld   (hl), d                                     ; $5ff8: $72

// sound channel 1
	ld   a, $c0                                      ; $5ff9: $3e $c0
	ld   hl, wSoundChannelA.byte0                                   ; $5ffb: $21 $00 $c8
	add  hl, bc                                      ; $5ffe: $09
	ld   (hl), a                                     ; $5fff: $77

	ld   hl, $c72a                                   ; $6000: $21 $2a $c7
	ld   a, (hl)                                     ; $6003: $7e
	ld   hl, wSoundChannelA.byteC                                   ; $6004: $21 $0c $c8
	add  hl, bc                                      ; $6007: $09
	ld   (hl), a                                     ; $6008: $77
	ret                                              ; $6009: $c9


soundEngineFunc1:
// if $ff, call this func for a = 0 to 4
// then go to below at wSoundChannelA.byte0
	cp   $ff
	jp   nz, ++                                   ; $600c: $c2 $21 $20

	ld   a, $00                                      ; $600f: $3e $00
-
	push af                                          ; $6011: $f5
	call soundEngineFunc1                                       ; $6012: $cd $0a $20
	jp   nz, +                                   ; $6015: $c2 $1e $20

	pop  af                                          ; $6018: $f1
	add  $01                                         ; $6019: $c6 $01
	jp   -                                       ; $601b: $c3 $11 $20

// done when a = 5
+
	pop  af                                          ; $601e: $f1
	xor  a                                           ; $601f: $af
	ret                                              ; $6020: $c9

++
	call getChannelRamOffsetFromAandRetZ                                       ; $6021: $cd $bb $23
	jp   z, func_04_2028                                    ; $6024: $ca $28 $20

	ret                                              ; $6027: $c9


func_04_2028:
	ld   hl, wSoundChannelA.byte0                                   ; $6028: $21 $00 $c8
	add  hl, bc                                      ; $602b: $09
	ld   a, (hl)                                     ; $602c: $7e
	bit  7, a                                        ; $602d: $cb $7f
	jr   z, @done                              ; $602f: $28 $5f

// only do stuff if byte0 bit 7 set
	and  $60                                         ; $6031: $e6 $60
	jp   z, +                                    ; $6033: $ca $40 $20

// bit 5 or 6 set - clear byte0 and done
	ld   a, $00                                      ; $6036: $3e $00
	ld   hl, wSoundChannelA.byte0                                   ; $6038: $21 $00 $c8
	add  hl, bc                                      ; $603b: $09
	ld   (hl), a                                     ; $603c: $77
	jp   @done                                       ; $603d: $c3 $90 $20

+
	ld   hl, wSoundChannelA.byte0                                   ; $6040: $21 $00 $c8
	add  hl, bc                                      ; $6043: $09
	ld   a, (hl)                                     ; $6044: $7e

// clear byte0, then..
	push af                                          ; $6045: $f5
	ld   a, $00                                      ; $6046: $3e $00
	ld   hl, wSoundChannelA.byte0                                   ; $6048: $21 $00 $c8
	add  hl, bc                                      ; $604b: $09
	ld   (hl), a                                     ; $604c: $77
	pop  af                                          ; $604d: $f1

// ..$c09a is the hw register 1st address
	and  $1f                                         ; $604e: $e6 $1f
	ld   hl, $c09a                                   ; $6050: $21 $9a $c0
	ld   (hl), a                                     ; $6053: $77

// for every sound channel struct
// if bit 7 and bit 5 unset, and its on the same sound channel
// unset its bit 5
	ld   bc, $0000                                   ; $6054: $01 $00 $00
@nextSoundChannelStruct:
	push bc                                          ; $6057: $c5
	ld   hl, wSoundChannelA.byte0                                   ; $6058: $21 $00 $c8
	add  hl, bc                                      ; $605b: $09

	ld   a, (hl)                                     ; $605c: $7e
	bit  7, a                                        ; $605d: $cb $7f
	jr   z, @gotoNextSoundChannelStruct                              ; $605f: $28 $23

	and  $20                                         ; $6061: $e6 $20
	jp   z, @gotoNextSoundChannelStruct                                    ; $6063: $ca $84 $20

// go to next sound channel struct if bit 7 or 5 unset
	ld   hl, wSoundChannelA.byte0                                   ; $6066: $21 $00 $c8
	add  hl, bc                                      ; $6069: $09
	ld   a, (hl)                                     ; $606a: $7e

// if byte0 unchanged (current channel being processed)
// go to next sound channel struct
	and  $1f                                         ; $606b: $e6 $1f
	ld   hl, $c09a                                   ; $606d: $21 $9a $c0
	xor  (hl)                                        ; $6070: $ae
	jp   nz, @gotoNextSoundChannelStruct                                   ; $6071: $c2 $84 $20

	pop  bc                                          ; $6074: $c1

// reset bit 5 of byte0
	ld   hl, wSoundChannelA.byte0                                   ; $6075: $21 $00 $c8
	add  hl, bc                                      ; $6078: $09
	ld   a, (hl)                                     ; $6079: $7e
	and  $df                                         ; $607a: $e6 $df
	ld   hl, wSoundChannelA.byte0                                   ; $607c: $21 $00 $c8
	add  hl, bc                                      ; $607f: $09
	ld   (hl), a                                     ; $6080: $77

	jp   @done                                       ; $6081: $c3 $90 $20

@gotoNextSoundChannelStruct:
	pop  bc                                          ; $6084: $c1
	ld   a, SoundChannel.end-SoundChannel.start                                      ; $6085: $3e $0d
	call b4_addAtoBC                                       ; $6087: $cd $dc $23
	ld   a, c                                        ; $608a: $79
	cp   <wSoundChannelEnd                                         ; $608b: $fe $41
	jp   c, @nextSoundChannelStruct                                    ; $608d: $da $57 $20

@done:
	xor  a                                           ; $6090: $af
	ret                                              ; $6091: $c9


soundEngineFunc2:
	ld   bc, $0000                                   ; $6092: $01 $00 $00
-
	ld   hl, wSoundChannelA.byte0                                   ; $6095: $21 $00 $c8
	add  hl, bc                                      ; $6098: $09
	ld   a, (hl)                                     ; $6099: $7e
	bit  7, a                                        ; $609a: $cb $7f
	jr   z, @firstNextSoundChannelStruct                              ; $609c: $28 $08

// bit 7 of byte 0 set, dec byte1
	ld   hl, wSoundChannelA.byte1                                   ; $609e: $21 $01 $c8
	add  hl, bc                                      ; $60a1: $09
	dec  (hl)                                        ; $60a2: $35
	jp   z, @processSoundChannelStruct                                    ; $60a3: $ca $b2 $20

// bit 7 unset, go to next sound channel struct
@firstNextSoundChannelStruct:
	ld   a, SoundChannel.end-SoundChannel.start                                      ; $60a6: $3e $0d
	call b4_addAtoBC                                       ; $60a8: $cd $dc $23
	ld   a, c                                        ; $60ab: $79
	cp   <wSoundChannelEnd                                         ; $60ac: $fe $41
	jp   c, -                                    ; $60ae: $da $95 $20

	ret                                              ; $60b1: $c9

@processSoundChannelStruct:
// de is word45
	ld   hl, wSoundChannelA.word45                                   ; $60b2: $21 $04 $c8
	add  hl, bc                                      ; $60b5: $09
	ld   e, (hl)                                     ; $60b6: $5e
	ld   hl, wSoundChannelA.word45+1                                   ; $60b7: $21 $05 $c8
	add  hl, bc                                      ; $60ba: $09
	ld   d, (hl)                                     ; $60bb: $56

//
	ld   a, (de)                                     ; $60bc: $1a
	cp   $a0                                         ; $60bd: $fe $a0
	jp   nc, @word45GTEa0h                                   ; $60bf: $d2 $fe $20

// val in de < $a0
	call func_04_2284                                       ; $60c2: $cd $84 $22
	ld   hl, wSoundChannelA.byte6                                   ; $60c5: $21 $06 $c8
	add  hl, bc                                      ; $60c8: $09
	ld   a, (hl)                                     ; $60c9: $7e
	sla  a                                           ; $60ca: $cb $27
	ld   hl, data_04_22b7                                   ; $60cc: $21 $b7 $22
	call b4_addAtoHL                                       ; $60cf: $cd $ea $23
	push de                                          ; $60d2: $d5
	call b4_deEquWordInHL                                       ; $60d3: $cd $d3 $23
	ld   l, e                                        ; $60d6: $6b
	ld   h, d                                        ; $60d7: $62
	pop  de                                          ; $60d8: $d1
	ld   a, (de)                                     ; $60d9: $1a
	and  $1f                                         ; $60da: $e6 $1f
	cp   $1f                                         ; $60dc: $fe $1f
	jr   z, @incWord45thenNextSoundChannelStruct                              ; $60de: $28 $18

	sla  a                                           ; $60e0: $cb $27
	call b4_addAtoHL                                       ; $60e2: $cd $ea $23
	ld   a, (hl)                                     ; $60e5: $7e
	push hl                                          ; $60e6: $e5
	ld   hl, $c09c                                   ; $60e7: $21 $9c $c0
	ld   (hl), a                                     ; $60ea: $77
	pop  hl                                          ; $60eb: $e1
	inc  hl                                          ; $60ec: $23
	ld   a, (hl)                                     ; $60ed: $7e
	ld   hl, $c09d                                   ; $60ee: $21 $9d $c0
	ld   (hl), a                                     ; $60f1: $77
	call func_04_234f                                       ; $60f2: $cd $4f $23
	call copy5bytesToSoundRegGroup                                       ; $60f5: $cd $63 $23

@incWord45thenNextSoundChannelStruct:
	call incWordInSoundStructByte4and5                                       ; $60f8: $cd $8a $23
	jp   @firstNextSoundChannelStruct                                       ; $60fb: $c3 $a6 $20

@word45GTEa0h:
	cp   $b0                                         ; $60fe: $fe $b0
	jp   nc, @word45GTEb0h                                   ; $6100: $d2 $1e $21

// word45 value between $a0 and $af
// $a4 to $af change to $a3
	cp   $a4                                         ; $6103: $fe $a4
	jp   c, +                                    ; $6105: $da $0a $21

	ld   a, $a3                                      ; $6108: $3e $a3
+
// value to be between 0 to 3
	sub  $a0                                         ; $610a: $d6 $a0
	ld   hl, wSoundChannelA.byte6                                   ; $610c: $21 $06 $c8
	add  hl, bc                                      ; $610f: $09
	ld   (hl), a                                     ; $6110: $77
	call load4bytesIntoStructHWbytesIdxByte6                                       ; $6111: $cd $96 $23
	call incWordInSoundStructByte4and5                                       ; $6114: $cd $8a $23
	jp   @processSoundChannelStruct                                       ; $6117: $c3 $b2 $20

@soundChannelRegOffsets:
	.db rAUD1SWEEP-$ff10
	.db rAUD2LEN-$ff10-1 // has only 4 bytes
	.db rAUD3ENA-$ff10
	.db rAUD4LEN-$ff10
	
@word45GTEb0h:
	cp   $b4                                         ; $611e: $fe $b4
	jp   nc, @func_216e                                   ; $6120: $d2 $6e $21

	sub  $b0                                         ; $6123: $d6 $b0
	ld   hl, @soundChannelRegOffsets                                   ; $6125: $21 $1a $21
	call b4_addAtoHL                                       ; $6128: $cd $ea $23
	ld   a, (hl)                                     ; $612b: $7e
	ld   hl, wSoundChannelA.byte0                                   ; $612c: $21 $00 $c8
	add  hl, bc                                      ; $612f: $09
	or   (hl)                                        ; $6130: $b6
	and  $9f                                         ; $6131: $e6 $9f
	ld   hl, $c09e                                   ; $6133: $21 $9e $c0
	ld   (hl), a                                     ; $6136: $77
	push bc                                          ; $6137: $c5
	ld   bc, $0000                                   ; $6138: $01 $00 $00
@nextSoundChannelStruct:
	ld   hl, wSoundChannelA.byte0                                   ; $613b: $21 $00 $c8
	add  hl, bc                                      ; $613e: $09
	ld   a, (hl)                                     ; $613f: $7e
	ld   hl, $c09e                                   ; $6140: $21 $9e $c0
	xor  (hl)                                        ; $6143: $ae
	jp   nz, +                                   ; $6144: $c2 $53 $21

// set bit 5 of byte 0
	ld   hl, wSoundChannelA.byte0                                   ; $6147: $21 $00 $c8
	add  hl, bc                                      ; $614a: $09
	ld   a, (hl)                                     ; $614b: $7e
	or   $20                                         ; $614c: $f6 $20
	ld   hl, wSoundChannelA.byte0                                   ; $614e: $21 $00 $c8
	add  hl, bc                                      ; $6151: $09
	ld   (hl), a                                     ; $6152: $77
+
	ld   a, SoundChannel.end-SoundChannel.start                                      ; $6153: $3e $0d
	call b4_addAtoBC                                       ; $6155: $cd $dc $23
	ld   a, c                                        ; $6158: $79
	cp   <wSoundChannelEnd                                         ; $6159: $fe $41
	jp   c, @nextSoundChannelStruct                                    ; $615b: $da $3b $21

	pop  bc                                          ; $615e: $c1
	ld   hl, $c09e                                   ; $615f: $21 $9e $c0
	ld   a, (hl)                                     ; $6162: $7e
	ld   hl, wSoundChannelA.byte0                                   ; $6163: $21 $00 $c8
	add  hl, bc                                      ; $6166: $09
	ld   (hl), a                                     ; $6167: $77
	call incWordInSoundStructByte4and5                                       ; $6168: $cd $8a $23
	jp   @processSoundChannelStruct                                       ; $616b: $c3 $b2 $20

@func_216e:
	cp   $b9                                         ; $616e: $fe $b9
	jp   nc, @func_04_21a6                                   ; $6170: $d2 $a6 $21

	ld   hl, wSoundChannelA.byte0                                   ; $6173: $21 $00 $c8
	add  hl, bc                                      ; $6176: $09
	ld   a, (hl)                                     ; $6177: $7e
	and  $60                                         ; $6178: $e6 $60
	jp   z, +                                    ; $617a: $ca $80 $21

	jp   @func_2199                                       ; $617d: $c3 $99 $21

+
	ld   hl, wSoundChannelA.byte0                                   ; $6180: $21 $00 $c8
	add  hl, bc                                      ; $6183: $09
	ld   a, (hl)                                     ; $6184: $7e
	and  $1f                                         ; $6185: $e6 $1f
	ld   hl, $ff10
	call b4_addAtoHL                                       ; $618a: $cd $ea $23
	ld   a, (de)                                     ; $618d: $1a
	sub  $b4                                         ; $618e: $d6 $b4
	call b4_addAtoHL                                       ; $6190: $cd $ea $23
	inc  de                                          ; $6193: $13
	ld   a, (de)                                     ; $6194: $1a
	ldi  (hl), a                                     ; $6195: $22

// big loops
@func_2196:
	call incWordInSoundStructByte4and5                                       ; $6196: $cd $8a $23

@func_2199:
	call incWordInSoundStructByte4and5                                       ; $6199: $cd $8a $23
	ld   a, $01                                      ; $619c: $3e $01
	ld   hl, wSoundChannelA.byte1                                   ; $619e: $21 $01 $c8
	add  hl, bc                                      ; $61a1: $09
	ld   (hl), a                                     ; $61a2: $77
	jp   @firstNextSoundChannelStruct                                       ; $61a3: $c3 $a6 $20

@func_04_21a6:
	cp   $b9                                         ; $61a6: $fe $b9
	jp   nz, +                                   ; $61a8: $c2 $c2 $21

// copy word 2/3 into word 4/5
	ld   hl, wSoundChannelA.word23                                   ; $61ab: $21 $02 $c8
	add  hl, bc                                      ; $61ae: $09
	ld   a, (hl)                                     ; $61af: $7e
	ld   hl, wSoundChannelA.word45                                   ; $61b0: $21 $04 $c8
	add  hl, bc                                      ; $61b3: $09
	ld   (hl), a                                     ; $61b4: $77

	ld   hl, wSoundChannelA.word23+1                                   ; $61b5: $21 $03 $c8
	add  hl, bc                                      ; $61b8: $09
	ld   a, (hl)                                     ; $61b9: $7e
	ld   hl, wSoundChannelA.word45+1                                   ; $61ba: $21 $05 $c8
	add  hl, bc                                      ; $61bd: $09
	ld   (hl), a                                     ; $61be: $77
	jp   @processSoundChannelStruct                                       ; $61bf: $c3 $b2 $20

+
	cp   $ba                                         ; $61c2: $fe $ba
	jp   nz, +                                   ; $61c4: $c2 $cf $21

	push bc                                          ; $61c7: $c5
	call func_04_2028                                       ; $61c8: $cd $28 $20
	pop  bc                                          ; $61cb: $c1
	jp   @func_2199                                       ; $61cc: $c3 $99 $21

+
	cp   $bb                                         ; $61cf: $fe $bb
	jp   nz, +                                   ; $61d1: $c2 $ec $21

	inc  de                                          ; $61d4: $13
	ld   a, (de)                                     ; $61d5: $1a
	sla  a                                           ; $61d6: $cb $27
	sla  a                                           ; $61d8: $cb $27
	sla  a                                           ; $61da: $cb $27
	sla  a                                           ; $61dc: $cb $27
	ld   hl, wSoundChannelA.hwReg2                                   ; $61de: $21 $09 $c8
	add  hl, bc                                      ; $61e1: $09
	ldi  (hl), a                                     ; $61e2: $22
	call incWordInSoundStructByte4and5                                       ; $61e3: $cd $8a $23
	call incWordInSoundStructByte4and5                                       ; $61e6: $cd $8a $23
	jp   @processSoundChannelStruct                                       ; $61e9: $c3 $b2 $20

+
	cp   $bc                                         ; $61ec: $fe $bc
	jr   nz, +                             ; $61ee: $20 $10

	inc  de                                          ; $61f0: $13
	push de                                          ; $61f1: $d5
	pop  hl                                          ; $61f2: $e1
	call b4_deEquWordInHL                                       ; $61f3: $cd $d3 $23
	ld   hl, wSoundChannelA.word45                                   ; $61f6: $21 $04 $c8
	add  hl, bc                                      ; $61f9: $09
	call b4_deIntoHL                                       ; $61fa: $cd $ce $23
	jp   @processSoundChannelStruct                                       ; $61fd: $c3 $b2 $20

+
	cp   $bd                                         ; $6200: $fe $bd
	jr   nz, +                             ; $6202: $20 $0d

	inc  de                                          ; $6204: $13
	ld   a, (de)                                     ; $6205: $1a
	ld   hl, wSoundChannelA.byte1                                   ; $6206: $21 $01 $c8
	add  hl, bc                                      ; $6209: $09
	ld   (hl), a                                     ; $620a: $77
	call incWordInSoundStructByte4and5                                       ; $620b: $cd $8a $23
	jp   @incWord45thenNextSoundChannelStruct                                       ; $620e: $c3 $f8 $20

+
	cp   $be                                         ; $6211: $fe $be
	jr   nz, @last_225d                             ; $6213: $20 $48

	inc  de                                          ; $6215: $13
	ld   hl, wSoundChannelA.byte0                                   ; $6216: $21 $00 $c8
	add  hl, bc                                      ; $6219: $09
	ld   a, (hl)                                     ; $621a: $7e
	and  $60                                         ; $621b: $e6 $60
	jp   nz, @func_224b                                   ; $621d: $c2 $4b $22

	ld   hl, wSoundChannelA.byte0                                   ; $6220: $21 $00 $c8
	add  hl, bc                                      ; $6223: $09
	ld   a, (hl)                                     ; $6224: $7e
	and  $1f                                         ; $6225: $e6 $1f
	ld   hl, $ff10
	call b4_addAtoHL                                       ; $622a: $cd $ea $23
	ld   a, l                                        ; $622d: $7d
	cp   <rAUD4LEN                                         ; $622e: $fe $20
	jr   nz, +                             ; $6230: $20 $04

// rAUD4LEN - skip it
	inc  hl                                          ; $6232: $23
	inc  de                                          ; $6233: $13
	jr   @next_2239                                 ; $6234: $18 $03

+
	ld   a, (de)                                     ; $6236: $1a
	inc  de                                          ; $6237: $13
	ldi  (hl), a                                     ; $6238: $22

@next_2239:
.rept 4
	ld   a, (de)                                     ; $6239: $1a
	inc  de                                          ; $623a: $13
	ldi  (hl), a                                     ; $623b: $22
.endr
	ld   a, (de)                                     ; $6245: $1a
	ld   hl, wSoundChannelA.byte1                                   ; $6246: $21 $01 $c8
	add  hl, bc                                      ; $6249: $09
	ld   (hl), a                                     ; $624a: $77
@func_224b:
	call incWordInSoundStructByte4and5                                       ; $624b: $cd $8a $23
	call incWordInSoundStructByte4and5                                       ; $624e: $cd $8a $23
	call incWordInSoundStructByte4and5                                       ; $6251: $cd $8a $23
	call incWordInSoundStructByte4and5                                       ; $6254: $cd $8a $23
	call incWordInSoundStructByte4and5                                       ; $6257: $cd $8a $23
	jp   @func_2196                                       ; $625a: $c3 $96 $21

@last_225d:
	jp   @func_2199                                       ; $625d: $c3 $99 $21


hwRegValsBytes0124:
// 1 - sweep - len - env - high
// 2 - n/a - len - env - high
// 3 - ena - len - level - high
// 4 - len - env - poly - audvol
	.db $00 $40 $f0 $b0
	.db $00 $00 $f0 $b0
	.db $00 $80 $f0 $b0
	.db $f0 $e0 $d0 $c0
	
	
data_04_2270:
// byte1 - or'd with byte9's high nybble
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
	
	
func_04_2284:
// a = high 3 bits of a in low nybble
	srl  a
	srl  a                                           ; $6286: $cb $3f
	srl  a                                           ; $6288: $cb $3f
	srl  a                                           ; $628a: $cb $3f
	and  $fe                                         ; $628c: $e6 $fe

	push af                                          ; $628e: $f5
	ld   hl, wSoundChannelA.byteC                                   ; $628f: $21 $0c $c8
	add  hl, bc                                      ; $6292: $09
	ld   a, (hl)                                     ; $6293: $7e
	or   a                                           ; $6294: $b7
	jp   z, +                                    ; $6295: $ca $9c $22
// if byteC is 0, a is the original even nums from 0 to e
// else, it's byteC+10 ($0a, $0c, $0e)
	pop  af                                          ; $6298: $f1
	add  $0a                                         ; $6299: $c6 $0a
	push af                                          ; $629b: $f5
+
	pop  af                                          ; $629c: $f1

	ld   hl, data_04_2270+1                                   ; $629d: $21 $71 $22
	call b4_addAtoHL                                       ; $62a0: $cd $ea $23
	ldd  a, (hl)                                     ; $62a3: $3a

	push af                                          ; $62a4: $f5
	ld   a, (hl)                                     ; $62a5: $7e
	ld   hl, wSoundChannelA.byte1                                   ; $62a6: $21 $01 $c8
	add  hl, bc                                      ; $62a9: $09
	ld   (hl), a                                     ; $62aa: $77

// byte 9 is its high nybble with 2nd byte
	ld   hl, wSoundChannelA.hwReg2                                   ; $62ab: $21 $09 $c8
	add  hl, bc                                      ; $62ae: $09
	ld   a, (hl)                                     ; $62af: $7e
	and  $f0                                         ; $62b0: $e6 $f0
	ld   (hl), a                                     ; $62b2: $77
	pop  af                                          ; $62b3: $f1

	or   (hl)                                        ; $62b4: $b6
	ld   (hl), a                                     ; $62b5: $77
	ret                                              ; $62b6: $c9


data_04_22b7:
	.dw data_04_22d7
	.dw data_04_22d7
	.dw data_04_22d7
	.dw data_04_22d7

	.db $20 $00 ; $62bf
	sub  l                                           ; $62c1: $95
	nop                                              ; $62c2: $00
	.db  $fd                                         ; $62c3: $fd
	nop                                              ; $62c4: $00
	ld   (hl), b                                     ; $62c5: $70
	ld   bc, $01c2                                   ; $62c6: $01 $c2 $01
	ld   e, $02                                      ; $62c9: $1e $02
	ld   (hl), b                                     ; $62cb: $70
	ld   (bc), a                                     ; $62cc: $02
	rst  $00                                         ; $62cd: $c7
	ld   (bc), a                                     ; $62ce: $02
	inc  d                                           ; $62cf: $14
	inc  bc                                          ; $62d0: $03
	ld   e, c                                        ; $62d1: $59
	inc  bc                                          ; $62d2: $03
	and  b                                           ; $62d3: $a0
	inc  bc                                          ; $62d4: $03
	rst  $10                                         ; $62d5: $d7
	inc  bc                                          ; $62d6: $03
	
data_04_22d7:
	.db $18 $04
	ld   d, d                                        ; $62d9: $52
	inc  b                                           ; $62da: $04
	add  l                                           ; $62db: $85
	inc  b                                           ; $62dc: $04
	cp   b                                           ; $62dd: $b8
	inc  b                                           ; $62de: $04
	and  $04                                         ; $62df: $e6 $04
	inc  d                                           ; $62e1: $14
	dec  b                                           ; $62e2: $05
	inc  a                                           ; $62e3: $3c
	dec  b                                           ; $62e4: $05
	ld   h, h                                        ; $62e5: $64
	dec  b                                           ; $62e6: $05
	adc  d                                           ; $62e7: $8a
	dec  b                                           ; $62e8: $05
	xor  l                                           ; $62e9: $ad
	dec  b                                           ; $62ea: $05
	adc  $05                                         ; $62eb: $ce $05
	xor  $05                                         ; $62ed: $ee $05
	inc  c                                           ; $62ef: $0c
	ld   b, $27                                      ; $62f0: $06 $27
	ld   b, $43                                      ; $62f2: $06 $43
	ld   b, $5b                                      ; $62f4: $06 $5b
	ld   b, $73                                      ; $62f6: $06 $73
	ld   b, $89                                      ; $62f8: $06 $89
	ld   b, $9e                                      ; $62fa: $06 $9e
	ld   b, $b2                                      ; $62fc: $06 $b2
	ld   b, $c5                                      ; $62fe: $06 $c5
	ld   b, $d7                                      ; $6300: $06 $d7
	ld   b, $e7                                      ; $6302: $06 $e7
	ld   b, $f7                                      ; $6304: $06 $f7
	ld   b, $06                                      ; $6306: $06 $06
	rlca                                             ; $6308: $07
	inc  d                                           ; $6309: $14
	rlca                                             ; $630a: $07
	ld   hl, $2e07                                   ; $630b: $21 $07 $2e
	rlca                                             ; $630e: $07
	ldd  a, (hl)                                     ; $630f: $3a
	rlca                                             ; $6310: $07
	ld   b, l                                        ; $6311: $45
	rlca                                             ; $6312: $07
	ld   c, a                                        ; $6313: $4f
	rlca                                             ; $6314: $07
	ld   e, c                                        ; $6315: $59
	rlca                                             ; $6316: $07
	ld   h, e                                        ; $6317: $63
	rlca                                             ; $6318: $07
	ld   l, h                                        ; $6319: $6c
	rlca                                             ; $631a: $07
	ld   (hl), h                                     ; $631b: $74
	rlca                                             ; $631c: $07
	ld   a, h                                        ; $631d: $7c
	rlca                                             ; $631e: $07
	add  e                                           ; $631f: $83
	rlca                                             ; $6320: $07
	adc  d                                           ; $6321: $8a
	rlca                                             ; $6322: $07
	sub  c                                           ; $6323: $91
	rlca                                             ; $6324: $07
	sub  a                                           ; $6325: $97
	rlca                                             ; $6326: $07
	sbc  l                                           ; $6327: $9d
	rlca                                             ; $6328: $07
	and  e                                           ; $6329: $a3
	rlca                                             ; $632a: $07
	xor  b                                           ; $632b: $a8
	rlca                                             ; $632c: $07
	xor  l                                           ; $632d: $ad
	rlca                                             ; $632e: $07
	or   d                                           ; $632f: $b2
	rlca                                             ; $6330: $07
	or   (hl)                                        ; $6331: $b6
	rlca                                             ; $6332: $07
	cp   d                                           ; $6333: $ba
	rlca                                             ; $6334: $07
	cp   (hl)                                        ; $6335: $be
	rlca                                             ; $6336: $07
	jp   nz, $c507                                   ; $6337: $c2 $07 $c5

	rlca                                             ; $633a: $07
	ret                                              ; $633b: $c9


	rlca                                             ; $633c: $07
	call z, $cf07                                    ; $633d: $cc $07 $cf
	rlca                                             ; $6340: $07
	jp   nc, $d407                                   ; $6341: $d2 $07 $d4

	rlca                                             ; $6344: $07
	rst  $10                                         ; $6345: $d7
	rlca                                             ; $6346: $07
	reti                                             ; $6347: $d9


	rlca                                             ; $6348: $07
	.db  $db                                         ; $6349: $db
	rlca                                             ; $634a: $07
	.db  $dd                                         ; $634b: $dd
	rlca                                             ; $634c: $07
	rst  $18                                         ; $634d: $df
	rlca                                             ; $634e: $07
	
	
func_04_234f:
// $c09c into wSoundChannelA.hwReg3
	ld   hl, $c09c                                   ; $634f: $21 $9c $c0
	ld   a, (hl)                                     ; $6352: $7e

	ld   hl, wSoundChannelA.hwReg3                                   ; $6353: $21 $0a $c8
	add  hl, bc                                      ; $6356: $09
	ldi  (hl), a                                     ; $6357: $22

// high nybble of wSoundChannelA.hwReg3
	ld   a, (hl)                                     ; $6358: $7e
	and  $f0                                         ; $6359: $e6 $f0
	ld   (hl), a                                     ; $635b: $77

// then or c09d with c80b into c80b
	ld   de, $c09d                                   ; $635c: $11 $9d $c0
	ld   a, (de)                                     ; $635f: $1a
	or   (hl)                                        ; $6360: $b6
	ld   (hl), a                                     ; $6361: $77
	ret                                              ; $6362: $c9


copy5bytesToSoundRegGroup:
	ld   hl, wSoundChannelA.byte0
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


incWordInSoundStructByte4and5:
	ld   hl, wSoundChannelA.word45
	add  hl, bc
	call b4_deEquWordInHL
	inc  de
	call b4_deIntoHL
	ret


load4bytesIntoStructHWbytesIdxByte6:
	ld   hl, wSoundChannelA.byte6
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

