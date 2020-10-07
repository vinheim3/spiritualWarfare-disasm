;;
jr_000_182f:
	call pollInput                                       ; $182f: $cd $3b $5b
	ld   hl, wKeysPressed                                   ; $1832: $21 $16 $c0
	ld   a, (hl)                                     ; $1835: $7e
	cp   $00                                         ; $1836: $fe $00
	jr   z, jr_000_182f                              ; $1838: $28 $f5

	ret                                              ; $183a: $c9
