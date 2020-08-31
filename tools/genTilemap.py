import sys
import clipboard

# accept args in the following formats
# g:0:8000:24:7000:400 - vbank, vaddr, src bank, src addr, src length
# l:1e:4240 - layout src bank, layout src address (assumed $240 bytes)
# a:1e:4480 - attr src bank, attr src address (assumed $240 bytes)
# last is palette in use?
# screen is 32x32

fname = "OR"

def conv(hexstr):
    return int(f"0x{hexstr}", 16)

def bankConv(bankHexstr):
    if ':' in bankHexstr:
        bank, addr = bankHexstr.split(':')
        bank = conv(bank)
        addr = conv(addr)
        bankHexstr = bank*0x8000+addr
    else:
        bankHexstr = conv(bankHexstr)
    return bankHexstr

with open(fname, 'rb') as f:
    data = f.read()

b0GfxData = [0]*0x1800
b1GfxData = [0]*0x1800

tmData = [0]*0x400
taData = [0]*0x580

usingPalettes = False


for arg in sys.argv[1:]:
    if ':' not in arg:
        usingPalettes = True
        continue

    comps = arg.split(':')
    # vbk, vaddr, srcbank, srcaddr, bytes
    if comps[0] == 'g':
        vbank = conv(comps[1])
        vdest = conv(comps[2]) - 0x8000
        srcaddr = bankConv(":".join(comps[3:5]))
        length = conv(comps[5])
        if vbank == 0:
            gfxData = b0GfxData
        else:
            gfxData = b1GfxData
        for i in range(length):
            gfxData[vdest+i] = data[srcaddr+i]
    # srcbank/addr, offset, length, col, rows
    elif comps[0] == 'l':
        srcaddr = bankConv(":".join(comps[1:3]))
        offset = conv(comps[3])
        length = conv(comps[4])
        cols = 32
        rows = 32
        if len(comps) > 5:
            cols = conv(comps[5])
            rows = conv(comps[6])
        i = 0 # index of src data
        j = 0 # current tilemap idx
        while i < length:
            tmData[j+offset] = data[srcaddr+i]
            i += 1
            j += 1
            if j % 32 >= cols:
                j += 32-(j%32)
    elif comps[0] == 'a':
        srcaddr = bankConv(":".join(comps[1:3]))
        offset = conv(comps[3])
        length = conv(comps[4])
        for i in range(length):
            taData[i+offset] = data[srcaddr+i]


additionalAttr = None
try:
    with open('customBank0Tiles.bin', 'rb') as f:
        b0GfxData = f.read()
except Exception as e:
    pass

try:
    with open('customLayout.bin', 'rb') as f:
        tmData = f.read()
except Exception as e:
    pass

try:
    with open('customAttrs.bin', 'rb') as f:
        additionalAttr = f.read()
    for i in range(len(additionalAttr)//3):
        hb = additionalAttr[i*3]
        lb = additionalAttr[i*3+1]
        tile = additionalAttr[i*3+2]
        taData[(hb<<8)|lb] = tile
except Exception as e:
    pass


def getTile(i, tileAddr):
    attr = taData[i]
    offset = tileAddr

    # bank selection
    if attr & 0x08:
        dataOffset = b1GfxData
    else:
        dataOffset = b0GfxData

    mode = 0

    if mode == 0:
        if offset & 0x80:
            # eg if offset = 0xff, return -01
            # if offset = 0x80, return -$80 or -128
            offset = offset-0x100
        bytes = dataOffset[offset*0x10+0x1000:(offset+1)*0x10+0x1000]
    else:
        bytes = dataOffset[offset*0x10:(offset+1)*0x10]

    # x flip
    if attr & 0x20:
        bytes = [
            int(f"{byte:08b}"[::-1], 2) for byte in bytes
        ]
    # y flip
    if attr & 0x40:
        newbytes = []
        for i in range(0xe, -1, -2):
            newbytes.append(bytes[i])
            newbytes.append(bytes[i+1])
        bytes = newbytes

    if usingPalettes:
        # palette - palette number * 4 + (2 bits)
        palette_idx = attr & 0x7
        newbytes = []
        for i, byte in enumerate(bytes[::2]):
            next_byte = bytes[i*2+1]
            for bit in range(8):
                b1val = (byte >> (7-bit)) & 0x1
                b2val = (next_byte >> (7-bit)) & 0x1
                col = (b2val << 1)|b1val
                newbytes.append(palette_idx*4+col)
        bytes = newbytes

    return bytes

# list of the 8x8 bytes in a tile
allbytes = []
# print(len(tmData))
for i, byte in enumerate(tmData):
    tileData = getTile(i, byte)
    allbytes.append(tileData)

actualBytes = bytearray()
if usingPalettes:
    cols = 20
    rows = 18
    for row in range(rows):
        rowBytes = allbytes[row*cols:(row+1)*cols]
        for pixelLine in range(8):
            for tileIdx in range(cols):
                tilesPixelLineBytes = rowBytes[tileIdx][pixelLine*8:(pixelLine+1)*8]
                actualBytes.extend(tilesPixelLineBytes)
else:
    for tileData in allbytes:
        actualBytes.extend(tileData)

with open('gfx_layout.bin', 'wb') as f:
    f.write(actualBytes)
