
;;
	ld   hl, $c00c                                   ; $3271: $21 $0c $c0
	ld   (hl), e                                     ; $3274: $73
	ld   de, $0000                                   ; $3275: $11 $00 $00
	ld   hl, $c00a                                   ; $3278: $21 $0a $c0
	ldi  a, (hl)                                     ; $327b: $2a
	ld   h, (hl)                                     ; $327c: $66
	ld   l, a                                        ; $327d: $6f
	add  hl, de                                      ; $327e: $19
	ld   (hl), a                                     ; $327f: $77
	ld   hl, $c00c                                   ; $3280: $21 $0c $c0
	ld   e, (hl)                                     ; $3283: $5e
	ld   d, $00                                      ; $3284: $16 $00