; Disassembly of "OR"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3

npcStructs:
// npc script bytes in bank 3

// ?? - ?? - word for script ptr - cbc0 -
	m_NPCData $80 $4d npc00_scripts $ff $ff $ff $ff
	m_NPCData $86 $4d npc01_scripts $02 $ff $02 $7c
	m_NPCData $8f $4d npc02_scripts $ff $ff $ff $ff
	m_NPCData $8f $4d npcScript_end $ff $ff $ff $ff
	m_NPCData $94 $4d npc04_scripts $ff $ff $ff $ff // (eg npc right of 1st screen)
	m_NPCData $bf $4d npc05_scripts $00 $05 $00 $05
	m_NPCData $da $4d npc06_scripts $00 $06 $00 $06
	m_NPCData $e3 $4d npc07_scripts $00 $07 $00 $07
	m_NPCData $c8 $4d npc08_scripts $00 $08 $00 $08
	m_NPCData $d1 $4d npc09_scripts $00 $09 $00 $09
	m_NPCData $ec $4d npc0a_scripts $00 $0a $00 $0a
	m_NPCData $ad $4d npc0b_scripts $ff $ff $ff $ff
	m_NPCData $9d $4d npc0c_scripts $ff $ff $ff $ff
	m_NPCData $a1 $4d npc0d_scripts $ff $ff $ff $ff
	m_NPCData $a5 $4d npc0e_scripts $ff $ff $ff $ff
	m_NPCData $a9 $4d npc0f_scripts $ff $ff $ff $ff
	m_NPCData $da $4d npc10_scripts $00 $10 $00 $10
	m_NPCData $fe $4d npc11_scripts $00 $11 $00 $11
	m_NPCData $f5 $4d npc12_scripts $ff $ff $ff $20
	m_NPCData $e3 $4d npc13_scripts $ff $13 $00 $13
	m_NPCData $05 $4e npc14_scripts $ff $ff $ff $ff
	m_NPCData $6a $4d npc15_scripts $ff $ff $ff $ff
	m_NPCData $76 $4d npc16_scripts $ff $ff $ff $ff
	m_NPCData $78 $4d npc17_scripts $ff $ff $ff $ff
	m_NPCData $7c $4d npc18_scripts $ff $ff $ff $ff
	m_NPCData $b6 $4d npc19_scripts $00 $19 $00 $19
	m_NPCData $d1 $4d npc1a_scripts $00 $1a $00 $1a
	m_NPCData $ec $4d npc1b_scripts $ff $ff $ff $1b
	m_NPCData $ad $4d npc1c_scripts $ff $ff $ff $ff
	m_NPCData $bf $4d npc1d_scripts $00 $1d $00 $1d
	m_NPCData $0c $4e npc1e_scripts $ff $ff $ff $ff
	m_NPCData $bf $4d npc1f_scripts $00 $1f $00 $1f
	m_NPCData $ad $4d npcScript_end $ff $ff $ff $ff
	m_NPCData $d1 $4d npc21_scripts $69 $ff $ff $21
	m_NPCData $bf $4d npc22_scripts $00 $ff $00 $ff
	m_NPCData $bf $4d npc23_scripts $00 $23 $00 $23
	m_NPCData $da $4d npc24_scripts $00 $24 $00 $24
	m_NPCData $e3 $4d npc25_scripts $ff $ff $ff $25
	m_NPCData $10 $4e npc26_scripts $ff $ff $ff $20
	m_NPCData $1d $4e npc27_scripts $00 $27 $00 $ff
	m_NPCData $da $4d npc28_scripts $00 $28 $00 $28
	m_NPCData $ec $4d npc29_scripts $00 $29 $00 $29
	m_NPCData $19 $4e npc2a_scripts $ff $ff $ff $ff
	m_NPCData $1b $4e npc2b_scripts $ff $ff $ff $ff
	m_NPCData $da $4d npc2c_scripts $00 $2c $00 $2c
	m_NPCData $40 $4d npc2d_scripts $ff $ff $ff $ff
	m_NPCData $47 $4d npc2e_scripts $ff $ff $ff $ff
	m_NPCData $4b $4d npc2f_scripts $ff $ff $ff $ff
	m_NPCData $49 $4d npc30_scripts $ff $ff $ff $ff
	m_NPCData $4d $4d npc31_scripts $ff $ff $ff $ff
	m_NPCData $45 $4d npc32_scripts $ff $ff $ff $ff
	m_NPCData $6c $4d npc33_scripts $ff $ff $ff $ff
	m_NPCData $51 $4d npc34_scripts $ff $ff $ff $ff
	m_NPCData $53 $4d npc35_scripts $ff $ff $ff $ff
	m_NPCData $55 $4d npc36_scripts $ff $ff $ff $ff
	m_NPCData $57 $4d npc37_scripts $ff $ff $ff $ff
	m_NPCData $59 $4d npc38_scripts $ff $ff $ff $ff
	m_NPCData $5b $4d npc39_scripts $ff $ff $ff $ff
	m_NPCData $70 $4d npc3a_scripts $ff $ff $ff $ff
	m_NPCData $74 $4d npc3b_scripts $ff $ff $ff $ff
	m_NPCData $6e $4d npc3c_scripts $ff $ff $ff $ff
	m_NPCData $72 $4d npc3d_scripts $ff $ff $ff $ff
	m_NPCData $78 $4d npc3e_scripts $ff $ff $ff $ff
	m_NPCData $7a $4d npc3f_scripts $ff $ff $ff $ff
	m_NPCData $7e $4d npc40_scripts $ff $ff $ff $ff
	m_NPCData $4f $4d npc41_scripts $ff $ff $ff $ff
	m_NPCData $ec $4d npc42_scripts $ff $ff $ff $ff
	m_NPCData $21 $4e npc43_scripts $00 $43 $00 $43
	m_NPCData $26 $4e npc44_scripts $00 $44 $00 $44
	m_NPCData $5d $4d npc45_scripts $46 $ff $46 $ff
	m_NPCData $5f $4d npc46_scripts $ff $ff $ff $ff
	m_NPCData $61 $4d npc47_scripts $ff $ff $ff $ff
	m_NPCData $72 $4d npc48_scripts $ff $ff $ff $ff
	m_NPCData $c8 $4d npc49_scripts $00 $49 $00 $49
	m_NPCData $2b $4e npc4a_scripts $ff $ff $ff $ff
	m_NPCData $38 $4e npc4b_scripts $00 $4b $00 $4b
	m_NPCData $3d $4e npc4c_scripts $00 $08 $00 $08
	m_NPCData $3d $4e npc4d_scripts $00 $08 $00 $08
	m_NPCData $41 $4e npc4e_scripts $ff $ff $03 $4e
	m_NPCData $45 $4e npc4f_scripts $00 $00 $00 $4f
	m_NPCData $49 $4e npc50_scripts $ff $ff $ff $ff
	m_NPCData $4e $4e npc51_scripts $ff $ff $ff $ff
	m_NPCData $51 $4e npc52_scripts $ff $ff $ff $ff
	m_NPCData $5b $4d npc53_scripts $ff $ff $ff $ff
	m_NPCData $5b $4d npc54_scripts $ff $ff $ff $ff
	m_NPCData $5b $4d npc55_scripts $ff $ff $ff $ff
	m_NPCData $53 $4d npc56_scripts $ff $ff $ff $ff
	m_NPCData $51 $4d npc57_scripts $ff $ff $ff $ff
	m_NPCData $5d $4d npc58_scripts $5a $ff $5a $ff
	m_NPCData $54 $4e npc59_scripts $ff $ff $ff $ff
	m_NPCData $63 $4e npc5a_scripts $ff $ff $ff $ff
	m_NPCData $5f $4d npc5b_scripts $ff $ff $ff $ff
	m_NPCData $5f $4e npc5c_scripts $ff $ff $ff $ff
	m_NPCData $56 $4e npc5d_scripts $5f $ff $ff $ff
	m_NPCData $5f $4e npc5e_scripts $ff $ff $ff $ff
	m_NPCData $8f $4d npc5f_scripts $ff $ff $ff $ff
	m_NPCData $5f $4e npc60_scripts $ff $ff $ff $ff
	m_NPCData $c8 $4d npc61_scripts $ff $ff $61 $ff
	m_NPCData $c8 $4d npc62_scripts $ff $65 $ff $ff
	m_NPCData $d1 $4d npc63_scripts $ff $ff $63 $ff
	m_NPCData $61 $4e npc64_scripts $ff $ff $ff $5a
	m_NPCData $8f $4d npc65_scripts $ff $ff $ff $ff
	m_NPCData $3e $4d npc66_scripts $ff $ff $ff $ff
	m_NPCData $b2 $6a npc67_scripts $ff $ff $ff $ff
	m_NPCData $b2 $6a npc68_scripts $ff $ff $ff $ff
	m_NPCData $78 $4d npc69_scripts $ff $ff $ff $ff

// npc script bytes in bank 2
	m_NPCData $cd $4e $511b $ff $ff $ff $ff // $6a
	m_NPCData $d1 $4e $52e0 $ff $ff $ff $ff
	m_NPCData $d7 $4e $5dfc $ff $ff $ff $ff
	m_NPCData $d5 $4e $54a0 $ff $ff $ff $ff
	m_NPCData $d3 $4e $533f $ff $ff $ff $ff
	m_NPCData $d3 $4e $532c $ff $ff $ff $ff
	m_NPCData $d3 $4e $5331 $ff $ff $ff $ff
	m_NPCData $d3 $4e $5336 $ff $ff $ff $ff
	m_NPCData $d3 $4e $533b $ff $ff $ff $ff
	m_NPCData $d3 $4e $5361 $ff $ff $ff $ff
	m_NPCData $cd $4e $5392 $ff $ff $ff $ff
	m_NPCData $d9 $4e $55de $ff $ff $ff $ff
	m_NPCData $d9 $4e $55ea $ff $ff $ff $ff
	m_NPCData $ff $4e $560e $ff $ff $ff $ff
	m_NPCData $45 $4f $58a0 $00 $ff $00 $ff
	m_NPCData $51 $4f $58d4 $ff $ff $ff $7c
	m_NPCData $4b $4f $58b2 $00 $ff $00 $ff
	m_NPCData $53 $4f $58d4 $ff $ff $ff $7c
	m_NPCData $55 $4f $58e5 $ff $ff $ff $ff
	m_NPCData $de $4e $58ed $ff $ff $ff $ff
	m_NPCData $cf $4e $5f8e $ff $ff $ff $ff
	m_NPCData $0d $4f $5fde $ff $ff $ff $ff
	m_NPCData $e3 $4e $601e $ff $ff $ff $ff
	m_NPCData $e7 $4e $6033 $ff $ff $ff $ff
	m_NPCData $cd $4e $5001 $ff $ff $ff $ff
	m_NPCData $cd $4e $6042 $ff $ff $ff $ff
	m_NPCData $3c $4f $65e1 $ff $ff $ff $ff
	m_NPCData $16 $4f $6670 $86 $86 $87 $ff
	m_NPCData $16 $4f $6684 $ff $86 $87 $ff
	m_NPCData $16 $4f $6690 $ff $ff $ff $ff
	m_NPCData $db $4e $66bf $ff $ff $ff $ff
	m_NPCData $08 $4f $66cb $ff $ff $ff $ff
	m_NPCData $cd $4e $66fc $ff $ff $ff $ff
	m_NPCData $cd $4e $6721 $ff $ff $ff $ff
	m_NPCData $1f $4f $67c9 $00 $8c $00 $ff
	m_NPCData $28 $4f $67e9 $ff $8d $00 $ff
	m_NPCData $31 $4f $67ff $ff $8e $00 $ff
	m_NPCData $3a $4f $6832 $ff $ff $ff $ff
	m_NPCData $cd $4e $5ffa $ff $ff $ff $ff
	m_NPCData $5a $4f $6855 $00 $91 $00 $ff
	m_NPCData $c7 $4f $55f6 $00 $92 $00 $ff
	m_NPCData $63 $4f $6898 $00 $93 $00 $ff
	m_NPCData $6c $4f $68e2 $00 $94 $00 $ff
	m_NPCData $75 $4f $692b $ff $ff $ff $ff
	m_NPCData $7a $4f $6938 $00 $96 $00 $ff
	m_NPCData $83 $4f $6995 $00 $96 $00 $ff
	m_NPCData $83 $4f $69a9 $00 $96 $00 $ff
	m_NPCData $cd $4e $6a3b $ff $ff $ff $ff
	m_NPCData $86 $4f $6b31 $ff $ff $ff $ff
	m_NPCData $cd $4e $6b3b $ff $ff $ff $ff
	m_NPCData $45 $4f $6b72 $00 $ff $00 $ff
	m_NPCData $cd $4e $6bbf $ff $ff $00 $ff
	m_NPCData $94 $4f $6cdb $ff $ff $ff $ff
	m_NPCData $96 $4f $6d77 $ff $ff $ff $ff
	m_NPCData $96 $4f $6d8c $ff $ff $ff $ff
	m_NPCData $cd $4e $6bd3 $ff $ff $20 $ff
	m_NPCData $cd $4e $6c48 $a3 $ff $a3 $a3
	m_NPCData $55 $4f $6ca6 $ff $ff $ff $ff
	m_NPCData $51 $4f $6b80 $ff $ff $ff $7c
	m_NPCData $4b $4f $6b8e $00 $ff $00 $ff
	m_NPCData $88 $4f $6ba0 $00 $ff $00 $ff
	m_NPCData $9e $4f $69d0 $00 $ff $00 $a7
	m_NPCData $a7 $4f $69e8 $00 $ff $00 $a8
	m_NPCData $b0 $4f $69f7 $00 $ff $00 $a9
	m_NPCData $b9 $4f $6a13 $00 $ff $00 $aa
	m_NPCData $c2 $4f $6a30 $7c $ff $7c $ff
	m_NPCData $0d $4f $5fec $ff $ff $ff $ff
	m_NPCData $98 $4f $6da1 $ff $ff $ff $ff
	m_NPCData $98 $4f $6dc8 $ff $ff $ff $ff
	m_NPCData $d0 $4f $6def $ff $ff $ff $ff
	m_NPCData $9b $4f $6d6e $b2 $ff $ff $ff
	m_NPCData $91 $4f $6e08 $ff $ff $ff $ff
	m_NPCData $91 $4f $6e22 $ff $ff $ff $ff
	m_NPCData $d2 $4f $6ea8 $7c $ff $7c $7c
	m_NPCData $eb $4e $502d $ff $ff $ff $ff
	m_NPCData $f0 $4e $5044 $ff $ff $ff $ff
	m_NPCData $f5 $4e $5053 $ff $ff $ff $ff
	m_NPCData $fa $4e $506c $ff $ff $ff $ff
	m_NPCData $de $4e $5081 $ff $ff $ff $ff
	m_NPCData $eb $4e $6ebe $ff $ff $ff $ff
	m_NPCData $eb $4e $6ec8 $ff $ff $ff $ff
	m_NPCData $eb $4e $6ed6 $ff $ff $ff $ff
	m_NPCData $eb $4e $6ee8 $ff $ff $ff $ff
	m_NPCData $eb $4e $6efc $ff $ff $ff $ff
	m_NPCData $eb $4e $6f12 $ff $ff $ff $ff

