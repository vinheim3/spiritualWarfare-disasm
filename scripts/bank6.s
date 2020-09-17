npcbf_scripts:
npcc1_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $05
	npc_call func_06_14d9
-
	npc_call func_06_1509
	npc_loadParamInto_cb78 $02
	npc_jump -


npcc0_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $08
	npc_setNewNpcID $c1


npce3_scripts:
	npc_res4_cb60
	npc_call func_06_14d9
	npc_faceDown
	npc_loadInto_cba8 $10
@loop:
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	.db $0a
	.db $0a
	npc_loadInto_cba8 $20
	npc_jump @loop
+
	npc_turnRight
	npc_offsetNPCCoordsBy1_turnLeft
	npc_offsetNPCCoordsBy1_turnLeft
	npc_loadInto_cba8 $20
	npc_jump @loop


npce4_scripts:
	npc_set3_cb60
	npc_res4_cb60
	.db $2d
-
	npc_loadParamInto_cb78 $02
	npc_jump -


npce5_scripts:
-
	npc_set3_cb60
	npc_res4_cb60
	.db $2d
	npc_spawnNPCAtOffset $e3 $00 $00
	npc_loadParamInto_cb78 $14
	npc_loopAboveParamTimes $05, -
	.db $c7 $f1 $80 $80
	npc_setRoomFlagFrom_cbf0
	npc_end


npce6_scripts:
	npc_jumpIfArmorOfGodGotten $10, @armorGotten
	npc_res4_cb60
	.db $51 $30
	npc_loadParamInto_cb78 $0a
@loop:
	npc_lowNybbleOf_cb54_equParamMinus1 $03
	npc_faceDown
-
	npc_loadInto_cba8 $ff
	npc_jumpIfAtTile $f0, +
	npc_jump -
+
	npc_faceLeft
	npc_set5_cb60
-
	npc_jumpIfAtTile $14, +
	npc_loadInto_cba8 $10
	npc_jump -
+
	npc_moveNPC_jumpIfCant $06, +
	npc_loadParamInto_cb78 $37
	npc_moveNPC_jumpIfCant $06, +
	npc_jump @couldMove
+
	npc_giveItem $30
	npc_spawnNPCAtOffset $e7 $f0 $00
	.db $c7 $00 $06 $09
	npc_set5_cb60
	npc_lowNybbleOf_cb54_equParamMinus1 $04
	npc_faceRight
	npc_loadInto_cba8 $10
	.db $02
	npc_loadParamInto_cb78 $03
	npc_faceUp
	npc_loadInto_cba8 $30
	npc_faceRight
	npc_loadInto_cba8 $20
	npc_loadParamInto_cb78 $03
	.db $13
	.db $13
	npc_faceRight
	npc_loadParamInto_cb78 $03
	.db $51 $30
	.db $c7 $30 $06 $00
	npc_jump @loop
@couldMove:
	npc_loadParamInto_cb78 $0f
	npc_lowNybbleOf_cb54_equParamMinus1 $02
	npc_faceRight
	npc_loadInto_cba8 $10
	npc_faceUp
	npc_loadInto_cba8 $40
	npc_faceRight
	npc_loadInto_cba8 $10
	npc_faceUp
	npc_loadInto_cba8 $30
	npc_faceLeft
	npc_loadInto_cba8 $30
	npc_faceUp
	npc_loadInto_cba8 $30
	npc_callCommonSoundFuncs_6c01 $d7 $15
@armorGotten:
	.db $c7 $00 $0d $08
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_end


npce7_scripts:
	npc_set7_cb60
	npc_set3_cb60
	npc_set5_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_lowNybbleOf_cb54_equParamMinus1 $0d
-
	npc_jumpIfItemGotten $30, +
	npc_jump ++
+
	.db $55 $e6
	npc_loadInto_cba8 $0d
	npc_jump -
++
	npc_loadInto_cba8 $13
	npc_lowNybbleOf_cb54_equParamMinus1 $0c
	npc_faceRight
	npc_moveHorizontallyToPlayer
	npc_resetNPC2ndByteBit5_jumpIfOrigSet $0ed4
+
	npc_loadParamInto_cb78 $01
-
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @func_0ee2
	npc_loadInto_cba8 $04
	npc_loopAboveParamTimes $14, -
@func_0ee2:
	npc_loadInto_cba8 $10
	npc_jumpIfAtTile $14, @func_0ee2
	.db $2a
	npc_end
+
	npc_callCommonSoundFuncs_6c01 $68 $17
	npc_faceLeft
	npc_lowNybbleOf_cb54_equParamMinus1 $08
	npc_loadInto_cba8 $20
	.db $02
	npc_loadInto_cba8 $ff
	npc_loadParamInto_cb78 $05
	.db $2a
	npc_end


npcec_scripts:
	npc_set3_cb60
	npc_res4_cb60
	npc_set6_cb60_reset_cb6c
	.db $16
	npc_giveItem $2a
	npc_end


