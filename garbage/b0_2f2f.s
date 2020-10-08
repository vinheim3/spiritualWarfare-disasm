;;
	ld   de, $0006                                   ; $2f2f: $11 $06 $00
	ld   hl, wPlayerIdxIntoGenericVramForTile                                   ; $2f32: $21 $56 $c0
	ld   a, (hl)                                     ; $2f35: $7e
	cp   $46                                         ; $2f36: $fe $46
	jr   z, jr_000_2f4f                              ; $2f38: $28 $15

	ld   de, $0003                                   ; $2f3a: $11 $03 $00
	cp   $43                                         ; $2f3d: $fe $43
	jr   z, jr_000_2f4f                              ; $2f3f: $28 $0e

	ld   de, $0000                                   ; $2f41: $11 $00 $00
	ld   hl, wPlayerOamAttr                                   ; $2f44: $21 $55 $c0
	ld   a, (hl)                                     ; $2f47: $7e
	and  $20                                         ; $2f48: $e6 $20
	jr   z, jr_000_2f4f                              ; $2f4a: $28 $03

	ld   de, $0009                                   ; $2f4c: $11 $09 $00

jr_000_2f4f:
	ret                                              ; $2f4f: $c9
