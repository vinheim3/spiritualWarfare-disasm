Call_001_6244:
	push bc
	push af                                          ; $6245: $f5
	ld   hl, $c00c                                   ; $6246: $21 $0c $c0
	ld   (hl), c                                     ; $6249: $71
	ld   hl, wArmorOfGodGotten                                   ; $624a: $21 $52 $c6
	ld   a, (hl)                                     ; $624d: $7e
	and  AOG_HELM                                         ; $624e: $e6 $10
	jr   z, Jump_001_6257                              ; $6250: $28 $05

// helm gotten
	ld   hl, $c04b                                   ; $6252: $21 $4b $c0
	ld   (hl), $00                                   ; $6255: $36 $00

Jump_001_6257:
	ld   bc, $0000                                   ; $6257: $01 $00 $00

jr_001_625a:
	ld   hl, $c600                                   ; $625a: $21 $00 $c6
	add  hl, bc                                      ; $625d: $09
	ld   a, (hl)                                     ; $625e: $7e
	cp   $00                                         ; $625f: $fe $00
	jr   z, jr_001_626f                              ; $6261: $28 $0c

	inc  bc                                          ; $6263: $03

jr_001_6264:
	ld   a, c                                        ; $6264: $79
	cp   $18                                         ; $6265: $fe $18
	jr   c, jr_001_625a                              ; $6267: $38 $f1

	call Call_000_35b2                                       ; $6269: $cd $b2 $35
	jp   Jump_001_6257                               ; $626c: $c3 $57 $62


jr_001_626f:
	pop  af                                          ; $626f: $f1
	ld   hl, $c600                                   ; $6270: $21 $00 $c6
	add  hl, bc                                      ; $6273: $09
	ld   (hl), a                                     ; $6274: $77
	ld   hl, $c00c                                   ; $6275: $21 $0c $c0
	ld   a, (hl)                                     ; $6278: $7e
	ld   hl, $c04b                                   ; $6279: $21 $4b $c0
	or   (hl)                                        ; $627c: $b6
	ld   hl, $c618                                   ; $627d: $21 $18 $c6
	add  hl, bc                                      ; $6280: $09
	ld   (hl), a                                     ; $6281: $77
	ld   a, e                                        ; $6282: $7b
	ld   hl, $c630                                   ; $6283: $21 $30 $c6
	add  hl, bc                                      ; $6286: $09
	ld   (hl), a                                     ; $6287: $77
	pop  bc                                          ; $6288: $c1
	ret                                              ; $6289: $c9


executeNPCScriptCode:
	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00

// bank is based on cbfc
	ld   hl, wNPCScriptBytesBank
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncBank
	ld   (hl), a

// copy 4 bytes
	ld   hl, wCommonByteCopyFuncNumBytes
	ld   (hl), $04

// cb90 contains $0c low bytes of NPC 4 byte data address
	ld   hl, wNPCScriptPointerLowByte
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncSrc
	ld   (hl), a

// cb9c contains $0c high bytes of NPC 4 byte data address
	ld   hl, wNPCScriptPointerHighByte
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncSrc+1
	ld   (hl), a
	call copyBytesFromAnotherBankInto_c6d0

	ld   hl, wCommonByteCopyDestBytes
	ld   de, wNPCScriptOpcode

// copy 4 bytes, for potential 3 param codes
	ldi  a, (hl)
	ld   (de), a
	inc  de
	ldi  a, (hl)
	ld   (de), a
	inc  de
	ldi  a, (hl)
	ld   (de), a
	inc  de
	ldi  a, (hl)
	ld   (de), a

// upper 2 bits of 1st copied byte into de
	ld   hl, wNPCScriptOpcode
	ld   a, (hl)
	srl  a
	srl  a
	srl  a
	srl  a
	srl  a
	srl  a
	and  $03
	ld   e, a
	ld   d, $00

// add A+1 to word in cb90/c (next script code)
	ld   hl, wNPCScriptPointerLowByte
	add  hl, bc
	scf
	adc  (hl)
	ld   (hl), a
	jr   nc, +

	ld   hl, wNPCScriptPointerHighByte
	add  hl, bc
	inc  (hl)

+

// lower 6 bits of the 1st copied data byte into c006
	ld   hl, wNPCScriptOpcode
	ld   a, (hl)
	and  $3f
	ld   hl, wScriptCmdIdxOffset
	ld   (hl), a

// ..added to offset from this table idxed by upper 2 bits
// to get the index into the npc functions below
	ld   hl, scriptCmd_paramOffsets
	add  hl, de
	ld   a, (hl)
	ld   hl, wScriptCmdIdxOffset
	add  (hl)

// only $68 script commands
	cp   (scriptCmdTableEnd-scriptCmdTable)/2
	jr   c, +

	ld   a, $00

+
	ld   e, a
	ld   d, $00
	ld   hl, scriptCmdTable
	add  hl, de
	add  hl, de
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	jp   hl


scriptCmdTable:
// 0 params
	.dw _scriptCmd_end
	.dw _scriptCmd_set5_cb60
	.dw _scriptCmd_res5_cb60
	.dw _scriptCmd_set7_cb60
	.dw _scriptCmd_set4_cb60
	.dw _scriptCmd_faceUp
	.dw _scriptCmd_faceDown
	.dw _scriptCmd_faceRight
	.dw _scriptCmd_faceLeft
	.dw _scriptCmd_set6_cb60_reset_cb6c
	.dw _scriptCmd_offsetNPCCoordsBy1_turnRight
	.dw _scriptCmd_offsetNPCCoordsBy1_turnLeft
	.dw _scriptCmd_res4_cb60
	.dw _scriptCmd_turnLeft
	.dw _scriptCmd_turnRight
	.dw _scriptCmd_turnBackwards
	.dw _scriptCmd_facePlayerHorizontally
	.dw _scriptCmd_facePlayerVertically
	.dw _scriptCmd_moveToPlayersXandFacePlayerHorizontally
	.dw _scriptCmd_moveToPlayersYandFacePlayerVertically
	.dw _scriptCmd_set3_cb60
	.dw _scriptCmd_res3_cb60
	.dw _scriptCmd_65fd
	.dw _scriptCmd_moveNPCturnBackIfCant
	.dw _scriptCmd_callCommonSoundFuncs6638
	.dw _scriptCmd_giveHeartContainer
	.dw _scriptCmd_reducePlayerMaxHealth
	.dw _scriptCmd_giveKey
	.dw _scriptCmd_takeKey
	.dw _scriptCmd_set2_cb60
	.dw _scriptCmd_res2_cb60
	.dw _scriptCmd_c02a_equFF
	.dw _scriptCmd_6683
	.dw _scriptCmd_66bf
	.dw _scriptCmd_c714_equFF
	.dw _scriptCmd_c714_equ0
	.dw _scriptCmd_ret
	.dw _scriptCmd_incAnointingOilsGotten
	.dw _scriptCmd_set7_npc2ndByteLower6Bits
	.dw _scriptCmd_set2_cbe4
	.dw _scriptCmd_setRoomFlagFrom_cbf0
	.dw _scriptCmd_set3_cbe4
	.dw _scriptCmd_6748
	.dw _scriptCmd_gotoStartTitleScreen
	.dw _scriptCmd_endIfSimilarIDNpcExists
	.dw _scriptCmd_set1_cbe4

// 1 param
	.dw _scriptCmd_moveByParamPixels
	.dw _scriptCmd_setMovementSpeed
	.dw _scriptCmd_wait
	.dw _scriptCmd_setNewNpcID
	.dw _scriptCmd_setDamageTaken
	.dw _scriptCmd_increaseScore
	.dw _scriptCmd_spawnNPCinFrontOfSelf
	.dw _scriptCmd_cb60_low2bitsEquParamMinus1
	.dw _scriptCmd_giveArmorOfGod
	.dw _scriptCmd_takeArmorOfGod
	.dw _scriptCmd_giveSpecialBItem
	.dw _scriptCmd_takeSpecialBItem
	.dw _scriptCmd_addToPlayerHealth
	.dw _scriptCmd_dealPlayerDamage
	.dw _scriptCmd_giveNumBirds
	.dw _scriptCmd_takeNumBirds
	.dw _scriptCmd_giveItem
	.dw _scriptCmd_takeItem
	.dw _scriptCmd_giveFruit
	.dw _scriptCmd_giveNumBombs
	.dw _scriptCmd_set_c059
	.dw _scriptCmd_getSimilarNPCsToCurrLocationDir

// 2 params
	.dw _scriptCmd_setCoords // $44
	.dw _scriptCmd_jump
	.dw _scriptCmd_resetBit5ofNPC2ndByte_jumpIfNZ
	.dw _scriptCmd_startScrollingText
	.dw _scriptCmd_jumpIfAtLeast1key
	.dw _scriptCmd_call
	.dw _scriptCmd_groupRoomXYjumpTable
	.dw _scriptCmd_displayTextScreen
	.dw _scriptCmd_jumpIfLampOn
	.dw _scriptCmd_callCommonSoundFuncs_6c01
	.dw _scriptCmd_resetNPC2ndByteBit5_jumpIfOrigSet
	.dw _scriptCmd_jumpIfPlayerIsFullHealth
	.dw _scriptCmd_flipBit4ofNPC2ndByte_jumpIfNZ
	.dw _scriptCmd_waitRandomValBetween2ParamsInclusive
	.dw _scriptCmd_lampOnOrOffSameBGP
	.dw _scriptCmd_lampOnOrOffSameOBP0
	.dw _scriptCmd_addParamsToXthenYCoords
	.dw _scriptCmd_callCommonSoundFuncs_6d6c
	.dw _scriptCmd_teleportPlayer

// 3 params
	.dw _scriptCmd_spawnNPCAtOffset // $57
	.dw _scriptCmd_spawnNPC
	.dw _scriptCmd_loopAboveParamTimes
	.dw _scriptCmd_jumpIfRandomNumLTparam
	.dw _scriptCmd_jumpIfArmorOfGodGotten
	.dw _scriptCmd_jumpIfSpecialBitemGotten
	.dw _scriptCmd_jumpIfNumBirdsGotten
	.dw _scriptCmd_placeTile
	.dw _scriptCmd_jumpIfItemGotten
	.dw _scriptCmd_jumpIfAtTile
	.dw _scriptCmd_jumpIfMoreThanNumBombsGotten
	.dw _scriptCmd_jumpIfMoreThanNumOilsGotten
	.dw _scriptCmd_jumpIfMoreThanParam1HealthGotten
	.dw _scriptCmd_jumpIfButtonsPressed
	.dw _scriptCmd_moveNPC_jumpIfCant
	.dw _scriptCmd_quiz
	.dw _scriptCmd_jumpIfFacingDirection
scriptCmdTableEnd:


scriptCmd_paramOffsets:
	.db $00 $2e $44 $57


_scriptCmd_end:
	ld   a, $ff
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   (hl), a
	ret


_scriptCmd_set5_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	set  5, (hl)
	jp   executeNPCScriptCode


_scriptCmd_res5_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	res  5, (hl)
	jp   executeNPCScriptCode


_scriptCmd_set7_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	set  7, (hl)
	jp   executeNPCScriptCode


_scriptCmd_set4_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	set  4, (hl)
	jp   executeNPCScriptCode


_scriptCmd_faceUp:
	call keepUpperNybbleOfNPC2ndByteLower6Bits
	or   DIR_UP
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   (hl), a

npcHelper_res3_cbe4_thenNextOpcode:
	call npcHelper_res3_cbe4
	jp   executeNPCScriptCode


_scriptCmd_faceDown:
	call keepUpperNybbleOfNPC2ndByteLower6Bits
	or   DIR_DOWN
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   (hl), a
	jp   npcHelper_res3_cbe4_thenNextOpcode


_scriptCmd_faceRight:
	call keepUpperNybbleOfNPC2ndByteLower6Bits
	or   DIR_RIGHT
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   (hl), a
	jp   npcHelper_res3_cbe4_thenNextOpcode


_scriptCmd_faceLeft:
	call keepUpperNybbleOfNPC2ndByteLower6Bits
	or   DIR_LEFT
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   (hl), a
	jp   npcHelper_res3_cbe4_thenNextOpcode


_scriptCmd_set6_cb60_reset_cb6c:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	set  6, (hl)
	ld   hl, wNPCBytes_cb6c
	add  hl, bc
	ld   (hl), $00

_executeNPCScriptCode_644f:
	jp   executeNPCScriptCode


_scriptCmd_offsetNPCCoordsBy1_turnRight:
	call npcHelper_offsetNPCCoordsBy1
	jr   nc, _executeNPCScriptCode_644f

	jp   _scriptCmd_turnRight


_scriptCmd_offsetNPCCoordsBy1_turnLeft:
	call npcHelper_offsetNPCCoordsBy1
	jr   nc, _executeNPCScriptCode_644f

	jp   _scriptCmd_turnLeft


npcHelper_offsetNPCCoordsBy1:
	ld   a, $01
	ld   hl, wNPCScriptParam1
	ld   (hl), a

npcHelper_offsetNPCCoordsByScriptByte1:
	call getCurrNpcDirection
	cp   DIR_UP
	jr   nz, +

// up
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	sub  (hl)
	jr   c, @retCFset

	ld   e, a
	ld   d, $00
	call deEquEplusValIn_c04a
	jp   @afterUpDown

+
	cp   DIR_DOWN
	jr   nz, @horiz

// down
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	add  (hl)
	jr   c, @retCFset                              ; $6490: $38 $5f

	cp   $a1                                         ; $6492: $fe $a1
	jr   nc, @retCFset                             ; $6494: $30 $5b

	add  $0f                                         ; $6496: $c6 $0f
	ld   e, a                                        ; $6498: $5f
	ld   d, $00                                      ; $6499: $16 $00

@afterUpDown:
	ld   hl, wNPC_xCoord                                   ; $649b: $21 $3c $cb
	add  hl, bc                                      ; $649e: $09
	ld   a, (hl)                                     ; $649f: $7e
	ld   c, a                                        ; $64a0: $4f
	ld   b, $00                                      ; $64a1: $06 $00
	jp   @afterLeftRight                               ; $64a3: $c3 $d5 $64

@horiz:
	cp   DIR_LEFT                                         ; $64a6: $fe $09
	jr   nz, +                             ; $64a8: $20 $14

