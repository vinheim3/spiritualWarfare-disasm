import json
import clipboard

with open('OR', 'rb') as f:
    data = f.read()

with open('json/roomPointers.json') as f:
    jdata = json.loads(f.read())

curr_bank = 2
bank_offset = curr_bank*0x8000
data = data[bank_offset:bank_offset+0x8000]

# 0x3131: [group00room00struct, group00room01struct]
addr_label_map = {}

for group, group_data in jdata.items():
    bank = group_data['bank']
    if bank != curr_bank:
        continue
    rooms = group_data['rooms']
    for room in rooms:
        room_idx = room['idx'][1:]
        room_label = f"group{int(group):02x}room{room_idx}struct:"
        addr_label_map.setdefault(room['addr'], []).append(room_label)

# addr: [labels]
compressed_addr_map = {}

comps = []
sorted_addrs = sorted(addr_label_map.keys())
sorted_addrs.append({
    2: 0x4aa2,
    3: 0x4cf2,
    4: 0x5201,
}[curr_bank])
for idx, addr in enumerate(sorted_addrs[:-1]):
    labels = sorted(addr_label_map[addr])
    comps.extend(labels)

    offset = 0
    byte1 = data[addr + offset]
    offset += 1
    comps.append(f'\t.db ${byte1:02x}')
    if byte1 & 0x80:
        comps.append(f'\t.db ${data[addr+offset]:02x} ${data[addr+offset+1]:02x}')
        offset += 2
    if byte1 & 0x40:
        comps.append(f'\t.db ${data[addr+offset]:02x} ${data[addr+offset+1]:02x}')
        offset += 2
    if byte1 & 0x04:
        comps.append(f'\t.db ${data[addr+offset]:02x}')
        offset += 1

    byte2 = data[addr + offset]
    offset += 1
    comps.append(f'\t.db ${byte2:02x}')
    if byte2 & 0x20:
        comps.append(f'\t.db ${data[addr+offset]:02x} ${data[addr+offset+1]:02x} ${data[addr+offset+2]:02x} ${data[addr+offset+3]:02x}')
        offset += 4

    # address of compressed room layout
    compressed_layout_address = (data[addr+offset+1]<<8)+data[addr+offset]
    # comps.append(f'\t.dw ${compressed_layout_address:04x}')
    if len(labels) > 1:
        layout_label = f'shared_{curr_bank:02x}_{addr+offset:04x}layout:'
    else:
        layout_label = labels[0].replace('struct', 'layout')
    if compressed_layout_address not in compressed_addr_map:
        compressed_addr_map[compressed_layout_address] = {'tileset_idx': 0, 'labels': [], 'shared': []}
    compressed_addr_map[compressed_layout_address]['labels'].append(layout_label)
    if layout_label.startswith('shared'):
        for label in labels:
            compressed_addr_map[compressed_layout_address]['shared'].append(label.replace('struct', 'layout'))
    compressed_addr_map[compressed_layout_address]['tileset_idx'] = (byte2 & 0xf)*2
    comps.append(f'\t.dw {layout_label[:-1]}')

    offset += 2

    next_addr = sorted_addrs[idx+1]
    bytes_to_convert = data[addr+offset:next_addr]

    if bytes_to_convert:
        conv_bytes = " ".join(f'${byte:02x}' for byte in bytes_to_convert)
        comps.append(f'\t.db {conv_bytes}')
    comps.append('')

final_str = '\n'.join(comps)
print(final_str)
clipboard.copy(final_str)
print(f"{sorted_addrs[0]:04x} {sorted_addrs[-1]:04x}")

with open(f'json/compressed_layouts_{curr_bank:02x}.json', 'w') as f:
    f.write(json.dumps(compressed_addr_map, indent=2))
