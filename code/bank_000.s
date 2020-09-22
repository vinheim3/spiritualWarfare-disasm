
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
	ld   hl, $c04e                                   ; $0964: $21 $4e $c0
	ld   (hl), $00                                   ; $0967: $36 $00
	ld   hl, wIsTitleScreen                                   ; $0969: $21 $00 $d4
	ld   (hl), $00                                   ; $096c: $36 $00
	call callCommonSoundFunc1_withFF                               ; $096e: $cd $32 $15
	ld   hl, lyt_introTradeMarkScreen                                   ; $0971: $21 $80 $19
	call copyLayoutFromBank3toScreen0withOffset                               ; $0974: $cd $37 $15
	ld   hl, $001c                                   ; $0977: $21 $1c $00
	call loadTilesetAndVramTileConversionTable_idxedHL                               ; $097a: $cd $7a $17
	call clear_c200_to_c2ff                                       ; $097d: $cd $9e $5b
	call copyA0hDataToOam                               ; $0980: $cd $99 $1a
	ld   a, $01                                      ; $0983: $3e $01
	call setLCDfromValue_c015equA                               ; $0985: $cd $11 $02
	call callsCommonSoundFuncs_27d8                               ; $0988: $cd $d8 $27
	ld   e, $ff                                      ; $098b: $1e $ff
	call Call_000_19f8                               ; $098d: $cd $f8 $19
	call callCommonSoundFunc1_withFF                               ; $0990: $cd $32 $15
	call clear_c094_c095                                       ; $0993: $cd $a6 $48
	ld   hl, wIsMusicOff                                   ; $0996: $21 $dd $c4
	ld   (hl), $00                                   ; $0999: $36 $00
	jp   startTitleScreen                               ; $099b: $c3 $58 $0b


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


table_0a31:
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
	.dw storeFFinto_c5f8
	.dw func_3257
	.dw func_32bc
	.dw func_3243
	.dw storeFFinto_c5f8
	.dw storeFFinto_c5f8
	.dw func_3235
	.dw storeFFinto_c5f8
	.dw func_324e
	.dw func_324e
	.dw func_324e
	.dw func_324e
	.dw func_324e
	.dw func_324e
	.dw storeFFinto_c5f8
	.dw func_322d
	.dw func_3243
	.dw func_3261
	.dw func_3243
	.dw storeFFinto_c5f8
	.dw _ret_328f
	.dw _ret_328f
	.dw _ret_328f


table_0a8f:
	.dw c5f8_equFF
	.dw func_3432
	.dw func_3437
	.dw func_340e
	.dw c5f8_equFF
	.dw c5f8_equFF
	.dw func_33b1
	.dw c5f8_equFF
	.dw c0b3_equFF
	.dw c0b3_equFF
	.dw c0b3_equFF
	.dw c0b3_equFF


table_0aa7:
	.dw func_36fd
	.dw func_3731
	.dw func_3731
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_3736
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw func_36fd
	.dw _ret_36fc
	.dw _ret_36fc
	.dw _ret_36fc
	.dw func_36fd
	.dw func_36fd
	.dw func_36fd
	.dw func_36fd
	.dw func_36fd
	.dw func_36fd
	.dw func_36fd
	.dw func_36fd
	.dw _ret_3736
	.dw func_36fd
	.dw func_36fd
	.dw func_36fd
	.dw func_3708
	.dw func_36fd
	.dw func_36ee
	.dw _ret_3736
	.dw func_370d
	.dw func_3712
	.dw func_36fd
	.dw func_36ee
	.dw func_3717
	.dw func_36fd
	.dw _ret_3736
	.dw func_36e6
	.dw func_36fd
	.dw func_36fd
	.dw func_36fd
	.dw func_36fd
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
	.dw _collisionsTable_01
	.dw _collisionsTable_02
	.dw _collision_give7bombs
	.dw _collision_give3bombs
	.dw _collision_give5birds
	.dw _collision_give1bird
	.dw _collisionsTable_07
	.dw _collisionsTable_08
	.dw _collision_giveArmorOfGod
	.dw _collision_giveSpecialBitem
	.dw _collision_giveHeartContainer
	.dw _ret_525a
	.dw _collisionsTable_0d
	.dw _collision_giveAnointingOil
	.dw _collision_giveKey
	.dw _collisionsTable_10
	.dw _collisionsTable_11
	.dw _collisionsTable_12
	.dw _collisionsTable_13
	.dw _ret_5108
	.dw _ret_5108
	.dw _ret_5108
	.dw _collisionsTable_17
	.dw _collision_giveHeart


reset:
	ld   sp, wStackTop

startTitleScreen:
	ld   a, $00
	ld   hl, $c029                                   ; $0b5a: $21 $29 $c0
	ld   (hl), a                                     ; $0b5d: $77
	ld   hl, $c097                                   ; $0b5e: $21 $97 $c0
	ld   (hl), a                                     ; $0b61: $77
	ld   hl, wLCDCvalue                                   ; $0b62: $21 $00 $d0
	ld   a, $87                                      ; $0b65: $3e $87
	ld   (hl), a                                     ; $0b67: $77
	call turnOffLCDstartOfVBlank                               ; $0b68: $cd $0a $02
	ld   hl, $0020                                   ; $0b6b: $21 $20 $00
	call loadTilesetAndVramTileConversionTable_idxedHL                               ; $0b6e: $cd $7a $17

// copy water, etc, animation tiles
	ld   de, $d100                                   ; $0b71: $11 $00 $d1
	ld   c, $e8                                      ; $0b74: $0e $e8
	ld   hl, $8040                                   ; $0b76: $21 $40 $80
// copy memory 2*c
-
	ldi  a, (hl)                                     ; $0b79: $2a
	ld   (de), a                                     ; $0b7a: $12
	inc  de                                          ; $0b7b: $13
	ldi  a, (hl)                                     ; $0b7c: $2a
	ld   (de), a                                     ; $0b7d: $12
	inc  de                                          ; $0b7e: $13
	dec  c                                           ; $0b7f: $0d
	jr   nz, -                             ; $0b80: $20 $f7

// copy fire tiles on title screen
	ld   c, $40                                      ; $0b82: $0e $40
	ld   hl, $87c0                                   ; $0b84: $21 $c0 $87
-
	ldi  a, (hl)                                     ; $0b87: $2a
	ld   (de), a                                     ; $0b88: $12
	inc  de                                          ; $0b89: $13
	dec  c                                           ; $0b8a: $0d
	jr   nz, -                             ; $0b8b: $20 $fa

	call setNormalBGP_OBP0vals                               ; $0b8d: $cd $30 $1e
	ld   hl, rOBP1                                   ; $0b90: $21 $49 $ff
	ld   (hl), $1b                                   ; $0b93: $36 $1b
	call setScrollValues                               ; $0b95: $cd $f1 $1d
	call clearScreen0                                       ; $0b98: $cd $8e $5b
	ld   hl, lyt_03_1815                                   ; $0b9b: $21 $15 $18
	call copyLayoutFromBank3toScreen0withOffset                               ; $0b9e: $cd $37 $15
	call loadTileset1dh_sprites1ch                               ; $0ba1: $cd $0b $17
	call changeMusicOnTextAndPlaySound                               ; $0ba4: $cd $50 $0c
	call clear_c200_to_c2ff                                       ; $0ba7: $cd $9e $5b
	call copyA0hDataToOam                               ; $0baa: $cd $99 $1a
	ld   hl, wCurrTileAnimationAddr                                   ; $0bad: $21 $fe $d0
	ld   de, titleScreenFlamesAnimation                                   ; $0bb0: $11 $7d $5f
	ld   (hl), e                                     ; $0bb3: $73
	inc  hl                                          ; $0bb4: $23
	ld   (hl), d                                     ; $0bb5: $72
	ld   hl, wVBlanksPerTileAnimation                                   ; $0bb6: $21 $fc $d0
	ld   (hl), $02                                   ; $0bb9: $36 $02
	ld   hl, wCurrVBlanksUntilNextTileAnimation                                   ; $0bbb: $21 $fd $d0
	ld   (hl), $02                                   ; $0bbe: $36 $02
	ld   a, $01                                      ; $0bc0: $3e $01
	call setLCDfromValue_c015equA                               ; $0bc2: $cd $11 $02
	call callCommonSoundFunc1_withFF                               ; $0bc5: $cd $32 $15
	ld   hl, wNewKeysPressed                                   ; $0bc8: $21 $18 $c0
	ld   (hl), $00                                   ; $0bcb: $36 $00
	call callsCommonSoundFuncs_278f                               ; $0bcd: $cd $8f $27
	ld   hl, wOam+1                                   ; $0bd0: $21 $01 $c2
	ld   (hl), $1e                                   ; $0bd3: $36 $1e
	ld   hl, wOam+2                                   ; $0bd5: $21 $02 $c2
	ld   (hl), $2a                                   ; $0bd8: $36 $2a
	ld   hl, wOam+3                                   ; $0bda: $21 $03 $c2
	ld   (hl), $00                                   ; $0bdd: $36 $00
	ld   hl, $c098                                   ; $0bdf: $21 $98 $c0
	ld   (hl), $04                                   ; $0be2: $36 $04
	ld   hl, $c0b1                                   ; $0be4: $21 $b1 $c0
	ld   (hl), $68                                   ; $0be7: $36 $68

@titleScreenLoop:
	ld   a, $3c                                      ; $0be9: $3e $3c
	ld   hl, $c00b                                   ; $0beb: $21 $0b $c0
	ld   (hl), a                                     ; $0bee: $77
	ld   hl, wIsTitleScreen                                   ; $0bef: $21 $00 $d4
	ld   (hl), $ff                                   ; $0bf2: $36 $ff
	call Call_000_0c6f                               ; $0bf4: $cd $6f $0c
	ld   hl, wIsTitleScreen                                   ; $0bf7: $21 $00 $d4
	ld   (hl), $00                                   ; $0bfa: $36 $00
	ld   hl, $c00c                                   ; $0bfc: $21 $0c $c0
	ld   a, (hl)                                     ; $0bff: $7e
	cp   $00                                         ; $0c00: $fe $00
	jr   nz, +                             ; $0c02: $20 $03

	jp   @titleScreenLoop                               ; $0c04: $c3 $e9 $0b

+
	call callCommonSoundFunc1_withFF                               ; $0c07: $cd $32 $15
	ld   a, $00                                      ; $0c0a: $3e $00
	ld   hl, $c0fb                                   ; $0c0c: $21 $fb $c0
	ld   (hl), a                                     ; $0c0f: $77

	ld   hl, $c097                                   ; $0c10: $21 $97 $c0
	ld   a, (hl)                                     ; $0c13: $7e
	cp   $03                                         ; $0c14: $fe $03
	jr   nz, +                             ; $0c16: $20 $03

// selected music test
	jp   musicTestScreen                               ; $0c18: $c3 $a0 $13

+
	cp   $02                                         ; $0c1b: $fe $02
	jr   nz, +                             ; $0c1d: $20 $13

// flip music on/off
	ld   hl, wIsMusicOff                                   ; $0c1f: $21 $dd $c4
	ld   a, (hl)                                     ; $0c22: $7e
	xor  $ff                                         ; $0c23: $ee $ff
	ld   (hl), a                                     ; $0c25: $77
	call safeCallCommonSoundFuncs_with20h                               ; $0c26: $cd $ff $27
	call changeMusicOnTextAndPlaySound                               ; $0c29: $cd $50 $0c
	call callsCommonSoundFuncs_278f                               ; $0c2c: $cd $8f $27
	jp   @titleScreenLoop                               ; $0c2f: $c3 $e9 $0b

+
	cp   $01                                         ; $0c32: $fe $01
	jr   nz, @playGame                             ; $0c34: $20 $0e

// enter password
	call enterPasswordScreen
	jr   z, +

// incorrect password, go back to title screen
	jp   startTitleScreen                               ; $0c3b: $c3 $58 $0b

+
// correct password
	call processCorrectPassword                               ; $0c3e: $cd $d4 $10
	jp   postInitGame                               ; $0c41: $c3 $f3 $15

@playGame:
	call Call_000_1012                               ; $0c44: $cd $12 $10
	jp   initGame                               ; $0c47: $c3 $65 $15


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
	jp   copyMemoryCinVBlank_callCommonSoundFunc2


Call_000_0c69:
	ld   a, $00
	ld   hl, $c00b                                   ; $0c6b: $21 $0b $c0
	ld   (hl), a                                     ; $0c6e: $77

Call_000_0c6f:
	ld   hl, $c097                                   ; $0c6f: $21 $97 $c0
	ld   a, (hl)                                     ; $0c72: $7e
	sla  a                                           ; $0c73: $cb $27
	sla  a                                           ; $0c75: $cb $27
	sla  a                                           ; $0c77: $cb $27
	ld   hl, $c0b1                                   ; $0c79: $21 $b1 $c0
	add  (hl)                                        ; $0c7c: $86
	ld   hl, wOam                                   ; $0c7d: $21 $00 $c2
	ld   (hl), a                                     ; $0c80: $77
	ld   hl, $c00b                                   ; $0c81: $21 $0b $c0
	ld   e, (hl)                                     ; $0c84: $5e
	call Call_000_19f8                               ; $0c85: $cd $f8 $19
	ld   hl, $c00c                                   ; $0c88: $21 $0c $c0
	ld   (hl), a                                     ; $0c8b: $77
	cp   $00                                         ; $0c8c: $fe $00
	jr   nz, +                             ; $0c8e: $20 $01

	ret                                              ; $0c90: $c9

+
	cp   $80                                         ; $0c91: $fe $80
	jr   z, jr_000_0cb7                              ; $0c93: $28 $22

	cp   $04                                         ; $0c95: $fe $04
	jr   z, jr_000_0cb7                              ; $0c97: $28 $1e

	cp   $40                                         ; $0c99: $fe $40
	jr   nz, jr_000_0cd1                             ; $0c9b: $20 $34

	call safeCallCommonSoundFuncs_with20h                               ; $0c9d: $cd $ff $27
	ld   hl, $c097                                   ; $0ca0: $21 $97 $c0
	ld   a, (hl)                                     ; $0ca3: $7e
	cp   $00                                         ; $0ca4: $fe $00
	jr   nz, jr_000_0cb0                             ; $0ca6: $20 $08

	ld   hl, $c098                                   ; $0ca8: $21 $98 $c0
	ld   a, (hl)                                     ; $0cab: $7e
	ld   hl, $c097                                   ; $0cac: $21 $97 $c0
	ld   (hl), a                                     ; $0caf: $77

jr_000_0cb0:
	ld   hl, $c097                                   ; $0cb0: $21 $97 $c0
	dec  (hl)                                        ; $0cb3: $35
	jp   Call_000_0c6f                               ; $0cb4: $c3 $6f $0c


jr_000_0cb7:
	call safeCallCommonSoundFuncs_with20h                               ; $0cb7: $cd $ff $27
	ld   hl, $c097                                   ; $0cba: $21 $97 $c0
	inc  (hl)                                        ; $0cbd: $34
	ld   hl, $c097                                   ; $0cbe: $21 $97 $c0
	ld   a, (hl)                                     ; $0cc1: $7e
	ld   hl, $c098                                   ; $0cc2: $21 $98 $c0
	cp   (hl)                                        ; $0cc5: $be
	jr   c, Call_000_0c6f                              ; $0cc6: $38 $a7

	ld   a, $00                                      ; $0cc8: $3e $00
	ld   hl, $c097                                   ; $0cca: $21 $97 $c0
	ld   (hl), a                                     ; $0ccd: $77
	jp   Call_000_0c6f                               ; $0cce: $c3 $6f $0c


jr_000_0cd1:
	and  $0b                                         ; $0cd1: $e6 $0b
	jr   z, Call_000_0c6f                              ; $0cd3: $28 $9a

	ret                                              ; $0cd5: $c9


data_0cd6:
	inc  h                                           ; $0cd6: $24
	inc  h                                           ; $0cd7: $24
	inc  h                                           ; $0cd8: $24
	inc  h                                           ; $0cd9: $24
	inc  h                                           ; $0cda: $24
	inc  h                                           ; $0cdb: $24
	inc  h                                           ; $0cdc: $24
	inc  h                                           ; $0cdd: $24
	inc  h                                           ; $0cde: $24
	inc  h                                           ; $0cdf: $24
	inc  (hl)                                        ; $0ce0: $34
	inc  (hl)                                        ; $0ce1: $34
	inc  (hl)                                        ; $0ce2: $34
	inc  (hl)                                        ; $0ce3: $34
	inc  (hl)                                        ; $0ce4: $34
	inc  (hl)                                        ; $0ce5: $34
	inc  (hl)                                        ; $0ce6: $34
	inc  (hl)                                        ; $0ce7: $34
	inc  (hl)                                        ; $0ce8: $34
	inc  (hl)                                        ; $0ce9: $34
	ld   b, h                                        ; $0cea: $44
	ld   b, h                                        ; $0ceb: $44
	ld   b, h                                        ; $0cec: $44
	ld   b, h                                        ; $0ced: $44
	ld   b, h                                        ; $0cee: $44
	ld   b, h                                        ; $0cef: $44
	ld   b, h                                        ; $0cf0: $44
	ld   b, h                                        ; $0cf1: $44
	ld   b, h                                        ; $0cf2: $44
	ld   b, h                                        ; $0cf3: $44
	ld   d, h                                        ; $0cf4: $54
	ld   d, h                                        ; $0cf5: $54
	ld   d, h                                        ; $0cf6: $54
	ld   d, h                                        ; $0cf7: $54
	ld   d, h                                        ; $0cf8: $54
	ld   d, h                                        ; $0cf9: $54
	ld   d, h                                        ; $0cfa: $54
	ld   d, h                                        ; $0cfb: $54
	ld   d, h                                        ; $0cfc: $54
	ld   d, h                                        ; $0cfd: $54
	ld   h, h                                        ; $0cfe: $64
	ld   h, h                                        ; $0cff: $64
	ld   h, h                                        ; $0d00: $64
	ld   h, h                                        ; $0d01: $64
	ld   h, h                                        ; $0d02: $64
	ld   h, h                                        ; $0d03: $64
	ld   h, h                                        ; $0d04: $64
	ld   h, h                                        ; $0d05: $64
	ld   h, h                                        ; $0d06: $64
	ld   h, h                                        ; $0d07: $64
	ld   (hl), h                                     ; $0d08: $74
	ld   (hl), h                                     ; $0d09: $74
	ld   (hl), h                                     ; $0d0a: $74
	ld   (hl), h                                     ; $0d0b: $74
	ld   (hl), h                                     ; $0d0c: $74
	ld   (hl), h                                     ; $0d0d: $74
	ld   (hl), h                                     ; $0d0e: $74
	ld   (hl), h                                     ; $0d0f: $74
	ld   (hl), h                                     ; $0d10: $74
	ld   (hl), h                                     ; $0d11: $74
	add  h                                           ; $0d12: $84
	add  h                                           ; $0d13: $84
	add  h                                           ; $0d14: $84
	add  h                                           ; $0d15: $84
	add  h                                           ; $0d16: $84
	add  h                                           ; $0d17: $84
	add  h                                           ; $0d18: $84
	add  h                                           ; $0d19: $84
	
	
data_0d1a:
	inc  c                                           ; $0d1a: $0c
	inc  e                                           ; $0d1b: $1c
	inc  l                                           ; $0d1c: $2c
	inc  a                                           ; $0d1d: $3c
	ld   c, h                                        ; $0d1e: $4c
	ld   e, h                                        ; $0d1f: $5c
	ld   l, h                                        ; $0d20: $6c
	ld   a, h                                        ; $0d21: $7c
	adc  h                                           ; $0d22: $8c
	sbc  h                                           ; $0d23: $9c
	inc  c                                           ; $0d24: $0c
	inc  e                                           ; $0d25: $1c
	inc  l                                           ; $0d26: $2c
	inc  a                                           ; $0d27: $3c
	ld   c, h                                        ; $0d28: $4c
	ld   e, h                                        ; $0d29: $5c
	ld   l, h                                        ; $0d2a: $6c
	ld   a, h                                        ; $0d2b: $7c
	adc  h                                           ; $0d2c: $8c
	sbc  h                                           ; $0d2d: $9c
	inc  c                                           ; $0d2e: $0c
	inc  e                                           ; $0d2f: $1c
	inc  l                                           ; $0d30: $2c
	inc  a                                           ; $0d31: $3c
	ld   c, h                                        ; $0d32: $4c
	ld   e, h                                        ; $0d33: $5c
	ld   l, h                                        ; $0d34: $6c
	ld   a, h                                        ; $0d35: $7c
	adc  h                                           ; $0d36: $8c
	sbc  h                                           ; $0d37: $9c
	inc  c                                           ; $0d38: $0c
	inc  e                                           ; $0d39: $1c
	inc  l                                           ; $0d3a: $2c
	inc  a                                           ; $0d3b: $3c
	ld   c, h                                        ; $0d3c: $4c
	ld   e, h                                        ; $0d3d: $5c
	ld   l, h                                        ; $0d3e: $6c
	ld   a, h                                        ; $0d3f: $7c
	adc  h                                           ; $0d40: $8c
	sbc  h                                           ; $0d41: $9c
	inc  c                                           ; $0d42: $0c
	inc  e                                           ; $0d43: $1c
	inc  l                                           ; $0d44: $2c
	inc  a                                           ; $0d45: $3c
	ld   c, h                                        ; $0d46: $4c
	ld   e, h                                        ; $0d47: $5c
	ld   l, h                                        ; $0d48: $6c
	ld   a, h                                        ; $0d49: $7c
	adc  h                                           ; $0d4a: $8c
	sbc  h                                           ; $0d4b: $9c
	inc  c                                           ; $0d4c: $0c
	inc  e                                           ; $0d4d: $1c
	inc  l                                           ; $0d4e: $2c
	inc  a                                           ; $0d4f: $3c
	ld   c, h                                        ; $0d50: $4c
	ld   e, h                                        ; $0d51: $5c
	ld   l, h                                        ; $0d52: $6c
	ld   a, h                                        ; $0d53: $7c
	adc  h                                           ; $0d54: $8c
	sbc  h                                           ; $0d55: $9c
	inc  c                                           ; $0d56: $0c
	inc  e                                           ; $0d57: $1c
	inc  l                                           ; $0d58: $2c
	inc  a                                           ; $0d59: $3c
	ld   e, h                                        ; $0d5a: $5c
	ld   a, h                                        ; $0d5b: $7c
	adc  h                                           ; $0d5c: $8c
	sbc  h                                           ; $0d5d: $9c
	
data_0d5e:
	jr   nc, jr_000_0d91                             ; data_0d5e: $30 $31

	ldd  (hl), a                                     ; $0d60: $32
	inc  sp                                          ; $0d61: $33
	inc  (hl)                                        ; $0d62: $34
	dec  (hl)                                        ; $0d63: $35
	ld   (hl), $37                                   ; $0d64: $36 $37
	jr   c, jr_000_0da1                              ; $0d66: $38 $39

	ld   b, c                                        ; $0d68: $41
	ld   b, d                                        ; $0d69: $42
	ld   b, e                                        ; $0d6a: $43
	ld   b, h                                        ; $0d6b: $44
	ld   b, l                                        ; $0d6c: $45
	ld   b, (hl)                                     ; $0d6d: $46
	ld   b, a                                        ; $0d6e: $47
	ld   c, b                                        ; $0d6f: $48
	ld   c, c                                        ; $0d70: $49
	ld   c, d                                        ; $0d71: $4a
	ld   c, e                                        ; $0d72: $4b
	ld   c, h                                        ; $0d73: $4c
	ld   c, l                                        ; $0d74: $4d
	ld   c, (hl)                                     ; $0d75: $4e
	ld   c, a                                        ; $0d76: $4f
	ld   d, b                                        ; $0d77: $50
	ld   d, c                                        ; $0d78: $51
	ld   d, d                                        ; $0d79: $52
	ld   d, e                                        ; $0d7a: $53
	ld   d, h                                        ; $0d7b: $54
	ld   d, l                                        ; $0d7c: $55
	ld   d, (hl)                                     ; $0d7d: $56
	ld   d, a                                        ; $0d7e: $57
	ld   e, b                                        ; $0d7f: $58
	ld   e, c                                        ; $0d80: $59
	ld   e, d                                        ; $0d81: $5a
	ld   h, c                                        ; $0d82: $61
	ld   h, d                                        ; $0d83: $62
	ld   h, e                                        ; $0d84: $63
	ld   h, h                                        ; $0d85: $64
	ld   h, l                                        ; $0d86: $65
	ld   h, (hl)                                     ; $0d87: $66
	ld   h, a                                        ; $0d88: $67
	ld   l, b                                        ; $0d89: $68
	ld   l, c                                        ; $0d8a: $69
	ld   l, d                                        ; $0d8b: $6a
	ld   l, e                                        ; $0d8c: $6b
	ld   l, h                                        ; $0d8d: $6c
	ld   l, l                                        ; $0d8e: $6d
	ld   l, (hl)                                     ; $0d8f: $6e
	ld   l, a                                        ; $0d90: $6f

jr_000_0d91:
	ld   (hl), b                                     ; $0d91: $70
	ld   (hl), c                                     ; $0d92: $71
	ld   (hl), d                                     ; $0d93: $72
	ld   (hl), e                                     ; $0d94: $73
	ld   (hl), h                                     ; $0d95: $74
	ld   (hl), l                                     ; $0d96: $75
	.db  $76                                         ; $0d97: $76
	ld   (hl), a                                     ; $0d98: $77
	ld   a, b                                        ; $0d99: $78
	ld   a, c                                        ; $0d9a: $79
	ld   a, d                                        ; $0d9b: $7a
	.db $21 $2e
	
	
data_0d9e:
	.db $4e
	ld   b, c                                        ; $0d9f: $41
	ld   c, l                                        ; $0da0: $4d

jr_000_0da1:
	ld   b, l                                        ; $0da1: $45
	nop                                              ; $0da2: $00
	nop                                              ; $0da3: $00
	nop                                              ; $0da4: $00
	nop                                              ; $0da5: $00

enterPasswordScreen:
	ld   a, $20                                      ; $0da6: $3e $20
	ld   hl, $c097                                   ; $0da8: $21 $97 $c0
	ld   (hl), a                                     ; $0dab: $77
	call Call_000_0de1                               ; $0dac: $cd $e1 $0d

@loop:
	call Call_000_11b0                               ; $0daf: $cd $b0 $11
	jr   z, @correctPass                              ; $0db2: $28 $28

	call safeCallCommonSoundFuncs_with29h                               ; $0db4: $cd $67 $28
	call turnOffLCDstartOfVBlank                               ; $0db7: $cd $0a $02
	call clear_c200_to_c2ff                                       ; $0dba: $cd $9e $5b
	call copyA0hDataToOam                               ; $0dbd: $cd $99 $1a
	ld   hl, text_badPassword                                   ; $0dc0: $21 $9e $09
	call hlContainsScreenOffsetAndDataToCopyToScreen                                       ; $0dc3: $cd $26 $5b
	ld   hl, text_blankRow                                   ; $0dc6: $21 $b5 $09
	call hlContainsScreenOffsetAndDataToCopyToScreen                                       ; $0dc9: $cd $26 $5b
	ld   a, $01                                      ; $0dcc: $3e $01
	call setLCDfromValue_c015equA                               ; $0dce: $cd $11 $02
	ld   e, $b4                                      ; $0dd1: $1e $b4
	call Call_000_19f8                               ; $0dd3: $cd $f8 $19
	call Call_000_0def                               ; $0dd6: $cd $ef $0d
	jp   @loop                               ; $0dd9: $c3 $af $0d

@correctPass:
	call safeCallCommonSoundFuncs_with12h                               ; $0ddc: $cd $05 $28
	xor  a                                           ; $0ddf: $af
	ret                                              ; $0de0: $c9


Call_000_0de1:
	call clear_c200_to_c2ff                                       ; $0de1: $cd $9e $5b
	ld   a, $ff                                      ; $0de4: $3e $ff
	ld   de, $0020                                   ; $0de6: $11 $20 $00
	ld   hl, $c4e0                                   ; $0de9: $21 $e0 $c4
	call setAtoHL_deBytes                               ; $0dec: $cd $6d $27

Call_000_0def:
	call turnOffLCDstartOfVBlank                               ; $0def: $cd $0a $02
	call copyA0hDataToOam                               ; $0df2: $cd $99 $1a
	ld   hl, lyt_enterPasswordScreen                                   ; $0df5: $21 $d4 $13
	call copyLayoutFromBank3toScreen0withOffset                               ; $0df8: $cd $37 $15
	ld   a, $00                                      ; $0dfb: $3e $00
	ld   hl, $c0c7                                   ; $0dfd: $21 $c7 $c0
	ld   (hl), a                                     ; $0e00: $77
	ld   a, $43                                      ; $0e01: $3e $43
	ld   hl, $c0c0                                   ; $0e03: $21 $c0 $c0
	ld   (hl), a                                     ; $0e06: $77
	ld   hl, $001c                                   ; $0e07: $21 $1c $00
	call loadTilesetAndVramTileConversionTable_idxedHL                               ; $0e0a: $cd $7a $17
	ld   hl, $c097                                   ; $0e0d: $21 $97 $c0
	ld   a, (hl)                                     ; $0e10: $7e
	cp   $08                                         ; $0e11: $fe $08
	jr   nz, jr_000_0e24                             ; $0e13: $20 $0f

	ld   de, $980c                                   ; $0e15: $11 $0c $98
	call dPlusEquScreen0displayOffset                               ; $0e18: $cd $99 $1e
	ld   hl, data_0d9e                                   ; $0e1b: $21 $9e $0d
	ld   bc, $0008                                   ; $0e1e: $01 $08 $00
	call copyMemoryBC                               ; $0e21: $cd $76 $27

Jump_000_0e24:
jr_000_0e24:
	ld   hl, $c097                                   ; $0e24: $21 $97 $c0
	ld   a, (hl)                                     ; $0e27: $7e
	cp   $08                                         ; $0e28: $fe $08
	jr   nz, jr_000_0e35                             ; $0e2a: $20 $09

	ld   de, $99e6                                   ; $0e2c: $11 $e6 $99
	call dPlusEquScreen0displayOffset                               ; $0e2f: $cd $99 $1e
	jp   Jump_000_0e3b                               ; $0e32: $c3 $3b $0e


jr_000_0e35:
	ld   de, $99e2                                   ; $0e35: $11 $e2 $99
	call dPlusEquScreen0displayOffset                               ; $0e38: $cd $99 $1e

Jump_000_0e3b:
	ld   bc, $0000                                   ; $0e3b: $01 $00 $00

jr_000_0e3e:
	ld   hl, $c4e0                                   ; $0e3e: $21 $e0 $c4
	add  hl, bc                                      ; $0e41: $09
	ld   a, (hl)                                     ; $0e42: $7e
	bit  7, (hl)                                     ; $0e43: $cb $7e
	jr   nz, jr_000_0e56                             ; $0e45: $20 $0f

	and  $3f                                         ; $0e47: $e6 $3f
	ld   hl, data_0d5e                                   ; $0e49: $21 $5e $0d
	add  l                                           ; $0e4c: $85
	ld   l, a                                        ; $0e4d: $6f
	ld   a, h                                        ; $0e4e: $7c
	adc  $00                                         ; $0e4f: $ce $00
	ld   h, a                                        ; $0e51: $67
	ld   a, (hl)                                     ; $0e52: $7e
	jp   Jump_000_0e58                               ; $0e53: $c3 $58 $0e


jr_000_0e56:
	ld   a, $5f                                      ; $0e56: $3e $5f

Jump_000_0e58:
	ld   (de), a                                     ; $0e58: $12
	inc  de                                          ; $0e59: $13
	inc  bc                                          ; $0e5a: $03
	ld   a, c                                        ; $0e5b: $79
	cp   $10                                         ; $0e5c: $fe $10
	jr   nz, +                             ; $0e5e: $20 $08

	ld   a, e                                        ; $0e60: $7b
	add  $10                                         ; $0e61: $c6 $10
	ld   e, a                                        ; $0e63: $5f
	ld   a, d                                        ; $0e64: $7a
	adc  $00                                         ; $0e65: $ce $00
	ld   d, a                                        ; $0e67: $57

+
	ld   hl, $c097                                   ; $0e68: $21 $97 $c0
	ld   a, c                                        ; $0e6b: $79
	cp   (hl)                                        ; $0e6c: $be
	jr   nz, jr_000_0e3e                             ; $0e6d: $20 $cf

	ld   a, $01                                      ; $0e6f: $3e $01
	call setLCDfromValue_c015equA                               ; $0e71: $cd $11 $02

Jump_000_0e74:
	ld   hl, $c21e                                   ; $0e74: $21 $1e $c2
	ld   (hl), $5c                                   ; $0e77: $36 $5c
	ld   hl, $c21f                                   ; $0e79: $21 $1f $c2
	ld   (hl), $10                                   ; $0e7c: $36 $10
	ld   b, $88                                      ; $0e7e: $06 $88
	ld   hl, $c0c7                                   ; $0e80: $21 $c7 $c0
	ld   a, (hl)                                     ; $0e83: $7e
	cp   $10                                         ; $0e84: $fe $10
	jr   c, +                              ; $0e86: $38 $02

	ld   b, $90                                      ; $0e88: $06 $90

+
	ld   hl, $c21c                                   ; $0e8a: $21 $1c $c2
	ld   (hl), b                                     ; $0e8d: $70
	ld   b, $02                                      ; $0e8e: $06 $02
	ld   hl, $c097                                   ; $0e90: $21 $97 $c0
	ld   a, (hl)                                     ; $0e93: $7e
	cp   $08                                         ; $0e94: $fe $08
	jr   nz, +                             ; $0e96: $20 $02

	ld   b, $06                                      ; $0e98: $06 $06

+
	ld   hl, $c006                                   ; $0e9a: $21 $06 $c0
	ld   (hl), b                                     ; $0e9d: $70
	ld   hl, $c0c7                                   ; $0e9e: $21 $c7 $c0
	ld   a, (hl)                                     ; $0ea1: $7e
	and  $0f                                         ; $0ea2: $e6 $0f
	ld   hl, $c006                                   ; $0ea4: $21 $06 $c0
	add  (hl)                                        ; $0ea7: $86
	sla  a                                           ; $0ea8: $cb $27
	sla  a                                           ; $0eaa: $cb $27
	sla  a                                           ; $0eac: $cb $27
	add  $08                                         ; $0eae: $c6 $08
	ld   hl, $c21d                                   ; $0eb0: $21 $1d $c2
	ld   (hl), a                                     ; $0eb3: $77
	ld   hl, $c0c0                                   ; $0eb4: $21 $c0 $c0
	ld   c, (hl)                                     ; $0eb7: $4e
	ld   b, $00                                      ; $0eb8: $06 $00
	ld   hl, data_0cd6                                   ; $0eba: $21 $d6 $0c
	add  hl, bc                                      ; $0ebd: $09
	ld   e, (hl)                                     ; $0ebe: $5e
	ld   d, $00                                      ; $0ebf: $16 $00
	ld   hl, data_0d1a                                   ; $0ec1: $21 $1a $0d
	add  hl, bc                                      ; $0ec4: $09
	ld   a, (hl)                                     ; $0ec5: $7e
	ld   c, a                                        ; $0ec6: $4f
	ld   b, $00                                      ; $0ec7: $06 $00
	call sendTowOamCursorXequC_YequE                               ; $0ec9: $cd $59 $10

Jump_000_0ecc:
	ld   e, $00                                      ; $0ecc: $1e $00
	call Call_000_19f8                               ; $0ece: $cd $f8 $19
	cp   $04                                         ; $0ed1: $fe $04
	jr   nz, jr_000_0ed8                             ; $0ed3: $20 $03

jr_000_0ed5:
	jp   Jump_000_0fb9                               ; $0ed5: $c3 $b9 $0f


jr_000_0ed8:
	cp   $01                                         ; $0ed8: $fe $01
	jr   z, jr_000_0ed5                              ; $0eda: $28 $f9

	cp   $02                                         ; $0edc: $fe $02
	jr   z, jr_000_0ed5                              ; $0ede: $28 $f5

	cp   $08                                         ; $0ee0: $fe $08
	jr   z, jr_000_0ed5                              ; $0ee2: $28 $f1

	push af                                          ; $0ee4: $f5
	ld   a, $0a                                      ; $0ee5: $3e $0a
	ld   hl, $c0c0                                   ; $0ee7: $21 $c0 $c0
	ld   c, (hl)                                     ; $0eea: $4e
	ld   b, $00                                      ; $0eeb: $06 $00
	call bcDivA_divInC_modInAB                               ; $0eed: $cd $44 $08
	ld   a, b                                        ; $0ef0: $78
	ld   e, a                                        ; $0ef1: $5f
	pop  af                                          ; $0ef2: $f1
	cp   $10                                         ; $0ef3: $fe $10
	jr   nz, jr_000_0f1e                             ; $0ef5: $20 $27

	ld   a, e                                        ; $0ef7: $7b
	cp   $09                                         ; $0ef8: $fe $09
	jr   nz, jr_000_0f06                             ; $0efa: $20 $0a

	ld   hl, $c0c0                                   ; $0efc: $21 $c0 $c0
	ld   a, (hl)                                     ; $0eff: $7e
	sub  $09                                         ; $0f00: $d6 $09
	ld   (hl), a                                     ; $0f02: $77
	jp   Jump_000_0f18                               ; $0f03: $c3 $18 $0f


jr_000_0f06:
	ld   hl, $c0c0                                   ; $0f06: $21 $c0 $c0
	inc  (hl)                                        ; $0f09: $34
	ld   hl, $c0c0                                   ; $0f0a: $21 $c0 $c0
	ld   a, (hl)                                     ; $0f0d: $7e
	cp   $44                                         ; $0f0e: $fe $44
	jr   nz, jr_000_0f18                             ; $0f10: $20 $06

	ld   a, $3c                                      ; $0f12: $3e $3c
	ld   hl, $c0c0                                   ; $0f14: $21 $c0 $c0
	ld   (hl), a                                     ; $0f17: $77

Jump_000_0f18:
jr_000_0f18:
	call safeCallCommonSoundFuncs_with20h                               ; $0f18: $cd $ff $27
	jp   Jump_000_0e74                               ; $0f1b: $c3 $74 $0e


jr_000_0f1e:
	cp   $20                                         ; $0f1e: $fe $20
	jr   nz, jr_000_0f41                             ; $0f20: $20 $1f

	ld   a, e                                        ; $0f22: $7b
	cp   $00                                         ; $0f23: $fe $00
	jr   nz, jr_000_0f3a                             ; $0f25: $20 $13

	ld   hl, $c0c0                                   ; $0f27: $21 $c0 $c0
	ld   a, (hl)                                     ; $0f2a: $7e
	cp   $3c                                         ; $0f2b: $fe $3c
	jr   z, jr_000_0f35                              ; $0f2d: $28 $06

	add  $09                                         ; $0f2f: $c6 $09
	ld   (hl), a                                     ; $0f31: $77
	jp   Jump_000_0f18                               ; $0f32: $c3 $18 $0f


jr_000_0f35:
	ld   (hl), $43                                   ; $0f35: $36 $43
	jp   Jump_000_0f18                               ; $0f37: $c3 $18 $0f


jr_000_0f3a:
	ld   hl, $c0c0                                   ; $0f3a: $21 $c0 $c0
	dec  (hl)                                        ; $0f3d: $35
	jp   Jump_000_0f18                               ; $0f3e: $c3 $18 $0f


jr_000_0f41:
	cp   $80                                         ; $0f41: $fe $80
	jr   nz, jr_000_0f7b                             ; $0f43: $20 $36

	ld   c, $0a                                      ; $0f45: $0e $0a
	ld   hl, $c0c0                                   ; $0f47: $21 $c0 $c0
	ld   a, (hl)                                     ; $0f4a: $7e
	cp   $36                                         ; $0f4b: $fe $36
	jr   c, jr_000_0f5f                              ; $0f4d: $38 $10

	ld   c, $09                                      ; $0f4f: $0e $09
	cp   $37                                         ; $0f51: $fe $37
	jr   z, jr_000_0f5f                              ; $0f53: $28 $0a

	cp   $39                                         ; $0f55: $fe $39
	jr   c, jr_000_0f74                              ; $0f57: $38 $1b

	ld   c, $08                                      ; $0f59: $0e $08
	cp   $3c                                         ; $0f5b: $fe $3c
	jr   nc, jr_000_0f68                             ; $0f5d: $30 $09

Jump_000_0f5f:
jr_000_0f5f:
	ld   a, c                                        ; $0f5f: $79
	ld   hl, $c0c0                                   ; $0f60: $21 $c0 $c0
	add  (hl)                                        ; $0f63: $86
	ld   (hl), a                                     ; $0f64: $77
	jp   Jump_000_0f18                               ; $0f65: $c3 $18 $0f


jr_000_0f68:
	cp   $40                                         ; $0f68: $fe $40
	jr   c, jr_000_0f74                              ; $0f6a: $38 $08

	jr   nz, jr_000_0f72                             ; $0f6c: $20 $04

	inc  e                                           ; $0f6e: $1c
	jp   Jump_000_0f74                               ; $0f6f: $c3 $74 $0f


jr_000_0f72:
	inc  e                                           ; $0f72: $1c
	inc  e                                           ; $0f73: $1c

Jump_000_0f74:
jr_000_0f74:
	ld   hl, $c0c0                                   ; $0f74: $21 $c0 $c0
	ld   (hl), e                                     ; $0f77: $73
	jp   Jump_000_0f18                               ; $0f78: $c3 $18 $0f


jr_000_0f7b:
	cp   $40                                         ; $0f7b: $fe $40
	jr   nz, jr_000_0fb5                             ; $0f7d: $20 $36

	ld   hl, $c0c0                                   ; $0f7f: $21 $c0 $c0
	ld   a, (hl)                                     ; $0f82: $7e
	cp   $0a                                         ; $0f83: $fe $0a
	jr   c, jr_000_0f98                              ; $0f85: $38 $11

	ld   c, $f6                                      ; $0f87: $0e $f6
	cp   $40                                         ; $0f89: $fe $40
	jr   c, jr_000_0f5f                              ; $0f8b: $38 $d2

	ld   c, $f8                                      ; $0f8d: $0e $f8
	cp   $40                                         ; $0f8f: $fe $40
	jr   nz, jr_000_0f5f                             ; $0f91: $20 $cc

	ld   c, $f7                                      ; $0f93: $0e $f7
	jp   Jump_000_0f5f                               ; $0f95: $c3 $5f $0f


jr_000_0f98:
	ld   c, $3c                                      ; $0f98: $0e $3c
	cp   $04                                         ; $0f9a: $fe $04
	jr   c, jr_000_0fac                              ; $0f9c: $38 $0e

	ld   c, $3b                                      ; $0f9e: $0e $3b
	cp   $05                                         ; $0fa0: $fe $05
	jr   z, jr_000_0fac                              ; $0fa2: $28 $08

	ld   c, $32                                      ; $0fa4: $0e $32
	cp   $07                                         ; $0fa6: $fe $07
	jr   c, jr_000_0fac                              ; $0fa8: $38 $02

	ld   c, $3a                                      ; $0faa: $0e $3a

jr_000_0fac:
	ld   a, c                                        ; $0fac: $79
	ld   hl, $c0c0                                   ; $0fad: $21 $c0 $c0
	add  (hl)                                        ; $0fb0: $86
	ld   (hl), a                                     ; $0fb1: $77
	jp   Jump_000_0f18                               ; $0fb2: $c3 $18 $0f


jr_000_0fb5:
	jp   Jump_000_0ecc                               ; $0fb5: $c3 $cc $0e


_ret_0fb8:
	ret                                              ; $0fb8: $c9


Jump_000_0fb9:
	ld   hl, $c0c0                                   ; $0fb9: $21 $c0 $c0
	ld   a, (hl)                                     ; $0fbc: $7e
	cp   $43                                         ; $0fbd: $fe $43
	jr   z, _ret_0fb8                              ; $0fbf: $28 $f7

	cp   $42                                         ; $0fc1: $fe $42
	jr   z, jr_000_0ff2                              ; $0fc3: $28 $2d

	cp   $41                                         ; $0fc5: $fe $41
	jr   z, jr_000_0fd0                              ; $0fc7: $28 $07

	cp   $40                                         ; $0fc9: $fe $40
	jr   nz, jr_000_0fe7                             ; $0fcb: $20 $1a

	jp   reset                               ; $0fcd: $c3 $55 $0b


jr_000_0fd0:
	ld   hl, $c0c7                                   ; $0fd0: $21 $c7 $c0
	dec  (hl)                                        ; $0fd3: $35
	bit  7, (hl)                                     ; $0fd4: $cb $7e
	jr   z, jr_000_1009                              ; $0fd6: $28 $31

	ld   hl, $c097                                   ; $0fd8: $21 $97 $c0
	ld   a, (hl)                                     ; $0fdb: $7e
	ld   hl, $c0c7                                   ; $0fdc: $21 $c7 $c0
	ld   (hl), a                                     ; $0fdf: $77
	ld   hl, $c0c7                                   ; $0fe0: $21 $c7 $c0
	dec  (hl)                                        ; $0fe3: $35
	jp   Jump_000_1009                               ; $0fe4: $c3 $09 $10


jr_000_0fe7:
	ld   hl, $c0c7                                   ; $0fe7: $21 $c7 $c0
	ld   c, (hl)                                     ; $0fea: $4e
	ld   b, $00                                      ; $0feb: $06 $00
	ld   hl, $c4e0                                   ; $0fed: $21 $e0 $c4
	add  hl, bc                                      ; $0ff0: $09
	ld   (hl), a                                     ; $0ff1: $77

jr_000_0ff2:
	ld   hl, $c0c7                                   ; $0ff2: $21 $c7 $c0
	inc  (hl)                                        ; $0ff5: $34
	ld   a, (hl)                                     ; $0ff6: $7e
	ld   hl, $c097                                   ; $0ff7: $21 $97 $c0
	cp   (hl)                                        ; $0ffa: $be
	jr   nz, jr_000_1009                             ; $0ffb: $20 $0c

	ld   a, $00                                      ; $0ffd: $3e $00
	ld   hl, $c0c7                                   ; $0fff: $21 $c7 $c0
	ld   (hl), a                                     ; $1002: $77
	ld   a, $43                                      ; $1003: $3e $43
	ld   hl, $c0c0                                   ; $1005: $21 $c0 $c0
	ld   (hl), a                                     ; $1008: $77

Jump_000_1009:
jr_000_1009:
	call callsCommonSoundFuncs_284f                               ; $1009: $cd $4f $28
	call turnOffLCDstartOfVBlank                               ; $100c: $cd $0a $02
	jp   Jump_000_0e24                               ; $100f: $c3 $24 $0e


Call_000_1012:
	ld   a, $08                                      ; $1012: $3e $08
	ld   hl, $c097                                   ; $1014: $21 $97 $c0
	ld   (hl), a                                     ; $1017: $77
	ld   hl, wIsSecretPlayerName                                   ; $1018: $21 $f8 $c0
	ld   (hl), $00                                   ; $101b: $36 $00
	call Call_000_0de1                               ; $101d: $cd $e1 $0d
	ld   bc, $0000                                   ; $1020: $01 $00 $00

@copyIntoPlayerName:
	ld   hl, $c4e0                                   ; $1023: $21 $e0 $c4
	add  hl, bc                                      ; $1026: $09
	ld   a, (hl)                                     ; $1027: $7e
	and  $3f                                         ; $1028: $e6 $3f
	ld   hl, wPlayerName                                   ; $102a: $21 $49 $c6
	add  hl, bc                                      ; $102d: $09
	ld   (hl), a                                     ; $102e: $77
	inc  bc                                          ; $102f: $03
	ld   a, c                                        ; $1030: $79
	cp   $08                                         ; $1031: $fe $08
	jr   nz, @copyIntoPlayerName                             ; $1033: $20 $ee

// check secret player name
	ld   bc, $0000                                   ; $1035: $01 $00 $00

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
	ld   bc, $0000                                   ; $10d4: $01 $00 $00

@loop:
	ld   a, c                                        ; $10d7: $79
	sla  a                                           ; $10d8: $cb $27
	or   $20                                         ; $10da: $f6 $20
	ld   hl, wPlayerName                                   ; $10dc: $21 $49 $c6
	add  hl, bc                                      ; $10df: $09
	ld   (hl), a                                     ; $10e0: $77
	ld   hl, $c4e0                                   ; $10e1: $21 $e0 $c4
	add  hl, bc                                      ; $10e4: $09
	ld   a, (hl)                                     ; $10e5: $7e
	ld   hl, wPlayerName                                   ; $10e6: $21 $49 $c6
	add  hl, bc                                      ; $10e9: $09
	sub  (hl)                                        ; $10ea: $96
	and  $3f                                         ; $10eb: $e6 $3f
	ld   (hl), a                                     ; $10ed: $77
	inc  bc                                          ; $10ee: $03
	ld   a, c                                        ; $10ef: $79
	cp   $08                                         ; $10f0: $fe $08
	jr   nz, @loop                             ; $10f2: $20 $e3

	ld   hl, $c4e8                                   ; $10f4: $21 $e8 $c4
	ld   a, (hl)                                     ; $10f7: $7e
	ld   hl, wLastReviveRoomGroup                                   ; $10f8: $21 $15 $c7
	ld   (hl), a                                     ; $10fb: $77
	call setRevivePointInRoomGroup                               ; $10fc: $cd $96 $19
	ld   hl, $c4e9                                   ; $10ff: $21 $e9 $c4
	ld   a, (hl)                                     ; $1102: $7e
	ld   hl, wArmorOfGodGotten                                   ; $1103: $21 $52 $c6
	ld   (hl), a                                     ; $1106: $77
	ld   hl, $c4ea                                   ; $1107: $21 $ea $c4
	ld   a, (hl)                                     ; $110a: $7e
	and  $0f                                         ; $110b: $e6 $0f
	ld   hl, wSpecialBitemsGotten                                   ; $110d: $21 $53 $c6
	ld   (hl), a                                     ; $1110: $77
	ld   hl, $c4eb                                   ; $1111: $21 $eb $c4
	ld   a, (hl)                                     ; $1114: $7e
	and  $0f                                         ; $1115: $e6 $0f
	sla  a                                           ; $1117: $cb $27
	ld   de, wPlayerMaxHealth                                   ; $1119: $11 $73 $c0
	ld   (de), a                                     ; $111c: $12
	ld   a, (hl)                                     ; $111d: $7e
	and  $30                                         ; $111e: $e6 $30
	call aDivEqu16                               ; $1120: $cd $fa $07
	ld   hl, wAnointingOilsGotten                                   ; $1123: $21 $51 $c6
	ld   (hl), a                                     ; $1126: $77
	ld   hl, $c4ec                                   ; $1127: $21 $ec $c4
	ld   a, (hl)                                     ; $112a: $7e
	and  $1f                                         ; $112b: $e6 $1f
	cp   $06                                         ; $112d: $fe $06
	jr   nc, +                             ; $112f: $30 $02

	ld   a, $06                                      ; $1131: $3e $06

+
	ld   hl, wPlayerHealth                                   ; $1133: $21 $72 $c0
	ld   (hl), a                                     ; $1136: $77
	ld   hl, $c4ed                                   ; $1137: $21 $ed $c4
	ld   a, (hl)                                     ; $113a: $7e
	ld   hl, wNumKeys                                   ; $113b: $21 $fa $c5
	ld   (hl), a                                     ; $113e: $77
	ld   hl, $c4ea                                   ; $113f: $21 $ea $c4
	ld   a, (hl)                                     ; $1142: $7e
	sla  a                                           ; $1143: $cb $27
	sla  a                                           ; $1145: $cb $27
	and  $c0                                         ; $1147: $e6 $c0
	ld   hl, $c4ee                                   ; $1149: $21 $ee $c4
	or   (hl)                                        ; $114c: $b6
	ld   hl, wNumBombs                                   ; $114d: $21 $3b $c0
	ld   (hl), a                                     ; $1150: $77
	ld   hl, $c4fc                                   ; $1151: $21 $fc $c4
	ld   a, (hl)                                     ; $1154: $7e
	sla  a                                           ; $1155: $cb $27
	sla  a                                           ; $1157: $cb $27
	and  $c0                                         ; $1159: $e6 $c0
	ld   hl, $c4ef                                   ; $115b: $21 $ef $c4
	or   (hl)                                        ; $115e: $b6
	ld   hl, wNumBirds                                   ; $115f: $21 $08 $c7
	ld   (hl), a                                     ; $1162: $77
	ld   bc, $0000                                   ; $1163: $01 $00 $00

-
	ld   hl, $c4f0                                   ; $1166: $21 $f0 $c4
	add  hl, bc                                      ; $1169: $09
	ld   a, (hl)                                     ; $116a: $7e
	ld   hl, wItemsGotten                                   ; $116b: $21 $54 $c6
	add  hl, bc                                      ; $116e: $09
	ld   (hl), a                                     ; $116f: $77
	inc  bc                                          ; $1170: $03
	ld   a, c                                        ; $1171: $79
	cp   $09                                         ; $1172: $fe $09
	jr   nz, -                             ; $1174: $20 $f0

	ld   hl, $c4f9                                   ; $1176: $21 $f9 $c4
	ld   c, (hl)                                     ; $1179: $4e
	ld   b, $00                                      ; $117a: $06 $00
	ld   de, $0005                                   ; $117c: $11 $05 $00
	call ecEquEtimesC                               ; $117f: $cd $03 $08
	ld   hl, $c4df                                   ; $1182: $21 $df $c4
	ld   (hl), c                                     ; $1185: $71
	ld   hl, $c4fa                                   ; $1186: $21 $fa $c4
	ld   a, (hl)                                     ; $1189: $7e
	ld   hl, wFruitAmounts                                   ; $118a: $21 $09 $c7
	ld   (hl), a                                     ; $118d: $77
	ld   hl, $c4fb                                   ; $118e: $21 $fb $c4
	ld   a, (hl)                                     ; $1191: $7e
	ld   hl, wFruitAmounts+1                                   ; $1192: $21 $0a $c7
	ld   (hl), a                                     ; $1195: $77
	ld   hl, $c4fc                                   ; $1196: $21 $fc $c4
	ld   a, (hl)                                     ; $1199: $7e
	and  $07                                         ; $119a: $e6 $07
	ld   hl, wFruitAmounts+2                                   ; $119c: $21 $0b $c7
	ld   (hl), a                                     ; $119f: $77
	ld   hl, wFruitEquipped                                   ; $11a0: $21 $0c $c7
	ld   (hl), $00                                   ; $11a3: $36 $00
	ld   hl, wIsLampOn                                   ; $11a5: $21 $5b $c0
	ld   (hl), $00                                   ; $11a8: $36 $00
	ld   hl, wEquippedBItem                                   ; $11aa: $21 $49 $c0
	ld   (hl), $00                                   ; $11ad: $36 $00
	ret                                              ; $11af: $c9


Call_000_11b0:
	call Call_000_12d1                               ; $11b0: $cd $d1 $12
	ld   hl, $c4fd                                   ; $11b3: $21 $fd $c4
	ld   a, (hl)                                     ; $11b6: $7e
	and  $3f                                         ; $11b7: $e6 $3f
	ld   hl, $c006                                   ; $11b9: $21 $06 $c0
	cp   (hl)                                        ; $11bc: $be
	jr   nz, @done                             ; $11bd: $20 $16

	ld   hl, $c4fe                                   ; $11bf: $21 $fe $c4
	ld   a, (hl)                                     ; $11c2: $7e
	and  $3f                                         ; $11c3: $e6 $3f
	ld   hl, $c007                                   ; $11c5: $21 $07 $c0
	cp   (hl)                                        ; $11c8: $be
	jr   nz, @done                             ; $11c9: $20 $0a

	ld   hl, $c4ff                                   ; $11cb: $21 $ff $c4
	ld   a, (hl)                                     ; $11ce: $7e
	and  $3f                                         ; $11cf: $e6 $3f
	ld   hl, $c008                                   ; $11d1: $21 $08 $c0
	cp   (hl)                                        ; $11d4: $be

@done:
	ret                                              ; $11d5: $c9


generatePassword:
	ld   bc, $0000                                   ; $11d6: $01 $00 $00

-
	ld   hl, wPlayerName                                   ; $11d9: $21 $49 $c6
	add  hl, bc                                      ; $11dc: $09
	ld   a, (hl)                                     ; $11dd: $7e
	add  $20                                         ; $11de: $c6 $20
	ld   hl, $c4e0                                   ; $11e0: $21 $e0 $c4
	add  hl, bc                                      ; $11e3: $09
	ld   (hl), a                                     ; $11e4: $77
	ld   a, c                                        ; $11e5: $79
	sla  a                                           ; $11e6: $cb $27
	ld   hl, $c4e0                                   ; $11e8: $21 $e0 $c4
	add  hl, bc                                      ; $11eb: $09
	add  (hl)                                        ; $11ec: $86
	ld   (hl), a                                     ; $11ed: $77
	inc  bc                                          ; $11ee: $03
	ld   a, c                                        ; $11ef: $79
	cp   $08                                         ; $11f0: $fe $08
	jr   nz, -                             ; $11f2: $20 $e5

	ld   hl, wLastReviveRoomGroup                                   ; $11f4: $21 $15 $c7
	ld   a, (hl)                                     ; $11f7: $7e
	ld   hl, $c4e8                                   ; $11f8: $21 $e8 $c4
	ld   (hl), a                                     ; $11fb: $77
	ld   hl, wPlayerMaxHealth                                   ; $11fc: $21 $73 $c0
	ld   a, (hl)                                     ; $11ff: $7e
	srl  a                                           ; $1200: $cb $3f
	and  $0f                                         ; $1202: $e6 $0f
	ld   hl, $c4eb                                   ; $1204: $21 $eb $c4
	ld   (hl), a                                     ; $1207: $77
	ld   hl, wAnointingOilsGotten                                   ; $1208: $21 $51 $c6
	ld   a, (hl)                                     ; $120b: $7e
	sla  a                                           ; $120c: $cb $27
	sla  a                                           ; $120e: $cb $27
	sla  a                                           ; $1210: $cb $27
	sla  a                                           ; $1212: $cb $27
	and  $30                                         ; $1214: $e6 $30
	ld   hl, $c4eb                                   ; $1216: $21 $eb $c4
	or   (hl)                                        ; $1219: $b6
	ld   (hl), a                                     ; $121a: $77
	ld   hl, wPlayerHealth                                   ; $121b: $21 $72 $c0
	ld   a, (hl)                                     ; $121e: $7e
	ld   hl, $c4ec                                   ; $121f: $21 $ec $c4
	ld   (hl), a                                     ; $1222: $77
	ld   hl, wNumKeys                                   ; $1223: $21 $fa $c5
	ld   a, (hl)                                     ; $1226: $7e
	call aIsMax3fh                                       ; $1227: $cd $ba $61
	ld   hl, $c4ed                                   ; $122a: $21 $ed $c4
	ld   (hl), a                                     ; $122d: $77
	ld   hl, wNumBombs                                   ; $122e: $21 $3b $c0
	ld   a, (hl)                                     ; $1231: $7e
	ld   hl, $c4ee                                   ; $1232: $21 $ee $c4
	ld   (hl), a                                     ; $1235: $77
	ld   hl, wNumBirds                                   ; $1236: $21 $08 $c7
	ld   a, (hl)                                     ; $1239: $7e
	ld   hl, $c4ef                                   ; $123a: $21 $ef $c4
	ld   (hl), a                                     ; $123d: $77
	ld   hl, wNumBombs                                   ; $123e: $21 $3b $c0
	ld   a, (hl)                                     ; $1241: $7e
	ld   hl, $c4f0                                   ; $1242: $21 $f0 $c4
	ld   (hl), $00                                   ; $1245: $36 $00
	ld   hl, wArmorOfGodGotten                                   ; $1247: $21 $52 $c6
	ld   a, (hl)                                     ; $124a: $7e
	ld   hl, $c4e9                                   ; $124b: $21 $e9 $c4
	ld   (hl), a                                     ; $124e: $77
	ld   hl, wNumBombs                                   ; $124f: $21 $3b $c0
	ld   a, (hl)                                     ; $1252: $7e
	srl  a                                           ; $1253: $cb $3f
	srl  a                                           ; $1255: $cb $3f
	and  $30                                         ; $1257: $e6 $30
	ld   hl, $c4ea                                   ; $1259: $21 $ea $c4
	ld   (hl), a                                     ; $125c: $77
	ld   hl, wSpecialBitemsGotten                                   ; $125d: $21 $53 $c6
	ld   a, (hl)                                     ; $1260: $7e
	and  $0f                                         ; $1261: $e6 $0f
	ld   hl, $c4ea                                   ; $1263: $21 $ea $c4
	or   (hl)                                        ; $1266: $b6
	ld   (hl), a                                     ; $1267: $77
	ld   bc, $0000                                   ; $1268: $01 $00 $00

-
	ld   hl, wItemsGotten                                   ; $126b: $21 $54 $c6
	add  hl, bc                                      ; $126e: $09
	ld   a, (hl)                                     ; $126f: $7e
	and  $3f                                         ; $1270: $e6 $3f
	ld   hl, $c4f0                                   ; $1272: $21 $f0 $c4
	add  hl, bc                                      ; $1275: $09
	ld   (hl), a                                     ; $1276: $77
	inc  bc                                          ; $1277: $03
	ld   a, c                                        ; $1278: $79
	cp   $09                                         ; $1279: $fe $09
	jr   nz, -                             ; $127b: $20 $ee

	ld   hl, $c4df                                   ; $127d: $21 $df $c4
	ld   c, (hl)                                     ; $1280: $4e
	ld   b, $00                                      ; $1281: $06 $00
	ld   a, $05                                      ; $1283: $3e $05
	call bcDivA_divInC_modInAB                               ; $1285: $cd $44 $08
	ld   hl, $c4f9                                   ; $1288: $21 $f9 $c4
	ld   (hl), c                                     ; $128b: $71
	ld   hl, wFruitAmounts                                   ; $128c: $21 $09 $c7
	ld   a, (hl)                                     ; $128f: $7e
	ld   hl, $c4fa                                   ; $1290: $21 $fa $c4
	ld   (hl), a                                     ; $1293: $77
	ld   hl, wFruitAmounts+1                                   ; $1294: $21 $0a $c7
	ld   a, (hl)                                     ; $1297: $7e
	ld   hl, $c4fb                                   ; $1298: $21 $fb $c4
	ld   (hl), a                                     ; $129b: $77
	ld   hl, wFruitAmounts+2                                   ; $129c: $21 $0b $c7
	ld   a, (hl)                                     ; $129f: $7e
	and  $07                                         ; $12a0: $e6 $07
	ld   hl, $c4fc                                   ; $12a2: $21 $fc $c4
	ld   (hl), a                                     ; $12a5: $77
	ld   hl, wNumBirds                                   ; $12a6: $21 $08 $c7
	ld   a, (hl)                                     ; $12a9: $7e
	srl  a                                           ; $12aa: $cb $3f
	srl  a                                           ; $12ac: $cb $3f
	and  $30                                         ; $12ae: $e6 $30
	ld   hl, $c4fc                                   ; $12b0: $21 $fc $c4
	or   (hl)                                        ; $12b3: $b6
	ld   (hl), a                                     ; $12b4: $77
	call Call_000_12d1                               ; $12b5: $cd $d1 $12
	ld   hl, $c006                                   ; $12b8: $21 $06 $c0
	ld   a, (hl)                                     ; $12bb: $7e
	ld   hl, $c4fd                                   ; $12bc: $21 $fd $c4
	ld   (hl), a                                     ; $12bf: $77
	ld   hl, $c007                                   ; $12c0: $21 $07 $c0
	ld   a, (hl)                                     ; $12c3: $7e
	ld   hl, $c4fe                                   ; $12c4: $21 $fe $c4
	ld   (hl), a                                     ; $12c7: $77
	ld   hl, $c008                                   ; $12c8: $21 $08 $c0
	ld   a, (hl)                                     ; $12cb: $7e
	ld   hl, $c4ff                                   ; $12cc: $21 $ff $c4
	ld   (hl), a                                     ; $12cf: $77
	ret                                              ; $12d0: $c9


Call_000_12d1:
	ld   bc, $0000                                   ; $12d1: $01 $00 $00
	ld   hl, $c006                                   ; $12d4: $21 $06 $c0
	ld   (hl), $00                                   ; $12d7: $36 $00
	ld   hl, $c007                                   ; $12d9: $21 $07 $c0
	ld   (hl), $00                                   ; $12dc: $36 $00

-
	ld   hl, $c4e0                                   ; $12de: $21 $e0 $c4
	add  hl, bc                                      ; $12e1: $09
	ld   a, (hl)                                     ; $12e2: $7e
	and  $3f                                         ; $12e3: $e6 $3f
	ld   hl, $c006                                   ; $12e5: $21 $06 $c0
	add  (hl)                                        ; $12e8: $86
	ld   (hl), a                                     ; $12e9: $77
	ld   hl, $c007                                   ; $12ea: $21 $07 $c0
	ld   a, (hl)                                     ; $12ed: $7e
	adc  $00                                         ; $12ee: $ce $00
	ld   (hl), a                                     ; $12f0: $77
	inc  bc                                          ; $12f1: $03
	ld   a, c                                        ; $12f2: $79
	cp   $1d                                         ; $12f3: $fe $1d
	jr   nz, -                             ; $12f5: $20 $e7

	ld   hl, $c006                                   ; $12f7: $21 $06 $c0
	ld   a, (hl)                                     ; $12fa: $7e
	push af                                          ; $12fb: $f5
	and  $3f                                         ; $12fc: $e6 $3f
	ld   hl, $c006                                   ; $12fe: $21 $06 $c0
	ld   (hl), a                                     ; $1301: $77
	pop  af                                          ; $1302: $f1
	rl   a                                           ; $1303: $cb $17
	ld   hl, $c007                                   ; $1305: $21 $07 $c0
	rl   (hl)                                        ; $1308: $cb $16
	rl   a                                           ; $130a: $cb $17
	rl   (hl)                                        ; $130c: $cb $16
	ld   a, (hl)                                     ; $130e: $7e
	and  $3f                                         ; $130f: $e6 $3f
	ld   (hl), a                                     ; $1311: $77
	ld   bc, $0000                                   ; $1312: $01 $00 $00
	ld   a, $2a                                      ; $1315: $3e $2a

-
	ld   hl, $c4e0                                   ; $1317: $21 $e0 $c4
	add  hl, bc                                      ; $131a: $09
	xor  (hl)                                        ; $131b: $ae
	inc  bc                                          ; $131c: $03
	ld   e, a                                        ; $131d: $5f
	ld   a, c                                        ; $131e: $79
	cp   $1d                                         ; $131f: $fe $1d
	ld   a, e                                        ; $1321: $7b
	jr   nz, -                             ; $1322: $20 $f3

	ld   hl, $c006                                   ; $1324: $21 $06 $c0
	xor  (hl)                                        ; $1327: $ae
	ld   hl, $c007                                   ; $1328: $21 $07 $c0
	xor  (hl)                                        ; $132b: $ae
	and  $3f                                         ; $132c: $e6 $3f
	ld   hl, $c008                                   ; $132e: $21 $08 $c0
	ld   (hl), a                                     ; $1331: $77
	ret                                              ; $1332: $c9


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
	ld   hl, $c0a7                                   ; $13a0: $21 $a7 $c0
	ld   (hl), $00                                   ; $13a3: $36 $00
	ld   hl, $c0a9                                   ; $13a5: $21 $a9 $c0
	ld   (hl), $00                                   ; $13a8: $36 $00
	call drawFullMusicTestScreen                               ; $13aa: $cd $50 $14
	ld   a, $00                                      ; $13ad: $3e $00
	ld   hl, $c097                                   ; $13af: $21 $97 $c0
	ld   (hl), a                                     ; $13b2: $77
	ld   hl, wMenuCursorIdx                                   ; $13b3: $21 $11 $c7
	ld   (hl), a                                     ; $13b6: $77
	ld   hl, $c009                                   ; $13b7: $21 $09 $c0
	ld   (hl), a                                     ; $13ba: $77
	jp   @mainLoop                               ; $13bb: $c3 $11 $14


@toMainLoop:
	ld   hl, wOam+1                                   ; $13be: $21 $01 $c2
	ld   (hl), $0e                                   ; $13c1: $36 $0e
	ld   a, $2a                                      ; $13c3: $3e $2a
	ld   hl, wOam+2                                   ; $13c5: $21 $02 $c2
	ld   (hl), a                                     ; $13c8: $77
	ld   a, $00                                      ; $13c9: $3e $00
	ld   hl, wOam+3                                   ; $13cb: $21 $03 $c2
	ld   (hl), a                                     ; $13ce: $77
	ld   a, $04                                      ; $13cf: $3e $04
	ld   hl, $c098                                   ; $13d1: $21 $98 $c0
	ld   (hl), a                                     ; $13d4: $77
	ld   a, $40                                      ; $13d5: $3e $40
	ld   hl, $c0b1                                   ; $13d7: $21 $b1 $c0
	ld   (hl), a                                     ; $13da: $77
	call Call_000_0c69                               ; $13db: $cd $69 $0c
	ld   hl, $c097                                   ; $13de: $21 $97 $c0
	ld   a, (hl)                                     ; $13e1: $7e
	cp   $00                                         ; $13e2: $fe $00
	jr   nz, @not0                             ; $13e4: $20 $03

// exit to game menu
	jp   startTitleScreen                               ; $13e6: $c3 $58 $0b

@not0:
	cp   $01                                         ; $13e9: $fe $01
	jr   nz, @gt1                             ; $13eb: $20 $0d

// speed change
	ld   hl, wMenuCursorIdx                                   ; $13ed: $21 $11 $c7
	ld   a, (hl)                                     ; $13f0: $7e
	xor  $ff                                         ; $13f1: $ee $ff
	ld   hl, wMenuCursorIdx                                   ; $13f3: $21 $11 $c7
	ld   (hl), a                                     ; $13f6: $77
	jp   @mainLoop                               ; $13f7: $c3 $11 $14


@gt1:
	cp   $03                                         ; $13fa: $fe $03
	jr   z, @sound                              ; $13fc: $28 $2f

// song
	ld   hl, $c00c                                   ; $13fe: $21 $0c $c0
	ld   a, (hl)                                     ; $1401: $7e
	cp   $02                                         ; $1402: $fe $02
	jr   nz, @mainLoop                             ; $1404: $20 $0b

	ld   hl, $c0a7                                   ; $1406: $21 $a7 $c0
	inc  (hl)                                        ; $1409: $34
	ld   a, (hl)                                     ; $140a: $7e
	cp   $06                                         ; $140b: $fe $06
	jr   c, @mainLoop                              ; $140d: $38 $02

	ld   (hl), $00                                   ; $140f: $36 $00

@mainLoop:
	call drawFullMusicTestScreen                               ; $1411: $cd $50 $14
	call callCommonSoundFunc1_3times                               ; $1414: $cd $d7 $14
	ld   hl, wMenuCursorIdx                                   ; $1417: $21 $11 $c7
	ld   a, (hl)                                     ; $141a: $7e
	ld   hl, $c72a                                   ; $141b: $21 $2a $c7
	ld   (hl), a                                     ; $141e: $77
	ld   hl, $c0a7                                   ; $141f: $21 $a7 $c0
	ld   a, (hl)                                     ; $1422: $7e
	ld   hl, $c009                                   ; $1423: $21 $09 $c0
	ld   (hl), a                                     ; $1426: $77
	call callCommonSoundFunc0_3times                               ; $1427: $cd $bf $14
	jp   @toMainLoop                               ; $142a: $c3 $be $13

@sound:
	ld   hl, $c00c                                   ; $142d: $21 $0c $c0
	ld   a, (hl)                                     ; $1430: $7e
	cp   $02                                         ; $1431: $fe $02
	jr   nz, +                             ; $1433: $20 $0b

	ld   hl, $c0a9                                   ; $1435: $21 $a9 $c0
	inc  (hl)                                        ; $1438: $34
	ld   a, (hl)                                     ; $1439: $7e
	cp   $2a                                         ; $143a: $fe $2a
	jr   c, +                              ; $143c: $38 $02

	ld   (hl), $00                                   ; $143e: $36 $00

+
	call callCommonSoundFunc1_3times                               ; $1440: $cd $d7 $14
	call drawFullMusicTestScreen                               ; $1443: $cd $50 $14
	ld   hl, $c0a9                                   ; $1446: $21 $a9 $c0
	ld   a, (hl)                                     ; $1449: $7e
	call callCommonSoundFuncs_1507                               ; $144a: $cd $07 $15
	jp   @toMainLoop                               ; $144d: $c3 $be $13


drawFullMusicTestScreen:
	ld   hl, musicScreenLayout                                   ; $1450: $21 $33 $13
	call initMusicScreenGfxOamAndLayout                               ; $1453: $cd $75 $14

// song value
	ld   de, $9927                                   ; $1456: $11 $27 $99
	call dPlusEquScreen0displayOffset                               ; $1459: $cd $99 $1e
	ld   hl, $c0a7                                   ; $145c: $21 $a7 $c0
	ld   a, (hl)                                     ; $145f: $7e
	call Call_001_5af8                                       ; $1460: $cd $f8 $5a

// sound value
	ld   de, $9948                                   ; $1463: $11 $48 $99
	call dPlusEquScreen0displayOffset                               ; $1466: $cd $99 $1e
	ld   hl, $c0a9                                   ; $1469: $21 $a9 $c0
	ld   a, (hl)                                     ; $146c: $7e
	call Call_001_5af8                                       ; $146d: $cd $f8 $5a

//
	ld   a, $01                                      ; $1470: $3e $01
	jp   setLCDfromValue_c015equA                               ; $1472: $c3 $11 $02


initMusicScreenGfxOamAndLayout:
	push hl                                          ; $1475: $e5
	call turnOffLCDstartOfVBlank                               ; $1476: $cd $0a $02
	call clear_c200_to_c2ff                                       ; $1479: $cd $9e $5b
	call copyA0hDataToOam                               ; $147c: $cd $99 $1a
	call clearScreen0                                       ; $147f: $cd $8e $5b
	ld   hl, $001e                                   ; $1482: $21 $1e $00
	call loadTilesetAndVramTileConversionTable_idxedHL                               ; $1485: $cd $7a $17
	pop  hl                                          ; $1488: $e1

@tryNextHLvalue:
	ld   e, (hl)                                     ; $1489: $5e
	inc  hl                                          ; $148a: $23
	ld   d, (hl)                                     ; $148b: $56
	inc  hl                                          ; $148c: $23
	ld   a, e                                        ; $148d: $7b
	cp   $ff                                         ; $148e: $fe $ff
	jr   nz, +                             ; $1490: $20 $05

// go to done if de == $ffff
	ld   a, d                                        ; $1492: $7a
	cp   $ff                                         ; $1493: $fe $ff
	jr   z, @done                              ; $1495: $28 $11

+
	ld   a, d                                        ; $1497: $7a
	add  $98                                         ; $1498: $c6 $98
	ld   d, a                                        ; $149a: $57
	call dPlusEquScreen0displayOffset                               ; $149b: $cd $99 $1e

@waitUntilHLequFF:
	ldi  a, (hl)                                     ; $149e: $2a
	cp   $ff                                         ; $149f: $fe $ff
	jr   z, @tryNextHLvalue                              ; $14a1: $28 $e6

	ld   (de), a                                     ; $14a3: $12
	inc  de                                          ; $14a4: $13
	jp   @waitUntilHLequFF                               ; $14a5: $c3 $9e $14

@done:
	ret                                              ; $14a8: $c9


;;
func_14a9
	ld   de, $0000                                   ; $14a9: $11 $00 $00
	ld   hl, $c006                                   ; $14ac: $21 $06 $c0
	ldi  a, (hl)                                     ; $14af: $2a
	ld   h, (hl)                                     ; $14b0: $66
	ld   l, a                                        ; $14b1: $6f
	add  hl, de                                      ; $14b2: $19
	ld   a, (hl)                                     ; $14b3: $7e
	ld   hl, $c006                                   ; $14b4: $21 $06 $c0
	inc  (hl)                                        ; $14b7: $34
	jr   nz, @done                             ; $14b8: $20 $04

	ld   hl, $c007                                   ; $14ba: $21 $07 $c0
	inc  (hl)                                        ; $14bd: $34

@done:
	ret                                              ; $14be: $c9


callCommonSoundFunc0_3times:
	ld   bc, soundData_61cc
	ld   a, $00                                      ; $14c2: $3e $00
	call callCommonSoundFunc0_14e6                               ; $14c4: $cd $e6 $14

	ld   bc, soundData_61d8                                   ; $14c7: $01 $d8 $61
	ld   a, $01                                      ; $14ca: $3e $01
	call callCommonSoundFunc0_14e6                               ; $14cc: $cd $e6 $14

	ld   bc, soundData_61e4                                   ; $14cf: $01 $e4 $61
	ld   a, $02                                      ; $14d2: $3e $02
	jp   callCommonSoundFunc0_14e6                               ; $14d4: $c3 $e6 $14


callCommonSoundFunc1_3times:
	ld   a, $00
	call commonSoundFunc1                               ; $14d9: $cd $ca $01
	ld   a, $01                                      ; $14dc: $3e $01
	call commonSoundFunc1                               ; $14de: $cd $ca $01
	ld   a, $02                                      ; $14e1: $3e $02
	jp   commonSoundFunc1                               ; $14e3: $c3 $ca $01


callCommonSoundFunc0_14e6:
	push af                                          ; $14e6: $f5
	ld   hl, $c009                                   ; $14e7: $21 $09 $c0
	ld   a, (hl)                                     ; $14ea: $7e
	sla  a                                           ; $14eb: $cb $27
	ld   l, a                                        ; $14ed: $6f
	ld   h, $00                                      ; $14ee: $26 $00
	add  hl, bc                                      ; $14f0: $09
	ld   e, (hl)                                     ; $14f1: $5e
	inc  hl                                          ; $14f2: $23
	ld   d, (hl)                                     ; $14f3: $56
	pop  af                                          ; $14f4: $f1
	jp   commonSoundFunc0                               ; $14f5: $c3 $be $01


Call_000_14f8:
	ld   hl, $c800
	ld   a, (hl)                                     ; $14fb: $7e
	ld   hl, $c80d                                   ; $14fc: $21 $0d $c8
	or   (hl)                                        ; $14ff: $b6
	ld   hl, $c81a                                   ; $1500: $21 $1a $c8
	or   (hl)                                        ; $1503: $b6
	and  $80                                         ; $1504: $e6 $80
	ret                                              ; $1506: $c9


callCommonSoundFuncs_1507:
	sla  a                                           ; $1507: $cb $27
	ld   c, a                                        ; $1509: $4f
	ld   b, $00                                      ; $150a: $06 $00
	ld   hl, soundData_61f0                                   ; $150c: $21 $f0 $61
	add  hl, bc                                      ; $150f: $09
	ld   e, (hl)                                     ; $1510: $5e
	inc  hl                                          ; $1511: $23
	ld   d, (hl)                                     ; $1512: $56

callCommonSoundFuncs_1513:
	ld   a, $00
	ld   hl, $c72a                                   ; $1515: $21 $2a $c7
	ld   (hl), a                                     ; $1518: $77
	ld   hl, $c827                                   ; $1519: $21 $27 $c8
	ld   a, (hl)                                     ; $151c: $7e
	and  $80                                         ; $151d: $e6 $80
	jr   z, +                              ; $151f: $28 $0c

	push de                                          ; $1521: $d5
	ld   a, $04                                      ; $1522: $3e $04
	call commonSoundFunc1                               ; $1524: $cd $ca $01
	pop  de                                          ; $1527: $d1
	ld   a, $04                                      ; $1528: $3e $04
	jp   commonSoundFunc0                               ; $152a: $c3 $be $01

+
	ld   a, $03                                      ; $152d: $3e $03
	jp   commonSoundFunc0                               ; $152f: $c3 $be $01


callCommonSoundFunc1_withFF:
	ld   a, $ff
	jp   commonSoundFunc1                               ; $1534: $c3 $ca $01


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
	// group - roomx - roomy - playerx - playery - ???
	.db $00 $01 $02 $40 $50 $06
	.db $10 $01 $04 $c0 $30 $06 // room with many doors

initGame:
	call clear_c200_to_c2ff
	ld   hl, wIsSecretPlayerName                                   ; $1568: $21 $f8 $c0
	ld   c, (hl)                                     ; $156b: $4e
	ld   b, $00                                      ; $156c: $06 $00
	ld   hl, initData                                   ; $156e: $21 $59 $15
	add  hl, bc                                      ; $1571: $09
	ld   a, (hl)                                     ; $1572: $7e
	ld   hl, wCurrRoomGroup                                   ; $1573: $21 $33 $c0
	ld   (hl), a                                     ; $1576: $77
	ld   hl, initData+1                                   ; $1577: $21 $5a $15
	add  hl, bc                                      ; $157a: $09
	ld   a, (hl)                                     ; $157b: $7e
	ld   hl, wCurrRoomX                                   ; $157c: $21 $34 $c0
	ld   (hl), a                                     ; $157f: $77
	ld   hl, initData+2                                   ; $1580: $21 $5b $15
	add  hl, bc                                      ; $1583: $09
	ld   a, (hl)                                     ; $1584: $7e
	ld   hl, wCurrRoomY                                   ; $1585: $21 $35 $c0
	ld   (hl), a                                     ; $1588: $77
	ld   hl, initData+3                                   ; $1589: $21 $5c $15
	add  hl, bc                                      ; $158c: $09
	ld   a, (hl)                                     ; $158d: $7e
	ld   hl, wPlayerX                                   ; $158e: $21 $52 $c0
	ld   (hl), a                                     ; $1591: $77
	ld   hl, initData+4                                   ; $1592: $21 $5d $15
	add  hl, bc                                      ; $1595: $09
	ld   a, (hl)                                     ; $1596: $7e
	ld   hl, wPlayerY                                   ; $1597: $21 $54 $c0
	ld   (hl), a                                     ; $159a: $77
	ld   hl, initData+5                                   ; $159b: $21 $5e $15
	add  hl, bc                                      ; $159e: $09
	ld   a, (hl)                                     ; $159f: $7e
	ld   hl, wPlayerStartingDirection                                   ; $15a0: $21 $df $c6
	ld   (hl), a                                     ; $15a3: $77

	ld   a, $00                                      ; $15a4: $3e $00
	ld   hl, wNumBombs                                   ; $15a6: $21 $3b $c0
	ld   (hl), a                                     ; $15a9: $77
	ld   hl, wNumBirds                                   ; $15aa: $21 $08 $c7
	ld   (hl), a                                     ; $15ad: $77
	ld   hl, wNumKeys                                   ; $15ae: $21 $fa $c5
	ld   (hl), a                                     ; $15b1: $77
	ld   hl, wAnointingOilsGotten                                   ; $15b2: $21 $51 $c6
	ld   (hl), a                                     ; $15b5: $77
	ld   hl, wArmorOfGodGotten                                   ; $15b6: $21 $52 $c6
	ld   (hl), a                                     ; $15b9: $77
	ld   hl, wSpecialBitemsGotten                                   ; $15ba: $21 $53 $c6
	ld   (hl), a                                     ; $15bd: $77
	ld   hl, wIsLampOn                                   ; $15be: $21 $5b $c0
	ld   (hl), a                                     ; $15c1: $77
	ld   hl, wEquippedBItem                                   ; $15c2: $21 $49 $c0
	ld   (hl), a                                     ; $15c5: $77
	ld   hl, wFruitEquipped                                   ; $15c6: $21 $0c $c7
	ld   (hl), a                                     ; $15c9: $77
	ld   hl, wFruitAmounts+1                                   ; $15ca: $21 $0a $c7
	ld   (hl), a                                     ; $15cd: $77
	ld   hl, wFruitAmounts+2                                   ; $15ce: $21 $0b $c7
	ld   (hl), a                                     ; $15d1: $77
	ld   hl, wFruitAmounts                                   ; $15d2: $21 $09 $c7
	ld   (hl), a                                     ; $15d5: $77
	ld   hl, $c4df                                   ; $15d6: $21 $df $c4
	ld   (hl), a                                     ; $15d9: $77

//
	ld   bc, $0000                                   ; $15da: $01 $00 $00
-
	ld   hl, wItemsGotten                                   ; $15dd: $21 $54 $c6
	add  hl, bc                                      ; $15e0: $09
	ld   (hl), $00                                   ; $15e1: $36 $00
	inc  bc                                          ; $15e3: $03
	ld   a, c                                        ; $15e4: $79
	cp   $0a                                         ; $15e5: $fe $0a
	jr   nz, -                             ; $15e7: $20 $f4

	ld   hl, wPlayerMaxHealth                                   ; $15e9: $21 $73 $c0
	ld   (hl), $06                                   ; $15ec: $36 $06
	ld   hl, wPlayerHealth                                   ; $15ee: $21 $72 $c0
	ld   (hl), $06                                   ; $15f1: $36 $06

// straight here from correct password
postInitGame:
	call Call_000_241a                               ; $15f3: $cd $1a $24
	ld   hl, resetRoomFlagData                                   ; $15f6: $21 $4b $09
	call jpHLinBank1                                       ; $15f9: $cd $b0 $61

// after continuing after dying?
postInitGame2:
	ld   hl, wPlayerStartingDirection                                   ; $15fc: $21 $df $c6
	ld   a, (hl)                                     ; $15ff: $7e
	ld   c, $00                                      ; $1600: $0e $00
	ld   hl, wPlayerAnimationIdx                                   ; $1602: $21 $57 $c0
	ld   (hl), c                                     ; $1605: $71
	cp   $09                                         ; $1606: $fe $09
	jr   nz, +                             ; $1608: $20 $04

	ld   c, $20                                      ; $160a: $0e $20
	ld   a, $00                                      ; $160c: $3e $00

+
	add  $40                                         ; $160e: $c6 $40
	ld   hl, $c056                                   ; $1610: $21 $56 $c0
	ld   (hl), a                                     ; $1613: $77
	ld   hl, wPlayerOamAttr                                   ; $1614: $21 $55 $c0
	ld   (hl), c                                     ; $1617: $71
	ld   hl, wRoomTransitionType                                   ; $1618: $21 $3a $c0
	ld   (hl), $0c                                   ; $161b: $36 $0c
	call loadRoomGroupStruct                               ; $161d: $cd $3b $18
	ld   a, $00                                      ; $1620: $3e $00
	ld   hl, wKeysPressed                                   ; $1622: $21 $16 $c0
	ld   (hl), a                                     ; $1625: $77
	ld   hl, wInventorySelectedXIdx                                   ; $1626: $21 $48 $c6
	ld   (hl), a                                     ; $1629: $77
	ld   hl, wInventorySelectedYIdx                                   ; $162a: $21 $5f $c6
	ld   (hl), a                                     ; $162d: $77
	ld   hl, wIsEquippingRaft                                   ; $162e: $21 $4c $c0
	ld   (hl), a                                     ; $1631: $77
	ld   hl, wCounterSo2ArmorIsAThirdDamageTaken                                   ; $1632: $21 $d9 $c0
	ld   (hl), a                                     ; $1635: $77
	ld   hl, wPlayerScore                                   ; $1636: $21 $2b $c0
	ld   de, $0007                                   ; $1639: $11 $07 $00
	call setAtoHL_deBytes                               ; $163c: $cd $6d $27
	ld   hl, $c6de                                   ; $163f: $21 $de $c6
	ld   (hl), $00                                   ; $1642: $36 $00
	ld   hl, wScreen1displayOffset                                   ; $1644: $21 $dd $c6
	ld   (hl), $04                                   ; $1647: $36 $04
	ld   hl, $c0d6                                   ; $1649: $21 $d6 $c0
	ld   (hl), $ff                                   ; $164c: $36 $ff

-
	call Call_000_1b1e                               ; $164e: $cd $1e $1b
	jr   nc, -                             ; $1651: $30 $fb

	call setScrollValues                               ; $1653: $cd $f1 $1d
	call reloadGfxClearLCDScreen_loadTileset1ch                               ; $1656: $cd $ef $16
	ld   hl, lyt_gameOverScreen                                   ; $1659: $21 $fe $10
	call copyLayoutFromBank3toScreen0withOffset                               ; $165c: $cd $37 $15
	call func_5abf                                       ; $165f: $cd $bf $5a
	call generatePassword                               ; $1662: $cd $d6 $11

//
	ld   de, $9962                                   ; $1665: $11 $62 $99
	call dPlusEquScreen0displayOffset                               ; $1668: $cd $99 $1e
	ld   bc, $0000                                   ; $166b: $01 $00 $00
-
	ld   hl, $c4e0                                   ; $166e: $21 $e0 $c4
	add  hl, bc                                      ; $1671: $09
	ld   a, (hl)                                     ; $1672: $7e
	and  $3f                                         ; $1673: $e6 $3f
	ld   hl, data_0d5e                                   ; $1675: $21 $5e $0d
	add  l                                           ; $1678: $85
	ld   l, a                                        ; $1679: $6f
	ld   a, h                                        ; $167a: $7c
	adc  $00                                         ; $167b: $ce $00
	ld   h, a                                        ; $167d: $67
	ld   a, (hl)                                     ; $167e: $7e
	ld   (de), a                                     ; $167f: $12
	inc  de                                          ; $1680: $13
	inc  bc                                          ; $1681: $03
	ld   a, c                                        ; $1682: $79
	cp   $10                                         ; $1683: $fe $10
	jr   nz, -                             ; $1685: $20 $e7

	ld   de, $9982                                   ; $1687: $11 $82 $99
	call dPlusEquScreen0displayOffset                               ; $168a: $cd $99 $1e

jr_000_168d:
	ld   hl, $c4e0                                   ; $168d: $21 $e0 $c4
	add  hl, bc                                      ; $1690: $09
	ld   a, (hl)                                     ; $1691: $7e
	and  $3f                                         ; $1692: $e6 $3f
	ld   hl, data_0d5e                                   ; $1694: $21 $5e $0d
	add  l                                           ; $1697: $85
	ld   l, a                                        ; $1698: $6f
	ld   a, h                                        ; $1699: $7c
	adc  $00                                         ; $169a: $ce $00
	ld   h, a                                        ; $169c: $67
	ld   a, (hl)                                     ; $169d: $7e
	ld   (de), a                                     ; $169e: $12
	inc  de                                          ; $169f: $13
	inc  bc                                          ; $16a0: $03
	ld   a, c                                        ; $16a1: $79
	cp   $20                                         ; $16a2: $fe $20
	jr   nz, jr_000_168d                             ; $16a4: $20 $e7

	ld   a, $01                                      ; $16a6: $3e $01
	call setLCDfromValue_c015equA                               ; $16a8: $cd $11 $02
	call callsCommonSoundFuncs_27ea                               ; $16ab: $cd $ea $27
	ld   hl, wOam+1                                   ; $16ae: $21 $01 $c2
	ld   (hl), $34                                   ; $16b1: $36 $34
	ld   hl, wOam+2                                   ; $16b3: $21 $02 $c2
	ld   (hl), $a2                                   ; $16b6: $36 $a2
	ld   hl, wOam+3                                   ; $16b8: $21 $03 $c2
	ld   (hl), $00                                   ; $16bb: $36 $00
	ld   a, $02                                      ; $16bd: $3e $02
	ld   hl, $c098                                   ; $16bf: $21 $98 $c0
	ld   (hl), a                                     ; $16c2: $77
	ld   a, $00                                      ; $16c3: $3e $00
	ld   hl, $c097                                   ; $16c5: $21 $97 $c0
	ld   (hl), a                                     ; $16c8: $77
	ld   a, $40                                      ; $16c9: $3e $40
	ld   hl, $c0b1                                   ; $16cb: $21 $b1 $c0
	ld   (hl), a                                     ; $16ce: $77
	call Call_000_0c69                               ; $16cf: $cd $69 $0c
	call callCommonSoundFunc1_withFF                               ; $16d2: $cd $32 $15
	ld   hl, $c097                                   ; $16d5: $21 $97 $c0
	ld   a, (hl)                                     ; $16d8: $7e
	cp   $00                                         ; $16d9: $fe $00
	jr   z, +                              ; $16db: $28 $03

	jp   startTitleScreen                               ; $16dd: $c3 $58 $0b

+
	ld   a, $06                                      ; $16e0: $3e $06
	ld   hl, wPlayerHealth                                   ; $16e2: $21 $72 $c0
	ld   (hl), a                                     ; $16e5: $77
	call setRevivePointInRoomGroup                               ; $16e6: $cd $96 $19
	call clear_c200_to_c2ff                                       ; $16e9: $cd $9e $5b
	jp   postInitGame2                               ; $16ec: $c3 $fc $15


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
	ld   de, wCurrent2x2tileToVramTileIdxConversionTable

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
	ld   de, wVramTileConversionTables
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


convert2x2tileValueToTopLeftVramTileValue:
	push hl
	push af
	srl  a
	srl  a

// hl += wCurrent2x2tileToVramTileIdxConversionTable
	add  <wCurrent2x2tileToVramTileIdxConversionTable
	ld   l, a
	ld   a, $00
	adc  >wCurrent2x2tileToVramTileIdxConversionTable
	ld   h, a
	ld   a, (hl)

	cp   $ff
	jr   nz, +

	pop  af
	pop  hl
	ret

+
	pop  hl
	pop  hl
	ret


func_17dd:
	bit  0, a
	jp   nz, +                           ; $17df: $c2 $ec $17

	call convert2x2tileValueToTopLeftVramTileValue                               ; $17e2: $cd $c4 $17
	push hl                                          ; $17e5: $e5
	ld   hl, $c017                                   ; $17e6: $21 $17 $c0
	ld   (hl), a                                     ; $17e9: $77
	pop  hl                                          ; $17ea: $e1
	ret                                              ; $17eb: $c9

+
	push hl                                          ; $17ec: $e5
	and  $fc                                         ; $17ed: $e6 $fc
	push af                                          ; $17ef: $f5
	srl  a                                           ; $17f0: $cb $3f
	srl  a                                           ; $17f2: $cb $3f
	add  <wVramTileConversionTables                                         ; $17f4: $c6 $46
	ld   l, a                                        ; $17f6: $6f
	ld   a, $00                                      ; $17f7: $3e $00
	adc  >wVramTileConversionTables                                         ; $17f9: $ce $d0
	ld   h, a                                        ; $17fb: $67
	ld   a, (hl)                                     ; $17fc: $7e
	cp   $ff                                         ; $17fd: $fe $ff
	jr   nz, +                             ; $17ff: $20 $07

	pop  af                                          ; $1801: $f1
	ld   hl, $c017                                   ; $1802: $21 $17 $c0
	ld   (hl), a                                     ; $1805: $77
	pop  hl                                          ; $1806: $e1
	ret                                              ; $1807: $c9

+
	pop  hl                                          ; $1808: $e1
	ld   hl, $c017                                   ; $1809: $21 $17 $c0
	ld   (hl), a                                     ; $180c: $77
	pop  hl                                          ; $180d: $e1
	ret                                              ; $180e: $c9


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


;;
jr_000_182f:
	call pollInput                                       ; $182f: $cd $3b $5b
	ld   hl, wKeysPressed                                   ; $1832: $21 $16 $c0
	ld   a, (hl)                                     ; $1835: $7e
	cp   $00                                         ; $1836: $fe $00
	jr   z, jr_000_182f                              ; $1838: $28 $f5

	ret                                              ; $183a: $c9


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

Call_000_19f8:
	ld   hl, $d002
	ld   (hl), e                                     ; $19fb: $73
	ld   hl, $d001                                   ; $19fc: $21 $01 $d0
	ld   a, (hl)                                     ; $19ff: $7e
	or   a                                           ; $1a00: $b7
	jr   z, jr_000_1a24                              ; $1a01: $28 $21

Jump_000_1a03:
	call minimalMainLoop                               ; $1a03: $cd $5e $1a
	ld   hl, $d002                                   ; $1a06: $21 $02 $d0
	ld   a, (hl)                                     ; $1a09: $7e
	or   a                                           ; $1a0a: $b7
	jr   z, jr_000_1a14                              ; $1a0b: $28 $07

	dec  (hl)                                        ; $1a0d: $35
	jr   nz, jr_000_1a14                             ; $1a0e: $20 $04

	ld   a, $00                                      ; $1a10: $3e $00
	jr   jr_000_1a49                                 ; $1a12: $18 $35

jr_000_1a14:
	call pollInput                                       ; $1a14: $cd $3b $5b
	jr   z, jr_000_1a1c                              ; $1a17: $28 $03

	jp   Jump_000_1a03                               ; $1a19: $c3 $03 $1a


jr_000_1a1c:
	call minimalMainLoop                               ; $1a1c: $cd $5e $1a
	call pollInput                                       ; $1a1f: $cd $3b $5b
	jr   nz, Jump_000_1a03                             ; $1a22: $20 $df

jr_000_1a24:
	call minimalMainLoop                               ; $1a24: $cd $5e $1a
	ld   hl, $d002                                   ; $1a27: $21 $02 $d0
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


;;
jr_000_1a4b:
	ld   e, $0c                                      ; $1a4b: $1e $0c
	call Call_000_19f8                               ; $1a4d: $cd $f8 $19
	jr   nz, @done                             ; $1a50: $20 $05

	call clear_d001                               ; $1a52: $cd $58 $1a
	jr   jr_000_1a4b                                 ; $1a55: $18 $f4

@done:
	ret                                              ; $1a57: $c9


clear_d001:
	ld   hl, $d001                                   ; $1a58: $21 $01 $d0
	ld   (hl), $00                                   ; $1a5b: $36 $00
	ret                                              ; $1a5d: $c9


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
	call commonSoundFunc2
	ret


callCommonSoundFunc2startOfVBlank:
	call waitUntilStartOfVBlankPeriod
	call commonSoundFunc2
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
Call_000_1b1e:
	ld   a, $00                                      ; $1b1e: $3e $00
	ld   hl, $c025                                   ; $1b20: $21 $25 $c0
	ld   (hl), a                                     ; $1b23: $77
	ld   hl, $c027                                   ; $1b24: $21 $27 $c0
	ld   (hl), a                                     ; $1b27: $77
	ld   hl, $c02a                                   ; $1b28: $21 $2a $c0
	ld   (hl), a                                     ; $1b2b: $77
	ld   hl, wScrollingTextByteDone                                   ; $1b2c: $21 $61 $c0
	ld   (hl), a                                     ; $1b2f: $77
	ld   hl, $c07e                                   ; $1b30: $21 $7e $c0
	ld   (hl), a                                     ; $1b33: $77
	ld   hl, $c6c8                                   ; $1b34: $21 $c8 $c6
	ld   (hl), a                                     ; $1b37: $77
	ld   hl, $c714                                   ; $1b38: $21 $14 $c7
	ld   (hl), a                                     ; $1b3b: $77
	ld   hl, $c6cb                                   ; $1b3c: $21 $cb $c6
	ld   (hl), a                                     ; $1b3f: $77
	ld   hl, $c059                                   ; $1b40: $21 $59 $c0
	ld   (hl), a                                     ; $1b43: $77
	ld   hl, $c05e                                   ; $1b44: $21 $5e $c0
	ld   (hl), a                                     ; $1b47: $77
	ld   hl, $c57f                                   ; $1b48: $21 $7f $c5
	ld   (hl), a                                     ; $1b4b: $77
	ld   hl, $cefe                                   ; $1b4c: $21 $fe $ce
	ld   (hl), a                                     ; $1b4f: $77
	ld   hl, $ceff                                   ; $1b50: $21 $ff $ce
	ld   (hl), a                                     ; $1b53: $77
	call setScrollValues                               ; $1b54: $cd $f1 $1d
	ld   hl, wRoomTransitionType                                   ; $1b57: $21 $3a $c0
	ld   a, (hl)                                     ; $1b5a: $7e
	cp   RTT_DIFF_GROUP                                         ; $1b5b: $fe $0c
	jp   nz, @handleRoomTransitionInit                           ; $1b5d: $c2 $9b $1b

// involved with loading a screen
@loadScreen:
	call callCommonSoundFunc2startOfVBlank                               ; $1b60: $cd $76 $1a
	call turnOffLCD                               ; $1b63: $cd $0d $02
	ld   hl, wScreen0displayOffset                                   ; $1b66: $21 $dc $c6
	ld   (hl), $00                                   ; $1b69: $36 $00
	ld   hl, $c6de                                   ; $1b6b: $21 $de $c6
	ld   (hl), $00                                   ; $1b6e: $36 $00
	ld   hl, wScreen1displayOffset                                   ; $1b70: $21 $dd $c6
	ld   (hl), $04                                   ; $1b73: $36 $04
	call TODOloadsRoomData                               ; $1b75: $cd $af $1e
	call applyPalettesBasedOnLamp                               ; $1b78: $cd $06 $1e
	call loadNPCAttrs                                       ; $1b7b: $cd $97 $72
	call clear_c200_to_c2ff                                       ; $1b7e: $cd $9e $5b
	call commonSoundFunc2                               ; $1b81: $cd $d6 $01
	call loadGameScreenTilesOntoScreen                               ; $1b84: $cd $3b $1e
	call commonSoundFunc2                               ; $1b87: $cd $d6 $01
	call copyPlayerDataOnto_wOam                                       ; $1b8a: $cd $aa $56
	call copyRaftDataToOam                                       ; $1b8d: $cd $fd $55
	ld   a, $06                                      ; $1b90: $3e $06
	call setLCDfromValue_c015equA                               ; $1b92: $cd $11 $02
	call func_581a                                       ; $1b95: $cd $1a $58
	jp   Jump_000_1bf7                               ; $1b98: $c3 $f7 $1b


@handleRoomTransitionInit:
	ld   hl, wRoomTransitionType                                   ; $1b9b: $21 $3a $c0
	ld   a, (hl)                                     ; $1b9e: $7e
	cp   DIR_LEFT                                         ; $1b9f: $fe $09
	jr   nz, +                             ; $1ba1: $20 $0d

// transitioned left
	ld   hl, wPlayerX                                   ; $1ba3: $21 $52 $c0
	ld   (hl), $f0                                   ; $1ba6: $36 $f0
	ld   hl, wSCXvalue                                   ; $1ba8: $21 $10 $cb
	ld   (hl), $60                                   ; $1bab: $36 $60
	jp   @loadScreen                               ; $1bad: $c3 $60 $1b

+
	cp   DIR_RIGHT                                         ; $1bb0: $fe $00
	jr   nz, +                             ; $1bb2: $20 $0d

// transitioned right
	ld   hl, wPlayerX                                   ; $1bb4: $21 $52 $c0
	ld   (hl), $00                                   ; $1bb7: $36 $00
	ld   hl, wSCXvalue                                   ; $1bb9: $21 $10 $cb
	ld   (hl), $00                                   ; $1bbc: $36 $00
	jp   @loadScreen                               ; $1bbe: $c3 $60 $1b

+
	cp   DIR_UP                                         ; $1bc1: $fe $03
	jp   nz, +                           ; $1bc3: $c2 $d3 $1b

// transitioned up
	ld   hl, wPlayerY                                   ; $1bc6: $21 $54 $c0
	ld   (hl), $a0                                   ; $1bc9: $36 $a0
	ld   hl, wSCYvalue                                   ; $1bcb: $21 $11 $cb
	ld   (hl), $20                                   ; $1bce: $36 $20
	jp   @loadScreen                               ; $1bd0: $c3 $60 $1b

+
// transitioned down
	ld   hl, wPlayerY                                   ; $1bd3: $21 $54 $c0
	ld   (hl), $00                                   ; $1bd6: $36 $00
	ld   hl, wSCYvalue                                   ; $1bd8: $21 $11 $cb
	ld   (hl), $00                                   ; $1bdb: $36 $00
	jp   @loadScreen                               ; $1bdd: $c3 $60 $1b


;;
	ld   a, $00                                      ; $1be0: $3e $00
	ld   hl, $c0b7                                   ; $1be2: $21 $b7 $c0
	ld   (hl), a                                     ; $1be5: $77

-
	call callCommonSoundFunc2startOfVBlank                               ; $1be6: $cd $76 $1a
	call Call_001_5826                                       ; $1be9: $cd $26 $58
	jr   nz, -                             ; $1bec: $20 $f8

	call waitUntilStartOfVBlankPeriod                               ; $1bee: $cd $e8 $01
	call applyPalettesBasedOnLamp                               ; $1bf1: $cd $06 $1e
	call commonSoundFunc2                               ; $1bf4: $cd $d6 $01

Jump_000_1bf7:
	call retZIfCanRaftOnScreen                               ; $1bf7: $cd $b5 $23
	jr   z, +                              ; $1bfa: $28 $06

	ld   a, $00                                      ; $1bfc: $3e $00
	ld   hl, wIsEquippingRaft                                   ; $1bfe: $21 $4c $c0
	ld   (hl), a                                     ; $1c01: $77

+
	call Call_000_14f8                               ; $1c02: $cd $f8 $14
	jr   nz, +                             ; $1c05: $20 $03

	call callsCommonSoundFuncs_27ae                               ; $1c07: $cd $ae $27

+
	ld   a, $00                                      ; $1c0a: $3e $00
	ld   hl, wMainLoopCounter                                   ; $1c0c: $21 $14 $c0
	ld   (hl), a                                     ; $1c0f: $77
	call pollInput                                       ; $1c10: $cd $3b $5b
	ld   hl, wNewKeysPressed                                   ; $1c13: $21 $18 $c0
	ld   (hl), a                                     ; $1c16: $77

mainLoop:
	call waitUntilStartOfVBlankPeriod                               ; $1c17: $cd $e8 $01
	ld   hl, wMainLoopCounter                                   ; $1c1a: $21 $14 $c0
	inc  (hl)                                        ; $1c1d: $34
	call flashOBP1every8timesCalled                               ; $1c1e: $cd $7d $1a
	ld   hl, wMainLoopCounter                                   ; $1c21: $21 $14 $c0
	bit  0, (hl)                                     ; $1c24: $cb $46
	jr   nz, +                             ; $1c26: $20 $12

// copy to oam and set scrolls every other main loop
	call copyA0hDataToOam                               ; $1c28: $cd $99 $1a
	ld   hl, wSCXvalue                                   ; $1c2b: $21 $10 $cb
	ld   e, (hl)                                     ; $1c2e: $5e
	ld   hl, wSCYvalue                                   ; $1c2f: $21 $11 $cb
	ld   a, (hl)                                     ; $1c32: $7e
	ld   hl, rSCY                                   ; $1c33: $21 $42 $ff
	ldi  (hl), a                                     ; $1c36: $22
	ld   (hl), e                                     ; $1c37: $73
	jr   jr_000_1c46                                 ; $1c38: $18 $0c

+
	call Call_001_5a3b                                       ; $1c3a: $cd $3b $5a
	call Call_001_5a3b                                       ; $1c3d: $cd $3b $5a
	call displayNextTextCharacter                                       ; $1c40: $cd $2b $74
	call animateTile                                       ; $1c43: $cd $b5 $60

jr_000_1c46:
	call commonSoundFunc2                               ; $1c46: $cd $d6 $01
	call pollInput                                       ; $1c49: $cd $3b $5b
	ld   hl, $c058                                   ; $1c4c: $21 $58 $c0
	ld   a, (hl)                                     ; $1c4f: $7e
	cp   $00                                         ; $1c50: $fe $00
	jr   nz, @afterInvScreenCheck                             ; $1c52: $20 $20

	ld   hl, $c059                                   ; $1c54: $21 $59 $c0
	ld   a, (hl)                                     ; $1c57: $7e
	cp   $00                                         ; $1c58: $fe $00
	jr   nz, @afterInvScreenCheck                             ; $1c5a: $20 $18

// check if pressing select to go to inventory screen
	ld   hl, wNewKeysPressed                                   ; $1c5c: $21 $18 $c0
	ld   a, (hl)                                     ; $1c5f: $7e
	and  PADF_SELECT                                         ; $1c60: $e6 $04
	jr   z, @afterInvScreenCheck                              ; $1c62: $28 $10

	ld   hl, wKeysPressed                                   ; $1c64: $21 $16 $c0
	ld   a, (hl)                                     ; $1c67: $7e
	and  PADF_SELECT                                         ; $1c68: $e6 $04
	jr   z, @afterInvScreenCheck                              ; $1c6a: $28 $08

	call handleInventoryScreen                               ; $1c6c: $cd $96 $1f
	jr   z, mainLoop                              ; $1c6f: $28 $a6

	jp   Jump_000_1cf5                               ; $1c71: $c3 $f5 $1c


@afterInvScreenCheck:
	ld   hl, wNewKeysPressed                                   ; $1c74: $21 $18 $c0
	ld   a, (hl)                                     ; $1c77: $7e
	and  PADF_START                                         ; $1c78: $e6 $08
	jr   z, @afterPauseGameCheck                              ; $1c7a: $28 $2d

	ld   hl, wKeysPressed                                   ; $1c7c: $21 $16 $c0
	ld   a, (hl)                                     ; $1c7f: $7e
	and  PADF_START                                         ; $1c80: $e6 $08
	jr   z, @afterPauseGameCheck                              ; $1c82: $28 $25

// pause game
	ld   hl, $c058                                   ; $1c84: $21 $58 $c0
	ld   a, (hl)                                     ; $1c87: $7e
	xor  $ff                                         ; $1c88: $ee $ff
	ld   hl, $c058                                   ; $1c8a: $21 $58 $c0
	ld   (hl), a                                     ; $1c8d: $77
	cp   $00                                         ; $1c8e: $fe $00
	jr   z, +                              ; $1c90: $28 $06

	call callsCommonSoundFuncs_27c3                               ; $1c92: $cd $c3 $27
	jp   @afterPauseGameCheck                               ; $1c95: $c3 $a9 $1c


+
	ld   hl, $c08b                                   ; $1c98: $21 $8b $c0
	ld   a, (hl)                                     ; $1c9b: $7e
	cp   $00                                         ; $1c9c: $fe $00
	jr   z, +                              ; $1c9e: $28 $06

	call callsCommonSoundFuncs_27ae                               ; $1ca0: $cd $ae $27
	jp   @afterPauseGameCheck                               ; $1ca3: $c3 $a9 $1c


+
	call callsCommonSoundFuncs_27ae                               ; $1ca6: $cd $ae $27

@afterPauseGameCheck:
	ld   hl, $c058                                   ; $1ca9: $21 $58 $c0
	ld   a, (hl)                                     ; $1cac: $7e
	cp   $00                                         ; $1cad: $fe $00
	jr   z, jr_000_1cb4                              ; $1caf: $28 $03

	jp   mainLoop                               ; $1cb1: $c3 $17 $1c


jr_000_1cb4:
	ld   hl, $c059                                   ; $1cb4: $21 $59 $c0
	ld   a, (hl)                                     ; $1cb7: $7e
	cp   $00                                         ; $1cb8: $fe $00
	jr   z, jr_000_1cbd                              ; $1cba: $28 $01

	dec  (hl)                                        ; $1cbc: $35

jr_000_1cbd:
	ld   hl, $c6c8                                   ; $1cbd: $21 $c8 $c6
	ld   a, (hl)                                     ; $1cc0: $7e
	cp   $00                                         ; $1cc1: $fe $00
	jr   z, jr_000_1cc6                              ; $1cc3: $28 $01

	dec  (hl)                                        ; $1cc5: $35

jr_000_1cc6:
	ld   hl, $c025                                   ; $1cc6: $21 $25 $c0
	ld   a, (hl)                                     ; $1cc9: $7e
	cp   $00                                         ; $1cca: $fe $00
	jr   z, jr_000_1ccf                              ; $1ccc: $28 $01

	dec  (hl)                                        ; $1cce: $35

jr_000_1ccf:
	ld   hl, $c04e                                   ; $1ccf: $21 $4e $c0
	ld   a, (hl)                                     ; $1cd2: $7e
	add  $0a                                         ; $1cd3: $c6 $0a
	cp   $28                                         ; $1cd5: $fe $28
	jr   c, jr_000_1cdb                              ; $1cd7: $38 $02

	sub  $28                                         ; $1cd9: $d6 $28

jr_000_1cdb:
	ld   hl, $c04e                                   ; $1cdb: $21 $4e $c0
	ld   (hl), a                                     ; $1cde: $77
	ld   hl, $c08b                                   ; $1cdf: $21 $8b $c0
	ld   a, (hl)                                     ; $1ce2: $7e
	cp   $00                                         ; $1ce3: $fe $00
	jr   z, jr_000_1cfa                              ; $1ce5: $28 $13

	call Call_000_294f                               ; $1ce7: $cd $4f $29
	ld   hl, $c08d                                   ; $1cea: $21 $8d $c0
	ld   a, (hl)                                     ; $1ced: $7e
	cp   $00                                         ; $1cee: $fe $00
	jr   nz, Jump_000_1cf5                             ; $1cf0: $20 $03

	jp   Jump_000_1dca                               ; $1cf2: $c3 $ca $1d


Jump_000_1cf5:
	call callCommonSoundFunc1_withFF                               ; $1cf5: $cd $32 $15
	scf                                              ; $1cf8: $37
	ret                                              ; $1cf9: $c9


jr_000_1cfa:
	ld   hl, $c05d                                   ; $1cfa: $21 $5d $c0
	ld   a, (hl)                                     ; $1cfd: $7e
	cp   $fe                                         ; $1cfe: $fe $fe
	jp   nz, Jump_000_1dad                           ; $1d00: $c2 $ad $1d

	ld   hl, $c57f                                   ; $1d03: $21 $7f $c5
	ld   a, (hl)                                     ; $1d06: $7e
	cp   $00                                         ; $1d07: $fe $00
	jr   z, jr_000_1d2a                              ; $1d09: $28 $1f

	ld   hl, $c57f                                   ; $1d0b: $21 $7f $c5
	dec  (hl)                                        ; $1d0e: $35
	jp   nz, Jump_000_1dca                           ; $1d0f: $c2 $ca $1d

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
	jp   Jump_000_1dca                               ; $1d27: $c3 $ca $1d


jr_000_1d2a:
	ld   hl, $c6d8                                   ; $1d2a: $21 $d8 $c6
	ld   a, (hl)                                     ; $1d2d: $7e
	ld   hl, $c6d9                                   ; $1d2e: $21 $d9 $c6
	or   (hl)                                        ; $1d31: $b6
	jr   z, jr_000_1da7                              ; $1d32: $28 $73

	ld   hl, $c6d9                                   ; $1d34: $21 $d9 $c6
	ld   a, (hl)                                     ; $1d37: $7e
	cp   $00                                         ; $1d38: $fe $00
	jr   z, jr_000_1d5f                              ; $1d3a: $28 $23

	bit  7, a                                        ; $1d3c: $cb $7f
	jr   nz, jr_000_1d51                             ; $1d3e: $20 $11

	ld   hl, wPlayerY                                   ; $1d40: $21 $54 $c0
	inc  (hl)                                        ; $1d43: $34
	ld   hl, $c6d9                                   ; $1d44: $21 $d9 $c6
	dec  (hl)                                        ; $1d47: $35
	ld   bc, $0046                                   ; $1d48: $01 $46 $00
	ld   de, $0000                                   ; $1d4b: $11 $00 $00
	jp   Jump_000_1d5f                               ; $1d4e: $c3 $5f $1d


jr_000_1d51:
	ld   hl, wPlayerY                                   ; $1d51: $21 $54 $c0
	dec  (hl)                                        ; $1d54: $35
	ld   hl, $c6d9                                   ; $1d55: $21 $d9 $c6
	inc  (hl)                                        ; $1d58: $34
	ld   bc, $0043                                   ; $1d59: $01 $43 $00
	ld   de, $0000                                   ; $1d5c: $11 $00 $00

Jump_000_1d5f:
jr_000_1d5f:
	ld   hl, $c6d8                                   ; $1d5f: $21 $d8 $c6
	ld   a, (hl)                                     ; $1d62: $7e
	cp   $00                                         ; $1d63: $fe $00
	jr   z, jr_000_1d8a                              ; $1d65: $28 $23

	bit  7, a                                        ; $1d67: $cb $7f
	jr   nz, jr_000_1d7c                             ; $1d69: $20 $11

	ld   hl, wPlayerX                                   ; $1d6b: $21 $52 $c0
	inc  (hl)                                        ; $1d6e: $34
	ld   hl, $c6d8                                   ; $1d6f: $21 $d8 $c6
	dec  (hl)                                        ; $1d72: $35
	ld   bc, $0040                                   ; $1d73: $01 $40 $00
	ld   de, $0000                                   ; $1d76: $11 $00 $00
	jp   Jump_000_1d8a                               ; $1d79: $c3 $8a $1d


jr_000_1d7c:
	ld   hl, wPlayerX                                   ; $1d7c: $21 $52 $c0
	dec  (hl)                                        ; $1d7f: $35
	ld   hl, $c6d8                                   ; $1d80: $21 $d8 $c6
	inc  (hl)                                        ; $1d83: $34
	ld   bc, $0040                                   ; $1d84: $01 $40 $00
	ld   de, $0020                                   ; $1d87: $11 $20 $00

Jump_000_1d8a:
jr_000_1d8a:
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
	ld   hl, $c056                                   ; $1d9d: $21 $56 $c0
	ld   (hl), c                                     ; $1da0: $71
	call Jump_001_4d69                                       ; $1da1: $cd $69 $4d
	jp   Jump_000_1dca                               ; $1da4: $c3 $ca $1d


jr_000_1da7:
	ld   a, $00                                      ; $1da7: $3e $00
	ld   hl, $c05d                                   ; $1da9: $21 $5d $c0
	ld   (hl), a                                     ; $1dac: $77

Jump_000_1dad:
	ld   hl, $c059                                   ; $1dad: $21 $59 $c0
	ld   a, (hl)                                     ; $1db0: $7e
	cp   $00                                         ; $1db1: $fe $00
	jr   nz, Jump_000_1dca                             ; $1db3: $20 $15

	call Call_000_29ea                               ; $1db5: $cd $ea $29
	ld   hl, $c05d                                   ; $1db8: $21 $5d $c0
	ld   a, (hl)                                     ; $1dbb: $7e
	cp   $00                                         ; $1dbc: $fe $00
	jr   z, jr_000_1dc7                              ; $1dbe: $28 $07

	cp   $fe                                         ; $1dc0: $fe $fe
	jr   z, jr_000_1dc7                              ; $1dc2: $28 $03

	scf                                              ; $1dc4: $37
	ccf                                              ; $1dc5: $3f
	ret                                              ; $1dc6: $c9


jr_000_1dc7:
	call checkUsingItems                               ; $1dc7: $cd $82 $29

Jump_000_1dca:
	call updateNPCs                                       ; $1dca: $cd $72 $42
	call loadNpcOamDataToWram                                       ; $1dcd: $cd $bd $41
	call copyPlayerDataOnto_wOam                                       ; $1dd0: $cd $aa $56
	call Call_000_3aa4                               ; $1dd3: $cd $a4 $3a
	call Call_000_2f50                               ; $1dd6: $cd $50 $2f
	call Call_000_35b2                               ; $1dd9: $cd $b2 $35
	call Call_000_2cbf                               ; $1ddc: $cd $bf $2c
	call func_48ec                                       ; $1ddf: $cd $ec $48
	call Call_000_3e33                               ; $1de2: $cd $33 $3e
	call loadBWeaponDataToOam                               ; $1de5: $cd $67 $2e
	call Call_000_3b11                               ; $1de8: $cd $11 $3b
	call checkRaftChanges_sendToOam                                       ; $1deb: $cd $a9 $55
	jp   mainLoop                               ; $1dee: $c3 $17 $1c


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
	jp   loadFirst800hVramTilesAndVramTileConversionTable                               ; $1e56: $c3 $a4 $17


;;
	ld   de, $9800
	call dPlusEquValIn_c6de                               ; $1e5c: $cd $a2 $1e
	ld   a, d                                        ; $1e5f: $7a
	xor  $04                                         ; $1e60: $ee $04
	ld   d, a                                        ; $1e62: $57
	jp   copyGameScreenTilesOntoDE                               ; $1e63: $c3 $41 $1e


loadInventoryScreen:
	ld   de, $9800
	call dEquDoffsetInScreen1
	ld   hl, lyt_inventoryScreen
	call copyLayoutFromBank3
	ld   hl, drawInDynamicPartOfInventoryScreen
	call jpHLinBank4
	ld   hl, $001c
	call loadTilesetAndVramTileConversionTable_idxedHL
	ret


loadMapScreen:
	ld   de, $9800
	call dEquDoffsetInScreen1
	ld   hl, lyt_mapScreen
	call copyLayoutFromBank3
	ld   hl, drawInDynamicPartOfMap
	call jpHLinBank4
	ret


;;
	ld   a, $46                                      ; $1e92: $3e $46
	ld   hl, $c015                                   ; $1e94: $21 $15 $c0
	ld   (hl), a                                     ; $1e97: $77
	ret                                              ; $1e98: $c9


dPlusEquScreen0displayOffset:
	push hl
	ld   hl, wScreen0displayOffset
	ld   a, d
	add  (hl)
	ld   d, a
	pop  hl
	ret


dPlusEquValIn_c6de:
	ld   hl, $c6de                                   ; $1ea2: $21 $de $c6
	jp   dPlusEquValInHL                               ; $1ea5: $c3 $ab $1e


dEquDoffsetInScreen1:
	ld   hl, wScreen1displayOffset

dPlusEquValInHL:
	ld   a, d
	add  (hl)
	ld   d, a
	ret


// deals with loading a game screen's 2x2 tile data?
TODOloadsRoomData:
// $c038/9 -> $c006/7 (where to load structure of bytes
// that contains, eg where to find the compressed room layout)
	ld   hl, wRoomStructAddress                                   ; $1eaf: $21 $38 $c0
	ld   a, (hl)                                     ; $1eb2: $7e
	ld   hl, $c006                                   ; $1eb3: $21 $06 $c0
	ld   (hl), a                                     ; $1eb6: $77
	ld   hl, wRoomStructAddress+1                                   ; $1eb7: $21 $39 $c0
	ld   a, (hl)                                     ; $1eba: $7e
	ld   hl, $c007                                   ; $1ebb: $21 $07 $c0
	ld   (hl), a                                     ; $1ebe: $77
	ld   hl, wCurrGroupDefaultBGP                                   ; $1ebf: $21 $24 $c7
	ld   a, (hl)                                     ; $1ec2: $7e
	ld   hl, wBGPwhenLampOff                                   ; $1ec3: $21 $f0 $c5
	ld   (hl), a                                     ; $1ec6: $77
	ld   hl, wBGPwhenLampOn                                   ; $1ec7: $21 $f4 $c5
	ld   (hl), a                                     ; $1eca: $77
	ld   hl, wCurrGroupDefaultBGP+1                                   ; $1ecb: $21 $25 $c7
	ld   a, (hl)                                     ; $1ece: $7e
	ld   hl, wBGPwhenLampOff+1                                   ; $1ecf: $21 $f1 $c5
	ld   (hl), a                                     ; $1ed2: $77
	ld   hl, wBGPwhenLampOn+1                                   ; $1ed3: $21 $f5 $c5
	ld   (hl), a                                     ; $1ed6: $77
	ld   hl, wCurrGroupDefaultOBP0                                   ; $1ed7: $21 $26 $c7
	ld   a, (hl)                                     ; $1eda: $7e
	ld   hl, wOBP0whenLampOff                                   ; $1edb: $21 $f2 $c5
	ld   (hl), a                                     ; $1ede: $77
	ld   hl, wOBP0whenLampOn                                   ; $1edf: $21 $f6 $c5
	ld   (hl), a                                     ; $1ee2: $77
	ld   hl, wCurrGroupDefaultOBP0+1                                   ; $1ee3: $21 $27 $c7
	ld   a, (hl)                                     ; $1ee6: $7e
	ld   hl, wOBP0whenLampOff+1                                   ; $1ee7: $21 $f3 $c5
	ld   (hl), a                                     ; $1eea: $77
	ld   hl, wOBP0whenLampOn+1                                   ; $1eeb: $21 $f7 $c5
	ld   (hl), a                                     ; $1eee: $77
	ld   hl, $c04a                                   ; $1eef: $21 $4a $c0
	ld   (hl), $08                                   ; $1ef2: $36 $08
	ld   a, $00                                      ; $1ef4: $3e $00
	ld   hl, $c0b0                                   ; $1ef6: $21 $b0 $c0
	ld   (hl), a                                     ; $1ef9: $77
	ld   hl, $c05d                                   ; $1efa: $21 $5d $c0
	ld   (hl), a                                     ; $1efd: $77
	ld   hl, $c08d                                   ; $1efe: $21 $8d $c0
	ld   (hl), a                                     ; $1f01: $77
	ld   hl, $c058                                   ; $1f02: $21 $58 $c0
	ld   (hl), a                                     ; $1f05: $77
	ld   hl, $c087                                   ; $1f06: $21 $87 $c0
	ld   (hl), a                                     ; $1f09: $77
	ld   hl, $c088                                   ; $1f0a: $21 $88 $c0
	ld   (hl), a                                     ; $1f0d: $77
	ld   hl, $c089                                   ; $1f0e: $21 $89 $c0
	ld   (hl), a                                     ; $1f11: $77
	ld   hl, $c08a                                   ; $1f12: $21 $8a $c0
	ld   (hl), a                                     ; $1f15: $77
	ld   hl, wPlayerAnimationIdx                                   ; $1f16: $21 $57 $c0
	ld   (hl), a                                     ; $1f19: $77
	ld   hl, $c08b                                   ; $1f1a: $21 $8b $c0
	ld   (hl), a                                     ; $1f1d: $77
	ld   hl, $c047                                   ; $1f1e: $21 $47 $c0
	ld   (hl), a                                     ; $1f21: $77
	ld   hl, $c0dc                                   ; $1f22: $21 $dc $c0
	ld   de, $001c                                   ; $1f25: $11 $1c $00
	call setAtoHL_deBytes                               ; $1f28: $cd $6d $27
	ld   hl, $c600                                   ; $1f2b: $21 $00 $c6
	ld   de, $0048                                   ; $1f2e: $11 $48 $00
	call setAtoHL_deBytes                               ; $1f31: $cd $6d $27
	ld   hl, $c580                                   ; $1f34: $21 $80 $c5
	ld   de, $0060                                   ; $1f37: $11 $60 $00
	call setAtoHL_deBytes                               ; $1f3a: $cd $6d $27
	ld   hl, $c496                                   ; $1f3d: $21 $96 $c4
	ld   de, $003c                                   ; $1f40: $11 $3c $00
	call setAtoHL_deBytes                               ; $1f43: $cd $6d $27
	ld   hl, $c57e                                   ; $1f46: $21 $7e $c5
	ld   (hl), a                                     ; $1f49: $77
	ld   hl, $c660                                   ; $1f4a: $21 $60 $c6
	ld   de, $0018                                   ; $1f4d: $11 $18 $00
	call setAtoHL_deBytes                               ; $1f50: $cd $6d $27
	call loadRoomStructData                               ; $1f53: $cd $50 $02
	call loadAllVramTilesAndConversionTableDataForTileset                               ; $1f56: $cd $4a $1e
	call loadAnimationParametersForTileset                                       ; $1f59: $cd $8f $61

//
	ld   hl, w2x2gameScreenTiles                                   ; $1f5c: $21 $b0 $c3
	ld   de, wGameScreenTiles                                   ; $1f5f: $11 $50 $c8
	ld   b, $0b                                      ; $1f62: $06 $0b
@nextRowOf2x2tiles:
	ld   c, $10                                      ; $1f64: $0e $10
	push hl                                          ; $1f66: $e5

// copies 2x2 tile data onto game screen tiles in wram
// this is top row of a 2x2 tile
-
	ldi  a, (hl)                                     ; $1f67: $2a
	call convert2x2tileValueToTopLeftVramTileValue                               ; $1f68: $cd $c4 $17
	and  $fc                                         ; $1f6b: $e6 $fc
	ld   (de), a                                     ; $1f6d: $12
	inc  de                                          ; $1f6e: $13
	add  $02                                         ; $1f6f: $c6 $02
	ld   (de), a                                     ; $1f71: $12
	inc  de                                          ; $1f72: $13
	dec  c                                           ; $1f73: $0d
	jr   nz, -                             ; $1f74: $20 $f1

	pop  hl                                          ; $1f76: $e1
	ld   c, $10                                      ; $1f77: $0e $10

// this is the bottom row of 2x2 tiles
-
	ldi  a, (hl)                                     ; $1f79: $2a
	call convert2x2tileValueToTopLeftVramTileValue                               ; $1f7a: $cd $c4 $17
	and  $fc                                         ; $1f7d: $e6 $fc
	inc  a                                           ; $1f7f: $3c
	ld   (de), a                                     ; $1f80: $12
	inc  de                                          ; $1f81: $13
	add  $02                                         ; $1f82: $c6 $02
	ld   (de), a                                     ; $1f84: $12
	inc  de                                          ; $1f85: $13
	dec  c                                           ; $1f86: $0d
	jr   nz, -                             ; $1f87: $20 $f0

	dec  b                                           ; $1f89: $05
	jr   nz, @nextRowOf2x2tiles                             ; $1f8a: $20 $d8

	ret                                              ; $1f8c: $c9


inventoryCursorXoffsets:
	.db $18 $28 $38 $48 $58 $68 $78 $88 $98

handleInventoryScreen:
	call turnOffLCDstartOfVBlank                               ; $1f96: $cd $0a $02
	call commonSoundFunc2                               ; $1f99: $cd $d6 $01
	call clear_c200_to_c2ff                                       ; $1f9c: $cd $9e $5b
	call copyA0hDataToOam                               ; $1f9f: $cd $99 $1a
	call loadInventoryScreen                               ; $1fa2: $cd $66 $1e
	ld   hl, wLCDCvalue                                   ; $1fa5: $21 $00 $d0
	ld   a, $8f                                      ; $1fa8: $3e $8f
	ld   (hl), a                                     ; $1faa: $77
	ld   hl, rSCY                                   ; $1fab: $21 $42 $ff
	ld   a, $00                                      ; $1fae: $3e $00
	ldi  (hl), a                                     ; $1fb0: $22
	ldi  (hl), a                                     ; $1fb1: $22
	call updateInventoryLampOam                               ; $1fb2: $cd $60 $23
	call setNormalBGP_OBP0vals                               ; $1fb5: $cd $30 $1e
	ld   a, $01                                      ; $1fb8: $3e $01
	call setLCDfromValue_c015equA                               ; $1fba: $cd $11 $02
	ld   a, $01                                      ; $1fbd: $3e $01
	ld   hl, wInventoryLastBItemHoveredOver                                   ; $1fbf: $21 $19 $c0
	ld   (hl), a                                     ; $1fc2: $77
	call Call_000_2712                               ; $1fc3: $cd $12 $27
	ld   a, $00                                      ; $1fc6: $3e $00
	ld   hl, $c0c6                                   ; $1fc8: $21 $c6 $c0
	ld   (hl), a                                     ; $1fcb: $77
	call Call_000_2279                               ; $1fcc: $cd $79 $22

_inventoryScreenMainLoop:
	ld   hl, wInventorySelectedYIdx                                   ; $1fcf: $21 $5f $c6
	ld   a, (hl)                                     ; $1fd2: $7e
	cp   $00                                         ; $1fd3: $fe $00
	jr   nz, @cursorNotOnBrow                             ; $1fd5: $20 $17

// cursor on b row
	ld   hl, wInventorySelectedXIdx                                   ; $1fd7: $21 $48 $c6
	ld   c, (hl)                                     ; $1fda: $4e
	ld   b, $00                                      ; $1fdb: $06 $00
	ld   hl, inventoryCursorXoffsets                                   ; $1fdd: $21 $8d $1f
	add  hl, bc                                      ; $1fe0: $09
	ld   a, (hl)                                     ; $1fe1: $7e
	ld   c, a                                        ; $1fe2: $4f
	ld   b, $00                                      ; $1fe3: $06 $00
	ld   de, $0020                                   ; $1fe5: $11 $20 $00
	call sendTowOamCursorXequC_YequE                               ; $1fe8: $cd $59 $10
	jp   Jump_000_2014                               ; $1feb: $c3 $14 $20

@cursorNotOnBrow:
	ld   hl, wInventorySelectedYIdx                                   ; $1fee: $21 $5f $c6
	ld   c, (hl)                                     ; $1ff1: $4e
	ld   b, $00                                      ; $1ff2: $06 $00
	ld   a, c                                        ; $1ff4: $79
	cp   $06                                         ; $1ff5: $fe $06
	jr   nz, +                             ; $1ff7: $20 $09

// at exit game button
	ld   bc, $0013                                   ; $1ff9: $01 $13 $00
	ld   de, $008f                                   ; $1ffc: $11 $8f $00
	jp   @setInvCursorOam                               ; $1fff: $c3 $11 $20

+
	ld   de, $0010                                   ; $2002: $11 $10 $00
	call ecEquEtimesC                               ; $2005: $cd $03 $08
	ld   a, c                                        ; $2008: $79
	add  $28                                         ; $2009: $c6 $28
	ld   e, a                                        ; $200b: $5f
	ld   d, $00                                      ; $200c: $16 $00
	ld   bc, $0010                                   ; $200e: $01 $10 $00

@setInvCursorOam:
	call sendTowOamCursorXequC_YequE                               ; $2011: $cd $59 $10

Jump_000_2014:
	ld   e, $78                                      ; $2014: $1e $78
	call Call_000_19f8                               ; $2016: $cd $f8 $19
	push af                                          ; $2019: $f5
	call Call_000_2279                               ; $201a: $cd $79 $22
	pop  af                                          ; $201d: $f1
	jr   z, Jump_000_2014                              ; $201e: $28 $f4

	cp   PADF_START                                         ; $2020: $fe $08
	jr   z, +                              ; $2022: $28 $04

	cp   PADF_SELECT                                         ; $2024: $fe $04
	jr   nz, @notExitingInventory                             ; $2026: $20 $03

+
// exit inventory menu
	jp   exitingInventoryMenu                               ; $2028: $c3 $20 $23

@notExitingInventory:
	cp   PADF_RIGHT                                         ; $202b: $fe $10
	jr   nz, jr_000_206a                             ; $202d: $20 $3b

	ld   hl, wInventorySelectedYIdx                                   ; $202f: $21 $5f $c6
	ld   a, (hl)                                     ; $2032: $7e
	cp   $00                                         ; $2033: $fe $00
	jr   nz, jr_000_2053                             ; $2035: $20 $1c

// pressing right through b items
	ld   a, $01                                      ; $2037: $3e $01
	ld   hl, wInventoryLastBItemHoveredOver                                   ; $2039: $21 $19 $c0
	ld   (hl), a                                     ; $203c: $77
	ld   hl, wInventorySelectedXIdx                                   ; $203d: $21 $48 $c6
	inc  (hl)                                        ; $2040: $34

Jump_000_2041:
	call Call_000_2712                               ; $2041: $cd $12 $27
	ld   a, $00                                      ; $2044: $3e $00
	ld   hl, $c0c6                                   ; $2046: $21 $c6 $c0
	ld   (hl), a                                     ; $2049: $77
	call Call_000_2279                               ; $204a: $cd $79 $22

Jump_000_204d:
	call safeCallCommonSoundFuncs_with20h                               ; $204d: $cd $ff $27
	jp   _inventoryScreenMainLoop                               ; $2050: $c3 $cf $1f


jr_000_2053:
	ld   hl, checkBitemsSelectable                                   ; $2053: $21 $a4 $11
	call jpHLinBank4                                       ; $2056: $cd $b5 $61
	ld   hl, wSpecialItemsGottenByte                                   ; $2059: $21 $a0 $c0
	ld   a, (hl)                                     ; $205c: $7e
	cp   $00                                         ; $205d: $fe $00
	jr   z, Jump_000_204d                              ; $205f: $28 $ec

	ld   a, $00                                      ; $2061: $3e $00
	ld   hl, wInventorySelectedYIdx                                   ; $2063: $21 $5f $c6
	ld   (hl), a                                     ; $2066: $77
	jp   Jump_000_2041                               ; $2067: $c3 $41 $20


jr_000_206a:
	cp   PADF_LEFT                                         ; $206a: $fe $20
	jr   nz, @notRightLeft                             ; $206c: $20 $15

// pressing left
	ld   hl, wInventorySelectedYIdx                                   ; $206e: $21 $5f $c6
	ld   a, (hl)                                     ; $2071: $7e
	cp   $00                                         ; $2072: $fe $00
	jr   nz, jr_000_2053                             ; $2074: $20 $dd

// in the b item region
	ld   a, $ff                                      ; $2076: $3e $ff
	ld   hl, wInventoryLastBItemHoveredOver                                   ; $2078: $21 $19 $c0
	ld   (hl), a                                     ; $207b: $77
	ld   hl, wInventorySelectedXIdx                                   ; $207c: $21 $48 $c6
	dec  (hl)                                        ; $207f: $35
	jp   Jump_000_2041                               ; $2080: $c3 $41 $20

@notRightLeft:
	cp   PADF_UP                                         ; $2083: $fe $40
	jr   nz, jr_000_20ab                             ; $2085: $20 $24

// pressing up
	ld   hl, wInventorySelectedYIdx                                   ; $2087: $21 $5f $c6
	dec  (hl)                                        ; $208a: $35
	jr   z, jr_000_209a                              ; $208b: $28 $0d

	bit  7, (hl)                                     ; $208d: $cb $7e
	jr   z, Jump_000_2041                              ; $208f: $28 $b0

jr_000_2091:
	ld   a, $06                                      ; $2091: $3e $06
	ld   hl, wInventorySelectedYIdx                                   ; $2093: $21 $5f $c6
	ld   (hl), a                                     ; $2096: $77
	jp   Jump_000_2041                               ; $2097: $c3 $41 $20


jr_000_209a:
	ld   hl, checkBitemsSelectable                                   ; $209a: $21 $a4 $11
	call jpHLinBank4                                       ; $209d: $cd $b5 $61
	ld   hl, wSpecialItemsGottenByte                                   ; $20a0: $21 $a0 $c0
	ld   a, (hl)                                     ; $20a3: $7e
	cp   $00                                         ; $20a4: $fe $00
	jr   z, jr_000_2091                              ; $20a6: $28 $e9

	jp   Jump_000_2041                               ; $20a8: $c3 $41 $20


jr_000_20ab:
	cp   PADF_DOWN                                         ; $20ab: $fe $80
	jr   nz, @checkPressingAorB                             ; $20ad: $20 $0e

// pressing down
	ld   hl, wInventorySelectedYIdx                                   ; $20af: $21 $5f $c6
	inc  (hl)                                        ; $20b2: $34
	ld   a, (hl)                                     ; $20b3: $7e
	cp   $07                                         ; $20b4: $fe $07
	jr   nz, Jump_000_2041                             ; $20b6: $20 $89

// loop around
	ld   (hl), $00                                   ; $20b8: $36 $00
	jp   Jump_000_2041                               ; $20ba: $c3 $41 $20


@checkPressingAorB:
	and  PADF_B|PADF_A
	jr   nz, @pressingAorB

	jp   Jump_000_2014                               ; $20c1: $c3 $14 $20

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
	call callCommonSoundFunc2startOfVBlank
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawNumBirds
	call jpHLinBank4
	call commonSoundFunc2
	call safeCallCommonSoundFuncs_with20h
	pop  bc
	dec  c
	jr   nz, @takeBirdForPraying

// half heart
	ld   a, $01
	call addAtoPlayerHealth
	call callsCommonSoundFuncs_284f
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawHearts
	call jpHLinBank4
	call commonSoundFunc2
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawSelectableBitems
	call jpHLinBank4
	call commonSoundFunc2

@afterHealingOrHealthAlreadyFull:
	call Call_000_2712                               ; $2124: $cd $12 $27
	call Call_000_2279                               ; $2127: $cd $79 $22
	jp   _inventoryScreenMainLoop                               ; $212a: $c3 $cf $1f


@selectedBnotPraying:
	cp   $00
	jr   nz, @notSelectedPrayingBombs

// vial bombs
	ld   a, EQUIPB_BOMBS
	ld   hl, wEquippedBItem
	ld   (hl), a

@updateEquippedNewBItem:
	call safeCallCommonSoundFuncs_with20h
	ld   a, $00                                      ; $213a: $3e $00
	ld   hl, $c6cb                                   ; $213c: $21 $cb $c6
	ld   (hl), a                                     ; $213f: $77
	call waitUntilStartOfVBlankPeriod                               ; $2140: $cd $e8 $01
	ld   hl, drawBitem                                   ; $2143: $21 $83 $13
	call jpHLinBank4                                       ; $2146: $cd $b5 $61
	call commonSoundFunc2                               ; $2149: $cd $d6 $01
	jp   _inventoryScreenMainLoop                               ; $214c: $c3 $cf $1f

@notSelectedPrayingBombs:
	cp   $03
	jr   nz, @notLampOrBombs

// selected lamp
	ld   hl, wIsLampOn
	ld   a, (hl)
	xor  $ff
	ld   (hl), a
	call updateInventoryLampOam
	call safeCallCommonSoundFuncs_with20h
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
	call safeCallCommonSoundFuncs_with20h
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
	call safeCallCommonSoundFuncs_with20h
	ld   hl, wPlayerHealth
	inc  (hl)
	call waitUntilStartOfVBlankPeriod
	ld   hl, drawHearts
	call jpHLinBank4
	call commonSoundFunc2
	call callCommonSoundFunc2startOfVBlank
	call callCommonSoundFunc2startOfVBlank
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
	call commonSoundFunc2                               ; $2214: $cd $d6 $01
	jp   Jump_000_2041                               ; $2217: $c3 $41 $20

@transitionToMapScreen:
	call turnOffLCDstartOfVBlank
	call commonSoundFunc2
	call clear_c200_to_c2ff
	call copyA0hDataToOam
	call loadMapScreen
	ld   a, $01
	call setLCDfromValue_c015equA
	ld   e, $00                                      ; $222e: $1e $00
	call Call_000_19f8                               ; $2230: $cd $f8 $19
	jp   handleInventoryScreen                               ; $2233: $c3 $96 $1f

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

	ld   hl, wInventorySelectedYIdx
	ld   a, (hl)
	ld   hl, wFruitEquipped
	ld   (hl), a
	ld   hl, wFruitEquipped
	dec  (hl)                                        ; $225a: $35
	call Call_000_241a                               ; $225b: $cd $1a $24
	call waitUntilStartOfVBlankPeriod                               ; $225e: $cd $e8 $01
	ld   hl, drawAitem                                   ; $2261: $21 $a8 $13
	call jpHLinBank4                                       ; $2264: $cd $b5 $61
	call commonSoundFunc2                               ; $2267: $cd $d6 $01
	jp   Jump_000_204d                               ; $226a: $c3 $4d $20

@0ofSelectedFruit:
	ld   de, text_findThisOneFirst

@selectedSomethingOnInvScreenEnd:
	call drawInventoryItemDescription
	call safeCallCommonSoundFuncs_with23h
	jp   _inventoryScreenMainLoop


Call_000_2279:
	ld   hl, $c0c6                                   ; $2279: $21 $c6 $c0
	ld   a, (hl)                                     ; $227c: $7e
	cp   $02                                         ; $227d: $fe $02
	jr   nz, jr_000_2287                             ; $227f: $20 $06

	ld   de, text_pushAtoPickThis                                   ; $2281: $11 $6a $24
	jp   _drawChangingItemDescription                               ; $2284: $c3 $af $22

jr_000_2287:
	ld   hl, wInventorySelectedYIdx                                   ; $2287: $21 $5f $c6
	ld   a, (hl)                                     ; $228a: $7e
	cp   $00                                         ; $228b: $fe $00
	jr   z, @onBRow                              ; $228d: $28 $04

	add  $08                                         ; $228f: $c6 $08
	jr   jr_000_2297                                 ; $2291: $18 $04

@onBRow:
	ld   hl, wInventorySelectedXIdx                                   ; $2293: $21 $48 $c6
	ld   a, (hl)                                     ; $2296: $7e

jr_000_2297:
	sla  a                                           ; $2297: $cb $27
	sla  a                                           ; $2299: $cb $27
	ld   c, a                                        ; $229b: $4f
	ld   b, $00                                      ; $229c: $06 $00
	ld   hl, $c0c6                                   ; $229e: $21 $c6 $c0
	ld   a, (hl)                                     ; $22a1: $7e
	and  $01                                         ; $22a2: $e6 $01
	jr   z, +                              ; $22a4: $28 $02

	inc  bc                                          ; $22a6: $03
	inc  bc                                          ; $22a7: $03

+
	ld   hl, textDataList                                   ; $22a8: $21 $e7 $24
	add  hl, bc                                      ; $22ab: $09
	ld   e, (hl)                                     ; $22ac: $5e
	inc  hl                                          ; $22ad: $23
	ld   d, (hl)                                     ; $22ae: $56

_drawChangingItemDescription:
	call drawInventoryItemDescription                               ; $22af: $cd $f0 $26
	ld   hl, $c0c6                                   ; $22b2: $21 $c6 $c0
	inc  (hl)                                        ; $22b5: $34
	ld   hl, $c0c6                                   ; $22b6: $21 $c6 $c0
	ld   a, (hl)                                     ; $22b9: $7e
	cp   $03                                         ; $22ba: $fe $03
	jr   c, @done                              ; $22bc: $38 $06

	ld   a, $00                                      ; $22be: $3e $00
	ld   hl, $c0c6                                   ; $22c0: $21 $c6 $c0
	ld   (hl), a                                     ; $22c3: $77

@done:
	ret                                              ; $22c4: $c9


exitGamePromptCursorX:
	.db $6c $8f

exitGamePrompt:
	call safeCallCommonSoundFuncs_with20h                               ; $22c7: $cd $ff $27
	ld   de, text_endGameChoice                                   ; $22ca: $11 $7e $24
	call drawInventoryItemDescription                               ; $22cd: $cd $f0 $26
	ld   a, $01                                      ; $22d0: $3e $01
	ld   hl, wMenuCursorIdx                                   ; $22d2: $21 $11 $c7
	ld   (hl), a                                     ; $22d5: $77

@exitGameLoop:
	ld   hl, wMenuCursorIdx                                   ; $22d6: $21 $11 $c7
	ld   c, (hl)                                     ; $22d9: $4e
	ld   b, $00                                      ; $22da: $06 $00
	ld   hl, exitGamePromptCursorX                                   ; $22dc: $21 $c5 $22
	add  hl, bc                                      ; $22df: $09
	ld   a, (hl)                                     ; $22e0: $7e
	ld   c, a                                        ; $22e1: $4f
	ld   b, $00                                      ; $22e2: $06 $00
	ld   de, $009d                                   ; $22e4: $11 $9d $00
	call sendTowOamCursorXequC_YequE                               ; $22e7: $cd $59 $10
	ld   e, $00                                      ; $22ea: $1e $00
	call Call_000_19f8                               ; $22ec: $cd $f8 $19
	ld   c, a                                        ; $22ef: $4f
	ld   b, $00                                      ; $22f0: $06 $00
	and  PADF_LEFT|PADF_RIGHT                                         ; $22f2: $e6 $30
	jr   z, @notLeftRight                              ; $22f4: $28 $10

// left or right, swap idx
	ld   hl, wMenuCursorIdx                                   ; $22f6: $21 $11 $c7
	ld   a, (hl)                                     ; $22f9: $7e
	xor  $01                                         ; $22fa: $ee $01
	ld   hl, wMenuCursorIdx                                   ; $22fc: $21 $11 $c7
	ld   (hl), a                                     ; $22ff: $77
	call safeCallCommonSoundFuncs_with20h                               ; $2300: $cd $ff $27
	jp   @exitGameLoop                               ; $2303: $c3 $d6 $22

@notLeftRight:
	ld   a, c                                        ; $2306: $79
	and  PADF_B|PADF_A                                         ; $2307: $e6 $03
	jr   nz, @pressedAorB                             ; $2309: $20 $09

	ld   de, text_space                                   ; $230b: $11 $91 $24
	call drawInventoryItemDescription                               ; $230e: $cd $f0 $26
	jp   _inventoryScreenMainLoop                               ; $2311: $c3 $cf $1f

@pressedAorB:
	ld   hl, wMenuCursorIdx                                   ; $2314: $21 $11 $c7
	ld   a, (hl)                                     ; $2317: $7e
	cp   $00                                         ; $2318: $fe $00
	jr   nz, exitingInventoryMenu                             ; $231a: $20 $04

// yes - exit game
	or   $ff                                         ; $231c: $f6 $ff
	jr   func_232a                                 ; $231e: $18 $0a

exitingInventoryMenu:
	ld   de, text_space                                   ; $2320: $11 $91 $24
	call drawInventoryItemDescription                               ; $2323: $cd $f0 $26
	call clear_c200_to_c2ff                                       ; $2326: $cd $9e $5b
	xor  a                                           ; $2329: $af

func_232a:
	push af
	call turnOffLCDstartOfVBlank                               ; $232b: $cd $0a $02
	call applyPalettesBasedOnLamp                               ; $232e: $cd $06 $1e
	call copyPlayerDataOnto_wOam                                       ; $2331: $cd $aa $56
	call checkRaftChanges_sendToOam                                       ; $2334: $cd $a9 $55
	call loadNpcOamDataToWram                                       ; $2337: $cd $bd $41
	call loadBWeaponDataToOam                               ; $233a: $cd $67 $2e
	call Call_000_3b11                               ; $233d: $cd $11 $3b
	call copyA0hDataToOam                               ; $2340: $cd $99 $1a
	call loadAllVramTilesAndConversionTableDataForTileset                               ; $2343: $cd $4a $1e
	ld   hl, wLCDCvalue                                   ; $2346: $21 $00 $d0
	ld   a, $87                                      ; $2349: $3e $87
	ld   (hl), a                                     ; $234b: $77
	ld   hl, wSCXvalue                                   ; $234c: $21 $10 $cb
	ld   e, (hl)                                     ; $234f: $5e
	ld   hl, wSCYvalue                                   ; $2350: $21 $11 $cb
	ld   a, (hl)                                     ; $2353: $7e
	ld   hl, rSCY                                   ; $2354: $21 $42 $ff
	ldi  (hl), a                                     ; $2357: $22
	ld   (hl), e                                     ; $2358: $73
	ld   a, $06                                      ; $2359: $3e $06
	call setLCDfromValue_c015equA                               ; $235b: $cd $11 $02
	pop  af                                          ; $235e: $f1
	ret                                              ; $235f: $c9


updateInventoryLampOam:
	call waitUntilStartOfVBlankPeriod
// clear lamp by default
	ld   hl, $c21c
	ld   (hl), $00
	ld   hl, $c220
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
	ld   hl, $c21c
	ld   (hl), $18
	ld   hl, $c220
	ld   (hl), $18

// copy x to oam
	ld   hl, $c21d
	ld   (hl), $40
	ld   hl, $c221
	ld   (hl), $48

// copy tile idxes to oam
	ld   hl, $c21e
	ld   (hl), $8c
	ld   hl, $c222
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
	ld   hl, $c21f
	ld   (hl), b
	ld   hl, $c223
	ld   (hl), b

@done:
	ret


retZIfCanRaftOnScreen:
	ld   bc, $0000

-
	ld   hl, w2x2tileTypes
	add  hl, bc
	ld   a, (hl)
	cp   $2d
	jr   z, @done

	inc  bc
	ld   a, c
	cp   $b0
	jr   nz, -

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
data_2406:
	.db $03 $05 $08 $09 $10

data_240b:
	.db $02 $02 $01 $03 $04

data_2410:
	.db $f9 $fd $fb $ff $f7
	
data_2415:
	.db $00 $c0 $10 $a0 $80

Call_000_241a:
	ld   hl, wFruitEquipped
	ld   e, (hl)                                     ; $241d: $5e
	ld   hl, getFruitAmountFromWram                                   ; $241e: $21 $fe $13
	call jpHLinBank4                                       ; $2421: $cd $b5 $61

// store here the fruit amount of current fruit
	ld   hl, $c046                                   ; $2424: $21 $46 $c0
	ld   (hl), e                                     ; $2427: $73

// c048 from data_240b
	ld   hl, wFruitEquipped                                   ; $2428: $21 $0c $c7
	ld   c, (hl)                                     ; $242b: $4e
	ld   b, $00                                      ; $242c: $06 $00
	ld   hl, data_240b                                   ; $242e: $21 $0b $24
	add  hl, bc                                      ; $2431: $09
	ld   a, (hl)                                     ; $2432: $7e
	ld   hl, $c048                                   ; $2433: $21 $48 $c0
	ld   (hl), a                                     ; $2436: $77

// ec equals $10 * data_2406
	ld   hl, data_2406                                   ; $2437: $21 $06 $24
	add  hl, bc                                      ; $243a: $09
	ld   e, (hl)                                     ; $243b: $5e
	ld   d, $00                                      ; $243c: $16 $00
	ld   bc, $0010                                   ; $243e: $01 $10 $00
	call ecEquEtimesC                               ; $2441: $cd $03 $08

// e into b, bc / (c048) into c045
	ld   a, e                                        ; $2444: $7b
	ld   b, a                                        ; $2445: $47
	ld   hl, $c048                                   ; $2446: $21 $48 $c0
	ld   a, (hl)                                     ; $2449: $7e
	call bcDivA_divInC_modInAB                               ; $244a: $cd $44 $08
	ld   hl, $c045                                   ; $244d: $21 $45 $c0
	ld   (hl), c                                     ; $2450: $71

// c70f from data_2410
	ld   hl, wFruitEquipped                                   ; $2451: $21 $0c $c7
	ld   c, (hl)                                     ; $2454: $4e
	ld   b, $00                                      ; $2455: $06 $00
	ld   hl, data_2410                                   ; $2457: $21 $10 $24
	add  hl, bc                                      ; $245a: $09
	ld   a, (hl)                                     ; $245b: $7e
	ld   hl, $c70f                                   ; $245c: $21 $0f $c7
	ld   (hl), a                                     ; $245f: $77

// c712 from data_2415
	ld   hl, data_2415                                   ; $2460: $21 $15 $24
	add  hl, bc                                      ; $2463: $09
	ld   a, (hl)                                     ; $2464: $7e
	ld   hl, $c712                                   ; $2465: $21 $12 $c7
	ld   (hl), a                                     ; $2468: $77
	ret                                              ; $2469: $c9


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
	call dEquDoffsetInScreen1
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


Call_000_2712:
	ld   hl, checkBitemsSelectable                                   ; $2712: $21 $a4 $11
	call jpHLinBank4                                       ; $2715: $cd $b5 $61
	ld   hl, wSpecialItemsGottenByte                                   ; $2718: $21 $a0 $c0
	ld   a, (hl)                                     ; $271b: $7e
	cp   $00                                         ; $271c: $fe $00
	jr   nz, @bigLoop                             ; $271e: $20 $0f

// no special items gotten
	ld   hl, wInventorySelectedYIdx                                   ; $2720: $21 $5f $c6
	ld   a, (hl)                                     ; $2723: $7e
	cp   $00                                         ; $2724: $fe $00
	jr   nz, @done                             ; $2726: $20 $44

// y = 0, default to going to map
	ld   hl, wInventorySelectedXIdx                                   ; $2728: $21 $48 $c6
	ld   (hl), $08                                   ; $272b: $36 $08
	jr   @done                                 ; $272d: $18 $3d

@bigLoop:
	ld   hl, wInventorySelectedXIdx                                   ; $272f: $21 $48 $c6
	ld   c, (hl)                                     ; $2732: $4e
	ld   b, $00                                      ; $2733: $06 $00
	bit  7, c                                        ; $2735: $cb $79
	jr   nz, ++                             ; $2737: $20 $2b

	ld   a, c                                        ; $2739: $79
	cp   $09                                         ; $273a: $fe $09
	jr   z, +                              ; $273c: $28 $1e

	cp   $08                                         ; $273e: $fe $08
	jr   z, @done                              ; $2740: $28 $2a

	ld   hl, bitTable                                   ; $2742: $21 $41 $07
	add  hl, bc                                      ; $2745: $09
	ld   a, (hl)                                     ; $2746: $7e
	ld   hl, wSpecialItemsGottenByte                                   ; $2747: $21 $a0 $c0
	and  (hl)                                        ; $274a: $a6
	jr   nz, @done                             ; $274b: $20 $1f

	ld   hl, wInventorySelectedXIdx                                   ; $274d: $21 $48 $c6
	ld   a, (hl)                                     ; $2750: $7e
	ld   hl, wInventoryLastBItemHoveredOver                                   ; $2751: $21 $19 $c0
	add  (hl)                                        ; $2754: $86
	ld   hl, wInventorySelectedXIdx                                   ; $2755: $21 $48 $c6
	ld   (hl), a                                     ; $2758: $77
	jp   @bigLoop                               ; $2759: $c3 $2f $27

+
	ld   hl, wInventorySelectedXIdx                                   ; $275c: $21 $48 $c6
	ld   (hl), $00                                   ; $275f: $36 $00
	jp   @bigLoop                               ; $2761: $c3 $2f $27

++
	ld   hl, wInventorySelectedXIdx                                   ; $2764: $21 $48 $c6
	ld   (hl), $08                                   ; $2767: $36 $08
	jp   @bigLoop                               ; $2769: $c3 $2f $27

@done:
	ret                                              ; $276c: $c9


setAtoHL_deBytes:
-
	dec  de
	bit  7, d
	jr   nz, _ret_2775

	ldi  (hl), a
	jr   -

_ret_2775:
	ret


copyMemoryBC:
-
	dec  bc
	bit  7, b
	jr   nz, _ret_2775

	ldi  a, (hl)
	ld   (de), a
	inc  de
	jr   -


copyMemoryCinVBlank_callCommonSoundFunc2:
	push hl                                          ; $2780: $e5
	call waitUntilNextVBlankPeriod                               ; $2781: $cd $e5 $01
	pop  hl                                          ; $2784: $e1

-
	ldi  a, (hl)                                     ; $2785: $2a
	ld   (de), a                                     ; $2786: $12
	inc  de                                          ; $2787: $13
	dec  c                                           ; $2788: $0d
	jr   nz, -                             ; $2789: $20 $fa

	call commonSoundFunc2                               ; $278b: $cd $d6 $01
	ret                                              ; $278e: $c9


callsCommonSoundFuncs_278f:
	call callCommonSoundFunc1_3times                               ; $278f: $cd $d7 $14
	call onlyProcessInstructionsAfterIfMusicOn                               ; $2792: $cd $a4 $27
	ld   a, $00                                      ; $2795: $3e $00
	ld   hl, $c009                                   ; $2797: $21 $09 $c0
	ld   (hl), a                                     ; $279a: $77
	ld   a, $00                                      ; $279b: $3e $00
	ld   hl, $c72a                                   ; $279d: $21 $2a $c7
	ld   (hl), a                                     ; $27a0: $77
	jp   callCommonSoundFunc0_3times                               ; $27a1: $c3 $bf $14


onlyProcessInstructionsAfterIfMusicOn:
	ld   hl, wIsMusicOff                                   ; $27a4: $21 $dd $c4
	ld   a, (hl)                                     ; $27a7: $7e
	cp   $00                                         ; $27a8: $fe $00
	jr   z, @done                              ; $27aa: $28 $01

	pop  hl                                          ; $27ac: $e1

@done:
	ret                                              ; $27ad: $c9


callsCommonSoundFuncs_27ae:
	call callCommonSoundFunc1_3times
	call onlyProcessInstructionsAfterIfMusicOn                               ; $27b1: $cd $a4 $27
	ld   a, $05                                      ; $27b4: $3e $05
	ld   hl, $c009                                   ; $27b6: $21 $09 $c0
	ld   (hl), a                                     ; $27b9: $77
	ld   a, $00                                      ; $27ba: $3e $00
	ld   hl, $c72a                                   ; $27bc: $21 $2a $c7
	ld   (hl), a                                     ; $27bf: $77
	jp   callCommonSoundFunc0_3times                               ; $27c0: $c3 $bf $14


callsCommonSoundFuncs_27c3:
	call callCommonSoundFunc1_3times                               ; $27c3: $cd $d7 $14
	call onlyProcessInstructionsAfterIfMusicOn                               ; $27c6: $cd $a4 $27
	ld   a, $01                                      ; $27c9: $3e $01
	ld   hl, $c009                                   ; $27cb: $21 $09 $c0
	ld   (hl), a                                     ; $27ce: $77
	ld   a, $00                                      ; $27cf: $3e $00
	ld   hl, $c72a                                   ; $27d1: $21 $2a $c7
	ld   (hl), a                                     ; $27d4: $77
	jp   callCommonSoundFunc0_3times                               ; $27d5: $c3 $bf $14


callsCommonSoundFuncs_27d8:
	call callCommonSoundFunc1_3times                               ; $27d8: $cd $d7 $14
	ld   a, $02                                      ; $27db: $3e $02
	ld   hl, $c009                                   ; $27dd: $21 $09 $c0
	ld   (hl), a                                     ; $27e0: $77
	ld   a, $ff                                      ; $27e1: $3e $ff
	ld   hl, $c72a                                   ; $27e3: $21 $2a $c7
	ld   (hl), a                                     ; $27e6: $77
	jp   callCommonSoundFunc0_3times                               ; $27e7: $c3 $bf $14


callsCommonSoundFuncs_27ea:
	call callCommonSoundFunc1_3times                               ; $27ea: $cd $d7 $14
	call onlyProcessInstructionsAfterIfMusicOn                               ; $27ed: $cd $a4 $27
	ld   a, $04                                      ; $27f0: $3e $04
	ld   hl, $c009                                   ; $27f2: $21 $09 $c0
	ld   (hl), a                                     ; $27f5: $77
	ld   a, $00                                      ; $27f6: $3e $00
	ld   hl, $c72a                                   ; $27f8: $21 $2a $c7
	ld   (hl), a                                     ; $27fb: $77
	jp   callCommonSoundFunc0_3times                               ; $27fc: $c3 $bf $14


safeCallCommonSoundFuncs_with20h:
	push af
	ld   a, $20                                      ; $2800: $3e $20
	jp   _safeCallCommonSoundFuncs_286a                               ; $2802: $c3 $6a $28


safeCallCommonSoundFuncs_with12h:
	push af                                          ; $2805: $f5
	ld   a, $12                                      ; $2806: $3e $12
	jp   _safeCallCommonSoundFuncs_286a                               ; $2808: $c3 $6a $28


safeCallCommonSoundFuncs_with22h:
	push af                                          ; $280b: $f5
	ld   a, $22                                      ; $280c: $3e $22
	jp   _safeCallCommonSoundFuncs_286a                               ; $280e: $c3 $6a $28


callsCommonSoundFuncs_2811:
	push af                                          ; $2811: $f5
	ld   a, $0f                                      ; $2812: $3e $0f
	push af                                          ; $2814: $f5
	ld   a, $22                                      ; $2815: $3e $22

callsCommonSoundFuncs_2817:
	ld   hl, $c009                                   ; $2817: $21 $09 $c0
	ld   (hl), a                                     ; $281a: $77
	ld   hl, wIsMusicOff                                   ; $281b: $21 $dd $c4
	ld   a, (hl)                                     ; $281e: $7e
	cp   $00                                         ; $281f: $fe $00
	jr   z, +                              ; $2821: $28 $06

// music off
	pop  af                                          ; $2823: $f1
	ld   hl, $c009                                   ; $2824: $21 $09 $c0
	ld   (hl), a                                     ; $2827: $77
	push af                                          ; $2828: $f5

+
	pop  af                                          ; $2829: $f1
	ld   hl, $c009                                   ; $282a: $21 $09 $c0
	ld   a, (hl)                                     ; $282d: $7e
	jp   _safeCallCommonSoundFuncs_286a                               ; $282e: $c3 $6a $28


safeCallCommonSoundFuncs_with23h:
	push af                                          ; $2831: $f5
	ld   a, $23                                      ; $2832: $3e $23
	jp   _safeCallCommonSoundFuncs_286a                               ; $2834: $c3 $6a $28


safeCallCommonSoundFuncs_with23h2:
	push af                                          ; $2837: $f5
	ld   a, $23                                      ; $2838: $3e $23
	jp   _safeCallCommonSoundFuncs_286a                               ; $283a: $c3 $6a $28


callsCommonSoundFuncs_283d:
	push af                                          ; $283d: $f5
	ld   a, $1b                                      ; $283e: $3e $1b
	push af                                          ; $2840: $f5
	ld   a, $24                                      ; $2841: $3e $24
	jp   callsCommonSoundFuncs_2817                               ; $2843: $c3 $17 $28


callsCommonSoundFuncs_2846:
	push af
	ld   a, $0c                                      ; $2847: $3e $0c
	push af                                          ; $2849: $f5
	ld   a, $25                                      ; $284a: $3e $25
	jp   callsCommonSoundFuncs_2817                               ; $284c: $c3 $17 $28


callsCommonSoundFuncs_284f:
	push af
	ld   a, $0c                                      ; $2850: $3e $0c
	push af                                          ; $2852: $f5
	ld   a, $26                                      ; $2853: $3e $26
	jp   callsCommonSoundFuncs_2817                               ; $2855: $c3 $17 $28


safeCallCommonSoundFuncs_with27h:
	push af                                          ; $2858: $f5
	ld   a, $27                                      ; $2859: $3e $27
	jp   _safeCallCommonSoundFuncs_286a                               ; $285b: $c3 $6a $28


callsCommonSoundFuncs_285e:
	push af                                          ; $285e: $f5
	ld   a, $09                                      ; $285f: $3e $09
	push af                                          ; $2861: $f5
	ld   a, $28                                      ; $2862: $3e $28
	jp   callsCommonSoundFuncs_2817                               ; $2864: $c3 $17 $28


safeCallCommonSoundFuncs_with29h:
	push af                                          ; $2867: $f5
	ld   a, $29                                      ; $2868: $3e $29

_safeCallCommonSoundFuncs_286a:
	push bc                                          ; $286a: $c5
	push de                                          ; $286b: $d5
	push hl                                          ; $286c: $e5
	call callCommonSoundFuncs_1507                               ; $286d: $cd $07 $15
	pop  hl                                          ; $2870: $e1
	pop  de                                          ; $2871: $d1
	pop  bc                                          ; $2872: $c1
	pop  af                                          ; $2873: $f1
	ret                                              ; $2874: $c9


playerTakeDamage:
	ld   hl, $c08b
	ld   e, (hl)                                     ; $2878: $5e
	ld   d, $00                                      ; $2879: $16 $00
	ld   a, e                                        ; $287b: $7b
	cp   $00                                         ; $287c: $fe $00
	jp   nz, @done                           ; $287e: $c2 $16 $29

	ld   hl, wBaseDamageTaken                                   ; $2881: $21 $23 $c0
	ld   a, (hl)                                     ; $2884: $7e
	cp   $ff                                         ; $2885: $fe $ff
	jr   z, @afterPlayerDead                              ; $2887: $28 $62

	cp   $80                                         ; $2889: $fe $80
	jr   nc, +                             ; $288b: $30 $09

// bit 7 set, and c025 != 0 -> dont apply damage
	ld   hl, $c025                                   ; $288d: $21 $25 $c0
	ld   a, (hl)                                     ; $2890: $7e
	cp   $00                                         ; $2891: $fe $00
	jp   nz, @done                           ; $2893: $c2 $16 $29

+
	ld   hl, wBaseDamageTaken                                   ; $2896: $21 $23 $c0
	ld   a, (hl)                                     ; $2899: $7e
	and  $7f                                         ; $289a: $e6 $7f
	ld   hl, wModifiedDamageTaken                                   ; $289c: $21 $a0 $c0
	ld   (hl), a                                     ; $289f: $77
	ld   hl, wArmorOfGodGotten                                   ; $28a0: $21 $52 $c6
	ld   a, (hl)                                     ; $28a3: $7e
	and  AOG_SHIELD|AOG_ARMOUR                                         ; $28a4: $e6 $0a
	jr   z, @takeDamage                              ; $28a6: $28 $0d

// shield or armor gotten
	cp   AOG_SHIELD|AOG_ARMOUR                                         ; $28a8: $fe $0a
	jr   z, @bothShieldAndArmor                              ; $28aa: $28 $06

// 1 of shield or armor gotten
	call applyOneHalfDamage                               ; $28ac: $cd $17 $29
	jp   @takeDamage                               ; $28af: $c3 $b5 $28

@bothShieldAndArmor:
	call applyOneThirdDamage                               ; $28b2: $cd $47 $29

@takeDamage:
// c0a0 is damage player took
	ld   hl, wPlayerHealth                                   ; $28b5: $21 $72 $c0
	ld   a, (hl)                                     ; $28b8: $7e
	ld   hl, wModifiedDamageTaken                                   ; $28b9: $21 $a0 $c0
	sub  (hl)                                        ; $28bc: $96
	ld   hl, wPlayerHealth                                   ; $28bd: $21 $72 $c0
	ld   (hl), a                                     ; $28c0: $77

	jr   z, @playerDead                              ; $28c1: $28 $02

	jr   nc, @playerAlive                             ; $28c3: $30 $05

@playerDead:
	ld   (hl), $00                                   ; $28c5: $36 $00
	jp   @afterPlayerDead                               ; $28c7: $c3 $eb $28

@playerAlive:
	ld   (hl), a                                     ; $28ca: $77
	ld   a, $4b                                      ; $28cb: $3e $4b
	ld   hl, $c025                                   ; $28cd: $21 $25 $c0
	ld   (hl), a                                     ; $28d0: $77
	ld   e, $00                                      ; $28d1: $1e $00
	ld   hl, $c024                                   ; $28d3: $21 $24 $c0
	ld   a, (hl)                                     ; $28d6: $7e
	ld   hl, $c026                                   ; $28d7: $21 $26 $c0
	ld   (hl), a                                     ; $28da: $77
	cp   $ff                                         ; $28db: $fe $ff
	jr   z, +                              ; $28dd: $28 $05

	call safeCallCommonSoundFuncs_with22h                               ; $28df: $cd $0b $28
	ld   e, $08                                      ; $28e2: $1e $08

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

// pointer to $49
	ld   hl, $c08b                                   ; $28f7: $21 $8b $c0
	ld   (hl), e                                     ; $28fa: $73

//
	ld   a, $46                                      ; $28fb: $3e $46
	ld   hl, $c056                                   ; $28fd: $21 $56 $c0
	ld   (hl), a                                     ; $2900: $77

//
	ld   a, $00                                      ; $2901: $3e $00
	ld   hl, wPlayerAnimationIdx                                   ; $2903: $21 $57 $c0
	ld   (hl), a                                     ; $2906: $77

//
	ld   a, $00                                      ; $2907: $3e $00
	ld   hl, wPlayerOamAttr                                   ; $2909: $21 $55 $c0
	ld   (hl), a                                     ; $290c: $77

//
	ld   a, $ff                                      ; $290d: $3e $ff
	ld   hl, $c025                                   ; $290f: $21 $25 $c0
	ld   (hl), a                                     ; $2912: $77
	call callsCommonSoundFuncs_27d8                               ; $2913: $cd $d8 $27

@done:
	ret                                              ; $2916: $c9


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
	ld   hl, $c056                                   ; $297d: $21 $56 $c0
	ld   (hl), a                                     ; $2980: $77

@done:
	ret                                              ; $2981: $c9


checkUsingItems:
	ld   hl, $c05d                                   ; $2982: $21 $5d $c0
	ld   a, (hl)                                     ; $2985: $7e
	cp   $00                                         ; $2986: $fe $00
	jr   nz, @ret                             ; $2988: $20 $4f

	ld   hl, wNewKeysPressed                                   ; $298a: $21 $18 $c0
	ld   a, (hl)                                     ; $298d: $7e
	and  PADF_A                                         ; $298e: $e6 $01
	jr   z, @notUsingFruit                              ; $2990: $28 $16

	ld   hl, wKeysPressed                                   ; $2992: $21 $16 $c0
	ld   a, (hl)                                     ; $2995: $7e
	and  PADF_A                                         ; $2996: $e6 $01
	jr   z, @notUsingFruit                              ; $2998: $28 $0e

// using A item (fruit)
	ld   hl, $c047                                   ; $299a: $21 $47 $c0
	ld   a, (hl)                                     ; $299d: $7e
	ld   hl, $c046                                   ; $299e: $21 $46 $c0
	cp   (hl)                                        ; $29a1: $be
	jr   nc, @notUsingFruit                             ; $29a2: $30 $04

	call processUsingFruit                               ; $29a4: $cd $4c $2b
	ret                                              ; $29a7: $c9

@notUsingFruit:
	ld   hl, wNewKeysPressed                                   ; $29a8: $21 $18 $c0
	ld   a, (hl)                                     ; $29ab: $7e
	and  PADF_B                                         ; $29ac: $e6 $02
	jr   z, @ret                              ; $29ae: $28 $29

	ld   hl, wKeysPressed                                   ; $29b0: $21 $16 $c0
	ld   a, (hl)                                     ; $29b3: $7e
	and  PADF_B                                         ; $29b4: $e6 $02
	jr   z, @ret                              ; $29b6: $28 $21

	ld   hl, wEquippedBItem                                   ; $29b8: $21 $49 $c0
	ld   a, (hl)                                     ; $29bb: $7e
	cp   EQUIPB_BOMBS                                         ; $29bc: $fe $00
	jr   nz, @usingNonBombBitem                             ; $29be: $20 $1a

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

	ld   hl, $c025                                   ; $2a06: $21 $25 $c0
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
	ld   hl, $c025                                   ; $2a1b: $21 $25 $c0
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
	ld   hl, $c025                                   ; $2a30: $21 $25 $c0
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
	ld   hl, $c025                                   ; $2a45: $21 $25 $c0
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
	ld   hl, $c714                                   ; $2a5a: $21 $14 $c7
	ld   a, (hl)                                     ; $2a5d: $7e
	ld   hl, wIsUsingRaft                                   ; $2a5e: $21 $4f $c0
	or   (hl)                                        ; $2a61: $b6
	ld   hl, wMainLoopCounter                                   ; $2a62: $21 $14 $c0
	and  (hl)                                        ; $2a65: $a6
	and  $01                                         ; $2a66: $e6 $01
	jr   z, jr_000_2a6b                              ; $2a68: $28 $01

	ret                                              ; $2a6a: $c9


jr_000_2a6b:
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
	call splitCEintoItsNybbles                                       ; $2b39: $cd $1c $55
	call getTileCoordsPlayerIsOnAndCheckCollision                                       ; $2b3c: $cd $9d $50
	ret                                              ; $2b3f: $c9


deEquPlayerYplus_c04a:
	ld   hl, wPlayerY
	ld   a, (hl)                                     ; $2b43: $7e
	ld   hl, $c04a                                   ; $2b44: $21 $4a $c0
	add  (hl)                                        ; $2b47: $86
	ld   e, a                                        ; $2b48: $5f
	ld   d, $00                                      ; $2b49: $16 $00
	ret                                              ; $2b4b: $c9


processUsingFruit:
	ld   hl, $c0b0                                   ; $2b4c: $21 $b0 $c0
	ld   a, (hl)                                     ; $2b4f: $7e
	cp   $00                                         ; $2b50: $fe $00
	jr   z, +                              ; $2b52: $28 $01

	ret                                              ; $2b54: $c9

+
	ld   bc, $0000                                   ; $2b55: $01 $00 $00

@loop:
	ld   hl, $c0dc                                   ; $2b58: $21 $dc $c0
	add  hl, bc                                      ; $2b5b: $09
	ld   a, (hl)                                     ; $2b5c: $7e
	cp   $00                                         ; $2b5d: $fe $00
	jr   z, jr_000_2b70                              ; $2b5f: $28 $0f

	inc  bc                                          ; $2b61: $03
	ld   a, c                                        ; $2b62: $79
	cp   $04                                         ; $2b63: $fe $04
	jr   c, @loop                              ; $2b65: $38 $f1

	ret                                              ; $2b67: $c9


jr_000_2b68:
	ld   a, $00                                      ; $2b68: $3e $00
	ld   hl, $c0dc                                   ; $2b6a: $21 $dc $c0
	add  hl, bc                                      ; $2b6d: $09
	ld   (hl), a                                     ; $2b6e: $77
	ret                                              ; $2b6f: $c9


jr_000_2b70:
	ld   hl, $c70f                                   ; $2b70: $21 $0f $c7
	ld   a, (hl)                                     ; $2b73: $7e
	ld   hl, $c0dc                                   ; $2b74: $21 $dc $c0
	add  hl, bc                                      ; $2b77: $09
	ld   (hl), a                                     ; $2b78: $77
	ld   hl, $c713                                   ; $2b79: $21 $13 $c7
	inc  (hl)                                        ; $2b7c: $34
	ld   hl, $c009                                   ; $2b7d: $21 $09 $c0
	ld   (hl), $04                                   ; $2b80: $36 $04
	ld   hl, $c00a                                   ; $2b82: $21 $0a $c0
	ld   (hl), $02                                   ; $2b85: $36 $02
	ld   hl, $c00b                                   ; $2b87: $21 $0b $c0
	ld   (hl), $04                                   ; $2b8a: $36 $04
	call Call_000_2bf5                               ; $2b8c: $cd $f5 $2b
	jr   c, jr_000_2b68                              ; $2b8f: $38 $d7

	ld   hl, $c006                                   ; $2b91: $21 $06 $c0
	ld   a, (hl)                                     ; $2b94: $7e
	ld   hl, $c0e0                                   ; $2b95: $21 $e0 $c0
	add  hl, bc                                      ; $2b98: $09
	ld   (hl), a                                     ; $2b99: $77
	ld   hl, $c007                                   ; $2b9a: $21 $07 $c0
	ld   a, (hl)                                     ; $2b9d: $7e
	ld   hl, $c0e4                                   ; $2b9e: $21 $e4 $c0
	add  hl, bc                                      ; $2ba1: $09
	ld   (hl), a                                     ; $2ba2: $77
	ld   hl, $c008                                   ; $2ba3: $21 $08 $c0
	ld   a, (hl)                                     ; $2ba6: $7e
	ld   hl, $c0e8                                   ; $2ba7: $21 $e8 $c0
	add  hl, bc                                      ; $2baa: $09
	ld   (hl), a                                     ; $2bab: $77
	ld   hl, $c045                                   ; $2bac: $21 $45 $c0
	ld   a, (hl)                                     ; $2baf: $7e
	ld   hl, $c0ec                                   ; $2bb0: $21 $ec $c0
	add  hl, bc                                      ; $2bb3: $09
	ld   (hl), a                                     ; $2bb4: $77
	ld   hl, $c048                                   ; $2bb5: $21 $48 $c0
	ld   a, (hl)                                     ; $2bb8: $7e
	ld   hl, $c0f0                                   ; $2bb9: $21 $f0 $c0
	add  hl, bc                                      ; $2bbc: $09
	ld   (hl), a                                     ; $2bbd: $77
	ld   hl, $c712                                   ; $2bbe: $21 $12 $c7
	ld   a, (hl)                                     ; $2bc1: $7e
	ld   hl, $c0f4                                   ; $2bc2: $21 $f4 $c0
	add  hl, bc                                      ; $2bc5: $09
	ld   (hl), a                                     ; $2bc6: $77
	and  $20                                         ; $2bc7: $e6 $20
	jr   z, jr_000_2be3                              ; $2bc9: $28 $18

	ld   hl, $c713                                   ; $2bcb: $21 $13 $c7
	ld   a, (hl)                                     ; $2bce: $7e
	and  $03                                         ; $2bcf: $e6 $03
	ld   e, a                                        ; $2bd1: $5f
	ld   d, $00                                      ; $2bd2: $16 $00
	ld   hl, data_2bf1                                   ; $2bd4: $21 $f1 $2b
	add  hl, de                                      ; $2bd7: $19
	ld   a, (hl)                                     ; $2bd8: $7e
	ld   hl, $c0f4                                   ; $2bd9: $21 $f4 $c0
	add  hl, bc                                      ; $2bdc: $09
	or   (hl)                                        ; $2bdd: $b6
	ld   hl, $c0f4                                   ; $2bde: $21 $f4 $c0
	add  hl, bc                                      ; $2be1: $09
	ld   (hl), a                                     ; $2be2: $77

jr_000_2be3:
	ld   a, $04                                      ; $2be3: $3e $04
	ld   hl, $c0b0                                   ; $2be5: $21 $b0 $c0
	ld   (hl), a                                     ; $2be8: $77
	ld   hl, $c047                                   ; $2be9: $21 $47 $c0
	inc  (hl)                                        ; $2bec: $34
	call callsCommonSoundFuncs_283d                               ; $2bed: $cd $3d $28
	ret                                              ; $2bf0: $c9


data_2bf1:
	.db $00 $01 $00 $02

Call_000_2bf5:
	ld   hl, wPlayerX                                   ; $2bf5: $21 $52 $c0
	ld   a, (hl)                                     ; $2bf8: $7e
	ld   hl, $c009                                   ; $2bf9: $21 $09 $c0
	add  (hl)                                        ; $2bfc: $86
	ld   hl, $c006                                   ; $2bfd: $21 $06 $c0
	ld   (hl), a                                     ; $2c00: $77
	ld   hl, $c056                                   ; $2c01: $21 $56 $c0
	ld   a, (hl)                                     ; $2c04: $7e
	cp   $46                                         ; $2c05: $fe $46
	jr   c, jr_000_2c1e                              ; $2c07: $38 $15

	ld   hl, wPlayerY                                   ; $2c09: $21 $54 $c0
	ld   a, (hl)                                     ; $2c0c: $7e
	ld   hl, $c00b                                   ; $2c0d: $21 $0b $c0
	add  (hl)                                        ; $2c10: $86
	ld   hl, $c007                                   ; $2c11: $21 $07 $c0
	ld   (hl), a                                     ; $2c14: $77
	ld   a, $06                                      ; $2c15: $3e $06

Jump_000_2c17:
	ld   hl, $c008                                   ; $2c17: $21 $08 $c0
	ld   (hl), a                                     ; $2c1a: $77
	scf                                              ; $2c1b: $37
	ccf                                              ; $2c1c: $3f
	ret                                              ; $2c1d: $c9


jr_000_2c1e:
	cp   $43                                         ; $2c1e: $fe $43
	jr   c, jr_000_2c35                              ; $2c20: $38 $13

	ld   hl, wPlayerY                                   ; $2c22: $21 $54 $c0
	ld   a, (hl)                                     ; $2c25: $7e
	ld   hl, $c00b                                   ; $2c26: $21 $0b $c0
	sub  (hl)                                        ; $2c29: $96
	jr   c, jr_000_2c6b                              ; $2c2a: $38 $3f

	ld   hl, $c007                                   ; $2c2c: $21 $07 $c0
	ld   (hl), a                                     ; $2c2f: $77
	ld   a, $03                                      ; $2c30: $3e $03
	jp   Jump_000_2c17                               ; $2c32: $c3 $17 $2c


jr_000_2c35:
	ld   hl, wPlayerY                                   ; $2c35: $21 $54 $c0
	ld   a, (hl)                                     ; $2c38: $7e
	ld   hl, $c007                                   ; $2c39: $21 $07 $c0
	ld   (hl), a                                     ; $2c3c: $77
	ld   hl, wPlayerOamAttr                                   ; $2c3d: $21 $55 $c0
	ld   a, (hl)                                     ; $2c40: $7e
	and  $20                                         ; $2c41: $e6 $20
	jr   z, jr_000_2c58                              ; $2c43: $28 $13

	ld   hl, $c006                                   ; $2c45: $21 $06 $c0
	ld   a, (hl)                                     ; $2c48: $7e
	ld   hl, $c00a                                   ; $2c49: $21 $0a $c0
	sub  (hl)                                        ; $2c4c: $96
	jr   c, jr_000_2c6b                              ; $2c4d: $38 $1c

	ld   hl, $c006                                   ; $2c4f: $21 $06 $c0
	ld   (hl), a                                     ; $2c52: $77
	ld   a, $09                                      ; $2c53: $3e $09
	jp   Jump_000_2c17                               ; $2c55: $c3 $17 $2c


jr_000_2c58:
	ld   hl, $c006                                   ; $2c58: $21 $06 $c0
	ld   a, (hl)                                     ; $2c5b: $7e
	ld   hl, $c00a                                   ; $2c5c: $21 $0a $c0
	add  (hl)                                        ; $2c5f: $86
	jr   c, jr_000_2c6b                              ; $2c60: $38 $09

	ld   hl, $c006                                   ; $2c62: $21 $06 $c0
	ld   (hl), a                                     ; $2c65: $77
	ld   a, $00                                      ; $2c66: $3e $00
	jp   Jump_000_2c17                               ; $2c68: $c3 $17 $2c


jr_000_2c6b:
	scf                                              ; $2c6b: $37
	ret                                              ; $2c6c: $c9


processUsingJawboneOrSword:
	ld   hl, $c6cb                                   ; $2c6d: $21 $cb $c6
	ld   a, (hl)                                     ; $2c70: $7e
	cp   $00                                         ; $2c71: $fe $00
	jr   nz, @done                             ; $2c73: $20 $49

	ld   hl, $c009                                   ; $2c75: $21 $09 $c0
	ld   (hl), $00                                   ; $2c78: $36 $00
	ld   hl, $c00a                                   ; $2c7a: $21 $0a $c0
	ld   (hl), $00                                   ; $2c7d: $36 $00
	ld   hl, $c00b                                   ; $2c7f: $21 $0b $c0
	ld   (hl), $00                                   ; $2c82: $36 $00
	call Call_000_2bf5                               ; $2c84: $cd $f5 $2b
	jr   c, @done                              ; $2c87: $38 $35

	ld   hl, $c006                                   ; $2c89: $21 $06 $c0
	ld   a, (hl)                                     ; $2c8c: $7e
	ld   hl, $c6cc                                   ; $2c8d: $21 $cc $c6
	ld   (hl), a                                     ; $2c90: $77
	ld   hl, $c007                                   ; $2c91: $21 $07 $c0
	ld   a, (hl)                                     ; $2c94: $7e
	ld   hl, $c6cd                                   ; $2c95: $21 $cd $c6
	ld   (hl), a                                     ; $2c98: $77
	ld   hl, $c008                                   ; $2c99: $21 $08 $c0
	ld   a, (hl)                                     ; $2c9c: $7e
	ld   hl, $c6ce                                   ; $2c9d: $21 $ce $c6
	ld   (hl), a                                     ; $2ca0: $77
	ld   hl, wEquippedBItem                                   ; $2ca1: $21 $49 $c0
	ld   a, (hl)                                     ; $2ca4: $7e
	cp   EQUIPB_JAWBONE                                         ; $2ca5: $fe $01
	jr   z, @jawbone                              ; $2ca7: $28 $09

// sword
	ld   a, $1e                                      ; $2ca9: $3e $1e
	ld   hl, $c6cb                                   ; $2cab: $21 $cb $c6
	ld   (hl), a                                     ; $2cae: $77
	jp   @done                               ; $2caf: $c3 $be $2c

@jawbone:
	ld   a, $5a                                      ; $2cb2: $3e $5a
	ld   hl, $c6cb                                   ; $2cb4: $21 $cb $c6
	ld   (hl), a                                     ; $2cb7: $77
	ld   de, $1771                                   ; $2cb8: $11 $71 $17
	call callCommonSoundFuncs_1513                               ; $2cbb: $cd $13 $15

@done:
	ret                                              ; $2cbe: $c9


Call_000_2cbf:
	ld   hl, $c6cb                                   ; $2cbf: $21 $cb $c6
	ld   a, (hl)                                     ; $2cc2: $7e
	cp   $00                                         ; $2cc3: $fe $00
	jr   nz, +                             ; $2cc5: $20 $01

	ret                                              ; $2cc7: $c9

+
	bit  7, a                                        ; $2cc8: $cb $7f
	jr   nz, @func_2d45                             ; $2cca: $20 $79

	ld   hl, $c6cb                                   ; $2ccc: $21 $cb $c6
	dec  (hl)                                        ; $2ccf: $35
	jr   z, @next_2d34                              ; $2cd0: $28 $62

	ld   hl, wEquippedBItem                                   ; $2cd2: $21 $49 $c0
	ld   a, (hl)                                     ; $2cd5: $7e
	sla  a                                           ; $2cd6: $cb $27
	ld   hl, $c00d                                   ; $2cd8: $21 $0d $c0
	ld   (hl), a                                     ; $2cdb: $77
	ld   hl, $c6ce                                   ; $2cdc: $21 $ce $c6
	ld   a, (hl)                                     ; $2cdf: $7e
	cp   $03                                         ; $2ce0: $fe $03
	jr   nz, +                             ; $2ce2: $20 $11

	ld   hl, $c6cd                                   ; $2ce4: $21 $cd $c6
	ld   a, (hl)                                     ; $2ce7: $7e
	ld   hl, $c00d                                   ; $2ce8: $21 $0d $c0
	sub  (hl)                                        ; $2ceb: $96
	jr   c, @next_2d34                              ; $2cec: $38 $46

	ld   hl, $c6cd                                   ; $2cee: $21 $cd $c6
	ld   (hl), a                                     ; $2cf1: $77
	jp   @next_2d91                               ; $2cf2: $c3 $91 $2d

+
	cp   $06                                         ; $2cf5: $fe $06
	jr   nz, +                             ; $2cf7: $20 $13

	ld   hl, $c6cd                                   ; $2cf9: $21 $cd $c6
	ld   a, (hl)                                     ; $2cfc: $7e
	ld   hl, $c00d                                   ; $2cfd: $21 $0d $c0
	add  (hl)                                        ; $2d00: $86
	cp   $a0                                         ; $2d01: $fe $a0
	jr   nc, @next_2d34                             ; $2d03: $30 $2f

	ld   hl, $c6cd                                   ; $2d05: $21 $cd $c6
	ld   (hl), a                                     ; $2d08: $77
	jp   @next_2d91                               ; $2d09: $c3 $91 $2d

+
	cp   $09                                         ; $2d0c: $fe $09
	jr   nz, +                             ; $2d0e: $20 $11

	ld   hl, $c6cc                                   ; $2d10: $21 $cc $c6
	ld   a, (hl)                                     ; $2d13: $7e
	ld   hl, $c00d                                   ; $2d14: $21 $0d $c0
	sub  (hl)                                        ; $2d17: $96
	jr   c, @next_2d34                              ; $2d18: $38 $1a

	ld   hl, $c6cc                                   ; $2d1a: $21 $cc $c6
	ld   (hl), a                                     ; $2d1d: $77
	jp   @next_2d91                               ; $2d1e: $c3 $91 $2d

+
	ld   hl, $c6cc                                   ; $2d21: $21 $cc $c6
	ld   a, (hl)                                     ; $2d24: $7e
	ld   hl, $c00d                                   ; $2d25: $21 $0d $c0
	add  (hl)                                        ; $2d28: $86
	cp   $f0                                         ; $2d29: $fe $f0
	jr   nc, @next_2d34                             ; $2d2b: $30 $07

	ld   hl, $c6cc                                   ; $2d2d: $21 $cc $c6
	ld   (hl), a                                     ; $2d30: $77
	jp   @next_2d91                               ; $2d31: $c3 $91 $2d

@next_2d34:
	ld   a, $ff                                      ; $2d34: $3e $ff
	ld   hl, $c6cb                                   ; $2d36: $21 $cb $c6
	ld   (hl), a                                     ; $2d39: $77
	ld   hl, wEquippedBItem                                   ; $2d3a: $21 $49 $c0
	ld   a, (hl)                                     ; $2d3d: $7e
	cp   EQUIPB_JAWBONE                                         ; $2d3e: $fe $01
	jr   z, @next_2d91                              ; $2d40: $28 $4f

	jp   @func_2e40                               ; $2d42: $c3 $40 $2e

@func_2d45:
	ld   bc, $0000                                   ; $2d45: $01 $00 $00
	ld   hl, wPlayerX                                   ; $2d48: $21 $52 $c0
	ld   a, (hl)                                     ; $2d4b: $7e
	ld   hl, $c6cc                                   ; $2d4c: $21 $cc $c6
	sub  (hl)                                        ; $2d4f: $96
	jr   c, ++                              ; $2d50: $38 $0a

	cp   $08                                         ; $2d52: $fe $08
	jr   nc, +                             ; $2d54: $30 $01

	inc  bc                                          ; $2d56: $03

+
	inc  (hl)                                        ; $2d57: $34
	inc  (hl)                                        ; $2d58: $34
	jp   @func_2d65                               ; $2d59: $c3 $65 $2d

++
	cp   $f8                                         ; $2d5c: $fe $f8
	jr   c, +                              ; $2d5e: $38 $01

	inc  bc                                          ; $2d60: $03

+
	dec  (hl)                                        ; $2d61: $35
	jr   z, @func_2d65                              ; $2d62: $28 $01

	dec  (hl)                                        ; $2d64: $35

@func_2d65:
	ld   hl, wPlayerY                                   ; $2d65: $21 $54 $c0
	ld   a, (hl)                                     ; $2d68: $7e
	ld   hl, $c6cd                                   ; $2d69: $21 $cd $c6
	sub  (hl)                                        ; $2d6c: $96
	jr   c, ++                              ; $2d6d: $38 $0a

	cp   $08                                         ; $2d6f: $fe $08
	jr   nc, +                             ; $2d71: $30 $01

	inc  bc                                          ; $2d73: $03

+
	inc  (hl)                                        ; $2d74: $34
	inc  (hl)                                        ; $2d75: $34
	jp   @func_2d86                               ; $2d76: $c3 $86 $2d

++
	cp   $f8                                         ; $2d79: $fe $f8
	jr   c, +                              ; $2d7b: $38 $01

	inc  bc                                          ; $2d7d: $03

+
	ld   hl, $c6cd                                   ; $2d7e: $21 $cd $c6
	dec  (hl)                                        ; $2d81: $35
	jr   z, @func_2d86                              ; $2d82: $28 $02

	dec  (hl)                                        ; $2d84: $35
	ld   a, c                                        ; $2d85: $79

@func_2d86:
	cp   $02                                         ; $2d86: $fe $02
	jr   nz, @next_2d91                             ; $2d88: $20 $07

	ld   a, $00                                      ; $2d8a: $3e $00
	ld   hl, $c6cb                                   ; $2d8c: $21 $cb $c6
	ld   (hl), a                                     ; $2d8f: $77
	ret                                              ; $2d90: $c9

@next_2d91:
	ld   a, $ff                                      ; $2d91: $3e $ff
	ld   hl, wMenuCursorIdx                                   ; $2d93: $21 $11 $c7
	ld   (hl), a                                     ; $2d96: $77
	ld   hl, wPlayerX                                   ; $2d97: $21 $52 $c0
	ld   c, (hl)                                     ; $2d9a: $4e
	ld   b, $00                                      ; $2d9b: $06 $00
	ld   hl, wPlayerY                                   ; $2d9d: $21 $54 $c0
	ld   e, (hl)                                     ; $2da0: $5e
	ld   d, $00                                      ; $2da1: $16 $00
	ld   hl, $c6cc                                   ; $2da3: $21 $cc $c6
	ld   c, (hl)                                     ; $2da6: $4e
	ld   b, $00                                      ; $2da7: $06 $00
	ld   hl, $c6cd                                   ; $2da9: $21 $cd $c6
	ld   e, (hl)                                     ; $2dac: $5e
	ld   d, $00                                      ; $2dad: $16 $00
	call splitCEintoItsNybbles                                       ; $2daf: $cd $1c $55
	call getTileCoordsPlayerIsOnAndCheckCollision                                       ; $2db2: $cd $9d $50
	ld   hl, $c6cd                                   ; $2db5: $21 $cd $c6
	ld   a, (hl)                                     ; $2db8: $7e
	sub  $0e                                         ; $2db9: $d6 $0e
	jr   nc, +                             ; $2dbb: $30 $02

	ld   a, $00                                      ; $2dbd: $3e $00

+
	ld   hl, $c0a7                                   ; $2dbf: $21 $a7 $c0
	ld   (hl), a                                     ; $2dc2: $77
	ld   hl, $c6cd                                   ; $2dc3: $21 $cd $c6
	ld   a, (hl)                                     ; $2dc6: $7e
	add  $0e                                         ; $2dc7: $c6 $0e
	ld   hl, $c0a8                                   ; $2dc9: $21 $a8 $c0
	ld   (hl), a                                     ; $2dcc: $77
	ld   hl, $c6cc                                   ; $2dcd: $21 $cc $c6
	ld   a, (hl)                                     ; $2dd0: $7e
	sub  $0e                                         ; $2dd1: $d6 $0e
	jr   nc, +                             ; $2dd3: $30 $02

	ld   a, $00                                      ; $2dd5: $3e $00

+
	ld   hl, $c0a9                                   ; $2dd7: $21 $a9 $c0
	ld   (hl), a                                     ; $2dda: $77
	ld   hl, $c6cc                                   ; $2ddb: $21 $cc $c6
	ld   a, (hl)                                     ; $2dde: $7e
	add  $0e                                         ; $2ddf: $c6 $0e
	jr   nc, +                             ; $2de1: $30 $02

	ld   a, $ff                                      ; $2de3: $3e $ff

+
	ld   hl, $c0aa                                   ; $2de5: $21 $aa $c0
	ld   (hl), a                                     ; $2de8: $77
	ld   bc, $0000                                   ; $2de9: $01 $00 $00

@checkNextNPC:
	ld   hl, wNPCBytes_ID                                   ; $2dec: $21 $30 $cb
	add  hl, bc                                      ; $2def: $09
	ld   a, (hl)                                     ; $2df0: $7e
	cp   $ff                                         ; $2df1: $fe $ff
	jr   nz, @processNPC                             ; $2df3: $20 $07

@gotoCheckNextNPC:
	inc  bc                                          ; $2df5: $03
	ld   a, c                                        ; $2df6: $79
	cp   NUM_NPCS                                         ; $2df7: $fe $0c
	jr   c, @checkNextNPC                              ; $2df9: $38 $f1

	ret                                              ; $2dfb: $c9

@processNPC:
	ld   hl, wNPC_yCoord                                   ; $2dfc: $21 $48 $cb
	add  hl, bc                                      ; $2dff: $09
	ld   a, (hl)                                     ; $2e00: $7e
	ld   hl, $c0a7                                   ; $2e01: $21 $a7 $c0
	cp   (hl)                                        ; $2e04: $be
	jr   c, @gotoCheckNextNPC                              ; $2e05: $38 $ee

	ld   hl, $c0a8                                   ; $2e07: $21 $a8 $c0
	cp   (hl)                                        ; $2e0a: $be
	jr   nc, @gotoCheckNextNPC                             ; $2e0b: $30 $e8

	ld   hl, wNPC_xCoord                                   ; $2e0d: $21 $3c $cb
	add  hl, bc                                      ; $2e10: $09
	ld   a, (hl)                                     ; $2e11: $7e
	ld   hl, $c0a9                                   ; $2e12: $21 $a9 $c0
	cp   (hl)                                        ; $2e15: $be
	jr   c, @gotoCheckNextNPC                              ; $2e16: $38 $dd

	ld   hl, $c0aa                                   ; $2e18: $21 $aa $c0
	cp   (hl)                                        ; $2e1b: $be
	jr   nc, @gotoCheckNextNPC                             ; $2e1c: $30 $d7

	ld   hl, wNPC2ndByteLower6Bits                                   ; $2e1e: $21 $84 $cb
	add  hl, bc                                      ; $2e21: $09
	ld   a, (hl)                                     ; $2e22: $7e
	or   $40                                         ; $2e23: $f6 $40
	ld   hl, wNPC2ndByteLower6Bits                                   ; $2e25: $21 $84 $cb
	add  hl, bc                                      ; $2e28: $09
	ld   (hl), a                                     ; $2e29: $77
	call getBit4ofNPCBytes_cb60                                       ; $2e2a: $cd $72 $73
	jr   nz, @gotoCheckNextNPC                             ; $2e2d: $20 $c6

	ld   hl, wEquippedBItem                                   ; $2e2f: $21 $49 $c0
	ld   a, (hl)                                     ; $2e32: $7e
	cp   EQUIPB_SWORD                                         ; $2e33: $fe $02
	jr   nz, @bItemIsNotSword                             ; $2e35: $20 $14

// sword
	ld   hl, wNPCBytes_cbe4                                   ; $2e37: $21 $e4 $cb
	add  hl, bc                                      ; $2e3a: $09
	ld   a, (hl)                                     ; $2e3b: $7e
	and  $04                                         ; $2e3c: $e6 $04
	jr   nz, @gotoCheckNextNPC                             ; $2e3e: $20 $b5

@func_2e40:
	ld   a, $00                                      ; $2e40: $3e $00
	ld   hl, $c6cb                                   ; $2e42: $21 $cb $c6
	ld   (hl), a                                     ; $2e45: $77
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
	ld   a, $20                                      ; $2e67: $3e $20
	call getLastUsableOamIdx_fromA                                       ; $2e69: $cd $f1 $57
	call clear2spritesInOam_1stIdxedE                                       ; $2e6c: $cd $00 $58
	ld   hl, $c6cb                                   ; $2e6f: $21 $cb $c6
	ld   a, (hl)                                     ; $2e72: $7e
	cp   $00                                         ; $2e73: $fe $00
	jr   nz, jr_000_2e78                             ; $2e75: $20 $01

	ret                                              ; $2e77: $c9


jr_000_2e78:
	ld   hl, $c6cd                                   ; $2e78: $21 $cd $c6
	ld   a, (hl)                                     ; $2e7b: $7e
	add  $10                                         ; $2e7c: $c6 $10
	ld   hl, wSCYvalue                                   ; $2e7e: $21 $11 $cb
	sub  (hl)                                        ; $2e81: $96
	ld   hl, wOam                                   ; $2e82: $21 $00 $c2
	add  hl, de                                      ; $2e85: $19
	ld   (hl), a                                     ; $2e86: $77
	ld   hl, wOam+4                                   ; $2e87: $21 $04 $c2
	add  hl, de                                      ; $2e8a: $19
	ld   (hl), a                                     ; $2e8b: $77
	ld   hl, $c6cc                                   ; $2e8c: $21 $cc $c6
	ld   a, (hl)                                     ; $2e8f: $7e
	ld   hl, wSCXvalue                                   ; $2e90: $21 $10 $cb
	sub  (hl)                                        ; $2e93: $96
	add  $08                                         ; $2e94: $c6 $08
	ld   hl, wOam+1                                   ; $2e96: $21 $01 $c2
	add  hl, de                                      ; $2e99: $19
	ld   (hl), a                                     ; $2e9a: $77
	add  $08                                         ; $2e9b: $c6 $08
	ld   hl, wOam+5                                   ; $2e9d: $21 $05 $c2
	add  hl, de                                      ; $2ea0: $19
	ld   (hl), a                                     ; $2ea1: $77
	ld   hl, $c007                                   ; $2ea2: $21 $07 $c0
	ld   (hl), $90                                   ; $2ea5: $36 $90
	ld   hl, $c008                                   ; $2ea7: $21 $08 $c0
	ld   (hl), $92                                   ; $2eaa: $36 $92

	ld   hl, wEquippedBItem                                   ; $2eac: $21 $49 $c0
	ld   a, (hl)                                     ; $2eaf: $7e
	cp   EQUIPB_JAWBONE                                         ; $2eb0: $fe $01
	jr   z, @jawboneEquipped                              ; $2eb2: $28 $34

	ld   hl, $c007                                   ; $2eb4: $21 $07 $c0
	ld   (hl), $b4                                   ; $2eb7: $36 $b4
	ld   hl, $c008                                   ; $2eb9: $21 $08 $c0
	ld   (hl), $b6                                   ; $2ebc: $36 $b6
	ld   hl, $c6ce                                   ; $2ebe: $21 $ce $c6
	ld   a, (hl)                                     ; $2ec1: $7e
	cp   $00                                         ; $2ec2: $fe $00
	ld   a, $00                                      ; $2ec4: $3e $00
	jr   z, Jump_000_2ef9                              ; $2ec6: $28 $31

	ld   a, (hl)                                     ; $2ec8: $7e
	cp   $09                                         ; $2ec9: $fe $09
	ld   a, $20                                      ; $2ecb: $3e $20
	jr   z, Jump_000_2ef9                              ; $2ecd: $28 $2a

	ld   hl, $c007                                   ; $2ecf: $21 $07 $c0
	ld   (hl), $b8                                   ; $2ed2: $36 $b8
	ld   hl, $c008                                   ; $2ed4: $21 $08 $c0
	ld   (hl), $ba                                   ; $2ed7: $36 $ba
	ld   hl, $c6ce                                   ; $2ed9: $21 $ce $c6
	ld   a, (hl)                                     ; $2edc: $7e
	cp   $03                                         ; $2edd: $fe $03
	ld   a, $00                                      ; $2edf: $3e $00
	jr   z, Jump_000_2ef9                              ; $2ee1: $28 $16

	ld   a, $40                                      ; $2ee3: $3e $40
	jp   Jump_000_2ef9                               ; $2ee5: $c3 $f9 $2e


@jawboneEquipped:
	call Call_000_31d1                               ; $2ee8: $cd $d1 $31
	push af                                          ; $2eeb: $f5
	ld   hl, $c6ce                                   ; $2eec: $21 $ce $c6
	ld   a, (hl)                                     ; $2eef: $7e
	cp   $09                                         ; $2ef0: $fe $09
	jr   nz, jr_000_2ef8                             ; $2ef2: $20 $04

	pop  af                                          ; $2ef4: $f1
	xor  $20                                         ; $2ef5: $ee $20
	push af                                          ; $2ef7: $f5

jr_000_2ef8:
	pop  af                                          ; $2ef8: $f1

Jump_000_2ef9:
	ld   hl, wOam+3                                   ; $2ef9: $21 $03 $c2
	add  hl, de                                      ; $2efc: $19
	ld   (hl), a                                     ; $2efd: $77
	ld   hl, wOam+7                                   ; $2efe: $21 $07 $c2
	add  hl, de                                      ; $2f01: $19
	ld   (hl), a                                     ; $2f02: $77
	and  $20                                         ; $2f03: $e6 $20
	jr   z, +                              ; $2f05: $28 $15

	ld   hl, $c008                                   ; $2f07: $21 $08 $c0
	ld   a, (hl)                                     ; $2f0a: $7e
	ld   hl, wOam+2                                   ; $2f0b: $21 $02 $c2
	add  hl, de                                      ; $2f0e: $19
	ld   (hl), a                                     ; $2f0f: $77
	ld   hl, $c007                                   ; $2f10: $21 $07 $c0
	ld   a, (hl)                                     ; $2f13: $7e
	ld   hl, wOam+6                                   ; $2f14: $21 $06 $c2
	add  hl, de                                      ; $2f17: $19
	ld   (hl), a                                     ; $2f18: $77
	jp   @done                               ; $2f19: $c3 $2e $2f

+
	ld   hl, $c007                                   ; $2f1c: $21 $07 $c0
	ld   a, (hl)                                     ; $2f1f: $7e
	ld   hl, wOam+2                                   ; $2f20: $21 $02 $c2
	add  hl, de                                      ; $2f23: $19
	ld   (hl), a                                     ; $2f24: $77
	ld   hl, $c008                                   ; $2f25: $21 $08 $c0
	ld   a, (hl)                                     ; $2f28: $7e
	ld   hl, wOam+6                                   ; $2f29: $21 $06 $c2
	add  hl, de                                      ; $2f2c: $19
	ld   (hl), a                                     ; $2f2d: $77

@done:
	ret                                              ; $2f2e: $c9


;;
	ld   de, $0006                                   ; $2f2f: $11 $06 $00
	ld   hl, $c056                                   ; $2f32: $21 $56 $c0
	ld   a, (hl)                                     ; $2f35: $7e
	cp   $46                                         ; $2f36: $fe $46
	jr   z, jr_000_2f4f                              ; $2f38: $28 $15

	ld   de, $0003                                   ; $2f3a: $11 $03 $00
	cp   $43                                         ; $2f3d: $fe $43
	jr   z, jr_000_2f4f                              ; $2f3f: $28 $0e

	ld   de, $0000                                   ; $2f41: $11 $00 $00
	ld   hl, wPlayerOamAttr                                   ; $2f44: $21 $55 $c0
	ld   a, (hl)                                     ; $2f47: $7e
	and  $20                                         ; $2f48: $e6 $20
	jr   z, jr_000_2f4f                              ; $2f4a: $28 $03

	ld   de, $0009                                   ; $2f4c: $11 $09 $00

jr_000_2f4f:
	ret                                              ; $2f4f: $c9


Call_000_2f50:
	ld   hl, $c0b0                                   ; $2f50: $21 $b0 $c0
	ld   a, (hl)                                     ; $2f53: $7e
	cp   $00                                         ; $2f54: $fe $00
	jr   z, jr_000_2f5c                              ; $2f56: $28 $04

	ld   hl, $c0b0                                   ; $2f58: $21 $b0 $c0
	dec  (hl)                                        ; $2f5b: $35

jr_000_2f5c:
	ld   bc, $0000                                   ; $2f5c: $01 $00 $00

jr_000_2f5f:
	ld   hl, $c0dc                                   ; $2f5f: $21 $dc $c0
	add  hl, bc                                      ; $2f62: $09
	ld   a, (hl)                                     ; $2f63: $7e
	cp   $00                                         ; $2f64: $fe $00
	jr   nz, jr_000_2f78                             ; $2f66: $20 $10

Jump_000_2f68:
	ld   a, c                                        ; $2f68: $79
	add  $24                                         ; $2f69: $c6 $24
	call getLastUsableOamIdx_fromA                                       ; $2f6b: $cd $f1 $57
	call clearWoamOffsetE                                       ; $2f6e: $cd $10 $58

Jump_000_2f71:
	inc  bc                                          ; $2f71: $03
	ld   a, c                                        ; $2f72: $79
	cp   $04                                         ; $2f73: $fe $04
	jr   c, jr_000_2f5f                              ; $2f75: $38 $e8

	ret                                              ; $2f77: $c9


jr_000_2f78:
	ld   hl, $c0ec                                   ; $2f78: $21 $ec $c0
	add  hl, bc                                      ; $2f7b: $09
	dec  (hl)                                        ; $2f7c: $35
	jr   nz, jr_000_2f8d                             ; $2f7d: $20 $0e

Jump_000_2f7f:
	ld   a, $00                                      ; $2f7f: $3e $00
	ld   hl, $c0dc                                   ; $2f81: $21 $dc $c0
	add  hl, bc                                      ; $2f84: $09
	ld   (hl), a                                     ; $2f85: $77
	ld   hl, $c047                                   ; $2f86: $21 $47 $c0
	dec  (hl)                                        ; $2f89: $35
	jp   Jump_000_2f68                               ; $2f8a: $c3 $68 $2f


jr_000_2f8d:
	ld   hl, $c0e0                                   ; $2f8d: $21 $e0 $c0
	add  hl, bc                                      ; $2f90: $09
	ld   a, (hl)                                     ; $2f91: $7e
	ld   hl, $c0c1                                   ; $2f92: $21 $c1 $c0
	ld   (hl), a                                     ; $2f95: $77
	ld   hl, $c0e4                                   ; $2f96: $21 $e4 $c0
	add  hl, bc                                      ; $2f99: $09
	ld   a, (hl)                                     ; $2f9a: $7e
	ld   hl, $c0c3                                   ; $2f9b: $21 $c3 $c0
	ld   (hl), a                                     ; $2f9e: $77
	ld   hl, $c0e8                                   ; $2f9f: $21 $e8 $c0
	add  hl, bc                                      ; $2fa2: $09
	ld   a, (hl)                                     ; $2fa3: $7e
	and  $7f                                         ; $2fa4: $e6 $7f
	cp   $06                                         ; $2fa6: $fe $06
	jr   nc, jr_000_2fdd                             ; $2fa8: $30 $33

	cp   $03                                         ; $2faa: $fe $03
	jr   nc, jr_000_2fc7                             ; $2fac: $30 $19

	ld   hl, $c0e0                                   ; $2fae: $21 $e0 $c0
	add  hl, bc                                      ; $2fb1: $09
	ld   a, (hl)                                     ; $2fb2: $7e
	cp   $f7                                         ; $2fb3: $fe $f7
	jr   c, jr_000_2fba                              ; $2fb5: $38 $03

jr_000_2fb7:
	jp   Jump_000_2f7f                               ; $2fb7: $c3 $7f $2f


jr_000_2fba:
	ld   hl, $c0f0                                   ; $2fba: $21 $f0 $c0
	add  hl, bc                                      ; $2fbd: $09
	add  (hl)                                        ; $2fbe: $86
	ld   hl, $c0e0                                   ; $2fbf: $21 $e0 $c0
	add  hl, bc                                      ; $2fc2: $09
	ld   (hl), a                                     ; $2fc3: $77
	jp   Jump_000_3081                               ; $2fc4: $c3 $81 $30


jr_000_2fc7:
	ld   hl, $c0e4                                   ; $2fc7: $21 $e4 $c0
	add  hl, bc                                      ; $2fca: $09
	ld   a, (hl)                                     ; $2fcb: $7e
	cp   $04                                         ; $2fcc: $fe $04
	jr   c, jr_000_2fb7                              ; $2fce: $38 $e7

	ld   hl, $c0f0                                   ; $2fd0: $21 $f0 $c0
	add  hl, bc                                      ; $2fd3: $09
	sub  (hl)                                        ; $2fd4: $96
	ld   hl, $c0e4                                   ; $2fd5: $21 $e4 $c0
	add  hl, bc                                      ; $2fd8: $09
	ld   (hl), a                                     ; $2fd9: $77
	jp   Jump_000_2ff5                               ; $2fda: $c3 $f5 $2f


jr_000_2fdd:
	cp   $09                                         ; $2fdd: $fe $09
	jp   nc, Jump_000_306e                           ; $2fdf: $d2 $6e $30

	ld   hl, $c0e4                                   ; $2fe2: $21 $e4 $c0
	add  hl, bc                                      ; $2fe5: $09
	ld   a, (hl)                                     ; $2fe6: $7e
	cp   $9c                                         ; $2fe7: $fe $9c
	jr   nc, jr_000_2fb7                             ; $2fe9: $30 $cc

	ld   hl, $c0f0                                   ; $2feb: $21 $f0 $c0
	add  hl, bc                                      ; $2fee: $09
	add  (hl)                                        ; $2fef: $86
	ld   hl, $c0e4                                   ; $2ff0: $21 $e4 $c0
	add  hl, bc                                      ; $2ff3: $09
	ld   (hl), a                                     ; $2ff4: $77

Jump_000_2ff5:
	ld   hl, $c0f4                                   ; $2ff5: $21 $f4 $c0
	add  hl, bc                                      ; $2ff8: $09
	ld   a, (hl)                                     ; $2ff9: $7e
	and  $20                                         ; $2ffa: $e6 $20
	jr   nz, jr_000_303b                             ; $2ffc: $20 $3d

	ld   hl, $c0f4                                   ; $2ffe: $21 $f4 $c0
	add  hl, bc                                      ; $3001: $09
	ld   a, (hl)                                     ; $3002: $7e
	and  $40                                         ; $3003: $e6 $40
	jr   z, jr_000_3022                              ; $3005: $28 $1b

	ld   hl, wMainLoopCounter                                   ; $3007: $21 $14 $c0
	ld   a, (hl)                                     ; $300a: $7e
	and  $08                                         ; $300b: $e6 $08
	jr   nz, jr_000_3025                             ; $300d: $20 $16

	ld   hl, $c0e0                                   ; $300f: $21 $e0 $c0
	add  hl, bc                                      ; $3012: $09
	ld   a, (hl)                                     ; $3013: $7e
	cp   $02                                         ; $3014: $fe $02
	jr   c, jr_000_305a                              ; $3016: $38 $42

	ld   hl, $c0e0                                   ; $3018: $21 $e0 $c0
	add  hl, bc                                      ; $301b: $09
	dec  (hl)                                        ; $301c: $35
	ld   hl, $c0e0                                   ; $301d: $21 $e0 $c0
	add  hl, bc                                      ; $3020: $09
	dec  (hl)                                        ; $3021: $35

jr_000_3022:
	jp   Jump_000_30f2                               ; $3022: $c3 $f2 $30


jr_000_3025:
	ld   hl, $c0e0                                   ; $3025: $21 $e0 $c0
	add  hl, bc                                      ; $3028: $09
	ld   a, (hl)                                     ; $3029: $7e
	cp   $f9                                         ; $302a: $fe $f9
	jr   nc, jr_000_305a                             ; $302c: $30 $2c

	ld   hl, $c0e0                                   ; $302e: $21 $e0 $c0
	add  hl, bc                                      ; $3031: $09
	inc  (hl)                                        ; $3032: $34
	ld   hl, $c0e0                                   ; $3033: $21 $e0 $c0
	add  hl, bc                                      ; $3036: $09
	inc  (hl)                                        ; $3037: $34
	jp   Jump_000_30f2                               ; $3038: $c3 $f2 $30


jr_000_303b:
	ld   hl, $c0f4                                   ; $303b: $21 $f4 $c0
	add  hl, bc                                      ; $303e: $09
	ld   a, (hl)                                     ; $303f: $7e
	and  $03                                         ; $3040: $e6 $03
	jp   z, Jump_000_30f2                            ; $3042: $ca $f2 $30

	cp   $02                                         ; $3045: $fe $02
	jr   z, jr_000_305d                              ; $3047: $28 $14

	ld   hl, $c0e0                                   ; $3049: $21 $e0 $c0
	add  hl, bc                                      ; $304c: $09
	ld   a, (hl)                                     ; $304d: $7e
	cp   $04                                         ; $304e: $fe $04
	jr   c, jr_000_305a                              ; $3050: $38 $08

	ld   hl, $c0e0                                   ; $3052: $21 $e0 $c0
	add  hl, bc                                      ; $3055: $09
	dec  (hl)                                        ; $3056: $35
	jp   Jump_000_30f2                               ; $3057: $c3 $f2 $30


jr_000_305a:
	jp   Jump_000_2f7f                               ; $305a: $c3 $7f $2f


jr_000_305d:
	ld   hl, $c0e0                                   ; $305d: $21 $e0 $c0
	add  hl, bc                                      ; $3060: $09
	ld   a, (hl)                                     ; $3061: $7e
	cp   $f7                                         ; $3062: $fe $f7
	jr   nc, jr_000_305a                             ; $3064: $30 $f4

	ld   hl, $c0e0                                   ; $3066: $21 $e0 $c0
	add  hl, bc                                      ; $3069: $09
	inc  (hl)                                        ; $306a: $34
	jp   Jump_000_30f2                               ; $306b: $c3 $f2 $30


Jump_000_306e:
	ld   hl, $c0e0                                   ; $306e: $21 $e0 $c0
	add  hl, bc                                      ; $3071: $09
	ld   a, (hl)                                     ; $3072: $7e
	cp   $04                                         ; $3073: $fe $04
	jr   c, jr_000_30e1                              ; $3075: $38 $6a

	ld   hl, $c0f0                                   ; $3077: $21 $f0 $c0
	add  hl, bc                                      ; $307a: $09
	sub  (hl)                                        ; $307b: $96
	ld   hl, $c0e0                                   ; $307c: $21 $e0 $c0
	add  hl, bc                                      ; $307f: $09
	ld   (hl), a                                     ; $3080: $77

Jump_000_3081:
	ld   hl, $c0f4                                   ; $3081: $21 $f4 $c0
	add  hl, bc                                      ; $3084: $09
	ld   a, (hl)                                     ; $3085: $7e
	and  $20                                         ; $3086: $e6 $20
	jr   nz, jr_000_30c3                             ; $3088: $20 $39

	ld   hl, $c0f4                                   ; $308a: $21 $f4 $c0
	add  hl, bc                                      ; $308d: $09
	ld   a, (hl)                                     ; $308e: $7e
	and  $40                                         ; $308f: $e6 $40
	jr   z, Jump_000_30f2                              ; $3091: $28 $5f

	ld   hl, wMainLoopCounter                                   ; $3093: $21 $14 $c0
	ld   a, (hl)                                     ; $3096: $7e
	and  $08                                         ; $3097: $e6 $08
	jr   nz, jr_000_30ad                             ; $3099: $20 $12

	ld   hl, $c0e4                                   ; $309b: $21 $e4 $c0
	add  hl, bc                                      ; $309e: $09
	ld   a, (hl)                                     ; $309f: $7e
	cp   $02                                         ; $30a0: $fe $02
	jr   c, jr_000_30e1                              ; $30a2: $38 $3d

	ld   hl, $c0e4                                   ; $30a4: $21 $e4 $c0
	add  hl, bc                                      ; $30a7: $09
	dec  (hl)                                        ; $30a8: $35
	dec  (hl)                                        ; $30a9: $35
	jp   Jump_000_30f2                               ; $30aa: $c3 $f2 $30


jr_000_30ad:
	ld   hl, $c0e4                                   ; $30ad: $21 $e4 $c0
	add  hl, bc                                      ; $30b0: $09
	ld   a, (hl)                                     ; $30b1: $7e
	cp   $9e                                         ; $30b2: $fe $9e
	jr   nc, jr_000_30e1                             ; $30b4: $30 $2b

	ld   hl, $c0e4                                   ; $30b6: $21 $e4 $c0
	add  hl, bc                                      ; $30b9: $09
	inc  (hl)                                        ; $30ba: $34
	ld   hl, $c0e4                                   ; $30bb: $21 $e4 $c0
	add  hl, bc                                      ; $30be: $09
	inc  (hl)                                        ; $30bf: $34
	jp   Jump_000_30f2                               ; $30c0: $c3 $f2 $30


jr_000_30c3:
	ld   hl, $c0f4                                   ; $30c3: $21 $f4 $c0
	add  hl, bc                                      ; $30c6: $09
	ld   a, (hl)                                     ; $30c7: $7e
	and  $03                                         ; $30c8: $e6 $03
	jr   z, Jump_000_30f2                              ; $30ca: $28 $26

	cp   $02                                         ; $30cc: $fe $02
	jr   z, jr_000_30e4                              ; $30ce: $28 $14

	ld   hl, $c0e4                                   ; $30d0: $21 $e4 $c0
	add  hl, bc                                      ; $30d3: $09
	ld   a, (hl)                                     ; $30d4: $7e
	cp   $04                                         ; $30d5: $fe $04
	jr   c, jr_000_30e1                              ; $30d7: $38 $08

	ld   hl, $c0e4                                   ; $30d9: $21 $e4 $c0
	add  hl, bc                                      ; $30dc: $09
	dec  (hl)                                        ; $30dd: $35
	jp   Jump_000_30f2                               ; $30de: $c3 $f2 $30


jr_000_30e1:
	jp   Jump_000_2f7f                               ; $30e1: $c3 $7f $2f


jr_000_30e4:
	ld   hl, $c0e4                                   ; $30e4: $21 $e4 $c0
	add  hl, bc                                      ; $30e7: $09
	ld   a, (hl)                                     ; $30e8: $7e
	cp   $9c                                         ; $30e9: $fe $9c
	jr   nc, jr_000_30e1                             ; $30eb: $30 $f4

	ld   hl, $c0e4                                   ; $30ed: $21 $e4 $c0
	add  hl, bc                                      ; $30f0: $09
	inc  (hl)                                        ; $30f1: $34

Jump_000_30f2:
	push bc                                          ; $30f2: $c5
	ld   a, $00                                      ; $30f3: $3e $00
	ld   hl, $c5f8                                   ; $30f5: $21 $f8 $c5
	ld   (hl), a                                     ; $30f8: $77
	ld   hl, $c0b3                                   ; $30f9: $21 $b3 $c0
	ld   (hl), a                                     ; $30fc: $77
	ld   hl, $c0f4                                   ; $30fd: $21 $f4 $c0
	add  hl, bc                                      ; $3100: $09
	ld   a, (hl)                                     ; $3101: $7e
	and  $80                                         ; $3102: $e6 $80
	ld   hl, wMenuCursorIdx                                   ; $3104: $21 $11 $c7
	ld   (hl), a                                     ; $3107: $77
	ld   hl, $c0e0                                   ; $3108: $21 $e0 $c0
	add  hl, bc                                      ; $310b: $09
	ld   a, (hl)                                     ; $310c: $7e
	ld   hl, $c00c                                   ; $310d: $21 $0c $c0
	ld   (hl), a                                     ; $3110: $77
	ld   hl, $c0e4                                   ; $3111: $21 $e4 $c0
	add  hl, bc                                      ; $3114: $09
	ld   a, (hl)                                     ; $3115: $7e
	add  $08                                         ; $3116: $c6 $08
	ld   e, a                                        ; $3118: $5f
	ld   d, $00                                      ; $3119: $16 $00
	ld   hl, $c00c                                   ; $311b: $21 $0c $c0
	ld   c, (hl)                                     ; $311e: $4e
	ld   b, $00                                      ; $311f: $06 $00
	call splitCEintoItsNybbles                                       ; $3121: $cd $1c $55
	call func_31e9                                       ; $3124: $cd $e9 $31
	pop  bc                                          ; $3127: $c1
	push bc                                          ; $3128: $c5
	call Call_000_3290                               ; $3129: $cd $90 $32
	pop  bc                                          ; $312c: $c1
	ld   hl, $c5f8                                   ; $312d: $21 $f8 $c5
	ld   a, (hl)                                     ; $3130: $7e
	cp   $00                                         ; $3131: $fe $00
	jr   z, jr_000_3141                              ; $3133: $28 $0c

	ld   hl, $c0f4                                   ; $3135: $21 $f4 $c0
	add  hl, bc                                      ; $3138: $09
	ld   a, (hl)                                     ; $3139: $7e
	and  $10                                         ; $313a: $e6 $10
	jr   nz, jr_000_3141                             ; $313c: $20 $03

	jp   Jump_000_2f7f                               ; $313e: $c3 $7f $2f


jr_000_3141:
	ld   hl, $c0b3                                   ; $3141: $21 $b3 $c0
	ld   a, (hl)                                     ; $3144: $7e
	cp   $00                                         ; $3145: $fe $00
	jr   z, jr_000_318d                              ; $3147: $28 $44

	ld   hl, $c0c1                                   ; $3149: $21 $c1 $c0
	ld   a, (hl)                                     ; $314c: $7e
	ld   hl, $c0e0                                   ; $314d: $21 $e0 $c0
	add  hl, bc                                      ; $3150: $09
	ld   (hl), a                                     ; $3151: $77
	ld   hl, $c0c3                                   ; $3152: $21 $c3 $c0
	ld   a, (hl)                                     ; $3155: $7e
	ld   hl, $c0e4                                   ; $3156: $21 $e4 $c0
	add  hl, bc                                      ; $3159: $09
	ld   (hl), a                                     ; $315a: $77
	ld   hl, $c0e8                                   ; $315b: $21 $e8 $c0
	add  hl, bc                                      ; $315e: $09
	ld   a, (hl)                                     ; $315f: $7e
	bit  7, a                                        ; $3160: $cb $7f
	jr   nz, jr_000_318d                             ; $3162: $20 $29

	and  $7f                                         ; $3164: $e6 $7f
	cp   $06                                         ; $3166: $fe $06
	jr   nc, jr_000_3178                             ; $3168: $30 $0e

	cp   $03                                         ; $316a: $fe $03
	jr   nc, jr_000_3173                             ; $316c: $30 $05

	ld   a, $09                                      ; $316e: $3e $09
	jp   Jump_000_3183                               ; $3170: $c3 $83 $31


jr_000_3173:
	ld   a, $06                                      ; $3173: $3e $06
	jp   Jump_000_3183                               ; $3175: $c3 $83 $31


jr_000_3178:
	cp   $09                                         ; $3178: $fe $09
	jr   nc, jr_000_3181                             ; $317a: $30 $05

	ld   a, $03                                      ; $317c: $3e $03
	jp   Jump_000_3183                               ; $317e: $c3 $83 $31


jr_000_3181:
	ld   a, $00                                      ; $3181: $3e $00

Jump_000_3183:
	or   $80                                         ; $3183: $f6 $80
	ld   hl, $c0e8                                   ; $3185: $21 $e8 $c0
	add  hl, bc                                      ; $3188: $09
	ld   (hl), a                                     ; $3189: $77
	call safeCallCommonSoundFuncs_with23h2                               ; $318a: $cd $37 $28

jr_000_318d:
	ld   a, c                                        ; $318d: $79
	add  $24                                         ; $318e: $c6 $24
	call getLastUsableOamIdx_fromA                                       ; $3190: $cd $f1 $57
	call clearWoamOffsetE                                       ; $3193: $cd $10 $58
	ld   hl, $c0dc                                   ; $3196: $21 $dc $c0
	add  hl, bc                                      ; $3199: $09
	ld   a, (hl)                                     ; $319a: $7e
	ld   hl, wOam+2                                   ; $319b: $21 $02 $c2
	add  hl, de                                      ; $319e: $19
	ld   (hl), a                                     ; $319f: $77
	ld   a, c                                        ; $31a0: $79
	push af                                          ; $31a1: $f5
	call Call_000_31d1                               ; $31a2: $cd $d1 $31
	ld   hl, wOam+3                                   ; $31a5: $21 $03 $c2
	add  hl, de                                      ; $31a8: $19
	ld   (hl), a                                     ; $31a9: $77
	pop  af                                          ; $31aa: $f1
	ld   c, a                                        ; $31ab: $4f
	ld   b, $00                                      ; $31ac: $06 $00
	ld   hl, $c0e0                                   ; $31ae: $21 $e0 $c0
	add  hl, bc                                      ; $31b1: $09
	ld   a, (hl)                                     ; $31b2: $7e
	ld   hl, wSCXvalue                                   ; $31b3: $21 $10 $cb
	sub  (hl)                                        ; $31b6: $96
	add  $08                                         ; $31b7: $c6 $08
	ld   hl, wOam+1                                   ; $31b9: $21 $01 $c2
	add  hl, de                                      ; $31bc: $19
	ld   (hl), a                                     ; $31bd: $77
	ld   hl, $c0e4                                   ; $31be: $21 $e4 $c0
	add  hl, bc                                      ; $31c1: $09
	ld   a, (hl)                                     ; $31c2: $7e
	add  $10                                         ; $31c3: $c6 $10
	ld   hl, wSCYvalue                                   ; $31c5: $21 $11 $cb
	sub  (hl)                                        ; $31c8: $96
	ld   hl, wOam                                   ; $31c9: $21 $00 $c2
	add  hl, de                                      ; $31cc: $19
	ld   (hl), a                                     ; $31cd: $77
	jp   Jump_000_2f71                               ; $31ce: $c3 $71 $2f


Call_000_31d1:
	ld   hl, wMainLoopCounter                                   ; $31d1: $21 $14 $c0
	ld   a, (hl)                                     ; $31d4: $7e
	ld   hl, data_31e5                                   ; $31d5: $21 $e5 $31
	bit  2, a                                        ; $31d8: $cb $57
	jr   z, jr_000_31dd                              ; $31da: $28 $01

	inc  hl                                          ; $31dc: $23

jr_000_31dd:
	bit  3, a                                        ; $31dd: $cb $5f
	jr   z, jr_000_31e3                              ; $31df: $28 $02

	inc  hl                                          ; $31e1: $23
	inc  hl                                          ; $31e2: $23

jr_000_31e3:
	ld   a, (hl)                                     ; $31e3: $7e
	ret                                              ; $31e4: $c9


data_31e5:
	nop                                              ; $31e5: $00
	ld   h, b                                        ; $31e6: $60
	ld   b, b                                        ; $31e7: $40
	.db $20


func_31e9:
	ld   hl, $c008
	ld   c, (hl)
	ld   b, $00                                      ; $31ed: $06 $00
	ld   hl, $c009                                   ; $31ef: $21 $09 $c0
	ld   e, (hl)                                     ; $31f2: $5e
	ld   d, $00                                      ; $31f3: $16 $00
	call Call_000_31f9                               ; $31f5: $cd $f9 $31

_ret_31f8:
	ret                                              ; $31f8: $c9


Call_000_31f9:
	call getTilePlayerIsOn                               ; $31f9: $cd $ed $3f
	ld   hl, $c00c                                   ; $31fc: $21 $0c $c0
	ld   (hl), c                                     ; $31ff: $71
	cp   $2f                                         ; $3200: $fe $2f
	jr   nc, _ret_31f8                             ; $3202: $30 $f4

	push af                                          ; $3204: $f5
	cp   $27                                         ; $3205: $fe $27
	jr   z, @next_3217                              ; $3207: $28 $0e

	cp   $1e                                         ; $3209: $fe $1e
	jr   z, @next_3217                              ; $320b: $28 $0a

	ld   hl, wMenuCursorIdx                                   ; $320d: $21 $11 $c7
	ld   a, (hl)                                     ; $3210: $7e
	cp   $00                                         ; $3211: $fe $00
	jr   z, @next_3217                              ; $3213: $28 $02

	pop  af                                          ; $3215: $f1
	ret                                              ; $3216: $c9

@next_3217:
	pop  af                                          ; $3217: $f1
	push af                                          ; $3218: $f5
	sla  a                                           ; $3219: $cb $27
	ld   c, a                                        ; $321b: $4f
	ld   b, $00                                      ; $321c: $06 $00
	ld   hl, table_0a31                                   ; $321e: $21 $31 $0a
	add  hl, bc                                      ; $3221: $09
	ldi  a, (hl)                                     ; $3222: $2a
	ld   h, (hl)                                     ; $3223: $66
	ld   l, a                                        ; $3224: $6f
	push hl                                          ; $3225: $e5
	ld   hl, $c00c                                   ; $3226: $21 $0c $c0
	ld   c, (hl)                                     ; $3229: $4e
	pop  hl                                          ; $322a: $e1
	pop  af                                          ; $322b: $f1
	jp   hl                                          ; $322c: $e9


func_322d:
	call Call_000_3650                               ; $322d: $cd $50 $36
	ld   a, $00                                      ; $3230: $3e $00
	jp   Jump_000_3237                               ; $3232: $c3 $37 $32


func_3235:
	ld   a, $80                                      ; $3235: $3e $80

Jump_000_3237:
	ld   hl, $c04b                                   ; $3237: $21 $4b $c0
	ld   (hl), a                                     ; $323a: $77
	ld   a, $06                                      ; $323b: $3e $06
	call Call_001_6244                                       ; $323d: $cd $44 $62
	jp   storeFFinto_c5f8                               ; $3240: $c3 $89 $32


func_3243:
	ld   a, $05                                      ; func_3243: $3e $05
	call Call_000_39ea                               ; $3245: $cd $ea $39
	call callsCommonSoundFuncs_2811                               ; $3248: $cd $11 $28
	jp   Jump_000_3286                               ; $324b: $c3 $86 $32


func_324e:
	ld   a, $ff                                      ; func_324e: $3e $ff
	ld   hl, $c0b3                                   ; $3250: $21 $b3 $c0
	ld   (hl), a                                     ; $3253: $77
	jp   _ret_328f                               ; $3254: $c3 $8f $32


func_3257:
	ld   a, $1a                                      ; $3257: $3e $1a
	jp   Jump_000_3268                               ; $3259: $c3 $68 $32


func_32bc:
	ld   a, $1b                                      ; $325c: $3e $1b
	jp   Jump_000_3268                               ; $325e: $c3 $68 $32


func_3261:
	ld   a, $2a                                      ; $3261: $3e $2a
	jp   Jump_000_3268                               ; $3263: $c3 $68 $32


	ld   a, $2b                                      ; $3266: $3e $2b

Jump_000_3268:
	call c028_equGameScreenTileIdx_16ePlusC                                       ; $3268: $cd $0c $40
	call Call_001_58f4                                       ; $326b: $cd $f4 $58
	jp   storeFFinto_c5f8                               ; $326e: $c3 $89 $32


;;
	ld   hl, $c00c                                   ; $3271: $21 $0c $c0
	ld   (hl), e                                     ; $3274: $73
	ld   de, $0000                                   ; $3275: $11 $00 $00
	ld   hl, $c00a                                   ; $3278: $21 $0a $c0
	ldi  a, (hl)                                     ; $327b: $2a
	ld   h, (hl)                                     ; $327c: $66
	ld   l, a                                        ; $327d: $6f
	add  hl, de                                      ; $327e: $19
	ld   (hl), a                                     ; $327f: $77
	ld   hl, $c00c                                   ; $3280: $21 $0c $c0
	ld   e, (hl)                                     ; $3283: $5e
	ld   d, $00                                      ; $3284: $16 $00

Jump_000_3286:
	call Call_000_3a0c                               ; $3286: $cd $0c $3a

storeFFinto_c5f8:
	ld   a, $ff
	ld   hl, $c5f8                                   ; $328b: $21 $f8 $c5
	ld   (hl), a                                     ; $328e: $77

_ret_328f:
	ret


Call_000_3290:
	ld   hl, $c0e4                                   ; $3290: $21 $e4 $c0
	add  hl, bc                                      ; $3293: $09
	ld   a, (hl)                                     ; $3294: $7e
	sub  $0c                                         ; $3295: $d6 $0c
	jr   nc, jr_000_329b                             ; $3297: $30 $02

	ld   a, $00                                      ; $3299: $3e $00

jr_000_329b:
	ld   hl, $c0a7                                   ; $329b: $21 $a7 $c0
	ld   (hl), a                                     ; $329e: $77
	ld   hl, $c0e4                                   ; $329f: $21 $e4 $c0
	add  hl, bc                                      ; $32a2: $09
	ld   a, (hl)                                     ; $32a3: $7e
	add  $0c                                         ; $32a4: $c6 $0c
	ld   hl, $c0a8                                   ; $32a6: $21 $a8 $c0
	ld   (hl), a                                     ; $32a9: $77
	ld   hl, $c0e0                                   ; $32aa: $21 $e0 $c0
	add  hl, bc                                      ; $32ad: $09
	ld   a, (hl)                                     ; $32ae: $7e
	sub  $0c                                         ; $32af: $d6 $0c
	jr   nc, jr_000_32b5                             ; $32b1: $30 $02

	ld   a, $00                                      ; $32b3: $3e $00

jr_000_32b5:
	ld   hl, $c0a9                                   ; $32b5: $21 $a9 $c0
	ld   (hl), a                                     ; $32b8: $77
	ld   hl, $c0e0                                   ; $32b9: $21 $e0 $c0
	add  hl, bc                                      ; $32bc: $09
	ld   a, (hl)                                     ; $32bd: $7e
	add  $0c                                         ; $32be: $c6 $0c
	jr   nc, jr_000_32c4                             ; $32c0: $30 $02

	ld   a, $ff                                      ; $32c2: $3e $ff

jr_000_32c4:
	ld   hl, $c0aa                                   ; $32c4: $21 $aa $c0
	ld   (hl), a                                     ; $32c7: $77
	ld   bc, $0000                                   ; $32c8: $01 $00 $00

jr_000_32cb:
	ld   hl, $c660                                   ; $32cb: $21 $60 $c6
	add  hl, bc                                      ; $32ce: $09
	ld   a, (hl)                                     ; $32cf: $7e
	cp   $00                                         ; $32d0: $fe $00
	jr   nz, jr_000_32dd                             ; $32d2: $20 $09

jr_000_32d4:
	inc  bc                                          ; $32d4: $03
	ld   a, c                                        ; $32d5: $79
	cp   $03                                         ; $32d6: $fe $03
	jr   c, jr_000_32cb                              ; $32d8: $38 $f1

	jp   Jump_000_333d                               ; $32da: $c3 $3d $33


jr_000_32dd:
	cp   $18                                         ; $32dd: $fe $18
	jr   c, jr_000_32d4                              ; $32df: $38 $f3

	ld   hl, $c669                                   ; $32e1: $21 $69 $c6
	add  hl, bc                                      ; $32e4: $09
	ld   a, (hl)                                     ; $32e5: $7e
	ld   hl, $c0a7                                   ; $32e6: $21 $a7 $c0
	cp   (hl)                                        ; $32e9: $be
	jr   c, jr_000_32d4                              ; $32ea: $38 $e8

	ld   hl, $c0a8                                   ; $32ec: $21 $a8 $c0
	cp   (hl)                                        ; $32ef: $be
	jr   nc, jr_000_32d4                             ; $32f0: $30 $e2

	ld   hl, $c663                                   ; $32f2: $21 $63 $c6
	add  hl, bc                                      ; $32f5: $09
	ld   a, (hl)                                     ; $32f6: $7e
	ld   hl, $c0a9                                   ; $32f7: $21 $a9 $c0
	cp   (hl)                                        ; $32fa: $be
	jr   c, jr_000_32d4                              ; $32fb: $38 $d7

	ld   hl, $c663                                   ; $32fd: $21 $63 $c6
	add  hl, bc                                      ; $3300: $09
	ld   a, (hl)                                     ; $3301: $7e
	ld   hl, $c0aa                                   ; $3302: $21 $aa $c0
	cp   (hl)                                        ; $3305: $be
	jr   nc, jr_000_32d4                             ; $3306: $30 $cc

	ld   hl, $c660                                   ; $3308: $21 $60 $c6
	add  hl, bc                                      ; $330b: $09
	ld   a, (hl)                                     ; $330c: $7e
	cp   $24                                         ; $330d: $fe $24
	jr   nc, jr_000_32d4                             ; $330f: $30 $c3

	sub  $18                                         ; $3311: $d6 $18
	ld   hl, $c00c                                   ; $3313: $21 $0c $c0
	ld   (hl), c                                     ; $3316: $71
	push af                                          ; $3317: $f5
	sla  a                                           ; $3318: $cb $27
	ld   c, a                                        ; $331a: $4f
	ld   b, $00                                      ; $331b: $06 $00
// bc is a double idx, put a word here into c004/c005
	ld   hl, table_0a8f                                   ; $331d: $21 $8f $0a
	add  hl, bc                                      ; $3320: $09
	ld   a, (hl)                                     ; $3321: $7e
	ld   hl, $c004                                   ; $3322: $21 $04 $c0
	ld   (hl), a                                     ; $3325: $77

	ld   hl, table_0a8f+1                                   ; $3326: $21 $90 $0a
	add  hl, bc                                      ; $3329: $09
	ld   a, (hl)                                     ; $332a: $7e
	ld   hl, $c005                                   ; $332b: $21 $05 $c0
	ld   (hl), a                                     ; $332e: $77

//
	ld   hl, $c00c                                   ; $332f: $21 $0c $c0
	ld   c, (hl)                                     ; $3332: $4e
	ld   b, $00                                      ; $3333: $06 $00

// word in table_0a8f
	ld   hl, $c004                                   ; $3335: $21 $04 $c0
	ldi  a, (hl)                                     ; $3338: $2a
	ld   h, (hl)                                     ; $3339: $66
	ld   l, a                                        ; $333a: $6f
	pop  af                                          ; $333b: $f1
	jp   hl                                          ; $333c: $e9


Jump_000_333d:
	ld   bc, $0000                                   ; $333d: $01 $00 $00

@checkNextNPC:
	ld   hl, wNPCBytes_ID                                   ; $3340: $21 $30 $cb
	add  hl, bc                                      ; $3343: $09
	ld   a, (hl)                                     ; $3344: $7e
	cp   $ff                                         ; $3345: $fe $ff
	jr   nz, @processNPC                             ; $3347: $20 $07

@gotoCheckNextNPC:
	inc  bc                                          ; $3349: $03
	ld   a, c                                        ; $334a: $79
	cp   $0c                                         ; $334b: $fe $0c
	jr   c, @checkNextNPC                              ; $334d: $38 $f1

	ret                                              ; $334f: $c9

@processNPC:
	ld   hl, wNPC_yCoord                                   ; $3350: $21 $48 $cb
	add  hl, bc                                      ; $3353: $09
	ld   a, (hl)                                     ; $3354: $7e
	ld   hl, $c0a7                                   ; $3355: $21 $a7 $c0
	cp   (hl)                                        ; $3358: $be
	jr   c, @gotoCheckNextNPC                              ; $3359: $38 $ee

	ld   hl, $c0a8                                   ; $335b: $21 $a8 $c0
	cp   (hl)                                        ; $335e: $be
	jr   nc, @gotoCheckNextNPC                             ; $335f: $30 $e8

	ld   hl, wNPC_xCoord                                   ; $3361: $21 $3c $cb
	add  hl, bc                                      ; $3364: $09
	ld   a, (hl)                                     ; $3365: $7e
	ld   hl, $c0a9                                   ; $3366: $21 $a9 $c0
	cp   (hl)                                        ; $3369: $be
	jr   c, @gotoCheckNextNPC                              ; $336a: $38 $dd

	ld   hl, wNPC_xCoord                                   ; $336c: $21 $3c $cb
	add  hl, bc                                      ; $336f: $09
	ld   a, (hl)                                     ; $3370: $7e
	ld   hl, $c0aa                                   ; $3371: $21 $aa $c0
	cp   (hl)                                        ; $3374: $be
	jr   nc, @gotoCheckNextNPC                             ; $3375: $30 $d2

	call getBit4ofNPCBytes_cb60                                       ; $3377: $cd $72 $73
	jr   nz, @gotoCheckNextNPC                             ; $337a: $20 $cd

	ld   hl, wNPCBytes_cbe4                                   ; $337c: $21 $e4 $cb
	add  hl, bc                                      ; $337f: $09
	ld   a, (hl)                                     ; $3380: $7e
	and  $04                                         ; $3381: $e6 $04
	jr   nz, @gotoCheckNextNPC                             ; $3383: $20 $c4

	ld   hl, wNPCBytes_cb60                                   ; $3385: $21 $60 $cb
	add  hl, bc                                      ; $3388: $09
	ld   a, (hl)                                     ; $3389: $7e
	bit  7, a                                        ; $338a: $cb $7f
	jr   nz, +                             ; $338c: $20 $13

	call copy8npcMetadataBytesInto_c6d0                                       ; $338e: $cd $c6 $72
	ld   hl, wCommonByteCopyDestBytes+4                                   ; $3391: $21 $d4 $c6
	ld   a, (hl)                                     ; $3394: $7e
	cp   $ff                                         ; $3395: $fe $ff
	jr   z, @func_33aa                              ; $3397: $28 $11

	ld   hl, wNPCBytes_newID                                   ; $3399: $21 $c0 $cb
	add  hl, bc                                      ; $339c: $09
	ld   (hl), a                                     ; $339d: $77
	jp   @func_33aa                               ; $339e: $c3 $aa $33

+
	ld   a, $ff                                      ; $33a1: $3e $ff
	ld   hl, $c0b3                                   ; $33a3: $21 $b3 $c0
	ld   (hl), a                                     ; $33a6: $77
	jp   @done                               ; $33a7: $c3 $b0 $33

@func_33aa:
	ld   a, $ff                                      ; $33aa: $3e $ff
	ld   hl, $c5f8                                   ; $33ac: $21 $f8 $c5
	ld   (hl), a                                     ; $33af: $77

@done:
	ret                                              ; $33b0: $c9


func_33b1:
	ld   a, c                                        ; $33b1: $79
	push af                                          ; $33b2: $f5
	ld   hl, $c66c                                   ; $33b3: $21 $6c $c6
	add  hl, bc                                      ; $33b6: $09
	ld   a, (hl)                                     ; $33b7: $7e
	push af                                          ; $33b8: $f5
	ld   hl, $c669                                   ; $33b9: $21 $69 $c6
	add  hl, bc                                      ; $33bc: $09
	ld   e, (hl)                                     ; $33bd: $5e
	ld   d, $00                                      ; $33be: $16 $00
	ld   hl, $c663                                   ; $33c0: $21 $63 $c6
	add  hl, bc                                      ; $33c3: $09
	ld   a, (hl)                                     ; $33c4: $7e
	ld   c, a                                        ; $33c5: $4f
	ld   b, $00                                      ; $33c6: $06 $00
	call splitCEintoItsNybbles                                       ; $33c8: $cd $1c $55
	ld   hl, $c008                                   ; $33cb: $21 $08 $c0
	ld   c, (hl)                                     ; $33ce: $4e
	ld   b, $00                                      ; $33cf: $06 $00
	ld   hl, $c009                                   ; $33d1: $21 $09 $c0
	ld   e, (hl)                                     ; $33d4: $5e
	ld   d, $00                                      ; $33d5: $16 $00
	pop  af                                          ; $33d7: $f1
	cp   $06                                         ; $33d8: $fe $06
	jr   z, jr_000_33f6                              ; $33da: $28 $1a

	jr   c, jr_000_33ea                              ; $33dc: $38 $0c

	ld   hl, $c006                                   ; $33de: $21 $06 $c0
	ld   a, (hl)                                     ; $33e1: $7e
	cp   $09                                         ; $33e2: $fe $09
	jr   c, Jump_000_33ff                              ; $33e4: $38 $19

	inc  bc                                          ; $33e6: $03
	jp   Jump_000_33ff                               ; $33e7: $c3 $ff $33


jr_000_33ea:
	ld   hl, $c006                                   ; $33ea: $21 $06 $c0
	ld   a, (hl)                                     ; $33ed: $7e
	cp   $08                                         ; $33ee: $fe $08
	jr   c, Jump_000_33ff                              ; $33f0: $38 $0d

	inc  bc                                          ; $33f2: $03
	jp   Jump_000_33ff                               ; $33f3: $c3 $ff $33


jr_000_33f6:
	ld   hl, $c007                                   ; $33f6: $21 $07 $c0
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
func_340e:
	ld   a, $05                                      ; $340e: $3e $05
	ld   hl, $c66c                                   ; $3410: $21 $6c $c6
	add  hl, bc                                      ; $3413: $09
	ld   (hl), a                                     ; $3414: $77
	ld   e, a                                        ; $3415: $5f
	ld   d, $00                                      ; $3416: $16 $00
	ld   hl, data_09fc                                   ; $3418: $21 $fc $09
	add  hl, de                                      ; $341b: $19
	ld   a, (hl)                                     ; $341c: $7e
	ld   hl, $c660                                   ; $341d: $21 $60 $c6
	add  hl, bc                                      ; $3420: $09
	ld   (hl), a                                     ; $3421: $77
	ld   hl, data_09fd                                   ; $3422: $21 $fd $09
	add  hl, de                                      ; $3425: $19
	ld   a, (hl)                                     ; $3426: $7e
	ld   hl, $c66f                                   ; $3427: $21 $6f $c6
	add  hl, bc                                      ; $342a: $09
	ld   (hl), a                                     ; $342b: $77
	call callsCommonSoundFuncs_2811                               ; $342c: $cd $11 $28
	jp   c5f8_equFF                               ; $342f: $c3 $4a $34


func_3432:
	ld   a, $1a                                      ; $3432: $3e $1a
	jp   +                               ; $3434: $c3 $39 $34


func_3437:
	ld   a, $1b                                      ; $3437: $3e $1b

+
	ld   hl, $c660                                   ; $3439: $21 $60 $c6
	add  hl, bc                                      ; $343c: $09
	ld   (hl), a                                     ; $343d: $77
	jp   c5f8_equFF                               ; $343e: $c3 $4a $34


c0b3_equFF:
	ld   a, $ff
	ld   hl, $c0b3                                   ; $3443: $21 $b3 $c0
	ld   (hl), a                                     ; $3446: $77
	jp   +                               ; $3447: $c3 $50 $34


c5f8_equFF:
	ld   a, $ff
	ld   hl, $c5f8                                   ; $344c: $21 $f8 $c5
	ld   (hl), a                                     ; $344f: $77

+
	ret                                              ; $3450: $c9


processUsingBombs:
	ld   bc, $0000                                   ; $3451: $01 $00 $00

@loop:
	ld   hl, $c600                                   ; $3454: $21 $00 $c6
	add  hl, bc                                      ; $3457: $09
	ld   a, (hl)                                     ; $3458: $7e
	cp   $00                                         ; $3459: $fe $00
	jr   z, +                              ; $345b: $28 $0a

	inc  bc                                          ; $345d: $03
	ld   a, c                                        ; $345e: $79
	cp   $18                                         ; $345f: $fe $18
	jp   nc, @ret                           ; $3461: $d2 $11 $35

	jp   @loop                               ; $3464: $c3 $54 $34

+
	ld   a, c                                        ; $3467: $79
	push af                                          ; $3468: $f5

// player x in bc, player y in de
	ld   hl, wPlayerX                                   ; $3469: $21 $52 $c0
	ld   c, (hl)                                     ; $346c: $4e
	ld   b, $00                                      ; $346d: $06 $00
	ld   hl, wPlayerY                                   ; $346f: $21 $54 $c0
	ld   e, (hl)                                     ; $3472: $5e
	ld   d, $00                                      ; $3473: $16 $00

//
	ld   hl, wMenuCursorIdx                                   ; $3475: $21 $11 $c7
	ld   a, (hl)                                     ; $3478: $7e
	cp   $00                                         ; $3479: $fe $00
	jr   z, +                              ; $347b: $28 $0c

	ld   hl, $c6cc                                   ; $347d: $21 $cc $c6
	ld   c, (hl)                                     ; $3480: $4e
	ld   b, $00                                      ; $3481: $06 $00
	ld   hl, $c6cd                                   ; $3483: $21 $cd $c6
	ld   e, (hl)                                     ; $3486: $5e
	ld   d, $00                                      ; $3487: $16 $00

+
	call splitCEintoItsNybbles                                       ; $3489: $cd $1c $55
	ld   hl, $c008                                   ; $348c: $21 $08 $c0
	ld   c, (hl)                                     ; $348f: $4e
	ld   b, $00                                      ; $3490: $06 $00
	ld   hl, $c006                                   ; $3492: $21 $06 $c0
	ld   a, (hl)                                     ; $3495: $7e
	cp   $08                                         ; $3496: $fe $08
	jr   c, +                              ; $3498: $38 $0b

	jr   nz, @incBCnext                             ; $349a: $20 $08

	ld   hl, wPlayerOamAttr                                   ; $349c: $21 $55 $c0
	ld   a, (hl)                                     ; $349f: $7e
	and  $20                                         ; $34a0: $e6 $20
	jr   z, +                              ; $34a2: $28 $01

@incBCnext:
	inc  bc                                          ; $34a4: $03

+
	ld   hl, $c009                                   ; $34a5: $21 $09 $c0
	ld   e, (hl)                                     ; $34a8: $5e
	ld   d, $00                                      ; $34a9: $16 $00
	ld   hl, $c007                                   ; $34ab: $21 $07 $c0
	ld   a, (hl)                                     ; $34ae: $7e
	cp   $08                                         ; $34af: $fe $08
	jr   c, +                              ; $34b1: $38 $0b

	jr   nz, @incDEnext                             ; $34b3: $20 $08

	ld   hl, $c056                                   ; $34b5: $21 $56 $c0
	ld   a, (hl)                                     ; $34b8: $7e
	cp   $46                                         ; $34b9: $fe $46
	jr   nc, +                             ; $34bb: $30 $01

@incDEnext:
	inc  de                                          ; $34bd: $13

+
	ld   hl, wMenuCursorIdx                                   ; $34be: $21 $11 $c7
	ld   a, (hl)                                     ; $34c1: $7e
	cp   $00                                         ; $34c2: $fe $00
	jr   nz, +                             ; $34c4: $20 $17

	call getTilePlayerIsOn                               ; $34c6: $cd $ed $3f
	cp   $03                                         ; $34c9: $fe $03
	jr   nc, @popAFret                             ; $34cb: $30 $45

	call Call_000_3514                               ; $34cd: $cd $14 $35
	jr   c, @popAFret                              ; $34d0: $38 $40

	ld   a, $27                                      ; $34d2: $3e $27
	call Call_000_08fc                               ; $34d4: $cd $fc $08
	call Call_001_58f4                                       ; $34d7: $cd $f4 $58
	call Call_000_3a68                               ; $34da: $cd $68 $3a

+
	ld   hl, $c00c                                   ; $34dd: $21 $0c $c0
	ld   (hl), c                                     ; $34e0: $71
	pop  af                                          ; $34e1: $f1
	ld   c, a                                        ; $34e2: $4f
	ld   b, $00                                      ; $34e3: $06 $00
	ld   a, $06                                      ; $34e5: $3e $06
	ld   hl, $c600                                   ; $34e7: $21 $00 $c6
	add  hl, bc                                      ; $34ea: $09
	ld   (hl), a                                     ; $34eb: $77
	ld   hl, $c00c                                   ; $34ec: $21 $0c $c0
	ld   a, (hl)                                     ; $34ef: $7e
	ld   hl, $c618                                   ; $34f0: $21 $18 $c6
	add  hl, bc                                      ; $34f3: $09
	ld   (hl), a                                     ; $34f4: $77
	ld   a, e                                        ; $34f5: $7b
	ld   hl, wMenuCursorIdx                                   ; $34f6: $21 $11 $c7
	or   (hl)                                        ; $34f9: $b6
	ld   hl, $c630                                   ; $34fa: $21 $30 $c6
	add  hl, bc                                      ; $34fd: $09
	ld   (hl), a                                     ; $34fe: $77
	bit  7, a                                        ; $34ff: $cb $7f
	jr   nz, @ret                             ; $3501: $20 $0e

	ld   a, $f5                                      ; $3503: $3e $f5
	ld   hl, $c600                                   ; $3505: $21 $00 $c6
	add  hl, bc                                      ; $3508: $09
	ld   (hl), a                                     ; $3509: $77

// decrease bombs
	ld   hl, wNumBombs                                   ; $350a: $21 $3b $c0
	dec  (hl)                                        ; $350d: $35
	call callsCommonSoundFuncs_285e                               ; $350e: $cd $5e $28

@ret:
	ret                                              ; $3511: $c9

@popAFret:
	pop  af                                          ; $3512: $f1
	ret                                              ; $3513: $c9


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
	ld   hl, $c660                                   ; $3567: $21 $60 $c6
	add  hl, bc                                      ; $356a: $09
	ld   a, (hl)                                     ; $356b: $7e
	cp   $00                                         ; $356c: $fe $00
	jr   z, jr_000_3597                              ; $356e: $28 $27

	ld   hl, $c669                                   ; $3570: $21 $69 $c6
	add  hl, bc                                      ; $3573: $09
	ld   a, (hl)                                     ; $3574: $7e
	ld   hl, $c0a7                                   ; $3575: $21 $a7 $c0
	cp   (hl)                                        ; $3578: $be
	jr   c, jr_000_3597                              ; $3579: $38 $1c

	ld   hl, $c0a8                                   ; $357b: $21 $a8 $c0
	cp   (hl)                                        ; $357e: $be
	jr   nc, jr_000_3597                             ; $357f: $30 $16

	ld   hl, $c663                                   ; $3581: $21 $63 $c6
	add  hl, bc                                      ; $3584: $09
	ld   a, (hl)                                     ; $3585: $7e
	ld   hl, $c0a9                                   ; $3586: $21 $a9 $c0
	cp   (hl)                                        ; $3589: $be
	jr   c, jr_000_3597                              ; $358a: $38 $0b

	ld   hl, $c663                                   ; $358c: $21 $63 $c6
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


Call_000_35b2:
	ld   bc, $0000

jr_000_35b5:
	ld   hl, $c600                                   ; $35b5: $21 $00 $c6
	add  hl, bc                                      ; $35b8: $09
	ld   a, (hl)                                     ; $35b9: $7e
	cp   $00                                         ; $35ba: $fe $00
	jr   nz, jr_000_35c5                             ; $35bc: $20 $07

Jump_000_35be:
	inc  bc                                          ; $35be: $03
	ld   a, c                                        ; $35bf: $79
	cp   $18                                         ; $35c0: $fe $18
	jr   c, jr_000_35b5                              ; $35c2: $38 $f1

	ret                                              ; $35c4: $c9


jr_000_35c5:
	dec  (hl)                                        ; $35c5: $35
	ld   a, (hl)                                     ; $35c6: $7e
	cp   $06                                         ; $35c7: $fe $06
	jr   nc, Jump_000_35be                             ; $35c9: $30 $f3

	cp   $05                                         ; $35cb: $fe $05
	jr   z, jr_000_360f                              ; $35cd: $28 $40

	cp   $02                                         ; $35cf: $fe $02
	jr   z, jr_000_35f3                              ; $35d1: $28 $20

	cp   $00                                         ; $35d3: $fe $00
	jr   nz, Jump_000_35be                             ; $35d5: $20 $e7

	push bc                                          ; $35d7: $c5
	ld   hl, $c630                                   ; $35d8: $21 $30 $c6
	add  hl, bc                                      ; $35db: $09
	ld   a, (hl)                                     ; $35dc: $7e
	and  $7f                                         ; $35dd: $e6 $7f
	ld   e, a                                        ; $35df: $5f
	ld   d, $00                                      ; $35e0: $16 $00
	ld   hl, $c618                                   ; $35e2: $21 $18 $c6
	add  hl, bc                                      ; $35e5: $09
	ld   a, (hl)                                     ; $35e6: $7e
	and  $7f                                         ; $35e7: $e6 $7f
	ld   c, a                                        ; $35e9: $4f
	ld   b, $00                                      ; $35ea: $06 $00
	call Call_000_36aa                               ; $35ec: $cd $aa $36
	pop  bc                                          ; $35ef: $c1
	jp   Jump_000_35be                               ; $35f0: $c3 $be $35


jr_000_35f3:
	push bc                                          ; $35f3: $c5
	ld   hl, $c630                                   ; $35f4: $21 $30 $c6
	add  hl, bc                                      ; $35f7: $09
	ld   a, (hl)                                     ; $35f8: $7e
	and  $7f                                         ; $35f9: $e6 $7f
	ld   e, a                                        ; $35fb: $5f
	ld   d, $00                                      ; $35fc: $16 $00
	ld   hl, $c618                                   ; $35fe: $21 $18 $c6
	add  hl, bc                                      ; $3601: $09
	ld   a, (hl)                                     ; $3602: $7e
	and  $7f                                         ; $3603: $e6 $7f
	ld   c, a                                        ; $3605: $4f
	ld   b, $00                                      ; $3606: $06 $00
	call Call_000_3695                               ; $3608: $cd $95 $36
	pop  bc                                          ; $360b: $c1
	jp   Jump_000_35be                               ; $360c: $c3 $be $35


jr_000_360f:
	push bc                                          ; $360f: $c5
	ld   hl, $c630                                   ; $3610: $21 $30 $c6
	add  hl, bc                                      ; $3613: $09
	ld   a, (hl)                                     ; $3614: $7e
	push af                                          ; $3615: $f5
	and  $7f                                         ; $3616: $e6 $7f
	ld   e, a                                        ; $3618: $5f
	ld   d, $00                                      ; $3619: $16 $00
	ld   hl, $c618                                   ; $361b: $21 $18 $c6
	add  hl, bc                                      ; $361e: $09
	ld   a, (hl)                                     ; $361f: $7e
	and  $80                                         ; $3620: $e6 $80
	ld   hl, $c04b                                   ; $3622: $21 $4b $c0
	ld   (hl), a                                     ; $3625: $77
	ld   hl, $c618                                   ; $3626: $21 $18 $c6
	add  hl, bc                                      ; $3629: $09
	ld   a, (hl)                                     ; $362a: $7e
	and  $7f                                         ; $362b: $e6 $7f
	ld   c, a                                        ; $362d: $4f
	ld   b, $00                                      ; $362e: $06 $00
	pop  af                                          ; $3630: $f1
	bit  7, a                                        ; $3631: $cb $7f
	jr   z, jr_000_363b                              ; $3633: $28 $06

	call Call_000_36c3                               ; $3635: $cd $c3 $36
	jp   Jump_000_3646                               ; $3638: $c3 $46 $36


jr_000_363b:
	call Call_000_3a68                               ; $363b: $cd $68 $3a
	ld   a, $05                                      ; $363e: $3e $05
	call Call_000_39ea                               ; $3640: $cd $ea $39
	call Call_000_3a0c                               ; $3643: $cd $0c $3a

Jump_000_3646:
	call Call_000_3737                               ; $3646: $cd $37 $37
	call safeCallCommonSoundFuncs_with12h                               ; $3649: $cd $05 $28
	pop  bc                                          ; $364c: $c1
	jp   Jump_000_35be                               ; $364d: $c3 $be $35


Call_000_3650:
	ld   hl, $c00c                                   ; $3650: $21 $0c $c0
	ld   (hl), c                                     ; $3653: $71
	ld   hl, $c00d                                   ; $3654: $21 $0d $c0
	ld   (hl), e                                     ; $3657: $73
	ld   bc, $0000                                   ; $3658: $01 $00 $00

Jump_000_365b:
	ld   hl, $c600                                   ; $365b: $21 $00 $c6
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
	ld   hl, $c618                                   ; $366d: $21 $18 $c6
	add  hl, bc                                      ; $3670: $09
	ld   a, (hl)                                     ; $3671: $7e
	and  $7f                                         ; $3672: $e6 $7f
	ld   hl, $c00c                                   ; $3674: $21 $0c $c0
	cp   (hl)                                        ; $3677: $be
	jr   nz, jr_000_3664                             ; $3678: $20 $ea

	ld   hl, $c630                                   ; $367a: $21 $30 $c6
	add  hl, bc                                      ; $367d: $09
	ld   a, (hl)                                     ; $367e: $7e
	and  $7f                                         ; $367f: $e6 $7f
	ld   hl, $c00d                                   ; $3681: $21 $0d $c0
	cp   (hl)                                        ; $3684: $be
	jr   nz, jr_000_3664                             ; $3685: $20 $dd

	ld   a, $00                                      ; $3687: $3e $00
	ld   hl, $c600                                   ; $3689: $21 $00 $c6
	add  hl, bc                                      ; $368c: $09
	ld   (hl), a                                     ; $368d: $77

jr_000_368e:
	ld   hl, $c00c                                   ; $368e: $21 $0c $c0
	ld   c, (hl)                                     ; $3691: $4e
	ld   b, $00                                      ; $3692: $06 $00
	ret                                              ; $3694: $c9


Call_000_3695:
	dec  de                                          ; $3695: $1b
	call Call_000_36c3                               ; $3696: $cd $c3 $36
	inc  de                                          ; $3699: $13
	dec  bc                                          ; $369a: $0b
	call Call_000_36c3                               ; $369b: $cd $c3 $36
	inc  bc                                          ; $369e: $03
	inc  de                                          ; $369f: $13
	call Call_000_36c3                               ; $36a0: $cd $c3 $36
	dec  de                                          ; $36a3: $1b
	inc  bc                                          ; $36a4: $03
	call Call_000_36c3                               ; $36a5: $cd $c3 $36
	dec  bc                                          ; $36a8: $0b
	ret                                              ; $36a9: $c9


Call_000_36aa:
	dec  bc                                          ; $36aa: $0b
	dec  de                                          ; $36ab: $1b
	call Call_000_36c3                               ; $36ac: $cd $c3 $36
	inc  de                                          ; $36af: $13
	inc  de                                          ; $36b0: $13
	call Call_000_36c3                               ; $36b1: $cd $c3 $36
	dec  de                                          ; $36b4: $1b
	inc  bc                                          ; $36b5: $03
	inc  bc                                          ; $36b6: $03
	inc  de                                          ; $36b7: $13
	call Call_000_36c3                               ; $36b8: $cd $c3 $36
	dec  de                                          ; $36bb: $1b
	dec  de                                          ; $36bc: $1b
	call Call_000_36c3                               ; $36bd: $cd $c3 $36
	inc  de                                          ; $36c0: $13
	dec  bc                                          ; $36c1: $0b
	ret                                              ; $36c2: $c9


Call_000_36c3:
	ld   a, c                                        ; $36c3: $79
	cp   $10                                         ; $36c4: $fe $10
	jr   nc, @done                             ; $36c6: $30 $1d

	ld   a, e                                        ; $36c8: $7b
	cp   $0b                                         ; $36c9: $fe $0b
	jr   nc, @done                             ; $36cb: $30 $18

	call getTilePlayerIsOn                               ; $36cd: $cd $ed $3f
	cp   $2f                                         ; $36d0: $fe $2f
	jr   nc, @done                             ; $36d2: $30 $11

	push af                                          ; $36d4: $f5
	push bc                                          ; $36d5: $c5
	sla  a                                           ; $36d6: $cb $27
	ld   c, a                                        ; $36d8: $4f
	ld   b, $00                                      ; $36d9: $06 $00
	ld   hl, table_0aa7                                   ; $36db: $21 $a7 $0a
	add  hl, bc                                      ; $36de: $09
	ldi  a, (hl)                                     ; $36df: $2a
	ld   h, (hl)                                     ; $36e0: $66
	ld   l, a                                        ; $36e1: $6f
	pop  bc                                          ; $36e2: $c1
	pop  af                                          ; $36e3: $f1
	jp   hl                                          ; $36e4: $e9

@done:
	ret                                              ; $36e5: $c9


func_36e6:
	call Call_000_3650                               ; $36e6: $cd $50 $36
	ld   a, $00                                      ; $36e9: $3e $00
	jp   Jump_000_36f0                               ; $36eb: $c3 $f0 $36


func_36ee:
	ld   a, $80                                      ; func_36ee: $3e $80

Jump_000_36f0:
	ld   hl, $c04b                                   ; $36f0: $21 $4b $c0
	ld   (hl), a                                     ; $36f3: $77
	ld   a, $06                                      ; $36f4: $3e $06
	call Call_001_6244                                       ; $36f6: $cd $44 $62
	jp   _ret_3736                               ; $36f9: $c3 $36 $37


_ret_36fc:
	ret                                              ; _ret_36fc: $c9


func_36fd:
	call Call_000_3a68
	ld   a, $05                                      ; $3700: $3e $05
	call Call_000_39ea                               ; $3702: $cd $ea $39
	jp   Jump_000_3733                               ; $3705: $c3 $33 $37


func_3708:
	ld   a, $1d                                      ; $3708: $3e $1d
	jp   Jump_000_371c                               ; $370a: $c3 $1c $37


func_370d:
	ld   a, $21                                      ; $370d: $3e $21
	jp   Jump_000_371c                               ; $370f: $c3 $1c $37


func_3712:
	ld   a, $22                                      ; $3712: $3e $22
	jp   Jump_000_371c                               ; $3714: $c3 $1c $37


func_3717:
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
	
func_3731:
	ld   a, $01                                      ; func_3731: $3e $01

Jump_000_3733:
	call Call_000_3a0c                               ; $3733: $cd $0c $3a

_ret_3736:
	ret


Call_000_3737:
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
	ld   hl, $c024                                   ; $37bb: $21 $24 $c0
	ld   (hl), a                                     ; $37be: $77
	call playerTakeDamage                               ; $37bf: $cd $75 $28

jr_000_37c2:
	ld   bc, $0000                                   ; $37c2: $01 $00 $00

jr_000_37c5:
	ld   hl, $c660                                   ; $37c5: $21 $60 $c6
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

	ld   hl, $c669                                   ; $37db: $21 $69 $c6
	add  hl, bc                                      ; $37de: $09
	ld   a, (hl)                                     ; $37df: $7e
	ld   hl, $c0a7                                   ; $37e0: $21 $a7 $c0
	cp   (hl)                                        ; $37e3: $be
	jr   c, Jump_000_37ce                              ; $37e4: $38 $e8

	ld   hl, $c0a8                                   ; $37e6: $21 $a8 $c0
	cp   (hl)                                        ; $37e9: $be
	jr   nc, Jump_000_37ce                             ; $37ea: $30 $e2

	ld   hl, $c663                                   ; $37ec: $21 $63 $c6
	add  hl, bc                                      ; $37ef: $09
	ld   a, (hl)                                     ; $37f0: $7e
	ld   hl, $c0a9                                   ; $37f1: $21 $a9 $c0
	cp   (hl)                                        ; $37f4: $be
	jr   c, Jump_000_37ce                              ; $37f5: $38 $d7

	ld   hl, $c663                                   ; $37f7: $21 $63 $c6
	add  hl, bc                                      ; $37fa: $09
	ld   a, (hl)                                     ; $37fb: $7e
	ld   hl, $c0aa                                   ; $37fc: $21 $aa $c0
	cp   (hl)                                        ; $37ff: $be
	jr   nc, Jump_000_37ce                             ; $3800: $30 $cc

	ld   hl, $c660                                   ; $3802: $21 $60 $c6
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
	ld   bc, $0000                                   ; $3837: $01 $00 $00

@checkNextNPC:
	ld   hl, wNPCBytes_ID                                   ; $383a: $21 $30 $cb
	add  hl, bc                                      ; $383d: $09
	ld   a, (hl)                                     ; $383e: $7e
	cp   $ff                                         ; $383f: $fe $ff
	jr   nz, @processNPC                             ; $3841: $20 $0f

@gotoCheckNextNPC:
	inc  bc                                          ; $3843: $03
	ld   a, c                                        ; $3844: $79
	cp   $0c                                         ; $3845: $fe $0c
	jr   c, @checkNextNPC                              ; $3847: $38 $f1

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
	ld   a, c                                        ; func_3891: $79
	push af                                          ; $3892: $f5
	ld   hl, $c66c                                   ; $3893: $21 $6c $c6
	add  hl, bc                                      ; $3896: $09
	ld   a, (hl)                                     ; $3897: $7e
	push af                                          ; $3898: $f5
	ld   hl, $c669                                   ; $3899: $21 $69 $c6
	add  hl, bc                                      ; $389c: $09
	ld   e, (hl)                                     ; $389d: $5e
	ld   d, $00                                      ; $389e: $16 $00
	ld   hl, $c663                                   ; $38a0: $21 $63 $c6
	add  hl, bc                                      ; $38a3: $09
	ld   a, (hl)                                     ; $38a4: $7e
	ld   c, a                                        ; $38a5: $4f
	ld   b, $00                                      ; $38a6: $06 $00
	call splitCEintoItsNybbles                                       ; $38a8: $cd $1c $55
	ld   hl, $c008                                   ; $38ab: $21 $08 $c0
	ld   c, (hl)                                     ; $38ae: $4e
	ld   b, $00                                      ; $38af: $06 $00
	ld   hl, $c009                                   ; $38b1: $21 $09 $c0
	ld   e, (hl)                                     ; $38b4: $5e
	ld   d, $00                                      ; $38b5: $16 $00
	pop  af                                          ; $38b7: $f1
	cp   $06                                         ; $38b8: $fe $06
	jr   z, jr_000_38d6                              ; $38ba: $28 $1a

	jr   c, jr_000_38ca                              ; $38bc: $38 $0c

	ld   hl, $c006                                   ; $38be: $21 $06 $c0
	ld   a, (hl)                                     ; $38c1: $7e
	cp   $09                                         ; $38c2: $fe $09
	jr   c, Jump_000_38df                              ; $38c4: $38 $19

	inc  bc                                          ; $38c6: $03
	jp   Jump_000_38df                               ; $38c7: $c3 $df $38


jr_000_38ca:
	ld   hl, $c006                                   ; $38ca: $21 $06 $c0
	ld   a, (hl)                                     ; $38cd: $7e
	cp   $08                                         ; $38ce: $fe $08
	jr   c, Jump_000_38df                              ; $38d0: $38 $0d

	inc  bc                                          ; $38d2: $03
	jp   Jump_000_38df                               ; $38d3: $c3 $df $38


jr_000_38d6:
	ld   hl, $c007                                   ; $38d6: $21 $07 $c0
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
	ld   hl, $c66c                                   ; $38f0: $21 $6c $c6
	add  hl, bc                                      ; $38f3: $09
	ld   (hl), a                                     ; $38f4: $77
	ld   e, a                                        ; $38f5: $5f
	ld   d, $00                                      ; $38f6: $16 $00
	ld   hl, data_09fc                                   ; $38f8: $21 $fc $09
	add  hl, de                                      ; $38fb: $19
	ld   a, (hl)                                     ; $38fc: $7e
	ld   hl, $c660                                   ; $38fd: $21 $60 $c6
	add  hl, bc                                      ; $3900: $09
	ld   (hl), a                                     ; $3901: $77
	ld   hl, data_09fd                                   ; $3902: $21 $fd $09
	add  hl, de                                      ; $3905: $19
	ld   a, (hl)                                     ; $3906: $7e
	ld   hl, $c66f                                   ; $3907: $21 $6f $c6
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
	ld   hl, $c660                                   ; $3920: $21 $60 $c6
	add  hl, bc                                      ; $3923: $09
	ld   (hl), a                                     ; $3924: $77

Jump_000_3925:
	jp   Jump_000_37ce


func_3928:
	ld   hl, $c00c                                   ; func_3928: $21 $0c $c0
	ld   (hl), c                                     ; $392b: $71
	ld   bc, $0000                                   ; $392c: $01 $00 $00

@preLoop:
	ld   hl, $c496                                   ; $392f: $21 $96 $c4
	add  hl, bc                                      ; $3932: $09
	ld   a, (hl)                                     ; $3933: $7e
	cp   $00                                         ; $3934: $fe $00
	jr   nz, +                             ; $3936: $20 $09

@loop:
	inc  bc                                          ; $3938: $03
	ld   a, c                                        ; $3939: $79
	cp   $0c                                         ; $393a: $fe $0c
	jr   nc, @done                             ; $393c: $30 $2c

	jp   @preLoop                               ; $393e: $c3 $2f $39

+
	ld   hl, $c00c                                   ; $3941: $21 $0c $c0
	ld   a, (hl)                                     ; $3944: $7e
	ld   hl, $c4a2                                   ; $3945: $21 $a2 $c4
	add  hl, bc                                      ; $3948: $09
	cp   (hl)                                        ; $3949: $be
	jr   nz, @loop                             ; $394a: $20 $ec

	ld   a, e                                        ; $394c: $7b
	ld   hl, $c4ae                                   ; $394d: $21 $ae $c4
	add  hl, bc                                      ; $3950: $09
	cp   (hl)                                        ; $3951: $be
	jr   nz, @loop                             ; $3952: $20 $e4

	ld   a, $00                                      ; $3954: $3e $00
	ld   hl, $c496                                   ; $3956: $21 $96 $c4
	add  hl, bc                                      ; $3959: $09
	ld   (hl), a                                     ; $395a: $77
	ld   hl, $c4c6                                   ; $395b: $21 $c6 $c4
	add  hl, bc                                      ; $395e: $09
	ld   a, (hl)                                     ; $395f: $7e
	ld   hl, wRoomFlagIdxToCheck                                   ; $3960: $21 $fc $c0
	ld   (hl), a                                     ; $3963: $77
	ld   hl, setRoomFlag                                   ; $3964: $21 $de $09
	call jpHLinBank1                                       ; $3967: $cd $b0 $61

@done:
	ld   hl, $c00c                                   ; $396a: $21 $0c $c0
	ld   c, (hl)                                     ; $396d: $4e
	ld   b, $00                                      ; $396e: $06 $00
	ret                                              ; $3970: $c9


Call_000_3971:
	ld   hl, $c00c                                   ; $3971: $21 $0c $c0
	ld   (hl), c                                     ; $3974: $71
	ld   bc, $0000                                   ; $3975: $01 $00 $00

jr_000_3978:
	ld   hl, $c496                                   ; $3978: $21 $96 $c4
	add  hl, bc                                      ; $397b: $09
	ld   a, (hl)                                     ; $397c: $7e
	cp   $00                                         ; $397d: $fe $00
	jr   nz, jr_000_3991                             ; $397f: $20 $10

jr_000_3981:
	inc  bc                                          ; $3981: $03
	ld   a, c                                        ; $3982: $79
	cp   $0c                                         ; $3983: $fe $0c
	jr   c, jr_000_3978                              ; $3985: $38 $f1

	ld   hl, $c00c                                   ; $3987: $21 $0c $c0
	ld   c, (hl)                                     ; $398a: $4e
	ld   b, $00                                      ; $398b: $06 $00
	call Call_000_39b9                               ; $398d: $cd $b9 $39
	ret                                              ; $3990: $c9


jr_000_3991:
	ld   hl, $c00c                                   ; $3991: $21 $0c $c0
	ld   a, (hl)                                     ; $3994: $7e
	ld   hl, $c4a2                                   ; $3995: $21 $a2 $c4
	add  hl, bc                                      ; $3998: $09
	cp   (hl)                                        ; $3999: $be
	jr   nz, jr_000_3981                             ; $399a: $20 $e5

	ld   a, e                                        ; $399c: $7b
	ld   hl, $c4ae                                   ; $399d: $21 $ae $c4
	add  hl, bc                                      ; $39a0: $09
	cp   (hl)                                        ; $39a1: $be
	jr   nz, jr_000_3981                             ; $39a2: $20 $dd

	ld   hl, $c4ba                                   ; $39a4: $21 $ba $c4
	add  hl, bc                                      ; $39a7: $09
	ld   a, (hl)                                     ; $39a8: $7e
	ld   hl, $c028                                   ; $39a9: $21 $28 $c0
	ld   (hl), a                                     ; $39ac: $77
	ld   hl, $c496                                   ; $39ad: $21 $96 $c4
	add  hl, bc                                      ; $39b0: $09
	ld   a, (hl)                                     ; $39b1: $7e
	ld   hl, $c00c                                   ; $39b2: $21 $0c $c0
	ld   c, (hl)                                     ; $39b5: $4e
	ld   b, $00                                      ; $39b6: $06 $00
	ret                                              ; $39b8: $c9


Call_000_39b9:
	ld   a, $00
	ld   hl, $c0b7                                   ; $39bb: $21 $b7 $c0
	ld   (hl), a                                     ; $39be: $77

Jump_000_39bf:
	push de                                          ; $39bf: $d5
	push bc                                          ; $39c0: $c5
	call setTeleportDetails_retZifNotPossible                                       ; $39c1: $cd $6c $58
	pop  bc                                          ; $39c4: $c1
	pop  de                                          ; $39c5: $d1
	jr   nz, jr_000_39cd                             ; $39c6: $20 $05

	ld   a, $00                                      ; $39c8: $3e $00
	jp   Jump_000_39e7                               ; $39ca: $c3 $e7 $39


jr_000_39cd:
	ld   hl, $c0b8                                   ; $39cd: $21 $b8 $c0
	ld   a, c                                        ; $39d0: $79
	cp   (hl)                                        ; $39d1: $be
	jr   nz, jr_000_39e0                             ; $39d2: $20 $0c

	ld   hl, $c0b9                                   ; $39d4: $21 $b9 $c0
	ld   a, e                                        ; $39d7: $7b
	cp   (hl)                                        ; $39d8: $be
	jr   nz, jr_000_39e0                             ; $39d9: $20 $05

	ld   a, $01                                      ; $39db: $3e $01
	jp   Jump_000_39e7                               ; $39dd: $c3 $e7 $39


jr_000_39e0:
	ld   hl, $c0b7                                   ; $39e0: $21 $b7 $c0
	inc  (hl)                                        ; $39e3: $34
	jp   Jump_000_39bf                               ; $39e4: $c3 $bf $39


Jump_000_39e7:
	cp   $01                                         ; $39e7: $fe $01
	ret                                              ; $39e9: $c9


Call_000_39ea:
	cp   $05                                         ; $39ea: $fe $05
	jr   nz, jr_000_39fa                             ; $39ec: $20 $0c

	call Call_000_3971                               ; $39ee: $cd $71 $39
	cp   $00                                         ; $39f1: $fe $00
	jr   z, jr_000_39f8                              ; $39f3: $28 $03

	ld   a, $25                                      ; $39f5: $3e $25
	ret                                              ; $39f7: $c9


jr_000_39f8:
	ld   a, $05                                      ; $39f8: $3e $05

jr_000_39fa:
	ret                                              ; $39fa: $c9


func_39fb:
	cp   $1d                                         ; func_39fb: $fe $1d
	jr   nz, jr_000_3a0b                             ; $39fd: $20 $0c

	call Call_000_3971                               ; $39ff: $cd $71 $39
	cp   $00                                         ; $3a02: $fe $00
	jr   z, jr_000_3a09                              ; $3a04: $28 $03

	ld   a, $2b                                      ; $3a06: $3e $2b
	ret                                              ; $3a08: $c9


jr_000_3a09:
	ld   a, $1d                                      ; $3a09: $3e $1d

jr_000_3a0b:
	ret                                              ; $3a0b: $c9


Call_000_3a0c:
	push af                                          ; Call_000_3a0c: $f5
	ld   a, e                                        ; $3a0d: $7b
	push af                                          ; $3a0e: $f5
	ld   a, c                                        ; $3a0f: $79
	push af                                          ; $3a10: $f5

Jump_000_3a11:
	ld   bc, $0000                                   ; $3a11: $01 $00 $00

jr_000_3a14:
	ld   hl, $c580                                   ; $3a14: $21 $80 $c5
	add  hl, bc                                      ; $3a17: $09
	ld   a, (hl)                                     ; $3a18: $7e
	cp   $00                                         ; $3a19: $fe $00
	jr   z, jr_000_3a29                              ; $3a1b: $28 $0c

	inc  bc                                          ; $3a1d: $03
	ld   a, c                                        ; $3a1e: $79
	cp   $18                                         ; $3a1f: $fe $18
	jr   c, jr_000_3a14                              ; $3a21: $38 $f1

	call Call_000_3aa4                               ; $3a23: $cd $a4 $3a
	jp   Jump_000_3a11                               ; $3a26: $c3 $11 $3a


jr_000_3a29:
	pop  af                                          ; $3a29: $f1
	ld   hl, $c598                                   ; $3a2a: $21 $98 $c5
	add  hl, bc                                      ; $3a2d: $09
	ld   (hl), a                                     ; $3a2e: $77
	pop  af                                          ; $3a2f: $f1
	ld   hl, $c5b0                                   ; $3a30: $21 $b0 $c5
	add  hl, bc                                      ; $3a33: $09
	ld   (hl), a                                     ; $3a34: $77
	pop  af                                          ; $3a35: $f1
	ld   hl, $c580                                   ; $3a36: $21 $80 $c5
	add  hl, bc                                      ; $3a39: $09
	ld   (hl), a                                     ; $3a3a: $77
	ld   e, a                                        ; $3a3b: $5f
	ld   d, $00                                      ; $3a3c: $16 $00
	ld   hl, data_09fd                                   ; $3a3e: $21 $fd $09
	add  hl, de                                      ; $3a41: $19
	ld   a, (hl)                                     ; $3a42: $7e
	ld   hl, $c5c8                                   ; $3a43: $21 $c8 $c5
	add  hl, bc                                      ; $3a46: $09
	ld   (hl), a                                     ; $3a47: $77
	ld   hl, data_09fc                                   ; $3a48: $21 $fc $09
	add  hl, de                                      ; $3a4b: $19
	ld   a, (hl)                                     ; $3a4c: $7e
	push af                                          ; $3a4d: $f5
	ld   hl, $c5b0                                   ; $3a4e: $21 $b0 $c5
	add  hl, bc                                      ; $3a51: $09
	ld   e, (hl)                                     ; $3a52: $5e
	ld   d, $00                                      ; $3a53: $16 $00
	ld   hl, $c598                                   ; $3a55: $21 $98 $c5
	add  hl, bc                                      ; $3a58: $09
	ld   a, (hl)                                     ; $3a59: $7e
	ld   c, a                                        ; $3a5a: $4f
	ld   b, $00                                      ; $3a5b: $06 $00
	call getTilePlayerIsOn                               ; $3a5d: $cd $ed $3f
	pop  af                                          ; $3a60: $f1
	call Call_000_08fc                               ; $3a61: $cd $fc $08
	call Call_001_58f4                                       ; $3a64: $cd $f4 $58
	ret                                              ; $3a67: $c9


Call_000_3a68:
	push af                                          ; $3a68: $f5
	ld   hl, $c00c                                   ; $3a69: $21 $0c $c0
	ld   (hl), c                                     ; $3a6c: $71
	ld   bc, $0000                                   ; $3a6d: $01 $00 $00

Jump_000_3a70:
	ld   hl, $c580                                   ; $3a70: $21 $80 $c5
	add  hl, bc                                      ; $3a73: $09
	ld   a, (hl)                                     ; $3a74: $7e
	cp   $00                                         ; $3a75: $fe $00
	jr   nz, jr_000_3a82                             ; $3a77: $20 $09

jr_000_3a79:
	inc  bc                                          ; $3a79: $03
	ld   a, c                                        ; $3a7a: $79
	cp   $18                                         ; $3a7b: $fe $18
	jr   nc, jr_000_3a9c                             ; $3a7d: $30 $1d

	jp   Jump_000_3a70                               ; $3a7f: $c3 $70 $3a


jr_000_3a82:
	ld   hl, $c00c                                   ; $3a82: $21 $0c $c0
	ld   a, (hl)                                     ; $3a85: $7e
	ld   hl, $c598                                   ; $3a86: $21 $98 $c5
	add  hl, bc                                      ; $3a89: $09
	cp   (hl)                                        ; $3a8a: $be
	jr   nz, jr_000_3a79                             ; $3a8b: $20 $ec

	ld   a, e                                        ; $3a8d: $7b
	ld   hl, $c5b0                                   ; $3a8e: $21 $b0 $c5
	add  hl, bc                                      ; $3a91: $09
	cp   (hl)                                        ; $3a92: $be
	jr   nz, jr_000_3a79                             ; $3a93: $20 $e4

	ld   a, $00                                      ; $3a95: $3e $00
	ld   hl, $c580                                   ; $3a97: $21 $80 $c5
	add  hl, bc                                      ; $3a9a: $09
	ld   (hl), a                                     ; $3a9b: $77

jr_000_3a9c:
	ld   hl, $c00c                                   ; $3a9c: $21 $0c $c0
	ld   c, (hl)                                     ; $3a9f: $4e
	ld   b, $00                                      ; $3aa0: $06 $00
	pop  af                                          ; $3aa2: $f1
	ret                                              ; $3aa3: $c9


Call_000_3aa4:
	ld   bc, $0000                                   ; $3aa4: $01 $00 $00

jr_000_3aa7:
	ld   hl, $c580                                   ; $3aa7: $21 $80 $c5
	add  hl, bc                                      ; $3aaa: $09
	ld   a, (hl)                                     ; $3aab: $7e
	cp   $00                                         ; $3aac: $fe $00
	jr   z, jr_000_3b0a                              ; $3aae: $28 $5a

	ld   hl, $c5c8                                   ; $3ab0: $21 $c8 $c5
	add  hl, bc                                      ; $3ab3: $09
	dec  (hl)                                        ; $3ab4: $35
	jr   nz, jr_000_3b0a                             ; $3ab5: $20 $53

	add  $02                                         ; $3ab7: $c6 $02
	ld   hl, $c580                                   ; $3ab9: $21 $80 $c5
	add  hl, bc                                      ; $3abc: $09
	ld   (hl), a                                     ; $3abd: $77
	ld   e, a                                        ; $3abe: $5f
	ld   d, $00                                      ; $3abf: $16 $00
	ld   hl, data_09fd                                   ; $3ac1: $21 $fd $09
	add  hl, de                                      ; $3ac4: $19
	ld   a, (hl)                                     ; $3ac5: $7e
	cp   $00                                         ; $3ac6: $fe $00
	jr   nz, jr_000_3ad2                             ; $3ac8: $20 $08

	ld   hl, $c580                                   ; $3aca: $21 $80 $c5
	add  hl, bc                                      ; $3acd: $09
	ld   (hl), a                                     ; $3ace: $77
	jp   Jump_000_3ad7                               ; $3acf: $c3 $d7 $3a


jr_000_3ad2:
	ld   hl, $c5c8                                   ; $3ad2: $21 $c8 $c5
	add  hl, bc                                      ; $3ad5: $09
	ld   (hl), a                                     ; $3ad6: $77

Jump_000_3ad7:
	ld   hl, data_09fc                                   ; $3ad7: $21 $fc $09
	add  hl, de                                      ; $3ada: $19
	ld   a, (hl)                                     ; $3adb: $7e
	ld   hl, $c00d                                   ; $3adc: $21 $0d $c0
	ld   (hl), a                                     ; $3adf: $77
	ld   hl, $c5b0                                   ; $3ae0: $21 $b0 $c5
	add  hl, bc                                      ; $3ae3: $09
	ld   e, (hl)                                     ; $3ae4: $5e
	ld   d, $00                                      ; $3ae5: $16 $00
	push bc                                          ; $3ae7: $c5
	ld   hl, $c598                                   ; $3ae8: $21 $98 $c5
	add  hl, bc                                      ; $3aeb: $09
	ld   a, (hl)                                     ; $3aec: $7e
	ld   c, a                                        ; $3aed: $4f
	ld   b, $00                                      ; $3aee: $06 $00
	call getTilePlayerIsOn                               ; $3af0: $cd $ed $3f
	ld   hl, $c00d                                   ; $3af3: $21 $0d $c0
	ld   a, (hl)                                     ; $3af6: $7e
	cp   $00                                         ; $3af7: $fe $00
	jr   nz, jr_000_3b03                             ; $3af9: $20 $08

	call Call_000_078b                               ; $3afb: $cd $8b $07
	ld   a, $00                                      ; $3afe: $3e $00
	jp   Jump_000_3b06                               ; $3b00: $c3 $06 $3b


jr_000_3b03:
	call Call_000_08fc                               ; $3b03: $cd $fc $08

Jump_000_3b06:
	call Call_001_58f4                                       ; $3b06: $cd $f4 $58
	pop  bc                                          ; $3b09: $c1

jr_000_3b0a:
	inc  bc                                          ; $3b0a: $03
	ld   a, c                                        ; $3b0b: $79
	cp   $18                                         ; $3b0c: $fe $18
	jr   c, jr_000_3aa7                              ; $3b0e: $38 $97

	ret                                              ; $3b10: $c9


Call_000_3b11:
	ld   bc, $0000                                   ; $3b11: $01 $00 $00

jr_000_3b14:
	ld   a, c                                        ; $3b14: $79
	sla  a                                           ; $3b15: $cb $27
	add  $02                                         ; $3b17: $c6 $02
	call getLastUsableOamIdx_fromA                                       ; $3b19: $cd $f1 $57
	call clear2spritesInOam_1stIdxedE                                       ; $3b1c: $cd $00 $58
	ld   hl, $c660                                   ; $3b1f: $21 $60 $c6
	add  hl, bc                                      ; $3b22: $09
	ld   a, (hl)                                     ; $3b23: $7e
	cp   $00                                         ; $3b24: $fe $00
	jr   z, jr_000_3b76                              ; $3b26: $28 $4e

	ld   hl, $c666                                   ; $3b28: $21 $66 $c6
	add  hl, bc                                      ; $3b2b: $09
	ld   a, (hl)                                     ; $3b2c: $7e
	call convert2x2tileValueToTopLeftVramTileValue                               ; $3b2d: $cd $c4 $17
	and  $fc                                         ; $3b30: $e6 $fc
	ld   hl, wOam+2                                   ; $3b32: $21 $02 $c2
	add  hl, de                                      ; $3b35: $19
	ld   (hl), a                                     ; $3b36: $77
	add  $02                                         ; $3b37: $c6 $02
	ld   hl, wOam+6                                   ; $3b39: $21 $06 $c2
	add  hl, de                                      ; $3b3c: $19
	ld   (hl), a                                     ; $3b3d: $77
	ld   hl, wOam+3                                   ; $3b3e: $21 $03 $c2
	add  hl, de                                      ; $3b41: $19
	ld   (hl), $00                                   ; $3b42: $36 $00
	ld   hl, wOam+7                                   ; $3b44: $21 $07 $c2
	add  hl, de                                      ; $3b47: $19
	ld   (hl), $00                                   ; $3b48: $36 $00
	ld   hl, $c663                                   ; $3b4a: $21 $63 $c6
	add  hl, bc                                      ; $3b4d: $09
	ld   a, (hl)                                     ; $3b4e: $7e
	ld   hl, wSCXvalue                                   ; $3b4f: $21 $10 $cb
	sub  (hl)                                        ; $3b52: $96
	add  $08                                         ; $3b53: $c6 $08
	ld   hl, wOam+1                                   ; $3b55: $21 $01 $c2
	add  hl, de                                      ; $3b58: $19
	ld   (hl), a                                     ; $3b59: $77
	add  $08                                         ; $3b5a: $c6 $08
	ld   hl, wOam+5                                   ; $3b5c: $21 $05 $c2
	add  hl, de                                      ; $3b5f: $19
	ld   (hl), a                                     ; $3b60: $77
	ld   hl, $c669                                   ; $3b61: $21 $69 $c6
	add  hl, bc                                      ; $3b64: $09
	ld   a, (hl)                                     ; $3b65: $7e
	add  $10                                         ; $3b66: $c6 $10
	ld   hl, wSCYvalue                                   ; $3b68: $21 $11 $cb
	sub  (hl)                                        ; $3b6b: $96
	ld   hl, wOam                                   ; $3b6c: $21 $00 $c2
	add  hl, de                                      ; $3b6f: $19
	ld   (hl), a                                     ; $3b70: $77
	ld   hl, wOam+4                                   ; $3b71: $21 $04 $c2
	add  hl, de                                      ; $3b74: $19
	ld   (hl), a                                     ; $3b75: $77

jr_000_3b76:
	inc  bc                                          ; $3b76: $03
	ld   a, c                                        ; $3b77: $79
	cp   $03                                         ; $3b78: $fe $03
	jr   c, jr_000_3b14                              ; $3b7a: $38 $98

	ret                                              ; $3b7c: $c9


Call_000_3b7d:
	ld   a, c                                        ; $3b7d: $79
	push af                                          ; $3b7e: $f5
	ld   hl, $c669                                   ; $3b7f: $21 $69 $c6
	add  hl, bc                                      ; $3b82: $09
	ld   a, (hl)                                     ; $3b83: $7e
	add  $0b                                         ; $3b84: $c6 $0b
	ld   hl, $c0c9                                   ; $3b86: $21 $c9 $c0
	ld   (hl), a                                     ; $3b89: $77
	sub  $17                                         ; $3b8a: $d6 $17
	ld   hl, $c0c8                                   ; $3b8c: $21 $c8 $c0
	ld   (hl), a                                     ; $3b8f: $77
	ld   hl, $c663                                   ; $3b90: $21 $63 $c6
	add  hl, bc                                      ; $3b93: $09
	ld   a, (hl)                                     ; $3b94: $7e
	add  $0f                                         ; $3b95: $c6 $0f
	ld   hl, $c0cb                                   ; $3b97: $21 $cb $c0
	ld   (hl), a                                     ; $3b9a: $77
	ld   hl, $c663                                   ; $3b9b: $21 $63 $c6
	add  hl, bc                                      ; $3b9e: $09
	ld   a, (hl)                                     ; $3b9f: $7e
	sub  $10                                         ; $3ba0: $d6 $10
	ld   hl, $c0ca                                   ; $3ba2: $21 $ca $c0
	ld   (hl), a                                     ; $3ba5: $77
	ld   hl, $c663                                   ; $3ba6: $21 $63 $c6
	add  hl, bc                                      ; $3ba9: $09
	ld   a, (hl)                                     ; $3baa: $7e
	add  $0b                                         ; $3bab: $c6 $0b
	ld   hl, $c0cd                                   ; $3bad: $21 $cd $c0
	ld   (hl), a                                     ; $3bb0: $77
	ld   hl, $c663                                   ; $3bb1: $21 $63 $c6
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

	ld   hl, $c660                                   ; $3be6: $21 $60 $c6
	add  hl, bc                                      ; $3be9: $09
	ld   a, (hl)                                     ; $3bea: $7e
	cp   $18                                         ; $3beb: $fe $18
	jr   nz, +                             ; $3bed: $20 $24

	ld   a, $1d                                      ; $3bef: $3e $1d
	ld   hl, $c66c                                   ; $3bf1: $21 $6c $c6
	add  hl, bc                                      ; $3bf4: $09
	ld   (hl), a                                     ; $3bf5: $77
	ld   e, a                                        ; $3bf6: $5f
	ld   d, $00                                      ; $3bf7: $16 $00
	ld   hl, data_09fc                                   ; $3bf9: $21 $fc $09
	add  hl, de                                      ; $3bfc: $19
	ld   a, (hl)                                     ; $3bfd: $7e
	ld   hl, $c660                                   ; $3bfe: $21 $60 $c6
	add  hl, bc                                      ; $3c01: $09
	ld   (hl), a                                     ; $3c02: $77
	ld   hl, data_09fd                                   ; $3c03: $21 $fd $09
	add  hl, de                                      ; $3c06: $19
	ld   a, (hl)                                     ; $3c07: $7e
	ld   hl, $c66f                                   ; $3c08: $21 $6f $c6
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
	ld   hl, $c024                                   ; $3c3f: $21 $24 $c0
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
	ld   bc, $0000                                   ; $3c56: $01 $00 $00

@checkNextNPC:
	ld   hl, wNPCBytes_ID                                   ; $3c59: $21 $30 $cb
	add  hl, bc                                      ; $3c5c: $09
	ld   a, (hl)                                     ; $3c5d: $7e
	cp   $ff                                         ; $3c5e: $fe $ff
	jr   nz, @processNPC                             ; $3c60: $20 $0b

@gotoCheckNextNPC:
	inc  bc                                          ; $3c62: $03
	ld   a, c                                        ; $3c63: $79
	cp   $0c                                         ; $3c64: $fe $0c
	jr   c, @checkNextNPC                              ; $3c66: $38 $f1

@done:
	pop  af                                          ; $3c68: $f1
	ld   c, a                                        ; $3c69: $4f
	ld   b, $00                                      ; $3c6a: $06 $00
	ret                                              ; $3c6c: $c9

@processNPC:
	ld   hl, wNPCBytes_cb60                                   ; $3c6d: $21 $60 $cb
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

	call getBit4ofNPCBytes_cb60                                       ; $3cc4: $cd $72 $73
	jr   nz, @gotoCheckNextNPC                             ; $3cc7: $20 $99

	call getBit5ofNPCBytes_cb60                                       ; $3cc9: $cd $7a $73
	jr   nz, @gotoCheckNextNPC                             ; $3ccc: $20 $94

	call copy8npcMetadataBytesInto_c6d0                                       ; $3cce: $cd $c6 $72
	ld   hl, wCommonByteCopyDestBytes+5                                   ; $3cd1: $21 $d5 $c6
	ld   a, (hl)                                     ; $3cd4: $7e
	cp   $ff                                         ; $3cd5: $fe $ff
	jr   z, @gotoCheckNextNPC                              ; $3cd7: $28 $89

	ld   hl, wNPCBytes_newID                                   ; $3cd9: $21 $c0 $cb
	add  hl, bc                                      ; $3cdc: $09
	ld   (hl), a                                     ; $3cdd: $77
	jp   @gotoCheckNextNPC                               ; $3cde: $c3 $62 $3c

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
	ld   hl, $c669                                   ; $3d07: $21 $69 $c6
	add  hl, bc                                      ; $3d0a: $09
	ld   a, (hl)                                     ; $3d0b: $7e
	add  $0b                                         ; $3d0c: $c6 $0b
	ld   hl, $c0c9                                   ; $3d0e: $21 $c9 $c0
	ld   (hl), a                                     ; $3d11: $77
	sub  $17                                         ; $3d12: $d6 $17
	ld   hl, $c0c8                                   ; $3d14: $21 $c8 $c0
	ld   (hl), a                                     ; $3d17: $77
	ld   hl, $c663                                   ; $3d18: $21 $63 $c6
	add  hl, bc                                      ; $3d1b: $09
	ld   a, (hl)                                     ; $3d1c: $7e
	add  $0b                                         ; $3d1d: $c6 $0b
	ld   hl, $c0cb                                   ; $3d1f: $21 $cb $c0
	ld   (hl), a                                     ; $3d22: $77
	ld   hl, $c663                                   ; $3d23: $21 $63 $c6
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

	ld   hl, $c660                                   ; $3d56: $21 $60 $c6
	add  hl, bc                                      ; $3d59: $09
	ld   a, (hl)                                     ; $3d5a: $7e
	cp   $18                                         ; $3d5b: $fe $18
	jr   nz, +                             ; $3d5d: $20 $24

	ld   a, $1d                                      ; $3d5f: $3e $1d
	ld   hl, $c66c                                   ; $3d61: $21 $6c $c6
	add  hl, bc                                      ; $3d64: $09
	ld   (hl), a                                     ; $3d65: $77
	ld   e, a                                        ; $3d66: $5f
	ld   d, $00                                      ; $3d67: $16 $00
	ld   hl, data_09fc                                   ; $3d69: $21 $fc $09
	add  hl, de                                      ; $3d6c: $19
	ld   a, (hl)                                     ; $3d6d: $7e
	ld   hl, $c660                                   ; $3d6e: $21 $60 $c6
	add  hl, bc                                      ; $3d71: $09
	ld   (hl), a                                     ; $3d72: $77
	ld   hl, data_09fd                                   ; $3d73: $21 $fd $09
	add  hl, de                                      ; $3d76: $19
	ld   a, (hl)                                     ; $3d77: $7e
	ld   hl, $c66f                                   ; $3d78: $21 $6f $c6
	add  hl, bc                                      ; $3d7b: $09
	ld   (hl), a                                     ; $3d7c: $77
	call add2toPlayerHealth                                       ; $3d7d: $cd $84 $50
	jp   @done                               ; $3d80: $c3 $a9 $3d

+
	ld   hl, $c66c                                   ; $3d83: $21 $6c $c6
	add  hl, bc                                      ; $3d86: $09
	ld   a, (hl)                                     ; $3d87: $7e
	cp   $06                                         ; $3d88: $fe $06
	jr   nz, @next_3d97                             ; $3d8a: $20 $0b

	ld   a, $81                                      ; $3d8c: $3e $81
	ld   a, $ff                                      ; $3d8e: $3e $ff
	ld   hl, $c024                                   ; $3d90: $21 $24 $c0
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
	ld   hl, $c66f                                   ; $3df7: $21 $6f $c6
	add  hl, bc                                      ; $3dfa: $09
	dec  (hl)                                        ; $3dfb: $35
	jr   nz, @done                             ; $3dfc: $20 $34

	ld   hl, $c66c                                   ; $3dfe: $21 $6c $c6
	add  hl, bc                                      ; $3e01: $09
	ld   a, (hl)                                     ; $3e02: $7e
	add  $02                                         ; $3e03: $c6 $02
	ld   hl, $c66c                                   ; $3e05: $21 $6c $c6
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
	ld   hl, $c660                                   ; $3e18: $21 $60 $c6
	add  hl, bc                                      ; $3e1b: $09
	ld   (hl), a                                     ; $3e1c: $77
	ld   hl, $c66c                                   ; $3e1d: $21 $6c $c6
	add  hl, bc                                      ; $3e20: $09
	ld   (hl), a                                     ; $3e21: $77
	ret                                              ; $3e22: $c9

@func_3e23:
	ld   hl, $c66f                                   ; $3e23: $21 $6f $c6
	add  hl, bc                                      ; $3e26: $09
	ld   (hl), a                                     ; $3e27: $77
	ld   hl, data_09fc                                   ; $3e28: $21 $fc $09
	add  hl, de                                      ; $3e2b: $19
	ld   a, (hl)                                     ; $3e2c: $7e
	ld   hl, $c660                                   ; $3e2d: $21 $60 $c6
	add  hl, bc                                      ; $3e30: $09
	ld   (hl), a                                     ; $3e31: $77

@done:
	ret                                              ; $3e32: $c9


Call_000_3e33:
	ld   bc, $0000                                   ; $3e33: $01 $00 $00

jr_000_3e36:
	ld   hl, $c660                                   ; $3e36: $21 $60 $c6
	add  hl, bc                                      ; $3e39: $09
	ld   a, (hl)                                     ; $3e3a: $7e
	cp   $00                                         ; $3e3b: $fe $00
	jr   nz, jr_000_3e4c                             ; $3e3d: $20 $0d

Jump_000_3e3f:
	inc  bc                                          ; $3e3f: $03
	ld   a, c                                        ; $3e40: $79
	cp   $03                                         ; $3e41: $fe $03
	jr   c, jr_000_3e36                              ; $3e43: $38 $f1

	ret                                              ; $3e45: $c9


jr_000_3e46:
	call Call_000_3df7                               ; $3e46: $cd $f7 $3d
	jp   Jump_000_3e3f                               ; $3e49: $c3 $3f $3e


jr_000_3e4c:
	cp   $18                                         ; $3e4c: $fe $18
	jr   c, jr_000_3e46                              ; $3e4e: $38 $f6

	ld   hl, $c66c                                   ; $3e50: $21 $6c $c6
	add  hl, bc                                      ; $3e53: $09
	ld   a, (hl)                                     ; $3e54: $7e
	cp   $06                                         ; $3e55: $fe $06
	jr   z, jr_000_3e94                              ; $3e57: $28 $3b

	cp   $09                                         ; $3e59: $fe $09
	jr   z, jr_000_3e64                              ; $3e5b: $28 $07

	cp   $00                                         ; $3e5d: $fe $00
	jr   z, jr_000_3e7c                              ; $3e5f: $28 $1b

	jp   Jump_000_3f20                               ; $3e61: $c3 $20 $3f


jr_000_3e64:
	ld   hl, $c663                                   ; $3e64: $21 $63 $c6
	add  hl, bc                                      ; $3e67: $09
	dec  (hl)                                        ; $3e68: $35
	ld   a, $09                                      ; $3e69: $3e $09
	ld   hl, $c093                                   ; $3e6b: $21 $93 $c0
	ld   (hl), a                                     ; $3e6e: $77
	call Call_000_3b7d                               ; $3e6f: $cd $7d $3b
	ld   hl, $c66f                                   ; $3e72: $21 $6f $c6
	add  hl, bc                                      ; $3e75: $09
	dec  (hl)                                        ; $3e76: $35
	jr   nz, Jump_000_3e3f                             ; $3e77: $20 $c6

	jp   Jump_000_3eb2                               ; $3e79: $c3 $b2 $3e


jr_000_3e7c:
	ld   hl, $c663                                   ; $3e7c: $21 $63 $c6
	add  hl, bc                                      ; $3e7f: $09
	inc  (hl)                                        ; $3e80: $34
	ld   a, $00                                      ; $3e81: $3e $00
	ld   hl, $c093                                   ; $3e83: $21 $93 $c0
	ld   (hl), a                                     ; $3e86: $77
	call Call_000_3b7d                               ; $3e87: $cd $7d $3b
	ld   hl, $c66f                                   ; $3e8a: $21 $6f $c6
	add  hl, bc                                      ; $3e8d: $09
	dec  (hl)                                        ; $3e8e: $35
	jr   nz, Jump_000_3e3f                             ; $3e8f: $20 $ae

	jp   Jump_000_3eb2                               ; $3e91: $c3 $b2 $3e


jr_000_3e94:
	ld   hl, $c669                                   ; $3e94: $21 $69 $c6
	add  hl, bc                                      ; $3e97: $09
	ld   a, (hl)                                     ; $3e98: $7e
	cp   $a0                                         ; $3e99: $fe $a0
	jr   nc, Jump_000_3eb2                             ; $3e9b: $30 $15

	ld   hl, $c669                                   ; $3e9d: $21 $69 $c6
	add  hl, bc                                      ; $3ea0: $09
	inc  (hl)                                        ; $3ea1: $34
	ld   a, $06                                      ; $3ea2: $3e $06
	ld   hl, $c093                                   ; $3ea4: $21 $93 $c0
	ld   (hl), a                                     ; $3ea7: $77
	call Call_000_3d05                               ; $3ea8: $cd $05 $3d
	ld   hl, $c66f                                   ; $3eab: $21 $6f $c6
	add  hl, bc                                      ; $3eae: $09
	dec  (hl)                                        ; $3eaf: $35
	jr   nz, jr_000_3f1d                             ; $3eb0: $20 $6b

Jump_000_3eb2:
	ld   a, c                                        ; $3eb2: $79
	push af                                          ; $3eb3: $f5
	ld   hl, $c66c                                   ; $3eb4: $21 $6c $c6
	add  hl, bc                                      ; $3eb7: $09
	ld   a, (hl)                                     ; $3eb8: $7e
	push af                                          ; $3eb9: $f5
	ld   hl, $c660                                   ; $3eba: $21 $60 $c6
	add  hl, bc                                      ; $3ebd: $09
	ld   a, (hl)                                     ; $3ebe: $7e
	push af                                          ; $3ebf: $f5
	ld   a, $00                                      ; $3ec0: $3e $00
	ld   hl, $c660                                   ; $3ec2: $21 $60 $c6
	add  hl, bc                                      ; $3ec5: $09
	ld   (hl), a                                     ; $3ec6: $77
	ld   hl, $c666                                   ; $3ec7: $21 $66 $c6
	add  hl, bc                                      ; $3eca: $09
	ld   a, (hl)                                     ; $3ecb: $7e
	push af                                          ; $3ecc: $f5
	ld   hl, $c669                                   ; $3ecd: $21 $69 $c6
	add  hl, bc                                      ; $3ed0: $09
	ld   e, (hl)                                     ; $3ed1: $5e
	ld   d, $00                                      ; $3ed2: $16 $00
	ld   hl, $c663                                   ; $3ed4: $21 $63 $c6
	add  hl, bc                                      ; $3ed7: $09
	ld   a, (hl)                                     ; $3ed8: $7e
	ld   c, a                                        ; $3ed9: $4f
	ld   b, $00                                      ; $3eda: $06 $00
	call splitCEintoItsNybbles                                       ; $3edc: $cd $1c $55
	ld   hl, $c008                                   ; $3edf: $21 $08 $c0
	ld   c, (hl)                                     ; $3ee2: $4e
	ld   b, $00                                      ; $3ee3: $06 $00
	ld   hl, $c009                                   ; $3ee5: $21 $09 $c0
	ld   e, (hl)                                     ; $3ee8: $5e
	ld   d, $00                                      ; $3ee9: $16 $00
	call getTilePlayerIsOn                               ; $3eeb: $cd $ed $3f
	pop  af                                          ; $3eee: $f1
	ld   hl, $c028                                   ; $3eef: $21 $28 $c0
	ld   (hl), a                                     ; $3ef2: $77
	pop  af                                          ; $3ef3: $f1
	or   $80                                         ; $3ef4: $f6 $80
	call Call_001_58f4                                       ; $3ef6: $cd $f4 $58
	call Call_000_3a68                               ; $3ef9: $cd $68 $3a
	cp   $1f                                         ; $3efc: $fe $1f
	jr   nz, jr_000_3f18                             ; $3efe: $20 $18

	pop  af                                          ; $3f00: $f1
	cp   $06                                         ; $3f01: $fe $06
	jr   nz, Jump_000_3f19                             ; $3f03: $20 $14

	inc  de                                          ; $3f05: $13
	call getTilePlayerIsOn                               ; $3f06: $cd $ed $3f
	cp   $18                                         ; $3f09: $fe $18
	jr   nz, Jump_000_3f19                             ; $3f0b: $20 $0c

	ld   a, $0d                                      ; $3f0d: $3e $0d
	call Call_000_3a0c                               ; $3f0f: $cd $0c $3a
	call safeCallCommonSoundFuncs_with27h                               ; $3f12: $cd $58 $28
	jp   Jump_000_3f19                               ; $3f15: $c3 $19 $3f


jr_000_3f18:
	pop  af                                          ; $3f18: $f1

Jump_000_3f19:
	pop  af                                          ; $3f19: $f1
	ld   c, a                                        ; $3f1a: $4f
	ld   b, $00                                      ; $3f1b: $06 $00

jr_000_3f1d:
	jp   Jump_000_3e3f                               ; $3f1d: $c3 $3f $3e


Jump_000_3f20:
	ld   hl, $c669                                   ; $3f20: $21 $69 $c6
	add  hl, bc                                      ; $3f23: $09
	ld   a, (hl)                                     ; $3f24: $7e
	cp   $00                                         ; $3f25: $fe $00
	jr   z, Jump_000_3eb2                              ; $3f27: $28 $89

	ld   hl, $c669                                   ; $3f29: $21 $69 $c6
	add  hl, bc                                      ; $3f2c: $09
	dec  (hl)                                        ; $3f2d: $35
	ld   a, $03                                      ; $3f2e: $3e $03
	ld   hl, $c093                                   ; $3f30: $21 $93 $c0
	ld   (hl), a                                     ; $3f33: $77
	call Call_000_3d05                               ; $3f34: $cd $05 $3d
	ld   hl, $c66f                                   ; $3f37: $21 $6f $c6
	add  hl, bc                                      ; $3f3a: $09
	dec  (hl)                                        ; $3f3b: $35
	jr   nz, jr_000_3f1d                             ; $3f3c: $20 $df

	jp   Jump_000_3eb2                               ; $3f3e: $c3 $b2 $3e


func_3f41:
	call getTilePlayerIsOn                               ; func_3f41: $cd $ed $3f
	cp   $10                                         ; $3f44: $fe $10
	jr   c, jr_000_3f4a                              ; $3f46: $38 $02

	scf                                              ; $3f48: $37
	ret                                              ; $3f49: $c9


jr_000_3f4a:
	push bc                                          ; $3f4a: $c5
	ld   hl, $c00c                                   ; $3f4b: $21 $0c $c0
	ld   (hl), c                                     ; $3f4e: $71
	ld   hl, $c00d                                   ; $3f4f: $21 $0d $c0
	ld   (hl), e                                     ; $3f52: $73
	ld   bc, $0000                                   ; $3f53: $01 $00 $00

Jump_000_3f56:
	ld   hl, $c660                                   ; $3f56: $21 $60 $c6
	add  hl, bc                                      ; $3f59: $09
	ld   a, (hl)                                     ; $3f5a: $7e
	cp   $00                                         ; $3f5b: $fe $00
	jp   z, Jump_000_3fe2                            ; $3f5d: $ca $e2 $3f

	cp   $18                                         ; $3f60: $fe $18
	jp   c, Jump_000_3fe2                            ; $3f62: $da $e2 $3f

	ld   hl, $c66c                                   ; $3f65: $21 $6c $c6
	add  hl, bc                                      ; $3f68: $09
	ld   a, (hl)                                     ; $3f69: $7e
	cp   $06                                         ; $3f6a: $fe $06
	jr   z, jr_000_3fd4                              ; $3f6c: $28 $66

	jr   c, jr_000_3fa1                              ; $3f6e: $38 $31

	ld   hl, $c672                                   ; $3f70: $21 $72 $c6
	add  hl, bc                                      ; $3f73: $09
	ld   a, (hl)                                     ; $3f74: $7e
	ld   hl, $c00c                                   ; $3f75: $21 $0c $c0
	cp   (hl)                                        ; $3f78: $be
	jr   nz, jr_000_3f89                             ; $3f79: $20 $0e

	ld   hl, $c675                                   ; $3f7b: $21 $75 $c6
	add  hl, bc                                      ; $3f7e: $09
	ld   a, (hl)                                     ; $3f7f: $7e

Jump_000_3f80:
	ld   hl, $c00d                                   ; $3f80: $21 $0d $c0
	cp   (hl)                                        ; $3f83: $be
	jr   nz, Jump_000_3fe2                             ; $3f84: $20 $5c

	jp   Jump_000_3fb7                               ; $3f86: $c3 $b7 $3f


jr_000_3f89:
	sub  $01                                         ; $3f89: $d6 $01
	ld   hl, $c00c                                   ; $3f8b: $21 $0c $c0
	cp   (hl)                                        ; $3f8e: $be
	jr   nz, Jump_000_3fe2                             ; $3f8f: $20 $51

	ld   hl, $c675                                   ; $3f91: $21 $75 $c6
	add  hl, bc                                      ; $3f94: $09
	ld   a, (hl)                                     ; $3f95: $7e
	ld   hl, $c00d                                   ; $3f96: $21 $0d $c0
	cp   (hl)                                        ; $3f99: $be
	jr   z, Jump_000_3fb7                              ; $3f9a: $28 $1b

	add  $01                                         ; $3f9c: $c6 $01
	jp   Jump_000_3f80                               ; $3f9e: $c3 $80 $3f


jr_000_3fa1:
	ld   hl, $c672                                   ; $3fa1: $21 $72 $c6
	add  hl, bc                                      ; $3fa4: $09
	ld   a, (hl)                                     ; $3fa5: $7e
	ld   hl, $c00c                                   ; $3fa6: $21 $0c $c0
	cp   (hl)                                        ; $3fa9: $be
	jr   nz, jr_000_3fbc                             ; $3faa: $20 $10

	ld   hl, $c675                                   ; $3fac: $21 $75 $c6
	add  hl, bc                                      ; $3faf: $09
	ld   a, (hl)                                     ; $3fb0: $7e

Jump_000_3fb1:
	ld   hl, $c00d                                   ; $3fb1: $21 $0d $c0
	cp   (hl)                                        ; $3fb4: $be
	jr   nz, Jump_000_3fe2                             ; $3fb5: $20 $2b

Jump_000_3fb7:
	pop  bc                                          ; $3fb7: $c1
	ld   a, $26                                      ; $3fb8: $3e $26
	scf                                              ; $3fba: $37
	ret                                              ; $3fbb: $c9


jr_000_3fbc:
	add  $01                                         ; $3fbc: $c6 $01
	ld   hl, $c00c                                   ; $3fbe: $21 $0c $c0
	cp   (hl)                                        ; $3fc1: $be
	jr   nz, Jump_000_3fe2                             ; $3fc2: $20 $1e

Jump_000_3fc4:
	ld   hl, $c675                                   ; $3fc4: $21 $75 $c6
	add  hl, bc                                      ; $3fc7: $09
	ld   a, (hl)                                     ; $3fc8: $7e
	ld   hl, $c00d                                   ; $3fc9: $21 $0d $c0
	cp   (hl)                                        ; $3fcc: $be
	jr   z, Jump_000_3fb7                              ; $3fcd: $28 $e8

	add  $01                                         ; $3fcf: $c6 $01
	jp   Jump_000_3fb1                               ; $3fd1: $c3 $b1 $3f


jr_000_3fd4:
	ld   hl, $c672                                   ; $3fd4: $21 $72 $c6
	add  hl, bc                                      ; $3fd7: $09
	ld   a, (hl)                                     ; $3fd8: $7e
	ld   hl, $c00c                                   ; $3fd9: $21 $0c $c0
	cp   (hl)                                        ; $3fdc: $be
	jr   nz, Jump_000_3fe2                             ; $3fdd: $20 $03

	jp   Jump_000_3fc4                               ; $3fdf: $c3 $c4 $3f


Jump_000_3fe2:
	inc  bc                                          ; $3fe2: $03
	ld   a, c                                        ; $3fe3: $79
	cp   $03                                         ; $3fe4: $fe $03
	jp   c, Jump_000_3f56                            ; $3fe6: $da $56 $3f

	pop  bc                                          ; $3fe9: $c1
	scf                                              ; $3fea: $37
	ccf                                              ; $3feb: $3f
	ret                                              ; $3fec: $c9


// looks to be many purposes
// including returning in A the tile the player is on for collisions
getTilePlayerIsOn:
	push de
	call c028_equGameScreenTileIdx_16ePlusC                                       ; $3fee: $cd $0c $40
// c01e equals 16e+c
	ld   hl, $c01e                                   ; $3ff1: $21 $1e $c0
	ld   e, (hl)                                     ; $3ff4: $5e
	ld   d, $00                                      ; $3ff5: $16 $00
	ld   hl, w2x2tileTypes                                   ; $3ff7: $21 $00 $c3
	add  hl, de                                      ; $3ffa: $19
	push hl                                          ; $3ffb: $e5
	pop  de                                          ; $3ffc: $d1
// de is tile type
// full tile type in c0af
	ld   a, (hl)                                     ; $3ffd: $7e
	ld   hl, $c0af                                         ; $3ffe: $21
	ld   (hl), a                                     ; $4001: $77
	and  $7f                                         ; $4002: $e6 $7f

// tile type with no bit 7 in c00a/b
	ld   hl, $c00a                                   ; $4004: $21 $0a $c0
	ld   (hl), e                                     ; $4007: $73
	inc  hl                                          ; $4008: $23
	ld   (hl), d                                     ; $4009: $72
	pop  de                                          ; $400a: $d1
	ret                                              ; $400b: $c9


c028_equGameScreenTileIdx_16ePlusC:
	push af                                          ; $400c: $f5
	push bc                                          ; $400d: $c5
	call store16ePlusCin_c01e                                       ; $400e: $cd $0d $09
	ld   hl, $c01e                                   ; $4011: $21 $1e $c0
	ld   c, (hl)                                     ; $4014: $4e
	ld   b, $00                                      ; $4015: $06 $00
	ld   hl, w2x2gameScreenTiles                                   ; $4017: $21 $b0 $c3
	add  hl, bc                                      ; $401a: $09
	ld   a, (hl)                                     ; $401b: $7e
	ld   hl, $c028                                   ; $401c: $21 $28 $c0
	ld   (hl), a                                     ; $401f: $77
	pop  bc                                          ; $4020: $c1
	pop  af                                          ; $4021: $f1
	ret                                              ; $4022: $c9


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
	ld   hl, wNPCBytes_ID                                   ; $40af: $21 $30 $cb
	add  hl, bc                                      ; $40b2: $09
	ld   a, (hl)                                     ; $40b3: $7e
	cp   $ff                                         ; $40b4: $fe $ff
	jr   nz, @processNPC                             ; $40b6: $20 $17

@gotoCheckNextNPC:
	inc  bc                                          ; $40b8: $03
	ld   a, c                                        ; $40b9: $79
	cp   $0c                                         ; $40ba: $fe $0c
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
	ld   a, $1e                                      ; $41c0: $3e $1e
	sub  c                                           ; $41c2: $91
	sub  c                                           ; $41c3: $91
	call getLastUsableOamIdx_fromA                               ; $41c4: $cd $f1 $57
	call clear2spritesInOam_1stIdxedE                               ; $41c7: $cd $00 $58

	ld   hl, wNPCBytes_ID                                   ; $41ca: $21 $30 $cb
	add  hl, bc                                      ; $41cd: $09
	ld   a, (hl)                                     ; $41ce: $7e
	cp   $ff                                         ; $41cf: $fe $ff
	jp   z, @gotoCheckNextNPC                            ; $41d1: $ca $68 $42

// NPC exists at offset BC
	call getBit4ofNPCBytes_cb60                               ; $41d4: $cd $72 $73
	jp   nz, @gotoCheckNextNPC                           ; $41d7: $c2 $68 $42

	ld   hl, wNPCBytes_cbe4                                   ; $41da: $21 $e4 $cb
	add  hl, bc                                      ; $41dd: $09
	bit  1, (hl)                                     ; $41de: $cb $4e
	jp   nz, @gotoCheckNextNPC                           ; $41e0: $c2 $68 $42

	push de                                          ; $41e3: $d5
	call Call_001_738a                               ; $41e4: $cd $8a $73
	pop  de                                          ; $41e7: $d1
	ld   hl, $c007                                   ; $41e8: $21 $07 $c0
	ld   a, (hl)                                     ; $41eb: $7e
	and  $20                                         ; $41ec: $e6 $20
	jr   z, @func_420a                              ; $41ee: $28 $1a

// facing left
	ld   hl, $c006                                   ; $41f0: $21 $06 $c0
	ld   a, (hl)                                     ; $41f3: $7e
	call func_17dd                                       ; $41f4: $cd $dd $17
	bit  0, a                                        ; $41f7: $cb $47
	jr   nz, @func_4215                             ; $41f9: $20 $1a

@loop_41fb:
	ld   hl, wOam+6                                   ; $41fb: $21 $06 $c2
	add  hl, de                                      ; $41fe: $19
	ld   (hl), a                                     ; $41ff: $77
	add  $02                                         ; $4200: $c6 $02
	ld   hl, wOam+2                                   ; $4202: $21 $02 $c2
	add  hl, de                                      ; $4205: $19
	ld   (hl), a                                     ; $4206: $77
	jp   @func_4221                               ; $4207: $c3 $21 $42

@func_420a:
	ld   hl, $c006                                   ; $420a: $21 $06 $c0
	ld   a, (hl)                                     ; $420d: $7e
	call func_17dd                                       ; $420e: $cd $dd $17
	bit  0, a                                        ; $4211: $cb $47
	jr   nz, @loop_41fb                             ; $4213: $20 $e6

@func_4215:
// load tile chosen
	ld   hl, wOam+2                                   ; $4215: $21 $02 $c2
	add  hl, de                                      ; $4218: $19
	ld   (hl), a                                     ; $4219: $77
	add  $02                                         ; $421a: $c6 $02
	ld   hl, wOam+6                                   ; $421c: $21 $06 $c2
	add  hl, de                                      ; $421f: $19
	ld   (hl), a                                     ; $4220: $77

@func_4221:
	ld   hl, $c007                                   ; $4221: $21 $07 $c0
	ld   a, (hl)                                     ; $4224: $7e
	ld   hl, $c017                                   ; $4225: $21 $17 $c0
	bit  0, (hl)                                     ; $4228: $cb $46
	jr   z, +                              ; $422a: $28 $02

	xor  $20                                         ; $422c: $ee $20

+
	ld   hl, wOam+3                                   ; $422e: $21 $03 $c2
	add  hl, de                                      ; $4231: $19
	ld   (hl), a                                     ; $4232: $77
	ld   hl, wOam+7                                   ; $4233: $21 $07 $c2
	add  hl, de                                      ; $4236: $19
	ld   (hl), a                                     ; $4237: $77
	ld   hl, wNPC_xCoord                                   ; $4238: $21 $3c $cb
	add  hl, bc                                      ; $423b: $09
	ld   a, (hl)                                     ; $423c: $7e
	ld   hl, wSCXvalue                                   ; $423d: $21 $10 $cb
	sub  (hl)                                        ; $4240: $96
	add  $08                                         ; $4241: $c6 $08
	ld   hl, wOam+1                                   ; $4243: $21 $01 $c2
	add  hl, de                                      ; $4246: $19
	ld   (hl), a                                     ; $4247: $77
	add  $08                                         ; $4248: $c6 $08
	jr   nc, +                             ; $424a: $30 $02

	ld   a, $ff                                      ; $424c: $3e $ff

+
	ld   hl, wOam+5                                   ; $424e: $21 $05 $c2
	add  hl, de                                      ; $4251: $19
	ld   (hl), a                                     ; $4252: $77
	ld   hl, wNPC_yCoord                                   ; $4253: $21 $48 $cb
	add  hl, bc                                      ; $4256: $09
	ld   a, (hl)                                     ; $4257: $7e
	add  $10                                         ; $4258: $c6 $10
	ld   hl, wSCYvalue                                   ; $425a: $21 $11 $cb
	sub  (hl)                                        ; $425d: $96
	ld   hl, wOam                                   ; $425e: $21 $00 $c2
	add  hl, de                                      ; $4261: $19
	ld   (hl), a                                     ; $4262: $77
	ld   hl, wOam+4                                   ; $4263: $21 $04 $c2
	add  hl, de                                      ; $4266: $19
	ld   (hl), a                                     ; $4267: $77

@gotoCheckNextNPC:
	inc  bc                                          ; $4268: $03
	ld   a, c                                        ; $4269: $79
	cp   NUM_NPCS                                         ; $426a: $fe $0c
	jr   nc, @done                             ; $426c: $30 $03

	jp   @checkNextNPC                               ; $426e: $c3 $c0 $41

@done:
	ret                                              ; $4271: $c9


updateNPCs:
// flip c65e
	ld   hl, $c65e                                   ; $4272: $21 $5e $c6
	ld   a, (hl)                                     ; $4275: $7e
	and  $01                                         ; $4276: $e6 $01
	ld   c, a                                        ; $4278: $4f
	ld   b, $00                                      ; $4279: $06 $00
	ld   hl, $c65e                                   ; $427b: $21 $5e $c6
	inc  (hl)                                        ; $427e: $34

@checkNextNPC:
	ld   hl, wNPCBytes_ID                                   ; $427f: $21 $30 $cb
	add  hl, bc                                      ; $4282: $09
	ld   a, (hl)                                     ; $4283: $7e
	cp   $ff                                         ; $4284: $fe $ff
	jr   nz, @processNPC                             ; $4286: $20 $08

@gotoCheckNextNPC:
	inc  bc                                          ; $4288: $03
	inc  bc                                          ; $4289: $03
	ld   a, c                                        ; $428a: $79
	cp   $0c                                         ; $428b: $fe $0c
	jr   c, @checkNextNPC                              ; $428d: $38 $f0

	ret                                              ; $428f: $c9

@processNPC:
	ld   hl, wCurrNpcIdx                                   ; $4290: $21 $a6 $c0
	ld   (hl), c                                     ; $4293: $71

// transform npc if specified
	ld   hl, wNPCBytes_newID                                   ; $4294: $21 $c0 $cb
	add  hl, bc                                      ; $4297: $09
	ld   a, (hl)                                     ; $4298: $7e
	cp   $ff                                         ; $4299: $fe $ff
	jr   z, +                              ; $429b: $28 $03
	call setNPCsNewID                               ; $429d: $cd $67 $73
+

//
	call Call_001_4324                               ; $42a0: $cd $24 $43
	jr   nz, @next_42e7                             ; $42a3: $20 $42

	call getBit6ofNPCBytes_cb60                               ; $42a5: $cd $82 $73
	jr   nz, +                             ; $42a8: $20 $1a

	ld   hl, wNPCBytes_pixelsToMove                                   ; $42aa: $21 $a8 $cb
	add  hl, bc                                      ; $42ad: $09
	ld   a, (hl)                                     ; $42ae: $7e
	cp   $00                                         ; $42af: $fe $00
	jr   z, @next_42e7                              ; $42b1: $28 $34

// npc still has pixels to move
	ld   hl, wNPCBytes_cb6c                                   ; $42b3: $21 $6c $cb
	add  hl, bc                                      ; $42b6: $09
	inc  (hl)                                        ; $42b7: $34
	ld   hl, wNPCBytes_cb6c                                   ; $42b8: $21 $6c $cb
	add  hl, bc                                      ; $42bb: $09
	ld   a, (hl)                                     ; $42bc: $7e
	cp   $03                                         ; $42bd: $fe $03
	jr   nc, @next_42e0                             ; $42bf: $30 $1f

	jp   @next_42e7                               ; $42c1: $c3 $e7 $42

+
	ld   hl, wNPCBytes_cb6c                                   ; $42c4: $21 $6c $cb
	add  hl, bc                                      ; $42c7: $09
	inc  (hl)                                        ; $42c8: $34
	call Call_001_738a                               ; $42c9: $cd $8a $73
	ld   hl, $c009                                   ; $42cc: $21 $09 $c0
	ld   a, (hl)                                     ; $42cf: $7e
	cp   $02                                         ; $42d0: $fe $02
	jr   z, @next_42e0                              ; $42d2: $28 $0c

	cp   $01                                         ; $42d4: $fe $01
	jr   nz, @next_42e7                             ; $42d6: $20 $0f

	ld   hl, wNPCBytes_cb6c                                   ; $42d8: $21 $6c $cb
	add  hl, bc                                      ; $42db: $09
	dec  (hl)                                        ; $42dc: $35
	jp   @next_42e7                               ; $42dd: $c3 $e7 $42

@next_42e0:
	ld   a, $00                                      ; $42e0: $3e $00
	ld   hl, wNPCBytes_cb6c                                   ; $42e2: $21 $6c $cb
	add  hl, bc                                      ; $42e5: $09
	ld   (hl), a                                     ; $42e6: $77

@next_42e7:
-
// if cb78 or cba8 are non-zero, before or after executing opcodes
// jump to their relevant function
	ld   hl, wNPCBytes_timeToWait                                   ; $42e7: $21 $78 $cb
	add  hl, bc                                      ; $42ea: $09
	ld   a, (hl)                                     ; $42eb: $7e
	cp   $00                                         ; $42ec: $fe $00
	jr   nz, @needToWait                             ; $42ee: $20 $24

	ld   hl, wNPCBytes_pixelsToMove                                   ; $42f0: $21 $a8 $cb
	add  hl, bc                                      ; $42f3: $09
	ld   a, (hl)                                     ; $42f4: $7e
	cp   $00                                         ; $42f5: $fe $00
	jr   nz, @stillHasPixelsToMove                             ; $42f7: $20 $21

	call executeNPCScriptCode                               ; $42f9: $cd $8a $62
	ld   hl, wCurrNpcIdx                                   ; $42fc: $21 $a6 $c0
	ld   c, (hl)                                     ; $42ff: $4e
	ld   b, $00                                      ; $4300: $06 $00
	ld   hl, wNPCBytes_timeToWait                                   ; $4302: $21 $78 $cb
	add  hl, bc                                      ; $4305: $09
	ld   a, (hl)                                     ; $4306: $7e
	ld   hl, wNPCBytes_pixelsToMove                                   ; $4307: $21 $a8 $cb
	add  hl, bc                                      ; $430a: $09
	or   (hl)                                        ; $430b: $b6
	jr   nz, -                             ; $430c: $20 $d9

// cb78 and cba8 are 0
	call Call_001_4346                               ; $430e: $cd $46 $43
	jp   @gotoCheckNextNPC                               ; $4311: $c3 $88 $42

@needToWait:
	call npcWaitFunc                               ; $4314: $cd $3d $43
	jp   @gotoCheckNextNPC                               ; $4317: $c3 $88 $42

@stillHasPixelsToMove:
	call npcMovePixelFunc                               ; $431a: $cd $d5 $43
	jp   @gotoCheckNextNPC                               ; $431d: $c3 $88 $42


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


Call_001_4346:
// de = (c0b2)
	ld   hl, $c0b2                                   ; $4346: $21 $b2 $c0
	ld   e, (hl)                                     ; $4349: $5e
	ld   d, $00                                      ; $434a: $16 $00

// c024 = (backwards data+de)
	ld   hl, npcBackwardsData                                   ; $434c: $21 $15 $65
	add  hl, de                                      ; $434f: $19
	ld   a, (hl)                                     ; $4350: $7e
	ld   hl, $c024                                   ; $4351: $21 $24 $c0
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
	call Call_001_4aa7                               ; $4373: $cd $a7 $4a
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
	jr   nc, jr_001_43b2                             ; $438c: $30 $24

	push af                                          ; $438e: $f5
	ld   a, c                                        ; $438f: $79
	push af                                          ; $4390: $f5
	ld   a, e                                        ; $4391: $7b
	push af                                          ; $4392: $f5
	ld   hl, wCurrNpcIdx                                   ; $4393: $21 $a6 $c0
	ld   c, (hl)                                     ; $4396: $4e
	ld   b, $00                                      ; $4397: $06 $00
	call copy8npcMetadataBytesInto_c6d0                               ; $4399: $cd $c6 $72
	ld   hl, wCommonByteCopyDestBytes+7                                   ; $439c: $21 $d7 $c6
	ld   a, (hl)                                     ; $439f: $7e
	cp   $ff                                         ; $43a0: $fe $ff
	jr   z, jr_001_43a9                              ; $43a2: $28 $05

	ld   hl, wNPCBytes_newID                                   ; $43a4: $21 $c0 $cb
	add  hl, bc                                      ; $43a7: $09
	ld   (hl), a                                     ; $43a8: $77

jr_001_43a9:
	pop  af                                          ; $43a9: $f1
	ld   e, a                                        ; $43aa: $5f
	ld   d, $00                                      ; $43ab: $16 $00
	pop  af                                          ; $43ad: $f1
	ld   c, a                                        ; $43ae: $4f
	ld   b, $00                                      ; $43af: $06 $00
	pop  af                                          ; $43b1: $f1

jr_001_43b2:
	jr   z, jr_001_43d4                              ; $43b2: $28 $20

	ld   hl, $c08b                                   ; $43b4: $21 $8b $c0
	ld   a, (hl)                                     ; $43b7: $7e
	cp   $00                                         ; $43b8: $fe $00
	jr   nz, jr_001_43d4                             ; $43ba: $20 $18

	ld   a, c                                        ; $43bc: $79
	push af                                          ; $43bd: $f5
	ld   hl, wCurrNpcIdx                                   ; $43be: $21 $a6 $c0
	ld   c, (hl)                                     ; $43c1: $4e
	ld   b, $00                                      ; $43c2: $06 $00
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

jr_001_43d4:
	ret                                              ; $43d4: $c9


npcMovePixelFunc:
// reset bit 4
	ld   hl, wNPC2ndByteLower6Bits                                   ; $43d5: $21 $84 $cb
	add  hl, bc                                      ; $43d8: $09
	ld   a, (hl)                                     ; $43d9: $7e
	and  $ef                                         ; $43da: $e6 $ef
	ld   (hl), a                                     ; $43dc: $77

// direction in c024
	and  $0f                                         ; $43dd: $e6 $0f
	ld   hl, $c024                                   ; $43df: $21 $24 $c0
	ld   (hl), a                                     ; $43e2: $77

// cb54 upper nybble into players damage taken
	ld   hl, wNPCBytes_damageAndMovementSpeed                                   ; $43e3: $21 $54 $cb
	add  hl, bc                                      ; $43e6: $09
	ld   a, (hl)                                     ; $43e7: $7e
	call aDivEqu16                                       ; $43e8: $cd $fa $07
	ld   hl, wBaseDamageTaken                                   ; $43eb: $21 $23 $c0
	ld   (hl), a                                     ; $43ee: $77

// cb54 low nybble+1 into c06e
	ld   hl, wNPCBytes_damageAndMovementSpeed                                   ; $43ef: $21 $54 $cb
	add  hl, bc                                      ; $43f2: $09
	ld   a, (hl)                                     ; $43f3: $7e
	and  $0f                                         ; $43f4: $e6 $0f
	ld   hl, $c06e                                   ; $43f6: $21 $6e $c0
	ld   (hl), a                                     ; $43f9: $77
	inc  (hl)                                        ; $43fa: $34

//
	ld   hl, wNPCBytes_cbe4                                   ; $43fb: $21 $e4 $cb
	add  hl, bc                                      ; $43fe: $09
	ld   a, (hl)                                     ; $43ff: $7e
	and  $08                                         ; $4400: $e6 $08
	jr   nz, func_4424                                     ; $4402: $20 $20

// c050 is right->2, up->4, down->8, left->1
	ld   hl, wNPC2ndByteLower6Bits                                   ; $4404: $21 $84 $cb
	add  hl, bc                                      ; $4407: $09
	ld   a, (hl)                                     ; $4408: $7e
	and  $0f                                         ; $4409: $e6 $0f
	ld   e, a                                        ; $440b: $5f
	ld   d, $00                                      ; $440c: $16 $00
	ld   hl, data_441a                                   ; $440e: $21 $1a $44
	add  hl, de                                      ; $4411: $19
	ld   a, (hl)                                     ; $4412: $7e
	ld   hl, $c050                                   ; $4413: $21 $50 $c0
	ld   (hl), a                                     ; $4416: $77
	jp   Jump_001_450e                               ; $4417: $c3 $0e $45


data_441a:
	ld   (bc), a                                     ; $441a: $02
	ld   (bc), a                                     ; $441b: $02
	ld   (bc), a                                     ; $441c: $02
	inc  b                                           ; $441d: $04
	inc  b                                           ; $441e: $04
	inc  b                                           ; $441f: $04
	ld   ($0808), sp                                 ; $4420: $08 $08 $08
	.db $01


func_4424:
	ld   de, $0001
	ld   hl, wNPC_xCoord                                   ; $4427: $21 $3c $cb
	add  hl, bc                                      ; $442a: $09
	ld   a, (hl)                                     ; $442b: $7e
	ld   hl, wPlayerX                                   ; $442c: $21 $52 $c0
	sub  (hl)                                        ; $442f: $96
	jr   nc, jr_001_4439                             ; $4430: $30 $07

	ld   de, $0002                                   ; $4432: $11 $02 $00
	xor  $ff                                         ; $4435: $ee $ff
	add  $01                                         ; $4437: $c6 $01

jr_001_4439:
	ld   hl, $c007                                   ; $4439: $21 $07 $c0
	ld   (hl), a                                     ; $443c: $77
	cp   $03                                         ; $443d: $fe $03
	jr   nc, jr_001_4444                             ; $443f: $30 $03

	ld   de, $0000                                   ; $4441: $11 $00 $00

jr_001_4444:
	ld   hl, $c050                                   ; $4444: $21 $50 $c0
	ld   (hl), e                                     ; $4447: $73
	ld   de, $0004                                   ; $4448: $11 $04 $00
	ld   hl, wNPC_yCoord                                   ; $444b: $21 $48 $cb
	add  hl, bc                                      ; $444e: $09
	ld   a, (hl)                                     ; $444f: $7e
	ld   hl, wPlayerY                                   ; $4450: $21 $54 $c0
	sub  (hl)                                        ; $4453: $96
	jr   nc, jr_001_445d                             ; $4454: $30 $07

	ld   de, $0008                                   ; $4456: $11 $08 $00
	xor  $ff                                         ; $4459: $ee $ff
	add  $01                                         ; $445b: $c6 $01

jr_001_445d:
	ld   hl, $c008                                   ; $445d: $21 $08 $c0
	ld   (hl), a                                     ; $4460: $77
	cp   $03                                         ; $4461: $fe $03
	jr   nc, jr_001_4468                             ; $4463: $30 $03

	ld   de, $0000                                   ; $4465: $11 $00 $00

jr_001_4468:
	ld   a, e                                        ; $4468: $7b
	ld   hl, $c050                                   ; $4469: $21 $50 $c0
	or   (hl)                                        ; $446c: $b6
	ld   hl, $c050                                   ; $446d: $21 $50 $c0
	ld   (hl), a                                     ; $4470: $77
	and  $03                                         ; $4471: $e6 $03
	ld   e, a                                        ; $4473: $5f
	ld   d, $00                                      ; $4474: $16 $00
	ld   hl, $c007                                   ; $4476: $21 $07 $c0
	ld   a, (hl)                                     ; $4479: $7e
	ld   hl, $c008                                   ; $447a: $21 $08 $c0
	cp   (hl)                                        ; $447d: $be
	jr   nc, jr_001_449a                             ; $447e: $30 $1a

	ld   hl, $c008                                   ; $4480: $21 $08 $c0
	ld   c, (hl)                                     ; $4483: $4e
	ld   b, $00                                      ; $4484: $06 $00
	ld   hl, $c008                                   ; $4486: $21 $08 $c0
	ld   (hl), a                                     ; $4489: $77
	ld   hl, $c050                                   ; $448a: $21 $50 $c0
	ld   a, (hl)                                     ; $448d: $7e
	and  $0c                                         ; $448e: $e6 $0c
	ld   e, a                                        ; $4490: $5f
	ld   d, $00                                      ; $4491: $16 $00
	ld   a, c                                        ; $4493: $79
	ld   hl, wCurrNpcIdx                                   ; $4494: $21 $a6 $c0
	ld   c, (hl)                                     ; $4497: $4e
	ld   b, $00                                      ; $4498: $06 $00

jr_001_449a:
	srl  a                                           ; $449a: $cb $3f
	ld   hl, $c008                                   ; $449c: $21 $08 $c0
	cp   (hl)                                        ; $449f: $be
	jr   nc, jr_001_44a5                             ; $44a0: $30 $03

	ld   de, $0000                                   ; $44a2: $11 $00 $00

jr_001_44a5:
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
	jr   nz, jr_001_44c3                             ; $44bd: $20 $04

	ld   hl, $c050                                   ; $44bf: $21 $50 $c0
	ld   a, (hl)                                     ; $44c2: $7e

jr_001_44c3:
	ld   e, a                                        ; $44c3: $5f
	ld   d, $00                                      ; $44c4: $16 $00
	ld   hl, $c65e                                   ; $44c6: $21 $5e $c6
	ld   a, (hl)                                     ; $44c9: $7e
	and  $0e                                         ; $44ca: $e6 $0e
	cp   $08                                         ; $44cc: $fe $08
	jr   nz, jr_001_44dd                             ; $44ce: $20 $0d

	call keepUpperNybbleOfNPC2ndByteLower6Bits                               ; $44d0: $cd $da $65
	ld   hl, data_44fe                                   ; $44d3: $21 $fe $44
	add  hl, de                                      ; $44d6: $19
	or   (hl)                                        ; $44d7: $b6
	ld   hl, wNPC2ndByteLower6Bits                                   ; $44d8: $21 $84 $cb
	add  hl, bc                                      ; $44db: $09
	ld   (hl), a                                     ; $44dc: $77

jr_001_44dd:
	ld   hl, $c06e                                   ; $44dd: $21 $6e $c0
	ld   a, (hl)                                     ; $44e0: $7e
	cp   $01                                         ; $44e1: $fe $01
	jr   nz, Jump_001_450e                             ; $44e3: $20 $29

	ld   hl, $c65e                                   ; $44e5: $21 $5e $c6
	ld   a, (hl)                                     ; $44e8: $7e
	and  $02                                         ; $44e9: $e6 $02
	jr   nz, Jump_001_450e                             ; $44eb: $20 $21

	ld   hl, $c050                                   ; $44ed: $21 $50 $c0
	ld   a, (hl)                                     ; $44f0: $7e
	call aDivEqu16                                       ; $44f1: $cd $fa $07
	jr   z, Jump_001_450e                              ; $44f4: $28 $18

	ld   hl, $c050                                   ; $44f6: $21 $50 $c0
	and  (hl)                                        ; $44f9: $a6
	ld   (hl), a                                     ; $44fa: $77
	jp   Jump_001_450e                               ; $44fb: $c3 $0e $45


data_44fe:
	nop                                              ; $44fe: $00
	add  hl, bc                                      ; $44ff: $09
	nop                                              ; $4500: $00
	add  hl, bc                                      ; $4501: $09
	inc  bc                                          ; $4502: $03
	add  hl, bc                                      ; $4503: $09
	nop                                              ; $4504: $00
	add  hl, bc                                      ; $4505: $09
	ld   b, $09                                      ; $4506: $06 $09
	nop                                              ; $4508: $00
	add  hl, bc                                      ; $4509: $09
	nop                                              ; $450a: $00
	add  hl, bc                                      ; $450b: $09
	nop                                              ; $450c: $00
	add  hl, bc                                      ; $450d: $09

Jump_001_450e:
	call Call_001_4562                               ; $450e: $cd $62 $45
	jr   c, @func_454e                              ; $4511: $38 $3b

	ld   hl, wNPCBytes_pixelsToMove                                   ; $4513: $21 $a8 $cb
	add  hl, bc                                      ; $4516: $09
	dec  (hl)                                        ; $4517: $35
	jr   z, @done                              ; $4518: $28 $47

	ld   hl, $c06e                                   ; $451a: $21 $6e $c0
	dec  (hl)                                        ; $451d: $35
	jr   nz, @func_4521                             ; $451e: $20 $01

	ret                                              ; $4520: $c9

@func_4521:
	ld   hl, $c050                                   ; $4521: $21 $50 $c0
	ld   a, (hl)                                     ; $4524: $7e
	call aDivEqu16                                       ; $4525: $cd $fa $07
	jr   z, Jump_001_450e                              ; $4528: $28 $e4

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
	jr   c, @func_454e                              ; $453e: $38 $0e

	ld   hl, wNPCBytes_pixelsToMove                                   ; $4540: $21 $a8 $cb
	add  hl, bc                                      ; $4543: $09
	dec  (hl)                                        ; $4544: $35
	jr   z, @done                              ; $4545: $28 $1a

	ld   hl, $c06e                                   ; $4547: $21 $6e $c0
	dec  (hl)                                        ; $454a: $35
	jr   nz, Jump_001_450e                             ; $454b: $20 $c1

	ret                                              ; $454d: $c9

@func_454e:
	ld   a, $00                                      ; $454e: $3e $00
	ld   hl, wNPCBytes_pixelsToMove                                   ; $4550: $21 $a8 $cb
	add  hl, bc                                      ; $4553: $09
	ld   (hl), a                                     ; $4554: $77
	ld   hl, wNPC2ndByteLower6Bits                                   ; $4555: $21 $84 $cb
	add  hl, bc                                      ; $4558: $09
	ld   a, (hl)                                     ; $4559: $7e
	or   $10                                         ; $455a: $f6 $10
	ld   hl, wNPC2ndByteLower6Bits                                   ; $455c: $21 $84 $cb
	add  hl, bc                                      ; $455f: $09
	ld   (hl), a                                     ; $4560: $77

@done:
	ret                                              ; $4561: $c9


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


Call_001_45cf:
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
	ld   hl, $c04a                                   ; $45e3: $21 $4a $c0
	cp   (hl)                                        ; $45e6: $be
	jr   z, +                              ; $45e7: $28 $02

	jr   nc, ++                             ; $45e9: $30 $0b

+
	call getTilePlayerIsOn                                       ; $45eb: $cd $ed $3f
	call Call_001_45cf                               ; $45ee: $cd $cf $45
	jr   c, @retCFset                              ; $45f1: $38 $21

	jp   @retCFunset                               ; $45f3: $c3 $11 $46

++
	call getTilePlayerIsOn                                       ; $45f6: $cd $ed $3f
	call Call_001_45cf                               ; $45f9: $cd $cf $45
	jr   nc, +                             ; $45fc: $30 $0a

	inc  de                                          ; $45fe: $13
	call getTilePlayerIsOn                                       ; $45ff: $cd $ed $3f
	call Call_001_45cf                               ; $4602: $cd $cf $45
	jp   @retCFset                               ; $4605: $c3 $14 $46

+
	inc  de                                          ; $4608: $13
	call getTilePlayerIsOn                                       ; $4609: $cd $ed $3f
	call Call_001_45cf                               ; $460c: $cd $cf $45
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

	call getTilePlayerIsOn                                       ; $462a: $cd $ed $3f
	call Call_001_45cf                               ; $462d: $cd $cf $45
	jr   c, @retCFset                              ; $4630: $38 $21

	jp   @retCFunset                               ; $4632: $c3 $50 $46

+
	call getTilePlayerIsOn                                       ; $4635: $cd $ed $3f
	call Call_001_45cf                               ; $4638: $cd $cf $45
	jr   nc, +                             ; $463b: $30 $0a

	inc  bc                                          ; $463d: $03
	call getTilePlayerIsOn                                       ; $463e: $cd $ed $3f
	call Call_001_45cf                               ; $4641: $cd $cf $45
	jp   @retCFset                               ; $4644: $c3 $53 $46

+
	inc  bc                                          ; $4647: $03
	call getTilePlayerIsOn                                       ; $4648: $cd $ed $3f
	call Call_001_45cf                               ; $464b: $cd $cf $45
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
	call Call_001_4aa7                               ; $4670: $cd $a7 $4a
	call Call_001_438c                               ; $4673: $cd $8c $43
	pop  af                                          ; $4676: $f1
	jr   nz, jr_001_46a3                             ; $4677: $20 $2a

	call deEquEplusValIn_c04a                               ; $4679: $cd $bb $46
	call splitCEintoItsNybbles                               ; $467c: $cd $1c $55
	call Call_001_45d3                               ; $467f: $cd $d3 $45
	jr   c, jr_001_46b2                              ; $4682: $38 $2e

	ld   hl, wCurrNpcIdx                                   ; $4684: $21 $a6 $c0
	ld   c, (hl)                                     ; $4687: $4e
	ld   b, $00                                      ; $4688: $06 $00
	call Call_001_46b4                               ; $468a: $cd $b4 $46
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


Call_001_46b4:
	ld   hl, wNPC_yCoord                                   ; $46b4: $21 $48 $cb
	add  hl, bc                                      ; $46b7: $09
	ld   e, (hl)                                     ; $46b8: $5e
	ld   d, $00                                      ; $46b9: $16 $00

deEquEplusValIn_c04a:
	ld   a, e                                        ; $46bb: $7b
	ld   hl, $c04a                                   ; $46bc: $21 $4a $c0
	add  (hl)                                        ; $46bf: $86
	ld   e, a                                        ; $46c0: $5f
	ld   d, $00                                      ; $46c1: $16 $00
	ret                                              ; $46c3: $c9


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
	call Call_001_4aa7                               ; $46df: $cd $a7 $4a
	call Call_001_438c                               ; $46e2: $cd $8c $43
	pop  af                                          ; $46e5: $f1
	jr   nz, jr_001_4719                             ; $46e6: $20 $31

	ld   a, c                                        ; $46e8: $79
	add  $0f                                         ; $46e9: $c6 $0f
	ld   c, a                                        ; $46eb: $4f
	ld   b, $00                                      ; $46ec: $06 $00
	call deEquEplusValIn_c04a                               ; $46ee: $cd $bb $46
	call splitCEintoItsNybbles                               ; $46f1: $cd $1c $55
	call Call_001_45d3                               ; $46f4: $cd $d3 $45
	jr   c, jr_001_4728                              ; $46f7: $38 $2f

	ld   hl, wCurrNpcIdx                                   ; $46f9: $21 $a6 $c0
	ld   c, (hl)                                     ; $46fc: $4e
	ld   b, $00                                      ; $46fd: $06 $00
	call Call_001_46b4                               ; $46ff: $cd $b4 $46
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
	call Call_001_4aa7                               ; $4746: $cd $a7 $4a
	call Call_001_438c                               ; $4749: $cd $8c $43
	pop  af                                          ; $474c: $f1
	jr   nz, jr_001_4779                             ; $474d: $20 $2a

	call deEquEplusValIn_c04a                               ; $474f: $cd $bb $46
	call splitCEintoItsNybbles                               ; $4752: $cd $1c $55
	call Call_001_4616                               ; $4755: $cd $16 $46
	jr   c, jr_001_4788                              ; $4758: $38 $2e

	ld   hl, wCurrNpcIdx                                   ; $475a: $21 $a6 $c0
	ld   c, (hl)                                     ; $475d: $4e
	ld   b, $00                                      ; $475e: $06 $00
	call Call_001_46b4                               ; $4760: $cd $b4 $46
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
	call Call_001_4aa7                               ; $47a6: $cd $a7 $4a
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
	call Call_001_46b4                               ; $47c3: $cd $b4 $46
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
	call Call_001_4aa7                               ; $480a: $cd $a7 $4a
	call Call_001_438c                               ; $480d: $cd $8c $43
	call deEquEplusValIn_c04a                               ; $4810: $cd $bb $46
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
	call Call_001_46b4                               ; $482b: $cd $b4 $46
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
	call Call_001_4aa7                               ; $485f: $cd $a7 $4a
	call Call_001_438c                               ; $4862: $cd $8c $43
	ld   a, c                                        ; $4865: $79
	add  $0f                                         ; $4866: $c6 $0f
	ld   c, a                                        ; $4868: $4f
	ld   b, $00                                      ; $4869: $06 $00
	call deEquEplusValIn_c04a                               ; $486b: $cd $bb $46
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
	call Call_001_46b4                               ; $4888: $cd $b4 $46
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


clear_c094_c095:
	ld   hl, wRandomNumberTableIdx                                   ; $48a6: $21 $94 $c0
	ld   (hl), $00                                   ; $48a9: $36 $00
	ld   hl, wRandomNumberTableIdx+1                                   ; $48ab: $21 $95 $c0
	ld   (hl), $00                                   ; $48ae: $36 $00
	ret                                              ; $48b0: $c9


;;
	ret                                              ; $48b1: $c9


getNextRandomNumber:
// c0a1 is bank
	ld   hl, wCommonByteCopyFuncBank                                   ; $48b2: $21 $a1 $c0
	ld   (hl), :randomNumberTable                                   ; $48b5: $36 $06

// number of bytes
	ld   hl, wCommonByteCopyFuncNumBytes                                   ; $48b7: $21 $a0 $c0
	ld   (hl), $01                                   ; $48ba: $36 $01

// get next number
	ld   hl, wRandomNumberTableIdx                                   ; $48bc: $21 $94 $c0
	ld   e, (hl)                                     ; $48bf: $5e
	ld   hl, wRandomNumberTableIdx+1                                   ; $48c0: $21 $95 $c0
	ld   d, (hl)                                     ; $48c3: $56
	inc  de                                          ; $48c4: $13

// loop $400 bytes from 094b to 0d4a
	bit  2, d                                        ; $48c5: $cb $52
	jr   z, +                              ; $48c7: $28 $03
	ld   de, $0000                                   ; $48c9: $11 $00 $00
+
	ld   (hl), d                                     ; $48cc: $72
	ld   hl, wRandomNumberTableIdx                                   ; $48cd: $21 $94 $c0
	ld   (hl), e                                     ; $48d0: $73

//
	ld   hl, randomNumberTable                                   ; $48d1: $21 $4b $09
	add  hl, de                                      ; $48d4: $19
	push hl                                          ; $48d5: $e5
	pop  de                                          ; $48d6: $d1

// copy from offset in randomNumberTable
	ld   hl, wCommonByteCopyFuncSrc                                   ; $48d7: $21 $9a $c0
	ld   (hl), e                                     ; $48da: $73
	ld   hl, wCommonByteCopyFuncSrc+1                                   ; $48db: $21 $9b $c0
	ld   (hl), d                                     ; $48de: $72

// copy bytes
	call copyBytesFromAnotherBankInto_c6d0                                       ; $48df: $cd $24 $02

// c096 is the byte copied
	ld   hl, wCommonByteCopyDestBytes                                   ; $48e2: $21 $d0 $c6
	ld   a, (hl)                                     ; $48e5: $7e
	ld   hl, wRandomNumber                                   ; $48e6: $21 $96 $c0
	ld   (hl), a                                     ; $48e9: $77
	ret                                              ; $48ea: $c9


;;
	ret                                              ; $48eb: $c9


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

	call getTilePlayerIsOn                                       ; $4926: $cd $ed $3f
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
	call Call_001_4a0c                               ; $4988: $cd $0c $4a
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
	call Call_001_4a0c                               ; $49d1: $cd $0c $4a
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
	call Call_001_4a0c                               ; $4a01: $cd $0c $4a
	jr   c, @cfCall4a0c                              ; $4a04: $38 $03

	jp   @func_4935                               ; $4a06: $c3 $35 $49

@cfCall4a0c:
	jp   @done                               ; $4a09: $c3 $49 $49


Call_001_4a0c:
	ld   hl, $c00c                                   ; $4a0c: $21 $0c $c0
	ld   (hl), a                                     ; $4a0f: $77
	ld   a, c                                        ; $4a10: $79
	push af                                          ; $4a11: $f5
	ld   bc, $0000                                   ; $4a12: $01 $00 $00

jr_001_4a15:
	ld   hl, $c660                                   ; $4a15: $21 $60 $c6
	add  hl, bc                                      ; $4a18: $09
	ld   a, (hl)                                     ; $4a19: $7e
	cp   $00                                         ; $4a1a: $fe $00
	jr   z, jr_001_4a2a                              ; $4a1c: $28 $0c

	inc  bc                                          ; $4a1e: $03
	ld   a, c                                        ; $4a1f: $79
	cp   $03                                         ; $4a20: $fe $03
	jr   c, jr_001_4a15                              ; $4a22: $38 $f1

	pop  af                                          ; $4a24: $f1
	ld   c, a                                        ; $4a25: $4f
	ld   b, $00                                      ; $4a26: $06 $00
	scf                                              ; $4a28: $37
	ret                                              ; $4a29: $c9


jr_001_4a2a:
	ld   hl, $c00c                                   ; $4a2a: $21 $0c $c0
	ld   a, (hl)                                     ; $4a2d: $7e
	ld   hl, $c660                                   ; $4a2e: $21 $60 $c6
	add  hl, bc                                      ; $4a31: $09
	ld   (hl), a                                     ; $4a32: $77
	pop  af                                          ; $4a33: $f1
	ld   hl, $c00c                                   ; $4a34: $21 $0c $c0
	ld   (hl), a                                     ; $4a37: $77
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
	ld   c, a                                        ; $4a4a: $4f
	ld   b, $00                                      ; $4a4b: $06 $00
	ld   hl, w2x2gameScreenTiles                                   ; $4a4d: $21 $b0 $c3
	add  hl, bc                                      ; $4a50: $09
	ld   a, (hl)                                     ; $4a51: $7e
	ld   hl, $c00c                                   ; $4a52: $21 $0c $c0
	ld   c, (hl)                                     ; $4a55: $4e
	ld   b, $00                                      ; $4a56: $06 $00
	ld   hl, $c666                                   ; $4a58: $21 $66 $c6
	add  hl, bc                                      ; $4a5b: $09
	ld   (hl), a                                     ; $4a5c: $77
	pop  af                                          ; $4a5d: $f1
	push af                                          ; $4a5e: $f5
	sla  a                                           ; $4a5f: $cb $27
	sla  a                                           ; $4a61: $cb $27
	sla  a                                           ; $4a63: $cb $27
	sla  a                                           ; $4a65: $cb $27
	ld   hl, $c663                                   ; $4a67: $21 $63 $c6
	add  hl, bc                                      ; $4a6a: $09
	ld   (hl), a                                     ; $4a6b: $77
	ld   a, e                                        ; $4a6c: $7b
	sla  a                                           ; $4a6d: $cb $27
	sla  a                                           ; $4a6f: $cb $27
	sla  a                                           ; $4a71: $cb $27
	sla  a                                           ; $4a73: $cb $27
	ld   hl, $c669                                   ; $4a75: $21 $69 $c6
	add  hl, bc                                      ; $4a78: $09
	ld   (hl), a                                     ; $4a79: $77
	ld   hl, $c00d                                   ; $4a7a: $21 $0d $c0
	ld   a, (hl)                                     ; $4a7d: $7e
	ld   hl, $c66c                                   ; $4a7e: $21 $6c $c6
	add  hl, bc                                      ; $4a81: $09
	ld   (hl), a                                     ; $4a82: $77
	ld   a, $10                                      ; $4a83: $3e $10
	ld   hl, $c66f                                   ; $4a85: $21 $6f $c6
	add  hl, bc                                      ; $4a88: $09
	ld   (hl), a                                     ; $4a89: $77
	ld   a, e                                        ; $4a8a: $7b
	ld   hl, $c675                                   ; $4a8b: $21 $75 $c6
	add  hl, bc                                      ; $4a8e: $09
	ld   (hl), a                                     ; $4a8f: $77
	pop  af                                          ; $4a90: $f1
	ld   hl, $c672                                   ; $4a91: $21 $72 $c6
	add  hl, bc                                      ; $4a94: $09
	ld   (hl), a                                     ; $4a95: $77
	ld   c, a                                        ; $4a96: $4f
	ld   b, $00                                      ; $4a97: $06 $00
	call getTilePlayerIsOn                                       ; $4a99: $cd $ed $3f
	call Call_000_078b                                       ; $4a9c: $cd $8b $07
	ld   a, $00                                      ; $4a9f: $3e $00
	call Call_001_58f4                               ; $4aa1: $cd $f4 $58
	scf                                              ; $4aa4: $37
	ccf                                              ; $4aa5: $3f
	ret                                              ; $4aa6: $c9


Call_001_4aa7:
	push de                                          ; $4aa7: $d5
	ld   a, e                                        ; $4aa8: $7b
	sub  $0c                                         ; $4aa9: $d6 $0c
	jr   nc, +                             ; $4aab: $30 $02

	ld   a, $00                                      ; $4aad: $3e $00

+
	ld   hl, $c0a7                                   ; $4aaf: $21 $a7 $c0
	ld   (hl), a                                     ; $4ab2: $77
	ld   a, e                                        ; $4ab3: $7b
	add  $0b                                         ; $4ab4: $c6 $0b
	ld   hl, $c0a8                                   ; $4ab6: $21 $a8 $c0
	ld   (hl), a                                     ; $4ab9: $77
	push bc                                          ; $4aba: $c5
	ld   a, c                                        ; $4abb: $79
	sub  $0c                                         ; $4abc: $d6 $0c
	jr   nc, +                             ; $4abe: $30 $02

	ld   a, $00                                      ; $4ac0: $3e $00

+
	ld   hl, $c0a9                                   ; $4ac2: $21 $a9 $c0
	ld   (hl), a                                     ; $4ac5: $77
	ld   a, c                                        ; $4ac6: $79
	add  $0b                                         ; $4ac7: $c6 $0b
	jr   nc, +                             ; $4ac9: $30 $02

	ld   a, $ff                                      ; $4acb: $3e $ff

+
	ld   hl, $c0aa                                   ; $4acd: $21 $aa $c0
	ld   (hl), a                                     ; $4ad0: $77
	ld   hl, wPlayerY                                   ; $4ad1: $21 $54 $c0
	ld   a, (hl)                                     ; $4ad4: $7e
	ld   hl, $c0a7                                   ; $4ad5: $21 $a7 $c0
	cp   (hl)                                        ; $4ad8: $be
	jr   c, jr_001_4b2c                              ; $4ad9: $38 $51

	ld   hl, $c0a8                                   ; $4adb: $21 $a8 $c0
	cp   (hl)                                        ; $4ade: $be
	jr   nc, jr_001_4b2c                             ; $4adf: $30 $4b

	ld   hl, wPlayerX                                   ; $4ae1: $21 $52 $c0
	ld   a, (hl)                                     ; $4ae4: $7e
	ld   hl, $c0a9                                   ; $4ae5: $21 $a9 $c0
	cp   (hl)                                        ; $4ae8: $be
	jr   c, jr_001_4b2c                              ; $4ae9: $38 $41

	ld   hl, wPlayerX                                   ; $4aeb: $21 $52 $c0
	ld   a, (hl)                                     ; $4aee: $7e
	ld   hl, $c0aa                                   ; $4aef: $21 $aa $c0
	cp   (hl)                                        ; $4af2: $be
	jr   nc, jr_001_4b2c                             ; $4af3: $30 $37

	ld   hl, wBaseDamageTaken                                   ; $4af5: $21 $23 $c0
	ld   a, (hl)                                     ; $4af8: $7e
	cp   $00                                         ; $4af9: $fe $00
	jr   nz, jr_001_4b22                             ; $4afb: $20 $25

	scf                                              ; $4afd: $37
	ccf                                              ; $4afe: $3f
	ld   hl, $c044                                   ; $4aff: $21 $44 $c0
	ld   a, (hl)                                     ; $4b02: $7e
	cp   $00                                         ; $4b03: $fe $00
	jr   z, Jump_001_4b26                              ; $4b05: $28 $1f

	ld   hl, $c027                                   ; $4b07: $21 $27 $c0
	ld   a, (hl)                                     ; $4b0a: $7e
	cp   $00                                         ; $4b0b: $fe $00
	jr   nz, Jump_001_4b26                             ; $4b0d: $20 $17

	ld   hl, $c024                                   ; $4b0f: $21 $24 $c0
	ld   a, (hl)                                     ; $4b12: $7e
	ld   hl, $c026                                   ; $4b13: $21 $26 $c0
	ld   (hl), a                                     ; $4b16: $77
	ld   a, $02                                      ; $4b17: $3e $02
	ld   hl, $c027                                   ; $4b19: $21 $27 $c0
	ld   (hl), a                                     ; $4b1c: $77
	scf                                              ; $4b1d: $37
	ccf                                              ; $4b1e: $3f
	jp   Jump_001_4b26                               ; $4b1f: $c3 $26 $4b


jr_001_4b22:
	call playerTakeDamage                                       ; $4b22: $cd $75 $28
	scf                                              ; $4b25: $37

Jump_001_4b26:
	pop  bc                                          ; $4b26: $c1
	pop  de                                          ; $4b27: $d1
	ld   a, $ff                                      ; $4b28: $3e $ff
	or   a                                           ; $4b2a: $b7
	ret                                              ; $4b2b: $c9


jr_001_4b2c:
	pop  bc                                          ; $4b2c: $c1
	pop  de                                          ; $4b2d: $d1
	ld   a, $00                                      ; $4b2e: $3e $00
	or   a                                           ; $4b30: $b7
	scf                                              ; $4b31: $37
	ccf                                              ; $4b32: $3f
	ret                                              ; $4b33: $c9


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
	ld   hl, $c660                                   ; $4b81: $21 $60 $c6
	add  hl, bc                                      ; $4b84: $09
	ld   a, (hl)                                     ; $4b85: $7e
	cp   $00                                         ; $4b86: $fe $00
	jr   z, Jump_001_4bb1                              ; $4b88: $28 $27

	ld   hl, $c669                                   ; $4b8a: $21 $69 $c6
	add  hl, bc                                      ; $4b8d: $09
	ld   a, (hl)                                     ; $4b8e: $7e
	ld   hl, $c0a7                                   ; $4b8f: $21 $a7 $c0
	cp   (hl)                                        ; $4b92: $be
	jr   c, Jump_001_4bb1                              ; $4b93: $38 $1c

	ld   hl, $c0a8                                   ; $4b95: $21 $a8 $c0
	cp   (hl)                                        ; $4b98: $be
	jr   nc, Jump_001_4bb1                             ; $4b99: $30 $16

	ld   hl, $c663                                   ; $4b9b: $21 $63 $c6
	add  hl, bc                                      ; $4b9e: $09
	ld   a, (hl)                                     ; $4b9f: $7e
	ld   hl, $c0a9                                   ; $4ba0: $21 $a9 $c0
	cp   (hl)                                        ; $4ba3: $be
	jr   c, Jump_001_4bb1                              ; $4ba4: $38 $0b

	ld   hl, $c663                                   ; $4ba6: $21 $63 $c6
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
	ld   hl, $c669                                   ; $4bba: $21 $69 $c6
	add  hl, bc                                      ; $4bbd: $09
	ld   a, (hl)                                     ; $4bbe: $7e
	ld   hl, $c0ab                                   ; $4bbf: $21 $ab $c0
	cp   (hl)                                        ; $4bc2: $be
	jr   c, jr_001_4bd1                              ; $4bc3: $38 $0c

	ld   hl, $c0ac                                   ; $4bc5: $21 $ac $c0
	cp   (hl)                                        ; $4bc8: $be
	jr   nc, jr_001_4bd1                             ; $4bc9: $30 $06

jr_001_4bcb:
	ld   hl, $c660                                   ; $4bcb: $21 $60 $c6
	add  hl, bc                                      ; $4bce: $09
	ld   a, (hl)                                     ; $4bcf: $7e
	ret                                              ; $4bd0: $c9


jr_001_4bd1:
	ld   hl, $c663                                   ; $4bd1: $21 $63 $c6
	add  hl, bc                                      ; $4bd4: $09
	ld   a, (hl)                                     ; $4bd5: $7e
	ld   hl, $c0ad                                   ; $4bd6: $21 $ad $c0
	cp   (hl)                                        ; $4bd9: $be
	jr   c, Jump_001_4bb1                              ; $4bda: $38 $d5

	ld   hl, $c663                                   ; $4bdc: $21 $63 $c6
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
	ld   hl, $c660                                   ; $4c1c: $21 $60 $c6
	add  hl, bc                                      ; $4c1f: $09
	ld   a, (hl)                                     ; $4c20: $7e
	cp   $00                                         ; $4c21: $fe $00
	jr   z, jr_001_4c4c                              ; $4c23: $28 $27

	ld   hl, $c669                                   ; $4c25: $21 $69 $c6
	add  hl, bc                                      ; $4c28: $09
	ld   a, (hl)                                     ; $4c29: $7e
	ld   hl, $c0a7                                   ; $4c2a: $21 $a7 $c0
	cp   (hl)                                        ; $4c2d: $be
	jr   c, jr_001_4c4c                              ; $4c2e: $38 $1c

	ld   hl, $c0a8                                   ; $4c30: $21 $a8 $c0
	cp   (hl)                                        ; $4c33: $be
	jr   nc, jr_001_4c4c                             ; $4c34: $30 $16

	ld   hl, $c663                                   ; $4c36: $21 $63 $c6
	add  hl, bc                                      ; $4c39: $09
	ld   a, (hl)                                     ; $4c3a: $7e
	ld   hl, $c0a9                                   ; $4c3b: $21 $a9 $c0
	cp   (hl)                                        ; $4c3e: $be
	jr   c, jr_001_4c4c                              ; $4c3f: $38 $0b

	ld   hl, $c663                                   ; $4c41: $21 $63 $c6
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
	ld   hl, $c660                                   ; $4c55: $21 $60 $c6
	add  hl, bc                                      ; $4c58: $09
	ld   a, (hl)                                     ; $4c59: $7e
	ret                                              ; $4c5a: $c9


checkTransitioningToLeftScreen:
	ld   hl, wPlayerX                                   ; $4c5b: $21 $52 $c0
	ld   a, (hl)                                     ; $4c5e: $7e
	cp   $00                                         ; $4c5f: $fe $00
	jr   nz, jr_001_4c79                             ; $4c61: $20 $16

	ld   hl, wPlayerOamAttr                                   ; $4c63: $21 $55 $c0
	ld   a, (hl)                                     ; $4c66: $7e
	or   $20                                         ; $4c67: $f6 $20
	ld   hl, wPlayerOamAttr                                   ; $4c69: $21 $55 $c0
	ld   (hl), a                                     ; $4c6c: $77
	ld   a, $40                                      ; $4c6d: $3e $40
	ld   hl, $c056                                   ; $4c6f: $21 $56 $c0
	ld   (hl), a                                     ; $4c72: $77

// transitioning to left
	ld   bc, $0009                                   ; $4c73: $01 $09 $00
	jp   _screenTransition                               ; $4c76: $c3 $87 $4e

jr_001_4c79:
	ld   hl, wPlayerX                                   ; $4c79: $21 $52 $c0
	ld   c, (hl)                                     ; $4c7c: $4e
	ld   b, $00                                      ; $4c7d: $06 $00
	dec  bc                                          ; $4c7f: $0b
	call deEquPlayerYplus_c04a                                       ; $4c80: $cd $40 $2b
	call splitCEintoItsNybbles                               ; $4c83: $cd $1c $55
	ld   a, $00                                      ; $4c86: $3e $00
	ld   hl, $c088                                   ; $4c88: $21 $88 $c0
	ld   (hl), a                                     ; $4c8b: $77
	ld   hl, $c089                                   ; $4c8c: $21 $89 $c0
	ld   (hl), a                                     ; $4c8f: $77
	ld   hl, $c08a                                   ; $4c90: $21 $8a $c0
	ld   (hl), a                                     ; $4c93: $77
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
	ld   hl, $c056                                   ; $4cf2: $21 $56 $c0
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
	ld   hl, $c056                                   ; $4d65: $21 $56 $c0
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

	ld   a, $43                                      ; $4d91: $3e $43
	ld   hl, $c056                                   ; $4d93: $21 $56 $c0
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

	ld   a, $43                                      ; $4df9: $3e $43
	ld   hl, $c056                                   ; $4dfb: $21 $56 $c0
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

	ld   a, $46                                      ; $4e16: $3e $46
	ld   hl, $c056                                   ; $4e18: $21 $56 $c0
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

	ld   a, $46                                      ; $4e7e: $3e $46
	ld   hl, $c056                                   ; $4e80: $21 $56 $c0
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
	add  (hl)                                        ; $5089: $86
	jr   nc, +                             ; $508a: $30 $02
// no overflow
	ld   a, $ff                                      ; $508c: $3e $ff

+
	ld   hl, wPlayerMaxHealth                                   ; $508e: $21 $73 $c0
	cp   (hl)                                        ; $5091: $be
	jr   c, +                              ; $5092: $38 $04

	ld   hl, wPlayerMaxHealth                                   ; $5094: $21 $73 $c0
	ld   a, (hl)                                     ; $5097: $7e

+
	ld   hl, wPlayerHealth                                   ; $5098: $21 $72 $c0
	ld   (hl), a                                     ; $509b: $77
	ret                                              ; $509c: $c9


getTileCoordsPlayerIsOnAndCheckCollision:
// if bc was player x and de was player y
// c008 = player x high nybble, c009 = player y high nybble
	ld   hl, $c008                                   ; $509d: $21 $08 $c0
	ld   c, (hl)                                     ; $50a0: $4e
	ld   b, $00                                      ; $50a1: $06 $00
	ld   hl, $c009                                   ; $50a3: $21 $09 $c0
	ld   e, (hl)                                     ; $50a6: $5e
	ld   d, $00                                      ; $50a7: $16 $00

// c006 would be player x low nybble
// if > 8, consider the tile to the right of player
	ld   hl, $c006                                   ; $50a9: $21 $06 $c0
	ld   a, (hl)                                     ; $50ac: $7e
	cp   $08                                         ; $50ad: $fe $08
	jr   c, +                              ; $50af: $38 $01

	inc  bc                                          ; $50b1: $03

+
// same with c007 (player y low nybble)
	ld   hl, $c007                                   ; $50b2: $21 $07 $c0
	ld   a, (hl)                                     ; $50b5: $7e
	cp   $08                                         ; $50b6: $fe $08
	jr   c, +                              ; $50b8: $38 $01

	inc  de                                          ; $50ba: $13

+
	call processPlayerCollision                               ; $50bb: $cd $bf $50
	ret                                              ; $50be: $c9


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

	call getTilePlayerIsOn                                       ; $50dd: $cd $ed $3f
	cp   $10                                         ; $50e0: $fe $10
	jr   z, @next_50f2                              ; $50e2: $28 $0e

	cp   $11                                         ; $50e4: $fe $11
	jr   z, @next_50f2                              ; $50e6: $28 $0a

	cp   $17                                         ; $50e8: $fe $17
	jr   z, @next_50f2                              ; $50ea: $28 $06

	jp   @done                               ; $50ec: $c3 $07 $51

@func_50ef:
	call getTilePlayerIsOn                                       ; $50ef: $cd $ed $3f

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


_collisionsTable_01:
_collisionsTable_02:
_collisionsTable_10:
_collisionsTable_11:
_collisionsTable_12:
_collisionsTable_13:
_collisionsTable_17:
	ld   hl, $c05d                                   ; $5109: $21 $5d $c0
	ld   a, (hl)                                     ; $510c: $7e
	cp   $00                                         ; $510d: $fe $00
	jr   nz, _ret_5108                             ; $510f: $20 $f7

	ld   hl, wMenuCursorIdx                                   ; $5111: $21 $11 $c7
	ld   a, (hl)                                     ; $5114: $7e
	cp   $00                                         ; $5115: $fe $00
	jr   nz, _ret_5108                             ; $5117: $20 $ef

	call Call_000_39b9                                       ; $5119: $cd $b9 $39
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

// TODO: tele group is $fe - set different vars
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
	cp   $ff                                         ; $5161: $fe $ff
	jr   z, +                              ; $5163: $28 $04

// if ff, dont change group
	ld   hl, wCurrRoomGroup                                   ; $5165: $21 $33 $c0
	ld   (hl), a                                     ; $5168: $77

+
	ld   hl, wScriptTeleRoomX                                   ; $5169: $21 $bc $c0
	ld   a, (hl)                                     ; $516c: $7e
	ld   hl, wCurrRoomX                                   ; $516d: $21 $34 $c0
	ld   (hl), a                                     ; $5170: $77

	ld   hl, wScriptTeleRoomY                                   ; $5171: $21 $bd $c0
	ld   a, (hl)                                     ; $5174: $7e
	ld   hl, wCurrRoomY                                   ; $5175: $21 $35 $c0
	ld   (hl), a                                     ; $5178: $77

	ld   hl, wScriptTelePlayerX                                   ; $5179: $21 $be $c0
	ld   a, (hl)                                     ; $517c: $7e
	ld   hl, wPlayerX                                   ; $517d: $21 $52 $c0
	ld   (hl), a                                     ; $5180: $77

	ld   hl, wScriptTelePlayerY                                   ; $5181: $21 $bf $c0
	ld   a, (hl)                                     ; $5184: $7e
	ld   hl, wPlayerY                                   ; $5185: $21 $54 $c0
	ld   (hl), a                                     ; $5188: $77

	call loadRoomGroupStruct                                       ; $5189: $cd $3b $18
	ld   hl, wRoomTransitionType                                   ; $518c: $21 $3a $c0
	ld   (hl), RTT_DIFF_GROUP                                   ; $518f: $36 $0c
	ret                                              ; $5191: $c9


_collision_give7bombs:
	ld   a, $07                                      ; $5192: $3e $07

giveBombs:
// $ff is max
	ld   hl, wNumBombs                                   ; $5194: $21 $3b $c0
	add  (hl)                                        ; $5197: $86
	jr   nc, +                             ; $5198: $30 $02
	ld   a, $ff                                      ; $519a: $3e $ff
+
	ld   hl, wNumBombs                                   ; $519c: $21 $3b $c0
	ld   (hl), a                                     ; $519f: $77
//
	call func_3928                                       ; $51a0: $cd $28 $39
	call Call_001_58ea                               ; $51a3: $cd $ea $58
	call callsCommonSoundFuncs_284f                                       ; $51a6: $cd $4f $28
	ret                                              ; $51a9: $c9


_collision_give3bombs:
	ld   a, $03                                      ; $51aa: $3e $03
	jp   giveBombs                               ; $51ac: $c3 $94 $51


_collision_give1bird:
	ld   a, $01                                      ; $51af: $3e $01

giveBirds:
	push af                                          ; $51b1: $f5
	call func_3928                                       ; $51b2: $cd $28 $39
	call Call_001_58ea                               ; $51b5: $cd $ea $58
	pop  af                                          ; $51b8: $f1

// $ff is max
	ld   hl, wNumBirds                                   ; $51b9: $21 $08 $c7
	add  (hl)                                        ; $51bc: $86
	jr   nc, +                             ; $51bd: $30 $02
	ld   a, $ff                                      ; $51bf: $3e $ff
+
	ld   hl, wNumBirds                                   ; $51c1: $21 $08 $c7
	ld   (hl), a                                     ; $51c4: $77
//
	call callsCommonSoundFuncs_284f                                       ; $51c5: $cd $4f $28
	ret                                              ; $51c8: $c9


_collision_give5birds:
	ld   a, $05                                      ; $51c9: $3e $05
	jp   giveBirds                               ; $51cb: $c3 $b1 $51


_collisionsTable_07:
	call func_3928                                       ; $51ce: $cd $28 $39
	call Call_001_58ea                               ; $51d1: $cd $ea $58
	call callsCommonSoundFuncs_284f                                       ; $51d4: $cd $4f $28
	ret                                              ; $51d7: $c9


_collisionsTable_08:
	call func_3928                                       ; $51d8: $cd $28 $39
	call Call_001_58ea                               ; $51db: $cd $ea $58
	call callsCommonSoundFuncs_284f                                       ; $51de: $cd $4f $28
	ret                                              ; $51e1: $c9


data_51e2:
	ld   bc, $0000                                   ; $51e2: $01 $00 $00
	nop                                              ; $51e5: $00
	nop                                              ; $51e6: $00
	nop                                              ; $51e7: $00
	nop                                              ; $51e8: $00
	nop                                              ; $51e9: $00
	nop                                              ; $51ea: $00
	nop                                              ; $51eb: $00
	nop                                              ; $51ec: $00
	nop                                              ; $51ed: $00
	nop                                              ; $51ee: $00
	nop                                              ; $51ef: $00
	nop                                              ; $51f0: $00
	nop                                              ; $51f1: $00
	
_collision_giveArmorOfGod:
	call func_3928                                       ; $51f2: $cd $28 $39
	call Call_001_58ea                               ; $51f5: $cd $ea $58
	call bcEquTilesetIdxDiv2                               ; $51f8: $cd $36 $52
	ld   hl, data_51e2                                   ; $51fb: $21 $e2 $51
	add  hl, bc                                      ; $51fe: $09
	ld   a, (hl)                                     ; $51ff: $7e
	ld   hl, wArmorOfGodGotten                                   ; $5200: $21 $52 $c6
	or   (hl)                                        ; $5203: $b6
	ld   hl, wArmorOfGodGotten                                   ; $5204: $21 $52 $c6
	ld   (hl), a                                     ; $5207: $77
	call callsCommonSoundFuncs_284f                                       ; $5208: $cd $4f $28
	ret                                              ; $520b: $c9


data_520c:
	ld   bc, $0000                                   ; $520c: $01 $00 $00
	nop                                              ; $520f: $00
	nop                                              ; $5210: $00
	nop                                              ; $5211: $00
	nop                                              ; $5212: $00
	nop                                              ; $5213: $00
	nop                                              ; $5214: $00
	nop                                              ; $5215: $00
	nop                                              ; $5216: $00
	nop                                              ; $5217: $00
	nop                                              ; $5218: $00
	nop                                              ; $5219: $00
	nop                                              ; $521a: $00
	nop                                              ; $521b: $00
	
_collision_giveSpecialBitem:
	call func_3928                                       ; $521c: $cd $28 $39
	call Call_001_58ea                               ; $521f: $cd $ea $58
	call bcEquTilesetIdxDiv2                               ; $5222: $cd $36 $52
	ld   hl, data_520c                                   ; $5225: $21 $0c $52
	add  hl, bc                                      ; $5228: $09
	ld   a, (hl)                                     ; $5229: $7e
	ld   hl, wSpecialBitemsGotten                                   ; $522a: $21 $53 $c6
	or   (hl)                                        ; $522d: $b6
	ld   hl, wSpecialBitemsGotten                                   ; $522e: $21 $53 $c6
	ld   (hl), a                                     ; $5231: $77
	call callsCommonSoundFuncs_284f                                       ; $5232: $cd $4f $28
	ret                                              ; $5235: $c9


bcEquTilesetIdxDiv2:
	ld   hl, wTilesetIdx
	ld   a, (hl)
	srl  a
	ld   c, a
	ld   b, $00
	ret


_collision_giveHeartContainer:
	call func_3928                                       ; $5240: $cd $28 $39
	call Call_001_58ea                               ; $5243: $cd $ea $58
	call callsCommonSoundFuncs_284f                                       ; $5246: $cd $4f $28

giveHeartContainer:
	ld   hl, wPlayerMaxHealth                                   ; $5249: $21 $73 $c0
	ld   a, (hl)                                     ; $524c: $7e
	add  $02                                         ; $524d: $c6 $02
	cp   $18                                         ; $524f: $fe $18
	jr   c, +                              ; $5251: $38 $02

	ld   a, $18                                      ; $5253: $3e $18

+
	ld   hl, wPlayerMaxHealth                                   ; $5255: $21 $73 $c0
	ld   (hl), a                                     ; $5258: $77
	ret                                              ; $5259: $c9


_ret_525a:
	ret                                              ; $525a: $c9


_collisionsTable_0d:
	call func_3928                                       ; $525b: $cd $28 $39
	call Call_001_58ea                               ; $525e: $cd $ea $58
	ret                                              ; $5261: $c9


_collision_giveAnointingOil:
	call func_3928                                       ; $5262: $cd $28 $39
	call Call_001_58ea                               ; $5265: $cd $ea $58
	call callsCommonSoundFuncs_2846                                       ; $5268: $cd $46 $28

incAnointingOilsGotten:
	ld   hl, wAnointingOilsGotten                                   ; $526b: $21 $51 $c6
	ld   a, (hl)                                     ; $526e: $7e
	cp   $03                                         ; $526f: $fe $03
	jr   nc, @done                             ; $5271: $30 $0c

	and  $02                                         ; $5273: $e6 $02
	jr   nz, +                             ; $5275: $20 $04

	ld   hl, wAnointingOilsGotten                                   ; $5277: $21 $51 $c6
	inc  (hl)                                        ; $527a: $34

+
	ld   hl, wAnointingOilsGotten                                   ; $527b: $21 $51 $c6
	inc  (hl)                                        ; $527e: $34

@done:
	ret                                              ; $527f: $c9


_collision_giveKey:
	call func_3928                                       ; $5280: $cd $28 $39
	call Call_001_58ea                               ; $5283: $cd $ea $58
	call callsCommonSoundFuncs_284f                                       ; $5286: $cd $4f $28

giveKey:
	ld   hl, wNumKeys                                   ; $5289: $21 $fa $c5
	inc  (hl)                                        ; $528c: $34
	ld   hl, wNumKeys                                   ; $528d: $21 $fa $c5
	ld   a, (hl)                                     ; $5290: $7e
	call aIsMax3fh                               ; $5291: $cd $ba $61
	ld   hl, wNumKeys                                   ; $5294: $21 $fa $c5
	ld   (hl), a                                     ; $5297: $77
	ret                                              ; $5298: $c9


_collision_giveHeart:
	call Call_001_58ea                               ; $5299: $cd $ea $58
	ld   a, $1d                                      ; $529c: $3e $1d
	call func_39fb                                       ; $529e: $cd $fb $39
	call Call_000_3a0c                                       ; $52a1: $cd $0c $3a
	call add2toPlayerHealth                               ; $52a4: $cd $84 $50
	call callsCommonSoundFuncs_2846                                       ; $52a7: $cd $46 $28
	ret                                              ; $52aa: $c9


Call_001_52ab:
	jp   nc, Jump_001_5341                           ; $52ab: $d2 $41 $53

	push af                                          ; $52ae: $f5
	push af                                          ; $52af: $f5
	cp   $19                                         ; $52b0: $fe $19
	jp   c, Jump_001_533f                            ; $52b2: $da $3f $53

	cp   $24                                         ; $52b5: $fe $24
	jp   nc, Jump_001_533f                           ; $52b7: $d2 $3f $53

	ld   hl, wArmorOfGodGotten                                   ; $52ba: $21 $52 $c6
	ld   a, (hl)                                     ; $52bd: $7e
	and  $01                                         ; $52be: $e6 $01
	jr   z, jr_001_533f                              ; $52c0: $28 $7d

	ld   hl, $c082                                   ; $52c2: $21 $82 $c0
	ld   a, (hl)                                     ; $52c5: $7e
	cp   $09                                         ; $52c6: $fe $09
	jr   nz, jr_001_5304                             ; $52c8: $20 $3a

	ld   hl, $c083                                   ; $52ca: $21 $83 $c0
	ld   a, (hl)                                     ; $52cd: $7e
	cp   $00                                         ; $52ce: $fe $00
	jr   nz, jr_001_52e1                             ; $52d0: $20 $0f

	ld   a, $00                                      ; $52d2: $3e $00
	ld   hl, $c087                                   ; $52d4: $21 $87 $c0
	ld   (hl), a                                     ; $52d7: $77
	ld   a, $01                                      ; $52d8: $3e $01
	ld   hl, $c083                                   ; $52da: $21 $83 $c0
	ld   (hl), a                                     ; $52dd: $77
	jp   Jump_001_533f                               ; $52de: $c3 $3f $53


jr_001_52e1:
	ld   hl, $c087                                   ; $52e1: $21 $87 $c0
	ld   a, (hl)                                     ; $52e4: $7e
	cp   $0f                                         ; $52e5: $fe $0f
	jr   c, jr_001_533f                              ; $52e7: $38 $56

	ld   a, c                                        ; $52e9: $79
	cp   $00                                         ; $52ea: $fe $00
	jr   z, jr_001_533f                              ; $52ec: $28 $51

	dec  bc                                          ; $52ee: $0b
	call func_3f41                                       ; $52ef: $cd $41 $3f
	inc  bc                                          ; $52f2: $03
	jr   c, jr_001_533f                              ; $52f3: $38 $4a

	ld   a, $09                                      ; $52f5: $3e $09
	ld   hl, $c00d                                   ; $52f7: $21 $0d $c0
	ld   (hl), a                                     ; $52fa: $77
	pop  af                                          ; $52fb: $f1
	call Call_001_4a0c                               ; $52fc: $cd $0c $4a
	jr   c, jr_001_5340                              ; $52ff: $38 $3f

	jp   Jump_001_533b                               ; $5301: $c3 $3b $53


jr_001_5304:
	ld   hl, $c084                                   ; $5304: $21 $84 $c0
	ld   a, (hl)                                     ; $5307: $7e
	cp   $00                                         ; $5308: $fe $00
	jr   nz, jr_001_531b                             ; $530a: $20 $0f

	ld   a, $00                                      ; $530c: $3e $00
	ld   hl, $c088                                   ; $530e: $21 $88 $c0
	ld   (hl), a                                     ; $5311: $77
	ld   a, $01                                      ; $5312: $3e $01
	ld   hl, $c084                                   ; $5314: $21 $84 $c0
	ld   (hl), a                                     ; $5317: $77
	jp   Jump_001_533f                               ; $5318: $c3 $3f $53


jr_001_531b:
	ld   hl, $c088                                   ; $531b: $21 $88 $c0
	ld   a, (hl)                                     ; $531e: $7e
	cp   $0f                                         ; $531f: $fe $0f
	jr   c, jr_001_533f                              ; $5321: $38 $1c

	ld   a, c                                        ; $5323: $79
	cp   $0f                                         ; $5324: $fe $0f
	jr   nc, jr_001_533f                             ; $5326: $30 $17

	inc  bc                                          ; $5328: $03
	call func_3f41                                       ; $5329: $cd $41 $3f
	dec  bc                                          ; $532c: $0b
	jr   c, jr_001_533f                              ; $532d: $38 $10

	ld   a, $00                                      ; $532f: $3e $00
	ld   hl, $c00d                                   ; $5331: $21 $0d $c0
	ld   (hl), a                                     ; $5334: $77
	pop  af                                          ; $5335: $f1
	call Call_001_4a0c                               ; $5336: $cd $0c $4a
	jr   c, jr_001_5340                              ; $5339: $38 $05

Jump_001_533b:
	pop  af                                          ; $533b: $f1
	scf                                              ; $533c: $37
	ccf                                              ; $533d: $3f
	ret                                              ; $533e: $c9


Jump_001_533f:
jr_001_533f:
	pop  af                                          ; $533f: $f1

jr_001_5340:
	pop  af                                          ; $5340: $f1

Jump_001_5341:
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
	jr   z, jr_001_53d5                              ; $5357: $28 $7c

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
	jr   c, jr_001_53d5                              ; $537e: $38 $55

	dec  de                                          ; $5380: $1b
	bit  7, d                                        ; $5381: $cb $7a
	jr   nz, jr_001_53d5                             ; $5383: $20 $50

	call func_3f41                                       ; $5385: $cd $41 $3f
	inc  de                                          ; $5388: $13
	jr   c, jr_001_53d5                              ; $5389: $38 $4a

	ld   a, $03                                      ; $538b: $3e $03
	ld   hl, $c00d                                   ; $538d: $21 $0d $c0
	ld   (hl), a                                     ; $5390: $77
	pop  af                                          ; $5391: $f1
	call Call_001_4a0c                               ; $5392: $cd $0c $4a
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
	jr   c, jr_001_53d5                              ; $53b7: $38 $1c

	inc  de                                          ; $53b9: $13
	ld   a, e                                        ; $53ba: $7b
	cp   $0b                                         ; $53bb: $fe $0b
	jr   z, jr_001_53d5                              ; $53bd: $28 $16

	call func_3f41                                       ; $53bf: $cd $41 $3f
	dec  de                                          ; $53c2: $1b
	jr   c, jr_001_53d5                              ; $53c3: $38 $10

	ld   a, $06                                      ; $53c5: $3e $06
	ld   hl, $c00d                                   ; $53c7: $21 $0d $c0
	ld   (hl), a                                     ; $53ca: $77
	pop  af                                          ; $53cb: $f1
	call Call_001_4a0c                               ; $53cc: $cd $0c $4a
	jr   c, jr_001_53d6                              ; $53cf: $38 $05

Jump_001_53d1:
	pop  af                                          ; $53d1: $f1
	scf                                              ; $53d2: $37
	ccf                                              ; $53d3: $3f
	ret                                              ; $53d4: $c9


Jump_001_53d5:
jr_001_53d5:
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
	ld   hl, $c04a                                   ; $53e6: $21 $4a $c0
	add  (hl)                                        ; $53e9: $86
	ld   hl, $c0a0                                   ; $53ea: $21 $a0 $c0
	ld   (hl), a                                     ; $53ed: $77
	ld   hl, $c007                                   ; $53ee: $21 $07 $c0
	ld   a, (hl)                                     ; $53f1: $7e
	ld   hl, $c0a0                                   ; $53f2: $21 $a0 $c0
	cp   (hl)                                        ; $53f5: $be
	jr   nc, jr_001_541f                             ; $53f6: $30 $27

	call getTilePlayerIsOn                                       ; $53f8: $cd $ed $3f
	call Call_001_553b                               ; $53fb: $cd $3b $55
	call Call_001_52ab                               ; $53fe: $cd $ab $52
	jr   c, jr_001_5463                              ; $5401: $38 $60

	ld   hl, $c007                                   ; $5403: $21 $07 $c0
	ld   a, (hl)                                     ; $5406: $7e
	ld   hl, $c04a                                   ; $5407: $21 $4a $c0
	cp   (hl)                                        ; $540a: $be
	jr   c, jr_001_545d                              ; $540b: $38 $50

	jr   z, jr_001_545d                              ; $540d: $28 $4e

	inc  de                                          ; $540f: $13
	call getTilePlayerIsOn                                       ; $5410: $cd $ed $3f
	call Call_001_553b                               ; $5413: $cd $3b $55
	jr   nc, jr_001_545d                             ; $5416: $30 $45

	ld   hl, wPlayerY                                   ; $5418: $21 $54 $c0
	dec  (hl)                                        ; $541b: $35
	jp   Jump_001_545d                               ; $541c: $c3 $5d $54


jr_001_541f:
	cp   $0c                                         ; $541f: $fe $0c
	jr   c, jr_001_543f                              ; $5421: $38 $1c

	inc  de                                          ; $5423: $13
	call getTilePlayerIsOn                                       ; $5424: $cd $ed $3f
	call Call_001_553b                               ; $5427: $cd $3b $55
	call Call_001_52ab                               ; $542a: $cd $ab $52
	jr   c, jr_001_5463                              ; $542d: $38 $34

	dec  de                                          ; $542f: $1b
	call getTilePlayerIsOn                                       ; $5430: $cd $ed $3f
	call Call_001_553b                               ; $5433: $cd $3b $55
	jr   nc, jr_001_545d                             ; $5436: $30 $25

	ld   hl, wPlayerY                                   ; $5438: $21 $54 $c0
	inc  (hl)                                        ; $543b: $34
	jp   Jump_001_545d                               ; $543c: $c3 $5d $54


jr_001_543f:
	call getTilePlayerIsOn                                       ; $543f: $cd $ed $3f
	call Call_001_553b                               ; $5442: $cd $3b $55
	jr   nc, jr_001_5451                             ; $5445: $30 $0a

	inc  de                                          ; $5447: $13
	call getTilePlayerIsOn                                       ; $5448: $cd $ed $3f
	call Call_001_553b                               ; $544b: $cd $3b $55
	jp   Jump_001_5463                               ; $544e: $c3 $63 $54


jr_001_5451:
	inc  de                                          ; $5451: $13
	call getTilePlayerIsOn                                       ; $5452: $cd $ed $3f
	call Call_001_553b                               ; $5455: $cd $3b $55
	call Call_001_52ab                               ; $5458: $cd $ab $52
	jr   c, jr_001_5463                              ; $545b: $38 $06

Jump_001_545d:
jr_001_545d:
	scf                                              ; $545d: $37
	ccf                                              ; $545e: $3f
	call Call_001_5465                               ; $545f: $cd $65 $54
	ret                                              ; $5462: $c9


Jump_001_5463:
jr_001_5463:
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
	call Call_000_39b9                                       ; $5479: $cd $b9 $39
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
	ld   hl, $c0b7                                   ; $5488: $21 $b7 $c0
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

	call getTilePlayerIsOn                                       ; $54b3: $cd $ed $3f
	call Call_001_553b                               ; $54b6: $cd $3b $55
	call Call_001_5342                               ; $54b9: $cd $42 $53
	jr   c, jr_001_551a                              ; $54bc: $38 $5c

	ld   hl, $c006                                   ; $54be: $21 $06 $c0
	ld   a, (hl)                                     ; $54c1: $7e
	cp   $00                                         ; $54c2: $fe $00
	jr   z, jr_001_5514                              ; $54c4: $28 $4e

	inc  bc                                          ; $54c6: $03
	call getTilePlayerIsOn                                       ; $54c7: $cd $ed $3f
	call Call_001_553b                               ; $54ca: $cd $3b $55
	jr   nc, jr_001_5514                             ; $54cd: $30 $45

	ld   hl, wPlayerX                                   ; $54cf: $21 $52 $c0
	dec  (hl)                                        ; $54d2: $35
	jp   Jump_001_5514                               ; $54d3: $c3 $14 $55


jr_001_54d6:
	cp   $0c                                         ; $54d6: $fe $0c
	jr   c, jr_001_54f6                              ; $54d8: $38 $1c

	inc  bc                                          ; $54da: $03
	call getTilePlayerIsOn                                       ; $54db: $cd $ed $3f
	call Call_001_553b                               ; $54de: $cd $3b $55
	call Call_001_5342                               ; $54e1: $cd $42 $53
	jr   c, jr_001_551a                              ; $54e4: $38 $34

	dec  bc                                          ; $54e6: $0b
	call getTilePlayerIsOn                                       ; $54e7: $cd $ed $3f
	call Call_001_553b                               ; $54ea: $cd $3b $55
	jr   nc, jr_001_5514                             ; $54ed: $30 $25

	ld   hl, wPlayerX                                   ; $54ef: $21 $52 $c0
	inc  (hl)                                        ; $54f2: $34
	jp   Jump_001_5514                               ; $54f3: $c3 $14 $55


jr_001_54f6:
	call getTilePlayerIsOn                                       ; $54f6: $cd $ed $3f
	call Call_001_553b                               ; $54f9: $cd $3b $55
	jr   nc, jr_001_5508                             ; $54fc: $30 $0a

	inc  bc                                          ; $54fe: $03
	call getTilePlayerIsOn                                       ; $54ff: $cd $ed $3f
	call Call_001_553b                               ; $5502: $cd $3b $55
	jp   Jump_001_551a                               ; $5505: $c3 $1a $55


jr_001_5508:
	inc  bc                                          ; $5508: $03
	call getTilePlayerIsOn                                       ; $5509: $cd $ed $3f
	call Call_001_553b                               ; $550c: $cd $3b $55
	call Call_001_5342                               ; $550f: $cd $42 $53
	jr   c, jr_001_551a                              ; $5512: $38 $06

Jump_001_5514:
jr_001_5514:
	scf                                              ; $5514: $37
	ccf                                              ; $5515: $3f
	call Call_001_5465                               ; $5516: $cd $65 $54
	ret                                              ; $5519: $c9


Jump_001_551a:
jr_001_551a:
	scf                                              ; $551a: $37
	ret                                              ; $551b: $c9


splitCEintoItsNybbles:
// c high nybble in c008
	ld   a, c
	call aDivEqu16                                       ; $551d: $cd $fa $07
	ld   hl, $c008                                   ; $5520: $21 $08 $c0
	ld   (hl), a                                     ; $5523: $77

// c low nybble in c006
	ld   a, c                                        ; $5524: $79
	and  $0f                                         ; $5525: $e6 $0f
	ld   hl, $c006                                   ; $5527: $21 $06 $c0
	ld   (hl), a                                     ; $552a: $77

// e high nybble in c009
	ld   a, e                                        ; $552b: $7b
	call aDivEqu16                                       ; $552c: $cd $fa $07
	ld   hl, $c009                                   ; $552f: $21 $09 $c0
	ld   (hl), a                                     ; $5532: $77

// e low nybble in c007
	ld   a, e                                        ; $5533: $7b
	and  $0f                                         ; $5534: $e6 $0f
	ld   hl, $c007                                   ; $5536: $21 $07 $c0
	ld   (hl), a                                     ; $5539: $77
	ret                                              ; $553a: $c9


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

// equipping raft
	ld   hl, wPlayerX                                   ; $55bf: $21 $52 $c0
	ld   a, (hl)                                     ; $55c2: $7e
	add  $08                                         ; $55c3: $c6 $08
	ld   c, a                                        ; $55c5: $4f
	ld   b, $00                                      ; $55c6: $06 $00
	ld   hl, wPlayerY                                   ; $55c8: $21 $54 $c0
	ld   a, (hl)                                     ; $55cb: $7e
	add  $0f                                         ; $55cc: $c6 $0f
	ld   e, a                                        ; $55ce: $5f
	ld   d, $00                                      ; $55cf: $16 $00
	call splitCEintoItsNybbles                               ; $55d1: $cd $1c $55
	ld   hl, $c008                                   ; $55d4: $21 $08 $c0
	ld   c, (hl)                                     ; $55d7: $4e
	ld   b, $00                                      ; $55d8: $06 $00
	ld   hl, $c009                                   ; $55da: $21 $09 $c0
	ld   e, (hl)                                     ; $55dd: $5e
	ld   d, $00                                      ; $55de: $16 $00
	call getTilePlayerIsOn                                       ; $55e0: $cd $ed $3f
	cp   $2d                                         ; $55e3: $fe $2d
	jr   nz, +                             ; $55e5: $20 $06

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
	ld   de, $168e
	call callCommonSoundFuncs_1513

copyRaftDataToOam:
	ld   hl, wIsEquippingRaft
	ld   a, (hl)
	cp   $00
	jr   z, _ret_55a8

// equipping raft
	ld   a, $22                                      ; $5605: $3e $22
	call getLastUsableOamIdx_fromA                               ; $5607: $cd $f1 $57
	call clear2spritesInOam_1stIdxedE                               ; $560a: $cd $00 $58
	ld   a, $b1                                      ; $560d: $3e $b1
	call func_17dd                                       ; $560f: $cd $dd $17
	ld   hl, wOam+2                                   ; $5612: $21 $02 $c2
	add  hl, de                                      ; $5615: $19
	ld   (hl), a                                     ; $5616: $77
	add  $02                                         ; $5617: $c6 $02
	ld   hl, wOam+6                                   ; $5619: $21 $06 $c2
	add  hl, de                                      ; $561c: $19
	ld   (hl), a                                     ; $561d: $77
	ld   hl, wOam+3                                   ; $561e: $21 $03 $c2
	add  hl, de                                      ; $5621: $19
	ld   (hl), $00                                   ; $5622: $36 $00
	ld   hl, wOam+7                                   ; $5624: $21 $07 $c2
	add  hl, de                                      ; $5627: $19
	ld   (hl), $00                                   ; $5628: $36 $00
	ld   hl, wIsUsingRaft                                   ; $562a: $21 $4f $c0
	ld   a, (hl)                                     ; $562d: $7e
	cp   $00                                         ; $562e: $fe $00
	jr   z, @notUsingRaft                              ; $5630: $28 $2d

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
	ld   e, a                                        ; $56af: $5f
	ld   d, $00                                      ; $56b0: $16 $00
	ld   hl, wIsPlatformingLikeRoom                                   ; $56b2: $21 $90 $c0
	ld   a, (hl)                                     ; $56b5: $7e
	cp   $00                                         ; $56b6: $fe $00
	jr   z, @notPlatforming_orGoingLeftRight                              ; $56b8: $28 $0e

// is platforming-looking room, change oam?
	ld   c, $4c                                      ; $56ba: $0e $4c
	ld   hl, $c056                                   ; $56bc: $21 $56 $c0
	ld   a, (hl)                                     ; $56bf: $7e
	cp   $43                                         ; $56c0: $fe $43
	jr   z, @notUsingRaftOr_platformingLadderAnimation                              ; $56c2: $28 $10

	cp   $46                                         ; $56c4: $fe $46
	jr   z, @notUsingRaftOr_platformingLadderAnimation                              ; $56c6: $28 $0c

@notPlatforming_orGoingLeftRight:
// eg uses non-platforming sprites
	ld   hl, $c056                                   ; $56c8: $21 $56 $c0
	ld   c, (hl)                                     ; $56cb: $4e
	ld   hl, wIsUsingRaft                                   ; $56cc: $21 $4f $c0
	ld   a, (hl)                                     ; $56cf: $7e
	cp   $00                                         ; $56d0: $fe $00
	jr   nz, @after_getting_data_08ad_offset                             ; $56d2: $20 $06

@notUsingRaftOr_platformingLadderAnimation:
	ld   hl, wPlayerAnimationIdx                                   ; $56d4: $21 $57 $c0
	ld   a, (hl)                                     ; $56d7: $7e
	add  c                                           ; $56d8: $81
	ld   c, a                                        ; $56d9: $4f

@after_getting_data_08ad_offset:
	ld   hl, wPlayerOamAttr                                   ; $56da: $21 $55 $c0
	ld   a, (hl)                                     ; $56dd: $7e
	and  $20                                         ; $56de: $e6 $20
	jr   nz, @facingLeft                             ; $56e0: $20 $1f

	ld   hl, data_08ad                                   ; $56e2: $21 $ad $08
	ld   b, $00                                      ; $56e5: $06 $00
	add  hl, bc                                      ; $56e7: $09
	ld   a, (hl)                                     ; $56e8: $7e
	call func_17dd                                       ; $56e9: $cd $dd $17

	bit  0, a                                        ; $56ec: $cb $47
	jr   nz, jr_001_570f                             ; $56ee: $20 $1f

@afterGettingFrom_08ad:
	and  $fe                                         ; $56f0: $e6 $fe
	ld   hl, wOam+2                                   ; $56f2: $21 $02 $c2
	add  hl, de                                      ; $56f5: $19
	ld   (hl), a                                     ; $56f6: $77
	add  $02                                         ; $56f7: $c6 $02
	ld   hl, wOam+6                                   ; $56f9: $21 $06 $c2
	add  hl, de                                      ; $56fc: $19
	ld   (hl), a                                     ; $56fd: $77
	jp   Jump_001_571d                               ; $56fe: $c3 $1d $57

@facingLeft:
	ld   hl, data_08ad                                   ; $5701: $21 $ad $08
	ld   b, $00                                      ; $5704: $06 $00
	add  hl, bc                                      ; $5706: $09
	ld   a, (hl)                                     ; $5707: $7e
	call func_17dd                                       ; $5708: $cd $dd $17

	bit  0, a                                        ; $570b: $cb $47
	jr   nz, @afterGettingFrom_08ad                             ; $570d: $20 $e1

jr_001_570f:
	and  $fe                                         ; $570f: $e6 $fe
	ld   hl, wOam+6                                   ; $5711: $21 $06 $c2
	add  hl, de                                      ; $5714: $19
	ld   (hl), a                                     ; $5715: $77
	add  $02                                         ; $5716: $c6 $02
	ld   hl, wOam+2                                   ; $5718: $21 $02 $c2
	add  hl, de                                      ; $571b: $19
	ld   (hl), a                                     ; $571c: $77

Jump_001_571d:
	ld   hl, $c025                                   ; $571d: $21 $25 $c0
	ld   a, (hl)                                     ; $5720: $7e
	cp   $00                                         ; $5721: $fe $00
	jr   z, jr_001_5727                              ; $5723: $28 $02

	ld   a, $10                                      ; $5725: $3e $10

jr_001_5727:
	ld   hl, wPlayerOamAttr                                   ; $5727: $21 $55 $c0
	or   (hl)                                        ; $572a: $b6
	ld   hl, $c017                                   ; $572b: $21 $17 $c0
	bit  0, (hl)                                     ; $572e: $cb $46
	jr   z, jr_001_5734                              ; $5730: $28 $02

	xor  $20                                         ; $5732: $ee $20

jr_001_5734:
	ld   hl, wOam+3                                   ; $5734: $21 $03 $c2
	add  hl, de                                      ; $5737: $19
	ld   (hl), a                                     ; $5738: $77
	ld   hl, wOam+7                                   ; $5739: $21 $07 $c2
	add  hl, de                                      ; $573c: $19
	ld   (hl), a                                     ; $573d: $77
	ld   hl, wSCYvalue                                   ; $573e: $21 $11 $cb
	ld   a, (hl)                                     ; $5741: $7e
	or   a                                           ; $5742: $b7
	jr   z, jr_001_5760                              ; $5743: $28 $1b

	ld   hl, wPlayerY                                   ; $5745: $21 $54 $c0
	ld   a, (hl)                                     ; $5748: $7e
	ld   hl, wSCYvalue                                   ; $5749: $21 $11 $cb
	sub  (hl)                                        ; $574c: $96
	jr   nc, jr_001_5753                             ; $574d: $30 $04

	ld   a, $00                                      ; $574f: $3e $00
	jr   jr_001_5773                                 ; $5751: $18 $20

jr_001_5753:
	sub  $28                                         ; $5753: $d6 $28
	jr   nc, jr_001_5760                             ; $5755: $30 $09

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
	ld   hl, wPlayerHealth                                   ; $57d9: $21 $72 $c0
	ld   a, (hl)                                     ; $57dc: $7e
	cp   $01                                         ; $57dd: $fe $01
	jr   nz, @done                             ; $57df: $20 $0f

	ld   hl, wMainLoopCounter                                   ; $57e1: $21 $14 $c0
	bit  4, (hl)                                     ; $57e4: $cb $66
	jr   nz, @done                             ; $57e6: $20 $08

	ld   a, $00                                      ; $57e8: $3e $00
	call getLastUsableOamIdx_fromA                               ; $57ea: $cd $f1 $57
	call clear2spritesInOam_1stIdxedE                               ; $57ed: $cd $00 $58

@done:
	ret                                              ; $57f0: $c9


getLastUsableOamIdx_fromA:
	ld   hl, $c04e
	add  (hl)                                        ; $57f4: $86
	cp   $28                                         ; $57f5: $fe $28
	jr   c, +                              ; $57f7: $38 $02

	sub  $28                                         ; $57f9: $d6 $28

+
	sla  a                                           ; $57fb: $cb $27
	sla  a                                           ; $57fd: $cb $27
	ret                                              ; $57ff: $c9


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


func_581a:
	ld   a, $00                                      ; func_581a: $3e $00
	ld   hl, $c0b7                                   ; $581c: $21 $b7 $c0
	ld   (hl), a                                     ; $581f: $77

jr_001_5820:
	call Call_001_5826                               ; $5820: $cd $26 $58
	jr   nz, jr_001_5820                             ; $5823: $20 $fb

	ret                                              ; $5825: $c9


Call_001_5826:
	call setTeleportDetails_retZifNotPossible
	jr   z, jr_001_5853                              ; $5829: $28 $28

	ld   hl, $c0b8                                   ; $582b: $21 $b8 $c0
	ld   c, (hl)                                     ; $582e: $4e
	ld   b, $00                                      ; $582f: $06 $00
	ld   hl, $c0b9                                   ; $5831: $21 $b9 $c0
	ld   e, (hl)                                     ; $5834: $5e
	ld   d, $00                                      ; $5835: $16 $00
	call getTilePlayerIsOn                                       ; $5837: $cd $ed $3f
	cp   $2d                                         ; $583a: $fe $2d
	jr   z, jr_001_5842                              ; $583c: $28 $04

	cp   $00                                         ; $583e: $fe $00
	jr   nz, jr_001_584f                             ; $5840: $20 $0d

jr_001_5842:
	ld   hl, $c0ba                                   ; $5842: $21 $ba $c0
	ld   a, (hl)                                     ; $5845: $7e
	ld   hl, $c028                                   ; $5846: $21 $28 $c0
	ld   (hl), a                                     ; $5849: $77
	ld   a, $01                                      ; $584a: $3e $01
	call Call_001_58f4                               ; $584c: $cd $f4 $58

jr_001_584f:
	ld   hl, $c0b7                                   ; $584f: $21 $b7 $c0
	inc  (hl)                                        ; $5852: $34

jr_001_5853:
	ret                                              ; $5853: $c9


teleport7byteIndexes:
.rept 24 index count
	.db count*7
.endr

setTeleportDetails_retZifNotPossible:
// c0a1 is bank
	ld   hl, wTileLayoutDataBank
	ld   a, (hl)                                     ; $586f: $7e
	ld   hl, wCommonByteCopyFuncBank                                   ; $5870: $21 $a1 $c0
	ld   (hl), a                                     ; $5873: $77

// c0b7 is idx of entrance we are setting ourself at
	ld   hl, $c0b7                                   ; $5874: $21 $b7 $c0
	ld   e, (hl)                                     ; $5877: $5e
	ld   d, $00                                      ; $5878: $16 $00
	ld   hl, teleport7byteIndexes                                   ; $587a: $21 $54 $58
	add  hl, de                                      ; $587d: $19

// source of bytes is $c0b6/5 + value in 5854
	ld   a, (hl)                                     ; $587e: $7e
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr                                   ; $587f: $21 $b5 $c0
	add  (hl)                                        ; $5882: $86
	ld   hl, wCommonByteCopyFuncSrc                                   ; $5883: $21 $9a $c0
	ld   (hl), a                                     ; $5886: $77

// next byte
	ld   hl, wBytePatternInRoomStructAfterlayoutAddr+1                                   ; $5887: $21 $b6 $c0
	ld   a, (hl)                                     ; $588a: $7e
	adc  $00                                         ; $588b: $ce $00
	ld   hl, wCommonByteCopyFuncSrc+1                                   ; $588d: $21 $9b $c0
	ld   (hl), a                                     ; $5890: $77

// copy 7 bytes
	ld   hl, wCommonByteCopyFuncNumBytes                                   ; $5891: $21 $a0 $c0
	ld   (hl), $07                                   ; $5894: $36 $07
	call copyBytesFromAnotherBankInto_c6d0                                       ; $5896: $cd $24 $02

	ld   hl, wCommonByteCopyDestBytes                                   ; $5899: $21 $d0 $c6
	ld   a, (hl)                                     ; $589c: $7e
	ld   hl, $c0b8                                   ; $589d: $21 $b8 $c0
	ld   (hl), a                                     ; $58a0: $77
	cp   $ff                                         ; $58a1: $fe $ff
	jr   z, @end                              ; $58a3: $28 $3e

	call aDivEqu16                                       ; $58a5: $cd $fa $07
	ld   (hl), a                                     ; $58a8: $77
	ld   hl, wCommonByteCopyDestBytes                                   ; $58a9: $21 $d0 $c6
	ld   a, (hl)                                     ; $58ac: $7e
	and  $0f                                         ; $58ad: $e6 $0f
	ld   hl, $c0b9                                   ; $58af: $21 $b9 $c0
	ld   (hl), a                                     ; $58b2: $77
	ld   hl, wCommonByteCopyDestBytes+1                                   ; $58b3: $21 $d1 $c6
	ld   a, (hl)                                     ; $58b6: $7e
	ld   hl, $c0ba                                   ; $58b7: $21 $ba $c0
	ld   (hl), a                                     ; $58ba: $77
	ld   hl, wCommonByteCopyDestBytes+2                                   ; $58bb: $21 $d2 $c6
	ld   a, (hl)                                     ; $58be: $7e
	ld   hl, wScriptTeleGroup                                   ; $58bf: $21 $bb $c0
	ld   (hl), a                                     ; $58c2: $77
	ld   hl, wCommonByteCopyDestBytes+3                                   ; $58c3: $21 $d3 $c6
	ld   a, (hl)                                     ; $58c6: $7e
	ld   hl, wScriptTeleRoomX                                   ; $58c7: $21 $bc $c0
	ld   (hl), a                                     ; $58ca: $77
	ld   hl, wCommonByteCopyDestBytes+4                                   ; $58cb: $21 $d4 $c6
	ld   a, (hl)                                     ; $58ce: $7e
	ld   hl, wScriptTeleRoomY                                   ; $58cf: $21 $bd $c0
	ld   (hl), a                                     ; $58d2: $77
	ld   hl, wCommonByteCopyDestBytes+5                                   ; $58d3: $21 $d5 $c6
	ld   a, (hl)                                     ; $58d6: $7e
	ld   hl, wScriptTelePlayerX                                   ; $58d7: $21 $be $c0
	ld   (hl), a                                     ; $58da: $77
	ld   hl, wCommonByteCopyDestBytes+6                                   ; $58db: $21 $d6 $c6
	ld   a, (hl)                                     ; $58de: $7e
	ld   hl, wScriptTelePlayerY                                   ; $58df: $21 $bf $c0
	ld   (hl), a                                     ; $58e2: $77

@end:
	ld   hl, $c0b8                                   ; $58e3: $21 $b8 $c0
	ld   a, (hl)                                     ; $58e6: $7e
	cp   $ff                                         ; $58e7: $fe $ff
	ret                                              ; $58e9: $c9


Call_001_58ea:
	ld   hl, wRoomStructByteWhenFirstByteBitSet2                                   ; $58ea: $21 $79 $c0
	ld   a, (hl)                                     ; $58ed: $7e
	ld   hl, $c028                                   ; $58ee: $21 $28 $c0
	ld   (hl), a                                     ; $58f1: $77
	ld   a, $00                                      ; $58f2: $3e $00

Call_001_58f4:
	push af
	ld   hl, $c00c                                   ; $58f5: $21 $0c $c0
	ld   (hl), c                                     ; $58f8: $71
	ld   hl, $c00d                                   ; $58f9: $21 $0d $c0
	ld   (hl), e                                     ; $58fc: $73
	call store16ePlusCin_c01e                                       ; $58fd: $cd $0d $09
	cp   $fd                                         ; $5900: $fe $fd
	jr   nz, jr_001_591f                             ; $5902: $20 $1b

	call Call_000_3971                                       ; $5904: $cd $71 $39
	cp   $00                                         ; $5907: $fe $00
	jr   z, jr_001_5986                              ; $5909: $28 $7b

	call Call_001_59a1                               ; $590b: $cd $a1 $59
	cp   $01                                         ; $590e: $fe $01
	jr   nz, jr_001_5986                             ; $5910: $20 $74

	push af                                          ; $5912: $f5
	ld   hl, $c0ba                                   ; $5913: $21 $ba $c0
	ld   a, (hl)                                     ; $5916: $7e
	ld   hl, $c028                                   ; $5917: $21 $28 $c0
	ld   (hl), a                                     ; $591a: $77
	pop  af                                          ; $591b: $f1
	jp   Jump_001_5986                               ; $591c: $c3 $86 $59


jr_001_591f:
	cp   $00                                         ; $591f: $fe $00
	jr   nz, jr_001_593b                             ; $5921: $20 $18

	call Call_000_3971                                       ; $5923: $cd $71 $39
	cp   $00                                         ; $5926: $fe $00
	jr   z, jr_001_593b                              ; $5928: $28 $11

	call Call_001_59a1                               ; $592a: $cd $a1 $59
	cp   $01                                         ; $592d: $fe $01
	jr   nz, jr_001_593b                             ; $592f: $20 $0a

	push af                                          ; $5931: $f5
	ld   hl, $c0ba                                   ; $5932: $21 $ba $c0
	ld   a, (hl)                                     ; $5935: $7e
	ld   hl, $c028                                   ; $5936: $21 $28 $c0
	ld   (hl), a                                     ; $5939: $77
	pop  af                                          ; $593a: $f1

jr_001_593b:
	cp   $fe                                         ; $593b: $fe $fe
	jr   nz, jr_001_5947                             ; $593d: $20 $08

	ld   a, $17                                      ; $593f: $3e $17
	call Call_000_08fc                                       ; $5941: $cd $fc $08
	jp   Jump_001_5986                               ; $5944: $c3 $86 $59


jr_001_5947:
	cp   $ff                                         ; $5947: $fe $ff
	jr   nz, jr_001_596a                             ; $5949: $20 $1f

	ld   hl, $c01e                                   ; $594b: $21 $1e $c0
	ld   e, (hl)                                     ; $594e: $5e
	ld   d, $00                                      ; $594f: $16 $00
	ld   hl, w2x2gameScreenTiles                                   ; $5951: $21 $b0 $c3
	add  hl, de                                      ; $5954: $19
	ld   a, (hl)                                     ; $5955: $7e
	ld   hl, $c028                                   ; $5956: $21 $28 $c0
	ld   (hl), a                                     ; $5959: $77
	ld   de, $0000                                   ; $595a: $11 $00 $00
	ld   hl, $c00a                                   ; $595d: $21 $0a $c0
	ldi  a, (hl)                                     ; $5960: $2a
	ld   h, (hl)                                     ; $5961: $66
	ld   l, a                                        ; $5962: $6f
	add  hl, de                                      ; $5963: $19
	ld   a, (hl)                                     ; $5964: $7e
	and  $7f                                         ; $5965: $e6 $7f
	jp   Jump_001_5990                               ; $5967: $c3 $90 $59


jr_001_596a:
	push af                                          ; $596a: $f5
	ld   hl, $c00a                                   ; $596b: $21 $0a $c0
	ldi  a, (hl)                                     ; $596e: $2a
	ld   h, (hl)                                     ; $596f: $66
	ld   l, a                                        ; $5970: $6f
	pop  af                                          ; $5971: $f1
	ld   (hl), a                                     ; $5972: $77
	push af                                          ; $5973: $f5
	ld   hl, $c01e                                   ; $5974: $21 $1e $c0
	ld   e, (hl)                                     ; $5977: $5e
	ld   d, $00                                      ; $5978: $16 $00
	ld   hl, $c028                                   ; $597a: $21 $28 $c0
	ld   a, (hl)                                     ; $597d: $7e
	ld   hl, w2x2gameScreenTiles                                   ; $597e: $21 $b0 $c3
	add  hl, de                                      ; $5981: $19
	ld   (hl), a                                     ; $5982: $77
	pop  af                                          ; $5983: $f1
	and  $7f                                         ; $5984: $e6 $7f

Jump_001_5986:
jr_001_5986:
	cp   $0c                                         ; $5986: $fe $0c
	jr   nz, jr_001_5990                             ; $5988: $20 $06

	ld   a, $00                                      ; $598a: $3e $00
	ld   hl, $c028                                   ; $598c: $21 $28 $c0
	ld   (hl), a                                     ; $598f: $77

Jump_001_5990:
jr_001_5990:
	call Call_001_59ba                               ; $5990: $cd $ba $59
	ld   hl, $c00c                                   ; $5993: $21 $0c $c0
	ld   c, (hl)                                     ; $5996: $4e
	ld   b, $00                                      ; $5997: $06 $00
	ld   hl, $c00d                                   ; $5999: $21 $0d $c0
	ld   e, (hl)                                     ; $599c: $5e
	ld   d, $00                                      ; $599d: $16 $00
	pop  af                                          ; $599f: $f1
	ret                                              ; $59a0: $c9


Call_001_59a1:
	push af                                          ; $59a1: $f5
	ld   hl, $c00c                                   ; $59a2: $21 $0c $c0
	ld   a, (hl)                                     ; $59a5: $7e
	ld   hl, $c6c9                                   ; $59a6: $21 $c9 $c6
	ld   (hl), a                                     ; $59a9: $77
	ld   hl, $c00d                                   ; $59aa: $21 $0d $c0
	ld   a, (hl)                                     ; $59ad: $7e
	ld   hl, $c6ca                                   ; $59ae: $21 $ca $c6
	ld   (hl), a                                     ; $59b1: $77
	ld   a, $20                                      ; $59b2: $3e $20
	ld   hl, $c6c8                                   ; $59b4: $21 $c8 $c6
	ld   (hl), a                                     ; $59b7: $77
	pop  af                                          ; $59b8: $f1
	ret                                              ; $59b9: $c9


Call_001_59ba:
	call Call_001_59f0                               ; $59ba: $cd $f0 $59
	call Call_001_5a09                               ; $59bd: $cd $09 $5a

	push hl                                          ; $59c0: $e5
	push bc                                          ; $59c1: $c5
	ld   de, $ffe0                                   ; $59c2: $11 $e0 $ff
	add  hl, de                                      ; $59c5: $19

	push hl                                          ; $59c6: $e5
	dec  c                                           ; $59c7: $0d
	dec  b                                           ; $59c8: $05

	push bc                                          ; $59c9: $c5
	ld   hl, $ceff                                   ; $59ca: $21 $ff $ce
	ld   e, (hl)                                     ; $59cd: $5e
	ld   d, $00                                      ; $59ce: $16 $00
	ld   hl, $cf00                                   ; $59d0: $21 $00 $cf
	add  hl, de                                      ; $59d3: $19
	pop  bc                                          ; $59d4: $c1

	pop  de                                          ; $59d5: $d1

	ld   (hl), e                                     ; $59d6: $73
	inc  hl                                          ; $59d7: $23
	ld   (hl), d                                     ; $59d8: $72
	inc  hl                                          ; $59d9: $23
	ld   (hl), c                                     ; $59da: $71
	inc  hl                                          ; $59db: $23
	ld   (hl), b                                     ; $59dc: $70
	inc  hl                                          ; $59dd: $23
	pop  bc                                          ; $59de: $c1
	pop  de                                          ; $59df: $d1

	ld   (hl), e                                     ; $59e0: $73
	inc  hl                                          ; $59e1: $23
	ld   (hl), d                                     ; $59e2: $72
	inc  hl                                          ; $59e3: $23
	ld   (hl), c                                     ; $59e4: $71
	inc  hl                                          ; $59e5: $23
	ld   (hl), b                                     ; $59e6: $70
	inc  hl                                          ; $59e7: $23
	ld   hl, $ceff                                   ; $59e8: $21 $ff $ce
	ld   a, (hl)                                     ; $59eb: $7e
	add  $08                                         ; $59ec: $c6 $08
	ld   (hl), a                                     ; $59ee: $77
	ret                                              ; $59ef: $c9


Call_001_59f0:
	ld   hl, $ceff                                   ; $59f0: $21 $ff $ce
	ld   a, (hl)                                     ; $59f3: $7e
	add  $08                                         ; $59f4: $c6 $08
	ld   hl, $cefe                                   ; $59f6: $21 $fe $ce
	cp   (hl)                                        ; $59f9: $be
	jr   nz, @done                             ; $59fa: $20 $0c

	call waitUntilStartOfVBlankPeriod                                       ; $59fc: $cd $e8 $01
	call Call_001_5a3b                               ; $59ff: $cd $3b $5a
	call Call_001_5a3b                               ; $5a02: $cd $3b $5a
	call Call_001_5a3b                               ; $5a05: $cd $3b $5a

@done:
	ret                                              ; $5a08: $c9


Call_001_5a09:
// place c028 tile at c00c/d
	ld   de, $9820                                   ; $5a09: $11 $20 $98
	call dPlusEquValIn_c6de                                       ; $5a0c: $cd $a2 $1e
	ld   hl, $c00d                                   ; $5a0f: $21 $0d $c0
	ld   b, (hl)                                     ; $5a12: $46
	ld   c, $00                                      ; $5a13: $0e $00
	srl  b                                           ; $5a15: $cb $38
	rr   c                                           ; $5a17: $cb $19
	srl  b                                           ; $5a19: $cb $38
	rr   c                                           ; $5a1b: $cb $19
	ld   hl, $c00c                                   ; $5a1d: $21 $0c $c0
	ld   a, (hl)                                     ; $5a20: $7e
	sla  a                                           ; $5a21: $cb $27
	push de                                          ; $5a23: $d5
	pop  hl                                          ; $5a24: $e1
	add  hl, bc                                      ; $5a25: $09
	add  l                                           ; $5a26: $85
	ld   l, a                                        ; $5a27: $6f
	ld   a, h                                        ; $5a28: $7c
	adc  $00                                         ; $5a29: $ce $00
	ld   h, a                                        ; $5a2b: $67
	ld   de, $c028                                   ; $5a2c: $11 $28 $c0
	ld   a, (de)                                     ; $5a2f: $1a
	call convert2x2tileValueToTopLeftVramTileValue                                       ; $5a30: $cd $c4 $17
	and  $fc                                         ; $5a33: $e6 $fc
	ld   c, a                                        ; $5a35: $4f
	inc  c                                           ; $5a36: $0c
	add  $03                                         ; $5a37: $c6 $03
	ld   b, a                                        ; $5a39: $47
	ret                                              ; $5a3a: $c9


Call_001_5a3b:
	ld   hl, $ceff
	ld   a, (hl)                                     ; $5a3e: $7e
	ld   hl, $cefe                                   ; $5a3f: $21 $fe $ce
	sub  (hl)                                        ; $5a42: $96
	jr   nz, +                             ; $5a43: $20 $01

	ret                                              ; $5a45: $c9

+
	srl  a                                           ; $5a46: $cb $3f
	srl  a                                           ; $5a48: $cb $3f
	srl  a                                           ; $5a4a: $cb $3f
	cp   $07                                         ; $5a4c: $fe $07
	jr   c, +                              ; $5a4e: $38 $02

	ld   a, $06                                      ; $5a50: $3e $06

+
	ld   c, a                                        ; $5a52: $4f
	ld   hl, $cefe                                   ; $5a53: $21 $fe $ce
	ld   e, (hl)                                     ; $5a56: $5e
	ld   d, $00                                      ; $5a57: $16 $00
	ld   hl, $cf00                                   ; $5a59: $21 $00 $cf
	add  hl, de                                      ; $5a5c: $19

@loop:
	ld   e, (hl)                                     ; $5a5d: $5e
	inc  hl                                          ; $5a5e: $23
	ld   d, (hl)                                     ; $5a5f: $56
	inc  hl                                          ; $5a60: $23
	ldi  a, (hl)                                     ; $5a61: $2a
	ld   (de), a                                     ; $5a62: $12
	inc  de                                          ; $5a63: $13
	ldi  a, (hl)                                     ; $5a64: $2a
	ld   (de), a                                     ; $5a65: $12
	ld   e, (hl)                                     ; $5a66: $5e
	inc  hl                                          ; $5a67: $23
	ld   d, (hl)                                     ; $5a68: $56
	inc  hl                                          ; $5a69: $23
	ldi  a, (hl)                                     ; $5a6a: $2a
	ld   (de), a                                     ; $5a6b: $12
	inc  de                                          ; $5a6c: $13
	ldi  a, (hl)                                     ; $5a6d: $2a
	ld   (de), a                                     ; $5a6e: $12
	ld   a, l                                        ; $5a6f: $7d
	cp   $00                                         ; $5a70: $fe $00
	jr   nz, +                             ; $5a72: $20 $01

	dec  h                                           ; $5a74: $25

+
	dec  c                                           ; $5a75: $0d
	jr   nz, @loop                             ; $5a76: $20 $e5

	ld   a, l                                        ; $5a78: $7d
	ld   hl, $cefe                                   ; $5a79: $21 $fe $ce
	ld   (hl), a                                     ; $5a7c: $77
	ret                                              ; $5a7d: $c9


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


func_5abf:
	ld   de, $988c
	call dPlusEquScreen0displayOffset                                       ; $5ac2: $cd $99 $1e
	ld   bc, $0000                                   ; $5ac5: $01 $00 $00
	ld   hl, $c006                                   ; $5ac8: $21 $06 $c0
	ld   (hl), b                                     ; $5acb: $70

jr_001_5acc:
	ld   hl, wPlayerScore                                   ; $5acc: $21 $2b $c0
	add  hl, bc                                      ; $5acf: $09
	ld   a, (hl)                                     ; $5ad0: $7e
	push af                                          ; $5ad1: $f5
	cp   $00                                         ; $5ad2: $fe $00
	jr   nz, jr_001_5ae6                             ; $5ad4: $20 $10

	ld   a, c                                        ; $5ad6: $79
	cp   $06                                         ; $5ad7: $fe $06
	jr   z, jr_001_5ae6                              ; $5ad9: $28 $0b

	ld   hl, $c006                                   ; $5adb: $21 $06 $c0
	ld   a, (hl)                                     ; $5ade: $7e
	cp   $00                                         ; $5adf: $fe $00
	jr   nz, jr_001_5ae6                             ; $5ae1: $20 $03

	pop  af                                          ; $5ae3: $f1
	jr   jr_001_5aef                                 ; $5ae4: $18 $09

jr_001_5ae6:
	pop  af                                          ; $5ae6: $f1
	ld   hl, $c006                                   ; $5ae7: $21 $06 $c0
	inc  (hl)                                        ; $5aea: $34
	add  $30                                         ; $5aeb: $c6 $30
	ld   (de), a                                     ; $5aed: $12
	inc  de                                          ; $5aee: $13

jr_001_5aef:
	inc  bc                                          ; $5aef: $03
	ld   a, c                                        ; $5af0: $79
	cp   $07                                         ; $5af1: $fe $07
	jr   nz, jr_001_5acc                             ; $5af3: $20 $d7

	ret                                              ; $5af5: $c9


;;
	add  $01                                         ; $5af6: $c6 $01

Call_001_5af8:
	ld   c, a                                        ; Call_001_5af8: $4f
	ld   b, $00                                      ; $5af9: $06 $00
	ld   a, 100                                      ; $5afb: $3e $64
	call bcDivA_divInC_modInAB                                       ; $5afd: $cd $44 $08
	ld   hl, $c0a2                                   ; $5b00: $21 $a2 $c0
	ld   (hl), c                                     ; $5b03: $71
	ld   a, c                                        ; $5b04: $79
	cp   $00                                         ; $5b05: $fe $00
	jr   z, +                              ; $5b07: $28 $03

	call @drawDigit                               ; $5b09: $cd $21 $5b

+
	ld   a, b                                        ; $5b0c: $78
	ld   c, a                                        ; $5b0d: $4f
	ld   b, $00                                      ; $5b0e: $06 $00
	ld   a, 10                                      ; $5b10: $3e $0a
	call bcDivA_divInC_modInAB                                       ; $5b12: $cd $44 $08
	ld   a, c                                        ; $5b15: $79
	ld   hl, $c0a2                                   ; $5b16: $21 $a2 $c0
	or   (hl)                                        ; $5b19: $b6
	jr   z, +                              ; $5b1a: $28 $04

	ld   a, c                                        ; $5b1c: $79
	call @drawDigit                               ; $5b1d: $cd $21 $5b

+
	ld   a, b                                        ; $5b20: $78

@drawDigit:
	add  $30                                         ; $5b21: $c6 $30
	ld   (de), a                                     ; $5b23: $12
	inc  de                                          ; $5b24: $13
	ret                                              ; $5b25: $c9


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

;;
	ret                                              ; $5b7a: $c9


	ret                                              ; $5b7b: $c9


jr_001_5b7c:
	ld   hl, $2002                                   ; $5b7c: $21 $02 $20
	ld   a, (hl)                                     ; $5b7f: $7e
	bit  7, a                                        ; $5b80: $cb $7f
	jr   z, jr_001_5b7c                              ; $5b82: $28 $f8

	ret                                              ; $5b84: $c9


;;
	ld   de, $9800                                   ; $5b85: $11 $00 $98
	call dEquDoffsetInScreen1                                       ; $5b88: $cd $a8 $1e
	jp   +                               ; $5b8b: $c3 $94 $5b


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


aEqu2ahPlus10:
	sla  a
	add  $0a
	ret


;;
	call aEqu2ahPlus10                               ; $61c6: $cd $c1 $61
	add  $01                                         ; $61c9: $c6 $01
	ret                                              ; $61cb: $c9


soundData_61cc:
	inc  de                                          ; $61cc: $13
	dec  de                                          ; $61cd: $1b
	ldd  a, (hl)                                     ; $61ce: $3a
	dec  e                                           ; $61cf: $1d
	ld   (hl), l                                     ; $61d0: $75
	rra                                              ; $61d1: $1f
	adc  h                                           ; $61d2: $8c
	rra                                              ; $61d3: $1f
	xor  d                                           ; $61d4: $aa
	rra                                              ; $61d5: $1f
	reti                                             ; $61d6: $d9


	.db $18
	
	
soundData_61d8:
	.db $5c

	dec  de                                          ; $61d9: $1b
	adc  l                                           ; $61da: $8d
	dec  e                                           ; $61db: $1d
	add  c                                           ; $61dc: $81
	rra                                              ; $61dd: $1f
	sbc  e                                           ; $61de: $9b
	rra                                              ; $61df: $1f
	or   (hl)                                        ; $61e0: $b6
	rra                                              ; $61e1: $1f
	.db $c2 $19
	
	
soundData_61e4:
	.db $1d

	dec  d                                           ; $61e5: $15
	dec  e                                           ; $61e6: $1d
	dec  d                                           ; $61e7: $15
	dec  e                                           ; $61e8: $1d
	dec  d                                           ; $61e9: $15
	dec  e                                           ; $61ea: $1d
	dec  d                                           ; $61eb: $15
	dec  e                                           ; $61ec: $1d
	dec  d                                           ; $61ed: $15
	dec  e                                           ; $61ee: $1d
	dec  d                                           ; $61ef: $15
	
	
soundData_61f0:
	ld   a, ($ff00+c)                                ; $61f0: $f2
	dec  d                                           ; $61f1: $15
	ei                                               ; $61f2: $fb
	dec  d                                           ; $61f3: $15
	inc  b                                           ; $61f4: $04
	ld   d, $0d                                      ; $61f5: $16 $0d
	ld   d, $1d                                      ; $61f7: $16 $1d
	ld   d, $26                                      ; $61f9: $16 $26
	ld   d, $47                                      ; $61fb: $16 $47
	ld   d, $58                                      ; $61fd: $16 $58
	ld   d, $61                                      ; $61ff: $16 $61
	ld   d, $6a                                      ; $6201: $16 $6a
	ld   d, $73                                      ; $6203: $16 $73
	ld   d, $7c                                      ; $6205: $16 $7c
	ld   d, $85                                      ; $6207: $16 $85
	ld   d, $8e                                      ; $6209: $16 $8e
	ld   d, $97                                      ; $620b: $16 $97
	ld   d, $a0                                      ; $620d: $16 $a0
	ld   d, $a9                                      ; $620f: $16 $a9
	ld   d, $ba                                      ; $6211: $16 $ba
	ld   d, $cb                                      ; $6213: $16 $cb
	ld   d, $ec                                      ; $6215: $16 $ec
	ld   d, $2d                                      ; $6217: $16 $2d
	rla                                              ; $6219: $17
	ld   (hl), $17                                   ; $621a: $36 $17
	ld   e, a                                        ; $621c: $5f
	rla                                              ; $621d: $17
	ld   l, b                                        ; $621e: $68
	rla                                              ; $621f: $17
	ld   (hl), c                                     ; $6220: $71
	rla                                              ; $6221: $17
	ld   a, (bc)                                     ; $6222: $0a
	jr   jr_001_6238                                 ; $6223: $18 $13

	jr   jr_001_6243                                 ; $6225: $18 $1c

	.db $18 $25

	jr   $2e                                         ; $6229: $18 $2e

	jr   jr_001_6264                                 ; $622b: $18 $37

	jr   jr_001_626f                                 ; $622d: $18 $40

	jr   $66                                         ; $622f: $18 $66

	dec  d                                           ; $6231: $15
	ld   e, $15                                      ; $6232: $1e $15
	daa                                              ; $6234: $27

jr_001_6235:
	dec  d                                           ; $6235: $15
	add  hl, sp                                      ; $6236: $39
	dec  d                                           ; $6237: $15

jr_001_6238:
	ld   b, d                                        ; $6238: $42
	dec  d                                           ; $6239: $15
	and  l                                           ; $623a: $a5
	dec  d                                           ; $623b: $15
	ld   c, e                                        ; $623c: $4b
	dec  d                                           ; $623d: $15
	ld   d, h                                        ; $623e: $54
	dec  d                                           ; $623f: $15
	ld   e, l                                        ; $6240: $5d
	dec  d                                           ; $6241: $15
	adc  d                                           ; $6242: $8a

jr_001_6243:
	dec  d                                           ; $6243: $15