npceb_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_lowNybbleOf_cb54_equParamMinus1 $01
	npc_set5_cb60
-
	.db $29
	npc_loadInto_cba8 $04
	npc_jumpIfAtTile $08, +
	npc_jumpIfAtTile $7c, ++
	npc_resetBit5ofNPC2ndByte_jumpIfNZ ++++
	npc_jumpIfAtTile $00, +++
	npc_jump -
+
	npc_giveItem $30
	npc_loadParamInto_cb78 $03
	npc_end
++
	npc_giveItem $31
	npc_loadParamInto_cb78 $03
	npc_end
+++
	.db $11
	.db $02
	npc_loadInto_cba8 $10
	.db $2a
	npc_giveItem $2a
	npc_end
++++
	.db $29
	npc_lowNybbleOf_cb54_equParamMinus1 $02
	npc_moveHorizontallyToPlayer
	npc_loadInto_cba8 $04
	.db $11
	npc_loadInto_cba8 $04
	.db $2a
	npc_giveItem $2a
	npc_end


npcea_scripts:
	npc_jumpIfArmorOfGodGotten $04, _npc_end_06_1051
	npc_res4_cb60
	npc_lowNybbleOf_cb54_equParamMinus1 $04
	npc_loadParamInto_cb78 $0f
	npc_faceLeft
	npc_loadInto_cba8 $10
@loop:
	.db $51 $30
	.db $51 $31
	.db $51 $2a
	.db $04
	npc_set5_cb60
	npc_loadParamInto_cb78 $14
	npc_jumpIfRandomNumLTparam $80, +
	npc_jumpIfRandomNumLTparam $80, +
	npc_jumpIfRandomNumLTparam $80, @func_0fc8
	npc_jump @func_0fde
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_jumpIfRandomNumLTparam $80, @func_0f9c
	npc_jump @func_0fb2
+
	npc_jumpIfRandomNumLTparam $80, +
	npc_jump @func_0f86
+
	npc_setCoords $c0 $80
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset $e8 $00 $00
	npc_giveItem $2a
++
	npc_setCoords $40 $40
	npc_jump @func_0ff4

@func_0f86:
	npc_setCoords $10 $60
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset $e8 $00 $00
	npc_giveItem $2a
++
	npc_setCoords $90 $70
	npc_jump @func_0ff4

@func_0f9c:
	npc_setCoords $70 $40
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset $e8 $00 $00
	npc_giveItem $2a
++
	npc_setCoords $30 $40
	npc_jump @func_0ff4

@func_0fb2:
	npc_setCoords $50 $50
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset $e8 $00 $00
	npc_giveItem $2a
++
	npc_setCoords $d0 $40
	npc_jump @func_0ff4

@func_0fc8:
	npc_setCoords $e0 $50
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset $e8 $00 $00
	npc_giveItem $2a
++
	npc_setCoords $50 $70
	npc_jump @func_0ff4

@func_0fde:
	npc_setCoords $90 $40
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset $e8 $00 $00
	npc_giveItem $2a
++
	npc_setCoords $20 $60
	npc_jump @func_0ff4

@func_0ff4:
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	.db $51 $2a
	npc_spawnNPCAtOffset $e9 $00 $00
	npc_jump @func_100b
++
	npc_jumpIfItemGotten $2a, @func_100b
	npc_jump @end

@func_100b:
	npc_setCoords $10 $20
	npc_faceRight
	npc_res4_cb60
	.db $02
	.db $12
	.db $51 $30
	.db $51 $31
	.db $51 $2a
	npc_spawnNPCAtOffset $eb $00 $00
-
	npc_loadParamInto_cb78 $0a
	npc_jumpIfItemGotten $30, +
	npc_jumpIfItemGotten $31, +
	npc_jumpIfItemGotten $2a, +
	npc_jump -
+
	npc_faceLeft
	npc_loadInto_cba8 $ff

@end:
	npc_jump @loop


npce8_scripts:
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_set2_cb60
	npc_res4_cb60
	.db $c7 $08 $80 $80
-
	npc_loadParamInto_cb78 $01
	npc_jumpIfItemGotten $30, ++
	npc_jumpIfItemGotten $31, +
	npc_loopAboveParamTimes $a5, -
+
	.db $c7 $1c $80 $80
	npc_jump _npc_end_06_1051
++
	.db $2a

_npc_end_06_1051:
	npc_end


npce9_scripts:
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_set2_cb60
	npc_res4_cb60
	.db $c7 $7c $80 $80
-
	npc_loadParamInto_cb78 $01
	npc_jumpIfItemGotten $31, ++
	npc_jumpIfItemGotten $30, +
	npc_loopAboveParamTimes $a5, -
+
	.db $c7 $1c $80 $80
	npc_jump _npc_end_06_1070
++
	.db $2a

_npc_end_06_1070:
	npc_end


