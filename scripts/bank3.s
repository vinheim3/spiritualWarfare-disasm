npcScript_end:
	npc_end


npc2e_scripts:
	npc_call data_03_6994
	npc_groupRoomXYjumpTable @initialScripts
	npc_jumpIfNumBirdsGotten 25, +
	npc_jump data_03_4fde
+
	npc_call data_03_5256
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_giveFruit $00
	npc_groupRoomXYjumpTable @scriptsAfterFruitGiven
	npc_end

@initialScripts:
	.db $1c $00 $00
	.dw @initialScript_1c_00_00
	.db $ff $ff $ff

@scriptsAfterFruitGiven:
	.db $1c $02 $00
	.dw @scriptAfterFruitGiven_1c_02_00

	.db $1c $02 $07
	.dw @scriptAfterFruitGiven_1c_02_07

	.db $1c $02 $03
	.dw @scriptAfterFruitGiven_1c_02_03

	.db $ff $ff $ff

@initialScript_1c_00_00:
	npc_giveFruit $00
	.db $50 $00
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_call data_03_69c8
	npc_end

@scriptAfterFruitGiven_1c_02_00:
	.db $50 $01
	npc_call data_03_69c0
	npc_end

@scriptAfterFruitGiven_1c_02_07:
	.db $50 $02
	npc_increaseScore $08
	npc_call data_03_69c4
	npc_end

@scriptAfterFruitGiven_1c_02_03:
	.db $50 $03
	npc_call data_03_69dd
	npc_call data_03_69cc
	npc_end


npc2f_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 60, +
	npc_jump data_03_4fde
+
	npc_giveFruit $01
	npc_call data_03_5262
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1b $02 $01
	.dw @script_1b_02_01

	.db $1c $02 $02
	.dw @script_1c_02_02

	.db $1b $02 $02
	.dw @script_1b_02_02

	.db $1c $01 $04
	.dw @script_1c_01_04

@script_1b_02_01:
	.db $50 $04
	npc_call data_03_69c4
	npc_end

@script_1c_02_02:
	.db $50 $05
	npc_increaseScore $08
	npc_call data_03_69cc
	npc_end

@script_1b_02_02:
	.db $50 $06
	npc_increaseScore $0c
	npc_call data_03_69c8
	npc_end

@script_1c_01_04:
	.db $50 $07
	npc_increaseScore $10
	npc_call data_03_69c0
	npc_end


npc30_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 40, +
	npc_jump data_03_4fde
+
	npc_giveFruit $02
	npc_call data_03_525a
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1c $01 $00
	.dw @script_1c_01_00

	.db $1c $02 $01
	.dw @script_1c_02_01

	.db $1e $00 $00
	.dw @script_1e_00_00

	.db $1c $00 $04
	.dw @script_1c_00_04

	.db $ff $ff $ff

@script_1c_01_00:
	.db $50 $08
	npc_call data_03_69c0
	npc_end

@script_1c_02_01:
	.db $50 $09
	npc_increaseScore $08
	npc_call data_03_69c4
	npc_end

@script_1e_00_00:
	.db $50 $0a
	npc_call data_03_69dd
	npc_call data_03_69cc
	npc_end

@script_1c_00_04:
	.db $50 $0b
	npc_call data_03_69d5
	npc_call data_03_69cc
	npc_end


npc31_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 75, +
	npc_jump data_03_4fde
+
	npc_giveFruit $03
	npc_call data_03_5266
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1c $01 $02
	.dw @entry0

	.db $1c $00 $03
	.dw @entry1

	.db $1c $00 $08
	.dw @entry2

	.db $1c $01 $06
	.dw @entry3

	.db $ff $ff $ff

@entry0:
	.db $50 $0c
	npc_call data_03_69be
	npc_end

@entry1:
	.db $50 $0d
	npc_increaseScore $08
	npc_call data_03_69c0
	npc_end

@entry2:
	.db $50 $0e
	npc_call data_03_69dd
	npc_call data_03_69c4
	npc_end

@entry3:
	.db $50 $0f
	npc_call data_03_69d5
	npc_call data_03_69cc
	npc_end


npc32_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 90, +
	npc_jump data_03_4fde
+
	npc_giveFruit $04
	npc_call data_03_526a
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1c $02 $04
	.dw @entry0

	.db $1c $01 $03
	.dw @entry1

	.db $1b $01 $00
	.dw @entry2

	.db $1c $00 $06
	.dw @entry3

	.db $ff $ff $ff

@entry0:
	.db $50 $10
	npc_increaseScore $08
	npc_end

@entry1:
	.db $50 $11
	npc_increaseScore $0c
	npc_end

@entry2:
	.db $50 $12
	npc_increaseScore $10
	npc_end

@entry3:
	.db $50 $13
	npc_increaseScore $18
	npc_end


data_03_4fde:
-
	npc_displayTextScreen npcText_yourFaithLooksWeak
	npc_call data_03_699f
	npc_call data_03_6996
	npc_jump -


npcText_yourFaithLooksWeak:
	.db $04 $02
	.asc "Your faith"
	.db $01
	.asc "looks weak."
	.db $01
	.asc "You'll need"
	.db $01
	.asc "more spirit."
	.db $ff $fe $7f


npc16_scripts:
	.db $14
	npc_call func_03_697b
-
	.db $82
	.dw +
	.db $8a
	.dw +
	.db $42 $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	.db $4e $01
data_03_5031:
	.db $89 $85 $16
	.db $05
	.db $41 $0c
	.db $40 $ff
	npc_end


npc69_scripts:
	.db $28


npc17_scripts:
	.db $14
	npc_call func_03_697b
-
	.db $82
	.dw +
	.db $8a
	.dw +
	.db $42 $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	.db $4e $05
	npc_jump data_03_5031


npc3f_scripts:
	npc_call func_03_697b
-
	.db $82
	.dw +
	.db $8a
	.dw +
	.db $42 $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	.db $4e $0a
	npc_jump data_03_5031


npc18_scripts:
	.db $14
	npc_call func_03_697b
-
	.db $82
	.dw +
	.db $8a
	.dw +
	.db $42 $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	.db $4c $02
	npc_jump data_03_5031


npc33_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_res4_cb60
	npc_jump _infLoop_639f


func_03_5082:
-
	npc_set_c059 $ff
	.db $4c $01
	.db $89 $6a $16
	.db $42 $02
	.db $8b
	.dw +
	npc_jump -
+
	npc_set_c059 $00
	npc_ret


npc34_scripts:
	npc_call data_03_6994
	npc_groupRoomXYjumpTable @table
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $01
	npc_increaseScore $20
	.db $50 $14
	npc_set_c059 $00
	npc_end

@entry0:
	npc_jumpIfNumBirdsGotten $96, +
	npc_jump data_03_4fde
+
	.db $48 $01
	npc_call data_03_526e
	npc_end

@table:
	.db $1b $00 $01
	.dw @entry0

	.db $ff $ff $ff


func_03_50c0:
	npc_set_c059 $ff
-
	.db $89 $85 $16
	.db $42 $02
	npc_loopAboveParamTimes $1e, -
	npc_set_c059 $01
	npc_ret


npc35_scripts:
	npc_call data_03_6994
	npc_groupRoomXYjumpTable @table
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $02
	npc_increaseScore $20
	.db $50 $15
	npc_set_c059 $00
	npc_end

@entry0:
	npc_jumpIfNumBirdsGotten $c8, +
	npc_jump data_03_4fde
+
	.db $48 $02
	npc_call data_03_527a
	npc_end

@table:
	.db $1b $00 $01
	.dw @entry0

	.db $ff $ff $ff


npc36_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $04
	npc_increaseScore $20
	npc_set_c059 $00
	npc_end


npc38_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $10
	npc_increaseScore $20
	npc_set_c059 $00
	npc_end


npc37_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $08
	npc_increaseScore $20
	npc_set_c059 $00
	npc_end


npc39_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $20
	npc_increaseScore $20
	npc_set_c059 $00
	npc_end


npc3a_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten $14, +
	npc_jump data_03_4fde
+
	.db $53 $07
	npc_call func_03_5248
	npc_end


npc3b_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten $4b, +
	npc_jump data_03_4fde
+
	.db $25
	npc_call data_03_5266
	npc_end


npc40_scripts:
	npc_jumpIfSpecialBitemGotten $02, _npc_end_03_529a
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten $c3, +
	npc_jump data_03_4fde
