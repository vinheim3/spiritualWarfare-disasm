roomGroupStructsData:
// width, height
// group's vram tile idx offset in map screen
// group name in map, line 1
// group name in map, line 2
// pointer to room structs
// ??? - byte 0 is the bank containing the room structs
//     - byte 5th from last goes into c728
//     - last 4 into words c724 and c726
//     - if byte 1 is not $ff, copy currRoomGroup to $c715
//     - bytes 2 to 6 are reset variables (room x,y, player x,y, unknown)

//  ________________________________
// |           |         |         |
// |     0     |    6    |    2    |
// |           |_________|         |
// |___________|         |_________|
// |   |       |         |         |
// |   |   4   |    1    |    a    |
// |   |_______|         |_____    |
// |     |     |_________|     |   |
// |  7  |  8  |       |   d   |___|
// |     |     |   c   |       |   |
// |     |_____|      _|_______|   |
// |     |           |      b      |
// |_____|___________|_____________|

// room group 00
	.db $06 $04
	.dw $9842
	.asc " PARK  "
	.asc "       "
	.dw group00pointersToRoomStructs
	.db $02 $00 $01 $02 $40 $50 $06 $24 $1b $00 $1b $00

// room group 01
	.db $05 $05
	.dw $98a8
	.asc " DOWN- "
	.asc " TOWN  "
	.dw group01pointersToRoomStructs
	.db $02 $01 $00 $00 $18 $68 $06 $9b $1b $00 $1b $00

// room group 02
	.db $05 $04
	.dw $984d
	.asc " SLUMS "
	.asc "       "
	.dw group02pointersToRoomStructs
	.db $03 $02 $00 $03 $10 $88 $00 $24 $1b $00 $1b $00

// room group 03
	.db $03 $03
	.dw $ffff
	.asc "INSIDE "
	.asc "SLUMS  "
	.dw group03pointersToRoomStructs
	.db $03 $ff $01 $02 $80 $64 $00 $24 $1b $00 $1b $00

// room group 04
	.db $04 $03
	.dw $98c4
	.asc "AIRPORT"
	.asc "       "
	.dw group04pointersToRoomStructs
	.db $03 $04 $03 $02 $e0 $70 $09 $9a $1b $00 $1b $00

// room group 05
	.db $03 $03
	.dw $ffff
	.asc "INSIDE "
	.asc "AIRPORT"
	.dw group05pointersToRoomStructs
	.db $03 $ff $01 $02 $80 $64 $00 $9a $1b $00 $1b $00

// room group 06
	.db $05 $03
	.dw $9848
	.asc "PRISON "
	.asc "       "
	.dw group06pointersToRoomStructs
	.db $04 $06 $04 $01 $e0 $48 $09 $9a $1b $00 $1b $00

// room group 07
	.db $03 $09
	.dw $98c2
	.asc "WARE   "
	.asc "HOUSE  "
	.dw group07pointersToRoomStructs
	.db $03 $07 $01 $02 $e0 $70 $09 $9b $1b $00 $1b $00

// room group 08
	.db $03 $04
	.dw $9925
	.asc "HOTELS "
	.asc "       "
	.dw group08pointersToRoomStructs
	.db $02 $08 $00 $01 $10 $70 $00 $24 $1b $00 $1b $00

// room group 09
	.db $05 $05
	.dw $ffff
	.asc "UNDER- "
	.asc "GROUND "
	.dw group09pointersToRoomStructs
	.db $02 $ff $01 $02 $80 $64 $00 $24 $1b $00 $1b $00

// room group 0a
	.db $05 $05
	.dw $98cd
	.asc "HOUSES "
	.asc "       "
	.dw group0apointersToRoomStructs
	.db $02 $0a $00 $02 $20 $78 $00 $9a $1b $00 $1b $00

// room group 0b
	.db $07 $04
	.dw $996b
	.asc "BEACH  "
	.asc "       "
	.dw group0bpointersToRoomStructs
	.db $03 $0b $03 $02 $70 $10 $06 $9b $1b $00 $1b $00

// room group 0c
	.db $07 $05
	.dw $9945
	.asc "SHIP   "
	.asc "YARD   "
	.dw group0cpointersToRoomStructs
	.db $02 $0c $03 $01 $10 $68 $00 $9a $1b $00 $1b $00