npcf1_scripts:
	npc_jumpIfArmorOfGodGotten $08, _npc_end_06_1070
	npc_set6_cb60_reset_cb6c
	npc_paramLowNybbleIs_cb54_highNybble $06
	npc_set5_cb60
	npc_lowNybbleOf_cb54_equParamMinus1 $08
	npc_res4_cb60
	npc_faceRight
@loop:
	npc_loadInto_cba8 $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_loadInto_cba8 $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_loadInto_cba8 $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_jumpIfRandomNumLTparam $64, +
	npc_jump ++
+
	.db $29
	npc_loadInto_cba8 $30
	npc_faceUp
	npc_loadInto_cba8 $ff
	npc_faceDown
	npc_loadInto_cba8 $40
	npc_faceRight
++
	npc_jumpIfRandomNumLTparam $80, +
	npc_faceLeft
+
	npc_loadInto_cba8 $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_loadInto_cba8 $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_jump @loop
@func_10af:
	npc_spawnNPCAtOffset $c8 $00 $00
	npc_loadParamInto_cb78 $05
	.db $04
	npc_setNewNpcID $f2


npcf2_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set5_cb60
	npc_setCoords $80 $40
	npc_lowNybbleOf_cb54_equParamMinus1 $04
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
+
	npc_moveHorizontallyToPlayer
	npc_turnBackwards
	npc_spawnNPCAtOffset $c8 $00 $00
	npc_callCommonSoundFuncs_6c01 $26 $16
	npc_loadParamInto_cb78 $0a
	npc_loadInto_cba8 $10
	npc_callCommonSoundFuncs_6c01 $26 $16
	npc_res4_cb60
	npc_loadInto_cba8 $40
	npc_lowNybbleOf_cb54_equParamMinus1 $04
	npc_faceLeft
	npc_lowNybbleOf_cb54_equParamMinus1 $06
	npc_setNewNpcID $f1


npced_scripts:
	npc_loadParamInto_cb78 $0a
	npc_set5_cb60
	npc_paramLowNybbleIs_cb54_highNybble $08
	npc_set2_cb60
	npc_lowNybbleOf_cb54_equParamMinus1 $04
	npc_loadParamInto_cb78 $07
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $c7 $00 $80 $80
	npc_loadParamInto_cb78 $08
	npc_faceDown
	npc_loadInto_cba8 $40
-
	npc_jumpIfAtTile $00, +
@func_10f5:
	npc_loadInto_cba8 $20
	npc_loopAboveParamTimes $03, -
	npc_end
+
	npc_jumpIfRandomNumLTparam $6e, @endjump
	.db $04
	.db $c7 $5c $80 $80
	npc_loadParamInto_cb78 $04
	.db $c7 $58 $80 $80
	npc_loadParamInto_cb78 $0a
	.db $c7 $9c $80 $80
	npc_loadParamInto_cb78 $07
	npc_jumpIfRandomNumLTparam $c8, +
	.db $c7 $00 $80 $80
	npc_end
+
	npc_spawnNPCAtOffset $ee $00 $00
	.db $c7 $00 $80 $80
	npc_end
@endjump:
	npc_jump @func_10f5


npcee_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_set2_cbe4
	.db $16
	npc_loadParamInto_cb78 $05
	.db $c7 $00 $80 $80
	npc_setNewNpcID $ef


npcef_scripts:
npcf3_scripts:
	npc_jumpIfArmorOfGodGotten $08, @func_116a
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_paramLowNybbleIs_cb54_highNybble $08
	npc_set7_cb60
	npc_lowNybbleOf_cb54_equParamMinus1 $04
	npc_faceLeft
	npc_jumpIfRandomNumLTparam $80, @func_1147
	npc_faceRight
@func_1147:
	npc_loadInto_cba8 $10
	npc_jumpIfRandomNumLTparam $0a, +++
	npc_moveNPC_jumpIfCant $06, +
	npc_jump ++
+
	npc_loadParamInto_cb78 $03
	npc_turnBackwards
++
	npc_jump @func_1147
+++
	.db $04
	.db $c7 $9c $80 $80
	npc_loadParamInto_cb78 $05
	.db $c7 $5c $80 $80
	npc_spawnNPCAtOffset $ed $00 $00
	npc_end
@func_116a:
	.db $c7 $95 $06 $09
	npc_end


npcf0_scripts:
	npc_jumpIfArmorOfGodGotten $08, @end
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_lowNybbleOf_cb54_equParamMinus1 $02
	.db $51 $30
	.db $51 $31
	npc_set7_cb60
	npc_faceLeft
@loop:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $c7 $d0 $80 $81
	npc_loadParamInto_cb78 $05
	npc_spawnNPCAtOffset $ed $00 $10
	.db $16
	npc_faceRight
	npc_loadInto_cba8 $20
	npc_set6_cb60_reset_cb6c
	npc_spawnNPCAtOffset $ed $00 $10
	.db $16
	npc_turnBackwards
	npc_loadInto_cba8 $20
	npc_jumpIfItemGotten $31, @end
	npc_jump @loop
