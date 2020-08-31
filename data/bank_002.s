


	pop  hl                                          ; $4aa2: $e1
	add  h                                           ; $4aa3: $84
	dec  de                                          ; $4aa4: $1b
	ld   (bc), a                                     ; $4aa5: $02
	nop                                              ; $4aa6: $00
	ld   a, b                                        ; $4aa7: $78
	sub  b                                           ; $4aa8: $90
	add  hl, de                                      ; $4aa9: $19
	add  h                                           ; $4aaa: $84
	dec  bc                                          ; $4aab: $0b
	ld   b, $03                                      ; $4aac: $06 $03
	or   b                                           ; $4aae: $b0
	ld   (hl), b                                     ; $4aaf: $70
	rst  $38                                         ; $4ab0: $ff
	ld   c, $e8                                      ; $4ab1: $0e $e8
	rst  $38                                         ; $4ab3: $ff
	ld   a, $80                                      ; $4ab4: $3e $80
	ld   a, b                                        ; $4ab6: $78
	ld   a, $80                                      ; $4ab7: $3e $80
	or   (hl)                                        ; $4ab9: $b6
	ld   a, $80                                      ; $4aba: $3e $80
	ld   b, h                                        ; $4abc: $44
	ld   a, $80                                      ; $4abd: $3e $80
	sub  d                                           ; $4abf: $92
	ld   h, e                                        ; $4ac0: $63
	adc  c                                           ; $4ac1: $89
	pop  de                                          ; $4ac2: $d1
	ld   h, d                                        ; $4ac3: $62
	add  b                                           ; $4ac4: $80
	ld   d, e                                        ; $4ac5: $53
	ld   h, d                                        ; $4ac6: $62
	adc  c                                           ; $4ac7: $89
	push hl                                          ; $4ac8: $e5
	ld   h, d                                        ; $4ac9: $62
	add  b                                           ; $4aca: $80
	scf                                              ; $4acb: $37
	rst  $38                                         ; $4acc: $ff


// $c091/2 == $4acd, we get a byte from here
	nop                                              ; $4acd: $00
	ld   h, $00                                      ; $4ace: $26 $00
	ld   h, $2b                                      ; $4ad0: $26 $2b
	ld   h, $26                                      ; $4ad2: $26 $26
	ld   h, $26                                      ; $4ad4: $26 $26
	ld   h, $00                                      ; $4ad6: $26 $00
	nop                                              ; $4ad8: $00
	ld   h, $2d                                      ; $4ad9: $26 $2d
	ld   h, $26                                      ; $4adb: $26 $26
	ld   h, $1f                                      ; $4add: $26 $1f
	rra                                              ; $4adf: $1f
	rra                                              ; $4ae0: $1f
	ld   h, $26                                      ; $4ae1: $26 $26
	ld   h, $00                                      ; $4ae3: $26 $00
	ld   h, $00                                      ; $4ae5: $26 $00
	nop                                              ; $4ae7: $00
	nop                                              ; $4ae8: $00
	dec  l                                           ; $4ae9: $2d
	ld   h, $00                                      ; $4aea: $26 $00
	nop                                              ; $4aec: $00
	nop                                              ; $4aed: $00
	ld   bc, $0100                                   ; $4aee: $01 $00 $01
	ld   h, $00                                      ; $4af1: $26 $00
	inc  bc                                          ; $4af3: $03
	dec  hl                                          ; $4af4: $2b
	dec  hl                                          ; $4af5: $2b
	dec  hl                                          ; $4af6: $2b
	ld   h, $26                                      ; $4af7: $26 $26
	ld   h, $26                                      ; $4af9: $26 $26
	ld   h, $00                                      ; $4afb: $26 $00
	ld   h, $06                                      ; $4afd: $26 $06
	daa                                              ; $4aff: $27
	ld   h, $00                                      ; $4b00: $26 $00
	dec  b                                           ; $4b02: $05
	inc  b                                           ; $4b03: $04
	dec  bc                                          ; $4b04: $0b
	jr   jr_005_4b15                                 ; $4b05: $18 $0e

	ld   h, $26                                      ; $4b07: $26 $26
	ld   h, $26                                      ; $4b09: $26 $26
	ld   h, $26                                      ; $4b0b: $26 $26
	nop                                              ; $4b0d: $00
	ld   h, $00                                      ; $4b0e: $26 $00
	nop                                              ; $4b10: $00
	ld   h, $26                                      ; $4b11: $26 $26
	ld   h, $26                                      ; $4b13: $26 $26

jr_005_4b15:
	ld   h, $26                                      ; $4b15: $26 $26
	ld   h, $26                                      ; $4b17: $26 $26
	ld   h, $26                                      ; $4b19: $26 $26
	ld   h, $26                                      ; $4b1b: $26 $26
	ld   h, $1f                                      ; $4b1d: $26 $1f
	ld   h, $1f                                      ; $4b1f: $26 $1f
	nop                                              ; $4b21: $00
	ld   h, $26                                      ; $4b22: $26 $26
	ld   h, $26                                      ; $4b24: $26 $26
	ld   h, $26                                      ; $4b26: $26 $26
	ld   h, $26                                      ; $4b28: $26 $26
	ld   bc, $0026                                   ; $4b2a: $01 $26 $00
	ld   h, $01                                      ; $4b2d: $26 $01
	ld   h, $01                                      ; $4b2f: $26 $01
	nop                                              ; $4b31: $00
	rra                                              ; $4b32: $1f
	nop                                              ; $4b33: $00
	ld   l, $00                                      ; $4b34: $2e $00
	ld   h, $26                                      ; $4b36: $26 $26
	ld   h, $26                                      ; $4b38: $26 $26
	nop                                              ; $4b3a: $00
	nop                                              ; $4b3b: $00
	ld   h, $01                                      ; $4b3c: $26 $01
	ld   b, $27                                      ; $4b3e: $06 $27
	ld   e, $26                                      ; $4b40: $1e $26
	dec  b                                           ; $4b42: $05
	ld   h, $1d                                      ; $4b43: $26 $1d
	jr   $01                                         ; $4b45: $18 $01

	ld   h, $26                                      ; $4b47: $26 $26
	ld   h, $26                                      ; $4b49: $26 $26
	ld   h, $26                                      ; $4b4b: $26 $26
	nop                                              ; $4b4d: $00
	nop                                              ; $4b4e: $00
	nop                                              ; $4b4f: $00
	nop                                              ; $4b50: $00
	ld   h, $26                                      ; $4b51: $26 $26
	ld   h, $26                                      ; $4b53: $26 $26
	ld   h, $00                                      ; $4b55: $26 $00
	ld   h, $26                                      ; $4b57: $26 $26
	ld   h, $26                                      ; $4b59: $26 $26
	nop                                              ; $4b5b: $00
	ld   h, $26                                      ; $4b5c: $26 $26
	ld   h, $26                                      ; $4b5e: $26 $26
	ld   bc, $1f26                                   ; $4b60: $01 $26 $1f
	nop                                              ; $4b63: $00
	ld   h, $26                                      ; $4b64: $26 $26
	nop                                              ; $4b66: $00
	nop                                              ; $4b67: $00
	nop                                              ; $4b68: $00
	ld   h, $00                                      ; $4b69: $26 $00
	ld   h, $26                                      ; $4b6b: $26 $26
	ld   h, $01                                      ; $4b6d: $26 $01
	ld   h, $00                                      ; $4b6f: $26 $00
	rra                                              ; $4b71: $1f
	nop                                              ; $4b72: $00
	inc  bc                                          ; $4b73: $03
	nop                                              ; $4b74: $00
	nop                                              ; $4b75: $00
	nop                                              ; $4b76: $00
	ld   h, $26                                      ; $4b77: $26 $26
	ld   h, $26                                      ; $4b79: $26 $26
	ld   h, $26                                      ; $4b7b: $26 $26
	ld   h, $06                                      ; $4b7d: $26 $06
	daa                                              ; $4b7f: $27
	ld   l, $26                                      ; $4b80: $2e $26
	dec  b                                           ; $4b82: $05
	inc  b                                           ; $4b83: $04
	nop                                              ; $4b84: $00
	jr   jr_005_4b87                                 ; $4b85: $18 $00

jr_005_4b87:
	ld   h, $26                                      ; $4b87: $26 $26
	ld   h, $26                                      ; $4b89: $26 $26
	ld   h, $26                                      ; $4b8b: $26 $26
	nop                                              ; $4b8d: $00
	ld   h, $00                                      ; $4b8e: $26 $00
	ld   h, $00                                      ; $4b90: $26 $00
	ld   h, $26                                      ; $4b92: $26 $26
	ld   h, $26                                      ; $4b94: $26 $26
	ld   h, $26                                      ; $4b96: $26 $26
	ld   h, $2b                                      ; $4b98: $26 $2b
	ld   h, $26                                      ; $4b9a: $26 $26
	ld   h, $26                                      ; $4b9c: $26 $26
	ld   h, $26                                      ; $4b9e: $26 $26
	rra                                              ; $4ba0: $1f
	nop                                              ; $4ba1: $00
	nop                                              ; $4ba2: $00
	ld   h, $00                                      ; $4ba3: $26 $00
	ld   h, $26                                      ; $4ba5: $26 $26
	ld   bc, $2626                                   ; $4ba7: $01 $26 $26
	ld   h, $26                                      ; $4baa: $26 $26
	ld   h, $00                                      ; $4bac: $26 $00
	ld   h, $00                                      ; $4bae: $26 $00
	nop                                              ; $4bb0: $00
	dec  hl                                          ; $4bb1: $2b
	ld   bc, $0026                                   ; $4bb2: $01 $26 $00
	nop                                              ; $4bb5: $00
	ld   h, $26                                      ; $4bb6: $26 $26
	ld   h, $26                                      ; $4bb8: $26 $26
	ld   h, $26                                      ; $4bba: $26 $26
	ld   h, $26                                      ; $4bbc: $26 $26
	ld   b, $27                                      ; $4bbe: $06 $27
	ld   h, $26                                      ; $4bc0: $26 $26
	dec  b                                           ; $4bc2: $05
	inc  b                                           ; $4bc3: $04
	nop                                              ; $4bc4: $00
	jr   jr_005_4bc7                                 ; $4bc5: $18 $00

jr_005_4bc7:
	ld   h, $26                                      ; $4bc7: $26 $26
	ld   h, $26                                      ; $4bc9: $26 $26
	ld   h, $26                                      ; $4bcb: $26 $26
	nop                                              ; $4bcd: $00
	ld   h, $26                                      ; $4bce: $26 $26
	ld   h, $00                                      ; $4bd0: $26 $00
	ld   h, $00                                      ; $4bd2: $26 $00
	ld   h, $26                                      ; $4bd4: $26 $26
	ld   h, $26                                      ; $4bd6: $26 $26
	ld   h, $26                                      ; $4bd8: $26 $26
	ld   h, $26                                      ; $4bda: $26 $26
	ld   h, $26                                      ; $4bdc: $26 $26
	ld   h, $1f                                      ; $4bde: $26 $1f
	ld   h, $26                                      ; $4be0: $26 $26
	nop                                              ; $4be2: $00
	nop                                              ; $4be3: $00
	ld   h, $26                                      ; $4be4: $26 $26
	nop                                              ; $4be6: $00
	nop                                              ; $4be7: $00
	nop                                              ; $4be8: $00
	ld   h, $26                                      ; $4be9: $26 $26
	ld   h, $26                                      ; $4beb: $26 $26
	nop                                              ; $4bed: $00
	ld   bc, $2626                                   ; $4bee: $01 $26 $26
	ld   h, $26                                      ; $4bf1: $26 $26
	ld   h, $26                                      ; $4bf3: $26 $26
	nop                                              ; $4bf5: $00
	ld   h, $26                                      ; $4bf6: $26 $26
	ld   h, $26                                      ; $4bf8: $26 $26
	ld   h, $26                                      ; $4bfa: $26 $26
	ld   h, $26                                      ; $4bfc: $26 $26
	ld   b, $27                                      ; $4bfe: $06 $27
	nop                                              ; $4c00: $00
	nop                                              ; $4c01: $00
	dec  b                                           ; $4c02: $05
	nop                                              ; $4c03: $00
	nop                                              ; $4c04: $00
	jr   $1f                                         ; $4c05: $18 $1f

	ld   h, $26                                      ; $4c07: $26 $26
	ld   h, $26                                      ; $4c09: $26 $26
	ld   h, $26                                      ; $4c0b: $26 $26
	nop                                              ; $4c0d: $00
	ld   h, $26                                      ; $4c0e: $26 $26
	ld   h, $26                                      ; $4c10: $26 $26
	nop                                              ; $4c12: $00
	ld   h, $00                                      ; $4c13: $26 $00
	nop                                              ; $4c15: $00
	nop                                              ; $4c16: $00
	ld   h, $26                                      ; $4c17: $26 $26
	ld   h, $2d                                      ; $4c19: $26 $2d
	dec  l                                           ; $4c1b: $2d
	dec  l                                           ; $4c1c: $2d
	nop                                              ; $4c1d: $00
	rra                                              ; $4c1e: $1f
	rra                                              ; $4c1f: $1f
	rra                                              ; $4c20: $1f
	ld   h, $26                                      ; $4c21: $26 $26
	ld   h, $26                                      ; $4c23: $26 $26
	ld   h, $2c                                      ; $4c25: $26 $2c
	ld   h, $00                                      ; $4c27: $26 $00
	nop                                              ; $4c29: $00
	ld   h, $00                                      ; $4c2a: $26 $00
	nop                                              ; $4c2c: $00
	inc  l                                           ; $4c2d: $2c
	ld   bc, $0126                                   ; $4c2e: $01 $26 $01
	ld   h, $26                                      ; $4c31: $26 $26
	inc  bc                                          ; $4c33: $03
	ld   h, $26                                      ; $4c34: $26 $26
	inc  l                                           ; $4c36: $2c
	inc  l                                           ; $4c37: $2c
	inc  l                                           ; $4c38: $2c
	inc  l                                           ; $4c39: $2c
	ld   h, $26                                      ; $4c3a: $26 $26
	ld   h, $2c                                      ; $4c3c: $26 $2c
	ld   b, $27                                      ; $4c3e: $06 $27
	ld   h, $26                                      ; $4c40: $26 $26
	dec  b                                           ; $4c42: $05
	inc  b                                           ; $4c43: $04
	ld   h, $18                                      ; $4c44: $26 $18
	ld   c, $26                                      ; $4c46: $0e $26
	dec  l                                           ; $4c48: $2d
	inc  l                                           ; $4c49: $2c
	nop                                              ; $4c4a: $00
	nop                                              ; $4c4b: $00
	ld   h, $00                                      ; $4c4c: $26 $00
	ld   h, $26                                      ; $4c4e: $26 $26
	ld   h, $26                                      ; $4c50: $26 $26
	ld   h, $26                                      ; $4c52: $26 $26
	jr   z, jr_005_4c75                              ; $4c54: $28 $1f

	ld   h, $00                                      ; $4c56: $26 $00
	nop                                              ; $4c58: $00
	ld   h, $26                                      ; $4c59: $26 $26
	nop                                              ; $4c5b: $00
	ld   h, $26                                      ; $4c5c: $26 $26
	rra                                              ; $4c5e: $1f
	dec  e                                           ; $4c5f: $1d
	rra                                              ; $4c60: $1f
	ld   h, $26                                      ; $4c61: $26 $26
	rra                                              ; $4c63: $1f
	ld   h, $26                                      ; $4c64: $26 $26
	nop                                              ; $4c66: $00
	nop                                              ; $4c67: $00
	nop                                              ; $4c68: $00
	nop                                              ; $4c69: $00
	nop                                              ; $4c6a: $00
	ld   h, $26                                      ; $4c6b: $26 $26
	ld   h, $01                                      ; $4c6d: $26 $01
	nop                                              ; $4c6f: $00
	ld   bc, $2626                                   ; $4c70: $01 $26 $26
	ld   h, $00                                      ; $4c73: $26 $00

jr_005_4c75:
	nop                                              ; $4c75: $00
	nop                                              ; $4c76: $00
	ld   h, $26                                      ; $4c77: $26 $26
	ld   h, $26                                      ; $4c79: $26 $26
	ld   h, $26                                      ; $4c7b: $26 $26
	nop                                              ; $4c7d: $00
	ld   b, $27                                      ; $4c7e: $06 $27
	ld   l, $26                                      ; $4c80: $2e $26
	dec  b                                           ; $4c82: $05
	inc  b                                           ; $4c83: $04
	dec  bc                                          ; $4c84: $0b
	jr   jr_005_4c87                                 ; $4c85: $18 $00

jr_005_4c87:
	ld   h, $26                                      ; $4c87: $26 $26
	ld   h, $26                                      ; $4c89: $26 $26
	ld   h, $26                                      ; $4c8b: $26 $26
	nop                                              ; $4c8d: $00
	ld   h, $26                                      ; $4c8e: $26 $26
	ld   h, $26                                      ; $4c90: $26 $26
	ld   h, $26                                      ; $4c92: $26 $26
	ld   h, $26                                      ; $4c94: $26 $26
	nop                                              ; $4c96: $00
	nop                                              ; $4c97: $00
	ld   h, $26                                      ; $4c98: $26 $26
	ld   h, $26                                      ; $4c9a: $26 $26
	ld   h, $00                                      ; $4c9c: $26 $00
	ld   h, $26                                      ; $4c9e: $26 $26
	ld   h, $26                                      ; $4ca0: $26 $26
	ld   h, $26                                      ; $4ca2: $26 $26
	ld   h, $26                                      ; $4ca4: $26 $26
	nop                                              ; $4ca6: $00
	nop                                              ; $4ca7: $00
	nop                                              ; $4ca8: $00
	ld   h, $00                                      ; $4ca9: $26 $00
	nop                                              ; $4cab: $00
	nop                                              ; $4cac: $00
	nop                                              ; $4cad: $00
	ld   bc, $0126                                   ; $4cae: $01 $26 $01
	rra                                              ; $4cb1: $1f
	ld   bc, $0026                                   ; $4cb2: $01 $26 $00
	nop                                              ; $4cb5: $00
	nop                                              ; $4cb6: $00
	ld   h, $26                                      ; $4cb7: $26 $26
	ld   h, $2b                                      ; $4cb9: $26 $2b
	ld   h, $26                                      ; $4cbb: $26 $26
	rrca                                             ; $4cbd: $0f
	ld   b, $27                                      ; $4cbe: $06 $27
	ld   e, $26                                      ; $4cc0: $1e $26
	dec  b                                           ; $4cc2: $05
	ld   h, $26                                      ; $4cc3: $26 $26
	jr   $0e                                         ; $4cc5: $18 $0e

	ld   h, $26                                      ; $4cc7: $26 $26
	ld   h, $26                                      ; $4cc9: $26 $26
	ld   h, $00                                      ; $4ccb: $26 $00
	nop                                              ; $4ccd: $00
	ld   h, $26                                      ; $4cce: $26 $26
	ld   h, $26                                      ; $4cd0: $26 $26
	ld   h, $26                                      ; $4cd2: $26 $26
	ld   h, $26                                      ; $4cd4: $26 $26
	ld   h, $26                                      ; $4cd6: $26 $26
	ld   h, $26                                      ; $4cd8: $26 $26
	ld   h, $26                                      ; $4cda: $26 $26
	ld   h, $00                                      ; $4cdc: $26 $00
	ld   h, $26                                      ; $4cde: $26 $26
	ld   h, $26                                      ; $4ce0: $26 $26
	ld   h, $26                                      ; $4ce2: $26 $26
	ld   h, $26                                      ; $4ce4: $26 $26
	nop                                              ; $4ce6: $00
	ld   h, $00                                      ; $4ce7: $26 $00
	ld   h, $00                                      ; $4ce9: $26 $00
	ld   h, $00                                      ; $4ceb: $26 $00
	nop                                              ; $4ced: $00
	ld   bc, $0126                                   ; $4cee: $01 $26 $01
	ld   h, $26                                      ; $4cf1: $26 $26
	ld   h, $00                                      ; $4cf3: $26 $00
	nop                                              ; $4cf5: $00
	nop                                              ; $4cf6: $00
	ld   h, $26                                      ; $4cf7: $26 $26
	ld   h, $00                                      ; $4cf9: $26 $00
	ld   h, $26                                      ; $4cfb: $26 $26
	rrca                                             ; $4cfd: $0f
	ld   b, $27                                      ; $4cfe: $06 $27
	ld   e, $0b                                      ; $4d00: $1e $0b
	dec  b                                           ; $4d02: $05
	ld   h, $0b                                      ; $4d03: $26 $0b
	jr   jr_005_4d15                                 ; $4d05: $18 $0e

	ld   h, $26                                      ; $4d07: $26 $26
	ld   h, $26                                      ; $4d09: $26 $26
	ld   h, $26                                      ; $4d0b: $26 $26
	nop                                              ; $4d0d: $00
	ld   h, $26                                      ; $4d0e: $26 $26
	ld   h, $26                                      ; $4d10: $26 $26
	nop                                              ; $4d12: $00
	nop                                              ; $4d13: $00
	inc  l                                           ; $4d14: $2c

jr_005_4d15:
	inc  l                                           ; $4d15: $2c
	ld   h, $00                                      ; $4d16: $26 $00
	inc  l                                           ; $4d18: $2c
	ld   h, $2d                                      ; $4d19: $26 $2d
	ld   h, $26                                      ; $4d1b: $26 $26
	nop                                              ; $4d1d: $00
	rra                                              ; $4d1e: $1f
	rra                                              ; $4d1f: $1f
	rra                                              ; $4d20: $1f
	ld   h, $26                                      ; $4d21: $26 $26
	ld   h, $26                                      ; $4d23: $26 $26
	ld   h, $00                                      ; $4d25: $26 $00
	nop                                              ; $4d27: $00
	nop                                              ; $4d28: $00
	nop                                              ; $4d29: $00
	inc  l                                           ; $4d2a: $2c
	ld   h, $00                                      ; $4d2b: $26 $00
	dec  hl                                          ; $4d2d: $2b
	ld   bc, $262c                                   ; $4d2e: $01 $2c $26
	inc  l                                           ; $4d31: $2c
	nop                                              ; $4d32: $00
	inc  l                                           ; $4d33: $2c
	nop                                              ; $4d34: $00
	nop                                              ; $4d35: $00
	nop                                              ; $4d36: $00
	ld   h, $26                                      ; $4d37: $26 $26
	ld   h, $2d                                      ; $4d39: $26 $2d
	nop                                              ; $4d3b: $00
	ld   h, $26                                      ; $4d3c: $26 $26
	ld   b, $27                                      ; $4d3e: $06 $27
	ld   bc, $0526                                   ; $4d40: $01 $26 $05
	ld   h, $0b                                      ; $4d43: $26 $0b
	jr   $26                                         ; $4d45: $18 $26

	ld   h, $26                                      ; $4d47: $26 $26
	ld   h, $26                                      ; $4d49: $26 $26
	ld   h, $00                                      ; $4d4b: $26 $00
	nop                                              ; $4d4d: $00
	ld   h, $01                                      ; $4d4e: $26 $01
	ld   h, $26                                      ; $4d50: $26 $26
	ld   h, $26                                      ; $4d52: $26 $26
	ld   h, $26                                      ; $4d54: $26 $26
	ld   h, $26                                      ; $4d56: $26 $26
	ld   h, $26                                      ; $4d58: $26 $26
	ld   h, $26                                      ; $4d5a: $26 $26
	ld   h, $2e                                      ; $4d5c: $26 $2e
	rra                                              ; $4d5e: $1f
	rra                                              ; $4d5f: $1f
	rra                                              ; $4d60: $1f
	ld   h, $26                                      ; $4d61: $26 $26
	ld   h, $26                                      ; $4d63: $26 $26
	nop                                              ; $4d65: $00
	ld   h, $26                                      ; $4d66: $26 $26
	ld   h, $26                                      ; $4d68: $26 $26
	ld   h, $26                                      ; $4d6a: $26 $26
	ld   h, $00                                      ; $4d6c: $26 $00
	ld   bc, $0026                                   ; $4d6e: $01 $26 $00
	rra                                              ; $4d71: $1f
	ld   h, $03                                      ; $4d72: $26 $03
	ld   h, $26                                      ; $4d74: $26 $26
	ld   h, $26                                      ; $4d76: $26 $26
	ld   h, $26                                      ; $4d78: $26 $26
	nop                                              ; $4d7a: $00
	ld   h, $26                                      ; $4d7b: $26 $26
	rrca                                             ; $4d7d: $0f
	ld   b, $27                                      ; $4d7e: $06 $27
	ld   e, $2b                                      ; $4d80: $1e $2b
	dec  b                                           ; $4d82: $05
	ld   h, $26                                      ; $4d83: $26 $26
	jr   $0e                                         ; $4d85: $18 $0e

	ld   h, $26                                      ; $4d87: $26 $26
	ld   h, $00                                      ; $4d89: $26 $00
	ld   h, $00                                      ; $4d8b: $26 $00
	nop                                              ; $4d8d: $00
	ld   h, $26                                      ; $4d8e: $26 $26
	ld   h, $2b                                      ; $4d90: $26 $2b
	ld   h, $26                                      ; $4d92: $26 $26
	ld   h, $01                                      ; $4d94: $26 $01
	ld   h, $26                                      ; $4d96: $26 $26
	ld   h, $23                                      ; $4d98: $26 $23
	dec  l                                           ; $4d9a: $2d
	ld   h, $00                                      ; $4d9b: $26 $00
	ld   h, $1d                                      ; $4d9d: $26 $1d
	rra                                              ; $4d9f: $1f
	rra                                              ; $4da0: $1f
	rra                                              ; $4da1: $1f
	ld   h, $26                                      ; $4da2: $26 $26
	ld   h, $26                                      ; $4da4: $26 $26
	ld   h, $26                                      ; $4da6: $26 $26
	ld   h, $26                                      ; $4da8: $26 $26
	ld   h, $26                                      ; $4daa: $26 $26
	nop                                              ; $4dac: $00
	ld   h, $01                                      ; $4dad: $26 $01
	ld   bc, $2626                                   ; $4daf: $01 $26 $26
	ld   h, $03                                      ; $4db2: $26 $03
	nop                                              ; $4db4: $00
	ld   h, $26                                      ; $4db5: $26 $26
	ld   h, $26                                      ; $4db7: $26 $26
	ld   h, $26                                      ; $4db9: $26 $26
	ld   h, $26                                      ; $4dbb: $26 $26
	rrca                                             ; $4dbd: $0f
	ld   b, $27                                      ; $4dbe: $06 $27
	ld   e, $26                                      ; $4dc0: $1e $26
	dec  b                                           ; $4dc2: $05
	inc  b                                           ; $4dc3: $04
	dec  bc                                          ; $4dc4: $0b
	jr   $0e                                         ; $4dc5: $18 $0e

	ld   h, $00                                      ; $4dc7: $26 $00
	nop                                              ; $4dc9: $00
	ld   h, $26                                      ; $4dca: $26 $26
	ld   h, $00                                      ; $4dcc: $26 $00
	ld   h, $26                                      ; $4dce: $26 $26
	ld   h, $00                                      ; $4dd0: $26 $00
	ld   h, $26                                      ; $4dd2: $26 $26
	ld   h, $26                                      ; $4dd4: $26 $26
	ld   h, $00                                      ; $4dd6: $26 $00
	ld   h, $26                                      ; $4dd8: $26 $26
	ld   h, $00                                      ; $4dda: $26 $00
	ld   h, $1f                                      ; $4ddc: $26 $1f
	nop                                              ; $4dde: $00
	rra                                              ; $4ddf: $1f
	ld   h, $26                                      ; $4de0: $26 $26
	nop                                              ; $4de2: $00
	ld   h, $26                                      ; $4de3: $26 $26
	ld   h, $26                                      ; $4de5: $26 $26
	ld   h, $00                                      ; $4de7: $26 $00
	dec  de                                          ; $4de9: $1b
	ld   h, $26                                      ; $4dea: $26 $26
	ld   h, $26                                      ; $4dec: $26 $26
	nop                                              ; $4dee: $00
	dec  e                                           ; $4def: $1d
	nop                                              ; $4df0: $00
	rra                                              ; $4df1: $1f
	nop                                              ; $4df2: $00
	inc  bc                                          ; $4df3: $03
	ld   h, $26                                      ; $4df4: $26 $26
	ld   h, $26                                      ; $4df6: $26 $26
	ld   h, $26                                      ; $4df8: $26 $26
	ld   h, $26                                      ; $4dfa: $26 $26
	ld   h, $0f                                      ; $4dfc: $26 $0f
	ld   b, $27                                      ; $4dfe: $06 $27
	ld   e, $2e                                      ; $4e00: $1e $2e
	dec  b                                           ; $4e02: $05
	inc  b                                           ; $4e03: $04
	dec  bc                                          ; $4e04: $0b
	jr   jr_005_4e15                                 ; $4e05: $18 $0e

	ld   h, $26                                      ; $4e07: $26 $26
	ld   h, $26                                      ; $4e09: $26 $26
	ld   h, $26                                      ; $4e0b: $26 $26
	ld   bc, $2626                                   ; $4e0d: $01 $26 $26
	nop                                              ; $4e10: $00
	ld   h, $26                                      ; $4e11: $26 $26
	ld   h, $26                                      ; $4e13: $26 $26

jr_005_4e15:
	ld   h, $26                                      ; $4e15: $26 $26
	ld   h, $00                                      ; $4e17: $26 $00
	nop                                              ; $4e19: $00
	ld   h, $00                                      ; $4e1a: $26 $00
	ld   h, $26                                      ; $4e1c: $26 $26
	ld   h, $26                                      ; $4e1e: $26 $26
	nop                                              ; $4e20: $00
	ld   h, $26                                      ; $4e21: $26 $26
	ld   h, $2c                                      ; $4e23: $26 $2c
	inc  l                                           ; $4e25: $2c
	inc  l                                           ; $4e26: $2c
	ld   h, $26                                      ; $4e27: $26 $26
	nop                                              ; $4e29: $00
	ld   h, $00                                      ; $4e2a: $26 $00
	ld   h, $26                                      ; $4e2c: $26 $26
	nop                                              ; $4e2e: $00
	ld   h, $00                                      ; $4e2f: $26 $00
	ld   h, $26                                      ; $4e31: $26 $26
	nop                                              ; $4e33: $00
	ld   h, $26                                      ; $4e34: $26 $26
	nop                                              ; $4e36: $00
	ld   h, $01                                      ; $4e37: $26 $01
	ld   h, $26                                      ; $4e39: $26 $26
	ld   h, $00                                      ; $4e3b: $26 $00
	rrca                                             ; $4e3d: $0f
	ld   b, $27                                      ; $4e3e: $06 $27
	ld   e, $0b                                      ; $4e40: $1e $0b
	dec  b                                           ; $4e42: $05
	inc  b                                           ; $4e43: $04
	dec  bc                                          ; $4e44: $0b
	jr   jr_005_4e55                                 ; $4e45: $18 $0e

	inc  l                                           ; $4e47: $2c
	inc  l                                           ; $4e48: $2c
	ld   h, $26                                      ; $4e49: $26 $26
	ld   h, $26                                      ; $4e4b: $26 $26
	nop                                              ; $4e4d: $00
	nop                                              ; $4e4e: $00
	nop                                              ; $4e4f: $00
	nop                                              ; $4e50: $00
	nop                                              ; $4e51: $00
	nop                                              ; $4e52: $00
	nop                                              ; $4e53: $00
	nop                                              ; $4e54: $00

jr_005_4e55:
	nop                                              ; $4e55: $00
	nop                                              ; $4e56: $00
	nop                                              ; $4e57: $00
	nop                                              ; $4e58: $00
	nop                                              ; $4e59: $00
	nop                                              ; $4e5a: $00
	nop                                              ; $4e5b: $00
	nop                                              ; $4e5c: $00
	nop                                              ; $4e5d: $00
	nop                                              ; $4e5e: $00
	nop                                              ; $4e5f: $00
	nop                                              ; $4e60: $00
	nop                                              ; $4e61: $00
	nop                                              ; $4e62: $00
	nop                                              ; $4e63: $00
	nop                                              ; $4e64: $00
	nop                                              ; $4e65: $00
	nop                                              ; $4e66: $00
	nop                                              ; $4e67: $00
	nop                                              ; $4e68: $00
	nop                                              ; $4e69: $00
	nop                                              ; $4e6a: $00
	nop                                              ; $4e6b: $00
	nop                                              ; $4e6c: $00
	nop                                              ; $4e6d: $00
	nop                                              ; $4e6e: $00
	nop                                              ; $4e6f: $00
	nop                                              ; $4e70: $00
	nop                                              ; $4e71: $00
	nop                                              ; $4e72: $00
	nop                                              ; $4e73: $00
	nop                                              ; $4e74: $00
	nop                                              ; $4e75: $00
	nop                                              ; $4e76: $00
	nop                                              ; $4e77: $00
	nop                                              ; $4e78: $00
	nop                                              ; $4e79: $00
	nop                                              ; $4e7a: $00
	nop                                              ; $4e7b: $00
	nop                                              ; $4e7c: $00
	nop                                              ; $4e7d: $00
	nop                                              ; $4e7e: $00
	nop                                              ; $4e7f: $00
	nop                                              ; $4e80: $00
	nop                                              ; $4e81: $00
	nop                                              ; $4e82: $00
	nop                                              ; $4e83: $00
	nop                                              ; $4e84: $00
	nop                                              ; $4e85: $00
	nop                                              ; $4e86: $00
	nop                                              ; $4e87: $00
	nop                                              ; $4e88: $00
	nop                                              ; $4e89: $00
	nop                                              ; $4e8a: $00
	nop                                              ; $4e8b: $00
	nop                                              ; $4e8c: $00
	nop                                              ; $4e8d: $00
	ld   h, $26                                      ; $4e8e: $26 $26
	nop                                              ; $4e90: $00
	ld   h, $26                                      ; $4e91: $26 $26
	ld   h, $26                                      ; $4e93: $26 $26
	ld   h, $26                                      ; $4e95: $26 $26
	ld   h, $26                                      ; $4e97: $26 $26
	ld   h, $26                                      ; $4e99: $26 $26
	ld   h, $26                                      ; $4e9b: $26 $26
	ld   h, $26                                      ; $4e9d: $26 $26
	ld   h, $26                                      ; $4e9f: $26 $26
	ld   h, $26                                      ; $4ea1: $26 $26
	ld   h, $26                                      ; $4ea3: $26 $26
	ld   h, $26                                      ; $4ea5: $26 $26
	ld   h, $26                                      ; $4ea7: $26 $26
	ld   h, $26                                      ; $4ea9: $26 $26
	ld   h, $26                                      ; $4eab: $26 $26
	ld   h, $01                                      ; $4ead: $26 $01
	ld   h, $26                                      ; $4eaf: $26 $26
	dec  l                                           ; $4eb1: $2d
	ld   h, $00                                      ; $4eb2: $26 $00
	nop                                              ; $4eb4: $00
	ld   h, $00                                      ; $4eb5: $26 $00
	nop                                              ; $4eb7: $00
	nop                                              ; $4eb8: $00
	inc  l                                           ; $4eb9: $2c
	ld   h, $26                                      ; $4eba: $26 $26
	ld   h, $00                                      ; $4ebc: $26 $00
	ld   b, $27                                      ; $4ebe: $06 $27
	nop                                              ; $4ec0: $00
	nop                                              ; $4ec1: $00
	dec  b                                           ; $4ec2: $05
	nop                                              ; $4ec3: $00
	ld   h, $26                                      ; $4ec4: $26 $26
	nop                                              ; $4ec6: $00
	nop                                              ; $4ec7: $00
	nop                                              ; $4ec8: $00
	inc  l                                           ; $4ec9: $2c
	ld   h, $26                                      ; $4eca: $26 $26
	ld   h, $00                                      ; $4ecc: $26 $00
	ld   bc, $019b                                   ; $4ece: $01 $9b $01
	ld   d, b                                        ; $4ed1: $50
	ld   bc, $0148                                   ; $4ed2: $01 $48 $01
	.db $dc $01 $7f
	ld   bc, $0124                                   ; $4ed8: $01 $24 $01
	xor  b                                           ; $4edb: $a8
	xor  h                                           ; $4edc: $ac
	ld   (bc), a                                     ; $4edd: $02
	ld   b, b                                        ; $4ede: $40
	xor  b                                           ; $4edf: $a8
	xor  h                                           ; $4ee0: $ac
	xor  b                                           ; $4ee1: $a8
	ld   (bc), a                                     ; $4ee2: $02
	ret  z                                           ; $4ee3: $c8

	ret                                              ; $4ee4: $c9


	rlc  d                                           ; $4ee5: $cb $02
	ret  nz                                          ; $4ee7: $c0

	pop  bc                                          ; $4ee8: $c1
	jp   $9402                                       ; $4ee9: $c3 $02 $94


	sub  l                                           ; $4eec: $95
	sub  (hl)                                        ; $4eed: $96
	sub  a                                           ; $4eee: $97
	ld   (bc), a                                     ; $4eef: $02
	push hl                                          ; $4ef0: $e5
	and  $e7                                         ; $4ef1: $e6 $e7
	.db  $e4                                         ; $4ef3: $e4
	ld   (bc), a                                     ; $4ef4: $02
	ld   ($ff00+c), a                                ; $4ef5: $e2
	.db  $e3                                         ; $4ef6: $e3
	ldh  (<$e1), a                                   ; $4ef7: $e0 $e1
	ld   (bc), a                                     ; $4ef9: $02
	daa                                              ; $4efa: $27
	inc  h                                           ; $4efb: $24
	dec  h                                           ; $4efc: $25
	ld   h, $02                                      ; $4efd: $26 $02
	ldh  (<$e0), a                                   ; $4eff: $e0 $e0
	ldh  (<$e2), a                                   ; $4f01: $e0 $e2
	ld   ($ff00+c), a                                ; $4f03: $e2
	ld   ($ff00+c), a                                ; $4f04: $e2
	.db  $e3                                         ; $4f05: $e3
	.db  $e3                                         ; $4f06: $e3
	.db  $e3                                         ; $4f07: $e3
	and  b                                           ; $4f08: $a0
	and  h                                           ; $4f09: $a4
	xor  b                                           ; $4f0a: $a8
	and  h                                           ; $4f0b: $a4
	ld   (bc), a                                     ; $4f0c: $02
	ld   h, c                                        ; $4f0d: $61
	ld   h, l                                        ; $4f0e: $65
	ld   l, c                                        ; $4f0f: $69
	ld   d, l                                        ; $4f10: $55
	ld   e, c                                        ; $4f11: $59
	ld   e, l                                        ; $4f12: $5d
	ld   c, c                                        ; $4f13: $49
	ld   c, l                                        ; $4f14: $4d
	ld   d, c                                        ; $4f15: $51
	add  h                                           ; $4f16: $84
	adc  b                                           ; $4f17: $88
	adc  h                                           ; $4f18: $8c
	ld   a, b                                        ; $4f19: $78
	ld   a, h                                        ; $4f1a: $7c
	add  b                                           ; $4f1b: $80
	ld   l, h                                        ; $4f1c: $6c
	ld   (hl), b                                     ; $4f1d: $70
	ld   (hl), h                                     ; $4f1e: $74
	ld   a, $42                                      ; $4f1f: $3e $42
	ld   b, (hl)                                     ; $4f21: $46
	ldd  (hl), a                                     ; $4f22: $32
	ld   (hl), $3a                                   ; $4f23: $36 $3a
	ld   h, $2a                                      ; $4f25: $26 $2a
	ld   l, $86                                      ; $4f27: $2e $86
	adc  d                                           ; $4f29: $8a
	adc  (hl)                                        ; $4f2a: $8e
	ld   a, d                                        ; $4f2b: $7a
	ld   a, (hl)                                     ; $4f2c: $7e
	add  d                                           ; $4f2d: $82
	ld   l, (hl)                                     ; $4f2e: $6e
	ld   (hl), d                                     ; $4f2f: $72
	.db  $76                                         ; $4f30: $76
	add  h                                           ; $4f31: $84
	adc  b                                           ; $4f32: $88
	adc  h                                           ; $4f33: $8c
	ld   a, b                                        ; $4f34: $78
	ld   a, h                                        ; $4f35: $7c
	add  b                                           ; $4f36: $80
	ld   l, h                                        ; $4f37: $6c
	ld   (hl), b                                     ; $4f38: $70
	ld   (hl), h                                     ; $4f39: $74
	ld   c, b                                        ; $4f3a: $48
	ld   bc, $c0c0                                   ; $4f3b: $01 $c0 $c0
	call nz, $c0c4                                   ; $4f3e: $c4 $c4 $c0
	ret  nz                                          ; $4f41: $c0

	call nz, $02c4                                   ; $4f42: $c4 $c4 $02
	sbc  h                                           ; $4f45: $9c
	and  b                                           ; $4f46: $a0
	and  h                                           ; $4f47: $a4
	and  b                                           ; $4f48: $a0
	sbc  h                                           ; $4f49: $9c
	ld   bc, $a29e                                   ; $4f4a: $01 $9e $a2
	and  (hl)                                        ; $4f4d: $a6
	and  d                                           ; $4f4e: $a2
	sbc  (hl)                                        ; $4f4f: $9e
	ld   bc, $01c8                                   ; $4f50: $01 $c8 $01
	jp   z, $bd01                                    ; $4f53: $ca $01 $bd

	cp   l                                           ; $4f56: $bd
	ld   a, l                                        ; $4f57: $7d
	ld   a, l                                        ; $4f58: $7d
	ld   bc, $6763                                   ; $4f59: $01 $63 $67
	ld   l, e                                        ; $4f5c: $6b
	ld   d, a                                        ; $4f5d: $57
	ld   e, e                                        ; $4f5e: $5b
	ld   e, a                                        ; $4f5f: $5f
	ld   c, e                                        ; $4f60: $4b
	ld   c, a                                        ; $4f61: $4f
	ld   d, e                                        ; $4f62: $53
	ld   a, $42                                      ; $4f63: $3e $42
	ld   b, (hl)                                     ; $4f65: $46
	ldd  (hl), a                                     ; $4f66: $32
	ld   (hl), $3a                                   ; $4f67: $36 $3a
	ld   h, $2a                                      ; $4f69: $26 $2a
	ld   l, $60                                      ; $4f6b: $2e $60
	ld   h, h                                        ; $4f6d: $64
	ld   l, b                                        ; $4f6e: $68
	ld   d, h                                        ; $4f6f: $54
	ld   e, b                                        ; $4f70: $58
	ld   e, h                                        ; $4f71: $5c
	ld   c, b                                        ; $4f72: $48
	ld   c, h                                        ; $4f73: $4c
	ld   d, b                                        ; $4f74: $50
	adc  h                                           ; $4f75: $8c
	sub  b                                           ; $4f76: $90
	sbc  b                                           ; $4f77: $98
	ld   d, b                                        ; $4f78: $50
	ld   (bc), a                                     ; $4f79: $02
	xor  e                                           ; $4f7a: $ab
	xor  a                                           ; $4f7b: $af
	or   e                                           ; $4f7c: $b3
	sbc  a                                           ; $4f7d: $9f
	and  e                                           ; $4f7e: $a3
	and  a                                           ; $4f7f: $a7
	sub  e                                           ; $4f80: $93
	sub  a                                           ; $4f81: $97
	sbc  e                                           ; $4f82: $9b
	set  1, a                                        ; $4f83: $cb $cf
	ld   (bc), a                                     ; $4f85: $02
	ret  c                                           ; $4f86: $d8

	ld   bc, $aeaa                                   ; $4f87: $01 $aa $ae
	or   d                                           ; $4f8a: $b2
	xor  d                                           ; $4f8b: $aa
	xor  (hl)                                        ; $4f8c: $ae
	or   d                                           ; $4f8d: $b2
	xor  d                                           ; $4f8e: $aa
	xor  (hl)                                        ; $4f8f: $ae
	or   d                                           ; $4f90: $b2
	add  $a6                                         ; $4f91: $c6 $a6
	ld   (bc), a                                     ; $4f93: $02
	add  $01                                         ; $4f94: $c6 $01
	xor  (hl)                                        ; $4f96: $ae
	ld   bc, $eec2                                   ; $4f97: $01 $c2 $ee
	ld   bc, $8cc6                                   ; $4f9a: $01 $c6 $8c
	ld   (bc), a                                     ; $4f9d: $02
	ld   a, $42                                      ; $4f9e: $3e $42
	ld   b, (hl)                                     ; $4fa0: $46
	ldd  (hl), a                                     ; $4fa1: $32
	ld   (hl), $3a                                   ; $4fa2: $36 $3a
	ld   h, $2a                                      ; $4fa4: $26 $2a
	ld   l, $60                                      ; $4fa6: $2e $60
	ld   h, h                                        ; $4fa8: $64
	ld   l, b                                        ; $4fa9: $68
	ld   d, h                                        ; $4faa: $54
	ld   e, b                                        ; $4fab: $58
	ld   e, h                                        ; $4fac: $5c
	ld   c, b                                        ; $4fad: $48
	ld   c, h                                        ; $4fae: $4c
	ld   d, b                                        ; $4faf: $50
	add  h                                           ; $4fb0: $84
	adc  b                                           ; $4fb1: $88
	adc  h                                           ; $4fb2: $8c
	ld   a, b                                        ; $4fb3: $78
	ld   a, h                                        ; $4fb4: $7c
	add  b                                           ; $4fb5: $80
	ld   l, h                                        ; $4fb6: $6c
	ld   (hl), b                                     ; $4fb7: $70
	ld   (hl), h                                     ; $4fb8: $74
	inc  a                                           ; $4fb9: $3c
	ld   b, b                                        ; $4fba: $40
	ld   b, h                                        ; $4fbb: $44
	jr   nc, $34                                     ; $4fbc: $30 $34

	jr   c, jr_005_4fe4                              ; $4fbe: $38 $24

	jr   z, jr_005_4fee                              ; $4fc0: $28 $2c

	jp   z, $9ece                                    ; $4fc2: $ca $ce $9e

	xor  (hl)                                        ; $4fc5: $ae
	ld   (bc), a                                     ; $4fc6: $02
	inc  a                                           ; $4fc7: $3c
	ld   b, b                                        ; $4fc8: $40
	ld   b, h                                        ; $4fc9: $44
	jr   nc, jr_005_5000                             ; $4fca: $30 $34

	jr   c, $24                                      ; $4fcc: $38 $24

	jr   z, jr_005_4ffc                              ; $4fce: $28 $2c

	dec  e                                           ; $4fd0: $1d
	ld   bc, $eeea                                   ; $4fd1: $01 $ea $ee
	ld   ($eeea), a                                  ; $4fd4: $ea $ea $ee
	ld   ($eeea), a                                  ; $4fd7: $ea $ea $ee
	ld   ($2709), a                                  ; $4fda: $ea $09 $27
	inc  c                                           ; $4fdd: $0c
	add  d                                           ; $4fde: $82
	jp   hl                                          ; $4fdf: $e9


	ld   c, a                                        ; $4fe0: $4f
	adc  d                                           ; $4fe1: $8a
	jp   hl                                          ; $4fe2: $e9


	ld   c, a                                        ; $4fe3: $4f

jr_005_4fe4:
	ld   b, d                                        ; $4fe4: $42
	ld   bc, $de81                                   ; $4fe5: $01 $81 $de
	ld   c, a                                        ; $4fe8: $4f
	inc  h                                           ; $4fe9: $24
	add  hl, bc                                      ; $4fea: $09
	daa                                              ; $4feb: $27
	inc  c                                           ; $4fec: $0c
	add  d                                           ; $4fed: $82

jr_005_4fee:
	push af                                          ; $4fee: $f5
	ld   c, a                                        ; $4fef: $4f
	ld   b, d                                        ; $4ff0: $42
	ld   bc, $ed81                                   ; $4ff1: $01 $81 $ed
	ld   c, a                                        ; $4ff4: $4f
	inc  h                                           ; $4ff5: $24
	ld   b, d                                        ; $4ff6: $42
	ld   bc, $f682                                   ; $4ff7: $01 $82 $f6
	ld   c, a                                        ; $4ffa: $4f
	ld   b, d                                        ; $4ffb: $42

jr_005_4ffc:
	dec  b                                           ; $4ffc: $05
	add  d                                           ; $4ffd: $82
	or   $4f                                         ; $4ffe: $f6 $4f

jr_005_5000:
	inc  h                                           ; $5000: $24
	ld   d, h                                        ; $5001: $54
	nop                                              ; $5002: $00
	ld   b, d                                        ; $5003: $42
	ld   bc, $0381                                   ; $5004: $01 $81 $03
	ld   d, b                                        ; $5007: $50
	ld   d, h                                        ; $5008: $54
	rst  $38                                         ; $5009: $ff
	ld   d, e                                        ; $500a: $53
	ld   bc, $4218                                   ; $500b: $01 $18 $42
	ld   bc, $5424                                   ; $500e: $01 $24 $54
	rst  $38                                         ; $5011: $ff
	ld   c, (hl)                                     ; $5012: $4e
	ld   bc, $4218                                   ; $5013: $01 $18 $42
	ld   bc, $5424                                   ; $5016: $01 $24 $54
	rst  $38                                         ; $5019: $ff
	ld   c, a                                        ; $501a: $4f
	dec  b                                           ; $501b: $05
	adc  c                                           ; $501c: $89
	ld   (hl), e                                     ; $501d: $73
	ld   d, $42                                      ; $501e: $16 $42
	ld   (bc), a                                     ; $5020: $02
	jp   nz, $1801                                   ; $5021: $c2 $01 $18

	ld   d, b                                        ; $5024: $50
	ld   d, h                                        ; $5025: $54
	nop                                              ; $5026: $00
	inc  h                                           ; $5027: $24
	jp   nz, $181f                                   ; $5028: $c2 $1f $18

	ld   d, b                                        ; $502b: $50
	nop                                              ; $502c: $00
	ld   b, a                                        ; $502d: $47
	inc  bc                                          ; $502e: $03
	add  l                                           ; $502f: $85
	ld   ($184f), a                                  ; $5030: $ea $4f $18
	ld   c, b                                        ; $5033: $48
	ld   bc, $1450                                   ; $5034: $01 $50 $14
	ld   c, b                                        ; $5037: $48
	ld   (bc), a                                     ; $5038: $02
	ld   d, b                                        ; $5039: $50
	dec  d                                           ; $503a: $15
	ld   c, b                                        ; $503b: $48
	inc  b                                           ; $503c: $04
	ld   c, b                                        ; $503d: $48
	ld   ($1048), sp                                 ; $503e: $08 $48 $10
	ld   c, b                                        ; $5041: $48
	jr   nz, jr_005_5044                             ; $5042: $20 $00

jr_005_5044:
	ld   b, a                                        ; $5044: $47
	inc  bc                                          ; $5045: $03
	add  l                                           ; $5046: $85
	ld   ($184f), a                                  ; $5047: $ea $4f $18
	ld   c, d                                        ; $504a: $4a
	ld   bc, $024a                                   ; $504b: $01 $4a $02
	ld   c, d                                        ; $504e: $4a
	inc  b                                           ; $504f: $04
	ld   c, d                                        ; $5050: $4a
	ld   ($4700), sp                                 ; $5051: $08 $00 $47
	inc  bc                                          ; $5054: $03

Jump_005_5055:
	add  l                                           ; $5055: $85
	ld   ($184f), a                                  ; $5056: $ea $4f $18
	add  hl, de                                      ; $5059: $19
	jp   nz, Jump_005_590c                           ; $505a: $c2 $0c $59

	ld   d, b                                        ; $505d: $50
	ld   c, h                                        ; $505e: $4c
	rst  $38                                         ; $505f: $ff
	ld   c, (hl)                                     ; $5060: $4e
	rst  $38                                         ; $5061: $ff
	ld   d, e                                        ; $5062: $53
	rst  $38                                         ; $5063: $ff
	dec  de                                          ; $5064: $1b
	jp   nz, Jump_005_643f                           ; $5065: $c2 $3f $64

	ld   d, b                                        ; $5068: $50
	dec  h                                           ; $5069: $25
	dec  h                                           ; $506a: $25
	nop                                              ; $506b: $00
	ld   b, a                                        ; $506c: $47
	inc  bc                                          ; $506d: $03
	add  l                                           ; $506e: $85
	ld   ($184f), a                                  ; $506f: $ea $4f $18
	ld   d, d                                        ; $5072: $52
	inc  b                                           ; $5073: $04
	ld   d, d                                        ; $5074: $52
	inc  bc                                          ; $5075: $03
	ld   d, d                                        ; $5076: $52
	ld   (bc), a                                     ; $5077: $02
	ld   d, d                                        ; $5078: $52
	ld   bc, $0052                                   ; $5079: $01 $52 $00
	jp   nz, $7204                                   ; $507c: $c2 $04 $72

	ld   d, b                                        ; $507f: $50
	nop                                              ; $5080: $00
	add  hl, bc                                      ; $5081: $09
	ld   b, a                                        ; $5082: $47
	inc  b                                           ; $5083: $04
	rra                                              ; $5084: $1f
	daa                                              ; $5085: $27
	inc  c                                           ; $5086: $0c
	add  l                                           ; $5087: $85
	.db  $ed                                         ; $5088: $ed
	ld   c, a                                        ; $5089: $4f
	rst  $08                                         ; $508a: $cf
	rst  $38                                         ; $508b: $ff
	ld   a, (bc)                                     ; $508c: $0a
	ld   bc, $f685                                   ; $508d: $01 $85 $f6
	ld   c, a                                        ; $5090: $4f
	add  c                                           ; $5091: $81
	add  a                                           ; $5092: $87
	ld   d, b                                        ; $5093: $50
	ld   (bc), a                                     ; $5094: $02
	inc  b                                           ; $5095: $04
	ld   d, b                                        ; $5096: $50
	ld   b, c                                        ; $5097: $41
	ld   d, d                                        ; $5098: $52
	ld   c, e                                        ; $5099: $4b
	rst  $38                                         ; $509a: $ff
	ld   b, $04                                      ; $509b: $06 $04
	ld   b, h                                        ; $509d: $44
	ld   c, a                                        ; $509e: $4f
	ld   d, a                                        ; $509f: $57
	ld   c, (hl)                                     ; $50a0: $4e
	dec  l                                           ; $50a1: $2d
	ld   bc, $4f54                                   ; $50a2: $01 $54 $4f
	ld   d, a                                        ; $50a5: $57
	ld   c, (hl)                                     ; $50a6: $4e
	rst  $38                                         ; $50a7: $ff
	ld   a, (bc)                                     ; $50a8: $0a
	inc  b                                           ; $50a9: $04
	ld   d, e                                        ; $50aa: $53
	ld   c, b                                        ; $50ab: $48
	ld   c, c                                        ; $50ac: $49
	ld   d, b                                        ; $50ad: $50
	dec  l                                           ; $50ae: $2d
	ld   bc, $4159                                   ; $50af: $01 $59 $41
	ld   d, d                                        ; $50b2: $52
	ld   b, h                                        ; $50b3: $44
	rst  $38                                         ; $50b4: $ff
	ld   c, $04                                      ; $50b5: $0e $04
	ld   d, a                                        ; $50b7: $57
	ld   c, a                                        ; $50b8: $4f
	ld   c, a                                        ; $50b9: $4f
	ld   b, h                                        ; $50ba: $44
	ld   d, e                                        ; $50bb: $53
	rst  $38                                         ; $50bc: $ff
	ld   (de), a                                     ; $50bd: $12
	inc  b                                           ; $50be: $04
	ld   c, b                                        ; $50bf: $48
	ld   c, a                                        ; $50c0: $4f
	ld   d, l                                        ; $50c1: $55
	ld   d, e                                        ; $50c2: $53
	ld   b, l                                        ; $50c3: $45
	ld   d, e                                        ; $50c4: $53
	rst  $38                                         ; $50c5: $ff
	ld   (bc), a                                     ; $50c6: $02
	ld   c, $41                                      ; $50c7: $0e $41
	ld   c, c                                        ; $50c9: $49
	ld   d, d                                        ; $50ca: $52
	dec  l                                           ; $50cb: $2d
	ld   bc, $4f50                                   ; $50cc: $01 $50 $4f
	ld   d, d                                        ; $50cf: $52
	ld   d, h                                        ; $50d0: $54
	rst  $38                                         ; $50d1: $ff
	ld   b, $0e                                      ; $50d2: $06 $0e
	ld   b, d                                        ; $50d4: $42
	ld   b, l                                        ; $50d5: $45
	ld   b, c                                        ; $50d6: $41
	ld   b, e                                        ; $50d7: $43
	ld   c, b                                        ; $50d8: $48
	rst  $38                                         ; $50d9: $ff
	ld   a, (bc)                                     ; $50da: $0a
	ld   c, $57                                      ; $50db: $0e $57
	ld   b, c                                        ; $50dd: $41
	ld   d, d                                        ; $50de: $52
	ld   b, l                                        ; $50df: $45
	dec  l                                           ; $50e0: $2d
	ld   bc, $4f48                                   ; $50e1: $01 $48 $4f
	ld   d, l                                        ; $50e4: $55
	ld   d, e                                        ; $50e5: $53
	ld   b, l                                        ; $50e6: $45
	ld   d, e                                        ; $50e7: $53
	rst  $38                                         ; $50e8: $ff
	ld   c, $0e                                      ; $50e9: $0e $0e
	ld   d, e                                        ; $50eb: $53
	ld   c, h                                        ; $50ec: $4c
	ld   d, l                                        ; $50ed: $55
	ld   c, l                                        ; $50ee: $4d
	rst  $38                                         ; $50ef: $ff
	ld   (de), a                                     ; $50f0: $12
	ld   c, $43                                      ; $50f1: $0e $43
	ld   b, c                                        ; $50f3: $41
	ld   d, e                                        ; $50f4: $53
	ld   c, c                                        ; $50f5: $49
	ld   c, (hl)                                     ; $50f6: $4e
	ld   c, a                                        ; $50f7: $4f
	rst  $38                                         ; $50f8: $ff
	ld   a, (bc)                                     ; $50f9: $0a
	ld   d, $46                                      ; $50fa: $16 $46
	ld   c, c                                        ; $50fc: $49
	ld   c, (hl)                                     ; $50fd: $4e
	ld   b, c                                        ; $50fe: $41
	ld   c, h                                        ; $50ff: $4c
	ld   b, l                                        ; $5100: $45
	rst  $38                                         ; $5101: $ff
	ld   c, $16                                      ; $5102: $0e $16
	ld   d, b                                        ; $5104: $50
	ld   d, d                                        ; $5105: $52
	ld   c, c                                        ; $5106: $49
	ld   d, e                                        ; $5107: $53
	ld   c, a                                        ; $5108: $4f
	ld   c, (hl)                                     ; $5109: $4e
	rst  $38                                         ; $510a: $ff
	ld   (de), a                                     ; $510b: $12
	ld   d, $44                                      ; $510c: $16 $44
	ld   b, l                                        ; $510e: $45
	ld   c, l                                        ; $510f: $4d

Jump_005_5110:
	ld   c, a                                        ; $5110: $4f
	ld   c, (hl)                                     ; $5111: $4e
	daa                                              ; $5112: $27
	ld   d, e                                        ; $5113: $53
	ld   bc, $414c                                   ; $5114: $01 $4c $41
	ld   c, c                                        ; $5117: $49
	ld   d, d                                        ; $5118: $52
	rst  $38                                         ; $5119: $ff
	ld   a, a                                        ; $511a: $7f
	rra                                              ; $511b: $1f
	add  e                                           ; $511c: $83
	sub  h                                           ; $511d: $94
	ld   d, b                                        ; $511e: $50
	nop                                              ; $511f: $00
	inc  b                                           ; $5120: $04
	inc  bc                                          ; $5121: $03
	ld   e, c                                        ; $5122: $59
	ld   l, a                                        ; $5123: $6f
	ld   (hl), l                                     ; $5124: $75
	jr   nz, $6e                                     ; $5125: $20 $6e

	ld   h, l                                        ; $5127: $65
	ld   h, l                                        ; $5128: $65
	ld   h, h                                        ; $5129: $64
	jr   nz, jr_005_518d                             ; $512a: $20 $61

	ld   bc, $6974                                   ; $512c: $01 $74 $69
	ld   h, e                                        ; $512f: $63
	ld   l, e                                        ; $5130: $6b
	ld   h, l                                        ; $5131: $65
	ld   (hl), h                                     ; $5132: $74
	jr   nz, jr_005_51a9                             ; $5133: $20 $74

	ld   l, a                                        ; $5135: $6f
	ld   bc, $6972                                   ; $5136: $01 $72 $69
	ld   h, h                                        ; $5139: $64
	ld   h, l                                        ; $513a: $65
	jr   nz, jr_005_51b1                             ; $513b: $20 $74

	ld   l, b                                        ; $513d: $68
	ld   h, l                                        ; $513e: $65
	ld   bc, $7274                                   ; $513f: $01 $74 $72
	ld   h, c                                        ; $5142: $61
	ld   l, c                                        ; $5143: $69
	ld   l, (hl)                                     ; $5144: $6e
	ld   hl, $feff                                   ; $5145: $21 $ff $fe
	ld   a, a                                        ; $5148: $7f
	dec  b                                           ; $5149: $05
	nop                                              ; $514a: $00
	ld   d, a                                        ; $514b: $57
	ld   h, l                                        ; $514c: $65
	ld   l, h                                        ; $514d: $6c
	ld   h, e                                        ; $514e: $63
	ld   l, a                                        ; $514f: $6f
	ld   l, l                                        ; $5150: $6d
	ld   h, l                                        ; $5151: $65
	jr   nz, $41                                     ; $5152: $20 $41

	ld   h, d                                        ; $5154: $62
	ld   l, a                                        ; $5155: $6f
	ld   h, c                                        ; $5156: $61
	ld   (hl), d                                     ; $5157: $72
	ld   h, h                                        ; $5158: $64
	ld   hl, $feff                                   ; $5159: $21 $ff $fe
	ld   a, a                                        ; $515c: $7f
	ld   bc, $530d                                   ; $515d: $01 $0d $53
	ld   c, h                                        ; $5160: $4c
	ld   d, l                                        ; $5161: $55
	ld   c, l                                        ; $5162: $4d
	ld   d, e                                        ; $5163: $53
	rst  $38                                         ; $5164: $ff
	ld   (bc), a                                     ; $5165: $02
	ld   a, (bc)                                     ; $5166: $0a
	ld   d, h                                        ; $5167: $54
	ld   d, d                                        ; $5168: $52
	ld   b, c                                        ; $5169: $41
	ld   c, c                                        ; $516a: $49
	ld   c, (hl)                                     ; $516b: $4e
	rst  $38                                         ; $516c: $ff
	ld   (bc), a                                     ; $516d: $02
	.db  $10                                         ; $516e: $10
	ld   d, e                                        ; $516f: $53
	ld   d, h                                        ; $5170: $54
	ld   b, c                                        ; $5171: $41
	ld   d, h                                        ; $5172: $54
	ld   c, c                                        ; $5173: $49
	ld   c, a                                        ; $5174: $4f
	ld   c, (hl)                                     ; $5175: $4e
	rst  $38                                         ; $5176: $ff
	dec  b                                           ; $5177: $05
	dec  b                                           ; $5178: $05
	ld   d, b                                        ; $5179: $50
	ld   b, c                                        ; $517a: $41
	ld   d, d                                        ; $517b: $52
	ld   c, e                                        ; $517c: $4b
	rst  $38                                         ; $517d: $ff
	inc  b                                           ; $517e: $04
	dec  bc                                          ; $517f: $0b
	ld   d, a                                        ; $5180: $57
	ld   b, c                                        ; $5181: $41
	ld   d, d                                        ; $5182: $52
	ld   b, l                                        ; $5183: $45
	rst  $38                                         ; $5184: $ff
	dec  b                                           ; $5185: $05
	ld   a, (bc)                                     ; $5186: $0a
	ld   c, b                                        ; $5187: $48
	ld   c, a                                        ; $5188: $4f
	ld   d, l                                        ; $5189: $55
	ld   d, e                                        ; $518a: $53
	ld   b, l                                        ; $518b: $45
	ld   d, e                                        ; $518c: $53

jr_005_518d:
	rst  $38                                         ; $518d: $ff
	inc  b                                           ; $518e: $04
	ld   de, $4853                                   ; $518f: $11 $53 $48
	ld   c, c                                        ; $5192: $49
	ld   d, b                                        ; $5193: $50
	ld   bc, $4159                                   ; $5194: $01 $59 $41
	ld   d, d                                        ; $5197: $52
	ld   b, h                                        ; $5198: $44
	rst  $38                                         ; $5199: $ff
	dec  b                                           ; $519a: $05
	ld   d, $48                                      ; $519b: $16 $48
	ld   c, a                                        ; $519d: $4f
	ld   d, l                                        ; $519e: $55
	ld   d, e                                        ; $519f: $53
	ld   b, l                                        ; $51a0: $45
	ld   d, e                                        ; $51a1: $53
	rst  $38                                         ; $51a2: $ff
	ld   a, a                                        ; $51a3: $7f
	ld   bc, $570b                                   ; $51a4: $01 $0b $57
	ld   b, c                                        ; $51a7: $41
	ld   d, d                                        ; $51a8: $52

jr_005_51a9:
	ld   b, l                                        ; $51a9: $45
	ld   c, b                                        ; $51aa: $48
	ld   c, a                                        ; $51ab: $4f
	ld   d, l                                        ; $51ac: $55
	ld   d, e                                        ; $51ad: $53
	ld   b, l                                        ; $51ae: $45
	ld   d, e                                        ; $51af: $53
	rst  $38                                         ; $51b0: $ff

jr_005_51b1:
	ld   (bc), a                                     ; $51b1: $02
	ld   a, (bc)                                     ; $51b2: $0a
	ld   d, h                                        ; $51b3: $54
	ld   d, d                                        ; $51b4: $52
	ld   b, c                                        ; $51b5: $41
	ld   c, c                                        ; $51b6: $49
	ld   c, (hl)                                     ; $51b7: $4e
	rst  $38                                         ; $51b8: $ff
	ld   (bc), a                                     ; $51b9: $02
	.db  $10                                         ; $51ba: $10
	ld   d, e                                        ; $51bb: $53
	ld   d, h                                        ; $51bc: $54
	ld   b, c                                        ; $51bd: $41
	ld   d, h                                        ; $51be: $54
	ld   c, c                                        ; $51bf: $49
	ld   c, a                                        ; $51c0: $4f
	ld   c, (hl)                                     ; $51c1: $4e
	rst  $38                                         ; $51c2: $ff
	dec  b                                           ; $51c3: $05
	dec  b                                           ; $51c4: $05
	ld   d, b                                        ; $51c5: $50
	ld   b, c                                        ; $51c6: $41
	ld   d, d                                        ; $51c7: $52
	ld   c, e                                        ; $51c8: $4b
	rst  $38                                         ; $51c9: $ff
	dec  b                                           ; $51ca: $05
	ld   a, (bc)                                     ; $51cb: $0a
	ld   d, e                                        ; $51cc: $53
	ld   c, h                                        ; $51cd: $4c
	ld   d, l                                        ; $51ce: $55
	ld   c, l                                        ; $51cf: $4d
	ld   d, e                                        ; $51d0: $53
	rst  $38                                         ; $51d1: $ff
	inc  b                                           ; $51d2: $04
	ld   de, $4853                                   ; $51d3: $11 $53 $48
	ld   c, c                                        ; $51d6: $49
	ld   d, b                                        ; $51d7: $50
	ld   bc, $4159                                   ; $51d8: $01 $59 $41
	ld   d, d                                        ; $51db: $52
	ld   b, h                                        ; $51dc: $44
	rst  $38                                         ; $51dd: $ff
	dec  b                                           ; $51de: $05
	ld   d, $48                                      ; $51df: $16 $48
	ld   c, a                                        ; $51e1: $4f
	ld   d, l                                        ; $51e2: $55
	.db $53 $45
	ld   d, e                                        ; $51e5: $53
	rst  $38                                         ; $51e6: $ff
	ld   a, a                                        ; $51e7: $7f
	ld   bc, $530c                                   ; $51e8: $01 $0c $53
	ld   c, b                                        ; $51eb: $48
	ld   c, c                                        ; $51ec: $49
	ld   d, b                                        ; $51ed: $50
	ld   e, c                                        ; $51ee: $59
	ld   b, c                                        ; $51ef: $41
	ld   d, d                                        ; $51f0: $52
	ld   b, h                                        ; $51f1: $44
	rst  $38                                         ; $51f2: $ff
	ld   (bc), a                                     ; $51f3: $02
	ld   a, (bc)                                     ; $51f4: $0a
	ld   d, h                                        ; $51f5: $54
	ld   d, d                                        ; $51f6: $52
	ld   b, c                                        ; $51f7: $41
	ld   c, c                                        ; $51f8: $49
	ld   c, (hl)                                     ; $51f9: $4e
	rst  $38                                         ; $51fa: $ff
	ld   (bc), a                                     ; $51fb: $02
	.db  $10                                         ; $51fc: $10
	ld   d, e                                        ; $51fd: $53
	ld   d, h                                        ; $51fe: $54
	ld   b, c                                        ; $51ff: $41
	ld   d, h                                        ; $5200: $54
	ld   c, c                                        ; $5201: $49
	ld   c, a                                        ; $5202: $4f
	ld   c, (hl)                                     ; $5203: $4e
	rst  $38                                         ; $5204: $ff
	dec  b                                           ; $5205: $05
	dec  b                                           ; $5206: $05
	ld   d, b                                        ; $5207: $50
	ld   b, c                                        ; $5208: $41
	ld   d, d                                        ; $5209: $52
	ld   c, e                                        ; $520a: $4b
	rst  $38                                         ; $520b: $ff
	inc  b                                           ; $520c: $04
	dec  bc                                          ; $520d: $0b
	ld   d, a                                        ; $520e: $57
	ld   b, c                                        ; $520f: $41
	ld   d, d                                        ; $5210: $52
	ld   b, l                                        ; $5211: $45
	rst  $38                                         ; $5212: $ff
	dec  b                                           ; $5213: $05
	ld   a, (bc)                                     ; $5214: $0a
	ld   c, b                                        ; $5215: $48
	ld   c, a                                        ; $5216: $4f
	ld   d, l                                        ; $5217: $55
	ld   d, e                                        ; $5218: $53
	ld   b, l                                        ; $5219: $45
	ld   d, e                                        ; $521a: $53
	rst  $38                                         ; $521b: $ff
	dec  b                                           ; $521c: $05
	ld   de, $4c53                                   ; $521d: $11 $53 $4c
	ld   d, l                                        ; $5220: $55
	ld   c, l                                        ; $5221: $4d
	ld   d, e                                        ; $5222: $53
	rst  $38                                         ; $5223: $ff
	dec  b                                           ; $5224: $05
	rla                                              ; $5225: $17
	ld   c, b                                        ; $5226: $48
	ld   c, a                                        ; $5227: $4f
	ld   d, l                                        ; $5228: $55
	ld   d, e                                        ; $5229: $53
	ld   b, l                                        ; $522a: $45
	ld   d, e                                        ; $522b: $53
	rst  $38                                         ; $522c: $ff
	ld   a, a                                        ; $522d: $7f
	ld   bc, $500e                                   ; $522e: $01 $0e $50
	ld   b, c                                        ; $5231: $41
	ld   d, d                                        ; $5232: $52
	ld   c, e                                        ; $5233: $4b
	rst  $38                                         ; $5234: $ff
	ld   (bc), a                                     ; $5235: $02
	ld   a, (bc)                                     ; $5236: $0a
	ld   d, h                                        ; $5237: $54
	ld   d, d                                        ; $5238: $52
	ld   b, c                                        ; $5239: $41
	ld   c, c                                        ; $523a: $49
	ld   c, (hl)                                     ; $523b: $4e
	rst  $38                                         ; $523c: $ff
	ld   (bc), a                                     ; $523d: $02
	.db  $10                                         ; $523e: $10
	ld   d, e                                        ; $523f: $53
	ld   d, h                                        ; $5240: $54
	ld   b, c                                        ; $5241: $41
	ld   d, h                                        ; $5242: $54
	ld   c, c                                        ; $5243: $49
	ld   c, a                                        ; $5244: $4f
	ld   c, (hl)                                     ; $5245: $4e
	rst  $38                                         ; $5246: $ff
	dec  b                                           ; $5247: $05
	inc  b                                           ; $5248: $04
	ld   d, e                                        ; $5249: $53
	ld   c, h                                        ; $524a: $4c
	ld   d, l                                        ; $524b: $55
	ld   c, l                                        ; $524c: $4d
	ld   d, e                                        ; $524d: $53
	rst  $38                                         ; $524e: $ff
	inc  b                                           ; $524f: $04
	dec  bc                                          ; $5250: $0b
	ld   d, a                                        ; $5251: $57
	ld   b, c                                        ; $5252: $41
	ld   d, d                                        ; $5253: $52
	ld   b, l                                        ; $5254: $45
	rst  $38                                         ; $5255: $ff
	dec  b                                           ; $5256: $05
	ld   a, (bc)                                     ; $5257: $0a
	ld   c, b                                        ; $5258: $48
	ld   c, a                                        ; $5259: $4f
	ld   d, l                                        ; $525a: $55
	ld   d, e                                        ; $525b: $53
	ld   b, l                                        ; $525c: $45
	ld   d, e                                        ; $525d: $53
	rst  $38                                         ; $525e: $ff
	inc  b                                           ; $525f: $04
	ld   de, $4853                                   ; $5260: $11 $53 $48
	ld   c, c                                        ; $5263: $49
	ld   d, b                                        ; $5264: $50
	ld   bc, $4159                                   ; $5265: $01 $59 $41
	ld   d, d                                        ; $5268: $52
	ld   b, h                                        ; $5269: $44
	rst  $38                                         ; $526a: $ff
	dec  b                                           ; $526b: $05
	ld   d, $48                                      ; $526c: $16 $48
	ld   c, a                                        ; $526e: $4f
	ld   d, l                                        ; $526f: $55
	ld   d, e                                        ; $5270: $53
	ld   b, l                                        ; $5271: $45
	ld   d, e                                        ; $5272: $53
	rst  $38                                         ; $5273: $ff
	ld   a, a                                        ; $5274: $7f
	ld   bc, $480d                                   ; $5275: $01 $0d $48
	ld   c, a                                        ; $5278: $4f
	ld   d, l                                        ; $5279: $55
	ld   d, e                                        ; $527a: $53
	ld   b, l                                        ; $527b: $45
	ld   d, e                                        ; $527c: $53
	rst  $38                                         ; $527d: $ff
	ld   (bc), a                                     ; $527e: $02
	ld   a, (bc)                                     ; $527f: $0a
	ld   d, h                                        ; $5280: $54
	ld   d, d                                        ; $5281: $52
	ld   b, c                                        ; $5282: $41
	ld   c, c                                        ; $5283: $49
	ld   c, (hl)                                     ; $5284: $4e
	rst  $38                                         ; $5285: $ff
	ld   (bc), a                                     ; $5286: $02
	.db  $10                                         ; $5287: $10
	ld   d, e                                        ; $5288: $53
	ld   d, h                                        ; $5289: $54
	ld   b, c                                        ; $528a: $41
	ld   d, h                                        ; $528b: $54
	ld   c, c                                        ; $528c: $49
	ld   c, a                                        ; $528d: $4f
	ld   c, (hl)                                     ; $528e: $4e
	rst  $38                                         ; $528f: $ff
	dec  b                                           ; $5290: $05
	dec  b                                           ; $5291: $05
	ld   d, b                                        ; $5292: $50
	ld   b, c                                        ; $5293: $41
	ld   d, d                                        ; $5294: $52
	ld   c, e                                        ; $5295: $4b
	rst  $38                                         ; $5296: $ff
	inc  b                                           ; $5297: $04
	dec  bc                                          ; $5298: $0b
	ld   d, a                                        ; $5299: $57
	ld   b, c                                        ; $529a: $41
	ld   d, d                                        ; $529b: $52
	ld   b, l                                        ; $529c: $45
	rst  $38                                         ; $529d: $ff
	dec  b                                           ; $529e: $05
	ld   a, (bc)                                     ; $529f: $0a
	ld   c, b                                        ; $52a0: $48
	ld   c, a                                        ; $52a1: $4f
	ld   d, l                                        ; $52a2: $55
	ld   d, e                                        ; $52a3: $53
	ld   b, l                                        ; $52a4: $45
	ld   d, e                                        ; $52a5: $53
	rst  $38                                         ; $52a6: $ff
	inc  b                                           ; $52a7: $04
	ld   de, $4853                                   ; $52a8: $11 $53 $48
	ld   c, c                                        ; $52ab: $49
	ld   d, b                                        ; $52ac: $50
	ld   bc, $4159                                   ; $52ad: $01 $59 $41
	ld   d, d                                        ; $52b0: $52
	ld   b, h                                        ; $52b1: $44
	rst  $38                                         ; $52b2: $ff
	dec  b                                           ; $52b3: $05
	rla                                              ; $52b4: $17
	ld   d, e                                        ; $52b5: $53
	ld   c, h                                        ; $52b6: $4c
	ld   d, l                                        ; $52b7: $55
	ld   c, l                                        ; $52b8: $4d
	ld   d, e                                        ; $52b9: $53
	rst  $38                                         ; $52ba: $ff
	ld   a, a                                        ; $52bb: $7f
	ld   b, d                                        ; $52bc: $42
	ld   e, $c7                                      ; $52bd: $1e $c7
	add  h                                           ; $52bf: $84
	inc  bc                                          ; $52c0: $03
	inc  bc                                          ; $52c1: $03
	ld   b, d                                        ; $52c2: $42
	ld   a, (bc)                                     ; $52c3: $0a
	rst  $00                                         ; $52c4: $c7
	add  h                                           ; $52c5: $84
	ld   b, $03                                      ; $52c6: $06 $03
	ld   b, d                                        ; $52c8: $42
	ld   a, (bc)                                     ; $52c9: $0a
	rst  $00                                         ; $52ca: $c7
	add  h                                           ; $52cb: $84
	add  hl, bc                                      ; $52cc: $09
	inc  bc                                          ; $52cd: $03
	ld   b, d                                        ; $52ce: $42
	ld   a, (bc)                                     ; $52cf: $0a
	rst  $00                                         ; $52d0: $c7
	add  h                                           ; $52d1: $84
	inc  c                                           ; $52d2: $0c
	inc  bc                                          ; $52d3: $03
	add  l                                           ; $52d4: $85
	.db  $ed                                         ; $52d5: $ed
	ld   c, a                                        ; $52d6: $4f
	add  a                                           ; $52d7: $87
	ld   c, c                                        ; $52d8: $49
	ld   d, c                                        ; $52d9: $51
	add  l                                           ; $52da: $85
	or   $4f                                         ; $52db: $f6 $4f
	add  c                                           ; $52dd: $81
	call nc, $1f52                                   ; $52de: $d4 $52 $1f
	add  hl, bc                                      ; $52e1: $09
	daa                                              ; $52e2: $27
	inc  c                                           ; $52e3: $0c
	add  (hl)                                        ; $52e4: $86
	ld   ($8152), a                                  ; $52e5: $ea $52 $81
	add  hl, de                                      ; $52e8: $19
	ld   d, e                                        ; $52e9: $53
	rst  $38                                         ; $52ea: $ff
	nop                                              ; $52eb: $00
	nop                                              ; $52ec: $00
	ld   bc, $ff53                                   ; $52ed: $01 $53 $ff
	ld   bc, $0700                                   ; $52f0: $01 $00 $07
	ld   d, e                                        ; $52f3: $53
	rst  $38                                         ; $52f4: $ff
	nop                                              ; $52f5: $00
	ld   bc, $530d                                   ; $52f6: $01 $0d $53
	rst  $38                                         ; $52f9: $ff
	ld   bc, $1301                                   ; $52fa: $01 $01 $13
	ld   d, e                                        ; $52fd: $53
	rst  $38                                         ; $52fe: $ff
	rst  $38                                         ; $52ff: $ff
	rst  $38                                         ; $5300: $ff
	add  e                                           ; $5301: $83
	ld   e, l                                        ; $5302: $5d
	ld   d, c                                        ; $5303: $51
	add  c                                           ; $5304: $81
	inc  e                                           ; $5305: $1c
	ld   d, e                                        ; $5306: $53
	add  e                                           ; $5307: $83
	and  h                                           ; $5308: $a4
	ld   d, c                                        ; $5309: $51
	add  c                                           ; $530a: $81
	inc  e                                           ; $530b: $1c
	ld   d, e                                        ; $530c: $53
	add  e                                           ; $530d: $83
	add  sp, $51                                     ; $530e: $e8 $51
	add  c                                           ; $5310: $81
	inc  e                                           ; $5311: $1c
	ld   d, e                                        ; $5312: $53
	add  e                                           ; $5313: $83
	ld   l, $52                                      ; $5314: $2e $52
	add  c                                           ; $5316: $81
	inc  e                                           ; $5317: $1c
	ld   d, e                                        ; $5318: $53
	add  e                                           ; $5319: $83
	ld   (hl), l                                     ; $531a: $75
	ld   d, d                                        ; $531b: $52
	push bc                                          ; $531c: $c5
	ld   ($52bc), sp                                 ; $531d: $08 $bc $52
	add  l                                           ; $5320: $85
	.db  $ed                                         ; $5321: $ed
	ld   c, a                                        ; $5322: $4f
	add  a                                           ; $5323: $87
	jr   nz, $51                                     ; $5124: $20 $51

	add  l                                           ; $5326: $85
	or   $4f                                         ; $5327: $f6 $4f
	add  c                                           ; $5329: $81
	jr   nz, $53                                     ; $532a: $20 $53

	ld   b, d                                        ; $532c: $42
	ld   d, b                                        ; $532d: $50
	add  c                                           ; $532e: $81
	ccf                                              ; $532f: $3f
	ld   d, e                                        ; $5330: $53
	ld   b, d                                        ; $5331: $42
	and  b                                           ; $5332: $a0
	add  c                                           ; $5333: $81
	ccf                                              ; $5334: $3f
	ld   d, e                                        ; $5335: $53
	ld   b, d                                        ; $5336: $42
	ldh  a, (<$81)                                   ; $5337: $f0 $81
	ccf                                              ; $5339: $3f
	ld   d, e                                        ; $533a: $53
	ld   b, d                                        ; $533b: $42
	ld   a, ($5042)                                  ; $533c: $fa $42 $50
	inc  d                                           ; $533f: $14
	add  hl, bc                                      ; $5340: $09
	inc  c                                           ; $5341: $0c
	dec  e                                           ; $5342: $1d
	ld   bc, $0241                                   ; $5343: $01 $41 $02
	ld   ($4040), sp                                 ; $5346: $08 $40 $40
	ld   b, c                                        ; $5349: $41
	ld   bc, $4005                                   ; $534a: $01 $05 $40
	jr   nz, $07                                     ; $534d: $20 $07

	ld   b, b                                        ; $534f: $40
	sub  b                                           ; $5350: $90
	ld   b, $40                                      ; $5351: $06 $40
	ld   b, b                                        ; $5353: $40
	ld   ($9040), sp                                 ; $5354: $08 $40 $90
	pop  bc                                          ; $5357: $c1
	ld   l, (hl)                                     ; $5358: $6e
	ld   (hl), b                                     ; $5359: $70
	ld   b, b                                        ; $535a: $40
	dec  b                                           ; $535b: $05
	ld   b, b                                        ; $535c: $40
	jr   nz, jr_005_53a1                             ; $535d: $20 $42

	ld   bc, $0800                                   ; $535f: $01 $00 $08
	inc  d                                           ; $5362: $14
	add  hl, bc                                      ; $5363: $09
	inc  c                                           ; $5364: $0c
	dec  e                                           ; $5365: $1d
	ld   bc, $1040                                   ; $5366: $01 $40 $10
	ld   b, $40                                      ; $5369: $06 $40
	add  b                                           ; $536b: $80
	ld   ($3040), sp                                 ; $536c: $08 $40 $30
	dec  b                                           ; $536f: $05
	pop  bc                                          ; $5370: $c1
	ld   (hl), e                                     ; $5371: $73
	ldh  a, (<$10)                                   ; $5372: $f0 $10
	ld   b, b                                        ; $5374: $40
	ld   b, b                                        ; $5375: $40
	ld   ($4040), sp                                 ; $5376: $08 $40 $40
	dec  b                                           ; $5379: $05
	ld   b, b                                        ; $537a: $40
	jr   nz, jr_005_5384                             ; $537b: $20 $07

	ld   b, b                                        ; $537d: $40
	jr   nz, jr_005_5385                             ; $537e: $20 $05

	ld   b, b                                        ; $5380: $40
	jr   nz, jr_005_538b                             ; $5381: $20 $08

	ld   b, b                                        ; $5383: $40

jr_005_5384:
	add  b                                           ; $5384: $80

jr_005_5385:
	ld   b, $40                                      ; $5385: $06 $40
	ld   h, b                                        ; $5387: $60
	rlca                                             ; $5388: $07
	ld   b, b                                        ; $5389: $40
	ld   h, b                                        ; $538a: $60

jr_005_538b:
	ld   b, $40                                      ; $538b: $06 $40
	jr   nz, jr_005_5397                             ; $538d: $20 $08

	ld   b, b                                        ; $538f: $40
	ld   h, b                                        ; $5390: $60
	nop                                              ; $5391: $00
	add  l                                           ; $5392: $85
	ld   sp, hl                                      ; $5393: $f9
	ld   d, e                                        ; $5394: $53
	add  l                                           ; $5395: $85
	.db  $ed                                         ; $5396: $ed

jr_005_5397:
	ld   c, a                                        ; $5397: $4f
	add  h                                           ; $5398: $84
	and  h                                           ; $5399: $a4
	ld   d, e                                        ; $539a: $53
	add  a                                           ; $539b: $87
	ld   (hl), b                                     ; $539c: $70
	ld   d, h                                        ; $539d: $54
	add  l                                           ; $539e: $85
	or   $4f                                         ; $539f: $f6 $4f

jr_005_53a1:
	add  c                                           ; $53a1: $81
	sub  l                                           ; $53a2: $95
	ld   d, e                                        ; $53a3: $53
	add  l                                           ; $53a4: $85
	xor  h                                           ; $53a5: $ac
	ld   d, e                                        ; $53a6: $53
	jr   jr_005_53c5                                 ; $53a7: $18 $1c

	add  c                                           ; $53a9: $81
	ld   e, e                                        ; $53aa: $5b
	ld   d, h                                        ; $53ab: $54
	add  (hl)                                        ; $53ac: $86
	or   b                                           ; $53ad: $b0
	ld   d, e                                        ; $53ae: $53
	inc  h                                           ; $53af: $24
	rrca                                             ; $53b0: $0f
	ld   bc, $e002                                   ; $53b1: $01 $02 $e0
	ld   d, e                                        ; $53b4: $53
	dec  bc                                          ; $53b5: $0b
	inc  b                                           ; $53b6: $04
	inc  bc                                          ; $53b7: $03
	.db  $e3                                         ; $53b8: $e3
	ld   d, e                                        ; $53b9: $53
	dec  c                                           ; $53ba: $0d
	inc  bc                                          ; $53bb: $03
	ld   bc, $53e6                                   ; $53bc: $01 $e6 $53
	ld   (bc), a                                     ; $53bf: $02
	inc  bc                                          ; $53c0: $03
	nop                                              ; $53c1: $00
	rst  $20                                         ; $53c2: $e7
	ld   d, e                                        ; $53c3: $53
	dec  e                                           ; $53c4: $1d

jr_005_53c5:
	ld   bc, $ea04                                   ; $53c5: $01 $04 $ea
	ld   d, e                                        ; $53c8: $53
	rrca                                             ; $53c9: $0f
	inc  bc                                          ; $53ca: $03
	inc  bc                                          ; $53cb: $03
	.db  $ed                                         ; $53cc: $ed
	ld   d, e                                        ; $53cd: $53
	inc  c                                           ; $53ce: $0c
	inc  b                                           ; $53cf: $04
	inc  b                                           ; $53d0: $04
	ldh  a, (<$53)                                   ; $53d1: $f0 $53
	ld   a, (de)                                     ; $53d3: $1a
	inc  b                                           ; $53d4: $04
	ld   bc, $53f3                                   ; $53d5: $01 $f3 $53
	rlca                                             ; $53d8: $07
	ld   (bc), a                                     ; $53d9: $02
	dec  b                                           ; $53da: $05
	or   $53                                         ; $53db: $f6 $53
	rst  $38                                         ; $53dd: $ff
	rst  $38                                         ; $53de: $ff
	rst  $38                                         ; $53df: $ff
	ld   d, b                                        ; $53e0: $50
	rra                                              ; $53e1: $1f
	inc  h                                           ; $53e2: $24
	ld   d, b                                        ; $53e3: $50
	ldi  (hl), a                                     ; $53e4: $22
	inc  h                                           ; $53e5: $24
	inc  h                                           ; $53e6: $24
	ld   d, b                                        ; $53e7: $50
	inc  hl                                          ; $53e8: $23
	inc  h                                           ; $53e9: $24
	ld   d, b                                        ; $53ea: $50
	inc  bc                                          ; $53eb: $03
	inc  h                                           ; $53ec: $24
	ld   d, b                                        ; $53ed: $50
	dec  h                                           ; $53ee: $25
	inc  h                                           ; $53ef: $24
	ld   d, b                                        ; $53f0: $50
	add  hl, hl                                      ; $53f1: $29
	inc  h                                           ; $53f2: $24
	ld   d, b                                        ; $53f3: $50
	jr   z, jr_005_541a                              ; $53f4: $28 $24

	ld   d, b                                        ; $53f6: $50
	inc  l                                           ; $53f7: $2c
	inc  h                                           ; $53f8: $24
	add  (hl)                                        ; $53f9: $86
	cp   $53                                         ; $53fa: $fe $53
	jr   jr_005_53fe                                 ; $53fc: $18 $00

jr_005_53fe:
	rrca                                             ; $53fe: $0f
	ld   bc, $2e02                                   ; $53ff: $01 $02 $2e
	ld   d, h                                        ; $5402: $54
	dec  bc                                          ; $5403: $0b
	inc  b                                           ; $5404: $04
	inc  bc                                          ; $5405: $03
	inc  sp                                          ; $5406: $33
	ld   d, h                                        ; $5407: $54
	dec  c                                           ; $5408: $0d
	inc  bc                                          ; $5409: $03
	ld   bc, $5438                                   ; $540a: $01 $38 $54
	ld   (bc), a                                     ; $540d: $02
	inc  bc                                          ; $540e: $03
	nop                                              ; $540f: $00
	dec  a                                           ; $5410: $3d
	ld   d, h                                        ; $5411: $54
	dec  e                                           ; $5412: $1d
	ld   bc, $4204                                   ; $5413: $01 $04 $42
	ld   d, h                                        ; $5416: $54
	rrca                                             ; $5417: $0f
	inc  bc                                          ; $5418: $03
	inc  bc                                          ; $5419: $03

jr_005_541a:
	ld   b, a                                        ; $541a: $47
	ld   d, h                                        ; $541b: $54
	inc  c                                           ; $541c: $0c
	inc  b                                           ; $541d: $04
	inc  b                                           ; $541e: $04
	ld   c, h                                        ; $541f: $4c
	ld   d, h                                        ; $5420: $54
	ld   a, (de)                                     ; $5421: $1a
	inc  b                                           ; $5422: $04
	ld   bc, $5451                                   ; $5423: $01 $51 $54
	rlca                                             ; $5426: $07
	ld   (bc), a                                     ; $5427: $02
	dec  b                                           ; $5428: $05
	ld   d, (hl)                                     ; $5429: $56
	ld   d, h                                        ; $542a: $54
	rst  $38                                         ; $542b: $ff
	rst  $38                                         ; $542c: $ff
	rst  $38                                         ; $542d: $ff
	ret  z                                           ; $542e: $c8

	rra                                              ; $542f: $1f
	ld   e, e                                        ; $5430: $5b
	ld   d, h                                        ; $5431: $54
	inc  h                                           ; $5432: $24
	ret  z                                           ; $5433: $c8

	ldi  (hl), a                                     ; $5434: $22
	ld   e, e                                        ; $5435: $5b
	ld   d, h                                        ; $5436: $54
	inc  h                                           ; $5437: $24
	push bc                                          ; $5438: $c5
	ld   ($545b), sp                                 ; $5439: $08 $5b $54
	inc  h                                           ; $543c: $24
	ret  z                                           ; $543d: $c8

	inc  hl                                          ; $543e: $23
	ld   e, e                                        ; $543f: $5b
	ld   d, h                                        ; $5440: $54
	inc  h                                           ; $5441: $24
	ret  z                                           ; $5442: $c8

	inc  h                                           ; $5443: $24
	ld   e, e                                        ; $5444: $5b
	ld   d, h                                        ; $5445: $54
	inc  h                                           ; $5446: $24
	ret  z                                           ; $5447: $c8

	dec  h                                           ; $5448: $25
	ld   e, e                                        ; $5449: $5b
	ld   d, h                                        ; $544a: $54
	inc  h                                           ; $544b: $24
	ret  z                                           ; $544c: $c8

	add  hl, hl                                      ; $544d: $29
	ld   e, e                                        ; $544e: $5b
	ld   d, h                                        ; $544f: $54
	inc  h                                           ; $5450: $24
	ret  z                                           ; $5451: $c8

	jr   z, jr_005_54af                              ; $5452: $28 $5b

	ld   d, h                                        ; $5454: $54
	inc  h                                           ; $5455: $24
	ret  z                                           ; $5456: $c8

	inc  l                                           ; $5457: $2c
	ld   e, e                                        ; $5458: $5b
	ld   d, h                                        ; $5459: $54
	inc  h                                           ; $545a: $24
	add  (hl)                                        ; $545b: $86
	ld   l, b                                        ; $545c: $68
	ld   d, h                                        ; $545d: $54
	rst  $00                                         ; $545e: $c7
	add  h                                           ; $545f: $84
	add  b                                           ; $5460: $80
	add  b                                           ; $5461: $80
	nop                                              ; $5462: $00
	rst  $00                                         ; $5463: $c7
	xor  h                                           ; $5464: $ac
	add  b                                           ; $5465: $80
	add  b                                           ; $5466: $80
	nop                                              ; $5467: $00
	ld   a, (de)                                     ; $5468: $1a
	inc  b                                           ; $5469: $04
	ld   bc, $5463                                   ; $546a: $01 $63 $54
	rst  $38                                         ; $546d: $ff
	rst  $38                                         ; $546e: $ff
	rst  $38                                         ; $546f: $ff
	inc  b                                           ; $5470: $04
	ld   bc, $6f59                                   ; $5471: $01 $59 $6f
	ld   (hl), l                                     ; $5474: $75
	jr   nz, jr_005_54e5                             ; $5475: $20 $6e

	ld   h, l                                        ; $5477: $65
	ld   h, l                                        ; $5478: $65
	ld   h, h                                        ; $5479: $64
	ld   bc, $6f74                                   ; $547a: $01 $74 $6f
	jr   nz, jr_005_54e5                             ; $547d: $20 $66

	ld   l, c                                        ; $547f: $69
	ld   l, (hl)                                     ; $5480: $6e
	ld   h, h                                        ; $5481: $64
	jr   nz, jr_005_54e5                             ; $5482: $20 $61

	jr   nz, jr_005_54f1                             ; $5484: $20 $6b

	ld   h, l                                        ; $5486: $65
	ld   a, c                                        ; $5487: $79
	ld   bc, $6f74                                   ; $5488: $01 $74 $6f
	jr   nz, jr_005_5502                             ; $548b: $20 $75

	ld   l, (hl)                                     ; $548d: $6e
	ld   l, h                                        ; $548e: $6c
	ld   l, a                                        ; $548f: $6f
	ld   h, e                                        ; $5490: $63
	ld   l, e                                        ; $5491: $6b
	ld   bc, $6874                                   ; $5492: $01 $74 $68
	ld   l, c                                        ; $5495: $69
	ld   (hl), e                                     ; $5496: $73
	jr   nz, jr_005_54fd                             ; $5497: $20 $64

	ld   l, a                                        ; $5499: $6f
	ld   l, a                                        ; $549a: $6f
	ld   (hl), d                                     ; $549b: $72
	ld   l, $ff                                      ; $549c: $2e $ff
	cp   $7f                                         ; $549e: $fe $7f
	ld   bc, $a686                                   ; $54a0: $01 $86 $a6
	ld   d, h                                        ; $54a3: $54
	jr   jr_005_54a6                                 ; $54a4: $18 $00

jr_005_54a6:
	rrca                                             ; $54a6: $0f
	nop                                              ; $54a7: $00
	ld   (bc), a                                     ; $54a8: $02
	ld   hl, sp+$54                                  ; $54a9: $f8 $54
	rrca                                             ; $54ab: $0f
	nop                                              ; $54ac: $00
	nop                                              ; $54ad: $00
	dec  b                                           ; $54ae: $05

jr_005_54af:
	ld   d, l                                        ; $54af: $55
	nop                                              ; $54b0: $00
	nop                                              ; $54b1: $00
	ld   bc, $5512                                   ; $54b2: $01 $12 $55
	.db  $10                                         ; $54b5: $10
	inc  bc                                          ; $54b6: $03
	nop                                              ; $54b7: $00
	inc  hl                                          ; $54b8: $23
	ld   d, l                                        ; $54b9: $55
	ld   e, $02                                      ; $54ba: $1e $02
	ld   (bc), a                                     ; $54bc: $02
	jr   nc, $55                                     ; $54bd: $30 $55

	ld   ($0101), sp                                 ; $54bf: $08 $01 $01
	dec  a                                           ; $54c2: $3d
	ld   d, l                                        ; $54c3: $55
	rrca                                             ; $54c4: $0f
	ld   (bc), a                                     ; $54c5: $02
	nop                                              ; $54c6: $00
	ld   c, (hl)                                     ; $54c7: $4e
	ld   d, l                                        ; $54c8: $55
	dec  bc                                          ; $54c9: $0b
	ld   bc, $5b03                                   ; $54ca: $01 $03 $5b
	ld   d, l                                        ; $54cd: $55
	ld   de, $0100                                   ; $54ce: $11 $00 $01
	ld   l, h                                        ; $54d1: $6c
	ld   d, l                                        ; $54d2: $55
	rst  $38                                         ; $54d3: $ff
	rst  $38                                         ; $54d4: $ff
	rst  $38                                         ; $54d5: $ff
	inc  d                                           ; $54d6: $14
	rst  $00                                         ; $54d7: $c7
	nop                                              ; $54d8: $00
	add  b                                           ; $54d9: $80
	add  b                                           ; $54da: $80
	add  c                                           ; $54db: $81
	.db  $db                                         ; $54dc: $db
	ld   c, a                                        ; $54dd: $4f
	ld   d, h                                        ; $54de: $54
	rst  $38                                         ; $54df: $ff
	add  hl, de                                      ; $54e0: $19
	adc  c                                           ; $54e1: $89
	ld   l, d                                        ; $54e2: $6a
	ld   d, $42                                      ; $54e3: $16 $42

jr_005_54e5:
	inc  b                                           ; $54e5: $04
	ld   c, h                                        ; $54e6: $4c
	ld   bc, $6a89                                   ; $54e7: $01 $89 $6a
	ld   d, $42                                      ; $54ea: $16 $42
	ld   (bc), a                                     ; $54ec: $02
	adc  e                                           ; $54ed: $8b
	di                                               ; $54ee: $f3
	ld   d, h                                        ; $54ef: $54
	add  c                                           ; $54f0: $81

jr_005_54f1:
	and  $54                                         ; $54f1: $e6 $54
	ld   d, h                                        ; $54f3: $54
	nop                                              ; $54f4: $00
	ld   b, l                                        ; $54f5: $45
	jr   jr_005_551c                                 ; $54f6: $18 $24

	ret  z                                           ; $54f8: $c8

	ld   d, $2c                                      ; $54f9: $16 $2c
	ld   d, b                                        ; $54fb: $50
	add  l                                           ; $54fc: $85

jr_005_54fd:
	sub  $54                                         ; $54fd: $d6 $54
	ld   d, b                                        ; $54ff: $50
	ld   d, $85                                      ; $5500: $16 $85

jr_005_5502:
	sbc  $54                                         ; $5502: $de $54
	nop                                              ; $5504: $00
	ret  z                                           ; $5505: $c8

	rla                                              ; $5506: $17
	inc  l                                           ; $5507: $2c
	ld   d, b                                        ; $5508: $50
	add  l                                           ; $5509: $85
	sub  $54                                         ; $550a: $d6 $54
	ld   d, b                                        ; $550c: $50
	rla                                              ; $550d: $17
	add  l                                           ; $550e: $85
	sbc  $54                                         ; $550f: $de $54
	nop                                              ; $5511: $00
	ret  z                                           ; $5512: $c8

	jr   jr_005_5541                                 ; $5513: $18 $2c

	ld   d, b                                        ; $5515: $50
	add  l                                           ; $5516: $85
	sub  $54                                         ; $5517: $d6 $54
	ld   d, b                                        ; $5519: $50
	jr   -$7b                                        ; $551a: $18 $85

jr_005_551c:
	sbc  $54                                         ; $551c: $de $54
	rst  $00                                         ; $551e: $c7
	ld   l, h                                        ; $551f: $6c
	add  b                                           ; $5520: $80
	add  b                                           ; $5521: $80
	nop                                              ; $5522: $00
	ret  z                                           ; $5523: $c8

	add  hl, de                                      ; $5524: $19
	inc  l                                           ; $5525: $2c
	ld   d, b                                        ; $5526: $50
	add  l                                           ; $5527: $85
	sub  $54                                         ; $5528: $d6 $54
	ld   d, b                                        ; $552a: $50
	add  hl, de                                      ; $552b: $19
	add  l                                           ; $552c: $85
	sbc  $54                                         ; $552d: $de $54
	nop                                              ; $552f: $00
	ret  z                                           ; $5530: $c8

	ld   a, (de)                                     ; $5531: $1a
	inc  l                                           ; $5532: $2c
	ld   d, b                                        ; $5533: $50
	add  l                                           ; $5534: $85
	sub  $54                                         ; $5535: $d6 $54
	ld   d, b                                        ; $5537: $50
	ld   a, (de)                                     ; $5538: $1a
	add  l                                           ; $5539: $85
	sbc  $54                                         ; $553a: $de $54
	nop                                              ; $553c: $00
	ret  z                                           ; $553d: $c8

	dec  de                                          ; $553e: $1b
	inc  l                                           ; $553f: $2c
	ld   d, b                                        ; $5540: $50

jr_005_5541:
	add  l                                           ; $5541: $85
	sub  $54                                         ; $5542: $d6 $54
	ld   d, b                                        ; $5544: $50
	dec  de                                          ; $5545: $1b
	add  l                                           ; $5546: $85
	sbc  $54                                         ; $5547: $de $54
	rst  $00                                         ; $5549: $c7
	or   h                                           ; $554a: $b4
	add  b                                           ; $554b: $80
	add  b                                           ; $554c: $80
	nop                                              ; $554d: $00
	ret  z                                           ; $554e: $c8

	inc  e                                           ; $554f: $1c
	inc  l                                           ; $5550: $2c
	ld   d, b                                        ; $5551: $50
	add  l                                           ; $5552: $85
	sub  $54                                         ; $5553: $d6 $54
	ld   d, b                                        ; $5555: $50
	inc  e                                           ; $5556: $1c
	add  l                                           ; $5557: $85
	sbc  $54                                         ; $5558: $de $54
	nop                                              ; $555a: $00
	ret  z                                           ; $555b: $c8

	dec  e                                           ; $555c: $1d
	inc  l                                           ; $555d: $2c
	ld   d, b                                        ; $555e: $50
	add  l                                           ; $555f: $85
	sub  $54                                         ; $5560: $d6 $54
	ld   d, b                                        ; $5562: $50
	dec  e                                           ; $5563: $1d
	add  l                                           ; $5564: $85
	sbc  $54                                         ; $5565: $de $54
	rst  $00                                         ; $5567: $c7
	cp   b                                           ; $5568: $b8
	add  b                                           ; $5569: $80
	add  b                                           ; $556a: $80
	nop                                              ; $556b: $00
	ret  z                                           ; $556c: $c8

	ld   e, $2c                                      ; $556d: $1e $2c
	ld   d, b                                        ; $556f: $50
	add  l                                           ; $5570: $85
	sub  $54                                         ; $5571: $d6 $54
	ld   d, b                                        ; $5573: $50
	ld   e, $85                                      ; $5574: $1e $85
	sbc  $54                                         ; $5576: $de $54
	nop                                              ; $5578: $00
	inc  b                                           ; $5579: $04
	ld   bc, $6854                                   ; $557a: $01 $54 $68
	ld   h, l                                        ; $557d: $65
	jr   nz, jr_005_55f7                             ; $557e: $20 $77

	ld   l, b                                        ; $5580: $68
	ld   l, c                                        ; $5581: $69
	ld   (hl), h                                     ; $5582: $74
	ld   h, l                                        ; $5583: $65
	jr   nz, $7a                                     ; $5584: $20 $7a

	ld   l, a                                        ; $5586: $6f
	ld   l, (hl)                                     ; $5587: $6e
	ld   h, l                                        ; $5588: $65
	ld   bc, $7369                                   ; $5589: $01 $69 $73
	jr   nz, jr_005_55f4                             ; $558c: $20 $66

	ld   l, a                                        ; $558e: $6f
	ld   (hl), d                                     ; $558f: $72
	jr   nz, jr_005_55fe                             ; $5590: $20 $6c

	ld   l, a                                        ; $5592: $6f
	ld   h, c                                        ; $5593: $61
	ld   h, h                                        ; $5594: $64
	ld   l, c                                        ; $5595: $69
	ld   l, (hl)                                     ; $5596: $6e
	ld   h, a                                        ; $5597: $67
	ld   bc, $6e61                                   ; $5598: $01 $61 $6e
	ld   h, h                                        ; $559b: $64
	jr   nz, jr_005_5613                             ; $559c: $20 $75

	ld   l, (hl)                                     ; $559e: $6e
	ld   l, h                                        ; $559f: $6c
	ld   l, a                                        ; $55a0: $6f
	ld   h, c                                        ; $55a1: $61
	ld   h, h                                        ; $55a2: $64
	ld   l, c                                        ; $55a3: $69
	ld   l, (hl)                                     ; $55a4: $6e
	ld   h, a                                        ; $55a5: $67
	ld   bc, $6170                                   ; $55a6: $01 $70 $61
	ld   (hl), e                                     ; $55a9: $73
	ld   (hl), e                                     ; $55aa: $73
	ld   h, l                                        ; $55ab: $65
	ld   l, (hl)                                     ; $55ac: $6e
	ld   h, a                                        ; $55ad: $67
	ld   h, l                                        ; $55ae: $65
	ld   (hl), d                                     ; $55af: $72
	ld   (hl), e                                     ; $55b0: $73
	ld   l, $2e                                      ; $55b1: $2e $2e
	ld   l, $ff                                      ; $55b3: $2e $ff
	cp   $7f                                         ; $55b5: $fe $7f
	inc  b                                           ; $55b7: $04
	ld   bc, $6854                                   ; $55b8: $01 $54 $68
	ld   h, l                                        ; $55bb: $65
	jr   nz, jr_005_5630                             ; $55bc: $20 $72

	ld   h, l                                        ; $55be: $65
	ld   h, h                                        ; $55bf: $64

Jump_005_55c0:
	jr   nz, jr_005_563c                             ; $55c0: $20 $7a

	ld   l, a                                        ; $55c2: $6f
	ld   l, (hl)                                     ; $55c3: $6e
	ld   h, l                                        ; $55c4: $65
	ld   bc, $7369                                   ; $55c5: $01 $69 $73
	jr   nz, jr_005_562b                             ; $55c8: $20 $61

	jr   nz, jr_005_563a                             ; $55ca: $20 $6e

	ld   l, a                                        ; $55cc: $6f
	ld   bc, $6170                                   ; $55cd: $01 $70 $61
	ld   (hl), d                                     ; $55d0: $72
	ld   l, e                                        ; $55d1: $6b
	ld   l, c                                        ; $55d2: $69
	ld   l, (hl)                                     ; $55d3: $6e
	ld   h, a                                        ; $55d4: $67
	jr   nz, jr_005_5638                             ; $55d5: $20 $61

	ld   (hl), d                                     ; $55d7: $72
	ld   h, l                                        ; $55d8: $65
	ld   h, c                                        ; $55d9: $61
	ld   l, $ff                                      ; $55da: $2e $ff
	cp   $7f                                         ; $55dc: $fe $7f
	add  l                                           ; $55de: $85
	ld   ($874f), a                                  ; $55df: $ea $4f $87
	ld   a, c                                        ; $55e2: $79
	ld   d, l                                        ; $55e3: $55
	add  l                                           ; $55e4: $85
	or   $4f                                         ; $55e5: $f6 $4f
	add  c                                           ; $55e7: $81
	sbc  $55                                         ; $55e8: $de $55
	add  l                                           ; $55ea: $85
	ld   ($874f), a                                  ; $55eb: $ea $4f $87
	or   a                                           ; $55ee: $b7
	ld   d, l                                        ; $55ef: $55
	add  l                                           ; $55f0: $85
	or   $4f                                         ; $55f1: $f6 $4f
	add  c                                           ; $55f3: $81

jr_005_55f4:
	ld   ($4755), a                                  ; $55f4: $ea $55 $47

jr_005_55f7:
	inc  bc                                          ; $55f7: $03
	ld   b, h                                        ; $55f8: $44
	ld   (bc), a                                     ; $55f9: $02
	ld   b, c                                        ; $55fa: $41
	inc  bc                                          ; $55fb: $03
	inc  c                                           ; $55fc: $0c
	ld   b, b                                        ; $55fd: $40

jr_005_55fe:
	.db  $10                                         ; $55fe: $10
	ld   c, $ce                                      ; $55ff: $0e $ce
	.db  $10                                         ; $5601: $10
	ld   a, (bc)                                     ; $5602: $0a
	ld   d, (hl)                                     ; $5603: $56
	dec  bc                                          ; $5604: $0b
	dec  bc                                          ; $5605: $0b
	dec  bc                                          ; $5606: $0b
	add  c                                           ; $5607: $81
	.db  $fd                                         ; $5608: $fd
	ld   d, l                                        ; $5609: $55
	dec  c                                           ; $560a: $0d
	add  c                                           ; $560b: $81
	inc  b                                           ; $560c: $04
	ld   d, (hl)                                     ; $560d: $56
	inc  c                                           ; $560e: $0c
	daa                                              ; $560f: $27
	add  l                                           ; $5610: $85
	.db  $ed                                         ; $5611: $ed
	ld   c, a                                        ; $5612: $4f

jr_005_5613:
	add  (hl)                                        ; $5613: $86
	rla                                              ; $5614: $17
	ld   d, (hl)                                     ; $5615: $56
	nop                                              ; $5616: $00
	ld   (bc), a                                     ; $5617: $02
	rst  $38                                         ; $5618: $ff
	rst  $38                                         ; $5619: $ff
	dec  (hl)                                        ; $561a: $35
	ld   d, a                                        ; $561b: $57
	rlca                                             ; $561c: $07
	rst  $38                                         ; $561d: $ff
	rst  $38                                         ; $561e: $ff
	add  hl, hl                                      ; $561f: $29
	ld   d, (hl)                                     ; $5620: $56
	dec  bc                                          ; $5621: $0b
	rst  $38                                         ; $5622: $ff
	rst  $38                                         ; $5623: $ff
	ld   e, $58                                      ; $5624: $1e $58
	rst  $38                                         ; $5626: $ff
	rst  $38                                         ; $5627: $ff
	rst  $38                                         ; $5628: $ff
	add  (hl)                                        ; $5629: $86
	cpl                                              ; $562a: $2f

jr_005_562b:
	ld   d, (hl)                                     ; $562b: $56
	add  c                                           ; $562c: $81
	inc  a                                           ; $562d: $3c
	ld   d, (hl)                                     ; $562e: $56
	rlca                                             ; $562f: $07

jr_005_5630:
	ld   bc, $6803                                   ; $5630: $01 $03 $68
	ld   d, (hl)                                     ; $5633: $56
	rlca                                             ; $5634: $07
	ld   (bc), a                                     ; $5635: $02
	inc  b                                           ; $5636: $04
	ld   (hl), h                                     ; $5637: $74

jr_005_5638:
	ld   d, (hl)                                     ; $5638: $56
	rst  $38                                         ; $5639: $ff

jr_005_563a:
	rst  $38                                         ; $563a: $ff
	rst  $38                                         ; $563b: $ff

jr_005_563c:
	jp   Jump_005_5055                               ; $563c: $c3 $55 $50


	ld   d, (hl)                                     ; $563f: $56
	jp   $5c80                                       ; $5640: $c3 $80 $5c


	ld   d, (hl)                                     ; $5643: $56
	add  a                                           ; $5644: $87
	add  b                                           ; $5645: $80
	ld   d, (hl)                                     ; $5646: $56
	add  l                                           ; $5647: $85
	or   $4f                                         ; $5648: $f6 $4f
	add  l                                           ; $564a: $85
	.db  $ed                                         ; $564b: $ed
	ld   c, a                                        ; $564c: $4f
	add  c                                           ; $564d: $81
	ld   b, h                                        ; $564e: $44
	ld   d, (hl)                                     ; $564f: $56
	add  a                                           ; $5650: $87
	xor  c                                           ; $5651: $a9
	ld   d, (hl)                                     ; $5652: $56
	add  l                                           ; $5653: $85
	or   $4f                                         ; $5654: $f6 $4f
	add  l                                           ; $5656: $85
	.db  $ed                                         ; $5657: $ed
	ld   c, a                                        ; $5658: $4f
	add  c                                           ; $5659: $81
	ld   d, b                                        ; $565a: $50
	ld   d, (hl)                                     ; $565b: $56
	add  a                                           ; $565c: $87
	cp   (hl)                                        ; $565d: $be
	ld   d, (hl)                                     ; $565e: $56
	add  l                                           ; $565f: $85
	or   $4f                                         ; $5660: $f6 $4f
	add  l                                           ; $5662: $85
	.db  $ed                                         ; $5663: $ed
	ld   c, a                                        ; $5664: $4f
	add  c                                           ; $5665: $81
	ld   e, h                                        ; $5666: $5c
	ld   d, (hl)                                     ; $5667: $56
	add  a                                           ; $5668: $87
	pop  hl                                          ; $5669: $e1
	ld   d, (hl)                                     ; $566a: $56
	add  l                                           ; $566b: $85
	or   $4f                                         ; $566c: $f6 $4f
	add  l                                           ; $566e: $85
	.db  $ed                                         ; $566f: $ed
	ld   c, a                                        ; $5670: $4f
	add  c                                           ; $5671: $81
	ld   l, b                                        ; $5672: $68
	ld   d, (hl)                                     ; $5673: $56
	add  a                                           ; $5674: $87
	ld   bc, $8557                                   ; $5675: $01 $57 $85
	or   $4f                                         ; $5678: $f6 $4f
	add  l                                           ; $567a: $85
	.db  $ed                                         ; $567b: $ed
	ld   c, a                                        ; $567c: $4f
	add  c                                           ; $567d: $81
	ld   (hl), h                                     ; $567e: $74
	ld   d, (hl)                                     ; $567f: $56
	inc  b                                           ; $5680: $04
	ld   bc, $6854                                   ; $5681: $01 $54 $68
	ld   h, l                                        ; $5684: $65
	jr   nz, jr_005_56fb                             ; $5685: $20 $74

	ld   l, a                                        ; $5687: $6f
	ld   (hl), d                                     ; $5688: $72
	ld   h, e                                        ; $5689: $63
	ld   l, b                                        ; $568a: $68
	jr   nz, jr_005_56f6                             ; $568b: $20 $69

	ld   (hl), e                                     ; $568d: $73
	ld   bc, $7375                                   ; $568e: $01 $75 $73
	ld   h, l                                        ; $5691: $65
	ld   h, (hl)                                     ; $5692: $66
	ld   (hl), l                                     ; $5693: $75
	ld   l, h                                        ; $5694: $6c
	jr   nz, jr_005_5700                             ; $5695: $20 $69

	ld   l, (hl)                                     ; $5697: $6e
	jr   nz, jr_005_570d                             ; $5698: $20 $73

	ld   l, a                                        ; $569a: $6f
	ld   l, l                                        ; $569b: $6d
	ld   h, l                                        ; $569c: $65
	ld   bc, $6f72                                   ; $569d: $01 $72 $6f
	ld   l, a                                        ; $56a0: $6f
	ld   l, l                                        ; $56a1: $6d
	ld   (hl), e                                     ; $56a2: $73
	ld   l, $2e                                      ; $56a3: $2e $2e
	ld   l, $ff                                      ; $56a5: $2e $ff
	cp   $7f                                         ; $56a7: $fe $7f
	dec  b                                           ; $56a9: $05
	inc  bc                                          ; $56aa: $03
	ld   c, b                                        ; $56ab: $48
	ld   h, c                                        ; $56ac: $61
	.db  $76                                         ; $56ad: $76
	ld   h, l                                        ; $56ae: $65
	jr   nz, jr_005_5712                             ; $56af: $20 $61

	ld   bc, $696e                                   ; $56b1: $01 $6e $69
	ld   h, e                                        ; $56b4: $63
	ld   h, l                                        ; $56b5: $65
	jr   nz, jr_005_571c                             ; $56b6: $20 $64

	ld   h, c                                        ; $56b8: $61
	ld   a, c                                        ; $56b9: $79
	ld   hl, $feff                                   ; $56ba: $21 $ff $fe
	ld   a, a                                        ; $56bd: $7f
	inc  b                                           ; $56be: $04
	ld   (bc), a                                     ; $56bf: $02
	ld   b, (hl)                                     ; $56c0: $46
	ld   l, c                                        ; $56c1: $69
	ld   l, (hl)                                     ; $56c2: $6e
	ld   h, h                                        ; $56c3: $64
	jr   nz, jr_005_573a                             ; $56c4: $20 $74

	ld   l, b                                        ; $56c6: $68
	ld   h, l                                        ; $56c7: $65
	jr   nz, jr_005_5735                             ; $56c8: $20 $6b

	ld   h, l                                        ; $56ca: $65
	ld   a, c                                        ; $56cb: $79
	ld   bc, $6f74                                   ; $56cc: $01 $74 $6f
	jr   nz, jr_005_5738                             ; $56cf: $20 $67

	ld   h, l                                        ; $56d1: $65
	ld   (hl), h                                     ; $56d2: $74
	jr   nz, $74                                     ; $56d3: $20 $74

	ld   l, b                                        ; $56d5: $68
	ld   h, l                                        ; $56d6: $65
	ld   bc, $6f62                                   ; $56d7: $01 $62 $6f
	ld   l, a                                        ; $56da: $6f
	ld   (hl), h                                     ; $56db: $74
	ld   (hl), e                                     ; $56dc: $73
	ld   l, $ff                                      ; $56dd: $2e $ff
	cp   $7f                                         ; $56df: $fe $7f
	dec  b                                           ; $56e1: $05
	ld   bc, $6157                                   ; $56e2: $01 $57 $61
	ld   (hl), h                                     ; $56e5: $74
	ld   h, e                                        ; $56e6: $63
	ld   l, b                                        ; $56e7: $68
	jr   nz, jr_005_5759                             ; $56e8: $20 $6f

	ld   (hl), l                                     ; $56ea: $75
	ld   (hl), h                                     ; $56eb: $74
	jr   nz, jr_005_5754                             ; $56ec: $20 $66

	ld   l, a                                        ; $56ee: $6f
	ld   (hl), d                                     ; $56ef: $72
	ld   bc, $6874                                   ; $56f0: $01 $74 $68
	ld   h, l                                        ; $56f3: $65
	jr   nz, jr_005_575c                             ; $56f4: $20 $66

jr_005_56f6:
	ld   l, a                                        ; $56f6: $6f
	ld   (hl), d                                     ; $56f7: $72
	ld   l, e                                        ; $56f8: $6b
	ld   l, h                                        ; $56f9: $6c
	ld   l, c                                        ; $56fa: $69

jr_005_56fb:
	ld   h, (hl)                                     ; $56fb: $66
	ld   (hl), h                                     ; $56fc: $74
	ld   hl, $feff                                   ; $56fd: $21 $ff $fe

jr_005_5700:
	ld   a, a                                        ; $5700: $7f
	inc  b                                           ; $5701: $04
	nop                                              ; $5702: $00
	ld   e, c                                        ; $5703: $59
	ld   l, a                                        ; $5704: $6f
	ld   (hl), l                                     ; $5705: $75
	jr   nz, $6e                                     ; $56e6: $20 $6e

	ld   h, l                                        ; $5708: $65
	ld   h, l                                        ; $5709: $65
	ld   h, h                                        ; $570a: $64
	jr   nz, jr_005_5781                             ; $570b: $20 $74

jr_005_570d:
	ld   l, b                                        ; $570d: $68
	ld   h, l                                        ; $570e: $65
	ld   bc, $6f42                                   ; $570f: $01 $42 $6f

jr_005_5712:
	ld   l, a                                        ; $5712: $6f
	ld   (hl), h                                     ; $5713: $74
	ld   (hl), e                                     ; $5714: $73
	jr   nz, jr_005_578b                             ; $5715: $20 $74

	ld   l, a                                        ; $5717: $6f
	ld   bc, $7263                                   ; $5718: $01 $63 $72
	ld   l, a                                        ; $571b: $6f

jr_005_571c:
	ld   (hl), e                                     ; $571c: $73
	ld   (hl), e                                     ; $571d: $73
	jr   nz, jr_005_5794                             ; $571e: $20 $74

	ld   l, b                                        ; $5720: $68
	ld   h, l                                        ; $5721: $65
	ld   bc, $7562                                   ; $5722: $01 $62 $75
	ld   (hl), d                                     ; $5725: $72
	ld   l, (hl)                                     ; $5726: $6e
	ld   l, c                                        ; $5727: $69
	ld   l, (hl)                                     ; $5728: $6e
	ld   h, a                                        ; $5729: $67
	jr   nz, jr_005_579e                             ; $572a: $20 $72

	ld   (hl), l                                     ; $572c: $75
	ld   h, d                                        ; $572d: $62
	ld   h, d                                        ; $572e: $62
	ld   l, h                                        ; $572f: $6c
	ld   h, l                                        ; $5730: $65
	ld   hl, $feff                                   ; $5731: $21 $ff $fe
	ld   a, a                                        ; $5734: $7f

jr_005_5735:
	add  (hl)                                        ; $5735: $86
	dec  sp                                          ; $5736: $3b
	ld   d, a                                        ; $5737: $57

jr_005_5738:
	add  c                                           ; $5738: $81
	ld   c, b                                        ; $5739: $48

jr_005_573a:
	ld   d, a                                        ; $573a: $57
	ld   (bc), a                                     ; $573b: $02
	inc  b                                           ; $573c: $04
	ld   bc, $5774                                   ; $573d: $01 $74 $57
	ld   (bc), a                                     ; $5740: $02
	nop                                              ; $5741: $00
	ld   bc, $5780                                   ; $5742: $01 $80 $57
	rst  $38                                         ; $5745: $ff
	rst  $38                                         ; $5746: $ff
	rst  $38                                         ; $5747: $ff
	jp   $5c55                                       ; $5748: $c3 $55 $5c


	ld   d, a                                        ; $574b: $57
	jp   Jump_005_6880                               ; $574c: $c3 $80 $68


	ld   d, a                                        ; $574f: $57
	add  a                                           ; $5750: $87
	adc  h                                           ; $5751: $8c
	ld   d, a                                        ; $5752: $57
	add  l                                           ; $5753: $85

jr_005_5754:
	or   $4f                                         ; $5754: $f6 $4f
	add  l                                           ; $5756: $85
	.db  $ed                                         ; $5757: $ed
	ld   c, a                                        ; $5758: $4f

jr_005_5759:
	add  c                                           ; $5759: $81
	ld   d, b                                        ; $575a: $50
	ld   d, a                                        ; $575b: $57

jr_005_575c:
	add  a                                           ; $575c: $87
	cp   b                                           ; $575d: $b8
	ld   d, a                                        ; $575e: $57
	add  l                                           ; $575f: $85
	or   $4f                                         ; $5760: $f6 $4f
	add  l                                           ; $5762: $85
	.db  $ed                                         ; $5763: $ed
	ld   c, a                                        ; $5764: $4f
	add  c                                           ; $5765: $81
	ld   e, h                                        ; $5766: $5c
	ld   d, a                                        ; $5767: $57
	add  a                                           ; $5768: $87
	push de                                          ; $5769: $d5
	ld   d, a                                        ; $576a: $57
	add  l                                           ; $576b: $85
	or   $4f                                         ; $576c: $f6 $4f
	add  l                                           ; $576e: $85
	.db  $ed                                         ; $576f: $ed
	ld   c, a                                        ; $5770: $4f
	add  c                                           ; $5771: $81
	ld   l, b                                        ; $5772: $68
	ld   d, a                                        ; $5773: $57
	add  a                                           ; $5774: $87
	ld   ($8557), a                                  ; $5775: $ea $57 $85
	or   $4f                                         ; $5778: $f6 $4f
	add  l                                           ; $577a: $85
	.db  $ed                                         ; $577b: $ed
	ld   c, a                                        ; $577c: $4f
	add  c                                           ; $577d: $81
	ld   (hl), h                                     ; $577e: $74
	ld   d, a                                        ; $577f: $57

Jump_005_5780:
	add  a                                           ; $5780: $87

jr_005_5781:
	ld   bc, $8557                                   ; $5781: $01 $57 $85
	or   $4f                                         ; $5784: $f6 $4f
	add  l                                           ; $5786: $85
	.db  $ed                                         ; $5787: $ed
	ld   c, a                                        ; $5788: $4f
	add  c                                           ; $5789: $81
	add  b                                           ; $578a: $80

jr_005_578b:
	ld   d, a                                        ; $578b: $57
	inc  b                                           ; $578c: $04
	ld   bc, $6854                                   ; $578d: $01 $54 $68
	ld   h, l                                        ; $5790: $65
	jr   nz, jr_005_5807                             ; $5791: $20 $74

	ld   l, a                                        ; $5793: $6f

jr_005_5794:
	ld   (hl), d                                     ; $5794: $72
	ld   h, e                                        ; $5795: $63
	ld   l, b                                        ; $5796: $68
	jr   nz, jr_005_57fc                             ; $5797: $20 $63

	ld   h, c                                        ; $5799: $61
	ld   l, (hl)                                     ; $579a: $6e
	ld   bc, $6562                                   ; $579b: $01 $62 $65

jr_005_579e:
	jr   nz, jr_005_5806                             ; $579e: $20 $66

	ld   l, a                                        ; $57a0: $6f
	ld   (hl), l                                     ; $57a1: $75
	ld   l, (hl)                                     ; $57a2: $6e
	ld   h, h                                        ; $57a3: $64
	jr   nz, $69                                     ; $57a4: $20 $69

	ld   l, (hl)                                     ; $57a6: $6e
	ld   bc, $6874                                   ; $57a7: $01 $74 $68
	ld   h, l                                        ; $57aa: $65
	jr   nz, jr_005_5817                             ; $57ab: $20 $6a

	ld   (hl), l                                     ; $57ad: $75
	ld   l, (hl)                                     ; $57ae: $6e
	ld   l, e                                        ; $57af: $6b
	ld   a, c                                        ; $57b0: $79
	ld   h, c                                        ; $57b1: $61
	ld   (hl), d                                     ; $57b2: $72
	ld   h, h                                        ; $57b3: $64
	ld   hl, $feff                                   ; $57b4: $21 $ff $fe
	ld   a, a                                        ; $57b7: $7f
	dec  b                                           ; $57b8: $05
	ld   bc, $6548                                   ; $57b9: $01 $48 $65
	ld   a, c                                        ; $57bc: $79
	jr   nz, jr_005_5821                             ; $57bd: $20 $62

	ld   (hl), l                                     ; $57bf: $75
	ld   h, h                                        ; $57c0: $64
	ld   h, h                                        ; $57c1: $64
	ld   a, c                                        ; $57c2: $79
	ld   hl, $5301                                   ; $57c3: $21 $01 $53
	ld   (hl), b                                     ; $57c6: $70
	ld   h, c                                        ; $57c7: $61
	ld   (hl), d                                     ; $57c8: $72
	ld   h, l                                        ; $57c9: $65
	jr   nz, jr_005_582d                             ; $57ca: $20 $61

	jr   nz, jr_005_5832                             ; $57cc: $20 $64

	ld   l, c                                        ; $57ce: $69
	ld   l, l                                        ; $57cf: $6d
	ld   h, l                                        ; $57d0: $65
	ccf                                              ; $57d1: $3f
	rst  $38                                         ; $57d2: $ff
	cp   $7f                                         ; $57d3: $fe $7f
	dec  b                                           ; $57d5: $05
	inc  bc                                          ; $57d6: $03
	ld   c, b                                        ; $57d7: $48
	ld   h, c                                        ; $57d8: $61
	.db  $76                                         ; $57d9: $76
	ld   h, l                                        ; $57da: $65
	jr   nz, jr_005_583e                             ; $57db: $20 $61

	ld   bc, $696e                                   ; $57dd: $01 $6e $69
	ld   h, e                                        ; $57e0: $63
	ld   h, l                                        ; $57e1: $65
	jr   nz, jr_005_5848                             ; $57e2: $20 $64

	ld   h, c                                        ; $57e4: $61
	ld   a, c                                        ; $57e5: $79
	ld   hl, $feff                                   ; $57e6: $21 $ff $fe
	ld   a, a                                        ; $57e9: $7f
	inc  b                                           ; $57ea: $04
	ld   bc, $6542                                   ; $57eb: $01 $42 $65
	jr   nz, jr_005_5853                             ; $57ee: $20 $63

	ld   h, c                                        ; $57f0: $61
	ld   (hl), d                                     ; $57f1: $72
	ld   h, l                                        ; $57f2: $65
	ld   h, (hl)                                     ; $57f3: $66
	ld   (hl), l                                     ; $57f4: $75
	ld   l, h                                        ; $57f5: $6c
	ld   hl, $4701                                   ; $57f6: $21 $01 $47
	ld   h, c                                        ; $57f9: $61
	ld   l, (hl)                                     ; $57fa: $6e
	ld   h, a                                        ; $57fb: $67

jr_005_57fc:
	ld   (hl), e                                     ; $57fc: $73
	jr   nz, jr_005_5860                             ; $57fd: $20 $61

	ld   (hl), d                                     ; $57ff: $72
	ld   h, l                                        ; $5800: $65
	ld   bc, $6966                                   ; $5801: $01 $66 $69
	ld   h, a                                        ; $5804: $67
	ld   l, b                                        ; $5805: $68

jr_005_5806:
	ld   (hl), h                                     ; $5806: $74

jr_005_5807:
	ld   l, c                                        ; $5807: $69
	ld   l, (hl)                                     ; $5808: $6e
	ld   h, a                                        ; $5809: $67
	jr   nz, $69                                     ; $580a: $20 $69

	ld   l, (hl)                                     ; $580c: $6e
	ld   bc, $6874                                   ; $580d: $01 $74 $68
	ld   h, l                                        ; $5810: $65
	jr   nz, $6a                                     ; $5811: $20 $6a

	ld   (hl), l                                     ; $5813: $75
	ld   l, (hl)                                     ; $5814: $6e
	ld   l, e                                        ; $5815: $6b
	ld   a, c                                        ; $5816: $79

jr_005_5817:
	ld   h, c                                        ; $5817: $61
	ld   (hl), d                                     ; $5818: $72
	ld   h, h                                        ; $5819: $64
	ld   l, $ff                                      ; $581a: $2e $ff
	cp   $7f                                         ; $581c: $fe $7f
	jp   $3255                                       ; $581e: $c3 $55 $32


jr_005_5821:
	ld   e, b                                        ; $5821: $58
	jp   $3e80                                       ; $5822: $c3 $80 $3e


	ld   e, b                                        ; $5825: $58
	add  a                                           ; $5826: $87
	ld   c, d                                        ; $5827: $4a
	ld   e, b                                        ; $5828: $58
	add  l                                           ; $5829: $85
	or   $4f                                         ; $582a: $f6 $4f
	add  l                                           ; $582c: $85

jr_005_582d:
	.db  $ed                                         ; $582d: $ed
	ld   c, a                                        ; $582e: $4f
	add  c                                           ; $582f: $81
	ld   h, $58                                      ; $5830: $26 $58

jr_005_5832:
	add  a                                           ; $5832: $87
	ld   l, d                                        ; $5833: $6a
	ld   e, b                                        ; $5834: $58
	add  l                                           ; $5835: $85
	or   $4f                                         ; $5836: $f6 $4f
	add  l                                           ; $5838: $85
	.db  $ed                                         ; $5839: $ed
	ld   c, a                                        ; $583a: $4f
	add  c                                           ; $583b: $81
	ldd  (hl), a                                     ; $583c: $32
	ld   e, b                                        ; $583d: $58

jr_005_583e:
	add  a                                           ; $583e: $87
	add  e                                           ; $583f: $83
	ld   e, b                                        ; $5840: $58
	add  l                                           ; $5841: $85
	or   $4f                                         ; $5842: $f6 $4f
	add  l                                           ; $5844: $85
	.db  $ed                                         ; $5845: $ed
	ld   c, a                                        ; $5846: $4f
	add  c                                           ; $5847: $81

jr_005_5848:
	ld   a, $58                                      ; $5848: $3e $58
	dec  b                                           ; $584a: $05
	ld   bc, $6148                                   ; $584b: $01 $48 $61
	.db  $76                                         ; $584e: $76
	ld   h, l                                        ; $584f: $65
	jr   nz, jr_005_58cb                             ; $5850: $20 $79

	ld   l, a                                        ; $5852: $6f

jr_005_5853:
	ld   (hl), l                                     ; $5853: $75
	jr   nz, jr_005_58c9                             ; $5854: $20 $73

	ld   h, l                                        ; $5856: $65
	ld   h, l                                        ; $5857: $65
	ld   l, (hl)                                     ; $5858: $6e
	ld   bc, $796d                                   ; $5859: $01 $6d $79
	jr   nz, jr_005_58d1                             ; $585c: $20 $73

	ld   (hl), l                                     ; $585e: $75
	ld   (hl), d                                     ; $585f: $72

jr_005_5860:
	ld   h, (hl)                                     ; $5860: $66
	ld   h, d                                        ; $5861: $62
	ld   l, a                                        ; $5862: $6f
	ld   h, c                                        ; $5863: $61
	ld   (hl), d                                     ; $5864: $72
	ld   h, h                                        ; $5865: $64
	ccf                                              ; $5866: $3f
	rst  $38                                         ; $5867: $ff
	cp   $7f                                         ; $5868: $fe $7f
	dec  b                                           ; $586a: $05
	inc  bc                                          ; $586b: $03
	ld   c, b                                        ; $586c: $48
	ld   h, l                                        ; $586d: $65
	ld   a, c                                        ; $586e: $79
	jr   nz, jr_005_58d5                             ; $586f: $20 $64

	ld   (hl), l                                     ; $5871: $75
	ld   h, h                                        ; $5872: $64
	ld   h, l                                        ; $5873: $65
	ld   hl, $5701                                   ; $5874: $21 $01 $57
	ld   l, b                                        ; $5877: $68
	ld   h, c                                        ; $5878: $61
	ld   (hl), h                                     ; $5879: $74
	daa                                              ; $587a: $27
	ld   (hl), e                                     ; $587b: $73
	jr   nz, jr_005_58f3                             ; $587c: $20 $75

	ld   (hl), b                                     ; $587e: $70
	ccf                                              ; $587f: $3f
	rst  $38                                         ; $5880: $ff
	cp   $7f                                         ; $5881: $fe $7f
	dec  b                                           ; $5883: $05
	ld   bc, $7645                                   ; $5884: $01 $45 $76
	ld   h, l                                        ; $5887: $65
	ld   (hl), d                                     ; $5888: $72
	ld   a, c                                        ; $5889: $79
	ld   h, d                                        ; $588a: $62
	ld   l, a                                        ; $588b: $6f
	ld   h, h                                        ; $588c: $64
	ld   a, c                                        ; $588d: $79
	ld   bc, $6577                                   ; $588e: $01 $77 $65
	ld   l, (hl)                                     ; $5891: $6e
	ld   (hl), h                                     ; $5892: $74
	jr   nz, jr_005_5908                             ; $5893: $20 $73

	ld   (hl), l                                     ; $5895: $75
	ld   (hl), d                                     ; $5896: $72
	ld   h, (hl)                                     ; $5897: $66
	ld   l, c                                        ; $5898: $69
	ld   l, (hl)                                     ; $5899: $6e
	ld   l, $2e                                      ; $589a: $2e $2e
	ld   l, $ff                                      ; $589c: $2e $ff
	cp   $7f                                         ; $589e: $fe $7f
	add  l                                           ; $58a0: $85
	call nz, $8558                                   ; $58a1: $c4 $58 $85
	call z, $0958                                    ; $58a4: $cc $58 $09
	ld   b, d                                        ; $58a7: $42
	ld   ($7946), sp                                 ; $58a8: $08 $46 $79
	ld   d, $85                                      ; $58ab: $16 $85
	ret  nc                                          ; $58ad: $d0

	ld   e, b                                        ; $58ae: $58
	add  c                                           ; $58af: $81
	and  e                                           ; $58b0: $a3
	ld   e, b                                        ; $58b1: $58
	add  l                                           ; $58b2: $85
	call nz, $8558                                   ; $58b3: $c4 $58 $85
	call z, $0958                                    ; $58b6: $cc $58 $09
	ld   b, d                                        ; $58b9: $42
	ld   ($7b46), sp                                 ; $58ba: $08 $46 $7b
	ld   d, $85                                      ; $58bd: $16 $85
	ret  nc                                          ; $58bf: $d0

	ld   e, b                                        ; $58c0: $58
	add  c                                           ; $58c1: $81
	or   l                                           ; $58c2: $b5
	ld   e, b                                        ; $58c3: $58
	add  hl, bc                                      ; $58c4: $09
	ld   b, h                                        ; $58c5: $44
	ld   bc, $4716                                   ; $58c6: $01 $16 $47

jr_005_58c9:
	inc  bc                                          ; $58c9: $03
	inc  c                                           ; $58ca: $0c

jr_005_58cb:
	inc  h                                           ; $58cb: $24
	adc  l                                           ; $58cc: $8d
	ld   b, $0c                                      ; $58cd: $06 $0c
	inc  h                                           ; $58cf: $24
	adc  l                                           ; $58d0: $8d

jr_005_58d1:
	ld   a, (bc)                                     ; $58d1: $0a
	inc  d                                           ; $58d2: $14
	inc  h                                           ; $58d3: $24
	adc  c                                           ; $58d4: $89

jr_005_58d5:
	ld   h, c                                        ; $58d5: $61
	ld   d, $01                                      ; $58d6: $16 $01
	add  hl, bc                                      ; $58d8: $09
	inc  c                                           ; $58d9: $0c
	ld   b, c                                        ; $58da: $41
	ld   ($0344), sp                                 ; $58db: $08 $44 $03
	ld   b, b                                        ; $58de: $40
	.db  $10                                         ; $58df: $10
	ld   (bc), a                                     ; $58e0: $02
	ld   b, b                                        ; $58e1: $40
	rst  $38                                         ; $58e2: $ff
	ld   b, e                                        ; $58e3: $43
	ld   a, h                                        ; $58e4: $7c
	inc  d                                           ; $58e5: $14
	ld   b, a                                        ; $58e6: $47
	ld   (bc), a                                     ; $58e7: $02
	daa                                              ; $58e8: $27
	add  hl, bc                                      ; $58e9: $09
	inc  c                                           ; $58ea: $0c
	ld   d, $00                                      ; $58eb: $16 $00
	add  hl, bc                                      ; $58ed: $09
	ld   b, a                                        ; $58ee: $47
	inc  b                                           ; $58ef: $04
	rra                                              ; $58f0: $1f
	daa                                              ; $58f1: $27
	inc  c                                           ; $58f2: $0c

jr_005_58f3:
	add  (hl)                                        ; $58f3: $86
	ld   hl, sp+$58                                  ; $58f4: $f8 $58
	jr   jr_005_58f8                                 ; $58f6: $18 $00

jr_005_58f8:
	dec  de                                          ; $58f8: $1b
	nop                                              ; $58f9: $00
	nop                                              ; $58fa: $00
	dec  l                                           ; $58fb: $2d
	ld   e, c                                        ; $58fc: $59
	dec  de                                          ; $58fd: $1b
	ld   bc, $4400                                   ; $58fe: $01 $00 $44
	ld   e, c                                        ; $5901: $59
	dec  de                                          ; $5902: $1b
	ld   (bc), a                                     ; $5903: $02
	nop                                              ; $5904: $00
	ld   e, e                                        ; $5905: $5b
	ld   e, c                                        ; $5906: $59
	dec  de                                          ; $5907: $1b

jr_005_5908:
	ld   bc, $6b01                                   ; $5908: $01 $01 $6b
	ld   e, c                                        ; $590b: $59

Jump_005_590c:
	dec  de                                          ; $590c: $1b
	ld   (bc), a                                     ; $590d: $02
	ld   bc, $597f                                   ; $590e: $01 $7f $59
	dec  de                                          ; $5911: $1b
	nop                                              ; $5912: $00
	ld   (bc), a                                     ; $5913: $02
	xor  (hl)                                        ; $5914: $ae
	ld   e, c                                        ; $5915: $59
	dec  de                                          ; $5916: $1b
	ld   (bc), a                                     ; $5917: $02
	ld   (bc), a                                     ; $5918: $02
	cp   (hl)                                        ; $5919: $be
	ld   e, c                                        ; $591a: $59
	ld   e, $00                                      ; $591b: $1e $00
	nop                                              ; $591d: $00
	ldh  a, (<$59)                                   ; $591e: $f0 $59
	ld   e, $01                                      ; $5920: $1e $01
	nop                                              ; $5922: $00
	rlca                                             ; $5923: $07
	ld   e, d                                        ; $5924: $5a
	.db  $10                                         ; $5925: $10
	rst  $38                                         ; $5926: $ff
	rst  $38                                         ; $5927: $ff
	rla                                              ; $5928: $17
	ld   e, d                                        ; $5929: $5a
	rst  $38                                         ; $592a: $ff
	rst  $38                                         ; $592b: $ff
	rst  $38                                         ; $592c: $ff
	push bc                                          ; $592d: $c5
	ld   bc, $5a1c                                   ; $592e: $01 $1c $5a
	ld   d, h                                        ; $5931: $54
	rst  $38                                         ; $5932: $ff
	add  e                                           ; $5933: $83
	add  hl, sp                                      ; $5934: $39
	ld   e, d                                        ; $5935: $5a
	add  e                                           ; $5936: $83
	ei                                               ; $5937: $fb
	ld   e, l                                        ; $5938: $5d
	pop  bc                                          ; $5939: $c1
	ld   a, (hl)                                     ; $593a: $7e
	ld   a, d                                        ; $593b: $7a
	ld   h, h                                        ; $593c: $64
	pop  bc                                          ; $593d: $c1
	inc  sp                                          ; $593e: $33
	ld   (hl), b                                     ; $593f: $70
	ld   d, h                                        ; $5940: $54
	add  c                                           ; $5941: $81
	ld   bc, wGameScreenTiles                                   ; $5942: $01 $50 $c8
	ld   (de), a                                     ; $5945: $12
	inc  e                                           ; $5946: $1c
	ld   e, d                                        ; $5947: $5a
	ld   d, h                                        ; $5948: $54
	rst  $38                                         ; $5949: $ff
	add  e                                           ; $594a: $83
	and  l                                           ; $594b: $a5
	ld   e, d                                        ; $594c: $5a
	add  e                                           ; $594d: $83
	ei                                               ; $594e: $fb
	ld   e, l                                        ; $594f: $5d
	pop  bc                                          ; $5950: $c1
	ldd  (hl), a                                     ; $5951: $32
	ld   a, d                                        ; $5952: $7a
	ld   h, h                                        ; $5953: $64
	pop  bc                                          ; $5954: $c1
	inc  sp                                          ; $5955: $33
	ld   (hl), b                                     ; $5956: $70
	ld   d, h                                        ; $5957: $54
	add  c                                           ; $5958: $81
	ld   bc, $c450                                   ; $5959: $01 $50 $c4
	jr   nz, jr_005_597a                             ; $595c: $20 $1c

	ld   e, d                                        ; $595e: $5a
	ld   d, h                                        ; $595f: $54
	rst  $38                                         ; $5960: $ff
	add  e                                           ; $5961: $83
	ld   (bc), a                                     ; $5962: $02
	ld   e, e                                        ; $5963: $5b
	pop  bc                                          ; $5964: $c1
	add  hl, sp                                      ; $5965: $39
	ld   a, d                                        ; $5966: $7a
	ld   h, h                                        ; $5967: $64
	add  c                                           ; $5968: $81
	ld   bc, wGameScreenTiles                                   ; $5969: $01 $50 $c8
	inc  h                                           ; $596c: $24
	inc  e                                           ; $596d: $1c
	ld   e, d                                        ; $596e: $5a
	ld   d, h                                        ; $596f: $54
	rst  $38                                         ; $5970: $ff
	add  e                                           ; $5971: $83
	ld   e, a                                        ; $5972: $5f
	ld   e, e                                        ; $5973: $5b
	pop  bc                                          ; $5974: $c1
	add  b                                           ; $5975: $80
	ld   d, d                                        ; $5976: $52
	ld   d, b                                        ; $5977: $50
	pop  bc                                          ; $5978: $c1
	add  c                                           ; $5979: $81

jr_005_597a:
	and  d                                           ; $597a: $a2
	ld   d, b                                        ; $597b: $50
	add  c                                           ; $597c: $81
	ld   bc, wGameScreenTiles                                   ; $597d: $01 $50 $c8
	inc  b                                           ; $5980: $04
	sbc  (hl)                                        ; $5981: $9e
	ld   e, c                                        ; $5982: $59
	ld   d, h                                        ; $5983: $54
	rst  $38                                         ; $5984: $ff
	add  e                                           ; $5985: $83
	or   a                                           ; $5986: $b7
	ld   e, e                                        ; $5987: $5b
	add  e                                           ; $5988: $83
	ei                                               ; $5989: $fb
	ld   e, l                                        ; $598a: $5d
	pop  bc                                          ; $598b: $c1
	cpl                                              ; $598c: $2f
	ld   d, d                                        ; $598d: $52
	ld   h, h                                        ; $598e: $64
	pop  bc                                          ; $598f: $c1
	inc  sp                                          ; $5990: $33
	ld   c, b                                        ; $5991: $48
	ld   d, h                                        ; $5992: $54
	pop  bc                                          ; $5993: $c1
	ldd  a, (hl)                                     ; $5994: $3a
	and  d                                           ; $5995: $a2
	ld   h, h                                        ; $5996: $64
	pop  bc                                          ; $5997: $c1
	inc  sp                                          ; $5998: $33
	sbc  b                                           ; $5999: $98
	ld   d, h                                        ; $599a: $54
	add  c                                           ; $599b: $81
	ld   bc, $5450                                   ; $599c: $01 $50 $54
	rst  $38                                         ; $599f: $ff
	add  e                                           ; $59a0: $83
	rlca                                             ; $59a1: $07
	ld   e, h                                        ; $59a2: $5c
	pop  bc                                          ; $59a3: $c1
	ldd  a, (hl)                                     ; $59a4: $3a
	ld   a, d                                        ; $59a5: $7a
	ld   h, h                                        ; $59a6: $64
	pop  bc                                          ; $59a7: $c1
	inc  sp                                          ; $59a8: $33
	ld   (hl), b                                     ; $59a9: $70
	ld   d, h                                        ; $59aa: $54
	add  c                                           ; $59ab: $81
	ld   bc, wGameScreenTiles                                   ; $59ac: $01 $50 $c8
	daa                                              ; $59af: $27
	inc  e                                           ; $59b0: $1c
	ld   e, d                                        ; $59b1: $5a
	ld   d, h                                        ; $59b2: $54
	rst  $38                                         ; $59b3: $ff
	add  e                                           ; $59b4: $83
	ld   d, a                                        ; $59b5: $57
	ld   e, h                                        ; $59b6: $5c
	pop  bc                                          ; $59b7: $c1
	sbc  d                                           ; $59b8: $9a
	ld   a, d                                        ; $59b9: $7a
	ld   h, h                                        ; $59ba: $64
	add  c                                           ; $59bb: $81
	ld   bc, wGameScreenTiles                                   ; $59bc: $01 $50 $c8
	ld   b, $dd                                      ; $59bf: $06 $dd
	ld   e, c                                        ; $59c1: $59
	ld   d, h                                        ; $59c2: $54
	rst  $38                                         ; $59c3: $ff
	add  e                                           ; $59c4: $83
	adc  a                                           ; $59c5: $8f
	ld   e, h                                        ; $59c6: $5c
	add  e                                           ; $59c7: $83
	ei                                               ; $59c8: $fb
	ld   e, l                                        ; $59c9: $5d
	pop  bc                                          ; $59ca: $c1
	cpl                                              ; $59cb: $2f
	ld   d, d                                        ; $59cc: $52
	ld   h, h                                        ; $59cd: $64
	pop  bc                                          ; $59ce: $c1
	inc  sp                                          ; $59cf: $33
	ld   c, b                                        ; $59d0: $48
	ld   d, h                                        ; $59d1: $54
	pop  bc                                          ; $59d2: $c1
	dec  sp                                          ; $59d3: $3b
	and  d                                           ; $59d4: $a2
	ld   h, h                                        ; $59d5: $64
	pop  bc                                          ; $59d6: $c1
	inc  sp                                          ; $59d7: $33
	sbc  b                                           ; $59d8: $98
	ld   d, h                                        ; $59d9: $54
	add  c                                           ; $59da: $81
	ld   bc, $5450                                   ; $59db: $01 $50 $54
	rst  $38                                         ; $59de: $ff
	add  e                                           ; $59df: $83
	pop  de                                          ; $59e0: $d1
	ld   e, h                                        ; $59e1: $5c
	add  e                                           ; $59e2: $83
	ei                                               ; $59e3: $fb
	ld   e, l                                        ; $59e4: $5d
	pop  bc                                          ; $59e5: $c1
	dec  sp                                          ; $59e6: $3b
	ld   a, d                                        ; $59e7: $7a
	ld   h, h                                        ; $59e8: $64
	pop  bc                                          ; $59e9: $c1
	inc  sp                                          ; $59ea: $33
	ld   (hl), b                                     ; $59eb: $70
	ld   d, h                                        ; $59ec: $54
	add  c                                           ; $59ed: $81
	ld   bc, wGameScreenTiles                                   ; $59ee: $01 $50 $c8
	ld   a, (bc)                                     ; $59f1: $0a
	inc  e                                           ; $59f2: $1c
	ld   e, d                                        ; $59f3: $5a
	ld   d, h                                        ; $59f4: $54
	rst  $38                                         ; $59f5: $ff
	add  e                                           ; $59f6: $83
	ldd  a, (hl)                                     ; $59f7: $3a
	ld   e, l                                        ; $59f8: $5d
	add  e                                           ; $59f9: $83
	ei                                               ; $59fa: $fb
	ld   e, l                                        ; $59fb: $5d
	pop  bc                                          ; $59fc: $c1
	jr   nc, jr_005_5a79                             ; $59fd: $30 $7a

	ld   h, h                                        ; $59ff: $64
	pop  bc                                          ; $5a00: $c1
	inc  sp                                          ; $5a01: $33
	ld   (hl), b                                     ; $5a02: $70
	ld   d, h                                        ; $5a03: $54
	add  c                                           ; $5a04: $81
	ld   bc, $c450                                   ; $5a05: $01 $50 $c4
	inc  b                                           ; $5a08: $04
	inc  e                                           ; $5a09: $1c
	ld   e, d                                        ; $5a0a: $5a
	ld   d, h                                        ; $5a0b: $54
	rst  $38                                         ; $5a0c: $ff
	add  e                                           ; $5a0d: $83
	sub  d                                           ; $5a0e: $92
	ld   e, l                                        ; $5a0f: $5d
	pop  bc                                          ; $5a10: $c1
	ld   (hl), $7a                                   ; $5a11: $36 $7a
	ld   h, h                                        ; $5a13: $64
	add  c                                           ; $5a14: $81
	ld   bc, $4250                                   ; $5a15: $01 $50 $42
	ld   bc, $1781                                   ; $5a18: $01 $81 $17
	ld   e, d                                        ; $5a1b: $5a
	add  e                                           ; $5a1c: $83
	ldi  (hl), a                                     ; $5a1d: $22
	ld   e, d                                        ; $5a1e: $5a
	add  c                                           ; $5a1f: $81
	ld   bc, $0450                                   ; $5a20: $01 $50 $04
	inc  bc                                          ; $5a23: $03
	ld   d, h                                        ; $5a24: $54
	ld   l, b                                        ; $5a25: $68
	ld   l, c                                        ; $5a26: $69
	ld   (hl), e                                     ; $5a27: $73
	jr   nz, $72                                     ; $5a28: $20 $72

	ld   l, a                                        ; $5a2a: $6f
	ld   l, a                                        ; $5a2b: $6f
	ld   l, l                                        ; $5a2c: $6d
	jr   nz, jr_005_5a98                             ; $5a2d: $20 $69

	ld   (hl), e                                     ; $5a2f: $73
	jr   nz, $65                                     ; $5a30: $20 $65

	ld   l, l                                        ; $5a32: $6d
	ld   (hl), b                                     ; $5a33: $70
	ld   (hl), h                                     ; $5a34: $74
	ld   a, c                                        ; $5a35: $79
	ld   l, $ff                                      ; $5a36: $2e $ff
	ld   a, a                                        ; $5a38: $7f
	inc  b                                           ; $5a39: $04
	inc  bc                                          ; $5a3a: $03
	ld   d, l                                        ; $5a3b: $55
	ld   (hl), e                                     ; $5a3c: $73
	ld   h, l                                        ; $5a3d: $65
	jr   nz, jr_005_5ab4                             ; $5a3e: $20 $74

	ld   l, b                                        ; $5a40: $68
	ld   l, c                                        ; $5a41: $69
	ld   (hl), e                                     ; $5a42: $73
	jr   nz, jr_005_5ab9                             ; $5a43: $20 $74

	ld   l, a                                        ; $5a45: $6f
	ld   (hl), d                                     ; $5a46: $72
	ld   h, e                                        ; $5a47: $63
	ld   l, b                                        ; $5a48: $68
	jr   nz, jr_005_5abf                             ; $5a49: $20 $74

	ld   l, a                                        ; $5a4b: $6f
	ld   bc, $6568                                   ; $5a4c: $01 $68 $65
	ld   l, h                                        ; $5a4f: $6c
	ld   (hl), b                                     ; $5a50: $70
	jr   nz, jr_005_5abc                             ; $5a51: $20 $69

	ld   l, h                                        ; $5a53: $6c
	ld   l, h                                        ; $5a54: $6c
	ld   (hl), l                                     ; $5a55: $75
	ld   l, l                                        ; $5a56: $6d
	ld   l, c                                        ; $5a57: $69
	ld   l, (hl)                                     ; $5a58: $6e
	ld   h, c                                        ; $5a59: $61
	ld   (hl), h                                     ; $5a5a: $74
	ld   h, l                                        ; $5a5b: $65
	ld   bc, $6f79                                   ; $5a5c: $01 $79 $6f
	ld   (hl), l                                     ; $5a5f: $75
	ld   (hl), d                                     ; $5a60: $72
	jr   nz, jr_005_5ad3                             ; $5a61: $20 $70

	ld   h, c                                        ; $5a63: $61
	ld   (hl), h                                     ; $5a64: $74
	ld   l, b                                        ; $5a65: $68
	ld   l, $20                                      ; $5a66: $2e $20
	ld   c, h                                        ; $5a68: $4c
	ld   l, c                                        ; $5a69: $69
	ld   h, a                                        ; $5a6a: $67
	ld   l, b                                        ; $5a6b: $68
	ld   (hl), h                                     ; $5a6c: $74
	ld   bc, $6874                                   ; $5a6d: $01 $74 $68
	ld   h, l                                        ; $5a70: $65
	jr   nz, $74                                     ; $5a71: $20 $74

	ld   l, a                                        ; $5a73: $6f
	ld   (hl), d                                     ; $5a74: $72
	ld   h, e                                        ; $5a75: $63
	ld   l, b                                        ; $5a76: $68
	jr   nz, $62                                     ; $5a77: $20 $62

jr_005_5a79:
	ld   a, c                                        ; $5a79: $79
	ld   bc, $6573                                   ; $5a7a: $01 $73 $65
	ld   l, h                                        ; $5a7d: $6c
	ld   h, l                                        ; $5a7e: $65
	ld   h, e                                        ; $5a7f: $63
	ld   (hl), h                                     ; $5a80: $74
	ld   l, c                                        ; $5a81: $69
	ld   l, (hl)                                     ; $5a82: $6e
	ld   h, a                                        ; $5a83: $67
	jr   nz, jr_005_5aef                             ; $5a84: $20 $69

	ld   (hl), h                                     ; $5a86: $74
	jr   nz, jr_005_5aef                             ; $5a87: $20 $66

	ld   (hl), d                                     ; $5a89: $72
	ld   l, a                                        ; $5a8a: $6f
	ld   l, l                                        ; $5a8b: $6d
	ld   bc, $6f79                                   ; $5a8c: $01 $79 $6f
	ld   (hl), l                                     ; $5a8f: $75
	ld   (hl), d                                     ; $5a90: $72
	jr   nz, jr_005_5afc                             ; $5a91: $20 $69

	ld   (hl), h                                     ; $5a93: $74
	ld   h, l                                        ; $5a94: $65
	ld   l, l                                        ; $5a95: $6d
	jr   nz, jr_005_5b04                             ; $5a96: $20 $6c

jr_005_5a98:
	ld   l, c                                        ; $5a98: $69
	ld   (hl), e                                     ; $5a99: $73
	ld   (hl), h                                     ; $5a9a: $74
	ld   l, $ff                                      ; $5a9b: $2e $ff
	dec  bc                                          ; $5a9d: $0b
	.db  $10                                         ; $5a9e: $10
	ld   a, e                                        ; $5a9f: $7b
	ld   sp, $3035                                   ; $5aa0: $31 $35 $30
	rst  $38                                         ; $5aa3: $ff
	ld   a, a                                        ; $5aa4: $7f
	inc  b                                           ; $5aa5: $04
	inc  bc                                          ; $5aa6: $03
	ld   d, h                                        ; $5aa7: $54
	ld   l, b                                        ; $5aa8: $68
	ld   h, l                                        ; $5aa9: $65
	jr   nz, jr_005_5b12                             ; $5aaa: $20 $66

	ld   h, c                                        ; $5aac: $61
	ld   (hl), e                                     ; $5aad: $73
	ld   (hl), h                                     ; $5aae: $74
	ld   h, l                                        ; $5aaf: $65
	ld   (hl), e                                     ; $5ab0: $73
	ld   (hl), h                                     ; $5ab1: $74
	jr   nz, jr_005_5b15                             ; $5ab2: $20 $61

jr_005_5ab4:
	ld   l, (hl)                                     ; $5ab4: $6e
	ld   h, h                                        ; $5ab5: $64
	ld   bc, $6166                                   ; $5ab6: $01 $66 $61

jr_005_5ab9:
	ld   (hl), d                                     ; $5ab9: $72
	ld   (hl), h                                     ; $5aba: $74
	ld   l, b                                        ; $5abb: $68

jr_005_5abc:
	ld   h, l                                        ; $5abc: $65
	ld   (hl), e                                     ; $5abd: $73
	ld   (hl), h                                     ; $5abe: $74

jr_005_5abf:
	jr   nz, jr_005_5b27                             ; $5abf: $20 $66

	ld   l, h                                        ; $5ac1: $6c
	ld   a, c                                        ; $5ac2: $79
	ld   l, c                                        ; $5ac3: $69
	ld   l, (hl)                                     ; $5ac4: $6e
	ld   h, a                                        ; $5ac5: $67
	ld   bc, $7266                                   ; $5ac6: $01 $66 $72
	ld   (hl), l                                     ; $5ac9: $75
	ld   l, c                                        ; $5aca: $69
	ld   (hl), h                                     ; $5acb: $74
	jr   nz, jr_005_5b37                             ; $5acc: $20 $69

	ld   (hl), e                                     ; $5ace: $73
	jr   nz, jr_005_5b45                             ; $5acf: $20 $74

	ld   l, b                                        ; $5ad1: $68
	ld   h, l                                        ; $5ad2: $65

jr_005_5ad3:
	ld   bc, $6162                                   ; $5ad3: $01 $62 $61
	ld   l, (hl)                                     ; $5ad6: $6e
	ld   h, c                                        ; $5ad7: $61
	ld   l, (hl)                                     ; $5ad8: $6e
	ld   h, c                                        ; $5ad9: $61
	ld   l, $20                                      ; $5ada: $2e $20
	ld   c, c                                        ; $5adc: $49
	ld   (hl), h                                     ; $5add: $74
	jr   nz, jr_005_5b54                             ; $5ade: $20 $74

	ld   (hl), d                                     ; $5ae0: $72
	ld   h, c                                        ; $5ae1: $61
	.db  $76                                         ; $5ae2: $76
	ld   h, l                                        ; $5ae3: $65
	ld   l, h                                        ; $5ae4: $6c
	ld   (hl), e                                     ; $5ae5: $73
	ld   bc, $6e69                                   ; $5ae6: $01 $69 $6e
	jr   nz, $61                                     ; $5ae9: $20 $61

	jr   nz, jr_005_5b60                             ; $5aeb: $20 $73

	ld   (hl), h                                     ; $5aed: $74
	ld   (hl), d                                     ; $5aee: $72

jr_005_5aef:
	ld   h, c                                        ; $5aef: $61
	ld   l, c                                        ; $5af0: $69
	ld   h, a                                        ; $5af1: $67
	ld   l, b                                        ; $5af2: $68
	ld   (hl), h                                     ; $5af3: $74
	jr   nz, jr_005_5b66                             ; $5af4: $20 $70

	ld   h, c                                        ; $5af6: $61
	ld   (hl), h                                     ; $5af7: $74
	ld   l, b                                        ; $5af8: $68
	ld   l, $ff                                      ; $5af9: $2e $ff
	dec  bc                                          ; $5afb: $0b

jr_005_5afc:
	.db  $10                                         ; $5afc: $10
	ld   a, e                                        ; $5afd: $7b
	add  hl, sp                                      ; $5afe: $39
	jr   nc, -$01                                     ; $5aff: $30 $ff

Call_005_5b01:
	ld   a, a                                        ; $5b01: $7f
	inc  b                                           ; $5b02: $04
	inc  bc                                          ; $5b03: $03

jr_005_5b04:
	ld   d, h                                        ; $5b04: $54
	ld   l, b                                        ; $5b05: $68
	ld   l, c                                        ; $5b06: $69
	ld   (hl), e                                     ; $5b07: $73
	jr   nz, $69                                     ; $5b08: $20 $69

	ld   (hl), e                                     ; $5b0a: $73
	jr   nz, jr_005_5b81                             ; $5b0b: $20 $74

	ld   l, b                                        ; $5b0d: $68
	ld   h, l                                        ; $5b0e: $65
	jr   nz, jr_005_5b64                             ; $5b0f: $20 $53

	ld   (hl), a                                     ; $5b11: $77

jr_005_5b12:
	ld   l, a                                        ; $5b12: $6f
	ld   (hl), d                                     ; $5b13: $72
	ld   h, h                                        ; $5b14: $64

jr_005_5b15:
	ld   bc, $666f                                   ; $5b15: $01 $6f $66
	jr   nz, jr_005_5b8e                             ; $5b18: $20 $74

	ld   l, b                                        ; $5b1a: $68
	ld   h, l                                        ; $5b1b: $65
	jr   nz, jr_005_5b71                             ; $5b1c: $20 $53

	ld   (hl), b                                     ; $5b1e: $70
	ld   l, c                                        ; $5b1f: $69
	ld   (hl), d                                     ; $5b20: $72
	ld   l, c                                        ; $5b21: $69
	ld   (hl), h                                     ; $5b22: $74
	ld   l, $20                                      ; $5b23: $2e $20
	ld   c, c                                        ; $5b25: $49
	ld   (hl), h                                     ; $5b26: $74

jr_005_5b27:
	ld   bc, $6977                                   ; $5b27: $01 $77 $69
	ld   l, h                                        ; $5b2a: $6c
	ld   l, h                                        ; $5b2b: $6c
	jr   nz, jr_005_5b96                             ; $5b2c: $20 $68

	ld   h, l                                        ; $5b2e: $65
	ld   l, h                                        ; $5b2f: $6c
	ld   (hl), b                                     ; $5b30: $70
	jr   nz, jr_005_5bac                             ; $5b31: $20 $79

	ld   l, a                                        ; $5b33: $6f
	ld   (hl), l                                     ; $5b34: $75
	jr   nz, jr_005_5bab                             ; $5b35: $20 $74

jr_005_5b37:
	ld   l, a                                        ; $5b37: $6f
	ld   bc, $6564                                   ; $5b38: $01 $64 $65
	ld   h, (hl)                                     ; $5b3b: $66
	ld   h, l                                        ; $5b3c: $65
	ld   h, c                                        ; $5b3d: $61
	ld   (hl), h                                     ; $5b3e: $74
	jr   nz, $74                                     ; $5b3f: $20 $74

	ld   l, b                                        ; $5b41: $68
	ld   h, l                                        ; $5b42: $65
	jr   nz, jr_005_5ba9                             ; $5b43: $20 $64

jr_005_5b45:
	ld   h, l                                        ; $5b45: $65
	ld   l, l                                        ; $5b46: $6d
	ld   l, a                                        ; $5b47: $6f
	ld   l, (hl)                                     ; $5b48: $6e
	ld   (hl), e                                     ; $5b49: $73
	ld   bc, $6e69                                   ; $5b4a: $01 $69 $6e
	jr   nz, jr_005_5bc3                             ; $5b4d: $20 $74

	ld   l, b                                        ; $5b4f: $68
	ld   h, l                                        ; $5b50: $65
	jr   nz, jr_005_5bc6                             ; $5b51: $20 $73

	ld   (hl), h                                     ; $5b53: $74

jr_005_5b54:
	ld   (hl), d                                     ; $5b54: $72
	ld   l, a                                        ; $5b55: $6f
	ld   l, (hl)                                     ; $5b56: $6e
	ld   h, a                                        ; $5b57: $67
	ld   l, b                                        ; $5b58: $68
	ld   l, a                                        ; $5b59: $6f
	ld   l, h                                        ; $5b5a: $6c
	ld   h, h                                        ; $5b5b: $64
	ld   l, $ff                                      ; $5b5c: $2e $ff
	ld   a, a                                        ; $5b5e: $7f
	inc  b                                           ; $5b5f: $04

jr_005_5b60:
	inc  bc                                          ; $5b60: $03
	ld   d, a                                        ; $5b61: $57
	ld   h, c                                        ; $5b62: $61
	ld   a, c                                        ; $5b63: $79

jr_005_5b64:
	jr   nz, jr_005_5bda                             ; $5b64: $20 $74

jr_005_5b66:
	ld   l, a                                        ; $5b66: $6f
	jr   nz, jr_005_5bd0                             ; $5b67: $20 $67

	ld   l, a                                        ; $5b69: $6f
	ld   hl, $5920                                   ; $5b6a: $21 $20 $59
	ld   l, a                                        ; $5b6d: $6f
	ld   (hl), l                                     ; $5b6e: $75
	daa                                              ; $5b6f: $27
	.db  $76                                         ; $5b70: $76

jr_005_5b71:
	ld   h, l                                        ; $5b71: $65
	ld   bc, $6f66                                   ; $5b72: $01 $66 $6f
	ld   (hl), l                                     ; $5b75: $75
	ld   l, (hl)                                     ; $5b76: $6e
	ld   h, h                                        ; $5b77: $64
	jr   nz, jr_005_5bdb                             ; $5b78: $20 $61

	jr   nz, jr_005_5be4                             ; $5b7a: $20 $68

	ld   l, c                                        ; $5b7c: $69
	ld   h, h                                        ; $5b7d: $64
	ld   h, h                                        ; $5b7e: $64
	ld   h, l                                        ; $5b7f: $65
	ld   l, (hl)                                     ; $5b80: $6e

jr_005_5b81:
	ld   bc, $7274                                   ; $5b81: $01 $74 $72
	ld   h, l                                        ; $5b84: $65
	ld   h, c                                        ; $5b85: $61
	ld   (hl), e                                     ; $5b86: $73
	ld   (hl), l                                     ; $5b87: $75
	ld   (hl), d                                     ; $5b88: $72
	ld   h, l                                        ; $5b89: $65
	jr   nz, $72                                     ; $5b8a: $20 $72

	ld   l, a                                        ; $5b8c: $6f
	ld   l, a                                        ; $5b8d: $6f

jr_005_5b8e:
	ld   l, l                                        ; $5b8e: $6d
	ld   hl, $5301                                   ; $5b8f: $21 $01 $53
	ld   (hl), h                                     ; $5b92: $74
	ld   l, a                                        ; $5b93: $6f
	ld   h, e                                        ; $5b94: $63
	ld   l, e                                        ; $5b95: $6b

jr_005_5b96:
	jr   nz, jr_005_5c0d                             ; $5b96: $20 $75

	ld   (hl), b                                     ; $5b98: $70
	jr   nz, jr_005_5c0a                             ; $5b99: $20 $6f

	ld   l, (hl)                                     ; $5b9b: $6e
	jr   nz, jr_005_5c14                             ; $5b9c: $20 $76

	ld   l, c                                        ; $5b9e: $69
	ld   h, c                                        ; $5b9f: $61
	ld   l, h                                        ; $5ba0: $6c
	ld   (hl), e                                     ; $5ba1: $73
	ld   bc, $6e61                                   ; $5ba2: $01 $61 $6e
	ld   h, h                                        ; $5ba5: $64
	jr   nz, jr_005_5c1b                             ; $5ba6: $20 $73

	ld   (hl), b                                     ; $5ba8: $70

jr_005_5ba9:
	ld   l, c                                        ; $5ba9: $69
	ld   (hl), d                                     ; $5baa: $72

jr_005_5bab:
	ld   l, c                                        ; $5bab: $69

jr_005_5bac:
	ld   (hl), h                                     ; $5bac: $74
	jr   nz, $70                                     ; $5bad: $20 $70

	ld   l, a                                        ; $5baf: $6f
	ld   l, c                                        ; $5bb0: $69
	ld   l, (hl)                                     ; $5bb1: $6e
	ld   (hl), h                                     ; $5bb2: $74
	ld   (hl), e                                     ; $5bb3: $73
	ld   hl, $7fff                                   ; $5bb4: $21 $ff $7f
	inc  b                                           ; $5bb7: $04
	inc  bc                                          ; $5bb8: $03
	ld   e, c                                        ; $5bb9: $59
	ld   l, a                                        ; $5bba: $6f
	ld   (hl), l                                     ; $5bbb: $75
	jr   nz, $61                                     ; $5bbc: $20 $61

	ld   (hl), d                                     ; $5bbe: $72
	ld   h, l                                        ; $5bbf: $65
	jr   nz, $64                                     ; $5bc0: $20 $64

	ld   l, a                                        ; $5bc2: $6f

jr_005_5bc3:
	ld   l, c                                        ; $5bc3: $69
	ld   l, (hl)                                     ; $5bc4: $6e
	ld   h, a                                        ; $5bc5: $67

jr_005_5bc6:
	jr   nz, $77                                     ; $5bc6: $20 $77

	ld   h, l                                        ; $5bc8: $65
	ld   l, h                                        ; $5bc9: $6c
	ld   l, h                                        ; $5bca: $6c
	ld   hl, $4c01                                   ; $5bcb: $21 $01 $4c
	ld   h, l                                        ; $5bce: $65
	ld   (hl), h                                     ; $5bcf: $74

jr_005_5bd0:
	jr   nz, $6d                                     ; $5bd0: $20 $6d

	ld   h, l                                        ; $5bd2: $65
	jr   nz, jr_005_5c3d                             ; $5bd3: $20 $68

	ld   h, l                                        ; $5bd5: $65
	ld   l, h                                        ; $5bd6: $6c
	ld   (hl), b                                     ; $5bd7: $70
	jr   nz, jr_005_5c53                             ; $5bd8: $20 $79

jr_005_5bda:
	ld   l, a                                        ; $5bda: $6f

jr_005_5bdb:
	ld   (hl), l                                     ; $5bdb: $75
	jr   nz, jr_005_5c40                             ; $5bdc: $20 $62

	ld   a, c                                        ; $5bde: $79
	ld   bc, $666f                                   ; $5bdf: $01 $6f $66
	ld   h, (hl)                                     ; $5be2: $66
	ld   h, l                                        ; $5be3: $65

jr_005_5be4:
	ld   (hl), d                                     ; $5be4: $72
	ld   l, c                                        ; $5be5: $69
	ld   l, (hl)                                     ; $5be6: $6e
	ld   h, a                                        ; $5be7: $67
	jr   nz, $74                                     ; $5be8: $20 $74

	ld   l, b                                        ; $5bea: $68
	ld   h, l                                        ; $5beb: $65
	ld   (hl), e                                     ; $5bec: $73
	ld   h, l                                        ; $5bed: $65
	ld   bc, $7469                                   ; $5bee: $01 $69 $74
	ld   h, l                                        ; $5bf1: $65
	ld   l, l                                        ; $5bf2: $6d
	ld   (hl), e                                     ; $5bf3: $73
	ld   l, $ff                                      ; $5bf4: $2e $ff
	dec  bc                                          ; $5bf6: $0b
	dec  bc                                          ; $5bf7: $0b
	ld   a, e                                        ; $5bf8: $7b
	ld   (hl), $30                                   ; $5bf9: $36 $30
	jr   nz, jr_005_5c1d                             ; $5bfb: $20 $20

	jr   nz, $20                                     ; $5bfd: $20 $20

	jr   nz, jr_005_5c21                             ; $5bff: $20 $20

	jr   nz, jr_005_5c7e                             ; $5c01: $20 $7b

	inc  sp                                          ; $5c03: $33
	jr   nc, -$01                                     ; $5c04: $30 $ff

	ld   a, a                                        ; $5c06: $7f
	inc  b                                           ; $5c07: $04
	inc  bc                                          ; $5c08: $03
	ld   c, (hl)                                     ; $5c09: $4e

jr_005_5c0a:
	ld   l, c                                        ; $5c0a: $69
	ld   h, e                                        ; $5c0b: $63
	ld   h, l                                        ; $5c0c: $65

jr_005_5c0d:
	jr   nz, jr_005_5c83                             ; $5c0d: $20 $74

	ld   l, a                                        ; $5c0f: $6f
	jr   nz, jr_005_5c85                             ; $5c10: $20 $73

	ld   h, l                                        ; $5c12: $65
	ld   h, l                                        ; $5c13: $65

jr_005_5c14:
	jr   nz, jr_005_5c8f                             ; $5c14: $20 $79

	ld   l, a                                        ; $5c16: $6f
	ld   (hl), l                                     ; $5c17: $75
	ld   bc, $6761                                   ; $5c18: $01 $61 $67

jr_005_5c1b:
	ld   h, c                                        ; $5c1b: $61
	ld   l, c                                        ; $5c1c: $69

jr_005_5c1d:
	ld   l, (hl)                                     ; $5c1d: $6e
	ld   hl, $4120                                   ; $5c1e: $21 $20 $41

jr_005_5c21:
	ld   l, h                                        ; $5c21: $6c
	ld   l, h                                        ; $5c22: $6c
	jr   nz, jr_005_5c6e                             ; $5c23: $20 $49

	jr   nz, jr_005_5c8f                             ; $5c25: $20 $68

	ld   h, c                                        ; $5c27: $61
	.db  $76                                         ; $5c28: $76
	ld   h, l                                        ; $5c29: $65
	ld   bc, $6f74                                   ; $5c2a: $01 $74 $6f
	jr   nz, jr_005_5c9e                             ; $5c2d: $20 $6f

	ld   h, (hl)                                     ; $5c2f: $66
	ld   h, (hl)                                     ; $5c30: $66
	ld   h, l                                        ; $5c31: $65
	ld   (hl), d                                     ; $5c32: $72
	jr   nz, jr_005_5ca9                             ; $5c33: $20 $74

	ld   l, b                                        ; $5c35: $68
	ld   l, c                                        ; $5c36: $69
	ld   (hl), e                                     ; $5c37: $73
	jr   nz, jr_005_5cae                             ; $5c38: $20 $74

	ld   l, c                                        ; $5c3a: $69
	ld   l, l                                        ; $5c3b: $6d
	ld   h, l                                        ; $5c3c: $65

jr_005_5c3d:
	ld   bc, $7261                                   ; $5c3d: $01 $61 $72

jr_005_5c40:
	ld   h, l                                        ; $5c40: $65
	jr   nz, $73                                     ; $5c41: $20 $73

	ld   l, a                                        ; $5c43: $6f
	ld   l, l                                        ; $5c44: $6d
	ld   h, l                                        ; $5c45: $65
	jr   nz, jr_005_5cbe                             ; $5c46: $20 $76

	ld   l, c                                        ; $5c48: $69
	ld   h, c                                        ; $5c49: $61
	ld   l, h                                        ; $5c4a: $6c
	ld   (hl), e                                     ; $5c4b: $73
	ld   l, $2e                                      ; $5c4c: $2e $2e
	ld   l, $ff                                      ; $5c4e: $2e $ff
	dec  bc                                          ; $5c50: $0b
	.db  $10                                         ; $5c51: $10
	ld   a, e                                        ; $5c52: $7b

jr_005_5c53:
	inc  sp                                          ; $5c53: $33
	jr   nc, -$01                                     ; $5c54: $30 $ff

	ld   a, a                                        ; $5c56: $7f
	inc  b                                           ; $5c57: $04
	inc  bc                                          ; $5c58: $03
	ld   c, b                                        ; $5c59: $48
	ld   h, l                                        ; $5c5a: $65
	ld   (hl), d                                     ; $5c5b: $72
	ld   h, l                                        ; $5c5c: $65
	jr   nz, $69                                     ; $5c5d: $20 $69

	ld   (hl), e                                     ; $5c5f: $73
	jr   nz, jr_005_5cc3                             ; $5c60: $20 $61

	jr   nz, jr_005_5ccf                             ; $5c62: $20 $6b

	ld   h, l                                        ; $5c64: $65
	ld   a, c                                        ; $5c65: $79
	jr   nz, jr_005_5cdc                             ; $5c66: $20 $74

	ld   l, b                                        ; $5c68: $68
	ld   h, c                                        ; $5c69: $61
	ld   (hl), h                                     ; $5c6a: $74
	ld   bc, $6163                                   ; $5c6b: $01 $63 $61

jr_005_5c6e:
	ld   l, (hl)                                     ; $5c6e: $6e
	jr   nz, jr_005_5cd3                             ; $5c6f: $20 $62

	ld   h, l                                        ; $5c71: $65
	jr   nz, jr_005_5ce9                             ; $5c72: $20 $75

	ld   (hl), e                                     ; $5c74: $73
	ld   h, l                                        ; $5c75: $65
	ld   h, h                                        ; $5c76: $64
	jr   nz, jr_005_5ced                             ; $5c77: $20 $74

	ld   l, a                                        ; $5c79: $6f
	jr   nz, jr_005_5ceb                             ; $5c7a: $20 $6f

	ld   (hl), b                                     ; $5c7c: $70
	ld   h, l                                        ; $5c7d: $65

jr_005_5c7e:
	ld   l, (hl)                                     ; $5c7e: $6e
	ld   bc, $6f6c                                   ; $5c7f: $01 $6c $6f
	ld   h, e                                        ; $5c82: $63

jr_005_5c83:
	ld   l, e                                        ; $5c83: $6b
	ld   h, l                                        ; $5c84: $65

jr_005_5c85:
	ld   h, h                                        ; $5c85: $64
	jr   nz, jr_005_5cec                             ; $5c86: $20 $64

	ld   l, a                                        ; $5c88: $6f
	ld   l, a                                        ; $5c89: $6f
	ld   (hl), d                                     ; $5c8a: $72
	ld   (hl), e                                     ; $5c8b: $73
	ld   l, $ff                                      ; $5c8c: $2e $ff
	ld   a, a                                        ; $5c8e: $7f

jr_005_5c8f:
	inc  b                                           ; $5c8f: $04
	inc  bc                                          ; $5c90: $03
	ld   c, b                                        ; $5c91: $48
	ld   h, l                                        ; $5c92: $65
	ld   l, h                                        ; $5c93: $6c
	ld   l, h                                        ; $5c94: $6c
	ld   l, a                                        ; $5c95: $6f
	ld   l, $20                                      ; $5c96: $2e $20
	ld   c, b                                        ; $5c98: $48
	ld   h, l                                        ; $5c99: $65
	ld   (hl), d                                     ; $5c9a: $72
	ld   h, l                                        ; $5c9b: $65
	jr   nz, jr_005_5cff                             ; $5c9c: $20 $61

jr_005_5c9e:
	ld   (hl), d                                     ; $5c9e: $72
	ld   h, l                                        ; $5c9f: $65
	ld   bc, $6f73                                   ; $5ca0: $01 $73 $6f
	ld   l, l                                        ; $5ca3: $6d
	ld   h, l                                        ; $5ca4: $65
	jr   nz, jr_005_5d10                             ; $5ca5: $20 $69

	ld   (hl), h                                     ; $5ca7: $74
	ld   h, l                                        ; $5ca8: $65

jr_005_5ca9:
	ld   l, l                                        ; $5ca9: $6d
	ld   (hl), e                                     ; $5caa: $73
	jr   nz, jr_005_5d21                             ; $5cab: $20 $74

	ld   l, b                                        ; $5cad: $68

jr_005_5cae:
	ld   h, c                                        ; $5cae: $61
	ld   (hl), h                                     ; $5caf: $74
	ld   bc, $6977                                   ; $5cb0: $01 $77 $69
	ld   l, h                                        ; $5cb3: $6c
	ld   l, h                                        ; $5cb4: $6c
	jr   nz, jr_005_5d1f                             ; $5cb5: $20 $68

	ld   h, l                                        ; $5cb7: $65
	ld   l, h                                        ; $5cb8: $6c
	ld   (hl), b                                     ; $5cb9: $70
	jr   nz, jr_005_5d35                             ; $5cba: $20 $79

	ld   l, a                                        ; $5cbc: $6f
	ld   (hl), l                                     ; $5cbd: $75

jr_005_5cbe:
	ld   hl, $0bff                                   ; $5cbe: $21 $ff $0b
	dec  bc                                          ; $5cc1: $0b
	ld   a, e                                        ; $5cc2: $7b

jr_005_5cc3:
	ld   (hl), $30                                   ; $5cc3: $36 $30
	jr   nz, jr_005_5ce7                             ; $5cc5: $20 $20

	jr   nz, jr_005_5ce9                             ; $5cc7: $20 $20

	jr   nz, jr_005_5ceb                             ; $5cc9: $20 $20

	jr   nz, jr_005_5d48                             ; $5ccb: $20 $7b

	scf                                              ; $5ccd: $37
	dec  (hl)                                        ; $5cce: $35

jr_005_5ccf:
	rst  $38                                         ; $5ccf: $ff
	ld   a, a                                        ; $5cd0: $7f
	inc  b                                           ; $5cd1: $04
	inc  bc                                          ; $5cd2: $03

jr_005_5cd3:
	ld   c, b                                        ; $5cd3: $48
	ld   h, l                                        ; $5cd4: $65
	ld   (hl), d                                     ; $5cd5: $72
	ld   h, l                                        ; $5cd6: $65
	jr   nz, jr_005_5d42                             ; $5cd7: $20 $69

	ld   (hl), e                                     ; $5cd9: $73
	jr   nz, jr_005_5d3d                             ; $5cda: $20 $61

jr_005_5cdc:
	jr   nz, $76                                     ; $5cdc: $20 $76

	ld   l, c                                        ; $5cde: $69
	ld   h, c                                        ; $5cdf: $61
	ld   l, h                                        ; $5ce0: $6c
	jr   nz, jr_005_5d52                             ; $5ce1: $20 $6f

	ld   h, (hl)                                     ; $5ce3: $66
	ld   bc, $6e61                                   ; $5ce4: $01 $61 $6e

jr_005_5ce7:
	ld   l, a                                        ; $5ce7: $6f
	ld   l, c                                        ; $5ce8: $69

jr_005_5ce9:
	ld   l, (hl)                                     ; $5ce9: $6e
	ld   (hl), h                                     ; $5cea: $74

jr_005_5ceb:
	ld   l, c                                        ; $5ceb: $69

jr_005_5cec:
	ld   l, (hl)                                     ; $5cec: $6e

jr_005_5ced:
	ld   h, a                                        ; $5ced: $67
	jr   nz, jr_005_5d5f                             ; $5cee: $20 $6f

	ld   l, c                                        ; $5cf0: $69
	ld   l, h                                        ; $5cf1: $6c
	ld   l, $20                                      ; $5cf2: $2e $20
	ld   d, e                                        ; $5cf4: $53
	ld   h, c                                        ; $5cf5: $61
	.db  $76                                         ; $5cf6: $76
	ld   h, l                                        ; $5cf7: $65
	ld   bc, $7469                                   ; $5cf8: $01 $69 $74
	jr   nz, jr_005_5d72                             ; $5cfb: $20 $75

	ld   l, (hl)                                     ; $5cfd: $6e
	ld   (hl), h                                     ; $5cfe: $74

jr_005_5cff:
	ld   l, c                                        ; $5cff: $69
	ld   l, h                                        ; $5d00: $6c
	jr   nz, $79                                     ; $5d01: $20 $79

	ld   l, a                                        ; $5d03: $6f
	ld   (hl), l                                     ; $5d04: $75
	jr   nz, jr_005_5d68                             ; $5d05: $20 $61

	ld   (hl), d                                     ; $5d07: $72
	ld   h, l                                        ; $5d08: $65
	ld   bc, $6577                                   ; $5d09: $01 $77 $65
	ld   h, c                                        ; $5d0c: $61
	ld   l, e                                        ; $5d0d: $6b
	jr   nz, jr_005_5d71                             ; $5d0e: $20 $61

jr_005_5d10:
	ld   l, (hl)                                     ; $5d10: $6e
	ld   h, h                                        ; $5d11: $64
	jr   nz, jr_005_5d7d                             ; $5d12: $20 $69

	ld   (hl), h                                     ; $5d14: $74
	jr   nz, jr_005_5d8e                             ; $5d15: $20 $77

	ld   l, c                                        ; $5d17: $69
	ld   l, h                                        ; $5d18: $6c
	ld   l, h                                        ; $5d19: $6c
	ld   bc, $6568                                   ; $5d1a: $01 $68 $65
	ld   l, h                                        ; $5d1d: $6c
	ld   (hl), b                                     ; $5d1e: $70

jr_005_5d1f:
	jr   nz, jr_005_5d9a                             ; $5d1f: $20 $79

jr_005_5d21:
	ld   l, a                                        ; $5d21: $6f
	ld   (hl), l                                     ; $5d22: $75
	jr   nz, jr_005_5d8e                             ; $5d23: $20 $69

	ld   l, (hl)                                     ; $5d25: $6e
	jr   nz, jr_005_5da1                             ; $5d26: $20 $79

	ld   l, a                                        ; $5d28: $6f
	ld   (hl), l                                     ; $5d29: $75
	ld   (hl), d                                     ; $5d2a: $72
	ld   bc, $7571                                   ; $5d2b: $01 $71 $75
	ld   h, l                                        ; $5d2e: $65
	ld   (hl), e                                     ; $5d2f: $73
	ld   (hl), h                                     ; $5d30: $74
	ld   l, $ff                                      ; $5d31: $2e $ff
	dec  bc                                          ; $5d33: $0b
	.db  $10                                         ; $5d34: $10

jr_005_5d35:
	ld   a, e                                        ; $5d35: $7b
	scf                                              ; $5d36: $37
	dec  (hl)                                        ; $5d37: $35
	rst  $38                                         ; $5d38: $ff
	ld   a, a                                        ; $5d39: $7f
	inc  b                                           ; $5d3a: $04
	inc  bc                                          ; $5d3b: $03
	ld   c, b                                        ; $5d3c: $48

jr_005_5d3d:
	ld   h, l                                        ; $5d3d: $65
	ld   (hl), d                                     ; $5d3e: $72
	ld   h, l                                        ; $5d3f: $65
	jr   nz, jr_005_5dab                             ; $5d40: $20 $69

jr_005_5d42:
	ld   (hl), e                                     ; $5d42: $73
	jr   nz, jr_005_5da6                             ; $5d43: $20 $61

	ld   l, (hl)                                     ; $5d45: $6e
	jr   nz, $61                                     ; $5d46: $20 $61

jr_005_5d48:
	ld   (hl), b                                     ; $5d48: $70
	ld   (hl), b                                     ; $5d49: $70
	ld   l, h                                        ; $5d4a: $6c
	ld   h, l                                        ; $5d4b: $65
	jr   nz, jr_005_5dc2                             ; $5d4c: $20 $74

	ld   l, a                                        ; $5d4e: $6f
	ld   bc, $6461                                   ; $5d4f: $01 $61 $64

jr_005_5d52:
	ld   h, h                                        ; $5d52: $64
	jr   nz, jr_005_5dc9                             ; $5d53: $20 $74

	ld   l, a                                        ; $5d55: $6f
	jr   nz, jr_005_5dd1                             ; $5d56: $20 $79

	ld   l, a                                        ; $5d58: $6f
	ld   (hl), l                                     ; $5d59: $75
	ld   (hl), d                                     ; $5d5a: $72
	jr   nz, jr_005_5dc3                             ; $5d5b: $20 $66

	ld   (hl), d                                     ; $5d5d: $72
	ld   (hl), l                                     ; $5d5e: $75

jr_005_5d5f:
	ld   l, c                                        ; $5d5f: $69
	ld   (hl), h                                     ; $5d60: $74
	ld   l, $01                                      ; $5d61: $2e $01
	ld   c, c                                        ; $5d63: $49
	ld   (hl), h                                     ; $5d64: $74
	jr   nz, jr_005_5ddb                             ; $5d65: $20 $74

	ld   (hl), d                                     ; $5d67: $72

jr_005_5d68:
	ld   h, c                                        ; $5d68: $61
	.db  $76                                         ; $5d69: $76
	ld   h, l                                        ; $5d6a: $65
	ld   l, h                                        ; $5d6b: $6c
	ld   (hl), e                                     ; $5d6c: $73
	jr   nz, $73                                     ; $5d6d: $20 $73

	ld   l, h                                        ; $5d6f: $6c
	ld   l, a                                        ; $5d70: $6f

jr_005_5d71:
	ld   (hl), a                                     ; $5d71: $77

jr_005_5d72:
	ld   l, h                                        ; $5d72: $6c
	ld   a, c                                        ; $5d73: $79
	ld   bc, $7562                                   ; $5d74: $01 $62 $75
	ld   (hl), h                                     ; $5d77: $74
	jr   nz, jr_005_5de3                             ; $5d78: $20 $69

	ld   (hl), e                                     ; $5d7a: $73
	jr   nz, $76                                     ; $5d7b: $20 $76

jr_005_5d7d:
	ld   h, l                                        ; $5d7d: $65
	ld   (hl), d                                     ; $5d7e: $72
	ld   a, c                                        ; $5d7f: $79
	ld   bc, $6f70                                   ; $5d80: $01 $70 $6f
	ld   (hl), a                                     ; $5d83: $77
	ld   h, l                                        ; $5d84: $65
	ld   (hl), d                                     ; $5d85: $72
	ld   h, (hl)                                     ; $5d86: $66
	ld   (hl), l                                     ; $5d87: $75
	ld   l, h                                        ; $5d88: $6c
	ld   l, $ff                                      ; $5d89: $2e $ff
	dec  bc                                          ; $5d8b: $0b
	.db  $10                                         ; $5d8c: $10
	ld   a, e                                        ; $5d8d: $7b

jr_005_5d8e:
	inc  (hl)                                        ; $5d8e: $34
	jr   nc, -$01                                     ; $5d8f: $30 $ff

	ld   a, a                                        ; $5d91: $7f
	inc  b                                           ; $5d92: $04
	inc  bc                                          ; $5d93: $03
	ld   d, h                                        ; $5d94: $54
	ld   l, b                                        ; $5d95: $68
	ld   h, l                                        ; $5d96: $65
	jr   nz, jr_005_5ddb                             ; $5d97: $20 $42

	ld   l, a                                        ; $5d99: $6f

jr_005_5d9a:
	ld   l, a                                        ; $5d9a: $6f
	ld   (hl), h                                     ; $5d9b: $74
	ld   (hl), e                                     ; $5d9c: $73
	jr   nz, jr_005_5e12                             ; $5d9d: $20 $73

	ld   l, b                                        ; $5d9f: $68
	ld   l, a                                        ; $5da0: $6f

jr_005_5da1:
	ld   h, h                                        ; $5da1: $64
	jr   nz, jr_005_5e1b                             ; $5da2: $20 $77

	ld   l, c                                        ; $5da4: $69
	ld   (hl), h                                     ; $5da5: $74

jr_005_5da6:
	ld   l, b                                        ; $5da6: $68
	ld   bc, $6874                                   ; $5da7: $01 $74 $68
	ld   h, l                                        ; $5daa: $65

jr_005_5dab:
	jr   nz, jr_005_5dfd                             ; $5dab: $20 $50

	ld   (hl), d                                     ; $5dad: $72
	ld   h, l                                        ; $5dae: $65
	ld   (hl), b                                     ; $5daf: $70
	ld   h, c                                        ; $5db0: $61
	ld   (hl), d                                     ; $5db1: $72
	ld   h, c                                        ; $5db2: $61
	ld   (hl), h                                     ; $5db3: $74
	ld   l, c                                        ; $5db4: $69
	ld   l, a                                        ; $5db5: $6f
	ld   l, (hl)                                     ; $5db6: $6e
	jr   nz, jr_005_5e28                             ; $5db7: $20 $6f

	ld   h, (hl)                                     ; $5db9: $66
	ld   bc, $6874                                   ; $5dba: $01 $74 $68
	ld   h, l                                        ; $5dbd: $65
	jr   nz, $47                                     ; $5dbe: $20 $47

	ld   l, a                                        ; $5dc0: $6f
	ld   (hl), e                                     ; $5dc1: $73

jr_005_5dc2:
	ld   (hl), b                                     ; $5dc2: $70

jr_005_5dc3:
	ld   h, l                                        ; $5dc3: $65
	ld   l, h                                        ; $5dc4: $6c
	jr   nz, jr_005_5e3e                             ; $5dc5: $20 $77

	ld   l, c                                        ; $5dc7: $69
	ld   l, h                                        ; $5dc8: $6c

jr_005_5dc9:
	ld   l, h                                        ; $5dc9: $6c
	jr   nz, jr_005_5e38                             ; $5dca: $20 $6c

	ld   h, l                                        ; $5dcc: $65
	ld   (hl), h                                     ; $5dcd: $74
	ld   bc, $6f79                                   ; $5dce: $01 $79 $6f

jr_005_5dd1:
	ld   (hl), l                                     ; $5dd1: $75
	jr   nz, jr_005_5e37                             ; $5dd2: $20 $63

	ld   (hl), d                                     ; $5dd4: $72
	ld   l, a                                        ; $5dd5: $6f
	ld   (hl), e                                     ; $5dd6: $73
	ld   (hl), e                                     ; $5dd7: $73
	jr   nz, jr_005_5e3d                             ; $5dd8: $20 $63

	ld   h, l                                        ; $5dda: $65

jr_005_5ddb:
	ld   (hl), d                                     ; $5ddb: $72
	ld   (hl), h                                     ; $5ddc: $74
	ld   h, c                                        ; $5ddd: $61
	ld   l, c                                        ; $5dde: $69
	ld   l, (hl)                                     ; $5ddf: $6e
	ld   bc, $626f                                   ; $5de0: $01 $6f $62

jr_005_5de3:
	ld   (hl), e                                     ; $5de3: $73
	ld   (hl), h                                     ; $5de4: $74
	ld   h, c                                        ; $5de5: $61
	ld   h, e                                        ; $5de6: $63
	ld   l, h                                        ; $5de7: $6c
	ld   h, l                                        ; $5de8: $65
	ld   (hl), e                                     ; $5de9: $73
	jr   nz, jr_005_5e60                             ; $5dea: $20 $74

	ld   l, a                                        ; $5dec: $6f
	jr   nz, $79                                     ; $5ded: $20 $79

	ld   l, a                                        ; $5def: $6f
	ld   (hl), l                                     ; $5df0: $75
	ld   (hl), d                                     ; $5df1: $72
	ld   bc, $7571                                   ; $5df2: $01 $71 $75
	ld   h, l                                        ; $5df5: $65
	ld   (hl), e                                     ; $5df6: $73
	ld   (hl), h                                     ; $5df7: $74
	ld   l, $ff                                      ; $5df8: $2e $ff
	ld   a, a                                        ; $5dfa: $7f
	ld   a, a                                        ; $5dfb: $7f
	add  hl, bc                                      ; $5dfc: $09

jr_005_5dfd:
	rra                                              ; $5dfd: $1f
	daa                                              ; $5dfe: $27
	inc  c                                           ; $5dff: $0c
	call nz, $0801                                   ; $5e00: $c4 $01 $08
	ld   e, (hl)                                     ; $5e03: $5e
	ret  z                                           ; $5e04: $c8

	inc  d                                           ; $5e05: $14
	ld   d, $5e                                      ; $5e06: $16 $5e
	call nz, $1002                                   ; $5e08: $c4 $02 $10
	ld   e, (hl)                                     ; $5e0b: $5e
	ret  z                                           ; $5e0c: $c8

	dec  d                                           ; $5e0d: $15
	inc  l                                           ; $5e0e: $2c
	ld   e, (hl)                                     ; $5e0f: $5e
	add  e                                           ; $5e10: $83
	ld   d, b                                        ; $5e11: $50

jr_005_5e12:
	ld   e, (hl)                                     ; $5e12: $5e
	add  c                                           ; $5e13: $81
	ld   bc, $c450                                   ; $5e14: $01 $50 $c4
	ld   (bc), a                                     ; $5e17: $02
	ld   e, $5e                                      ; $5e18: $1e $5e
	ret  z                                           ; $5e1a: $c8

jr_005_5e1b:
	dec  d                                           ; $5e1b: $15
	ldd  a, (hl)                                     ; $5e1c: $3a
	ld   e, (hl)                                     ; $5e1d: $5e
	add  e                                           ; $5e1e: $83
	adc  h                                           ; $5e1f: $8c
	ld   e, (hl)                                     ; $5e20: $5e
	pop  bc                                          ; $5e21: $c1
	inc  (hl)                                        ; $5e22: $34
	ld   a, d                                        ; $5e23: $7a
	ld   h, h                                        ; $5e24: $64
	pop  bc                                          ; $5e25: $c1
	inc  sp                                          ; $5e26: $33
	ld   (hl), b                                     ; $5e27: $70

jr_005_5e28:
	ld   d, h                                        ; $5e28: $54
	add  c                                           ; $5e29: $81
	ld   bc, $8350                                   ; $5e2a: $01 $50 $83
	ret  z                                           ; $5e2d: $c8

	ld   e, (hl)                                     ; $5e2e: $5e
	pop  bc                                          ; $5e2f: $c1
	dec  (hl)                                        ; $5e30: $35
	ld   a, d                                        ; $5e31: $7a
	ld   h, h                                        ; $5e32: $64
	pop  bc                                          ; $5e33: $c1
	inc  sp                                          ; $5e34: $33
	ld   (hl), b                                     ; $5e35: $70
	ld   d, h                                        ; $5e36: $54

jr_005_5e37:
	add  c                                           ; $5e37: $81

jr_005_5e38:
	ld   bc, $8350                                   ; $5e38: $01 $50 $83
	rra                                              ; $5e3b: $1f
	ld   e, a                                        ; $5e3c: $5f

jr_005_5e3d:
	pop  bc                                          ; $5e3d: $c1

jr_005_5e3e:
	inc  (hl)                                        ; $5e3e: $34
	ld   d, d                                        ; $5e3f: $52
	ld   h, h                                        ; $5e40: $64
	pop  bc                                          ; $5e41: $c1
	inc  sp                                          ; $5e42: $33
	ld   c, b                                        ; $5e43: $48
	ld   d, h                                        ; $5e44: $54
	pop  bc                                          ; $5e45: $c1
	dec  (hl)                                        ; $5e46: $35
	and  d                                           ; $5e47: $a2
	ld   h, h                                        ; $5e48: $64
	pop  bc                                          ; $5e49: $c1
	inc  sp                                          ; $5e4a: $33
	sbc  b                                           ; $5e4b: $98
	ld   d, h                                        ; $5e4c: $54
	add  c                                           ; $5e4d: $81
	ld   bc, $0450                                   ; $5e4e: $01 $50 $04
	inc  bc                                          ; $5e51: $03
	ld   d, h                                        ; $5e52: $54
	ld   l, b                                        ; $5e53: $68
	ld   h, l                                        ; $5e54: $65
	ld   (hl), d                                     ; $5e55: $72
	ld   h, l                                        ; $5e56: $65
	jr   nz, jr_005_5ec2                             ; $5e57: $20 $69

	ld   (hl), e                                     ; $5e59: $73
	jr   nz, jr_005_5eca                             ; $5e5a: $20 $6e

	ld   l, a                                        ; $5e5c: $6f
	ld   (hl), h                                     ; $5e5d: $74
	ld   l, b                                        ; $5e5e: $68
	ld   l, c                                        ; $5e5f: $69

jr_005_5e60:
	ld   l, (hl)                                     ; $5e60: $6e
	ld   h, a                                        ; $5e61: $67
	ld   bc, $6568                                   ; $5e62: $01 $68 $65
	ld   (hl), d                                     ; $5e65: $72
	ld   h, l                                        ; $5e66: $65
	jr   nz, jr_005_5ed8                             ; $5e67: $20 $6f

	ld   h, (hl)                                     ; $5e69: $66
	jr   nz, jr_005_5ed5                             ; $5e6a: $20 $69

	ld   l, (hl)                                     ; $5e6c: $6e
	ld   (hl), h                                     ; $5e6d: $74
	ld   h, l                                        ; $5e6e: $65
	ld   (hl), d                                     ; $5e6f: $72
	ld   h, l                                        ; $5e70: $65
	ld   (hl), e                                     ; $5e71: $73
	ld   (hl), h                                     ; $5e72: $74
	jr   nz, jr_005_5ee9                             ; $5e73: $20 $74

	ld   l, a                                        ; $5e75: $6f
	ld   bc, $6f79                                   ; $5e76: $01 $79 $6f
	ld   (hl), l                                     ; $5e79: $75
	jr   nz, jr_005_5edd                             ; $5e7a: $20 $61

	ld   (hl), h                                     ; $5e7c: $74
	jr   nz, $74                                     ; $5e7d: $20 $74

	ld   l, b                                        ; $5e7f: $68
	ld   l, c                                        ; $5e80: $69
	ld   (hl), e                                     ; $5e81: $73
	jr   nz, jr_005_5ef8                             ; $5e82: $20 $74

	ld   l, c                                        ; $5e84: $69
	ld   l, l                                        ; $5e85: $6d
	ld   h, l                                        ; $5e86: $65
	ld   l, $2e                                      ; $5e87: $2e $2e
	ld   l, $ff                                      ; $5e89: $2e $ff
	ld   a, a                                        ; $5e8b: $7f
	inc  b                                           ; $5e8c: $04
	inc  bc                                          ; $5e8d: $03
	ld   c, c                                        ; $5e8e: $49
	ld   h, (hl)                                     ; $5e8f: $66
	jr   nz, jr_005_5f0b                             ; $5e90: $20 $79

	ld   l, a                                        ; $5e92: $6f
	ld   (hl), l                                     ; $5e93: $75
	jr   nz, jr_005_5efe                             ; $5e94: $20 $68

	ld   h, c                                        ; $5e96: $61
	.db  $76                                         ; $5e97: $76
	ld   h, l                                        ; $5e98: $65
	jr   nz, jr_005_5f0f                             ; $5e99: $20 $74

	ld   (hl), d                                     ; $5e9b: $72
	ld   (hl), l                                     ; $5e9c: $75
	ld   l, h                                        ; $5e9d: $6c
	ld   a, c                                        ; $5e9e: $79
	ld   bc, $6572                                   ; $5e9f: $01 $72 $65
	ld   (hl), b                                     ; $5ea2: $70
	ld   h, l                                        ; $5ea3: $65
	ld   l, (hl)                                     ; $5ea4: $6e
	ld   (hl), h                                     ; $5ea5: $74
	ld   h, l                                        ; $5ea6: $65
	ld   h, h                                        ; $5ea7: $64
	jr   nz, $79                                     ; $5ea8: $20 $79

	ld   l, a                                        ; $5eaa: $6f
	ld   (hl), l                                     ; $5eab: $75
	jr   nz, $63                                     ; $5eac: $20 $63

	ld   h, c                                        ; $5eae: $61
	ld   l, (hl)                                     ; $5eaf: $6e
	ld   bc, $6168                                   ; $5eb0: $01 $68 $61
	.db  $76                                         ; $5eb3: $76
	ld   h, l                                        ; $5eb4: $65
	jr   nz, jr_005_5f2b                             ; $5eb5: $20 $74

	ld   l, b                                        ; $5eb7: $68
	ld   h, l                                        ; $5eb8: $65
	jr   nz, jr_005_5f1d                             ; $5eb9: $20 $62

	ld   h, l                                        ; $5ebb: $65
	ld   l, h                                        ; $5ebc: $6c
	ld   (hl), h                                     ; $5ebd: $74
	ld   l, $ff                                      ; $5ebe: $2e $ff
	dec  bc                                          ; $5ec0: $0b
	.db  $10                                         ; $5ec1: $10

jr_005_5ec2:
	ld   a, e                                        ; $5ec2: $7b
	ld   sp, $3035                                   ; $5ec3: $31 $35 $30
	rst  $38                                         ; $5ec6: $ff
	ld   a, a                                        ; $5ec7: $7f
	inc  b                                           ; $5ec8: $04
	inc  bc                                          ; $5ec9: $03

jr_005_5eca:
	ld   c, c                                        ; $5eca: $49
	ld   h, (hl)                                     ; $5ecb: $66
	jr   nz, jr_005_5f47                             ; $5ecc: $20 $79

	ld   l, a                                        ; $5ece: $6f
	ld   (hl), l                                     ; $5ecf: $75
	jr   nz, jr_005_5f3a                             ; $5ed0: $20 $68

	ld   h, c                                        ; $5ed2: $61
	.db  $76                                         ; $5ed3: $76
	ld   h, l                                        ; $5ed4: $65

jr_005_5ed5:
	jr   nz, $73                                     ; $5ed5: $20 $73

	ld   h, l                                        ; $5ed7: $65

jr_005_5ed8:
	ld   h, l                                        ; $5ed8: $65
	ld   l, (hl)                                     ; $5ed9: $6e
	ld   bc, $6874                                   ; $5eda: $01 $74 $68

jr_005_5edd:
	ld   h, l                                        ; $5edd: $65
	jr   nz, jr_005_5f45                             ; $5ede: $20 $65

	ld   (hl), d                                     ; $5ee0: $72
	ld   (hl), d                                     ; $5ee1: $72
	ld   l, a                                        ; $5ee2: $6f
	ld   (hl), d                                     ; $5ee3: $72
	jr   nz, jr_005_5f55                             ; $5ee4: $20 $6f

	ld   h, (hl)                                     ; $5ee6: $66
	jr   nz, $79                                     ; $5ee7: $20 $79

jr_005_5ee9:
	ld   l, a                                        ; $5ee9: $6f
	ld   (hl), l                                     ; $5eea: $75
	ld   (hl), d                                     ; $5eeb: $72
	ld   bc, $6177                                   ; $5eec: $01 $77 $61
	ld   a, c                                        ; $5eef: $79
	ld   (hl), e                                     ; $5ef0: $73
	inc  l                                           ; $5ef1: $2c
	jr   nz, $79                                     ; $5ef2: $20 $79

	ld   l, a                                        ; $5ef4: $6f
	ld   (hl), l                                     ; $5ef5: $75
	jr   nz, jr_005_5f65                             ; $5ef6: $20 $6d

jr_005_5ef8:
	ld   h, c                                        ; $5ef8: $61
	ld   a, c                                        ; $5ef9: $79
	jr   nz, jr_005_5f64                             ; $5efa: $20 $68

	ld   h, c                                        ; $5efc: $61
	.db  $76                                         ; $5efd: $76

jr_005_5efe:
	ld   h, l                                        ; $5efe: $65
	ld   bc, $6874                                   ; $5eff: $01 $74 $68
	ld   h, l                                        ; $5f02: $65
	jr   nz, jr_005_5f67                             ; $5f03: $20 $62

	ld   (hl), d                                     ; $5f05: $72
	ld   h, l                                        ; $5f06: $65
	ld   h, c                                        ; $5f07: $61
	ld   (hl), e                                     ; $5f08: $73
	ld   (hl), h                                     ; $5f09: $74
	ld   (hl), b                                     ; $5f0a: $70

jr_005_5f0b:
	ld   l, h                                        ; $5f0b: $6c
	ld   h, c                                        ; $5f0c: $61
	ld   (hl), h                                     ; $5f0d: $74
	ld   h, l                                        ; $5f0e: $65

jr_005_5f0f:
	ld   bc, $6761                                   ; $5f0f: $01 $61 $67
	ld   h, c                                        ; $5f12: $61
	ld   l, c                                        ; $5f13: $69
	ld   l, (hl)                                     ; $5f14: $6e
	ld   l, $ff                                      ; $5f15: $2e $ff
	dec  bc                                          ; $5f17: $0b
	.db  $10                                         ; $5f18: $10
	ld   a, e                                        ; $5f19: $7b
	ldd  (hl), a                                     ; $5f1a: $32
	jr   nc, jr_005_5f4d                             ; $5f1b: $30 $30

jr_005_5f1d:
	rst  $38                                         ; $5f1d: $ff
	ld   a, a                                        ; $5f1e: $7f
	inc  b                                           ; $5f1f: $04
	inc  bc                                          ; $5f20: $03
	ld   c, c                                        ; $5f21: $49
	jr   nz, jr_005_5f97                             ; $5f22: $20 $73

	ld   (hl), l                                     ; $5f24: $75
	ld   (hl), d                                     ; $5f25: $72
	ld   h, l                                        ; $5f26: $65
	jr   nz, $68                                     ; $5f27: $20 $68

	ld   l, a                                        ; $5f29: $6f
	ld   (hl), b                                     ; $5f2a: $70

jr_005_5f2b:
	ld   h, l                                        ; $5f2b: $65
	jr   nz, jr_005_5fa7                             ; $5f2c: $20 $79

	ld   l, a                                        ; $5f2e: $6f
	ld   (hl), l                                     ; $5f2f: $75
	ld   bc, $656c                                   ; $5f30: $01 $6c $65
	ld   h, c                                        ; $5f33: $61
	ld   (hl), d                                     ; $5f34: $72
	ld   l, (hl)                                     ; $5f35: $6e
	ld   h, l                                        ; $5f36: $65
	ld   h, h                                        ; $5f37: $64
	jr   nz, $61                                     ; $5f38: $20 $61

jr_005_5f3a:
	jr   nz, jr_005_5fa8                             ; $5f3a: $20 $6c

	ld   h, l                                        ; $5f3c: $65
	ld   (hl), e                                     ; $5f3d: $73
	ld   (hl), e                                     ; $5f3e: $73
	ld   l, a                                        ; $5f3f: $6f
	ld   l, (hl)                                     ; $5f40: $6e
	ld   hl, $5201                                   ; $5f41: $21 $01 $52
	ld   h, l                                        ; $5f44: $65

jr_005_5f45:
	ld   (hl), b                                     ; $5f45: $70
	ld   h, l                                        ; $5f46: $65

jr_005_5f47:
	ld   l, (hl)                                     ; $5f47: $6e
	ld   (hl), h                                     ; $5f48: $74
	jr   nz, jr_005_5fac                             ; $5f49: $20 $61

	ld   l, (hl)                                     ; $5f4b: $6e
	ld   h, h                                        ; $5f4c: $64

jr_005_5f4d:
	jr   nz, jr_005_5fc8                             ; $5f4d: $20 $79

	ld   l, a                                        ; $5f4f: $6f
	ld   (hl), l                                     ; $5f50: $75
	jr   nz, jr_005_5fc0                             ; $5f51: $20 $6d

	ld   h, c                                        ; $5f53: $61
	ld   a, c                                        ; $5f54: $79

jr_005_5f55:
	ld   bc, $6572                                   ; $5f55: $01 $72 $65
	ld   h, e                                        ; $5f58: $63
	ld   l, a                                        ; $5f59: $6f
	.db  $76                                         ; $5f5a: $76
	ld   h, l                                        ; $5f5b: $65
	ld   (hl), d                                     ; $5f5c: $72
	jr   nz, jr_005_5fd3                             ; $5f5d: $20 $74

	ld   l, b                                        ; $5f5f: $68
	ld   h, l                                        ; $5f60: $65
	jr   nz, jr_005_5fcc                             ; $5f61: $20 $69

	ld   (hl), h                                     ; $5f63: $74

jr_005_5f64:
	ld   h, l                                        ; $5f64: $65

jr_005_5f65:
	ld   l, l                                        ; $5f65: $6d
	ld   (hl), e                                     ; $5f66: $73

jr_005_5f67:
	ld   bc, $6874                                   ; $5f67: $01 $74 $68
	ld   h, c                                        ; $5f6a: $61
	ld   (hl), h                                     ; $5f6b: $74
	jr   nz, jr_005_5fe7                             ; $5f6c: $20 $79

	ld   l, a                                        ; $5f6e: $6f
	ld   (hl), l                                     ; $5f6f: $75
	jr   nz, jr_005_5fda                             ; $5f70: $20 $68

	ld   h, c                                        ; $5f72: $61
	.db  $76                                         ; $5f73: $76
	ld   h, l                                        ; $5f74: $65
	jr   nz, jr_005_5fe3                             ; $5f75: $20 $6c

	ld   l, a                                        ; $5f77: $6f
	ld   (hl), e                                     ; $5f78: $73
	ld   (hl), h                                     ; $5f79: $74
	ld   l, $ff                                      ; $5f7a: $2e $ff
	dec  bc                                          ; $5f7c: $0b
	dec  bc                                          ; $5f7d: $0b
	ld   a, e                                        ; $5f7e: $7b
	ld   sp, $3035                                   ; $5f7f: $31 $35 $30
	jr   nz, jr_005_5fa4                             ; $5f82: $20 $20

	jr   nz, jr_005_5fa6                             ; $5f84: $20 $20

	jr   nz, jr_005_5fa8                             ; $5f86: $20 $20

	ld   a, e                                        ; $5f88: $7b
	ldd  (hl), a                                     ; $5f89: $32
	jr   nc, jr_005_5fbc                             ; $5f8a: $30 $30

	rst  $38                                         ; $5f8c: $ff
	ld   a, a                                        ; $5f8d: $7f
	add  l                                           ; $5f8e: $85
	ld   ($c64f), a                                  ; $5f8f: $ea $4f $c6
	sub  (hl)                                        ; $5f92: $96
	sbc  b                                           ; $5f93: $98
	ld   e, a                                        ; $5f94: $5f
	add  c                                           ; $5f95: $81
	sbc  (hl)                                        ; $5f96: $9e

jr_005_5f97:
	ld   e, a                                        ; $5f97: $5f
	ld   c, d                                        ; $5f98: $4a
	ld   bc, $2885                                   ; $5f99: $01 $85 $28
	ld   d, b                                        ; $5f9c: $50
	nop                                              ; $5f9d: $00
	add  a                                           ; $5f9e: $87
	xor  d                                           ; $5f9f: $aa
	ld   e, a                                        ; $5fa0: $5f
	add  l                                           ; $5fa1: $85
	or   $4f                                         ; $5fa2: $f6 $4f

jr_005_5fa4:
	add  l                                           ; $5fa4: $85
	.db  $ed                                         ; $5fa5: $ed

jr_005_5fa6:
	ld   c, a                                        ; $5fa6: $4f

jr_005_5fa7:
	add  c                                           ; $5fa7: $81

jr_005_5fa8:
	sbc  (hl)                                        ; $5fa8: $9e
	ld   e, a                                        ; $5fa9: $5f
	inc  b                                           ; $5faa: $04
	ld   (bc), a                                     ; $5fab: $02

jr_005_5fac:
	ld   e, c                                        ; $5fac: $59
	ld   l, a                                        ; $5fad: $6f
	ld   (hl), l                                     ; $5fae: $75
	ld   (hl), d                                     ; $5faf: $72
	jr   nz, jr_005_6018                             ; $5fb0: $20 $66

	ld   h, c                                        ; $5fb2: $61
	ld   l, c                                        ; $5fb3: $69
	ld   (hl), h                                     ; $5fb4: $74
	ld   l, b                                        ; $5fb5: $68
	ld   bc, $6f6c                                   ; $5fb6: $01 $6c $6f
	ld   l, a                                        ; $5fb9: $6f
	ld   l, e                                        ; $5fba: $6b
	ld   (hl), e                                     ; $5fbb: $73

jr_005_5fbc:
	jr   nz, jr_005_6035                             ; $5fbc: $20 $77

	ld   h, l                                        ; $5fbe: $65
	ld   h, c                                        ; $5fbf: $61

jr_005_5fc0:
	ld   l, e                                        ; $5fc0: $6b
	ld   l, $01                                      ; $5fc1: $2e $01
	ld   e, c                                        ; $5fc3: $59
	ld   l, a                                        ; $5fc4: $6f
	ld   (hl), l                                     ; $5fc5: $75
	daa                                              ; $5fc6: $27
	ld   l, h                                        ; $5fc7: $6c

jr_005_5fc8:
	ld   l, h                                        ; $5fc8: $6c
	jr   nz, jr_005_6039                             ; $5fc9: $20 $6e

	ld   h, l                                        ; $5fcb: $65

jr_005_5fcc:
	ld   h, l                                        ; $5fcc: $65
	ld   h, h                                        ; $5fcd: $64
	ld   bc, $6f6d                                   ; $5fce: $01 $6d $6f
	ld   (hl), d                                     ; $5fd1: $72
	ld   h, l                                        ; $5fd2: $65

jr_005_5fd3:
	jr   nz, jr_005_6048                             ; $5fd3: $20 $73

	ld   (hl), b                                     ; $5fd5: $70
	ld   l, c                                        ; $5fd6: $69
	ld   (hl), d                                     ; $5fd7: $72

jr_005_5fd8:
	ld   l, c                                        ; $5fd8: $69
	ld   (hl), h                                     ; $5fd9: $74

jr_005_5fda:
	ld   l, $ff                                      ; $5fda: $2e $ff
	cp   $7f                                         ; $5fdc: $fe $7f
	ld   bc, $0447                                   ; $5fde: $01 $47 $04
	ld   b, c                                        ; $5fe1: $41
	ld   (bc), a                                     ; $5fe2: $02

jr_005_5fe3:
	ld   b, h                                        ; $5fe3: $44
	ld   ($400c), sp                                 ; $5fe4: $08 $0c $40

jr_005_5fe7:
	rst  $38                                         ; $5fe7: $ff
	rrca                                             ; $5fe8: $0f
	add  c                                           ; $5fe9: $81
	and  $5f                                         ; $5fea: $e6 $5f
	ld   bc, $0447                                   ; $5fec: $01 $47 $04
	ld   b, c                                        ; $5fef: $41
	ld   (bc), a                                     ; $5ff0: $02
	ld   b, h                                        ; $5ff1: $44
	ld   ($400c), sp                                 ; $5ff2: $08 $0c $40
	ld   h, b                                        ; $5ff5: $60
	ld   c, $81                                      ; $5ff6: $0e $81
	.db  $f4                                         ; $5ff8: $f4
	ld   e, a                                        ; $5ff9: $5f
	ld   b, c                                        ; $5ffa: $41
	.db  $10                                         ; $5ffb: $10
	ld   bc, $c0c3                                   ; $5ffc: $01 $c3 $c0
	dec  b                                           ; $5fff: $05
	ld   h, b                                        ; $6000: $60
	ld   ($1281), sp                                 ; $6001: $08 $81 $12
	ld   h, b                                        ; $6004: $60
	jp   $0daa                                       ; $6005: $c3 $aa $0d


	ld   h, b                                        ; $6008: $60
	rlca                                             ; $6009: $07
	add  c                                           ; $600a: $81
	ld   (de), a                                     ; $600b: $12
	ld   h, b                                        ; $600c: $60
	jp   $1280                                       ; $600d: $c3 $80 $12


	ld   h, b                                        ; $6010: $60
	dec  b                                           ; $6011: $05
	ld   b, b                                        ; $6012: $40
	jr   nz, jr_005_5fd8                             ; $6013: $20 $c3

	add  b                                           ; $6015: $80
	dec  de                                          ; $6016: $1b
	ld   h, b                                        ; $6017: $60

jr_005_6018:
	ld   b, e                                        ; $6018: $43
	ld   a, a                                        ; $6019: $7f
	nop                                              ; $601a: $00
	ld   b, e                                        ; $601b: $43
	xor  h                                           ; $601c: $ac
	nop                                              ; $601d: $00
	ld   b, a                                        ; $601e: $47
	ld   (bc), a                                     ; $601f: $02
	inc  d                                           ; $6020: $14
	add  l                                           ; $6021: $85
	ld   ($854f), a                                  ; $6022: $ea $4f $85
	ld   ($ca50), sp                                 ; $6025: $08 $50 $ca
	rst  $38                                         ; $6028: $ff
	ld   l, $60                                      ; $6029: $2e $60
	add  c                                           ; $602b: $81
	inc  h                                           ; $602c: $24
	ld   h, b                                        ; $602d: $60
	ld   d, b                                        ; $602e: $50
	inc  h                                           ; $602f: $24
	ld   d, h                                        ; $6030: $54
	nop                                              ; $6031: $00
	nop                                              ; $6032: $00
	ld   b, a                                        ; $6033: $47
	ld   (bc), a                                     ; $6034: $02

jr_005_6035:
	add  l                                           ; $6035: $85
	ld   ($854f), a                                  ; $6036: $ea $4f $85

jr_005_6039:
	.db  $10                                         ; $6039: $10
	ld   d, b                                        ; $603a: $50
	add  $ff                                         ; $603b: $c6 $ff
	ld   l, $60                                      ; $603d: $2e $60
	add  c                                           ; $603f: $81
	jr   c, jr_005_60a2                              ; $6040: $38 $60

	add  l                                           ; $6042: $85
	.db  $ed                                         ; $6043: $ed
	ld   c, a                                        ; $6044: $4f
	ld   d, h                                        ; $6045: $54
	rst  $38                                         ; $6046: $ff
	add  l                                           ; $6047: $85

jr_005_6048:
	and  $54                                         ; $6048: $e6 $54
	ret  z                                           ; $604a: $c8

	ld   h, $51                                      ; $604b: $26 $51
	ld   h, b                                        ; $604d: $60
	add  a                                           ; $604e: $87
	cp   e                                           ; $604f: $bb
	ld   h, b                                        ; $6050: $60
	call nz, Call_005_5b01                           ; $6051: $c4 $01 $5b
	ld   h, b                                        ; $6054: $60
	add  a                                           ; $6055: $87
	rst  $30                                         ; $6056: $f7
	ld   h, b                                        ; $6057: $60
	add  c                                           ; $6058: $81
	or   l                                           ; $6059: $b5
	ld   h, b                                        ; $605a: $60
	ret  z                                           ; $605b: $c8

	dec  d                                           ; $605c: $15
	ld   h, d                                        ; $605d: $62
	ld   h, b                                        ; $605e: $60
	add  c                                           ; $605f: $81
	ld   l, h                                        ; $6060: $6c
	ld   h, b                                        ; $6061: $60
	call nz, $7602                           ; $6062: $c4 $02 $76
	ld   h, b                                        ; $6065: $60
	add  a                                           ; $6066: $87
	ld   c, a                                        ; $6067: $4f
	ld   h, c                                        ; $6068: $61
	add  c                                           ; $6069: $81
	or   l                                           ; $606a: $b5
	ld   h, b                                        ; $606b: $60
	call nz, $7602                           ; $606c: $c4 $02 $76
	ld   h, b                                        ; $606f: $60
	add  a                                           ; $6070: $87
	and  h                                           ; $6071: $a4
	ld   h, c                                        ; $6072: $61
	add  c                                           ; $6073: $81
	or   l                                           ; $6074: $b5
	ld   h, b                                        ; $6075: $60
	call nz, $8004                                   ; $6076: $c4 $04 $80
	ld   h, b                                        ; $6079: $60
	add  a                                           ; $607a: $87
	inc  de                                          ; $607b: $13

Jump_005_607c:
	ld   h, d                                        ; $607c: $62
	add  c                                           ; $607d: $81
	or   l                                           ; $607e: $b5
	ld   h, b                                        ; $607f: $60
	push bc                                          ; $6080: $c5
	ld   (bc), a                                     ; $6081: $02
	adc  d                                           ; $6082: $8a
	ld   h, b                                        ; $6083: $60
	add  a                                           ; $6084: $87
	add  a                                           ; $6085: $87
	ld   h, d                                        ; $6086: $62
	add  c                                           ; $6087: $81
	or   l                                           ; $6088: $b5
	ld   h, b                                        ; $6089: $60
	push bc                                          ; $608a: $c5
	inc  b                                           ; $608b: $04
	sub  h                                           ; $608c: $94
	ld   h, b                                        ; $608d: $60
	add  a                                           ; $608e: $87
	nop                                              ; $608f: $00
	ld   h, e                                        ; $6090: $63
	add  c                                           ; $6091: $81
	or   l                                           ; $6092: $b5
	ld   h, b                                        ; $6093: $60
	call nz, $9e20                                   ; $6094: $c4 $20 $9e
	ld   h, b                                        ; $6097: $60
	add  a                                           ; $6098: $87
	ld   b, l                                        ; $6099: $45
	ld   h, h                                        ; $609a: $64
	add  c                                           ; $609b: $81
	or   l                                           ; $609c: $b5
	ld   h, b                                        ; $609d: $60
	call nz, $a810                                   ; $609e: $c4 $10 $a8
	ld   h, b                                        ; $60a1: $60

jr_005_60a2:
	add  a                                           ; $60a2: $87
	.db  $76                                         ; $60a3: $76
	ld   h, e                                        ; $60a4: $63
	add  c                                           ; $60a5: $81
	or   l                                           ; $60a6: $b5
	ld   h, b                                        ; $60a7: $60
	call nz, $b208                                   ; $60a8: $c4 $08 $b2
	ld   h, b                                        ; $60ab: $60
	add  a                                           ; $60ac: $87
	xor  d                                           ; $60ad: $aa
	ld   h, h                                        ; $60ae: $64
	add  c                                           ; $60af: $81
	or   l                                           ; $60b0: $b5
	ld   h, b                                        ; $60b1: $60
	add  a                                           ; $60b2: $87
	ld   a, b                                        ; $60b3: $78
	ld   h, l                                        ; $60b4: $65
	add  l                                           ; $60b5: $85
	or   $4f                                         ; $60b6: $f6 $4f
	add  c                                           ; $60b8: $81
	ld   b, d                                        ; $60b9: $42
	ld   h, b                                        ; $60ba: $60
	inc  bc                                          ; $60bb: $03
	ld   (bc), a                                     ; $60bc: $02
	ld   d, a                                        ; $60bd: $57
	ld   h, l                                        ; $60be: $65
	ld   l, h                                        ; $60bf: $6c
	ld   h, e                                        ; $60c0: $63
	ld   l, a                                        ; $60c1: $6f
	ld   l, l                                        ; $60c2: $6d
	ld   h, l                                        ; $60c3: $65
	jr   nz, $74                                     ; $60c4: $20 $74

	ld   l, a                                        ; $60c6: $6f
	ld   bc, $6874                                   ; $60c7: $01 $74 $68
	ld   h, l                                        ; $60ca: $65
	jr   nz, jr_005_6110                             ; $60cb: $20 $43

	ld   l, b                                        ; $60cd: $68
	ld   (hl), l                                     ; $60ce: $75
	ld   (hl), d                                     ; $60cf: $72
	ld   h, e                                        ; $60d0: $63
	ld   l, b                                        ; $60d1: $68
	ld   hl, $5901                                   ; $60d2: $21 $01 $59
	ld   l, a                                        ; $60d5: $6f
	ld   (hl), l                                     ; $60d6: $75
	jr   nz, jr_005_613c                             ; $60d7: $20 $63

	ld   h, c                                        ; $60d9: $61
	ld   l, (hl)                                     ; $60da: $6e
	ld   bc, $6c61                                   ; $60db: $01 $61 $6c
	ld   (hl), a                                     ; $60de: $77
	ld   h, c                                        ; $60df: $61
	ld   a, c                                        ; $60e0: $79
	ld   (hl), e                                     ; $60e1: $73
	jr   nz, $66                                     ; $60e2: $20 $66

	ld   l, c                                        ; $60e4: $69
	ld   l, (hl)                                     ; $60e5: $6e
	ld   h, h                                        ; $60e6: $64
	ld   bc, $6568                                   ; $60e7: $01 $68 $65
	ld   l, h                                        ; $60ea: $6c
	ld   (hl), b                                     ; $60eb: $70
	jr   nz, jr_005_6156                             ; $60ec: $20 $68

	ld   h, l                                        ; $60ee: $65
	ld   (hl), d                                     ; $60ef: $72
	ld   h, l                                        ; $60f0: $65
	ld   l, $ff                                      ; $60f1: $2e $ff
	ld   b, d                                        ; $60f3: $42
	rrca                                             ; $60f4: $0f
	cp   $7f                                         ; $60f5: $fe $7f
	inc  bc                                          ; $60f7: $03
	ld   bc, $6f54                                   ; $60f8: $01 $54 $6f
	jr   nz, $72                                     ; $60fb: $20 $72

	ld   h, l                                        ; $60fd: $65
	ld   h, a                                        ; $60fe: $67
	ld   h, c                                        ; $60ff: $61
	ld   l, c                                        ; $6100: $69
	ld   l, (hl)                                     ; $6101: $6e
	jr   nz, jr_005_6178                             ; $6102: $20 $74

	ld   l, b                                        ; $6104: $68
	ld   h, l                                        ; $6105: $65
	ld   bc, $6542                                   ; $6106: $01 $42 $65
	ld   l, h                                        ; $6109: $6c
	ld   (hl), h                                     ; $610a: $74
	jr   nz, jr_005_617c                             ; $610b: $20 $6f

	ld   h, (hl)                                     ; $610d: $66
	jr   nz, jr_005_6164                             ; $610e: $20 $54

jr_005_6110:
	ld   (hl), d                                     ; $6110: $72
	ld   (hl), l                                     ; $6111: $75
	ld   (hl), h                                     ; $6112: $74
	ld   l, b                                        ; $6113: $68
	inc  l                                           ; $6114: $2c
	ld   bc, $6f59                                   ; $6115: $01 $59 $6f
	ld   (hl), l                                     ; $6118: $75
	jr   nz, jr_005_618e                             ; $6119: $20 $73

	ld   l, b                                        ; $611b: $68
	ld   l, a                                        ; $611c: $6f
	ld   (hl), l                                     ; $611d: $75
	ld   l, h                                        ; $611e: $6c
	ld   h, h                                        ; $611f: $64
	ld   bc, $6573                                   ; $6120: $01 $73 $65
	ld   h, c                                        ; $6123: $61
	ld   (hl), d                                     ; $6124: $72
	ld   h, e                                        ; $6125: $63
	ld   l, b                                        ; $6126: $68
	jr   nz, jr_005_619d                             ; $6127: $20 $74

	ld   l, b                                        ; $6129: $68
	ld   (hl), d                                     ; $612a: $72
	ld   l, a                                        ; $612b: $6f
	ld   (hl), l                                     ; $612c: $75
	ld   h, a                                        ; $612d: $67
	ld   l, b                                        ; $612e: $68
	ld   bc, $6874                                   ; $612f: $01 $74 $68
	ld   h, l                                        ; $6132: $65
	jr   nz, jr_005_61a8                             ; $6133: $20 $73

	ld   l, h                                        ; $6135: $6c
	ld   (hl), l                                     ; $6136: $75
	ld   l, l                                        ; $6137: $6d
	ld   (hl), e                                     ; $6138: $73
	jr   nz, jr_005_61a1                             ; $6139: $20 $66

	ld   l, a                                        ; $613b: $6f

jr_005_613c:
	ld   (hl), d                                     ; $613c: $72
	ld   bc, $2061                                   ; $613d: $01 $61 $20
	ld   (hl), b                                     ; $6140: $70
	ld   h, c                                        ; $6141: $61
	ld   (hl), a                                     ; $6142: $77
	ld   l, (hl)                                     ; $6143: $6e
	jr   nz, jr_005_61b9                             ; $6144: $20 $73

	ld   l, b                                        ; $6146: $68
	ld   l, a                                        ; $6147: $6f
	ld   (hl), b                                     ; $6148: $70
	ld   l, $ff                                      ; $6149: $2e $ff
	ld   b, d                                        ; $614b: $42
	rrca                                             ; $614c: $0f
	cp   $7f                                         ; $614d: $fe $7f
	inc  bc                                          ; $614f: $03
	ld   bc, $6f54                                   ; $6150: $01 $54 $6f
	jr   nz, jr_005_61c7                             ; $6153: $20 $72

	ld   h, l                                        ; $6155: $65

jr_005_6156:
	ld   h, e                                        ; $6156: $63
	ld   l, h                                        ; $6157: $6c
	ld   h, c                                        ; $6158: $61
	ld   l, c                                        ; $6159: $69
	ld   l, l                                        ; $615a: $6d
	jr   nz, jr_005_61d1                             ; $615b: $20 $74

	ld   l, b                                        ; $615d: $68
	ld   h, l                                        ; $615e: $65
	ld   bc, $7242                                   ; $615f: $01 $42 $72
	ld   h, l                                        ; $6162: $65
	ld   h, c                                        ; $6163: $61

jr_005_6164:
	ld   (hl), e                                     ; $6164: $73
	ld   (hl), h                                     ; $6165: $74
	ld   (hl), b                                     ; $6166: $70
	ld   l, h                                        ; $6167: $6c
	ld   h, c                                        ; $6168: $61
	ld   (hl), h                                     ; $6169: $74
	ld   h, l                                        ; $616a: $65
	jr   nz, $6f                                     ; $616b: $20 $6f

	ld   h, (hl)                                     ; $616d: $66
	ld   bc, $6952                                   ; $616e: $01 $52 $69
	ld   h, a                                        ; $6171: $67
	ld   l, b                                        ; $6172: $68
	ld   (hl), h                                     ; $6173: $74
	ld   h, l                                        ; $6174: $65
	ld   l, a                                        ; $6175: $6f
	ld   (hl), l                                     ; $6176: $75
	ld   (hl), e                                     ; $6177: $73

jr_005_6178:
	ld   l, (hl)                                     ; $6178: $6e
	ld   h, l                                        ; $6179: $65
	ld   (hl), e                                     ; $617a: $73
	ld   (hl), e                                     ; $617b: $73

jr_005_617c:
	inc  l                                           ; $617c: $2c
	ld   bc, $6f67                                   ; $617d: $01 $67 $6f

Jump_005_6180:
	jr   nz, jr_005_61f6                             ; $6180: $20 $74

	ld   l, a                                        ; $6182: $6f
	jr   nz, $74                                     ; $6183: $20 $74

	ld   l, b                                        ; $6185: $68
	ld   h, l                                        ; $6186: $65
	ld   bc, $6170                                   ; $6187: $01 $70 $61
	ld   (hl), a                                     ; $618a: $77
	ld   l, (hl)                                     ; $618b: $6e
	jr   nz, jr_005_6201                             ; $618c: $20 $73

jr_005_618e:
	ld   l, b                                        ; $618e: $68
	ld   l, a                                        ; $618f: $6f
	ld   (hl), b                                     ; $6190: $70
	jr   nz, $69                                     ; $6191: $20 $69

	ld   l, (hl)                                     ; $6193: $6e
	ld   bc, $6874                                   ; $6194: $01 $74 $68
	ld   h, l                                        ; $6197: $65
	jr   nz, jr_005_620d                             ; $6198: $20 $73

	ld   l, h                                        ; $619a: $6c
	ld   (hl), l                                     ; $619b: $75
	ld   l, l                                        ; $619c: $6d

jr_005_619d:
	ld   (hl), e                                     ; $619d: $73
	ld   l, $ff                                      ; $619e: $2e $ff
	ld   b, d                                        ; $61a0: $42

jr_005_61a1:
	rrca                                             ; $61a1: $0f
	cp   $7f                                         ; $61a2: $fe $7f
	ld   (bc), a                                     ; $61a4: $02
	nop                                              ; $61a5: $00
	ld   b, (hl)                                     ; $61a6: $46
	ld   l, c                                        ; $61a7: $69

jr_005_61a8:
	ld   l, (hl)                                     ; $61a8: $6e
	ld   h, h                                        ; $61a9: $64
	ld   l, c                                        ; $61aa: $69
	ld   l, (hl)                                     ; $61ab: $6e
	ld   h, a                                        ; $61ac: $67
	jr   nz, $74                                     ; $61ad: $20 $74

	ld   l, b                                        ; $61af: $68
	ld   h, l                                        ; $61b0: $65
	ld   bc, $7242                                   ; $61b1: $01 $42 $72
	ld   h, l                                        ; $61b4: $65
	ld   h, c                                        ; $61b5: $61
	ld   (hl), e                                     ; $61b6: $73
	ld   (hl), h                                     ; $61b7: $74
	ld   (hl), b                                     ; $61b8: $70

jr_005_61b9:
	ld   l, h                                        ; $61b9: $6c
	ld   h, c                                        ; $61ba: $61
	ld   (hl), h                                     ; $61bb: $74
	ld   h, l                                        ; $61bc: $65
	jr   nz, jr_005_622e                             ; $61bd: $20 $6f

	ld   h, (hl)                                     ; $61bf: $66
	ld   bc, $6952                                   ; $61c0: $01 $52 $69
	ld   h, a                                        ; $61c3: $67
	ld   l, b                                        ; $61c4: $68
	ld   (hl), h                                     ; $61c5: $74
	ld   h, l                                        ; $61c6: $65

jr_005_61c7:
	ld   l, a                                        ; $61c7: $6f
	ld   (hl), l                                     ; $61c8: $75
	ld   (hl), e                                     ; $61c9: $73
	ld   l, (hl)                                     ; $61ca: $6e
	ld   h, l                                        ; $61cb: $65
	ld   (hl), e                                     ; $61cc: $73
	ld   (hl), e                                     ; $61cd: $73
	ld   bc, $6f77                                   ; $61ce: $01 $77 $6f

jr_005_61d1:
	ld   (hl), l                                     ; $61d1: $75
	ld   l, h                                        ; $61d2: $6c
	ld   h, h                                        ; $61d3: $64
	jr   nz, jr_005_6248                             ; $61d4: $20 $72

	ld   h, l                                        ; $61d6: $65
	ld   h, c                                        ; $61d7: $61
	ld   l, h                                        ; $61d8: $6c
	ld   l, h                                        ; $61d9: $6c
	ld   a, c                                        ; $61da: $79
	ld   bc, $6568                                   ; $61db: $01 $68 $65
	ld   l, h                                        ; $61de: $6c
	ld   (hl), b                                     ; $61df: $70
	ld   l, $20                                      ; $61e0: $2e $20
	ld   c, c                                        ; $61e2: $49
	ld   (hl), h                                     ; $61e3: $74
	jr   nz, $69                                     ; $61e4: $20 $69

	ld   (hl), e                                     ; $61e6: $73
	jr   nz, $69                                     ; $61e7: $20 $69

	ld   l, (hl)                                     ; $61e9: $6e
	ld   bc, $2061                                   ; $61ea: $01 $61 $20
	ld   l, h                                        ; $61ed: $6c
	ld   l, a                                        ; $61ee: $6f
	ld   h, e                                        ; $61ef: $63
	ld   l, e                                        ; $61f0: $6b
	ld   h, l                                        ; $61f1: $65
	ld   h, h                                        ; $61f2: $64
	jr   nz, jr_005_6267                             ; $61f3: $20 $72

	ld   l, a                                        ; $61f5: $6f

jr_005_61f6:
	ld   l, a                                        ; $61f6: $6f
	ld   l, l                                        ; $61f7: $6d
	ld   bc, $6e69                                   ; $61f8: $01 $69 $6e
	jr   nz, jr_005_6271                             ; $61fb: $20 $74

	ld   l, b                                        ; $61fd: $68
	ld   h, l                                        ; $61fe: $65
	jr   nz, $64                                     ; $61ff: $20 $64

jr_005_6201:
	ld   l, a                                        ; $6201: $6f
	ld   (hl), a                                     ; $6202: $77
	ld   l, (hl)                                     ; $6203: $6e
	ld   (hl), h                                     ; $6204: $74
	ld   l, a                                        ; $6205: $6f
	ld   (hl), a                                     ; $6206: $77
	ld   l, (hl)                                     ; $6207: $6e
	ld   bc, $7261                                   ; $6208: $01 $61 $72
	ld   h, l                                        ; $620b: $65
	ld   h, c                                        ; $620c: $61

jr_005_620d:
	ld   l, $ff                                      ; $620d: $2e $ff
	ld   b, d                                        ; $620f: $42
	rrca                                             ; $6210: $0f
	cp   $7f                                         ; $6211: $fe $7f
	ld   bc, $4901                                   ; $6213: $01 $01 $49
	ld   h, (hl)                                     ; $6216: $66
	jr   nz, jr_005_6292                             ; $6217: $20 $79

	ld   l, a                                        ; $6219: $6f
	ld   (hl), l                                     ; $621a: $75
	jr   nz, $73                                     ; $621b: $20 $73

	ld   h, l                                        ; $621d: $65
	ld   h, c                                        ; $621e: $61
	ld   (hl), d                                     ; $621f: $72
	ld   h, e                                        ; $6220: $63
	ld   l, b                                        ; $6221: $68
	ld   bc, $6572                                   ; $6222: $01 $72 $65
	ld   h, c                                        ; $6225: $61
	ld   l, h                                        ; $6226: $6c
	ld   l, h                                        ; $6227: $6c
	ld   a, c                                        ; $6228: $79
	jr   nz, jr_005_628e                             ; $6229: $20 $63

	ld   h, c                                        ; $622b: $61
	ld   (hl), d                                     ; $622c: $72
	ld   h, l                                        ; $622d: $65

jr_005_622e:
	dec  l                                           ; $622e: $2d
	ld   bc, $7566                                   ; $622f: $01 $66 $75
	ld   l, h                                        ; $6232: $6c
	ld   l, h                                        ; $6233: $6c
	ld   a, c                                        ; $6234: $79
	inc  l                                           ; $6235: $2c
	jr   nz, jr_005_62b1                             ; $6236: $20 $79

	ld   l, a                                        ; $6238: $6f
	ld   (hl), l                                     ; $6239: $75
	ld   bc, $6977                                   ; $623a: $01 $77 $69
	ld   l, h                                        ; $623d: $6c
	ld   l, h                                        ; $623e: $6c
	jr   nz, jr_005_62a7                             ; $623f: $20 $66

	ld   l, c                                        ; $6241: $69
	ld   l, (hl)                                     ; $6242: $6e
	ld   h, h                                        ; $6243: $64
	jr   nz, jr_005_62ba                             ; $6244: $20 $74

	ld   l, b                                        ; $6246: $68
	ld   h, l                                        ; $6247: $65

jr_005_6248:
	ld   bc, $6f42                                   ; $6248: $01 $42 $6f
	ld   l, a                                        ; $624b: $6f
	ld   (hl), h                                     ; $624c: $74
	ld   (hl), e                                     ; $624d: $73
	jr   nz, $6f                                     ; $624e: $20 $6f

	ld   h, (hl)                                     ; $6250: $66
	jr   nz, jr_005_62c7                             ; $6251: $20 $74

	ld   l, b                                        ; $6253: $68
	ld   h, l                                        ; $6254: $65
	ld   bc, $6f47                                   ; $6255: $01 $47 $6f
	ld   (hl), e                                     ; $6258: $73
	ld   (hl), b                                     ; $6259: $70
	ld   h, l                                        ; $625a: $65
	ld   l, h                                        ; $625b: $6c
	jr   nz, jr_005_62c7                             ; $625c: $20 $69

	ld   l, (hl)                                     ; $625e: $6e
	jr   nz, jr_005_62d5                             ; $625f: $20 $74

	ld   l, b                                        ; $6261: $68
	ld   h, l                                        ; $6262: $65
	ld   bc, $6157                                   ; $6263: $01 $57 $61
	ld   (hl), d                                     ; $6266: $72

jr_005_6267:
	ld   h, l                                        ; $6267: $65
	ld   l, b                                        ; $6268: $68
	ld   l, a                                        ; $6269: $6f
	ld   (hl), l                                     ; $626a: $75
	ld   (hl), e                                     ; $626b: $73
	ld   h, l                                        ; $626c: $65
	ld   bc, $6573                                   ; $626d: $01 $73 $65
	ld   h, e                                        ; $6270: $63

jr_005_6271:
	ld   (hl), h                                     ; $6271: $74
	ld   l, c                                        ; $6272: $69
	ld   l, a                                        ; $6273: $6f
	ld   l, (hl)                                     ; $6274: $6e
	jr   nz, $6f                                     ; $6275: $20 $6f

	ld   h, (hl)                                     ; $6277: $66
	jr   nz, $74                                     ; $6278: $20 $74

	ld   l, b                                        ; $627a: $68
	ld   h, l                                        ; $627b: $65
	ld   bc, $6963                                   ; $627c: $01 $63 $69
	ld   (hl), h                                     ; $627f: $74
	ld   a, c                                        ; $6280: $79
	ld   l, $ff                                      ; $6281: $2e $ff
	ld   b, d                                        ; $6283: $42
	rrca                                             ; $6284: $0f
	cp   $7f                                         ; $6285: $fe $7f
	ld   bc, $5401                                   ; $6287: $01 $01 $54
	ld   l, a                                        ; $628a: $6f
	jr   nz, jr_005_62f4                             ; $628b: $20 $67

	ld   h, l                                        ; $628d: $65

jr_005_628e:
	ld   (hl), h                                     ; $628e: $74
	jr   nz, jr_005_6305                             ; $628f: $20 $74

	ld   l, b                                        ; $6291: $68

jr_005_6292:
	ld   h, l                                        ; $6292: $65
	ld   bc, $6172                                   ; $6293: $01 $72 $61
	ld   h, (hl)                                     ; $6296: $66
	ld   (hl), h                                     ; $6297: $74
	jr   nz, jr_005_6303                             ; $6298: $20 $69

	ld   l, (hl)                                     ; $629a: $6e
	jr   nz, jr_005_6311                             ; $629b: $20 $74

	ld   l, b                                        ; $629d: $68
	ld   h, l                                        ; $629e: $65
	ld   bc, $6170                                   ; $629f: $01 $70 $61
	ld   (hl), d                                     ; $62a2: $72
	ld   l, e                                        ; $62a3: $6b
	jr   nz, $79                                     ; $62a4: $20 $79

	ld   l, a                                        ; $62a6: $6f

jr_005_62a7:
	ld   (hl), l                                     ; $62a7: $75
	jr   nz, jr_005_6321                             ; $62a8: $20 $77

	ld   l, c                                        ; $62aa: $69
	ld   l, h                                        ; $62ab: $6c
	ld   l, h                                        ; $62ac: $6c
	ld   bc, $656e                                   ; $62ad: $01 $6e $65
	ld   h, l                                        ; $62b0: $65

jr_005_62b1:
	ld   h, h                                        ; $62b1: $64
	jr   nz, $74                                     ; $62b2: $20 $74

	ld   l, b                                        ; $62b4: $68
	ld   h, l                                        ; $62b5: $65
	ld   bc, $614a                                   ; $62b6: $01 $4a $61
	ld   (hl), a                                     ; $62b9: $77

jr_005_62ba:
	ld   h, d                                        ; $62ba: $62
	ld   l, a                                        ; $62bb: $6f
	ld   l, (hl)                                     ; $62bc: $6e
	ld   h, l                                        ; $62bd: $65
	jr   nz, jr_005_632f                             ; $62be: $20 $6f

	ld   h, (hl)                                     ; $62c0: $66
	ld   bc, $6153                                   ; $62c1: $01 $53 $61
	ld   l, l                                        ; $62c4: $6d
	ld   (hl), e                                     ; $62c5: $73
	ld   l, a                                        ; $62c6: $6f

jr_005_62c7:
	ld   l, (hl)                                     ; $62c7: $6e
	ld   l, $20                                      ; $62c8: $2e $20
	ld   c, c                                        ; $62ca: $49
	ld   (hl), h                                     ; $62cb: $74
	ld   bc, $6163                                   ; $62cc: $01 $63 $61
	ld   l, (hl)                                     ; $62cf: $6e
	jr   nz, $62                                     ; $62d0: $20 $62

	ld   h, l                                        ; $62d2: $65
	jr   nz, jr_005_633b                             ; $62d3: $20 $66

jr_005_62d5:
	ld   l, a                                        ; $62d5: $6f
	ld   (hl), l                                     ; $62d6: $75
	ld   l, (hl)                                     ; $62d7: $6e
	ld   h, h                                        ; $62d8: $64
	ld   bc, $6e69                                   ; $62d9: $01 $69 $6e
	jr   nz, jr_005_633f                             ; $62dc: $20 $61

	jr   nz, jr_005_634c                             ; $62de: $20 $6c

	ld   l, a                                        ; $62e0: $6f
	ld   h, e                                        ; $62e1: $63
	ld   l, e                                        ; $62e2: $6b
	ld   h, l                                        ; $62e3: $65
	ld   h, h                                        ; $62e4: $64
	ld   bc, $6f72                                   ; $62e5: $01 $72 $6f
	ld   l, a                                        ; $62e8: $6f
	ld   l, l                                        ; $62e9: $6d
	jr   nz, $69                                     ; $62ea: $20 $69

	ld   l, (hl)                                     ; $62ec: $6e
	jr   nz, jr_005_6363                             ; $62ed: $20 $74

	ld   l, b                                        ; $62ef: $68
	ld   h, l                                        ; $62f0: $65
	ld   bc, $6873                                   ; $62f1: $01 $73 $68

jr_005_62f4:
	ld   l, c                                        ; $62f4: $69
	ld   (hl), b                                     ; $62f5: $70
	ld   a, c                                        ; $62f6: $79
	ld   h, c                                        ; $62f7: $61
	ld   (hl), d                                     ; $62f8: $72
	ld   h, h                                        ; $62f9: $64
	ld   l, $ff                                      ; $62fa: $2e $ff
	ld   b, d                                        ; $62fc: $42
	rrca                                             ; $62fd: $0f
	cp   $7f                                         ; $62fe: $fe $7f
	ld   bc, $4e01                                   ; $6300: $01 $01 $4e

jr_005_6303:
	ld   l, a                                        ; $6303: $6f
	ld   (hl), a                                     ; $6304: $77

jr_005_6305:
	jr   nz, $74                                     ; $6305: $20 $74

	ld   l, b                                        ; $6307: $68
	ld   h, c                                        ; $6308: $61
	ld   (hl), h                                     ; $6309: $74
	jr   nz, jr_005_6385                             ; $630a: $20 $79

	ld   l, a                                        ; $630c: $6f
	ld   (hl), l                                     ; $630d: $75
	ld   bc, $6f66                                   ; $630e: $01 $66 $6f

jr_005_6311:
	ld   (hl), l                                     ; $6311: $75
	ld   l, (hl)                                     ; $6312: $6e
	ld   h, h                                        ; $6313: $64
	jr   nz, $74                                     ; $6314: $20 $74

	ld   l, b                                        ; $6316: $68
	ld   h, l                                        ; $6317: $65
	jr   nz, jr_005_6364                             ; $6318: $20 $4a

	ld   h, c                                        ; $631a: $61
	ld   (hl), a                                     ; $631b: $77
	dec  l                                           ; $631c: $2d
	ld   bc, $6f62                                   ; $631d: $01 $62 $6f
	ld   l, (hl)                                     ; $6320: $6e

jr_005_6321:
	ld   h, l                                        ; $6321: $65
	inc  l                                           ; $6322: $2c
	jr   nz, jr_005_638c                             ; $6323: $20 $67

	ld   h, l                                        ; $6325: $65
	ld   (hl), h                                     ; $6326: $74
	jr   nz, jr_005_639d                             ; $6327: $20 $74

	ld   l, b                                        ; $6329: $68
	ld   h, l                                        ; $632a: $65
	ld   bc, $6172                                   ; $632b: $01 $72 $61
	ld   h, (hl)                                     ; $632e: $66

jr_005_632f:
	ld   (hl), h                                     ; $632f: $74
	jr   nz, jr_005_639b                             ; $6330: $20 $69

	ld   l, (hl)                                     ; $6332: $6e
	jr   nz, jr_005_63a9                             ; $6333: $20 $74

	ld   l, b                                        ; $6335: $68
	ld   h, l                                        ; $6336: $65
	ld   bc, $6170                                   ; $6337: $01 $70 $61
	ld   (hl), d                                     ; $633a: $72

jr_005_633b:
	ld   l, e                                        ; $633b: $6b
	ld   l, $20                                      ; $633c: $2e $20
	ld   d, h                                        ; $633e: $54

jr_005_633f:
	ld   l, b                                        ; $633f: $68
	ld   h, l                                        ; $6340: $65
	ld   bc, $616a                                   ; $6341: $01 $6a $61
	ld   (hl), a                                     ; $6344: $77
	ld   h, d                                        ; $6345: $62
	ld   l, a                                        ; $6346: $6f
	ld   l, (hl)                                     ; $6347: $6e
	ld   h, l                                        ; $6348: $65
	jr   nz, jr_005_63ac                             ; $6349: $20 $61

	ld   l, h                                        ; $634b: $6c

jr_005_634c:
	ld   (hl), e                                     ; $634c: $73
	ld   l, a                                        ; $634d: $6f
	ld   bc, $6970                                   ; $634e: $01 $70 $69
	ld   h, e                                        ; $6351: $63
	ld   l, e                                        ; $6352: $6b
	ld   (hl), e                                     ; $6353: $73
	jr   nz, jr_005_63cb                             ; $6354: $20 $75

	ld   (hl), b                                     ; $6356: $70
	ld   bc, $7073                                   ; $6357: $01 $73 $70
	ld   l, c                                        ; $635a: $69
	ld   (hl), d                                     ; $635b: $72
	ld   l, c                                        ; $635c: $69
	ld   (hl), h                                     ; $635d: $74
	jr   nz, jr_005_63d0                             ; $635e: $20 $70

	ld   l, a                                        ; $6360: $6f
	ld   l, c                                        ; $6361: $69
	ld   l, (hl)                                     ; $6362: $6e

jr_005_6363:
	ld   (hl), h                                     ; $6363: $74

jr_005_6364:
	ld   (hl), e                                     ; $6364: $73
	ld   bc, $6e61                                   ; $6365: $01 $61 $6e
	ld   h, h                                        ; $6368: $64
	jr   nz, jr_005_63d3                             ; $6369: $20 $68

	ld   h, l                                        ; $636b: $65
	ld   h, c                                        ; $636c: $61
	ld   l, h                                        ; $636d: $6c
	ld   (hl), h                                     ; $636e: $74
	ld   l, b                                        ; $636f: $68
	ld   l, $ff                                      ; $6370: $2e $ff
	ld   b, d                                        ; $6372: $42
	rrca                                             ; $6373: $0f
	cp   $7f                                         ; $6374: $fe $7f
	ld   (bc), a                                     ; $6376: $02
	ld   bc, $7449                                   ; $6377: $01 $49 $74
	jr   nz, $6c                                     ; $637a: $20 $6c

	ld   l, a                                        ; $637c: $6f
	ld   l, a                                        ; $637d: $6f
	ld   l, e                                        ; $637e: $6b
	ld   (hl), e                                     ; $637f: $73
	jr   nz, jr_005_63ee                             ; $6380: $20 $6c

	ld   l, c                                        ; $6382: $69
	ld   l, e                                        ; $6383: $6b
	ld   h, l                                        ; $6384: $65

jr_005_6385:
	ld   bc, $6f79                                   ; $6385: $01 $79 $6f
	ld   (hl), l                                     ; $6388: $75
	jr   nz, $73                                     ; $6389: $20 $73

	ld   (hl), h                                     ; $638b: $74

jr_005_638c:
	ld   l, c                                        ; $638c: $69
	ld   l, h                                        ; $638d: $6c
	ld   l, h                                        ; $638e: $6c
	jr   nz, $6c                                     ; $638f: $20 $6c

	ld   h, c                                        ; $6391: $61
	ld   h, e                                        ; $6392: $63
	ld   l, e                                        ; $6393: $6b
	ld   bc, $6874                                   ; $6394: $01 $74 $68
	ld   h, l                                        ; $6397: $65
	jr   nz, $48                                     ; $6398: $20 $48

	ld   h, l                                        ; $639a: $65

jr_005_639b:
	ld   l, h                                        ; $639b: $6c
	ld   l, l                                        ; $639c: $6d

jr_005_639d:
	ld   h, l                                        ; $639d: $65
	ld   (hl), h                                     ; $639e: $74
	jr   nz, $6f                                     ; $639f: $20 $6f

	ld   h, (hl)                                     ; $63a1: $66
	ld   bc, $6153                                   ; $63a2: $01 $53 $61
	ld   l, h                                        ; $63a5: $6c
	.db  $76                                         ; $63a6: $76
	ld   h, c                                        ; $63a7: $61
	ld   (hl), h                                     ; $63a8: $74

jr_005_63a9:
	ld   l, c                                        ; $63a9: $69
	ld   l, a                                        ; $63aa: $6f
	ld   l, (hl)                                     ; $63ab: $6e

jr_005_63ac:
	ld   l, $20                                      ; $63ac: $2e $20
	ld   e, c                                        ; $63ae: $59
	ld   l, a                                        ; $63af: $6f
	ld   (hl), l                                     ; $63b0: $75
	ld   bc, $696d                                   ; $63b1: $01 $6d $69
	ld   h, a                                        ; $63b4: $67
	ld   l, b                                        ; $63b5: $68
	ld   (hl), h                                     ; $63b6: $74
	jr   nz, $74                                     ; $63b7: $20 $74

	ld   (hl), d                                     ; $63b9: $72
	ld   a, c                                        ; $63ba: $79
	ld   bc, $6f6c                                   ; $63bb: $01 $6c $6f
	ld   l, a                                        ; $63be: $6f
	ld   l, e                                        ; $63bf: $6b
	ld   l, c                                        ; $63c0: $69
	ld   l, (hl)                                     ; $63c1: $6e
	ld   h, a                                        ; $63c2: $67
	jr   nz, jr_005_642e                             ; $63c3: $20 $69

	ld   l, (hl)                                     ; $63c5: $6e
	jr   nz, $61                                     ; $61c6: $20 $61

	ld   bc, $6163                                   ; $63c8: $01 $63 $61

jr_005_63cb:
	.db  $76                                         ; $63cb: $76
	ld   h, l                                        ; $63cc: $65
	jr   nz, jr_005_6438                             ; $63cd: $20 $69

	ld   l, (hl)                                     ; $63cf: $6e

jr_005_63d0:
	jr   nz, jr_005_6446                             ; $63d0: $20 $74

	ld   l, b                                        ; $63d2: $68

jr_005_63d3:
	ld   h, l                                        ; $63d3: $65
	ld   bc, $6f77                                   ; $63d4: $01 $77 $6f
	ld   l, a                                        ; $63d7: $6f
	ld   h, h                                        ; $63d8: $64
	ld   (hl), e                                     ; $63d9: $73
	ld   l, $ff                                      ; $63da: $2e $ff
	ld   b, d                                        ; $63dc: $42
	ld   e, $fe                                      ; $63dd: $1e $fe
	.db  $fd                                         ; $63df: $fd
	ld   (bc), a                                     ; $63e0: $02
	ld   bc, $6157                                   ; $63e1: $01 $57 $61
	ld   (hl), h                                     ; $63e4: $74
	ld   h, e                                        ; $63e5: $63
	ld   l, b                                        ; $63e6: $68
	jr   nz, $6f                                     ; $63e7: $20 $6f

	ld   (hl), l                                     ; $63e9: $75
	ld   (hl), h                                     ; $63ea: $74
	jr   nz, $66                                     ; $63eb: $20 $66

	ld   l, a                                        ; $63ed: $6f

jr_005_63ee:
	ld   (hl), d                                     ; $63ee: $72
	ld   bc, $6874                                   ; $63ef: $01 $74 $68
	ld   h, l                                        ; $63f2: $65
	jr   nz, jr_005_6457                             ; $63f3: $20 $62

	ld   h, l                                        ; $63f5: $65
	ld   h, l                                        ; $63f6: $65
	ld   (hl), e                                     ; $63f7: $73
	jr   nz, $61                                     ; $61f8: $20 $61

	ld   l, (hl)                                     ; $63fa: $6e
	ld   h, h                                        ; $63fb: $64
	ld   bc, $616d                                   ; $63fc: $01 $6d $61
	ld   l, e                                        ; $63ff: $6b
	ld   h, l                                        ; $6400: $65
	jr   nz, $73                                     ; $6401: $20 $73

	ld   (hl), l                                     ; $6403: $75
	ld   (hl), d                                     ; $6404: $72
	ld   h, l                                        ; $6405: $65
	jr   nz, jr_005_6481                             ; $6406: $20 $79

	ld   l, a                                        ; $6408: $6f
	ld   (hl), l                                     ; $6409: $75
	ld   bc, $6168                                   ; $640a: $01 $68 $61
	.db  $76                                         ; $640d: $76
	ld   h, l                                        ; $640e: $65
	jr   nz, jr_005_6464                             ; $640f: $20 $53

	ld   h, c                                        ; $6411: $61
	ld   l, l                                        ; $6412: $6d
	ld   (hl), e                                     ; $6413: $73
	ld   l, a                                        ; $6414: $6f
	ld   l, (hl)                                     ; $6415: $6e
	daa                                              ; $6416: $27
	ld   (hl), e                                     ; $6417: $73
	ld   bc, $614a                                   ; $6418: $01 $4a $61
	ld   (hl), a                                     ; $641b: $77
	ld   h, d                                        ; $641c: $62
	ld   l, a                                        ; $641d: $6f
	ld   l, (hl)                                     ; $641e: $6e
	ld   h, l                                        ; $641f: $65
	jr   nz, jr_005_6483                             ; $6420: $20 $61

	ld   h, e                                        ; $6422: $63
	ld   (hl), h                                     ; $6423: $74
	ld   l, c                                        ; $6424: $69
	.db  $76                                         ; $6425: $76
	ld   h, l                                        ; $6426: $65
	ld   bc, $6877                                   ; $6427: $01 $77 $68
	ld   h, l                                        ; $642a: $65
	ld   l, (hl)                                     ; $642b: $6e
	jr   nz, jr_005_64a7                             ; $642c: $20 $79

jr_005_642e:
	ld   l, a                                        ; $642e: $6f
	ld   (hl), l                                     ; $642f: $75
	ld   bc, $6e65                                   ; $6430: $01 $65 $6e
	ld   (hl), h                                     ; $6433: $74
	ld   h, l                                        ; $6434: $65
	ld   (hl), d                                     ; $6435: $72
	jr   nz, $74                                     ; $6436: $20 $74

jr_005_6438:
	ld   l, b                                        ; $6438: $68
	ld   h, l                                        ; $6439: $65
	ld   bc, $6163                                   ; $643a: $01 $63 $61
	.db  $76                                         ; $643d: $76
	ld   h, l                                        ; $643e: $65

Jump_005_643f:
	ld   l, $ff                                      ; $643f: $2e $ff
	ld   b, d                                        ; $6441: $42
	rrca                                             ; $6442: $0f
	cp   $7f                                         ; $6443: $fe $7f
	ld   (bc), a                                     ; $6445: $02

jr_005_6446:
	ld   bc, $6854                                   ; $6446: $01 $54 $68
	ld   h, l                                        ; $6449: $65
	jr   nz, jr_005_64b9                             ; $644a: $20 $6d

	ld   l, c                                        ; $644c: $69
	ld   h, a                                        ; $644d: $67
	ld   l, b                                        ; $644e: $68
	ld   (hl), h                                     ; $644f: $74
	ld   a, c                                        ; $6450: $79
	ld   bc, $7753                                   ; $6451: $01 $53 $77
	ld   l, a                                        ; $6454: $6f
	ld   (hl), d                                     ; $6455: $72
	ld   h, h                                        ; $6456: $64

jr_005_6457:
	jr   nz, jr_005_64c8                             ; $6457: $20 $6f

	ld   h, (hl)                                     ; $6459: $66
	jr   nz, jr_005_64d0                             ; $645a: $20 $74

	ld   l, b                                        ; $645c: $68
	ld   h, l                                        ; $645d: $65
	ld   bc, $7053                                   ; $645e: $01 $53 $70
	ld   l, c                                        ; $6461: $69
	ld   (hl), d                                     ; $6462: $72
	ld   l, c                                        ; $6463: $69

jr_005_6464:
	ld   (hl), h                                     ; $6464: $74
	jr   nz, jr_005_64d0                             ; $6465: $20 $69

	ld   (hl), e                                     ; $6467: $73
	ld   bc, $6968                                   ; $6468: $01 $68 $69
	ld   h, h                                        ; $646b: $64
	ld   h, h                                        ; $646c: $64
	ld   h, l                                        ; $646d: $65
	ld   l, (hl)                                     ; $646e: $6e
	jr   nz, jr_005_64e0                             ; $646f: $20 $6f

	ld   l, (hl)                                     ; $6471: $6e
	jr   nz, jr_005_64d5                             ; $6472: $20 $61

	ld   l, (hl)                                     ; $6474: $6e
	ld   bc, $7369                                   ; $6475: $01 $69 $73
	ld   l, h                                        ; $6478: $6c
	ld   h, c                                        ; $6479: $61
	ld   l, (hl)                                     ; $647a: $6e
	ld   h, h                                        ; $647b: $64
	jr   nz, jr_005_64e0                             ; $647c: $20 $62

	ld   a, c                                        ; $647e: $79
	jr   nz, $74                                     ; $647f: $20 $74

jr_005_6481:
	ld   l, b                                        ; $6481: $68
	ld   h, l                                        ; $6482: $65

jr_005_6483:
	ld   bc, $6562                                   ; $6483: $01 $62 $65
	ld   h, c                                        ; $6486: $61
	ld   h, e                                        ; $6487: $63
	ld   l, b                                        ; $6488: $68
	ld   l, $20                                      ; $6489: $2e $20
	ld   d, l                                        ; $648b: $55
	ld   (hl), e                                     ; $648c: $73
	ld   h, l                                        ; $648d: $65
	ld   bc, $6874                                   ; $648e: $01 $74 $68
	ld   h, l                                        ; $6491: $65
	jr   nz, jr_005_6506                             ; $6492: $20 $72

	ld   h, c                                        ; $6494: $61
	ld   h, (hl)                                     ; $6495: $66
	ld   (hl), h                                     ; $6496: $74
	jr   nz, jr_005_650d                             ; $6497: $20 $74

	ld   l, a                                        ; $6499: $6f
	ld   bc, $6567                                   ; $649a: $01 $67 $65
	ld   (hl), h                                     ; $649d: $74
	jr   nz, $74                                     ; $649e: $20 $74

	ld   l, b                                        ; $64a0: $68
	ld   h, l                                        ; $64a1: $65
	ld   (hl), d                                     ; $64a2: $72
	ld   h, l                                        ; $64a3: $65
	ld   l, $ff                                      ; $64a4: $2e $ff
	ld   b, d                                        ; $64a6: $42

jr_005_64a7:
	rrca                                             ; $64a7: $0f
	cp   $7f                                         ; $64a8: $fe $7f
	ld   bc, $5402                                   ; $64aa: $01 $02 $54
	ld   l, b                                        ; $64ad: $68
	ld   h, l                                        ; $64ae: $65
	jr   nz, $6f                                     ; $64af: $20 $6f

	ld   l, (hl)                                     ; $64b1: $6e
	ld   l, h                                        ; $64b2: $6c
	ld   a, c                                        ; $64b3: $79
	ld   bc, $696d                                   ; $64b4: $01 $6d $69
	ld   (hl), e                                     ; $64b7: $73
	ld   (hl), e                                     ; $64b8: $73

jr_005_64b9:
	ld   l, c                                        ; $64b9: $69
	ld   l, (hl)                                     ; $64ba: $6e
	ld   h, a                                        ; $64bb: $67
	ld   bc, $6970                                   ; $64bc: $01 $70 $69
	ld   h, l                                        ; $64bf: $65
	ld   h, e                                        ; $64c0: $63
	ld   h, l                                        ; $64c1: $65
	jr   nz, jr_005_6533                             ; $64c2: $20 $6f

	ld   h, (hl)                                     ; $64c4: $66
	ld   bc, $7261                                   ; $64c5: $01 $61 $72

jr_005_64c8:
	ld   l, l                                        ; $64c8: $6d
	ld   l, a                                        ; $64c9: $6f
	ld   (hl), d                                     ; $64ca: $72
	jr   nz, jr_005_6536                             ; $64cb: $20 $69

	ld   (hl), e                                     ; $64cd: $73
	jr   nz, jr_005_6544                             ; $64ce: $20 $74

jr_005_64d0:
	ld   l, b                                        ; $64d0: $68
	ld   h, l                                        ; $64d1: $65
	ld   bc, $6853                                   ; $64d2: $01 $53 $68

jr_005_64d5:
	ld   l, c                                        ; $64d5: $69
	ld   h, l                                        ; $64d6: $65
	ld   l, h                                        ; $64d7: $6c
	ld   h, h                                        ; $64d8: $64
	jr   nz, jr_005_654a                             ; $64d9: $20 $6f

	ld   h, (hl)                                     ; $64db: $66
	ld   bc, $6146                                   ; $64dc: $01 $46 $61
	ld   l, c                                        ; $64df: $69

jr_005_64e0:
	ld   (hl), h                                     ; $64e0: $74
	ld   l, b                                        ; $64e1: $68
	ld   l, $20                                      ; $64e2: $2e $20
	ld   c, c                                        ; $64e4: $49
	ld   (hl), h                                     ; $64e5: $74
	ld   bc, $6163                                   ; $64e6: $01 $63 $61
	ld   l, (hl)                                     ; $64e9: $6e
	jr   nz, jr_005_654e                             ; $64ea: $20 $62

	ld   h, l                                        ; $64ec: $65
	jr   nz, jr_005_6555                             ; $64ed: $20 $66

	ld   l, a                                        ; $64ef: $6f
	ld   (hl), l                                     ; $64f0: $75
	ld   l, (hl)                                     ; $64f1: $6e
	ld   h, h                                        ; $64f2: $64
	ld   bc, $6e69                                   ; $64f3: $01 $69 $6e
	jr   nz, jr_005_656c                             ; $64f6: $20 $74

	ld   l, b                                        ; $64f8: $68
	ld   h, l                                        ; $64f9: $65
	jr   nz, jr_005_6540                             ; $64fa: $20 $44

	ld   h, l                                        ; $64fc: $65
	ld   l, l                                        ; $64fd: $6d
	ld   l, a                                        ; $64fe: $6f
	ld   l, (hl)                                     ; $64ff: $6e
	ld   bc, $7453                                   ; $6500: $01 $53 $74
	ld   (hl), d                                     ; $6503: $72
	ld   l, a                                        ; $6504: $6f
	ld   l, (hl)                                     ; $6505: $6e

jr_005_6506:
	ld   h, a                                        ; $6506: $67
	ld   l, b                                        ; $6507: $68
	ld   l, a                                        ; $6508: $6f
	ld   l, h                                        ; $6509: $6c
	ld   h, h                                        ; $650a: $64
	ld   l, $ff                                      ; $650b: $2e $ff

jr_005_650d:
	ld   b, d                                        ; $650d: $42
	ld   e, $fe                                      ; $650e: $1e $fe
	.db  $fd                                         ; $6510: $fd
	ld   (bc), a                                     ; $6511: $02
	ld   bc, $6854                                   ; $6512: $01 $54 $68
	ld   h, l                                        ; $6515: $65
	jr   nz, jr_005_657d                             ; $6516: $20 $65

	ld   l, (hl)                                     ; $6518: $6e
	ld   (hl), h                                     ; $6519: $74
	ld   (hl), d                                     ; $651a: $72
	ld   h, c                                        ; $651b: $61
	ld   l, (hl)                                     ; $651c: $6e
	ld   h, e                                        ; $651d: $63
	ld   h, l                                        ; $651e: $65
	ld   bc, $6f74                                   ; $651f: $01 $74 $6f
	jr   nz, jr_005_6598                             ; $6522: $20 $74

	ld   l, b                                        ; $6524: $68
	ld   h, l                                        ; $6525: $65
	jr   nz, jr_005_659b                             ; $6526: $20 $73

	ld   (hl), h                                     ; $6528: $74
	ld   (hl), d                                     ; $6529: $72
	ld   l, a                                        ; $652a: $6f
	ld   l, (hl)                                     ; $652b: $6e
	ld   h, a                                        ; $652c: $67
	dec  l                                           ; $652d: $2d
	ld   bc, $6f68                                   ; $652e: $01 $68 $6f
	ld   l, h                                        ; $6531: $6c
	ld   h, h                                        ; $6532: $64

jr_005_6533:
	jr   nz, jr_005_659e                             ; $6533: $20 $69

	ld   (hl), e                                     ; $6535: $73

jr_005_6536:
	jr   nz, jr_005_65a1                             ; $6536: $20 $69

	ld   l, (hl)                                     ; $6538: $6e
	jr   nz, jr_005_65af                             ; $6539: $20 $74

	ld   l, b                                        ; $653b: $68
	ld   h, l                                        ; $653c: $65
	ld   bc, $6f73                                   ; $653d: $01 $73 $6f

jr_005_6540:
	ld   (hl), l                                     ; $6540: $75
	ld   (hl), h                                     ; $6541: $74
	ld   l, b                                        ; $6542: $68
	ld   (hl), a                                     ; $6543: $77

jr_005_6544:
	ld   h, l                                        ; $6544: $65
	ld   (hl), e                                     ; $6545: $73
	ld   (hl), h                                     ; $6546: $74
	ld   bc, $6573                                   ; $6547: $01 $73 $65

jr_005_654a:
	ld   h, e                                        ; $654a: $63
	ld   (hl), h                                     ; $654b: $74
	ld   l, c                                        ; $654c: $69
	ld   l, a                                        ; $654d: $6f

jr_005_654e:
	ld   l, (hl)                                     ; $654e: $6e
	jr   nz, jr_005_65c0                             ; $654f: $20 $6f

	ld   h, (hl)                                     ; $6551: $66
	jr   nz, jr_005_65c8                             ; $6552: $20 $74

	ld   l, b                                        ; $6554: $68

jr_005_6555:
	ld   h, l                                        ; $6555: $65
	ld   bc, $7270                                   ; $6556: $01 $70 $72
	ld   l, c                                        ; $6559: $69
	ld   (hl), e                                     ; $655a: $73
	ld   l, a                                        ; $655b: $6f
	ld   l, (hl)                                     ; $655c: $6e
	ld   l, $20                                      ; $655d: $2e $20
	ld   c, l                                        ; $655f: $4d
	ld   h, c                                        ; $6560: $61
	ld   a, c                                        ; $6561: $79
	ld   bc, $6f47                                   ; $6562: $01 $47 $6f
	ld   h, h                                        ; $6565: $64
	jr   nz, jr_005_65ca                             ; $6566: $20 $62

	ld   h, l                                        ; $6568: $65
	jr   nz, jr_005_65e2                             ; $6569: $20 $77

	ld   l, c                                        ; $656b: $69

jr_005_656c:
	ld   (hl), h                                     ; $656c: $74
	ld   l, b                                        ; $656d: $68
	ld   bc, $6f79                                   ; $656e: $01 $79 $6f
	ld   (hl), l                                     ; $6571: $75
	ld   l, $ff                                      ; $6572: $2e $ff
	ld   b, d                                        ; $6574: $42
	rrca                                             ; $6575: $0f
	cp   $7f                                         ; $6576: $fe $7f
	ld   (bc), a                                     ; $6578: $02
	nop                                              ; $6579: $00
	ld   e, c                                        ; $657a: $59
	ld   l, a                                        ; $657b: $6f
	ld   (hl), l                                     ; $657c: $75

jr_005_657d:
	jr   nz, $68                                     ; $657d: $20 $68

	ld   h, c                                        ; $657f: $61
	.db  $76                                         ; $6580: $76
	ld   h, l                                        ; $6581: $65
	jr   nz, jr_005_65e5                             ; $6582: $20 $61

	ld   l, h                                        ; $6584: $6c
	ld   l, h                                        ; $6585: $6c
	ld   bc, $6973                                   ; $6586: $01 $73 $69
	ld   a, b                                        ; $6589: $78
	jr   nz, $70                                     ; $658a: $20 $70

	ld   l, c                                        ; $658c: $69
	ld   h, l                                        ; $658d: $65
	ld   h, e                                        ; $658e: $63
	ld   h, l                                        ; $658f: $65
	ld   (hl), e                                     ; $6590: $73
	jr   nz, $6f                                     ; $6591: $20 $6f

	ld   h, (hl)                                     ; $6593: $66
	ld   bc, $6874                                   ; $6594: $01 $74 $68
	ld   h, l                                        ; $6597: $65

jr_005_6598:
	jr   nz, jr_005_65db                             ; $6598: $20 $41

	ld   (hl), d                                     ; $659a: $72

jr_005_659b:
	ld   l, l                                        ; $659b: $6d
	ld   l, a                                        ; $659c: $6f
	ld   (hl), d                                     ; $659d: $72

jr_005_659e:
	jr   nz, jr_005_660f                             ; $659e: $20 $6f

	ld   h, (hl)                                     ; $65a0: $66

jr_005_65a1:
	ld   bc, $6f47                                   ; $65a1: $01 $47 $6f
	ld   h, h                                        ; $65a4: $64
	ld   l, $20                                      ; $65a5: $2e $20
	ld   e, c                                        ; $65a7: $59
	ld   l, a                                        ; $65a8: $6f
	ld   (hl), l                                     ; $65a9: $75
	jr   nz, jr_005_6619                             ; $65aa: $20 $6d

	ld   (hl), l                                     ; $65ac: $75
	ld   (hl), e                                     ; $65ad: $73
	ld   (hl), h                                     ; $65ae: $74

jr_005_65af:
	ld   bc, $6f6e                                   ; $65af: $01 $6e $6f
	ld   (hl), a                                     ; $65b2: $77
	jr   nz, $62                                     ; $65b3: $20 $62

	ld   h, l                                        ; $65b5: $65
	jr   nz, $73                                     ; $65b6: $20 $73

	ld   (hl), h                                     ; $65b8: $74
	ld   (hl), d                                     ; $65b9: $72
	ld   l, a                                        ; $65ba: $6f
	ld   l, (hl)                                     ; $65bb: $6e
	ld   h, a                                        ; $65bc: $67
	ld   bc, $6e61                                   ; $65bd: $01 $61 $6e

jr_005_65c0:
	ld   h, h                                        ; $65c0: $64
	jr   nz, jr_005_6627                             ; $65c1: $20 $64

	ld   h, l                                        ; $65c3: $65
	ld   h, (hl)                                     ; $65c4: $66
	ld   h, l                                        ; $65c5: $65
	ld   h, c                                        ; $65c6: $61
	ld   (hl), h                                     ; $65c7: $74

jr_005_65c8:
	jr   nz, jr_005_663e                             ; $65c8: $20 $74

jr_005_65ca:
	ld   l, b                                        ; $65ca: $68
	ld   h, l                                        ; $65cb: $65
	ld   bc, $6f73                                   ; $65cc: $01 $73 $6f
	ld   (hl), l                                     ; $65cf: $75
	ld   (hl), d                                     ; $65d0: $72
	ld   h, e                                        ; $65d1: $63
	ld   h, l                                        ; $65d2: $65
	jr   nz, jr_005_6644                             ; $65d3: $20 $6f

	ld   h, (hl)                                     ; $65d5: $66
	jr   nz, jr_005_663d                             ; $65d6: $20 $65

	.db  $76                                         ; $65d8: $76
	ld   l, c                                        ; $65d9: $69
	ld   l, h                                        ; $65da: $6c

jr_005_65db:
	ld   l, $ff                                      ; $65db: $2e $ff
	ld   b, d                                        ; $65dd: $42
	rrca                                             ; $65de: $0f
	cp   $7f                                         ; $65df: $fe $7f
	inc  l                                           ; $65e1: $2c

jr_005_65e2:
	call z, $f404                                    ; $65e2: $cc $04 $f4

jr_005_65e5:
	ld   h, l                                        ; $65e5: $65
	call z, $ef02                                    ; $65e6: $cc $02 $ef
	ld   h, l                                        ; $65e9: $65
	jp   $0f15                                       ; $65ea: $c3 $15 $0f


	ld   h, (hl)                                     ; $65ed: $66
	nop                                              ; $65ee: $00
	jp   $0f09                                       ; $65ef: $c3 $09 $0f


	ld   h, (hl)                                     ; $65f2: $66
	nop                                              ; $65f3: $00
	add  $32                                         ; $65f4: $c6 $32
	ld   b, $66                                      ; $65f6: $06 $66
	add  $0a                                         ; $65f8: $c6 $0a
	ld   bc, $c366                                   ; $65fa: $01 $66 $c3
	.db  $10                                         ; $65fd: $10
	rrca                                             ; $65fe: $0f
	ld   h, (hl)                                     ; $65ff: $66
	nop                                              ; $6600: $00
	jp   $0f09                                       ; $6601: $c3 $09 $0f


	ld   h, (hl)                                     ; $6604: $66
	nop                                              ; $6605: $00
	add  $c8                                         ; $6606: $c6 $c8
	ld   l, (hl)                                     ; $6608: $6e
	ld   h, (hl)                                     ; $6609: $66
	jp   $0f05                                       ; $660a: $c3 $05 $0f


	ld   h, (hl)                                     ; $660d: $66
	nop                                              ; $660e: $00

jr_005_660f:
	add  l                                           ; $660f: $85
	jr   jr_005_6678                                 ; $6610: $18 $66

	inc  b                                           ; $6612: $04
	rst  $08                                         ; $6613: $cf
	rst  $38                                         ; $6614: $ff
	dec  b                                           ; $6615: $05
	ld   bc, wAnother2x2blockForGameScreenTilesTODO                                   ; $6616: $01 $00 $c3

jr_005_6619:
	add  b                                           ; $6619: $80
	ld   l, $66                                      ; $661a: $2e $66
	jp   $2780                                       ; $661c: $c3 $80 $27


	ld   h, (hl)                                     ; $661f: $66
	add  b                                           ; $6620: $80
	nop                                              ; $6621: $00
	ld   d, b                                        ; $6622: $50
	rlca                                             ; $6623: $07
	add  c                                           ; $6624: $81
	dec  a                                           ; $6625: $3d
	ld   h, (hl)                                     ; $6626: $66

jr_005_6627:
	add  b                                           ; $6627: $80
	ldh  (<$50), a                                   ; $6628: $e0 $50
	ld   ($3d81), sp                                 ; $662a: $08 $81 $3d
	ld   h, (hl)                                     ; $662d: $66
	jp   $3980                                       ; $662e: $c3 $80 $39


	ld   h, (hl)                                     ; $6631: $66
	add  b                                           ; $6632: $80
	ld   (hl), b                                     ; $6633: $70
	nop                                              ; $6634: $00
	ld   b, $81                                      ; $6635: $06 $81
	dec  a                                           ; $6637: $3d
	ld   h, (hl)                                     ; $6638: $66
	add  b                                           ; $6639: $80
	ld   (hl), b                                     ; $663a: $70
	sub  b                                           ; $663b: $90
	dec  b                                           ; $663c: $05

jr_005_663d:
	add  hl, bc                                      ; $663d: $09

jr_005_663e:
	ld   b, a                                        ; $663e: $47
	ld   (bc), a                                     ; $663f: $02
	ld   bc, $0c27                                   ; $6640: $01 $27 $0c
	ld   b, b                                        ; $6643: $40

jr_005_6644:
	jr   jr_005_6686                                 ; $6644: $18 $40

	inc  b                                           ; $6646: $04
	jp   Jump_005_55c0                               ; $6647: $c3 $c0 $55


	ld   h, (hl)                                     ; $664a: $66
	.db  $10                                         ; $664b: $10
	ld   b, b                                        ; $664c: $40
	inc  b                                           ; $664d: $04
	ld   de, $0440                                   ; $664e: $11 $40 $04
	jp   $4b20                                       ; $6651: $c3 $20 $4b


	ld   h, (hl)                                     ; $6654: $66
	jp   $6240                                       ; $6655: $c3 $40 $62


	ld   h, (hl)                                     ; $6658: $66
	jp   Jump_005_6180                               ; $6659: $c3 $80 $61


	ld   h, (hl)                                     ; $665c: $66
	ld   c, $81                                      ; $665d: $0e $81
	ld   h, d                                        ; $665f: $62
	ld   h, (hl)                                     ; $6660: $66
	dec  c                                           ; $6661: $0d
	add  d                                           ; $6662: $82
	ld   l, a                                        ; $6663: $6f
	ld   h, (hl)                                     ; $6664: $66
	jp   nz, $455a                                   ; $6665: $c2 $5a $45

	ld   h, (hl)                                     ; $6668: $66
	ld   b, d                                        ; $6669: $42
	rrca                                             ; $666a: $0f
	add  d                                           ; $666b: $82
	ld   l, a                                        ; $666c: $6f
	ld   h, (hl)                                     ; $666d: $66
	nop                                              ; $666e: $00
	inc  h                                           ; $666f: $24
	add  l                                           ; $6670: $85
	sub  a                                           ; $6671: $97
	ld   h, (hl)                                     ; $6672: $66
	ld   b, c                                        ; $6673: $41
	ld   bc, $058d                                   ; $6674: $01 $8d $05
	ld   a, (bc)                                     ; $6677: $0a

jr_005_6678:
	.db $c3 $c0 $7e


	ld   h, (hl)                                     ; $667b: $66
	ld   b, e                                        ; $667c: $43
	add  (hl)                                        ; $667d: $86
	add  l                                           ; $667e: $85
	sbc  l                                           ; $667f: $9d
	ld   h, (hl)                                     ; $6680: $66
	add  c                                           ; $6681: $81
	ld   a, b                                        ; $6682: $78
	ld   h, (hl)                                     ; $6683: $66
	add  l                                           ; $6684: $85
	sub  a                                           ; $6685: $97

jr_005_6686:
	ld   h, (hl)                                     ; $6686: $66
	ld   b, c                                        ; $6687: $41
	ld   (bc), a                                     ; $6688: $02
	adc  c                                           ; $6689: $89
	ld   a, (bc)                                     ; $668a: $0a
	jr   $12                                         ; $668b: $18 $12

	inc  de                                          ; $668d: $13
	ld   b, e                                        ; $668e: $43
	add  l                                           ; $668f: $85
	add  l                                           ; $6690: $85
	sub  a                                           ; $6691: $97
	ld   h, (hl)                                     ; $6692: $66
	ld   b, d                                        ; $6693: $42
	inc  d                                           ; $6694: $14
	ld   b, e                                        ; $6695: $43
	add  (hl)                                        ; $6696: $86
	inc  c                                           ; $6697: $0c
	ld   b, a                                        ; $6698: $47
	ld   (bc), a                                     ; $6699: $02
	ld   b, h                                        ; $669a: $44
	ld   (bc), a                                     ; $669b: $02
	inc  h                                           ; $669c: $24
	jp   $ad80                                       ; $669d: $c3 $80 $ad


	ld   h, (hl)                                     ; $66a0: $66
	jp   $a980                                       ; $66a1: $c3 $80 $a9


	ld   h, (hl)                                     ; $66a4: $66
	ld   a, (bc)                                     ; $66a5: $0a
	add  c                                           ; $66a6: $81
	xor  (hl)                                        ; $66a7: $ae
	ld   h, (hl)                                     ; $66a8: $66
	dec  bc                                          ; $66a9: $0b
	add  c                                           ; $66aa: $81
	xor  (hl)                                        ; $66ab: $ae
	ld   h, (hl)                                     ; $66ac: $66
	rrca                                             ; $66ad: $0f
	jp   $b580                                       ; $66ae: $c3 $80 $b5


	ld   h, (hl)                                     ; $66b1: $66
	ld   b, b                                        ; $66b2: $40
	jr   nz, jr_005_66d9                             ; $66b3: $20 $24

	jp   $bc80                                       ; $66b5: $c3 $80 $bc


	ld   h, (hl)                                     ; $66b8: $66
	ld   b, b                                        ; $66b9: $40
	ld   b, b                                        ; $66ba: $40
	inc  h                                           ; $66bb: $24
	ld   b, b                                        ; $66bc: $40
	add  b                                           ; $66bd: $80
	inc  h                                           ; $66be: $24
	ld   b, a                                        ; $66bf: $47
	inc  bc                                          ; $66c0: $03
	ld   bc, $2709                                   ; $66c1: $01 $09 $27
	inc  c                                           ; $66c4: $0c
	ld   b, b                                        ; $66c5: $40
	jr   nz, $0f                                     ; $66c6: $20 $0f

	add  c                                           ; $66c8: $81
	push bc                                          ; $66c9: $c5
	ld   h, (hl)                                     ; $66ca: $66
	ld   b, a                                        ; $66cb: $47
	inc  bc                                          ; $66cc: $03
	daa                                              ; $66cd: $27
	inc  c                                           ; $66ce: $0c
	ld   b, b                                        ; $66cf: $40
	.db  $10                                         ; $66d0: $10
	add  d                                           ; $66d1: $82
	sbc  $66                                         ; $66d2: $de $66
	adc  h                                           ; $66d4: $8c
	jp   c, $8166                                    ; $66d5: $da $66 $81

	rst  $08                                         ; $66d8: $cf

jr_005_66d9:
	ld   h, (hl)                                     ; $66d9: $66
	rrca                                             ; $66da: $0f
	add  c                                           ; $66db: $81
	rst  $08                                         ; $66dc: $cf
	ld   h, (hl)                                     ; $66dd: $66
	add  a                                           ; $66de: $87
	ldh  a, (<$66)                                   ; $66df: $f0 $66
	ld   b, b                                        ; $66e1: $40
	.db  $10                                         ; $66e2: $10
	adc  h                                           ; $66e3: $8c
	jp   hl                                          ; $66e4: $e9


	ld   h, (hl)                                     ; $66e5: $66
	add  c                                           ; $66e6: $81
	ld   ($0f66), a                                  ; $66e7: $ea $66 $0f
	add  d                                           ; $66ea: $82
	pop  hl                                          ; $66eb: $e1
	ld   h, (hl)                                     ; $66ec: $66
	add  c                                           ; $66ed: $81
	rst  $08                                         ; $66ee: $cf
	ld   h, (hl)                                     ; $66ef: $66
	inc  b                                           ; $66f0: $04
	dec  b                                           ; $66f1: $05
	ld   d, c                                        ; $66f2: $51
	ld   d, l                                        ; $66f3: $55
	ld   b, c                                        ; $66f4: $41
	ld   b, e                                        ; $66f5: $43
	ld   c, e                                        ; $66f6: $4b
	ld   hl, $42ff                                   ; $66f7: $21 $ff $42
	rrca                                             ; $66fa: $0f
	ld   a, a                                        ; $66fb: $7f
	add  b                                           ; $66fc: $80
	.db  $10                                         ; $66fd: $10
	jr   nz, jr_005_6701                             ; $66fe: $20 $01

	add  hl, bc                                      ; $6700: $09

jr_005_6701:
	rlca                                             ; $6701: $07
	ld   b, c                                        ; $6702: $41
	.db  $10                                         ; $6703: $10
	ld   b, d                                        ; $6704: $42
	ld   bc, $4cc9                                   ; $6705: $01 $c9 $4c
	rrca                                             ; $6708: $0f
	ld   h, a                                        ; $6709: $67
	ld   b, d                                        ; $670a: $42
	ld   bc, $0681                                   ; $670b: $01 $81 $06
	ld   h, a                                        ; $670e: $67
	ld   b, b                                        ; $670f: $40
	.db  $10                                         ; $6710: $10
	jp   nz, $060b                                   ; $6711: $c2 $0b $06

	ld   h, a                                        ; $6714: $67
	sub  c                                           ; $6715: $91
	inc  bc                                          ; $6716: $03
	rst  $38                                         ; $6717: $ff
	rst  $00                                         ; $6718: $c7
	nop                                              ; $6719: $00
	ld   c, $02                                      ; $671a: $0e $02
	rst  $00                                         ; $671c: $c7
	call $020e                                       ; $671d: $cd $0e $02
	nop                                              ; $6720: $00
	rra                                              ; $6721: $1f
	add  e                                           ; $6722: $83
	ld   h, $67                                      ; $6723: $26 $67
	nop                                              ; $6725: $00
	inc  bc                                          ; $6726: $03
	ld   (bc), a                                     ; $6727: $02
	dec  l                                           ; $6728: $2d
	jr   nz, jr_005_677e                             ; $6729: $20 $53

	ld   d, l                                        ; $672b: $55
	ld   d, b                                        ; $672c: $50
	ld   b, l                                        ; $672d: $45
	ld   d, d                                        ; $672e: $52
	jr   nz, jr_005_6784                             ; $672f: $20 $53

	ld   b, l                                        ; $6731: $45
	ld   b, e                                        ; $6732: $43
	ld   d, d                                        ; $6733: $52
	ld   b, l                                        ; $6734: $45
	ld   d, h                                        ; $6735: $54
	jr   nz, jr_005_677a                             ; $6736: $20 $42

	ld   c, a                                        ; $6738: $4f
	ld   c, (hl)                                     ; $6739: $4e
	ld   d, l                                        ; $673a: $55
	ld   d, e                                        ; $673b: $53
	jr   nz, jr_005_6790                             ; $673c: $20 $52

	ld   c, a                                        ; $673e: $4f
	ld   c, a                                        ; $673f: $4f

Jump_005_6740:
	ld   c, l                                        ; $6740: $4d
	jr   nz, $2d                                     ; $6741: $20 $2d

	rst  $38                                         ; $6743: $ff
	dec  b                                           ; $6744: $05
	inc  b                                           ; $6745: $04
	ld   b, a                                        ; $6746: $47
	ld   h, c                                        ; $6747: $61
	ld   l, l                                        ; $6748: $6d
	ld   h, l                                        ; $6749: $65
	jr   nz, jr_005_6790                             ; $674a: $20 $44

	ld   h, l                                        ; $674c: $65
	ld   (hl), e                                     ; $674d: $73
	ld   l, c                                        ; $674e: $69
	ld   h, a                                        ; $674f: $67
	ld   l, (hl)                                     ; $6750: $6e
	jr   nz, jr_005_6779                             ; $6751: $20 $26

	jr   nz, jr_005_67a5                             ; $6753: $20 $50

	ld   (hl), d                                     ; $6755: $72
	ld   l, a                                        ; $6756: $6f
	ld   h, a                                        ; $6757: $67
	ld   (hl), d                                     ; $6758: $72
	ld   h, c                                        ; $6759: $61
	ld   l, l                                        ; $675a: $6d
	ld   l, l                                        ; $675b: $6d
	ld   l, c                                        ; $675c: $69
	ld   l, (hl)                                     ; $675d: $6e
	ld   h, a                                        ; $675e: $67
	rst  $38                                         ; $675f: $ff
	ld   b, $0e                                      ; $6760: $06 $0e
	ld   c, d                                        ; $6762: $4a
	ld   l, c                                        ; $6763: $69
	ld   l, l                                        ; $6764: $6d
	rst  $38                                         ; $6765: $ff
	rlca                                             ; $6766: $07
	dec  c                                           ; $6767: $0d
	ld   d, (hl)                                     ; $6768: $56
	ld   h, c                                        ; $6769: $61
	ld   l, (hl)                                     ; $676a: $6e
	ld   h, e                                        ; $676b: $63
	ld   h, l                                        ; $676c: $65
	rst  $38                                         ; $676d: $ff
	ld   ($260f), sp                                 ; $676e: $08 $0f $26
	rst  $38                                         ; $6771: $ff
	add  hl, bc                                      ; $6772: $09
	inc  c                                           ; $6773: $0c
	ld   b, e                                        ; $6774: $43
	ld   l, b                                        ; $6775: $68
	ld   h, c                                        ; $6776: $61
	ld   (hl), d                                     ; $6777: $72
	ld   l, h                                        ; $6778: $6c

jr_005_6779:
	ld   h, l                                        ; $6779: $65

jr_005_677a:
	ld   (hl), e                                     ; $677a: $73
	rst  $38                                         ; $677b: $ff
	dec  bc                                          ; $677c: $0b
	dec  b                                           ; $677d: $05

jr_005_677e:
	ld   b, c                                        ; $677e: $41
	ld   (hl), d                                     ; $677f: $72
	ld   (hl), h                                     ; $6780: $74
	ld   (hl), a                                     ; $6781: $77
	ld   l, a                                        ; $6782: $6f
	ld   (hl), d                                     ; $6783: $72

jr_005_6784:
	ld   l, e                                        ; $6784: $6b
	jr   nz, jr_005_67e9                             ; $6785: $20 $62

	ld   a, c                                        ; $6787: $79
	jr   nz, jr_005_67fe                             ; $6788: $20 $74

	ld   l, b                                        ; $678a: $68
	ld   h, l                                        ; $678b: $65
	jr   nz, jr_005_67ef                             ; $678c: $20 $61

	ld   l, l                                        ; $678e: $6d
	ld   h, c                                        ; $678f: $61

jr_005_6790:
	ld   a, d                                        ; $6790: $7a
	ld   l, c                                        ; $6791: $69
	ld   l, (hl)                                     ; $6792: $6e
	ld   h, a                                        ; $6793: $67
	rst  $38                                         ; $6794: $ff
	inc  c                                           ; $6795: $0c
	ld   c, $4e                                      ; $6796: $0e $4e
	ld   l, c                                        ; $6798: $69
	ld   l, (hl)                                     ; $6799: $6e
	ld   h, c                                        ; $679a: $61
	rst  $38                                         ; $679b: $ff
	ld   c, $05                                      ; $679c: $0e $05
	ld   c, l                                        ; $679e: $4d
	ld   (hl), l                                     ; $679f: $75
	ld   (hl), e                                     ; $67a0: $73
	ld   l, c                                        ; $67a1: $69
	ld   h, e                                        ; $67a2: $63
	jr   nz, jr_005_67cb                             ; $67a3: $20 $26

jr_005_67a5:
	jr   nz, jr_005_67fa                             ; $67a5: $20 $53

	ld   l, a                                        ; $67a7: $6f
	ld   (hl), l                                     ; $67a8: $75
	ld   l, (hl)                                     ; $67a9: $6e
	ld   h, h                                        ; $67aa: $64
	jr   nz, jr_005_67f2                             ; $67ab: $20 $45

	ld   h, (hl)                                     ; $67ad: $66
	ld   h, (hl)                                     ; $67ae: $66
	ld   h, l                                        ; $67af: $65
	ld   h, e                                        ; $67b0: $63
	ld   (hl), h                                     ; $67b1: $74
	ld   (hl), e                                     ; $67b2: $73
	rst  $38                                         ; $67b3: $ff
	rrca                                             ; $67b4: $0f
	dec  c                                           ; $67b5: $0d
	ld   d, d                                        ; $67b6: $52
	ld   l, a                                        ; $67b7: $6f
	ld   h, a                                        ; $67b8: $67
	ld   h, l                                        ; $67b9: $65
	ld   (hl), d                                     ; $67ba: $72
	rst  $38                                         ; $67bb: $ff
	.db  $10                                         ; $67bc: $10
	rrca                                             ; $67bd: $0f
	ld   h, $ff                                      ; $67be: $26 $ff
	ld   de, $560d                                   ; $67c0: $11 $0d $56
	ld   h, c                                        ; $67c3: $61
	ld   l, (hl)                                     ; $67c4: $6e
	ld   h, e                                        ; $67c5: $63
	ld   h, l                                        ; $67c6: $65
	rst  $38                                         ; $67c7: $ff
	ld   a, a                                        ; $67c8: $7f
	ld   b, a                                        ; $67c9: $47
	inc  bc                                          ; $67ca: $03

jr_005_67cb:
	inc  c                                           ; $67cb: $0c
	ld   b, h                                        ; $67cc: $44
	ld   (bc), a                                     ; $67cd: $02
	ld   b, c                                        ; $67ce: $41
	inc  bc                                          ; $67cf: $03
	adc  l                                           ; $67d0: $8d
	dec  b                                           ; $67d1: $05
	ld   a, (bc)                                     ; $67d2: $0a
	ld   b, b                                        ; $67d3: $40
	rst  $38                                         ; $67d4: $ff
	jp   $ddaa                                       ; $67d5: $c3 $aa $dd


	ld   h, a                                        ; $67d8: $67
	rrca                                             ; $67d9: $0f
	add  c                                           ; $67da: $81
	.db  $d3                                         ; $67db: $d3
	ld   h, a                                        ; $67dc: $67
	jp   $e580                                       ; $67dd: $c3 $80 $e5


	ld   h, a                                        ; $67e0: $67
	ld   a, (bc)                                     ; $67e1: $0a
	add  c                                           ; $67e2: $81
	.db  $d3                                         ; $67e3: $d3
	ld   h, a                                        ; $67e4: $67
	dec  bc                                          ; $67e5: $0b
	add  c                                           ; $67e6: $81
	.db  $d3                                         ; $67e7: $d3
	ld   h, a                                        ; $67e8: $67

jr_005_67e9:
	ld   b, a                                        ; $67e9: $47
	ld   (bc), a                                     ; $67ea: $02
	inc  bc                                          ; $67eb: $03
	inc  c                                           ; $67ec: $0c
	ld   b, h                                        ; $67ed: $44
	inc  bc                                          ; $67ee: $03

jr_005_67ef:
	ld   b, c                                        ; $67ef: $41
	inc  bc                                          ; $67f0: $03
	ld   b, b                                        ; $67f1: $40

jr_005_67f2:
	ld   b, b                                        ; $67f2: $40
	jp   $fb80                                       ; $67f3: $c3 $80 $fb


	ld   h, a                                        ; $67f6: $67
	dec  c                                           ; $67f7: $0d
	add  c                                           ; $67f8: $81
	pop  af                                          ; $67f9: $f1

jr_005_67fa:
	ld   h, a                                        ; $67fa: $67
	ld   c, $81                                      ; $67fb: $0e $81
	pop  af                                          ; $67fd: $f1

jr_005_67fe:
	ld   h, a                                        ; $67fe: $67
	ld   b, a                                        ; $67ff: $47
	inc  b                                           ; $6800: $04
	inc  c                                           ; $6801: $0c
	ld   b, h                                        ; $6802: $44
	inc  bc                                          ; $6803: $03
	ld   b, c                                        ; $6804: $41
	ld   (bc), a                                     ; $6805: $02
	inc  bc                                          ; $6806: $03
	adc  l                                           ; $6807: $8d
	dec  b                                           ; $6808: $05
	ld   a, (bc)                                     ; $6809: $0a
	ld   b, b                                        ; $680a: $40
	.db  $10                                         ; $680b: $10
	adc  h                                           ; $680c: $8c
	ld   (de), a                                     ; $680d: $12
	ld   l, b                                        ; $680e: $68
	add  c                                           ; $680f: $81
	ld   a, (bc)                                     ; $6810: $0a
	ld   l, b                                        ; $6811: $68
	ld   b, (hl)                                     ; $6812: $46
	adc  a                                           ; $6813: $8f
	ld   b, d                                        ; $6814: $42
	ld   (bc), a                                     ; $6815: $02
	ld   b, b                                        ; $6816: $40
	.db  $10                                         ; $6817: $10
	adc  h                                           ; $6818: $8c
	ld   e, $68                                      ; $6819: $1e $68
	add  c                                           ; $681b: $81
	ld   a, (bc)                                     ; $681c: $0a
	ld   l, b                                        ; $681d: $68
	jp   $26aa                                       ; $681e: $c3 $aa $26


	ld   l, b                                        ; $6821: $68
	rrca                                             ; $6822: $0f
	add  c                                           ; $6823: $81
	ld   a, (bc)                                     ; $6824: $0a
	ld   l, b                                        ; $6825: $68
	jp   $2e80                                       ; $6826: $c3 $80 $2e


	ld   l, b                                        ; $6829: $68
	ld   a, (bc)                                     ; $682a: $0a
	add  c                                           ; $682b: $81
	ld   a, (bc)                                     ; $682c: $0a
	ld   l, b                                        ; $682d: $68
	dec  bc                                          ; $682e: $0b
	add  c                                           ; $682f: $81
	ld   a, (bc)                                     ; $6830: $0a
	ld   l, b                                        ; $6831: $68
	ret                                              ; $6832: $c9


	ld   c, b                                        ; $6833: $48
	ld   b, e                                        ; $6834: $43
	ld   l, b                                        ; $6835: $68
	ld   b, c                                        ; $6836: $41
	.db  $10                                         ; $6837: $10
	ld   bc, $400f                                   ; $6838: $01 $0f $40
	ld   a, (bc)                                     ; $683b: $0a
	rrca                                             ; $683c: $0f
	ld   (bc), a                                     ; $683d: $02
	ret                                              ; $683e: $c9


	ld   c, b                                        ; $683f: $48
	ld   b, e                                        ; $6840: $43
	ld   l, b                                        ; $6841: $68
	nop                                              ; $6842: $00
	inc  d                                           ; $6843: $14
	add  hl, bc                                      ; $6844: $09
	ld   b, h                                        ; $6845: $44
	ld   (bc), a                                     ; $6846: $02
	ld   b, c                                        ; $6847: $41
	ld   (bc), a                                     ; $6848: $02
	rst  $00                                         ; $6849: $c7
	nop                                              ; $684a: $00
	add  b                                           ; $684b: $80
	add  b                                           ; $684c: $80
	inc  c                                           ; $684d: $0c
	ld   b, b                                        ; $684e: $40
	.db  $10                                         ; $684f: $10
	rst  $00                                         ; $6850: $c7
	ld   c, b                                        ; $6851: $48
	add  b                                           ; $6852: $80
	add  b                                           ; $6853: $80
	nop                                              ; $6854: $00
	ld   b, h                                        ; $6855: $44
	ld   (bc), a                                     ; $6856: $02
	ld   b, a                                        ; $6857: $47
	ld   (bc), a                                     ; $6858: $02
	inc  c                                           ; $6859: $0c
	add  l                                           ; $685a: $85
	ld   h, (hl)                                     ; $685b: $66
	ld   l, b                                        ; $685c: $68
	add  l                                           ; $685d: $85
	ld   (hl), a                                     ; $685e: $77
	ld   l, b                                        ; $685f: $68
	add  l                                           ; $6860: $85
	add  (hl)                                        ; $6861: $86
	ld   l, b                                        ; $6862: $68
	add  c                                           ; $6863: $81
	ld   e, d                                        ; $6864: $5a
	ld   l, b                                        ; $6865: $68
	.db $c3 $55 $74


	ld   l, b                                        ; $6869: $68
	.db $c3 $80 $71


	ld   l, b                                        ; $686d: $68
	ld   b, c                                        ; $686e: $41
	inc  bc                                          ; $686f: $03
	inc  h                                           ; $6870: $24
	ld   b, c                                        ; $6871: $41

jr_005_6872:
	ld   bc, $4124                                   ; $6872: $01 $24 $41
	ld   (bc), a                                     ; $6875: $02
	inc  h                                           ; $6876: $24
	jp   $8355                                       ; $6877: $c3 $55 $83


	ld   l, b                                        ; $687a: $68
	jp   $8180                                       ; $687b: $c3 $80 $81


	ld   l, b                                        ; $687e: $68
	ld   b, b                                        ; $687f: $40

Jump_005_6880:
	.db  $10                                         ; $6880: $10
	ld   b, b                                        ; $6881: $40
	.db  $10                                         ; $6882: $10
	ld   b, b                                        ; $6883: $40
	.db  $10                                         ; $6884: $10
	inc  h                                           ; $6885: $24
	jp   $9740                                       ; $6886: $c3 $40 $97


	ld   l, b                                        ; $6889: $68
	jp   $9655                                       ; $688a: $c3 $55 $96


	ld   l, b                                        ; $688d: $68
	jp   $9480                                       ; $688e: $c3 $80 $94


	ld   l, b                                        ; $6891: $68
	dec  c                                           ; $6892: $0d
	inc  h                                           ; $6893: $24
	ld   c, $24                                      ; $6894: $0e $24
	rrca                                             ; $6896: $0f
	inc  h                                           ; $6897: $24
	ld   b, c                                        ; $6898: $41
	inc  b                                           ; $6899: $04
	ld   b, h                                        ; $689a: $44
	inc  bc                                          ; $689b: $03
	inc  c                                           ; $689c: $0c
	adc  l                                           ; $689d: $8d
	ld   ($c310), sp                                 ; $689e: $08 $10 $c3
	add  b                                           ; $68a1: $80
	xor  d                                           ; $68a2: $aa
	ld   l, b                                        ; $68a3: $68
	jp   $ac80                                       ; $68a4: $c3 $80 $ac


	ld   l, b                                        ; $68a7: $68
	ld   b, b                                        ; $68a8: $40
	jr   nc, jr_005_68eb                             ; $68a9: $30 $40

	jr   nc, $40                                     ; $68ab: $30 $40

	jr   nc, jr_005_6872                             ; $68ad: $30 $c3

	xor  d                                           ; $68af: $aa
	or   (hl)                                        ; $68b0: $b6
	ld   l, b                                        ; $68b1: $68
	rrca                                             ; $68b2: $0f
	add  c                                           ; $68b3: $81
	sbc  l                                           ; $68b4: $9d
	ld   l, b                                        ; $68b5: $68
	jp   $d680                                       ; $68b6: $c3 $80 $d6


	ld   l, b                                        ; $68b9: $68
	jp   $ca80                                       ; $68ba: $c3 $80 $ca


	ld   l, b                                        ; $68bd: $68
	ld   c, $ce                                      ; $68be: $0e $ce
	.db  $10                                         ; $68c0: $10
	add  $68                                         ; $68c1: $c6 $68
	add  c                                           ; $68c3: $81
	sbc  l                                           ; $68c4: $9d
	ld   l, b                                        ; $68c5: $68
	ld   c, $81                                      ; $68c6: $0e $81
	sbc  l                                           ; $68c8: $9d
	ld   l, b                                        ; $68c9: $68
	dec  c                                           ; $68ca: $0d
	adc  $10                                         ; $68cb: $ce $10
	jp   nc, $8168                                   ; $68cd: $d2 $68 $81

	sbc  l                                           ; $68d0: $9d
	ld   l, b                                        ; $68d1: $68
	dec  c                                           ; $68d2: $0d
	add  c                                           ; $68d3: $81
	sbc  l                                           ; $68d4: $9d
	ld   l, b                                        ; $68d5: $68
	jp   $de80                                       ; $68d6: $c3 $80 $de


	ld   l, b                                        ; $68d9: $68
	inc  de                                          ; $68da: $13
	add  c                                           ; $68db: $81
	sbc  l                                           ; $68dc: $9d
	ld   l, b                                        ; $68dd: $68
	ld   (de), a                                     ; $68de: $12
	add  c                                           ; $68df: $81
	sbc  l                                           ; $68e0: $9d
	ld   l, b                                        ; $68e1: $68
	ld   b, c                                        ; $68e2: $41
	ld   (bc), a                                     ; $68e3: $02
	ld   b, h                                        ; $68e4: $44
	inc  bc                                          ; $68e5: $03
	inc  c                                           ; $68e6: $0c
	adc  l                                           ; $68e7: $8d
	ld   ($c310), sp                                 ; $68e8: $08 $10 $c3

jr_005_68eb:
	add  b                                           ; $68eb: $80
	cp   $68                                         ; $68ec: $fe $68
	jp   $0f80                                       ; $68ee: $c3 $80 $0f


	ld   l, c                                        ; $68f1: $69
	adc  $10                                         ; $68f2: $ce $10
	rrca                                             ; $68f4: $0f
	ld   l, c                                        ; $68f5: $69
	adc  l                                           ; $68f6: $8d
	ld   ($4610), sp                                 ; $68f7: $08 $10 $46
	sub  l                                           ; $68fa: $95
	add  c                                           ; $68fb: $81
	ld   ($c368), a                                  ; $68fc: $ea $68 $c3
	add  b                                           ; $68ff: $80
	ld   ($c369), sp                                 ; $6900: $08 $69 $c3
	add  b                                           ; $6903: $80
	ld   a, (bc)                                     ; $6904: $0a
	ld   l, c                                        ; $6905: $69
	ld   b, b                                        ; $6906: $40
	.db  $10                                         ; $6907: $10
	ld   b, b                                        ; $6908: $40
	.db  $10                                         ; $6909: $10
	ld   b, b                                        ; $690a: $40
	.db  $10                                         ; $690b: $10
	add  c                                           ; $690c: $81
	ld   ($c368), a                                  ; $690d: $ea $68 $c3
	add  b                                           ; $6910: $80
	rra                                              ; $6911: $1f
	ld   l, c                                        ; $6912: $69
	dec  c                                           ; $6913: $0d
	adc  $10                                         ; $6914: $ce $10
	dec  de                                          ; $6916: $1b
	ld   l, c                                        ; $6917: $69
	add  c                                           ; $6918: $81
	cp   $68                                         ; $6919: $fe $68
	dec  c                                           ; $691b: $0d
	add  c                                           ; $691c: $81
	cp   $68                                         ; $691d: $fe $68
	ld   c, $ce                                      ; $691f: $0e $ce
	.db  $10                                         ; $6921: $10
	daa                                              ; $6922: $27
	ld   l, c                                        ; $6923: $69
	add  c                                           ; $6924: $81
	cp   $68                                         ; $6925: $fe $68
	ld   c, $81                                      ; $6927: $0e $81
	cp   $68                                         ; $6929: $fe $68
	ld   b, a                                        ; $692b: $47
	ld   (bc), a                                     ; $692c: $02
	add  hl, bc                                      ; $692d: $09
	inc  d                                           ; $692e: $14
	ld   bc, $410c                                   ; $692f: $01 $0c $41
	inc  b                                           ; $6932: $04
	ld   b, h                                        ; $6933: $44
	inc  bc                                          ; $6934: $03
	ld   b, b                                        ; $6935: $40
	rst  $38                                         ; $6936: $ff
	nop                                              ; $6937: $00
	ld   b, a                                        ; $6938: $47
	ld   (bc), a                                     ; $6939: $02
	ld   b, c                                        ; $693a: $41
	ld   (bc), a                                     ; $693b: $02
	ld   b, h                                        ; $693c: $44
	inc  bc                                          ; $693d: $03
	inc  c                                           ; $693e: $0c
	adc  l                                           ; $693f: $8d
	ld   ($4010), sp                                 ; $6940: $08 $10 $40
	.db  $10                                         ; $6943: $10
	ret                                              ; $6944: $c9


	and  b                                           ; $6945: $a0
	adc  (hl)                                        ; $6946: $8e
	ld   l, c                                        ; $6947: $69
	ret                                              ; $6948: $c9


	ld   (hl), h                                     ; $6949: $74
	sub  e                                           ; $694a: $93
	ld   l, c                                        ; $694b: $69
	adc  $10                                         ; $694c: $ce $10
	ld   d, a                                        ; $694e: $57
	ld   l, c                                        ; $694f: $69
	jp   Jump_005_5780                               ; $6950: $c3 $80 $57


	ld   l, c                                        ; $6953: $69
	add  c                                           ; $6954: $81
	ld   b, d                                        ; $6955: $42
	ld   l, c                                        ; $6956: $69
	.db $c3 $10 $77


	ld   l, c                                        ; $695a: $69
	jp   Jump_005_6b80                               ; $695b: $c3 $80 $6b


	ld   l, c                                        ; $695e: $69
	dec  bc                                          ; $695f: $0b
	adc  $10                                         ; $6960: $ce $10
	ld   h, a                                        ; $6962: $67
	ld   l, c                                        ; $6963: $69
	add  c                                           ; $6964: $81
	ld   b, d                                        ; $6965: $42
	ld   l, c                                        ; $6966: $69
	dec  bc                                          ; $6967: $0b
	add  c                                           ; $6968: $81
	ld   b, d                                        ; $6969: $42
	ld   l, c                                        ; $696a: $69
	ld   a, (bc)                                     ; $696b: $0a
	adc  $10                                         ; $696c: $ce $10
	ld   (hl), e                                     ; $696e: $73
	ld   l, c                                        ; $696f: $69
	add  c                                           ; $6970: $81
	ld   b, d                                        ; $6971: $42
	ld   l, c                                        ; $6972: $69
	ld   a, (bc)                                     ; $6973: $0a
	add  c                                           ; $6974: $81
	ld   b, d                                        ; $6975: $42
	ld   l, c                                        ; $6976: $69
	.db $c3 $aa $7f


	ld   l, c                                        ; $697a: $69
	.db  $10                                         ; $697b: $10
	add  c                                           ; $697c: $81
	ld   b, d                                        ; $697d: $42
	ld   l, c                                        ; $697e: $69
	jp   $8780                                       ; $697f: $c3 $80 $87


	ld   l, c                                        ; $6982: $69
	ld   de, $4281                                   ; $6983: $11 $81 $42
	ld   l, c                                        ; $6986: $69
	.db  $10                                         ; $6987: $10
	ld   b, b                                        ; $6988: $40
	ld   b, b                                        ; $6989: $40
	ld   de, $4281                                   ; $698a: $11 $81 $42
	ld   l, c                                        ; $698d: $69
	dec  b                                           ; $698e: $05
	ld   b, b                                        ; $698f: $40
	ld   ($9743), sp                                 ; $6990: $08 $43 $97
	ld   b, e                                        ; $6993: $43
	sbc  b                                           ; $6994: $98
	add  l                                           ; $6995: $85
	ret  nz                                          ; $6996: $c0

	ld   l, c                                        ; $6997: $69
	rst  $00                                         ; $6998: $c7
	push hl                                          ; $6999: $e5
	add  b                                           ; $699a: $80
	add  b                                           ; $699b: $80
	add  l                                           ; $699c: $85
	or   (hl)                                        ; $699d: $b6
	ld   l, c                                        ; $699e: $69
	jp   $a680                                       ; $699f: $c3 $80 $a6


	ld   l, c                                        ; $69a2: $69
	ld   ($9643), sp                                 ; $69a3: $08 $43 $96
	rlca                                             ; $69a6: $07
	ld   b, e                                        ; $69a7: $43
	sub  (hl)                                        ; $69a8: $96
	add  l                                           ; $69a9: $85
	ret  nz                                          ; $69aa: $c0

	ld   l, c                                        ; $69ab: $69
	rst  $00                                         ; $69ac: $c7
	ld   l, c                                        ; $69ad: $69
	add  b                                           ; $69ae: $80
	add  b                                           ; $69af: $80
	add  l                                           ; $69b0: $85
	or   (hl)                                        ; $69b1: $b6
	ld   l, c                                        ; $69b2: $69
	ld   b, $43                                      ; $69b3: $06 $43
	sub  (hl)                                        ; $69b5: $96
	adc  c                                           ; $69b6: $89
	ei                                               ; $69b7: $fb
	dec  d                                           ; $69b8: $15
	ld   b, d                                        ; $69b9: $42
	inc  bc                                          ; $69ba: $03
	jp   nz, $b608                                   ; $69bb: $c2 $08 $b6

	ld   l, c                                        ; $69be: $69
	inc  h                                           ; $69bf: $24
	ld   b, a                                        ; $69c0: $47
	ld   (bc), a                                     ; $69c1: $02
	add  hl, bc                                      ; $69c2: $09
	ld   b, h                                        ; $69c3: $44
	inc  bc                                          ; $69c4: $03
	inc  c                                           ; $69c5: $0c
	adc  c                                           ; $69c6: $89
	ei                                               ; $69c7: $fb
	dec  d                                           ; $69c8: $15
	ld   b, d                                        ; $69c9: $42
	inc  bc                                          ; $69ca: $03
	jp   nz, $c608                                   ; $69cb: $c2 $08 $c6

	ld   l, c                                        ; $69ce: $69
	inc  h                                           ; $69cf: $24
	ld   b, a                                        ; $69d0: $47
	ld   (bc), a                                     ; $69d1: $02

jr_005_69d2:
	inc  c                                           ; $69d2: $0c
	ld   b, h                                        ; $69d3: $44
	ld   (bc), a                                     ; $69d4: $02
	ld   b, d                                        ; $69d5: $42
	ld   a, (bc)                                     ; $69d6: $0a
	ld   b, c                                        ; $69d7: $41
	ld   (bc), a                                     ; $69d8: $02
	ld   b, b                                        ; $69d9: $40
	ld   b, b                                        ; $69da: $40
	rrca                                             ; $69db: $0f
	ld   b, c                                        ; $69dc: $41
	ld   bc, $4029                                   ; $69dd: $01 $29 $40
	inc  b                                           ; $69e0: $04
	jp   nz, $de0c                                   ; $69e1: $c2 $0c $de

	ld   l, c                                        ; $69e4: $69
	add  c                                           ; $69e5: $81
	rst  $10                                         ; $69e6: $d7
	ld   l, c                                        ; $69e7: $69
	ld   b, a                                        ; $69e8: $47
	ld   (bc), a                                     ; $69e9: $02
	inc  c                                           ; $69ea: $0c

jr_005_69eb:
	ld   b, h                                        ; $69eb: $44
	ld   (bc), a                                     ; $69ec: $02
	ld   b, d                                        ; $69ed: $42
	ld   a, (bc)                                     ; $69ee: $0a
	add  hl, hl                                      ; $69ef: $29
	ld   b, b                                        ; $69f0: $40
	inc  b                                           ; $69f1: $04
	ld   b, d                                        ; $69f2: $42
	ld   bc, $ef81                                   ; $69f3: $01 $81 $ef
	ld   l, c                                        ; $69f6: $69
	ld   b, a                                        ; $69f7: $47
	inc  bc                                          ; $69f8: $03
	inc  c                                           ; $69f9: $0c
	ld   b, h                                        ; $69fa: $44
	ld   (bc), a                                     ; $69fb: $02
	ld   b, d                                        ; $69fc: $42
	ld   a, (bc)                                     ; $69fd: $0a
	ld   b, c                                        ; $69fe: $41
	inc  bc                                          ; $69ff: $03
	add  hl, hl                                      ; $6a00: $29
	ld   b, b                                        ; $6a01: $40
	jr   nz, jr_005_69d2                             ; $6a02: $20 $ce

	ld   ($6a0d), sp                                 ; $6a04: $08 $0d $6a
	adc  l                                           ; $6a07: $8d
	ld   a, (bc)                                     ; $6a08: $0a
	jr   z, -$7f                                     ; $6a09: $28 $81

	nop                                              ; $6a0b: $00
	ld   l, d                                        ; $6a0c: $6a
	rrca                                             ; $6a0d: $0f
	ld   b, b                                        ; $6a0e: $40
	jr   nz, -$7f                                    ; $6a0f: $20 $81

	nop                                              ; $6a11: $00
	ld   l, d                                        ; $6a12: $6a
	ld   b, a                                        ; $6a13: $47
	inc  bc                                          ; $6a14: $03
	inc  c                                           ; $6a15: $0c
	ld   b, h                                        ; $6a16: $44
	inc  b                                           ; $6a17: $04
	ld   b, d                                        ; $6a18: $42
	ld   a, (bc)                                     ; $6a19: $0a
	ld   b, b                                        ; $6a1a: $40
	jr   nz, jr_005_69eb                             ; $6a1b: $20 $ce

	ld   ($6a27), sp                                 ; $6a1d: $08 $27 $6a
	jp   $2b40                                       ; $6a20: $c3 $40 $2b


	ld   l, d                                        ; $6a23: $6a
	add  c                                           ; $6a24: $81
	ld   a, (de)                                     ; $6a25: $1a
	ld   l, d                                        ; $6a26: $6a
	rrca                                             ; $6a27: $0f
	add  c                                           ; $6a28: $81
	ld   a, (de)                                     ; $6a29: $1a
	ld   l, d                                        ; $6a2a: $6a
	ld   b, (hl)                                     ; $6a2b: $46
	xor  e                                           ; $6a2c: $ab
	add  c                                           ; $6a2d: $81
	ld   a, (de)                                     ; $6a2e: $1a
	ld   l, d                                        ; $6a2f: $6a
	add  hl, bc                                      ; $6a30: $09
	ld   b, a                                        ; $6a31: $47
	ld   (bc), a                                     ; $6a32: $02

Jump_005_6a33:
	ld   b, c                                        ; $6a33: $41
	inc  b                                           ; $6a34: $04
	.db  $10                                         ; $6a35: $10
	inc  c                                           ; $6a36: $0c
	ld   b, b                                        ; $6a37: $40
	rst  $38                                         ; $6a38: $ff
	ld   b, e                                        ; $6a39: $43
	ld   a, h                                        ; $6a3a: $7c
	ld   bc, $1041                                   ; $6a3b: $01 $41 $10
	ld   b, b                                        ; $6a3e: $40
	.db  $10                                         ; $6a3f: $10
	add  l                                           ; $6a40: $85
	ld   h, d                                        ; $6a41: $62
	ld   l, d                                        ; $6a42: $6a
	jp   nz, $3e0f                                   ; $6a43: $c2 $0f $3e

	ld   l, d                                        ; $6a46: $6a
	ld   c, $40                                      ; $6a47: $0e $40
	.db  $10                                         ; $6a49: $10
	adc  h                                           ; $6a4a: $8c
	ld   h, c                                        ; $6a4b: $61
	ld   l, d                                        ; $6a4c: $6a
	ld   c, $40                                      ; $6a4d: $0e $40
	.db  $10                                         ; $6a4f: $10
	add  l                                           ; $6a50: $85
	ld   h, d                                        ; $6a51: $62
	ld   l, d                                        ; $6a52: $6a
	jp   nz, $4e0f                                   ; $6a53: $c2 $0f $4e

	ld   l, d                                        ; $6a56: $6a
	dec  c                                           ; $6a57: $0d
	ld   b, b                                        ; $6a58: $40
	.db  $10                                         ; $6a59: $10
	adc  h                                           ; $6a5a: $8c
	ld   h, c                                        ; $6a5b: $61
	ld   l, d                                        ; $6a5c: $6a
	dec  c                                           ; $6a5d: $0d
	add  c                                           ; $6a5e: $81
	ld   a, $6a                                      ; $6a5f: $3e $6a
	nop                                              ; $6a61: $00
	jp   Jump_005_6740                               ; $6a62: $c3 $40 $67


	ld   l, d                                        ; $6a65: $6a
	inc  h                                           ; $6a66: $24
	add  (hl)                                        ; $6a67: $86
	ld   l, e                                        ; $6a68: $6b
	ld   l, d                                        ; $6a69: $6a
	nop                                              ; $6a6a: $00
	ld   (bc), a                                     ; $6a6b: $02
	rst  $38                                         ; $6a6c: $ff
	rst  $38                                         ; $6a6d: $ff
	add  a                                           ; $6a6e: $87
	ld   l, d                                        ; $6a6f: $6a
	rlca                                             ; $6a70: $07
	rst  $38                                         ; $6a71: $ff
	rst  $38                                         ; $6a72: $ff
	sbc  b                                           ; $6a73: $98
	ld   l, d                                        ; $6a74: $6a
	inc  b                                           ; $6a75: $04
	rst  $38                                         ; $6a76: $ff
	rst  $38                                         ; $6a77: $ff
	and  c                                           ; $6a78: $a1
	ld   l, d                                        ; $6a79: $6a
	dec  b                                           ; $6a7a: $05
	rst  $38                                         ; $6a7b: $ff
	rst  $38                                         ; $6a7c: $ff
	and  c                                           ; $6a7d: $a1
	ld   l, d                                        ; $6a7e: $6a
	dec  bc                                          ; $6a7f: $0b
	rst  $38                                         ; $6a80: $ff
	rst  $38                                         ; $6a81: $ff
	xor  d                                           ; $6a82: $aa
	ld   l, d                                        ; $6a83: $6a
	rst  $38                                         ; $6a84: $ff
	rst  $38                                         ; $6a85: $ff
	rst  $38                                         ; $6a86: $ff
	ret                                              ; $6a87: $c9


	inc  e                                           ; $6a88: $1c
	or   e                                           ; $6a89: $b3
	ld   l, d                                        ; $6a8a: $6a
	ret                                              ; $6a8b: $c9


	ld   c, b                                        ; $6a8c: $48
	or   e                                           ; $6a8d: $b3
	ld   l, d                                        ; $6a8e: $6a
	ret                                              ; $6a8f: $c9


	ld   b, h                                        ; $6a90: $44
	or   e                                           ; $6a91: $b3
	ld   l, d                                        ; $6a92: $6a
	ret                                              ; $6a93: $c9


	ld   c, h                                        ; $6a94: $4c
	or   e                                           ; $6a95: $b3
	ld   l, d                                        ; $6a96: $6a
	inc  h                                           ; $6a97: $24
	ret                                              ; $6a98: $c9


	ld   c, b                                        ; $6a99: $48
	or   e                                           ; $6a9a: $b3
	ld   l, d                                        ; $6a9b: $6a
	ret                                              ; $6a9c: $c9


	ld   d, h                                        ; $6a9d: $54
	or   e                                           ; $6a9e: $b3
	ld   l, d                                        ; $6a9f: $6a
	inc  h                                           ; $6aa0: $24
	ret                                              ; $6aa1: $c9


	ld   c, b                                        ; $6aa2: $48
	or   e                                           ; $6aa3: $b3
	ld   l, d                                        ; $6aa4: $6a
	ret                                              ; $6aa5: $c9


	.db  $e4                                         ; $6aa6: $e4
	or   e                                           ; $6aa7: $b3
	ld   l, d                                        ; $6aa8: $6a
	inc  h                                           ; $6aa9: $24
	ret                                              ; $6aaa: $c9


	ld   c, h                                        ; $6aab: $4c
	or   e                                           ; $6aac: $b3
	ld   l, d                                        ; $6aad: $6a
	ret                                              ; $6aae: $c9


	add  b                                           ; $6aaf: $80
	or   e                                           ; $6ab0: $b3
	ld   l, d                                        ; $6ab1: $6a
	inc  h                                           ; $6ab2: $24
	add  (hl)                                        ; $6ab3: $86
	or   a                                           ; $6ab4: $b7
	ld   l, d                                        ; $6ab5: $6a
	nop                                              ; $6ab6: $00
	ld   (bc), a                                     ; $6ab7: $02
	rst  $38                                         ; $6ab8: $ff
	rst  $38                                         ; $6ab9: $ff
	.db  $d3                                         ; $6aba: $d3
	ld   l, d                                        ; $6abb: $6a
	rlca                                             ; $6abc: $07
	rst  $38                                         ; $6abd: $ff
	rst  $38                                         ; $6abe: $ff
	ldh  (<$6a), a                                   ; $6abf: $e0 $6a
	inc  b                                           ; $6ac1: $04
	rst  $38                                         ; $6ac2: $ff
	rst  $38                                         ; $6ac3: $ff
	.db  $ed                                         ; $6ac4: $ed
	ld   l, d                                        ; $6ac5: $6a
	dec  b                                           ; $6ac6: $05
	rst  $38                                         ; $6ac7: $ff
	rst  $38                                         ; $6ac8: $ff
	.db  $ed                                         ; $6ac9: $ed
	ld   l, d                                        ; $6aca: $6a
	dec  bc                                          ; $6acb: $0b
	rst  $38                                         ; $6acc: $ff
	rst  $38                                         ; $6acd: $ff
	or   $6a                                         ; $6ace: $f6 $6a
	rst  $38                                         ; $6ad0: $ff
	rst  $38                                         ; $6ad1: $ff
	rst  $38                                         ; $6ad2: $ff
	ld   b, d                                        ; $6ad3: $42
	ld   bc, $00c9                                   ; $6ad4: $01 $c9 $00
	ld   ($c96b), sp                                 ; $6ad7: $08 $6b $c9
	ld   l, b                                        ; $6ada: $68
	ld   ($816b), sp                                 ; $6adb: $08 $6b $81
	.db  $d3                                         ; $6ade: $d3
	ld   l, d                                        ; $6adf: $6a
	ld   b, d                                        ; $6ae0: $42
	ld   bc, $00c9                                   ; $6ae1: $01 $c9 $00
	ld   ($c96b), sp                                 ; $6ae4: $08 $6b $c9
	call c, Call_005_6b08                            ; $6ae7: $dc $08 $6b
	add  c                                           ; $6aea: $81
	ldh  (<$6a), a                                   ; $6aeb: $e0 $6a
	ld   b, d                                        ; $6aed: $42
	ld   bc, $00c9                                   ; $6aee: $01 $c9 $00
	ld   ($816b), sp                                 ; $6af1: $08 $6b $81
	.db  $ed                                         ; $6af4: $ed
	ld   l, d                                        ; $6af5: $6a
	ld   b, d                                        ; $6af6: $42
	ld   bc, $b8c9                                   ; $6af7: $01 $c9 $b8
	inc  bc                                          ; $6afa: $03
	ld   l, e                                        ; $6afb: $6b
	ret                                              ; $6afc: $c9


	sub  h                                           ; $6afd: $94
	inc  bc                                          ; $6afe: $03
	ld   l, e                                        ; $6aff: $6b
	add  c                                           ; $6b00: $81
	or   $6a                                         ; $6b01: $f6 $6a
	ld   b, d                                        ; $6b03: $42
	ld   ($2081), sp                                 ; $6b04: $08 $81 $20
	ld   l, e                                        ; $6b07: $6b

Call_005_6b08:
	ld   b, d                                        ; $6b08: $42
	ld   ($55c3), sp                                 ; $6b09: $08 $c3 $55
	dec  d                                           ; $6b0c: $15
	ld   l, e                                        ; $6b0d: $6b
	rst  $00                                         ; $6b0e: $c7
	call nz, $8080                                   ; $6b0f: $c4 $80 $80
	add  c                                           ; $6b12: $81
	cpl                                              ; $6b13: $2f
	ld   l, e                                        ; $6b14: $6b
	jp   $2055                                       ; $6b15: $c3 $55 $20


	ld   l, e                                        ; $6b18: $6b
	rst  $00                                         ; $6b19: $c7
	ret  c                                           ; $6b1a: $d8

	add  b                                           ; $6b1b: $80
	add  b                                           ; $6b1c: $80
	add  c                                           ; $6b1d: $81
	cpl                                              ; $6b1e: $2f

jr_005_6b1f:
	ld   l, e                                        ; $6b1f: $6b
	jp   $2b55                                       ; $6b20: $c3 $55 $2b


	ld   l, e                                        ; $6b23: $6b
	rst  $00                                         ; $6b24: $c7
	call nc, $8080                                   ; $6b25: $d4 $80 $80
	add  c                                           ; $6b28: $81
	cpl                                              ; $6b29: $2f
	ld   l, e                                        ; $6b2a: $6b
	rst  $00                                         ; $6b2b: $c7
	ldh  (<$80), a                                   ; $6b2c: $e0 $80
	add  b                                           ; $6b2e: $80
	jr   z, jr_005_6b31                              ; $6b2f: $28 $00

jr_005_6b31:
	add  l                                           ; $6b31: $85
	ld   ($1b4f), a                                  ; $6b32: $ea $4f $1b
	adc  c                                           ; $6b35: $89
	add  l                                           ; $6b36: $85
	ld   d, $50                                      ; $6b37: $16 $50
	daa                                              ; $6b39: $27
	nop                                              ; $6b3a: $00
	ld   b, c                                        ; $6b3b: $41
	.db  $10                                         ; $6b3c: $10
	ld   bc, $1040                                   ; $6b3d: $01 $40 $10
	adc  h                                           ; $6b40: $8c
	ld   d, c                                        ; $6b41: $51
	ld   l, e                                        ; $6b42: $6b
	jp   Jump_005_55c0                               ; $6b43: $c3 $c0 $55


	ld   l, e                                        ; $6b46: $6b
	jp   Jump_005_5110                               ; $6b47: $c3 $10 $51


	ld   l, e                                        ; $6b4a: $6b
	adc  l                                           ; $6b4b: $8d
	inc  b                                           ; $6b4c: $04
	.db  $10                                         ; $6b4d: $10
	add  c                                           ; $6b4e: $81
	ld   a, $6b                                      ; $6b4f: $3e $6b
	rrca                                             ; $6b51: $0f

jr_005_6b52:
	add  c                                           ; $6b52: $81
	ld   c, e                                        ; $6b53: $4b
	ld   l, e                                        ; $6b54: $6b
	ret                                              ; $6b55: $c9


	ret  nz                                          ; $6b56: $c0

	ld   e, h                                        ; $6b57: $5c
	ld   l, e                                        ; $6b58: $6b
	add  c                                           ; $6b59: $81
	ld   c, e                                        ; $6b5a: $4b
	ld   l, e                                        ; $6b5b: $6b
	add  d                                           ; $6b5c: $82
	ld   c, e                                        ; $6b5d: $4b
	ld   l, e                                        ; $6b5e: $6b
	rst  $00                                         ; $6b5f: $c7
	add  (hl)                                        ; $6b60: $86
	add  b                                           ; $6b61: $80
	add  b                                           ; $6b62: $80
	ld   b, d                                        ; $6b63: $42
	ld   ($9cc0), sp                                 ; $6b64: $08 $c0 $9c
	nop                                              ; $6b67: $00
	nop                                              ; $6b68: $00
	ld   b, d                                        ; $6b69: $42
	jr   c, -$39                                     ; $6b6a: $38 $c7

	jp   nz, $8080                                   ; $6b6c: $c2 $80 $80

	add  c                                           ; $6b6f: $81
	ld   a, $6b                                      ; $6b70: $3e $6b
	.db  $10                                         ; $6b72: $10
	add  l                                           ; $6b73: $85
	.db $c4 $58 $42
	inc  c                                           ; $6b77: $0c
	add  hl, bc                                      ; $6b78: $09
	ld   b, d                                        ; $6b79: $42
	ld   ($a446), sp                                 ; $6b7a: $08 $46 $a4
	ld   b, d                                        ; $6b7d: $42
	ld   e, $00                                      ; $6b7e: $1e $00

Jump_005_6b80:
	adc  c                                           ; $6b80: $89
	ld   h, c                                        ; $6b81: $61
	ld   d, $01                                      ; $6b82: $16 $01
	add  hl, bc                                      ; $6b84: $09
	inc  c                                           ; $6b85: $0c
	ld   b, c                                        ; $6b86: $41
	inc  b                                           ; $6b87: $04
	ld   b, h                                        ; $6b88: $44
	inc  bc                                          ; $6b89: $03
	ld   b, b                                        ; $6b8a: $40
	rst  $38                                         ; $6b8b: $ff
	ld   b, e                                        ; $6b8c: $43
	ld   a, h                                        ; $6b8d: $7c
	add  l                                           ; $6b8e: $85
	call nz, $8558                                   ; $6b8f: $c4 $58 $85
	call z, $0958                                    ; $6b92: $cc $58 $09
	ld   b, d                                        ; $6b95: $42
	ld   ($a446), sp                                 ; $6b96: $08 $46 $a4
	ld   d, $8d                                      ; $6b99: $16 $8d
	inc  c                                           ; $6b9b: $0c
	jr   jr_005_6b1f                                 ; $6b9c: $18 $81

	sub  c                                           ; $6b9e: $91
	ld   l, e                                        ; $6b9f: $6b
	ld   b, a                                        ; $6ba0: $47
	ld   (bc), a                                     ; $6ba1: $02
	inc  c                                           ; $6ba2: $0c
	ld   b, h                                        ; $6ba3: $44
	ld   (bc), a                                     ; $6ba4: $02
	add  l                                           ; $6ba5: $85
	xor  (hl)                                        ; $6ba6: $ae
	ld   l, e                                        ; $6ba7: $6b
	ld   b, b                                        ; $6ba8: $40
	rst  $38                                         ; $6ba9: $ff
	rrca                                             ; $6baa: $0f
	add  c                                           ; $6bab: $81
	and  l                                           ; $6bac: $a5
	ld   l, e                                        ; $6bad: $6b
	jp   $b980                                       ; $6bae: $c3 $80 $b9


	ld   l, e                                        ; $6bb1: $6b
	jp   $bc80                                       ; $6bb2: $c3 $80 $bc


	ld   l, e                                        ; $6bb5: $6b
	ld   b, c                                        ; $6bb6: $41
	ld   (bc), a                                     ; $6bb7: $02
	inc  h                                           ; $6bb8: $24
	ld   b, c                                        ; $6bb9: $41
	inc  bc                                          ; $6bba: $03
	inc  h                                           ; $6bbb: $24
	ld   b, c                                        ; $6bbc: $41
	inc  b                                           ; $6bbd: $04
	inc  h                                           ; $6bbe: $24
	ld   bc, $ed85                                   ; $6bbf: $01 $85 $ed
	ld   c, a                                        ; $6bc2: $4f
	ld   b, c                                        ; $6bc3: $41
	.db  $10                                         ; $6bc4: $10
	ld   b, b                                        ; $6bc5: $40
	.db  $10                                         ; $6bc6: $10
	ld   b, $40                                      ; $6bc7: $06 $40
	.db  $10                                         ; $6bc9: $10
	dec  e                                           ; $6bca: $1d
	ld   b, c                                        ; $6bcb: $41
	ld   bc, $4005                                   ; $6bcc: $01 $05 $40
	jr   nz, jr_005_6b52                             ; $6bcf: $20 $81

	ld   bc, $0950                                   ; $6bd1: $01 $50 $09
	inc  d                                           ; $6bd4: $14
	inc  c                                           ; $6bd5: $0c
	dec  l                                           ; $6bd6: $2d
	ld   d, b                                        ; $6bd7: $50
	jr   nc, $42                                     ; $6bd8: $30 $42

	ld   bc, $d781                                   ; $6bda: $01 $81 $d7
	ld   l, e                                        ; $6bdd: $6b
	ld   d, c                                        ; $6bde: $51
	ld   sp, $4709                                   ; $6bdf: $31 $09 $47
	inc  b                                           ; $6be2: $04
	ld   b, h                                        ; $6be3: $44
	inc  b                                           ; $6be4: $04
	inc  c                                           ; $6be5: $0c
	add  l                                           ; $6be6: $85
	inc  d                                           ; $6be7: $14
	ld   l, h                                        ; $6be8: $6c
	adc  c                                           ; $6be9: $89
	ld   h, $16                                      ; $6bea: $26 $16
	ld   b, d                                        ; $6bec: $42
	ld   a, (bc)                                     ; $6bed: $0a
	jp   nz, $e60a                                   ; $6bee: $c2 $0a $e6

	ld   l, e                                        ; $6bf1: $6b
	ld   d, b                                        ; $6bf2: $50
	ld   sp, $ff54                                   ; $6bf3: $31 $54 $ff
	sub  c                                           ; $6bf6: $91
	inc  bc                                          ; $6bf7: $03
	rst  $38                                         ; $6bf8: $ff
	rst  $00                                         ; $6bf9: $c7
	nop                                              ; $6bfa: $00
	rst  $38                                         ; $6bfb: $ff
	add  c                                           ; $6bfc: $81
	rst  $00                                         ; $6bfd: $c7
	nop                                              ; $6bfe: $00
	add  b                                           ; $6bff: $80
	add  c                                           ; $6c00: $81
	rst  $00                                         ; $6c01: $c7
	nop                                              ; $6c02: $00
	rst  $38                                         ; $6c03: $ff
	add  d                                           ; $6c04: $82
	rst  $00                                         ; $6c05: $c7
	nop                                              ; $6c06: $00
	add  b                                           ; $6c07: $80
	add  d                                           ; $6c08: $82
	rst  $00                                         ; $6c09: $c7
	nop                                              ; $6c0a: $00
	rst  $38                                         ; $6c0b: $ff
	add  e                                           ; $6c0c: $83
	rst  $00                                         ; $6c0d: $c7
	nop                                              ; $6c0e: $00
	add  b                                           ; $6c0f: $80
	add  e                                           ; $6c10: $83
	ld   d, h                                        ; $6c11: $54
	nop                                              ; $6c12: $00
	nop                                              ; $6c13: $00
	ld   b, d                                        ; $6c14: $42
	inc  c                                           ; $6c15: $0c
	ret  nz                                          ; $6c16: $c0

	and  c                                           ; $6c17: $a1
	nop                                              ; $6c18: $00
	ld   hl, sp+$51                                  ; $6c19: $f8 $51
	jr   nc, jr_005_6c5f                             ; $6c1b: $30 $42

	inc  bc                                          ; $6c1d: $03
	ret  z                                           ; $6c1e: $c8

	jr   nc, jr_005_6c3b                             ; $6c1f: $30 $1a

	ld   l, h                                        ; $6c21: $6c
	inc  h                                           ; $6c22: $24
	add  hl, bc                                      ; $6c23: $09
	ld   b, h                                        ; $6c24: $44
	inc  b                                           ; $6c25: $04
	inc  d                                           ; $6c26: $14
	daa                                              ; $6c27: $27
	inc  c                                           ; $6c28: $0c
	ld   b, d                                        ; $6c29: $42
	dec  b                                           ; $6c2a: $05
	ld   b, d                                        ; $6c2b: $42
	ld   bc, $31c8                                   ; $6c2c: $01 $c8 $31
	inc  (hl)                                        ; $6c2f: $34
	ld   l, h                                        ; $6c30: $6c
	add  c                                           ; $6c31: $81
	dec  hl                                          ; $6c32: $2b
	ld   l, h                                        ; $6c33: $6c
	nop                                              ; $6c34: $00
	add  hl, bc                                      ; $6c35: $09
	ld   b, a                                        ; $6c36: $47
	inc  b                                           ; $6c37: $04
	ld   b, h                                        ; $6c38: $44
	inc  b                                           ; $6c39: $04
	inc  d                                           ; $6c3a: $14

jr_005_6c3b:
	inc  c                                           ; $6c3b: $0c
	ld   b, d                                        ; $6c3c: $42
	dec  b                                           ; $6c3d: $05
	ld   b, d                                        ; $6c3e: $42
	ld   bc, $31c8                                   ; $6c3f: $01 $c8 $31
	ld   b, a                                        ; $6c42: $47
	ld   l, h                                        ; $6c43: $6c
	add  c                                           ; $6c44: $81
	ld   a, $6c                                      ; $6c45: $3e $6c
	nop                                              ; $6c47: $00
	add  (hl)                                        ; $6c48: $86
	ld   c, (hl)                                     ; $6c49: $4e
	ld   l, h                                        ; $6c4a: $6c
	add  c                                           ; $6c4b: $81
	ld   (hl), e                                     ; $6c4c: $73
	ld   l, h                                        ; $6c4d: $6c
	inc  bc                                          ; $6c4e: $03
	ld   (bc), a                                     ; $6c4f: $02
	nop                                              ; $6c50: $00
	ld   h, b                                        ; $6c51: $60
	ld   l, h                                        ; $6c52: $6c
	rlca                                             ; $6c53: $07
	ld   bc, $6806                                   ; $6c54: $01 $06 $68
	ld   l, h                                        ; $6c57: $6c
	rlca                                             ; $6c58: $07
	ld   (bc), a                                     ; $6c59: $02
	rlca                                             ; $6c5a: $07
	ld   l, a                                        ; $6c5b: $6f
	ld   l, h                                        ; $6c5c: $6c
	rst  $38                                         ; $6c5d: $ff
	rst  $38                                         ; $6c5e: $ff

jr_005_6c5f:
	rst  $38                                         ; $6c5f: $ff
	ret  z                                           ; $6c60: $c8

	dec  l                                           ; $6c61: $2d
	and  (hl)                                        ; $6c62: $a6
	ld   l, h                                        ; $6c63: $6c
	dec  l                                           ; $6c64: $2d
	add  c                                           ; $6c65: $81
	ld   (hl), e                                     ; $6c66: $73
	ld   l, h                                        ; $6c67: $6c
	ret  z                                           ; $6c68: $c8

	ld   l, $a6                                      ; $6c69: $2e $a6
	ld   l, h                                        ; $6c6b: $6c
	add  c                                           ; $6c6c: $81
	ld   (hl), e                                     ; $6c6d: $73
	ld   l, h                                        ; $6c6e: $6c
	ret  z                                           ; $6c6f: $c8

	cpl                                              ; $6c70: $2f

jr_005_6c71:
	and  (hl)                                        ; $6c71: $a6
	ld   l, h                                        ; $6c72: $6c
	add  hl, bc                                      ; $6c73: $09
	inc  d                                           ; $6c74: $14
	inc  c                                           ; $6c75: $0c
	ld   h, $88                                      ; $6c76: $26 $88
	ld   a, a                                        ; $6c78: $7f
	ld   l, h                                        ; $6c79: $6c
	ld   b, d                                        ; $6c7a: $42
	ld   bc, $7781                                   ; $6c7b: $01 $81 $77
	ld   l, h                                        ; $6c7e: $6c
	ld   b, l                                        ; $6c7f: $45
	inc  c                                           ; $6c80: $0c
	add  (hl)                                        ; $6c81: $86
	add  a                                           ; $6c82: $87
	ld   l, h                                        ; $6c83: $6c
	add  c                                           ; $6c84: $81
	sbc  a                                           ; $6c85: $9f
	ld   l, h                                        ; $6c86: $6c
	inc  bc                                          ; $6c87: $03
	rst  $38                                         ; $6c88: $ff
	rst  $38                                         ; $6c89: $ff
	sub  h                                           ; $6c8a: $94
	ld   l, h                                        ; $6c8b: $6c
	rlca                                             ; $6c8c: $07
	rst  $38                                         ; $6c8d: $ff
	rst  $38                                         ; $6c8e: $ff
	sbc  e                                           ; $6c8f: $9b
	ld   l, h                                        ; $6c90: $6c
	rst  $38                                         ; $6c91: $ff
	rst  $38                                         ; $6c92: $ff
	rst  $38                                         ; $6c93: $ff
	rst  $00                                         ; $6c94: $c7
	cpl                                              ; $6c95: $2f
	add  b                                           ; $6c96: $80
	add  b                                           ; $6c97: $80
	add  c                                           ; $6c98: $81
	sbc  a                                           ; $6c99: $9f
	ld   l, h                                        ; $6c9a: $6c
	rst  $00                                         ; $6c9b: $c7
	ld   d, a                                        ; $6c9c: $57
	add  b                                           ; $6c9d: $80
	add  b                                           ; $6c9e: $80
	inc  d                                           ; $6c9f: $14
	add  hl, bc                                      ; $6ca0: $09
	inc  c                                           ; $6ca1: $0c
	ld   h, $81                                      ; $6ca2: $26 $81
	ld   bc, $c750                                   ; $6ca4: $01 $50 $c7
	nop                                              ; $6ca7: $00
	add  b                                           ; $6ca8: $80
	add  b                                           ; $6ca9: $80
	add  (hl)                                        ; $6caa: $86
	cp   d                                           ; $6cab: $ba

jr_005_6cac:
	ld   l, h                                        ; $6cac: $6c
	add  c                                           ; $6cad: $81
	or   d                                           ; $6cae: $b2
	ld   l, h                                        ; $6caf: $6c
	ld   b, l                                        ; $6cb0: $45
	inc  d                                           ; $6cb1: $14
	ld   b, a                                        ; $6cb2: $47
	inc  b                                           ; $6cb3: $04
	daa                                              ; $6cb4: $27
	add  hl, bc                                      ; $6cb5: $09
	inc  d                                           ; $6cb6: $14
	inc  c                                           ; $6cb7: $0c
	ld   d, $00                                      ; $6cb8: $16 $00
	inc  bc                                          ; $6cba: $03
	ld   (bc), a                                     ; $6cbb: $02
	nop                                              ; $6cbc: $00
	call z, $076c                                    ; $6cbd: $cc $6c $07
	ld   bc, $d106                                   ; $6cc0: $01 $06 $d1
	ld   l, h                                        ; $6cc3: $6c
	rlca                                             ; $6cc4: $07
	ld   (bc), a                                     ; $6cc5: $02
	rlca                                             ; $6cc6: $07
	sub  $6c                                         ; $6cc7: $d6 $6c
	rst  $38                                         ; $6cc9: $ff
	rst  $38                                         ; $6cca: $ff
	rst  $38                                         ; $6ccb: $ff
	ld   d, b                                        ; $6ccc: $50
	dec  l                                           ; $6ccd: $2d
	add  c                                           ; $6cce: $81
	or   b                                           ; $6ccf: $b0
	ld   l, h                                        ; $6cd0: $6c
	ld   d, b                                        ; $6cd1: $50
	ld   l, $81                                      ; $6cd2: $2e $81
	or   b                                           ; $6cd4: $b0
	ld   l, h                                        ; $6cd5: $6c
	ld   d, b                                        ; $6cd6: $50
	cpl                                              ; $6cd7: $2f
	add  c                                           ; $6cd8: $81
	or   b                                           ; $6cd9: $b0
	ld   l, h                                        ; $6cda: $6c
	daa                                              ; $6cdb: $27
	add  hl, bc                                      ; $6cdc: $09
	inc  c                                           ; $6cdd: $0c
	ld   bc, $1041                                   ; $6cde: $01 $41 $10
	ld   d, b                                        ; $6ce1: $50
	jr   nc, jr_005_6c71                             ; $6ce2: $30 $8d

	inc  bc                                          ; $6ce4: $03
	ld   b, $51                                      ; $6ce5: $06 $51
	jr   nc, jr_005_6cac                             ; $6ce7: $30 $c3

	ld   a, (bc)                                     ; $6ce9: $0a
	ld   l, h                                        ; $6cea: $6c
	ld   l, l                                        ; $6ceb: $6d
	jp   $f680                                       ; $6cec: $c3 $80 $f6


	ld   l, h                                        ; $6cef: $6c
	add  l                                           ; $6cf0: $85
	.db  $fc                                         ; $6cf1: $fc
	ld   l, h                                        ; $6cf2: $6c
	add  c                                           ; $6cf3: $81
	pop  hl                                          ; $6cf4: $e1
	ld   l, h                                        ; $6cf5: $6c
	add  l                                           ; $6cf6: $85
	inc  (hl)                                        ; $6cf7: $34
	ld   l, l                                        ; $6cf8: $6d
	add  c                                           ; $6cf9: $81
	pop  hl                                          ; $6cfa: $e1
	ld   l, h                                        ; $6cfb: $6c
	rlca                                             ; $6cfc: $07
	adc  $18                                         ; $6cfd: $ce $18
	inc  sp                                          ; $6cff: $33
	ld   l, l                                        ; $6d00: $6d
	rst  $00                                         ; $6d01: $c7
	nop                                              ; $6d02: $00
	rst  $38                                         ; $6d03: $ff
	add  c                                           ; $6d04: $81
	rst  $00                                         ; $6d05: $c7
	nop                                              ; $6d06: $00
	rst  $38                                         ; $6d07: $ff
	add  d                                           ; $6d08: $82
	rst  $00                                         ; $6d09: $c7
	nop                                              ; $6d0a: $00
	rst  $38                                         ; $6d0b: $ff
	add  e                                           ; $6d0c: $83
	rst  $00                                         ; $6d0d: $c7
	and  (hl)                                        ; $6d0e: $a6
	add  b                                           ; $6d0f: $80
	add  c                                           ; $6d10: $81
	rst  $00                                         ; $6d11: $c7
	and  $80                                         ; $6d12: $e6 $80
	add  d                                           ; $6d14: $82
	rst  $00                                         ; $6d15: $c7
	adc  $80                                         ; $6d16: $ce $80
	add  e                                           ; $6d18: $83
	rst  $00                                         ; $6d19: $c7
	xor  d                                           ; $6d1a: $aa
	add  c                                           ; $6d1b: $81
	add  c                                           ; $6d1c: $81
	rst  $00                                         ; $6d1d: $c7
	ld   ($8281), a                                  ; $6d1e: $ea $81 $82
	rst  $00                                         ; $6d21: $c7
	jp   nc, $8381                                   ; $6d22: $d2 $81 $83

	rst  $00                                         ; $6d25: $c7
	nop                                              ; $6d26: $00
	add  d                                           ; $6d27: $82
	add  c                                           ; $6d28: $81
	rst  $00                                         ; $6d29: $c7
	nop                                              ; $6d2a: $00
	add  d                                           ; $6d2b: $82
	add  d                                           ; $6d2c: $82
	rst  $00                                         ; $6d2d: $c7
	nop                                              ; $6d2e: $00
	add  d                                           ; $6d2f: $82
	add  e                                           ; $6d30: $83
	ld   b, b                                        ; $6d31: $40
	.db  $10                                         ; $6d32: $10
	inc  h                                           ; $6d33: $24
	ld   ($18ce), sp                                 ; $6d34: $08 $ce $18
	inc  sp                                          ; $6d37: $33
	ld   l, l                                        ; $6d38: $6d
	rst  $00                                         ; $6d39: $c7
	nop                                              ; $6d3a: $00
	.db  $fd                                         ; $6d3b: $fd
	add  c                                           ; $6d3c: $81
	rst  $00                                         ; $6d3d: $c7
	nop                                              ; $6d3e: $00
	.db  $fd                                         ; $6d3f: $fd
	add  d                                           ; $6d40: $82
	rst  $00                                         ; $6d41: $c7
	nop                                              ; $6d42: $00
	.db  $fd                                         ; $6d43: $fd
	add  e                                           ; $6d44: $83
	rst  $00                                         ; $6d45: $c7
	and  (hl)                                        ; $6d46: $a6
	cp   $81                                         ; $6d47: $fe $81
	rst  $00                                         ; $6d49: $c7
	and  $fe                                         ; $6d4a: $e6 $fe
	add  d                                           ; $6d4c: $82
	rst  $00                                         ; $6d4d: $c7
	adc  $fe                                         ; $6d4e: $ce $fe
	add  e                                           ; $6d50: $83
	rst  $00                                         ; $6d51: $c7
	xor  d                                           ; $6d52: $aa
	rst  $38                                         ; $6d53: $ff
	add  c                                           ; $6d54: $81
	rst  $00                                         ; $6d55: $c7
	ld   ($82ff), a                                  ; $6d56: $ea $ff $82
	rst  $00                                         ; $6d59: $c7
	jp   nc, $83ff                                   ; $6d5a: $d2 $ff $83

	rst  $00                                         ; $6d5d: $c7
	nop                                              ; $6d5e: $00
	add  b                                           ; $6d5f: $80
	add  c                                           ; $6d60: $81
	rst  $00                                         ; $6d61: $c7
	nop                                              ; $6d62: $00
	add  b                                           ; $6d63: $80
	add  d                                           ; $6d64: $82
	rst  $00                                         ; $6d65: $c7
	nop                                              ; $6d66: $00
	add  b                                           ; $6d67: $80
	add  e                                           ; $6d68: $83
	ld   b, b                                        ; $6d69: $40
	.db  $10                                         ; $6d6a: $10
	inc  h                                           ; $6d6b: $24
	ld   b, e                                        ; $6d6c: $43
	or   b                                           ; $6d6d: $b0
	add  hl, bc                                      ; $6d6e: $09
	inc  c                                           ; $6d6f: $0c
	adc  c                                           ; $6d70: $89
	xor  (hl)                                        ; $6d71: $ae
	dec  d                                           ; $6d72: $15
	ld   b, d                                        ; $6d73: $42
	inc  a                                           ; $6d74: $3c
	ld   b, e                                        ; $6d75: $43
	sbc  (hl)                                        ; $6d76: $9e
	add  hl, bc                                      ; $6d77: $09
	daa                                              ; $6d78: $27
	inc  d                                           ; $6d79: $14
	inc  c                                           ; $6d7a: $0c
	ld   d, l                                        ; $6d7b: $55
	sbc  (hl)                                        ; $6d7c: $9e
	ld   d, l                                        ; $6d7d: $55
	or   b                                           ; $6d7e: $b0
	sub  b                                           ; $6d7f: $90
	inc  d                                           ; $6d80: $14
	inc  d                                           ; $6d81: $14
	rlca                                             ; $6d82: $07
	ret  z                                           ; $6d83: $c8

	inc  sp                                          ; $6d84: $33
	cp   l                                           ; $6d85: $bd
	ld   l, (hl)                                     ; $6d86: $6e
	ld   b, d                                        ; $6d87: $42
	ld   bc, $7b81                                   ; $6d88: $01 $81 $7b
	ld   l, l                                        ; $6d8b: $6d
	add  hl, bc                                      ; $6d8c: $09
	daa                                              ; $6d8d: $27
	inc  d                                           ; $6d8e: $14
	inc  c                                           ; $6d8f: $0c
	ld   d, l                                        ; $6d90: $55
	sbc  (hl)                                        ; $6d91: $9e
	ld   d, l                                        ; $6d92: $55
	or   b                                           ; $6d93: $b0
	sub  b                                           ; $6d94: $90
	.db  $ec                                         ; $6d95: $ec
	inc  d                                           ; $6d96: $14
	ld   ($33c8), sp                                 ; $6d97: $08 $c8 $33
	cp   l                                           ; $6d9a: $bd
	ld   l, (hl)                                     ; $6d9b: $6e
	ld   b, d                                        ; $6d9c: $42
	ld   bc, $9081                                   ; $6d9d: $01 $81 $90
	ld   l, l                                        ; $6da0: $6d
	add  hl, bc                                      ; $6da1: $09
	daa                                              ; $6da2: $27
	inc  d                                           ; $6da3: $14
	ld   b, a                                        ; $6da4: $47
	inc  b                                           ; $6da5: $04
	inc  c                                           ; $6da6: $0c
	ld   d, l                                        ; $6da7: $55
	sbc  (hl)                                        ; $6da8: $9e
	ld   d, l                                        ; $6da9: $55
	or   b                                           ; $6daa: $b0
	sub  b                                           ; $6dab: $90
	inc  e                                           ; $6dac: $1c
	ldi  (hl), a                                     ; $6dad: $22
	rlca                                             ; $6dae: $07
	ld   b, d                                        ; $6daf: $42
	ld   bc, $30c8                                   ; $6db0: $01 $c8 $30
	cp   h                                           ; $6db3: $bc
	ld   l, l                                        ; $6db4: $6d
	ret  z                                           ; $6db5: $c8

	inc  sp                                          ; $6db6: $33
	cp   l                                           ; $6db7: $bd
	ld   l, (hl)                                     ; $6db8: $6e
	add  c                                           ; $6db9: $81
	and  a                                           ; $6dba: $a7
	ld   l, l                                        ; $6dbb: $6d
	jp   $a7fb                                       ; $6dbc: $c3 $fb $a7


	ld   l, l                                        ; $6dbf: $6d
	add  hl, bc                                      ; $6dc0: $09
	ret  nz                                          ; $6dc1: $c0

	or   e                                           ; $6dc2: $b3
	nop                                              ; $6dc3: $00
	inc  c                                           ; $6dc4: $0c
	add  c                                           ; $6dc5: $81
	and  a                                           ; $6dc6: $a7
	ld   l, l                                        ; $6dc7: $6d
	add  hl, bc                                      ; $6dc8: $09
	daa                                              ; $6dc9: $27
	inc  d                                           ; $6dca: $14
	ld   b, a                                        ; $6dcb: $47
	inc  b                                           ; $6dcc: $04
	inc  c                                           ; $6dcd: $0c
	ld   d, l                                        ; $6dce: $55
	sbc  (hl)                                        ; $6dcf: $9e
	ld   d, l                                        ; $6dd0: $55
	or   b                                           ; $6dd1: $b0
	sub  b                                           ; $6dd2: $90
	.db  $e4                                         ; $6dd3: $e4
	ldi  (hl), a                                     ; $6dd4: $22
	ld   ($0142), sp                                 ; $6dd5: $08 $42 $01
	ret  z                                           ; $6dd8: $c8

	jr   nc, -$1d                                    ; $6dd9: $30 $e3

	ld   l, l                                        ; $6ddb: $6d
	ret  z                                           ; $6ddc: $c8

	inc  sp                                          ; $6ddd: $33
	cp   l                                           ; $6dde: $bd
	ld   l, (hl)                                     ; $6ddf: $6e
	add  c                                           ; $6de0: $81
	adc  $6d                                         ; $6de1: $ce $6d
	jp   $cefb                                       ; $6de3: $c3 $fb $ce


	ld   l, l                                        ; $6de6: $6d
	add  hl, bc                                      ; $6de7: $09
	ret  nz                                          ; $6de8: $c0

	or   e                                           ; $6de9: $b3
	nop                                              ; $6dea: $00
	inc  c                                           ; $6deb: $0c
	add  c                                           ; $6dec: $81
	adc  $6d                                         ; $6ded: $ce $6d
	add  hl, bc                                      ; $6def: $09
	inc  d                                           ; $6df0: $14
	inc  c                                           ; $6df1: $0c
	dec  e                                           ; $6df2: $1d
	ld   bc, $0241                                   ; $6df3: $01 $41 $02
	ld   (de), a                                     ; $6df6: $12
	adc  d                                           ; $6df7: $8a
	inc  bc                                          ; $6df8: $03
	ld   l, (hl)                                     ; $6df9: $6e
	ret  z                                           ; $6dfa: $c8

	inc  sp                                          ; $6dfb: $33
	cp   l                                           ; $6dfc: $bd
	ld   l, (hl)                                     ; $6dfd: $6e
	ld   b, d                                        ; $6dfe: $42
	ld   bc, $f681                                   ; $6dff: $01 $81 $f6
	ld   l, l                                        ; $6e02: $6d
	ld   b, d                                        ; $6e03: $42
	scf                                              ; $6e04: $37
	add  c                                           ; $6e05: $81
	or   $6d                                         ; $6e06: $f6 $6d
	ld   d, c                                        ; $6e08: $51
	jr   nc, $51                                     ; $6e09: $30 $51

	ld   sp, $3251                                   ; $6e0b: $31 $51 $32
	ld   d, c                                        ; $6e0e: $51
	inc  sp                                          ; $6e0f: $33
	ret  z                                           ; $6e10: $c8

	ldd  (hl), a                                     ; $6e11: $32
	add  hl, de                                      ; $6e12: $19
	ld   l, (hl)                                     ; $6e13: $6e
	ld   b, d                                        ; $6e14: $42
	ld   bc, $1081                                   ; $6e15: $01 $81 $10
	ld   l, (hl)                                     ; $6e18: $6e
	ld   b, d                                        ; $6e19: $42
	ld   a, (bc)                                     ; $6e1a: $0a
	jp   nz, $1007                                   ; $6e1b: $c2 $07 $10

	ld   l, (hl)                                     ; $6e1e: $6e
	ld   d, b                                        ; $6e1f: $50
	inc  sp                                          ; $6e20: $33
	nop                                              ; $6e21: $00
	daa                                              ; $6e22: $27
	add  hl, bc                                      ; $6e23: $09
	inc  c                                           ; $6e24: $0c
	ld   bc, $2689                                   ; $6e25: $01 $89 $26
	ld   d, $45                                      ; $6e28: $16 $45
	inc  l                                           ; $6e2a: $2c
	rst  $00                                         ; $6e2b: $c7
	and  a                                           ; $6e2c: $a7
	rst  $38                                         ; $6e2d: $ff
	add  c                                           ; $6e2e: $81
	rst  $00                                         ; $6e2f: $c7
	rst  $20                                         ; $6e30: $e7
	rst  $38                                         ; $6e31: $ff
	add  d                                           ; $6e32: $82
	rst  $00                                         ; $6e33: $c7
	rst  $08                                         ; $6e34: $cf
	rst  $38                                         ; $6e35: $ff
	add  e                                           ; $6e36: $83
	rst  $00                                         ; $6e37: $c7
	xor  e                                           ; $6e38: $ab
	add  b                                           ; $6e39: $80
	add  c                                           ; $6e3a: $81
	rst  $00                                         ; $6e3b: $c7
	.db  $eb                                         ; $6e3c: $eb
	add  b                                           ; $6e3d: $80
	add  d                                           ; $6e3e: $82
	rst  $00                                         ; $6e3f: $c7
	.db  $d3                                         ; $6e40: $d3
	add  b                                           ; $6e41: $80
	add  e                                           ; $6e42: $83
	adc  c                                           ; $6e43: $89
	ld   h, $16                                      ; $6e44: $26 $16
	ld   b, d                                        ; $6e46: $42
	ld   a, (bc)                                     ; $6e47: $0a
	.db $c2 $06 $43

	ld   l, (hl)                                     ; $6e4b: $6e
	ld   d, b                                        ; $6e4c: $50
	ldd  (hl), a                                     ; $6e4d: $32
	ld   b, d                                        ; $6e4e: $42
	dec  b                                           ; $6e4f: $05
	adc  c                                           ; $6e50: $89
	ld   h, $16                                      ; $6e51: $26 $16
	ld   d, c                                        ; $6e53: $51
	ldd  (hl), a                                     ; $6e54: $32
	adc  c                                           ; $6e55: $89
	ld   h, $16                                      ; $6e56: $26 $16
	ld   b, d                                        ; $6e58: $42
	ld   a, (bc)                                     ; $6e59: $0a
	adc  c                                           ; $6e5a: $89
	ld   h, $16                                      ; $6e5b: $26 $16
	ret  z                                           ; $6e5d: $c8

	inc  sp                                          ; $6e5e: $33
	ld   h, e                                        ; $6e5f: $63
	ld   l, (hl)                                     ; $6e60: $6e
	ld   b, e                                        ; $6e61: $43
	sbc  (hl)                                        ; $6e62: $9e
	ld   d, h                                        ; $6e63: $54
	rst  $38                                         ; $6e64: $ff
	rst  $00                                         ; $6e65: $c7
	nop                                              ; $6e66: $00
	rst  $38                                         ; $6e67: $ff
	add  c                                           ; $6e68: $81
	rst  $00                                         ; $6e69: $c7
	nop                                              ; $6e6a: $00
	rst  $38                                         ; $6e6b: $ff
	add  d                                           ; $6e6c: $82
	rst  $00                                         ; $6e6d: $c7
	nop                                              ; $6e6e: $00
	rst  $38                                         ; $6e6f: $ff
	add  e                                           ; $6e70: $83
	rst  $00                                         ; $6e71: $c7
	nop                                              ; $6e72: $00
	add  b                                           ; $6e73: $80
	add  c                                           ; $6e74: $81
	rst  $00                                         ; $6e75: $c7
	nop                                              ; $6e76: $00
	add  b                                           ; $6e77: $80
	add  d                                           ; $6e78: $82
	rst  $00                                         ; $6e79: $c7
	nop                                              ; $6e7a: $00
	add  b                                           ; $6e7b: $80
	add  e                                           ; $6e7c: $83
	rst  $00                                         ; $6e7d: $c7
	nop                                              ; $6e7e: $00
	add  c                                           ; $6e7f: $81
	add  c                                           ; $6e80: $81
	rst  $00                                         ; $6e81: $c7
	nop                                              ; $6e82: $00
	add  c                                           ; $6e83: $81
	add  d                                           ; $6e84: $82
	rst  $00                                         ; $6e85: $c7
	nop                                              ; $6e86: $00
	add  c                                           ; $6e87: $81
	add  e                                           ; $6e88: $83
	rst  $00                                         ; $6e89: $c7
	nop                                              ; $6e8a: $00
	add  d                                           ; $6e8b: $82
	add  c                                           ; $6e8c: $81
	rst  $00                                         ; $6e8d: $c7
	nop                                              ; $6e8e: $00
	add  d                                           ; $6e8f: $82
	add  d                                           ; $6e90: $82
	rst  $00                                         ; $6e91: $c7
	nop                                              ; $6e92: $00
	add  d                                           ; $6e93: $82
	add  e                                           ; $6e94: $83
	inc  b                                           ; $6e95: $04
	ld   b, d                                        ; $6e96: $42
	ld   ($0391), sp                                 ; $6e97: $08 $91 $03
	rst  $38                                         ; $6e9a: $ff
	ld   d, h                                        ; $6e9b: $54
	rst  $38                                         ; $6e9c: $ff
	ld   b, d                                        ; $6e9d: $42
	add  b                                           ; $6e9e: $80
	sub  d                                           ; $6e9f: $92
	and  e                                           ; $6ea0: $a3
	ld   l, (hl)                                     ; $6ea1: $6e
	nop                                              ; $6ea2: $00
	.db  $10                                         ; $6ea3: $10
	inc  bc                                          ; $6ea4: $03
	inc  b                                           ; $6ea5: $04
	ld   c, b                                        ; $6ea6: $48
	sub  h                                           ; $6ea7: $94
	inc  c                                           ; $6ea8: $0c
	adc  c                                           ; $6ea9: $89
	inc  b                                           ; $6eaa: $04
	ld   d, $01                                      ; $6eab: $16 $01
	ld   b, c                                        ; $6ead: $41
	inc  bc                                          ; $6eae: $03
	ld   b, h                                        ; $6eaf: $44
	inc  b                                           ; $6eb0: $04
	ld   b, b                                        ; $6eb1: $40
	inc  b                                           ; $6eb2: $04
	add  hl, hl                                      ; $6eb3: $29
	ld   b, b                                        ; $6eb4: $40
	inc  b                                           ; $6eb5: $04
	add  hl, hl                                      ; $6eb6: $29
	jp   nz, $b13c                                   ; $6eb7: $c2 $3c $b1

	ld   l, (hl)                                     ; $6eba: $6e
	ld   b, d                                        ; $6ebb: $42
	rrca                                             ; $6ebc: $0f
	nop                                              ; $6ebd: $00
	ld   b, a                                        ; $6ebe: $47
	inc  bc                                          ; $6ebf: $03
	add  l                                           ; $6ec0: $85
	ld   ($184f), a                                  ; $6ec1: $ea $4f $18
	add  l                                           ; $6ec4: $85
	ldi  a, (hl)                                     ; $6ec5: $2a
	ld   l, a                                        ; $6ec6: $6f
	nop                                              ; $6ec7: $00
	ld   b, a                                        ; $6ec8: $47
	inc  bc                                          ; $6ec9: $03
	add  l                                           ; $6eca: $85
	ld   ($184f), a                                  ; $6ecb: $ea $4f $18
	add  l                                           ; $6ece: $85
	ldi  a, (hl)                                     ; $6ecf: $2a
	ld   l, a                                        ; $6ed0: $6f
	ld   c, b                                        ; $6ed1: $48
	ld   bc, $1450                                   ; $6ed2: $01 $50 $14
	nop                                              ; $6ed5: $00
	ld   b, a                                        ; $6ed6: $47
	inc  bc                                          ; $6ed7: $03
	add  l                                           ; $6ed8: $85
	ld   ($184f), a                                  ; $6ed9: $ea $4f $18
	add  l                                           ; $6edc: $85
	ldi  a, (hl)                                     ; $6edd: $2a
	ld   l, a                                        ; $6ede: $6f
	ld   c, b                                        ; $6edf: $48
	ld   bc, $1450                                   ; $6ee0: $01 $50 $14
	ld   c, b                                        ; $6ee3: $48
	ld   (bc), a                                     ; $6ee4: $02
	ld   d, b                                        ; $6ee5: $50
	dec  d                                           ; $6ee6: $15
	nop                                              ; $6ee7: $00
	ld   b, a                                        ; $6ee8: $47
	inc  bc                                          ; $6ee9: $03
	add  l                                           ; $6eea: $85
	ld   ($184f), a                                  ; $6eeb: $ea $4f $18
	add  l                                           ; $6eee: $85
	ldi  a, (hl)                                     ; $6eef: $2a
	ld   l, a                                        ; $6ef0: $6f
	ld   c, b                                        ; $6ef1: $48
	ld   bc, $1450                                   ; $6ef2: $01 $50 $14
	ld   c, b                                        ; $6ef5: $48
	ld   (bc), a                                     ; $6ef6: $02
	ld   d, b                                        ; $6ef7: $50
	dec  d                                           ; $6ef8: $15
	ld   c, b                                        ; $6ef9: $48
	inc  b                                           ; $6efa: $04
	nop                                              ; $6efb: $00
	ld   b, a                                        ; $6efc: $47
	inc  bc                                          ; $6efd: $03
	add  l                                           ; $6efe: $85
	ld   ($184f), a                                  ; $6eff: $ea $4f $18
	add  l                                           ; $6f02: $85
	ldi  a, (hl)                                     ; $6f03: $2a
	ld   l, a                                        ; $6f04: $6f
	ld   c, b                                        ; $6f05: $48
	ld   bc, $1450                                   ; $6f06: $01 $50 $14
	ld   c, b                                        ; $6f09: $48
	ld   (bc), a                                     ; $6f0a: $02
	ld   d, b                                        ; $6f0b: $50
	dec  d                                           ; $6f0c: $15
	ld   c, b                                        ; $6f0d: $48
	inc  b                                           ; $6f0e: $04
	ld   c, b                                        ; $6f0f: $48
	.db  $10                                         ; $6f10: $10
	nop                                              ; $6f11: $00
	ld   b, a                                        ; $6f12: $47
	inc  bc                                          ; $6f13: $03
	add  l                                           ; $6f14: $85
	ld   ($184f), a                                  ; $6f15: $ea $4f $18
	add  l                                           ; $6f18: $85
	ldi  a, (hl)                                     ; $6f19: $2a
	ld   l, a                                        ; $6f1a: $6f
	ld   c, b                                        ; $6f1b: $48
	ld   bc, $1450                                   ; $6f1c: $01 $50 $14
	ld   c, b                                        ; $6f1f: $48
	ld   (bc), a                                     ; $6f20: $02
	ld   d, b                                        ; $6f21: $50
	dec  d                                           ; $6f22: $15
	ld   c, b                                        ; $6f23: $48
	inc  b                                           ; $6f24: $04
	ld   c, b                                        ; $6f25: $48
	.db $20 $48

	.db  $10                                         ; $6f28: $10
	nop                                              ; $6f29: $00
	ld   d, d                                        ; $6f2a: $52
	inc  b                                           ; $6f2b: $04
	ld   d, d                                        ; $6f2c: $52
	inc  bc                                          ; $6f2d: $03
	ld   d, d                                        ; $6f2e: $52
	ld   (bc), a                                     ; $6f2f: $02
	ld   d, d                                        ; $6f30: $52
	ld   bc, $0052                                   ; $6f31: $01 $52 $00
	jp   nz, $2a04                                   ; $6f34: $c2 $04 $2a

	ld   l, a                                        ; $6f37: $6f
	ld   c, d                                        ; $6f38: $4a
	ld   bc, $024a                                   ; $6f39: $01 $4a $02
	ld   c, d                                        ; $6f3c: $4a
	inc  b                                           ; $6f3d: $04
	ld   c, d                                        ; $6f3e: $4a
	ld   ($c219), sp                                 ; $6f3f: $08 $19 $c2
	inc  c                                           ; $6f42: $0c
	ld   b, b                                        ; $6f43: $40
	ld   l, a                                        ; $6f44: $6f
	ld   c, h                                        ; $6f45: $4c
	rst  $38                                         ; $6f46: $ff
	ld   c, (hl)                                     ; $6f47: $4e
	rst  $38                                         ; $6f48: $ff
	ld   d, e                                        ; $6f49: $53
	rst  $38                                         ; $6f4a: $ff
	dec  de                                          ; $6f4b: $1b
	jp   nz, $4b3f                                   ; $6f4c: $c2 $3f $4b

	ld   l, a                                        ; $6f4f: $6f
	dec  h                                           ; $6f50: $25

jr_005_6f51:
	dec  h                                           ; $6f51: $25
	inc  h                                           ; $6f52: $24