// left
	call Call_001_46b4                               ; $64aa: $cd $b4 $46
	ld   hl, wNPC_xCoord                                   ; $64ad: $21 $3c $cb
	add  hl, bc                                      ; $64b0: $09
	ld   a, (hl)                                     ; $64b1: $7e
	ld   hl, wNPCScriptParam1                                   ; $64b2: $21 $20 $c0
	sub  (hl)                                        ; $64b5: $96
	jr   c, @retCFset                              ; $64b6: $38 $39

	ld   c, a                                        ; $64b8: $4f
	ld   b, $00                                      ; $64b9: $06 $00
	jp   @afterLeftRight                               ; $64bb: $c3 $d5 $64

+
// right
	call Call_001_46b4                               ; $64be: $cd $b4 $46
	ld   hl, wNPC_xCoord                                   ; $64c1: $21 $3c $cb
	add  hl, bc                                      ; $64c4: $09
	ld   a, (hl)                                     ; $64c5: $7e
	ld   hl, wNPCScriptParam1                                   ; $64c6: $21 $20 $c0
	add  (hl)                                        ; $64c9: $86
	jr   c, @retCFset                              ; $64ca: $38 $25

	cp   $f1                                         ; $64cc: $fe $f1
	jr   nc, @retCFset                             ; $64ce: $30 $21

	add  $0f                                         ; $64d0: $c6 $0f
	ld   c, a                                        ; $64d2: $4f
	ld   b, $00                                      ; $64d3: $06 $00

@afterLeftRight:
	call splitCEintoItsNybbles                               ; $64d5: $cd $1c $55
	ld   hl, $c008                                   ; $64d8: $21 $08 $c0
	ld   c, (hl)                                     ; $64db: $4e
	ld   b, $00                                      ; $64dc: $06 $00
	ld   hl, $c009                                   ; $64de: $21 $09 $c0
	ld   e, (hl)                                     ; $64e1: $5e
	ld   d, $00                                      ; $64e2: $16 $00
	call getTilePlayerIsOn                                       ; $64e4: $cd $ed $3f
	call Call_001_45cf                               ; $64e7: $cd $cf $45
	ld   hl, wCurrNpcIdx                                   ; $64ea: $21 $a6 $c0
	ld   c, (hl)                                     ; $64ed: $4e
	ld   b, $00                                      ; $64ee: $06 $00
	ret                                              ; $64f0: $c9

@retCFset:
	scf                                              ; $64f1: $37
	ret                                              ; $64f2: $c9


npcHelper_resetBit5OfNPC2ndByteLower6Bits:
	ld   a, $20
	jp   npcHelper_resetBitOfNPC2ndByteLower6Bits


_scriptCmd_res4_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	res  4, (hl)
	jp   executeNPCScriptCode


npcTurnLeftData:
	.db DIR_UP $00 $00
	.db DIR_LEFT $00 $00
	.db DIR_RIGHT $00 $00
	.db DIR_DOWN


npcTurnRightData:
	.db DIR_DOWN $00 $00
	.db DIR_RIGHT $00 $00
	.db DIR_LEFT $00 $00
	.db DIR_UP


npcBackwardsData:
	.db DIR_LEFT $00 $00
	.db DIR_DOWN $00 $00
	.db DIR_UP $00 $00
	.db DIR_RIGHT


_scriptCmd_turnLeft:
	call getCurrNpcDirection
	and  $0f
	ld   e, a
	ld   d, $00
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   a, (hl)
	and  $f0
	push hl
	ld   hl, npcTurnLeftData
	add  hl, de
	or   (hl)
	pop  hl
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_turnRight:
	call getCurrNpcDirection
	ld   e, a
	ld   d, $00
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   a, (hl)
	and  $f0
	push hl
	ld   hl, npcTurnRightData
	add  hl, de
	or   (hl)
	pop  hl
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_turnBackwards:
	call getCurrNpcDirection
	ld   e, a
	ld   d, $00
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   a, (hl)
	and  $f0
	push hl
	ld   hl, npcBackwardsData
	add  hl, de
	or   (hl)
	pop  hl
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_facePlayerHorizontally:
	call npcHelper_res3_cbe4
	call keepUpperNybbleOfNPC2ndByteLower6Bits
	ld   de, DIR_RIGHT
	ld   hl, wPlayerX
	ld   a, (hl)
	ld   hl, wNPC_xCoord
	add  hl, bc
	sub  (hl)
	jr   nc, npcHelper_setNPCdirectionBits

	ld   de, DIR_LEFT

npcHelper_setNPCdirectionBits:
	ld   a, e
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	or   (hl)
	ld   (hl), a
	ret


_scriptCmd_facePlayerVertically:
	call npcHelper_res3_cbe4
	call keepUpperNybbleOfNPC2ndByteLower6Bits
	ld   de, DIR_DOWN
	ld   hl, wPlayerY
	ld   a, (hl)
	ld   hl, wNPC_yCoord
	add  hl, bc
	sub  (hl)
	jr   nc, npcHelper_setNPCdirectionBits

	ld   de, DIR_UP
	jp   npcHelper_setNPCdirectionBits


_scriptCmd_moveToPlayersXandFacePlayerHorizontally:
	ld   hl, wPlayerX                                   ; $65a2: $21 $52 $c0
	ld   a, (hl)                                     ; $65a5: $7e
	ld   hl, wNPC_xCoord                                   ; $65a6: $21 $3c $cb
	add  hl, bc                                      ; $65a9: $09
	cp   (hl)                                        ; $65aa: $be
	jr   c, +                              ; $65ab: $38 $04

// player x is >= npc's x
// get player x - npc x
	sub  (hl)                                        ; $65ad: $96
	jp   ++                               ; $65ae: $c3 $b6 $65

+
// player's x < npc's
// get npc x - player x
	ld   a, (hl)                                     ; $65b1: $7e
	ld   hl, wPlayerX                                   ; $65b2: $21 $52 $c0
	sub  (hl)                                        ; $65b5: $96

++
// cba8 is x distance between player x and npc x
	ld   hl, wNPCBytes_pixelsToMove                                   ; $65b6: $21 $a8 $cb
	add  hl, bc                                      ; $65b9: $09
	ld   (hl), a                                     ; $65ba: $77
	jp   _scriptCmd_facePlayerHorizontally                               ; $65bb: $c3 $69 $65


_scriptCmd_moveToPlayersYandFacePlayerVertically:
	ld   hl, wPlayerY                                   ; $65be: $21 $54 $c0
	ld   a, (hl)                                     ; $65c1: $7e
	ld   hl, wNPC_yCoord                                   ; $65c2: $21 $48 $cb
	add  hl, bc                                      ; $65c5: $09
	cp   (hl)                                        ; $65c6: $be
	jr   c, jr_001_65cd                              ; $65c7: $38 $04

	sub  (hl)                                        ; $65c9: $96
	jp   Jump_001_65d2                               ; $65ca: $c3 $d2 $65


jr_001_65cd:
	ld   a, (hl)                                     ; $65cd: $7e
	ld   hl, wPlayerY                                   ; $65ce: $21 $54 $c0
	sub  (hl)                                        ; $65d1: $96

Jump_001_65d2:
	ld   hl, wNPCBytes_pixelsToMove                                   ; $65d2: $21 $a8 $cb
	add  hl, bc                                      ; $65d5: $09
	ld   (hl), a                                     ; $65d6: $77
	jp   _scriptCmd_facePlayerVertically                               ; $65d7: $c3 $88 $65


keepUpperNybbleOfNPC2ndByteLower6Bits:
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   a, (hl)
	and  $f0
	ld   (hl), a
	ret


getCurrNpcDirection:
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   a, (hl)
	and  $0f
	ret


_scriptCmd_set3_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	set  3, (hl)
	jp   executeNPCScriptCode


_scriptCmd_res3_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	res  3, (hl)
	jp   executeNPCScriptCode


_scriptCmd_65fd:
	ld   hl, wNPCBytes_cb6c                                   ; $65fd: $21 $6c $cb
	add  hl, bc                                      ; $6600: $09
	inc  (hl)                                        ; $6601: $34
	call Call_001_738a                               ; $6602: $cd $8a $73
	ld   hl, wNPCBytes_cb6c                                   ; $6605: $21 $6c $cb
	add  hl, bc                                      ; $6608: $09
	dec  (hl)                                        ; $6609: $35
	ld   hl, $c009                                   ; $660a: $21 $09 $c0
	ld   a, (hl)                                     ; $660d: $7e
	cp   $01                                         ; $660e: $fe $01
	jr   z, @done                              ; $6610: $28 $03

	call _scriptPtrMinusEqu1                               ; $6612: $cd $1c $66

@done:
	ret                                              ; $6615: $c9


scriptPtrMinusEqu3:
	call _scriptPtrMinusEqu1
	call _scriptPtrMinusEqu1

_scriptPtrMinusEqu1:
	ld   hl, wNPCScriptPointerLowByte
	add  hl, bc
	ld   a, (hl)
	sub  $01
	ld   (hl), a
	ld   hl, wNPCScriptPointerHighByte
	add  hl, bc
	ld   a, (hl)
	sbc  $00
	ld   (hl), a
	ret


_scriptCmd_moveNPCturnBackIfCant:
	call npcHelper_offsetNPCCoordsBy1
	jr   nc, +

	jp   _scriptCmd_turnBackwards

+
	jp   executeNPCScriptCode


_scriptCmd_callCommonSoundFuncs6638:
	call safeCallCommonSoundFuncs_with20h
	jp   executeNPCScriptCode


_scriptCmd_giveHeartContainer:
	call giveHeartContainer
	jp   executeNPCScriptCode


_scriptCmd_reducePlayerMaxHealth:
	ld   hl, wPlayerMaxHealth
	ld   a, (hl)
	sub  $02
	cp   MIN_HEALTH
	jr   nc, +

	ld   a, MIN_HEALTH

+
	ld   hl, wPlayerMaxHealth
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_giveKey:
	call giveKey
	jp   executeNPCScriptCode


_scriptCmd_takeKey:
	ld   hl, wNumKeys
	ld   a, (hl)
	cp   $00
	jr   z, +

	dec  (hl)

+
	jp   executeNPCScriptCode


_scriptCmd_set2_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	set  2, (hl)
	jp   executeNPCScriptCode


_scriptCmd_res2_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	res  2, (hl)
	jp   executeNPCScriptCode


_scriptCmd_c02a_equFF:
	ld   hl, $c02a                                   ; $667b: $21 $2a $c0
	ld   (hl), $ff                                   ; $667e: $36 $ff
	jp   executeNPCScriptCode                               ; $6680: $c3 $8a $62


_scriptCmd_6683:
	call Call_001_669b                               ; $6683: $cd $9b $66
	jr   nz, _executeNPCScriptCode_6698                             ; $6686: $20 $10

	ld   hl, $c0b7                                   ; $6688: $21 $b7 $c0
	ld   e, (hl)                                     ; $668b: $5e
	ld   d, $00                                      ; $668c: $16 $00
	ld   hl, bitTable                                   ; $668e: $21 $41 $07
	add  hl, de                                      ; $6691: $19
	ld   a, (hl)                                     ; $6692: $7e
	ld   hl, $c07e                                   ; $6693: $21 $7e $c0
	or   (hl)                                        ; $6696: $b6
	ld   (hl), a                                     ; $6697: $77

_executeNPCScriptCode_6698:
	jp   executeNPCScriptCode


Call_001_669b:
	ld   hl, wNPC_yCoord                                   ; $669b: $21 $48 $cb
	add  hl, bc                                      ; $669e: $09
	ld   a, (hl)                                     ; $669f: $7e
	srl  a                                           ; $66a0: $cb $3f
	srl  a                                           ; $66a2: $cb $3f
	srl  a                                           ; $66a4: $cb $3f
	srl  a                                           ; $66a6: $cb $3f
	ld   e, a                                        ; $66a8: $5f
	ld   d, $00                                      ; $66a9: $16 $00
	ld   hl, wNPC_xCoord                                   ; $66ab: $21 $3c $cb
	add  hl, bc                                      ; $66ae: $09
	ld   a, (hl)                                     ; $66af: $7e
	srl  a                                           ; $66b0: $cb $3f
	srl  a                                           ; $66b2: $cb $3f
	srl  a                                           ; $66b4: $cb $3f
	srl  a                                           ; $66b6: $cb $3f
	ld   c, a                                        ; $66b8: $4f
	ld   b, $00                                      ; $66b9: $06 $00
	call Call_000_39b9                                       ; $66bb: $cd $b9 $39
	ret                                              ; $66be: $c9


_scriptCmd_66bf:
	call Call_001_669b                               ; $66bf: $cd $9b $66
	jr   nz, _executeNPCScriptCode_6698                             ; $66c2: $20 $d4

	ld   hl, $c0b7                                   ; $66c4: $21 $b7 $c0
	ld   e, (hl)                                     ; $66c7: $5e
	ld   d, $00                                      ; $66c8: $16 $00
	ld   hl, bitTable                                   ; $66ca: $21 $41 $07
	add  hl, de                                      ; $66cd: $19
	ld   a, (hl)                                     ; $66ce: $7e
	ld   hl, $c07e                                   ; $66cf: $21 $7e $c0
	or   (hl)                                        ; $66d2: $b6
	ld   hl, bitTable                                   ; $66d3: $21 $41 $07
	add  hl, de                                      ; $66d6: $19
	xor  (hl)                                        ; $66d7: $ae
	ld   hl, $c07e                                   ; $66d8: $21 $7e $c0
	ld   (hl), a                                     ; $66db: $77
	jp   executeNPCScriptCode                               ; $66dc: $c3 $8a $62


_scriptCmd_c714_equFF:
	ld   a, $ff                                      ; $66df: $3e $ff
	ld   hl, $c714                                   ; $66e1: $21 $14 $c7
	ld   (hl), a                                     ; $66e4: $77
	jp   executeNPCScriptCode                               ; $66e5: $c3 $8a $62


_scriptCmd_c714_equ0:
	ld   a, $00                                      ; $66e8: $3e $00
	ld   hl, $c714                                   ; $66ea: $21 $14 $c7
	ld   (hl), a                                     ; $66ed: $77
	jp   executeNPCScriptCode                               ; $66ee: $c3 $8a $62


_scriptCmd_ret:
	ld   hl, wNPCScriptPointerReturnLowByte
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptPointerLowByte
	add  hl, bc
	ld   (hl), a
	ld   hl, wNPCScriptPointerReturnHighByte
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptPointerHighByte
	add  hl, bc
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_incAnointingOilsGotten:
	call incAnointingOilsGotten
	jp   executeNPCScriptCode


