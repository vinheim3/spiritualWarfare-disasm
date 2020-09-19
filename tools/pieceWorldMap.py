import os
from PIL import Image

with open('OR', 'rb') as f:
    data = f.read()
offset = 0x74a1

bigger_maps = [
    (0x16, 0x03),
    (0x19, 0x32),
    (0x19, 0x33),
    (0x19, 0x34),
    (0x19, 0x35),
    (0x19, 0x36),
]

ignore = {
    0x05: [(0, 2), (2, 1, 2, 2)],
    0x07: [(0, 2, 2, 2)],
    0x09: [(0, 3, 4, 4), (2, 2, 3, 2), (2, 1), (0, 0)],
    0x0a: [(3, 0, 4, 2)],
    0x0b: [(0, 0, 1, 4)],
    0x0c: [(0, 0, 2, 2), (3, 6, 4, 6)],
    0x0d: [(0, 0)],
    0x0f: [(4, 1), (4, 3)],
    0x10: [(0, 0, 0, 2), (1, 0, 3, 3), (4, 2)],
    0x14: [(2, 1)],
    0x16: [(0, 0, 1, 1), (3, 0, 4, 1), (2, 0)],
    0x17: [(1, 3, 2, 3)],
    0x18: [(0, 0)],
}

width = 16
height = 13
img_height = 176
img_width = 256
total_width = img_width * width + (width-1)
total_height = img_height * height + (height-1)

new_im = Image.new('RGB', (total_width, total_height))


for group in [0, 1, 2, 4, 6, 7, 8, 0xa, 0xb, 0xc, 0xd]:
    ignore_list = []
    for ignore_group in ignore.get(group, []):
        if len(ignore_group) == 2:
            ignore_list.append(ignore_group)
        else:
            for y in range(ignore_group[0], ignore_group[2]+1):
                for x in range(ignore_group[1], ignore_group[3]+1):
                    ignore_list.append((y, x))

    groupStructData = data[offset+group*0x20:offset+(group+1)*0x20]
    groupWidth = groupStructData[0]
    groupHeight = groupStructData[1]
    vramOffset = ((groupStructData[3]<<8)|groupStructData[2]) - 0x9842

    mapOffsetX = vramOffset % 16
    mapOffsetY = vramOffset // 0x20

    for room_idx in range(groupWidth*groupHeight):
        x = room_idx % groupWidth
        y = room_idx // groupWidth
        if (y, x) in ignore_list:
            continue

        os.system(f'python tools/buildUpRoomTiles.py {group:02x} {room_idx:02x}')
        os.system('python tools/genTilemap.py')
        os.system('python tools/gfx.py png gfx_layout.bin --width=32')
        os.system('rm customLayout.bin')
        os.system('rm customBank0Tiles.bin')
        os.system('rm gfx_layout.bin')

        img = Image.open('gfx_layout.png')
        x += mapOffsetX
        y += mapOffsetY
        new_im.paste(img, (x*img_width+x, y*img_height+y))

new_im.save('roomGroup_gfx/worldMap.png')

os.system('rm gfx_layout.png')