+
	.db $4a $02
	npc_increaseScore $18
	npc_call data_03_5276
	npc_end


npc41_scripts:
	npc_jumpIfSpecialBitemGotten $04, @end
	.db $14
	.db $c7 $00 $80 $80
	npc_call func_03_6986
	.db $4a $04
	npc_call data_03_69d5
	npc_call data_03_69c6
	.db $89 $6a $16
	.db $c7 $37 $80 $80
@end:
	npc_end


npc00_scripts:
	.db $28
	.db $10
	.db $0f
	npc_res4_cb60
	npc_set2_cbe4
	.db $47 $03
	.db $09
	.db $89 $7c $16
	.db $45 $04
	.db $c0 $84 $00 $00
	npc_loadParamInto_cb78 $05
	.db $c3 $aa
	.dw +
	.db $c0 $01 $00 $00
	npc_loadParamInto_cb78 $19
	npc_end

+
	npc_loadParamInto_cb78 $23
	.db $c3 $80
	.dw +
	npc_end

+
	.db $c3 $40
	.dw +
	npc_setNewNpcID $16

+
	.db $c3 $80
	.dw +
	npc_setNewNpcID $17

+
	npc_setNewNpcID $18

npc01_scripts:
	npc_res4_cb60
	.db $89 $26 $16
	.db $01
	npc_groupRoomXYjumpTable @table
	.db $41 $01
	.db $44 $01
	npc_jump @finally

@func_51d5:
	.db $41 $02
	.db $44 $02
	npc_jump @finally


@func_51dc:
	.db $41 $03
	.db $44 $04
	npc_jump @finally

@finally:
-
	.db $40 $04
	.db $29
	.db $40 $04
	.db $29
	.db $c2 $3c
	.dw -
	npc_loadParamInto_cb78 $0f
	npc_end

@table:
	.db $02 $ff $ff
	.dw @func_51d5

	.db $04 $ff $ff
	.dw @func_51d5

	.db $06 $ff $ff
	.dw @func_51dc

	.db $07 $ff $ff
	.dw @func_51d5

	.db $08 $ff $ff
	.dw @func_51d5

	.db $0a $ff $ff
	.dw @func_51d5

	.db $0b $ff $ff
	.dw @func_51dc

	.db $0c $ff $ff
	.dw @func_51dc

	.db $0d $ff $ff
	.dw @func_51dc

	.db $10 $02 $04
	.dw @func_51dc

	.db $ff $ff $ff


npc02_scripts:
	.db $14
	npc_set2_cbe4 $47
	.db $47 $03
	npc_res4_cb60
	.db $09
	.db $89 $37 $18
	.db $16
	npc_call $69ca
	npc_loadParamInto_cb78 $02
	.db $04
	.db $c3 $a0
	.dw +
	npc_end
+
	.db $c3 $55
	.dw +
	.db $43 $16
+
	.db $c3 $19
	.dw +
	.db $43 $17
+
	.db $43 $3f

func_03_5248:
-
	.db $4f $05
	npc_set_c059 $0a
	.db $89 $73 $16
	npc_loadParamInto_cb78 $02
	npc_loopAboveParamTimes $04, -
	npc_ret


data_03_5256:
	npc_loopAboveParamTimes $06, -
data_03_525a:
	npc_loopAboveParamTimes $09, -
	npc_loopAboveParamTimes $0b, - // $525e
data_03_5262:
	npc_loopAboveParamTimes $0d, -
data_03_5266:
	npc_loopAboveParamTimes $10, -
data_03_526a:
	npc_loopAboveParamTimes $13, -
data_03_526e:
	npc_loopAboveParamTimes $1f, -
	npc_loopAboveParamTimes $24, - // $5272
data_03_5276:
	npc_loopAboveParamTimes $28, -
data_03_527a:
	npc_loopAboveParamTimes $29, -
	npc_loopAboveParamTimes $2e, - // $527e
	npc_loopAboveParamTimes $33, - // $5282


npc15_scripts:
	npc_jumpIfSpecialBitemGotten $08, _npc_end_03_529a
	npc_call data_03_6994
	npc_displayTextScreen npcText_03_529b
	npc_call data_03_699f
	npc_increaseScore $14
	.db $4a $08
	.db $89 $85 $16

_npc_end_03_529a:
	.db $00

npcText_03_529b:
	.db $03 $01
	.asc "Good Job! You"
	.db $01
	.asc "can use this"
	.db $01
	.asc "ticket to"
	.db $01
	.asc "travel between"
	.db $01
	.asc "the 5 railroad"
	.db $01
	.asc "stations."
	.db $ff $42 $3c $fe $7f


npc3c_scripts:
	npc_call data_03_6994
-
	npc_jumpIfNumBirdsGotten $ff, +
	npc_call func_03_69b4
	npc_loopAboveParamTimes $96, -
+
	npc_set_c059 $00
	.db $50 $21
	npc_increaseScore $18
	npc_end


npc3d_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	npc_res4_cb60
	npc_call data_03_6996
-
	.db $ca $ff
	.dw +
	npc_call func_03_69aa
	npc_loopAboveParamTimes $4b, -
+
	npc_set_c059 $00
	.db $50 $21
	npc_increaseScore $18
	npc_end


// npc right of 1st screen (npc 4)
npc04_scripts:
	npc_groupRoomXYjumpTable @initialScriptTable

@afterInitialScript:
	npc_set2_cbe4
	npc_res4_cb60
	npc_call data_03_6996
	npc_groupRoomXYjumpTable @regularScripts

@end:
	npc_end

@initialScriptTable:
// group - room x - room y - pointer to go to
	.db $00 $02 $03
	.dw @@raftGuy

	.db $01 $00 $04
	.dw @@bottomLeftCityGuy

	.db $00 $02 $02
	.dw @@guyRightOf1stScreen

	.db $0a $02 $02
	.dw @@housesByDynamiteRiver

	.db $08 $02 $00
	.dw @@byHotelCasino

	.db $01 $02 $02
	.dw @@byCityBar

	.db $09 $00 $01
	.dw @@darkUndergroundRoom

	.db $0b $04 $03
	.dw @@byBeachLockedFishHouse

	.db $08 $00 $02
	.dw @@byHotelsThinCarPath

	.db $ff $ff $ff

@@raftGuy:
	npc_jumpIfSpecialBitemGotten SPECIALB_RAFT @end
	npc_jump @afterInitialScript

@@bottomLeftCityGuy:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR @end
	npc_jump @afterInitialScript

// from npc right of 1st screen
@@guyRightOf1stScreen:
	npc_jumpIfArmorOfGodGotten AOG_BELT @end
	npc_jump @afterInitialScript

@@housesByDynamiteRiver:
	npc_jumpIfArmorOfGodGotten AOG_HELM @end
	npc_jump @afterInitialScript

@@byHotelCasino:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR @afterInitialScript
	.db $c7 $18 $05 $08
	npc_end

@@byCityBar:
	npc_jumpIfArmorOfGodGotten AOG_BELT @afterInitialScript
	npc_end

@@darkUndergroundRoom:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_jump @afterInitialScript
+
	npc_jumpIfSpecialBitemGotten SPECIALB_LAMP npcScript_end
	npc_jump @afterInitialScript

@@byBeachLockedFishHouse:
	npc_jumpIfItemGotten $12, @end
	npc_jump @afterInitialScript

@@byHotelsThinCarPath:
	npc_jumpIfItemGotten $10, @end
	npc_jump @afterInitialScript

@regularScripts:
	.db $00 $02 $03
	.dw @@raftGuy

	.db $01 $00 $04
	.dw @@bottomLeftCityGuy

	.db $00 $02 $02
	.dw @@guyRightOf1stScreen

	.db $00 $05 $03
	.dw @@guyByParkExit

	.db $0a $02 $02
	.dw @@housesByDynamiteRiver

	.db $08 $02 $00
	.dw @@byHotelCasino

	.db $01 $02 $02
	.dw @@byCityBar

	.db $09 $00 $01
	.dw @@darkUndergroundRoom

	.db $0b $04 $03
	.dw @@byBeachLockedFishHouse

	.db $08 $00 $02
	.dw @@byHotelsThinCarPath

	.db $ff $ff $ff

@@toRegularScripts:
	npc_groupRoomXYjumpTable @regularScripts

@@afterTextDisplay:
	npc_call data_03_699f
	npc_call data_03_6996
	npc_jump @@toRegularScripts