// room group 0d
	.db $04 $04
	.dw $992c
	.asc "WOODS  "
	.asc "       "
	.dw group0dpointersToRoomStructs
	.db $02 $0d $02 $03 $70 $90 $03 $24 $1b $00 $1b $00

// room group 0e
	.db $04 $01
	.dw $ffff
	.asc " CITY  "
	.asc " ROOF  "
	.dw group0epointersToRoomStructs
	.db $02 $ff $01 $02 $80 $64 $00 $9b $1b $00 $1b $00

// room group 0f
	.db $05 $05
	.dw $ffff
	.asc "INSIDE "
	.asc "       "
	.dw group0fpointersToRoomStructs
	.db $02 $ff $01 $02 $80 $64 $00 $9b $1b $00 $1b $00

// room group 10
	.db $04 $05
	.dw $ffff
	.asc "       "
	.asc "       "
	.dw group10pointersToRoomStructs
	.db $03 $ff $01 $02 $80 $64 $00 $24 $1b $00 $1b $00

// room group 11
	.db $04 $02
	.dw $ffff
	.asc "CELL   "
	.asc "BLOCK  "
	.dw group11pointersToRoomStructs
	.db $04 $ff $01 $02 $80 $64 $00 $9a $1b $00 $1b $00

// room group 12
	.db $01 $01
	.dw $ffff
	.asc "CHURCH "
	.asc "       "
	.dw group12pointersToRoomStructs
	.db $02 $ff $01 $02 $80 $64 $00 $24 $1b $00 $1b $00

// room group 13
	.db $02 $02
	.dw $ffff
	.asc "PIER   "
	.asc "       "
	.dw group13pointersToRoomStructs
	.db $03 $ff $01 $02 $80 $64 $00 $9a $1b $00 $1b $00

// room group 14
	.db $02 $03
	.dw $ffff
	.asc "TRAIN  "
	.asc "STATION"
	.dw group14pointersToRoomStructs
	.db $03 $ff $01 $02 $80 $64 $00 $24 $1b $00 $1b $00

// room group 15
	.db $03 $04
	.dw $ffff
	.asc "DEMON'S"
	.asc "LAIR  1"
	.dw group15pointersToRoomStructs
	.db $04 $15 $00 $00 $20 $48 $06 $24 $1b $00 $1b $00

// room group 16
	.db $04 $06
	.dw $ffff
	.asc "DEMON'S"
	.asc "LAIR  2"
	.dw group16pointersToRoomStructs
	.db $04 $15 $00 $00 $20 $48 $06 $24 $1b $00 $1b $00

// room group 17
	.db $04 $03
	.dw $ffff
	.asc "DEMON'S"
	.asc "LAIR  3"
	.dw group17pointersToRoomStructs
	.db $04 $15 $00 $00 $20 $48 $06 $24 $1b $00 $1b $00

// room group 18
	.db $03 $03
	.dw $ffff
	.asc "DEMON'S"
	.asc "LAIR  4"
	.dw group18pointersToRoomStructs
	.db $04 $15 $00 $00 $20 $48 $06 $24 $1b $00 $1b $00

// room group 19
	.db $07 $08
	.dw $ffff
	.asc "DEMON'S"
	.asc "LAIR  5"
	.dw group19pointersToRoomStructs
	.db $04 $15 $00 $00 $20 $48 $06 $24 $1b $00 $1b $00

// room group 1a
	.db $06 $04
	.dw $ffff
	.asc "DEMON'S"
	.asc "LAIR  6"
	.dw group1apointersToRoomStructs
	.db $04 $15 $00 $00 $20 $48 $06 $24 $1b $00 $1b $00

// room group 1b
	.db $03 $03
	.dw $ffff
	.asc "       "
	.asc "       "
	.dw group1bpointersToRoomStructs
	.db $03 $ff $01 $02 $80 $64 $00 $24 $1b $00 $1b $00

// room group 1c
	.db $03 $09
	.dw $ffff
	.asc "       "
	.asc "       "
	.dw group1cpointersToRoomStructs
	.db $02 $ff $01 $02 $80 $64 $00 $24 $1b $00 $1b $00

// room group 1d
	.db $07 $07
	.dw $ffff
	.asc "LOST   "
	.asc "AT SEA "
	.dw group1dpointersToRoomStructs
	.db $03 $0b $03 $02 $70 $10 $06 $24 $1b $00 $1b $00

