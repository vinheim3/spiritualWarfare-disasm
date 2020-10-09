
; ==============================================================================
; ENTID_PRISONER
; ==============================================================================
npcbf_scripts:
npcc1_scripts:
	npc_damagableByPlayerItems
	npc_wait $05
	npc_call setMovement3damage4
-
	npc_call move20hPixelsHorizThenVertToPlayer
	npc_wait $02
	npc_jump -


npcc0_scripts:
	npc_damagableByPlayerItems
	npc_wait $08
	npc_setNewNpcID $c1


npce3_scripts:
	npc_damagableByPlayerItems
	npc_call setMovement3damage4
	npc_faceDown
	npc_moveByParamPixels $10
@loop:
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	.db $0a
	.db $0a
	npc_moveByParamPixels $20
	npc_jump @loop
+
	npc_turnRight
	npc_offsetNPCCoordsBy1_turnLeft
	npc_offsetNPCCoordsBy1_turnLeft
	npc_moveByParamPixels $20
	npc_jump @loop


; ==============================================================================
; ENTID_PRISON_LOCK
; ==============================================================================
npce4_scripts:
	npc_set3_cb60
	npc_damagableByPlayerItems
	npc_makeInvisible
-
	npc_wait $02
	npc_jump -


npce5_scripts:
-
	npc_set3_cb60
	npc_damagableByPlayerItems
	npc_makeInvisible
	npc_spawnNPCAtOffset $e3 $00 $00
	npc_wait $14
	npc_loopAboveParamTimes $05, -
	npc_placeTile $f1 $80 $80
	npc_setEnemyDefeatedRoomFlag
	npc_end


; ==============================================================================
; ENTID_FOREST_BOMB_BOSS
; ==============================================================================
npce6_scripts:
	npc_jumpIfArmorOfGodGotten AOG_HELM, @helmGotten
	npc_damagableByPlayerItems
	npc_takeItem ITEMID_30
	npc_wait $0a
@loop:
	npc_setMovementSpeed $03
	npc_faceDown
-
	npc_moveByParamPixels $ff
	npc_jumpIfAtTile $f0, +
	npc_jump -
+
	npc_faceLeft
	npc_set5_cb60
-
	npc_jumpIfAtTile $14, +
	npc_moveByParamPixels $10
	npc_jump -
+
	npc_moveNPC_jumpIfCant $06, +
	npc_wait $37
	npc_moveNPC_jumpIfCant $06, +
	npc_jump @couldMove
+
	npc_giveItem ITEMID_30
	npc_spawnNPCAtOffset $e7 $f0 $00
	npc_placeTile $00 $06 $09
	npc_set5_cb60
	npc_setMovementSpeed $04
	npc_faceRight
	npc_moveByParamPixels $10
	npc_res5_cb60
	npc_wait $03
	npc_faceUp
	npc_moveByParamPixels $30
	npc_faceRight
	npc_moveByParamPixels $20
	npc_wait $03
	npc_moveToPlayersYandFacePlayerVertically
	npc_moveToPlayersYandFacePlayerVertically
	npc_faceRight
	npc_wait $03
	npc_takeItem ITEMID_30
	npc_placeTile $30 $06 $00
	npc_jump @loop
@couldMove:
	npc_wait $0f
	npc_setMovementSpeed $02
	npc_faceRight
	npc_moveByParamPixels $10
	npc_faceUp
	npc_moveByParamPixels $40
	npc_faceRight
	npc_moveByParamPixels $10
	npc_faceUp
	npc_moveByParamPixels $30
	npc_faceLeft
	npc_moveByParamPixels $30
	npc_faceUp
	npc_moveByParamPixels $30
	npc_playSoundEffectAtAddr sound_15d7
@helmGotten:
	npc_placeTile $00 $0d $08
	npc_playSoundEffectAtAddr sound_15d7
	npc_end


npce7_scripts:
	npc_fruitsBounceOff
	npc_set3_cb60
	npc_set5_cb60
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_setMovementSpeed $0d
-
	npc_jumpIfItemGotten ITEMID_30, +
	npc_jump ++
+
	.db $55 $e6
	npc_moveByParamPixels $0d
	npc_jump -
++
	npc_moveByParamPixels $13
	npc_setMovementSpeed $0c
	npc_faceRight
	npc_facePlayerHorizontally
	npc_resetNPC2ndByteBit5_jumpIfOrigSet $0ed4