@@raftGuy:
	npc_jumpIfSpecialBitemGotten SPECIALB_JAWBONE, +
	npc_displayTextScreen npcText_03_542e
	npc_jump @@afterTextDisplay
+
	npc_displayTextScreen npcText_03_54c2
	npc_jump @@afterTextDisplay

@@bottomLeftCityGuy:
	npc_displayTextScreen npcText_03_550c
	npc_jump @@afterTextDisplay

@@guyRightOf1stScreen:
	npc_displayTextScreen npcText_03_554e
	npc_jump @@afterTextDisplay

@@guyByParkExit:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_displayTextScreen npcText_03_55bf
	npc_jump @@afterTextDisplay
+
	npc_displayTextScreen npcText_03_5760
	npc_jump @@afterTextDisplay

@@housesByDynamiteRiver:
	npc_displayTextScreen npcText_03_5623
	npc_jump @@afterTextDisplay

@@byHotelCasino:
	npc_displayTextScreen npcText_03_5667
	npc_jump @@afterTextDisplay

@@byCityBar:
	npc_displayTextScreen npcText_03_569a
	npc_jump @@afterTextDisplay

@@darkUndergroundRoom:
	npc_displayTextScreen npcText_03_56c5
	npc_jump @@afterTextDisplay

@@byBeachLockedFishHouse:
	npc_displayTextScreen npcText_03_5713
	npc_jump @@afterTextDisplay

@@byHotelsThinCarPath:
	npc_displayTextScreen npcText_03_57b9
	npc_jump @@afterTextDisplay


npcText_03_542e:
	.db $02 $02
	.asc "Hello. If"
	.db $01
	.asc "you'd like"
	.db $01
	.asc "the raft,"
	.db $01
	.asc "you'll need"
	.db $01
	.asc "Samson's"
	.db $01
	.asc "Jawbone to"
	.db $01
	.asc "retrieve it."
	.db $ff $42 $19
	.db $fe $fd

	.db $03 $02
	.asc "Rumor has it"
	.db $01
	.asc "the Jawbone"
	.db $01
	.asc "is in a"
	.db $01
	.asc "locked room"
	.db $01
	.asc "in the"
	.db $01
	.asc "shipyard."
	.db $ff $fe $7f


npcText_03_54c2:
	.db $03 $01
	.asc "Hello, again."
	.db $01
	.asc "Now you can"
	.db $01
	.asc "get the raft"
	.db $01
	.asc "by throwing"
	.db $01
	.asc "the Jawbone"
	.db $01
	.asc "at it."
	.db $ff $fe $7f


npcText_03_550c:
	.db $03 $02
	.asc "You'd better"
	.db $01
	.asc "have the"
	.db $01
	.asc "Breastplate"
	.db $01
	.asc "before you"
	.db $01
	.asc "enter this"
	.db $01
	.asc "area."
	.db $ff $fe $7f


npcText_03_554e:
	.db $01 $00
	.asc "Hi. Go down"
	.db $01
	.asc "these stairs"
	.db $01
	.asc "and look"
	.db $01
	.asc "around. Once"
	.db $01
	.asc "you find"
	.db $01
	.asc "the Belt of"
	.db $01
	.asc "Truth, you'll"
	.db $01
	.asc "be able to"
	.db $01
	.asc "leave the park."
	.db $ff $fe $7f


npcText_03_55bf:
	.db $02 $00
	.asc "Downtown lies"
	.db $01
	.asc "east of here,"
	.db $01
	.asc "but you'll"
	.db $01
	.asc "need the Belt"
	.db $01
	.asc "of Truth to"
	.db $01
	.asc "push this rock"
	.db $01
	.asc "out of the way."
	.db $ff $fe $7f


npcText_03_5623:
	.db $03 $01
	.asc "Hey, Sonny."
	.db $01
	.asc "You'll need"
	.db $01
	.asc "the Helmet and"
	.db $01
	.asc "the Boots to"
	.db $01
	.asc "cross here."
	.db $ff $fe $7f


npcText_03_5667:
	.db $04 $01
	.asc "You'd be very"
	.db $01
	.asc "wise not to"
	.db $01
	.asc "enter this"
	.db $01
	.asc "building."
	.db $ff $fe $7f


npcText_03_569a:
	.db $04 $02
	.asc "Hey"
	.db $21
	.asc " You'd"
	.db $01
	.asc "better stay"
	.db $01
	.asc "away from"
	.db $01
	.asc "bars."
	.db $ff $fe $7f


npcText_03_56c5:
	.db $03 $01
	.asc "If you have"
	.db $01
	.asc "the Belt of"
	.db $01
	.asc "Truth and the"
	.db $01
	.asc "Torch, this"
	.db $01
	.asc "makes a great"
	.db $01
	.asc "shortcut."
	.db $ff $fe $7f


npcText_03_5713:
	.db $03 $01
	.asc "The puzzle in"
	.db $01
	.asc "this room is"
	.db $01
	.asc "much easier"
	.db $01
	.asc "to solve if"
	.db $01
	.asc "you have a"
	.db $01
	.asc "lit torch."
	.db $ff $fe $7f


npcText_03_5760:
	.db $03 $01
	.asc "Now that you"
	.db $01
	.asc "have the Belt"
	.db $01
	.asc "of Truth, push"
	.db $01
	.asc "this rock out"
	.db $01
	.asc "of the way to"
	.db $01
	.asc "exit the park."
	.db $ff $fe $7f


npcText_03_57b9:
	.db $03 $01
	.asc "But if we hope"
	.db $01
	.asc "for what we"
	.db $01
	.asc "do not yet"
	.db $01
	.asc "have, we wait"
	.db $01
	.asc "for it"
	.db $01
	.asc "patiently."
	.db $ff $fe $7f


npc3e_scripts:
	npc_groupRoomXYjumpTable @table
	npc_end

@end:
	.db $c7 $00 $80 $80
	npc_end

@table:
	.db $09 $01 $03
	.dw @entry0

	.db $0f $00 $04
	.dw @entry1

	.db $09 $01 $04
	.dw @entry2

	.db $00 $05 $03
	.dw @entry3

	.db $01 $02 $02
	.dw @entry4

	.db $24 $00 $00
	.dw @entry5

	.db $22 $00 $00
	.dw @entry6

	.db $ff $ff $ff

@entry0:
	npc_jumpIfItemGotten $08, @end
	npc_end

@entry1:
	npc_jumpIfItemGotten $05, @end
	npc_end

@entry2:
	.db $88
	.dw @end
	npc_end

@entry3:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_jumpIfItemGotten $14, ++
+
	npc_end
++
	.db $c7 $82 $80 $80
	npc_end

@entry4:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	.db $c7 $de $80 $80
+
	npc_end

@entry5:
	npc_jumpIfArmorOfGodGotten AOG_SWORD, +
	npc_end
+
	.db $c7 $9c $80 $80
	npc_end

@entry6:
	npc_jumpIfArmorOfGodGotten AOG_BOOTS, +
	npc_end
+
	.db $c7 $9c $80 $80
	npc_end


npc05_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $01
	.db $44 $01
-
	.db $40 $1e
	npc_loadParamInto_cb78 $06
	.db $0b
	npc_jump -


npc06_scripts:
	npc_res4_cb60
	.db $42 $0a
	.db $47 $03
	.db $41 $02
	.db $44 $01
-
	.db $c3 $80
	.dw +
	.db $0d
	.db $40 $32
	npc_jump -
+
	.db $0e
	.db $40 $32
	npc_jump -


npc07_scripts:
	npc_res4_cb60
	.db $42 $0a
	.db $47 $03
	.db $41 $04
	.db $44 $01
-
	.db $40 $20
	.db $0e
	npc_jump -


npc4f_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $02
	.db $41 $02
	npc_res4_cb60
	.db $44 $01
-
	.db $40 $ff
	.db $0f
	npc_jump -


npc5b_scripts:
-
	.db $55 $50
	.db $82
	.dw +
	.db $42 $01
	npc_jump $58b2
+
	npc_displayTextScreen @text
	.db $42 $1e
	.db $82
	.dw -
	npc_jump -

@text:
	.db $01 $01
	.asc "Hey Buddy!"
	.db $01
	.asc "If you need"
	.db $01
	.asc "clues on what"
	.db $01
	.asc "to do next,"
	.db $01
	.asc "go to the"
	.db $01
	.asc "church in the"
	.db $01
	.asc "housing area."
	.db $01
	.asc "It's east of"
	.db $01
	.asc "downtown."
	.db $ff $fe $7f