// room group 1e
	.db $03 $03
	.dw $ffff
	.asc "       "
	.asc "       "
	.dw group1epointersToRoomStructs
	.db $03 $07 $01 $02 $e0 $70 $09 $9b $1b $00 $1b $00

// room group 1f
	.db $01 $02
	.dw $ffff
	.asc " BEACH "
	.asc " HOUSE "
	.dw group1fpointersToRoomStructs
	.db $03 $0b $03 $02 $70 $10 $06 $24 $1b $00 $1b $00

// room group 20
	.db $01 $01
	.dw $ffff
	.asc "BOSS   "
	.asc "ROOM 1 "
	.dw group20pointersToRoomStructs
	.db $02 $09 $01 $00 $40 $70 $00 $24 $1b $00 $1b $00

// room group 21
	.db $01 $01
	.dw $ffff
	.asc "BOSS   "
	.asc "ROOM 2 "
	.dw group21pointersToRoomStructs
	.db $02 $0f $01 $02 $e0 $40 $00 $24 $1b $00 $1b $00

// room group 22
	.db $01 $01
	.dw $ffff
	.asc "BOSS   "
	.asc "ROOM 3 "
	.dw group22pointersToRoomStructs
	.db $04 $07 $02 $05 $d0 $49 $00 $24 $1b $00 $1b $00

// room group 23
	.db $01 $01
	.dw $ffff
	.asc "BOSS   "
	.asc "ROOM 4 "
	.dw group23pointersToRoomStructs
	.db $04 $0d $01 $00 $70 $78 $00 $24 $1b $00 $1b $00

// room group 24
	.db $01 $01
	.dw $ffff
	.asc "BOSS   "
	.asc "ROOM 5 "
	.dw group24pointersToRoomStructs
	.db $02 $0b $06 $03 $b0 $70 $00 $24 $1b $00 $1b $00

// room group 25
	.db $01 $01
	.dw $ffff
	.asc "BOSS   "
	.asc "ROOM 6 "
	.dw group25pointersToRoomStructs
	.db $04 $16 $01 $02 $20 $28 $00 $24 $1b $00 $1b $00

// room group 26
	.db $01 $01
	.dw $ffff
	.asc " FINAL "
	.asc " BOSS  "
	.dw group26pointersToRoomStructs
	.db $03 $1a $01 $02 $30 $89 $00 $24 $1b $00 $1b $00

group1epointersToRoomStructs:
	.dw group1eroom00struct
	.dw group1eroom01struct
	.dw group1eroom02struct
	.dw group1eroom03struct
	.dw group1eroom04struct
	.dw group1eroom05struct
	.dw group1eroom06struct
	.dw group1eroom07struct
	.dw group1eroom08struct

group1bpointersToRoomStructs:
	.dw group1broom00struct
	.dw group1broom01struct
	.dw group1broom02struct
	.dw group1broom03struct
	.dw group1broom04struct
	.dw group1broom05struct
	.dw group1broom06struct
	.dw group1broom07struct
	.dw group1broom08struct

group14pointersToRoomStructs:
	.dw group14room00struct
	.dw group14room01struct
	.dw group14room02struct
	.dw group14room03struct
	.dw group14room04struct
	.dw group14room05struct

group13pointersToRoomStructs:
	.dw group13room00struct
	.dw group13room01struct
	.dw group13room02struct
	.dw group13room03struct

group10pointersToRoomStructs:
	.dw group10room00struct
	.dw group10room01struct
	.dw group10room02struct
	.dw group10room03struct
	.dw group10room04struct
	.dw group10room05struct
	.dw group10room06struct
	.dw group10room07struct
	.dw group10room08struct
	.dw group10room09struct
	.dw group10room0astruct
	.dw group10room0bstruct
	.dw group10room0cstruct
	.dw group10room0dstruct
	.dw group10room0estruct
	.dw group10room0fstruct
	.dw group10room10struct
	.dw group10room11struct
	.dw group10room12struct
	.dw group10room13struct

