; =======================================================================================
; Code macros
; =======================================================================================

.macro ldbc
	ld bc, (\1<<8)|\2
.endm

; RSTs
.macro rst_jumpTable
	rst $00
.endm

.macro rst_safeJumpTable
	rst $18
.endm

; =======================================================================================
; Directive macros
; =======================================================================================

; =======================================================================================
; Data macros
; =======================================================================================

.macro Pointer3Byte
	.dw \1
	.db :\1
.endm

.macro 3BytePointer
	.db :\1
	.dw \1
.endm

.macro m_LayoutData
	\1: .incbin "layouts/\1.bin"
	\1End:
.endm

.macro m_GfxDataCompressed
	\1: .incbin "gfx/\1.cmp"
	\1End:
.endm

; Args 1-3: color components
.macro m_RGB16
	.if \1 > $1f
		.printt "m_RGB16: Color components must be between $00 and $1f\n"
		.fail
	.endif
	.if \2 > $1f
		.printt "m_RGB16: Color components must be between $00 and $1f\n"
		.fail
	.endif
	.if \3 > $1f
		.printt "m_RGB16: Color components must be between $00 and $1f\n"
		.fail
	.endif
	.dw \1 | (\2<<5) | (\3<<10)
.endm

.macro m_NPCData
	.db \1 \2
	.dw \3
	.db \4 \5 \6 \7
.endm