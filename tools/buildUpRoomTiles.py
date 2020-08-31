import json
import sys
import os

group, room = sys.argv[1:]
group = int(f'0x{group}', 16)
room = int(f'0x{room}', 16)

with open('json/roomPointers.json') as f:
    curr_bank = json.loads(f.read())[str(group)]['bank']

with open(f'json/room_layout_data_{curr_bank:02x}.json') as f:
    jdata = json.loads(f.read())

with open('OR', 'rb') as f:
    data = f.read()

room_data = jdata[f'group{group:02x}room{room:02x}']

tileset_idx = room_data['tileset_idx']
room_bytes = room_data['bytes']
room_bytes = [int(byte.replace('$', '0x'), 16) for byte in room_bytes.split()]

twoByTwoBytes = []

# decompress layout
curr_byte = 0xff
row_offset = 0
for byte in room_bytes:
    tile = byte & 0xfc
    param = (byte & 0x03) + 1
    if tile == curr_byte and row_offset != 0:
        param *= 4
    for _ in range(param):
        twoByTwoBytes.append(tile)
    row_offset += param
    if row_offset >= 16:
        if row_offset > 16:
            print('overspill')
        row_offset = 0
    curr_byte = tile

# print 2x2 grid, pre-conversion
# for i in range(len(twoByTwoBytes)//16):
#     print(" ".join(f"{byte:02x}" for byte in twoByTwoBytes[i*16:(i+1)*16]))

# convert any tiles
vramConversionTablesOffset = 4*0x8000+0x094b
vramConvData = data[vramConversionTablesOffset:]
currConversionTable = vramConvData[tileset_idx*0x40:(tileset_idx+1)*0x40]

convTwoByTwoBytes = []
for byte in twoByTwoBytes:
    idx = byte // 4
    convTile = currConversionTable[idx]
    if convTile == 0xff:
        convTwoByTwoBytes.append(byte)
    else:
        convTwoByTwoBytes.append(convTile)

# print 2x2 grid, post-conversion
# for i in range(len(convTwoByTwoBytes)//16):
#     print(" ".join(f"{byte:02x}" for byte in convTwoByTwoBytes[i*16:(i+1)*16]))


room_layout = []
for i in range(len(convTwoByTwoBytes)//16):
    byterow = convTwoByTwoBytes[i*16:(i+1)*16]
    # 1st row
    for byte in byterow:
        room_layout.append(byte)
        room_layout.append(byte+2)
    # 2nd row
    for byte in byterow:
        room_layout.append(byte+1)
        room_layout.append(byte+3)


with open('customLayout.bin', 'wb') as f:
    f.write(bytearray(room_layout))


tilesetAddress = (data[0x1717+tileset_idx*2+1]<<8) + data[0x1717+tileset_idx*2]
tilesetBank = data[0x1759+tileset_idx]
os.system(f'python tools/decompressGfx.py {tilesetBank}:{tilesetAddress:04x} 1')