// npc script bytes in bank 6
	m_NPCData $6f $0d $0df6 $c0 $ff $00 $bf // $bf
	m_NPCData $66 $0d $0e04 $ff $ff $ff $ff
	m_NPCData $5d $0d $0df6 $00 $ff $00 $c1
	m_NPCData $54 $0d $119e $c3 $ff $00 $c2
	m_NPCData $4b $0d $11ac $ff $ff $ff $ff
	m_NPCData $54 $0d $119e $00 $ff $00 $c4
	m_NPCData $78 $0d $11b1 $c5 $ff $ff $c5
	m_NPCData $4b $0d $12d3 $ca $ff $e0 $ff
	m_NPCData $4b $0d $1308 $cb $ff $e0 $ff
	m_NPCData $a8 $0d $1426 $ff $ff $ff $ff
	m_NPCData $4b $0d $133d $cc $ff $e0 $ff
	m_NPCData $4b $0d $12d3 $e0 $ff $e0 $ff
	m_NPCData $4b $0d $1308 $e0 $ff $e0 $ff
	m_NPCData $4b $0d $133d $e0 $ff $e0 $ff
	m_NPCData $d9 $0d $125e $ff $ff $e0 $ff
	m_NPCData $c5 $0d $142e $ff $ff $ff $ff
	m_NPCData $78 $0d $12a9 $ff $ff $e0 $ff
	m_NPCData $ce $0d $145e $03 $ff $03 $03
	m_NPCData $b1 $0d $1379 $e1 $ff $e1 $d1
	m_NPCData $ce $0d $1434 $03 $ff $03 $03
	m_NPCData $a8 $0d $141e $03 $ff $03 $ff
	m_NPCData $d9 $0d $11ed $ff $ff $ff $ff
	m_NPCData $d9 $0d $12ba $ff $ff $e0 $ff
	m_NPCData $d9 $0d $11dc $ff $ff $ff $ff
	m_NPCData $db $0d $1222 $ff $ff $ff $ff
	m_NPCData $4b $0d $11ff $ff $ff $ff $ff
	m_NPCData $b4 $0d $13b5 $ff $ff $ff $ff
	m_NPCData $b4 $0d $1399 $ff $ff $ff $ff
	m_NPCData $5d $0d $148a $ff $ff $e0 $ff
	m_NPCData $d9 $0d $14a3 $ff $ff $ff $ff
	m_NPCData $de $0d $13db $ff $ff $e0 $ff
	m_NPCData $81 $0d $1404 $ff $ff $e0 $ff
	m_NPCData $e3 $0d $1415 $ff $ff $e0 $ff
	m_NPCData $e8 $0d $11c3 $ff $ff $ff $ff
	m_NPCData $e8 $0d $11c3 $ff $ff $ff $ff
	m_NPCData $d9 $0d $14c2 $ff $ff $ff $ff
	m_NPCData $6f $0d $0e09 $00 $ff $00 $ff
	m_NPCData $d9 $0d $0e24 $ff $ff $e5 $ff
	m_NPCData $d9 $0d $0e2c $ff $ff $ff $ff
	m_NPCData $54 $0d $0e3f $ff $ff $ff $ff
	m_NPCData $90 $0d $0eb6 $ff $ff $ff $ff
	m_NPCData $9c $0d $1033 $ff $ff $ff $ff
	m_NPCData $9c $0d $1052 $ff $ff $ff $ff
	m_NPCData $4b $0d $0f39 $ff $ff $00 $ff
	m_NPCData $d7 $0d $0f00 $ff $ff $ec $ff
	m_NPCData $e8 $0d $0ef9 $ff $ff $ff $ff
	m_NPCData $92 $0d $10dc $ff $ff $ff $ff
	m_NPCData $99 $0d $1128 $ff $ff $ff $ff
	m_NPCData $94 $0d $1136 $ff $ff $f3 $ff
	m_NPCData $a3 $0d $116f $ff $ff $ff $ff
	m_NPCData $b4 $0d $1071 $ff $ff $ff $ff
	m_NPCData $ba $0d $10b8 $ff $ff $f4 $ff
	m_NPCData $94 $0d $1136 $ff $ff $ec $ff
	m_NPCData $e8 $0d $11c6 $ff $ff $ff $ff
	m_NPCData $ed $0d $156a $ff $ff $ff $ff


// the multiple ($01 $14 $12) is possibly leftover data
	.db $01 $14 $12

	m_LayoutData lyt_gameOverScreen

	.db $01 $14 $12

	m_LayoutData lyt_mapScreen

	.db $01 $14 $12

	m_LayoutData lyt_enterPasswordScreen

	.db $01 $14 $12

	m_LayoutData lyt_npcTextRoundBorderScreen

	.db $01 $14 $12

	m_LayoutData lyt_inventoryScreen

	.db $01 $14 $12

	m_LayoutData lyt_03_1815

	.db $01 $14 $12

	m_LayoutData lyt_introTradeMarkScreen


// $1ae8 - left over garbage, writes to $0142+
	ld   de, $0000
	ld   bc, $0000

@c0a0_nz:
	ld   hl, $c0a0                                   ; $5aee: $21 $a0 $c0
	ld   a, (hl)
	cp   $00
	jr   z, @c0a0_0                              ; $5af4: $28 $17

	ld   hl, $c0a3                                   ; $5af6: $21 $a3 $c0
	ld   (hl), a

@loopTilFF:
	call func_03_1b6e
	cp   $ff
	jr   z, @outOfLoop

	ld   hl, $0142                                   ; $5b01: $21 $42 $01
	add  hl, bc
	ld   (hl), a
	inc  bc
	ld   hl, $c0a3                                   ; $5b07: $21 $a3 $c0
	dec  (hl)
	jr   nz, @loopTilFF

@c0a0_0:
	ld   a, $00
	ld   hl, $c0a0                                   ; $5b0f: $21 $a0 $c0
	ld   (hl), $00
	ret

@outOfLoop:
	ld   hl, $c0a3                                   ; $5b15: $21 $a3 $c0
	ld   a, (hl)
	ld   hl, $c0a0                                   ; $5b19: $21 $a0 $c0
	ld   (hl), a
	call func_03_1b6e
	ld   hl, $c0a2                                   ; $5b20: $21 $a2 $c0
	ld   (hl), a
	ld   hl, $c0a0                                   ; $5b24: $21 $a0 $c0
	cp   (hl)
	jr   c, +

	ld   hl, $c0a0                                   ; $5b2a: $21 $a0 $c0
	ld   a, (hl)

+
	ld   hl, $c0a3                                   ; $5b2e: $21 $a3 $c0
	ld   (hl), a
	ld   hl, $c0a2                                   ; $5b32: $21 $a2 $c0
	ld   a, (hl)
	ld   hl, $c0a3                                   ; $5b36: $21 $a3 $c0
	sub  (hl)
	ld   hl, $c0a1                                   ; $5b3a: $21 $a1 $c0
	ld   (hl), a
	ld   hl, $c0a0                                   ; $5b3e: $21 $a0 $c0
	ld   a, (hl)
	ld   hl, $c0a3                                   ; $5b42: $21 $a3 $c0
	sub  (hl)
	ld   hl, $c0a0                                   ; $5b46: $21 $a0 $c0
	ld   (hl), a
	call func_03_1b6e

-
	ld   hl, $0142                                   ; $5b4d: $21 $42 $01
	add  hl, bc
	ld   (hl), a
	inc  bc
	ld   hl, $c0a3                                   ; $5b53: $21 $a3 $c0
	dec  (hl)
	jr   nz, -

	ld   hl, $c0a3                                   ; $5b59: $21 $a3 $c0
	ld   (hl), a
	ld   hl, $c0a0                                   ; $5b5d: $21 $a0 $c0
	ld   a, (hl)
	cp   $00
	jr   nz, @c0a0_nz

	ld   hl, $c0a1                                   ; $5b65: $21 $a1 $c0
	ld   a, (hl)
	ld   hl, $c0a0                                   ; $5b69: $21 $a0 $c0
	ld   (hl), a
	ret


func_03_1b6e:
	ld   hl, $c09a                                   ; $5b6e: $21 $9a $c0
	ldi  a, (hl)
	ld   h, (hl)
	ld   l, a
	add  hl, de
	ld   a, (hl)
	ld   hl, $c09a                                   ; $5b76: $21 $9a $c0
	inc  (hl)
	jr   nz, +

	ld   hl, $c09b                                   ; $5b7c: $21 $9b $c0
	inc  (hl)

+
	ret


.include "data/b3_roomStructsAndLayouts.s"


;;
	ld   (de), a                                     ; $4cf2: $12
	add  h                                           ; $4cf3: $84
	jr   nz, jr_007_4cf6                             ; $4cf4: $20 $00

jr_007_4cf6:
	nop                                              ; $4cf6: $00
	ld   a, b                                        ; $4cf7: $78
	sub  b                                           ; $4cf8: $90
	inc  de                                          ; $4cf9: $13
	add  h                                           ; $4cfa: $84
	ld   hl, $0000                                   ; $4cfb: $21 $00 $00
	.db $20 $90

	inc  d                                           ; $4d00: $14
	add  h                                           ; $4d01: $84
	ldi  (hl), a                                     ; $4d02: $22
	nop                                              ; $4d03: $00
	nop                                              ; $4d04: $00
	.db  $10                                         ; $4d05: $10
	sub  b                                           ; $4d06: $90
	dec  d                                           ; $4d07: $15
	add  h                                           ; $4d08: $84
	inc  hl                                          ; $4d09: $23

