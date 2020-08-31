;*
;* Gameboy Hardware definitions
;*
;* Based on Jones' hardware.inc
;* And based on Carsten Sorensen's ideas.
;*
;* Rev 1.1 - 15-Jul-97 : Added define check
;* Rev 1.2 - 18-Jul-97 : Added revision check macro
;* Rev 1.3 - 19-Jul-97 : Modified for RGBASM V1.05
;* Rev 1.4 - 27-Jul-97 : Modified for new subroutine prefixes
;* Rev 1.5 - 15-Aug-97 : Added _HRAM, PAD, CART defines
;*                     :  and Nintendo Logo
;* Rev 1.6 - 30-Nov-97 : Added rDIV, rTIMA, rTMA, & rTAC
;* Rev 1.7 - 31-Jan-98 : Added _SCRN0, _SCRN1
;* Rev 1.8 - 15-Feb-98 : Added rSB, rSC
;* Rev 1.9 - 16-Feb-98 : Converted I/O registers to $FFXX format
;* Rev 2.0 -           : Added GBC registers
;* Rev 2.1 -           : Added MBC5 & cart RAM enable/disable defines
;* Rev 2.2 -           : Fixed NR42,NR43, & NR44 equates
;* Rev 2.3 -           : Fixed incorrect _HRAM equate
;* Rev 2.4 - 27-Apr-13 : Added some cart defines (AntonioND)
;* Rev 2.5 - 03-May-15 : Fixed format (AntonioND)
;* Rev 2.6 - 09-Apr-16 : Added GBC OAM and cart defines (AntonioND)
;* Rev 2.7 - 19-Jan-19 : Added rPCMXX (ISSOtm)

; If all of these are already defined, don't do it again.

    .ifndef HARDWARE_INC
.define HARDWARE_INC 1

.macro rev_Check_hardware_inc
;NOTE: REVISION NUMBER CHANGES MUST BE ADDED
;TO SECOND PARAMETER IN FOLLOWING LINE.
    .if  \1 > 2.7 ;PUT REVISION NUMBER HERE
        .printt    "Version \1 or later of 'hardware.inc' is required."
        .fail
    .endif
.endm

.define _HW           $FF00

.define _VRAM         $8000 ; $8000->$9FFF
.define _SCRN0        $9800 ; $9800->$9BFF
.define _SCRN1        $9C00 ; $9C00->$9FFF
.define _SRAM         $A000 ; $A000->$BFFF
.define _RAM          $C000 ; $C000->$DFFF
.define _OAMRAM       $FE00 ; $FE00->$FE9F
.define _AUD3WAVERAM  $FF30 ; $FF30->$FF3F
.define _HRAM         $FF80 ; $FF80->$FFFE

; *** MBC5 Equates ***

.define rRAMG         $0000 ; $0000->$1fff
.define rROMB0        $2000 ; $2000->$2fff
.define rROMB1        $3000 ; $3000->$3fff - If more than 256 ROM banks are present.
.define rRAMB         $4000 ; $4000->$5fff - Bit 3 enables rumble (if present)


; --
; -- OAM flags
; --
.define rOAMF_PRI         %10000000 ; Priority
.define rAMF_YFLIP       %01000000 ; Y flip
.define rAMF_XFLIP       %00100000 ; X flip
.define rAMF_PAL0        %00000000 ; Palette number; 0,1 (DMG)
.define rAMF_PAL1        %00010000 ; Palette number; 0,1 (DMG)
.define rAMF_BANK0       %00000000 ; Bank number; 0,1 (GBC)
.define rAMF_BANK1       %00001000 ; Bank number; 0,1 (GBC)
.define rOAMF_PALMASK     %00000111 ; Palette (GBC)
.define rOAMB_PRI         7 ; Priority
.define rAMB_YFLIP       6 ; Y flip
.define rAMB_XFLIP       5 ; X flip
.define rAMB_PAL1        4 ; Palette number; 0,1 (DMG)
.define rAMB_BANK1       3 ; Bank number; 0,1 (GBC)


