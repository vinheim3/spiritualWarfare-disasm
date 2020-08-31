import json
import clipboard

with open('OR', 'rb') as f:
    data = f.read()

curr_bank = 2
bank_offset = curr_bank*0x8000
data = data[bank_offset:bank_offset+0x8000]

with open(f'json/compressed_layouts_{curr_bank:02x}.json') as f:
    addr_label_map = json.loads(f.read())

sorted_addrs = sorted([int(x) for x in addr_label_map.keys()])

sorted_addrs.append({
    2: 0x3c26,
    3: 0x3fe5,
    4: 0x46b0,
}[curr_bank])

# group00room00: {tileset_idx:, bytes:}
room_tiledata = {}

comps = []
for idx, addr in enumerate(sorted_addrs[:-1]):
    labels = addr_label_map[str(addr)]['labels']
    comps.extend(labels)

    next_addr = sorted_addrs[idx+1]
    print(f"{addr:04x}, {next_addr:04x}")

    compressed_bytes = data[addr:next_addr]
    bytestring = " ".join(f'${byte:02x}' for byte in compressed_bytes)
    comps.append(f'\t.db {bytestring}')

    for label in labels:
        newlabels = [label]
        if label.startswith('shared'):
            assert len(labels) == 1
            newlabels = addr_label_map[str(addr)]['shared']
        for newlabel in newlabels:
            room_tiledata[newlabel.replace('layout:', '')] = {
                'tileset_idx': addr_label_map[str(addr)]['tileset_idx'],
                'bytes': bytestring,
            }

final_str = '\n'.join(comps)
print(final_str)
clipboard.copy(final_str)
print(f"{sorted_addrs[0]:04x}")

with open(f'json/room_layout_data_{curr_bank:02x}.json', 'w') as f:
    f.write(json.dumps(room_tiledata, indent=2))