@end:
	npc_end


npcc2_scripts:
npcc4_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $05
	npc_call func_06_14d9
-
	npc_call func_06_1509
	npc_loadParamInto_cb78 $02
	npc_jump -


npcc3_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $08
	npc_setNewNpcID $c4


npcc5_scripts:
	npc_res4_cb60
	npc_set7_cb60
	npc_loadParamInto_cb78 $0f
	npc_callCommonSoundFuncs_6c01 $0a $18
	npc_call func_06_14d9
-
	npc_call func_06_1502
	npc_loadParamInto_cb78 $02
	npc_jump $11bb


npce0_scripts:
npce1_scripts:
	npc_setRoomFlagFrom_cbf0
	npc_setNewNpcID $02


npcf4_scripts:
	npc_set6_cb60_reset_cb6c
	.db $c7 $95 $06 $09
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_giveItem $31
	npc_loadParamInto_cb78 $05
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_loadParamInto_cb78 $05
	npc_callCommonSoundFuncs_6c01 $d7 $15
	npc_setNewNpcID $02


npcd6_scripts:
	npc_loadParamInto_cb78 $01
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	.db $23
	npc_loadParamInto_cb78 $02
	npc_jump -
+
	.db $22
	npc_loadParamInto_cb78 $01
	npc_jump -


npcd4_scripts:
	npc_set5_cb60
	npc_set6_cb60_reset_cb6c
	.db $2d
	npc_call func_06_14d4
-
	npc_call func_06_1510
	npc_spawnNPCAtOffset $d3 $00 $00
	npc_loadParamInto_cb78 $2d
	npc_jump -


npcd8_scripts:
	npc_set5_cb60
	npc_call func_06_14d4
-
	npc_call func_06_1510
	npc_loadParamInto_cb78 $32
	npc_spawnNPCAtOffset $d3 $00 $00
	npc_loopAboveParamTimes $1e, -
	npc_loadParamInto_cb78 $1e
	npc_spawnNPC $d7 $14 $10
-
	npc_call func_06_1510
	npc_loadParamInto_cb78 $2d
	npc_spawnNPCAtOffset $d3 $00 $00
	npc_jump -


npcd7_scripts:
	npc_set5_cb60
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_res4_cb60
	npc_lowNybbleOf_cb54_equParamMinus1 $02
@loop:
	npc_loadParamInto_cb78 $0f
	npc_faceRight
	npc_loadInto_cba8 $06
	npc_faceDown
	npc_loadInto_cba8 $04
	npc_jumpIfRandomNumLTparam $73, +
	npc_spawnNPCAtOffset $3f $ec $ec
+
	npc_loadParamInto_cb78 $0f
	npc_faceRight
	npc_loadInto_cba8 $06
	npc_faceDown
	npc_loadInto_cba8 $04
	npc_jumpIfRandomNumLTparam $73, +
	npc_spawnNPCAtOffset $3f $0a $ec
+
	npc_loadParamInto_cb78 $0f
	npc_faceRight
	npc_loadInto_cba8 $06
	npc_faceDown
	npc_loadInto_cba8 $04
	npc_jumpIfRandomNumLTparam $73, +
	npc_spawnNPCAtOffset $3f $ec $00
+
	npc_loopAboveParamTimes $0a, @loop
	npc_end


npccd_scripts:
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $2d
	npc_set2_cb60
	npc_set7_cb60
	npc_call func_06_14e5
@func_1267:
	npc_jumpIfRandomNumLTparam $55, ++
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnRight
+
	npc_moveNPC_jumpIfCant $18, @func_1293
	npc_jump @func_127c
++
	npc_turnLeft
	npc_moveNPC_jumpIfCant $18, @func_1293
@func_127c:
	npc_spawnNPCAtOffset $ce $00 $00
	npc_jumpIfRandomNumLTparam $a0, +
	npc_spawnNPCinFrontOfSelf $d0
+
	npc_loadInto_cba8 $10
	npc_jumpIfRandomNumLTparam $6e, @func_1267
	npc_moveNPC_jumpIfCant $18, @func_1293
	npc_jump @func_127c
@func_1293:
	npc_loadParamInto_cb78 $01
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnRight
	npc_moveNPC_jumpIfCant $18, @func_1293
	npc_jump @func_127c
+
	npc_turnLeft
	npc_moveNPC_jumpIfCant $18, @func_1293
	npc_jump @func_127c


npccf_scripts:
	npc_res4_cb60
	npc_set7_cb60
	npc_call func_06_14de
-
	npc_call func_06_14ec
	npc_jumpIfRandomNumLTparam $f0, -
	npc_spawnNPCinFrontOfSelf $d0
	npc_jump -


npcd5_scripts:
	npc_set3_cb60
	npc_set2_cbe4
	npc_set2_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $2d
	npc_call func_06_14e5
