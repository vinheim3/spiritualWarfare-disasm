; Disassembly of "OR"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3

func_01_094b:
	ld   a, $00                                      ; $494b: $3e $00
	ld   hl, $c0ff                                   ; $494d: $21 $ff $c0
	ld   (hl), a                                     ; $4950: $77
	ld   hl, $c0fe                                   ; $4951: $21 $fe $c0
	ld   (hl), a                                     ; $4954: $77
	ret                                              ; $4955: $c9


getRoomIdxWithinAllRooms:
// save the following 2
	ld   hl, wCurrRoomGroupWidth                                   ; $4956: $21 $36 $c0
	ld   a, (hl)                                     ; $4959: $7e
	push af                                          ; $495a: $f5
	ld   hl, wCurrRoomGroupHeight                                   ; $495b: $21 $37 $c0
	ld   a, (hl)                                     ; $495e: $7e
	push af                                          ; $495f: $f5
// room group into c00a
	ld   hl, wCurrRoomGroup                                   ; $4960: $21 $33 $c0
	ld   a, (hl)                                     ; $4963: $7e
	ld   hl, $c00a                                   ; $4964: $21 $0a $c0
	ld   (hl), a                                     ; $4967: $77
// clear c008 and c009
	ld   a, $00                                      ; $4968: $3e $00
	ld   hl, $c008                                   ; $496a: $21 $08 $c0
	ld   (hl), a                                     ; $496d: $77
	ld   hl, $c009                                   ; $496e: $21 $09 $c0
	ld   (hl), a                                     ; $4971: $77

// start at room group 0
	ld   hl, wCurrRoomGroup                                   ; $4972: $21 $33 $c0
	ld   (hl), a                                     ; $4975: $77
-
	ld   hl, wCurrRoomGroup                                   ; $4976: $21 $33 $c0
	ld   a, (hl)                                     ; $4979: $7e
	ld   hl, $c00a                                   ; $497a: $21 $0a $c0
	cp   (hl)                                        ; $497d: $be
	jr   z, @nowAtActualCurrRoomGroup                              ; $497e: $28 $1e

// get size of earlier room groups, and add to c009/8
	ld   a, $01                                      ; $4980: $3e $01
	call call_b0_getCurrRoomGroupsWidthAndHeight                                       ; $4982: $cd $45 $02
	ld   hl, wCurrRoomGroupWidth                                   ; $4985: $21 $36 $c0
	ld   c, (hl)                                     ; $4988: $4e
	ld   b, $00                                      ; $4989: $06 $00
	ld   hl, wCurrRoomGroupHeight                                   ; $498b: $21 $37 $c0
	ld   e, (hl)                                     ; $498e: $5e
	ld   d, $00                                      ; $498f: $16 $00
	call ecEquEtimesC                                       ; $4991: $cd $03 $08
	call addECto_c009_c008                                       ; $4994: $cd $c6 $09
	ld   hl, wCurrRoomGroup                                   ; $4997: $21 $33 $c0
	inc  (hl)                                        ; $499a: $34
	jp   -                                       ; $499b: $c3 $76 $09

@nowAtActualCurrRoomGroup:
// restore wCurrRoomGroup
	ld   hl, $c00a                                   ; $499e: $21 $0a $c0
	ld   a, (hl)                                     ; $49a1: $7e
	ld   hl, wCurrRoomGroup                                   ; $49a2: $21 $33 $c0
	ld   (hl), a                                     ; $49a5: $77
// restore group height and width
	pop  af                                          ; $49a6: $f1
	ld   hl, wCurrRoomGroupHeight                                   ; $49a7: $21 $37 $c0
	ld   (hl), a                                     ; $49aa: $77
	pop  af                                          ; $49ab: $f1
	ld   hl, wCurrRoomGroupWidth                                   ; $49ac: $21 $36 $c0
	ld   (hl), a                                     ; $49af: $77

// ec is idx of room within group
	ld   hl, wCurrRoomGroupWidth                                   ; $49b0: $21 $36 $c0
	ld   c, (hl)                                     ; $49b3: $4e
	ld   b, $00                                      ; $49b4: $06 $00
	ld   hl, wCurrRoomY                                   ; $49b6: $21 $35 $c0
	ld   e, (hl)                                     ; $49b9: $5e
	ld   d, $00                                      ; $49ba: $16 $00
	call ecEquEtimesC                                       ; $49bc: $cd $03 $08
	ld   hl, wCurrRoomX                                   ; $49bf: $21 $34 $c0
	ld   a, (hl)                                     ; $49c2: $7e
	call ecPlusEquA                                       ; $49c3: $cd $3d $08

addECto_c009_c008:
	ld   a, c                                        ; $49c6: $79
	ld   hl, $c008                                   ; $49c7: $21 $08 $c0
	add  (hl)                                        ; $49ca: $86
	ld   (hl), a                                     ; $49cb: $77
	ld   a, e                                        ; $49cc: $7b
	ld   hl, $c009                                   ; $49cd: $21 $09 $c0
	adc  (hl)                                        ; $49d0: $8e
	ld   (hl), a                                     ; $49d1: $77
	ret                                              ; $49d2: $c9


