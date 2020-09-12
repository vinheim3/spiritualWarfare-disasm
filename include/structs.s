.struct SoundChannel
	start			.db
// contains the 1st sound channel byte in lower 5 bits - $ff10
// bit 5 -
// bit 6 -
// bit 7 -
	byte0			db

//
	byte1			db

//
	word23			dw

//
	word45			dw

// index into data_04_2260 to get bytes to copy to below 5 regs
	byte6			db

// copied to a channel's sound regs
	hwReg0			db
	hwReg1			db
	hwReg2			db
	hwReg3			db
	hwReg4			db

//
	byteC			db
	end				.db
.endst