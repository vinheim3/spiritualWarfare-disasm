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
	.dw _scriptCmd_set6_cb60_reset_animationFrameIdx
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
	.dw _scriptCmd_animate
	.dw _scriptCmd_moveNPCturnBackIfCant
	.dw _scriptCmd_playSoundEffect20h
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
	.dw _scriptCmd_setEnemyDefeatedRoomFlag
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
	.dw _scriptCmd_setTimeUntilFrozenStateEnds
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
	.dw _scriptCmd_playSoundEffectAtAddr
	.dw _scriptCmd_resetNPC2ndByteBit5_jumpIfOrigSet
	.dw _scriptCmd_jumpIfPlayerIsFullHealth
	.dw _scriptCmd_flipBit4ofNPC2ndByte_jumpIfNZ
	.dw _scriptCmd_waitRandomValBetween2ParamsInclusive
	.dw _scriptCmd_lampOnOrOffSameBGP
	.dw _scriptCmd_lampOnOrOffSameOBP0
	.dw _scriptCmd_addParamsToXthenYCoords
	.dw _scriptCmd_stopAllSoundsPlayParamSoundSetIfTwiceSpeed
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


_scriptCmd_set6_cb60_reset_animationFrameIdx:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	set  6, (hl)

	ld   hl, wNPCBytes_animationFrameIdx
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
	jr   c, @retCFset

// max y-f
	cp   $a1
	jr   nc, @retCFset

	add  $0f
	ld   e, a
	ld   d, $00

// y offset now in de
@afterUpDown:
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	ld   c, a
	ld   b, $00
	jp   @afterLeftRight

@horiz:
	cp   DIR_LEFT
	jr   nz, +

// left
	call Call_001_46b4                               ; $64aa: $cd $b4 $46
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	sub  (hl)
	jr   c, @retCFset

	ld   c, a
	ld   b, $00
	jp   @afterLeftRight

+
// right
	call Call_001_46b4                               ; $64be: $cd $b4 $46
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	add  (hl)
	jr   c, @retCFset

// max x-f
	cp   $f1
	jr   nc, @retCFset

	add  $0f
	ld   c, a
	ld   b, $00

@afterLeftRight:
	call splitCEintoItsNybbles                               ; $64d5: $cd $1c $55
// high c and e nybbles into bc, de
	ld   hl, $c008                                   ; $64d8: $21 $08 $c0
	ld   c, (hl)                                     ; $64db: $4e
	ld   b, $00                                      ; $64dc: $06 $00
	ld   hl, $c009                                   ; $64de: $21 $09 $c0
	ld   e, (hl)                                     ; $64e1: $5e
	ld   d, $00                                      ; $64e2: $16 $00
	call getTileEntityOrPlayerIsOn                                       ; $64e4: $cd $ed $3f
	call Call_001_45cf                               ; $64e7: $cd $cf $45
	ld   hl, wCurrNpcIdx                                   ; $64ea: $21 $a6 $c0
	ld   c, (hl)                                     ; $64ed: $4e
	ld   b, $00                                      ; $64ee: $06 $00
	ret                                              ; $64f0: $c9

@retCFset:
	scf
	ret


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
	ld   hl, wPlayerX
	ld   a, (hl)
	ld   hl, wNPC_xCoord
	add  hl, bc
	cp   (hl)
	jr   c, +

// player x is >= npc's x
// get player x - npc x
	sub  (hl)
	jp   ++

+
// player's x < npc's
// get npc x - player x
	ld   a, (hl)
	ld   hl, wPlayerX
	sub  (hl)

++
// cba8 is x distance between player x and npc x
	ld   hl, wNPCBytes_pixelsToMove
	add  hl, bc
	ld   (hl), a
	jp   _scriptCmd_facePlayerHorizontally


_scriptCmd_moveToPlayersYandFacePlayerVertically:
	ld   hl, wPlayerY
	ld   a, (hl)
	ld   hl, wNPC_yCoord
	add  hl, bc
	cp   (hl)
	jr   c, +

	sub  (hl)
	jp   ++

+
	ld   a, (hl)
	ld   hl, wPlayerY
	sub  (hl)

++
	ld   hl, wNPCBytes_pixelsToMove
	add  hl, bc
	ld   (hl), a
	jp   _scriptCmd_facePlayerVertically


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


