npcScript_end:
	npc_end


; ==============================================================================
; ENTID_PEAR
; ==============================================================================
npc2e_scripts:
	npc_call data_03_6994
	npc_groupRoomXYjumpTable @initialScripts
	npc_jumpIfNumBirdsGotten 25, +
	npc_jump data_03_4fde
+
	npc_call shopTake25birds
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_giveFruit FRUIT_PEAR
	npc_groupRoomXYjumpTable @scriptsAfterFruitGiven
	npc_end

@initialScripts:
	.db $1c $00 $00
	.dw @initialScript_1stPear
	
	.db $ff $ff $ff

@scriptsAfterFruitGiven:
	.db $1c $02 $00
	.dw @topleftCity

	.db $1c $02 $07
	.dw @airportBuildingEast

	.db $1c $02 $03
	.dw @portBottomLeft

	.db $ff $ff $ff

@initialScript_1stPear:
	npc_giveFruit FRUIT_PEAR
	npc_giveItem ITEMID_PEAR_FIRST_SCREEN
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_call npcHelper_increaseScoreBy40
	npc_end

@topleftCity:
	npc_giveItem ITEMID_PEAR_TOPLEFT_CITY
	npc_call npcHelper_increaseScoreBy80
	npc_end

@airportBuildingEast:
	npc_giveItem ITEMID_AIRPORT_BUILDING_PEAR
	npc_increaseScore SCORE_100
	npc_call npcHelper_increaseScoreBy60
	npc_end

@portBottomLeft:
	npc_giveItem ITEMID_PORT_BOTTOM_LEFT_PEAR
	npc_call npcHelper_increaseScoreBy300
	npc_call npcHelper_increaseScoreBy20
	npc_end


; ==============================================================================
; ENTID_POMEGRANATE
; ==============================================================================
npc2f_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 60, +
	npc_jump data_03_4fde
+
	npc_giveFruit FRUIT_POMEGRANATE
	npc_call shopTake60birds
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1b $02 $01
	.dw @slumsBottomLeft

	.db $1c $02 $02
	.dw @script_1c_02_02

	.db $1b $02 $02
	.dw @warehouseAboveRR

	.db $1c $01 $04
	.dw @script_1c_01_04

@slumsBottomLeft:
	npc_giveItem ITEMID_SLUMS_BOTTOM_LEFT_POMEGRANATE
	npc_call npcHelper_increaseScoreBy60
	npc_end

@script_1c_02_02:
	npc_giveItem ITEMID_HOUSES_TOP_RIGHT_POMEGRANATE
	npc_increaseScore SCORE_100
	npc_call npcHelper_increaseScoreBy20
	npc_end

@warehouseAboveRR:
	npc_giveItem ITEMID_WAREHOUSE_ABOVE_RR_POMEGRANATE
	npc_increaseScore SCORE_200
	npc_call npcHelper_increaseScoreBy40
	npc_end

@script_1c_01_04:
	npc_giveItem ITEMID_FOREST_LOG_POMEGRANATE
	npc_increaseScore SCORE_400
	npc_call npcHelper_increaseScoreBy80
	npc_end


; ==============================================================================
; ENTID_APPLE
; ==============================================================================
npc30_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 40, +
	npc_jump data_03_4fde
+
	npc_giveFruit FRUIT_APPLE
	npc_call shopTake40birds
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1c $01 $00
	.dw @boss1hiddenArea

	.db $1c $02 $01
	.dw @bottomRightCity

	.db $1e $00 $00
	.dw @warehousesBottomLeft

	.db $1c $00 $04
	.dw @forestTopRight

	.db $ff $ff $ff

@boss1hiddenArea:
	npc_giveItem ITEMID_BOSS_1_AREA_HIDDEN_APPLE
	npc_call npcHelper_increaseScoreBy80
	npc_end

@bottomRightCity:
	npc_giveItem ITEMID_CITY_BOTTOM_RIGHT_APPLE
	npc_increaseScore SCORE_100
	npc_call npcHelper_increaseScoreBy60
	npc_end

@warehousesBottomLeft:
	npc_giveItem ITEMID_WAREHOUSES_BOTTOM_LEFT_APPLE
	npc_call npcHelper_increaseScoreBy300
	npc_call npcHelper_increaseScoreBy20
	npc_end

@forestTopRight:
	npc_giveItem ITEMID_FOREST_TOP_RIGHT_APPLE
	npc_call npcHelper_increaseScoreBy700
	npc_call npcHelper_increaseScoreBy20
	npc_end


; ==============================================================================
; ENTID_GRAPES
; ==============================================================================
npc31_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 75, +
	npc_jump data_03_4fde
+
	npc_giveFruit FRUIT_GRAPES
	npc_call shopTake75birds
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1c $01 $02
	.dw @housesHidden

	.db $1c $00 $03
	.dw @hotelsBottomRight

	.db $1c $00 $08
	.dw @beachWest

	.db $1c $01 $06
	.dw @prisonTopRight

	.db $ff $ff $ff

@housesHidden:
	npc_giveItem ITEMID_HOUSES_HIDDEN_GRAPES
	npc_call npcHelper_increaseScoreBy90
	npc_end

@hotelsBottomRight:
	npc_giveItem ITEMID_HOTELS_BOTTOM_RIGHT_GRAPES
	npc_increaseScore SCORE_100
	npc_call npcHelper_increaseScoreBy80
	npc_end

@beachWest:
	npc_giveItem ITEMID_WEST_BEACH_GRAPES
	npc_call npcHelper_increaseScoreBy300
	npc_call npcHelper_increaseScoreBy60
	npc_end

@prisonTopRight:
	npc_giveItem ITEMID_PRISON_TOP_RIGHT_GRAPES
	npc_call npcHelper_increaseScoreBy700
	npc_call npcHelper_increaseScoreBy20
	npc_end


; ==============================================================================
; ENTID_BANANA
; ==============================================================================
npc32_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 90, +
	npc_jump data_03_4fde
+
	npc_giveFruit FRUIT_BANANA
	npc_call shopTake90birds
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1c $02 $04
	.dw @hotelsUnderCar

	.db $1c $01 $03
	.dw @underShipyardTunnel

	.db $1b $01 $00
	.dw @beachFishHouse

	.db $1c $00 $06
	.dw @deepInPrison

	.db $ff $ff $ff

@hotelsUnderCar:
	npc_giveItem ITEMID_HOTELS_BANANA_UNDER_CAR
	npc_increaseScore SCORE_100
	npc_end

@underShipyardTunnel:
	npc_giveItem ITEMID_SHIPYARD_TUNNEL_BANANA
	npc_increaseScore SCORE_200
	npc_end

@beachFishHouse:
	npc_giveItem ITEMID_BEACH_FISH_HOUSE_BANANA
	npc_increaseScore SCORE_400
	npc_end

@deepInPrison:
	npc_giveItem ITEMID_BANANA_DEEP_IN_PRISON
	npc_increaseScore SCORE_800
	npc_end


data_03_4fde:
-
	npc_displayTextScreen npcText_yourFaithLooksWeak
	npc_call data_03_699f
	npc_call b3_waitUntilPlayerContact
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
	npc_set3_cb60
	npc_call func_03_697b
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_wait $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	npc_giveNumBirds $01
data_03_5031:
	npc_callCommonSoundFuncs_6c01 $85 $16
	npc_faceUp
	npc_setMovementSpeed $0c
	npc_moveByParamPixels $ff
	npc_end


npc69_scripts:
	npc_setRoomFlagFrom_cbf0


npc17_scripts:
	npc_set3_cb60
	npc_call func_03_697b
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_wait $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	npc_giveNumBirds $05
	npc_jump data_03_5031


npc3f_scripts:
	npc_call func_03_697b
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_wait $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	npc_giveNumBirds $0a
	npc_jump data_03_5031


npc18_scripts:
	npc_set3_cb60
	npc_call func_03_697b
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_wait $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	npc_addToPlayerHealth $02
	npc_jump data_03_5031


; ==============================================================================
; ENTID_PRICE_BIRD
; ==============================================================================
npc33_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_res4_cb60
	npc_jump _infLoop_639f


func_03_5082:
-
	npc_set_c059 $ff
	npc_addToPlayerHealth $01
	npc_callCommonSoundFuncs_6c01 $6a $16
	npc_wait $02
	npc_jumpIfPlayerIsFullHealth +
	npc_jump -
+
	npc_set_c059 $00
	npc_ret


; ==============================================================================
; ENTID_BELT_OF_TRUTH
; ==============================================================================
npc34_scripts:
	npc_call data_03_6994
	npc_groupRoomXYjumpTable @table
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	npc_giveArmorOfGod AOG_BELT
	npc_increaseScore SCORE_1500
	npc_giveItem ITEMID_BELT
	npc_set_c059 $00
	npc_end

@pawnShop:
	npc_jumpIfNumBirdsGotten $96, +
	npc_jump data_03_4fde
+
	npc_giveArmorOfGod AOG_BELT
	npc_call shopTake150birds
	npc_end

@table:
	.db $1b $00 $01
	.dw @pawnShop

	.db $ff $ff $ff


func_03_50c0:
	npc_set_c059 $ff
-
	npc_callCommonSoundFuncs_6c01 $85 $16
	npc_wait $02
	npc_loopAboveParamTimes $1e, -
	npc_set_c059 $01
	npc_ret