;***************************************************************************
;*
;* Custom registers
;*
;***************************************************************************

; --
; -- P1 ($FF00)
; -- Register for reading joy pad info.    (R/W)
; --
.define rP1  $FF00
.define rP1F_5  %00100000 ; P15 out port
.define r1F_4  %00010000 ; P14 out port
.define r1F_3  %00001000 ; P13 in port
.define r1F_2  %00000100 ; P12 in port
.define r1F_1  %00000010 ; P11 in port
.define r1F_0  %00000001 ; P10 in port

; --
; -- SB ($FF01)
; -- Serial Transfer Data (R/W)
; --
.define rSB  $FF01

; --
; -- SC ($FF02)
; -- Serial I/O Control (R/W)
; --
.define rSC  $FF02

; --
; -- DIV ($FF04)
; -- Divider register (R/W)
; --
.define rDIV  $FF04


; --
; -- TIMA ($FF05)
; -- Timer counter (R/W)
; --
.define rTIMA  $FF05


; --
; -- TMA ($FF06)
; -- Timer modulo (R/W)
; --
.define rTMA  $FF06


; --
; -- TAC ($FF07)
; -- Timer control (R/W)
; --
.define rTAC  $FF07
.define rTACF_START   %00000100
.define rACF_STOP    %00000000
.define rACF_4KHZ    %00000000
.define rACF_16KHZ   %00000011
.define rACF_65KHZ   %00000010
.define rACF_262KHZ  %00000001

; --
; -- IF ($FF0F)
; -- Interrupt Flag (R/W)
; --
.define rIF  $FF0F

; --
; -- LCDC ($FF40)
; -- LCD Control (R/W)
; --
.define rLCDC  $FF40
.define rLCDCF_OFF      %00000000 ; LCD Control Operation
.define rCDCF_ON       %10000000 ; LCD Control Operation
.define rCDCF_WIN9800  %00000000 ; Window Tile Map Display Select
.define rCDCF_WIN9C00  %01000000 ; Window Tile Map Display Select
.define rCDCF_WINOFF   %00000000 ; Window Display
.define rCDCF_WINON    %00100000 ; Window Display
.define rCDCF_BG8800   %00000000 ; BG & Window Tile Data Select
.define rCDCF_BG8000   %00010000 ; BG & Window Tile Data Select
.define rCDCF_BG9800   %00000000 ; BG Tile Map Display Select
.define rCDCF_BG9C00   %00001000 ; BG Tile Map Display Select
.define rCDCF_OBJ8     %00000000 ; OBJ Construction
.define rCDCF_OBJ16    %00000100 ; OBJ Construction
.define rCDCF_OBJOFF   %00000000 ; OBJ Display
.define rCDCF_OBJON    %00000010 ; OBJ Display
.define rCDCF_BGOFF    %00000000 ; BG Display
.define rCDCF_BGON     %00000001 ; BG Display
; "Window Character Data Select" follows BG


; --
; -- STAT ($FF41)
; -- LCDC Status   (R/W)
; --
.define rSTAT  $FF41
.define rSTATF_LYC       %01000000 ; LYCEQULY Coincidence (Selectable)
.define rTATF_MODE10    %00100000 ; Mode 10
.define rTATF_MODE01    %00010000 ; Mode 01 (V-Blank)
.define rTATF_MODE00    %00001000 ; Mode 00 (H-Blank)
.define rTATF_LYCF      %00000100 ; Coincidence Flag
.define rTATF_HB        %00000000 ; H-Blank
.define rTATF_VB        %00000001 ; V-Blank
.define rTATF_OAM       %00000010 ; OAM-RAM is used by system
.define rTATF_LCD       %00000011 ; Both OAM and VRAM used by system
.define rTATF_BUSY      %00000010 ; When set, VRAM access is unsafe


; --
; -- SCY ($FF42)
; -- Scroll Y (R/W)
; --
.define rSCY  $FF42


; --
; -- SCY ($FF43)
; -- Scroll X (R/W)
; --
.define rSCX  $FF43