-
	npc_call func_06_14ec
	npc_spawnNPCAtOffset $ce $00 $00
	npc_jumpIfRandomNumLTparam $b9, -
	npc_spawnNPCinFrontOfSelf $d0
	npc_jump -


npcc6_scripts:
npcca_scripts:
	npc_call func_06_14d9
@loop:
	.db $04
	npc_loadParamInto_cb78 $14
	npc_jumpIfRandomNumLTparam $5a, +
	npc_jumpIfRandomNumLTparam $64, ++
	npc_jump +++
+
	npc_setCoords $c0 $70
	npc_call func_06_1370
	npc_call func_06_154d
	npc_jump @loop
++
	npc_setCoords $40 $30
	npc_call func_06_1370
	npc_call func_06_154d
	npc_jump @loop
+++
	npc_setCoords $50 $80
	npc_call func_06_1370
	npc_call func_06_154d
	npc_jump @loop


npcc7_scripts:
npccb_scripts:
	npc_call func_06_14d9
@loop:
	.db $04
	npc_loadParamInto_cb78 $0c
	npc_jumpIfRandomNumLTparam $5a, +
	npc_jumpIfRandomNumLTparam $64, ++
	npc_jump +++
+
	npc_setCoords $20 $50
	npc_call func_06_1370
	npc_call func_06_154d
	npc_jump @loop
++
	npc_setCoords $90 $50
	npc_call func_06_1370
	npc_call func_06_154d
	npc_jump @loop
+++
	npc_setCoords $90 $90
	npc_call func_06_1370
	npc_call func_06_154d
	npc_jump @loop


npcc9_scripts:
npccc_scripts:
	npc_call $14d9
@loop:
	.db $04
	npc_jumpIfRandomNumLTparam $5a, +
	npc_jumpIfRandomNumLTparam $64, ++
	npc_jump +++
+
	npc_setCoords $60 $50
	npc_call func_06_1370
	npc_call func_06_154d
	npc_jump @loop
++
	npc_setCoords $a0 $40
	npc_call func_06_1370
	npc_call func_06_154d
	npc_jump @loop
+++
	npc_setCoords $20 $90
	npc_call func_06_1370
	npc_call func_06_154d
	npc_jump @loop


func_06_1370:
	npc_faceUp
	npc_spawnNPCAtOffset $c8 $00 $00
	npc_loadParamInto_cb78 $16
	npc_res4_cb60
	npc_ret


npcd1_scripts:
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $03
	.db $29
	npc_res4_cb60
	npc_set5_cb60
	npc_loadParamInto_cb78 $06
	npc_jumpIfLampOn +
	npc_call $14de
	npc_jump @func_138d
+
	npc_call func_06_14d9
@func_138d:
	.db $29
	npc_loadInto_cba8 $08
	npc_jumpIfRandomNumLTparam $d2, +
	npc_spawnNPCinFrontOfSelf $d2
+
	npc_jump @func_138d


npcda_scripts:
	npc_setRoomFlagFrom_cbf0
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_set5_cb60
	npc_lowNybbleOf_cb54_equParamMinus1 $06
	npc_faceRight
	npc_faceUp
	npc_loadParamInto_cb78 $0a
	npc_loadInto_cba8 $10
	npc_loadParamInto_cb78 $1e
	npc_faceLeft
	npc_lowNybbleOf_cb54_equParamMinus1 $03
	npc_loadInto_cba8 $06
	npc_faceUp
	npc_loadInto_cba8 $10
	npc_lowNybbleOf_cb54_equParamMinus1 $04
	npc_faceLeft
	npc_jump func_06_13c9


npcd9_scripts:
	npc_setRoomFlagFrom_cbf0
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_set5_cb60
	npc_set_c059 $07
	npc_loadParamInto_cb78 $19
	npc_faceLeft
	npc_lowNybbleOf_cb54_equParamMinus1 $02
	npc_loadInto_cba8 $06
	npc_lowNybbleOf_cb54_equParamMinus1 $03
	npc_loadInto_cba8 $0c
	npc_lowNybbleOf_cb54_equParamMinus1 $04
	.db $23

func_06_13c9:
	npc_loadInto_cba8 $14
	npc_lowNybbleOf_cb54_equParamMinus1 $06
	npc_loadInto_cba8 $20
	npc_lowNybbleOf_cb54_equParamMinus1 $08
-
	npc_loadInto_cba8 $08
	npc_jumpIfAtTile $8c, +
	npc_jump -
+
	npc_end


npcdd_scripts:
	npc_lowNybbleOf_cb54_equParamMinus1 $08
	npc_loadParamInto_cb78 $0a
	npc_set5_cb60
	npc_set2_cbe4
-
	npc_call func_06_1510
	npc_loadParamInto_cb78 $0a
	npc_jumpIfAtTile $ec, +
	npc_jumpIfAtTile $e8, +
	npc_jumpIfAtTile $5c, +
	npc_jumpIfAtTile $64, +
	npc_jumpIfAtTile $60, +
	npc_jump -