jr_007_4d0a:
	nop                                              ; $4d0a: $00
	nop                                              ; $4d0b: $00
	ldh  (<$50), a                                   ; $4d0c: $e0 $50
	ld   d, $84                                      ; $4d0e: $16 $84
	inc  h                                           ; $4d10: $24
	nop                                              ; $4d11: $00
	nop                                              ; $4d12: $00
	.db $20 $90

	rla                                              ; $4d15: $17
	add  h                                           ; $4d16: $84
	dec  h                                           ; $4d17: $25
	nop                                              ; $4d18: $00
	nop                                              ; $4d19: $00
	ld   (hl), b                                     ; $4d1a: $70
	sub  b                                           ; $4d1b: $90
	.db $18 $84

	ld   e, $01                                      ; $4d1e: $1e $01
	ld   bc, $5060                                   ; $4d20: $01 $60 $50
	add  hl, de                                      ; $4d23: $19
	add  h                                           ; $4d24: $84
	.db  $10                                         ; $4d25: $10
	inc  bc                                          ; $4d26: $03
	inc  b                                           ; $4d27: $04
	ld   c, b                                        ; $4d28: $48
	sub  h                                           ; $4d29: $94
	rst  $38                                         ; $4d2a: $ff
	cp   c                                           ; $4d2b: $b9
	add  b                                           ; $4d2c: $80
	ldi  (hl), a                                     ; $4d2d: $22
	cp   d                                           ; $4d2e: $ba
	add  b                                           ; $4d2f: $80
	inc  hl                                          ; $4d30: $23
	cp   e                                           ; $4d31: $bb
	add  b                                           ; $4d32: $80
	inc  h                                           ; $4d33: $24
	cp   h                                           ; $4d34: $bc
	add  b                                           ; $4d35: $80
	dec  h                                           ; $4d36: $25
	cp   l                                           ; $4d37: $bd
	add  b                                           ; $4d38: $80
	ld   h, $be                                      ; $4d39: $26 $be
	add  b                                           ; $4d3b: $80
	daa                                              ; $4d3c: $27
	rst  $38                                         ; $4d3d: $ff
	dec  e                                           ; $4d3e: $1d
	ld   bc, $a840                                   ; $4d3f: $01 $40 $a8
	xor  h                                           ; $4d42: $ac
	xor  b                                           ; $4d43: $a8
	ld   (bc), a                                     ; $4d44: $02
	inc  h                                           ; $4d45: $24
	ld   bc, $0128                                   ; $4d46: $01 $28 $01
	inc  l                                           ; $4d49: $2c
	ld   bc, $0130                                   ; $4d4a: $01 $30 $01
	inc  (hl)                                        ; $4d4d: $34
	ld   bc, $0164                                   ; $4d4e: $01 $64 $01
	add  b                                           ; $4d51: $80
	ld   bc, $0184                                   ; $4d52: $01 $84 $01
	adc  b                                           ; $4d55: $88
	ld   bc, $018c                                   ; $4d56: $01 $8c $01
	sub  b                                           ; $4d59: $90
	ld   bc, $0194                                   ; $4d5a: $01 $94 $01
	sbc  h                                           ; $4d5d: $9c
	ld   bc, $01a0                                   ; $4d5e: $01 $a0 $01
	and  a                                           ; $4d61: $a7
	and  a                                           ; $4d62: $a7
	res  4, a                                        ; $4d63: $cb $a7
	and  a                                           ; $4d65: $a7
	and  a                                           ; $4d66: $a7
	set  1, e                                        ; $4d67: $cb $cb
	ld   (bc), a                                     ; $4d69: $02
	or   b                                           ; $4d6a: $b0
	ld   bc, $01c0                                   ; $4d6b: $01 $c0 $01
	jp   $c801                                       ; $4d6e: $c3 $01 $c8


	ld   bc, $01cb                                   ; $4d71: $01 $cb $01
	call z, $c401                                    ; $4d74: $cc $01 $c4
	ld   bc, $01d4                                   ; $4d77: $01 $d4 $01
	call c, $e001                                    ; $4d7a: $dc $01 $e0
	ld   bc, $01e4                                   ; $4d7d: $01 $e4 $01
	ldh  a, (<$f0)                                   ; $4d80: $f0 $f0
	ldh  a, (<$f0)                                   ; $4d82: $f0 $f0
	ret  c                                           ; $4d84: $d8

	ld   bc, $ece8                                   ; $4d85: $01 $e8 $ec
	add  sp, -$18                                    ; $4d88: $e8 $e8
	.db  $ec                                         ; $4d8a: $ec
	add  sp, -$18                                    ; $4d8b: $e8 $e8
	.db  $ec                                         ; $4d8d: $ec
	add  sp, -$43                                    ; $4d8e: $e8 $bd
	cp   l                                           ; $4d90: $bd
	ld   a, l                                        ; $4d91: $7d
	ld   a, l                                        ; $4d92: $7d
	ld   bc, $e0e0                                   ; $4d93: $01 $e0 $e0
	ldh  (<$e2), a                                   ; $4d96: $e0 $e2
	ld   ($ff00+c), a                                ; $4d98: $e2
	ld   ($ff00+c), a                                ; $4d99: $e2
	.db  $e3                                         ; $4d9a: $e3
	.db  $e3                                         ; $4d9b: $e3
	.db  $e3                                         ; $4d9c: $e3
	sbc  h                                           ; $4d9d: $9c
	and  b                                           ; $4d9e: $a0
	and  h                                           ; $4d9f: $a4
	ld   (bc), a                                     ; $4da0: $02
	sbc  l                                           ; $4da1: $9d
	and  c                                           ; $4da2: $a1
	and  l                                           ; $4da3: $a5
	ld   (bc), a                                     ; $4da4: $02
	sbc  (hl)                                        ; $4da5: $9e
	and  d                                           ; $4da6: $a2
	and  (hl)                                        ; $4da7: $a6
	ld   (bc), a                                     ; $4da8: $02
	sbc  a                                           ; $4da9: $9f
	and  e                                           ; $4daa: $a3
	and  a                                           ; $4dab: $a7
	ld   (bc), a                                     ; $4dac: $02
	inc  a                                           ; $4dad: $3c
	ld   b, b                                        ; $4dae: $40
	ld   b, h                                        ; $4daf: $44
	jr   nc, jr_007_4de6                             ; $4db0: $30 $34

	jr   c, jr_007_4dd8                              ; $4db2: $38 $24

	jr   z, jr_007_4de2                              ; $4db4: $28 $2c

	dec  a                                           ; $4db6: $3d
	ld   b, c                                        ; $4db7: $41
	ld   b, l                                        ; $4db8: $45
	ld   sp, $3935                                   ; $4db9: $31 $35 $39
	dec  h                                           ; $4dbc: $25
	add  hl, hl                                      ; $4dbd: $29
	dec  l                                           ; $4dbe: $2d
	ld   a, $42                                      ; $4dbf: $3e $42
	ld   b, (hl)                                     ; $4dc1: $46
	ldd  (hl), a                                     ; $4dc2: $32
	ld   (hl), $3a                                   ; $4dc3: $36 $3a
	ld   h, $2a                                      ; $4dc5: $26 $2a
	ld   l, $3f                                      ; $4dc7: $2e $3f
	ld   b, e                                        ; $4dc9: $43
	ld   b, a                                        ; $4dca: $47
	inc  sp                                          ; $4dcb: $33
	scf                                              ; $4dcc: $37
	dec  sp                                          ; $4dcd: $3b
	daa                                              ; $4dce: $27
	dec  hl                                          ; $4dcf: $2b
	cpl                                              ; $4dd0: $2f
	ld   h, b                                        ; $4dd1: $60
	ld   h, h                                        ; $4dd2: $64
	ld   l, b                                        ; $4dd3: $68
	ld   d, h                                        ; $4dd4: $54
	ld   e, b                                        ; $4dd5: $58
	ld   e, h                                        ; $4dd6: $5c
	ld   c, b                                        ; $4dd7: $48

jr_007_4dd8:
	ld   c, h                                        ; $4dd8: $4c
	ld   d, b                                        ; $4dd9: $50
	ld   h, e                                        ; $4dda: $63
	ld   h, a                                        ; $4ddb: $67
	ld   l, e                                        ; $4ddc: $6b
	ld   d, a                                        ; $4ddd: $57
	ld   e, e                                        ; $4dde: $5b
	ld   e, a                                        ; $4ddf: $5f
	ld   c, e                                        ; $4de0: $4b
	ld   c, a                                        ; $4de1: $4f

jr_007_4de2:
	ld   d, e                                        ; $4de2: $53
	add  h                                           ; $4de3: $84
	adc  b                                           ; $4de4: $88
	adc  h                                           ; $4de5: $8c

jr_007_4de6:
	ld   a, b                                        ; $4de6: $78
	ld   a, h                                        ; $4de7: $7c
	add  b                                           ; $4de8: $80
	ld   l, h                                        ; $4de9: $6c
	ld   (hl), b                                     ; $4dea: $70
	ld   (hl), h                                     ; $4deb: $74
	add  (hl)                                        ; $4dec: $86
	adc  d                                           ; $4ded: $8a
	adc  (hl)                                        ; $4dee: $8e
	ld   a, d                                        ; $4def: $7a
	ld   a, (hl)                                     ; $4df0: $7e
	add  d                                           ; $4df1: $82
	ld   l, (hl)                                     ; $4df2: $6e
	ld   (hl), d                                     ; $4df3: $72
	.db  $76                                         ; $4df4: $76
	call z, $cccc                                    ; $4df5: $cc $cc $cc
	ret  nc                                          ; $4df8: $d0

	ret  nc                                          ; $4df9: $d0

	ret  nc                                          ; $4dfa: $d0

	call nc, $d4d4                                   ; $4dfb: $d4 $d4 $d4
	sbc  a                                           ; $4dfe: $9f
	sbc  a                                           ; $4dff: $9f
	and  e                                           ; $4e00: $a3
	and  e                                           ; $4e01: $a3
	and  a                                           ; $4e02: $a7
	and  a                                           ; $4e03: $a7
	ld   bc, $a9a9                                   ; $4e04: $01 $a9 $a9
	xor  l                                           ; $4e07: $ad
	xor  l                                           ; $4e08: $ad
	or   c                                           ; $4e09: $b1
	or   c                                           ; $4e0a: $b1
	ld   (bc), a                                     ; $4e0b: $02
	sub  b                                           ; $4e0c: $90
	sub  h                                           ; $4e0d: $94
	sbc  b                                           ; $4e0e: $98
	ld   (bc), a                                     ; $4e0f: $02
	sbc  l                                           ; $4e10: $9d
	sbc  l                                           ; $4e11: $9d
	sbc  l                                           ; $4e12: $9d
	and  c                                           ; $4e13: $a1
	and  c                                           ; $4e14: $a1
	and  c                                           ; $4e15: $a1
	and  l                                           ; $4e16: $a5
	and  l                                           ; $4e17: $a5
	and  l                                           ; $4e18: $a5
	ld   c, c                                        ; $4e19: $49
	ld   bc, $0189                                   ; $4e1a: $01 $89 $01
	inc  a                                           ; $4e1d: $3c
	ld   b, b                                        ; $4e1e: $40
	ld   b, h                                        ; $4e1f: $44
	ld   (bc), a                                     ; $4e20: $02
	ld   l, a                                        ; $4e21: $6f
	ld   (hl), e                                     ; $4e22: $73
	ld   (hl), a                                     ; $4e23: $77
	ld   l, a                                        ; $4e24: $6f
	ld   bc, $726e                                   ; $4e25: $01 $6e $72
	.db  $76                                         ; $4e28: $76
	ld   l, (hl)                                     ; $4e29: $6e
	ld   bc, $9292                                   ; $4e2a: $01 $92 $92
	sub  d                                           ; $4e2d: $92
	sub  (hl)                                        ; $4e2e: $96
	sub  (hl)                                        ; $4e2f: $96
	sub  (hl)                                        ; $4e30: $96
	sbc  d                                           ; $4e31: $9a
	sbc  d                                           ; $4e32: $9a
	sbc  d                                           ; $4e33: $9a
	sub  (hl)                                        ; $4e34: $96
	sub  (hl)                                        ; $4e35: $96
	sub  (hl)                                        ; $4e36: $96
	ld   (bc), a                                     ; $4e37: $02
	ld   a, (hl)                                     ; $4e38: $7e
	ld   a, d                                        ; $4e39: $7a
	add  d                                           ; $4e3a: $82
	ld   a, d                                        ; $4e3b: $7a
	ld   (bc), a                                     ; $4e3c: $02
	sub  e                                           ; $4e3d: $93
	sub  a                                           ; $4e3e: $97
	sbc  e                                           ; $4e3f: $9b
	ld   bc, $4404                                   ; $4e40: $01 $04 $44
	ld   c, b                                        ; $4e43: $48
	ld   (bc), a                                     ; $4e44: $02
	sub  d                                           ; $4e45: $92
	sub  (hl)                                        ; $4e46: $96
	sbc  d                                           ; $4e47: $9a
	ld   (bc), a                                     ; $4e48: $02
	sbc  h                                           ; $4e49: $9c
	and  b                                           ; $4e4a: $a0
	sbc  h                                           ; $4e4b: $9c
	and  h                                           ; $4e4c: $a4
	ld   (bc), a                                     ; $4e4d: $02
	xor  b                                           ; $4e4e: $a8
	xor  h                                           ; $4e4f: $ac
	ld   bc, $ccc8                                   ; $4e50: $01 $c8 $cc
	ld   bc, $01cd                                   ; $4e53: $01 $cd $01
	ld   h, e                                        ; $4e56: $63
	ld   h, a                                        ; $4e57: $67
	ld   l, e                                        ; $4e58: $6b
	ld   c, e                                        ; $4e59: $4b
	ld   c, a                                        ; $4e5a: $4f
	ld   d, e                                        ; $4e5b: $53
	ld   c, e                                        ; $4e5c: $4b
	ld   c, a                                        ; $4e5d: $4f
	ld   d, e                                        ; $4e5e: $53
	ld   c, l                                        ; $4e5f: $4d
	ld   bc, $019e                                   ; $4e60: $01 $9e $01
	and  d                                           ; $4e63: $a2
	.db $01


npcScript_end:
	npc_end


npc2e_scripts:
	npc_call data_03_6994
	npc_groupRoomXYjumpTable @initialScripts
	npc_jumpIfNumBirdsGotten 25, +
	npc_jump data_03_4fde
+
	npc_call data_03_5256
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_giveFruit $00
	npc_groupRoomXYjumpTable @scriptsAfterFruitGiven
	npc_end

@initialScripts:
	.db $1c $00 $00
	.dw @initialScript_1c_00_00
	.db $ff $ff $ff

@scriptsAfterFruitGiven:
	.db $1c $02 $00
	.dw @scriptAfterFruitGiven_1c_02_00

	.db $1c $02 $07
	.dw @scriptAfterFruitGiven_1c_02_07

	.db $1c $02 $03
	.dw @scriptAfterFruitGiven_1c_02_03

	.db $ff $ff $ff

@initialScript_1c_00_00:
	npc_giveFruit $00
	.db $50 $00
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_call data_03_69c8
	npc_end

@scriptAfterFruitGiven_1c_02_00:
	.db $50 $01
	npc_call data_03_69c0
	npc_end

@scriptAfterFruitGiven_1c_02_07:
	.db $50 $02
	npc_increaseScore $08
	npc_call data_03_69c4
	npc_end

