func_02_4fdb:
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_res4_cb60
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @done
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @done
	npc_wait $01
	npc_jump -
@done:
	npc_ret


func_02_4fea:
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_res4_cb60
func_02_4fed:
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @done
	npc_wait $01
	npc_jump -

@done:
	npc_ret


func_02_4ff6:
@loop:
	npc_wait $01
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @loop
	npc_wait $05
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @loop
	npc_ret


npc82_scripts:
	npc_set_c059 $00
-
	npc_wait $01
	npc_jump -


func_02_5008:
	npc_set_c059 $ff
	npc_giveNumBombs $01
	npc_callCommonSoundFuncs6638
	npc_wait $01
	npc_ret


func_02_5010:
	npc_set_c059 $ff
	npc_giveNumBirds $01
	npc_callCommonSoundFuncs6638
	npc_wait $01
	npc_ret


;;
// 5018
@loop:
-
	npc_set_c059 $ff
	.db $4f $05
	npc_callCommonSoundFuncs_6c01 $73 $16
	npc_wait $02
	npc_loopAboveParamTimes $01, @loop
	npc_set_c059 $00
	npc_ret


func_02_5028:
	npc_loopAboveParamTimes $1f, -

_npc_end_02_502c:
	npc_end


npcb4_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
	npc_giveArmorOfGod AOG_BELT
	npc_giveItem ITEMID_BELT
	npc_giveArmorOfGod AOG_ARMOUR
	npc_giveItem ITEMID_ARMOUR
	npc_giveArmorOfGod AOG_BOOTS
	npc_giveArmorOfGod AOG_SHIELD
	npc_giveArmorOfGod AOG_HELM
	npc_giveArmorOfGod AOG_SWORD
	npc_end


npcb5_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
	npc_giveSpecialBItem $01
	npc_giveSpecialBItem $02
	npc_giveSpecialBItem $04
	npc_giveSpecialBItem $08
	npc_end


npcb6_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
-
	.db $19
	npc_loopAboveParamTimes $0c, -
	npc_addToPlayerHealth $ff
	npc_giveNumBirds $ff
	npc_giveNumBombs $ff
-
	.db $1b
	npc_loopAboveParamTimes $3f, -
	npc_incAnointingOilsGotten
	npc_incAnointingOilsGotten
	npc_end


npcb7_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
-
	npc_giveFruit $04
	npc_giveFruit $03
	npc_giveFruit $02
	npc_giveFruit FRUIT_POMEGRANATE
	npc_giveFruit $00
	npc_loopAboveParamTimes $04, -
	npc_end


npcb8_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_c02a_equFF
	npc_set2_cbe4
	npc_res4_cb60
-
	npc_call func_02_4fed
	.db $cf $ff $0a $01
	npc_call func_02_4ff6
	npc_jump -


npcText_02_5094:
	.db $02 $04
	.asc "PARK"
	.db $ff

	.db $06 $04
	.asc "DOWN-"
	.db $01
	.asc "TOWN"
	.db $ff

	.db $0a $04
	.asc "SHIP-"
	.db $01
	.asc "YARD"
	.db $ff

	.db $0e $04
	.asc "WOODS"
	.db $ff

	.db $12 $04
	.asc "HOUSES"
	.db $ff

	.db $02 $0e
	.asc "AIR-"
	.db $01
	.asc "PORT"
	.db $ff

	.db $06 $0e
	.asc "BEACH"
	.db $ff

	.db $0a $0e
	.asc "WARE-"
	.db $01
	.asc "HOUSES"
	.db $ff

	.db $0e $0e
	.asc "SLUM"
	.db $ff

	.db $12 $0e
	.asc "CASINO"
	.db $ff

	.db $0a $16
	.asc "FINALE"
	.db $ff

	.db $0e $16
	.asc "PRISON"
	.db $ff

	.db $12 $16
	.asc "DEMON'S"
	.db $01
	.asc "LAIR"
	.db $ff $7f


npc6a_scripts:
	npc_c02a_equFF
	npc_startScrollingText npcText_02_5094
	npc_end


; ==============================================================================
; ENTID_TRAIN_GUY
; ==============================================================================

npcText_youNeedATrainTicket:
	.db $04 $03
	.asc "You need a"
	.db $01
	.asc "ticket to"
	.db $01
	.asc "ride the"
	.db $01
	.asc "train!"
	.db $ff $fe $7f


npcText_welcomeAboard:
	.db $05 $00
	.asc "Welcome Aboard!"
	.db $ff $fe $7f


npcText_slumsTrainStation:
	.db $01 $0d
	.asc "SLUMS"
	.db $ff

	.db $02 $0a
	.asc "TRAIN"
	.db $ff

	.db $02 $10
	.asc "STATION"
	.db $ff

	.db $05 $05
	.asc "PARK"
	.db $ff

	.db $04 $0b
	.asc "WARE"
	.db $ff

	.db $05 $0a
	.asc "HOUSES"
	.db $ff

	.db $04 $11
	.asc "SHIP"
	.db $01
	.asc "YARD"
	.db $ff

	.db $05 $16
	.asc "HOUSES"
	.db $ff $7f


npcText_warehousesTrainStation:
	.db $01 $0b
	.asc "WAREHOUSES"
	.db $ff

	.db $02 $0a
	.asc "TRAIN"
	.db $ff

	.db $02 $10
	.asc "STATION"
	.db $ff

	.db $05 $05
	.asc "PARK"
	.db $ff

	.db $05 $0a
	.asc "SLUMS"
	.db $ff

	.db $04 $11
	.asc "SHIP"
	.db $01
	.asc "YARD"
	.db $ff

	.db $05 $16
	.asc "HOUSES"
	.db $ff $7f


npcText_shipyardTrainStation:
	.db $01 $0c
	.asc "SHIPYARD"
	.db $ff

	.db $02 $0a
	.asc "TRAIN"
	.db $ff

	.db $02 $10
	.asc "STATION"
	.db $ff

	.db $05 $05
	.asc "PARK"
	.db $ff

	.db $04 $0b
	.asc "WARE"
	.db $ff

	.db $05 $0a
	.asc "HOUSES"
	.db $ff

	.db $05 $11
	.asc "SLUMS"
	.db $ff

	.db $05 $17
	.asc "HOUSES"
	.db $ff $7f


npcText_parkTrainStation:
	.db $01 $0e
	.asc "PARK"
	.db $ff

	.db $02 $0a
	.asc "TRAIN"
	.db $ff

	.db $02 $10
	.asc "STATION"
	.db $ff

	.db $05 $04
	.asc "SLUMS"
	.db $ff

	.db $04 $0b
	.asc "WARE"
	.db $ff

	.db $05 $0a
	.asc "HOUSES"
	.db $ff

	.db $04 $11
	.asc "SHIP"
	.db $01
	.asc "YARD"
	.db $ff

	.db $05 $16
	.asc "HOUSES"
	.db $ff $7f


npcText_housesTrainStation:
	.db $01 $0d
	.asc "HOUSES"
	.db $ff

	.db $02 $0a
	.asc "TRAIN"
	.db $ff

	.db $02 $10
	.asc "STATION"
	.db $ff

	.db $05 $05
	.asc "PARK"
	.db $ff

	.db $04 $0b
	.asc "WARE"
	.db $ff

	.db $05 $0a
	.asc "HOUSES"
	.db $ff

	.db $04 $11
	.asc "SHIP"
	.db $01
	.asc "YARD"
	.db $ff

	.db $05 $17
	.asc "SLUMS"
	.db $ff $7f


openUpTrainStation:
	npc_wait $1e
	npc_placeTile $84 $03 $03
	npc_wait $0a
	npc_placeTile $84 $06 $03
	npc_wait $0a
	npc_placeTile $84 $09 $03
	npc_wait $0a
	npc_placeTile $84 $0c $03
-
	npc_call func_02_4fed
	npc_displayTextScreen npcText_welcomeAboard
	npc_call func_02_4ff6
	npc_jump -

npc6b_scripts:
	npc_c02a_equFF
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_res4_cb60
	npc_groupRoomXYjumpTable @table
	npc_jump @houses

@table:
	.db $ff $00 $00
	.dw @slums

	.db $ff $01 $00
	.dw @warehouses

	.db $ff $00 $01
	.dw @shipyard

	.db $ff $01 $01
	.dw @park

	.db $ff $ff $ff

@slums:
	npc_startScrollingText npcText_slumsTrainStation
	npc_jump @afterInitialText

@warehouses:
	npc_startScrollingText npcText_warehousesTrainStation
	npc_jump @afterInitialText

@shipyard:
	npc_startScrollingText npcText_shipyardTrainStation
	npc_jump @afterInitialText

@park:
	npc_startScrollingText npcText_parkTrainStation
	npc_jump @afterInitialText

@houses:
	npc_startScrollingText npcText_housesTrainStation

@afterInitialText:
	npc_jumpIfSpecialBitemGotten SPECIALB_RR_TICKET, openUpTrainStation
-
	npc_call func_02_4fed
	npc_displayTextScreen npcText_youNeedATrainTicket
	npc_call func_02_4ff6
	npc_jump -


; ==============================================================================
; ENTID_AIRPORT_BAGGAGE_1F_2
; ==============================================================================
npc6f_scripts:
	npc_wait $50
	npc_jump +


; ==============================================================================
; ENTID_AIRPORT_BAGGAGE_1F_3
; ==============================================================================
npc70_scripts:
	npc_wait $a0
	npc_jump +


; ==============================================================================
; ENTID_AIRPORT_BAGGAGE_1F_4
; ==============================================================================
npc71_scripts:
	npc_wait $f0
	npc_jump +


; ==============================================================================
; ENTID_AIRPORT_BAGGAGE_1F_5
; ==============================================================================
npc72_scripts:
	npc_wait $fa
	npc_wait $50

+
; ==============================================================================
; ENTID_AIRPORT_BAGGAGE_1F_1
; ==============================================================================
npc6e_scripts:
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_set2_cb60
	npc_set5_cb60
	npc_setMovementSpeed $02
	npc_faceLeft
	npc_moveByParamPixels $40
	npc_setMovementSpeed $01
	npc_faceUp
	npc_moveByParamPixels $20
	npc_faceRight
	npc_moveByParamPixels $90
	npc_faceDown
	npc_moveByParamPixels $40
	npc_faceLeft
	npc_moveByParamPixels $90
	npc_spawnNPC $6e $70 $40
	npc_faceUp
	npc_moveByParamPixels $20
	npc_wait $01
	npc_end