group07pointersToRoomStructs:
	.dw group07room00struct
	.dw group07room01struct
	.dw group07room02struct
	.dw group07room03struct
	.dw group07room04struct
	.dw group07room05struct
	.dw group07room06struct
	.dw group07room07struct
	.dw group07room08struct
	.dw group07room09struct
	.dw group07room0astruct
	.dw group07room0bstruct
	.dw group07room0cstruct
	.dw group07room0dstruct
	.dw group07room0estruct
	.dw group07room0fstruct
	.dw group07room10struct
	.dw group07room11struct
	.dw group07room12struct
	.dw group07room13struct
	.dw group07room14struct
	.dw group07room15struct
	.dw group07room16struct
	.dw group07room17struct
	.dw group07room18struct
	.dw group07room19struct
	.dw group07room1astruct

group1fpointersToRoomStructs:
	.dw group1froom00struct
	.dw group1froom01struct

group0bpointersToRoomStructs:
	.dw group0broom00struct
	.dw group0broom01struct
	.dw group0broom02struct
	.dw group0broom03struct
	.dw group0broom04struct
	.dw group0broom05struct
	.dw group0broom06struct
	.dw group0broom07struct
	.dw group0broom08struct
	.dw group0broom09struct
	.dw group0broom0astruct
	.dw group0broom0bstruct
	.dw group0broom0cstruct
	.dw group0broom0dstruct
	.dw group0broom0estruct
	.dw group0broom0fstruct
	.dw group0broom10struct
	.dw group0broom11struct
	.dw group0broom12struct
	.dw group0broom13struct
	.dw group0broom14struct
	.dw group0broom15struct
	.dw group0broom16struct
	.dw group0broom17struct
	.dw group0broom18struct
	.dw group0broom19struct
	.dw group0broom1astruct
	.dw group0broom1bstruct

group1dpointersToRoomStructs:
	.dw group1droom00struct
	.dw group1droom01struct
	.dw group1droom02struct
	.dw group1droom03struct
	.dw group1droom04struct
	.dw group1droom05struct
	.dw group1droom06struct
	.dw group1droom07struct
	.dw group1droom08struct
	.dw group1droom09struct
	.dw group1droom0astruct
	.dw group1droom0bstruct
	.dw group1droom0cstruct
	.dw group1droom0dstruct
	.dw group1droom0estruct
	.dw group1droom0fstruct
	.dw group1droom10struct
	.dw group1droom11struct
	.dw group1droom12struct
	.dw group1droom13struct
	.dw group1droom14struct
	.dw group1droom15struct
	.dw group1droom16struct
	.dw group1droom17struct
	.dw group1droom18struct
	.dw group1droom19struct
	.dw group1droom1astruct
	.dw group1droom1bstruct
	.dw group1droom1cstruct
	.dw group1droom1dstruct
	.dw group1droom1estruct
	.dw group1droom1fstruct
	.dw group1droom20struct
	.dw group1droom21struct
	.dw group1droom22struct
	.dw group1droom23struct
	.dw group1droom24struct
	.dw group1droom25struct
	.dw group1droom26struct
	.dw group1droom27struct
	.dw group1droom28struct
	.dw group1droom29struct
	.dw group1droom2astruct
	.dw group1droom2bstruct
	.dw group1droom2cstruct
	.dw group1droom2dstruct
	.dw group1droom2estruct
	.dw group1droom2fstruct
	.dw group1droom30struct

group02pointersToRoomStructs:
	.dw group02room00struct
	.dw group02room01struct
	.dw group02room02struct
	.dw group02room03struct
	.dw group02room04struct
	.dw group02room05struct
	.dw group02room06struct
	.dw group02room07struct
	.dw group02room08struct
	.dw group02room09struct
	.dw group02room0astruct
	.dw group02room0bstruct
	.dw group02room0cstruct
	.dw group02room0dstruct
	.dw group02room0estruct
	.dw group02room0fstruct
	.dw group02room10struct
	.dw group02room11struct
	.dw group02room12struct
	.dw group02room13struct

group03pointersToRoomStructs:
	.dw group03room00struct
	.dw group03room01struct
	.dw group03room02struct
	.dw group03room03struct
	.dw group03room04struct
	.dw group03room05struct
	.dw group03room06struct
	.dw group03room07struct
	.dw group03room08struct

group04pointersToRoomStructs:
	.dw group04room00struct
	.dw group04room01struct
	.dw group04room02struct
	.dw group04room03struct
	.dw group04room04struct
	.dw group04room05struct
	.dw group04room06struct
	.dw group04room07struct
	.dw group04room08struct
	.dw group04room09struct
	.dw group04room0astruct
	.dw group04room0bstruct

