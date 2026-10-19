; Hardware registers and constants

KEY_A = $01
KEY_B = $02
KEY_SELECT = $04
KEY_START = $08
KEY_UP = $10
KEY_DOWN = $20
KEY_LEFT = $40
KEY_RIGHT = $80

PPUCTRL                = $2000
PPUMASK                = $2001
PPUSTATUS              = $2002
OAMADDR                = $2003
OAMDATA                = $2004
PPUSCROLL              = $2005
PPUADDR                = $2006
PPUDATA                = $2007
SQ1_VOL                = $4000
SQ1_SWEEP              = $4001
SQ1_LO                 = $4002
SQ1_HI                 = $4003
SQ2_VOL                = $4004
SQ2_SWEEP              = $4005
SQ2_LO                 = $4006
SQ2_HI                 = $4007
TRI_LINEAR             = $4008
TRI_LO                 = $400A
TRI_HI                 = $400B
NOISE_VOL              = $400C
NOISE_LO               = $400E
NOISE_HI               = $400F
DMC_FREQ               = $4010
DMC_RAW                = $4011
DMC_START              = $4012
DMC_LEN                = $4013
OAMDMA                 = $4014
SNDCHN                 = $4015
JOY1                   = $4016
JOY2                   = $4017

; MMC3 registers (write-only, mapped over PRG ROM space)
MMC3_BANK_SELECT       = $8000
MMC3_BANK_DATA         = $8001
MMC3_MIRRORING         = $A000
MMC3_PRG_RAM           = $A001
MMC3_IRQ_LATCH         = $C000
MMC3_IRQ_RELOAD        = $C001
MMC3_IRQ_DISABLE       = $E000
MMC3_IRQ_ENABLE        = $E001

; names for raw $8000-$BFFF operands (bank depends on the stage / animation set)
animPtrLo              = $8000
animPtrHi              = $8080
frameListLo            = $8100
frameListHi            = $8200
stageField60_s0        = $AE60
stageField68_s0        = $AE68
stagePalIdx_s0         = $AE70
stagePalIdx1_s0        = $AE71
stageChr0_s0           = $AE78
stageChr1_s0           = $AE79
stagePalettes_s0       = $AE7C
stageField60_s1        = $AE90
stageField68_s1        = $AE98
stagePalIdx_s1         = $AEA0
stagePalIdx1_s1        = $AEA1
stageChr0_s1           = $AEA8
stageChr1_s1           = $AEA9
stagePalettes_s1       = $AEAC
stageField60_s2        = $AEC0
stageField68_s2        = $AEC8
stagePalIdx_s2         = $AED0
stagePalIdx1_s2        = $AED1
stageChr0_s2           = $AED8
stageChr1_s2           = $AED9
stagePalettes_s2       = $AEDC
spriteOffsetLo         = $B100
spriteOffsetHi         = $B200
stageTableBB00         = $BB00
stageTableBC00         = $BC00
stageTableBD00         = $BD00
stageTableBE00         = $BE00
stageTableBF00         = $BF00

.include "ram.inc"