func_01_09d3:
	call func_01_09ea                                       ; $49d3: $cd $ea $09
	jr   z, +                              ; $49d6: $28 $03

	call jr_002_4a28                                       ; $49d8: $cd $28 $0a

+
	inc  bc                                          ; $49db: $03
	inc  bc                                          ; $49dc: $03
	ret                                              ; $49dd: $c9


func_01_09de:
	push bc                                          ; $49de: $c5
	call Call_000_0749                                       ; $49df: $cd $49 $07
	ld   hl, $c100                                   ; $49e2: $21 $00 $c1
	add  hl, bc                                      ; $49e5: $09
	or   (hl)                                        ; $49e6: $b6
	ld   (hl), a                                     ; $49e7: $77
	pop  bc                                          ; $49e8: $c1
	ret                                              ; $49e9: $c9


func_01_09ea:
	ld   bc, $0000                                   ; $49ea: $01 $00 $00
func_01_09ed:
	ld   hl, $c0ff                                   ; $49ed: $21 $ff $c0
	ld   a, c                                        ; $49f0: $79
	cp   (hl)                                        ; $49f1: $be
	jr   z, @clearZflag                              ; $49f2: $28 $19

	ld   hl, $c100                                   ; $49f4: $21 $00 $c1
	add  hl, bc                                      ; $49f7: $09
	ld   a, (hl)                                     ; $49f8: $7e
	ld   hl, $c008                                   ; $49f9: $21 $08 $c0
	cp   (hl)                                        ; $49fc: $be
	jr   nz, jr_002_4a12                             ; $49fd: $20 $13

	ld   hl, $c101                                   ; $49ff: $21 $01 $c1
	add  hl, bc                                      ; $4a02: $09
	ld   a, (hl)                                     ; $4a03: $7e
	and  $0f                                         ; $4a04: $e6 $0f
	ld   hl, $c009                                   ; $4a06: $21 $09 $c0
	cp   (hl)                                        ; $4a09: $be
	jr   nz, jr_002_4a12                             ; $4a0a: $20 $06

// set z flag
	ret                                              ; $4a0c: $c9

@clearZflag:
	ld   a, $ff                                      ; $4a0d: $3e $ff
	cp   $00                                         ; $4a0f: $fe $00
	ret                                              ; $4a11: $c9


jr_002_4a12:
	ld   hl, $c101                                   ; $4a12: $21 $01 $c1
	add  hl, bc                                      ; $4a15: $09
	ld   a, (hl)                                     ; $4a16: $7e
	call aDivEqu16                                       ; $4a17: $cd $fa $07
	ld   hl, $c00b                                   ; $4a1a: $21 $0b $c0
	ld   (hl), a                                     ; $4a1d: $77
	inc  (hl)                                        ; $4a1e: $34
	scf                                              ; $4a1f: $37
	ld   a, c                                        ; $4a20: $79
	adc  (hl)                                        ; $4a21: $8e
	ld   c, a                                        ; $4a22: $4f
	ld   b, $00                                      ; $4a23: $06 $00
	jp   func_01_09ed                                       ; $4a25: $c3 $ed $09


jr_002_4a28:
	ld   hl, $c0fc                                   ; $4a28: $21 $fc $c0
	ld   a, (hl)                                     ; $4a2b: $7e
	add  $07                                         ; $4a2c: $c6 $07
	srl  a                                           ; $4a2e: $cb $3f
	srl  a                                           ; $4a30: $cb $3f
	srl  a                                           ; $4a32: $cb $3f
	ld   hl, $c00b                                   ; $4a34: $21 $0b $c0
	ld   (hl), a                                     ; $4a37: $77
	ld   hl, $c0fe                                   ; $4a38: $21 $fe $c0
	ld   a, (hl)                                     ; $4a3b: $7e
	cp   $0a                                         ; $4a3c: $fe $0a
	jr   c, jr_002_4a77                              ; $4a3e: $38 $37

jr_002_4a40:
	ld   hl, $c101                                   ; $4a40: $21 $01 $c1
	ld   a, (hl)                                     ; $4a43: $7e
	call aDivEqu16                                       ; $4a44: $cd $fa $07
	add  $02                                         ; $4a47: $c6 $02
	ld   e, a                                        ; $4a49: $5f
	ld   d, $00                                      ; $4a4a: $16 $00
	ld   bc, $0000                                   ; $4a4c: $01 $00 $00
	ld   hl, $c0ff                                   ; $4a4f: $21 $ff $c0
	ld   a, e                                        ; $4a52: $7b
	cp   (hl)                                        ; $4a53: $be
	jr   nc, jr_002_4a65                             ; $4a54: $30 $0f

	ld   hl, $c100                                   ; $4a56: $21 $00 $c1
	add  hl, de                                      ; $4a59: $19
	ld   a, (hl)                                     ; $4a5a: $7e
	ld   hl, $c100                                   ; $4a5b: $21 $00 $c1
	add  hl, bc                                      ; $4a5e: $09
	ld   (hl), a                                     ; $4a5f: $77
	inc  bc                                          ; $4a60: $03
	inc  de                                          ; $4a61: $13
	jp   $0a4f                                       ; $4a62: $c3 $4f $0a