+
	npc_wait $01
-
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_processAndJumpIfPlayerCollided @func_0ee2
	npc_moveByParamPixels $04
	npc_loopAboveParamTimes $14, -
@func_0ee2:
	npc_moveByParamPixels $10
	npc_jumpIfAtTile $14, @func_0ee2
	npc_unsetPathfindToPlayer
	npc_end
+
	npc_playSoundEffectAtAddr sound_1768
	npc_faceLeft
	npc_setMovementSpeed $08
	npc_moveByParamPixels $20
	npc_res5_cb60
	npc_moveByParamPixels $ff
	npc_wait $05
	npc_unsetPathfindToPlayer
	npc_end


npcec_scripts:
	npc_set3_cb60
	npc_damagableByPlayerItems
	npc_noVertTiles_reset_animationFrameIdx
	npc_animate
	npc_giveItem ITEMID_2a
	npc_end


; ==============================================================================
; ENTID_WAREHOUSE_BOSS_HELPER_BULLET
; ==============================================================================
npceb_scripts:
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_setMovementSpeed $01
	npc_set5_cb60
-
	npc_setPathfindToPlayer
	npc_moveByParamPixels $04
	npc_jumpIfAtTile $08, +
	npc_jumpIfAtTile $7c, ++
	npc_processAndJumpIfPlayerCollided @hitPlayer
	npc_jumpIfAtTile $00, +++
	npc_jump -
+
	npc_giveItem ITEMID_30
	npc_wait $03
	npc_end
++
	npc_giveItem ITEMID_31
	npc_wait $03
	npc_end
+++
	npc_facePlayerVertically
	npc_res5_cb60
	npc_moveByParamPixels $10
	npc_unsetPathfindToPlayer
	npc_giveItem ITEMID_2a
	npc_end

@hitPlayer:
	npc_setPathfindToPlayer
	npc_setMovementSpeed $02
	npc_facePlayerHorizontally
	npc_moveByParamPixels $04
	npc_facePlayerVertically
	npc_moveByParamPixels $04
	npc_unsetPathfindToPlayer
	npc_giveItem ITEMID_2a
	npc_end


; ==============================================================================
; ENTID_WAREHOUSE_SLOW_BULLET_BOSS
; ==============================================================================
npcea_scripts:
	npc_jumpIfArmorOfGodGotten AOG_BOOTS, _npc_end_06_1051
	npc_damagableByPlayerItems
	npc_setMovementSpeed $04
	npc_wait $0f
	npc_faceLeft
	npc_moveByParamPixels $10
@loop:
	npc_takeItem ITEMID_30
	npc_takeItem ITEMID_31
	npc_takeItem ITEMID_2a
	npc_set4_cb60
	npc_set5_cb60
	npc_wait $14
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
	npc_giveItem ITEMID_2a
++
	npc_setCoords $40 $40
	npc_jump @func_0ff4

@func_0f86:
	npc_setCoords $10 $60
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset ENTID_WAREHOUSE_BOSS_HELPER_TODO_1 $00 $00
	npc_giveItem ITEMID_2a
++
	npc_setCoords $90 $70
	npc_jump @func_0ff4

@func_0f9c:
	npc_setCoords $70 $40
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset ENTID_WAREHOUSE_BOSS_HELPER_TODO_1 $00 $00
	npc_giveItem ITEMID_2a
++
	npc_setCoords $30 $40
	npc_jump @func_0ff4

@func_0fb2:
	npc_setCoords $50 $50
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset ENTID_WAREHOUSE_BOSS_HELPER_TODO_1 $00 $00
	npc_giveItem ITEMID_2a
++
	npc_setCoords $d0 $40
	npc_jump @func_0ff4

@func_0fc8:
	npc_setCoords $e0 $50
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset ENTID_WAREHOUSE_BOSS_HELPER_TODO_1 $00 $00
	npc_giveItem ITEMID_2a
++
	npc_setCoords $50 $70
	npc_jump @func_0ff4

@func_0fde:
	npc_setCoords $90 $40
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_spawnNPCAtOffset ENTID_WAREHOUSE_BOSS_HELPER_TODO_1 $00 $00
	npc_giveItem ITEMID_2a
++
	npc_setCoords $20 $60
	npc_jump @func_0ff4

@func_0ff4:
	npc_jumpIfAtTile $1c, +
	npc_jump ++
