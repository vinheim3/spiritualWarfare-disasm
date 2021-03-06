; =======================================================================================
; Code macros
; =======================================================================================

.macro ldbc
	ld bc, (\1<<8)|\2
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

.macro m_NPCData
	.dw \1 \2
	.db \3 \4 \5 \6
.endm