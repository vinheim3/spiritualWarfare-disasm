;;
jr_000_1a4b:
	ld   e, $0c                                      ; $1a4b: $1e $0c
	call processInputInMenus                               ; $1a4d: $cd $f8 $19
	jr   nz, @done                             ; $1a50: $20 $05

	call clear_d001                               ; $1a52: $cd $58 $1a
	jr   jr_000_1a4b                                 ; $1a55: $18 $f4

@done:
	ret                                              ; $1a57: $c9


clear_d001:
	ld   hl, $d001                                   ; $1a58: $21 $01 $d0
	ld   (hl), $00                                   ; $1a5b: $36 $00
	ret                                              ; $1a5d: $c9