; ==============================================================================
; ENTID_AIRPORT_BAGGAGE_2F
; ==============================================================================
npc73_scripts:
	npc_faceLeft
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_set2_cb60
	npc_set5_cb60
	npc_moveByParamPixels $10
	npc_faceDown
	npc_moveByParamPixels $80
	npc_faceLeft
	npc_moveByParamPixels $30
	npc_faceUp
	npc_spawnNPC ENTID_AIRPORT_BAGGAGE_2F $f0 $10
	npc_moveByParamPixels $40
	npc_faceLeft
	npc_moveByParamPixels $40
	npc_faceUp
	npc_moveByParamPixels $20
	npc_faceRight
	npc_moveByParamPixels $20
	npc_faceUp
	npc_moveByParamPixels $20
	npc_faceLeft
	npc_moveByParamPixels $80
	npc_faceDown
	npc_moveByParamPixels $60
	npc_faceRight
	npc_moveByParamPixels $60
	npc_faceDown
	npc_moveByParamPixels $20
	npc_faceLeft
	npc_moveByParamPixels $60
	npc_end


; ==============================================================================
; ENTID_KEYLOCK
; ==============================================================================
npc74_scripts:
	npc_call placeDoorAtKeyLockBasedOnRoom
-
	npc_call func_02_4fed
	npc_jumpIfAtLeast1key +
	npc_displayTextScreen npcText_02_5470
	npc_call func_02_4ff6
	npc_jump -
+
	npc_call keyLockFunc
	npc_callCommonSoundFuncs6638
	npc_takeKey
	npc_jump placeDoorAtKeyLock


keyLockFunc:
	npc_groupRoomXYjumpTable @table
	npc_ret

@table:
	.db $0f $01 $02
	.dw @cityBoss

	.db $0b $04 $03
	.dw @entry1

	.db $0d $03 $01
	.dw @entry2

	.db $02 $03 $00
	.dw @entry3

	.db $1d $01 $04
	.dw @entry4

	.db $0f $03 $03
	.dw @entry5

	.db $0c $04 $04
	.dw @entry6

	.db $1a $04 $01
	.dw @entry7

	.db $07 $02 $05
	.dw @entry8

	.db $ff $ff $ff

@cityBoss:
	npc_giveItem ITEMID_CITY_BOSS_KEYLOCK
	npc_ret

@entry1:
	npc_giveItem ITEMID_22
	npc_ret

@entry2:
	npc_ret

@entry3:
	npc_giveItem ITEMID_23
	npc_ret

@entry4:
	npc_giveItem ITEMID_PORT_BOTTOM_LEFT_PEAR
	npc_ret

@entry5:
	npc_giveItem ITEMID_25
	npc_ret

@entry6:
	npc_giveItem ITEMID_29
	npc_ret

@entry7:
	npc_giveItem ITEMID_28
	npc_ret

@entry8:
	npc_giveItem ITEMID_2c
	npc_ret


placeDoorAtKeyLockBasedOnRoom:
	npc_groupRoomXYjumpTable @table
	npc_callCommonSoundFuncs6638
	npc_end

@table:
	.db $0f $01 $02
	.dw @cityBoss

	.db $0b $04 $03
	.dw @entry1

	.db $0d $03 $01
	.dw @entry2

	.db $02 $03 $00
	.dw @entry3

	.db $1d $01 $04
	.dw @entry4

	.db $0f $03 $03
	.dw @entry5

	.db $0c $04 $04
	.dw @entry6

	.db $1a $04 $01
	.dw @entry7

	.db $07 $02 $05
	.dw @entry8

	.db $ff $ff $ff

@cityBoss:
	npc_jumpIfItemGotten ITEMID_CITY_BOSS_KEYLOCK, placeDoorAtKeyLock
	npc_ret

@entry1:
	npc_jumpIfItemGotten ITEMID_22, placeDoorAtKeyLock
	npc_ret

@entry2:
	npc_jumpIfSpecialBitemGotten SPECIALB_RR_TICKET, placeDoorAtKeyLock
	npc_ret

@entry3:
	npc_jumpIfItemGotten ITEMID_23, placeDoorAtKeyLock
	npc_ret

@entry4:
	npc_jumpIfItemGotten ITEMID_24, placeDoorAtKeyLock
	npc_ret

@entry5:
	npc_jumpIfItemGotten ITEMID_25, placeDoorAtKeyLock
	npc_ret

@entry6:
	npc_jumpIfItemGotten ITEMID_29, placeDoorAtKeyLock
	npc_ret

@entry7:
	npc_jumpIfItemGotten ITEMID_28, placeDoorAtKeyLock
	npc_ret

@entry8:
	npc_jumpIfItemGotten ITEMID_2c, placeDoorAtKeyLock
	npc_ret


placeDoorAtKeyLock:
	npc_groupRoomXYjumpTable @table
	npc_placeTile $84 $80 $80
	npc_end

@entry0:
	npc_placeTile $ac $80 $80
	npc_end

@table:
	.db $1a $04 $01
	.dw @entry0

	.db $ff $ff $ff


npcText_02_5470:
	.db $04 $01
	.asc "You need"
	.db $01
	.asc "to find a key"
	.db $01
	.asc "to unlock"
	.db $01
	.asc "this door."
	.db $ff $fe $7f


; ==============================================================================
; ENTID_HEART_CONTAINER
; ==============================================================================
npc6d_scripts:
	npc_set5_cb60
	npc_groupRoomXYjumpTable @table
	npc_callCommonSoundFuncs6638
	npc_end

@table:
	.db $0f $00 $02
	.dw @cityBottomMid

	.db $0f $00 $00
	.dw @entry1

	.db $00 $00 $01
	.dw @westPark

	.db $10 $03 $00
	.dw @airportBuilding3F

	.db $1e $02 $02
	.dw @entry4

	.db $08 $01 $01
	.dw @entry5

	.db $0f $02 $00
	.dw @entry6

	.db $0b $01 $03
	.dw @entry7

	.db $11 $00 $01
	.dw @entry8

	.db $ff $ff $ff

@func_54d6:
	npc_set3_cb60
	npc_placeTile $00 $80 $80
	npc_jump func_02_4fdb

@func_54de:
	npc_set_c059 $ff
	.db $19
	npc_callCommonSoundFuncs_6c01 $6a $16
	npc_wait $04

@func_54e6:
	npc_addToPlayerHealth $01
	npc_callCommonSoundFuncs_6c01 $6a $16
	npc_wait $02
	npc_jumpIfPlayerIsFullHealth +
	npc_jump @func_54e6
+
	npc_set_c059 $00
	npc_increaseScore SCORE_800
	npc_ret

@cityBottomMid:
	npc_jumpIfItemGotten ITEMID_CITY_BOTTOM_MID_HC, _npc_end_02_502c
	npc_call @func_54d6
	npc_giveItem ITEMID_CITY_BOTTOM_MID_HC
	npc_call @func_54de
	npc_end

@entry1:
	npc_jumpIfItemGotten ITEMID_17, _npc_end_02_502c
	npc_call @func_54d6
	npc_giveItem ITEMID_17
	npc_call @func_54de
	npc_end

@westPark:
	npc_jumpIfItemGotten ITEMID_WEST_PARK_HC, _npc_end_02_502c
	npc_call @func_54d6
	npc_giveItem ITEMID_WEST_PARK_HC
	npc_call @func_54de
	npc_placeTile $6c $80 $80
	npc_end

@airportBuilding3F:
	npc_jumpIfItemGotten ITEMID_AIRPORT_BUILDING_HC, _npc_end_02_502c
	npc_call @func_54d6
	npc_giveItem ITEMID_AIRPORT_BUILDING_HC
	npc_call @func_54de
	npc_end

@entry4:
	npc_jumpIfItemGotten ITEMID_1a, _npc_end_02_502c
	npc_call @func_54d6
	npc_giveItem ITEMID_1a
	npc_call @func_54de
	npc_end

@entry5:
	npc_jumpIfItemGotten ITEMID_1b, _npc_end_02_502c
	npc_call @func_54d6
	npc_giveItem ITEMID_1b
	npc_call @func_54de
	npc_placeTile $b4 $80 $80
	npc_end

@entry6:
	npc_jumpIfItemGotten ITEMID_1c, _npc_end_02_502c
	npc_call @func_54d6
	npc_giveItem ITEMID_1c
	npc_call @func_54de
	npc_end

@entry7:
	npc_jumpIfItemGotten ITEMID_1d, _npc_end_02_502c
	npc_call @func_54d6
	npc_giveItem ITEMID_1d
	npc_call @func_54de
	npc_placeTile $b8 $80 $80
	npc_end

@entry8:
	npc_jumpIfItemGotten ITEMID_1e, _npc_end_02_502c
	npc_call @func_54d6
	npc_giveItem ITEMID_1e
	npc_call @func_54de
	npc_end


npcText_02_5579:
	.db $04 $01
	.asc "The white zone"
	.db $01
	.asc "is for loading"
	.db $01
	.asc "and unloading"
	.db $01
	.asc "passengers..."
	.db $ff $fe $7f


npcText_02_55b7:
	.db $04 $01
	.asc "The red zone"
	.db $01
	.asc "is a no"
	.db $01
	.asc "parking area."
	.db $ff $fe $7f


; ==============================================================================
; ENTID_AIRPORT_LEFT_GUARD
; ==============================================================================
npc75_scripts:
-
	npc_call func_02_4fea
	npc_displayTextScreen npcText_02_5579
	npc_call func_02_4ff6
	npc_jump -


; ==============================================================================
; ENTID_AIRPORT_RIGHT_GUARD
; ==============================================================================
npc76_scripts:
-
	npc_call func_02_4fea
	npc_displayTextScreen npcText_02_55b7
	npc_call func_02_4ff6
	npc_jump -


; ==============================================================================
; ENTID_SLUMS_PLUMBER
; ==============================================================================
npc92_scripts:
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
; ENTID_HELPFUL_LADY
; ==============================================================================
npc77_scripts:
	npc_res4_cb60
	npc_set2_cbe4
	npc_call func_02_4fed
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $02 $ff $ff
	.dw @slums

	.db $07 $ff $ff
	.dw @entry1

	.db $0b $ff $ff
	.dw @entry2

	.db $ff $ff $ff


@entry1:
	npc_groupRoomXYjumpTable @@entry1table
	npc_jump @@func_563c

@@entry1table:
	.db $07 $01 $03
	.dw @@entry1entry0

	.db $07 $02 $04
	.dw @@entry1entry1

	.db $ff $ff $ff

@@func_563c:
	npc_jumpIfRandomNumLTparam $55, @@@loop0
	npc_jumpIfRandomNumLTparam $80, @@@loop1
-
	npc_displayTextScreen @@npcText_5680
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump -

@@@loop0:
	npc_displayTextScreen @@npcText_56a9
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump @@@loop0