_scriptCmd_set7_npc2ndByteLower6Bits:
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	set  7, (hl)
	jp   executeNPCScriptCode


_scriptCmd_set2_cbe4:
	ld   a, $04

npcHelper_orAwith_cbe4:
	ld   hl, wNPCBytes_cbe4
	add  hl, bc
	or   (hl)
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_setRoomFlagFrom_cbf0:
	ld   hl, wNPCBytes_cbf0                                   ; $6722: $21 $f0 $cb
	add  hl, bc                                      ; $6725: $09
	ld   a, (hl)                                     ; $6726: $7e
	cp   $ff                                         ; $6727: $fe $ff
	jr   z, +                              ; $6729: $28 $0a

	ld   hl, wRoomFlagIdxToCheck                                   ; $672b: $21 $fc $c0
	ld   (hl), a                                     ; $672e: $77
	ld   hl, setRoomFlag                                   ; $672f: $21 $de $09
	call jpHLinBank1                               ; $6732: $cd $b0 $61

+
	jp   executeNPCScriptCode                               ; $6735: $c3 $8a $62


_scriptCmd_set3_cbe4:
	ld   hl, wNPCBytes_cbe4
	add  hl, bc
	set  3, (hl)
	jp   executeNPCScriptCode


npcHelper_res3_cbe4:
	ld   hl, wNPCBytes_cbe4
	add  hl, bc
	res  3, (hl)
	ret


_scriptCmd_6748:
// de is y coords of tile npc is on (idxed by 2x2 tile)
	ld   hl, wNPC_yCoord                                   ; $6748: $21 $48 $cb
	add  hl, bc                                      ; $674b: $09
	ld   a, (hl)                                     ; $674c: $7e
	add  $08                                         ; $674d: $c6 $08
	call aDivEqu16                                       ; $674f: $cd $fa $07
	ld   e, a                                        ; $6752: $5f
	ld   d, $00                                      ; $6753: $16 $00

// bc is x coords of tile npc is on (idxed by 2x2 tile)
	ld   hl, wNPC_xCoord                                   ; $6755: $21 $3c $cb
	add  hl, bc                                      ; $6758: $09
	ld   a, (hl)                                     ; $6759: $7e
	add  $08                                         ; $675a: $c6 $08
	call aDivEqu16                                       ; $675c: $cd $fa $07
	ld   c, a                                        ; $675f: $4f
	ld   b, $00                                      ; $6760: $06 $00

//
	ld   a, $80                                      ; $6762: $3e $80
	ld   hl, $c04b                                   ; $6764: $21 $4b $c0
	ld   (hl), a                                     ; $6767: $77
	ld   a, $06                                      ; $6768: $3e $06
	call Call_001_6244                               ; $676a: $cd $44 $62
	jp   executeNPCScriptCode                               ; $676d: $c3 $8a $62


_scriptCmd_gotoStartTitleScreen:
	jp   startTitleScreen


_scriptCmd_endIfSimilarIDNpcExists:
	ld   de, $0000

@checkNextNPC:
// go to next if npc checked is current npc
	ld   hl, wCurrNpcIdx
	ld   a, e
	cp   (hl)
	jr   z, @gotoNextNPC

// end if npc checked is the same as current npc
	ld   hl, wNPCBytes_ID
	add  hl, de
	ld   a, (hl)
	ld   hl, wNPCBytes_ID
	add  hl, bc
	cp   (hl)
	jr   nz, @gotoNextNPC

	jp   _scriptCmd_end

@gotoNextNPC:
	inc  de
	ld   a, e
	cp   NUM_NPCS
	jr   nz, @checkNextNPC

	jp   executeNPCScriptCode


_scriptCmd_set1_cbe4:
	ld   a, $02
	jp   npcHelper_orAwith_cbe4


_scriptCmd_moveByParamPixels:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wNPCBytes_pixelsToMove
	add  hl, bc
	ld   (hl), a
	ret


_scriptCmd_setMovementSpeed:
// keep lower nybble of param-1
	ld   hl, wNPCScriptParam1
	dec  (hl)
	ld   a, (hl)
	and  $0f
	ld   (hl), a

// or with higher nybble of cb54
	ld   hl, wNPCBytes_damageAndMovementSpeed
	add  hl, bc
	ld   a, (hl)
	and  $f0
	ld   hl, wNPCScriptParam1
	or   (hl)

// put back into cb54
	ld   hl, wNPCBytes_damageAndMovementSpeed
	add  hl, bc
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_wait:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wNPCBytes_timeToWait
	add  hl, bc
	ld   (hl), a
	ret


_scriptCmd_setNewNpcID:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wNPCBytes_newID
	add  hl, bc
	ld   (hl), a
	ret


_scriptCmd_setDamageTaken:
// move param1's lower nybble to upper nybble
	ld   hl, wNPCScriptParam1
	sla  (hl)
	sla  (hl)
	sla  (hl)
	sla  (hl)

// or with cb54 and put back in
	ld   hl, wNPCBytes_damageAndMovementSpeed
	add  hl, bc
	ld   a, (hl)
	and  $0f
	ld   hl, wNPCScriptParam1
	or   (hl)
	ld   hl, wNPCBytes_damageAndMovementSpeed
	add  hl, bc
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_increaseScore:
	ld   hl, wNPCScriptParam1
	ld   e, (hl)
	ld   d, $00
	call npcHelper_increaseScore
	jp   executeNPCScriptCode


horiz11hOffsetData:
	.db $11 $00 $00
	.db $00 $00 $00
	.db $00 $00 $00
	.db $ef


vert11hOffsetData:
	.db $00 $00 $00
	.db $ef $00 $00
	.db $11 $00 $00
	.db $00


_scriptCmd_spawnNPCinFrontOfSelf:
	call getCurrNpcDirection
// de is curr npc direction
	ld   e, a
	ld   d, $00
	ld   hl, horiz11hOffsetData
	add  hl, de
	ld   a, (hl)
	ld   hl, wNPCScriptParam2
	ld   (hl), a

	ld   hl, vert11hOffsetData
	add  hl, de
	ld   a, (hl)
	ld   hl, wNPCScriptParam3
	ld   (hl), a
	jp   _scriptCmd_spawnNPCAtOffset


_scriptCmd_cb60_low2bitsEquParamMinus1:
// param -= 1 and keep low 2 bits
	ld   hl, wNPCScriptParam1
	dec  (hl)
	ld   a, (hl)
	and  $03
	ld   (hl), a

// or it with cb60, and put back in cb60
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	ld   a, (hl)
	and  $fc
	ld   hl, wNPCScriptParam1
	or   (hl)
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_giveArmorOfGod:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wArmorOfGodGotten
	or   (hl)
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_takeArmorOfGod:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wArmorOfGodGotten
	or   (hl)

	ld   hl, wNPCScriptParam1
	xor  (hl)
	ld   hl, wArmorOfGodGotten
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_giveSpecialBItem:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wSpecialBitemsGotten
	or   (hl)
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_takeSpecialBItem:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wSpecialBitemsGotten
	or   (hl)
	ld   hl, wNPCScriptParam1
	xor  (hl)
	ld   hl, wSpecialBitemsGotten
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_addToPlayerHealth:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	call addAtoPlayerHealth
	jp   executeNPCScriptCode


_scriptCmd_dealPlayerDamage:
	ld   hl, wNPCScriptParam1                                   ; $688f: $21 $20 $c0
	ld   a, (hl)                                     ; $6892: $7e
	ld   hl, wBaseDamageTaken                                   ; $6893: $21 $23 $c0
	ld   (hl), a                                     ; $6896: $77
	ld   a, $ff                                      ; $6897: $3e $ff
	ld   hl, $c024                                   ; $6899: $21 $24 $c0
	ld   (hl), a                                     ; $689c: $77
	call playerTakeDamage                                       ; $689d: $cd $75 $28
	jp   executeNPCScriptCode                               ; $68a0: $c3 $8a $62


_scriptCmd_giveNumBirds:
	ld   hl, wNumBirds
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	add  (hl)
	jr   nc, npcHelper_setNumBirds

	ld   a, $ff

npcHelper_setNumBirds:
	ld   hl, wNumBirds
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_takeNumBirds:
	ld   hl, wNumBirds
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	sub  (hl)
	jr   nc, +

	ld   a, $00

+
	jp   npcHelper_setNumBirds


_scriptCmd_giveItem:
	call getItemsGottenByteAndBitToCheckForItem
	ld   hl, wItemsGotten
	add  hl, bc
	or   (hl)
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_takeItem:
	call getItemsGottenByteAndBitToCheckForItem
	ld   hl, wNPCScriptParam1
	ld   (hl), a
	ld   hl, wItemsGotten
	add  hl, bc
	or   (hl)
	ld   hl, wNPCScriptParam1
	xor  (hl)
	ld   hl, wItemsGotten
	add  hl, bc
	ld   (hl), a
	jp   executeNPCScriptCode


getItemsGottenByteAndBitToCheckForItem:
	ld   hl, wNPCScriptParam1
	ld   c, (hl)
	ld   b, $00
	ld   a, $06
	call bcDivA_divInC_modInAB
// byte1 / 6 -> div in c, mod in e
	ld   a, b
	ld   e, a
	ld   d, $00
	ld   b, $00

// bc = param1 / 6
// de is the mod
	ld   hl, bitTable
	add  hl, de
	ld   a, (hl)
	ret


_scriptCmd_giveFruit:
	ld   hl, wNPCScriptParam1                                   ; $6900: $21 $20 $c0
	ld   e, (hl)                                     ; $6903: $5e
	ld   hl, getFruitAmountFromWram                                   ; $6904: $21 $fe $13
	call jpHLinBank4                               ; $6907: $cd $b5 $61
	ld   a, e                                        ; $690a: $7b
	ld   d, $00                                      ; $690b: $16 $00
	cp   $04                                         ; $690d: $fe $04
	jr   nc, +                             ; $690f: $30 $0b

// less than 4 of a fruit, ...
	inc  de                                          ; $6911: $13
	ld   hl, wNPCScriptParam1                                   ; $6912: $21 $20 $c0
	ld   a, (hl)                                     ; $6915: $7e
	call setFruitAsAmountToE                                       ; $6916: $cd $ca $23
	call Call_000_241a                                       ; $6919: $cd $1a $24

+
	jp   executeNPCScriptCode                               ; $691c: $c3 $8a $62


_scriptCmd_giveNumBombs:
	ld   hl, wNumBombs
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	add  (hl)
	jr   nc, +

	ld   a, $ff

+
	ld   hl, wNumBombs
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_set_c059:
	ld   hl, wNPCScriptParam1                                   ; $6932: $21 $20 $c0
	ld   a, (hl)                                     ; $6935: $7e
	ld   hl, $c059                                   ; $6936: $21 $59 $c0
	ld   (hl), a                                     ; $6939: $77
	jp   executeNPCScriptCode                               ; $693a: $c3 $8a $62


_scriptCmd_getSimilarNPCsToCurrLocationDir:
	ld   de, $0000

@checkNextNPC:
	ld   hl, wNPCBytes_ID
	add  hl, de
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	cp   (hl)
	jr   z, +

@gotoCheckNextNPC:
	inc  de
	ld   a, e
	cp   NUM_NPCS
	jr   c, @checkNextNPC

	jp   executeNPCScriptCode

+
// npc's ID is the param
	ld   hl, wCurrNpcIdx
	ld   a, e
	cp   (hl)
	jr   z, @gotoCheckNextNPC

// de is caller's Idx
// npc is not the one calling
// copy over current npc's x and y
	ld   hl, wNPC_xCoord
	add  hl, de
	ld   a, (hl)
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   (hl), a

	ld   hl, wNPC_yCoord
	add  hl, de
	ld   a, (hl)
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   (hl), a

// direction into re-used param1
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, de
	ld   a, (hl)
	and  $0f
	ld   hl, wNPCScriptParam1
	ld   (hl), a

	call keepUpperNybbleOfNPC2ndByteLower6Bits

	ld   hl, wNPCScriptParam1
	or   (hl)
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   (hl), a

	jp   npcHelper_res3_cbe4_thenNextOpcode


_scriptCmd_setCoords:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   (hl), a
	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_jump:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wNPCScriptPointerLowByte
	add  hl, bc
	ld   (hl), a
	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wNPCScriptPointerHighByte
	add  hl, bc
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_resetBit5ofNPC2ndByte_jumpIfNZ:
	call npcHelper_resetBit5OfNPC2ndByteLower6Bits
	jr   nz, _scriptCmd_jump

	jp   executeNPCScriptCode


_scriptCmd_startScrollingText:
	ld   hl, wScrollingTextByteDone
	ld   a, (hl)
	cp   $00
	jr   z, +

// done - don't proceed
	call scriptPtrMinusEqu3
	ret

+

	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wScrollingTextByteAddr
	ld   (hl), a

	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wScrollingTextByteAddr+1
	ld   (hl), a

//
	ld   hl, wNPC_xCoord
	add  hl, bc                                      ; $69da: $09
	ld   a, (hl)                                     ; $69db: $7e
	add  $08                                         ; $69dc: $c6 $08
	srl  a                                           ; $69de: $cb $3f
	srl  a                                           ; $69e0: $cb $3f
	srl  a                                           ; $69e2: $cb $3f
	ld   hl, $c067                                   ; $69e4: $21 $67 $c0
	ld   (hl), a                                     ; $69e7: $77
	ld   hl, wNPC_yCoord                                   ; $69e8: $21 $48 $cb
	add  hl, bc                                      ; $69eb: $09
	ld   a, (hl)                                     ; $69ec: $7e
	adc  $08                                         ; $69ed: $ce $08
	srl  a                                           ; $69ef: $cb $3f
	srl  a                                           ; $69f1: $cb $3f
	srl  a                                           ; $69f3: $cb $3f
	ld   hl, $c066                                   ; $69f5: $21 $66 $c0
	ld   (hl), a                                     ; $69f8: $77

	ld   hl, wNPCScriptBytesBank                                   ; $69f9: $21 $fc $cb
	add  hl, bc                                      ; $69fc: $09
	ld   a, (hl)                                     ; $69fd: $7e
	ld   hl, wScrollingTextBytesBank                                   ; $69fe: $21 $68 $c0
	ld   (hl), a                                     ; $6a01: $77

	call scrollingTextProcessControlBytes                               ; $6a02: $cd $49 $6c
	jp   executeNPCScriptCode                               ; $6a05: $c3 $8a $62