@scriptAfterFruitGiven_1c_02_03:
	.db $50 $03
	npc_call data_03_69dd
	npc_call data_03_69cc
	npc_end


npc2f_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 60, +
	npc_jump data_03_4fde
+
	npc_giveFruit $01
	npc_call data_03_5262
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1b $02 $01
	.dw @script_1b_02_01

	.db $1c $02 $02
	.dw @script_1c_02_02

	.db $1b $02 $02
	.dw @script_1b_02_02

	.db $1c $01 $04
	.dw @script_1c_01_04

@script_1b_02_01:
	.db $50 $04
	npc_call data_03_69c4
	npc_end

@script_1c_02_02:
	.db $50 $05
	npc_increaseScore $08
	npc_call data_03_69cc
	npc_end

@script_1b_02_02:
	.db $50 $06
	npc_increaseScore $0c
	npc_call data_03_69c8
	npc_end

@script_1c_01_04:
	.db $50 $07
	npc_increaseScore $10
	npc_call data_03_69c0
	npc_end


npc30_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 40, +
	npc_jump data_03_4fde
+
	npc_giveFruit $02
	npc_call data_03_525a
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1c $01 $00
	.dw @script_1c_01_00

	.db $1c $02 $01
	.dw @script_1c_02_01

	.db $1e $00 $00
	.dw @script_1e_00_00

	.db $1c $00 $04
	.dw @script_1c_00_04

	.db $ff $ff $ff

@script_1c_01_00:
	.db $50 $08
	npc_call data_03_69c0
	npc_end

@script_1c_02_01:
	.db $50 $09
	npc_increaseScore $08
	npc_call data_03_69c4
	npc_end

@script_1e_00_00:
	.db $50 $0a
	npc_call data_03_69dd
	npc_call data_03_69cc
	npc_end

@script_1c_00_04:
	.db $50 $0b
	npc_call data_03_69d5
	npc_call data_03_69cc
	npc_end


npc31_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 75, +
	npc_jump data_03_4fde
+
	npc_giveFruit $03
	npc_call data_03_5266
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1c $01 $02
	.dw @entry0

	.db $1c $00 $03
	.dw @entry1

	.db $1c $00 $08
	.dw @entry2

	.db $1c $01 $06
	.dw @entry3

	.db $ff $ff $ff

@entry0:
	.db $50 $0c
	npc_call data_03_69be
	npc_end

@entry1:
	.db $50 $0d
	npc_increaseScore $08
	npc_call data_03_69c0
	npc_end

@entry2:
	.db $50 $0e
	npc_call data_03_69dd
	npc_call data_03_69c4
	npc_end

@entry3:
	.db $50 $0f
	npc_call data_03_69d5
	npc_call data_03_69cc
	npc_end


npc32_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten 90, +
	npc_jump data_03_4fde
+
	npc_giveFruit $04
	npc_call data_03_526a
	npc_callCommonSoundFuncs_6d6c $03 $ff
	npc_groupRoomXYjumpTable @table
	npc_end

@table:
	.db $1c $02 $04
	.dw @entry0

	.db $1c $01 $03
	.dw @entry1

	.db $1b $01 $00
	.dw @entry2

	.db $1c $00 $06
	.dw @entry3

	.db $ff $ff $ff

@entry0:
	.db $50 $10
	npc_increaseScore $08
	npc_end
	
@entry1:
	.db $50 $11
	npc_increaseScore $0c
	npc_end
	
@entry2:
	.db $50 $12
	npc_increaseScore $10
	npc_end
	
@entry3:
	.db $50 $13
	npc_increaseScore $18
	npc_end


data_03_4fde:
-
	npc_displayTextScreen npcText_yourFaithLooksWeak
	npc_call data_03_699f
	npc_call data_03_6996
	npc_jump -


npcText_yourFaithLooksWeak:
	.db $04 $02
	.asc "Your faith"
	.db $01
	.asc "looks weak."
	.db $01
	.asc "You'll need"
	.db $01
	.asc "more spirit."
	.db $ff $fe $7f


npc16_scripts:
	.db $14
	npc_call func_03_697b
-
	.db $82
	.dw +
	.db $8a
	.dw +
	.db $42 $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	.db $4e $01
data_03_5031:
	.db $89 $85 $16
	.db $05
	.db $41 $0c
	.db $40 $ff
	npc_end


npc69_scripts:
	.db $28


npc17_scripts:
	.db $14
	npc_call func_03_697b
-
	.db $82
	.dw +
	.db $8a
	.dw +
	.db $42 $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	.db $4e $05
	npc_jump data_03_5031


npc3f_scripts:
	npc_call func_03_697b
-
	.db $82
	.dw +
	.db $8a
	.dw +
	.db $42 $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	.db $4e $0a
	npc_jump data_03_5031


npc18_scripts:
	.db $14
	npc_call func_03_697b
-
	.db $82
	.dw +
	.db $8a
	.dw +
	.db $42 $01
	npc_loopAboveParamTimes $b4, -
	npc_end
+
	.db $4c $02
	npc_jump data_03_5031


npc33_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	npc_res4_cb60
	npc_jump _infLoop_639f


func_03_5082:
-
	npc_set_c059 $ff
	.db $4c $01
	.db $89 $6a $16
	.db $42 $02
	.db $8b
	.dw +
	npc_jump -
+
	npc_set_c059 $00
	npc_ret


npc34_scripts:
	npc_call data_03_6994
	npc_groupRoomXYjumpTable @table
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $01
	npc_increaseScore $20
	.db $50 $14
	npc_set_c059 $00
	npc_end

@entry0:
	npc_jumpIfNumBirdsGotten $96, +
	npc_jump data_03_4fde
+
	.db $48 $01
	npc_call data_03_526e
	npc_end

@table:
	.db $1b $00 $01
	.dw @entry0

	.db $ff $ff $ff


func_03_50c0:
	npc_set_c059 $ff
-
	.db $89 $85 $16
	.db $42 $02
	npc_loopAboveParamTimes $1e, -
	npc_set_c059 $01
	npc_ret


npc35_scripts:
	npc_call data_03_6994
	npc_groupRoomXYjumpTable @table
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $02
	npc_increaseScore $20
	.db $50 $15
	npc_set_c059 $00
	npc_end

@entry0:
	npc_jumpIfNumBirdsGotten $c8, +
	npc_jump data_03_4fde
+
	.db $48 $02
	npc_call data_03_527a
	npc_end

@table:
	.db $1b $00 $01
	.dw @entry0

	.db $ff $ff $ff


npc36_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $04
	npc_increaseScore $20
	npc_set_c059 $00
	npc_end


npc38_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $10
	npc_increaseScore $20
	npc_set_c059 $00
	npc_end


npc37_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $08
	npc_increaseScore $20
	npc_set_c059 $00
	npc_end


npc39_scripts:
	npc_call data_03_6994
	npc_set_c059 $ff
	npc_call func_03_50c0
	npc_call func_03_5082
	.db $48 $20
	npc_increaseScore $20
	npc_set_c059 $00
	npc_end


npc3a_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten $14, +
	npc_jump data_03_4fde
+
	.db $53 $07
	npc_call func_03_5248
	npc_end


npc3b_scripts:
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten $4b, +
	npc_jump data_03_4fde
+
	.db $25
	npc_call data_03_5266
	npc_end


npc40_scripts:
	npc_jumpIfSpecialBitemGotten $02, _npc_end_03_529a
	npc_call data_03_6994
	npc_jumpIfNumBirdsGotten $c3, +
	npc_jump data_03_4fde
+
	.db $4a $02
	npc_increaseScore $18
	npc_call data_03_5276
	npc_end


npc41_scripts:
	npc_jumpIfSpecialBitemGotten $04, @end
	.db $14
	.db $c7 $00 $80 $80
	npc_call func_03_6986
	.db $4a $04
	npc_call data_03_69d5
	npc_call data_03_69c6
	.db $89 $6a $16
	.db $c7 $37 $80 $80
@end:
	npc_end


npc00_scripts:
	.db $28
	.db $10
	.db $0f
	npc_res4_cb60
	npc_set2_cbe4
	.db $47 $03
	.db $09
	.db $89 $7c $16
	.db $45 $04
	.db $c0 $84 $00 $00
	npc_loadParamInto_cb78 $05
	.db $c3 $aa
	.dw +
	.db $c0 $01 $00 $00
	npc_loadParamInto_cb78 $19
	npc_end

+
	npc_loadParamInto_cb78 $23
	.db $c3 $80
	.dw +
	npc_end

+
	.db $c3 $40
	.dw +
	npc_setNewNpcID $16

+
	.db $c3 $80
	.dw +
	npc_setNewNpcID $17

+
	npc_setNewNpcID $18

npc01_scripts:
	npc_res4_cb60
	.db $89 $26 $16
	.db $01
	npc_groupRoomXYjumpTable @table
	.db $41 $01
	.db $44 $01
	npc_jump @finally

@func_51d5:
	.db $41 $02
	.db $44 $02
	npc_jump @finally


@func_51dc:
	.db $41 $03
	.db $44 $04
	npc_jump @finally

@finally:
-
	.db $40 $04
	.db $29
	.db $40 $04
	.db $29
	.db $c2 $3c
	.dw -
	npc_loadParamInto_cb78 $0f
	npc_end

@table:
	.db $02 $ff $ff
	.dw @func_51d5

	.db $04 $ff $ff
	.dw @func_51d5

	.db $06 $ff $ff
	.dw @func_51dc

	.db $07 $ff $ff
	.dw @func_51d5

	.db $08 $ff $ff
	.dw @func_51d5

	.db $0a $ff $ff
	.dw @func_51d5

	.db $0b $ff $ff
	.dw @func_51dc

	.db $0c $ff $ff
	.dw @func_51dc

	.db $0d $ff $ff
	.dw @func_51dc

	.db $10 $02 $04
	.dw @func_51dc

	.db $ff $ff $ff


npc02_scripts:
	.db $14
	npc_set2_cbe4 $47
	.db $47 $03
	npc_res4_cb60
	.db $09
	.db $89 $37 $18
	.db $16
	npc_call $69ca
	npc_loadParamInto_cb78 $02
	.db $04
	.db $c3 $a0
	.dw +
	npc_end
+
	.db $c3 $55
	.dw +
	.db $43 $16
+
	.db $c3 $19
	.dw +
	.db $43 $17
+
	.db $43 $3f

func_03_5248:
-
	.db $4f $05
	npc_set_c059 $0a
	.db $89 $73 $16
	npc_loadParamInto_cb78 $02
	npc_loopAboveParamTimes $04, -
	npc_ret


data_03_5256:
	npc_loopAboveParamTimes $06, -
data_03_525a:
	npc_loopAboveParamTimes $09, -
	npc_loopAboveParamTimes $0b, - // $525e
data_03_5262:
	npc_loopAboveParamTimes $0d, -
data_03_5266:
	npc_loopAboveParamTimes $10, -
data_03_526a:
	npc_loopAboveParamTimes $13, -
data_03_526e:
	npc_loopAboveParamTimes $1f, -
	npc_loopAboveParamTimes $24, - // $5272
data_03_5276:
	npc_loopAboveParamTimes $28, -
data_03_527a:
	npc_loopAboveParamTimes $29, -
	npc_loopAboveParamTimes $2e, - // $527e
	npc_loopAboveParamTimes $33, - // $5282


npc15_scripts:
	npc_jumpIfSpecialBitemGotten $08, _npc_end_03_529a
	npc_call data_03_6994
	npc_displayTextScreen npcText_03_529b
	npc_call data_03_699f
	npc_increaseScore $14
	.db $4a $08
	.db $89 $85 $16

_npc_end_03_529a:
	.db $00

npcText_03_529b:
	.db $03 $01
	.asc "Good Job! You"
	.db $01
	.asc "can use this"
	.db $01
	.asc "ticket to"
	.db $01
	.asc "travel between"
	.db $01
	.asc "the 5 railroad"
	.db $01
	.asc "stations."
	.db $ff $42 $3c $fe $7f


npc3c_scripts:
	npc_call data_03_6994
-
	npc_jumpIfNumBirdsGotten $ff, +
	npc_call func_03_69b4
	npc_loopAboveParamTimes $96, -
+
	npc_set_c059 $00
	.db $50 $21
	npc_increaseScore $18
	npc_end


npc3d_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	npc_res4_cb60
	npc_call data_03_6996
-
	.db $ca $ff
	.dw +
	npc_call func_03_69aa
	npc_loopAboveParamTimes $4b, -
+
	npc_set_c059 $00
	.db $50 $21
	npc_increaseScore $18
	npc_end


// npc right of 1st screen (npc 4)
npc04_scripts:
	npc_groupRoomXYjumpTable @initialScriptTable

@afterInitialScript:
	npc_set2_cbe4
	npc_res4_cb60
	npc_call data_03_6996
	npc_groupRoomXYjumpTable @regularScripts

@end:
	npc_end

@initialScriptTable:
// group - room x - room y - pointer to go to
	.db $00 $02 $03
	.dw @@raftGuy

	.db $01 $00 $04
	.dw @@bottomLeftCityGuy

	.db $00 $02 $02
	.dw @@guyRightOf1stScreen

	.db $0a $02 $02
	.dw @@housesByDynamiteRiver

	.db $08 $02 $00
	.dw @@byHotelCasino

	.db $01 $02 $02
	.dw @@byCityBar

	.db $09 $00 $01
	.dw @@darkUndergroundRoom

	.db $0b $04 $03
	.dw @@byBeachLockedFishHouse

	.db $08 $00 $02
	.dw @@byHotelsThinCarPath

	.db $ff $ff $ff