+
	npc_takeItem ITEMID_2a
	npc_spawnNPCAtOffset ENTID_WAREHOUSE_BOSS_HELPER_TODO_2 $00 $00
	npc_jump @func_100b
++
	npc_jumpIfItemGotten ITEMID_2a, @func_100b
	npc_jump @end

@func_100b:
	npc_setCoords $10 $20
	npc_faceRight
	npc_damagableByPlayerItems
	npc_res5_cb60
	npc_moveToPlayersXandFacePlayerHorizontally
	npc_takeItem ITEMID_30
	npc_takeItem ITEMID_31
	npc_takeItem ITEMID_2a
	npc_spawnNPCAtOffset ENTID_WAREHOUSE_BOSS_HELPER_BULLET $00 $00
-
	npc_wait $0a
	npc_jumpIfItemGotten ITEMID_30, +
	npc_jumpIfItemGotten ITEMID_31, +
	npc_jumpIfItemGotten ITEMID_2a, +
	npc_jump -
+
	npc_faceLeft
	npc_moveByParamPixels $ff

@end:
	npc_jump @loop


; ==============================================================================
; ENTID_WAREHOUSE_BOSS_HELPER_TODO_1
; ==============================================================================
npce8_scripts:
	npc_set3_cb60
	npc_noVertTiles_reset_animationFrameIdx
	npc_set2_cb60
	npc_damagableByPlayerItems
	npc_placeTile $08 $80 $80
-
	npc_wait $01
	npc_jumpIfItemGotten ITEMID_30, ++
	npc_jumpIfItemGotten ITEMID_31, +
	npc_loopAboveParamTimes $a5, -
+
	npc_placeTile $1c $80 $80
	npc_jump _npc_end_06_1051
++
	npc_unsetPathfindToPlayer

_npc_end_06_1051:
	npc_end


; ==============================================================================
; ENTID_WAREHOUSE_BOSS_HELPER_TODO_2
; ==============================================================================
npce9_scripts:
	npc_set3_cb60
	npc_noVertTiles_reset_animationFrameIdx
	npc_set2_cb60
	npc_damagableByPlayerItems
	npc_placeTile $7c $80 $80
-
	npc_wait $01
	npc_jumpIfItemGotten ITEMID_31, ++
	npc_jumpIfItemGotten ITEMID_30, +
	npc_loopAboveParamTimes $a5, -
+
	npc_placeTile $1c $80 $80
	npc_jump _npc_end_06_1070
++
	npc_unsetPathfindToPlayer

_npc_end_06_1070:
	npc_end


; ==============================================================================
; ENTID_DEMONS_LAIR_BOSS_FLYING_DEMON
; ==============================================================================
npcf1_scripts:
	npc_jumpIfArmorOfGodGotten AOG_SHIELD, _npc_end_06_1070
	npc_noVertTiles_reset_animationFrameIdx
	npc_setDamageTaken $06
	npc_set5_cb60
	npc_setMovementSpeed $08
	npc_damagableByPlayerItems
	npc_faceRight
@loop:
	npc_moveByParamPixels $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_moveByParamPixels $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_moveByParamPixels $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_jumpIfRandomNumLTparam $64, +
	npc_jump ++
+
	npc_setPathfindToPlayer
	npc_moveByParamPixels $30
	npc_faceUp
	npc_moveByParamPixels $ff
	npc_faceDown
	npc_moveByParamPixels $40
	npc_faceRight
++
	npc_jumpIfRandomNumLTparam $80, +
	npc_faceLeft
+
	npc_moveByParamPixels $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_moveByParamPixels $20
	npc_resetNPC2ndByteBit5_jumpIfOrigSet @func_10af
	npc_jump @loop
@func_10af:
	npc_spawnNPCAtOffset ENTID_RUNNING_DEMON_SPAWN_CLOUD $00 $00
	npc_wait $05
	npc_set4_cb60
	npc_setNewNpcID ENTID_DEMONS_LAIR_BOSS_FLYING_DEMON_2