group05pointersToRoomStructs:
	.dw group05room00struct
	.dw group05room01struct
	.dw group05room02struct
	.dw group05room03struct
	.dw group05room04struct
	.dw group05room05struct
	.dw group05room06struct
	.dw group05room07struct
	.dw group05room08struct

group26pointersToRoomStructs:
	.dw group26room00struct

group0dpointersToRoomStructs:
	.dw group0droom00struct
	.dw group0droom01struct
	.dw group0droom02struct
	.dw group0droom03struct
	.dw group0droom04struct
	.dw group0droom05struct
	.dw group0droom06struct
	.dw group0droom07struct
	.dw group0droom08struct
	.dw group0droom09struct
	.dw group0droom0astruct
	.dw group0droom0bstruct
	.dw group0droom0cstruct
	.dw group0droom0dstruct
	.dw group0droom0estruct
	.dw group0droom0fstruct

group0apointersToRoomStructs:
	.dw group0aroom00struct
	.dw group0aroom01struct
	.dw group0aroom02struct
	.dw group0aroom03struct
	.dw group0aroom04struct
	.dw group0aroom05struct
	.dw group0aroom06struct
	.dw group0aroom07struct
	.dw group0aroom08struct
	.dw group0aroom09struct
	.dw group0aroom0astruct
	.dw group0aroom0bstruct
	.dw group0aroom0cstruct
	.dw group0aroom0dstruct
	.dw group0aroom0estruct
	.dw group0aroom0fstruct
	.dw group0aroom10struct
	.dw group0aroom11struct
	.dw group0aroom12struct
	.dw group0aroom13struct
	.dw group0aroom14struct
	.dw group0aroom15struct
	.dw group0aroom16struct
	.dw group0aroom17struct
	.dw group0aroom18struct

group0cpointersToRoomStructs:
	.dw group0croom00struct
	.dw group0croom01struct
	.dw group0croom02struct
	.dw group0croom03struct
	.dw group0croom04struct
	.dw group0croom05struct
	.dw group0croom06struct
	.dw group0croom07struct
	.dw group0croom08struct
	.dw group0croom09struct
	.dw group0croom0astruct
	.dw group0croom0bstruct
	.dw group0croom0cstruct
	.dw group0croom0dstruct
	.dw group0croom0estruct
	.dw group0croom0fstruct
	.dw group0croom10struct
	.dw group0croom11struct
	.dw group0croom12struct
	.dw group0croom13struct
	.dw group0croom14struct
	.dw group0croom15struct
	.dw group0croom16struct
	.dw group0croom17struct
	.dw group0croom18struct
	.dw group0croom19struct
	.dw group0croom1astruct
	.dw group0croom1bstruct
	.dw group0croom1cstruct
	.dw group0croom1dstruct
	.dw group0croom1estruct
	.dw group0croom1fstruct
	.dw group0croom20struct
	.dw group0croom21struct
	.dw group0croom22struct

group08pointersToRoomStructs:
	.dw group08room00struct
	.dw group08room01struct
	.dw group08room02struct
	.dw group08room03struct
	.dw group08room04struct
	.dw group08room05struct
	.dw group08room06struct
	.dw group08room07struct
	.dw group08room08struct
	.dw group08room09struct
	.dw group08room0astruct
	.dw group08room0bstruct

group00pointersToRoomStructs:
	.dw group00room00struct
	.dw group00room01struct
	.dw group00room02struct
	.dw group00room03struct
	.dw group00room04struct
	.dw group00room05struct
	.dw group00room06struct
	.dw group00room07struct
	.dw group00room08struct
	.dw group00room09struct
	.dw group00room0astruct
	.dw group00room0bstruct
	.dw group00room0cstruct
	.dw group00room0dstruct
	.dw group00room0estruct
	.dw group00room0fstruct
	.dw group00room10struct
	.dw group00room11struct
	.dw group00room12struct
	.dw group00room13struct
	.dw group00room14struct
	.dw group00room15struct
	.dw group00room16struct
	.dw group00room17struct

