.enum 0
	ENTID_00									db
	ENTID_DEVIL_SPAWN							db // $01
	ENTID_02									dsb 4-2
	ENTID_BALLOON_GUY							db // $04
	ENTID_SUNGLASSES_KNIFE_GUY					db // $05
	ENTID_CRAZY_EYES_CLUB_GUY					db // $06
	ENTID_CIRCLING_ALCOHOLIC					db // $07
	// TODO: 16 and 17 are dropped birds
	ENTID_08									dsb $19-8
	ENTID_RUNNING_CITY_GUY						db // $19
	ENTID_BLOCKAGE_BUILDER						db // $1a
	ENTID_1b									dsb $d-$b
	ENTID_SLOW_CITY_GUY							db // $1d
	ENTID_1e									dsb $21-$1e
	ENTID_DYNAMITE_BUILDER						db // $21
	ENTID_CITY_PLUMBER_1						db // $22
	ENTID_23									dsb $d-3
	// creates text and NPC
	ENTID_ITEM_ROOM_ANGEL						db // $2d
	ENTID_PEAR									db // $2e
	ENTID_2f									dsb $33-$2f
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
	ENTID_42									dsb 9-2
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
	ENTID_56									dsb $b-6
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
	ENTID_6c									db
	ENTID_HEART_CONTAINER						db // $6d
	ENTID_6e									dsb $74-$6e
	ENTID_KEYLOCK								db // $74
	ENTID_75									dsb $84-$75
	ENTID_QUIZ_ANGEL							db // $84
	ENTID_85									dsb $f5-$85
	ENTID_GUY_BEFORE_BOSSES						db // $f5
.ende