_scriptCmd_jumpIfAtLeast1key:
	ld   hl, wNumKeys
	ld   a, (hl)
	cp   $00
	jr   nz, _scriptCmd_jump

	jp   executeNPCScriptCode


_scriptCmd_call:
	ld   hl, wNPCScriptPointerLowByte
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptPointerReturnLowByte
	add  hl, bc
	ld   (hl), a
	ld   hl, wNPCScriptPointerHighByte
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptPointerReturnHighByte
	add  hl, bc
	ld   (hl), a
	jp   _scriptCmd_jump


_scriptCmd_groupRoomXYjumpTable:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, $c006
	ld   (hl), a
	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, $c007
	ld   (hl), a

@bigLoop:
// number of non-ffs read (ie exit when 3 ffs read)
	ld   a, $01                                      ; $6a3a: $3e $01
	ld   hl, $c00a                                   ; $6a3c: $21 $0a $c0
	ld   (hl), a                                     ; $6a3f: $77

// de = 0
	ld   de, $0000                                   ; $6a40: $11 $00 $00
// bc used as we copy from npc bytes bank
	ld   hl, wCurrNpcIdx                                   ; $6a43: $21 $a6 $c0
	ld   c, (hl)                                     ; $6a46: $4e
	ld   b, $00                                      ; $6a47: $06 $00
	call copyByteFrom_c006_WordPlusEinto_c009                               ; $6a49: $cd $fb $73
	ld   hl, $c009                                   ; $6a4c: $21 $09 $c0
	ld   a, (hl)                                     ; $6a4f: $7e
	cp   $ff                                         ; $6a50: $fe $ff
	jr   z, @c009equFFh                              ; $6a52: $28 $0a

	ld   hl, $c00a                                   ; $6a54: $21 $0a $c0
	inc  (hl)                                        ; $6a57: $34
	ld   hl, wCurrRoomGroup                                   ; $6a58: $21 $33 $c0
	cp   (hl)                                        ; $6a5b: $be
	jr   nz, @next                             ; $6a5c: $20 $75

@c009equFFh:
// de = 1
	inc  de                                          ; $6a5e: $13

	ld   hl, wCurrNpcIdx                                   ; $6a5f: $21 $a6 $c0
	ld   c, (hl)                                     ; $6a62: $4e
	ld   b, $00                                      ; $6a63: $06 $00
	call copyByteFrom_c006_WordPlusEinto_c009                               ; $6a65: $cd $fb $73
	ld   hl, $c009                                   ; $6a68: $21 $09 $c0
	ld   a, (hl)                                     ; $6a6b: $7e
	cp   $ff                                         ; $6a6c: $fe $ff
	jr   z, @c009equFFh2                              ; $6a6e: $28 $0a

	ld   hl, $c00a                                   ; $6a70: $21 $0a $c0
	inc  (hl)                                        ; $6a73: $34
	ld   hl, wCurrRoomX                                   ; $6a74: $21 $34 $c0
	cp   (hl)                                        ; $6a77: $be
	jr   nz, @next                             ; $6a78: $20 $59

@c009equFFh2:
// de = 2
	inc  de                                          ; $6a7a: $13

	ld   hl, wCurrNpcIdx                                   ; $6a7b: $21 $a6 $c0
	ld   c, (hl)                                     ; $6a7e: $4e
	ld   b, $00                                      ; $6a7f: $06 $00
	call copyByteFrom_c006_WordPlusEinto_c009                               ; $6a81: $cd $fb $73
	ld   hl, $c009                                   ; $6a84: $21 $09 $c0
	ld   a, (hl)                                     ; $6a87: $7e
	cp   $ff                                         ; $6a88: $fe $ff
	jr   z, @c009equFFh3                              ; $6a8a: $28 $0a

	ld   hl, $c00a                                   ; $6a8c: $21 $0a $c0
	inc  (hl)                                        ; $6a8f: $34
	ld   hl, wCurrRoomY                                   ; $6a90: $21 $35 $c0
	cp   (hl)                                        ; $6a93: $be
	jr   nz, @next                             ; $6a94: $20 $3d

@c009equFFh3:
	ld   hl, $c00a                                   ; $6a96: $21 $0a $c0
	dec  (hl)                                        ; $6a99: $35
	jr   z, @done                              ; $6a9a: $28 $4e

// de = 3
	ld   de, $0003                                   ; $6a9c: $11 $03 $00

	ld   hl, wCurrNpcIdx                                   ; $6a9f: $21 $a6 $c0
	ld   c, (hl)                                     ; $6aa2: $4e
	ld   b, $00                                      ; $6aa3: $06 $00
	call copyByteFrom_c006_WordPlusEinto_c009                               ; $6aa5: $cd $fb $73

	ld   hl, wCurrNpcIdx                                   ; $6aa8: $21 $a6 $c0
	ld   c, (hl)                                     ; $6aab: $4e
	ld   b, $00                                      ; $6aac: $06 $00
	ld   hl, $c009                                   ; $6aae: $21 $09 $c0
	ld   a, (hl)                                     ; $6ab1: $7e
	ld   hl, wNPCScriptPointerLowByte                                   ; $6ab2: $21 $90 $cb
	add  hl, bc                                      ; $6ab5: $09
	ld   (hl), a                                     ; $6ab6: $77

// de = 4
	inc  de                                          ; $6ab7: $13
	ld   hl, wCurrNpcIdx                                   ; $6ab8: $21 $a6 $c0
	ld   c, (hl)                                     ; $6abb: $4e
	ld   b, $00                                      ; $6abc: $06 $00
	call copyByteFrom_c006_WordPlusEinto_c009                               ; $6abe: $cd $fb $73
	ld   hl, wCurrNpcIdx                                   ; $6ac1: $21 $a6 $c0
	ld   c, (hl)                                     ; $6ac4: $4e
	ld   b, $00                                      ; $6ac5: $06 $00
	ld   hl, $c009                                   ; $6ac7: $21 $09 $c0
	ld   a, (hl)                                     ; $6aca: $7e
	ld   hl, wNPCScriptPointerHighByte                                   ; $6acb: $21 $9c $cb
	add  hl, bc                                      ; $6ace: $09
	ld   (hl), a                                     ; $6acf: $77
	jp   executeNPCScriptCode                               ; $6ad0: $c3 $8a $62

@next:
// param word += 5
	ld   hl, $c006                                   ; $6ad3: $21 $06 $c0
	ld   a, (hl)                                     ; $6ad6: $7e
	add  $05                                         ; $6ad7: $c6 $05
	ld   hl, $c006                                   ; $6ad9: $21 $06 $c0
	ld   (hl), a                                     ; $6adc: $77
	ld   hl, $c007                                   ; $6add: $21 $07 $c0
	ld   a, (hl)                                     ; $6ae0: $7e
	adc  $00                                         ; $6ae1: $ce $00
	ld   hl, $c007                                   ; $6ae3: $21 $07 $c0
	ld   (hl), a                                     ; $6ae6: $77
	jp   @bigLoop                               ; $6ae7: $c3 $3a $6a

@done:
	jp   executeNPCScriptCode                               ; $6aea: $c3 $8a $62


// special bytes:
// $fd - inits screen again
// $7f - exits out of screen?
// $ff - skips? checks next byte
// $42 - cursor-related?
// $fe - end of text, waits for input?
// otherwise copies 8 bytes
// if at this point, we see $ff, we loop back up to check above chars
// if at this point, we see $01, we go to next row
_scriptCmd_displayTextScreen:
	ld   hl, wNPCScriptBytesBank
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCTextBank
	ld   (hl), a
	call callCommonSoundFunc1_withFF

@initScreen:
	call npcHelper_initTextScreenGfx
	call setNormalBGP_OBP0vals
	ld   a, $06
	call setLCDfromValue_c015equA

@checkNextCharacter:
	call npcHelper_getTextByteFromBank
	cp   $7f
	jp   nz, @not7fh

	call func_232a                                       ; $6b0c: $cd $2a $23
	call callsCommonSoundFuncs_27ae                                       ; $6b0f: $cd $ae $27
	jp   executeNPCScriptCode                               ; $6b12: $c3 $8a $62

@not7fh:
	cp   $fd                                         ; $6b15: $fe $fd
	jr   z, @initScreen                              ; $6b17: $28 $e0

	cp   $ff                                         ; $6b19: $fe $ff
	jr   z, @checkNextCharacter                              ; $6b1b: $28 $e7

	cp   $42                                         ; $6b1d: $fe $42
	jr   nz, @not42                             ; $6b1f: $20 $14

// byte read is $42
	call npcHelper_getTextByteFromBank                               ; $6b21: $cd $93 $6b
	push af                                          ; $6b24: $f5
	ld   c, a                                        ; $6b25: $4f
	ld   b, $00                                      ; $6b26: $06 $00
	call callMinimalMainLoopCTimes                                       ; $6b28: $cd $1a $18
	pop  af                                          ; $6b2b: $f1
	ld   c, a                                        ; $6b2c: $4f
	ld   b, $00                                      ; $6b2d: $06 $00
	call callMinimalMainLoopCTimes                                       ; $6b2f: $cd $1a $18
	jp   @checkNextCharacter                               ; $6b32: $c3 $04 $6b

@not42:
	cp   $fe                                         ; $6b35: $fe $fe
	jr   nz, @notFE                             ; $6b37: $20 $0b

// byte read is $fe - end of text
	call waitUntilAllKeysReleased                                       ; $6b39: $cd $23 $18
	ld   e, $00                                      ; $6b3c: $1e $00
	call Call_000_19f8                                       ; $6b3e: $cd $f8 $19
	jp   @checkNextCharacter                               ; $6b41: $c3 $04 $6b

@notFE:
// a is row offset?
	ld   c, a                                        ; $6b44: $4f
	ld   e, $20                                      ; $6b45: $1e $20
	call ecEquEtimesC                                       ; $6b47: $cd $03 $08
// e into d, c into e, ie e * c into de
	ld   a, e                                        ; $6b4a: $7b
	ld   d, a                                        ; $6b4b: $57
	ld   a, c                                        ; $6b4c: $79
	ld   e, a                                        ; $6b4d: $5f
	call npcHelper_getTextByteFromBank                               ; $6b4e: $cd $93 $6b

// de += A in screen 1
	add  e                                           ; $6b51: $83
	ld   e, a                                        ; $6b52: $5f
	ld   a, d                                        ; $6b53: $7a
	ld   hl, wScreen1displayOffset                                   ; $6b54: $21 $dd $c6
	adc  (hl)                                        ; $6b57: $8e
	add  $98                                         ; $6b58: $c6 $98
	ld   d, a                                        ; $6b5a: $57

// c0fa/9 += $62 (constant start of text within round rectangle box)
	ld   a, e                                        ; $6b5b: $7b
	add  $62                                         ; $6b5c: $c6 $62
	ld   e, a                                        ; $6b5e: $5f
	ld   hl, wScrollingTextCurrRowVramStart                                   ; $6b5f: $21 $f9 $c0
	ld   (hl), e                                     ; $6b62: $73

// d part
	ld   a, d                                        ; $6b63: $7a
	adc  $00                                         ; $6b64: $ce $00
	ld   d, a                                        ; $6b66: $57
	inc  hl                                          ; $6b67: $23
	ld   (hl), a                                     ; $6b68: $77

@loopWaitForVBlankStart:
	call waitUntilStartOfVBlankPeriod                                       ; $6b69: $cd $e8 $01
	ld   c, $08                                      ; $6b6c: $0e $08

@nextC:
	call npcHelper_getTextByteFromBank                               ; $6b6e: $cd $93 $6b
	cp   $ff                                         ; $6b71: $fe $ff
	jp   z, @checkNextCharacter                            ; $6b73: $ca $04 $6b

	cp   $01                                         ; $6b76: $fe $01
	jr   z, @byteToCopyEqu1                              ; $6b78: $28 $07

	ld   (de), a                                     ; $6b7a: $12
	inc  de                                          ; $6b7b: $13

@toNextC:
	dec  c                                           ; $6b7c: $0d
	jr   nz, @nextC                             ; $6b7d: $20 $ef

	jr   @loopWaitForVBlankStart                                 ; $6b7f: $18 $e8

@byteToCopyEqu1:
// offset in c0f9/a += $20 (next row to display text)
	ld   hl, wScrollingTextCurrRowVramStart                                   ; $6b81: $21 $f9 $c0
	ld   a, (hl)                                     ; $6b84: $7e
	add  <$0020                                         ; $6b85: $c6 $20
	ld   (hl), a                                     ; $6b87: $77
	ld   e, a                                        ; $6b88: $5f
	ld   hl, wScrollingTextCurrRowVramStart+1                                   ; $6b89: $21 $fa $c0
	ld   a, (hl)                                     ; $6b8c: $7e
	adc  >$0020                                         ; $6b8d: $ce $00
	ld   (hl), a                                     ; $6b8f: $77
	ld   d, a                                        ; $6b90: $57
	jr   @toNextC                                 ; $6b91: $18 $e9


npcHelper_getTextByteFromBank:
	push de
	push bc

// c020 into src of bytes to copy low byte
	ld   hl, wNPCScriptParam1
	ld   e, (hl)
	ld   hl, wCommonByteCopyFuncSrc
	ld   (hl), e

// c021 into src of bytes to copy high byte
	ld   hl, wNPCScriptParam2
	ld   d, (hl)
	ld   hl, wCommonByteCopyFuncSrc+1
	ld   (hl), d

// next val in c020/1 back into c020/1
	inc  de
	ld   hl, wNPCScriptParam1
	ld   (hl), e
	ld   hl, wNPCScriptParam2
	ld   (hl), d

// bank to copy from at c011
	ld   hl, wNPCTextBank
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncBank
	ld   (hl), a

// copy 1 byte
	ld   a, $01
	ld   hl, wCommonByteCopyFuncNumBytes
	ld   (hl), a
	call copyBytesFromAnotherBankInto_c6d0

// c6d0 is the copied byte
	ld   hl, wCommonByteCopyDestBytes
	ld   a, (hl)
	pop  bc
	pop  de
	ret


npcHelper_initTextScreenGfx:
	call turnOffLCD
	ld   de, $9800
	call dEquDoffsetInScreen1

	ld   hl, lyt_npcTextRoundBorderScreen
	call copyLayoutFromBank3

	ld   hl, $001c
	call loadTilesetAndVramTileConversionTable_idxedHL

// reset scy and scx
	ld   hl, rSCY
	ld   a, $00
	ldi  (hl), a
	ldi  (hl), a