@@@loop1:
	npc_displayTextScreen @@npcText_56be
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump @@@loop1

@@entry1entry0:
-
	npc_displayTextScreen @@npcText_56e1
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump -

@@entry1entry1:
-
	npc_displayTextScreen @npcText_5701
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump -

@@npcText_5680:
	.db $04 $01
	.asc "The torch is"
	.db $01
	.asc "useful in some"
	.db $01
	.asc "rooms..."
	.db $ff $fe $7f

@@npcText_56a9:
	.db $05 $03
	.asc "Have a"
	.db $01
	.asc "nice day!"
	.db $ff $fe $7f

@@npcText_56be:
	.db $04 $02
	.asc "Find the key"
	.db $01
	.asc "to get the"
	.db $01
	.asc "boots."
	.db $ff $fe $7f

@@npcText_56e1:
	.db $05 $01
	.asc "Watch out for"
	.db $01
	.asc "the forklift!"
	.db $ff $fe $7f

@npcText_5701:
	.db $04 $00
	.asc "You need the"
	.db $01
	.asc "Boots to"
	.db $01
	.asc "cross the"
	.db $01
	.asc "burning rubble!"
	.db $ff $fe $7f


@slums:
	npc_groupRoomXYjumpTable @@slumsTable
	npc_jump @@func_5748

@@slumsTable:
	.db $02 $04 $01
	.dw @@entry0entry0

	.db $02 $00 $01
	.dw @@entry0entry1

	.db $ff $ff $ff

@@func_5748:
	npc_jumpIfRandomNumLTparam $55, @@@loop0
	npc_jumpIfRandomNumLTparam $80, @@@loop1
-
	npc_displayTextScreen @@npcText_578c
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump -

@@@loop0:
	npc_displayTextScreen @@npcText_57b8
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump @@@loop0

@@@loop1:
	npc_displayTextScreen @@npcText_57d5
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump @@@loop1

@@entry0entry0:
-
	npc_displayTextScreen @@npcText_57ea
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump -

@@entry0entry1:
-
	npc_displayTextScreen @npcText_5701
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump -

@@npcText_578c:
	.db $04 $01
	.asc "The torch can"
	.db $01
	.asc "be found in"
	.db $01
	.asc "the junkyard!"
	.db $ff $fe $7f

@@npcText_57b8:
	.db $05 $01
	.asc "Hey buddy!"
	.db $01
	.asc "Spare a dime?"
	.db $ff $fe $7f

@@npcText_57d5:
	.db $05 $03
	.asc "Have a"
	.db $01
	.asc "nice day!"
	.db $ff $fe $7f

@@npcText_57ea:
	.db $04 $01
	.asc "Be careful!"
	.db $01
	.asc "Gangs are"
	.db $01
	.asc "fighting in"
	.db $01
	.asc "the junkyard."
	.db $ff $fe $7f


@entry2:
	npc_jumpIfRandomNumLTparam $55, @@loop0
	npc_jumpIfRandomNumLTparam $80, @@loop1
-
	npc_displayTextScreen @@npcText_584a
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump -

@@loop0:
	npc_displayTextScreen @@npcText_586a
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump @@loop0

@@loop1:
	npc_displayTextScreen @@npcText_5883
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump @@loop1

@@npcText_584a:
	.db $05 $01
	.asc "Have you seen"
	.db $01
	.asc "my surfboard?"
	.db $ff $fe $7f

@@npcText_586a:
	.db $05 $03
	.asc "Hey dude!"
	.db $01
	.asc "What's up?"
	.db $ff $fe $7f

@@npcText_5883:
	.db $05 $01
	.asc "Everybody"
	.db $01
	.asc "went surfin..."
	.db $ff $fe $7f


; ==============================================================================
; ENTID_SLUMS_GUNMAN_FACING_LEFT
; ==============================================================================
npc78_scripts:
	npc_call func_02_58c4
-
	npc_call func_02_58cc
	npc_set6_cb60_reset_cb6c
	npc_wait $08
	npc_spawnNPCinFrontOfSelf ENTID_SLUMS_GUNMAN_BULLET_LEFT
	.db $16
	npc_call func_02_58d0
	npc_jump -


; ==============================================================================
; ENTID_SLUMS_GUNMAN_FACING_RIGHT
; ==============================================================================
npc7a_scripts:
	npc_call func_02_58c4
-
	npc_call func_02_58cc
	npc_set6_cb60_reset_cb6c
	npc_wait $08
	npc_spawnNPCinFrontOfSelf ENTID_SLUMS_GUNMAN_BULLET_RIGHT
	.db $16
	npc_call func_02_58d0
	npc_jump -


func_02_58c4:
	npc_set6_cb60_reset_cb6c
	npc_setDamageTaken $01
	.db $16
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_res4_cb60
	npc_ret


func_02_58cc:
	npc_waitRandomValBetween2ParamsInclusive $06 $0c
	npc_ret


func_02_58d0:
	npc_waitRandomValBetween2ParamsInclusive $0a $14
	npc_ret


; ==============================================================================
; ENTID_SLUMS_GUNMAN_BULLET_LEFT
; ENTID_SLUMS_GUNMAN_BULLET_RIGHT
; ==============================================================================
npc79_scripts:
npc7b_scripts:
	npc_callCommonSoundFuncs_6c01 $61 $16
	npc_set5_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_setMovementSpeed $08
	npc_setDamageTaken $03
	npc_moveByParamPixels $10
	npc_res5_cb60
	npc_moveByParamPixels $ff
	npc_setNewNpcID $7c


; ==============================================================================
; ENTID_SLUMS_BULLET_EXPLOSION
; ==============================================================================
npc7c_scripts:
	npc_set3_cb60
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_set2_cbe4
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $16
	npc_end


; ==============================================================================
; ENTID_SHOP_ANGEL
; ==============================================================================
npc7d_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_c02a_equFF
	npc_set2_cbe4
	npc_res4_cb60
	npc_groupRoomXYjumpTable @table
	npc_callCommonSoundFuncs6638
	npc_end

@table:
	.db $1b $00 $00
	.dw @slumsTopRight

	.db $1b $01 $00
	.dw @entry1

	.db $1b $02 $00
	.dw @entry2

	.db $1b $01 $01
	.dw @entry3

	.db $1b $02 $01
	.dw @bottomLeftSlums

	.db $1b $00 $02
	.dw @slumsBottomMiddle

	.db $1b $02 $02
	.dw @entry6

	.db $1e $00 $00
	.dw @warehousesBottomLeftApple

	.db $1e $01 $00
	.dw @entry8

	.db $10 $ff $ff
	.dw @entry9

	.db $ff $ff $ff

@slumsTopRight:
	npc_jumpIfSpecialBitemGotten SPECIALB_LAMP, @showRoomEmptyText
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5a39
	npc_startScrollingText @npcText_5dfb
	npc_spawnNPC ENTID_LAMP $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump npc82_scripts

@entry1:
	npc_jumpIfItemGotten ITEMID_12, @showRoomEmptyText
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5aa5
	npc_startScrollingText @npcText_5dfb
	npc_spawnNPC $32 $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump npc82_scripts

@entry2:
	npc_jumpIfArmorOfGodGotten AOG_SWORD, @showRoomEmptyText
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5b02
	npc_spawnNPC $39 $7a $64
	npc_jump npc82_scripts

@entry3:
	npc_jumpIfItemGotten ITEMID_24, @showRoomEmptyText
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5b5f
	npc_spawnNPC $80 $52 $50
	npc_spawnNPC $81 $a2 $50
	npc_jump npc82_scripts

@bottomLeftSlums:
	npc_jumpIfItemGotten ITEMID_SLUMS_BOTTOM_LEFT_POMEGRANATE, +
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5bb7
	npc_startScrollingText @npcText_5dfb
	npc_spawnNPC ENTID_POMEGRANATE $52 $64
	npc_spawnNPC ENTID_PRICE_BIRD $48 $54
	npc_spawnNPC ENTID_SHOP_7_VIALS $a2 $64
	npc_spawnNPC ENTID_PRICE_BIRD $98 $54
	npc_jump npc82_scripts
+
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5c07
	npc_spawnNPC $3a $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump npc82_scripts

@slumsBottomMiddle:
	npc_jumpIfItemGotten ITEMID_SLUMS_BOTTOM_MIDDLE_KEY, @showRoomEmptyText
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5c57
	npc_spawnNPC ENTID_SLUMS_BOTTOM_MIDDLE_KEY $7a $64
	npc_jump npc82_scripts

@entry6:
	npc_jumpIfItemGotten ITEMID_06, +
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5c8f
	npc_startScrollingText @npcText_5dfb
	npc_spawnNPC ENTID_POMEGRANATE $52 $64
	npc_spawnNPC ENTID_PRICE_BIRD $48 $54
	npc_spawnNPC $3b $a2 $64
	npc_spawnNPC ENTID_PRICE_BIRD $98 $54
	npc_jump npc82_scripts
+
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5cd1
	npc_startScrollingText @npcText_5dfb
	npc_spawnNPC $3b $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump npc82_scripts

@warehousesBottomLeftApple:
	npc_jumpIfItemGotten ITEMID_WAREHOUSES_BOTTOM_LEFT_APPLE, @showRoomEmptyText
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5d3a
	npc_startScrollingText @npcText_5dfb
	npc_spawnNPC ENTID_APPLE $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump npc82_scripts

@entry8:
	npc_jumpIfArmorOfGodGotten AOG_BOOTS, @showRoomEmptyText
	npc_set_c059 $ff
	npc_startScrollingText @npcText_5d92
	npc_spawnNPC $36 $7a $64
	npc_jump npc82_scripts

@entry9:
-
	npc_wait $01
	npc_jump -

@showRoomEmptyText:
	npc_startScrollingText @text_roomEmpty
	npc_jump npc82_scripts

@text_roomEmpty:
	.db $04 $03
	.asc "This room is empty."
	.db $ff $7f

@npcText_5a39:
	.db $04 $03
	.asc "Use this torch to"
	.db $01
	.asc "help illuminate"
	.db $01
	.asc "your path. Light"
	.db $01
	.asc "the torch by"
	.db $01
	.asc "selecting it from"
	.db $01
	.asc "your item list."
	.db $ff

	.db $0b $10
	.db $7b
	.asc "150"
	.db $ff $7f

@npcText_5aa5:
	.db $04 $03
	.asc "The fastest and"
	.db $01
	.asc "farthest flying"
	.db $01
	.asc "fruit is the"
	.db $01
	.asc "banana. It travels"
	.db $01
	.asc "in a straight path."
	.db $ff

	.db $0b $10
	.db $7b
	.asc "90"
	.db $ff $7f

