.enum 0
	ENTID_00									db
	ENTID_DEVIL_SPAWN							db // $01
	ENTID_02									dsb 4-2
	ENTID_BALLOON_GUY							db // $04
	ENTID_SUNGLASSES_KNIFE_GUY					db // $05
	ENTID_CRAZY_EYES_CLUB_GUY					db // $06
	ENTID_CIRCLING_ALCOHOLIC					db // $07
	ENTID_08									dsb $2d-8
	// creates text and NPC
	ENTID_ITEM_ROOM								db // $2d
	ENTID_ITEM_ROOM_FAIRY						db // $2e
	ENTID_2f									dsb $3e-$2f
	// objects that disappear if the item normally used to bypass it,
	// gets taken, or if the item it leads to has been gotten
	ENTID_DISAPPEARING_OBSTACLE					db // $3e
	ENTID_3f									dsb $41-$3f
	ENTID_RAFT									db // $41
	ENTID_42									dsb $b-2
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
	ENTID_5c									dsb $6b-$5c
	ENTID_TRAIN_GUY								db // $6b
	ENTID_6c									db
	ENTID_HEART_CONTAINER						db // $6d
	ENTID_6e									dsb $f5-$6e
	ENTID_GUY_BEFORE_BOSSES						db // $f5
.ende