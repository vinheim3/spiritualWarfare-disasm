import clipboard

with open('OR', 'rb') as f:
    data = f.read()

npcStructs = 3*0x8000+0x94b

# change the following
bank = 6
bank_offset = bank*0x8000

npc_idx_start = {
    3: 0x00,
    2: 0x6a,
    6: 0xbf,
}[bank]
npc_idx_end = {
    3: 0x69,
    2: 0xbe,
    6: 0xf5,
}[bank]

# address: [npc idx]
offsets = {}

for idx in range(npc_idx_start, npc_idx_end+1):
    bytes = data[npcStructs+8*idx:npcStructs+8*(idx+1)]
    addr = (bytes[1]<<8)|bytes[0]
    offsets.setdefault(addr, []).append(idx)

ordered_keys = sorted(offsets.keys())

comps = []
for i, key in enumerate(ordered_keys[:-1]):
    next_key = ordered_keys[i+1]
    bytes = data[bank_offset+key:bank_offset+next_key]
    for idx in sorted(offsets[key]):
        comps.append(f'npc{idx:02x}_oamData:')
    joint_bytes = ' '.join(f'${byte:02x}' for byte in bytes)
    comps.append(f'\t.db {joint_bytes}\n')

for idx in sorted(offsets[ordered_keys[-1]]):
    comps.append(f'npc{idx:02x}_oamData:')

final_str = '\n'.join(comps)
print(final_str)
clipboard.copy(final_str)
print(f"{ordered_keys[0]:04x} {ordered_keys[-1]:04x}")