;;
	ld   a, $00                                      ; $1be0: $3e $00
	ld   hl, wRoomCurrTeleportIdx                                   ; $1be2: $21 $b7 $c0
	ld   (hl), a                                     ; $1be5: $77

-
	call updateSoundsStartOfVBlank                               ; $1be6: $cd $76 $1a
	call processTeleportsRetZwhenDone                                       ; $1be9: $cd $26 $58
	jr   nz, -                             ; $1bec: $20 $f8

	call waitUntilStartOfVBlankPeriod                               ; $1bee: $cd $e8 $01
	call applyPalettesBasedOnLamp                               ; $1bf1: $cd $06 $1e
	call call_updateSounds                               ; $1bf4: $cd $d6 $01