@@raftGuy:
	npc_jumpIfSpecialBitemGotten SPECIALB_RAFT @end
	npc_jump @afterInitialScript

@@bottomLeftCityGuy:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR @end
	npc_jump @afterInitialScript

// from npc right of 1st screen
@@guyRightOf1stScreen:
	npc_jumpIfArmorOfGodGotten AOG_BELT @end
	npc_jump @afterInitialScript

@@housesByDynamiteRiver:
	npc_jumpIfArmorOfGodGotten AOG_HELM @end
	npc_jump @afterInitialScript

@@byHotelCasino:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR @afterInitialScript
	.db $c7 $18 $05 $08
	npc_end

@@byCityBar:
	npc_jumpIfArmorOfGodGotten AOG_BELT @afterInitialScript
	npc_end

@@darkUndergroundRoom:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_jump @afterInitialScript
+
	npc_jumpIfSpecialBitemGotten SPECIALB_LAMP npcScript_end
	npc_jump @afterInitialScript

@@byBeachLockedFishHouse:
	npc_jumpIfItemGotten $12, @end
	npc_jump @afterInitialScript

@@byHotelsThinCarPath:
	npc_jumpIfItemGotten $10, @end
	npc_jump @afterInitialScript

@regularScripts:
	.db $00 $02 $03
	.dw @@raftGuy

	.db $01 $00 $04
	.dw @@bottomLeftCityGuy

	.db $00 $02 $02
	.dw @@guyRightOf1stScreen

	.db $00 $05 $03
	.dw @@guyByParkExit

	.db $0a $02 $02
	.dw @@housesByDynamiteRiver

	.db $08 $02 $00
	.dw @@byHotelCasino

	.db $01 $02 $02
	.dw @@byCityBar

	.db $09 $00 $01
	.dw @@darkUndergroundRoom

	.db $0b $04 $03
	.dw @@byBeachLockedFishHouse

	.db $08 $00 $02
	.dw @@byHotelsThinCarPath

	.db $ff $ff $ff

@@toRegularScripts:
	npc_groupRoomXYjumpTable @regularScripts

@@afterTextDisplay:
	npc_call data_03_699f
	npc_call data_03_6996
	npc_jump @@toRegularScripts

@@raftGuy:
	npc_jumpIfSpecialBitemGotten SPECIALB_JAWBONE, +
	npc_displayTextScreen npcText_03_542e
	npc_jump @@afterTextDisplay
+
	npc_displayTextScreen npcText_03_54c2
	npc_jump @@afterTextDisplay

@@bottomLeftCityGuy:
	npc_displayTextScreen npcText_03_550c
	npc_jump @@afterTextDisplay

@@guyRightOf1stScreen:
	npc_displayTextScreen npcText_03_554e
	npc_jump @@afterTextDisplay

@@guyByParkExit:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_displayTextScreen npcText_03_55bf
	npc_jump @@afterTextDisplay
+
	npc_displayTextScreen npcText_03_5760
	npc_jump @@afterTextDisplay

@@housesByDynamiteRiver:
	npc_displayTextScreen npcText_03_5623
	npc_jump @@afterTextDisplay

@@byHotelCasino:
	npc_displayTextScreen npcText_03_5667
	npc_jump @@afterTextDisplay

@@byCityBar:
	npc_displayTextScreen npcText_03_569a
	npc_jump @@afterTextDisplay

@@darkUndergroundRoom:
	npc_displayTextScreen npcText_03_56c5
	npc_jump @@afterTextDisplay

@@byBeachLockedFishHouse:
	npc_displayTextScreen npcText_03_5713
	npc_jump @@afterTextDisplay

@@byHotelsThinCarPath:
	npc_displayTextScreen npcText_03_57b9
	npc_jump @@afterTextDisplay


npcText_03_542e:
	.db $02 $02
	.asc "Hello. If"
	.db $01
	.asc "you'd like"
	.db $01
	.asc "the raft,"
	.db $01
	.asc "you'll need"
	.db $01
	.asc "Samson's"
	.db $01
	.asc "Jawbone to"
	.db $01
	.asc "retrieve it."
	.db $ff $42 $19
	.db $fe $fd

	.db $03 $02
	.asc "Rumor has it"
	.db $01
	.asc "the Jawbone"
	.db $01
	.asc "is in a"
	.db $01
	.asc "locked room"
	.db $01
	.asc "in the"
	.db $01
	.asc "shipyard."
	.db $ff $fe $7f


npcText_03_54c2:
	.db $03 $01
	.asc "Hello, again."
	.db $01
	.asc "Now you can"
	.db $01
	.asc "get the raft"
	.db $01
	.asc "by throwing"
	.db $01
	.asc "the Jawbone"
	.db $01
	.asc "at it."
	.db $ff $fe $7f


npcText_03_550c:
	.db $03 $02
	.asc "You'd better"
	.db $01
	.asc "have the"
	.db $01
	.asc "Breastplate"
	.db $01
	.asc "before you"
	.db $01
	.asc "enter this"
	.db $01
	.asc "area."
	.db $ff $fe $7f


npcText_03_554e:
	.db $01 $00
	.asc "Hi. Go down"
	.db $01
	.asc "these stairs"
	.db $01
	.asc "and look"
	.db $01
	.asc "around. Once"
	.db $01
	.asc "you find"
	.db $01
	.asc "the Belt of"
	.db $01
	.asc "Truth, you'll"
	.db $01
	.asc "be able to"
	.db $01
	.asc "leave the park."
	.db $ff $fe $7f


npcText_03_55bf:
	.db $02 $00
	.asc "Downtown lies"
	.db $01
	.asc "east of here,"
	.db $01
	.asc "but you'll"
	.db $01
	.asc "need the Belt"
	.db $01
	.asc "of Truth to"
	.db $01
	.asc "push this rock"
	.db $01
	.asc "out of the way."
	.db $ff $fe $7f


npcText_03_5623:
	.db $03 $01
	.asc "Hey, Sonny."
	.db $01
	.asc "You'll need"
	.db $01
	.asc "the Helmet and"
	.db $01
	.asc "the Boots to"
	.db $01
	.asc "cross here."
	.db $ff $fe $7f


npcText_03_5667:
	.db $04 $01
	.asc "You'd be very"
	.db $01
	.asc "wise not to"
	.db $01
	.asc "enter this"
	.db $01
	.asc "building."
	.db $ff $fe $7f


npcText_03_569a:
	.db $04 $02
	.asc "Hey"
	.db $21
	.asc " You'd"
	.db $01
	.asc "better stay"
	.db $01
	.asc "away from"
	.db $01
	.asc "bars."
	.db $ff $fe $7f


npcText_03_56c5:
	.db $03 $01
	.asc "If you have"
	.db $01
	.asc "the Belt of"
	.db $01
	.asc "Truth and the"
	.db $01
	.asc "Torch, this"
	.db $01
	.asc "makes a great"
	.db $01
	.asc "shortcut."
	.db $ff $fe $7f


npcText_03_5713:
	.db $03 $01
	.asc "The puzzle in"
	.db $01
	.asc "this room is"
	.db $01
	.asc "much easier"
	.db $01
	.asc "to solve if"
	.db $01
	.asc "you have a"
	.db $01
	.asc "lit torch."
	.db $ff $fe $7f


npcText_03_5760:
	.db $03 $01
	.asc "Now that you"
	.db $01
	.asc "have the Belt"
	.db $01
	.asc "of Truth, push"
	.db $01
	.asc "this rock out"
	.db $01
	.asc "of the way to"
	.db $01
	.asc "exit the park."
	.db $ff $fe $7f


npcText_03_57b9:
	.db $03 $01
	.asc "But if we hope"
	.db $01
	.asc "for what we"
	.db $01
	.asc "do not yet"
	.db $01
	.asc "have, we wait"
	.db $01
	.asc "for it"
	.db $01
	.asc "patiently."
	.db $ff $fe $7f


npc3e_scripts:
	npc_groupRoomXYjumpTable @table
	npc_end

@end:
	.db $c7 $00 $80 $80
	npc_end

@table:
	.db $09 $01 $03
	.dw @entry0

	.db $0f $00 $04
	.dw @entry1

	.db $09 $01 $04
	.dw @entry2

	.db $00 $05 $03
	.dw @entry3

	.db $01 $02 $02
	.dw @entry4

	.db $24 $00 $00
	.dw @entry5

	.db $22 $00 $00
	.dw @entry6

	.db $ff $ff $ff

@entry0:
	npc_jumpIfItemGotten $08, @end
	npc_end

@entry1:
	npc_jumpIfItemGotten $05, @end
	npc_end

@entry2:
	.db $88
	.dw @end
	npc_end

@entry3:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	npc_jumpIfItemGotten $14, ++
+
	npc_end
++
	.db $c7 $82 $80 $80
	npc_end

@entry4:
	npc_jumpIfArmorOfGodGotten AOG_BELT, +
	.db $c7 $de $80 $80
+
	npc_end

@entry5:
	npc_jumpIfArmorOfGodGotten AOG_SWORD, +
	npc_end
+
	.db $c7 $9c $80 $80
	npc_end

@entry6:
	npc_jumpIfArmorOfGodGotten AOG_BOOTS, +
	npc_end
+
	.db $c7 $9c $80 $80
	npc_end


npc05_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $01
	.db $44 $01
-
	.db $40 $1e
	npc_loadParamInto_cb78 $06
	.db $0b
	npc_jump -


npc06_scripts:
	npc_res4_cb60
	.db $42 $0a
	.db $47 $03
	.db $41 $02
	.db $44 $01
-
	.db $c3 $80
	.dw +
	.db $0d
	.db $40 $32
	npc_jump -
+
	.db $0e
	.db $40 $32
	npc_jump -


npc07_scripts:
	npc_res4_cb60
	.db $42 $0a
	.db $47 $03
	.db $41 $04
	.db $44 $01
-
	.db $40 $20
	.db $0e
	npc_jump -


npc4f_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $02
	.db $41 $02
	npc_res4_cb60
	.db $44 $01
-
	.db $40 $ff
	.db $0f
	npc_jump -


npc5b_scripts:
-
	.db $55 $50
	.db $82
	.dw +
	.db $42 $01
	npc_jump $58b2
+
	npc_displayTextScreen @text
	.db $42 $1e
	.db $82
	.dw -
	npc_jump -

@text:
	.db $01 $01
	.asc "Hey Buddy!"
	.db $01
	.asc "If you need"
	.db $01
	.asc "clues on what"
	.db $01
	.asc "to do next,"
	.db $01
	.asc "go to the"
	.db $01
	.asc "church in the"
	.db $01
	.asc "housing area."
	.db $01
	.asc "It's east of"
	.db $01
	.asc "downtown."
	.db $ff $fe $7f


npc50_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $02
	.db $41 $02
	npc_res4_cb60
	npc_set2_cbe4
	npc_loadParamInto_cb78 $0a
@bigLoop:
	.db $8d $01 $0a
	.db $c9 $d0
	.dw @func_598d
	.db $c9 $08
	.dw @func_598d
	.db $c9 $5c
	.dw @func_598f
	.db $c3 $c0
	.dw +
	.db $07
	npc_jump ++
+
	.db $c3 $aa
	.dw +
	.db $08
	npc_jump ++
+
	.db $c3 $80
	.dw +
	.db $05
	npc_jump ++
+
	.db $06
++
	.db $c9 $d0
	.dw @func_598d
	.db $c9 $08
	.dw @func_598d
	.db $c9 $5c
	.dw @func_598f
	.db $c3 $aa
	.dw +
	.db $40 $20
	npc_jump @bigLoop
+
	.db $c3 $80
	.dw +
	.db $40 $10
	npc_jump @bigLoop
+
	.db $40 $08
	npc_jump @bigLoop
@func_598d:
	npc_setNewNpcID $51
@func_598f:
	npc_setNewNpcID $52


npc51_scripts:
	.db $47 $04
	npc_set6_cb60_reset_cb6c
	npc_set2_cbe4
	.db $c9 $08
	.dw +
	npc_jump ++
+
	.db $07
	npc_res4_cb60
	.db $16
	.db $05
	.db $40 $04
	.db $07
	.db $c0 $54 $00 $00
	npc_loadParamInto_cb78 $4b
	.db $41 $04
	.db $40 $10
	npc_setNewNpcID $50

++
	.db $08
	npc_res4_cb60
	.db $16
	.db $05
	.db $40 $04
	.db $08
	.db $c0 $53 $00 $00
	npc_loadParamInto_cb78 $4b
	.db $41 $04
	.db $40 $10
	npc_setNewNpcID $50


npc52_scripts:
	.db $47 $04
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_set2_cbe4
	.db $05
	.db $40 $08
	npc_loadParamInto_cb78 $02
	.db $c0 $55 $00 $00
	npc_loadParamInto_cb78 $05
	.db $06
	.db $40 $08
	npc_loadParamInto_cb78 $32
	.db $41 $04
	.db $40 $10
	npc_setNewNpcID $50


npc53_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	.db $01
	npc_set2_cbe4
	.db $41 $10
	npc_res4_cb60
-
	.db $08
	.db $40 $02
	.db $05
	.db $40 $02
	.db $c9 $b4
	.dw func_03_59f9
	.db $c9 $24
	.dw func_03_59f9
	npc_jump -


func_03_59f5:
	.db $07
	npc_jump +

func_03_59f9:
	.db $08