// use correct bg tile map display select
// screen 0 - bg 9800
// screen 1 - bg 9c00
	ld   e, $8d
	ld   hl, wScreen1displayOffset
	ld   a, (hl)
	cp   $00
	jr   nz, +
	ld   e, $85
+
	ld   hl, wLCDCvalue
	ld   (hl), e
	ret


_scriptCmd_jumpIfLampOn:
	ld   hl, wIsLampOn
	ld   a, (hl)
	cp   $00
	jr   z, +
	jp   _scriptCmd_jump
+
	jp   executeNPCScriptCode


_scriptCmd_callCommonSoundFuncs_6c01:
	ld   hl, wNPCScriptParam1
	ld   e, (hl)
	ld   hl, wNPCScriptParam2
	ld   d, (hl)
	call callCommonSoundFuncs_1513
	jp   executeNPCScriptCode


_scriptCmd_resetNPC2ndByteBit5_jumpIfOrigSet:
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	ld   a, (hl)
	and  $40
	push af
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
	xor  (hl)
	ld   (hl), a
	pop  af
	cp   $00
	jr   z, _executeNPCScriptCode_6c25

	jp   _scriptCmd_jump


_executeNPCScriptCode_6c25:
	jp   executeNPCScriptCode


_scriptCmd_jumpIfPlayerIsFullHealth:
	ld   hl, wPlayerHealth
	ld   a, (hl)
	ld   hl, wPlayerMaxHealth
	cp   (hl)
	jr   c, _executeNPCScriptCode_6c25

-
	jp   _scriptCmd_jump


_scriptCmd_flipBit4ofNPC2ndByte_jumpIfNZ:
	call npcHelper_resetBit4OfNPC2ndByteLower6Bits
	jr   nz, -

	jp   executeNPCScriptCode


npcHelper_resetBit4OfNPC2ndByteLower6Bits:
	ld   a, $10

npcHelper_resetBitOfNPC2ndByteLower6Bits:
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, bc
// a = just bit 4 or 5 of lower 6 bits
	and  (hl)
// reset that bit of the lower 6 bits
	push af
	xor  (hl)
	ld   (hl), a
	pop  af
	ret


scrollingTextProcessControlBytes:
// row byte
	ld   de, $0001
	call loadScrollingTextByteIdxedE                               ; $6c4c: $cd $ab $6c
	ld   a, e                                        ; $6c4f: $7b
	bit  7, a                                        ; $6c50: $cb $7f
	jr   z, +                              ; $6c52: $28 $06

	ld   hl, $c067                                   ; $6c54: $21 $67 $c0
	add  (hl)                                        ; $6c57: $86
	and  $1f                                         ; $6c58: $e6 $1f

+
	ld   hl, wScrollingTextVramOffset                                   ; $6c5a: $21 $64 $c0
	ld   (hl), a                                     ; $6c5d: $77

// col byte
	ld   de, $0000                                   ; $6c5e: $11 $00 $00
	call loadScrollingTextByteIdxedE                               ; $6c61: $cd $ab $6c
	ld   a, e                                        ; $6c64: $7b
	cp   $7f                                         ; $6c65: $fe $7f
	jr   z, @done                              ; $6c67: $28 $41

	cp   $80                                         ; $6c69: $fe $80
	jr   c, +                              ; $6c6b: $38 $06

	ld   hl, $c066                                   ; $6c6d: $21 $66 $c0
	add  (hl)                                        ; $6c70: $86
	and  $1f                                         ; $6c71: $e6 $1f

+
	ld   e, a                                        ; $6c73: $5f
	ld   c, $20                                      ; $6c74: $0e $20
	call ecEquEtimesC                                       ; $6c76: $cd $03 $08
	ld   hl, wScrollingTextVramOffset                                   ; $6c79: $21 $64 $c0
	ld   a, (hl)                                     ; $6c7c: $7e
	call ecPlusEquA                                       ; $6c7d: $cd $3d $08
	ld   hl, wScrollingTextVramOffset                                   ; $6c80: $21 $64 $c0
	ld   (hl), c                                     ; $6c83: $71
	ld   hl, wScrollingTextVramOffset+1                                   ; $6c84: $21 $65 $c0
	ld   (hl), e                                     ; $6c87: $73
	ld   hl, wScrollingTextCurrRowVramStart                                   ; $6c88: $21 $f9 $c0
	ld   (hl), c                                     ; $6c8b: $71
	ld   hl, wScrollingTextCurrRowVramStart+1                                   ; $6c8c: $21 $fa $c0
	ld   (hl), e                                     ; $6c8f: $73

// read past the coordinate bytes
	ld   hl, wScrollingTextByteAddr                                   ; $6c90: $21 $62 $c0
	ld   a, (hl)                                     ; $6c93: $7e
	add  $02                                         ; $6c94: $c6 $02
	ld   hl, wScrollingTextByteAddr                                   ; $6c96: $21 $62 $c0
	ld   (hl), a                                     ; $6c99: $77
	ld   hl, wScrollingTextByteAddr+1                                   ; $6c9a: $21 $63 $c0
	ld   a, (hl)                                     ; $6c9d: $7e
	adc  $00                                         ; $6c9e: $ce $00
	ld   hl, wScrollingTextByteAddr+1                                   ; $6ca0: $21 $63 $c0
	ld   (hl), a                                     ; $6ca3: $77

// don't do another byte this time
	ld   a, $ff                                      ; $6ca4: $3e $ff
	ld   hl, wScrollingTextByteDone                                   ; $6ca6: $21 $61 $c0
	ld   (hl), a                                     ; $6ca9: $77

@done:
	ret                                              ; $6caa: $c9


// bank = c068
// src = e + word in c062/3
loadScrollingTextByteIdxedE:
// c0a1 is bank
	ld   hl, wScrollingTextBytesBank
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncBank
	ld   (hl), a

// c0a0 is number of bytes
	ld   a, $01
	ld   hl, wCommonByteCopyFuncNumBytes
	ld   (hl), a

// c09b/a is source of bytes to copy
// equal to e + c063/2
	ld   a, e
	ld   hl, wScrollingTextByteAddr
	add  (hl)
	ld   hl, wCommonByteCopyFuncSrc
	ld   (hl), a
	ld   hl, wScrollingTextByteAddr+1
	ld   a, (hl)
	adc  $00
	ld   hl, wCommonByteCopyFuncSrc+1
	ld   (hl), a

// copies the byte to wCommonByteCopyDestBytes
	call copyBytesFromAnotherBankInto_c6d0
	ld   hl, wCommonByteCopyDestBytes
	ld   e, (hl)
	ld   d, $00
	ret


_scriptCmd_waitRandomValBetween2ParamsInclusive:
	call getNextRandomNumber

// a is param2 - param1
	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	sub  (hl)

// random num / above range
	ld   hl, wRandomNumber
	ld   c, (hl)
	ld   b, $00
	call bcDivA_divInC_modInAB

// mod in a and b, add to lowest number (param1)
	ld   a, b
	ld   hl, wNPCScriptParam1
	add  (hl)
	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00

// set wait to that random val
	ld   hl, wNPCBytes_timeToWait
	add  hl, bc
	ld   (hl), a

// if num is 1 less than upper bound
	ld   hl, wNPCScriptParam2
	dec  (hl)
	ld   hl, wNPCScriptParam2
	cp   (hl)
	jr   nz, @done

// randomly choose to use that higher val
	call getNextRandomNumber
	and  $01
	jr   z, @done

	ld   hl, wNPCBytes_timeToWait
	add  hl, bc
	inc  (hl)

@done:
	ret


_scriptCmd_lampOnOrOffSameBGP:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wBGPwhenLampOff
	ld   (hl), a
	ld   hl, wBGPwhenLampOn
	ld   (hl), a

	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wBGPwhenLampOff+1
	ld   (hl), a
	ld   hl, wBGPwhenLampOn+1
	ld   (hl), a

	call applyPalettesBasedOnLamp
	jp   executeNPCScriptCode


_scriptCmd_lampOnOrOffSameOBP0:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wOBP0whenLampOff
	ld   (hl), a
	ld   hl, wOBP0whenLampOn
	ld   (hl), a

	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wOBP0whenLampOff+1
	ld   (hl), a
	ld   hl, wOBP0whenLampOn+1
	ld   (hl), a

	call applyPalettesBasedOnLamp
	jp   executeNPCScriptCode


_scriptCmd_addParamsToXthenYCoords:
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	add  (hl)
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   (hl), a

	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptParam2
	add  (hl)
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   (hl), a
	jp   executeNPCScriptCode


_scriptCmd_callCommonSoundFuncs_6d6c:
	call callCommonSoundFunc1_3times                                       ; $6d6c: $cd $d7 $14
	ld   hl, wNPCScriptParam1                                   ; $6d6f: $21 $20 $c0
	ld   a, (hl)                                     ; $6d72: $7e
	ld   hl, $c009                                   ; $6d73: $21 $09 $c0
	ld   (hl), a                                     ; $6d76: $77
	ld   hl, wNPCScriptParam2                                   ; $6d77: $21 $21 $c0
	ld   a, (hl)                                     ; $6d7a: $7e
	ld   hl, $c72a                                   ; $6d7b: $21 $2a $c7
	ld   (hl), a                                     ; $6d7e: $77
	call callCommonSoundFunc0_3times                                       ; $6d7f: $cd $bf $14
	ld   a, $00                                      ; $6d82: $3e $00
	ld   hl, $c72a                                   ; $6d84: $21 $2a $c7
	ld   (hl), a                                     ; $6d87: $77
	jp   executeNPCScriptCode                               ; $6d88: $c3 $8a $62


_scriptCmd_teleportPlayer:
// copy 5 bytes
	ld   a, $05
	ld   hl, wCommonByteCopyFuncNumBytes
	ld   (hl), a

// bank to copy from based of cbfc
	ld   hl, wNPCScriptBytesBank
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncBank
	ld   (hl), a

// 2 params into src addr
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncSrc
	ld   (hl), a

	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncSrc+1
	ld   (hl), a

	call copyBytesFromAnotherBankInto_c6d0

// load those 5 bytes into c0bb to c0bf
	ld   hl, wCommonByteCopyDestBytes
	ld   a, (hl)
	ld   hl, wScriptTeleGroup
	ld   (hl), a
	ld   hl, wCommonByteCopyDestBytes+1
	ld   a, (hl)
	ld   hl, wScriptTeleRoomX
	ld   (hl), a
	ld   hl, wCommonByteCopyDestBytes+2
	ld   a, (hl)
	ld   hl, wScriptTeleRoomY
	ld   (hl), a
	ld   hl, wCommonByteCopyDestBytes+3
	ld   a, (hl)
	ld   hl, wScriptTelePlayerX
	ld   (hl), a
	ld   hl, wCommonByteCopyDestBytes+4
	ld   a, (hl)
	ld   hl, wScriptTelePlayerY
	ld   (hl), a

	jp   teleportPlayer


// seems to not spawn if the new npc would be out of bounds
_scriptCmd_spawnNPCAtOffset:
	call retZifAll12NPCslotsUsed
	jr   z, _executeNPCScriptCode_6e40

// can spawn
	ld   hl, wNPCScriptParam2                                   ; $6ddd: $21 $21 $c0
	ld   a, (hl)                                     ; $6de0: $7e
	ld   hl, $c006                                   ; $6de1: $21 $06 $c0
	ld   (hl), a                                     ; $6de4: $77

	ld   hl, wNPC_xCoord                                   ; $6de5: $21 $3c $cb
	add  hl, bc                                      ; $6de8: $09
	ld   a, (hl)                                     ; $6de9: $7e
	ld   hl, $c007                                   ; $6dea: $21 $07 $c0
	ld   (hl), a                                     ; $6ded: $77

//
	call Call_001_6e43                               ; $6dee: $cd $43 $6e
	jr   c, _executeNPCScriptCode_6e40                              ; $6df1: $38 $4d

	cp   $f1                                         ; $6df3: $fe $f1
	jr   nc, _executeNPCScriptCode_6e40                             ; $6df5: $30 $49

	ld   hl, wNPC_xCoord                                   ; $6df7: $21 $3c $cb
	add  hl, de                                      ; $6dfa: $19
	ld   (hl), a                                     ; $6dfb: $77

	ld   hl, wNPCScriptParam3                                   ; $6dfc: $21 $22 $c0
	ld   a, (hl)                                     ; $6dff: $7e
	ld   hl, $c006                                   ; $6e00: $21 $06 $c0
	ld   (hl), a                                     ; $6e03: $77
	
//
	ld   hl, wNPC_yCoord                                   ; $6e04: $21 $48 $cb
	add  hl, bc                                      ; $6e07: $09
	ld   a, (hl)                                     ; $6e08: $7e
	ld   hl, $c007                                   ; $6e09: $21 $07 $c0
	ld   (hl), a                                     ; $6e0c: $77
	call Call_001_6e43                               ; $6e0d: $cd $43 $6e

	jr   c, _executeNPCScriptCode_6e40                              ; $6e10: $38 $2e

	cp   $a1                                         ; $6e12: $fe $a1
	jr   nc, _executeNPCScriptCode_6e40                             ; $6e14: $30 $2a

	ld   hl, wNPC_yCoord                                   ; $6e16: $21 $48 $cb
	add  hl, de                                      ; $6e19: $19
	ld   (hl), a                                     ; $6e1a: $77

npcHelper_spawnNPC:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wNPCBytes_ID
	add  hl, de
	ld   (hl), a

// bc is idx of new npc
	ld   a, e
	ld   c, a
	ld   b, $00
	call initNPCscriptBytes_set_cbf0_toFF
	call loadNPCScriptPointer

// de is idx of new npc - save it
	ld   a, c
	ld   e, a
	ld   d, $00
	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00

// set direction to same as caller
	call getCurrNpcDirection
	ld   hl, wNPC2ndByteLower6Bits
	add  hl, de
	ld   (hl), a

_executeNPCScriptCode_6e40:
	jp   executeNPCScriptCode


Call_001_6e43:
	ld   hl, $c006                                   ; $6e43: $21 $06 $c0
	ld   a, (hl)                                     ; $6e46: $7e
	bit  7, a                                        ; $6e47: $cb $7f
	jp   nz, +                           ; $6e49: $c2 $51 $6e

// add (c006) into (c007) if bit 7 of c006 unset
// set cf if overflow
	ld   hl, $c007                                   ; $6e4c: $21 $07 $c0
	add  (hl)                                        ; $6e4f: $86
	ret                                              ; $6e50: $c9

