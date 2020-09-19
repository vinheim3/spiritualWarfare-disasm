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
	ENTID_31									dsb 3-1
	ENTID_PRICE_BIRD							db // $33
	ENTID_BELT_OF_TRUTH							db // $34
	ENTID_BREASTPLATE_OF_RIGHTEOUSNESS			db // $35
	ENTID_36									dsb $a-6
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
	ENTID_6e									dsb $74-$6e
	ENTID_KEYLOCK								db // $74
	ENTID_75									dsb 7-5
	ENTID_HELPFUL_LADY							db // $77
	ENTID_SLUMS_GUNMAN_FACING_LEFT				db // $78
	ENTID_SLUMS_GUNMAN_BULLET_LEFT				db // $79
	ENTID_SLUMS_GUNMAN_FACING_RIGHT				db // $7a
	ENTID_SLUMS_GUNMAN_BULLET_RIGHT				db // $7b
	ENTID_SLUMS_BULLET_EXPLOSION				db // $7c
	ENTID_SHOP_ANGEL							db // $7d
	ENTID_LAMP									db // $7e
	ENTID_7f									dsb $84-$7f
	ENTID_QUIZ_ANGEL							db // $84
	ENTID_SLUMS_DOG								db // $85
	ENTID_SLUMS_DOG_CHARGING					db // $86
	ENTID_87									dsb $c-$7
	ENTID_SLUMS_BIKER							db // $8c
	ENTID_8d									dsb $91-$8d
	ENTID_SLUMS_GANGSTER						db // $91
	ENTID_SLUMS_PLUMBER							db // $92
	ENTID_93									dsb 9-3
	ENTID_SLUMS_ITEM_PLACER						db // $99
	ENTID_SLUMS_BOTTOM_MIDDLE_KEY				db // $9a
	ENTID_SLUMS_GUNMAN_DOOR						db // $9b
	ENTID_SLUMS_GUNMAN_IN_DOOR					db // $9c
	ENTID_9d									dsb $a2-$9d
	ENTID_PERMANENTLY_REMOVABLE_OBSTACLE		db // $a2
	ENTID_PERMANENTLY_REMOVED_OBSTACLE			db // $a3
	ENTID_DOOR_GUNMAN_BULLET					db // $a4
	ENTID_a5									dsb $f5-$a5
	ENTID_GUY_BEFORE_BOSSES						db // $f5
.ende