+
	npc_res4_cb60
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $04
	.db $16
	npc_setNewNpcID $de


npcde_scripts:
	npc_res4_cb60
	npc_set5_cb60
	npc_set7_cb60
	npc_faceDown
	npc_loadParamInto_cb78 $08
	npc_moveHorizontallyToPlayer
	npc_loadParamInto_cb78 $04
	npc_spawnNPCinFrontOfSelf $d0
	npc_loadParamInto_cb78 $0f
	npc_spawnNPCinFrontOfSelf $d0
	npc_setNewNpcID $df


npcdf_scripts:
	npc_set5_cb60
	npc_set2_cbe4
	npc_res4_cb60
	npc_set6_cb60_reset_cb6c
	npc_cb60_low2bitsEquParamMinus1 $04
	.db $16
	npc_setNewNpcID $dd


npcd3_scripts:
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_loadParamInto_cb78 $23
	.db $15
	npc_setNewNpcID $d1


npcc8_scripts:
	npc_paramLowNybbleIs_cb54_highNybble $00
	npc_set3_cb60
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_loadParamInto_cb78 $14
	npc_end


npcce_scripts:
	npc_set3_cb60
	npc_set2_cbe4
	npc_res4_cb60
	npc_loadParamInto_cb78 $23
	npc_end


npcd2_scripts:
	npc_set5_cb60
	npc_res4_cb60
	npc_jumpIfArmorOfGodGotten $08, +
	npc_paramLowNybbleIs_cb54_highNybble $04
	npc_lowNybbleOf_cb54_equParamMinus1 $04
-
	npc_loadInto_cba8 $08
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @end
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @end
	npc_jump -
+
	npc_paramLowNybbleIs_cb54_highNybble $00
	npc_lowNybbleOf_cb54_equParamMinus1 $04
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @end
	npc_loadInto_cba8 $08
	npc_jump -
+
	npc_turnBackwards
	npc_lowNybbleOf_cb54_equParamMinus1 $04
	npc_loadInto_cba8 $10
@end:
	npc_end


npcd0_scripts:
	npc_res4_cb60
	npc_set5_cb60
	npc_jumpIfArmorOfGodGotten $08, +
	npc_paramLowNybbleIs_cb54_highNybble $04
	npc_lowNybbleOf_cb54_equParamMinus1 $00
	.db $02
	npc_end
-
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @done
	npc_resetBit5ofNPC2ndByte_jumpIfNZ @done
	.db $29
	npc_loadInto_cba8 $03
	npc_jump -
+
	npc_paramLowNybbleIs_cb54_highNybble $00
	npc_lowNybbleOf_cb54_equParamMinus1 $02
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @done
	.db $29
	npc_loadInto_cba8 $03
	npc_jump -
+
	npc_turnBackwards
	npc_loadInto_cba8 $10
@done:
	npc_end


npcdb_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_lowNybbleOf_cb54_equParamMinus1 $02
	npc_paramLowNybbleIs_cb54_highNybble $01
-
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	npc_loadInto_cba8 $30
	npc_jump -
+
	npc_turnRight
	npc_loadInto_cba8 $30
	npc_jump -


npcdc_scripts:
	npc_jumpIfItemGotten $2a, ++
-
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_loadParamInto_cb78 $01
	npc_jump -
+
	npc_giveItem $2a
++
	npc_call func_06_14b5
	npc_end

func_06_14b5:
	.db $c7 $86 $80 $80
	.db $c7 $86 $80 $ff
	.db $c7 $86 $80 $fe
	npc_ret


npce2_scripts:
	npc_jumpIfItemGotten $2b, ++
-
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_loadParamInto_cb78 $01
	npc_jump -
+
	npc_giveItem $2b
++
	npc_call func_06_14b5
	npc_end


func_06_14d4:
	npc_lowNybbleOf_cb54_equParamMinus1 $06
	npc_paramLowNybbleIs_cb54_highNybble $00
	npc_ret


func_06_14d9:
	npc_lowNybbleOf_cb54_equParamMinus1 $03
	npc_paramLowNybbleIs_cb54_highNybble $04
	npc_ret


func_06_14de:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_lowNybbleOf_cb54_equParamMinus1 $02
	npc_paramLowNybbleIs_cb54_highNybble $04
	npc_ret


func_06_14e5:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_lowNybbleOf_cb54_equParamMinus1 $01
	npc_paramLowNybbleIs_cb54_highNybble $04
	npc_ret


func_06_14ec:
	npc_turnRight
	npc_jump ++
--
	npc_jumpIfRandomNumLTparam $eb, +
	npc_turnBackwards
+
	npc_loadInto_cba8 $10
	npc_ret
-
	npc_loadParamInto_cb78 $01
	npc_turnLeft
++
	npc_moveNPC_jumpIfCant $0c, -
	npc_jump --