+
	.db $40 $04

func_03_59fc:
	.db $06
	.db $41 $01
	.db $40 $18
	.db $05
	.db $40 $04
	.db $06
	.db $40 $04
	.db $05
	.db $40 $02
	.db $06
	.db $40 $02
	npc_end


npc54_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	npc_set2_cbe4
	.db $01
	.db $41 $10
	npc_res4_cb60
-
	.db $07
	.db $40 $02
	.db $05
	.db $40 $02
	.db $c9 $b4
	.dw func_03_59f5
	.db $c9 $24
	.dw func_03_59f5
	npc_jump -


npc55_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	npc_set2_cbe4
	.db $01
	.db $41 $08
	npc_res4_cb60
	.db $05
	.db $40 $02
	.db $c9 $b4
	.dw func_03_59fc
	npc_jump $5a2e


npc08_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $04
	.db $44 $01
	npc_loadParamInto_cb78 $0a
	.db $11
	.db $40 $40
	.db $10
--
	.db $40 $10
	.db $8d $03 $0a
	.db $c9 $b4
	.dw @func_5a6d
	.db $c9 $b8
	.dw @func_5a6f
	npc_loopAboveParamTimes $03, --
	.db $12
-
	.db $40 $10
	.db $8d $03 $0a
	.db $c9 $b4
	.dw @func_5a6d
	.db $c9 $b8
	.dw @func_5a6f
	npc_loopAboveParamTimes $03, -
	.db $13
	npc_jump --
@func_5a6d:
	npc_setNewNpcID $4c
@func_5a6f:
	npc_setNewNpcID $4d


npc4c_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $47 $04
	.db $16
	.db $89 $47 $16
	.db $c3 $aa
	.dw +
	.db $c7 $98 $80 $80
	npc_setNewNpcID $08
+
	.db $c3 $80
	.dw +
	.db $c7 $98 $80 $80
	npc_setNewNpcID $08
+
	.db $c7 $98 $80 $80
	npc_setNewNpcID $08


npc4d_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $47 $04
	.db $16
	.db $89 $47 $16
	.db $c3 $aa
	.dw +
	.db $c7 $50 $80 $80
	npc_setNewNpcID $08
+
	.db $c3 $80
	.dw +
	.db $c7 $50 $80 $80
	npc_setNewNpcID $08
+
	.db $c7 $50 $80 $80
	npc_setNewNpcID $08


npc09_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $02
	.db $41 $03
	.db $44 $01
-
	.db $c3 $32
	.dw ++
	npc_loadParamInto_cb78 $14
	.db $c3 $80
	.dw +
	.db $0d
	.db $40 $32
	.db $17
	npc_jump -
+
	.db $0e
	.db $40 $32
	.db $17
	npc_jump -
++
	.db $c3 $80
	.dw +
	.db $12
	npc_jump -
+
	.db $13
	npc_jump -


npc0a_scripts:
	npc_res4_cb60
	.db $47 $03
	.db $41 $01
	.db $44 $01
	npc_loadParamInto_cb78 $1e
	.db $0f
	.db $40 $20
	.db $0d
	.db $41 $02
-
	.db $40 $ff
	.db $17
	npc_jump -


npc0b_scripts:
	.db $41 $04
-
	npc_loadParamInto_cb78 $0f
	.db $c3 $80
	.dw -
	.db $10
	.db $c3 $c0
	.dw +
	.db $c0 $0c $00 $00
	npc_jump -
+
	.db $c3 $aa
	.dw +
	.db $c0 $0d $00 $00
	npc_jump -
+
	.db $c3 $80
	.dw +
	.db $c0 $0e $00 $00
	npc_jump -
+
	.db $c0 $0f $00 $00
	npc_jump -


npc0c_scripts:
	.db $41 $03
	npc_jump func_03_5b39


npc0d_scripts:
	.db $41 $02
	npc_jump func_03_5b39


npc0e_scripts:
	.db $41 $05
	npc_jump func_03_5b39


npc0f_scripts:
	.db $41 $06

func_03_5b39:
	.db $01
	.db $03
	.db $c3 $aa
	.dw ++
	.db $c3 $80
	.dw +
	.db $89 $a9 $16
	npc_jump ++
+
	.db $89 $ba $16
++
	.db $c3 $aa
	.dw +
	npc_jump ++
+
	.db $c3 $80
	.dw +
	.db $06
	.db $40 $10
	npc_jump ++
+
	.db $05
	.db $40 $10
++
	.db $10
	npc_res4_cb60
	.db $47 $03
	.db $44 $01
	.db $40 $ff
	npc_end


npc1e_scripts:
	npc_set6_cb60_reset_cb6c
	.db $03
	.db $47 $02
	.db $41 $04
	.db $44 $04
	npc_res4_cb60
-
	npc_loadParamInto_cb78 $14
	.db $40 $40
	.db $0f
	npc_loadParamInto_cb78 $03
	.db $40 $40
	.db $0f
	npc_loadParamInto_cb78 $03
	.db $40 $40
	.db $0f
	npc_jump -


npc10_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $02
	.db $41 $02
	.db $44 $02
	npc_res4_cb60
	.db $11
	.db $40 $10
	.db $10
	.db $40 $10
	npc_setNewNpcID $11


npc11_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $02
	.db $44 $02
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $16
	.db $46 $12
	.db $89 $04 $16
	npc_loadParamInto_cb78 $28
	npc_setNewNpcID $10


npc12_scripts:
	npc_res4_cb60
	npc_set2_cbe4
	.db $01
	.db $41 $04
	.db $44 $04
	.db $40 $ff
	npc_end


npc4e_scripts:
	npc_set6_cb60_reset_cb6c
	.db $14
	npc_res4_cb60
	.db $44 $02
	.db $01
	.db $41 $03
	npc_set2_cbe4
	.db $89 $0d $16
	npc_loadParamInto_cb78 $28
-
	.db $10
	.db $40 $04
	.db $11
	.db $40 $04
	npc_loopAboveParamTimes $05, -
	.db $89 $0d $16
	npc_jump -



npc13_scripts:
	.db $47 $03
	.db $44 $04
	.db $03
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
-
	.db $40 $80
	.db $17
	.db $c3 $80
	.dw +
	.db $41 $02
	npc_jump -
+
	.db $c3 $80
	.dw +
	.db $41 $03
	npc_jump -
+
	.db $c3 $80
	.dw +
	.db $41 $04
	npc_jump -
+
	.db $41 $05
	npc_jump -


npc14_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $03
	.db $05
	npc_res4_cb60
-
	npc_loadParamInto_cb78 $04
	npc_jump -


npc1f_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $02
	.db $44 $04
-
	.db $12
	.db $13
	npc_jump -


npc19_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $02
	.db $41 $03
	.db $44 $01
-
	.db $40 $ff
	.db $17
	npc_loadParamInto_cb78 $01
	npc_jump -


npc1c_scripts:
	npc_jumpIfItemGotten $14, +
	npc_jump @end
+
	npc_jumpIfArmorOfGodGotten AOG_BELT, @func_5c2e
@end:
	npc_end
@func_5c2e:
	npc_loadParamInto_cb78 $14
	.db $c0 $1d $00 $00
	npc_loopAboveParamTimes $06, @func_5c2e
	.db $28
	npc_end


npc1d_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $41 $01
	.db $44 $01
	.db $47 $03
-
	.db $40 $10
	.db $c3 $7f
	.dw +
	.db $0d
	npc_jump -
+
	.db $0e
	npc_jump -


npc1a_scripts:
	.db $41 $02
	npc_call func_03_5c91
-
	.db $c7 $4c $80 $80
	.db $89 $1d $16
	npc_loadParamInto_cb78 $03
	.db $40 $10
	.db $ce $10
	.dw +
	npc_jump -
+
	.db $c7 $4c $80 $80
	.db $89 $1d $16
-
	.db $0a
	.db $40 $ff
	npc_jump -


npc21_scripts:
	.db $41 $03
	npc_call func_03_5c91
-
	.db $c7 $cc $80 $80
	.db $89 $1d $16
	npc_loadParamInto_cb78 $02
	.db $40 $10
	.db $c3 $80
	.dw +
	.db $0d
	npc_jump -
+
	.db $0e
	npc_jump -


func_03_5c91:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $44 $01
	.db $47 $03
	npc_loadParamInto_cb78 $0a
	npc_ret


npc1b_scripts:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, npcScript_end
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $02
	.db $41 $02
	.db $44 $0e
-
	.db $40 $ff
	.db $c3 $aa
	.dw +
	.db $17
	npc_jump -
+
	.db $c3 $7f
	.dw +
	.db $0d
	npc_jump -
+
	.db $0e
	npc_jump -


npc42_scripts:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, npcScript_end
	npc_res4_cb60
	.db $44 $0e
-
	npc_loadParamInto_cb78 $01
	npc_jump $5cc5


npc23_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $02
	.db $44 $02
-
	.db $10
	.db $40 $20
	.db $11
	.db $40 $20
	.db $c3 $80
	.dw +
	.db $10
+
	.db $46 $26
	.db $89 $61 $16
	npc_loadParamInto_cb78 $0a
	.db $46 $26
	.db $89 $61 $16
	npc_loadParamInto_cb78 $0a
	.db $46 $26
	.db $89 $61 $16
	npc_loadParamInto_cb78 $0a
	.db $0f
	.db $40 $42
	.db $05
	npc_jump -


npc26_scripts:
	npc_set2_cbe4
	npc_res4_cb60
	.db $41 $04
	.db $01
	.db $44 $04
	.db $40 $ff
	npc_end


npc58_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $41 $04
	.db $01
	.db $44 $06
	.db $40 $ff
	npc_end


npc59_scripts:
	npc_set6_cb60_reset_cb6c
	npc_jump npc26_scripts


npc24_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $03
	.db $44 $02
-
	.db $12
	.db $13
	npc_loadParamInto_cb78 $1e
	npc_jump -


npc25_scripts:
	npc_res4_cb60
	.db $89 $0a $18
	npc_loadParamInto_cb78 $0a
	.db $47 $03
	.db $41 $02
	.db $44 $02
-
	.db $40 $ff
	.db $c3 $55
	.dw +
	.db $17
	npc_jump -
+
	.db $89 $0a $18
	npc_jump -


npc28_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $41 $03
	.db $47 $03
	.db $44 $04
-
	.db $40 $a0
	.db $0d
	npc_jump -


npc2c_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $41 $04
	.db $47 $03
	.db $44 $04
-
	.db $40 $40
	.db $0e
	.db $40 $40
	.db $0d
	.db $40 $40
	.db $0d
	.db $40 $40
	.db $0e
	.db $40 $40
	.db $0e
	.db $40 $40
	.db $0d
	.db $40 $40
	.db $0f
	npc_jump -


npc27_scripts:
	npc_res4_cb60
	npc_set6_cb60_reset_cb6c
	npc_loadParamInto_cb78 $0a
	.db $41 $03
	.db $47 $03
-
	.db $11
	.db $82
	.dw +
	.db $40 $18
	.db $10
	.db $82
	.dw +
	.db $40 $18
	npc_jump -
+
	.db $4f $05
	npc_loadParamInto_cb78 $2d
	npc_setNewNpcID $27


npc2a_scripts:
	npc_jumpIfItemGotten $10, func_03_5db9
	.db $01
	npc_set6_cb60_reset_cb6c
	.db $14
-
	npc_loadParamInto_cb78 $ff
	npc_loopAboveParamTimes $03, -
	npc_res4_cb60
	.db $c7 $8d $80 $80
func_03_5d9d:
	.db $41 $02
	.db $44 $02
	.db $40 $ff
	npc_end


npc2b_scripts:
	npc_jumpIfItemGotten $10, func_03_5db9
	npc_set6_cb60_reset_cb6c
	.db $01
	.db $14
-
	npc_loadParamInto_cb78 $ff
	npc_loopAboveParamTimes $03, -
	npc_res4_cb60
	.db $c7 $00 $80 $80
	npc_jump func_03_5d9d


func_03_5db9:
	.db $c7 $00 $80 $80
	npc_end


npc29_scripts:
	npc_res4_cb60
	npc_loadParamInto_cb78 $0a
	.db $44 $02
	.db $47 $03
@loop:
	.db $41 $01
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $02
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $03
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $04
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $03
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $41 $02
	.db $0f
-
	.db $40 $20
	.db $c3 $80
	.dw -
	.db $0f
	npc_jump @loop


npc22_scripts:
npc49_scripts:
	.db $47 $03
	.db $44 $02
	.db $41 $03
	npc_res4_cb60
--
	.db $40 $10
	.db $0e
	.db $ce $10
	.dw +
-
	.db $0b
	.db $0b
	.db $0b
	npc_jump --
+
	.db $0d
	npc_jump -


npc4b_scripts:
	.db $47 $04
	.db $44 $01
	.db $41 $01
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
-
	.db $40 $ff
	.db $0f
	npc_jump -


npc43_scripts:
npc44_scripts:
	npc_set6_cb60_reset_cb6c
	.db $44 $02
	.db $16
	.db $47 $03
	npc_res4_cb60
@loop:
	.db $c3 $aa
	.dw +
	npc_loadParamInto_cb78 $0a
	npc_jump @func_5e3f
+
	.db $c3 $80
	.dw +
	npc_loadParamInto_cb78 $28
	npc_jump @func_5e3f
+
	npc_loadParamInto_cb78 $14