group01pointersToRoomStructs:
	.dw group01room00struct
	.dw group01room01struct
	.dw group01room02struct
	.dw group01room03struct
	.dw group01room04struct
	.dw group01room05struct
	.dw group01room06struct
	.dw group01room07struct
	.dw group01room08struct
	.dw group01room09struct
	.dw group01room0astruct
	.dw group01room0bstruct
	.dw group01room0cstruct
	.dw group01room0dstruct
	.dw group01room0estruct
	.dw group01room0fstruct
	.dw group01room10struct
	.dw group01room11struct
	.dw group01room12struct
	.dw group01room13struct
	.dw group01room14struct
	.dw group01room15struct
	.dw group01room16struct
	.dw group01room17struct
	.dw group01room18struct

group09pointersToRoomStructs:
	.dw group09room00struct
	.dw group09room01struct
	.dw group09room02struct
	.dw group09room03struct
	.dw group09room04struct
	.dw group09room05struct
	.dw group09room06struct
	.dw group09room07struct
	.dw group09room08struct
	.dw group09room09struct
	.dw group09room0astruct
	.dw group09room0bstruct
	.dw group09room0cstruct
	.dw group09room0dstruct
	.dw group09room0estruct
	.dw group09room0fstruct
	.dw group09room10struct
	.dw group09room11struct
	.dw group09room12struct
	.dw group09room13struct
	.dw group09room14struct
	.dw group09room15struct
	.dw group09room16struct
	.dw group09room17struct
	.dw group09room18struct

group0epointersToRoomStructs:
	.dw group0eroom00struct
	.dw group0eroom01struct
	.dw group0eroom02struct
	.dw group0eroom03struct

group0fpointersToRoomStructs:
	.dw group0froom00struct
	.dw group0froom01struct
	.dw group0froom02struct
	.dw group0froom03struct
	.dw group0froom04struct
	.dw group0froom05struct
	.dw group0froom06struct
	.dw group0froom07struct
	.dw group0froom08struct
	.dw group0froom09struct
	.dw group0froom0astruct
	.dw group0froom0bstruct
	.dw group0froom0cstruct
	.dw group0froom0dstruct
	.dw group0froom0estruct
	.dw group0froom0fstruct
	.dw group0froom10struct
	.dw group0froom11struct
	.dw group0froom12struct
	.dw group0froom13struct
	.dw group0froom14struct
	.dw group0froom15struct
	.dw group0froom16struct
	.dw group0froom17struct
	.dw group0froom18struct

group12pointersToRoomStructs:
	.dw group12room00struct

group1cpointersToRoomStructs:
	.dw group1croom00struct
	.dw group1croom01struct
	.dw group1croom02struct
	.dw group1croom03struct
	.dw group1croom04struct
	.dw group1croom05struct
	.dw group1croom06struct
	.dw group1croom07struct
	.dw group1croom08struct
	.dw group1croom09struct
	.dw group1croom0astruct
	.dw group1croom0bstruct
	.dw group1croom0cstruct
	.dw group1croom0dstruct
	.dw group1croom0estruct
	.dw group1croom0fstruct
	.dw group1croom10struct
	.dw group1croom11struct
	.dw group1croom12struct
	.dw group1croom13struct
	.dw group1croom14struct
	.dw group1croom15struct
	.dw group1croom16struct
	.dw group1croom17struct
	.dw group1croom18struct
	.dw group1croom19struct
	.dw group1croom1astruct

group20pointersToRoomStructs:
	.dw group20room00struct

group21pointersToRoomStructs:
	.dw group21room00struct

group24pointersToRoomStructs:
	.dw group24room00struct

group06pointersToRoomStructs:
	.dw group06room00struct
	.dw group06room01struct
	.dw group06room02struct
	.dw group06room03struct
	.dw group06room04struct
	.dw group06room05struct
	.dw group06room06struct
	.dw group06room07struct
	.dw group06room08struct
	.dw group06room09struct
	.dw group06room0astruct
	.dw group06room0bstruct
	.dw group06room0cstruct
	.dw group06room0dstruct
	.dw group06room0estruct

group11pointersToRoomStructs:
	.dw group11room00struct
	.dw group11room01struct
	.dw group11room02struct
	.dw group11room03struct
	.dw group11room04struct
	.dw group11room05struct
	.dw group11room06struct
	.dw group11room07struct

