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

.macro npc_set6_cb60_reset_cb6c
	.db $09
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

.macro npc_moveHorizontallyToPlayer
	.db $10
.endm

.macro npc_set3_cb60
	.db $14
.endm

// 16

.macro npc_set2_cb60
	.db $1d
.endm

.macro npc_c02a_equFF
	.db $1f
.endm

.macro npc_ret
	.db $24
.endm

.macro npc_incAnointingOilsGotten
	.db $25
.endm

.macro npc_set2_cbe4
	.db $27
.endm

.macro npc_setRoomFlagFrom_cbf0
	.db $28
.endm

.macro npc_loadInto_cba8
	.db $40 \1
.endm

.macro npc_lowNybbleOf_cb54_equParamMinus1
	.db $41 \1
.endm

.macro npc_loadParamInto_cb78
	.db $42 \1
.endm

.macro npc_setNewNpcID
	.db $43 \1
.endm

.macro npc_paramLowNybbleIs_cb54_highNybble
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

.macro npc_addToPlayerHealth
	.db $4c \1
.endm

.macro npc_giveNumBirds
	.db $4e \1
.endm

.macro npc_giveItem
	.db $50 \1
.endm

.macro npc_giveFruit
	.db $52 \1
.endm

.macro npc_giveNumBombs
	.db $53 \1
.endm

.macro npc_set_c059
	.db $54 \1
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

.macro npc_callCommonSoundFuncs_6c01
	.db $89 \1 \2
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

// 8d

.macro npc_addParamsToXthenYCoords
	.db $90 \1 \2
.endm

.macro npc_callCommonSoundFuncs_6d6c
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

// c7

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

.macro npc_moveNPC_jumpIfCant
	.db $ce
	.db \1
	.dw \2
.endm

.macro npc_jumpIfFacingDirection
	.db $d0
	.db \1
	.dw \2
.endm