+
// if bit 7 set, add into c007 again..
// and also set CF if new value is >= orig c007 value
	ld   hl, $c007                                   ; $6e51: $21 $07 $c0
	add  (hl)                                        ; $6e54: $86
	ld   hl, $c007                                   ; $6e55: $21 $07 $c0
	cp   (hl)                                        ; $6e58: $be
	ccf                                              ; $6e59: $3f
	ret                                              ; $6e5a: $c9


_scriptCmd_spawnNPC:
	call retZifAll12NPCslotsUsed
	jr   z, _executeNPCScriptCode_6e40

// param 2 and 3 are x and y of new spawned things
	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wNPC_xCoord
	add  hl, de
	ld   (hl), a
	ld   hl, wNPCScriptParam3
	ld   a, (hl)
	ld   hl, wNPC_yCoord
	add  hl, de
	ld   (hl), a
	jp   npcHelper_spawnNPC


_scriptCmd_loopAboveParamTimes:
	ld   hl, wNPCBytes_scriptLoopCounter
	add  hl, bc
	ld   a, (hl)
	cp   $00
	jr   z, @cbb4_0

@loop:
	ld   hl, wNPCBytes_scriptLoopCounter
	add  hl, bc
	dec  (hl)
	jr   nz, npcHelper_jump

	jp   executeNPCScriptCode

@cbb4_0:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wNPCBytes_scriptLoopCounter
	add  hl, bc
	ld   (hl), a
	jp   @loop


_scriptCmd_jumpIfRandomNumLTparam:
	call getNextRandomNumber
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wRandomNumber
	cp   (hl)
	jr   nc, npcHelper_jump

	jp   executeNPCScriptCode


_scriptCmd_jumpIfArmorOfGodGotten:
	ld   hl, wArmorOfGodGotten
	ld   a, (hl)

npcHelper_checkItemGotten:
	ld   hl, wNPCScriptParam1
	and  (hl)
	jr   z, npcHelper_jump@done

npcHelper_jump:
	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wNPCScriptPointerLowByte
	add  hl, bc
	ld   (hl), a
	ld   hl, wNPCScriptParam3
	ld   a, (hl)
	ld   hl, wNPCScriptPointerHighByte
	add  hl, bc
	ld   (hl), a

@done:
	jp   executeNPCScriptCode


_scriptCmd_jumpIfSpecialBitemGotten:
	ld   hl, wSpecialBitemsGotten
	ld   a, (hl)
	jp   npcHelper_checkItemGotten


_scriptCmd_jumpIfNumBirdsGotten:
	ld   hl, wNumBirds
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	cp   (hl)
	jr   nc, npcHelper_jump

	jp   executeNPCScriptCode


_scriptCmd_placeTile:
	ld   hl, wNPCScriptParam3
	ld   a, (hl)
	bit  7, a
	jr   z, +

// if bit 7 set, divide npc's Y by 16 and round up, for c006
// add to param3 later (so bit 7 set means offset, unset means absolute)
	ld   hl, wNPC_yCoord                                   ; $6edf: $21 $48 $cb
	add  hl, bc                                      ; $6ee2: $09
	ld   a, (hl)                                     ; $6ee3: $7e
	add  $08                                         ; $6ee4: $c6 $08
	srl  a                                           ; $6ee6: $cb $3f
	srl  a                                           ; $6ee8: $cb $3f
	srl  a                                           ; $6eea: $cb $3f
	srl  a                                           ; $6eec: $cb $3f
	ld   hl, $c006                                   ; $6eee: $21 $06 $c0
	ld   (hl), a                                     ; $6ef1: $77

// offset c006 with param 3 and move to lower nybble
	ld   hl, wNPCScriptParam3                                   ; $6ef2: $21 $22 $c0
	ld   a, (hl)                                     ; $6ef5: $7e
	ld   hl, $c006                                   ; $6ef6: $21 $06 $c0
	add  (hl)                                        ; $6ef9: $86
	and  $0f                                         ; $6efa: $e6 $0f

+
// if bit 7 not set, c007 is a 2x2 tile y
	ld   hl, wNPCScriptParam3                                   ; $6efc: $21 $22 $c0
	ld   (hl), a                                     ; $6eff: $77
	sla  a                                           ; $6f00: $cb $27
	sla  a                                           ; $6f02: $cb $27
	sla  a                                           ; $6f04: $cb $27
	sla  a                                           ; $6f06: $cb $27
	ld   hl, $c007                                   ; $6f08: $21 $07 $c0
	ld   (hl), a                                     ; $6f0b: $77

// now to check param 2 (x)
	ld   hl, wCurrNpcIdx                                   ; $6f0c: $21 $a6 $c0
	ld   c, (hl)                                     ; $6f0f: $4e
	ld   b, $00                                      ; $6f10: $06 $00
	ld   hl, wNPCScriptParam2                                   ; $6f12: $21 $21 $c0
	ld   a, (hl)                                     ; $6f15: $7e
	bit  7, a                                        ; $6f16: $cb $7f
	jr   z, +                              ; $6f18: $28 $1d

	ld   hl, wNPC_xCoord                                   ; $6f1a: $21 $3c $cb
	add  hl, bc                                      ; $6f1d: $09
	ld   a, (hl)                                     ; $6f1e: $7e
	add  $08                                         ; $6f1f: $c6 $08
	srl  a                                           ; $6f21: $cb $3f
	srl  a                                           ; $6f23: $cb $3f
	srl  a                                           ; $6f25: $cb $3f
	srl  a                                           ; $6f27: $cb $3f
	ld   hl, $c006                                   ; $6f29: $21 $06 $c0
	ld   (hl), a                                     ; $6f2c: $77
	ld   hl, wNPCScriptParam2                                   ; $6f2d: $21 $21 $c0
	ld   a, (hl)                                     ; $6f30: $7e
	ld   hl, $c006                                   ; $6f31: $21 $06 $c0
	add  (hl)                                        ; $6f34: $86
	and  $0f                                         ; $6f35: $e6 $0f

+
	ld   hl, wNPCScriptParam2                                   ; $6f37: $21 $21 $c0
	ld   (hl), a                                     ; $6f3a: $77
	ld   hl, $c007                                   ; $6f3b: $21 $07 $c0
	ld   c, (hl)                                     ; $6f3e: $4e
	ld   b, $00                                      ; $6f3f: $06 $00
	ld   de, $0000                                   ; $6f41: $11 $00 $00
	call ecPlusEquA                                       ; $6f44: $cd $3d $08
	ld   a, c                                        ; $6f47: $79
	cp   $b0                                         ; $6f48: $fe $b0
	jr   nc, @done                             ; $6f4a: $30 $35

// param 1 is tile type to replace with
// store in game screen tiles
	ld   hl, wNPCScriptParam1                                   ; $6f4c: $21 $20 $c0
	ld   a, (hl)                                     ; $6f4f: $7e
	ld   hl, w2x2gameScreenTiles                                   ; $6f50: $21 $b0 $c3
	add  hl, bc                                      ; $6f53: $09
	ld   (hl), a                                     ; $6f54: $77
	ld   hl, $c028                                   ; $6f55: $21 $28 $c0
	ld   (hl), a                                     ; $6f58: $77
	ld   a, c                                        ; $6f59: $79
	push af                                          ; $6f5a: $f5

// as well as to tile types
	ld   a, $00                                      ; $6f5b: $3e $00
	call convertCurrTileToTileType                                       ; $6f5d: $cd $6b $07
	pop  af                                          ; $6f60: $f1
	ld   c, a                                        ; $6f61: $4f
	ld   b, $00                                      ; $6f62: $06 $00
	ld   a, e                                        ; $6f64: $7b
	ld   hl, w2x2tileTypes                                   ; $6f65: $21 $00 $c3
	add  hl, bc                                      ; $6f68: $09
	ld   (hl), a                                     ; $6f69: $77

// c00c is x of tile, c00d is y of tile
	ld   hl, wNPCScriptParam2                                   ; $6f6a: $21 $21 $c0
	ld   c, (hl)                                     ; $6f6d: $4e
	ld   b, $00                                      ; $6f6e: $06 $00
	ld   hl, $c00c                                   ; $6f70: $21 $0c $c0
	ld   (hl), c                                     ; $6f73: $71
	ld   hl, wNPCScriptParam3                                   ; $6f74: $21 $22 $c0
	ld   e, (hl)                                     ; $6f77: $5e
	ld   d, $00                                      ; $6f78: $16 $00
	ld   hl, $c00d                                   ; $6f7a: $21 $0d $c0
	ld   (hl), e                                     ; $6f7d: $73
	call Call_001_59ba                               ; $6f7e: $cd $ba $59

@done:
	jp   executeNPCScriptCode                               ; $6f81: $c3 $8a $62


_scriptCmd_jumpIfItemGotten:
	call getItemsGottenByteAndBitToCheckForItem
	ld   hl, wNPCScriptParam1
	ld   (hl), a
	ld   hl, wItemsGotten
	add  hl, bc
	ld   a, (hl)

	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00
	jp   npcHelper_checkItemGotten


_scriptCmd_jumpIfAtTile:
	ld   hl, wNPC_yCoord                                   ; $6f99: $21 $48 $cb
	add  hl, bc                                      ; $6f9c: $09
	ld   a, (hl)                                     ; $6f9d: $7e
	add  $08                                         ; $6f9e: $c6 $08
	srl  a                                           ; $6fa0: $cb $3f
	srl  a                                           ; $6fa2: $cb $3f
	srl  a                                           ; $6fa4: $cb $3f
	srl  a                                           ; $6fa6: $cb $3f
	ld   e, a                                        ; $6fa8: $5f
	ld   d, $00                                      ; $6fa9: $16 $00
	ld   hl, wNPC_xCoord                                   ; $6fab: $21 $3c $cb
	add  hl, bc                                      ; $6fae: $09
	ld   a, (hl)                                     ; $6faf: $7e
	add  $08                                         ; $6fb0: $c6 $08
	srl  a                                           ; $6fb2: $cb $3f
	srl  a                                           ; $6fb4: $cb $3f
	srl  a                                           ; $6fb6: $cb $3f
	srl  a                                           ; $6fb8: $cb $3f
	ld   c, a                                        ; $6fba: $4f
	ld   b, $00                                      ; $6fbb: $06 $00
	call c028_equGameScreenTileIdx_16ePlusC                               ; $6fbd: $cd $0c $40
	ld   hl, wCurrNpcIdx                                   ; $6fc0: $21 $a6 $c0
	ld   c, (hl)                                     ; $6fc3: $4e
	ld   b, $00                                      ; $6fc4: $06 $00
	ld   hl, $c028                                   ; $6fc6: $21 $28 $c0
	ld   a, (hl)                                     ; $6fc9: $7e
	and  $fc                                         ; $6fca: $e6 $fc
	ld   hl, wNPCScriptParam1                                   ; $6fcc: $21 $20 $c0
	cp   (hl)                                        ; $6fcf: $be
	jr   nz, +                             ; $6fd0: $20 $03

npcHelper_jump_6fd2:
	jp   npcHelper_jump

+
	jp   executeNPCScriptCode


_scriptCmd_jumpIfMoreThanNumBombsGotten:
	ld   hl, wNumBombs
	ld   a, (hl)

npcHelper_jumpIfAtLeastParam1gotten:
	ld   hl, wNPCScriptParam1
	cp   (hl)
	jr   nc, npcHelper_jump_6fd2

	jp   executeNPCScriptCode


_scriptCmd_jumpIfMoreThanNumOilsGotten:
	ld   hl, wAnointingOilsGotten
	ld   a, (hl)
	jp   npcHelper_jumpIfAtLeastParam1gotten


_scriptCmd_jumpIfMoreThanParam1HealthGotten:
	ld   hl, wPlayerHealth
	ld   a, (hl)
	jp   npcHelper_jumpIfAtLeastParam1gotten


_scriptCmd_jumpIfButtonsPressed:
	call pollInput
	ld   hl, wKeysPressed
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	and  (hl)
	jr   z, _executeNPCScriptCode_7003

	jp   npcHelper_jump


_executeNPCScriptCode_7003:
	jp   executeNPCScriptCode


_scriptCmd_moveNPC_jumpIfCant:
	call npcHelper_offsetNPCCoordsByScriptByte1
	jr   nc, _executeNPCScriptCode_7003

	jp   npcHelper_jump


_scriptCmd_quiz:
	ld   hl, wCurrNpcIdx                                   ; $700e: $21 $a6 $c0
	ld   a, (hl)                                     ; $7011: $7e
	push af                                          ; $7012: $f5
	call callCommonSoundFunc1_withFF                                       ; $7013: $cd $32 $15
	ld   a, $00                                      ; $7016: $3e $00
	ld   hl, wScrollingTextByteDone                                   ; $7018: $21 $61 $c0
	ld   (hl), a                                     ; $701b: $77
	ld   a, $00                                      ; $701c: $3e $00
	ld   hl, wNPCScriptOpcode                                   ; $701e: $21 $1f $c0
	ld   (hl), a                                     ; $7021: $77