npc50_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $02
	.db $41 $02
	npc_res4_cb60
	npc_set2_cbe4
	npc_loadParamInto_cb78 $0a
@bigLoop:
	.db $8d $01 $0a
	.db $c9 $d0
	.dw @func_598d
	.db $c9 $08
	.dw @func_598d
	.db $c9 $5c
	.dw @func_598f
	.db $c3 $c0
	.dw +
	.db $07
	npc_jump ++
+
	.db $c3 $aa
	.dw +
	.db $08
	npc_jump ++
+
	.db $c3 $80
	.dw +
	.db $05
	npc_jump ++
+
	.db $06
++
	.db $c9 $d0
	.dw @func_598d
	.db $c9 $08
	.dw @func_598d
	.db $c9 $5c
	.dw @func_598f
	.db $c3 $aa
	.dw +
	.db $40 $20
	npc_jump @bigLoop
+
	.db $c3 $80
	.dw +
	.db $40 $10
	npc_jump @bigLoop
+
	.db $40 $08
	npc_jump @bigLoop
@func_598d:
	npc_setNewNpcID $51
@func_598f:
	npc_setNewNpcID $52


npc51_scripts:
	.db $47 $04
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	.db $c9 $08
	.dw +
	npc_jump ++
+
	.db $07
	npc_res4_cb60
	.db $16
	.db $05
	.db $40 $04
	.db $07
	.db $c0 $54 $00 $00
	npc_loadParamInto_cb78 $4b
	.db $41 $04
	.db $40 $10
	npc_setNewNpcID $50

++
	.db $08
	npc_res4_cb60
	.db $16
	.db $05
	.db $40 $04
	.db $08
	.db $c0 $53 $00 $00
	npc_loadParamInto_cb78 $4b
	.db $41 $04
	.db $40 $10
	npc_setNewNpcID $50


npc52_scripts:
	.db $47 $04
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_set2_cbe4
	.db $05
	.db $40 $08
	npc_loadParamInto_cb78 $02
	.db $c0 $55 $00 $00
	npc_loadParamInto_cb78 $05
	.db $06
	.db $40 $08
	npc_loadParamInto_cb78 $32
	.db $41 $04
	.db $40 $10
	npc_setNewNpcID $50


npc53_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	.db $01
	npc_set2_cbe4
	.db $41 $10
	npc_res4_cb60
-
	.db $08
	.db $40 $02
	.db $05
	.db $40 $02
	.db $c9 $b4
	.dw func_03_59f9
	.db $c9 $24
	.dw func_03_59f9
	npc_jump -


func_03_59f5:
	.db $07
	npc_jump +

func_03_59f9:
	.db $08

+
	.db $40 $04

func_03_59fc:
	.db $06
	.db $41 $01
	.db $40 $18
	.db $05
	.db $40 $04
	.db $06
	.db $40 $04
	.db $05
	.db $40 $02
	.db $06
	.db $40 $02
	npc_end


npc54_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	npc_set2_cbe4
	.db $01
	.db $41 $10
	npc_res4_cb60
-
	.db $07
	.db $40 $02
	.db $05
	.db $40 $02
	.db $c9 $b4
	.dw func_03_59f5
	.db $c9 $24
	.dw func_03_59f5
	npc_jump -


npc55_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	npc_set2_cbe4
	.db $01
	.db $41 $08
	npc_res4_cb60
	.db $05
	.db $40 $02
	.db $c9 $b4
	.dw func_03_59fc
	npc_jump $5a2e


npc08_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $04
	.db $44 $01
	npc_loadParamInto_cb78 $0a
	.db $11
	.db $40 $40
	.db $10
--
	.db $40 $10
	.db $8d $03 $0a
	.db $c9 $b4
	.dw @func_5a6d
	.db $c9 $b8
	.dw @func_5a6f
	npc_loopAboveParamTimes $03, --
	.db $12
-
	.db $40 $10
	.db $8d $03 $0a
	.db $c9 $b4
	.dw @func_5a6d
	.db $c9 $b8
	.dw @func_5a6f
	npc_loopAboveParamTimes $03, -
	.db $13
	npc_jump --
@func_5a6d:
	npc_setNewNpcID $4c
@func_5a6f:
	npc_setNewNpcID $4d


npc4c_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $47 $04
	.db $16
	.db $89 $47 $16
	.db $c3 $aa
	.dw +
	.db $c7 $98 $80 $80
	npc_setNewNpcID $08
+
	.db $c3 $80
	.dw +
	.db $c7 $98 $80 $80
	npc_setNewNpcID $08
+
	.db $c7 $98 $80 $80
	npc_setNewNpcID $08


npc4d_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $47 $04
	.db $16
	.db $89 $47 $16
	.db $c3 $aa
	.dw +
	.db $c7 $50 $80 $80
	npc_setNewNpcID $08
+
	.db $c3 $80
	.dw +
	.db $c7 $50 $80 $80
	npc_setNewNpcID $08
+
	.db $c7 $50 $80 $80
	npc_setNewNpcID $08


npc09_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $02
	.db $41 $03
	.db $44 $01
-
	.db $c3 $32
	.dw ++
	npc_loadParamInto_cb78 $14
	.db $c3 $80
	.dw +
	.db $0d
	.db $40 $32
	.db $17
	npc_jump -
+
	.db $0e
	.db $40 $32
	.db $17
	npc_jump -
++
	.db $c3 $80
	.dw +
	.db $12
	npc_jump -
+
	.db $13
	npc_jump -


npc0a_scripts:
	npc_res4_cb60
	.db $47 $03
	.db $41 $01
	.db $44 $01
	npc_loadParamInto_cb78 $1e
	.db $0f
	.db $40 $20
	.db $0d
	.db $41 $02
-
	.db $40 $ff
	.db $17
	npc_jump -


npc0b_scripts:
	.db $41 $04
-
	npc_loadParamInto_cb78 $0f
	.db $c3 $80
	.dw -
	.db $10
	.db $c3 $c0
	.dw +
	.db $c0 $0c $00 $00
	npc_jump -
+
	.db $c3 $aa
	.dw +
	.db $c0 $0d $00 $00
	npc_jump -
+
	.db $c3 $80
	.dw +
	.db $c0 $0e $00 $00
	npc_jump -
+
	.db $c0 $0f $00 $00
	npc_jump -


npc0c_scripts:
	.db $41 $03
	npc_jump func_03_5b39


npc0d_scripts:
	.db $41 $02
	npc_jump func_03_5b39


npc0e_scripts:
	.db $41 $05
	npc_jump func_03_5b39


npc0f_scripts:
	.db $41 $06

func_03_5b39:
	.db $01
	.db $03
	.db $c3 $aa
	.dw ++
	.db $c3 $80
	.dw +
	.db $89 $a9 $16
	npc_jump ++
+
	.db $89 $ba $16
++
	.db $c3 $aa
	.dw +
	npc_jump ++
+
	.db $c3 $80
	.dw +
	.db $06
	.db $40 $10
	npc_jump ++
+
	.db $05
	.db $40 $10
++
	.db $10
	npc_res4_cb60
	.db $47 $03
	.db $44 $01
	.db $40 $ff
	npc_end


npc1e_scripts:
	npc_set6_cb60_reset_cb6c
	.db $03
	.db $47 $02
	.db $41 $04
	.db $44 $04
	npc_res4_cb60
-
	npc_loadParamInto_cb78 $14
	.db $40 $40
	.db $0f
	npc_loadParamInto_cb78 $03
	.db $40 $40
	.db $0f
	npc_loadParamInto_cb78 $03
	.db $40 $40
	.db $0f
	npc_jump -


npc10_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $02
	.db $41 $02
	.db $44 $02
	npc_res4_cb60
	.db $11
	.db $40 $10
	.db $10
	.db $40 $10
	npc_setNewNpcID $11


npc11_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $02
	.db $44 $02
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $16
	.db $46 $12
	.db $89 $04 $16
	npc_loadParamInto_cb78 $28
	npc_setNewNpcID $10


npc12_scripts:
	npc_res4_cb60
	npc_set2_cbe4
	.db $01
	.db $41 $04
	.db $44 $04
	.db $40 $ff
	npc_end


npc4e_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	npc_res4_cb60
	.db $44 $02
	.db $01
	.db $41 $03
	npc_set2_cbe4
	.db $89 $0d $16
	npc_loadParamInto_cb78 $28