@npcText_5b02:
	.db $04 $03
	.asc "This is the Sword"
	.db $01
	.asc "of the Spirit. It"
	.db $01
	.asc "will help you to"
	.db $01
	.asc "defeat the demons"
	.db $01
	.asc "in the stronghold."
	.db $ff $7f

@npcText_5b5f:
	.db $04 $03
	.asc "Way to go! You've"
	.db $01
	.asc "found a hidden"
	.db $01
	.asc "treasure room!"
	.db $01
	.asc "Stock up on vials"
	.db $01
	.asc "and spirit points!"
	.db $ff $7f

@npcText_5bb7:
	.db $04 $03
	.asc "You are doing well!"
	.db $01
	.asc "Let me help you by"
	.db $01
	.asc "offering these"
	.db $01
	.asc "items."
	.db $ff

	.db $0b $0b
	.db $7b
	.asc "60       "
	.db $7b
	.asc "30"
	.db $ff $7f

@npcText_5c07:
	.db $04 $03
	.asc "Nice to see you"
	.db $01
	.asc "again! All I have"
	.db $01
	.asc "to offer this time"
	.db $01
	.asc "are some vials..."
	.db $ff

	.db $0b $10
	.db $7b
	.asc "30"
	.db $ff $7f

@npcText_5c57:
	.db $04 $03
	.asc "Here is a key that"
	.db $01
	.asc "can be used to open"
	.db $01
	.asc "locked doors."
	.db $ff $7f

@npcText_5c8f:
	.db $04 $03
	.asc "Hello. Here are"
	.db $01
	.asc "some items that"
	.db $01
	.asc "will help you!"
	.db $ff

	.db $0b $0b
	.db $7b
	.asc "60       "
	.db $7b
	.asc "75"
	.db $ff $7f

@npcText_5cd1:
	.db $04 $03
	.asc "Here is a vial of"
	.db $01
	.asc "anointing oil. Save"
	.db $01
	.asc "it until you are"
	.db $01
	.asc "weak and it will"
	.db $01
	.asc "help you in your"
	.db $01
	.asc "quest."
	.db $ff

	.db $0b $10
	.db $7b
	.asc "75"
	.db $ff $7f

@npcText_5d3a:
	.db $04 $03
	.asc "Here is an apple to"
	.db $01
	.asc "add to your fruit."
	.db $01
	.asc "It travels slowly"
	.db $01
	.asc "but is very"
	.db $01
	.asc "powerful."
	.db $ff

	.db $0b $10
	.db $7b
	.asc "40"
	.db $ff $7f

@npcText_5d92:
	.db $04 $03
	.asc "The Boots shod with"
	.db $01
	.asc "the Preparation of"
	.db $01
	.asc "the Gospel will let"
	.db $01
	.asc "you cross certain"
	.db $01
	.asc "obstacles to your"
	.db $01
	.asc "quest."
	.db $ff $7f

@npcText_5dfb:
	.db $7f


; ==============================================================================
; ENTID_PAWN_SHOP_GUY
; ==============================================================================
npc6c_scripts:
	npc_set6_cb60_reset_cb6c
	npc_c02a_equFF
	npc_set2_cbe4
	npc_res4_cb60
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_jumpIfItemGotten ITEMID_BELT, @func_5e16
+
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, +
	npc_jumpIfItemGotten ITEMID_ARMOUR, @func_5e2c
+
	npc_startScrollingText @npcText_5e50
	npc_jump npc82_scripts

@func_5e16:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, +
	npc_jumpIfItemGotten ITEMID_ARMOUR, @func_5e3a
+
	npc_startScrollingText @npcText_5e8c
	npc_spawnNPC ENTID_BELT_OF_TRUTH $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump npc82_scripts

@func_5e2c:
	npc_startScrollingText @npcText_5ec8
	npc_spawnNPC ENTID_BREASTPLATE_OF_RIGHTEOUSNESS $7a $64
	npc_spawnNPC ENTID_PRICE_BIRD $70 $54
	npc_jump npc82_scripts

@func_5e3a:
	npc_startScrollingText @npcText_5f1f
	npc_spawnNPC ENTID_BELT_OF_TRUTH $52 $64
	npc_spawnNPC ENTID_PRICE_BIRD $48 $54
	npc_spawnNPC ENTID_BREASTPLATE_OF_RIGHTEOUSNESS $a2 $64
	npc_spawnNPC ENTID_PRICE_BIRD $98 $54
	npc_jump npc82_scripts

@npcText_5e50:
	.db $04 $03
	.asc "There is nothing"
	.db $01
	.asc "here of interest to"
	.db $01
	.asc "you at this time..."
	.db $ff $7f

@npcText_5e8c:
	.db $04 $03
	.asc "If you have truly"
	.db $01
	.asc "repented you can"
	.db $01
	.asc "have the belt."
	.db $ff

	.db $0b $10
	.db $7b
	.asc "150"
	.db $ff $7f

@npcText_5ec8:
	.db $04 $03
	.asc "If you have seen"
	.db $01
	.asc "the error of your"
	.db $01
	.asc "ways, you may have"
	.db $01
	.asc "the breastplate"
	.db $01
	.asc "again."
	.db $ff

	.db $0b $10
	.db $7b
	.asc "200"
	.db $ff $7f

@npcText_5f1f:
	.db $04 $03
	.asc "I sure hope you"
	.db $01
	.asc "learned a lesson!"
	.db $01
	.asc "Repent and you may"
	.db $01
	.asc "recover the items"
	.db $01
	.asc "that you have lost."
	.db $ff

	.db $0b $0b
	.db $7b
	.asc "150      "
	.db $7b
	.asc "200"
	.db $ff $7f


; ==============================================================================
; ENTID_LAMP
; ==============================================================================
npc7e_scripts:
	npc_call func_02_4fea
	npc_jumpIfNumBirdsGotten $96, +
	npc_jump @loop
+
	npc_giveSpecialBItem SPECIALB_LAMP
	npc_call func_02_5028
	npc_end
@loop:
	npc_displayTextScreen @npcText_5faa
	npc_call func_02_4ff6
	npc_call func_02_4fed
	npc_jump @loop

@npcText_5faa:
	.db $04 $02
	.asc "Your faith"
	.db $01
	.asc "looks weak."
	.db $01
	.asc "You'll need"
	.db $01
	.asc "more spirit."
	.db $ff $fe $7f


npc7f_scripts:
	npc_set5_cb60
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_setMovementSpeed $02
	npc_setDamageTaken $08
	npc_res4_cb60
-
	npc_moveByParamPixels $ff
	npc_turnBackwards
	npc_jump -


npcac_scripts:
	npc_set5_cb60
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_setMovementSpeed $02
	npc_setDamageTaken $08
	npc_res4_cb60
-
	npc_moveByParamPixels $60
	npc_turnRight
	npc_jump -


npc90_scripts:
	npc_setMovementSpeed $10
	npc_set5_cb60
	npc_jumpIfRandomNumLTparam $c0, ++
	npc_faceLeft
	npc_jump +
++
	npc_jumpIfRandomNumLTparam $aa, ++
	npc_faceRight
	npc_jump +
++
	npc_jumpIfRandomNumLTparam $80, +
	npc_faceUp
+
	npc_moveByParamPixels $20
	npc_jumpIfRandomNumLTparam $80, +
	npc_setNewNpcID $7f
	npc_end
+
	npc_setNewNpcID $ac
	npc_end


npc80_scripts:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_set3_cb60
	npc_call func_02_4fea
-
	npc_call func_02_5008
	npc_jumpIfMoreThanNumBombsGotten $ff, func_02_602e
	npc_jump -

func_02_602e:
	npc_giveItem ITEMID_24
	npc_set_c059 $00
	npc_end


npc81_scripts:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_call func_02_4fea
-
	npc_call func_02_5010
	npc_jumpIfNumBirdsGotten $ff, func_02_602e
	npc_jump -


npc83_scripts:
@loop:
	npc_call func_02_4fed
	npc_set_c059 $ff
	npc_call npc6d_scripts@func_54e6
	npc_jumpIfItemGotten ITEMID_26, +
	npc_displayTextScreen @npcText_60bb
+
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_displayTextScreen @npcText_60f7
	npc_jump @end
+
	npc_jumpIfItemGotten ITEMID_ARMOUR, +
	npc_jump @func_606c
+
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, ++
	npc_displayTextScreen @npcText_614f
	npc_jump @end

@func_606c:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, ++
	npc_displayTextScreen @npcText_61a4
	npc_jump @end

++
	npc_jumpIfArmorOfGodGotten AOG_BOOTS, +
	npc_displayTextScreen @npcText_6213
	npc_jump @end
+
	npc_jumpIfSpecialBitemGotten $02, +
	npc_displayTextScreen @npcText_6287
	npc_jump @end
+
	npc_jumpIfSpecialBitemGotten $04, +
	npc_displayTextScreen @npcText_6300
	npc_jump @end
+
	npc_jumpIfArmorOfGodGotten AOG_SWORD, +
	npc_displayTextScreen @npcText_6445
	npc_jump @end
+
	npc_jumpIfArmorOfGodGotten AOG_HELM, +
	npc_displayTextScreen @npcText_6376
	npc_jump @end
+
	npc_jumpIfArmorOfGodGotten AOG_SHIELD, +
	npc_displayTextScreen @npcText_64aa
	npc_jump @end
+
	npc_displayTextScreen @npcText_6578

@end:
	npc_call func_02_4ff6
	npc_jump @loop

@npcText_60bb:
	.db $03 $02
	.asc "Welcome to"
	.db $01
	.asc "the Church!"
	.db $01
	.asc "You can"
	.db $01
	.asc "always find"
	.db $01
	.asc "help here."
	.db $ff
	.db $42 $0f
	.db $fe $7f


@npcText_60f7:
	.db $03 $01
	.asc "To regain the"
	.db $01
	.asc "Belt of Truth,"
	.db $01
	.asc "You should"
	.db $01
	.asc "search through"
	.db $01
	.asc "the slums for"
	.db $01
	.asc "a pawn shop."
	.db $ff
	.db $42 $0f
	.db $fe $7f

@npcText_614f:
	.db $03 $01
	.asc "To reclaim the"
	.db $01
	.asc "Breastplate of"
	.db $01
	.asc "Righteousness,"
	.db $01
	.asc "go to the"
	.db $01
	.asc "pawn shop in"
	.db $01
	.asc "the slums."
	.db $ff
	.db $42 $0f
	.db $fe $7f

@npcText_61a4:
	.db $02 $00
	.asc "Finding the"
	.db $01
	.asc "Breastplate of"
	.db $01
	.asc "Righteousness"
	.db $01
	.asc "would really"
	.db $01
	.asc "help. It is in"
	.db $01
	.asc "a locked room"
	.db $01
	.asc "in the downtown"
	.db $01
	.asc "area."
	.db $ff
	.db $42 $0f
	.db $fe $7f