@func_5e3f:
	npc_set6_cb60_reset_cb6c
	.db $16
	.db $89 $61 $16
	.db $c3 $80
	.dw +
	.db $46 $58
	npc_jump ++
+
	.db $46 $59
++
	npc_loadParamInto_cb78 $05
	npc_set6_cb60_reset_cb6c
	.db $16
	.db $89 $61 $16
	.db $c3 $80
	.dw +
	.db $46 $58
	npc_jump @loop
+
	.db $46 $59
	npc_jump @loop


npc45_scripts:
	npc_set6_cb60_reset_cb6c
	npc_addParamsToXthenYCoords $02 $00
	npc_res4_cb60
	npc_jump _infLoop_639f


npc46_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $89 $58 $16
	npc_loadParamInto_cb78 $05
	.db $c7 $00 $80 $80
	npc_end


npc5a_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $89 $58 $16
	npc_loadParamInto_cb78 $05
	npc_end


npc47_scripts:
npc48_scripts:
	.db $1f
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	npc_jump _infLoop_639f


npc56_scripts:
npc57_scripts:
	npc_set6_cb60_reset_cb6c
	npc_set_c059 $ff
	.db $05
	.db $01
	npc_res4_cb60
	npc_loadParamInto_cb78 $1e
	.db $89 $f2 $15
	.db $41 $01
	.db $40 $10
	.db $41 $02
	.db $40 $08
	.db $41 $03
	.db $40 $08
	.db $41 $04
	.db $40 $08
	.db $41 $05
	.db $40 $08
	.db $41 $06
	.db $40 $08
	.db $41 $07
	.db $40 $08
	.db $41 $08
	.db $40 $50
	npc_set_c059 $01
	npc_end


npc4a_scripts:
	.db $47 $04
	.db $1d
	.db $01
	npc_res4_cb60
	.db $8d $01 $1e
	npc_set6_cb60_reset_cb6c
-
	.db $05
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $06
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $05
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	.db $40 $01
	npc_loadParamInto_cb78 $01
	npc_jump -


npc5d_scripts:
	npc_jumpIfArmorOfGodGotten AOG_BELT, _npc_end_03_5f56
	.db $41 $03
	.db $51 $31
	.db $50 $30
	npc_jump ++
@loop:
	.db $40 $20
	.db $c3 $20
	.dw @func_5f2a
@loop2:
	.db $c3 $20
	.dw ++
	.db $c3 $80
	.dw +
	.db $0d
	npc_jump @loop
+
	.db $0e
	npc_jump @loop
++
	.db $01
	npc_res4_cb60
	.db $50 $30
	.db $05
	.db $40 $08
	.db $06
	npc_loadParamInto_cb78 $0a
	.db $06
	.db $40 $08
	.db $51 $30
	.db $04
	.db $02
	npc_jump @loop
@func_5f2a:
	.db $c0 $01 $00 $00
	npc_jump @loop2


npc5c_scripts:
npc5e_scripts:
	npc_jumpIfArmorOfGodGotten AOG_BELT, data_03_5f57
	.db $14
	.db $1d
	.db $03
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
@loop:
	.db $55 $5d
	npc_loadParamInto_cb78 $01
	npc_jumpIfItemGotten $30, @func_5f49
	npc_jumpIfItemGotten $31, _npc_end_03_5f56
	npc_jump @loop
@func_5f49:
	npc_loadParamInto_cb78 $01
	npc_jumpIfItemGotten $31, _npc_end_03_5f56
	npc_jumpIfItemGotten $30, @func_5f49
	npc_jump @loop

_npc_end_03_5f56:
	npc_end

data_03_5f57:
	.db $c7 $85 $08 $02
	npc_end


npc5f_scripts:
	.db $14
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $50 $31
	.db $16
	npc_loadParamInto_cb78 $05
	.db $04
	.db $c7 $85 $08 $02
	.db $89 $d7 $15
	npc_end


npc60_scripts:
	.db $51 $30
	.db $51 $31
	.db $01
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, @func_5fc1
	.db $41 $10
@loop:
	.db $40 $10
	.db $82
	.dw @func_5f85
	.db $c9 $00
	.dw @func_5f91
	.db $c9 $9c
	.dw @func_5fa9
@func_5f85:
	.db $c3 $80
	.dw +
	.db $0d
	npc_jump @loop
+
	.db $0e
	npc_jump @loop
@func_5f91:
	.db $c3 $33
	.dw +
	npc_jump @func_5f85
+
	.db $c7 $14 $80 $80
	.db $89 $5f $17
	.db $8d $50 $78
	.db $c7 $00 $80 $80
	npc_jump @loop
@func_5fa9:
	.db $c3 $33
	.dw +
	npc_jump @func_5f85
+
	.db $c7 $14 $80 $80
	.db $89 $5f $17
	.db $8d $50 $78
	.db $c7 $9d $80 $80
	npc_jump @loop
@func_5fc1:
	.db $c7 $84 $0c $01
	npc_end


npc61_scripts:
	npc_jumpIfArmorOfGodGotten AOG_ARMOUR, npcScript_end
	npc_loadParamInto_cb78 $0a
	npc_jumpIfItemGotten $30, +
	npc_jumpIfItemGotten $31, ++
	.db $50 $30
	npc_jump @func_600d

+
	npc_jumpIfItemGotten $31, +++
	.db $51 $30
	.db $50 $31
	.db $89 $d7 $15
	npc_jump @func_600d

++
	.db $50 $30
	.db $89 $d7 $15
	npc_jump @func_600d

+++
	.db $89 $d7 $15
	.db $04
	.db $c0 $03 $80 $80
	npc_loadParamInto_cb78 $0f
	.db $c7 $84 $0c $01
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	npc_end

@func_600d:
	.db $04
	.db $c3 $c0
	.dw +
	.db $80 $30 $10
	npc_jump @func_602f
+
	.db $c3 $aa
	.dw +
	.db $80 $60 $70
	npc_jump @func_602f
+
	.db $c3 $80
	.dw +
	.db $80 $a0 $50
	npc_jump @func_602f
+
	.db $80 $e0 $10

@func_602f:
	.db $82
	.dw @func_600d
	.db $c9 $00
	.dw +
	npc_jump @func_600d
+
	.db $47 $03
	.db $44 $02
	.db $41 $03
	npc_res4_cb60
--
	.db $40 $10
	.db $0e
	.db $ce $10
	.dw +

-
	.db $0b
	.db $0b
	.db $0b
	npc_jump --
+
	.db $0d
	npc_jump -


npc63_scripts:
	npc_jumpIfArmorOfGodGotten AOG_SWORD, @func_6098
	npc_loadParamInto_cb78 $0a
	npc_jumpIfItemGotten $30, +
	npc_jumpIfItemGotten $31, ++
	.db $50 $30
	npc_jump @func_60c9
+
	npc_jumpIfItemGotten $31, +++
	.db $51 $30
	.db $50 $31
	.db $89 $d7 $15
	npc_jump @func_609d
++
	.db $50 $30
	.db $89 $d7 $15
	npc_jump @func_609d
+++
	.db $89 $d7 $15
	.db $04
	.db $c0 $03 $80 $80
	npc_loadParamInto_cb78 $0f
	.db $c7 $84 $0e $01
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	.db $89 $85 $16
	npc_loadParamInto_cb78 $02
	npc_end

@func_6098:
	.db $c7 $84 $0e $01
	npc_end

@func_609d:
	.db $04
	.db $c3 $c0
	.dw +
	.db $80 $b0 $50
	npc_jump @func_60bf
+
	.db $c3 $aa
	.dw +
	.db $80 $40 $90
	npc_jump @func_60bf
+
	.db $c3 $80
	.dw +
	.db $80 $70 $70
	npc_jump @func_60bf
+
	.db $80 $20 $30

@func_60bf:
	.db $82
	.dw @func_609d
	.db $c9 $00
	.dw @func_60c9
	npc_jump @func_609d

@func_60c9:
	npc_res4_cb60
	.db $41 $04
	.db $44 $0e
-
	.db $40 $10
	.db $ce $10
	.dw ++
	.db $c3 $2a
	.dw +
	npc_jump -
+
	.db $c0 $64 $00 $08
	.db $8d $05 $0a
++
	.db $0f
	npc_jump -


npc64_scripts:
	.db $01
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $41 $03
	.db $44 $04
	.db $06
	.db $40 $ff
	npc_setNewNpcID $5a


npc65_scripts:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
	.db $89 $d7 $15
	.db $16
	npc_end


npc62_scripts:
	.db $51 $30
	.db $51 $31
	npc_jumpIfArmorOfGodGotten AOG_SWORD, npcScript_end
	npc_res4_cb60
	.db $41 $03
	.db $44 $08
@loop:
	.db $40 $10
	.db $ce $10
	.dw @func_6178
	.db $c3 $33
	.dw +
	npc_jump @loop
+
	.db $ce $30
	.dw @loop
	.db $ce $20
	.dw @loop
	.db $ce $10
	.dw @loop
	.db $89 $ec $16
	.db $d0 $09
	.dw +
	.db $c7 $45 $81 $80
	npc_loadParamInto_cb78 $01
	.db $c7 $45 $82 $80
	npc_loadParamInto_cb78 $01
	.db $c7 $45 $83 $80
	.db $8d $03 $0a
	.db $c7 $00 $83 $80
	npc_loadParamInto_cb78 $01
	.db $c7 $00 $82 $80
	npc_loadParamInto_cb78 $01
	.db $c7 $00 $81 $80
	.db $8d $04 $08
	npc_jump @loop
+
	.db $c7 $45 $ff $80
	npc_loadParamInto_cb78 $01
	.db $c7 $45 $fe $80
	npc_loadParamInto_cb78 $01
	.db $c7 $45 $fd $80
	.db $8d $03 $0a
	.db $c7 $00 $fd $80
	npc_loadParamInto_cb78 $01
	.db $c7 $00 $fe $80
	npc_loadParamInto_cb78 $01
	.db $c7 $00 $ff $80
	.db $8d $04 $08
	npc_jump @loop
@func_6178:
	.db $0f
	npc_jump @loop


// scrolling text rooms
npc2d_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $04
	.db $1f
	npc_set2_cbe4
	npc_res4_cb60
	npc_groupRoomXYjumpTable @table
	.db $18
	npc_end

@table:
	.db $1c $00 $00
	.dw @entry0

	.db $1c $01 $00
	.dw @entry1

	.db $1c $00 $01
	.dw @entry2

	.db $1c $02 $00
	.dw @entry3

	.db $1c $01 $01
	.dw @entry4

	.db $1c $02 $01
	.dw @entry5

	.db $1c $00 $02
	.dw @entry6

	.db $1c $01 $02
	.dw @entry7

	.db $1c $02 $02
	.dw @entry8

	.db $1c $00 $03
	.dw @entry9

	.db $1c $01 $03
	.dw @entryA

	.db $1c $02 $03
	.dw @entryB

	.db $1c $00 $05
	.dw @entryC

	.db $1c $00 $04
	.dw @entryD

	.db $1c $01 $04
	.dw @entryE

	.db $1c $02 $04
	.dw @entryF

	.db $1c $01 $05
	.dw @entry10

	.db $1c $00 $06
	.dw @entry11

	.db $1c $01 $06
	.dw @entry12

	.db $1c $02 $06
	.dw @entry13

	.db $1c $00 $07
	.dw @entry14

	.db $1c $01 $07
	.dw @entry15

	.db $1c $02 $07
	.dw @entry16

	.db $1c $00 $08
	.dw @entry17

	.db $ff $ff $ff

@entry0:
	npc_jumpIfItemGotten $00 _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_63ab
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $2e $78 $5c
	npc_jump @func_639d

@entry1:
	npc_jumpIfItemGotten $08 _showText_roomEmpty_clear_c059

@func_6219:
	npc_set_c059 $ff
	npc_startScrollingText text_03_6423
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $30 $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entry2:
	npc_jumpIfItemGotten $14 _showText_roomEmpty_clear_c059
	npc_jumpIfArmorOfGodGotten AOG_BELT _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_6497
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $34 $7a $64
	npc_jump @func_639d

@entry3:
	npc_set_c059 $ff
	npc_startScrollingText text_03_64fe
	npc_startScrollingText text_03_63aa
	npc_jumpIfItemGotten $01, +
	npc_startScrollingText text_03_6551
	npc_spawnNPC $2e $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump ++
+
	npc_startScrollingText text_03_6482
++
	npc_spawnNPC $3a $42 $64
	npc_spawnNPC $33 $38 $54
	npc_spawnNPC $3b $b2 $64
	npc_spawnNPC $33 $a8 $54
	npc_jump @func_639d

@entry4:
	npc_jumpIfItemGotten $21, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_6566
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $3d $50 $64
	npc_spawnNPC $3c $a0 $64
	npc_jump @func_639d

@entry5:
	npc_jumpIfItemGotten $09, _showText_roomEmpty_clear_c059
	npc_jump @func_6219

@entry6:
	npc_jumpIfArmorOfGodGotten $02, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_65c3
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $35 $7a $64
	npc_jump @func_639d

@entry7:
	npc_jumpIfItemGotten $0c, _showText_roomEmpty_clear_c059

@func_62a8:
	npc_set_c059 $ff
	npc_startScrollingText text_03_6621
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $31 $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entry8:
	npc_jumpIfItemGotten $05, _showText_roomEmpty_clear_c059
	
@func_62bf:
	npc_set_c059 $ff
	npc_startScrollingText text_03_666e
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $2f $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entry9:
	npc_jumpIfItemGotten $0d, _showText_roomEmpty_clear_c059
	npc_jump @func_62a8