jr_002_4a65:
	ld   hl, $c0ff                                   ; $4a65: $21 $ff $c0
	ld   (hl), c                                     ; $4a68: $71
	ld   hl, $c0fe                                   ; $4a69: $21 $fe $c0
	dec  (hl)                                        ; $4a6c: $35
	bit  7, (hl)                                     ; $4a6d: $cb $7e
	jr   z, jr_002_4a28                              ; $4a6f: $28 $b7

	call func_01_094b                                       ; $4a71: $cd $4b $09
	jp   $0a28                                       ; $4a74: $c3 $28 $0a


jr_002_4a77:
	ld   a, $40                                      ; $4a77: $3e $40
	ld   hl, $c0ff                                   ; $4a79: $21 $ff $c0
	sub  (hl)                                        ; $4a7c: $96
	jr   c, jr_002_4a40                              ; $4a7d: $38 $c1

	sbc  $02                                         ; $4a7f: $de $02
	jr   c, jr_002_4a40                              ; $4a81: $38 $bd

	ld   hl, $c00b                                   ; $4a83: $21 $0b $c0
	sbc  (hl)                                        ; $4a86: $9e
	jr   c, jr_002_4a40                              ; $4a87: $38 $b7

	ld   hl, $c0ff                                   ; $4a89: $21 $ff $c0
	ld   c, (hl)                                     ; $4a8c: $4e
	ld   b, $00                                      ; $4a8d: $06 $00
	ld   hl, $c008                                   ; $4a8f: $21 $08 $c0
	ld   a, (hl)                                     ; $4a92: $7e
	ld   hl, $c100                                   ; $4a93: $21 $00 $c1
	add  hl, bc                                      ; $4a96: $09
	ld   (hl), a                                     ; $4a97: $77
	ld   hl, $c00b                                   ; $4a98: $21 $0b $c0
	ld   a, (hl)                                     ; $4a9b: $7e
	sla  a                                           ; $4a9c: $cb $27
	sla  a                                           ; $4a9e: $cb $27
	sla  a                                           ; $4aa0: $cb $27
	sla  a                                           ; $4aa2: $cb $27
	ld   hl, $c009                                   ; $4aa4: $21 $09 $c0
	or   (hl)                                        ; $4aa7: $b6
	ld   hl, $c101                                   ; $4aa8: $21 $01 $c1
	add  hl, bc                                      ; $4aab: $09
	ld   (hl), a                                     ; $4aac: $77
	inc  bc                                          ; $4aad: $03
	inc  bc                                          ; $4aae: $03
	ld   hl, $c00b                                   ; $4aaf: $21 $0b $c0
	ld   e, (hl)                                     ; $4ab2: $5e
	ld   d, $00                                      ; $4ab3: $16 $00
	ld   a, e                                        ; $4ab5: $7b
	cp   $00                                         ; $4ab6: $fe $00
	jr   z, jr_002_4ac7                              ; $4ab8: $28 $0d

	ld   a, $00                                      ; $4aba: $3e $00

jr_002_4abc:
	ld   hl, $c100                                   ; $4abc: $21 $00 $c1
	add  hl, bc                                      ; $4abf: $09
	ld   (hl), a                                     ; $4ac0: $77
	inc  bc                                          ; $4ac1: $03
	dec  de                                          ; $4ac2: $1b
	ld   a, e                                        ; $4ac3: $7b
	or   d                                           ; $4ac4: $b2
	jr   nz, jr_002_4abc                             ; $4ac5: $20 $f5