@npcText_6213:
	.db $01 $01
	.asc "If you search"
	.db $01
	.asc "really care-"
	.db $01
	.asc "fully, you"
	.db $01
	.asc "will find the"
	.db $01
	.asc "Boots of the"
	.db $01
	.asc "Gospel in the"
	.db $01
	.asc "Warehouse"
	.db $01
	.asc "section of the"
	.db $01
	.asc "city."
	.db $ff
	.db $42 $0f
	.db $fe $7f

@npcText_6287:
	.db $01 $01
	.asc "To get the"
	.db $01
	.asc "raft in the"
	.db $01
	.asc "park you will"
	.db $01
	.asc "need the"
	.db $01
	.asc "Jawbone of"
	.db $01
	.asc "Samson. It"
	.db $01
	.asc "can be found"
	.db $01
	.asc "in a locked"
	.db $01
	.asc "room in the"
	.db $01
	.asc "shipyard."
	.db $ff
	.db $42 $0f
	.db $fe $7f

@npcText_6300:
	.db $01 $01
	.asc "Now that you"
	.db $01
	.asc "found the Jaw-"
	.db $01
	.asc "bone, get the"
	.db $01
	.asc "raft in the"
	.db $01
	.asc "park. The"
	.db $01
	.asc "jawbone also"
	.db $01
	.asc "picks up"
	.db $01
	.asc "spirit points"
	.db $01
	.asc "and health."
	.db $ff
	.db $42 $0f
	.db $fe $7f

@npcText_6376:
	.db $02 $01
	.asc "It looks like"
	.db $01
	.asc "you still lack"
	.db $01
	.asc "the Helmet of"
	.db $01
	.asc "Salvation. You"
	.db $01
	.asc "might try"
	.db $01
	.asc "looking in a"
	.db $01
	.asc "cave in the"
	.db $01
	.asc "woods."
	.db $ff
	.db $42 $1e
	.db $fe $fd

	.db $02 $01
	.asc "Watch out for"
	.db $01
	.asc "the bees and"
	.db $01
	.asc "make sure you"
	.db $01
	.asc "have Samson's"
	.db $01
	.asc "Jawbone active"
	.db $01
	.asc "when you"
	.db $01
	.asc "enter the"
	.db $01
	.asc "cave."
	.db $ff
	.db $42 $0f
	.db $fe $7f

@npcText_6445:
	.db $02 $01
	.asc "The mighty"
	.db $01
	.asc "Sword of the"
	.db $01
	.asc "Spirit is"
	.db $01
	.asc "hidden on an"
	.db $01
	.asc "island by the"
	.db $01
	.asc "beach. Use"
	.db $01
	.asc "the raft to"
	.db $01
	.asc "get there."
	.db $ff
	.db $42 $0f
	.db $fe $7f

@npcText_64aa:
	.db $01 $02
	.asc "The only"
	.db $01
	.asc "missing"
	.db $01
	.asc "piece of"
	.db $01
	.asc "armor is the"
	.db $01
	.asc "Shield of"
	.db $01
	.asc "Faith. It"
	.db $01
	.asc "can be found"
	.db $01
	.asc "in the Demon"
	.db $01
	.asc "Stronghold."
	.db $ff
	.db $42 $1e
	.db $fe $fd

	.db $02 $01
	.asc "The entrance"
	.db $01
	.asc "to the strong-"
	.db $01
	.asc "hold is in the"
	.db $01
	.asc "southwest"
	.db $01
	.asc "section of the"
	.db $01
	.asc "prison. May"
	.db $01
	.asc "God be with"
	.db $01
	.asc "you."
	.db $ff
	.db $42 $0f
	.db $fe $7f

@npcText_6578:
	.db $02 $00
	.asc "You have all"
	.db $01
	.asc "six pieces of"
	.db $01
	.asc "the Armor of"
	.db $01
	.asc "God. You must"
	.db $01
	.asc "now be strong"
	.db $01
	.asc "and defeat the"
	.db $01
	.asc "source of evil."
	.db $ff
	.db $42 $0f
	.db $fe $7f


; ==============================================================================
; ENTID_QUIZ_ANGEL
; ==============================================================================
npc84_scripts:
	npc_endIfSimilarIDNpcExists
	npc_jumpIfMoreThanParam1HealthGotten $04, ++
	npc_jumpIfMoreThanParam1HealthGotten $02, +
	npc_jumpIfRandomNumLTparam $15, @func_660f
	npc_end
+
	npc_jumpIfRandomNumLTparam $09, @func_660f
	npc_end
++
	npc_jumpIfNumBirdsGotten 50, ++
	npc_jumpIfNumBirdsGotten 10, +
	npc_jumpIfRandomNumLTparam $10, @func_660f
	npc_end
+
	npc_jumpIfRandomNumLTparam $09, @func_660f
	npc_end
++
	npc_jumpIfNumBirdsGotten 200, func_02_6618@npc_end
	npc_jumpIfRandomNumLTparam $05, @func_660f
	npc_end

@func_660f:
	npc_call func_02_6618
	npc_set4_cb60
	npc_quiz $ff $05 $01

@end:
	npc_end


func_02_6618:
	npc_jumpIfRandomNumLTparam $80, ++
	npc_jumpIfRandomNumLTparam $80, +
	npc_setCoords $00 $50
	npc_faceRight
	npc_jump @func_663d
+
	npc_setCoords $e0 $50
	npc_faceLeft
	npc_jump @func_663d
++
	npc_jumpIfRandomNumLTparam $80, +
	npc_setCoords $70 $00
	npc_faceDown
	npc_jump @func_663d
+
	npc_setCoords $70 $90
	npc_faceUp
@func_663d:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_set5_cb60
	npc_set2_cbe4
	npc_res4_cb60
	npc_moveByParamPixels $18
@func_6645:
	npc_moveByParamPixels $04
	npc_jumpIfRandomNumLTparam $c0, +
-
	npc_facePlayerHorizontally
	npc_moveByParamPixels $04
	.db $11
	npc_moveByParamPixels $04
	npc_jumpIfRandomNumLTparam $20, -
+
	npc_jumpIfRandomNumLTparam $40, @func_6662
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnRight
	npc_jump @func_6662
+
	npc_turnLeft
@func_6662:
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @done
	npc_loopAboveParamTimes $5a, @func_6645
	npc_wait $0f
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @done
@npc_end:
	npc_end
@done:
	npc_ret


; ==============================================================================
; ENTID_SLUMS_DOG
; ==============================================================================
npc85_scripts:
	npc_call func_02_6697
	npc_setMovementSpeed $01
	npc_waitRandomValBetween2ParamsInclusive $05 $0a
-
	npc_jumpIfRandomNumLTparam $c0, +
	npc_setNewNpcID ENTID_SLUMS_DOG_CHARGING
+
	npc_call func_02_669d
	npc_jump -


; ==============================================================================
; ENTID_SLUMS_DOG_CHARGING
; ==============================================================================
npc86_scripts:
	npc_call func_02_6697
	npc_setMovementSpeed $02
	npc_callCommonSoundFuncs_6c01 $0a $18
	npc_moveToPlayersXandFacePlayerHorizontally
	npc_moveToPlayersYandFacePlayerVertically
	npc_setNewNpcID ENTID_SLUMS_DOG


npc87_scripts:
	npc_call func_02_6697
	npc_wait $14
	npc_setNewNpcID ENTID_SLUMS_DOG_CHARGING


func_02_6697:
	npc_res4_cb60
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setDamageTaken $02
	npc_ret


func_02_669d:
	npc_jumpIfRandomNumLTparam $80, ++
	npc_jumpIfRandomNumLTparam $80, +
	npc_offsetNPCCoordsBy1_turnRight
	npc_jump @func_66ae
+
	npc_offsetNPCCoordsBy1_turnLeft
	npc_jump @func_66ae
++
	npc_turnBackwards
@func_66ae:
	npc_jumpIfRandomNumLTparam $80, +
	npc_moveByParamPixels $20
	npc_ret
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_moveByParamPixels $40
	npc_ret
+
	npc_moveByParamPixels $80
	npc_ret


npc88_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_set5_cb60
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_res4_cb60
-
	npc_moveByParamPixels $20
	npc_turnBackwards
	npc_jump -


npc89_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_set2_cbe4
	npc_res4_cb60
@loop:
	npc_moveByParamPixels $10
	npc_resetBit5ofNPC2ndByte_jumpIfNZ ++
	npc_flipBit4ofNPC2ndByte_jumpIfNZ +
	npc_jump @loop
+
	npc_turnBackwards
	npc_jump @loop
++
	npc_displayTextScreen @text_66f0
-
	npc_moveByParamPixels $10
	npc_flipBit4ofNPC2ndByte_jumpIfNZ +
	npc_jump ++
+
	npc_turnBackwards
++
	npc_resetBit5ofNPC2ndByte_jumpIfNZ -
	npc_jump @loop

@text_66f0:
	.db $04 $05
	.asc "QUACK!"
	.db $ff
	.db $42 $0f $7f


npc8a_scripts:
	npc_setCoords $10 $20
	npc_set5_cb60
	npc_set6_cb60_reset_cb6c
	npc_faceRight
	npc_setMovementSpeed $10
	npc_wait $01
-
	npc_jumpIfAtTile $4c, +
	npc_wait $01
	npc_jump -
+
	npc_moveByParamPixels $10
	npc_loopAboveParamTimes $0b, -
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_placeTile $00 $0e $02
	npc_placeTile $cd $0e $02
	npc_end


npc8b_scripts:
	npc_c02a_equFF
	npc_startScrollingText @text
	npc_end

@text:
	.db $03 $02
	.asc "- SUPER SECRET BONUS ROOM -"
	.db $ff

	.db $05 $04
	.asc "Game Design "
	.db $26
	.asc " Programming"
	.db $ff

	.db $06 $0e
	.asc "Jim"
	.db $ff

	.db $07 $0d
	.asc "Vance"
	.db $ff

	.db $08 $0f
	.db "&"
	.db $ff

	.db $09 $0c
	.asc "Charles"
	.db $ff

	.db $0b $05
	.asc "Artwork by the amazing"
	.db $ff

	.db $0c $0e
	.asc "Nina"
	.db $ff

	.db $0e $05
	.asc "Music & Sound Effects"
	.db $ff

	.db $0f $0d
	.asc "Roger"
	.db $ff

	.db $10 $0f
	.asc "&"
	.db $ff

	.db $11 $0d
	.asc "Vance"
	.db $ff $7f