-
	.db $10
	.db $40 $04
	.db $11
	.db $40 $04
	npc_loopAboveParamTimes $05, -
	.db $89 $0d $16
	npc_jump -



npc13_scripts:
	.db $47 $03
	.db $44 $04
	.db $03
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
-
	.db $40 $80
	.db $17
	.db $c3 $80
	.dw +
	.db $41 $02
	npc_jump -
+
	.db $c3 $80
	.dw +
	.db $41 $03
	npc_jump -
+
	.db $c3 $80
	.dw +
	.db $41 $04
	npc_jump -
+
	.db $41 $05
	npc_jump -


npc14_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $03
	.db $05
	npc_res4_cb60
-
	npc_loadParamInto_cb78 $04
	npc_jump -


npc1f_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $02
	.db $44 $04
-
	.db $12
	.db $13
	npc_jump -


npc19_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $02
	.db $41 $03
	.db $44 $01
-
	.db $40 $ff
	.db $17
	npc_loadParamInto_cb78 $01
	npc_jump -


npc1c_scripts:
	npc_jumpIfItemGotten $14, +
	npc_jump @end
+
	npc_jumpIfArmorOfGodGotten AOG_BELT, @func_5c2e
@end:
	npc_end
@func_5c2e:
	npc_loadParamInto_cb78 $14
	.db $c0 $1d $00 $00
	npc_loopAboveParamTimes $06, @func_5c2e
	.db $28
	npc_end


npc1d_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $41 $01
	.db $44 $01
	.db $47 $03
-
	.db $40 $10
	.db $c3 $7f
	.dw +
	.db $0d
	npc_jump -
+
	.db $0e
	npc_jump -


npc1a_scripts:
	.db $41 $02
	npc_call func_03_5c91
-
	.db $c7 $4c $80 $80
	.db $89 $1d $16
	npc_loadParamInto_cb78 $03
	.db $40 $10
	.db $ce $10
	.dw +
	npc_jump -
+
	.db $c7 $4c $80 $80
	.db $89 $1d $16
-
	.db $0a
	.db $40 $ff
	npc_jump -


npc21_scripts:
	.db $41 $03
	npc_call func_03_5c91
-
	.db $c7 $cc $80 $80
	.db $89 $1d $16
	npc_loadParamInto_cb78 $02
	.db $40 $10
	.db $c3 $80
	.dw +
	.db $0d
	npc_jump -
+
	.db $0e
	npc_jump -


func_03_5c91:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $44 $01
	.db $47 $03
	npc_loadParamInto_cb78 $0a
	npc_ret


npc1b_scripts:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, npcScript_end
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $02
	.db $41 $02
	.db $44 $0e
-
	.db $40 $ff
	.db $c3 $aa
	.dw +
	.db $17
	npc_jump -
+
	.db $c3 $7f
	.dw +
	.db $0d
	npc_jump -
+
	.db $0e
	npc_jump -


npc42_scripts:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, npcScript_end
	npc_res4_cb60
	.db $44 $0e
-
	npc_loadParamInto_cb78 $01
	npc_jump $5cc5


npc23_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $02
	.db $44 $02
-
	.db $10
	.db $40 $20
	.db $11
	.db $40 $20
	.db $c3 $80
	.dw +
	.db $10
+
	.db $46 $26
	.db $89 $61 $16
	npc_loadParamInto_cb78 $0a
	.db $46 $26
	.db $89 $61 $16
	npc_loadParamInto_cb78 $0a
	.db $46 $26
	.db $89 $61 $16
	npc_loadParamInto_cb78 $0a
	.db $0f
	.db $40 $42
	.db $05
	npc_jump -


npc26_scripts:
	npc_set2_cbe4
	npc_res4_cb60
	.db $41 $04
	.db $01
	.db $44 $04
	.db $40 $ff
	npc_end


npc58_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $41 $04
	.db $01
	.db $44 $06
	.db $40 $ff
	npc_end


npc59_scripts:
	npc_set6_cb60_reset_cb6c
	npc_jump npc26_scripts


npc24_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $03
	.db $44 $02
-
	.db $12
	.db $13
	npc_loadParamInto_cb78 $1e
	npc_jump -


npc25_scripts:
	npc_res4_cb60
	.db $89 $0a $18
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $02
	.db $44 $02
-
	.db $40 $ff
	.db $c3 $55
	.dw +
	.db $17
	npc_jump -
+
	.db $89 $0a $18
	npc_jump -


npc28_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $41 $03
	.db $47 $03
	.db $44 $04
-
	.db $40 $a0
	.db $0d
	npc_jump -


npc2c_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $41 $04
	.db $47 $03
	.db $44 $04
-
	.db $40 $40
	.db $0e
	.db $40 $40
	.db $0d
	.db $40 $40
	.db $0d
	.db $40 $40
	.db $0e
	.db $40 $40
	.db $0e
	.db $40 $40
	.db $0d
	.db $40 $40
	.db $0f
	npc_jump -


npc27_scripts:
	npc_res4_cb60
	npc_set6_cb60_reset_cb6c
	npc_loadParamInto_cb78 $0a
	.db $41 $03
	.db $47 $03
-
	.db $11
	.db $82
	.dw +
	.db $40 $18
	.db $10
	.db $82
	.dw +
	.db $40 $18
	npc_jump -
+
	.db $4f $05
	npc_loadParamInto_cb78 $2d
	npc_setNewNpcID $27


npc2a_scripts:
	npc_jumpIfItemGotten $10, func_03_5db9
	.db $01
	npc_set6_cb60_reset_cb6c
	.db $14
-
	npc_loadParamInto_cb78 $ff
	npc_loopAboveParamTimes $03, -
	npc_res4_cb60
	.db $c7 $8d $80 $80
func_03_5d9d:
	.db $41 $02
	.db $44 $02
	.db $40 $ff
	npc_end


npc2b_scripts:
	npc_jumpIfItemGotten $10, func_03_5db9
	npc_set6_cb60_reset_cb6c
	.db $01
	.db $14
-
	npc_loadParamInto_cb78 $ff
	npc_loopAboveParamTimes $03, -
	npc_res4_cb60
	.db $c7 $00 $80 $80
	npc_jump func_03_5d9d


func_03_5db9:
	.db $c7 $00 $80 $80
	npc_end


npc29_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $44 $02
	.db $47 $03
@loop:
	.db $41 $01
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $02
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $03
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $04
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $03
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $02
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $0f
	npc_jump @loop


npc22_scripts:
npc49_scripts:
	.db $47 $03
	.db $44 $02
	.db $41 $03
	npc_res4_cb60
--
	.db $40 $10
	.db $0e
	.db $ce $10
	.dw +
-
	.db $0b
	.db $0b
	.db $0b
	npc_jump --
+
	.db $0d
	npc_jump -


npc4b_scripts:
	.db $47 $04
	.db $44 $01
	.db $41 $01
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
-
	.db $40 $ff
	.db $0f
	npc_jump -


npc43_scripts:
npc44_scripts:
	npc_set6_cb60_reset_cb6c
	.db $44 $02
	.db $16
	.db $47 $03
	npc_res4_cb60
@loop:
	.db $c3 $aa
	.dw +
	npc_loadParamInto_cb78 $0a
	npc_jump @func_5e3f
+
	.db $c3 $80
	.dw +
	npc_loadParamInto_cb78 $28
	npc_jump @func_5e3f
+
	npc_loadParamInto_cb78 $14

@func_5e3f:
	npc_set6_cb60_reset_cb6c
	.db $16
	.db $89 $61 $16
	.db $c3 $80
	.dw +
	.db $46 $58
	npc_jump ++
+
	.db $46 $59
++
	npc_loadParamInto_cb78 $05
	npc_set6_cb60_reset_cb6c
	.db $16
	.db $89 $61 $16
	.db $c3 $80
	.dw +
	.db $46 $58
	npc_jump @loop
+
	.db $46 $59
	npc_jump @loop


npc45_scripts:
	npc_set6_cb60_reset_cb6c
	npc_addParamsToXthenYCoords $02 $00
	npc_res4_cb60
	npc_jump _infLoop_639f


npc46_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $89 $58 $16
	npc_loadParamInto_cb78 $05
	.db $c7 $00 $80 $80
	npc_end


npc5a_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $89 $58 $16
	npc_loadParamInto_cb78 $05
	npc_end


npc47_scripts:
npc48_scripts:
	.db $1f
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_jump _infLoop_639f