jr_002_4ac7:
	ld   a, c                                        ; $4ac7: $79
	ld   hl, $c0ff                                   ; $4ac8: $21 $ff $c0
	ld   c, (hl)                                     ; $4acb: $4e
	ld   b, $00                                      ; $4acc: $06 $00
	ld   (hl), a                                     ; $4ace: $77
	ld   hl, $c0fe                                   ; $4acf: $21 $fe $c0
	inc  (hl)                                        ; $4ad2: $34
	ret                                              ; $4ad3: $c9


	ld   d, h                                        ; $4ad4: $54
	ld   (hl), d                                     ; $4ad5: $72
	ld   (hl), l                                     ; $4ad6: $75
	ld   h, l                                        ; $4ad7: $65
	ld   b, (hl)                                     ; $4ad8: $46
	ld   h, c                                        ; $4ad9: $61
	ld   l, h                                        ; $4ada: $6c
	ld   (hl), e                                     ; $4adb: $73
	ld   h, l                                        ; $4adc: $65
	ld   hl, $5198                                   ; $4add: $21 $98 $51
	ld   (hl), l                                     ; $4ae0: $75
	ld   h, l                                        ; $4ae1: $65
	ld   (hl), e                                     ; $4ae2: $73
	ld   (hl), h                                     ; $4ae3: $74
	ld   l, c                                        ; $4ae4: $69
	ld   l, a                                        ; $4ae5: $6f
	ld   l, (hl)                                     ; $4ae6: $6e
	jr   nz, $23                                     ; $4ae7: $20 $23

	ld   h, c                                        ; $4ae9: $61
	sbc  b                                           ; $4aea: $98
	ld   d, b                                        ; $4aeb: $50
	ld   (hl), d                                     ; $4aec: $72
	ld   l, c                                        ; $4aed: $69
	ld   a, d                                        ; $4aee: $7a
	ld   h, l                                        ; $4aef: $65
	ldd  a, (hl)                                     ; $4af0: $3a
	ld   b, a                                        ; $4af1: $47
	sbc  b                                           ; $4af2: $98
	call nc, $67d6                           ; $4af3: $d4 $d6 $67
	sbc  b                                           ; $4af6: $98
	push de                                          ; $4af7: $d5
	rst  $10                                         ; $4af8: $d7
	ld   b, a                                        ; $4af9: $47
	sbc  b                                           ; $4afa: $98
	call c, $e0de                                    ; $4afb: $dc $de $e0
	ld   ($ff00+c), a                                ; $4afe: $e2
	ldh  (<$e2), a                                   ; $4aff: $e0 $e2
	ld   h, a                                        ; $4b01: $67
	sbc  b                                           ; $4b02: $98
	.db  $dd                                         ; $4b03: $dd
	rst  $18                                         ; $4b04: $df
	pop  hl                                          ; $4b05: $e1
	.db  $e3                                         ; $4b06: $e3
	pop  hl                                          ; $4b07: $e1
	.db  $e3                                         ; $4b08: $e3
	ld   c, b                                        ; $4b09: $48
	sbc  b                                           ; $4b0a: $98
	ldh  (<$e2), a                                   ; $4b0b: $e0 $e2
	ld   l, b                                        ; $4b0d: $68
	sbc  b                                           ; $4b0e: $98
	pop  hl                                          ; $4b0f: $e1
	.db  $e3                                         ; $4b10: $e3
	ld   l, $98                                      ; $4b11: $2e $98
	or   h                                           ; $4b13: $b4
	or   (hl)                                        ; $4b14: $b6
	cp   b                                           ; $4b15: $b8
	cp   d                                           ; $4b16: $ba
	ld   c, (hl)                                     ; $4b17: $4e
	sbc  b                                           ; $4b18: $98
	or   l                                           ; $4b19: $b5
	or   a                                           ; $4b1a: $b7
	cp   c                                           ; $4b1b: $b9
	cp   e                                           ; $4b1c: $bb
	ld   l, (hl)                                     ; $4b1d: $6e
	sbc  b                                           ; $4b1e: $98
	.db  $f4                                         ; $4b1f: $f4
	or   $f8                                         ; $4b20: $f6 $f8
	ld   a, ($988e)                                  ; $4b22: $fa $8e $98
	push af                                          ; $4b25: $f5
	rst  $30                                         ; $4b26: $f7
	ld   sp, hl                                      ; $4b27: $f9
	ei                                               ; $4b28: $fb


func_01_0b29:
	ld   hl, $c020                                   ; $4b29: $21 $20 $c0
	ld   a, (hl)                                     ; $4b2c: $7e
	ld   hl, $c00a                                   ; $4b2d: $21 $0a $c0
	ld   (hl), a                                     ; $4b30: $77
	cp   $ff                                         ; $4b31: $fe $ff
	jr   nz, jr_002_4b49                             ; $4b33: $20 $14

	ld   hl, $c4df                                   ; $4b35: $21 $df $c4
	ld   a, (hl)                                     ; $4b38: $7e
	ld   hl, $c00a                                   ; $4b39: $21 $0a $c0
	ld   (hl), a                                     ; $4b3c: $77
	add  $01                                         ; $4b3d: $c6 $01
	cp   $fa                                         ; $4b3f: $fe $fa
	jr   c, jr_002_4b45                              ; $4b41: $38 $02

	ld   a, $00                                      ; $4b43: $3e $00

jr_002_4b45:
	ld   hl, $c4df                                   ; $4b45: $21 $df $c4
	ld   (hl), a                                     ; $4b48: $77