; ==============================================================================
; ENTID_SLUMS_BIKER
; ==============================================================================
npc8c_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_res4_cb60
	npc_setDamageTaken $02
	npc_setMovementSpeed $03
	npc_waitRandomValBetween2ParamsInclusive $05 $0a
-
	npc_moveByParamPixels $ff
	npc_jumpIfRandomNumLTparam $aa, +
	npc_turnBackwards
	npc_jump -
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_offsetNPCCoordsBy1_turnRight
	npc_jump -
+
	npc_offsetNPCCoordsBy1_turnLeft
	npc_jump -


npc8d_scripts:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_set7_cb60
	npc_res4_cb60
	npc_setDamageTaken $03
	npc_setMovementSpeed $03
-
	npc_moveByParamPixels $40
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	npc_jump -
+
	npc_turnRight
	npc_jump -


npc8e_scripts:
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_res4_cb60
	npc_setDamageTaken $03
	npc_setMovementSpeed $02
	npc_set7_cb60
	npc_waitRandomValBetween2ParamsInclusive $05 $0a
@loop:
	npc_moveByParamPixels $10
	npc_flipBit4ofNPC2ndByte_jumpIfNZ +
	npc_jump @loop
+
	npc_spawnNPCinFrontOfSelf $8f
	npc_wait $02
	npc_moveByParamPixels $10
	npc_flipBit4ofNPC2ndByte_jumpIfNZ +
	npc_jump @loop
+
	npc_jumpIfRandomNumLTparam $aa, +
	npc_turnBackwards
	npc_jump @loop
+
	npc_jumpIfRandomNumLTparam $80, +
	.db $0a
	npc_jump @loop
+
	npc_offsetNPCCoordsBy1_turnLeft
	npc_jump @loop


npc8f_scripts:
	npc_jumpIfAtTile $48, +
	npc_setMovementSpeed $10
	npc_set5_cb60
	npc_turnBackwards
	npc_moveByParamPixels $0a
	npc_turnBackwards
	.db $02
	npc_jumpIfAtTile $48, +
	npc_end
+
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_setDamageTaken $02
	npc_setMovementSpeed $02
	npc_placeTile $00 $80 $80
	npc_res4_cb60
	npc_moveByParamPixels $10
	npc_placeTile $48 $80 $80
	npc_end


; ==============================================================================
; ENTID_SLUMS_GANGSTER
; ==============================================================================
npc91_scripts:
	npc_setDamageTaken $02
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_res4_cb60
-
	npc_call func_02_6866
	npc_call func_02_6877
	npc_call func_02_6886
	npc_jump -

func_02_6866:
	npc_jumpIfRandomNumLTparam $55, func_02_6874
	npc_jumpIfRandomNumLTparam $80, func_02_6871
	npc_setMovementSpeed $03
	npc_ret

func_02_6871:
	npc_setMovementSpeed $01
	npc_ret

func_02_6874:
	npc_setMovementSpeed $02
	npc_ret

func_02_6877:
	npc_jumpIfRandomNumLTparam $55, ++
	npc_jumpIfRandomNumLTparam $80, +
	npc_moveByParamPixels $10
+
	npc_moveByParamPixels $10
++
	npc_moveByParamPixels $10
	npc_ret

func_02_6886:
	npc_jumpIfRandomNumLTparam $40, _npc_end_02_6897
	npc_jumpIfRandomNumLTparam $55, func_02_6896
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	npc_ret
+
	npc_turnRight
	npc_ret

func_02_6896:
	npc_turnBackwards
_npc_end_02_6897:
	npc_ret


npc93_scripts:
	npc_setMovementSpeed $04
	npc_setDamageTaken $03
	npc_res4_cb60
@loop:
	npc_waitRandomValBetween2ParamsInclusive $08 $10
	npc_jumpIfRandomNumLTparam $80, +
	npc_jumpIfRandomNumLTparam $80, ++
	npc_moveByParamPixels $30
+
	npc_moveByParamPixels $30
++
	npc_moveByParamPixels $30
	npc_jumpIfRandomNumLTparam $aa, +
	npc_turnBackwards
	npc_jump @loop
+
	npc_jumpIfRandomNumLTparam $80, @func_68d6
	npc_jumpIfRandomNumLTparam $80, ++
	npc_turnRight
	npc_moveNPC_jumpIfCant $10, +
	npc_jump @loop
+
	npc_turnRight
	npc_jump @loop
++
	npc_turnLeft
	npc_moveNPC_jumpIfCant $10, +
	npc_jump @loop
+
	npc_turnLeft
	npc_jump @loop

@func_68d6:
	npc_jumpIfRandomNumLTparam $80, +
	.db $13
	npc_jump @loop
+
	.db $12
	npc_jump @loop


npc94_scripts:
	npc_setMovementSpeed $02
	npc_setDamageTaken $03
	npc_res4_cb60
	npc_waitRandomValBetween2ParamsInclusive $08 $10
@func_68ea:
	npc_jumpIfRandomNumLTparam $80, @loop
	npc_jumpIfRandomNumLTparam $80, @func_690f
	npc_moveNPC_jumpIfCant $10, @func_690f
	npc_waitRandomValBetween2ParamsInclusive $08 $10
	npc_spawnNPCinFrontOfSelf $95
	npc_jump @func_68ea
@loop:
	npc_jumpIfRandomNumLTparam $80, +
	npc_jumpIfRandomNumLTparam $80, ++
	npc_moveByParamPixels $10
+
	npc_moveByParamPixels $10
++
	npc_moveByParamPixels $10
	npc_jump @func_68ea
@func_690f:
	npc_jumpIfRandomNumLTparam $80, ++
	npc_turnLeft
	npc_moveNPC_jumpIfCant $10, +
	npc_jump @loop
+
	npc_turnLeft
	npc_jump @loop
++
	npc_turnRight
	npc_moveNPC_jumpIfCant $10, +
	npc_jump @loop
+
	npc_turnRight
	npc_jump @loop


npc95_scripts:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_set5_cb60
	npc_res4_cb60
	npc_setMovementSpeed $04
	npc_setDamageTaken $03
	npc_moveByParamPixels $ff
	npc_end


npc96_scripts:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $02
	npc_setDamageTaken $03
	npc_res4_cb60
	npc_waitRandomValBetween2ParamsInclusive $08 $10
@loop:
	npc_moveByParamPixels $10
	npc_jumpIfAtTile $a0, @func_698e
	npc_jumpIfAtTile $74, @func_6993
	npc_moveNPC_jumpIfCant $10, +
	npc_jumpIfRandomNumLTparam $80, +
	npc_jump @loop
+
	npc_jumpIfRandomNumLTparam $10, @func_6977
	npc_jumpIfRandomNumLTparam $80, ++
	npc_offsetNPCCoordsBy1_turnLeft
	npc_moveNPC_jumpIfCant $10, +
	npc_jump @loop
+
	npc_offsetNPCCoordsBy1_turnLeft
	npc_jump @loop
++
	.db $0a
	npc_moveNPC_jumpIfCant $10, +
	npc_jump @loop
+
	.db $0a
	npc_jump @loop
@func_6977:
	npc_jumpIfRandomNumLTparam $aa, +
	npc_facePlayerHorizontally
	npc_jump @loop
+
	npc_jumpIfRandomNumLTparam $80, +
	.db $11
	npc_jump @loop
+
	npc_facePlayerHorizontally
	npc_moveByParamPixels $40
	.db $11
	npc_jump @loop
@func_698e:
	npc_faceUp
	npc_moveByParamPixels $08
	npc_setNewNpcID $97
@func_6993:
	npc_setNewNpcID $98


npc97_scripts:
	npc_call func_02_69c0
	npc_placeTile $e5 $80 $80
	npc_call func_02_69b6
	npc_jumpIfRandomNumLTparam $80, +
	npc_faceLeft
	npc_setNewNpcID $96
+
	npc_faceRight
	npc_setNewNpcID $96


npc98_scripts:
	npc_call func_02_69c0
	npc_placeTile $69 $80 $80
	npc_call func_02_69b6
	npc_faceDown
	npc_setNewNpcID $96


func_02_69b6:
-
	npc_callCommonSoundFuncs_6c01 $fb $15
	npc_wait $03
	npc_loopAboveParamTimes $08, -
	npc_ret


func_02_69c0:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_set6_cb60_reset_cb6c
	npc_setDamageTaken $03
	npc_res4_cb60
-
	npc_callCommonSoundFuncs_6c01 $fb $15
	npc_wait $03
	npc_loopAboveParamTimes $08, -
	npc_ret


; ==============================================================================
; ENTID_DRUNK_POLICEMAN
; ==============================================================================
npca7_scripts:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_res4_cb60
	npc_setDamageTaken $02
	npc_wait $0a
--
	npc_setMovementSpeed $02
	npc_moveByParamPixels $40
	npc_turnBackwards
	npc_setMovementSpeed $01
-
	npc_set3_cbe4
	npc_moveByParamPixels $04
	npc_loopAboveParamTimes $0c, -
	npc_jump --


; ==============================================================================
; ENTID_AIRPORT_BALD_THUGS
; ==============================================================================
npca8_scripts:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_res4_cb60
	npc_setDamageTaken $02
	npc_wait $0a
-
	npc_set3_cbe4
	npc_moveByParamPixels $04
	npc_wait $01
	npc_jump -


; ==============================================================================
; ENTID_AIRPORT_SUNGLASSES_GUY
; ==============================================================================
npca9_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_res4_cb60
	npc_setDamageTaken $02
	npc_wait $0a
	npc_setMovementSpeed $03
@loop:
	npc_set3_cbe4
	npc_moveByParamPixels $20
	npc_moveNPC_jumpIfCant $08, +
	npc_waitRandomValBetween2ParamsInclusive $0a $28
	npc_jump @loop
+
	npc_turnBackwards
	npc_moveByParamPixels $20
	npc_jump @loop


npcaa_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_res4_cb60
	npc_setDamageTaken $04
	npc_wait $0a
@loop:
	npc_moveByParamPixels $20
	npc_moveNPC_jumpIfCant $08, +
	npc_jumpIfRandomNumLTparam $40, ++
	npc_jump @loop
+
	npc_turnBackwards
	npc_jump @loop
++
	npc_spawnNPCinFrontOfSelf $ab
	npc_jump @loop


npcab_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $04
	npc_facePlayerHorizontally
	npc_res4_cb60
	npc_moveByParamPixels $ff
	npc_setNewNpcID $7c


; ==============================================================================
; ENTID_SLUMS_ITEM_PLACER
; ==============================================================================
npc99_scripts:
	npc_set5_cb60
	npc_setMovementSpeed $10