; ==============================================================================
; ENTID_DEMONS_LAIR_BOSS_FLYING_DEMON_2
; ==============================================================================
npcf2_scripts:
	npc_noVertTiles_reset_animationFrameIdx
	npc_set5_cb60
	npc_setCoords $80 $40
	npc_setMovementSpeed $04
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
+
	npc_facePlayerHorizontally
	npc_turnBackwards
	npc_spawnNPCAtOffset ENTID_RUNNING_DEMON_SPAWN_CLOUD $00 $00
	npc_playSoundEffectAtAddr sound_1626
	npc_wait $0a
	npc_moveByParamPixels $10
	npc_playSoundEffectAtAddr sound_1626
	npc_damagableByPlayerItems
	npc_moveByParamPixels $40
	npc_setMovementSpeed $04
	npc_faceLeft
	npc_setMovementSpeed $06
	npc_setNewNpcID ENTID_DEMONS_LAIR_BOSS_FLYING_DEMON


; ==============================================================================
; ENTID_DEMONS_LAIR_BOSS_BLOOD_DROP
; ==============================================================================
npced_scripts:
	npc_wait $0a
	npc_set5_cb60
	npc_setDamageTaken $08
	npc_set2_cb60
	npc_setMovementSpeed $04
	npc_wait $07
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_placeTile $00 $80 $80
	npc_wait $08
	npc_faceDown
	npc_moveByParamPixels $40
-
	npc_jumpIfAtTile $00, +
@func_10f5:
	npc_moveByParamPixels $20
	npc_loopAboveParamTimes $03, -
	npc_end
+
	npc_jumpIfRandomNumLTparam $6e, @endjump
	npc_set4_cb60
	npc_placeTile $5c $80 $80
	npc_wait $04
	npc_placeTile $58 $80 $80
	npc_wait $0a
	npc_placeTile $9c $80 $80
	npc_wait $07
	npc_jumpIfRandomNumLTparam $c8, +
	npc_placeTile $00 $80 $80
	npc_end
+
	npc_spawnNPCAtOffset $ee $00 $00
	npc_placeTile $00 $80 $80
	npc_end
@endjump:
	npc_jump @func_10f5


; ==============================================================================
; ENTID_DEMONS_LAIR_BOSS_BLOOD_ENEMY
; ==============================================================================
npcee_scripts:
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_unaffectedByFruit
	npc_animate
	npc_wait $05
	npc_placeTile $00 $80 $80
	npc_setNewNpcID ENTID_DEMONS_LAIR_BOSS_BLOOD_DROP_SPAWNER


; ==============================================================================
; ENTID_DEMONS_LAIR_BOSS_BLOOD_DROP_SPAWNER
; ==============================================================================
npcef_scripts:
npcf3_scripts:
	npc_jumpIfArmorOfGodGotten AOG_SHIELD, @func_116a
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_setDamageTaken $08
	npc_fruitsBounceOff
	npc_setMovementSpeed $04
	npc_faceLeft
	npc_jumpIfRandomNumLTparam $80, @func_1147
	npc_faceRight
@func_1147:
	npc_moveByParamPixels $10
	npc_jumpIfRandomNumLTparam $0a, +++
	npc_moveNPC_jumpIfCant $06, +
	npc_jump ++
+
	npc_wait $03
	npc_turnBackwards
++
	npc_jump @func_1147
+++
	npc_set4_cb60
	npc_placeTile $9c $80 $80
	npc_wait $05
	npc_placeTile $5c $80 $80
	npc_spawnNPCAtOffset ENTID_DEMONS_LAIR_BOSS_BLOOD_DROP $00 $00
	npc_end
@func_116a:
	npc_placeTile $95 $06 $09
	npc_end


; ==============================================================================
; ENTID_DEMONS_LAIR_BOSS_HAND
; ==============================================================================
npcf0_scripts:
	npc_jumpIfArmorOfGodGotten AOG_SHIELD, @end
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_setMovementSpeed $02
	npc_takeItem ITEMID_30
	npc_takeItem ITEMID_31
	npc_fruitsBounceOff
	npc_faceLeft
@loop:
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_placeTile $d0 $80 $81
	npc_wait $05
	npc_spawnNPCAtOffset $ed $00 $10
	npc_animate
	npc_faceRight
	npc_moveByParamPixels $20
	npc_noVertTiles_reset_animationFrameIdx
	npc_spawnNPCAtOffset $ed $00 $10
	npc_animate
	npc_turnBackwards
	npc_moveByParamPixels $20
	npc_jumpIfItemGotten ITEMID_31, @end
	npc_jump @loop
@end:
	npc_end


; ==============================================================================
; ENTID_PRISON_POLICEMAN
; ==============================================================================
npcc2_scripts:
npcc4_scripts:
	npc_damagableByPlayerItems
	npc_wait $05
	npc_call setMovement3damage4