jr_002_4b49:
	call $0bed                                       ; $4b49: $cd $ed $0b
	ld   hl, $0ae9                                   ; $4b4c: $21 $e9 $0a
	ld   c, $06                                      ; $4b4f: $0e $06
	call $0bdd                                       ; $4b51: $cd $dd $0b
	ld   hl, $0add                                   ; $4b54: $21 $dd $0a
	ld   c, $0a                                      ; $4b57: $0e $0a
	call $0bdd                                       ; $4b59: $cd $dd $0b
	ld   c, $04                                      ; $4b5c: $0e $04
	ld   hl, $0b11                                   ; $4b5e: $21 $11 $0b
	call $0bdd                                       ; $4b61: $cd $dd $0b
	ld   c, $04                                      ; $4b64: $0e $04
	ld   hl, $0b17                                   ; $4b66: $21 $17 $0b
	call $0bdd                                       ; $4b69: $cd $dd $0b
	ld   c, $04                                      ; $4b6c: $0e $04
	ld   hl, $0b1d                                   ; $4b6e: $21 $1d $0b
	call $0bdd                                       ; $4b71: $cd $dd $0b
	ld   c, $04                                      ; $4b74: $0e $04
	ld   hl, $0b23                                   ; $4b76: $21 $23 $0b
	call $0bdd                                       ; $4b79: $cd $dd $0b
	ld   hl, $c021                                   ; $4b7c: $21 $21 $c0
	ld   a, (hl)                                     ; $4b7f: $7e
	cp   $01                                         ; $4b80: $fe $01
	jr   nz, jr_002_4b9a                             ; $4b82: $20 $16

	ld   hl, $c022                                   ; $4b84: $21 $22 $c0
	ld   a, (hl)                                     ; $4b87: $7e
	bit  7, a                                        ; $4b88: $cb $7f
	jr   nz, jr_002_4b9a                             ; $4b8a: $20 $0e

	ld   hl, $c01f                                   ; $4b8c: $21 $1f $c0
	ld   a, (hl)                                     ; $4b8f: $7e
	cp   $00                                         ; $4b90: $fe $00
	jr   nz, jr_002_4b9a                             ; $4b92: $20 $06

	ld   a, $03                                      ; $4b94: $3e $03
	ld   hl, $c022                                   ; $4b96: $21 $22 $c0
	ld   (hl), a                                     ; $4b99: $77

jr_002_4b9a:
	ld   hl, $c022                                   ; $4b9a: $21 $22 $c0
	ld   a, (hl)                                     ; $4b9d: $7e
	bit  7, a                                        ; $4b9e: $cb $7f
	jr   nz, jr_002_4bcc                             ; $4ba0: $20 $2a

	cp   $03                                         ; $4ba2: $fe $03
	jr   nz, jr_002_4bb9                             ; $4ba4: $20 $13

	ld   c, $06                                      ; $4ba6: $0e $06
	ld   hl, $0af9                                   ; $4ba8: $21 $f9 $0a
	call $0bdd                                       ; $4bab: $cd $dd $0b
	ld   c, $06                                      ; $4bae: $0e $06
	ld   hl, $0b01                                   ; $4bb0: $21 $01 $0b
	call $0bdd                                       ; $4bb3: $cd $dd $0b
	jp   $0bdc                                       ; $4bb6: $c3 $dc $0b


jr_002_4bb9:
	ld   c, $02                                      ; $4bb9: $0e $02
	ld   hl, $0af1                                   ; $4bbb: $21 $f1 $0a
	call $0bdd                                       ; $4bbe: $cd $dd $0b
	ld   c, $02                                      ; $4bc1: $0e $02
	ld   hl, $0af5                                   ; $4bc3: $21 $f5 $0a
	call $0bdd                                       ; $4bc6: $cd $dd $0b
	jp   $0bdc                                       ; $4bc9: $c3 $dc $0b


jr_002_4bcc:
	ld   c, $02                                      ; $4bcc: $0e $02
	ld   hl, $0b09                                   ; $4bce: $21 $09 $0b
	call $0bdd                                       ; $4bd1: $cd $dd $0b
	ld   c, $02                                      ; $4bd4: $0e $02
	ld   hl, $0b0d                                   ; $4bd6: $21 $0d $0b
	call $0bdd                                       ; $4bd9: $cd $dd $0b
	ret                                              ; $4bdc: $c9


	ld   de, $c6dd                                   ; $4bdd: $11 $dd $c6
	ld   a, (de)                                     ; $4be0: $1a
	ld   e, (hl)                                     ; $4be1: $5e
	inc  hl                                          ; $4be2: $23
	add  (hl)                                        ; $4be3: $86
	ld   d, a                                        ; $4be4: $57
	inc  hl                                          ; $4be5: $23

jr_002_4be6:
	ldi  a, (hl)                                     ; $4be6: $2a
	ld   (de), a                                     ; $4be7: $12
	inc  de                                          ; $4be8: $13
	dec  c                                           ; $4be9: $0d
	jr   nz, jr_002_4be6                             ; $4bea: $20 $fa

	ret                                              ; $4bec: $c9


	ld   hl, $c6dd                                   ; $4bed: $21 $dd $c6
	ld   a, (hl)                                     ; $4bf0: $7e
	add  $98                                         ; $4bf1: $c6 $98
	ld   h, a                                        ; $4bf3: $67
	ld   l, $00                                      ; $4bf4: $2e $00
	ld   bc, $0240                                   ; $4bf6: $01 $40 $02
	ld   a, $00                                      ; $4bf9: $3e $00