; ==============================================================================
; ENTID_BREASTPLATE_OF_RIGHTEOUSNESS
; ==============================================================================
npc35_scripts:
	npc_call data_03_6994
	npc_groupRoomXYjumpTable @table
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	npc_giveArmorOfGod AOG_ARMOUR
	npc_increaseScore SCORE_1500
	npc_giveItem ITEMID_ARMOUR
	npc_set_c059 $00
	npc_end

@pawnShop:
	npc_jumpIfNumBirdsGotten $c8, +
	npc_jump data_03_4fde
+
	npc_giveArmorOfGod AOG_ARMOUR
	npc_call shopTake200birds
	npc_end

@table:
	.db $1b $00 $01
	.dw @pawnShop

	.db $ff $ff $ff


; ==============================================================================
; ENTID_BOOTS_OF_THE_GOSPEL
; ==============================================================================
npc36_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	npc_giveArmorOfGod AOG_BOOTS
	npc_increaseScore SCORE_1500
	npc_set_c059 $00
	npc_end


; ==============================================================================
; ENTID_HELMET_OF_SALVATION
; ==============================================================================
npc38_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	npc_giveArmorOfGod AOG_HELM
	npc_increaseScore SCORE_1500
	npc_set_c059 $00
	npc_end


npc37_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	npc_giveArmorOfGod AOG_SHIELD
	npc_increaseScore SCORE_1500
	npc_set_c059 $00
	npc_end


; ==============================================================================
; ENTID_SWORD_OF_THE_SPIRIT
; ==============================================================================
npc39_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	npc_giveArmorOfGod AOG_SWORD
	npc_increaseScore SCORE_1500
	npc_set_c059 $00
	npc_end


; ==============================================================================
; ENTID_SHOP_7_VIALS
; ==============================================================================
npc3a_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten $14, +
	npc_jump data_03_4fde
+
	npc_giveNumBombs $07
	npc_call shopTake20birds
	npc_end


; ==============================================================================
; ENTID_SHOP_OIL
; ==============================================================================
npc3b_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten $4b, +
	npc_jump data_03_4fde
+
	npc_incAnointingOilsGotten
	npc_call shopTake75birds
	npc_end


npc40_scripts:
	npc_jumpIfSpecialBitemGotten SPECIALB_JAWBONE, _npc_end_03_529a
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 195, +
	npc_jump data_03_4fde
+
	npc_giveSpecialBItem SPECIALB_JAWBONE
	npc_increaseScore SCORE_800
	npc_call shopTake195birds
	npc_end


; ==============================================================================
; ENTID_RAFT
; ==============================================================================
npc41_scripts:
	npc_jumpIfSpecialBitemGotten SPECIALB_RAFT, @end
	npc_set3_cb60
	npc_placeTile $00 $80 $80
	npc_call func_03_6986
	npc_giveSpecialBItem SPECIALB_RAFT
	npc_call npcHelper_increaseScoreBy700
	npc_call npcHelper_increaseScoreBy50
	npc_callCommonSoundFuncs_6c01 $6a $16
	npc_placeTile $37 $80 $80
@end:
	npc_end


npc00_scripts:
	npc_setRoomFlagFrom_cbf0
	npc_facePlayerHorizontally
	npc_turnBackwards
	npc_res4_cb60
	npc_set2_cbe4
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_set6_cb60_reset_cb6c
	npc_callCommonSoundFuncs_6c01 $7c $16
	npc_increaseScore SCORE_10
	npc_spawnNPCAtOffset $84 $00 $00
	npc_wait $05
	npc_jumpIfRandomNumLTparam $aa, +
	npc_spawnNPCAtOffset ENTID_DEVIL_SPAWN $00 $00
	npc_wait $19
	npc_end

+
	npc_wait $23
	npc_jumpIfRandomNumLTparam $80, +
	npc_end

+
	npc_jumpIfRandomNumLTparam $40, +
	npc_setNewNpcID $16

+
	npc_jumpIfRandomNumLTparam $80, +
	npc_setNewNpcID $17

+
	npc_setNewNpcID $18


; ==============================================================================
; ENTID_DEVIL_SPAWN
; ==============================================================================
npc01_scripts:
	npc_res4_cb60
	npc_callCommonSoundFuncs_6c01 $26 $16
	npc_set5_cb60
	npc_groupRoomXYjumpTable @table
	npc_setMovementSpeed $01
	npc_setDamageTaken $01
	npc_jump @finally

@mediumDifficulty:
	npc_setMovementSpeed $02
	npc_setDamageTaken $02
	npc_jump @finally

@hardDifficulty:
	npc_setMovementSpeed $03
	npc_setDamageTaken $04
	npc_jump @finally

@finally:
-
	npc_moveByParamPixels $04
	npc_set3_cbe4
	npc_moveByParamPixels $04
	npc_set3_cbe4
	npc_loopAboveParamTimes $3c, -
	npc_wait $0f
	npc_end

@table:
	.db $02 $ff $ff
	.dw @mediumDifficulty

	.db $04 $ff $ff
	.dw @mediumDifficulty

	.db $06 $ff $ff
	.dw @hardDifficulty

	.db $07 $ff $ff
	.dw @mediumDifficulty

	.db $08 $ff $ff
	.dw @mediumDifficulty

	.db $0a $ff $ff
	.dw @mediumDifficulty

	.db $0b $ff $ff
	.dw @hardDifficulty

	.db $0c $ff $ff
	.dw @hardDifficulty

	.db $0d $ff $ff
	.dw @hardDifficulty

	.db $10 $02 $04
	.dw @hardDifficulty

	.db $ff $ff $ff


npc02_scripts:
	npc_set3_cb60
	npc_set2_cbe4 $47
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_res4_cb60
	npc_set6_cb60_reset_cb6c
	npc_callCommonSoundFuncs_6c01 $37 $18
	.db $16
	npc_call npcHelper_increaseScoreBy30
	npc_wait $02
	.db $04
	npc_jumpIfRandomNumLTparam $a0, +
	npc_end
+
	npc_jumpIfRandomNumLTparam $55, +
	npc_setNewNpcID $16
+
	npc_jumpIfRandomNumLTparam $19, +
	npc_setNewNpcID $17
+
	npc_setNewNpcID $3f


shopTake20birds:
-
	npc_takeNumBirds $05
	npc_set_c059 $0a
	npc_callCommonSoundFuncs_6c01 $73 $16
	npc_wait $02
	npc_loopAboveParamTimes $04, -
	npc_ret


shopTake25birds:
	npc_loopAboveParamTimes $06, -
shopTake40birds:
	npc_loopAboveParamTimes $09, -
	npc_loopAboveParamTimes $0b, - // $525e
shopTake60birds:
	npc_loopAboveParamTimes $0d, -
shopTake75birds:
	npc_loopAboveParamTimes $10, -
shopTake90birds:
	npc_loopAboveParamTimes $13, -
shopTake150birds:
	npc_loopAboveParamTimes $1f, -
	npc_loopAboveParamTimes $24, - // $5272
shopTake195birds:
	npc_loopAboveParamTimes $28, -
shopTake200birds:
	npc_loopAboveParamTimes $29, -
	npc_loopAboveParamTimes $2e, - // $527e
	npc_loopAboveParamTimes $33, - // $5282


; ==============================================================================
; ENTID_RAILROAD_TICKET
; ==============================================================================
npc15_scripts:
	npc_jumpIfSpecialBitemGotten SPECIALB_RR_TICKET, _npc_end_03_529a
	npc_call data_03_6994
	npc_displayTextScreen npcText_03_529b
	npc_call data_03_699f
	npc_increaseScore SCORE_500
	npc_giveSpecialBItem SPECIALB_RR_TICKET
	npc_callCommonSoundFuncs_6c01 $85 $16

_npc_end_03_529a:
	npc_end

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


; ==============================================================================
; ENTID_BIRDS_HIDDEN_ROOM_NEAR_BOSS_1
; ==============================================================================
npc3c_scripts:
	npc_call data_03_6994
-
	npc_jumpIfNumBirdsGotten $ff, +
	npc_call func_03_69b4
	npc_loopAboveParamTimes 150, -
+
	npc_set_c059 $00
	npc_giveItem ITEMID_VIALBIRD_HIDDEN_ROOM_NEAR_BOSS_1
	npc_increaseScore SCORE_800
	npc_end


; ==============================================================================
; ENTID_VIALS_HIDDEN_ROOM_NEAR_BOSS_1
; ==============================================================================
npc3d_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_res4_cb60
	npc_call b3_waitUntilPlayerContact
-
	npc_jumpIfMoreThanNumBombsGotten $ff, +
	npc_call func_03_69aa
	npc_loopAboveParamTimes 75, -
+
	npc_set_c059 $00
	npc_giveItem ITEMID_VIALBIRD_HIDDEN_ROOM_NEAR_BOSS_1
	npc_increaseScore SCORE_800
	npc_end


; ==============================================================================
; ENTID_MISC_NPC
; ==============================================================================
npc04_scripts:
	npc_groupRoomXYjumpTable @initialScriptTable

@afterInitialScript:
	npc_set2_cbe4
	npc_res4_cb60
	npc_call b3_waitUntilPlayerContact
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
	npc_placeTile $18 $05 $08
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
	npc_jumpIfItemGotten ITEMID_BEACH_FISH_HOUSE_BANANA, @end
	npc_jump @afterInitialScript

