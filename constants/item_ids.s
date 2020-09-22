
.enum 0
// pears
	ITEMID_PEAR_FIRST_SCREEN						db // $00
	ITEMID_PEAR_TOPLEFT_CITY						db // $01
	ITEMID_AIRPORT_BUILDING_PEAR					db // $02
	// also keylock for structure in the sea??
	ITEMID_PORT_BOTTOM_LEFT_PEAR					db // $03

// pomegranate
	ITEMID_SLUMS_BOTTOM_LEFT_POMEGRANATE			db // $04
	ITEMID_HOUSES_TOP_RIGHT_POMEGRANATE				db // $05
	ITEMID_WAREHOUSE_ABOVE_RR_POMEGRANATE			db // $06
	ITEMID_FOREST_LOG_POMEGRANATE					db // $07

// apples
	ITEMID_BOSS_1_AREA_HIDDEN_APPLE					db // $08
	ITEMID_CITY_BOTTOM_RIGHT_APPLE					db // $09
	ITEMID_WAREHOUSES_BOTTOM_LEFT_APPLE				db // $0a
	ITEMID_FOREST_TOP_RIGHT_APPLE					db // $0b

// grapes
	ITEMID_HOUSES_HIDDEN_GRAPES						db // $0c
	ITEMID_HOTELS_BOTTOM_RIGHT_GRAPES				db // $0d
	ITEMID_WEST_BEACH_GRAPES						db // $0e
	ITEMID_PRISON_TOP_RIGHT_GRAPES					db // $0f

// bananas
	ITEMID_HOTELS_BANANA_UNDER_CAR					db // $10
	ITEMID_SHIPYARD_TUNNEL_BANANA					db // $11
	ITEMID_BEACH_FISH_HOUSE_BANANA					db // $12
	ITEMID_BANANA_DEEP_IN_PRISON					db // $13

// armor of God
	ITEMID_BELT										db // $14
	ITEMID_ARMOUR									db // $15

// hcs
	ITEMID_CITY_BOTTOM_MID_HC						db // $16
	ITEMID_HOUSES_LEFT_HC							db // $17
	ITEMID_WEST_PARK_HC								db // $18
	ITEMID_AIRPORT_BUILDING_HC						db // $19
	ITEMID_WAREHOUSE_NORTH_HC						db // $1a
	ITEMID_HOTELS_ROOFTOP_HC						db // $1b
	ITEMID_SHIPYARD_BOTTOM_RIGHT_HC					db // $1c
	ITEMID_BEACH_BOTTOM_LEFT_HC						db // $1d
	ITEMID_PRISON_TOP_LEFT_HC						db // $1e

// misc
	ITEMID_CITY_BOSS_KEYLOCK						db // $1f
	ITEMID_20										db // $20 - unused
	ITEMID_VIALBIRD_HIDDEN_ROOM_NEAR_BOSS_1			db // $21
	ITEMID_BEACH_SOUTH_KEYLOCK						db // $22
	ITEMID_SLUMS_TOP_RIGHT_KEYLOCK					db // $23
	ITEMID_24										db // $24
	ITEMID_JAWBONE_KEYLOCK							db // $25
	// unused, if gotten, skips church's welcome text
	ITEMID_26										db // $26
	ITEMID_SLUMS_BOTTOM_MIDDLE_KEY					db // $27
	ITEMID_DEMONS_LAIR_6_TOP_RIGHT_KEYLOCK			db // $28
	ITEMID_SHIPYARD_BOTTOM_LEFT_KEYLOCK				db // $29
// used to communicate between entities (warehouse boss)
// also used for group 16, connecting the 2 paths
	ITEMID_2a										db // $2a
	ITEMID_DEMONS_LAIR_4_WALL_BROKEN				db // $2b
	ITEMID_WAREHOUSE_EAST_KEYLOCK					db // $2c

// 3 permanently removable obstacles
	ITEMID_BRICK_WALL_SLUMS_1ST_HOUSE				db // $2d
	ITEMID_2e										db // $2e
	ITEMID_2f										db // $2f

// used to communicate between entities
	ITEMID_30										db // $30
	ITEMID_31										db // $31
	ITEMID_32										db // $32
	ITEMID_33										db // $33
.ende
