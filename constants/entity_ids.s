.enum 0
	ENTID_DEAD_ENEMY_PRAYING					db // $00
	ENTID_DEVIL_SPAWN							db // $01
	ENTID_DEVIL_SPAWN_DEATH						db // $02
	ENTID_STUB_03								db // $03
	ENTID_MISC_NPC								db // $04
	ENTID_SUNGLASSES_KNIFE_GUY					db // $05
	ENTID_CRAZY_EYES_CLUB_GUY					db // $06
	ENTID_CIRCLING_ALCOHOLIC					db // $07
	ENTID_HOUSES_GRAFFITI_GUY					db // $08
	ENTID_HOUSES_NINJA							db // $09
	ENTID_HOUSES_PACING_OLD_MAN					db // $0a
	ENTID_HOUSES_DRIVER_SPAWNER					db // $0b
	ENTID_HOUSES_DRIVER_SPEED_3					db // $0c
	ENTID_HOUSES_DRIVER_SPEED_2					db // $0d
	ENTID_HOUSES_DRIVER_SPEED_5					db // $0e
	ENTID_HOUSES_DRIVER_SPEED_6					db // $0f
	ENTID_FOREST_ARCHER							db // $10
	ENTID_FOREST_ARCHER_SHOOTING				db // $11
	ENTID_FOREST_ARCHER_ARROW					db // $12
	ENTID_FOREST_SLOW_AXEMAN					db // $13
	ENTID_FOREST_CHIMNEY_SMOKE					db // $14
	ENTID_RAILROAD_TICKET						db // $15
	ENTID_DROPPED_1_BIRD						db // $16
	ENTID_DROPPED_5_BIRDS						db // $17
	ENTID_DROPPED_1_FULL_HEART					db // $18
	ENTID_RUNNING_CITY_GUY						db // $19
	ENTID_BLOCKAGE_BUILDER						db // $1a
	ENTID_CITY_BANDIT							db // $1b
	ENTID_BAR_SLOW_GUY_SPAWNER					db // $1c
	ENTID_SLOW_CITY_GUY							db // $1d
	ENTID_FOREST_DRAGON							db // $1e
	ENTID_FOREST_CLUBMAN						db // $1f
	ENTID_20									db
	ENTID_DYNAMITE_BUILDER						db // $21
	ENTID_CITY_PLUMBER_1						db // $22
	ENTID_SHIPYARD_GUNMAN						db // $23
	ENTID_SHIPYARD_SAILOR						db // $24
	ENTID_SHIPYARD_DOG							db // $25
	ENTID_SHIPYARD_GUNMAN_BULLET				db // $26
	ENTID_27									db
	ENTID_HOTELS_BIKER							db // $28
	ENTID_HOTELS_ALCOHOLIC						db // $29
	ENTID_HOTELS_DISAPPEARING_CAR_1				db // $2a
	ENTID_HOTELS_DISAPPEARING_CAR_2				db // $2b
	ENTID_HOTELS_BIKER_THIN_CAR_PATH			db // $2c
	ENTID_ITEM_ROOM_ANGEL						db // $2d
	ENTID_PEAR									db // $2e
	ENTID_POMEGRANATE							db // $2f
	ENTID_APPLE									db // $30
	ENTID_GRAPES								db // $31
	ENTID_BANANA								db // $32
	ENTID_PRICE_BIRD							db // $33
	ENTID_BELT_OF_TRUTH							db // $34
	ENTID_BREASTPLATE_OF_RIGHTEOUSNESS			db // $35
	ENTID_BOOTS_OF_THE_GOSPEL					db // $36
	ENTID_SHIELD_OF_FAITH						db // $37
	ENTID_HELMET_OF_SALVATION					db // $38
	ENTID_SWORD_OF_THE_SPIRIT					db // $39
	ENTID_SHOP_7_VIALS							db // $3a
	ENTID_SHOP_OIL								db // $3b
	ENTID_BIRDS_HIDDEN_ROOM_NEAR_BOSS_1			db // $3c
	ENTID_VIALS_HIDDEN_ROOM_NEAR_BOSS_1			db // $3d
	// objects that disappear if the item normally used to bypass it,
	// gets taken, or if the item it leads to has been gotten
	ENTID_DISAPPEARING_OBSTACLE					db // $3e
	ENTID_DROPPED_10_BIRDS						db // $3f
	ENTID_40									db
	ENTID_RAFT									db // $41
	ENTID_CITY_BANDIT_BLOCKER					db // $42
	ENTID_HOTEL_HIGHRISE_GUNNER_1				db // $43
	ENTID_HOTEL_HIGHRISE_GUNNER_2				db // $44
	ENTID_HOUSES_STATIC_BALLOON					db // $45
	ENTID_46									db
	ENTID_FOREST_CABIN_FIREPLACE				db // $47
	ENTID_CHURCH_FLAMES							db // $48
	ENTID_CITY_PLUMBER_2						db // $49
	ENTID_SHIPYARD_BUOY							db // $4a
	ENTID_LADDER_CLIMBER						db // $4b
	ENTID_GRAFFITIER_SK							db // $4c
	ENTID_GRAFFITIER_MESSY						db // $4d
	ENTID_FOREST_BEE_SWARM						db // $4e
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
	// or other way around??
	ENTID_HOTEL_GUNNER_BULLET					db // $58
	ENTID_HOTEL_GUNNER_BALLOON					db // $59
	ENTID_BALLOON_POP							db // $5a
	ENTID_BASKETBALLER_CTRLER					db // $5b
	ENTID_5c									db
	ENTID_BOSS_1								db // $5d
	// ??, also 5c shares this code
	ENTID_BOSS_1_CTRLER							db // $5e
	ENTID_5f									dsb $60-$5f
	ENTID_CITY_BOSS_HELPER						db // $60
	ENTID_CITY_BOSS								db // $61
	ENTID_BEACH_BOSS_HELPER						db // $62
	ENTID_BEACH_BOSS							db // $63
	ENTID_BEACH_BOSS_BALLOON					db // $64
	ENTID_65									dsb $a-5
	ENTID_TESTROOM_TEXT							db // $6a
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
	ENTID_ENEMY_ITEM_EXPLOSION					db // $7c
	ENTID_SHOP_ANGEL							db // $7d
	ENTID_LAMP									db // $7e
	ENTID_BEACH_UP_AND_DOWN_SHARKS				db // $7f
	ENTID_80									dsb 3-0
	ENTID_CHURCH_TIPS							db // $83
	ENTID_QUIZ_ANGEL							db // $84
	ENTID_SLUMS_DOG								db // $85
	ENTID_SLUMS_DOG_CHARGING					db // $86
	ENTID_87									db
	ENTID_BEACH_UNDEGROUND_FISHES				db // $88
	ENTID_BEACH_DUCKS							db // $89
	ENTID_BEACH_SECRET_ROOM_HIDER				db // $8a
	ENTID_BEACH_SECRET_ROOM_TEXT				db // $8b
	ENTID_SLUMS_BIKER							db // $8c
	ENTID_BEACH_FAST_NAKED_GUY					db // $8d
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
	ENTID_BEACH_SKATEBOARDER					db // $aa
	ENTID_BEACH_SKATEBOARDER_BOTTLE				db // $ab
	ENTID_BEACH_ENCIRCLING_SHARKS				db // $ac
	ENTID_ad									dsb $f-$d
	ENTID_FINAL_BOSS_SHIELD						db // $af
	ENTID_b0									dsb 4-0
	ENTID_TESTROOM_ARMOUR_OF_GOD				db // $b4
	ENTID_TESTROOM_SPECIAL_B_ITEMS				db // $b5
	ENTID_TESTROOM_HEARTS_BIRDS_BOMBS_OILS		db // $b6
	ENTID_TESTROOM_FRUITS						db // $b7
	ENTID_TESTROOM_ANGEL						db // $b8
	ENTID_b9									dsb $f-9
	ENTID_PRISONER								db // $bf
	ENTID_c0									dsb 2-0
	ENTID_PRISON_POLICEMAN						db // $c2
	ENTID_c3									dsb 5-3
	ENTID_PRISON_DOGS							db // $c5
	ENTID_DEMONS_LAIR_RUNNING_DEMON_1			db // $c6
	ENTID_DEMONS_LAIR_RUNNING_DEMON_2			db // $c7
	ENTID_RUNNING_DEMON_SPAWN_CLOUD				db // $c8
	ENTID_DEMONS_LAIR_RUNNING_DEMON_3			db // $c9
	ENTID_DEMONS_LAIR_RUNNING_DEMON_4			db // $ca
	ENTID_DEMONS_LAIR_RUNNING_DEMON_5			db // $cb
	ENTID_DEMONS_LAIR_RUNNING_DEMON_6			db // $cc
	ENTID_DEMONS_LAIR_INVISIBLE_DEMON			db // $cd
	// spawned from invisible demon
	ENTID_ce									db
	ENTID_DEMONS_LAIR_LAVA_DEMON				db // $cf
	// rare thing spawned from lava demon
	ENTID_d0									db
	ENTID_SPAWNED_DEMON							db // $d1
	ENTID_DEMON_FIREBALL						db // $d2
	ENTID_DEMON_SPAWN_CLOUD						db // $d3
	ENTID_DEMON_SPAWNER							db // $d4
	ENTID_DEMONS_LAIR_INVISIBLE_DEMON_2			db // $d5
	ENTID_DEMONS_LAIR_STAIRS					db // $d6
	ENTID_SPAWNED_DEMON_2						db // $d7
	ENTID_DEMON_SPAWNER_2						db // $d8
	ENTID_PRISON_FLEEING_DEMON_1				db // $d9
	ENTID_PRISON_FLEEING_DEMON_2				db // $da
	ENTID_DEMONS_LAIR_MONKEY_DEMON				db // $db
	ENTID_DEMONS_LAIR_BREAKABLE_WALL			db // $dc
	ENTID_db									dsb $e2-$dd
	ENTID_DEMONS_LAIR_4_BREAKABLE_WALL			db // $e2
	ENTID_e3									db
	ENTID_PRISON_LOCK							db // $e4
	ENTID_e5									db // $e5
	ENTID_FOREST_BOMB_BOSS						db // $e6
	ENTID_e7									db
	ENTID_WAREHOUSE_BOSS_HELPER_TODO_1			db // $e8
	ENTID_WAREHOUSE_BOSS_HELPER_TODO_2			db // $e9
	ENTID_WAREHOUSE_SLOW_BULLET_BOSS			db // $ea
	ENTID_WAREHOUSE_BOSS_HELPER_BULLET			db // $eb
	ENTID_ec									db
	ENTID_DEMONS_LAIR_BOSS_BLOOD_DROP			db // $ed
	ENTID_DEMONS_LAIR_BOSS_BLOOD_ENEMY			db // $ee
	ENTID_DEMONS_LAIR_BOSS_BLOOD_DROP_SPAWNER	db // $ef
	ENTID_DEMONS_LAIR_BOSS_HAND					db // $f0
	ENTID_DEMONS_LAIR_BOSS_FLYING_DEMON			db // $f1
	ENTID_DEMONS_LAIR_BOSS_FLYING_DEMON_2		db // $f2
	ENTID_f3									dsb 5-3
	ENTID_GUY_BEFORE_BOSSES						db // $f5
.ende