_scriptCmd_animate:
	ld   hl, wNPCBytes_animationFrameIdx                                   ; $65fd: $21 $6c $cb
	add  hl, bc                                      ; $6600: $09
	inc  (hl)                                        ; $6601: $34
	call getNpcOamTileAndAttr                               ; $6602: $cd $8a $73
	ld   hl, wNPCBytes_animationFrameIdx                                   ; $6605: $21 $6c $cb
	add  hl, bc                                      ; $6608: $09
	dec  (hl)                                        ; $6609: $35

// animation byte is 1, we continue, otherwise we stay here
	ld   hl, wScriptCopiedByte                                   ; $660a: $21 $09 $c0
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


_scriptCmd_playSoundEffect20h:
	call playSoundEffect20h
	jp   executeNPCScriptCode


_scriptCmd_giveHeartContainer:
	call giveHeartContainer
	jp   executeNPCScriptCode


// unused
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


// unused
_scriptCmd_res2_cb60:
	ld   hl, wNPCBytes_cb60
	add  hl, bc
	res  2, (hl)
	jp   executeNPCScriptCode


_scriptCmd_c02a_equFF:
	ld   hl, $c02a                                   ; $667b: $21 $2a $c0
	ld   (hl), $ff                                   ; $667e: $36 $ff
	jp   executeNPCScriptCode                               ; $6680: $c3 $8a $62


// unused
_scriptCmd_6683:
	call checkIfNPConTelePosition                               ; $6683: $cd $9b $66
	jr   nz, _executeNPCScriptCode_6698                             ; $6686: $20 $10

// player at tele position
	ld   hl, wRoomCurrTeleportIdx                                   ; $6688: $21 $b7 $c0
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


checkIfNPConTelePosition:
// check if npc at tele tile
// normally player y,x in de,bc
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   a, (hl)
	srl  a
	srl  a
	srl  a
	srl  a
	ld   e, a
	ld   d, $00

	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	srl  a
	srl  a
	srl  a
	srl  a
	ld   c, a
	ld   b, $00
	call retZifBC_DEonTeleTile
	ret

// unused
_scriptCmd_66bf:
	call checkIfNPConTelePosition                               ; $66bf: $cd $9b $66
	jr   nz, _executeNPCScriptCode_6698                             ; $66c2: $20 $d4

	ld   hl, wRoomCurrTeleportIdx                                   ; $66c4: $21 $b7 $c0
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


_scriptCmd_setEnemyDefeatedRoomFlag:
	ld   hl, wNPCBytes_roomFlagIdx
	add  hl, bc
	ld   a, (hl)
	cp   $ff
	jr   z, +

	ld   hl, wRoomFlagIdxToCheck
	ld   (hl), a
	ld   hl, setRoomFlag
	call jpHLinBank1

+
	jp   executeNPCScriptCode


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


// unused
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


// unused
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


// unused
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
	ld   hl, wNPCScriptParam1
	ld   e, (hl)
	ld   hl, getFruitAmountFromWram
	call jpHLinBank4
	ld   a, e
	ld   d, $00
	cp   $04
	jr   nc, +

// less than 4 of a fruit, ...
	inc  de                                          ; $6911: $13
	ld   hl, wNPCScriptParam1                                   ; $6912: $21 $20 $c0
	ld   a, (hl)                                     ; $6915: $7e
	call setFruitAsAmountToE                                       ; $6916: $cd $ca $23
	call updateCurrFruitBaseData                                       ; $6919: $cd $1a $24

+
	jp   executeNPCScriptCode


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


_scriptCmd_setTimeUntilFrozenStateEnds:
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wTimeUntilFrozenStateEnds
	ld   (hl), a
	jp   executeNPCScriptCode


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

// get text bytes from script bank
	ld   hl, wNPCScriptBytesBank
	add  hl, bc
	ld   a, (hl)
	ld   hl, wScrollingTextBytesBank
	ld   (hl), a

	call scrollingTextProcessControlBytes
	jp   executeNPCScriptCode


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
	ld   hl, wParamWordForScriptDataCopy
	ld   (hl), a

	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wParamWordForScriptDataCopy+1
	ld   (hl), a

@bigLoop:
// number of non-ffs read (ie exit when 3 ffs read)
	ld   a, $01
	ld   hl, wNumNonFFsRead
	ld   (hl), a