@@byHotelsThinCarPath:
	npc_jumpIfItemGotten ITEMID_HOTELS_BANANA_UNDER_CAR, @end
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
	npc_call b3_waitUntilPlayerContact
	npc_jump @@toRegularScripts

@@raftGuy:
	npc_jumpIfSpecialBitemGotten SPECIALB_JAWBONE, +
	npc_displayTextScreen npcText_needJawboneForRaft
	npc_jump @@afterTextDisplay
+
	npc_displayTextScreen npcText_canGetRaftUsingJawbone
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


npcText_needJawboneForRaft:
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


npcText_canGetRaftUsingJawbone:
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


; ==============================================================================
; ENTID_DISAPPEARING_OBSTACLE
; ==============================================================================
npc3e_scripts:
	npc_groupRoomXYjumpTable @table
	npc_end

@remove:
	npc_placeTile $00 $80 $80
	npc_end

@table:
	.db $09 $01 $03
	.dw @boss1areaBarrelRoom

	.db $0f $00 $04
	.dw @entry1

	.db $09 $01 $04
	.dw @byBoss1entrance

	.db $00 $05 $03
	.dw @parkExit

	.db $01 $02 $02
	.dw @barDoors

	.db $24 $00 $00
	.dw @entry5

	.db $22 $00 $00
	.dw @entry6

	.db $ff $ff $ff

@boss1areaBarrelRoom:
	npc_jumpIfItemGotten ITEMID_BOSS_1_AREA_HIDDEN_APPLE, @remove
	npc_end

@entry1:
	npc_jumpIfItemGotten ITEMID_HOUSES_TOP_RIGHT_POMEGRANATE, @remove
	npc_end

@byBoss1entrance:
	npc_jumpIfLampOn, @remove
	npc_end

@parkExit:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_jumpIfItemGotten ITEMID_BELT, ++
+
	npc_end
++
	npc_placeTile $82 $80 $80
	npc_end

@barDoors:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_placeTile $de $80 $80
+
	npc_end

@entry5:
	npc_jumpIfArmorOfGodGotten AOG_SWORD, +
	npc_end
+
	npc_placeTile $9c $80 $80
	npc_end

@entry6:
	npc_jumpIfArmorOfGodGotten AOG_BOOTS, +
	npc_end
+
	npc_placeTile $9c $80 $80
	npc_end


; ==============================================================================
; ENTID_SUNGLASSES_KNIFE_GUY
; ==============================================================================
npc05_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $01
	npc_setDamageTaken $01
-
	npc_moveByParamPixels $1e
	npc_wait $06
	npc_offsetNPCCoordsBy1_turnLeft
	npc_jump -


; ==============================================================================
; ENTID_CRAZY_EYES_CLUB_GUY
; ==============================================================================
npc06_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $02
	npc_setDamageTaken $01
-
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	npc_moveByParamPixels $32
	npc_jump -
+
	npc_turnRight
	npc_moveByParamPixels $32
	npc_jump -


; ==============================================================================
; ENTID_CIRCLING_ALCOHOLIC
; ==============================================================================
npc07_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $04
	npc_setDamageTaken $01
-
	npc_moveByParamPixels $20
	npc_turnRight
	npc_jump -


; ==============================================================================
; ENTID_CYCLIST
; ==============================================================================
npc4f_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $02
	npc_res4_cb60
	npc_setDamageTaken $01
-
	npc_moveByParamPixels $ff
	npc_turnBackwards
	npc_jump -


; ==============================================================================
; ENTID_BASKETBALLER_CTRLER
; ==============================================================================
npc5b_scripts:
-
	npc_getSimilarNPCsToCurrLocationDir ENTID_BASKETBALLER
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_wait $01
	npc_jump -
+
	npc_displayTextScreen @text
	npc_wait $1e
	npc_resetBit5ofNPC2ndByte_jumpIfNZ -
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


; ==============================================================================
; ENTID_BASKETBALLER
; ==============================================================================
npc50_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $02
	npc_res4_cb60
	npc_set2_cbe4
	npc_wait $0a
@bigLoop:
	npc_waitRandomValBetween2ParamsInclusive $01 $0a
// 08 - left, d0 - right, 5c - below
	npc_jumpIfAtTile $d0, @shootingFromSide
	npc_jumpIfAtTile $08, @shootingFromSide
	npc_jumpIfAtTile $5c, @shootingFromBelow
	npc_jumpIfRandomNumLTparam $c0, +
	npc_faceRight
	npc_jump ++
+
	npc_jumpIfRandomNumLTparam $aa, +
	npc_faceLeft
	npc_jump ++
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_faceUp
	npc_jump ++
+
	npc_faceDown
++
	npc_jumpIfAtTile $d0, @shootingFromSide
	npc_jumpIfAtTile $08, @shootingFromSide
	npc_jumpIfAtTile $5c, @shootingFromBelow
	npc_jumpIfRandomNumLTparam $aa, +
	npc_moveByParamPixels $20
	npc_jump @bigLoop
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_moveByParamPixels $10
	npc_jump @bigLoop
+
	npc_moveByParamPixels $08
	npc_jump @bigLoop
@shootingFromSide:
	npc_setNewNpcID ENTID_BASKETBALLER_SHOOTING_FROM_SIDE
@shootingFromBelow:
	npc_setNewNpcID ENTID_BASKETBALLER_SHOOTING_FROM_BELOW


; ==============================================================================
; ENTID_BASKETBALLER_SHOOTING_FROM_SIDE
; ==============================================================================
npc51_scripts:
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_jumpIfAtTile $08, @shootingFromLeft
	npc_jump @shootingFromRight

@shootingFromLeft:
	npc_faceRight
	npc_res4_cb60
	.db $16
	npc_faceUp
	npc_moveByParamPixels $04
	npc_faceRight
	npc_spawnNPCAtOffset ENTID_BASKETBALL_FROM_LEFT $00 $00
	npc_wait $4b
	npc_setMovementSpeed $04
	npc_moveByParamPixels $10
	npc_setNewNpcID ENTID_BASKETBALLER

@shootingFromRight:
	npc_faceLeft
	npc_res4_cb60
	.db $16
	npc_faceUp
	npc_moveByParamPixels $04
	npc_faceLeft
	npc_spawnNPCAtOffset ENTID_BASKETBALL_FROM_RIGHT $00 $00
	npc_wait $4b
	npc_setMovementSpeed $04
	npc_moveByParamPixels $10
	npc_setNewNpcID ENTID_BASKETBALLER


; ==============================================================================
; ENTID_BASKETBALLER_SHOOTING_FROM_BELOW
; ==============================================================================
npc52_scripts:
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_set2_cbe4
	npc_faceUp
	npc_moveByParamPixels $08
	npc_wait $02
	npc_spawnNPCAtOffset ENTID_BASKETBALL_FROM_BELOW $00 $00
	npc_wait $05
	npc_faceDown
	npc_moveByParamPixels $08
	npc_wait $32
	npc_setMovementSpeed $04
	npc_moveByParamPixels $10
	npc_setNewNpcID ENTID_BASKETBALLER


; ==============================================================================
; ENTID_BASKETBALL_FROM_RIGHT
; ==============================================================================
npc53_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_set5_cb60
	npc_set2_cbe4
	npc_setMovementSpeed $10
	npc_res4_cb60
-
	npc_faceLeft
	npc_moveByParamPixels $02
	npc_faceUp
	npc_moveByParamPixels $02
// b4 is hoop, 24 is wall
	npc_jumpIfAtTile $b4, basketBallHitSomethingFromRight
	npc_jumpIfAtTile $24, basketBallHitSomethingFromRight
	npc_jump -


basketBallHitSomethingFromLeft:
	npc_faceRight
	npc_jump +

basketBallHitSomethingFromRight:
	npc_faceLeft

+
	npc_moveByParamPixels $04

basketBallHitSomethingEnd:
	npc_faceDown
	npc_setMovementSpeed $01
	npc_moveByParamPixels $18
	npc_faceUp
	npc_moveByParamPixels $04
	npc_faceDown
	npc_moveByParamPixels $04
	npc_faceUp
	npc_moveByParamPixels $02
	npc_faceDown
	npc_moveByParamPixels $02
	npc_end


; ==============================================================================
; ENTID_BASKETBALL_FROM_LEFT
; ==============================================================================
npc54_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_set2_cbe4
	npc_set5_cb60
	npc_setMovementSpeed $10
	npc_res4_cb60
-
	npc_faceRight
	npc_moveByParamPixels $02
	npc_faceUp
	npc_moveByParamPixels $02
// b4 is hoop, 24 is wall
	npc_jumpIfAtTile $b4, basketBallHitSomethingFromLeft
	npc_jumpIfAtTile $24, basketBallHitSomethingFromLeft
	npc_jump -


; ==============================================================================
; ENTID_BASKETBALL_FROM_BELOW
; ==============================================================================
npc55_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_set2_cbe4
	npc_set5_cb60
	npc_setMovementSpeed $08
	npc_res4_cb60
	npc_faceUp
-
	npc_moveByParamPixels $02
// b4 is hoop
	npc_jumpIfAtTile $b4, basketBallHitSomethingEnd
	npc_jump -


; ==============================================================================
; ENTID_HOUSES_GRAFFITI_GUY
; ==============================================================================
npc08_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $04
	npc_setDamageTaken $01
	npc_wait $0a
	npc_facePlayerVertically
	npc_moveByParamPixels $40
	npc_facePlayerHorizontally