-
	npc_call move20hPixelsHorizThenVertToPlayer
	npc_wait $02
	npc_jump -


npcc3_scripts:
	npc_damagableByPlayerItems
	npc_wait $08
	npc_setNewNpcID $c4


; ==============================================================================
; ENTID_PRISON_DOGS
; ==============================================================================
npcc5_scripts:
	npc_damagableByPlayerItems
	npc_fruitsBounceOff
	npc_wait $0f
	npc_playSoundEffectAtAddr sound_180a
	npc_call setMovement3damage4
-
	npc_call func_06_1502
	npc_wait $02
	npc_jump -


npce0_scripts:
npce1_scripts:
	npc_setEnemyDefeatedRoomFlag
	npc_setNewNpcID $02


npcf4_scripts:
	npc_noVertTiles_reset_animationFrameIdx
	npc_placeTile $95 $06 $09
	npc_playSoundEffectAtAddr sound_15d7
	npc_giveItem ITEMID_31
	npc_wait $05
	npc_playSoundEffectAtAddr sound_15d7
	npc_wait $05
	npc_playSoundEffectAtAddr sound_15d7
	npc_setNewNpcID $02


; ==============================================================================
; ENTID_DEMONS_LAIR_STAIRS
; ==============================================================================
npcd6_scripts:
	npc_wait $01
-
	npc_processAndJumpIfPlayerCollided +
	npc_unslowPlayerMovement
	npc_wait $02
	npc_jump -
+
	npc_slowPlayerMovement
	npc_wait $01
	npc_jump -


; ==============================================================================
; ENTID_DEMON_SPAWNER
; ==============================================================================
npcd4_scripts:
	npc_set5_cb60
	npc_noVertTiles_reset_animationFrameIdx
	npc_makeInvisible
	npc_call func_06_14d4
-
	npc_call func_06_1510
	npc_spawnNPCAtOffset ENTID_DEMON_SPAWN_CLOUD $00 $00
	npc_wait $2d
	npc_jump -


; ==============================================================================
; ENTID_DEMON_SPAWNER_2
; ==============================================================================
npcd8_scripts:
	npc_set5_cb60
	npc_call func_06_14d4
-
	npc_call func_06_1510
	npc_wait $32
	npc_spawnNPCAtOffset ENTID_DEMON_SPAWN_CLOUD $00 $00
	npc_loopAboveParamTimes $1e, -
	npc_wait $1e
	npc_spawnNPC ENTID_SPAWNED_DEMON_2 $14 $10
-
	npc_call func_06_1510
	npc_wait $2d
	npc_spawnNPCAtOffset ENTID_DEMON_SPAWN_CLOUD $00 $00
	npc_jump -


; ==============================================================================
; ENTID_SPAWNED_DEMON_2
; ==============================================================================
npcd7_scripts:
	npc_set5_cb60
	npc_noVertTiles_reset_animationFrameIdx
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_damagableByPlayerItems
	npc_setMovementSpeed $02
@loop:
	npc_wait $0f
	npc_faceRight
	npc_moveByParamPixels $06
	npc_faceDown
	npc_moveByParamPixels $04
	npc_jumpIfRandomNumLTparam $73, +
	npc_spawnNPCAtOffset $3f $ec $ec
+
	npc_wait $0f
	npc_faceRight
	npc_moveByParamPixels $06
	npc_faceDown
	npc_moveByParamPixels $04
	npc_jumpIfRandomNumLTparam $73, +
	npc_spawnNPCAtOffset $3f $0a $ec
+
	npc_wait $0f
	npc_faceRight
	npc_moveByParamPixels $06
	npc_faceDown
	npc_moveByParamPixels $04
	npc_jumpIfRandomNumLTparam $73, +
	npc_spawnNPCAtOffset $3f $ec $00
+
	npc_loopAboveParamTimes $0a, @loop
	npc_end


; ==============================================================================
; ENTID_DEMONS_LAIR_INVISIBLE_DEMON
; ==============================================================================
npccd_scripts:
	npc_set3_cb60
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_makeInvisible
	npc_set2_cb60
	npc_fruitsBounceOff
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
	npc_moveByParamPixels $10
	npc_jumpIfRandomNumLTparam $6e, @func_1267
	npc_moveNPC_jumpIfCant $18, @func_1293
	npc_jump @func_127c