// de = 0, compare room group
	ld   de, $0000
// bc used as we copy from npc bytes bank
	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00
	call copyByteFrom_c006_WordPlusEinto_c009
	ld   hl, wScriptCopiedByte
	ld   a, (hl)
	cp   $ff
	jr   z, @c009equFFh

	ld   hl, wNumNonFFsRead
	inc  (hl)
	ld   hl, wCurrRoomGroup
	cp   (hl)
	jr   nz, @next

@c009equFFh:
// de = 1, compare room x
	inc  de

	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00
	call copyByteFrom_c006_WordPlusEinto_c009
	ld   hl, wScriptCopiedByte
	ld   a, (hl)
	cp   $ff
	jr   z, @c009equFFh2

	ld   hl, wNumNonFFsRead
	inc  (hl)
	ld   hl, wCurrRoomX
	cp   (hl)
	jr   nz, @next

@c009equFFh2:
// de = 2, compare room y
	inc  de

	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00
	call copyByteFrom_c006_WordPlusEinto_c009
	ld   hl, wScriptCopiedByte
	ld   a, (hl)
	cp   $ff
	jr   z, @c009equFFh3

	ld   hl, wNumNonFFsRead
	inc  (hl)
	ld   hl, wCurrRoomY
	cp   (hl)
	jr   nz, @next

@c009equFFh3:
	ld   hl, wNumNonFFsRead
	dec  (hl)
	jr   z, @done

// de = 3, we have a match, so load addr low byte to jump to
	ld   de, $0003

	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00
	call copyByteFrom_c006_WordPlusEinto_c009

	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00
	ld   hl, wScriptCopiedByte
	ld   a, (hl)
	ld   hl, wNPCScriptPointerLowByte
	add  hl, bc
	ld   (hl), a

// de = 4, addr high byte to jump to
	inc  de
	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00
	call copyByteFrom_c006_WordPlusEinto_c009
	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00
	ld   hl, wScriptCopiedByte
	ld   a, (hl)
	ld   hl, wNPCScriptPointerHighByte
	add  hl, bc
	ld   (hl), a
	jp   executeNPCScriptCode

@next:
// param word += 5
	ld   hl, wParamWordForScriptDataCopy
	ld   a, (hl)
	add  $05
	ld   hl, wParamWordForScriptDataCopy
	ld   (hl), a

	ld   hl, wParamWordForScriptDataCopy+1
	ld   a, (hl)
	adc  $00
	ld   hl, wParamWordForScriptDataCopy+1
	ld   (hl), a
	jp   @bigLoop

@done:
	jp   executeNPCScriptCode


// special bytes:
// $fd - inits screen again
// $7f - exits out of screen
// $ff - process next control byte
// $42 - waits
// $fe - end of text, waits for input
// otherwise copies 8 bytes
// if at this point, we see $ff, we loop back up to check above chars
// if at this point, we see $01, we go to next row
_scriptCmd_displayTextScreen:
	ld   hl, wNPCScriptBytesBank
	add  hl, bc
	ld   a, (hl)
	ld   hl, wNPCTextBank
	ld   (hl), a
	call stopAllSounds

@initScreen:
	call npcHelper_initTextScreenGfx
	call setNormalBGP_OBP0vals
	ld   a, $06
	call setLCDfromValue_c015equA

@checkNextCharacter:
	call npcHelper_getTextByteFromBank
	cp   $7f
	jp   nz, @not7fh

// 7f - exit menu
	call backToGameFromMenuQuizText
	call stopSoundsPlaySound5AtNormalSpeed
	jp   executeNPCScriptCode

@not7fh:
	cp   $fd
	jr   z, @initScreen

	cp   $ff
	jr   z, @checkNextCharacter

	cp   $42
	jr   nz, @not42

// byte read is $42 - wait next param x 2 times
	call npcHelper_getTextByteFromBank
	push af
	ld   c, a
	ld   b, $00
	call callMinimalMainLoopCTimes
	pop  af
	ld   c, a
	ld   b, $00
	call callMinimalMainLoopCTimes
	jp   @checkNextCharacter

@not42:
	cp   $fe
	jr   nz, @notFE

// byte read is $fe - end of text - wait for input
	call waitUntilAllKeysReleased
	ld   e, $00
	call processInputInMenus
	jp   @checkNextCharacter

