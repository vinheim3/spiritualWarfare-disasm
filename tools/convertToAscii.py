import clipboard
import sys

with open('OR', 'rb') as f:
    data = f.read()


def conv(hexstr):
    return int(f"0x{hexstr}", 16)


def convertToAscii(start, end):
    offset = 0
    hexchars = []
    while offset + start < end:
        hexchars.append(data[offset+start])
        offset += 1

    special_chars = [
        0x20,  # space
        0x21,  # !
        0x26,  # &
        0x27,  # '
        0x2c,  # ,
        0x2d,  # -
        0x2e,  # .
        0x2f,  # /
        0x3f,  # ?
    ]
    def is_ascii(ch):
        return ord('a') <= ch <= ord('z') or \
               ord('A') <= ch <= ord('Z') or \
               ord('0') <= ch <= ord('9') or \
               ch in special_chars
    comps = []

    is_string = is_ascii(hexchars[0])
    bytedata = []
    for char in hexchars:
        if is_string:
            if is_ascii(char):
                bytedata.append(chr(char))
            else:
                string = ''.join(bytedata)
                comps.append(f'\t.asc "{string}"')
                is_string = False
                bytedata = [char]
        else:
            if is_ascii(char):
                string = ' '.join(f'${byte:02x}' for byte in bytedata)
                comps.append(f'\t.db {string}')
                is_string = True
                bytedata = [chr(char)]
            else:
                bytedata.append(char)
    if bytedata:
        if is_string:
            string = ''.join(bytedata)
            comps.append(f'\t.asc "{string}"')
        else:
            string = ' '.join(f'${byte:02x}' for byte in bytedata)
            comps.append(f'\t.db {string}')

    final_str = '\n'.join(comps)
    return final_str, offset


if __name__ == "__main__":
    _start = sys.argv[1]
    _end = sys.argv[2]

    if ':' in _start:
        bank, addr = _start.split(':')
        bank = conv(bank)
        addr = conv(addr)
        _start = bank*0x8000+addr
    else:
        _start = conv(_start)
    if ':' in _end:
        bank, addr = _end.split(':')
        bank = conv(bank)
        addr = conv(addr)
        _end = bank*0x8000+addr
    else:
        _end = conv(_end)

    final_str, _ = convertToAscii(_start, _end)
    print(final_str)
    clipboard.copy(final_str)
