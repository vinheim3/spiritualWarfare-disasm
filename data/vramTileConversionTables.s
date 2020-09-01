// a $b0-sized table of 2x2 values ($c3b0) is pumped through here
// and tiles converted if they do not read $ff in the table
vramTileConversionTables:
	.db $ff $30 $00 $ff $ff $ff $1c $ff $1c $ff $ff $ff $ff $ff $ff $ff
	.db $ff $94 $a0 $a4 $ff $ff $ff $00 $ff $a8 $ff $ff $34 $ff $04 $bd
	.db $04 $08 $04 $20 $18 $74 $ff $ff $9c $9c $64 $ff $ff $5c $48 $ff
	.db $44 $ff $ff $4c $00 $ff $ff $ff $ff $ff $ff $ff $ff $70 $7b $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $ff $40 $4c $ff $4d $58 $ff $59 $ff $ff $64 $70 $ff $71 $7c $ff
	.db $ff $44 $68 $68 $84 $8c $8c $c0 $c0 $cc $38 $2c $78 $48 $48 $48
	.db $14 $20 $50 $5c $b4 $b8 $24 $d0 $88 $90 $54 $6c $30 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $1c $ff $ff $ff $ff $ff $54 $ff $ff $ff
	.db $ff $d4 $ff $dc $ff $ff $ff $54 $58 $ff $ff $ff $ff $ff $ff $bd
	.db $ff $ff $ff $ff $44 $ff $ff $ff $ff $ff $ff $ff $ff $5c $60 $ff
	.db $ff $d0 $ff $ff $30 $d0 $18 $94 $ff $ff $ff $ff $ff $4c $c4 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $ff $ff $29 $ff $ff $35 $ff
	.db $ff $40 $4c $ff $4d $58 $ff $59 $ff $ff $64 $ff $ff $70 $ff $ff
	.db $7c $48 $d8 $d8 $3c $3c $74 $54 $54 $2c $ff $ff $ff $50 $50 $50
	.db $14 $20 $ff $ff $b4 $b8 $68 $d0 $44 $90 $38 $38 $5c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $1c
	.db $ff $ff $88 $ff $8d $cc $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $ff $48 $ff $99 $ff $ff $ff $ff $ff $ff $ff $ff $3c $a8 $ff
	.db $ff $d4 $ff $c4 $ff $ff $ff $ff $ff $ff $ff $ff $ff $54 $50 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $ff $40 $4c $ff $4d $58 $ff $59 $ff $68 $ff $74 $75 $74 $ff $78
	.db $79 $44 $44 $44 $54 $54 $55 $5c $5c $5d $6c $6c $70 $50 $50 $50
	.db $14 $20 $30 $64 $b4 $b8 $48 $7c $38 $90 $2c $2c $24 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $48 $ff $ff $ff $ff $ff $ff $ff
	.db $ff $40 $ff $cc $ff $ff $9c $a0 $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $40 $ff $ff $4c $ff $58 $ff $5c $48 $c0 $c0 $ff $84 $a4 $ff
	.db $ff $ff $ff $00 $d0 $ff $ff $ff $ff $ff $ff $ff $ff $44 $20 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $29 $ff $28 $35 $ff $34 $ff
	.db $44 $ff $4d $ff $4c $59 $ff $58 $ff $68 $ff $71 $ff $70 $7d $ff
	.db $7c $48 $40 $40 $98 $a8 $ac $d0 $5c $5c $64 $9c $54 $50 $50 $50
	.db $14 $20 $74 $78 $ff $ff $30 $38 $6c $90 $24 $24 $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $e4 $ff $ff $ff $ff $ff $ff $ff $ff $64 $ff $ff $ff $bd
	.db $ff $ff $ff $48 $c4 $ff $ff $ff $ff $ff $ff $ff $ff $8c $e0 $ff
	.db $ff $d0 $ff $ff $cc $d0 $ff $d8 $dc $ff $ff $ff $ff $d4 $6c $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $44 $ff $4c $ff $ff $58 $ff $ff $ff $68 $ff $70 $ff $71 $7c $ff
	.db $7d $40 $64 $64 $ff $ff $ff $ff $ff $ff $ff $ff $ff $24 $24 $24
	.db $14 $20 $ff $ff $ff $ff $30 $6c $38 $90 $74 $78 $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $34 $34
	.db $ff $84 $88 $8c $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $44 $48 $4c $c4 $ff $ff $ff $ff $ff $34 $ff $ff $78 $ff $ff
	.db $ff $a8 $ff $ff $ff $a8 $ff $ff $ff $ff $ff $ff $ff $d4 $e8 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $ff $40 $4c $ff $4d $58 $ff $59 $ff $68 $ff $70 $ff $71 $7c $ff
	.db $7d $44 $48 $48 $5d $54 $5c $64 $74 $78 $ff $ff $6c $24 $24 $24
	.db $14 $20 $ff $ff $ff $ff $38 $a8 $50 $ff $30 $30 $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $c4 $ff $ff $ff $ff $ff $ff $ff
	.db $ff $80 $88 $8c $ff $ff $d4 $ff $ff $74 $ff $74 $ff $ff $ff $bd
	.db $44 $ff $48 $4c $d0 $ff $ff $ff $ff $ff $ff $ff $ff $d0 $8c $ff
	.db $ff $cc $ff $64 $7c $cc $ff $ff $ff $ff $ff $ff $ff $58 $20 $6c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $ff $24 $24 $ff $30 $30 $ff
	.db $3c $3c $4c $ff $4d $58 $ff $59 $ff $ff $64 $70 $ff $71 $7c $ff
	.db $7d $40 $44 $44 $6c $6c $6d $50 $50 $5c $48 $68 $68 $28 $28 $28
	.db $14 $14 $54 $ff $ff $ff $78 $74 $38 $ff $2c $20 $34 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $1c $ff $1c $ff $ff $00 $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $2c $ff $ff $84 $ff $ff $ff $ff $ff $ff $ff $ff $60 $d4 $ff
	.db $ff $ff $ff $ff $ff $c4 $ff $ff $ff $ff $ff $ff $ff $18 $20 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $44 $ff $ff $ff $ff $58 $ff $ff $ff $68 $ff $70 $ff $70 $7c $ff
	.db $7c $6c $74 $74 $ff $ff $ff $ff $ff $ff $ff $ff $ff $24 $24 $24
	.db $14 $20 $ff $ff $ff $ff $40 $64 $38 $90 $30 $78 $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $2c $ff $2c $ff $ff $ff
	.db $ff $ff $8c $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $ff $ff $48 $28 $ff $ff $ff $ff $ff $ff $ff $ff $30 $14 $ff
	.db $ff $d4 $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $c4 $10 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $44 $ff $ff $48 $48 $ff $54 $54 $ff $60 $60 $70 $ff $ff $7c $ff
	.db $78 $40 $4c $50 $ff $ff $ff $ff $ff $ff $ff $ff $ff $24 $24 $24
	.db $14 $20 $ff $ff $ff $ff $6c $68 $38 $ff $2c $64 $30 $ff $ff $ff

	.db $ff $ff $ff $ff $e8 $ff $ff $ff $ff $ff $ff $ff $ff $48 $ff $ff
	.db $ff $c4 $98 $d4 $ff $ff $ff $ff $ff $ff $ff $68 $ff $ff $04 $bd
	.db $ff $ff $ff $ff $78 $ff $48 $ff $ff $ff $ff $ff $ff $6c $34 $ff
	.db $ff $cc $ff $10 $ff $cc $ff $ff $ff $ff $ff $ff $ff $44 $4c $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $ff $24 $24 $ff $30 $30 $ff
	.db $3c $3c $ff $48 $48 $ff $54 $54 $ff $60 $60 $70 $ff $71 $7c $ff
	.db $7d $44 $4c $4c $50 $58 $51 $6c $5c $64 $64 $68 $78 $28 $28 $28
	.db $14 $20 $69 $6d $ff $ff $40 $74 $38 $ff $2c $2c $34 $ff $ff $ff

	.db $ff $b0 $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $6c $6c $ff $ff
	.db $ff $a0 $a4 $80 $ff $ff $ff $ff $ff $ff $ff $ff $6c $ff $ff $bd
	.db $04 $ff $ff $ff $dc $ff $ff $ff $9c $9c $ff $34 $30 $c4 $d4 $ff
	.db $ff $d0 $ff $ff $50 $d0 $48 $70 $ff $ff $4c $ff $ff $44 $ac $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $ff $40 $4c $ff $ff $58 $ff $ff $ff $ff $64 $70 $ff $71 $7c $ff
	.db $70 $74 $74 $78 $2c $2c $38 $30 $30 $68 $e9 $e8 $e8 $6c $6c $6c
	.db $14 $20 $ff $d8 $ff $ff $24 $d0 $48 $90 $54 $54 $44 $ff $ff $ff

	.db $ff $ff $00 $ff $9c $ff $ff $9c $ff $ff $ff $ff $c4 $ff $ff $ff
	.db $ff $84 $88 $8c $94 $24 $ff $ff $ff $24 $ff $ff $ff $ff $ff $bd
	.db $ff $44 $48 $4c $08 $50 $ff $10 $ff $ff $ff $ff $ff $30 $1c $ff
	.db $ff $d4 $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $54 $64 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $28 $28 $29 $ff
	.db $44 $ff $4c $ff $4d $4c $4c $4d $ff $68 $ff $ff $74 $ff $7c $ff
	.db $7d $74 $70 $70 $54 $54 $55 $50 $48 $40 $58 $58 $78 $30 $30 $30
	.db $14 $20 $64 $24 $ff $ff $38 $d4 $34 $ff $5c $5c $2c $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $1c $ff $1c $ff $ff $ff $ff $ff $ff $ff
	.db $a0 $ff $84 $ff $ff $ff $ff $ff $ff $ff $ff $ff $c4 $ff $ff $bd
	.db $ff $48 $ff $40 $8c $ff $ff $ff $ff $ff $ff $ff $ff $70 $d4 $ff
	.db $ff $24 $ff $ff $ff $24 $ff $ff $ff $ff $ff $ff $ff $18 $20 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $40
	.db $ff $ff $4c $ff $4d $58 $ff $59 $64 $ff $ff $70 $ff $ff $7c $ff
	.db $7d $48 $48 $50 $54 $54 $55 $5c $5c $5d $60 $6c $6c $2c $2c $2c
	.db $14 $20 $ff $ff $ff $ff $3c $24 $78 $ff $30 $30 $38 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $ff $ff $ff $ff $6c $ff $84 $ff $ff $ff $ff $ff $ff $e8 $98 $ff
	.db $2c $c0 $ff $ff $ff $c0 $ff $ff $ff $ff $60 $ff $ff $c4 $d4 $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $28 $ff $29 $34 $ff $35 $ff
	.db $44 $ff $4c $ff $4d $58 $ff $59 $ff $68 $ff $70 $ff $71 $7c $ff
	.db $7d $48 $50 $50 $54 $54 $40 $5c $5c $5d $64 $64 $65 $24 $24 $24
	.db $14 $20 $6c $74 $ff $ff $78 $c0 $70 $ff $30 $30 $38 $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff

	.db $ff $ff $ff $ff $ff $ff $ff $b0 $ff $ff $ff $ff $ff $ff $ff $ff
	.db $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $bd
	.db $00 $ff $ff $ff $94 $04 $ff $ff $ff $ff $ff $ff $1c $ff $ff $ff
	.db $ff $ff $ff $ff $ff $c4 $ff $c4 $ff $ff $ff $ff $ff $ff $ff $7c

	.db $ff $ff $ff $ff $ff $11 $ff $ff $1d $ff $ff $ff $ff $ff $3c $ff
	.db $78 $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff
	.db $54 $58 $5c $60 $64 $68 $14 $ff $ff $6c $3c $3c $70 $20 $20 $20
	.db $80 $6c $d4 $dc $ff $ff $40 $ff $e0 $90 $38 $38 $74 $ff $ff $ff