--
	npc_moveByParamPixels $10
	npc_waitRandomValBetween2ParamsInclusive $03 $0a
// bottom-edged pavement
	npc_jumpIfAtTile $b4, @func_5a6d
// full pavement
	npc_jumpIfAtTile $b8, @func_5a6f
	npc_loopAboveParamTimes $03, --
	npc_moveToPlayersXandFacePlayerHorizontally
-
	npc_moveByParamPixels $10
	npc_waitRandomValBetween2ParamsInclusive $03 $0a
	npc_jumpIfAtTile $b4, @func_5a6d
	npc_jumpIfAtTile $b8, @func_5a6f
	npc_loopAboveParamTimes $03, -
	npc_moveToPlayersYandFacePlayerVertically
	npc_jump --
@func_5a6d:
	npc_setNewNpcID ENTID_GRAFFITIER_SK
@func_5a6f:
	npc_setNewNpcID ENTID_GRAFFITIER_MESSY


; ==============================================================================
; ENTID_GRAFFITIER_SK
; ==============================================================================
npc4c_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_cb60_low2bitsEquParamMinus1 $04
	.db $16
	npc_callCommonSoundFuncs_6c01 $47 $16
	npc_jumpIfRandomNumLTparam $aa, +
	npc_placeTile $98 $80 $80
	npc_setNewNpcID ENTID_HOUSES_GRAFFITI_GUY
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_placeTile $98 $80 $80
	npc_setNewNpcID ENTID_HOUSES_GRAFFITI_GUY
+
	npc_placeTile $98 $80 $80
	npc_setNewNpcID ENTID_HOUSES_GRAFFITI_GUY


; ==============================================================================
; ENTID_GRAFFITIER_MESSY
; ==============================================================================
npc4d_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_cb60_low2bitsEquParamMinus1 $04
	.db $16
	npc_callCommonSoundFuncs_6c01 $47 $16
	npc_jumpIfRandomNumLTparam $aa, +
	npc_placeTile $50 $80 $80
	npc_setNewNpcID ENTID_HOUSES_GRAFFITI_GUY
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_placeTile $50 $80 $80
	npc_setNewNpcID ENTID_HOUSES_GRAFFITI_GUY
+
	npc_placeTile $50 $80 $80
	npc_setNewNpcID ENTID_HOUSES_GRAFFITI_GUY


; ==============================================================================
; ENTID_HOUSES_NINJA
; ==============================================================================
npc09_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $03
	npc_setDamageTaken $01
-
	npc_jumpIfRandomNumLTparam $32, ++
	npc_wait $14
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	npc_moveByParamPixels $32
	npc_moveNPCturnBackIfCant
	npc_jump -
+
	npc_turnRight
	npc_moveByParamPixels $32
	npc_moveNPCturnBackIfCant
	npc_jump -
++
	npc_jumpIfRandomNumLTparam $80, +
	npc_moveToPlayersXandFacePlayerHorizontally
	npc_jump -
+
	npc_moveToPlayersYandFacePlayerVertically
	npc_jump -


; ==============================================================================
; ENTID_HOUSES_PACING_OLD_MAN
; ==============================================================================
npc0a_scripts:
	npc_res4_cb60
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $01
	npc_setDamageTaken $01
	npc_wait $1e
	npc_turnBackwards
	npc_moveByParamPixels $20
	npc_turnLeft
	npc_setMovementSpeed $02
-
	npc_moveByParamPixels $ff
	npc_moveNPCturnBackIfCant
	npc_jump -


; ==============================================================================
; ENTID_HOUSES_DRIVER_SPAWNER
; ==============================================================================
npc0b_scripts:
	npc_setMovementSpeed $04
-
	npc_wait $0f
	npc_jumpIfRandomNumLTparam $80, -
	npc_facePlayerHorizontally
	npc_jumpIfRandomNumLTparam $c0, +
	npc_spawnNPCAtOffset $0c $00 $00
	npc_jump -
+
	npc_jumpIfRandomNumLTparam $aa, +
	npc_spawnNPCAtOffset $0d $00 $00
	npc_jump -
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_spawnNPCAtOffset $0e $00 $00
	npc_jump -
+
	npc_spawnNPCAtOffset $0f $00 $00
	npc_jump -


; ==============================================================================
; ENTID_HOUSES_DRIVER_SPEED_3
; ==============================================================================
npc0c_scripts:
	npc_setMovementSpeed $03
	npc_jump func_03_5b39


; ==============================================================================
; ENTID_HOUSES_DRIVER_SPEED_2
; ==============================================================================
npc0d_scripts:
	npc_setMovementSpeed $02
	npc_jump func_03_5b39


; ==============================================================================
; ENTID_HOUSES_DRIVER_SPEED_5
; ==============================================================================
npc0e_scripts:
	npc_setMovementSpeed $05
	npc_jump func_03_5b39


; ==============================================================================
; ENTID_HOUSES_DRIVER_SPEED_6
; ==============================================================================
npc0f_scripts:
	npc_setMovementSpeed $06

func_03_5b39:
	npc_set5_cb60
	npc_set7_cb60
	npc_jumpIfRandomNumLTparam $aa, ++
	npc_jumpIfRandomNumLTparam $80, +
	npc_callCommonSoundFuncs_6c01 $a9 $16
	npc_jump ++
+
	npc_callCommonSoundFuncs_6c01 $ba $16
++
	npc_jumpIfRandomNumLTparam $aa, +
	npc_jump ++
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_faceDown
	npc_moveByParamPixels $10
	npc_jump ++
+
	npc_faceUp
	npc_moveByParamPixels $10
++
	npc_facePlayerHorizontally
	npc_res4_cb60
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setDamageTaken $01
	npc_moveByParamPixels $ff
	npc_end


; ==============================================================================
; ENTID_FOREST_DRAGON
; ==============================================================================
npc1e_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set7_cb60
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $04
	npc_setDamageTaken $04
	npc_res4_cb60
-
	npc_wait $14
	npc_moveByParamPixels $40
	npc_turnBackwards
	npc_wait $03
	npc_moveByParamPixels $40
	npc_turnBackwards
	npc_wait $03
	npc_moveByParamPixels $40
	npc_turnBackwards
	npc_jump -


; ==============================================================================
; ENTID_FOREST_ARCHER
; ==============================================================================
npc10_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $02
	npc_setDamageTaken $02
	npc_res4_cb60
	npc_facePlayerVertically
	npc_moveByParamPixels $10
	npc_facePlayerHorizontally
	npc_moveByParamPixels $10
	npc_setNewNpcID ENTID_FOREST_ARCHER_SHOOTING


; ==============================================================================
; ENTID_FOREST_ARCHER_SHOOTING
; ==============================================================================
npc11_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setDamageTaken $02
	npc_res4_cb60
	npc_wait $0a
	.db $16
	npc_spawnNPCinFrontOfSelf $12
	npc_callCommonSoundFuncs_6c01 $04 $16
	npc_wait $28
	npc_setNewNpcID ENTID_FOREST_ARCHER


; ==============================================================================
; ENTID_FOREST_ARCHER_ARROW
; ==============================================================================
npc12_scripts:
	npc_res4_cb60
	npc_set2_cbe4
	npc_set5_cb60
	npc_setMovementSpeed $04
	npc_setDamageTaken $04
	npc_moveByParamPixels $ff
	npc_end


; ==============================================================================
; ENTID_FOREST_BEE_SWARM
; ==============================================================================
npc4e_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_res4_cb60
	npc_setDamageTaken $02
	npc_set5_cb60
	npc_setMovementSpeed $03
	npc_set2_cbe4
	npc_callCommonSoundFuncs_6c01 $0d $16
	npc_wait $28
-
	npc_facePlayerHorizontally
	npc_moveByParamPixels $04
	npc_facePlayerVertically
	npc_moveByParamPixels $04
	npc_loopAboveParamTimes $05, -
	npc_callCommonSoundFuncs_6c01 $0d $16
	npc_jump -



; ==============================================================================
; ENTID_FOREST_SLOW_AXEMAN
; ==============================================================================
npc13_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setDamageTaken $04
	npc_set7_cb60
	npc_res4_cb60
	npc_wait $0a
-
	npc_moveByParamPixels $80
	npc_moveNPCturnBackIfCant
	npc_jumpIfRandomNumLTparam $80, +
	npc_setMovementSpeed $02
	npc_jump -
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_setMovementSpeed $03
	npc_jump -
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_setMovementSpeed $04
	npc_jump -
+
	npc_setMovementSpeed $05
	npc_jump -


; ==============================================================================
; ENTID_FOREST_CHIMNEY_SMOKE
; ==============================================================================
npc14_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_faceUp
	npc_res4_cb60
-
	npc_wait $04
	npc_jump -


; ==============================================================================
; ENTID_FOREST_CLUBMAN
; ==============================================================================
npc1f_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $02
	npc_setDamageTaken $04
-
	npc_moveToPlayersXandFacePlayerHorizontally
	npc_moveToPlayersYandFacePlayerVertically
	npc_jump -


; ==============================================================================
; ENTID_RUNNING_CITY_GUY
; ==============================================================================
npc19_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $03
	npc_setDamageTaken $01
-
	npc_moveByParamPixels $ff
	npc_moveNPCturnBackIfCant
	npc_wait $01
	npc_jump -


; ==============================================================================
; ENTID_BAR_SLOW_GUY_SPAWNER
; ==============================================================================
npc1c_scripts:
	npc_jumpIfItemGotten ITEMID_BELT, +
	npc_jump @end