@massiveLoop_7022:
	call turnOffLCD                                       ; $7022: $cd $0d $02
	call clear_c200_to_c2ff                               ; $7025: $cd $9e $5b
	call copyA0hDataToOam                                       ; $7028: $cd $99 $1a
	ld   c, :func_01_0b29                                      ; $702b: $0e $01
	ld   hl, func_01_0b29                                   ; $702d: $21 $29 $0b
	call callHLinBankC                                       ; $7030: $cd $4e $01
	ld   de, $982b                                   ; $7033: $11 $2b $98
	call dEquDoffsetInScreen1                                       ; $7036: $cd $a8 $1e
	ld   hl, $c00a                                   ; $7039: $21 $0a $c0
	inc  (hl)                                        ; $703c: $34
	ld   a, (hl)                                     ; $703d: $7e
	call Call_001_5af8                               ; $703e: $cd $f8 $5a
	ld   bc, $0001                                   ; $7041: $01 $01 $00
	call Call_001_719b                               ; $7044: $cd $9b $71
	ld   bc, $0002                                   ; $7047: $01 $02 $00
	call Call_001_71b4                               ; $704a: $cd $b4 $71
	ld   bc, $0000                                   ; $704d: $01 $00 $00
	call Call_001_71cc                               ; $7050: $cd $cc $71
	ld   hl, $0020                                   ; $7053: $21 $20 $00
	call loadTilesetAndVramTileConversionTable_idxedHL                                       ; $7056: $cd $7a $17
	ld   hl, wLCDCvalue                                   ; $7059: $21 $00 $d0
	ld   a, $9f                                      ; $705c: $3e $9f
	ld   (hl), a                                     ; $705e: $77
	ld   hl, rSCY                                   ; $705f: $21 $42 $ff
	ld   (hl), $00                                   ; $7062: $36 $00
	inc  hl                                          ; $7064: $23
	ld   (hl), $04                                   ; $7065: $36 $04
	call setNormalBGP_OBP0vals                                       ; $7067: $cd $30 $1e
	ld   a, $06                                      ; $706a: $3e $06
	call setLCDfromValue_c015equA                                       ; $706c: $cd $11 $02
	ld   a, $14                                      ; $706f: $3e $14
	ld   hl, wOam+1                                   ; $7071: $21 $01 $c2
	ld   (hl), a                                     ; $7074: $77
	ld   a, $2a                                      ; $7075: $3e $2a
	ld   hl, wOam+2                                   ; $7077: $21 $02 $c2
	ld   (hl), a                                     ; $707a: $77
	ld   hl, wOam+3                                   ; $707b: $21 $03 $c2
	ld   (hl), $10                                   ; $707e: $36 $10
	ld   a, $00                                      ; $7080: $3e $00
	ld   hl, $c097                                   ; $7082: $21 $97 $c0
	ld   (hl), a                                     ; $7085: $77
	ld   a, $79                                      ; $7086: $3e $79
	ld   hl, $c0b1                                   ; $7088: $21 $b1 $c0
	ld   (hl), a                                     ; $708b: $77
	call Call_000_0c69                                       ; $708c: $cd $69 $0c
	ld   hl, $c097                                   ; $708f: $21 $97 $c0
	ld   a, (hl)                                     ; $7092: $7e
	ld   hl, $c0c4                                   ; $7093: $21 $c4 $c0
	cp   (hl)                                        ; $7096: $be
	jr   z, +                              ; $7097: $28 $03

	jp   @func_7147                               ; $7099: $c3 $47 $71

+
	ld   a, $ff                                      ; $709c: $3e $ff
	ld   hl, $c72a                                   ; $709e: $21 $2a $c7
	ld   (hl), a                                     ; $70a1: $77
	ld   a, $03                                      ; $70a2: $3e $03
	ld   hl, $c009                                   ; $70a4: $21 $09 $c0
	ld   (hl), a                                     ; $70a7: $77
	call callCommonSoundFunc0_3times                                       ; $70a8: $cd $bf $14
	ld   a, $00                                      ; $70ab: $3e $00
	ld   hl, $c72a                                   ; $70ad: $21 $2a $c7
	ld   (hl), a                                     ; $70b0: $77
	call Call_001_7254                               ; $70b1: $cd $54 $72
	ld   bc, $0002                                   ; $70b4: $01 $02 $00
	call Call_001_71b4                               ; $70b7: $cd $b4 $71
	call callMinimalMainLoop0fhTimes                                       ; $70ba: $cd $18 $18
	ld   bc, $0003                                   ; $70bd: $01 $03 $00
	call Call_001_71b4                               ; $70c0: $cd $b4 $71
	call callMinimalMainLoop0fhTimes                                       ; $70c3: $cd $18 $18
	ld   bc, $0004                                   ; $70c6: $01 $04 $00
	call Call_001_71b4                               ; $70c9: $cd $b4 $71
	call callMinimalMainLoop0fhTimes                                       ; $70cc: $cd $18 $18
	ld   hl, wNPCScriptParam2                                   ; $70cf: $21 $21 $c0
	ld   a, (hl)                                     ; $70d2: $7e
	cp   $01                                         ; $70d3: $fe $01
	jr   nz, @next_70e5                             ; $70d5: $20 $0e

	ld   hl, wNPCScriptOpcode                                   ; $70d7: $21 $1f $c0
	ld   a, (hl)                                     ; $70da: $7e
	cp   $00                                         ; $70db: $fe $00
	jr   nz, @next_70e5                             ; $70dd: $20 $06

	call Call_001_7267                               ; $70df: $cd $67 $72
	call callMinimalMainLoop1ehTimes                                       ; $70e2: $cd $15 $18

@next_70e5:
-
	call minimalMainLoop                                       ; $70e5: $cd $5e $1a
	call Call_000_14f8                                       ; $70e8: $cd $f8 $14
	jr   nz, -                             ; $70eb: $20 $f8

	ld   hl, wNPCScriptParam3                                   ; $70ed: $21 $22 $c0
	ld   c, (hl)                                     ; $70f0: $4e
	ld   b, $00                                      ; $70f1: $06 $00
	ld   a, c                                        ; $70f3: $79
	cp   $ff                                         ; $70f4: $fe $ff
	jr   nz, +                             ; $70f6: $20 $06

	call add2toPlayerHealth                               ; $70f8: $cd $84 $50
	jp   @bigLoop_7125                               ; $70fb: $c3 $25 $71

+
	ld   c, $05                                      ; $70fe: $0e $05
	ld   hl, wNPCScriptParam3                                   ; $7100: $21 $22 $c0
	ld   a, (hl)                                     ; $7103: $7e
	cp   $03                                         ; $7104: $fe $03
	jr   nz, @startAddingBirdsMaxFF                             ; $7106: $20 $02

	ld   c, $0a                                      ; $7108: $0e $0a

@startAddingBirdsMaxFF:
	ld   hl, wNumBirds                                   ; $710a: $21 $08 $c7
	inc  (hl)                                        ; $710d: $34
	jr   nz, +                             ; $710e: $20 $04

	ld   hl, wNumBirds                                   ; $7110: $21 $08 $c7
	dec  (hl)                                        ; $7113: $35

+
	dec  c                                           ; $7114: $0d
	jr   nz, @startAddingBirdsMaxFF                             ; $7115: $20 $f3

	ld   hl, wNPCScriptParam3                                   ; $7117: $21 $22 $c0
	ld   a, (hl)                                     ; $711a: $7e
	cp   $01                                         ; $711b: $fe $01
	jr   z, @bigLoop_7125                              ; $711d: $28 $06

	call add2toPlayerHealth                               ; $711f: $cd $84 $50
	call add2toPlayerHealth                               ; $7122: $cd $84 $50

@bigLoop_7125:
	ld   hl, wNPCScriptParam2                                   ; $7125: $21 $21 $c0
	dec  (hl)                                        ; $7128: $35
	jr   z, @done                              ; $7129: $28 $5c

	ld   hl, wNPCScriptParam1                                   ; $712b: $21 $20 $c0
	ld   a, (hl)                                     ; $712e: $7e
	cp   $ff                                         ; $712f: $fe $ff
	jr   z, ++                              ; $7131: $28 $0c

	add  $01                                         ; $7133: $c6 $01
	cp   $fa                                         ; $7135: $fe $fa
	jr   c, +                              ; $7137: $38 $02

	ld   a, $00                                      ; $7139: $3e $00

+
	ld   hl, wNPCScriptParam1                                   ; $713b: $21 $20 $c0
	ld   (hl), a                                     ; $713e: $77

++
	ld   e, $3c                                      ; $713f: $1e $3c
	call Call_000_19f8                                       ; $7141: $cd $f8 $19
	jp   @massiveLoop_7022                               ; $7144: $c3 $22 $70

@func_7147:
	ld   hl, wNPCScriptOpcode                                   ; $7147: $21 $1f $c0
	inc  (hl)                                        ; $714a: $34
	ld   de, $15e0                                   ; $714b: $11 $e0 $15
	ld   a, $00                                      ; $714e: $3e $00
	call commonSoundFunc0                                       ; $7150: $cd $be $01
	ld   de, $15e9                                   ; $7153: $11 $e9 $15
	ld   a, $01                                      ; $7156: $3e $01
	call commonSoundFunc0                                       ; $7158: $cd $be $01
	ld   bc, $0000                                   ; $715b: $01 $00 $00
	call Call_001_71b4                               ; $715e: $cd $b4 $71
	call callMinimalMainLoop0fhTimes                                       ; $7161: $cd $18 $18
	ld   bc, $0002                                   ; $7164: $01 $02 $00
	call Call_001_719b                               ; $7167: $cd $9b $71
	call callMinimalMainLoop0fhTimes                                       ; $716a: $cd $18 $18
	ld   bc, $0001                                   ; $716d: $01 $01 $00
	call Call_001_719b                               ; $7170: $cd $9b $71
	call callMinimalMainLoop0fhTimes                                       ; $7173: $cd $18 $18
	ld   bc, $0001                                   ; $7176: $01 $01 $00
	call Call_001_71b4                               ; $7179: $cd $b4 $71

-
	call minimalMainLoop                                       ; $717c: $cd $5e $1a
	call Call_000_14f8                                       ; $717f: $cd $f8 $14
	jr   nz, -                             ; $7182: $20 $f8

	jp   @bigLoop_7125                               ; $7184: $c3 $25 $71

@done:
	call callMinimalMainLoop78hTimes                                       ; $7187: $cd $0f $18
	call func_232a                                       ; $718a: $cd $2a $23
	call callsCommonSoundFuncs_27ae                                       ; $718d: $cd $ae $27
	pop  af                                          ; $7190: $f1
	ld   hl, wCurrNpcIdx                                   ; $7191: $21 $a6 $c0
	ld   (hl), a                                     ; $7194: $77
	jp   executeNPCScriptCode                               ; $7195: $c3 $8a $62


data_7198:
	add  h                                           ; $7198: $84
	add  b                                           ; $7199: $80
	sub  b                                           ; $719a: $90

Call_001_719b:
	ld   a, $00                                      ; $719b: $3e $00
	ld   hl, $c006                                   ; $719d: $21 $06 $c0
	ld   (hl), a                                     ; $71a0: $77
	ld   de, $0008                                   ; $71a1: $11 $08 $00
	ld   hl, data_7198                                   ; $71a4: $21 $98 $71
	add  hl, bc                                      ; $71a7: $09
	ld   a, (hl)                                     ; $71a8: $7e
	ld   bc, $0021                                   ; $71a9: $01 $21 $00
	jp   Call_001_71eb                               ; $71ac: $c3 $eb $71


data_71af:
	adc  d                                           ; $71af: $8a
	adc  h                                           ; $71b0: $8c
	adc  b                                           ; $71b1: $88
	adc  (hl)                                        ; $71b2: $8e
	and  b                                           ; $71b3: $a0

Call_001_71b4:
	ld   a, $00                                      ; $71b4: $3e $00
	ld   hl, $c006                                   ; $71b6: $21 $06 $c0
	ld   (hl), a                                     ; $71b9: $77
	ld   de, $0010                                   ; $71ba: $11 $10 $00
	ld   hl, data_71af                                   ; $71bd: $21 $af $71
	add  hl, bc                                      ; $71c0: $09
	ld   a, (hl)                                     ; $71c1: $7e
	ld   bc, $0029                                   ; $71c2: $01 $29 $00
	jp   Jump_001_7235                               ; $71c5: $c3 $35 $72


data_71c8:
	sub  h                                           ; $71c8: $94
	sbc  b                                           ; $71c9: $98
	sbc  h                                           ; $71ca: $9c
	sbc  b                                           ; $71cb: $98

Call_001_71cc:
	ld   a, $00                                      ; $71cc: $3e $00
	ld   hl, $c006                                   ; $71ce: $21 $06 $c0
	ld   (hl), a                                     ; $71d1: $77
	ld   a, c                                        ; $71d2: $79
	cp   $01                                         ; $71d3: $fe $01
	jr   nz, +                             ; $71d5: $20 $05

	ld   a, $00                                      ; $71d7: $3e $00
	or   $20                                         ; $71d9: $f6 $20
	ld   (hl), a                                     ; $71db: $77

+
	ld   de, $0018                                   ; $71dc: $11 $18 $00
	ld   hl, data_71c8                                   ; $71df: $21 $c8 $71
	add  hl, bc                                      ; $71e2: $09
	ld   a, (hl)                                     ; $71e3: $7e
	ld   bc, $0034                                   ; $71e4: $01 $34 $00
	call Call_001_71eb                               ; $71e7: $cd $eb $71
	ret                                              ; $71ea: $c9


Call_001_71eb:
	push af                                          ; $71eb: $f5
	ld   hl, $c006                                   ; $71ec: $21 $06 $c0
	ld   a, (hl)                                     ; $71ef: $7e
	ld   hl, wOam+3                                   ; $71f0: $21 $03 $c2
	add  hl, de                                      ; $71f3: $19
	ld   (hl), a                                     ; $71f4: $77
	ld   hl, wOam+7                                   ; $71f5: $21 $07 $c2
	add  hl, de                                      ; $71f8: $19
	ld   (hl), a                                     ; $71f9: $77
	and  $20                                         ; $71fa: $e6 $20
	jr   z, +                              ; $71fc: $28 $10

	pop  af                                          ; $71fe: $f1
	ld   hl, wOam+6                                   ; $71ff: $21 $06 $c2
	add  hl, de                                      ; $7202: $19
	ld   (hl), a                                     ; $7203: $77
	add  $02                                         ; $7204: $c6 $02
	ld   hl, wOam+2                                   ; $7206: $21 $02 $c2
	add  hl, de                                      ; $7209: $19
	ld   (hl), a                                     ; $720a: $77
	jp   Jump_001_721b                               ; $720b: $c3 $1b $72

+
	pop  af                                          ; $720e: $f1
	ld   hl, wOam+2                                   ; $720f: $21 $02 $c2
	add  hl, de                                      ; $7212: $19
	ld   (hl), a                                     ; $7213: $77
	add  $02                                         ; $7214: $c6 $02
	ld   hl, wOam+6                                   ; $7216: $21 $06 $c2
	add  hl, de                                      ; $7219: $19
	ld   (hl), a                                     ; $721a: $77

Jump_001_721b:
	ld   a, c                                        ; $721b: $79
	ld   hl, wOam                                   ; $721c: $21 $00 $c2
	add  hl, de                                      ; $721f: $19
	ld   (hl), a                                     ; $7220: $77
	ld   hl, wOam+4                                   ; $7221: $21 $04 $c2
	add  hl, de                                      ; $7224: $19
	ld   (hl), a                                     ; $7225: $77
	ld   a, $7c                                      ; $7226: $3e $7c
	ld   hl, wOam+1                                   ; $7228: $21 $01 $c2
	add  hl, de                                      ; $722b: $19
	ld   (hl), a                                     ; $722c: $77
	add  $08                                         ; $722d: $c6 $08
	ld   hl, wOam+5                                   ; $722f: $21 $05 $c2
	add  hl, de                                      ; $7232: $19
	ld   (hl), a                                     ; $7233: $77
	ret                                              ; $7234: $c9

