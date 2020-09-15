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

.macro npc_set6_cb60_reset_cb6c
	.db $09
.endm

.macro npc_res4_cb60
	.db $0c
.endm

.macro npc_ret
	.db $24
.endm

.macro npc_set2_cbe4
	.db $27
.endm

.macro npc_loadParamInto_cb78
	.db $42 \1
.endm

.macro npc_setNewNpcID
	.db $43 \1
.endm

.macro npc_increaseScore
	.db $45 \1
.endm

.macro npc_takeArmorOfGod
	.db $49 \1
.endm

.macro npc_giveNumBirds
	.db $4e \1
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

.macro npc_startScrollingText
	.db $83
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

.macro npc_callCommonSoundFuncs_6c01
	.db $89 \1 \2
.endm

.macro npc_addParamsToXthenYCoords
	.db $90 \1 \2
.endm

.macro npc_callCommonSoundFuncs_6d6c
	.db $91 \1 \2
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

.macro npc_jumpIfItemGotten
	.db $c8
	.db \1
	.dw \2
.endm