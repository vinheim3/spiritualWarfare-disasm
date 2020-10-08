; Disassembly of "Spiritual Warfare (USA) (Unl).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; With some edits by vinheim3 to make it compilable using wla-gb
; https://github.com/mattcurrie/mgbdis
; https://github.com/vinheim3

.include "include/rominfo.s"
.include "include/constants.s"
.include "include/hardware.s"
.include "include/structs.s"
.include "include/wram.s"
.include "include/hram.s"
.include "include/macros.s"
.include "include/npcScriptMacros.s"
.include "include/soundMacros.s"


.bank $000 slot 0
.org $0

	.include "code/common.s"
	.include "garbage/common.s"
	.include "code/bank_000.s"
	.include "data/soundDataAddresses.s"
	.include "code/scripting.s"
	.include "data/roomGroupStructs.s"


.bank $001 slot 0
.org $0

	.incbin "code/common.bin"
	.include "code/roomFlags.s"
	.include "code/quizzes.s"
	.include "data/quizTexts.s"

	m_GfxDataCompressed spr_01_56a7
	m_GfxDataCompressed spr_01_5e51
	m_GfxDataCompressed spr_titleScreen


.bank $002 slot 0
.org $0

	.incbin "code/common.bin"
	.include "data/b2_roomStructsAndLayouts.s"
	.include "data/tileTypeConversionTable.s"
	.include "data/b2_oamData.s"
	.include "scripts/b2_scripts.s"

	m_GfxDataCompressed spr_02_6f53


.bank $003 slot 0
.org $0

	.incbin "code/common.bin"
	.include "data/entityStructs.s"
	.include "data/basicLayouts.s"
	.include "garbage/b3_garbage.s"
	.include "data/b3_roomStructsAndLayouts.s"
	.include "data/b3_oamData.s"
	.include "scripts/b3_scripts.s"

	m_GfxDataCompressed spr_03_6b0f


.bank $004 slot 0
.org $0

	.incbin "code/common.bin"
	.include "data/vramTileConversionTables.s"
	.include "code/inventoryDrawing.s"
	.include "data/soundData.s"
	.include "code/soundEngine.s"
	.include "data/b4_roomStructsAndLayouts.s"

	m_GfxDataCompressed spr_04_5201
	m_GfxDataCompressed spr_04_5fb1
	m_GfxDataCompressed spr_04_677c


.bank $005 slot 0
.org $0

	.incbin "code/common.bin"

	m_GfxDataCompressed spr_05_094b
	m_GfxDataCompressed spr_05_1753
	m_GfxDataCompressed spr_05_1f50
	m_GfxDataCompressed spr_05_2d63
	m_GfxDataCompressed spr_05_354a
	m_GfxDataCompressed spr_05_431e
	m_GfxDataCompressed spr_05_4ace
	m_GfxDataCompressed spr_05_58c8
	m_GfxDataCompressed spr_05_607b


.bank $006 slot 0
.org $0

	.incbin "code/common.bin"
	.include "data/randomNumbers.s"
	.include "data/b6_oamData.s"
	.include "scripts/b6_scripts.s"

	m_GfxDataCompressed spr_06_1bfd
	m_GfxDataCompressed spr_06_2a45
	m_GfxDataCompressed spr_06_3240
	m_GfxDataCompressed spr_06_39fe
	m_GfxDataCompressed spr_06_46ce
	m_GfxDataCompressed spr_06_4e3d
	m_GfxDataCompressed spr_06_55dc
	m_GfxDataCompressed spr_06_640d


.bank $007 slot 0
.org $0

	.incbin "code/common.bin"

	m_GfxDataCompressed spr_07_094b
	m_GfxDataCompressed spr_07_173a
	m_GfxDataCompressed spr_07_1ec3
	m_GfxDataCompressed spr_07_2bc2
	m_GfxDataCompressed spr_07_32fa
	m_GfxDataCompressed spr_07_415a
	m_GfxDataCompressed spr_07_4ea3
	m_GfxDataCompressed spr_07_5c10
