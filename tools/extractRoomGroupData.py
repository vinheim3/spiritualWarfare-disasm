import clipboard
import json

with open('OR', 'rb') as f:
    data = f.read()

start = 0x74a1
end = 0x7981

offset = 0
group = 0

comps = []

roomStructAddressToGroupMap = {}

"""
{
    group: {
        bank:
        rooms: [
            {
                addr:
            }
        ]
    }
}
"""
pointersToRoomStructs = {}

while start + offset < end:
    comps.append(f'// room group {group:02x}')
    # width/height
    comps.append(f'\t.db ${data[start+offset+0x0]:02x} ${data[start+offset+0x1]:02x}')
    # map vram offset
    comps.append(f'\t.dw ${data[start+offset+0x3]:02x}{data[start+offset+2]:02x}')

    name1 = "".join(chr(data[start+offset+i]) for i in range(0x4, 0xb))
    name2 = "".join(chr(data[start+offset+i]) for i in range(0xb, 0x12))
    comps.append(f'\t.asc "{name1}"')
    comps.append(f'\t.asc "{name2}"')

    roomStructPointerWord = (data[start+offset+0x13] << 8) + data[start+offset+0x12]
    roomStructAddressToGroupMap[roomStructPointerWord] = group
    comps.append(f'\t.dw group{group:02x}pointersToRoomStructs')

    pointersToRoomStructs[group] = {
        'bank': data[start+offset+0x14],
        'rooms': []
    }

    row2 = " ".join(f"${data[start+offset+i]:02x}" for i in range(0x14, 0x20))
    comps.append(f'\t.db {row2}\n')
    group += 1
    offset += 0x20

orderedRoomPointers = sorted(roomStructAddressToGroupMap.keys())
for idx, addr in enumerate(orderedRoomPointers[:-1]):
    group = roomStructAddressToGroupMap[addr]
    comps.append(f'group{group:02x}pointersToRoomStructs:')
    offset = 0
    while offset+addr < orderedRoomPointers[idx+1]:
        roomPointerWord = (data[addr+offset+1]<<8)+data[addr+offset]
        # comps.append(f'\t.dw ${roomPointerWord:04x}')
        comps.append(f'\t.dw group{group:02x}room{offset//2:02x}struct')
        pointersToRoomStructs[group]['rooms'].append({
            'addr': roomPointerWord,
            'hexaddr': f"${roomPointerWord:04x}",
            'idx': f"${offset//2:02x}"
        })
        offset += 2
    comps.append('')

comps.append('group25pointersToRoomStructs:')
comps.append('\t.dw group25room00struct')
pointersToRoomStructs[0x25]['rooms'].append({
    'addr': 0x4c31,
    'hexaddr': '$4c31',
    'idx': '$00',
})

final_str = '\n'.join(comps)
print(final_str)
clipboard.copy(final_str)

# with open('json/roomPointers.json', 'w') as f:
#     f.write(json.dumps(pointersToRoomStructs, indent=2))