; --
; -- LY ($FF44)
; -- LCDC Y-Coordinate (R)
; --
; -- Values range from 0->153. 144->153 is the VBlank period.
; --
.define rLY  $FF44


; --
; -- LYC ($FF45)
; -- LY Compare (R/W)
; --
; -- When LYEQUEQULYC, STATF_LYCF will be set in STAT
; --
.define rLYC  $FF45


; --
; -- DMA ($FF46)
; -- DMA Transfer and Start Address (W)
; --
.define rDMA  $FF46


; --
; -- BGP ($FF47)
; -- BG Palette Data (W)
; --
; -- Bit 7-6 - Intensity for %11
; -- Bit 5-4 - Intensity for %10
; -- Bit 3-2 - Intensity for %01
; -- Bit 1-0 - Intensity for %00
; --
.define rBGP  $FF47


; --
; -- OBP0 ($FF48)
; -- Object Palette 0 Data (W)
; --
; -- See BGP for info
; --
.define rOBP0  $FF48


; --
; -- OBP1 ($FF49)
; -- Object Palette 1 Data (W)
; --
; -- See BGP for info
; --
.define rOBP1  $FF49


; --
; -- WY ($FF4A)
; -- Window Y Position (R/W)
; --
; -- 0 < WY < 143
; --
.define rWY  $FF4A


; --
; -- WX ($FF4B)
; -- Window X Position (R/W)
; --
; -- 7 < WX < 166
; --
.define rWX  $FF4B


; --
; -- KEY 1 ($FF4D)
; -- Select CPU Speed (R/W)
; --
.define rKEY1  $FF4D


; --
; -- VBK ($FF4F)
; -- Select Video RAM Bank (R/W)
; --
.define rVBK  $FF4F


; --
; -- HDMA1 ($FF51)
; -- Horizontal Blanking, General Purpose DMA (W)
; --
.define rHDMA1  $FF51


; --
; -- HDMA2 ($FF52)
; -- Horizontal Blanking, General Purpose DMA (W)
; --
.define rHDMA2  $FF52


; --
; -- HDMA3 ($FF53)
; -- Horizontal Blanking, General Purpose DMA (W)
; --
.define rHDMA3  $FF53


; --
; -- HDMA4 ($FF54)
; -- Horizontal Blanking, General Purpose DMA (W)
; --
.define rHDMA4  $FF54


; --
; -- HDMA5 ($FF55)
; -- Horizontal Blanking, General Purpose DMA (R/W)
; --
.define rHDMA5  $FF55


; --
; -- RP ($FF56)
; -- Infrared Communications Port (R/W)
; --
.define rRP  $FF56


; --
; -- BCPS ($FF68)
; -- Background Color Palette Specification (R/W)
; --
.define rBCPS  $FF68


; --
; -- BCPD ($FF69)
; -- Background Color Palette Data (R/W)
; --
.define rBCPD  $FF69


; --
; -- BCPS ($FF6A)
; -- Object Color Palette Specification (R/W)
; --
.define rOCPS  $FF6A


; --
; -- BCPD ($FF6B)
; -- Object Color Palette Data (R/W)
; --
.define rOCPD  $FF6B


; --
; -- SVBK ($FF4F)
; -- Select Main RAM Bank (R/W)
; --
.define rSVBK  $FF70


; --
; -- IE ($FFFF)
; -- Interrupt Enable (R/W)
; --
.define rIE  $FFFF


.define IEF_HILO    %00010000 ; Transition from High to Low of Pin number P10-P13
.define IEF_SERIAL  %00001000 ; Serial I/O transfer end
.define IEF_TIMER   %00000100 ; Timer Overflow
.define IEF_LCDC    %00000010 ; LCDC (see STAT)
.define IEF_VBLANK  %00000001 ; V-Blank




;***************************************************************************
;*
;* Sound control registers
;*
;***************************************************************************