+
	npc_jumpIfArmorOfGodGotten AOG_BELT, @func_5c2e
@end:
	npc_end
@func_5c2e:
	npc_wait $14
	npc_spawnNPCAtOffset ENTID_SLOW_CITY_GUY $00 $00
	npc_loopAboveParamTimes $06, @func_5c2e
	npc_setRoomFlagFrom_cbf0
	npc_end


; ==============================================================================
; ENTID_SLOW_CITY_GUY
; ==============================================================================
npc1d_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_setMovementSpeed $01
	npc_setDamageTaken $01
	npc_cb60_low2bitsEquParamMinus1 $03
-
	npc_moveByParamPixels $10
	npc_jumpIfRandomNumLTparam $7f, +
	npc_turnLeft
	npc_jump -
+
	npc_turnRight
	npc_jump -


; ==============================================================================
; ENTID_BLOCKAGE_BUILDER
; ==============================================================================
npc1a_scripts:
	npc_setMovementSpeed $02
	npc_call func_03_5c91
-
	npc_placeTile $4c $80 $80
	npc_callCommonSoundFuncs_6c01 $1d $16
	npc_wait $03
	npc_moveByParamPixels $10
	npc_moveNPC_jumpIfCant $10, +
	npc_jump -
+
	npc_placeTile $4c $80 $80
	npc_callCommonSoundFuncs_6c01 $1d $16
-
	npc_offsetNPCCoordsBy1_turnRight
	npc_moveByParamPixels $ff
	npc_jump -


; ==============================================================================
; ENTID_DYNAMITE_BUILDER
; ==============================================================================
npc21_scripts:
	npc_setMovementSpeed $03
	npc_call func_03_5c91
-
	npc_placeTile $cc $80 $80
	npc_callCommonSoundFuncs_6c01 $1d $16
	npc_wait $02
	npc_moveByParamPixels $10
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	npc_jump -
+
	npc_turnRight
	npc_jump -


func_03_5c91:
	npc_res4_cb60
	npc_wait $0a
	npc_setDamageTaken $01
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_wait $0a
	npc_ret


; ==============================================================================
; ENTID_CITY_BANDIT
; ==============================================================================
npc1b_scripts:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, npcScript_end
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $02
	npc_setDamageTaken $0e
-
	npc_moveByParamPixels $ff
	npc_jumpIfRandomNumLTparam $aa, +
	npc_moveNPCturnBackIfCant
	npc_jump -
+
	npc_jumpIfRandomNumLTparam $7f, +
	npc_turnLeft
	npc_jump -
+
	npc_turnRight
	npc_jump -


; ==============================================================================
; ENTID_CITY_BANDIT_BLOCKER
; ==============================================================================
npc42_scripts:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, npcScript_end
	npc_res4_cb60
	npc_setDamageTaken $0e
-
	npc_wait $01
	npc_jump -


; ==============================================================================
; ENTID_SHIPYARD_GUNMAN
; ==============================================================================
npc23_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $02
	npc_setDamageTaken $02
-
	npc_facePlayerHorizontally
	npc_moveByParamPixels $20
	npc_facePlayerVertically
	npc_moveByParamPixels $20
	npc_jumpIfRandomNumLTparam $80, +
	npc_facePlayerHorizontally
+
	npc_spawnNPCinFrontOfSelf ENTID_SHIPYARD_GUNMAN_BULLET
	npc_callCommonSoundFuncs_6c01 $61 $16
	npc_wait $0a
	npc_spawnNPCinFrontOfSelf ENTID_SHIPYARD_GUNMAN_BULLET
	npc_callCommonSoundFuncs_6c01 $61 $16
	npc_wait $0a
	npc_spawnNPCinFrontOfSelf ENTID_SHIPYARD_GUNMAN_BULLET
	npc_callCommonSoundFuncs_6c01 $61 $16
	npc_wait $0a
	npc_turnBackwards
	npc_moveByParamPixels $42
	npc_faceUp
	npc_jump -


; ==============================================================================
; ENTID_SHIPYARD_GUNMAN_BULLET
; ==============================================================================
npc26_scripts:
	npc_set2_cbe4
	npc_res4_cb60
	npc_setMovementSpeed $04
	npc_set5_cb60
	npc_setDamageTaken $04
	npc_moveByParamPixels $ff
	npc_end


; ==============================================================================
; ENTID_HOTEL_GUNNER_BULLET
; ==============================================================================
npc58_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_setMovementSpeed $04
	npc_set5_cb60
	npc_setDamageTaken $06
	npc_moveByParamPixels $ff
	npc_end


; ==============================================================================
; ENTID_HOTEL_GUNNER_BALLOON
; ==============================================================================
npc59_scripts:
	npc_set6_cb60_reset_cb6c
	npc_jump npc26_scripts


; ==============================================================================
; ENTID_SHIPYARD_SAILOR
; ==============================================================================
npc24_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $03
	npc_setDamageTaken $02
-
	npc_moveToPlayersXandFacePlayerHorizontally
	npc_moveToPlayersYandFacePlayerVertically
	npc_wait $1e
	npc_jump -


; ==============================================================================
; ENTID_SHIPYARD_DOG
; ==============================================================================
npc25_scripts:
	npc_res4_cb60
	npc_callCommonSoundFuncs_6c01 $0a $18
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $02
	npc_setDamageTaken $02
-
	npc_moveByParamPixels $ff
	npc_jumpIfRandomNumLTparam $55, +
	npc_moveNPCturnBackIfCant
	npc_jump -
+
	npc_callCommonSoundFuncs_6c01 $0a $18
	npc_jump -


; ==============================================================================
; ENTID_HOTELS_BIKER
; ==============================================================================
npc28_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_setMovementSpeed $03
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setDamageTaken $04
-
	npc_moveByParamPixels $a0
	npc_turnLeft
	npc_jump -


; ==============================================================================
; ENTID_HOTELS_BIKER_THIN_CAR_PATH
; ==============================================================================
npc2c_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_setMovementSpeed $04
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setDamageTaken $04
-
	npc_moveByParamPixels $40
	npc_turnRight
	npc_moveByParamPixels $40
	npc_turnLeft
	npc_moveByParamPixels $40
	npc_turnLeft
	npc_moveByParamPixels $40
	npc_turnRight
	npc_moveByParamPixels $40
	npc_turnRight
	npc_moveByParamPixels $40
	npc_turnLeft
	npc_moveByParamPixels $40
	npc_turnBackwards
	npc_jump -


npc27_scripts:
	npc_res4_cb60
	npc_set6_cb60_reset_cb6c
	npc_wait $0a
	npc_setMovementSpeed $03
	npc_cb60_low2bitsEquParamMinus1 $03
-
	.db $11
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_moveByParamPixels $18
	npc_facePlayerHorizontally
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_moveByParamPixels $18
	npc_jump -
+
	.db $4f $05
	npc_wait $2d
	npc_setNewNpcID $27


; ==============================================================================
; ENTID_HOTELS_DISAPPEARING_CAR_1
; ==============================================================================
npc2a_scripts:
	npc_jumpIfItemGotten ITEMID_HOTELS_BANANA_UNDER_CAR, func_03_5db9
	npc_set5_cb60
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
-
	npc_wait $ff
	npc_loopAboveParamTimes $03, -
	npc_res4_cb60
	npc_placeTile $8d $80 $80
func_03_5d9d:
	npc_setMovementSpeed $02
	npc_setDamageTaken $02
	npc_moveByParamPixels $ff
	npc_end


; ==============================================================================
; ENTID_HOTELS_DISAPPEARING_CAR_2
; ==============================================================================
npc2b_scripts:
	npc_jumpIfItemGotten ITEMID_HOTELS_BANANA_UNDER_CAR, func_03_5db9
	npc_set6_cb60_reset_cb6c
	npc_set5_cb60
	npc_set3_cb60
-
	npc_wait $ff
	npc_loopAboveParamTimes $03, -
	npc_res4_cb60
	npc_placeTile $00 $80 $80
	npc_jump func_03_5d9d


func_03_5db9:
	npc_placeTile $00 $80 $80
	npc_end


; ==============================================================================
; ENTID_HOTELS_ALCOHOLIC
; ==============================================================================
npc29_scripts:
	npc_res4_cb60
	npc_wait $0a
	npc_setDamageTaken $02
	npc_cb60_low2bitsEquParamMinus1 $03
@loop:
	npc_setMovementSpeed $01
-
	npc_moveByParamPixels $20
	npc_jumpIfRandomNumLTparam $80, -
	npc_setMovementSpeed $02
	npc_turnBackwards
-
	npc_moveByParamPixels $20
	npc_jumpIfRandomNumLTparam $80, -
	npc_setMovementSpeed $03
	npc_turnBackwards
-
	npc_moveByParamPixels $20
	npc_jumpIfRandomNumLTparam $80, -
	npc_setMovementSpeed $04
	npc_turnBackwards
-
	npc_moveByParamPixels $20
	npc_jumpIfRandomNumLTparam $80, -
	npc_setMovementSpeed $03
	npc_turnBackwards
-
	npc_moveByParamPixels $20
	npc_jumpIfRandomNumLTparam $80, -
	npc_setMovementSpeed $02
	npc_turnBackwards
-
	npc_moveByParamPixels $20
	npc_jumpIfRandomNumLTparam $80, -
	npc_turnBackwards
	npc_jump @loop


