// < $a0 we process a note with frequency, frame delay, and aud len
.define DL_FASTEST 0
.define DL_FAST 1
.define DL_MIDDLE 2
.define DL_SLOW 3
.define DL_SLOWEST 4

.enum 0
	C4	db
	Cs4	db
	D4	db
	Ds4	db
	E4	db
	F4	db
	Fs4	db
	G4	db
	Gs4	db
	A4	db
	As4	db
	B4	db
	C5	db
	Cs5	db
	D5	db
	Ds5	db
	E5	db
	F5	db
	Fs5	db
	G5	db
	Gs5	db
	A5	db
	As5	db
	B5	db
	C6	db
	Cs6	db
	D6	db
	Ds6	db
	E6	db
	F6	db
	Fs6	db
	G6	db
.ende

.macro NOTE
	.db \1|(\2<<5)
.endm

.macro SND_loadPreset
// todo: add fail if param is not 0 to 3
	.db $a0|\1
.endm

.macro SND_useHWRegChannel
// todo: add fail if param is not 0 to 3
	.db $b0|\1
.endm

// Unused?
.macro SND_setHWReg
// todo: add fail if param is not 0 to 4
	.db $b4|\1 \2
.endm

.macro SND_loop
	.db $b9
.endm

.macro SND_stop
	.db $ba
.endm

.macro SND_setInitialEnvelope
	.db $bb \1
.endm

// Unused?
.macro SND_jump
	.db $bc
	.dw \1
.endm

.macro SND_setDelay
	.db $bd \1
.endm

.macro SND_setHWRegsAndDelay
// todo: add fail if nargs isn't 5 or 6
	.db $be
	.rept nargs
		.db \1
		.shift
	.endr
.endm