; --
; -- AUDVOL/NR50 ($FF24)
; -- Channel control / ON-OFF / Volume (R/W)
; --
; -- Bit 7   - Vin->SO2 ON/OFF (Vin??)
; -- Bit 6-4 - SO2 output level (volume) (# 0-7)
; -- Bit 3   - Vin->SO1 ON/OFF (Vin??)
; -- Bit 2-0 - SO1 output level (volume) (# 0-7)
; --
.define rNR50  $FF24
.define rAUDVOL  rNR50


; --
; -- AUDTERM/NR51 ($FF25)
; -- Selection of Sound output terminal (R/W)
; --
; -- Bit 7   - Output sound 4 to SO2 terminal
; -- Bit 6   - Output sound 3 to SO2 terminal
; -- Bit 5   - Output sound 2 to SO2 terminal
; -- Bit 4   - Output sound 1 to SO2 terminal
; -- Bit 3   - Output sound 4 to SO1 terminal
; -- Bit 2   - Output sound 3 to SO1 terminal
; -- Bit 1   - Output sound 2 to SO1 terminal
; -- Bit 0   - Output sound 0 to SO1 terminal
; --
.define rNR51  $FF25
.define rAUDTERM  rNR51


; --
; -- AUDENA/NR52 ($FF26)
; -- Sound on/off (R/W)
; --
; -- Bit 7   - All sound on/off (sets all audio regs to 0!)
; -- Bit 3   - Sound 4 ON flag (doesn't work!)
; -- Bit 2   - Sound 3 ON flag (doesn't work!)
; -- Bit 1   - Sound 2 ON flag (doesn't work!)
; -- Bit 0   - Sound 1 ON flag (doesn't work!)
; --
.define rNR52  $FF26
.define rAUDENA  rNR52


;***************************************************************************
;*
;* SoundChannel #1 registers
;*
;***************************************************************************

; --
; -- AUD1SWEEP/NR10 ($FF10)
; -- Sweep register (R/W)
; --
; -- Bit 6-4 - Sweep Time
; -- Bit 3   - Sweep Increase/Decrease
; --           0: Addition    (frequency increases???)
; --           1: Subtraction (frequency increases???)
; -- Bit 2-0 - Number of sweep shift (# 0-7)
; -- Sweep Time: (n*7.8ms)
; --
.define rNR10  $FF10
.define rAUD1SWEEP  rNR10


; --
; -- AUD1LEN/NR11 ($FF11)
; -- Sound length/Wave pattern duty (R/W)
; --
; -- Bit 7-6 - Wave Pattern Duty (00:12.5% 01:25% 10:50% 11:75%)
; -- Bit 5-0 - Sound length data (# 0-63)
; --
.define rNR11  $FF11
.define rAUD1LEN  rNR11


; --
; -- AUD1ENV/NR12 ($FF12)
; -- Envelope (R/W)
; --
; -- Bit 7-4 - Initial value of envelope
; -- Bit 3   - Envelope UP/DOWN
; --           0: Decrease
; --           1: Range of increase
; -- Bit 2-0 - Number of envelope sweep (# 0-7)
; --
.define rNR12  $FF12
.define rAUD1ENV  rNR12


; --
; -- AUD1LOW/NR13 ($FF13)
; -- Frequency lo (W)
; --
.define rNR13  $FF13
.define rAUD1LOW  rNR13


; --
; -- AUD1HIGH/NR14 ($FF14)
; -- Frequency hi (W)
; --
; -- Bit 7   - Initial (when set, sound restarts)
; -- Bit 6   - Counter/consecutive selection
; -- Bit 2-0 - Frequency's higher 3 bits
; --
.define rNR14  $FF14
.define rAUD1HIGH  rNR14


;***************************************************************************
;*
;* SoundChannel #2 registers
;*
;***************************************************************************

; --
; -- AUD2LEN/NR21 ($FF16)
; -- Sound Length; Wave Pattern Duty (R/W)
; --
; -- see AUD1LEN for info
; --
.define rNR21  $FF16
.define rAUD2LEN  rNR21


; --
; -- AUD2ENV/NR22 ($FF17)
; -- Envelope (R/W)
; --
; -- see AUD1ENV for info
; --
.define rNR22  $FF17
.define rAUD2ENV  rNR22


; --
; -- AUD2LOW/NR23 ($FF18)
; -- Frequency lo (W)
; --
.define rNR23  $FF18
.define rAUD2LOW  rNR23


; --
; -- AUD2HIGH/NR24 ($FF19)
; -- Frequency hi (W)
; --
; -- see AUD1HIGH for info
; --
.define rNR24  $FF19
.define rAUD2HIGH  rNR24


;***************************************************************************
;*
;* SoundChannel #3 registers
;*
;***************************************************************************

; --
; -- AUD3ENA/NR30 ($FF1A)
; -- Sound on/off (R/W)
; --
; -- Bit 7   - Sound ON/OFF (1EQUON,0EQUOFF)
; --
.define rNR30  $FF1A
.define rAUD3ENA  rNR30


; --
; -- AUD3LEN/NR31 ($FF1B)
; -- Sound length (R/W)
; --
; -- Bit 7-0 - Sound length
; --
.define rNR31  $FF1B
.define rAUD3LEN  rNR31


; --
; -- AUD3LEVEL/NR32 ($FF1C)
; -- Select output level
; --
; -- Bit 6-5 - Select output level
; --           00: 0/1 (mute)
; --           01: 1/1
; --           10: 1/2
; --           11: 1/4
; --
.define rNR32  $FF1C
.define rAUD3LEVEL  rNR32


; --
; -- AUD3LOW/NR33 ($FF1D)
; -- Frequency lo (W)
; --
; -- see AUD1LOW for info
; --
.define rNR33  $FF1D
.define rAUD3LOW  rNR33


; --
; -- AUD3HIGH/NR34 ($FF1E)
; -- Frequency hi (W)
; --
; -- see AUD1HIGH for info
; --
.define rNR34  $FF1E
.define rAUD3HIGH  rNR34


; --
; -- AUD4LEN/NR41 ($FF20)
; -- Sound length (R/W)
; --
; -- Bit 5-0 - Sound length data (# 0-63)
; --
.define rNR41  $FF20
.define rAUD4LEN  rNR41


; --
; -- AUD4ENV/NR42 ($FF21)
; -- Envelope (R/W)
; --
; -- see AUD1ENV for info
; --
.define rNR42  $FF21
.define rAUD4ENV  rNR42


; --
; -- AUD4POLY/NR43 ($FF22)
; -- Polynomial counter (R/W)
; --
; -- Bit 7-4 - Selection of the shift clock frequency of the (scf)
; --           polynomial counter (0000-1101)
; --           freqEQUdrf*1/2^scf (not sure)
; -- Bit 3 -   Selection of the polynomial counter's step
; --           0: 15 steps
; --           1: 7 steps
; -- Bit 2-0 - Selection of the dividing ratio of frequencies (drf)
; --           000: f/4   001: f/8   010: f/16  011: f/24
; --           100: f/32  101: f/40  110: f/48  111: f/56  (fEQU4.194304 Mhz)
; --
.define rNR43  $FF22
.define rAUD4POLY  rNR43


; --
; -- AUD4GO/NR44 ($FF23)
; -- (has wrong name and value (ff30) in Dr.Pan's doc!)
; --
; -- Bit 7 -   Inital
; -- Bit 6 -   Counter/consecutive selection
; --
.define rNR44  $FF23
.define rAUD4GO  rNR44 ; silly name!


; --
; -- PCM12 ($FF76)
; -- Sound channel 1&2 PCM amplitude (R)
; --
; -- Bit 7-4 - Copy of sound channel 2's PCM amplitude
; -- Bit 3-0 - Copy of sound channel 1's PCM amplitude
; --
.define rPCM12  $FF76


; --
; -- PCM34 ($FF77)
; -- Sound channel 3&4 PCM amplitude (R)
; --
; -- Bit 7-4 - Copy of sound channel 4's PCM amplitude
; -- Bit 3-0 - Copy of sound channel 3's PCM amplitude
; --
.define rPCM34  $FF77

;***************************************************************************
;*
;* Cart related
;*
;***************************************************************************

.define CART_COMPATIBLE_DMG      $00
.define CART_COMPATIBLE_DMG_GBC  $80
.define CART_COMPATIBLE_GBC      $C0

.define CART_ROM                      $00
.define CART_ROM_MBC1                 $01
.define CART_ROM_MBC1_RAM             $02
.define CART_ROM_MBC1_RAM_BAT         $03
.define CART_ROM_MBC2                 $05
.define CART_ROM_MBC2_BAT             $06
.define CART_ROM_RAM                  $08
.define CART_ROM_RAM_BAT              $09
.define CART_ROM_MBC3_BAT_RTC         $0F
.define CART_ROM_MBC3_RAM_BAT_RTC     $10
.define CART_ROM_MBC3                 $11
.define CART_ROM_MBC3_RAM             $12
.define CART_ROM_MBC3_RAM_BAT         $13
.define CART_ROM_MBC5                 $19
.define CART_ROM_MBC5_BAT             $1A
.define CART_ROM_MBC5_RAM_BAT         $1B
.define CART_ROM_MBC5_RUMBLE          $1C
.define CART_ROM_MBC5_RAM_RUMBLE      $1D
.define CART_ROM_MBC5_RAM_BAT_RUMBLE  $1E
.define CART_ROM_MBC7_RAM_BAT_GYRO    $22
.define CART_ROM_POCKET_CAMERA        $FC

.define CART_ROM_256K  0 ; 2 banks
.define CART_ROM_512K  1 ; 4 banks
.define CART_ROM_1M    2 ; 8 banks
.define CART_ROM_2M    3 ; 16 banks
.define CART_ROM_4M    4 ; 32 banks
.define CART_ROM_8M    5 ; 64 banks
.define CART_ROM_16M   6 ; 128 banks
.define CART_ROM_32M   7 ; 256 banks
.define CART_ROM_64M   8 ; 512 banks

.define CART_RAM_NONE  0
.define CART_RAM_16K   1 ; 1 incomplete bank
.define CART_RAM_64K   2 ; 1 bank
.define CART_RAM_256K  3 ; 4 banks
.define CART_RAM_1M    4 ; 16 banks

.define CART_RAM_ENABLE   $0A
.define CART_RAM_DISABLE  $00

;***************************************************************************
;*
;* Keypad related
;*
;***************************************************************************

.define PADF_DOWN    $80
.define PADF_UP      $40
.define PADF_LEFT    $20
.define PADF_RIGHT   $10
.define PADF_START   $08
.define PADF_SELECT  $04
.define PADF_B       $02
.define PADF_A       $01

.define PADB_DOWN    $7
.define PADB_UP      $6
.define PADB_LEFT    $5
.define PADB_RIGHT   $4
.define PADB_START   $3
.define PADB_SELECT  $2
.define PADB_B       $1
.define PADB_A       $0

;***************************************************************************
;*
;* Screen related
;*
;***************************************************************************

.define SCRN_X     160 ; Width of screen in pixels
.define SCRN_Y     144 ; Height of screen in pixels
.define SCRN_X_B   20  ; Width of screen in bytes
.define SCRN_Y_B   18  ; Height of screen in bytes

.define SCRN_VX    256 ; Virtual width of screen in pixels
.define SCRN_VY    256 ; Virtual height of screen in pixels
.define SCRN_VX_B  32  ; Virtual width of screen in bytes
.define SCRN_VY_B  32  ; Virtual height of screen in bytes

;*
;* Nintendo scrolling logo
;* (Code won't work on a real GameBoy)
;* (if next lines are altered.)
.macro NINTENDO_LOGO
    DB  $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D
    DB  $00,$08,$11,$1F,$88,$89,$00,$0E,$DC,$CC,$6E,$E6,$DD,$DD,$D9,$99
    DB  $BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E
.endm

    .endif