; ==============================================================================
; ENTID_CITY_PLUMBER_1
; ENTID_CITY_PLUMBER_2
; ==============================================================================
npc22_scripts:
npc49_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setDamageTaken $02
	npc_setMovementSpeed $03
	npc_res4_cb60
--
	npc_moveByParamPixels $10
	npc_turnRight
	npc_moveNPC_jumpIfCant $10, +
-
	npc_offsetNPCCoordsBy1_turnLeft
	npc_offsetNPCCoordsBy1_turnLeft
	npc_offsetNPCCoordsBy1_turnLeft
	npc_jump --
+
	npc_turnLeft
	npc_jump -


; ==============================================================================
; ENTID_LADDER_CLIMBER
; ==============================================================================
npc4b_scripts:
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_setDamageTaken $01
	npc_setMovementSpeed $01
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
-
	npc_moveByParamPixels $ff
	npc_turnBackwards
	npc_jump -


; ==============================================================================
; ENTID_HOTEL_HIGHRISE_GUNNER_1
; ==============================================================================
npc43_scripts:
npc44_scripts:
	npc_set6_cb60_reset_cb6c
	npc_setDamageTaken $02
	.db $16
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_res4_cb60
@loop:
	npc_jumpIfRandomNumLTparam $aa, +
	npc_wait $0a
	npc_jump @func_5e3f
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_wait $28
	npc_jump @func_5e3f
+
	npc_wait $14

@func_5e3f:
	npc_set6_cb60_reset_cb6c
	.db $16
	npc_callCommonSoundFuncs_6c01 $61 $16
	npc_jumpIfRandomNumLTparam $80, +
	npc_spawnNPCinFrontOfSelf ENTID_HOTEL_GUNNER_BULLET
	npc_jump ++
+
	npc_spawnNPCinFrontOfSelf ENTID_HOTEL_GUNNER_BALLOON
++
	npc_wait $05
	npc_set6_cb60_reset_cb6c
	.db $16
	npc_callCommonSoundFuncs_6c01 $61 $16
	npc_jumpIfRandomNumLTparam $80, +
	npc_spawnNPCinFrontOfSelf ENTID_HOTEL_GUNNER_BULLET
	npc_jump @loop
+
	npc_spawnNPCinFrontOfSelf ENTID_HOTEL_GUNNER_BALLOON
	npc_jump @loop


; ==============================================================================
; ENTID_HOUSES_STATIC_BALLOON
; ==============================================================================
npc45_scripts:
	npc_set6_cb60_reset_cb6c
	npc_addParamsToXthenYCoords $02 $00
	npc_res4_cb60
	npc_jump _infLoop_639f


npc46_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_callCommonSoundFuncs_6c01 $58 $16
	npc_wait $05
	npc_placeTile $00 $80 $80
	npc_end


; ==============================================================================
; ENTID_BALLOON_POP
; ==============================================================================
npc5a_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_callCommonSoundFuncs_6c01 $58 $16
	npc_wait $05
	npc_end


; ==============================================================================
; ENTID_FOREST_CABIN_FIREPLACE
; ENTID_CHURCH_FLAMES
; ==============================================================================
npc47_scripts:
npc48_scripts:
	npc_c02a_equFF
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_jump _infLoop_639f


; ==============================================================================
; ENTID_BELT_BEING_TAKEN_AWAY
; ==============================================================================
npc56_scripts:
npc57_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set_c059 $ff
	npc_faceUp
	npc_set5_cb60
	npc_res4_cb60
	npc_wait $1e
	npc_callCommonSoundFuncs_6c01 $f2 $15
	npc_setMovementSpeed $01
	npc_moveByParamPixels $10
	npc_setMovementSpeed $02
	npc_moveByParamPixels $08
	npc_setMovementSpeed $03
	npc_moveByParamPixels $08
	npc_setMovementSpeed $04
	npc_moveByParamPixels $08
	npc_setMovementSpeed $05
	npc_moveByParamPixels $08
	npc_setMovementSpeed $06
	npc_moveByParamPixels $08
	npc_setMovementSpeed $07
	npc_moveByParamPixels $08
	npc_setMovementSpeed $08
	npc_moveByParamPixels $50
	npc_set_c059 $01
	npc_end


; ==============================================================================
; ENTID_SHIPYARD_BUOY
; ==============================================================================
npc4a_scripts:
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_set2_cb60
	npc_set5_cb60
	npc_res4_cb60
	npc_waitRandomValBetween2ParamsInclusive $01 $1e
	npc_set6_cb60_reset_cb6c
-
	npc_faceUp
	npc_moveByParamPixels $01
	npc_wait $01
	npc_moveByParamPixels $01
	npc_wait $01
	npc_moveByParamPixels $01
	npc_wait $01
	npc_faceDown
	npc_moveByParamPixels $01
	npc_wait $01
	npc_moveByParamPixels $01
	npc_wait $01
	npc_moveByParamPixels $01
	npc_wait $01
	npc_moveByParamPixels $01
	npc_wait $01
	npc_moveByParamPixels $01
	npc_wait $01
	npc_moveByParamPixels $01
	npc_wait $01
	npc_faceUp
	npc_moveByParamPixels $01
	npc_wait $01
	npc_moveByParamPixels $01
	npc_wait $01
	npc_moveByParamPixels $01
	npc_wait $01
	npc_jump -


; ==============================================================================
; ENTID_BOSS_1
; ==============================================================================
npc5d_scripts:
	npc_jumpIfArmorOfGodGotten AOG_BELT, npc5e_scripts@end
	npc_setMovementSpeed $03
	npc_takeItem ITEMID_31
	npc_giveItem ITEMID_30
	npc_jump @popUp

@loopMoveThenAction:
	npc_moveByParamPixels $20
	npc_jumpIfRandomNumLTparam $20, @spawnEnemy

@performAction:
	npc_jumpIfRandomNumLTparam $20, @popUp
	npc_jumpIfRandomNumLTparam $80, +
// 50/50 to turn left or right
	npc_turnLeft
	npc_jump @loopMoveThenAction
+
	npc_turnRight
	npc_jump @loopMoveThenAction
	
@popUp:
	npc_set5_cb60
	npc_res4_cb60
	npc_giveItem ITEMID_30
	npc_faceUp
	npc_moveByParamPixels $08
	npc_faceDown
	npc_wait $0a
	npc_faceDown
	npc_moveByParamPixels $08
	npc_takeItem ITEMID_30
	npc_set4_cb60
	npc_res5_cb60
	npc_jump @loopMoveThenAction

@spawnEnemy:
	npc_spawnNPCAtOffset ENTID_DEVIL_SPAWN $00 $00
	npc_jump @performAction


; ==============================================================================
; ENTID_BOSS_1_CTRLER
; ==============================================================================
npc5c_scripts:
npc5e_scripts:
	npc_jumpIfArmorOfGodGotten AOG_BELT, @placeTile
	npc_set3_cb60
	npc_set2_cb60
	npc_set7_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60

@loop:
	npc_getSimilarNPCsToCurrLocationDir ENTID_BOSS_1
	npc_wait $01
	npc_jumpIfItemGotten ITEMID_30, @func_5f49
	npc_jumpIfItemGotten ITEMID_31, @end
	npc_jump @loop

@func_5f49:
	npc_wait $01
	npc_jumpIfItemGotten ITEMID_31, @end
	npc_jumpIfItemGotten ITEMID_30, @func_5f49
	npc_jump @loop

@end:
	npc_end

@placeTile:
	npc_placeTile $85 $08 $02
	npc_end


npc5f_scripts:
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_giveItem ITEMID_31
	.db $16
	npc_wait $05
	.db $04
	npc_placeTile $85 $08 $02
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_end


; ==============================================================================
; ENTID_CITY_BOSS_HELPER
; ==============================================================================
npc60_scripts:
	npc_takeItem ITEMID_30
	npc_takeItem ITEMID_31
	npc_set5_cb60
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, @func_5fc1
	npc_setMovementSpeed $10
@loop:
	npc_moveByParamPixels $10
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @func_5f85
	npc_jumpIfAtTile $00, @func_5f91
	npc_jumpIfAtTile $9c, @func_5fa9
@func_5f85:
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	npc_jump @loop
+
	npc_turnRight
	npc_jump @loop
@func_5f91:
	npc_jumpIfRandomNumLTparam $33, +
	npc_jump @func_5f85
+
	npc_placeTile $14 $80 $80
	npc_callCommonSoundFuncs_6c01 $5f $17
	npc_waitRandomValBetween2ParamsInclusive $50 $78
	npc_placeTile $00 $80 $80
	npc_jump @loop
@func_5fa9:
	npc_jumpIfRandomNumLTparam $33, +
	npc_jump @func_5f85
+
	npc_placeTile $14 $80 $80
	npc_callCommonSoundFuncs_6c01 $5f $17
	npc_waitRandomValBetween2ParamsInclusive $50 $78
	npc_placeTile $9d $80 $80
	npc_jump @loop
@func_5fc1:
	npc_placeTile $84 $0c $01
	npc_end


; ==============================================================================
; ENTID_CITY_BOSS
; ==============================================================================
npc61_scripts:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, npcScript_end
	npc_wait $0a
	npc_jumpIfItemGotten ITEMID_30, +
	npc_jumpIfItemGotten ITEMID_31, ++
	npc_giveItem ITEMID_30
	npc_jump @func_600d

