import clipboard

with open('OR', 'rb') as f:
    data = f.read()

start_addr = 0x1ba8
bank = 4
start = bank*0x8000+start_addr

delay_lens = [
    'DL_FASTEST',
    'DL_FAST',
    'DL_MIDDLE',
    'DL_SLOW',
    'DL_SLOWEST',
]

notes = [
    'C4',
    'Cs4',
    'D4',
    'Ds4',
    'E4',
    'F4',
    'Fs4',
    'G4',
    'Gs4',
    'A4',
    'As4',
    'B4',
    'C5',
    'Cs5',
    'D5',
    'Ds5',
    'E5',
    'F5',
    'Fs5',
    'G5',
    'Gs5',
    'A5',
    'As5',
    'B5',
    'C6',
    'Cs6',
    'D6',
    'Ds6',
    'E6',
    'F6',
    'Fs6',
    'G6',
]

offset = 0
comps = []
while True:
    data_byte = data[start+offset]
    offset += 1

    if data_byte in [0xa0, 0xa1, 0xa2, 0xa3]:
        comps.append(f'\tSND_loadPreset {data_byte-0xa0}')
    elif data_byte in [0xb0, 0xb1, 0xb2, 0xb3]:
        comps.append(f'\tSND_useHWRegChannel {data_byte-0xb0}')
    elif data_byte in [0xb4, 0xb5, 0xb6, 0xb7, 0xb8]:
        next_byte = data[start+offset]
        offset += 1
        comps.append(f'\t SND_setHWReg {data_byte-0xb4} ${next_byte:02x}')
    elif data_byte == 0xb9:
        comps.append('\tSND_loop')
        break
    elif data_byte == 0xba:
        comps.append('\tSND_stop')
        break
    elif data_byte == 0xbb:
        next_byte = data[start+offset]
        offset += 1
        comps.append(f'\tSND_setInitialEnvelope ${next_byte:02x}')
    elif data_byte == 0xbc:
        next_bytes = (data[start+offset+1]<<8)|(data[start+offset])
        offset += 2
        comps.append(f'\tSND_jump ${next_bytes:04x}')
        break
    elif data_byte == 0xbd:
        next_byte = data[start+offset]
        offset += 1
        comps.append(f'\tSND_setDelay ${next_byte:02x}')
    elif data_byte == 0xbe:
        # if aud 4, this is actually +5
        next_bytes = data[start+offset:start+offset+5]
        offset += 5
        delay_byte = data[start+offset]
        offset += 1
        j_next_bytes = ' '.join(f'${byte:02x}' for byte in next_bytes)
        comps.append(f'\tSND_setHWRegsAndDelay {j_next_bytes}, ${delay_byte:02x}')
    elif data_byte < 0xa0:
        high3bits = data_byte >> 5
        freqBits = data_byte & 0x1f
        comps.append(f'\tNOTE {notes[freqBits]}, {delay_lens[high3bits]}')
    else:
        print(f'{start_addr+offset:04x}')
        raise Exception(f'{data_byte:02x}')

final_str = '\n'.join(comps)
print(final_str)
print(f'{start_addr+offset:04x}')
clipboard.copy(final_str)
