.enum 0
	ENTID_00									db
	ENTID_DEVIL_SPAWN							db // $01
	ENTID_02									dsb 4-2
	ENTID_MISC_NPC								db // $04
	ENTID_SUNGLASSES_KNIFE_GUY					db // $05
	ENTID_CRAZY_EYES_CLUB_GUY					db // $06
	ENTID_CIRCLING_ALCOHOLIC					db // $07
	// TODO: 16 and 17 are dropped birds
	ENTID_08									dsb $19-8
	ENTID_RUNNING_CITY_GUY						db // $19
	ENTID_BLOCKAGE_BUILDER						db // $1a
	ENTID_CITY_BANDIT							db // $1b
	ENTID_BAR_SLOW_GUY_SPAWNER					db // $1c
	ENTID_SLOW_CITY_GUY							db // $1d
	ENTID_1e									dsb $21-$1e
	ENTID_DYNAMITE_BUILDER						db // $21
	ENTID_CITY_PLUMBER_1						db // $22
	ENTID_23									dsb $d-3
	// creates text and NPC
	ENTID_ITEM_ROOM_ANGEL						db // $2d
	ENTID_PEAR									db // $2e
	ENTID_POMEGRANATE							db // $2f
	ENTID_APPLE									db // $30
	ENTID_GRAPES								db // $31
	ENTID_32									db
	ENTID_PRICE_BIRD							db // $33
	ENTID_BELT_OF_TRUTH							db // $34
	ENTID_BREASTPLATE_OF_RIGHTEOUSNESS			db // $35
	ENTID_BOOTS_OF_THE_GOSPEL					db // $36
	ENTID_37									dsb $a-7
	ENTID_SHOP_7_VIALS							db // $3a
	ENTID_SHOP_OIL								db // $3b
	ENTID_BIRDS_HIDDEN_ROOM_NEAR_BOSS_1			db // $3c
	ENTID_VIALS_HIDDEN_ROOM_NEAR_BOSS_1			db // $3d
	// objects that disappear if the item normally used to bypass it,
	// gets taken, or if the item it leads to has been gotten
	ENTID_DISAPPEARING_OBSTACLE					db // $3e
	ENTID_3f									dsb $41-$3f
	ENTID_RAFT									db // $41
	ENTID_CITY_BANDIT_BLOCKER					db // $42
	ENTID_43									dsb 9-3
	ENTID_CITY_PLUMBER_2						db // $49
	ENTID_4a									db
	ENTID_LADDER_CLIMBER						db // $4b
	ENTID_4c									dsb $f-$c
	ENTID_CYCLIST								db // $4f
	ENTID_BASKETBALLER							db // $50
	ENTID_BASKETBALLER_SHOOTING_FROM_SIDE		db // $51
	ENTID_BASKETBALLER_SHOOTING_FROM_BELOW		db // $52
	ENTID_BASKETBALL_FROM_RIGHT					db // $53
	ENTID_BASKETBALL_FROM_LEFT					db // $54
	ENTID_BASKETBALL_FROM_BELOW					db // $55
	// same code as 57
	ENTID_56									db
	ENTID_BELT_BEING_TAKEN_AWAY					db // $57
	ENTID_58									dsb $b-8
	ENTID_BASKETBALLER_CTRLER					db // $5b
	ENTID_5c									db
	ENTID_BOSS_1								db // $5d
	// ??, also 5c shares this code
	ENTID_BOSS_1_CTRLER							db // $5e
	ENTID_5f									dsb $60-$5f
	ENTID_CITY_BOSS_HELPER						db // $60
	ENTID_CITY_BOSS								db // $61
	ENTID_62									dsb $b-2
	ENTID_TRAIN_GUY								db // $6b
	ENTID_PAWN_SHOP_GUY							db // $6c
	ENTID_HEART_CONTAINER						db // $6d
	ENTID_AIRPORT_BAGGAGE_1F_1					db // $6e
	ENTID_AIRPORT_BAGGAGE_1F_2					db // $6f
	ENTID_AIRPORT_BAGGAGE_1F_3					db // $70
	ENTID_AIRPORT_BAGGAGE_1F_4					db // $71
	ENTID_AIRPORT_BAGGAGE_1F_5					db // $72
	ENTID_AIRPORT_BAGGAGE_2F					db // $73
	ENTID_KEYLOCK								db // $74
	ENTID_AIRPORT_LEFT_GUARD					db // $75
	ENTID_AIRPORT_RIGHT_GUARD					db // $76
	ENTID_HELPFUL_LADY							db // $77
	ENTID_GUNMAN_FACING_LEFT					db // $78
	ENTID_GUNMAN_BULLET_LEFT					db // $79
	ENTID_GUNMAN_FACING_RIGHT					db // $7a
	ENTID_GUNMAN_BULLET_RIGHT					db // $7b
	ENTID_SLUMS_BULLET_EXPLOSION				db // $7c
	ENTID_SHOP_ANGEL							db // $7d
	ENTID_LAMP									db // $7e
	ENTID_7f									dsb $84-$7f
	ENTID_QUIZ_ANGEL							db // $84
	ENTID_SLUMS_DOG								db // $85
	ENTID_SLUMS_DOG_CHARGING					db // $86
	ENTID_87									dsb $c-$7
	ENTID_SLUMS_BIKER							db // $8c
	ENTID_8d									db
	ENTID_WAREHOUSE_FORKLIFT_DRIVER				db // $8e
	ENTID_WAREHOUSE_FORKLIFT_BOX				db // $8f
	ENTID_90									db
	ENTID_SLUMS_GANGSTER						db // $91
	ENTID_SLUMS_PLUMBER							db // $92
	ENTID_WAREHOUSE_FAST_ALCOHOLIC				db // $93
	ENTID_WAREHOUSE_WRENCH_GUY					db // $94
	ENTID_WAREHOUSE_WRENCH_GUYS_WRENCH			db // $95
	ENTID_WAREHOUSE_DRILLER						db // $96
	ENTID_WAREHOUSE_DRILLER_DRILLING_HORIZ		db // $97
	ENTID_WAREHOUSE_DRILLER_DRILLING_VERT		db // $98
	ENTID_ITEM_PLACER							db // $99
	ENTID_SLUMS_BOTTOM_MIDDLE_KEY				db // $9a
	ENTID_GUNMAN_DOOR							db // $9b
	ENTID_GUNMAN_IN_DOOR						db // $9c
	ENTID_9d									dsb $a2-$9d
	ENTID_PERMANENTLY_REMOVABLE_OBSTACLE		db // $a2
	ENTID_PERMANENTLY_REMOVED_OBSTACLE			db // $a3
	ENTID_GUNMAN_BULLET							db // $a4
	ENTID_WAREHOUSE_GUNMAN						db // $a5
	ENTID_WAREHOUSE_PLUMBER						db // $a6
	ENTID_DRUNK_POLICEMAN						db // $a7
	ENTID_AIRPORT_BALD_THUGS					db // $a8
	ENTID_AIRPORT_SUNGLASSES_GUY				db // $a9
	ENTID_aa									dsb $bf-$aa
	ENTID_PRISONER								db // $bf
	ENTID_c0									dsb 2-0
	ENTID_PRISON_POLICEMAN						db // $c2
	ENTID_c3									dsb 5-3
	ENTID_PRISON_DOGS							db // $c5
	ENTID_c6									dsb $d9-$c6
	ENTID_PRISON_FLEEING_DEMON_1				db // $d9
	ENTID_PRISON_FLEEING_DEMON_2				db // $da
	ENTID_db									dsb $e4-$db
	ENTID_PRISON_LOCK							db // $e4
	ENTID_e5									db // $e5
	ENTID_FOREST_BOMB_BOSS						db // $e6
	ENTID_e7									db
	ENTID_WAREHOUSE_BOSS_HELPER_TODO_1			db // $e8
	ENTID_WAREHOUSE_BOSS_HELPER_TODO_2			db // $e9
	ENTID_WAREHOUSE_SLOW_BULLET_BOSS			db // $ea
	ENTID_WAREHOUSE_BOSS_HELPER_TODO_3			db // $eb
	ENTID_ec									dsb $f5-$ec
	ENTID_GUY_BEFORE_BOSSES						db // $f5
.ende