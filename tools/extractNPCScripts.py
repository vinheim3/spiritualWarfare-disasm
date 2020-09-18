import clipboard

with open('OR', 'rb') as f:
    data = f.read()

start_addr = 0xd4b
bank = 6
start = bank*0x8000+start_addr
end = bank*0x8000+0xdf6

offset = 0

comps = []
log_comps = []

table = False
doneMarker = True
if table:
    doneBytes = bytearray([0xff, 0xff, 0xff])
    bytes = data[start+offset:start+offset+5]
    while True:
        if bytes[:3] == doneBytes and doneMarker:
            comps.append(f'\t.db $ff $ff $ff')
            break
        comps.append(f'\t.db ${bytes[0]:02x} ${bytes[1]:02x} ${bytes[2]:02x}')
        comps.append(f'\t.dw ${bytes[4]:02x}{bytes[3]:02x}\n')
        offset += 5
        bytes = data[start+offset:start+offset+5]
        if not doneMarker and start+offset >= end:
            break
    final_str = '\n'.join(comps)
    clipboard.copy(final_str)
    exit(0)

while start + offset < end:
    bytes = [byte for byte in data[start+offset:start+offset+4]]
    opcode = bytes[0]
    params = opcode>>6
    joint_bytes = " ".join(f'${byte:02x}' for byte in bytes[:params+1])
    comment = f'// {start_addr+offset:04x}'

    next_byte = f'${bytes[1]:02x}'
    next_2_bytes = f'${bytes[1]:02x} ${bytes[2]:02x}'
    next_3_bytes = f'${bytes[1]:02x} ${bytes[2]:02x} ${bytes[3]:02x}'
    next_word = f'${bytes[2]:02x}{bytes[1]:02x}'
    next_next_word = f'${bytes[3]:02x}{bytes[2]:02x}'
    next_byte_word = f'{next_byte}, {next_next_word}'

    if opcode == 0:
        comps.append(f'\tnpc_end')
    elif opcode == 0x01:
        comps.append(f'\tnpc_set5_cb60')
    elif opcode == 0x05:
        comps.append(f'\tnpc_faceUp')
    elif opcode == 0x06:
        comps.append(f'\tnpc_faceDown')
    elif opcode == 0x07:
        comps.append(f'\tnpc_faceRight')
    elif opcode == 0x08:
        comps.append(f'\tnpc_faceLeft')
    elif opcode == 0x09:
        comps.append(f'\tnpc_set6_cb60_reset_cb6c')
    elif opcode == 0x0c:
        comps.append(f'\tnpc_res4_cb60')
    elif opcode == 0x0f:
        comps.append(f'\tnpc_turnBackwards')
    elif opcode == 0x10:
        comps.append(f'\tnpc_moveHorizontallyToPlayer')
    elif opcode == 0x14:
        comps.append(f'\tnpc_set3_cb60')
    elif opcode == 0x24:
        comps.append(f'\tnpc_ret')
    elif opcode == 0x25:
        comps.append(f'\tnpc_incAnointingOilsGotten')
    elif opcode == 0x27:
        comps.append(f'\tnpc_set2_cbe4')
    elif opcode == 0x28:
        comps.append(f'\tnpc_setRoomFlagFrom_cbf0')
    elif opcode == 0x40:
        comps.append(f'\tnpc_moveByParamPixels {next_byte}')
    elif opcode == 0x41:
        comps.append(f'\tnpc_setMovementSpeed {next_byte}')
    elif opcode == 0x42:
        comps.append(f'\tnpc_wait {next_byte}')
    elif opcode == 0x43:
        comps.append(f'\tnpc_setNewNpcID {next_byte}')
    elif opcode == 0x44:
        comps.append(f'\tnpc_setDamageTaken {next_byte}')
    elif opcode == 0x45:
        comps.append(f'\tnpc_increaseScore {next_byte}')
    elif opcode == 0x48:
        comps.append(f'\tnpc_giveArmorOfGod {next_byte}')
    elif opcode == 0x49:
        comps.append(f'\tnpc_takeArmorOfGod {next_byte}')
    elif opcode == 0x4a:
        comps.append(f'\tnpc_giveSpecialBItem {next_byte}')
    elif opcode == 0x4c:
        comps.append(f'\tnpc_addToPlayerHealth {next_byte}')
    elif opcode == 0x4e:
        comps.append(f'\tnpc_giveNumBirds {next_byte}')
    elif opcode == 0x50:
        comps.append(f'\tnpc_giveItem {next_byte}')
    elif opcode == 0x52:
        comps.append(f'\tnpc_giveFruit {next_byte}')
    elif opcode == 0x53:
        comps.append(f'\tnpc_giveNumBombs {next_byte}')
    elif opcode == 0x54:
        comps.append(f'\tnpc_set_c059 {next_byte}')
    elif opcode == 0x80:
        comps.append(f'\tnpc_setCoords {next_2_bytes}')
    elif opcode == 0x81:
        comps.append(f'\tnpc_jump {next_word}')
    elif opcode == 0x82:
        comps.append(f'\tnpc_resetBit5ofNPC2ndByte_jumpIfNZ {next_word}')
    elif opcode == 0x83:
        comps.append(f'\tnpc_startScrollingText {next_word}')
    elif opcode == 0x84:
        comps.append(f'\tnpc_jumpIfAtLeast1key {next_word}')
    elif opcode == 0x85:
        comps.append(f'\tnpc_call {next_word}')
    elif opcode == 0x86:
        comps.append(f'\tnpc_groupRoomXYjumpTable {next_word}')
    elif opcode == 0x87:
        comps.append(f'\tnpc_displayTextScreen {next_word}')
    elif opcode == 0x88:
        comps.append(f'\tnpc_jumpIfLampOn {next_word}')
    elif opcode == 0x89:
        comps.append(f'\tnpc_callCommonSoundFuncs_6c01 {next_2_bytes}')
    elif opcode == 0x8a:
        comps.append(f'\tnpc_resetNPC2ndByteBit5_jumpIfOrigSet {next_word}')
    elif opcode == 0x8b:
        comps.append(f'\tnpc_jumpIfPlayerIsFullHealth {next_word}')
    elif opcode == 0x8c:
        comps.append(f'\tnpc_flipBit4ofNPC2ndByte_jumpIfNZ {next_word}')
    elif opcode == 0x90:
        comps.append(f'\tnpc_addParamsToXthenYCoords {next_2_bytes}')
    elif opcode == 0x91:
        comps.append(f'\tnpc_callCommonSoundFuncs_6d6c {next_2_bytes}')
    elif opcode == 0x92:
        comps.append(f'\tnpc_teleportPlayer {next_word}')
    elif opcode == 0xc1:
        comps.append(f'\tnpc_spawnNPC {next_3_bytes}')
    elif opcode == 0xc2:
        comps.append(f'\tnpc_loopAboveParamTimes {next_byte_word}')
    elif opcode == 0xc3:
        comps.append(f'\tnpc_jumpIfRandomNumLTparam {next_byte_word}')
    elif opcode == 0xc4:
        comps.append(f'\tnpc_jumpIfArmorOfGodGotten {next_byte_word}')
    elif opcode == 0xc5:
        comps.append(f'\tnpc_jumpIfSpecialBitemGotten {next_byte_word}')
    elif opcode == 0xc6:
        comps.append(f'\tnpc_jumpIfNumBirdsGotten {next_byte_word}')
    elif opcode == 0xc8:
        comps.append(f'\tnpc_jumpIfItemGotten {next_byte_word}')
    elif opcode == 0xc9:
        comps.append(f'\tnpc_jumpIfAtTile {next_byte_word}')
    elif opcode == 0xca:
        comps.append(f'\tnpc_jumpIfMoreThanNumBombsGotten {next_byte_word}')
    elif opcode == 0xce:
        comps.append(f'\tnpc_moveNPC_jumpIfCant {next_byte_word}')
    elif opcode == 0xd0:
        comps.append(f'\tnpc_jumpIfFacingDirection {next_byte_word}')
    else:
        comps.append(f'\t.db {joint_bytes}')
    log_comps.append(f'{comps[-1]} {comment}')
    offset += params+1

clipboard.copy('\n'.join(comps))
with open('script.s', 'w') as f:
    f.write('\n'.join(log_comps))