@loop:
	npc_moveByParamPixels $10
	npc_call @func_6a62
	npc_loopAboveParamTimes $0f, @loop
	npc_turnRight
	npc_moveByParamPixels $10
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @end
	npc_turnRight
-
	npc_moveByParamPixels $10
	npc_call @func_6a62
	npc_loopAboveParamTimes $0f, -
	npc_turnLeft
	npc_moveByParamPixels $10
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @end
	npc_turnLeft
	npc_jump @loop
@end:
	npc_end
@func_6a62:
	npc_jumpIfRandomNumLTparam $40, +
	npc_ret
+
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $02 $ff $ff
	.dw @checkGroup2tiles

	.db $07 $ff $ff
	.dw @entry1

	.db $04 $ff $ff
	.dw @entry2

	.db $05 $ff $ff
	.dw @entry3

	.db $0b $ff $ff
	.dw @entry4

	.db $ff $ff $ff

@checkGroup2tiles:
// rubble
	npc_jumpIfAtTile $1c, @gotoTable2
// cinderblock
	npc_jumpIfAtTile $48, @gotoTable2
// trash can
	npc_jumpIfAtTile $44, @gotoTable2
// rock
	npc_jumpIfAtTile $4c, @gotoTable2
	npc_ret

@entry1:
	npc_jumpIfAtTile $48, @gotoTable2
	npc_jumpIfAtTile $54, @gotoTable2
	npc_ret

@entry2:
@entry3:
	npc_jumpIfAtTile $48, @gotoTable2
	npc_jumpIfAtTile $e4, @gotoTable2
	npc_ret

@entry4:
	npc_jumpIfAtTile $4c, @gotoTable2
	npc_jumpIfAtTile $80, @gotoTable2
	npc_ret

@gotoTable2:
	npc_groupRoomXYjumpTable @table2
	npc_end

// wait until tile is destroyed
@table2:
	.db $02 $ff $ff
	.dw @2entry0

	.db $07 $ff $ff
	.dw @2entry1

	.db $04 $ff $ff
	.dw @2entry2

	.db $05 $ff $ff
	.dw @2entry3

	.db $0b $ff $ff
	.dw @2entry4

	.db $ff $ff $ff

@2entry0:
-
	npc_wait $01
	npc_jumpIfAtTile $00, @next_6b08
// rough floor
	npc_jumpIfAtTile $68, @next_6b08
	npc_jump -

@2entry1:
-
	npc_wait $01
	npc_jumpIfAtTile $00, @next_6b08
	npc_jumpIfAtTile $dc, @next_6b08
	npc_jump -

@2entry2:
@2entry3:
-
	npc_wait $01
	npc_jumpIfAtTile $00, @next_6b08
	npc_jump -

@2entry4:
-
	npc_wait $01
	npc_jumpIfAtTile $b8, @next_6b03
	npc_jumpIfAtTile $94, @next_6b03
	npc_jump -

@next_6b03:
	npc_wait $08
	npc_jump ++

@next_6b08:
	npc_wait $08
	npc_jumpIfRandomNumLTparam $55, +
// bird
	npc_placeTile $c4 $80 $80
	npc_jump @end2
+
	npc_jumpIfRandomNumLTparam $55, ++
// 3 bombs
	npc_placeTile $d8 $80 $80
	npc_jump @end2
++
	npc_jumpIfRandomNumLTparam $55, +
// bird
	npc_placeTile $d4 $80 $80
	npc_jump @end2
+
// heart
	npc_placeTile $e0 $80 $80

@end2:
	npc_setRoomFlagFrom_cbf0
	npc_end


; ==============================================================================
; ENTID_SLUMS_BOTTOM_MIDDLE_KEY
; ==============================================================================
npc9a_scripts:
	npc_call func_02_4fea
	.db $1b
	npc_callCommonSoundFuncs_6c01 $85 $16
	npc_giveItem ITEMID_SLUMS_BOTTOM_MIDDLE_KEY
	npc_end


; ==============================================================================
; ENTID_SLUMS_GUNMAN_DOOR
; ==============================================================================
npc9b_scripts:
	npc_setMovementSpeed $10
	npc_set5_cb60
@loop:
	npc_moveByParamPixels $10
	npc_flipBit4ofNPC2ndByte_jumpIfNZ +
	npc_jumpIfRandomNumLTparam $c0, ++
	npc_jumpIfRandomNumLTparam $10, +
@innerLoop:
	npc_waitRandomValBetween2ParamsInclusive $04 $10
	npc_jump @loop
+
	npc_turnBackwards
	npc_jump @innerLoop
++
	npc_jumpIfAtTile $c0, +
	npc_jump @innerLoop
+
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @innerLoop
	npc_placeTile $86 $80 $80
	npc_wait $08
	npc_spawnNPCAtOffset ENTID_SLUMS_GUNMAN_IN_DOOR $00 $00
	npc_wait $38
	npc_placeTile $c2 $80 $80
	npc_jump @loop


; ==============================================================================
; ENTID_SLUMS_GUNMAN_IN_DOOR
; ==============================================================================
npc9c_scripts:
	npc_facePlayerHorizontally
	npc_call func_02_58c4
	npc_wait $0c
	npc_set6_cb60_reset_cb6c
	npc_wait $08
	npc_spawnNPCinFrontOfSelf ENTID_DOOR_GUNMAN_BULLET
	npc_wait $1e
	npc_end


; ==============================================================================
; ENTID_DOOR_GUNMAN_BULLET
; ==============================================================================
npca4_scripts:
	npc_callCommonSoundFuncs_6c01 $61 $16
	npc_set5_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_setMovementSpeed $04
	npc_setDamageTaken $03
	npc_moveByParamPixels $ff
	npc_setNewNpcID ENTID_SLUMS_BULLET_EXPLOSION


npca5_scripts:
	npc_call func_02_58c4
-
	npc_call func_02_58cc
	npc_set6_cb60_reset_cb6c
	npc_wait $08
	npc_spawnNPCinFrontOfSelf $a4
	.db $16
	npc_waitRandomValBetween2ParamsInclusive $0c $18
	npc_jump -


npca6_scripts:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_res4_cb60
	npc_setDamageTaken $02
-
	npc_call func_02_6bae
	npc_moveByParamPixels $ff
	npc_turnBackwards
	npc_jump -

func_02_6bae:
	npc_jumpIfRandomNumLTparam $80, func_02_6bb9
	npc_jumpIfRandomNumLTparam $80, func_02_6bbc
	npc_setMovementSpeed $02
	npc_ret

func_02_6bb9:
	npc_setMovementSpeed $03
	npc_ret

func_02_6bbc:
	npc_setMovementSpeed $04
	npc_ret


npc9d_scripts:
	npc_set5_cb60
	npc_call func_02_4fed
	npc_setMovementSpeed $10
	npc_moveByParamPixels $10
	npc_faceDown
	npc_moveByParamPixels $10
	npc_set2_cb60
	npc_setMovementSpeed $01
	npc_faceUp
	npc_moveByParamPixels $20
	npc_jump npc82_scripts


npca1_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_res4_cb60
	npc_set1_cbe4
-
	npc_giveItem ITEMID_30
	npc_wait $01
	npc_jump -


;;
	npc_takeItem ITEMID_31 // 6bde
	npc_set6_cb60_reset_cb6c // 6be0
	npc_cb60_low2bitsEquParamMinus1 $04 // 6be1
	npc_setDamageTaken $04 // 6be3
	npc_res4_cb60 // 6be5
	npc_call $6c14 // 6be6
	npc_callCommonSoundFuncs_6c01 $26 $16 // 6be9
	npc_wait $0a // 6bec
	npc_loopAboveParamTimes $0a, $6be6 // 6bee
	npc_giveItem ITEMID_31 // 6bf2
	npc_set_c059 $ff // 6bf4
	npc_callCommonSoundFuncs_6d6c $03 $ff // 6bf6
	npc_placeTile $00 $ff $81 // 6bf9
	npc_placeTile $00 $80 $81 // 6bfd
	npc_placeTile $00 $ff $82 // 6c01
	npc_placeTile $00 $80 $82 // 6c05
	npc_placeTile $00 $ff $83 // 6c09
	npc_placeTile $00 $80 $83 // 6c0d
	npc_set_c059 $00 // 6c11
	npc_end // 6c13

// 6c14
	npc_wait $0c // 6c14
	npc_spawnNPCAtOffset $a1 $00 $f8 // 6c16
	npc_takeItem ITEMID_30 // 6c1a
	npc_wait $03 // 6c1c
	npc_jumpIfItemGotten ITEMID_30, $6c1a // 6c1e
	npc_ret // 6c22
	npc_set6_cb60_reset_cb6c // 6c23
	npc_setDamageTaken $04 // 6c24
	npc_set3_cb60 // 6c26
	npc_set2_cbe4 // 6c27
	npc_res4_cb60 // 6c28
	npc_wait $05 // 6c29
	npc_wait $01 // 6c2b
	npc_jumpIfItemGotten ITEMID_31, $6c34 // 6c2d
	npc_jump $6c2b // 6c31
	npc_end // 6c34
	npc_set6_cb60_reset_cb6c // 6c35
	npc_cb60_low2bitsEquParamMinus1 $04 // 6c36
	npc_setDamageTaken $04 // 6c38
	npc_set3_cb60 // 6c3a
	npc_res4_cb60 // 6c3b
	npc_wait $05 // 6c3c
	npc_wait $01 // 6c3e
	npc_jumpIfItemGotten ITEMID_31, $6c47 // 6c40
	npc_jump $6c3e // 6c44
	npc_end // 6c47


; ==============================================================================
; ENTID_PERMANENTLY_REMOVABLE_OBSTACLE
; ==============================================================================
npca2_scripts:
	npc_groupRoomXYjumpTable @table
	npc_jump @func_6c73

@table:
	.db $03 $02 $00
	.dw @indoorSlums

	.db $07 $01 $06
	.dw @entry1

	.db $07 $02 $07
	.dw @entry2

	.db $ff $ff $ff

@indoorSlums:
	npc_jumpIfItemGotten ITEMID_BRICK_WALL_SLUMS_1ST_HOUSE, npca3_scripts
	npc_set1_cbe4
	npc_jump @func_6c73

@entry1:
	npc_jumpIfItemGotten ITEMID_2e, npca3_scripts
	npc_jump @func_6c73

@entry2:
	npc_jumpIfItemGotten ITEMID_2f, npca3_scripts

@func_6c73:
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_res4_cb60
	npc_set7_npc2ndByteLower6Bits
-
	npc_jumpIfLampOn +
	npc_wait $01
	npc_jump -
+
	npc_increaseScore SCORE_200
	npc_groupRoomXYjumpTable @table2
	npc_jump @func_6c9f