@notFE:
// a is row offset
	ld   c, a
	ld   e, $20
	call ecEquEtimesC
// e into d, c into e, ie e * c into de
	ld   a, e
	ld   d, a
	ld   a, c
	ld   e, a
	call npcHelper_getTextByteFromBank

// de += A in screen 1
	add  e
	ld   e, a
	ld   a, d
	ld   hl, wScreen1displayOffset
	adc  (hl)
	add  >$9862
	ld   d, a

// c0fa/9 += $62 (constant start of text within round rectangle box)
	ld   a, e
	add  <$9862
	ld   e, a
	ld   hl, wScrollingTextCurrRowVramStart
	ld   (hl), e

// d part
	ld   a, d
	adc  $00
	ld   d, a
	inc  hl
	ld   (hl), a

@loopWaitForVBlankStart:
// process 8 characters at a time, breaking on ff or 1
	call waitUntilStartOfVBlankPeriod
	ld   c, $08

@nextC:
	call npcHelper_getTextByteFromBank
	cp   $ff
	jp   z, @checkNextCharacter

// newline
	cp   $01
	jr   z, @byteToCopyEqu1

	ld   (de), a
	inc  de

@toNextC:
	dec  c
	jr   nz, @nextC

	jr   @loopWaitForVBlankStart

@byteToCopyEqu1:
// offset in c0f9/a += $20 (next row to display text)
	ld   hl, wScrollingTextCurrRowVramStart
	ld   a, (hl)
	add  <$0020
	ld   (hl), a
	ld   e, a
	ld   hl, wScrollingTextCurrRowVramStart+1
	ld   a, (hl)
	adc  >$0020
	ld   (hl), a
	ld   d, a
	jr   @toNextC


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
	call dPlusEquScreen1displayOffset

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


_scriptCmd_playSoundEffectAtAddr:
	ld   hl, wNPCScriptParam1
	ld   e, (hl)
	ld   hl, wNPCScriptParam2
	ld   d, (hl)
	call playSoundEffectInDE_channel3or4
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
	ret


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


// unused
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


// unused
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


_scriptCmd_stopAllSoundsPlayParamSoundSetIfTwiceSpeed:
	call stopHWSoundChannels012

	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, wSoundToPlayIdx
	ld   (hl), a

	ld   hl, wNPCScriptParam2
	ld   a, (hl)
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a

	call play3soundChannels_6choicesIdxed_c009

	ld   a, $00
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a
	jp   executeNPCScriptCode


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
	call initNPCscriptBytes_noRoomFlagEffect
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
// store in game screen tiles too as a permanent change
	ld   hl, wNPCScriptParam1
	ld   a, (hl)
	ld   hl, w2x2gameScreenTiles
	add  hl, bc
	ld   (hl), a
	ld   hl, wGenericVramCopyTileIdx
	ld   (hl), a
	ld   a, c
	push af

// as well as to tile types
	ld   a, $00 // back to bank 0
	call convertCurrTileToTileType

	pop  af
	ld   c, a
	ld   b, $00
	ld   a, e
	ld   hl, w2x2tileTypes
	add  hl, bc
	ld   (hl), a

// c00c is x of tile, c00d is y of tile
	ld   hl, wNPCScriptParam2
	ld   c, (hl)
	ld   b, $00
	ld   hl, wGenericTile2x2_x
	ld   (hl), c

	ld   hl, wNPCScriptParam3
	ld   e, (hl)
	ld   d, $00
	ld   hl, wGenericTile2x2_y
	ld   (hl), e
	call copy_c028_tileDetailsToGenericVramCopy

@done:
	jp   executeNPCScriptCode


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
// de is y tile idx
	ld   hl, wNPC_yCoord
	add  hl, bc
	ld   a, (hl)
	add  $08
	srl  a
	srl  a
	srl  a
	srl  a
	ld   e, a
	ld   d, $00

// bc is x tile idx
	ld   hl, wNPC_xCoord
	add  hl, bc
	ld   a, (hl)
	add  $08
	srl  a
	srl  a
	srl  a
	srl  a
	ld   c, a
	ld   b, $00

// get 2x2 tile
	call c028_equGameScreenTileIdx_16ePlusC
	ld   hl, wCurrNpcIdx
	ld   c, (hl)
	ld   b, $00
	ld   hl, wGenericGameScreenTileIdx
	ld   a, (hl)
	and  $fc

