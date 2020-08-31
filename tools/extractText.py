import sys
import clipboard

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
    addr = start


string = "\t.asc \""
special_chars = [
    0x20,  # space
    0x2e,  # .
]
offset = 0
for byte in data[start:]:
    if byte == 0xff:
        break
    if (65 <= byte <= 90) or (97 <= byte <= 122) or byte in special_chars:
        string += chr(byte)
    else:
        raise Exception(f'${byte:02x}')
    offset += 1

string += "\"\n\t.db $ff"
print(string)
print(f"{addr+offset:04x}")
clipboard.copy(string)