jr_002_4bfb:
	ldi  (hl), a                                     ; $4bfb: $22
	dec  bc                                          ; $4bfc: $0b
	bit  7, b                                        ; $4bfd: $cb $78
	jr   z, jr_002_4bfb                              ; $4bff: $28 $fa

	ld   hl, $c00a                                   ; $4c01: $21 $0a $c0
	ld   e, (hl)                                     ; $4c04: $5e
	ld   d, $00                                      ; $4c05: $16 $00
	ld   hl, $0da3                                   ; $4c07: $21 $a3 $0d
	add  hl, de                                      ; $4c0a: $19
	add  hl, de                                      ; $4c0b: $19
	ld   c, (hl)                                     ; $4c0c: $4e
	inc  hl                                          ; $4c0d: $23
	ld   b, (hl)                                     ; $4c0e: $46
	ld   hl, $c08e                                   ; $4c0f: $21 $8e $c0
	ld   (hl), c                                     ; $4c12: $71
	inc  hl                                          ; $4c13: $23
	ld   (hl), b                                     ; $4c14: $70
	ld   de, $98e1                                   ; $4c15: $11 $e1 $98
	ld   hl, $c6dd                                   ; $4c18: $21 $dd $c6
	ld   a, (hl)                                     ; $4c1b: $7e
	add  d                                           ; $4c1c: $82
	ld   d, a                                        ; $4c1d: $57
	ld   hl, $c00d                                   ; $4c1e: $21 $0d $c0
	ld   (hl), e                                     ; $4c21: $73
	inc  hl                                          ; $4c22: $23
	ld   (hl), d                                     ; $4c23: $72
	ld   hl, $c008                                   ; $4c24: $21 $08 $c0
	ld   (hl), $ff                                   ; $4c27: $36 $ff

jr_002_4c29:
	call $0ca1                                       ; $4c29: $cd $a1 $0c
	cp   $01                                         ; $4c2c: $fe $01
	jr   z, jr_002_4c29                              ; $4c2e: $28 $f9

	push af                                          ; $4c30: $f5
	ld   a, $02                                      ; $4c31: $3e $02
	ld   hl, $c098                                   ; $4c33: $21 $98 $c0
	ld   (hl), a                                     ; $4c36: $77
	ld   a, $00                                      ; $4c37: $3e $00
	ld   hl, $c0c4                                   ; $4c39: $21 $c4 $c0
	ld   (hl), a                                     ; $4c3c: $77
	ld   de, $99c3                                   ; $4c3d: $11 $c3 $99
	ld   hl, $c6dd                                   ; $4c40: $21 $dd $c6
	ld   a, (hl)                                     ; $4c43: $7e
	add  d                                           ; $4c44: $82
	ld   d, a                                        ; $4c45: $57
	ld   hl, $c00d                                   ; $4c46: $21 $0d $c0
	ld   (hl), e                                     ; $4c49: $73
	inc  hl                                          ; $4c4a: $23
	ld   (hl), d                                     ; $4c4b: $72
	pop  af                                          ; $4c4c: $f1
	cp   $06                                         ; $4c4d: $fe $06
	jr   z, jr_002_4c59                              ; $4c4f: $28 $08

	cp   $07                                         ; $4c51: $fe $07
	jr   nz, jr_002_4c78                             ; $4c53: $20 $23

	ld   hl, $c0c4                                   ; $4c55: $21 $c4 $c0
	inc  (hl)                                        ; $4c58: $34

jr_002_4c59:
	call $0cbf                                       ; $4c59: $cd $bf $0c
	call $0caa                                       ; $4c5c: $cd $aa $0c
	ld   bc, $0000                                   ; $4c5f: $01 $00 $00

jr_002_4c62:
	ld   hl, $0ad4                                   ; $4c62: $21 $d4 $0a
	add  hl, bc                                      ; $4c65: $09
	ld   a, (hl)                                     ; $4c66: $7e
	ld   (de), a                                     ; $4c67: $12
	inc  de                                          ; $4c68: $13
	inc  bc                                          ; $4c69: $03
	ld   a, c                                        ; $4c6a: $79
	cp   $04                                         ; $4c6b: $fe $04
	jr   nz, jr_002_4c72                             ; $4c6d: $20 $03

	call $0cbf                                       ; $4c6f: $cd $bf $0c

jr_002_4c72:
	ld   a, c                                        ; $4c72: $79
	cp   $09                                         ; $4c73: $fe $09
	jr   nz, jr_002_4c62                             ; $4c75: $20 $eb

	ret                                              ; $4c77: $c9


jr_002_4c78:
	ld   a, $00                                      ; $4c78: $3e $00
	ld   hl, $c098                                   ; $4c7a: $21 $98 $c0
	ld   (hl), a                                     ; $4c7d: $77
	ld   hl, $c008                                   ; $4c7e: $21 $08 $c0
	ld   (hl), $00                                   ; $4c81: $36 $00

jr_002_4c83:
	call $0ca1                                       ; $4c83: $cd $a1 $0c
	ld   hl, $c098                                   ; $4c86: $21 $98 $c0
	ld   c, (hl)                                     ; $4c89: $4e
	ld   b, $00                                      ; $4c8a: $06 $00
	ld   hl, $c098                                   ; $4c8c: $21 $98 $c0
	inc  (hl)                                        ; $4c8f: $34
	cp   $02                                         ; $4c90: $fe $02
	jr   z, jr_002_4c83                              ; $4c92: $28 $ef

	cp   $05                                         ; $4c94: $fe $05
	jr   z, jr_002_4ca0                              ; $4c96: $28 $08

	ld   hl, $c0c4                                   ; $4c98: $21 $c4 $c0
	ld   (hl), c                                     ; $4c9b: $71
	cp   $03                                         ; $4c9c: $fe $03
	jr   z, jr_002_4c83                              ; $4c9e: $28 $e3