// jump if same as param
	ld   hl, wNPCScriptParam1
	cp   (hl)
	jr   nz, +

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


// unused
_scriptCmd_jumpIfMoreThanNumOilsGotten:
	ld   hl, wAnointingOilsGotten
	ld   a, (hl)
	jp   npcHelper_jumpIfAtLeastParam1gotten


_scriptCmd_jumpIfMoreThanParam1HealthGotten:
	ld   hl, wPlayerHealth
	ld   a, (hl)
	jp   npcHelper_jumpIfAtLeastParam1gotten


// unused
_scriptCmd_jumpIfButtonsPressed:
	call pollInput
	ld   hl, wKeysPressed
	ld   a, (hl)
	ld   hl, wNPCScriptParam1
	and  (hl)
	jr   z, _f

	jp   npcHelper_jump

__	jp   executeNPCScriptCode


_scriptCmd_moveNPC_jumpIfCant:
	call npcHelper_offsetNPCCoordsByScriptByte1
	jr   nc, _b

	jp   npcHelper_jump


_scriptCmd_quiz:
	ld   hl, wCurrNpcIdx
	ld   a, (hl)
	push af
	call stopAllSounds

	ld   a, $00
	ld   hl, wScrollingTextByteDone
	ld   (hl), a

	ld   a, $00
	ld   hl, wNumIncorrectQuestions
	ld   (hl), a

@loopAskingNextQuestion:
	call turnOffLCD
	call clear_c200_to_c2ff
	call copyA0hDataToOam

	ld   c, :drawQuizScreen
	ld   hl, drawQuizScreen
	call callHLinBankC

// offset for question no.
	ld   de, $982b
	call dPlusEquScreen1displayOffset

// question num
	ld   hl, wNextQuizQuestionIdx
	inc  (hl)
	ld   a, (hl)
	call drawBCDNumsNoLeading0s

// set normal tiles for face
	ld   bc, $0001
	call setQuizEyeTiles
	ld   bc, $0002
	call setQuizMouthTiles
	ld   bc, $0000
	call setQuizBowtieTiles

	ld   hl, $0020
	call loadTilesetAndVramTileConversionTable_idxedHL

// set lcdc, on, bg8000, bg9c000, 8x16 sprites, bg/spr on
	ld   hl, wLCDCvalue
	ld   a, $9f
	ld   (hl), a

// set scroll
	ld   hl, rSCY
	ld   (hl), $00
	inc  hl
	ld   (hl), $04

	call setNormalBGP_OBP0vals
	ld   a, $06
	call setLCDfromValue_c015equA

// cursor except y
	ld   a, $14
	ld   hl, wOam+1
	ld   (hl), a
	ld   a, $2a
	ld   hl, wOam+2
	ld   (hl), a
	ld   hl, wOam+3
	ld   (hl), $10

// base cursor idx and y
	ld   a, $00
	ld   hl, wGenericMenuCursorIdx
	ld   (hl), a

	ld   a, $79
	ld   hl, wMenuCursorBaseOamY
	ld   (hl), a

	call nonTitleScreenInputCheckLoop

// check answer choice
	ld   hl, wGenericMenuCursorIdx
	ld   a, (hl)
	ld   hl, wCorrectQuizAnswerIdx
	cp   (hl)
	jr   z, @selectedCorrectAnswer

	jp   @selectedWrongAnswer

@selectedCorrectAnswer:
// play sound 3 at twice speed
	ld   a, $ff
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a

	ld   a, SND_03
	ld   hl, wSoundToPlayIdx
	ld   (hl), a

	call play3soundChannels_6choicesIdxed_c009

// back to normal speed
	ld   a, $00
	ld   hl, wSoundIsTwiceSpeed
	ld   (hl), a

	call showBlinkingEyesOam

// mouth to increasingly smile
	ld   bc, $0002
	call setQuizMouthTiles
	call callMinimalMainLoop0fhTimes
	ld   bc, $0003
	call setQuizMouthTiles
	call callMinimalMainLoop0fhTimes
	ld   bc, $0004
	call setQuizMouthTiles
	call callMinimalMainLoop0fhTimes

	ld   hl, wNumQuestionsLeft
	ld   a, (hl)
	cp   $01
	jr   nz, @givePrize

