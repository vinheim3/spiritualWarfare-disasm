import sys

with open('OR', 'rb') as f:
    data = f.read()

start = sys.argv[1]

def conv(hexstr):
    return int(f"0x{hexstr}", 16)


if ':' in start:
    bank, addr = start.split(':')
    bank = conv(bank)
    addr = conv(addr)
    start = bank*0x8000+addr
else:
    start = conv(start)
    bank = 0

bytes = bytearray()

offset = 0

while len(bytes) < 0x1000:
    byte = data[start+offset]
    offset += 1
    if byte == 0xab:
        next_byte = data[start+offset]
        offset += 1
        if next_byte == 0xab:
            bytes.append(0xab)
        else:
            count_byte = data[start+offset]
            offset +=1
            for i in range(count_byte+4):
                bytes.append(next_byte)
    else:
        bytes.append(byte)

if len(sys.argv) > 2:
    newbytes = bytes + bytes[:0x800]
    with open('customBank0Tiles.bin', 'wb') as f:
        f.write(newbytes)
else:
    print(hex(offset+start-bank*0x8000))

    with open('spr_new.bin', 'wb') as f:
        f.write(bytes)