func_06_1502:
	npc_moveHorizontallyToPlayer
	npc_loadInto_cba8 $30
	.db $11
	npc_loadInto_cba8 $30
	npc_ret


func_06_1509:
	npc_moveHorizontallyToPlayer
	npc_loadInto_cba8 $20
	.db $11
	npc_loadInto_cba8 $20
	npc_ret


func_06_1510:
	npc_jumpIfRandomNumLTparam $55, ++
	npc_jumpIfRandomNumLTparam $80, +
	npc_setCoords $70 $30
	npc_jump @next_152a
+
	npc_setCoords $30 $70
	npc_jump @next_152a
++
	npc_setCoords $a0 $70
	npc_jump @next_152a
@next_152a:
	npc_jumpIfRandomNumLTparam $40, +++
	npc_jumpIfRandomNumLTparam $55, ++
	npc_jumpIfRandomNumLTparam $80, +
	npc_faceDown
	npc_jump @next_1543
+
	npc_faceUp
	npc_jump @next_1543
++
	npc_faceRight
	npc_jump @next_1543
+++
	npc_faceLeft
@next_1543:
	npc_jumpIfRandomNumLTparam $80, +
	npc_loadInto_cba8 $20
	npc_ret
+
	npc_loadInto_cba8 $40
	npc_ret


func_06_154d:
-
	npc_loadInto_cba8 $30
	npc_jumpIfRandomNumLTparam $80, +
	npc_spawnNPCinFrontOfSelf $d2
+
	npc_turnBackwards
	npc_loadInto_cba8 $30
	npc_jumpIfRandomNumLTparam $80, +
	npc_spawnNPCinFrontOfSelf $d2
+
	npc_turnRight
	npc_loopAboveParamTimes $04, -
	npc_spawnNPCAtOffset $c8 $00 $00
	npc_loadParamInto_cb78 $0f
	npc_ret


npcf5_scripts:
	npc_groupRoomXYjumpTable @table1
@func_156d:
	npc_set2_cbe4
	npc_res4_cb60
	npc_call func_06_1be9
	npc_groupRoomXYjumpTable @table2
@end:
	npc_end

@table1:
	.db $09 $01 $00
	.dw @entry0

	.db $0f $01 $02
	.dw @entry1

	.db $07 $02 $05
	.dw @entry2

	.db $0d $01 $00
	.dw @entry3

	.db $0b $06 $03
	.dw @entry4

	.db $16 $01 $02
	.dw @entry5

	.db $ff $ff $ff

@entry0:
	npc_jumpIfArmorOfGodGotten $01, @end
	npc_jump @func_156d

@entry1:
	npc_jumpIfArmorOfGodGotten $02, @end
	npc_jump @func_156d

@entry2:
	npc_jumpIfArmorOfGodGotten $04, @end
	npc_jump @func_156d

@entry3:
	npc_jumpIfArmorOfGodGotten $10, @end
	npc_jump @func_156d

@entry4:
	npc_jumpIfArmorOfGodGotten $20, @end
	npc_jump @func_156d

@entry5:
	npc_jumpIfArmorOfGodGotten $08, @end
	npc_jump @func_156d

@table2:
	.db $09 $01 $00
	.dw @2entry0

	.db $0f $01 $02
	.dw @2entry1

	.db $07 $02 $05
	.dw @2entry2

	.db $0d $01 $00
	.dw @2entry3

	.db $0b $06 $03
	.dw @2entry4

	.db $16 $01 $02
	.dw @2entry5

	.db $1a $01 $02
	.dw @2entry6

	.db $ff $ff $ff

-
	npc_groupRoomXYjumpTable @table2

@afterTable2:
	npc_call func_06_1bf2
	npc_call func_06_1be9
	npc_jump -

@2entry0:
	npc_displayTextScreen @text_161d
	npc_jump @afterTable2

@2entry1:
	npc_displayTextScreen @text_16ad
	npc_jump @afterTable2

@2entry2:
	npc_displayTextScreen @text_174b
	npc_jump @afterTable2

@2entry3:
	npc_displayTextScreen @text_1808
	npc_jump @afterTable2

@2entry4:
	npc_displayTextScreen @text_18a2
	npc_jump @afterTable2

@2entry5:
	npc_displayTextScreen @text_19e5
	npc_jump @afterTable2

@2entry6:
	npc_displayTextScreen @text_1b08
	npc_jump @afterTable2

@text_161d:
	.db $01 $00
	.asc "Throw fruit at"
	.db $01
	.asc "this guy only"
	.db $01
	.asc "when he comes"
	.db $01
	.asc "out from behind"
	.db $01
	.asc "the rock. Upon"
	.db $01
	.asc "defeating this"
	.db $01
	.asc "boss, you will"
	.db $01
	.asc "be rewarded with"
	.db $01
	.asc "the Belt of"
	.db $01
	.asc "Truth."
	.db $ff $fe $7f