// 1 question left, and...
	ld   hl, wNumIncorrectQuestions
	ld   a, (hl)
	cp   $00
	jr   nz, @givePrize

// 0 incorrect questions still, we're done with quiz
	call playSoundsAndSpinBowtieForPerfectQuiz
	call callMinimalMainLoop1ehTimes

@givePrize:
// once all 1st 3 sound channels off..
-
	call minimalMainLoop
	call retZifFirst3SoundChannelsOff
	jr   nz, -

// add the 2 health if prize was ff
	ld   hl, wPrizeCounter
	ld   c, (hl)
	ld   b, $00
	ld   a, c
	cp   $ff
	jr   nz, +

	call add2toPlayerHealth
	jp   @preNextQuestionProcessing

+
// normal prize, add 5 birds
	ld   c, $05
	ld   hl, wPrizeCounter
	ld   a, (hl)
	cp   $03
	jr   nz, @startAddingBirdsMaxFF

// prize counter is 3, max prize, add 10 birds
	ld   c, $0a

@startAddingBirdsMaxFF:
	ld   hl, wNumBirds
	inc  (hl)
	jr   nz, +

	ld   hl, wNumBirds
	dec  (hl)

+
	dec  c
	jr   nz, @startAddingBirdsMaxFF

	ld   hl, wPrizeCounter
	ld   a, (hl)
	cp   $01
	jr   z, @preNextQuestionProcessing

// if max prize, add 2 hearts
	call add2toPlayerHealth
	call add2toPlayerHealth

@preNextQuestionProcessing:
	ld   hl, wNumQuestionsLeft
	dec  (hl)
	jr   z, @done

// if ff, inc to get to 1st question
	ld   hl, wQuizQuestionIdx
	ld   a, (hl)
	cp   $ff
	jr   z, ++

// loop to next question
	add  $01
	cp   $fa
	jr   c, +

	ld   a, $00

+
	ld   hl, wQuizQuestionIdx
	ld   (hl), a

++
	ld   e, $3c
	call processInputInMenus
	jp   @loopAskingNextQuestion

@selectedWrongAnswer:
	ld   hl, wNumIncorrectQuestions
	inc  (hl)

// play sound
	ld   de, sound_quizWrongAnswer_channel0
	ld   a, $00
	call call_playSoundChannelADataInDE

	ld   de, sound_quizWrongAnswer_channel1
	ld   a, $01
	call call_playSoundChannelADataInDE

// mouth open
	ld   bc, $0000
	call setQuizMouthTiles
	call callMinimalMainLoop0fhTimes

// eyes forward, then normal
	ld   bc, $0002
	call setQuizEyeTiles
	call callMinimalMainLoop0fhTimes
	ld   bc, $0001
	call setQuizEyeTiles
	call callMinimalMainLoop0fhTimes

// small frown
	ld   bc, $0001
	call setQuizMouthTiles

-
	call minimalMainLoop
	call retZifFirst3SoundChannelsOff
	jr   nz, -

	jp   @preNextQuestionProcessing

@done:
	call callMinimalMainLoop78hTimes
	call backToGameFromMenuQuizText
	call stopSoundsPlaySound5AtNormalSpeed

// restore curr npx idx to execute next script code
	pop  af
	ld   hl, wCurrNpcIdx
	ld   (hl), a
	jp   executeNPCScriptCode


quizLeftEyeTiles:
// blinked (correct), normal, looking forward (incorrect)
	.db $84 $80 $90

setQuizEyeTiles:
	ld   a, $00
	ld   hl, wQuizFaceOamTileAttr
	ld   (hl), a

// 8 is oam offset
	ld   de, $0008
	ld   hl, quizLeftEyeTiles
	add  hl, bc
	ld   a, (hl)

	ld   bc, $0021
	jp   setEyesOrBowtieOam_yEquC


quizMouthTiles:
// mouth open, small frown, normal, small smile, big smile
	.db $8a $8c $88 $8e $a0

setQuizMouthTiles:
	ld   a, $00
	ld   hl, wQuizFaceOamTileAttr
	ld   (hl), a
// oam offset is $10
	ld   de, $0010

	ld   hl, quizMouthTiles
	add  hl, bc
	ld   a, (hl)

	ld   bc, $0029
	jp   setMouthOam_yEquC


quizBowtieTiles:
// normal, diagonal, vertical, diagonal - diagonals are NE/SW
	.db $94 $98 $9c $98