Jump_001_7235:
	push af                                          ; $7235: $f5
	ld   hl, $c006                                   ; $7236: $21 $06 $c0
	ld   a, (hl)                                     ; $7239: $7e
	ld   hl, wOam+3                                   ; $723a: $21 $03 $c2
	add  hl, de                                      ; $723d: $19
	ld   (hl), a                                     ; $723e: $77
	ld   hl, wOam+7                                   ; $723f: $21 $07 $c2
	add  hl, de                                      ; $7242: $19
	xor  $20                                         ; $7243: $ee $20
	ld   (hl), a                                     ; $7245: $77
	pop  af                                          ; $7246: $f1
	ld   hl, wOam+2                                   ; $7247: $21 $02 $c2
	add  hl, de                                      ; $724a: $19
	ld   (hl), a                                     ; $724b: $77
	ld   hl, wOam+6                                   ; $724c: $21 $06 $c2
	add  hl, de                                      ; $724f: $19
	ld   (hl), a                                     ; $7250: $77
	jp   Jump_001_721b                               ; $7251: $c3 $1b $72


Call_001_7254:
	ld   bc, $0000                                   ; $7254: $01 $00 $00
	call Call_001_719b                               ; $7257: $cd $9b $71
	call callMinimalMainLoop1ehTimes                                       ; $725a: $cd $15 $18
	ld   bc, $0001                                   ; $725d: $01 $01 $00
	call Call_001_719b                               ; $7260: $cd $9b $71
	call callMinimalMainLoop1ehTimes                                       ; $7263: $cd $15 $18
	ret                                              ; $7266: $c9


Call_001_7267:
	ld   c, $00                                      ; $7267: $0e $00
	ld   b, $14                                      ; $7269: $06 $14

@loop:
	inc  c                                           ; $726b: $0c
	bit  2, c                                        ; $726c: $cb $51
	jr   z, +                              ; $726e: $28 $08

	push bc                                          ; $7270: $c5
	call safeCallCommonSoundFuncs_with20h                                       ; $7271: $cd $ff $27
	pop  bc                                          ; $7274: $c1
	ld   c, $00                                      ; $7275: $0e $00
	dec  b                                           ; $7277: $05

+
	push bc                                          ; $7278: $c5
	ld   b, $00                                      ; $7279: $06 $00
	call Call_001_71cc                               ; $727b: $cd $cc $71
	call minimalMainLoop                                       ; $727e: $cd $5e $1a
	pop  bc                                          ; $7281: $c1
	ld   a, b                                        ; $7282: $78
	cp   $00                                         ; $7283: $fe $00
	jr   nz, @loop                             ; $7285: $20 $e4

	ret                                              ; $7287: $c9


_scriptCmd_jumpIfFacingDirection:
	call getCurrNpcDirection
	ld   hl, wNPCScriptParam1
	cp   (hl)
	jr   nz, +
	jp   npcHelper_jump
+
	jp   executeNPCScriptCode


loadNPCAttrs:
	ld   bc, $0000

@checkNextNPC:
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)
	cp   $ff
	jr   z, +

	call loadNPCScriptPointer
	call initNPCscriptBytes

+
	inc  bc
	ld   a, c
	cp   NUM_NPCS
	jr   c, @checkNextNPC

	ret


loadNPCScriptPointer:
	call copy8npcMetadataBytesInto_c6d0
	ld   hl, wCommonByteCopyDestBytes+2
	ld   a, (hl)
	ld   hl, wNPCScriptPointerLowByte
	add  hl, bc
	ld   (hl), a
	ld   hl, wCommonByteCopyDestBytes+3
	ld   a, (hl)
	ld   hl, wNPCScriptPointerHighByte
	add  hl, bc
	ld   (hl), a
	ret


copy8npcMetadataBytesInto_c6d0:
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncSrc
// src = 1st byte * 8
	ld   (hl), a
	ld   a, $00
	sla  (hl)
	rl   a
	sla  (hl)
	rl   a
	sla  (hl)
	rl   a
	ld   hl, wCommonByteCopyFuncSrc+1
	ld   (hl), a
	ld   hl, wCommonByteCopyFuncSrc
	ld   a, (hl)
	add  <npcStructs
	ld   (hl), a
	ld   hl, wCommonByteCopyFuncSrc+1
	ld   a, (hl)
	adc  >npcStructs
	ld   (hl), a
// bank 3
	ld   hl, wCommonByteCopyFuncBank
	ld   (hl), :npcStructs
// copy 8 bytes
	ld   hl, wCommonByteCopyFuncNumBytes
	ld   (hl), $08
	call copyBytesFromAnotherBankInto_c6d0
	ret


initNPCscriptBytes_set_cbf0_toFF:
	ld   a, $ff                                      ; $72fd: $3e $ff
	ld   hl, wNPCBytes_cbf0                                   ; $72ff: $21 $f0 $cb
	add  hl, bc                                      ; $7302: $09
	ld   (hl), a                                     ; $7303: $77

initNPCscriptBytes:
//
	ld   a, $10                                      ; $7304: $3e $10
	ld   hl, wNPCBytes_cb60                                   ; $7306: $21 $60 $cb
	add  hl, bc                                      ; $7309: $09
	ld   (hl), a                                     ; $730a: $77

//
	ld   a, $00                                      ; $730b: $3e $00
	ld   hl, wNPCBytes_cb6c                                   ; $730d: $21 $6c $cb
	add  hl, bc                                      ; $7310: $09
	ld   (hl), a                                     ; $7311: $77

//
	ld   hl, wNPCBytes_timeToWait                                   ; $7312: $21 $78 $cb
	add  hl, bc                                      ; $7315: $09
	ld   (hl), a                                     ; $7316: $77

//
	ld   hl, wNPCBytes_pixelsToMove                                   ; $7317: $21 $a8 $cb
	add  hl, bc                                      ; $731a: $09
	ld   (hl), a                                     ; $731b: $77

// for do-while loops
	ld   hl, wNPCBytes_scriptLoopCounter                                   ; $731c: $21 $b4 $cb
	add  hl, bc                                      ; $731f: $09
	ld   (hl), a                                     ; $7320: $77

//
	ld   hl, wNPCBytes_damageAndMovementSpeed                                   ; $7321: $21 $54 $cb
	add  hl, bc                                      ; $7324: $09
	ld   (hl), a                                     ; $7325: $77

// $ff means don't change NPC's ID
	ld   a, $ff                                      ; $7326: $3e $ff
	ld   hl, wNPCBytes_newID                                   ; $7328: $21 $c0 $cb
	add  hl, bc                                      ; $732b: $09
	ld   (hl), a                                     ; $732c: $77

// get bank where script bytes are based on ID
	ld   de, $0003                                   ; $732d: $11 $03 $00
	ld   hl, wNPCBytes_ID                                   ; $7330: $21 $30 $cb
	add  hl, bc                                      ; $7333: $09
	ld   a, (hl)                                     ; $7334: $7e
	cp   $6a                                         ; $7335: $fe $6a
	jr   c, +                              ; $7337: $38 $0a

// npc idx is >= $6a
	ld   de, $0002                                   ; $7339: $11 $02 $00
	cp   $bf                                         ; $733c: $fe $bf
	jr   c, +                              ; $733e: $38 $03

// npc idx >= $bf
	ld   de, $0006                                   ; $7340: $11 $06 $00

+
	ld   a, e                                        ; $7343: $7b
	ld   hl, wNPCScriptBytesBank                                   ; $7344: $21 $fc $cb
	add  hl, bc                                      ; $7347: $09
	ld   (hl), a                                     ; $7348: $77

//
	ld   hl, wNPCBytes_cbe4                                   ; $7349: $21 $e4 $cb
	add  hl, bc                                      ; $734c: $09
	ld   (hl), $00                                   ; $734d: $36 $00
	ret                                              ; $734f: $c9


retZifAll12NPCslotsUsed:
	ld   de, $0000

@checkNextNPC:
	ld   hl, wNPCBytes_ID
	add  hl, de
	ld   a, (hl)
	cp   $ff
	jr   z, @done

	inc  de
	ld   a, e
	cp   NUM_NPCS
	jr   c, @checkNextNPC

	ld   a, $00

@done:
	cp   $00
	ret


setNPCsNewID:
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   (hl), a
	call loadNPCScriptPointer
	jp   initNPCscriptBytes


getBit4ofNPCBytes_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	ld   a, (hl)
	and  $10
	ret


getBit5ofNPCBytes_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	ld   a, (hl)
	and  $20
	ret


getBit6ofNPCBytes_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	ld   a, (hl)
	and  $40
	ret


Call_001_738a:
	call copy8npcMetadataBytesInto_c6d0                               ; $738a: $cd $c6 $72
	ld   hl, wCommonByteCopyDestBytes                                   ; $738d: $21 $d0 $c6
// npc struct byte 0
	ldi  a, (hl)                                     ; $7390: $2a
	ld   de, $c006                                   ; $7391: $11 $06 $c0
	ld   (de), a                                     ; $7394: $12
// npc struct byte 1
	ldi  a, (hl)                                     ; $7395: $2a
	ld   de, $c007                                   ; $7396: $11 $07 $c0
	ld   (de), a                                     ; $7399: $12

// de = cb6c
	ld   hl, wNPCBytes_cb6c                                   ; $739a: $21 $6c $cb
	add  hl, bc                                      ; $739d: $09
	ld   e, (hl)                                     ; $739e: $5e
	ld   d, $00                                      ; $739f: $16 $00

// clear c008 ($20 if facing left)
	ld   a, $00                                      ; $73a1: $3e $00
	ld   hl, $c008                                   ; $73a3: $21 $08 $c0
	ld   (hl), a                                     ; $73a6: $77
	call getBit6ofNPCBytes_cb60                               ; $73a7: $cd $82 $73
	jr   z, @checkVertDirs                              ; $73aa: $28 $06

	call getCurrNpcDirection                               ; $73ac: $cd $e3 $65
	jp   +                               ; $73af: $c3 $bd $73


@checkVertDirs:
	call getCurrNpcDirection                               ; $73b2: $cd $e3 $65
	cp   DIR_DOWN                                         ; $73b5: $fe $06
	jr   z, @facingDown                              ; $73b7: $28 $19

	cp   DIR_UP                                         ; $73b9: $fe $03
	jr   z, @facingUp                              ; $73bb: $28 $0c

+
	cp   DIR_LEFT                                         ; $73bd: $fe $09
	jr   nz, @next                             ; $73bf: $20 $17

// left
	ld   hl, $c008                                   ; $73c1: $21 $08 $c0
	ld   (hl), $20                                   ; $73c4: $36 $20
	jp   @next                               ; $73c6: $c3 $d8 $73

@facingUp:
	ld   a, e                                        ; $73c9: $7b
	add  $03                                         ; $73ca: $c6 $03
	ld   e, a                                        ; $73cc: $5f
	ld   d, $00                                      ; $73cd: $16 $00
	jp   @next                               ; $73cf: $c3 $d8 $73

@facingDown:
	ld   a, e                                        ; $73d2: $7b
	add  $06                                         ; $73d3: $c6 $06
	ld   e, a                                        ; $73d5: $5f
	ld   d, $00                                      ; $73d6: $16 $00

@next:
	call copyByteFrom_c006_WordPlusEinto_c009                               ; $73d8: $cd $fb $73
// upper 6 bits into c006
	ld   hl, $c009                                   ; $73db: $21 $09 $c0
	ld   a, (hl)                                     ; $73de: $7e
	and  $fc                                         ; $73df: $e6 $fc
	ld   hl, $c006                                   ; $73e1: $21 $06 $c0
	ld   (hl), a                                     ; $73e4: $77

// bit 3 of cb60 unset..
	ld   hl, wNPCBytes_cb60                                   ; $73e5: $21 $60 $cb
	add  hl, bc                                      ; $73e8: $09
	ld   a, (hl)                                     ; $73e9: $7e
	and  $08                                         ; $73ea: $e6 $08
	jr   nz, +                             ; $73ec: $20 $04

// inc c006
	ld   hl, $c006                                   ; $73ee: $21 $06 $c0
	inc  (hl)                                        ; $73f1: $34

+
// copy c008 to c007
	ld   hl, $c008                                   ; $73f2: $21 $08 $c0
	ld   a, (hl)                                     ; $73f5: $7e
	ld   hl, $c007                                   ; $73f6: $21 $07 $c0
	ld   (hl), a                                     ; $73f9: $77
	ret                                              ; $73fa: $c9


copyByteFrom_c006_WordPlusEinto_c009:
	ld   hl, wNPCScriptBytesBank                                   ; $73fb: $21 $fc $cb
	add  hl, bc                                      ; $73fe: $09
	ld   a, (hl)                                     ; $73ff: $7e
	ld   hl, wCommonByteCopyFuncBank                                   ; $7400: $21 $a1 $c0
	ld   (hl), a                                     ; $7403: $77

// copy 1 byte
	ld   a, $01                                      ; $7404: $3e $01
	ld   hl, wCommonByteCopyFuncNumBytes                                   ; $7406: $21 $a0 $c0
	ld   (hl), a                                     ; $7409: $77

// addr to copy from is param word (1st npc struct word) + e
	ld   a, e                                        ; $740a: $7b
	push de                                          ; $740b: $d5
	ld   hl, $c006                                   ; $740c: $21 $06 $c0
	add  (hl)                                        ; $740f: $86
	ld   hl, wCommonByteCopyFuncSrc                                   ; $7410: $21 $9a $c0
	ld   (hl), a                                     ; $7413: $77
	ld   hl, $c007                                   ; $7414: $21 $07 $c0
	ld   a, (hl)                                     ; $7417: $7e
	adc  $00                                         ; $7418: $ce $00
	ld   hl, wCommonByteCopyFuncSrc+1                                   ; $741a: $21 $9b $c0
	ld   (hl), a                                     ; $741d: $77

	call copyBytesFromAnotherBankInto_c6d0                                       ; $741e: $cd $24 $02
	ld   hl, wCommonByteCopyDestBytes                                   ; $7421: $21 $d0 $c6
	ld   a, (hl)                                     ; $7424: $7e
	ld   hl, $c009                                   ; $7425: $21 $09 $c0
	ld   (hl), a                                     ; $7428: $77
	pop  de                                          ; $7429: $d1
	ret                                              ; $742a: $c9