jr_002_4ca0:
	ret                                              ; $4ca0: $c9


	call $0cbf                                       ; $4ca1: $cd $bf $0c
	call $0caa                                       ; $4ca4: $cd $aa $0c
	jp   $0cc6                                       ; $4ca7: $c3 $c6 $0c


	ld   hl, $c00d                                   ; $4caa: $21 $0d $c0
	ld   a, (hl)                                     ; $4cad: $7e
	add  $20                                         ; $4cae: $c6 $20
	ld   hl, $c00d                                   ; $4cb0: $21 $0d $c0
	ld   (hl), a                                     ; $4cb3: $77
	ld   hl, $c00e                                   ; $4cb4: $21 $0e $c0
	ld   a, (hl)                                     ; $4cb7: $7e
	adc  $00                                         ; $4cb8: $ce $00
	ld   hl, $c00e                                   ; $4cba: $21 $0e $c0
	ld   (hl), a                                     ; $4cbd: $77
	ret                                              ; $4cbe: $c9


	ld   hl, $c00d                                   ; $4cbf: $21 $0d $c0
	ld   e, (hl)                                     ; $4cc2: $5e
	inc  hl                                          ; $4cc3: $23
	ld   d, (hl)                                     ; $4cc4: $56
	ret                                              ; $4cc5: $c9


	ld   hl, $c009                                   ; $4cc6: $21 $09 $c0
	ld   (hl), $22                                   ; $4cc9: $36 $22

jr_002_4ccb:
	call $0d8c                                       ; $4ccb: $cd $8c $0d
	cp   $08                                         ; $4cce: $fe $08
	jr   c, jr_002_4d38                              ; $4cd0: $38 $66

	cp   $5f                                         ; $4cd2: $fe $5f
	jr   z, jr_002_4cde                              ; $4cd4: $28 $08

	cp   $41                                         ; $4cd6: $fe $41
	jr   c, jr_002_4cf7                              ; $4cd8: $38 $1d

	cp   $5b                                         ; $4cda: $fe $5b
	jr   nc, jr_002_4cf7                             ; $4cdc: $30 $19

jr_002_4cde:
	push af                                          ; $4cde: $f5
	ld   hl, $c009                                   ; $4cdf: $21 $09 $c0
	ld   a, (hl)                                     ; $4ce2: $7e
	cp   $22                                         ; $4ce3: $fe $22
	jr   z, jr_002_4cf6                              ; $4ce5: $28 $0f

	cp   $2c                                         ; $4ce7: $fe $2c
	jr   z, jr_002_4cf6                              ; $4ce9: $28 $0b

	cp   $20                                         ; $4ceb: $fe $20
	jr   z, jr_002_4cf6                              ; $4ced: $28 $07

	pop  af                                          ; $4cef: $f1
	call $0d98                                       ; $4cf0: $cd $98 $0d
	ld   a, $20                                      ; $4cf3: $3e $20
	push af                                          ; $4cf5: $f5

jr_002_4cf6:
	pop  af                                          ; $4cf6: $f1

jr_002_4cf7:
	ld   (de), a                                     ; $4cf7: $12
	inc  de                                          ; $4cf8: $13
	ld   hl, $c009                                   ; $4cf9: $21 $09 $c0
	ld   (hl), a                                     ; $4cfc: $77
	cp   $5f                                         ; $4cfd: $fe $5f
	jr   nz, jr_002_4d09                             ; $4cff: $20 $08

	ld   (de), a                                     ; $4d01: $12
	inc  de                                          ; $4d02: $13
	ld   (de), a                                     ; $4d03: $12
	inc  de                                          ; $4d04: $13
	ld   (de), a                                     ; $4d05: $12
	inc  de                                          ; $4d06: $13
	ld   (de), a                                     ; $4d07: $12
	inc  de                                          ; $4d08: $13

jr_002_4d09:
	cp   $2c                                         ; $4d09: $fe $2c
	jr   z, jr_002_4d19                              ; $4d0b: $28 $0c

	cp   $3b                                         ; $4d0d: $fe $3b
	jr   z, jr_002_4d19                              ; $4d0f: $28 $08

	cp   $3f                                         ; $4d11: $fe $3f
	jr   z, jr_002_4d19                              ; $4d13: $28 $04

	cp   $21                                         ; $4d15: $fe $21
	jr   nz, jr_002_4d1d                             ; $4d17: $20 $04

jr_002_4d19:
	ld   a, $20                                      ; $4d19: $3e $20
	ld   (de), a                                     ; $4d1b: $12
	inc  de                                          ; $4d1c: $13

