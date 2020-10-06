.macro npc_end
	.db $00
.endm

.macro npc_set5_cb60
	.db $01
.endm

.macro npc_res5_cb60
	.db $02
.endm

.macro npc_set7_cb60
	.db $03
.endm

.macro npc_set4_cb60
	.db $04
.endm

.macro npc_faceUp
	.db $05
.endm

.macro npc_faceDown
	.db $06
.endm

.macro npc_faceRight
	.db $07
.endm

.macro npc_faceLeft
	.db $08
.endm

.macro npc_set6_cb60_reset_animationFrameIdx
	.db $09
.endm

.macro npc_offsetNPCCoordsBy1_turnRight
	.db $0a
.endm

.macro npc_offsetNPCCoordsBy1_turnLeft
	.db $0b
.endm

.macro npc_res4_cb60
	.db $0c
.endm

.macro npc_turnLeft
	.db $0d
.endm

.macro npc_turnRight
	.db $0e
.endm

.macro npc_turnBackwards
	.db $0f
.endm

.macro npc_facePlayerHorizontally
	.db $10
.endm

.macro npc_facePlayerVertically
	.db $11
.endm

.macro npc_moveToPlayersXandFacePlayerHorizontally
	.db $12
.endm

.macro npc_moveToPlayersYandFacePlayerVertically
	.db $13
.endm

.macro npc_set3_cb60
	.db $14
.endm

.macro npc_res3_cb60
	.db $15
.endm

.macro npc_animate
	.db $16
.endm

.macro npc_moveNPCturnBackIfCant
	.db $17
.endm

.macro npc_playSoundEffect20h
	.db $18
.endm

.macro npc_giveHeartContainer
	.db $19
.endm

// 1a unused

.macro npc_giveKey
	.db $1b
.endm

.macro npc_takeKey
	.db $1c
.endm

.macro npc_set2_cb60
	.db $1d
.endm

// 1e unused

.macro npc_c02a_equFF
	.db $1f
.endm

// 20/21 unused

.macro npc_c714_equFF
	.db $22
.endm

.macro npc_c714_equ0
	.db $23
.endm

.macro npc_ret
	.db $24
.endm

.macro npc_incAnointingOilsGotten
	.db $25
.endm

.macro npc_set7_npc2ndByteLower6Bits
	.db $26
.endm

.macro npc_set2_cbe4
	.db $27
.endm

.macro npc_setEnemyDefeatedRoomFlag
	.db $28
.endm

.macro npc_set3_cbe4
	.db $29
.endm

.macro npc_res3_cbe4
	.db $2a
.endm

// 2b unused

.macro npc_endIfSimilarIDNpcExists
	.db $2c
.endm

.macro npc_set1_cbe4
	.db $2d
.endm

.macro npc_moveByParamPixels
	.db $40 \1
.endm

.macro npc_setMovementSpeed
	.db $41 \1
.endm

.macro npc_wait
	.db $42 \1
.endm

.macro npc_setNewNpcID
	.db $43 \1
.endm

.macro npc_setDamageTaken
	.db $44 \1
.endm

.macro npc_increaseScore
	.db $45 \1
.endm

.macro npc_spawnNPCinFrontOfSelf
	.db $46 \1
.endm

.macro npc_cb60_low2bitsEquParamMinus1
	.db $47 \1
.endm

.macro npc_giveArmorOfGod
	.db $48 \1
.endm

.macro npc_takeArmorOfGod
	.db $49 \1
.endm

.macro npc_giveSpecialBItem
	.db $4a \1
.endm

// 4b unused

.macro npc_addToPlayerHealth
	.db $4c \1
.endm

// 4d unused

.macro npc_giveNumBirds
	.db $4e \1
.endm

.macro npc_takeNumBirds
	.db $4f \1
.endm

.macro npc_giveItem
	.db $50 \1
.endm

.macro npc_takeItem
	.db $51 \1
.endm

.macro npc_giveFruit
	.db $52 \1
.endm

.macro npc_giveNumBombs
	.db $53 \1
.endm

.macro npc_setTimeUntilFrozenStateEnds
	.db $54 \1
.endm

.macro npc_getSimilarNPCsToCurrLocationDir
	.db $55 \1
.endm

.macro npc_setCoords
	.db $80 \1 \2
.endm

.macro npc_jump
	.db $81
	.dw \1
.endm

.macro npc_resetBit5ofNPC2ndByte_jumpIfNZ
	.db $82
	.dw \1
.endm

.macro npc_startScrollingText
	.db $83
	.dw \1
.endm

.macro npc_jumpIfAtLeast1key
	.db $84
	.dw \1
.endm

.macro npc_call
	.db $85
	.dw \1
.endm

.macro npc_groupRoomXYjumpTable
	.db $86
	.dw \1
.endm

.macro npc_displayTextScreen
	.db $87
	.dw \1
.endm

.macro npc_jumpIfLampOn
	.db $88
	.dw \1
.endm

.macro npc_playSoundEffectAtAddr
	.db $89
	.dw \1
.endm

.macro npc_resetNPC2ndByteBit5_jumpIfOrigSet
	.db $8a
	.dw \1
.endm

.macro npc_jumpIfPlayerIsFullHealth
	.db $8b
	.dw \1
.endm

.macro npc_flipBit4ofNPC2ndByte_jumpIfNZ
	.db $8c
	.dw \1
.endm

.macro npc_waitRandomValBetween2ParamsInclusive
	.db $8d \1 \2
.endm

// 8e/8f unused

.macro npc_addParamsToXthenYCoords
	.db $90 \1 \2
.endm

.macro npc_stopAllSoundsPlayParamSoundSetIfTwiceSpeed
	.db $91 \1 \2
.endm

.macro npc_teleportPlayer
	.db $92
	.dw \1
.endm

.macro npc_spawnNPCAtOffset
	.db $c0
	.db \1 \2 \3
.endm

.macro npc_spawnNPC
	.db $c1
	.db \1 \2 \3
.endm

.macro npc_loopAboveParamTimes
	.db $c2
	.db \1
	.dw \2
.endm

.macro npc_jumpIfRandomNumLTparam
	.db $c3
	.db \1
	.dw \2
.endm

.macro npc_jumpIfArmorOfGodGotten
	.db $c4
	.db \1
	.dw \2
.endm

.macro npc_jumpIfSpecialBitemGotten
	.db $c5
	.db \1
	.dw \2
.endm

.macro npc_jumpIfNumBirdsGotten
	.db $c6
	.db \1
	.dw \2
.endm

.macro npc_placeTile
	.db $c7
	.db \1 \2 \3
.endm

.macro npc_jumpIfItemGotten
	.db $c8
	.db \1
	.dw \2
.endm

.macro npc_jumpIfAtTile
	.db $c9
	.db \1
	.dw \2
.endm

.macro npc_jumpIfMoreThanNumBombsGotten
	.db $ca
	.db \1
	.dw \2
.endm

// cb unused

.macro npc_jumpIfMoreThanParam1HealthGotten
	.db $cc
	.db \1
	.dw \2
.endm

// cd unused

.macro npc_moveNPC_jumpIfCant
	.db $ce
	.db \1
	.dw \2
.endm

.macro npc_quiz
	.db $cf
	.db \1 \2 \3
.endm

.macro npc_jumpIfFacingDirection
	.db $d0
	.db \1
	.dw \2
.endm