setQuizBowtieTiles:
	ld   a, $00
	ld   hl, wQuizFaceOamTileAttr
	ld   (hl), a
	ld   a, c
	cp   $01
	jr   nz, +

// if c == 1, flip (never used)
	ld   a, $00
	or   $20
	ld   (hl), a

+
// offset is $18
	ld   de, $0018
	ld   hl, quizBowtieTiles
	add  hl, bc
	ld   a, (hl)
	ld   bc, $0034
	call setEyesOrBowtieOam_yEquC
	ret


setEyesOrBowtieOam_yEquC:
	push af

// set attrs
	ld   hl, wQuizFaceOamTileAttr
	ld   a, (hl)
	ld   hl, wOam+3
	add  hl, de
	ld   (hl), a
	ld   hl, wOam+7
	add  hl, de
	ld   (hl), a

// if reflected tile first..
	and  $20
	jr   z, +

// draw tiles the other way
	pop  af
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a
	add  $02
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a
	jp   setQuizOamX_yEquC

+
	pop  af
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a
	add  $02
	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a

setQuizOamX_yEquC:
// y = c
	ld   a, c
	ld   hl, wOam
	add  hl, de
	ld   (hl), a
	ld   hl, wOam+4
	add  hl, de
	ld   (hl), a

// x same for all face tiles
	ld   a, $7c
	ld   hl, wOam+1
	add  hl, de
	ld   (hl), a

	add  $08
	ld   hl, wOam+5
	add  hl, de
	ld   (hl), a
	ret

setMouthOam_yEquC:
	push af

	ld   hl, wQuizFaceOamTileAttr
	ld   a, (hl)
	ld   hl, wOam+3
	add  hl, de
	ld   (hl), a

// flip horizontally the next oam
	ld   hl, wOam+7
	add  hl, de
	xor  $20
	ld   (hl), a

// set mouth tiles to the same tile
	pop  af
	ld   hl, wOam+2
	add  hl, de
	ld   (hl), a

	ld   hl, wOam+6
	add  hl, de
	ld   (hl), a

	jp   setQuizOamX_yEquC


showBlinkingEyesOam:
// blinked, normal
	ld   bc, $0000
	call setQuizEyeTiles
	call callMinimalMainLoop1ehTimes
	ld   bc, $0001
	call setQuizEyeTiles
	call callMinimalMainLoop1ehTimes
	ret


playSoundsAndSpinBowtieForPerfectQuiz:
	ld   c, $00
	ld   b, $14

@loop:
	inc  c
	bit  2, c
	jr   z, +

// every 4 loops, play sound effect, dec b
	push bc
	call playSoundEffect20h
	pop  bc
	ld   c, $00
	dec  b

+
// loop through bowtie animation
	push bc
	ld   b, $00
	call setQuizBowtieTiles

	call minimalMainLoop

	pop  bc
	ld   a, b
	cp   $00
	jr   nz, @loop

	ret


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


initNPCscriptBytes_noRoomFlagEffect:
	ld   a, $ff
	ld   hl, wNPCBytes_roomFlagIdx
	add  hl, bc
	ld   (hl), a

initNPCscriptBytes:
// todo: control byte
	ld   a, $10                                      ; $7304: $3e $10
	ld   hl, wNPCBytes_cb60                                   ; $7306: $21 $60 $cb
	add  hl, bc                                      ; $7309: $09
	ld   (hl), a                                     ; $730a: $77

// clear animation frame idx
	ld   a, $00
	ld   hl, wNPCBytes_animationFrameIdx
	add  hl, bc
	ld   (hl), a

// time to wait set to 0
	ld   hl, wNPCBytes_timeToWait
	add  hl, bc
	ld   (hl), a

// pixels to move set to 0
	ld   hl, wNPCBytes_pixelsToMove
	add  hl, bc
	ld   (hl), a

// for do-while loops
	ld   hl, wNPCBytes_scriptLoopCounter
	add  hl, bc
	ld   (hl), a

// clear damage and movement speed
	ld   hl, wNPCBytes_damageAndMovementSpeed
	add  hl, bc
	ld   (hl), a

// $ff means don't change NPC's ID
	ld   a, $ff
	ld   hl, wNPCBytes_newID
	add  hl, bc
	ld   (hl), a