group15pointersToRoomStructs:
	.dw group15room00struct
	.dw group15room01struct
	.dw group15room02struct
	.dw group15room03struct
	.dw group15room04struct
	.dw group15room05struct
	.dw group15room06struct
	.dw group15room07struct
	.dw group15room08struct
	.dw group15room09struct
	.dw group15room0astruct
	.dw group15room0bstruct

group16pointersToRoomStructs:
	.dw group16room00struct
	.dw group16room01struct
	.dw group16room02struct
	.dw group16room03struct
	.dw group16room04struct
	.dw group16room05struct
	.dw group16room06struct
	.dw group16room07struct
	.dw group16room08struct
	.dw group16room09struct
	.dw group16room0astruct
	.dw group16room0bstruct
	.dw group16room0cstruct
	.dw group16room0dstruct
	.dw group16room0estruct
	.dw group16room0fstruct
	.dw group16room10struct
	.dw group16room11struct
	.dw group16room12struct
	.dw group16room13struct
	.dw group16room14struct
	.dw group16room15struct
	.dw group16room16struct
	.dw group16room17struct

group17pointersToRoomStructs:
	.dw group17room00struct
	.dw group17room01struct
	.dw group17room02struct
	.dw group17room03struct
	.dw group17room04struct
	.dw group17room05struct
	.dw group17room06struct
	.dw group17room07struct
	.dw group17room08struct
	.dw group17room09struct
	.dw group17room0astruct
	.dw group17room0bstruct

group18pointersToRoomStructs:
	.dw group18room00struct
	.dw group18room01struct
	.dw group18room02struct
	.dw group18room03struct
	.dw group18room04struct
	.dw group18room05struct
	.dw group18room06struct
	.dw group18room07struct
	.dw group18room08struct

group19pointersToRoomStructs:
	.dw group19room00struct
	.dw group19room01struct
	.dw group19room02struct
	.dw group19room03struct
	.dw group19room04struct
	.dw group19room05struct
	.dw group19room06struct
	.dw group19room07struct
	.dw group19room08struct
	.dw group19room09struct
	.dw group19room0astruct
	.dw group19room0bstruct
	.dw group19room0cstruct
	.dw group19room0dstruct
	.dw group19room0estruct
	.dw group19room0fstruct
	.dw group19room10struct
	.dw group19room11struct
	.dw group19room12struct
	.dw group19room13struct
	.dw group19room14struct
	.dw group19room15struct
	.dw group19room16struct
	.dw group19room17struct
	.dw group19room18struct
	.dw group19room19struct
	.dw group19room1astruct
	.dw group19room1bstruct
	.dw group19room1cstruct
	.dw group19room1dstruct
	.dw group19room1estruct
	.dw group19room1fstruct
	.dw group19room20struct
	.dw group19room21struct
	.dw group19room22struct
	.dw group19room23struct
	.dw group19room24struct
	.dw group19room25struct
	.dw group19room26struct
	.dw group19room27struct
	.dw group19room28struct
	.dw group19room29struct
	.dw group19room2astruct
	.dw group19room2bstruct
	.dw group19room2cstruct
	.dw group19room2dstruct
	.dw group19room2estruct
	.dw group19room2fstruct
	.dw group19room30struct
	.dw group19room31struct
	.dw group19room32struct
	.dw group19room33struct
	.dw group19room34struct
	.dw group19room35struct
	.dw group19room36struct
	.dw group19room37struct

group1apointersToRoomStructs:
	.dw group1aroom00struct
	.dw group1aroom01struct
	.dw group1aroom02struct
	.dw group1aroom03struct
	.dw group1aroom04struct
	.dw group1aroom05struct
	.dw group1aroom06struct
	.dw group1aroom07struct
	.dw group1aroom08struct
	.dw group1aroom09struct
	.dw group1aroom0astruct
	.dw group1aroom0bstruct
	.dw group1aroom0cstruct
	.dw group1aroom0dstruct
	.dw group1aroom0estruct
	.dw group1aroom0fstruct
	.dw group1aroom10struct
	.dw group1aroom11struct
	.dw group1aroom12struct
	.dw group1aroom13struct
	.dw group1aroom14struct
	.dw group1aroom15struct
	.dw group1aroom16struct
	.dw group1aroom17struct

group22pointersToRoomStructs:
	.dw group22room00struct

group23pointersToRoomStructs:
	.dw group23room00struct

group25pointersToRoomStructs:
	.dw group25room00struct