@table2:
	.db $03 $ff $ff
	.dw @2entry0

	.db $07 $ff $ff
	.dw @2entry1

	.db $ff $ff $ff

@2entry0:
	npc_placeTile $2f $80 $80
	npc_jump @func_6c9f

@2entry1:
	npc_placeTile $57 $80 $80

@func_6c9f:
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $26
	npc_jump npc82_scripts


; ==============================================================================
; ENTID_PERMANENTLY_REMOVED_OBSTACLE
; ==============================================================================
npca3_scripts:
	npc_placeTile $00 $80 $80
	npc_groupRoomXYjumpTable @table
	npc_jump +

@func_6cb0:
	npc_increaseScore SCORE_500
+
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_set2_cbe4
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_res4_cb60
	.db $16
	npc_end

@table:
	.db $03 $02 $00
	.dw @entry0

	.db $07 $01 $06
	.dw @entry1

	.db $07 $02 $07
	.dw @entry2

	.db $ff $ff $ff

@entry0:
	npc_giveItem ITEMID_BRICK_WALL_SLUMS_1ST_HOUSE
	npc_jump @func_6cb0

@entry1:
	npc_giveItem ITEMID_2e
	npc_jump @func_6cb0

@entry2:
	npc_giveItem ITEMID_2f
	npc_jump @func_6cb0


npc9e_scripts:
	npc_set2_cbe4
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_set5_cb60
	npc_setMovementSpeed $10
-
	npc_giveItem ITEMID_30
	npc_waitRandomValBetween2ParamsInclusive $03 $06
	npc_takeItem ITEMID_30
	npc_jumpIfRandomNumLTparam $0a, @setID_b0
	npc_jumpIfRandomNumLTparam $80, +
	npc_call @func_6cfc
	npc_jump -
+
	npc_call @func_6d34
	npc_jump -

@func_6cfc:
	npc_faceRight
	npc_moveNPC_jumpIfCant $18, @done
	npc_placeTile $00 $ff $81
	npc_placeTile $00 $ff $82
	npc_placeTile $00 $ff $83
	npc_placeTile $a6 $80 $81
	npc_placeTile $e6 $80 $82
	npc_placeTile $ce $80 $83
	npc_placeTile $aa $81 $81
	npc_placeTile $ea $81 $82
	npc_placeTile $d2 $81 $83
	npc_placeTile $00 $82 $81
	npc_placeTile $00 $82 $82
	npc_placeTile $00 $82 $83
	npc_moveByParamPixels $10
@done:
	npc_ret

@func_6d34:
	npc_faceLeft
	npc_moveNPC_jumpIfCant $18, @done
	npc_placeTile $00 $fd $81
	npc_placeTile $00 $fd $82
	npc_placeTile $00 $fd $83
	npc_placeTile $a6 $fe $81
	npc_placeTile $e6 $fe $82
	npc_placeTile $ce $fe $83
	npc_placeTile $aa $ff $81
	npc_placeTile $ea $ff $82
	npc_placeTile $d2 $ff $83
	npc_placeTile $00 $80 $81
	npc_placeTile $00 $80 $82
	npc_placeTile $00 $80 $83
	npc_moveByParamPixels $10
	npc_ret
@setID_b0:
	npc_setNewNpcID $b0


npcb0_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_callCommonSoundFuncs_6c01 $ae $15
	npc_wait $3c
	npc_setNewNpcID $9e


npc9f_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_set3_cb60
	npc_res4_cb60
-
	.db $55 $9e
	.db $55 $b0
	npc_addParamsToXthenYCoords $14 $14
	npc_faceRight
	npc_jumpIfItemGotten ITEMID_33, _npc_end_02_6ebd
	npc_wait $01
	npc_jump -


npca0_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_set3_cb60
	npc_res4_cb60
-
	.db $55 $9e
	.db $55 $b0
	npc_addParamsToXthenYCoords $ec $14
	npc_faceLeft
	npc_jumpIfItemGotten ITEMID_33, _npc_end_02_6ebd
	npc_wait $01
	npc_jump -


npcad_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_set3_cb60
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_res4_cb60
@loop:
	.db $55 $9e
	.db $55 $b0
	npc_addParamsToXthenYCoords $1c $22
	npc_faceRight
	npc_wait $01
	npc_jumpIfItemGotten ITEMID_30, +
	npc_jumpIfItemGotten ITEMID_33, _npc_end_02_6ebd
	npc_jump @loop
+
	npc_jumpIfRandomNumLTparam $fb, @loop
	npc_set6_cb60_reset_cb6c
	npc_spawnNPCAtOffset $b3 $00 $0c
	npc_jump @loop


npcae_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_set3_cb60
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_res4_cb60
@loop:
	.db $55 $9e
	.db $55 $b0
	npc_addParamsToXthenYCoords $e4 $22
	npc_faceLeft
	npc_wait $01
	npc_jumpIfItemGotten ITEMID_30, +
	npc_jumpIfItemGotten ITEMID_33, _npc_end_02_6ebd
	npc_jump @loop
+
	npc_jumpIfRandomNumLTparam $fb, @loop
	npc_set6_cb60_reset_cb6c
	npc_spawnNPCAtOffset $b3 $00 $0c
	npc_jump @loop


npcaf_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set3_cb60
	npc_res4_cb60
	npc_set2_cb60
	npc_set5_cb60
	npc_setMovementSpeed $02
@loop:
	.db $12
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_jumpIfItemGotten ITEMID_33, _npc_end_02_6ebd
	npc_wait $01
	npc_jump @loop
+
	npc_wait $37
	npc_jump @loop


npcb1_scripts:
	npc_takeItem ITEMID_30
	npc_takeItem ITEMID_31
	npc_takeItem ITEMID_32
	npc_takeItem ITEMID_33
@loop:
	npc_jumpIfItemGotten ITEMID_32, +
	npc_wait $01
	npc_jump @loop
+
	npc_wait $0a
	npc_loopAboveParamTimes $07, @loop
	npc_giveItem ITEMID_33
	npc_end


npcb2_scripts:
	npc_set2_cbe4
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_set5_cb60
	npc_callCommonSoundFuncs_6c01 $26 $16
	npc_increaseScore SCORE_5000
	npc_placeTile $a7 $ff $81
	npc_placeTile $e7 $ff $82
	npc_placeTile $cf $ff $83
	npc_placeTile $ab $80 $81
	npc_placeTile $eb $80 $82
	npc_placeTile $d3 $80 $83
-
	npc_callCommonSoundFuncs_6c01 $26 $16
	npc_wait $0a
	npc_loopAboveParamTimes $06, -
	npc_giveItem ITEMID_32
	npc_wait $05
	npc_callCommonSoundFuncs_6c01 $26 $16
	npc_takeItem ITEMID_32
	npc_callCommonSoundFuncs_6c01 $26 $16
	npc_wait $0a
	npc_callCommonSoundFuncs_6c01 $26 $16
	npc_jumpIfItemGotten ITEMID_33, +
	npc_setNewNpcID $9e
+
	npc_set_c059 $ff
	npc_placeTile $00 $ff $81
	npc_placeTile $00 $ff $82
	npc_placeTile $00 $ff $83
	npc_placeTile $00 $80 $81
	npc_placeTile $00 $80 $82
	npc_placeTile $00 $80 $83
	npc_placeTile $00 $81 $81
	npc_placeTile $00 $81 $82
	npc_placeTile $00 $81 $83
	npc_placeTile $00 $82 $81
	npc_placeTile $00 $82 $82
	npc_placeTile $00 $82 $83
	.db $04
	npc_wait $08
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_set_c059 $ff
	npc_wait $80
	npc_teleportPlayer @data
	npc_end

@data:
// group - room x - room y - player x - player y
	.db $10 $03 $04 $48 $94


npcb3_scripts:
	npc_res4_cb60
	npc_callCommonSoundFuncs_6c01 $04 $16
	npc_set5_cb60
	npc_setMovementSpeed $03
	npc_setDamageTaken $04
-
	npc_moveByParamPixels $04
	npc_set3_cbe4
	npc_moveByParamPixels $04
	npc_set3_cbe4
	npc_loopAboveParamTimes $3c, -
	npc_wait $0f

_npc_end_02_6ebd:
	npc_end


npcb9_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
	npc_call func_02_6f2a
	npc_end


npcba_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
	npc_call func_02_6f2a
	npc_giveArmorOfGod AOG_BELT
	npc_giveItem ITEMID_BELT
	npc_end


npcbb_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
	npc_call func_02_6f2a
	npc_giveArmorOfGod AOG_BELT
	npc_giveItem ITEMID_BELT
	npc_giveArmorOfGod AOG_ARMOUR
	npc_giveItem ITEMID_ARMOUR
	npc_end


npcbc_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
	npc_call func_02_6f2a
	npc_giveArmorOfGod AOG_BELT
	npc_giveItem ITEMID_BELT
	npc_giveArmorOfGod AOG_ARMOUR
	npc_giveItem ITEMID_ARMOUR
	npc_giveArmorOfGod AOG_BOOTS
	npc_end


npcbd_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
	npc_call func_02_6f2a
	npc_giveArmorOfGod AOG_BELT
	npc_giveItem ITEMID_BELT
	npc_giveArmorOfGod AOG_ARMOUR
	npc_giveItem ITEMID_ARMOUR
	npc_giveArmorOfGod AOG_BOOTS
	npc_giveArmorOfGod AOG_HELM
	npc_end


npcbe_scripts:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_call func_02_4fea
	npc_callCommonSoundFuncs6638
	npc_call func_02_6f2a
	npc_giveArmorOfGod AOG_BELT
	npc_giveItem ITEMID_BELT
	npc_giveArmorOfGod AOG_ARMOUR
	npc_giveItem ITEMID_ARMOUR
	npc_giveArmorOfGod AOG_BOOTS
	npc_giveArmorOfGod AOG_SWORD
	npc_giveArmorOfGod AOG_HELM
	npc_end


func_02_6f2a:
-
	npc_giveFruit $04
	npc_giveFruit $03
	npc_giveFruit $02
	npc_giveFruit FRUIT_POMEGRANATE
	npc_giveFruit $00
	npc_loopAboveParamTimes $04, -
	npc_giveSpecialBItem $01
	npc_giveSpecialBItem $02
	npc_giveSpecialBItem $04
	npc_giveSpecialBItem $08
-
	.db $19
	npc_loopAboveParamTimes $0c, -
	npc_addToPlayerHealth $ff
	npc_giveNumBirds $ff
	npc_giveNumBombs $ff
-
	.db $1b
	npc_loopAboveParamTimes $3f, -
	npc_incAnointingOilsGotten
	npc_incAnointingOilsGotten
	npc_ret
