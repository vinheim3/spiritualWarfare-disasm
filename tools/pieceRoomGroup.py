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

for group in range(0x27):
    ignore_list = []
    for ignore_group in ignore.get(group, []):
        if len(ignore_group) == 2:
            ignore_list.append(ignore_group)
        else:
            for y in range(ignore_group[0], ignore_group[2]+1):
                for x in range(ignore_group[1], ignore_group[3]+1):
                    ignore_list.append((y, x))

    groupStructData = data[offset+group*0x20:offset+(group+1)*0x20]
    width = groupStructData[0]
    height = groupStructData[1]

    os.system('mkdir roomGroup_pieces')

    for room_idx in range(width*height):
        os.system(f'python tools/buildUpRoomTiles.py {group:02x} {room_idx:02x}')
        os.system('python tools/genTilemap.py')
        os.system('python tools/gfx.py png gfx_layout.bin --width=32')
        os.system('rm customLayout.bin')
        os.system('rm customBank0Tiles.bin')
        os.system('rm gfx_layout.bin')
        os.system(f'mv gfx_layout.png roomGroup_pieces/x{room_idx%width}y{room_idx//width}.png')

    fnames = os.listdir('roomGroup_pieces')

    images = (
        (fname, Image.open(f'roomGroup_pieces/{fname}'))
        for fname in sorted(fnames)
    )

    img_height = 176

    total_width = 256 * width
    total_height = img_height * height

    new_im = Image.new('RGB', (total_width, total_height))

    for fname, img in images:
        x = int(fname[1])
        y = int(fname[3])
        if (y, x) in ignore_list:
            continue
        new_im.paste(img, (x*256,y*img_height))

    new_im.save(f'roomGroup_gfx/group{group:02x}.png')
    os.system('rm -rf roomGroup_pieces')
