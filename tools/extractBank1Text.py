import clipboard

with open('OR', 'rb') as f:
    data = f.read()

words = []
for i in range(1*0x8000+0xda3, 1*0x8000+0xf97, 2):
    words.append((data[i+1]<<8)+data[i]+0x8000)
words.append(0)

# dw's
comps = []
for idx, word in enumerate(words[:-1]):
    comps.append(f"\t.dw b1text_{idx:02x}")
comps.append("")

start = 1*0x8000+0x0f97
end = 1*0x8000+0x56a6


# TODO: confirm all of these
special_chars = [
    0x20,  # space
    0x21,  # !
    0x22,  # "
    0x27,  # '
    0x2c,  # ,
    0x2d,  # -
    0x2e,  # .
    0x3a,  # :
    0x3f,  # ?
    0x5f,  # _
]

null_chars = [
    0x00,  # <null>
    0x02,  # <null>
    0x03,  # <null>
    0x04,  # <null>
    0x05,  # <null>
    0x06,  # <null>
    0x07,  # <null>
]
offset = 0
curr_word_idx = 0
new_word = ""

for i, byte in enumerate(data[start:end+1]):
    if i+start == words[curr_word_idx]:
        if new_word:
            comps.append(f"\t.asc \"{new_word}\"")
            new_word = ""
        comps.append("")
        comps.append(f'b1text_{curr_word_idx:02x}:')
        curr_word_idx += 1

    if (65 <= byte <= 90) or (97 <= byte <= 122) or (48 <= byte <= 57) or byte in special_chars:
        if byte == 0x22:
            new_word += "\\"
        new_word += chr(byte)
    elif byte in null_chars:
        comps.append(f"\t.asc \"{new_word}\"")
        new_word = ""
        comps.append(f"\t.db ${byte:02x}")
    else:
        # string += chr(byte)
        raise Exception(f'${byte:02x}')
    offset += 1

final_str = "\n".join(comps)
print(final_str)
clipboard.copy(final_str)