+
	npc_jumpIfItemGotten ITEMID_31, +++
	npc_takeItem ITEMID_30
	npc_giveItem ITEMID_31
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_jump @func_600d

++
	npc_giveItem ITEMID_30
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_jump @func_600d

+++
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_set4_cb60
	npc_spawnNPCAtOffset $03 $80 $80
	npc_wait $0f
	npc_placeTile $84 $0c $01
	npc_callCommonSoundFuncs_6c01 $85 $16
	npc_wait $02
	npc_callCommonSoundFuncs_6c01 $85 $16
	npc_wait $02
	npc_callCommonSoundFuncs_6c01 $85 $16
	npc_wait $02
	npc_end

@func_600d:
	npc_set4_cb60
	npc_jumpIfRandomNumLTparam $c0, +
	npc_setCoords $30 $10
	npc_jump @func_602f
+
	npc_jumpIfRandomNumLTparam $aa, +
	npc_setCoords $60 $70
	npc_jump @func_602f
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_setCoords $a0 $50
	npc_jump @func_602f
+
	npc_setCoords $e0 $10

@func_602f:
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @func_600d
	npc_jumpIfAtTile $00, +
	npc_jump @func_600d
+
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setDamageTaken $02
	npc_setMovementSpeed $03
	npc_res4_cb60
--
	npc_moveByParamPixels $10
	npc_turnRight
	npc_moveNPC_jumpIfCant $10, +

-
	npc_offsetNPCCoordsBy1_turnLeft
	npc_offsetNPCCoordsBy1_turnLeft
	npc_offsetNPCCoordsBy1_turnLeft
	npc_jump --
+
	npc_turnLeft
	npc_jump -


; ==============================================================================
; ENTID_BEACH_BOSS
; ==============================================================================
npc63_scripts:
	npc_jumpIfArmorOfGodGotten AOG_SWORD, @func_6098
	npc_wait $0a
	npc_jumpIfItemGotten ITEMID_30, +
	npc_jumpIfItemGotten ITEMID_31, ++
	npc_giveItem ITEMID_30
	npc_jump @func_60c9
+
	npc_jumpIfItemGotten ITEMID_31, +++
	npc_takeItem ITEMID_30
	npc_giveItem ITEMID_31
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_jump @func_609d
++
	npc_giveItem ITEMID_30
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_jump @func_609d
+++
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_set4_cb60
	npc_spawnNPCAtOffset ENTID_STUB_03 $80 $80
	npc_wait $0f
	npc_placeTile $84 $0e $01
	npc_callCommonSoundFuncs_6c01 $85 $16
	npc_wait $02
	npc_callCommonSoundFuncs_6c01 $85 $16
	npc_wait $02
	npc_callCommonSoundFuncs_6c01 $85 $16
	npc_wait $02
	npc_end

@func_6098:
	npc_placeTile $84 $0e $01
	npc_end

@func_609d:
	npc_set4_cb60
	npc_jumpIfRandomNumLTparam $c0, +
	npc_setCoords $b0 $50
	npc_jump @func_60bf
+
	npc_jumpIfRandomNumLTparam $aa, +
	npc_setCoords $40 $90
	npc_jump @func_60bf
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_setCoords $70 $70
	npc_jump @func_60bf
+
	npc_setCoords $20 $30

@func_60bf:
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @func_609d
	npc_jumpIfAtTile $00, @func_60c9
	npc_jump @func_609d

@func_60c9:
	npc_res4_cb60
	npc_setMovementSpeed $04
	npc_setDamageTaken $0e
-
	npc_moveByParamPixels $10
	npc_moveNPC_jumpIfCant $10, ++
	npc_jumpIfRandomNumLTparam $2a, +
	npc_jump -
+
	npc_spawnNPCAtOffset ENTID_BEACH_BOSS_BALLOON $00 $08
	npc_waitRandomValBetween2ParamsInclusive $05 $0a
++
	npc_turnBackwards
	npc_jump -


; ==============================================================================
; ENTID_BEACH_BOSS_BALLOON
; ==============================================================================
npc64_scripts:
	npc_set5_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_setMovementSpeed $03
	npc_setDamageTaken $04
	npc_faceDown
	npc_moveByParamPixels $ff
	npc_setNewNpcID ENTID_BALLOON_POP


npc65_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_callCommonSoundFuncs_6c01 $d7 $15
	.db $16
	npc_end


; ==============================================================================
; ENTID_BEACH_BOSS_HELPER
; ==============================================================================
npc62_scripts:
	npc_takeItem ITEMID_30
	npc_takeItem ITEMID_31
	npc_jumpIfArmorOfGodGotten AOG_SWORD, npcScript_end
	npc_res4_cb60
	npc_setMovementSpeed $03
	npc_setDamageTaken $08
@loop:
	npc_moveByParamPixels $10
	npc_moveNPC_jumpIfCant $10, @func_6178
	npc_jumpIfRandomNumLTparam $33, +
	npc_jump @loop
+
	npc_moveNPC_jumpIfCant $30, @loop
	npc_moveNPC_jumpIfCant $20, @loop
	npc_moveNPC_jumpIfCant $10, @loop
	npc_callCommonSoundFuncs_6c01 $ec $16
	npc_jumpIfFacingDirection $09, +
	npc_placeTile $45 $81 $80
	npc_wait $01
	npc_placeTile $45 $82 $80
	npc_wait $01
	npc_placeTile $45 $83 $80
	npc_waitRandomValBetween2ParamsInclusive $03 $0a
	npc_placeTile $00 $83 $80
	npc_wait $01
	npc_placeTile $00 $82 $80
	npc_wait $01
	npc_placeTile $00 $81 $80
	npc_waitRandomValBetween2ParamsInclusive $04 $08
	npc_jump @loop
+
	npc_placeTile $45 $ff $80
	npc_wait $01
	npc_placeTile $45 $fe $80
	npc_wait $01
	npc_placeTile $45 $fd $80
	npc_waitRandomValBetween2ParamsInclusive $03 $0a
	npc_placeTile $00 $fd $80
	npc_wait $01
	npc_placeTile $00 $fe $80
	npc_wait $01
	npc_placeTile $00 $ff $80
	npc_waitRandomValBetween2ParamsInclusive $04 $08
	npc_jump @loop
@func_6178:
	npc_turnBackwards
	npc_jump @loop


; ==============================================================================
; ENTID_ITEM_ROOM_ANGEL
; ==============================================================================
npc2d_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_c02a_equFF
	npc_set2_cbe4
	npc_res4_cb60
	npc_groupRoomXYjumpTable @table
	npc_callCommonSoundFuncs6638
	npc_end

@table:
	.db $1c $00 $00
	.dw @pearFirstScreen

	.db $1c $01 $00
	.dw @appleHiddenNearBoss1

	.db $1c $00 $01
	.dw @afterBoss1

	.db $1c $02 $00
	.dw @cityTopLeft

	.db $1c $01 $01
	.dw @hiddenRoomNearBoss1

	.db $1c $02 $01
	.dw @bottomRightCity

	.db $1c $00 $02
	.dw @cityBoss

	.db $1c $01 $02
	.dw @housesHidden

	.db $1c $02 $02
	.dw @housesTopRight

	.db $1c $00 $03
	.dw @hotelsBottomRight

	.db $1c $01 $03
	.dw @underShipyardTunnel

	.db $1c $02 $03
	.dw @portBottomLeftWithPear

	.db $1c $00 $05
	.dw @afterForestCherryBoss

	.db $1c $00 $04
	.dw @forestTopRight

	.db $1c $01 $04
	.dw @forestInLog

	.db $1c $02 $04
	.dw @hotelsUnderCar

	.db $1c $01 $05
	.dw @entry10

	.db $1c $00 $06
	.dw @deepInPrison

	.db $1c $01 $06
	.dw @prisonTopRight

	.db $1c $02 $06
	.dw @cityBar

	.db $1c $00 $07
	.dw @entry14

	.db $1c $01 $07
	.dw @entry15

	.db $1c $02 $07
	.dw @airportBuildingEast

	.db $1c $00 $08
	.dw @beachWest

	.db $ff $ff $ff

@pearFirstScreen:
	npc_jumpIfItemGotten ITEMID_PEAR_FIRST_SCREEN _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_firstPear
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_PEAR, $78 $5c
	npc_jump @emptyRoom

@appleHiddenNearBoss1:
	npc_jumpIfItemGotten ITEMID_BOSS_1_AREA_HIDDEN_APPLE _showText_roomEmpty_clear_c059

@func_6219:
	npc_set_c059 $ff
	npc_startScrollingText text_03_6423
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_APPLE $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump @emptyRoom

@afterBoss1:
	npc_jumpIfItemGotten ITEMID_BELT _showText_roomEmpty_clear_c059
	npc_jumpIfArmorOfGodGotten AOG_BELT _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_6497
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_BELT_OF_TRUTH $7a $64
	npc_jump @emptyRoom

@cityTopLeft:
	npc_set_c059 $ff
	npc_startScrollingText text_03_64fe
	npc_startScrollingText text_7f_03_63aa
	npc_jumpIfItemGotten ITEMID_PEAR_TOPLEFT_CITY, +
	npc_startScrollingText text_03_6551
	npc_spawnNPC ENTID_PEAR $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump ++
+
	npc_startScrollingText text_03_6482