@func_1293:
	npc_wait $01
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnRight
	npc_moveNPC_jumpIfCant $18, @func_1293
	npc_jump @func_127c
+
	npc_turnLeft
	npc_moveNPC_jumpIfCant $18, @func_1293
	npc_jump @func_127c


; ==============================================================================
; ENTID_DEMONS_LAIR_LAVA_DEMON
; ==============================================================================
npccf_scripts:
	npc_damagableByPlayerItems
	npc_fruitsBounceOff
	npc_call func_06_14de
-
	npc_call func_06_14ec
	npc_jumpIfRandomNumLTparam $f0, -
	npc_spawnNPCinFrontOfSelf $d0
	npc_jump -


; ==============================================================================
; ENTID_DEMONS_LAIR_INVISIBLE_DEMON_2
; ==============================================================================
npcd5_scripts:
	npc_set3_cb60
	npc_unaffectedByFruit
	npc_set2_cb60
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_makeInvisible
	npc_call func_06_14e5
-
	npc_call func_06_14ec
	npc_spawnNPCAtOffset $ce $00 $00
	npc_jumpIfRandomNumLTparam $b9, -
	npc_spawnNPCinFrontOfSelf $d0
	npc_jump -


; ==============================================================================
; ENTID_DEMONS_LAIR_RUNNING_DEMON_1
; ENTID_DEMONS_LAIR_RUNNING_DEMON_4
; ==============================================================================
npcc6_scripts:
npcca_scripts:
	npc_call setMovement3damage4
@loop:
	npc_set4_cb60
	npc_wait $14
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


; ==============================================================================
; ENTID_DEMONS_LAIR_RUNNING_DEMON_2
; ENTID_DEMONS_LAIR_RUNNING_DEMON_5
; ==============================================================================
npcc7_scripts:
npccb_scripts:
	npc_call setMovement3damage4
@loop:
	npc_set4_cb60
	npc_wait $0c
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


; ==============================================================================
; ENTID_DEMONS_LAIR_RUNNING_DEMON_3
; ENTID_DEMONS_LAIR_RUNNING_DEMON_6
; ==============================================================================
npcc9_scripts:
npccc_scripts:
	npc_call setMovement3damage4
@loop:
	npc_set4_cb60
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
	npc_spawnNPCAtOffset ENTID_RUNNING_DEMON_SPAWN_CLOUD $00 $00
	npc_wait $16
	npc_damagableByPlayerItems
	npc_ret


; ==============================================================================
; ENTID_SPAWNED_DEMON
; ==============================================================================
npcd1_scripts:
	npc_noVertTiles_reset_animationFrameIdx
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setPathfindToPlayer
	npc_damagableByPlayerItems
	npc_set5_cb60
	npc_wait $06
	npc_jumpIfLampOn +
	npc_call func_06_14de
	npc_jump @func_138d
+
	npc_call setMovement3damage4
@func_138d:
	npc_setPathfindToPlayer
	npc_moveByParamPixels $08
	npc_jumpIfRandomNumLTparam $d2, +
	npc_spawnNPCinFrontOfSelf ENTID_DEMON_FIREBALL
+
	npc_jump @func_138d


; ==============================================================================
; ENTID_PRISON_FLEEING_DEMON_2
; ==============================================================================
npcda_scripts:
	npc_setEnemyDefeatedRoomFlag
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_set5_cb60
	npc_setMovementSpeed $06
	npc_faceRight
	npc_faceUp
	npc_wait $0a
	npc_moveByParamPixels $10
	npc_wait $1e
	npc_faceLeft
	npc_setMovementSpeed $03
	npc_moveByParamPixels $06
	npc_faceUp
	npc_moveByParamPixels $10
	npc_setMovementSpeed $04
	npc_faceLeft
	npc_jump fleeingDemonCommon


; ==============================================================================
; ENTID_PRISON_FLEEING_DEMON_1
; ==============================================================================
npcd9_scripts:
	npc_setEnemyDefeatedRoomFlag
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_set5_cb60
	npc_setTimeUntilFrozenStateEnds $07
	npc_wait $19
	npc_faceLeft
	npc_setMovementSpeed $02
	npc_moveByParamPixels $06
	npc_setMovementSpeed $03
	npc_moveByParamPixels $0c
	npc_setMovementSpeed $04
	npc_unslowPlayerMovement

fleeingDemonCommon:
	npc_moveByParamPixels $14
	npc_setMovementSpeed $06
	npc_moveByParamPixels $20
	npc_setMovementSpeed $08