npc56_scripts:
npc57_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set_c059 $ff
	.db $05
	.db $01
	npc_res4_cb60
	npc_loadParamInto_cb78 $1e
	.db $89 $f2 $15
	.db $41 $01
	.db $40 $10
	.db $41 $02
	.db $40 $08
	.db $41 $03
	.db $40 $08
	.db $41 $04
	.db $40 $08
	.db $41 $05
	.db $40 $08
	.db $41 $06
	.db $40 $08
	.db $41 $07
	.db $40 $08
	.db $41 $08
	.db $40 $50
	npc_set_c059 $01
	npc_end


npc4a_scripts:
	.db $47 $04
	.db $1d
	.db $01
	npc_res4_cb60
	.db $8d $01 $1e
	npc_set6_cb60_reset_cb6c
-
	.db $05
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $06
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $05
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	npc_jump -


npc5d_scripts:
	npc_jumpIfArmorOfGodGotten AOG_BELT, _npc_end_03_5f56
	.db $41 $03
	.db $51 $31
	.db $50 $30
	npc_jump ++
@loop:
	.db $40 $20
	.db $c3 $20
	.dw @func_5f2a
@loop2:
	.db $c3 $20
	.dw ++
	.db $c3 $80
	.dw +
	.db $0d
	npc_jump @loop
+
	.db $0e
	npc_jump @loop
++
	.db $01
	npc_res4_cb60
	.db $50 $30
	.db $05
	.db $40 $08
	.db $06
	npc_loadParamInto_cb78 $0a
	.db $06
	.db $40 $08
	.db $51 $30
	.db $04
	.db $02
	npc_jump @loop
@func_5f2a:
	.db $c0 $01 $00 $00
	npc_jump @loop2


npc5c_scripts:
npc5e_scripts:
	npc_jumpIfArmorOfGodGotten AOG_BELT, data_03_5f57
	.db $14
	.db $1d
	.db $03
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
@loop:
	.db $55 $5d
	npc_loadParamInto_cb78 $01
	npc_jumpIfItemGotten $30, @func_5f49
	npc_jumpIfItemGotten $31, _npc_end_03_5f56
	npc_jump @loop
@func_5f49:
	npc_loadParamInto_cb78 $01
	npc_jumpIfItemGotten $31, _npc_end_03_5f56
	npc_jumpIfItemGotten $30, @func_5f49
	npc_jump @loop

_npc_end_03_5f56:
	npc_end

data_03_5f57:
	.db $c7 $85 $08 $02
	npc_end


npc5f_scripts:
	.db $14
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $50 $31
	.db $16
	npc_loadParamInto_cb78 $05
	.db $04
	.db $c7 $85 $08 $02
	.db $89 $d7 $15
	npc_end


npc60_scripts:
	.db $51 $30
	.db $51 $31
	.db $01
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, @func_5fc1
	.db $41 $10
@loop:
	.db $40 $10
	.db $82
	.dw @func_5f85
	.db $c9 $00
	.dw @func_5f91
	.db $c9 $9c
	.dw @func_5fa9
@func_5f85:
	.db $c3 $80
	.dw +
	.db $0d
	npc_jump @loop
+
	.db $0e
	npc_jump @loop
@func_5f91:
	.db $c3 $33
	.dw +
	npc_jump @func_5f85
+
	.db $c7 $14 $80 $80
	.db $89 $5f $17
	.db $8d $50 $78
	.db $c7 $00 $80 $80
	npc_jump @loop
@func_5fa9:
	.db $c3 $33
	.dw +
	npc_jump @func_5f85
+
	.db $c7 $14 $80 $80
	.db $89 $5f $17
	.db $8d $50 $78
	.db $c7 $9d $80 $80
	npc_jump @loop
@func_5fc1:
	.db $c7 $84 $0c $01
	npc_end


npc61_scripts:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, npcScript_end
	npc_loadParamInto_cb78 $0a
	npc_jumpIfItemGotten $30, +
	npc_jumpIfItemGotten $31, ++
	.db $50 $30
	npc_jump @func_600d

+
	npc_jumpIfItemGotten $31, +++
	.db $51 $30
	.db $50 $31
	.db $89 $d7 $15
	npc_jump @func_600d

++
	.db $50 $30
	.db $89 $d7 $15
	npc_jump @func_600d

+++
	.db $89 $d7 $15
	.db $04
	.db $c0 $03 $80 $80
	npc_loadParamInto_cb78 $0f
	.db $c7 $84 $0c $01
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	npc_end

@func_600d:
	.db $04
	.db $c3 $c0
	.dw +
	.db $80 $30 $10
	npc_jump @func_602f
+
	.db $c3 $aa
	.dw +
	.db $80 $60 $70
	npc_jump @func_602f
+
	.db $c3 $80
	.dw +
	.db $80 $a0 $50
	npc_jump @func_602f
+
	.db $80 $e0 $10

@func_602f:
	.db $82
	.dw @func_600d
	.db $c9 $00
	.dw +
	npc_jump @func_600d
+
	.db $47 $03
	.db $44 $02
	.db $41 $03
	npc_res4_cb60
--
	.db $40 $10
	.db $0e
	.db $ce $10
	.dw +

-
	.db $0b
	.db $0b
	.db $0b
	npc_jump --
+
	.db $0d
	npc_jump -


npc63_scripts:
	npc_jumpIfArmorOfGodGotten AOG_SWORD, @func_6098
	npc_loadParamInto_cb78 $0a
	npc_jumpIfItemGotten $30, +
	npc_jumpIfItemGotten $31, ++
	.db $50 $30
	npc_jump @func_60c9
+
	npc_jumpIfItemGotten $31, +++
	.db $51 $30
	.db $50 $31
	.db $89 $d7 $15
	npc_jump @func_609d
++
	.db $50 $30
	.db $89 $d7 $15
	npc_jump @func_609d
+++
	.db $89 $d7 $15
	.db $04
	.db $c0 $03 $80 $80
	npc_loadParamInto_cb78 $0f
	.db $c7 $84 $0e $01
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	npc_end

@func_6098:
	.db $c7 $84 $0e $01
	npc_end

@func_609d:
	.db $04
	.db $c3 $c0
	.dw +
	.db $80 $b0 $50
	npc_jump @func_60bf
+
	.db $c3 $aa
	.dw +
	.db $80 $40 $90
	npc_jump @func_60bf
+
	.db $c3 $80
	.dw +
	.db $80 $70 $70
	npc_jump @func_60bf
+
	.db $80 $20 $30

@func_60bf:
	.db $82
	.dw @func_609d
	.db $c9 $00
	.dw @func_60c9
	npc_jump @func_609d

@func_60c9:
	npc_res4_cb60
	.db $41 $04
	.db $44 $0e
-
	.db $40 $10
	.db $ce $10
	.dw ++
	.db $c3 $2a
	.dw +
	npc_jump -
+
	.db $c0 $64 $00 $08
	.db $8d $05 $0a
++
	.db $0f
	npc_jump -


npc64_scripts:
	.db $01
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $41 $03
	.db $44 $04
	.db $06
	.db $40 $ff
	npc_setNewNpcID $5a


npc65_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $89 $d7 $15
	.db $16
	npc_end


npc62_scripts:
	.db $51 $30
	.db $51 $31
	npc_jumpIfArmorOfGodGotten AOG_SWORD, npcScript_end
	npc_res4_cb60
	.db $41 $03
	.db $44 $08
@loop:
	.db $40 $10
	.db $ce $10
	.dw @func_6178
	.db $c3 $33
	.dw +
	npc_jump @loop
+
	.db $ce $30
	.dw @loop
	.db $ce $20
	.dw @loop
	.db $ce $10
	.dw @loop
	.db $89 $ec $16
	.db $d0 $09
	.dw +
	.db $c7 $45 $81 $80
	npc_loadParamInto_cb78 $01
	.db $c7 $45 $82 $80
	npc_loadParamInto_cb78 $01
	.db $c7 $45 $83 $80
	.db $8d $03 $0a
	.db $c7 $00 $83 $80
	npc_loadParamInto_cb78 $01
	.db $c7 $00 $82 $80
	npc_loadParamInto_cb78 $01
	.db $c7 $00 $81 $80
	.db $8d $04 $08
	npc_jump @loop
+
	.db $c7 $45 $ff $80
	npc_loadParamInto_cb78 $01
	.db $c7 $45 $fe $80
	npc_loadParamInto_cb78 $01
	.db $c7 $45 $fd $80
	.db $8d $03 $0a
	.db $c7 $00 $fd $80
	npc_loadParamInto_cb78 $01
	.db $c7 $00 $fe $80
	npc_loadParamInto_cb78 $01
	.db $c7 $00 $ff $80
	.db $8d $04 $08
	npc_jump @loop