jr_002_4d1d:
	ld   c, a                                        ; $4d1d: $4f
	ld   hl, $c008                                   ; $4d1e: $21 $08 $c0
	ld   a, (hl)                                     ; $4d21: $7e
	cp   $00                                         ; $4d22: $fe $00
	jr   z, jr_002_4ccb                              ; $4d24: $28 $a5

	ld   a, c                                        ; $4d26: $79
	cp   $20                                         ; $4d27: $fe $20
	jr   nz, jr_002_4ccb                             ; $4d29: $20 $a0

	call $0d39                                       ; $4d2b: $cd $39 $0d
	ld   a, e                                        ; $4d2e: $7b
	and  $1f                                         ; $4d2f: $e6 $1f
	add  l                                           ; $4d31: $85
	cp   $15                                         ; $4d32: $fe $15
	jr   c, jr_002_4ccb                              ; $4d34: $38 $95

	ld   a, $01                                      ; $4d36: $3e $01

jr_002_4d38:
	ret                                              ; $4d38: $c9


	ld   hl, $c08e                                   ; $4d39: $21 $8e $c0
	ld   c, (hl)                                     ; $4d3c: $4e
	inc  hl                                          ; $4d3d: $23
	ld   b, (hl)                                     ; $4d3e: $46
	ld   l, $00                                      ; $4d3f: $2e $00
	ld   h, $00                                      ; $4d41: $26 $00

jr_002_4d43:
	ld   a, (bc)                                     ; $4d43: $0a
	inc  bc                                          ; $4d44: $03
	cp   $20                                         ; $4d45: $fe $20
	jr   z, jr_002_4d8b                              ; $4d47: $28 $42

	cp   $08                                         ; $4d49: $fe $08
	jr   c, jr_002_4d8b                              ; $4d4b: $38 $3e

	inc  l                                           ; $4d4d: $2c
	cp   $5f                                         ; $4d4e: $fe $5f
	jr   nz, jr_002_4d5e                             ; $4d50: $20 $0c

	ld   h, a                                        ; $4d52: $67
	ld   a, l                                        ; $4d53: $7d
	cp   $01                                         ; $4d54: $fe $01
	jr   nz, jr_002_4d8b                             ; $4d56: $20 $33

	inc  l                                           ; $4d58: $2c
	inc  l                                           ; $4d59: $2c
	inc  l                                           ; $4d5a: $2c
	inc  l                                           ; $4d5b: $2c
	jr   jr_002_4d43                                 ; $4d5c: $18 $e5

jr_002_4d5e:
	cp   $2c                                         ; $4d5e: $fe $2c
	jr   z, jr_002_4d8b                              ; $4d60: $28 $29

	cp   $3b                                         ; $4d62: $fe $3b
	jr   z, jr_002_4d8b                              ; $4d64: $28 $25

	cp   $3f                                         ; $4d66: $fe $3f
	jr   z, jr_002_4d8b                              ; $4d68: $28 $21

	cp   $21                                         ; $4d6a: $fe $21
	jr   z, jr_002_4d8b                              ; $4d6c: $28 $1d

	cp   $41                                         ; $4d6e: $fe $41
	jr   c, jr_002_4d88                              ; $4d70: $38 $16

	cp   $5b                                         ; $4d72: $fe $5b
	jr   nc, jr_002_4d88                             ; $4d74: $30 $12

	push af                                          ; $4d76: $f5
	ld   a, h                                        ; $4d77: $7c
	cp   $22                                         ; $4d78: $fe $22
	jr   z, jr_002_4d87                              ; $4d7a: $28 $0b

	cp   $2c                                         ; $4d7c: $fe $2c
	jr   z, jr_002_4d87                              ; $4d7e: $28 $07

	ld   a, l                                        ; $4d80: $7d
	cp   $01                                         ; $4d81: $fe $01
	jr   z, jr_002_4d87                              ; $4d83: $28 $02

	pop  af                                          ; $4d85: $f1
	ret                                              ; $4d86: $c9


jr_002_4d87:
	pop  af                                          ; $4d87: $f1

jr_002_4d88:
	ld   h, a                                        ; $4d88: $67
	jr   jr_002_4d43                                 ; $4d89: $18 $b8

jr_002_4d8b:
	ret                                              ; $4d8b: $c9


	ld   hl, $c08e                                   ; $4d8c: $21 $8e $c0
	ld   c, (hl)                                     ; $4d8f: $4e
	inc  hl                                          ; $4d90: $23
	ld   b, (hl)                                     ; $4d91: $46
	ld   a, (bc)                                     ; $4d92: $0a
	inc  bc                                          ; $4d93: $03
	ld   (hl), b                                     ; $4d94: $70
	dec  hl                                          ; $4d95: $2b
	ld   (hl), c                                     ; $4d96: $71
	ret                                              ; $4d97: $c9


	ld   hl, $c08e                                   ; $4d98: $21 $8e $c0
	ld   c, (hl)                                     ; $4d9b: $4e
	inc  hl                                          ; $4d9c: $23
	ld   b, (hl)                                     ; $4d9d: $46
	dec  bc                                          ; $4d9e: $0b
	ld   (hl), b                                     ; $4d9f: $70
	dec  hl                                          ; $4da0: $2b
	ld   (hl), c                                     ; $4da1: $71
	ret                                              ; $4da2: $c9