// get bank where script bytes are based on ID
	ld   de, $0003
	ld   hl, wNPCBytes_ID
	add  hl, bc
	ld   a, (hl)
	cp   $6a
	jr   c, +

// npc idx is >= $6a
	ld   de, $0002
	cp   $bf
	jr   c, +

// npc idx >= $bf
	ld   de, $0006

+
	ld   a, e
	ld   hl, wNPCScriptBytesBank
	add  hl, bc
	ld   (hl), a

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


// returns c006 as tile, and c007 as attr?
getNpcOamTileAndAttr:
// copy oam addr into c006/7
	call copy8npcMetadataBytesInto_c6d0
	ld   hl, wCommonByteCopyDestBytes
// npc struct byte 0
	ldi  a, (hl)
	ld   de, wCurrNPCoamDataAddr
	ld   (de), a
// npc struct byte 1
	ldi  a, (hl)
	ld   de, wCurrNPCoamDataAddr+1
	ld   (de), a

// de = current animationFrameIdx
	ld   hl, wNPCBytes_animationFrameIdx
	add  hl, bc
	ld   e, (hl)
	ld   d, $00

// clear c008 ($20 if facing left)
	ld   a, $00
	ld   hl, wNpcOamTileAttr2
	ld   (hl), a

	call getBit6ofNPCBytes_cb60                               ; $73a7: $cd $82 $73
	jr   z, @checkVertDirs                              ; $73aa: $28 $06

// if bit 6 set, ignore vert dirs
	call getCurrNpcDirection
	jp   +

@checkVertDirs:
	call getCurrNpcDirection
	cp   DIR_DOWN
	jr   z, @facingDown

	cp   DIR_UP
	jr   z, @facingUp

+
	cp   DIR_LEFT
	jr   nz, @next

// left - attr into c008, which is copied to c007 at the end
	ld   hl, wNpcOamTileAttr2
	ld   (hl), $20
	jp   @next

@facingUp:
// up oam details at offset 3
	ld   a, e
	add  $03
	ld   e, a
	ld   d, $00
	jp   @next

@facingDown:
// down oam details at offset 6
	ld   a, e
	add  $06
	ld   e, a
	ld   d, $00

// left/right details at offset 0
@next:
// get byte from oam addr, offseted by e for direction
	call copyByteFrom_c006_WordPlusEinto_c009

// upper 6 bits into c006
	ld   hl, wScriptCopiedByte
	ld   a, (hl)
	and  $fc
	ld   hl, wNpcOamTileIdx
	ld   (hl), a

// bit 3 of cb60 unset..
	ld   hl, wNPCBytes_cb60                                   ; $73e5: $21 $60 $cb
	add  hl, bc                                      ; $73e8: $09
	ld   a, (hl)                                     ; $73e9: $7e
	and  $08                                         ; $73ea: $e6 $08
	jr   nz, +                             ; $73ec: $20 $04

// inc c006
	ld   hl, wNpcOamTileIdx                                   ; $73ee: $21 $06 $c0
	inc  (hl)                                        ; $73f1: $34

+
// copy c008 to c007
	ld   hl, wNpcOamTileAttr2
	ld   a, (hl)
	ld   hl, wNpcOamTileAttr
	ld   (hl), a
	ret


copyByteFrom_c006_WordPlusEinto_c009:
// byte to copy is with the script
	ld   hl, wNPCScriptBytesBank
	add  hl, bc
	ld   a, (hl)
	ld   hl, wCommonByteCopyFuncBank
	ld   (hl), a

// copy 1 byte
	ld   a, $01
	ld   hl, wCommonByteCopyFuncNumBytes
	ld   (hl), a

// addr to copy from is param word (1st npc struct word) + e
	ld   a, e
	push de
	ld   hl, wParamWordForScriptDataCopy
	add  (hl)
	ld   hl, wCommonByteCopyFuncSrc
	ld   (hl), a

	ld   hl, wParamWordForScriptDataCopy+1
	ld   a, (hl)
	adc  $00
	ld   hl, wCommonByteCopyFuncSrc+1
	ld   (hl), a

	call copyBytesFromAnotherBankInto_c6d0

// get copied byte into c009
	ld   hl, wCommonByteCopyDestBytes
	ld   a, (hl)
	ld   hl, wScriptCopiedByte
	ld   (hl), a
	pop  de
	ret


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