-
	npc_moveByParamPixels $08
	npc_jumpIfAtTile $8c, +
	npc_jump -
+
	npc_end


npcdd_scripts:
	npc_setMovementSpeed $08
	npc_wait $0a
	npc_set5_cb60
	npc_unaffectedByFruit
-
	npc_call func_06_1510
	npc_wait $0a
	npc_jumpIfAtTile $ec, +
	npc_jumpIfAtTile $e8, +
	npc_jumpIfAtTile $5c, +
	npc_jumpIfAtTile $64, +
	npc_jumpIfAtTile $60, +
	npc_jump -
+
	npc_damagableByPlayerItems
	npc_noVertTiles_reset_animationFrameIdx
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_animate
	npc_setNewNpcID $de


npcde_scripts:
	npc_damagableByPlayerItems
	npc_set5_cb60
	npc_fruitsBounceOff
	npc_faceDown
	npc_wait $08
	npc_facePlayerHorizontally
	npc_wait $04
	npc_spawnNPCinFrontOfSelf $d0
	npc_wait $0f
	npc_spawnNPCinFrontOfSelf $d0
	npc_setNewNpcID $df


npcdf_scripts:
	npc_set5_cb60
	npc_unaffectedByFruit
	npc_damagableByPlayerItems
	npc_noVertTiles_reset_animationFrameIdx
	npc_cb60_low2bitsEquParamMinus1 $04
	npc_animate
	npc_setNewNpcID $dd


; ==============================================================================
; ENTID_DEMON_SPAWN_CLOUD
; ==============================================================================
npcd3_scripts:
	npc_set3_cb60
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_wait $23
	npc_res3_cb60
	npc_setNewNpcID ENTID_SPAWNED_DEMON


; ==============================================================================
; ENTID_RUNNING_DEMON_SPAWN_CLOUD
; ==============================================================================
npcc8_scripts:
	npc_setDamageTaken $00
	npc_set3_cb60
	npc_noVertTiles_reset_animationFrameIdx
	npc_damagableByPlayerItems
	npc_wait $14
	npc_end


npcce_scripts:
	npc_set3_cb60
	npc_unaffectedByFruit
	npc_damagableByPlayerItems
	npc_wait $23
	npc_end


; ==============================================================================
; ENTID_DEMON_FIREBALL
; ==============================================================================
npcd2_scripts:
	npc_set5_cb60
	npc_damagableByPlayerItems
	npc_jumpIfArmorOfGodGotten AOG_SHIELD, +
	npc_setDamageTaken $04
	npc_setMovementSpeed $04
-
	npc_moveByParamPixels $08
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @end
	npc_processAndJumpIfPlayerCollided @end
	npc_jump -
+
	npc_setDamageTaken $00
	npc_setMovementSpeed $04
-
	npc_processAndJumpIfPlayerCollided +
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @end
	npc_moveByParamPixels $08
	npc_jump -
+
	npc_turnBackwards
	npc_setMovementSpeed $04
	npc_moveByParamPixels $10
@end:
	npc_end


npcd0_scripts:
	npc_damagableByPlayerItems
	npc_set5_cb60
	npc_jumpIfArmorOfGodGotten AOG_SHIELD, +
	npc_setDamageTaken $04
	npc_setMovementSpeed $00
	npc_res5_cb60
	npc_end
-
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @done
	npc_processAndJumpIfPlayerCollided @done
	npc_setPathfindToPlayer
	npc_moveByParamPixels $03
	npc_jump -
+
	npc_setDamageTaken $00
	npc_setMovementSpeed $02
-
	npc_processAndJumpIfPlayerCollided +
	npc_flipBit4ofNPC2ndByte_jumpIfNZ @done
	npc_setPathfindToPlayer
	npc_moveByParamPixels $03
	npc_jump -
+
	npc_turnBackwards
	npc_moveByParamPixels $10
@done:
	npc_end


; ==============================================================================
; ENTID_DEMONS_LAIR_MONKEY_DEMON
; ==============================================================================
npcdb_scripts:
	npc_damagableByPlayerItems
	npc_wait $0a
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $02
	npc_setDamageTaken $01
-
	npc_jumpIfRandomNumLTparam $80, +
	npc_turnLeft
	npc_moveByParamPixels $30
	npc_jump -
+
	npc_turnRight
	npc_moveByParamPixels $30
	npc_jump -