@func_6178:
	.db $0f
	npc_jump @loop


// scrolling text rooms
npc2d_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $04
	.db $1f
	npc_set2_cbe4
	npc_res4_cb60
	npc_groupRoomXYjumpTable @table
	.db $18
	npc_end

@table:
	.db $1c $00 $00
	.dw @entry0

	.db $1c $01 $00
	.dw @entry1

	.db $1c $00 $01
	.dw @entry2

	.db $1c $02 $00
	.dw @entry3

	.db $1c $01 $01
	.dw @entry4

	.db $1c $02 $01
	.dw @entry5

	.db $1c $00 $02
	.dw @entry6

	.db $1c $01 $02
	.dw @entry7

	.db $1c $02 $02
	.dw @entry8

	.db $1c $00 $03
	.dw @entry9

	.db $1c $01 $03
	.dw @entryA

	.db $1c $02 $03
	.dw @entryB

	.db $1c $00 $05
	.dw @entryC

	.db $1c $00 $04
	.dw @entryD

	.db $1c $01 $04
	.dw @entryE

	.db $1c $02 $04
	.dw @entryF

	.db $1c $01 $05
	.dw @entry10

	.db $1c $00 $06
	.dw @entry11

	.db $1c $01 $06
	.dw @entry12

	.db $1c $02 $06
	.dw @entry13

	.db $1c $00 $07
	.dw @entry14

	.db $1c $01 $07
	.dw @entry15

	.db $1c $02 $07
	.dw @entry16

	.db $1c $00 $08
	.dw @entry17

	.db $ff $ff $ff

@entry0:
	npc_jumpIfItemGotten $00 _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_63ab
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $2e $78 $5c
	npc_jump @func_639d

@entry1:
	npc_jumpIfItemGotten $08 _showText_roomEmpty_clear_c059

@func_6219:
	npc_set_c059 $ff
	npc_startScrollingText text_03_6423
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $30 $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entry2:
	npc_jumpIfItemGotten $14 _showText_roomEmpty_clear_c059
	npc_jumpIfArmorOfGodGotten AOG_BELT _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_6497
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $34 $7a $64
	npc_jump @func_639d

@entry3:
	npc_set_c059 $ff
	npc_startScrollingText text_03_64fe
	npc_startScrollingText text_03_63aa
	npc_jumpIfItemGotten $01, +
	npc_startScrollingText text_03_6551
	npc_spawnNPC $2e $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump ++
+
	npc_startScrollingText text_03_6482
++
	npc_spawnNPC $3a $42 $64
	npc_spawnNPC $33 $38 $54
	npc_spawnNPC $3b $b2 $64
	npc_spawnNPC $33 $a8 $54
	npc_jump @func_639d

@entry4:
	npc_jumpIfItemGotten $21, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_6566
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $3d $50 $64
	npc_spawnNPC $3c $a0 $64
	npc_jump @func_639d

@entry5:
	npc_jumpIfItemGotten $09, _showText_roomEmpty_clear_c059
	npc_jump @func_6219

@entry6:
	npc_jumpIfArmorOfGodGotten $02, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_65c3
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $35 $7a $64
	npc_jump @func_639d

@entry7:
	npc_jumpIfItemGotten $0c, _showText_roomEmpty_clear_c059

@func_62a8:
	npc_set_c059 $ff
	npc_startScrollingText text_03_6621
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $31 $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entry8:
	npc_jumpIfItemGotten $05, _showText_roomEmpty_clear_c059

@func_62bf:
	npc_set_c059 $ff
	npc_startScrollingText text_03_666e
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $2f $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entry9:
	npc_jumpIfItemGotten $0d, _showText_roomEmpty_clear_c059
	npc_jump @func_62a8

@entryA:
	npc_jumpIfItemGotten $11, _showText_roomEmpty_clear_c059

@func_62dd:
	npc_set_c059 $ff
	npc_startScrollingText text_03_66d5
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $32 $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entryB:
	npc_jumpIfItemGotten $03, _showText_roomEmpty_clear_c059

@func_62f4:
	npc_set_c059 $ff
	npc_startScrollingText text_03_672f
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $2e $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entryC:
	npc_jumpIfArmorOfGodGotten $10, +
	npc_set_c059 $ff
	npc_startScrollingText text_03_6789
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $38 $78 $6c
	npc_jump @func_639d
+
	npc_startScrollingText text_03_6832
	npc_jump @func_639d

@entryD:
	npc_jumpIfItemGotten $0b, _showText_roomEmpty_clear_c059
	npc_jump @func_6219

@entryE:
	npc_jumpIfItemGotten $07, _showText_roomEmpty_clear_c059
	npc_jump @func_62bf

@entryF:
	npc_jumpIfItemGotten $10, _showText_roomEmpty_clear_c059
	npc_jump @func_62dd

@entry10:
	npc_jumpIfSpecialBitemGotten $02, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_67ca
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $40 $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entry11:
	npc_jumpIfItemGotten $13, _showText_roomEmpty_clear_c059
	npc_jump @func_62dd

@entry12:
	npc_jumpIfItemGotten $0f, _showText_roomEmpty_clear_c059
	npc_jump @func_62a8

@entry13:
	npc_set_c059 $ff
	npc_startScrollingText text_03_6849
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $57 $88 $90
	npc_takeArmorOfGod AOG_BELT
	npc_jump @func_639d

@entry14:
	npc_set_c059 $ff
	npc_startScrollingText text_03_68bb
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $56 $88 $90
	npc_takeArmorOfGod AOG_ARMOUR
	npc_jump @func_639d

@entry15:
	npc_jumpIfArmorOfGodGotten $08, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_6930
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $37 $7a $64
	npc_jump @func_639d

@entry16:
	npc_jumpIfItemGotten $02, _showText_roomEmpty_clear_c059
	npc_jump @func_62f4

@entry17:
	npc_jumpIfItemGotten $0e, _showText_roomEmpty_clear_c059
	npc_jump @func_62a8

@func_639d:
--
	npc_set_c059 $00

_infLoop_639f:
-
	npc_loadParamInto_cb78 $02
	npc_jump -

_showText_roomEmpty_clear_c059:
	npc_startScrollingText text_roomEmpty
	npc_jump --


text_03_63aa:
	.db $7f


text_03_63ab:
	.db $04 $03
	.asc "You have found the"
	.db $01
	.asc "Pear!  It is your"
	.db $01
	.asc "first Fruit of the"
	.db $01
	.asc "Spirit. Use the A"
	.db $01
	.asc "button to throw it."
	.db $ff $7f


text_roomEmpty:
	.db $04 $03
	.asc "This room is empty."
	.db $ff $7f


text_03_6423:
	.db $04 $03
	.asc "Here is an apple to "
	.db $01
	.asc "add to your fruit"
	.db $01
	.asc "collection. It goes"
	.db $01
	.asc "slow but is very"
	.db $01
	.asc "powerful."
	.db $ff $0b $10 $7b
	.asc "40"
	.db $ff $7f


text_03_6482:
	.db $0b $09 $7b
	.asc "20           "
	.db $7b
	.asc "75"
	.db $ff $7f


text_03_6497:
	.db $04 $03
	.asc "This is the Belt of"
	.db $01
	.asc "Truth, one of the 6"
	.db $01
	.asc "pieces of the armor"
	.db $01
	.asc "of God. With it you"
	.db $01
	.asc "can move obstacles."
	.db $ff $7f


text_03_64fe:
	.db $04 $03
	.asc "For the strong in"
	.db $01
	.asc "spirit, I offer"
	.db $01
	.asc "these items. They"
	.db $01
	.asc "will aid you in"
	.db $01
	.asc "your quest."
	.db $ff $7f


text_03_6551:
	.db $0b $09 $7b
	.asc "20    "
	.db $7b
	.asc "25    "
	.db $7b
	.asc "75"
	.db $ff $7f


text_03_6566:
	.db $04 $03
	.asc "Way to go! You've"
	.db $01
	.asc "found a hidden"
	.db $01
	.asc "room. I present"
	.db $01
	.asc "you with 75 vials"
	.db $01
	.asc "and 150 spirit"
	.db $01
	.asc "points."
	.db $ff $7f