@entryA:
	npc_jumpIfItemGotten $11, _showText_roomEmpty_clear_c059

@func_62dd:
	npc_set_c059 $ff
	npc_startScrollingText text_03_66d5
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $32 $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entryB:
	npc_jumpIfItemGotten $03, _showText_roomEmpty_clear_c059

@func_62f4:
	npc_set_c059 $ff
	npc_startScrollingText text_03_672f
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $2e $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entryC:
	npc_jumpIfArmorOfGodGotten $10, +
	npc_set_c059 $ff
	npc_startScrollingText text_03_6789
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $38 $78 $6c
	npc_jump @func_639d
+
	npc_startScrollingText text_03_6832
	npc_jump @func_639d

@entryD:
	npc_jumpIfItemGotten $0b, _showText_roomEmpty_clear_c059
	npc_jump @func_6219

@entryE:
	npc_jumpIfItemGotten $07, _showText_roomEmpty_clear_c059
	npc_jump @func_62bf

@entryF:
	npc_jumpIfItemGotten $10, _showText_roomEmpty_clear_c059
	npc_jump @func_62dd

@entry10:
	npc_jumpIfSpecialBitemGotten $02, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_67ca
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $40 $7a $64
	npc_spawnNPC $33 $70 $54
	npc_jump @func_639d

@entry11:
	npc_jumpIfItemGotten $13, _showText_roomEmpty_clear_c059
	npc_jump @func_62dd

@entry12:
	npc_jumpIfItemGotten $0f, _showText_roomEmpty_clear_c059
	npc_jump @func_62a8

@entry13:
	npc_set_c059 $ff
	npc_startScrollingText text_03_6849
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $57 $88 $90
	npc_takeArmorOfGod AOG_BELT
	npc_jump @func_639d

@entry14:
	npc_set_c059 $ff
	npc_startScrollingText text_03_68bb
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $56 $88 $90
	npc_takeArmorOfGod AOG_ARMOUR
	npc_jump @func_639d

@entry15:
	npc_jumpIfArmorOfGodGotten $08, _showText_roomEmpty_clear_c059
	npc_set_c059 $ff
	npc_startScrollingText text_03_6930
	npc_startScrollingText text_03_63aa
	npc_spawnNPC $37 $7a $64
	npc_jump @func_639d

@entry16:
	npc_jumpIfItemGotten $02, _showText_roomEmpty_clear_c059
	npc_jump @func_62f4

@entry17:
	npc_jumpIfItemGotten $0e, _showText_roomEmpty_clear_c059
	npc_jump @func_62a8

@func_639d:
--
	npc_set_c059 $00

_infLoop_639f:
-
	npc_loadParamInto_cb78 $02
	npc_jump -

_showText_roomEmpty_clear_c059:
	npc_startScrollingText text_roomEmpty
	npc_jump --


text_03_63aa:
	.db $7f


text_03_63ab:
	.db $04 $03
	.asc "You have found the"
	.db $01
	.asc "Pear!  It is your"
	.db $01
	.asc "first Fruit of the"
	.db $01
	.asc "Spirit. Use the A"
	.db $01
	.asc "button to throw it."
	.db $ff $7f


text_roomEmpty:
	.db $04 $03
	.asc "This room is empty."
	.db $ff $7f


text_03_6423:
	.db $04 $03
	.asc "Here is an apple to "
	.db $01
	.asc "add to your fruit"
	.db $01
	.asc "collection. It goes"
	.db $01
	.asc "slow but is very"
	.db $01
	.asc "powerful."
	.db $ff $0b $10 $7b
	.asc "40"
	.db $ff $7f


text_03_6482:
	.db $0b $09 $7b
	.asc "20           "
	.db $7b
	.asc "75"
	.db $ff $7f
	
	
text_03_6497:
	.db $04 $03
	.asc "This is the Belt of"
	.db $01
	.asc "Truth, one of the 6"
	.db $01
	.asc "pieces of the armor"
	.db $01
	.asc "of God. With it you"
	.db $01
	.asc "can move obstacles."
	.db $ff $7f
	
	
text_03_64fe:
	.db $04 $03
	.asc "For the strong in"
	.db $01
	.asc "spirit, I offer"
	.db $01
	.asc "these items. They"
	.db $01
	.asc "will aid you in"
	.db $01
	.asc "your quest."
	.db $ff $7f
	
	
text_03_6551:
	.db $0b $09 $7b
	.asc "20    "
	.db $7b
	.asc "25    "
	.db $7b
	.asc "75"
	.db $ff $7f
	
	
text_03_6566:
	.db $04 $03
	.asc "Way to go! You've"
	.db $01
	.asc "found a hidden"
	.db $01
	.asc "room. I present"
	.db $01
	.asc "you with 75 vials"
	.db $01
	.asc "and 150 spirit"
	.db $01
	.asc "points."
	.db $ff $7f
	
	
text_03_65c3:
	.db $04 $03
	.asc "I now present you"
	.db $01
	.asc "with a Breastplate"
	.db $01
	.asc "of Righteousness."
	.db $01
	.asc "Your damage will"
	.db $01
	.asc "be reduced by 1/2."
	.db $ff $7f


text_03_6621:
	.db $04 $03
	.asc "The mighty grapes"
	.db $01
	.asc "await you. This"
	.db $01
	.asc "fruit scatters"
	.db $01
	.asc "when you throw it."
	.db $ff $0b $10 $7b
	.asc "75"
	.db $ff $7f
	
	
text_03_666e:
	.db $04 $03
	.asc "The advantage of"
	.db $01
	.asc "using a pomegranate"
	.db $01
	.asc "is that it has a"
	.db $01
	.asc "wider range. It"
	.db $01
	.asc "travels a zig-zag"
	.db $01
	.asc "path."
	.db $ff $0b $10 $7b
	.asc "60"
	.db $ff $7f
	
	
text_03_66d5:
	.db $04 $03
	.asc "The fastest and"
	.db $01
	.asc "farthest flying"
	.db $01
	.asc "fruit is the"
	.db $01
	.asc "banana. It travels"
	.db $01
	.asc "a straight path."
	.db $ff $0b $10 $7b
	.asc "90"
	.db $ff $7f
	
	
text_03_672f:
	.db $04 $03
	.asc "Here is another"
	.db $01
	.asc "pear for your"
	.db $01
	.asc "collection. You can"
	.db $01
	.asc "find up to four of"
	.db $01
	.asc "each fruit."
	.db $ff $0b $10 $7b
	.asc "25"
	.db $ff $7f
	
	
text_03_6789:
	.db $06 $0b
	.asc "The Helmet of"
	.db $01
	.asc "Salvation"
	.db $01
	.asc "protects you"
	.db $01
	.asc "from harmful"
	.db $01
	.asc "explosions."
	.db $ff $7f


text_03_67ca:
	.db $04 $03
	.asc "Samson's Jawbone"
	.db $01
	.asc "allows you to"
	.db $01
	.asc "retrieve items."
	.db $01
	.asc "Select it from the"
	.db $01
	.asc "menu and use B to"
	.db $01
	.asc "throw it."
	.db $ff $0b $10 $7b
	.asc "195"
	.db $ff $7f
	
	
text_03_6832:
	.db $0c $08
	.asc "This cave is empty."
	.db $ff $7f


text_03_6849:
	.db $04 $03
	.asc "You have no place"
	.db $01
	.asc "in a bar. As"
	.db $01
	.asc "punishment, I"
	.db $01
	.asc "am taking back the"
	.db $01
	.asc "Belt of Truth. You"
	.db $01
	.asc "can reclaim it in"
	.db $01
	.asc "the slum."
	.db $ff $7f


text_03_68bb:
	.db $04 $03
	.asc "You have no place"
	.db $01
	.asc "in a casino. I am"
	.db $01
	.asc "taking back the"
	.db $01
	.asc "Breastplate of"
	.db $01
	.asc "Righteousness. You"
	.db $01
	.asc "can reclaim it in"
	.db $01
	.asc "the slum."
	.db $ff $7f


text_03_6930:
	.db $04 $03
	.asc "You have found the"
	.db $01
	.asc "Shield of Faith."
	.db $01
	.asc "The fiery darts"
	.db $01
	.asc "won't harm you now!"
	.db $ff $7f


func_03_697b:
	npc_set6_cb60_reset_cb6c
	.db $01
	.db $07
	npc_set2_cbe4
	npc_res4_cb60
	npc_loadParamInto_cb78 $08
	.db $82
	.dw +
+
	npc_ret


func_03_6986:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60
-
	.db $82
	.dw +
	.db $8a
	.dw +
	npc_loadParamInto_cb78 $01
	npc_jump -
+
	npc_ret


data_03_6994:
	npc_set6_cb60_reset_cb6c
	npc_res4_cb60

data_03_6996:
-
	.db $82
	.dw @done
	npc_loadParamInto_cb78 $01
	npc_jump -

@done:
	npc_ret

data_03_699f:
-
	npc_loadParamInto_cb78 $01
	.db $82
	.dw -
	npc_loadParamInto_cb78 $05
	.db $82
	.dw -
	npc_ret


func_03_69aa:
	npc_set_c059 $ff
	npc_giveNumBombs $01
	npc_callCommonSoundFuncs_6c01 $5f $17
	npc_loadParamInto_cb78 $02
	npc_ret


func_03_69b4:
	npc_set_c059 $ff
	npc_giveNumBirds $01
	npc_callCommonSoundFuncs_6c01 $5f $17
	npc_loadParamInto_cb78 $02
	npc_ret


data_03_69be:
	npc_increaseScore $04


data_03_69c0:
	npc_increaseScore $04
	npc_increaseScore $04


data_03_69c4:
	npc_increaseScore $04

data_03_69c6:
	npc_increaseScore $04


data_03_69c8:
	npc_increaseScore $04
	npc_increaseScore $04


data_03_69cc:
	npc_increaseScore $04
	npc_increaseScore $04
	npc_ret


;;
	ld   b, l                                        ; $69d1: $45
	ld   ($0845), sp                                 ; $69d2: $08 $45 $08


data_03_69d5:
	npc_increaseScore $08
	npc_increaseScore $08
	npc_increaseScore $08
	npc_increaseScore $08


data_03_69dd:
	npc_increaseScore $08
	npc_increaseScore $08
	npc_increaseScore $08
	npc_ret


npc66_scripts:
	npc_set_c059 $80
	npc_setCoords $08 $40
	npc_call @func_6a09
	npc_call @func_6a09
	npc_call @func_6a09
	npc_call @func_6a09
	npc_call @func_6a09
	npc_startScrollingText @text_6a37
	npc_callCommonSoundFuncs_6d6c $01 $ff
	npc_set_c059 $ff
	npc_loadParamInto_cb78 $5a
-
	npc_set_c059 $80
	npc_loadParamInto_cb78 $01
	npc_jump -

@func_6a09:
-
	npc_set_c059 $80
	.db $c7 $d8 $80 $80
	npc_addParamsToXthenYCoords $10 $00
	npc_loopAboveParamTimes $08, -
	npc_addParamsToXthenYCoords $c0 $00
	npc_addParamsToXthenYCoords $c0 $00
	npc_loadParamInto_cb78 $04
	npc_set_c059 $80
	.db $c7 $9c $80 $80
	npc_addParamsToXthenYCoords $10 $00
	npc_loopAboveParamTimes $08, $6a1e
	npc_addParamsToXthenYCoords $c0 $00
	npc_addParamsToXthenYCoords $c0 $00
	npc_loadParamInto_cb78 $04
	npc_addParamsToXthenYCoords $00 $10
	npc_ret

@text_6a37:
	.db $09 $03
	.asc "  Hallelujah! "
	.db $01
	.asc "   You have   "
	.db $01
	.asc " defeated the "
	.db $01
	.asc " foe and freed"
	.db $01
	.asc "the city from "
	.db $01
	.asc "his evil rule."
	.db $01
	.asc "God bless you "
	.db $01
	.asc "in all you do!"
	.db $ff $7f


;; // 6ab2
	.db $7b $3b $3f $02


npc67_scripts:
	npc_set_c059 $ff
	npc_set6_cb60_reset_cb6c
	.db $47 $03
	.db $08
	.db $41 $02
	npc_res4_cb60
-
	.db $40 $08
	npc_startScrollingText text_03_6afa
	npc_loopAboveParamTimes $1b, -
	npc_spawnNPC $68 $a0 $30

-
	.db $40 $08
	npc_startScrollingText text_03_6afa
	npc_loopAboveParamTimes $02, -
	.db $40 $08
	npc_loadParamInto_cb78 $04
	.db $07
	npc_spawnNPC $66 $00 $00
-
	npc_loadParamInto_cb78 $01
	npc_jump -


npc68_scripts:
	npc_set6_cb60_reset_cb6c
	.db $47 $03
	.db $08
	.db $41 $02
	npc_res4_cb60
	npc_startScrollingText text_03_6aff
	.db $40 $08
	npc_startScrollingText text_03_6b05
	.db $40 $08
	npc_startScrollingText text_03_6b0a
	npc_jump -


text_03_6afa:
	.db $80 $80
	.db $5d
	.db $ff $7f


text_03_6aff:
	.db $07 $14
	.asc "  "
	.db $ff $7f


text_03_6b05:
	.db $07 $13
	.asc " "
	.db $ff $7f


text_03_6b0a:
	.db $07 $12
	.asc " "
	.db $ff $7f