@text_16ad:
	.db $00 $00
	.asc "You'll need a"
	.db $01
	.asc "key to enter"
	.db $01
	.asc "this room. Once"
	.db $01
	.asc "in, use 3 vials"
	.db $01
	.asc "to defeat this"
	.db $01
	.asc "boss. A door"
	.db $01
	.asc "will then open"
	.db $01
	.asc "and you can"
	.db $01
	.asc "claim the"
	.db $01
	.asc "Breastplate of"
	.db $01
	.asc "Righteousness."
	.db $ff $fe $7f

@text_174b:
	.db $00 $00
	.asc "This door leads"
	.db $01
	.asc "to the boss room"
	.db $01
	.asc "with the Boots"
	.db $01
	.asc "of the Gospel."
	.db $01
	.asc "As the projec-"
	.db $01
	.asc "tiles track you,"
	.db $01
	.asc "guide them to-"
	.db $01
	.asc "wards the glow-"
	.db $01
	.asc "ing bricks."
	.db $01
	.asc "Use this and"
	.db $01
	.asc "vials to clear a"
	.db $01
	.asc "path to the top."
	.db $ff $fe $7f

@text_1808:
	.db $01 $00
	.asc "Are you ready"
	.db $01
	.asc "for the Helmet"
	.db $01
	.asc "of Salvation?"
	.db $01
	.asc "You'll need the"
	.db $01
	.asc "Jawbone to knock"
	.db $01
	.asc "back the cher-"
	.db $01
	.asc "ries. Once all"
	.db $01
	.asc "the cherries are"
	.db $01
	.asc "gone, an exit"
	.db $01
	.asc "will appear."
	.db $ff $fe $7f

@text_18a2:
	.db $00 $00
	.asc "I hope you have"
	.db $01
	.asc "plenty of vials."
	.db $01
	.asc "The guy at the"
	.db $01
	.asc "top of this room"
	.db $01
	.asc "takes 3 vial"
	.db $01
	.asc "blasts before"
	.db $01
	.asc "he'll open the"
	.db $01
	.asc "the door to the"
	.db $01
	.asc "Sword of the"
	.db $01
	.asc "Spirit. His"
	.db $01
	.asc "helpers will"
	.db $01
	.asc "only go away"
	.db $ff
	.db $42 $19
	.db $fe $fd

	.db $00 $00
	.asc "when pushed by a"
	.db $01
	.asc "barrel. Hidden"
	.db $01
	.asc "ladders can also"
	.db $01
	.asc "be exposed with"
	.db $01
	.asc "vial blasts. The"
	.db $01
	.asc "entrance to this"
	.db $01
	.asc "room is hidden."
	.db $01
	.asc "Use vials to"
	.db $01
	.asc "expose it."
	.db $ff $fe $7f

@text_19e5:
	.db $00 $00
	.asc "The Shield of"
	.db $01
	.asc "Faith awaits"
	.db $01
	.asc "you, but first"
	.db $01
	.asc "you must get"
	.db $01
	.asc "past this room."
	.db $01
	.asc "An evil spirit"
	.db $01
	.asc "flies across the"
	.db $01
	.asc "top. One hit"
	.db $01
	.asc "from your Sword"
	.db $01
	.asc "will make him"
	.db $01
	.asc "vulnerable."
	.db $01
	.asc "Within a couple"
	.db $ff
	.db $42 $19
	.db $fe $fd

	.db $00 $00
	.asc "of seconds you"
	.db $01
	.asc "must hit him"
	.db $01
	.asc "again with your"
	.db $01
	.asc "sword. Be pa-"
	.db $01
	.asc "tient and fight"
	.db $01
	.asc "hard. Watch out"
	.db $01
	.asc "for fiery drops!"
	.db $ff $fe $7f

@text_1b08:
	.db $00 $00
	.asc "You have done"
	.db $01
	.asc "so well! Now"
	.db $01
	.asc "comes your"
	.db $01
	.asc "ultimate chal-"
	.db $01
	.asc "lenge. This guy"
	.db $01
	.asc "is tough! Use"
	.db $01
	.asc "your Sword to"
	.db $01
	.asc "stop his rock"
	.db $01
	.asc "shield and throw"
	.db $01
	.asc "fruit at his"
	.db $01
	.asc "head only when"
	.db $01
	.asc "it is flashing."
	.db $ff
	.db $42 $19
	.db $fe $fd

	.db $00 $00
	.asc "He only goes"
	.db $01
	.asc "away after being"
	.db $01
	.asc "hit 7 times."
	.db $ff $fe $7f


func_06_1be9:
-
	npc_resetBit5ofNPC2ndByte_jumpIfNZ +
	npc_loadParamInto_cb78 $01
	npc_jump -
+
	npc_ret


func_06_1bf2:
-
	npc_loadParamInto_cb78 $01
	npc_resetBit5ofNPC2ndByte_jumpIfNZ -
	npc_loadParamInto_cb78 $05
	npc_resetBit5ofNPC2ndByte_jumpIfNZ -
	npc_ret
