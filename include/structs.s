.struct SoundChannel
	start								.db

// contains the 1st sound channel byte in lower 5 bits - $ff10
// bit 5 - set from code $b0 to $b3 for structs that use the same channel we're changing to
//       - unset when stopping a similar hw reg sound channel
// bit 6 - set when started playing sound
// bit 7 - if channel already in use/should be processed

// if bit 5 or 6 set,
//   code $b9 does not set next 5 hw regs
//   code $be does not set next 5 hw regs
	controlByteAndHWChannelAddr			db

// delay byte
	delayCounter						db

// for looping
	origSoundDataAddr					dw

// for processing each byte of sound data
	currSoundDataAddr					dw

// index into hwRegValsBytes0124 to get bytes to copy to below 5 regs
	presetIdx							db

// copied to a channel's sound regs
	hwReg0								db
	hwReg1								db
	hwReg2								db
	hwReg3								db
	hwReg4								db

// custom-filled externally to sound engine
// a control byte for preset effects?
	isTwiceSpeed						db

	end									.db
.endst