++
	npc_spawnNPC ENTID_SHOP_7_VIALS $42 $64
	npc_spawnNPC ENTID_PRICE_BIRD $38 $54
	npc_spawnNPC ENTID_SHOP_OIL $b2 $64
	npc_spawnNPC ENTID_PRICE_BIRD $a8 $54
	npc_jump @emptyRoom

@hiddenRoomNearBoss1:
	npc_jumpIfItemGotten ITEMID_VIALBIRD_HIDDEN_ROOM_NEAR_BOSS_1, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
// 75 vials, 150 spirit points
	npc_startScrollingText text_03_6566
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_VIALS_HIDDEN_ROOM_NEAR_BOSS_1 $50 $64
	npc_spawnNPC ENTID_BIRDS_HIDDEN_ROOM_NEAR_BOSS_1 $a0 $64
	npc_jump @emptyRoom

@bottomRightCity:
	npc_jumpIfItemGotten ITEMID_CITY_BOTTOM_RIGHT_APPLE, _showText_roomEmpty_clear_c059
	npc_jump @func_6219

@cityBoss:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_65c3
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_BREASTPLATE_OF_RIGHTEOUSNESS $7a $64
	npc_jump @emptyRoom

@housesHidden:
	npc_jumpIfItemGotten ITEMID_HOUSES_HIDDEN_GRAPES, _showText_roomEmpty_clear_c059

@func_62a8:
	npc_set_c059 $ff
	npc_startScrollingText text_03_6621
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_GRAPES $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump @emptyRoom

@housesTopRight:
	npc_jumpIfItemGotten ITEMID_HOUSES_TOP_RIGHT_POMEGRANATE, _showText_roomEmpty_clear_c059

@func_62bf:
	npc_set_c059 $ff
	npc_startScrollingText text_03_666e
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_POMEGRANATE $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump @emptyRoom

@hotelsBottomRight:
	npc_jumpIfItemGotten ITEMID_HOTELS_BOTTOM_RIGHT_GRAPES, _showText_roomEmpty_clear_c059
	npc_jump @func_62a8

@underShipyardTunnel:
	npc_jumpIfItemGotten ITEMID_SHIPYARD_TUNNEL_BANANA, _showText_roomEmpty_clear_c059

@func_62dd:
	npc_set_c059 $ff
	npc_startScrollingText text_03_66d5
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_BANANA $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump @emptyRoom

@portBottomLeftWithPear:
	npc_jumpIfItemGotten ITEMID_PORT_BOTTOM_LEFT_PEAR, _showText_roomEmpty_clear_c059

@airportBuildingEastCont:
	npc_set_c059 $ff
	npc_startScrollingText text_03_672f
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_PEAR $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump @emptyRoom

@afterForestCherryBoss:
	npc_jumpIfArmorOfGodGotten AOG_HELM, +
	npc_set_c059 $ff
	npc_startScrollingText text_03_6789
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_HELMET_OF_SALVATION $78 $6c
	npc_jump @emptyRoom
+
	npc_startScrollingText text_03_6832
	npc_jump @emptyRoom

@forestTopRight:
	npc_jumpIfItemGotten ITEMID_FOREST_TOP_RIGHT_APPLE, _showText_roomEmpty_clear_c059
	npc_jump @func_6219

@forestInLog:
	npc_jumpIfItemGotten ITEMID_FOREST_LOG_POMEGRANATE, _showText_roomEmpty_clear_c059
	npc_jump @func_62bf

@hotelsUnderCar:
	npc_jumpIfItemGotten ITEMID_HOTELS_BANANA_UNDER_CAR, _showText_roomEmpty_clear_c059
	npc_jump @func_62dd

@entry10:
	npc_jumpIfSpecialBitemGotten SPECIALB_JAWBONE, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_67ca
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC $40 $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump @emptyRoom

@deepInPrison:
	npc_jumpIfItemGotten ITEMID_BANANA_DEEP_IN_PRISON, _showText_roomEmpty_clear_c059
	npc_jump @func_62dd

@prisonTopRight:
	npc_jumpIfItemGotten ITEMID_PRISON_TOP_RIGHT_GRAPES, _showText_roomEmpty_clear_c059
	npc_jump @func_62a8

@cityBar:
	npc_set_c059 $ff
	npc_startScrollingText text_03_6849
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC ENTID_BELT_BEING_TAKEN_AWAY $88 $90
	npc_takeArmorOfGod AOG_BELT
	npc_jump @emptyRoom

@entry14:
	npc_set_c059 $ff
	npc_startScrollingText text_03_68bb
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC $56 $88 $90
	npc_takeArmorOfGod AOG_ARMOUR
	npc_jump @emptyRoom

@entry15:
	npc_jumpIfArmorOfGodGotten AOG_SHIELD, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_6930
	npc_startScrollingText text_7f_03_63aa
	npc_spawnNPC $37 $7a $64
	npc_jump @emptyRoom

@airportBuildingEast:
	npc_jumpIfItemGotten ITEMID_AIRPORT_BUILDING_PEAR, _showText_roomEmpty_clear_c059
	npc_jump @airportBuildingEastCont

@beachWest:
	npc_jumpIfItemGotten ITEMID_WEST_BEACH_GRAPES, _showText_roomEmpty_clear_c059
	npc_jump @func_62a8

@emptyRoom:
--
	npc_set_c059 $00

_infLoop_639f:
-
	npc_wait $02
	npc_jump -

_showText_roomEmpty_clear_c059:
	npc_startScrollingText text_roomEmpty
	npc_jump --


text_7f_03_63aa:
	.db $7f


text_firstPear:
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
	npc_set5_cb60
	npc_faceRight
	npc_set2_cbe4
	npc_res4_cb60
	npc_wait $08
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
+
	npc_ret


func_03_6986:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_wait $01
	npc_jump -
+
	npc_ret


data_03_6994:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60

b3_waitUntilPlayerContact:
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @done
	npc_wait $01
	npc_jump -

@done:
	npc_ret

data_03_699f:
-
	npc_wait $01
	npc_resetBit5ofNPC2ndByte_jumpIfNZ -
	npc_wait $05
	npc_resetBit5ofNPC2ndByte_jumpIfNZ -
	npc_ret


func_03_69aa:
	npc_set_c059 $ff
	npc_giveNumBombs $01
	npc_callCommonSoundFuncs_6c01 $5f $17
	npc_wait $02
	npc_ret


func_03_69b4:
	npc_set_c059 $ff
	npc_giveNumBirds $01
	npc_callCommonSoundFuncs_6c01 $5f $17
	npc_wait $02
	npc_ret


npcHelper_increaseScoreBy90:
	npc_increaseScore SCORE_10

npcHelper_increaseScoreBy80:
	npc_increaseScore SCORE_10
	npc_increaseScore SCORE_10

npcHelper_increaseScoreBy60:
	npc_increaseScore SCORE_10

npcHelper_increaseScoreBy50:
	npc_increaseScore SCORE_10

npcHelper_increaseScoreBy40:
	npc_increaseScore SCORE_10

npcHelper_increaseScoreBy30:
	npc_increaseScore SCORE_10

npcHelper_increaseScoreBy20:
	npc_increaseScore SCORE_10
	npc_increaseScore SCORE_10
	npc_ret


;;
	ld   b, l                                        ; $69d1: $45
	ld   ($0845), sp                                 ; $69d2: $08 $45 $08


npcHelper_increaseScoreBy700:
	npc_increaseScore SCORE_100
	npc_increaseScore SCORE_100
	npc_increaseScore SCORE_100
	npc_increaseScore SCORE_100


npcHelper_increaseScoreBy300:
	npc_increaseScore SCORE_100
	npc_increaseScore SCORE_100
	npc_increaseScore SCORE_100
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
	npc_wait $5a
-
	npc_set_c059 $80
	npc_wait $01
	npc_jump -

@func_6a09:
-
	npc_set_c059 $80
	npc_placeTile $d8 $80 $80
	npc_addParamsToXthenYCoords $10 $00
	npc_loopAboveParamTimes $08, -
	npc_addParamsToXthenYCoords $c0 $00
	npc_addParamsToXthenYCoords $c0 $00
	npc_wait $04
	npc_set_c059 $80
	npc_placeTile $9c $80 $80
	npc_addParamsToXthenYCoords $10 $00
	npc_loopAboveParamTimes $08, $6a1e
	npc_addParamsToXthenYCoords $c0 $00
	npc_addParamsToXthenYCoords $c0 $00
	npc_wait $04
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


npc67_oamData:
npc68_oamData:
	.db $7b $3b $3f $02


npc67_scripts:
	npc_set_c059 $ff
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_faceLeft
	npc_setMovementSpeed $02
	npc_res4_cb60
-
	npc_moveByParamPixels $08
	npc_startScrollingText text_03_6afa
	npc_loopAboveParamTimes $1b, -
	npc_spawnNPC $68 $a0 $30

-
	npc_moveByParamPixels $08
	npc_startScrollingText text_03_6afa
	npc_loopAboveParamTimes $02, -
	npc_moveByParamPixels $08
	npc_wait $04
	npc_faceRight
	npc_spawnNPC $66 $00 $00
-
	npc_wait $01
	npc_jump -


npc68_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_faceLeft
	npc_setMovementSpeed $02
	npc_res4_cb60
	npc_startScrollingText text_03_6aff
	npc_moveByParamPixels $08
	npc_startScrollingText text_03_6b05
	npc_moveByParamPixels $08
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