; ==============================================================================
; ENTID_DEMONS_LAIR_BREAKABLE_WALL
; ==============================================================================
npcdc_scripts:
	npc_jumpIfItemGotten ITEMID_2a, ++
-
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_wait $01
	npc_jump -
+
	npc_giveItem ITEMID_2a
++
	npc_call func_06_14b5
	npc_end

func_06_14b5:
	npc_placeTile $86 $80 $80
	npc_placeTile $86 $80 $ff
	npc_placeTile $86 $80 $fe
	npc_ret


; ==============================================================================
; ENTID_DEMONS_LAIR_4_BREAKABLE_WALL
; ==============================================================================
npce2_scripts:
	npc_jumpIfItemGotten ITEMID_DEMONS_LAIR_4_WALL_BROKEN, ++
-
	npc_resetNPC2ndByteBit5_jumpIfOrigSet +
	npc_wait $01
	npc_jump -
+
	npc_giveItem ITEMID_DEMONS_LAIR_4_WALL_BROKEN
++
	npc_call func_06_14b5
	npc_end


func_06_14d4:
	npc_setMovementSpeed $06
	npc_setDamageTaken $00
	npc_ret


setMovement3damage4:
	npc_setMovementSpeed $03
	npc_setDamageTaken $04
	npc_ret


func_06_14de:
	npc_cb60_low2bitsEquParamMinus1 $02
	npc_setMovementSpeed $02
	npc_setDamageTaken $04
	npc_ret


func_06_14e5:
	npc_cb60_low2bitsEquParamMinus1 $03
	npc_setMovementSpeed $01
	npc_setDamageTaken $04
	npc_ret


func_06_14ec:
	npc_turnRight
	npc_jump ++
--
	npc_jumpIfRandomNumLTparam $eb, +
	npc_turnBackwards
+
	npc_moveByParamPixels $10
	npc_ret
-
	npc_wait $01
	npc_turnLeft
++
	npc_moveNPC_jumpIfCant $0c, -
	npc_jump --


func_06_1502:
	npc_facePlayerHorizontally
	npc_moveByParamPixels $30
	npc_facePlayerVertically
	npc_moveByParamPixels $30
	npc_ret


move20hPixelsHorizThenVertToPlayer:
	npc_facePlayerHorizontally
	npc_moveByParamPixels $20
	npc_facePlayerVertically
	npc_moveByParamPixels $20
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
	npc_moveByParamPixels $20
	npc_ret
+
	npc_moveByParamPixels $40
	npc_ret


func_06_154d:
-
	npc_moveByParamPixels $30
	npc_jumpIfRandomNumLTparam $80, +
	npc_spawnNPCinFrontOfSelf ENTID_DEMON_FIREBALL
+
	npc_turnBackwards
	npc_moveByParamPixels $30
	npc_jumpIfRandomNumLTparam $80, +
	npc_spawnNPCinFrontOfSelf ENTID_DEMON_FIREBALL
+
	npc_turnRight
	npc_loopAboveParamTimes $04, -
	npc_spawnNPCAtOffset ENTID_RUNNING_DEMON_SPAWN_CLOUD $00 $00
	npc_wait $0f
	npc_ret


; ==============================================================================
; ENTID_GUY_BEFORE_BOSSES
; ==============================================================================
npcf5_scripts:
	npc_groupRoomXYjumpTable @table1
@func_156d:
	npc_unaffectedByFruit
	npc_damagableByPlayerItems
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
	npc_jumpIfArmorOfGodGotten AOG_BELT, @end
	npc_jump @func_156d

@entry1:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, @end
	npc_jump @func_156d

@entry2:
	npc_jumpIfArmorOfGodGotten AOG_BOOTS, @end
	npc_jump @func_156d

@entry3:
	npc_jumpIfArmorOfGodGotten AOG_HELM, @end
	npc_jump @func_156d

@entry4:
	npc_jumpIfArmorOfGodGotten AOG_SWORD, @end
	npc_jump @func_156d

@entry5:
	npc_jumpIfArmorOfGodGotten AOG_SHIELD, @end
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
	npc_processAndJumpIfPlayerCollided +
	npc_wait $01
	npc_jump -
+
	npc_ret


func_06_1bf2:
-
	npc_wait $01
	npc_processAndJumpIfPlayerCollided -
	npc_wait $05
	npc_processAndJumpIfPlayerCollided -
	npc_ret
