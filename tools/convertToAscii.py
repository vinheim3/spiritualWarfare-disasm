import clipboard
import sys

with open('OR', 'rb') as f:
    data = f.read()


def conv(hexstr):
    return int(f"0x{hexstr}", 16)


def convertToAscii(start):
    offset = 0
    hexchars = []
    while data[offset+start] != 0:
        hexchars.append(data[offset+start])
        offset += 1

    adjusted_chars = []

    for char in hexchars:
        adjusted_chars.append(chr(char))
        # if char == 0xff:
        #     adjusted_chars.append(" ")
        # elif char == 0x1d:
        #     adjusted_chars.append("#")
        # elif char == 0x1e:
        #     adjusted_chars.append("'")
        # elif char == 0x1f:
        #     adjusted_chars.append("-")
        # elif char == 0x20:
        #     adjusted_chars.append("!")
        # elif char == 0x21:
        #     adjusted_chars.append("?")
        # elif char == 0xe0:
        #     adjusted_chars.append(":")
        # elif char >= 0x3c:
        #     adjusted_chars.append(chr(char-0x3c+ord("0")))
        # else:
        #     adjusted_chars.append(chr(char+ord("A")))

    final_str = f"text_{start:04x}:\n\t.asc \"" + "".join(adjusted_chars) + "\"\n\t.db $00"
    return final_str, offset


def conv_list():
    start = 0x2523
    end = 0x26f0

    comps = []
    offset = 0
    while offset+start < end:
        string, newoffset = convertToAscii(offset+start)
        offset += newoffset + 1
        comps.append(string)
    final_str = '\n\n'.join(comps)
    print(final_str)
    clipboard.copy(final_str)


if __name__ == "__main__":
    _start = sys.argv[1]

    if ':' in _start:
        bank, addr = _start.split(':')
        bank = conv(bank)
        addr = conv(addr)
        start = bank*0x8000+addr
    else:
        start = conv(_start)

    final_str, _ = convertToAscii(_start)
    print(final_str)
    clipboard.copy(final_str)