text_03_65c3:
	.db $04 $03
	.asc "I now present you"
	.db $01
	.asc "with a Breastplate"
	.db $01
	.asc "of Righteousness."
	.db $01
	.asc "Your damage will"
	.db $01
	.asc "be reduced by 1/2."
	.db $ff $7f


text_03_6621:
	.db $04 $03
	.asc "The mighty grapes"
	.db $01
	.asc "await you. This"
	.db $01
	.asc "fruit scatters"
	.db $01
	.asc "when you throw it."
	.db $ff $0b $10 $7b
	.asc "75"
	.db $ff $7f


text_03_666e:
	.db $04 $03
	.asc "The advantage of"
	.db $01
	.asc "using a pomegranate"
	.db $01
	.asc "is that it has a"
	.db $01
	.asc "wider range. It"
	.db $01
	.asc "travels a zig-zag"
	.db $01
	.asc "path."
	.db $ff $0b $10 $7b
	.asc "60"
	.db $ff $7f


text_03_66d5:
	.db $04 $03
	.asc "The fastest and"
	.db $01
	.asc "farthest flying"
	.db $01
	.asc "fruit is the"
	.db $01
	.asc "banana. It travels"
	.db $01
	.asc "a straight path."
	.db $ff $0b $10 $7b
	.asc "90"
	.db $ff $7f


text_03_672f:
	.db $04 $03
	.asc "Here is another"
	.db $01
	.asc "pear for your"
	.db $01
	.asc "collection. You can"
	.db $01
	.asc "find up to four of"
	.db $01
	.asc "each fruit."
	.db $ff $0b $10 $7b
	.asc "25"
	.db $ff $7f


text_03_6789:
	.db $06 $0b
	.asc "The Helmet of"
	.db $01
	.asc "Salvation"
	.db $01
	.asc "protects you"
	.db $01
	.asc "from harmful"
	.db $01
	.asc "explosions."
	.db $ff $7f


text_03_67ca:
	.db $04 $03
	.asc "Samson's Jawbone"
	.db $01
	.asc "allows you to"
	.db $01
	.asc "retrieve items."
	.db $01
	.asc "Select it from the"
	.db $01
	.asc "menu and use B to"
	.db $01
	.asc "throw it."
	.db $ff $0b $10 $7b
	.asc "195"
	.db $ff $7f


text_03_6832:
	.db $0c $08
	.asc "This cave is empty."
	.db $ff $7f


text_03_6849:
	.db $04 $03
	.asc "You have no place"
	.db $01
	.asc "in a bar. As"
	.db $01
	.asc "punishment, I"
	.db $01
	.asc "am taking back the"
	.db $01
	.asc "Belt of Truth. You"
	.db $01
	.asc "can reclaim it in"
	.db $01
	.asc "the slum."
	.db $ff $7f


text_03_68bb:
	.db $04 $03
	.asc "You have no place"
	.db $01
	.asc "in a casino. I am"
	.db $01
	.asc "taking back the"
	.db $01
	.asc "Breastplate of"
	.db $01
	.asc "Righteousness. You"
	.db $01
	.asc "can reclaim it in"
	.db $01
	.asc "the slum."
	.db $ff $7f


text_03_6930:
	.db $04 $03
	.asc "You have found the"
	.db $01
	.asc "Shield of Faith."
	.db $01
	.asc "The fiery darts"
	.db $01
	.asc "won't harm you now!"
	.db $ff $7f


func_03_697b:
	npc_set6_cb60_reset_cb6c
	.db $01
	.db $07
	npc_set2_cbe4
	npc_res4_cb60
	npc_loadParamInto_cb78 $08
	.db $82
	.dw +
+
	npc_ret


func_03_6986:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
-
	.db $82
	.dw +
	.db $8a
	.dw +
	npc_loadParamInto_cb78 $01
	npc_jump -
+
	npc_ret


data_03_6994:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60

data_03_6996:
-
	.db $82
	.dw @done
	npc_loadParamInto_cb78 $01
	npc_jump -

@done:
	npc_ret

data_03_699f:
-
	npc_loadParamInto_cb78 $01
	.db $82
	.dw -
	npc_loadParamInto_cb78 $05
	.db $82
	.dw -
	npc_ret


func_03_69aa:
	npc_set_c059 $ff
	npc_giveNumBombs $01
	npc_callCommonSoundFuncs_6c01 $5f $17
	npc_loadParamInto_cb78 $02
	npc_ret


func_03_69b4:
	npc_set_c059 $ff
	npc_giveNumBirds $01
	npc_callCommonSoundFuncs_6c01 $5f $17
	npc_loadParamInto_cb78 $02
	npc_ret


data_03_69be:
	npc_increaseScore $04


data_03_69c0:
	npc_increaseScore $04
	npc_increaseScore $04


data_03_69c4:
	npc_increaseScore $04

data_03_69c6:
	npc_increaseScore $04


data_03_69c8:
	npc_increaseScore $04
	npc_increaseScore $04


data_03_69cc:
	npc_increaseScore $04
	npc_increaseScore $04
	npc_ret


;;
	ld   b, l                                        ; $69d1: $45
	ld   ($0845), sp                                 ; $69d2: $08 $45 $08


data_03_69d5:
	npc_increaseScore $08
	npc_increaseScore $08
	npc_increaseScore $08
	npc_increaseScore $08


data_03_69dd:
	npc_increaseScore $08
	npc_increaseScore $08
	npc_increaseScore $08
	npc_ret


npc66_scripts:
	npc_set_c059 $80
	npc_setCoords $08 $40
	npc_call @func_6a09
	npc_call @func_6a09
	npc_call @func_6a09
	npc_call @func_6a09
	npc_call @func_6a09
	npc_startScrollingText @text_6a37
	npc_callCommonSoundFuncs_6d6c $01 $ff
	npc_set_c059 $ff
	npc_loadParamInto_cb78 $5a
-
	npc_set_c059 $80
	npc_loadParamInto_cb78 $01
	npc_jump -

@func_6a09:
-
	npc_set_c059 $80
	.db $c7 $d8 $80 $80
	npc_addParamsToXthenYCoords $10 $00
	npc_loopAboveParamTimes $08, -
	npc_addParamsToXthenYCoords $c0 $00
	npc_addParamsToXthenYCoords $c0 $00
	npc_loadParamInto_cb78 $04
	npc_set_c059 $80
	.db $c7 $9c $80 $80
	npc_addParamsToXthenYCoords $10 $00
	npc_loopAboveParamTimes $08, $6a1e
	npc_addParamsToXthenYCoords $c0 $00
	npc_addParamsToXthenYCoords $c0 $00
	npc_loadParamInto_cb78 $04
	npc_addParamsToXthenYCoords $00 $10
	npc_ret

@text_6a37:
	.db $09 $03
	.asc "  Hallelujah! "
	.db $01
	.asc "   You have   "
	.db $01
	.asc " defeated the "
	.db $01
	.asc " foe and freed"
	.db $01
	.asc "the city from "
	.db $01
	.asc "his evil rule."
	.db $01
	.asc "God bless you "
	.db $01
	.asc "in all you do!"
	.db $ff $7f


;; // 6ab2
	.db $7b $3b $3f $02


npc67_scripts:
	npc_set_c059 $ff
	npc_set6_cb60_reset_cb6c
	.db $47 $03
	.db $08
	.db $41 $02
	npc_res4_cb60
-
	.db $40 $08
	npc_startScrollingText text_03_6afa
	npc_loopAboveParamTimes $1b, -
	npc_spawnNPC $68 $a0 $30

-
	.db $40 $08
	npc_startScrollingText text_03_6afa
	npc_loopAboveParamTimes $02, -
	.db $40 $08
	npc_loadParamInto_cb78 $04
	.db $07
	npc_spawnNPC $66 $00 $00
-
	npc_loadParamInto_cb78 $01
	npc_jump -


npc68_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $03
	.db $08
	.db $41 $02
	npc_res4_cb60
	npc_startScrollingText text_03_6aff
	.db $40 $08
	npc_startScrollingText text_03_6b05
	.db $40 $08
	npc_startScrollingText text_03_6b0a
	npc_jump -


text_03_6afa:
	.db $80 $80
	.db $5d
	.db $ff $7f


text_03_6aff:
	.db $07 $14
	.asc "  "
	.db $ff $7f


text_03_6b05:
	.db $07 $13
	.asc " "
	.db $ff $7f


text_03_6b0a:
	.db $07 $12
	.asc " "
	.db $ff $7f
