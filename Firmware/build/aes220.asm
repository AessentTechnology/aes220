;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (Dec 30 2013) (Linux)
; This file was generated Wed Apr 13 15:31:14 2016
;--------------------------------------------------------
	.module aes220
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _eeprom_read
	.globl _i2c_write
	.globl _delay
	.globl _EIPX6
	.globl _EIPX5
	.globl _EIPX4
	.globl _PI2C
	.globl _PUSB
	.globl _EIEX6
	.globl _EIEX5
	.globl _EIEX4
	.globl _EI2C
	.globl _EUSB
	.globl _SMOD1
	.globl _ERESI
	.globl _RESI
	.globl _INT6
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _FL
	.globl _P
	.globl _TF2
	.globl _EXF2
	.globl _RCLK
	.globl _TCLK
	.globl _EXEN2
	.globl _TR2
	.globl _C_T2
	.globl _CP_RL2
	.globl _SM01
	.globl _SM11
	.globl _SM21
	.globl _REN1
	.globl _TB81
	.globl _RB81
	.globl _TI1
	.globl _RI1
	.globl _PS1
	.globl _PT2
	.globl _PS0
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _PD7
	.globl _PD6
	.globl _PD5
	.globl _PD4
	.globl _PD3
	.globl _PD2
	.globl _PD1
	.globl _PD0
	.globl _EA
	.globl _ES1
	.globl _ET2
	.globl _ES0
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _PC7
	.globl _PC6
	.globl _PC5
	.globl _PC4
	.globl _PC3
	.globl _PC2
	.globl _PC1
	.globl _PC0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _PB7
	.globl _PB6
	.globl _PB5
	.globl _PB4
	.globl _PB3
	.globl _PB2
	.globl _PB1
	.globl _PB0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _PA7
	.globl _PA6
	.globl _PA5
	.globl _PA4
	.globl _PA3
	.globl _PA2
	.globl _PA1
	.globl _PA0
	.globl _EIP
	.globl _B
	.globl _EIE
	.globl _ACC
	.globl _EICON
	.globl _PSW
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2CON
	.globl _SBUF1
	.globl _SCON1
	.globl _GPIFSGLDATLNOX
	.globl _GPIFSGLDATLX
	.globl _GPIFSGLDATH
	.globl _GPIFTRIG
	.globl _EP01STAT
	.globl _IP
	.globl _OEE
	.globl _OED
	.globl _OEC
	.globl _OEB
	.globl _OEA
	.globl _IOE
	.globl _IOD
	.globl _AUTOPTRSETUP
	.globl _EP68FIFOFLGS
	.globl _EP24FIFOFLGS
	.globl _EP2468STAT
	.globl _IE
	.globl _INT4CLR
	.globl _INT2CLR
	.globl _IOC
	.globl _AUTOPTRL2
	.globl _AUTOPTRH2
	.globl _AUTOPTRL1
	.globl _AUTOPTRH1
	.globl _SBUF0
	.globl _SCON0
	.globl __XPAGE
	.globl _EXIF
	.globl _IOB
	.globl _CKCON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPS
	.globl _DPH1
	.globl _DPL1
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _IOA
	.globl _GPCR2
	.globl _ECC2B2
	.globl _ECC2B1
	.globl _ECC2B0
	.globl _ECC1B2
	.globl _ECC1B1
	.globl _ECC1B0
	.globl _ECCRESET
	.globl _ECCCFG
	.globl _EP8FIFOBUF
	.globl _EP6FIFOBUF
	.globl _EP4FIFOBUF
	.globl _EP2FIFOBUF
	.globl _EP1INBUF
	.globl _EP1OUTBUF
	.globl _EP0BUF
	.globl _UDMACRCQUAL
	.globl _UDMACRCL
	.globl _UDMACRCH
	.globl _GPIFHOLDAMOUNT
	.globl _FLOWSTBHPERIOD
	.globl _FLOWSTBEDGE
	.globl _FLOWSTB
	.globl _FLOWHOLDOFF
	.globl _FLOWEQ1CTL
	.globl _FLOWEQ0CTL
	.globl _FLOWLOGIC
	.globl _FLOWSTATE
	.globl _GPIFABORT
	.globl _GPIFREADYSTAT
	.globl _GPIFREADYCFG
	.globl _XGPIFSGLDATLNOX
	.globl _XGPIFSGLDATLX
	.globl _XGPIFSGLDATH
	.globl _EP8GPIFTRIG
	.globl _EP8GPIFPFSTOP
	.globl _EP8GPIFFLGSEL
	.globl _EP6GPIFTRIG
	.globl _EP6GPIFPFSTOP
	.globl _EP6GPIFFLGSEL
	.globl _EP4GPIFTRIG
	.globl _EP4GPIFPFSTOP
	.globl _EP4GPIFFLGSEL
	.globl _EP2GPIFTRIG
	.globl _EP2GPIFPFSTOP
	.globl _EP2GPIFFLGSEL
	.globl _GPIFTCB0
	.globl _GPIFTCB1
	.globl _GPIFTCB2
	.globl _GPIFTCB3
	.globl _GPIFADRL
	.globl _GPIFADRH
	.globl _GPIFCTLCFG
	.globl _GPIFIDLECTL
	.globl _GPIFIDLECS
	.globl _GPIFWFSELECT
	.globl _SETUPDAT
	.globl _SUDPTRCTL
	.globl _SUDPTRL
	.globl _SUDPTRH
	.globl _EP8FIFOBCL
	.globl _EP8FIFOBCH
	.globl _EP6FIFOBCL
	.globl _EP6FIFOBCH
	.globl _EP4FIFOBCL
	.globl _EP4FIFOBCH
	.globl _EP2FIFOBCL
	.globl _EP2FIFOBCH
	.globl _EP8FIFOFLGS
	.globl _EP6FIFOFLGS
	.globl _EP4FIFOFLGS
	.globl _EP2FIFOFLGS
	.globl _EP8CS
	.globl _EP6CS
	.globl _EP4CS
	.globl _EP2CS
	.globl _EP1INCS
	.globl _EP1OUTCS
	.globl _EP0CS
	.globl _EP8BCL
	.globl _EP8BCH
	.globl _EP6BCL
	.globl _EP6BCH
	.globl _EP4BCL
	.globl _EP4BCH
	.globl _EP2BCL
	.globl _EP2BCH
	.globl _EP1INBC
	.globl _EP1OUTBC
	.globl _EP0BCL
	.globl _EP0BCH
	.globl _FNADDR
	.globl _MICROFRAME
	.globl _USBFRAMEL
	.globl _USBFRAMEH
	.globl _TOGCTL
	.globl _WAKEUPCS
	.globl _SUSPEND
	.globl _USBCS
	.globl _XAUTODAT2
	.globl _XAUTODAT1
	.globl _I2CTL
	.globl _I2DAT
	.globl _I2CS
	.globl _PORTECFG
	.globl _PORTCCFG
	.globl _PORTACFG
	.globl _INTSETUP
	.globl _INT4IVEC
	.globl _INT2IVEC
	.globl _CLRERRCNT
	.globl _ERRCNTLIM
	.globl _USBERRIRQ
	.globl _USBERRIE
	.globl _GPIFIRQ
	.globl _GPIFIE
	.globl _EPIRQ
	.globl _EPIE
	.globl _USBIRQ
	.globl _USBIE
	.globl _NAKIRQ
	.globl _NAKIE
	.globl _IBNIRQ
	.globl _IBNIE
	.globl _EP8FIFOIRQ
	.globl _EP8FIFOIE
	.globl _EP6FIFOIRQ
	.globl _EP6FIFOIE
	.globl _EP4FIFOIRQ
	.globl _EP4FIFOIE
	.globl _EP2FIFOIRQ
	.globl _EP2FIFOIE
	.globl _OUTPKTEND
	.globl _INPKTEND
	.globl _EP8ISOINPKTS
	.globl _EP6ISOINPKTS
	.globl _EP4ISOINPKTS
	.globl _EP2ISOINPKTS
	.globl _EP8FIFOPFL
	.globl _EP8FIFOPFH
	.globl _EP6FIFOPFL
	.globl _EP6FIFOPFH
	.globl _EP4FIFOPFL
	.globl _EP4FIFOPFH
	.globl _EP2FIFOPFL
	.globl _EP2FIFOPFH
	.globl _EP8AUTOINLENL
	.globl _EP8AUTOINLENH
	.globl _EP6AUTOINLENL
	.globl _EP6AUTOINLENH
	.globl _EP4AUTOINLENL
	.globl _EP4AUTOINLENH
	.globl _EP2AUTOINLENL
	.globl _EP2AUTOINLENH
	.globl _EP8FIFOCFG
	.globl _EP6FIFOCFG
	.globl _EP4FIFOCFG
	.globl _EP2FIFOCFG
	.globl _EP8CFG
	.globl _EP6CFG
	.globl _EP4CFG
	.globl _EP2CFG
	.globl _EP1INCFG
	.globl _EP1OUTCFG
	.globl _REVCTL
	.globl _REVID
	.globl _FIFOPINPOLAR
	.globl _UART230
	.globl _BPADDRL
	.globl _BPADDRH
	.globl _BREAKPT
	.globl _FIFORESET
	.globl _PINFLAGSCD
	.globl _PINFLAGSAB
	.globl _IFCONFIG
	.globl _CPUCS
	.globl _RES_WAVEDATA_END
	.globl _GPIF_WAVE_DATA
	.globl _execFlashCmd_PARM_2
	.globl _writeEeprom_PARM_4
	.globl _writeEeprom_PARM_3
	.globl _writeEeprom_PARM_2
	.globl _assertSoftReset
	.globl _clearSoftReset
	.globl _startFpga
	.globl _setupFpgaConf
	.globl _configureFpga
	.globl _setupFpgaProg
	.globl _progFpga
	.globl _setMode
	.globl _writeEeprom
	.globl _execFlashCmd
	.globl _transferSpiByte
	.globl _readBoardStatusRegister
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_IOA	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_DPL1	=	0x0084
_DPH1	=	0x0085
_DPS	=	0x0086
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_CKCON	=	0x008e
_IOB	=	0x0090
_EXIF	=	0x0091
__XPAGE	=	0x0092
_SCON0	=	0x0098
_SBUF0	=	0x0099
_AUTOPTRH1	=	0x009a
_AUTOPTRL1	=	0x009b
_AUTOPTRH2	=	0x009d
_AUTOPTRL2	=	0x009e
_IOC	=	0x00a0
_INT2CLR	=	0x00a1
_INT4CLR	=	0x00a2
_IE	=	0x00a8
_EP2468STAT	=	0x00aa
_EP24FIFOFLGS	=	0x00ab
_EP68FIFOFLGS	=	0x00ac
_AUTOPTRSETUP	=	0x00af
_IOD	=	0x00b0
_IOE	=	0x00b1
_OEA	=	0x00b2
_OEB	=	0x00b3
_OEC	=	0x00b4
_OED	=	0x00b5
_OEE	=	0x00b6
_IP	=	0x00b8
_EP01STAT	=	0x00ba
_GPIFTRIG	=	0x00bb
_GPIFSGLDATH	=	0x00bd
_GPIFSGLDATLX	=	0x00be
_GPIFSGLDATLNOX	=	0x00bf
_SCON1	=	0x00c0
_SBUF1	=	0x00c1
_T2CON	=	0x00c8
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
_PSW	=	0x00d0
_EICON	=	0x00d8
_ACC	=	0x00e0
_EIE	=	0x00e8
_B	=	0x00f0
_EIP	=	0x00f8
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_PA0	=	0x0080
_PA1	=	0x0081
_PA2	=	0x0082
_PA3	=	0x0083
_PA4	=	0x0084
_PA5	=	0x0085
_PA6	=	0x0086
_PA7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_PB0	=	0x0090
_PB1	=	0x0091
_PB2	=	0x0092
_PB3	=	0x0093
_PB4	=	0x0094
_PB5	=	0x0095
_PB6	=	0x0096
_PB7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_PC0	=	0x00a0
_PC1	=	0x00a1
_PC2	=	0x00a2
_PC3	=	0x00a3
_PC4	=	0x00a4
_PC5	=	0x00a5
_PC6	=	0x00a6
_PC7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES0	=	0x00ac
_ET2	=	0x00ad
_ES1	=	0x00ae
_EA	=	0x00af
_PD0	=	0x00b0
_PD1	=	0x00b1
_PD2	=	0x00b2
_PD3	=	0x00b3
_PD4	=	0x00b4
_PD5	=	0x00b5
_PD6	=	0x00b6
_PD7	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS0	=	0x00bc
_PT2	=	0x00bd
_PS1	=	0x00be
_RI1	=	0x00c0
_TI1	=	0x00c1
_RB81	=	0x00c2
_TB81	=	0x00c3
_REN1	=	0x00c4
_SM21	=	0x00c5
_SM11	=	0x00c6
_SM01	=	0x00c7
_CP_RL2	=	0x00c8
_C_T2	=	0x00c9
_TR2	=	0x00ca
_EXEN2	=	0x00cb
_TCLK	=	0x00cc
_RCLK	=	0x00cd
_EXF2	=	0x00ce
_TF2	=	0x00cf
_P	=	0x00d0
_FL	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
_INT6	=	0x00db
_RESI	=	0x00dc
_ERESI	=	0x00dd
_SMOD1	=	0x00df
_EUSB	=	0x00e8
_EI2C	=	0x00e9
_EIEX4	=	0x00ea
_EIEX5	=	0x00eb
_EIEX6	=	0x00ec
_PUSB	=	0x00f8
_PI2C	=	0x00f9
_EIPX4	=	0x00fa
_EIPX5	=	0x00fb
_EIPX6	=	0x00fc
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_configureFpga_dataLen_1_42:
	.ds 4
_configureFpga_bytes_4_46:
	.ds 2
_progFpga_bytes_1_51:
	.ds 2
_writeEeprom_PARM_2:
	.ds 2
_writeEeprom_PARM_3:
	.ds 2
_writeEeprom_PARM_4:
	.ds 3
_writeEeprom_prom_addr_1_62:
	.ds 1
_writeEeprom_addr_buffer_1_63:
	.ds 2
_writeEeprom_last_data_ptr_1_63:
	.ds 3
_execFlashCmd_PARM_2:
	.ds 2
_readBoardStatusRegister_buf_1_71:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_GPIF_WAVE_DATA	=	0xe400
_RES_WAVEDATA_END	=	0xe480
_CPUCS	=	0xe600
_IFCONFIG	=	0xe601
_PINFLAGSAB	=	0xe602
_PINFLAGSCD	=	0xe603
_FIFORESET	=	0xe604
_BREAKPT	=	0xe605
_BPADDRH	=	0xe606
_BPADDRL	=	0xe607
_UART230	=	0xe608
_FIFOPINPOLAR	=	0xe609
_REVID	=	0xe60a
_REVCTL	=	0xe60b
_EP1OUTCFG	=	0xe610
_EP1INCFG	=	0xe611
_EP2CFG	=	0xe612
_EP4CFG	=	0xe613
_EP6CFG	=	0xe614
_EP8CFG	=	0xe615
_EP2FIFOCFG	=	0xe618
_EP4FIFOCFG	=	0xe619
_EP6FIFOCFG	=	0xe61a
_EP8FIFOCFG	=	0xe61b
_EP2AUTOINLENH	=	0xe620
_EP2AUTOINLENL	=	0xe621
_EP4AUTOINLENH	=	0xe622
_EP4AUTOINLENL	=	0xe623
_EP6AUTOINLENH	=	0xe624
_EP6AUTOINLENL	=	0xe625
_EP8AUTOINLENH	=	0xe626
_EP8AUTOINLENL	=	0xe627
_EP2FIFOPFH	=	0xe630
_EP2FIFOPFL	=	0xe631
_EP4FIFOPFH	=	0xe632
_EP4FIFOPFL	=	0xe633
_EP6FIFOPFH	=	0xe634
_EP6FIFOPFL	=	0xe635
_EP8FIFOPFH	=	0xe636
_EP8FIFOPFL	=	0xe637
_EP2ISOINPKTS	=	0xe640
_EP4ISOINPKTS	=	0xe641
_EP6ISOINPKTS	=	0xe642
_EP8ISOINPKTS	=	0xe643
_INPKTEND	=	0xe648
_OUTPKTEND	=	0xe649
_EP2FIFOIE	=	0xe650
_EP2FIFOIRQ	=	0xe651
_EP4FIFOIE	=	0xe652
_EP4FIFOIRQ	=	0xe653
_EP6FIFOIE	=	0xe654
_EP6FIFOIRQ	=	0xe655
_EP8FIFOIE	=	0xe656
_EP8FIFOIRQ	=	0xe657
_IBNIE	=	0xe658
_IBNIRQ	=	0xe659
_NAKIE	=	0xe65a
_NAKIRQ	=	0xe65b
_USBIE	=	0xe65c
_USBIRQ	=	0xe65d
_EPIE	=	0xe65e
_EPIRQ	=	0xe65f
_GPIFIE	=	0xe660
_GPIFIRQ	=	0xe661
_USBERRIE	=	0xe662
_USBERRIRQ	=	0xe663
_ERRCNTLIM	=	0xe664
_CLRERRCNT	=	0xe665
_INT2IVEC	=	0xe666
_INT4IVEC	=	0xe667
_INTSETUP	=	0xe668
_PORTACFG	=	0xe670
_PORTCCFG	=	0xe671
_PORTECFG	=	0xe672
_I2CS	=	0xe678
_I2DAT	=	0xe679
_I2CTL	=	0xe67a
_XAUTODAT1	=	0xe67b
_XAUTODAT2	=	0xe67c
_USBCS	=	0xe680
_SUSPEND	=	0xe681
_WAKEUPCS	=	0xe682
_TOGCTL	=	0xe683
_USBFRAMEH	=	0xe684
_USBFRAMEL	=	0xe685
_MICROFRAME	=	0xe686
_FNADDR	=	0xe687
_EP0BCH	=	0xe68a
_EP0BCL	=	0xe68b
_EP1OUTBC	=	0xe68d
_EP1INBC	=	0xe68f
_EP2BCH	=	0xe690
_EP2BCL	=	0xe691
_EP4BCH	=	0xe694
_EP4BCL	=	0xe695
_EP6BCH	=	0xe698
_EP6BCL	=	0xe699
_EP8BCH	=	0xe69c
_EP8BCL	=	0xe69d
_EP0CS	=	0xe6a0
_EP1OUTCS	=	0xe6a1
_EP1INCS	=	0xe6a2
_EP2CS	=	0xe6a3
_EP4CS	=	0xe6a4
_EP6CS	=	0xe6a5
_EP8CS	=	0xe6a6
_EP2FIFOFLGS	=	0xe6a7
_EP4FIFOFLGS	=	0xe6a8
_EP6FIFOFLGS	=	0xe6a9
_EP8FIFOFLGS	=	0xe6aa
_EP2FIFOBCH	=	0xe6ab
_EP2FIFOBCL	=	0xe6ac
_EP4FIFOBCH	=	0xe6ad
_EP4FIFOBCL	=	0xe6ae
_EP6FIFOBCH	=	0xe6af
_EP6FIFOBCL	=	0xe6b0
_EP8FIFOBCH	=	0xe6b1
_EP8FIFOBCL	=	0xe6b2
_SUDPTRH	=	0xe6b3
_SUDPTRL	=	0xe6b4
_SUDPTRCTL	=	0xe6b5
_SETUPDAT	=	0xe6b8
_GPIFWFSELECT	=	0xe6c0
_GPIFIDLECS	=	0xe6c1
_GPIFIDLECTL	=	0xe6c2
_GPIFCTLCFG	=	0xe6c3
_GPIFADRH	=	0xe6c4
_GPIFADRL	=	0xe6c5
_GPIFTCB3	=	0xe6ce
_GPIFTCB2	=	0xe6cf
_GPIFTCB1	=	0xe6d0
_GPIFTCB0	=	0xe6d1
_EP2GPIFFLGSEL	=	0xe6d2
_EP2GPIFPFSTOP	=	0xe6d3
_EP2GPIFTRIG	=	0xe6d4
_EP4GPIFFLGSEL	=	0xe6da
_EP4GPIFPFSTOP	=	0xe6db
_EP4GPIFTRIG	=	0xe6dc
_EP6GPIFFLGSEL	=	0xe6e2
_EP6GPIFPFSTOP	=	0xe6e3
_EP6GPIFTRIG	=	0xe6e4
_EP8GPIFFLGSEL	=	0xe6ea
_EP8GPIFPFSTOP	=	0xe6eb
_EP8GPIFTRIG	=	0xe6ec
_XGPIFSGLDATH	=	0xe6f0
_XGPIFSGLDATLX	=	0xe6f1
_XGPIFSGLDATLNOX	=	0xe6f2
_GPIFREADYCFG	=	0xe6f3
_GPIFREADYSTAT	=	0xe6f4
_GPIFABORT	=	0xe6f5
_FLOWSTATE	=	0xe6c6
_FLOWLOGIC	=	0xe6c7
_FLOWEQ0CTL	=	0xe6c8
_FLOWEQ1CTL	=	0xe6c9
_FLOWHOLDOFF	=	0xe6ca
_FLOWSTB	=	0xe6cb
_FLOWSTBEDGE	=	0xe6cc
_FLOWSTBHPERIOD	=	0xe6cd
_GPIFHOLDAMOUNT	=	0xe60c
_UDMACRCH	=	0xe67d
_UDMACRCL	=	0xe67e
_UDMACRCQUAL	=	0xe67f
_EP0BUF	=	0xe740
_EP1OUTBUF	=	0xe780
_EP1INBUF	=	0xe7c0
_EP2FIFOBUF	=	0xf000
_EP4FIFOBUF	=	0xf400
_EP6FIFOBUF	=	0xf800
_EP8FIFOBUF	=	0xfc00
_ECCCFG	=	0xe628
_ECCRESET	=	0xe629
_ECC1B0	=	0xe62a
_ECC1B1	=	0xe62b
_ECC1B2	=	0xe62c
_ECC2B0	=	0xe62d
_ECC2B1	=	0xe62e
_ECC2B2	=	0xe62f
_GPCR2	=	0xe50d
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'assertSoftReset'
;------------------------------------------------------------
;	./lib/aes220.c:104: void assertSoftReset()
;	-----------------------------------------
;	 function assertSoftReset
;	-----------------------------------------
_assertSoftReset:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	./lib/aes220.c:106: OEA |= 0x01; // Make sure PA0 is an output
	orl	_OEA,#0x01
;	./lib/aes220.c:107: PA0 = 1; // Reset active level = 1
	setb	_PA0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'clearSoftReset'
;------------------------------------------------------------
;	./lib/aes220.c:110: void clearSoftReset()
;	-----------------------------------------
;	 function clearSoftReset
;	-----------------------------------------
_clearSoftReset:
;	./lib/aes220.c:112: OEA |= 0x01; // Make sure PA0 is an output
	orl	_OEA,#0x01
;	./lib/aes220.c:113: PA0 = 0; // Reset active level = 1
	clr	_PA0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'startFpga'
;------------------------------------------------------------
;fpgaProgd                 Allocated to registers r7 
;------------------------------------------------------------
;	./lib/aes220.c:116: BOOL startFpga() 
;	-----------------------------------------
;	 function startFpga
;	-----------------------------------------
_startFpga:
;	./lib/aes220.c:123: OEA = 0x00;
	mov	_OEA,#0x00
;	./lib/aes220.c:124: OEB = 0b11101111; // set PB0/1/2/3/5/6/7 as outputs
	mov	_OEB,#0xEF
;	./lib/aes220.c:125: OED = 0b10001101; // set PD0/2/3/7 as outputs
	mov	_OED,#0x8D
;	./lib/aes220.c:126: SUSPEND_F = 0;
	clr	_PD7
;	./lib/aes220.c:127: PROG_B = 0; // Reset the FPGA (hard reset)
	clr	_PD0
;	./lib/aes220.c:131: M2 = 0; 
	clr	_PB1
;	./lib/aes220.c:132: M1 = 1;
	setb	_PB5
;	./lib/aes220.c:133: M0 = 1;
	setb	_PB3
;	./lib/aes220.c:134: VS2 = 1;
	setb	_PB2
;	./lib/aes220.c:135: VS1 = 1;
	setb	_PB7
;	./lib/aes220.c:136: VS0 = 1;
	setb	_PB6
;	./lib/aes220.c:137: while (INIT_B != 0) {};
00101$:
	jb	_PD5,00101$
;	./lib/aes220.c:138: PROG_B = 1; // release reset (hard)
	setb	_PD0
;	./lib/aes220.c:140: while (INIT_B != 1) {}; // wait for fpga to do its houskeeping
00104$:
	jnb	_PD5,00104$
;	./lib/aes220.c:143: delay(200); // 200ms increased from 100ms or aes220b uC hangs
	mov	dptr,#0x00C8
	lcall	_delay
;	./lib/aes220.c:146: if (DONE == 1) { fpgaProgd = TRUE; }
	jnb	_PD1,00108$
	mov	r7,#0x01
	sjmp	00109$
00108$:
;	./lib/aes220.c:147: else { fpgaProgd = FALSE; } // Blank Flash or problem during config
	mov	r7,#0x00
00109$:
;	./lib/aes220.c:151: OEA = 0x00; // Port A as input
	mov	_OEA,#0x00
;	./lib/aes220.c:152: OEB = 0x00; // Port B as input
	mov	_OEB,#0x00
;	./lib/aes220.c:153: OED = 0x81; // Port D as input save for PROG_B and SUSPEND_F
	mov	_OED,#0x81
;	./lib/aes220.c:154: PROG_B = 1;
	setb	_PD0
;	./lib/aes220.c:155: SUSPEND_F = 0;
	clr	_PD7
;	./lib/aes220.c:157: return fpgaProgd;
	mov	dpl,r7
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setupFpgaConf'
;------------------------------------------------------------
;fpgaStatus                Allocated to registers r7 
;------------------------------------------------------------
;	./lib/aes220.c:160: BYTE setupFpgaConf() 
;	-----------------------------------------
;	 function setupFpgaConf
;	-----------------------------------------
_setupFpgaConf:
;	./lib/aes220.c:165: OED = 0xC5; // set PD0/2/6/7 as outputs, the rest as inputs
	mov	_OED,#0xC5
;	./lib/aes220.c:166: SUSPEND_F = 0;
	clr	_PD7
;	./lib/aes220.c:167: PROG_B = 0; // Reset the FPGA
	clr	_PD0
;	./lib/aes220.c:168: OEA = 0xFF; // set port A as outputs (SelectMAP data bus)
	mov	_OEA,#0xFF
;	./lib/aes220.c:169: OEB = 0xFF; // set port B as outputs
	mov	_OEB,#0xFF
;	./lib/aes220.c:171: INIT_B = 1;
	setb	_PD5
;	./lib/aes220.c:172: RDWRB  = 1;
	setb	_PB4
;	./lib/aes220.c:173: CSI_B  = 1;    // Chip select signal set permanently to 0 (one 
	setb	_PD2
;	./lib/aes220.c:175: CCLK  = 0;    // sets CCLK low
	clr	_PD6
;	./lib/aes220.c:177: M2    = 1;    // M2 = 1 for SelectMap mode 
	setb	_PB1
;	./lib/aes220.c:178: M1    = 1;    // M1 = 1 for SelectMap mode
	setb	_PB5
;	./lib/aes220.c:179: M0    = 0;    // M0 = 0 for SelectMap mode
	clr	_PB3
;	./lib/aes220.c:182: delay(500); // 500ms
	mov	dptr,#0x01F4
	lcall	_delay
;	./lib/aes220.c:183: while (INIT_B != 0) {}; // wait for INIT_B to go low
00101$:
	jb	_PD5,00101$
;	./lib/aes220.c:184: PROG_B = 1;             // PROG_B back up
	setb	_PD0
;	./lib/aes220.c:185: while (INIT_B != 1) {}; // Wait for INIT_B to do the same
00104$:
	jnb	_PD5,00104$
;	./lib/aes220.c:186: RDWRB = 0; // select write mode
	clr	_PB4
;	./lib/aes220.c:187: CSI_B = 0;  // assert chip select
	clr	_PD2
;	./lib/aes220.c:188: delay(500);
	mov	dptr,#0x01F4
	lcall	_delay
;	./lib/aes220.c:189: if (DONE == 0) {fpgaStatus = F_READY;}
	jb	_PD1,00108$
	mov	r7,#0xAD
	sjmp	00109$
00108$:
;	./lib/aes220.c:190: else fpgaStatus = F_NOT_READY;
	mov	r7,#0xB3
00109$:
;	./lib/aes220.c:191: return fpgaStatus;
	mov	dpl,r7
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'configureFpga'
;------------------------------------------------------------
;dataLen                   Allocated with name '_configureFpga_dataLen_1_42'
;fpgaStatus                Allocated to registers r3 
;bytes                     Allocated with name '_configureFpga_bytes_4_46'
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	./lib/aes220.c:194: BYTE configureFpga(DWORD dataLen)
;	-----------------------------------------
;	 function configureFpga
;	-----------------------------------------
_configureFpga:
	mov	_configureFpga_dataLen_1_42,dpl
	mov	(_configureFpga_dataLen_1_42 + 1),dph
	mov	(_configureFpga_dataLen_1_42 + 2),b
	mov	(_configureFpga_dataLen_1_42 + 3),a
;	./lib/aes220.c:198: fpgaStatus = setupFpgaConf();
	lcall	_setupFpgaConf
	mov	r3,dpl
;	./lib/aes220.c:200: if (fpgaStatus == F_READY) {
	cjne	r3,#0xAD,00142$
	sjmp	00143$
00142$:
	ljmp	00113$
00143$:
;	./lib/aes220.c:202: while(dataLen > 0) { 
00106$:
	mov	a,_configureFpga_dataLen_1_42
	orl	a,(_configureFpga_dataLen_1_42 + 1)
	orl	a,(_configureFpga_dataLen_1_42 + 2)
	orl	a,(_configureFpga_dataLen_1_42 + 3)
	jnz	00144$
	ljmp	00108$
00144$:
;	./lib/aes220.c:203: if ( !(EP2468STAT & bmEP2EMPTY) ) { // EP2 received data
	mov	a,_EP2468STAT
	jb	acc.0,00106$
;	./lib/aes220.c:206: bytes = MAKEWORD(EP2BCH,EP2BCL);
	mov	dptr,#_EP2BCH
	movx	a,@dptr
	mov	r2,a
	mov	r1,#0x00
	mov	dptr,#_EP2BCL
	movx	a,@dptr
	mov	r0,a
	mov	r7,#0x00
	orl	a,r1
	mov	_configureFpga_bytes_4_46,a
	mov	a,r7
	orl	a,r2
	mov	(_configureFpga_bytes_4_46 + 1),a
;	./lib/aes220.c:207: for (i=0;i<bytes;++i) {
	mov	r6,#0x00
	mov	r7,#0x00
00115$:
	clr	c
	mov	a,r6
	subb	a,_configureFpga_bytes_4_46
	mov	a,r7
	subb	a,(_configureFpga_bytes_4_46 + 1)
	jnc	00101$
;	./lib/aes220.c:208: IOA = EP2FIFOBUF[i]; // output the byte on port A
	mov	dpl,r6
	mov	a,#(_EP2FIFOBUF >> 8)
	add	a,r7
	mov	dph,a
	movx	a,@dptr
	mov	_IOA,a
;	./lib/aes220.c:209: CCLK = 0;       // tick the clock (low)
	clr	_PD6
;	./lib/aes220.c:210: LED6 = LED_OFF; // flash the LED, why not?
	setb	_PB0
;	./lib/aes220.c:211: CCLK = 1;       // tick the clock (high)
	setb	_PD6
;	./lib/aes220.c:212: LED6 = LED_ON;  // keep flashing this LED
	clr	_PB0
;	./lib/aes220.c:207: for (i=0;i<bytes;++i) {
	inc	r6
	cjne	r6,#0x00,00115$
	inc	r7
	sjmp	00115$
00101$:
;	./lib/aes220.c:214: dataLen -= bytes;
	mov	r4,_configureFpga_bytes_4_46
	mov	r5,(_configureFpga_bytes_4_46 + 1)
	clr	a
	mov	r6,a
	mov	r7,a
	mov	a,_configureFpga_dataLen_1_42
	clr	c
	subb	a,r4
	mov	_configureFpga_dataLen_1_42,a
	mov	a,(_configureFpga_dataLen_1_42 + 1)
	subb	a,r5
	mov	(_configureFpga_dataLen_1_42 + 1),a
	mov	a,(_configureFpga_dataLen_1_42 + 2)
	subb	a,r6
	mov	(_configureFpga_dataLen_1_42 + 2),a
	mov	a,(_configureFpga_dataLen_1_42 + 3)
	subb	a,r7
	mov	(_configureFpga_dataLen_1_42 + 3),a
;	./lib/aes220.c:215: if ( (INIT_B == 0) & (DONE == 0) ) {
	mov	c,_PD5
	cpl	c
	clr	a
	rlc	a
	mov	r7,a
	mov	c,_PD1
	cpl	c
	clr	a
	rlc	a
	mov	r6,a
	anl	a,r7
	jz	00103$
;	./lib/aes220.c:217: LED6 = LED_OFF;
	setb	_PB0
;	./lib/aes220.c:218: return fpgaStatus;
	mov	dpl,#0xB0
	ret
00103$:
;	./lib/aes220.c:221: SYNCDELAY; REARM();
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
	ljmp	00106$
00108$:
;	./lib/aes220.c:225: if (DONE == 1) {
	jnb	_PD1,00110$
;	./lib/aes220.c:227: OEA = 0x00; // Port A as input
	mov	_OEA,#0x00
;	./lib/aes220.c:228: assertSoftReset(); // keep soft_reset at one (active)
	lcall	_assertSoftReset
;	./lib/aes220.c:230: CSI_B = 1;  // release chip select
	setb	_PD2
;	./lib/aes220.c:231: RDWRB = 1; // release write mode
	setb	_PB4
;	./lib/aes220.c:234: OEB = 0x00; // Port B as input
	mov	_OEB,#0x00
;	./lib/aes220.c:235: OED = 0x81; // Port D as input save for PROG_B and SUSPEND_F
	mov	_OED,#0x81
;	./lib/aes220.c:236: fpgaStatus = PROG_DONE;
	mov	r3,#0xAB
	sjmp	00113$
00110$:
;	./lib/aes220.c:238: else fpgaStatus = DONE_LOW;
	mov	r3,#0xB2
00113$:
;	./lib/aes220.c:241: return fpgaStatus;
	mov	dpl,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setupFpgaProg'
;------------------------------------------------------------
;	./lib/aes220.c:244: void setupFpgaProg() 
;	-----------------------------------------
;	 function setupFpgaProg
;	-----------------------------------------
_setupFpgaProg:
;	./lib/aes220.c:249: OEA = 0x00; // set port A as inputs
	mov	_OEA,#0x00
;	./lib/aes220.c:250: OEB = 0xFF; // set port B as outputs
	mov	_OEB,#0xFF
;	./lib/aes220.c:251: OED = 0b10001101; // set PD0, PD2, PD3 and PD7 as outputs
	mov	_OED,#0x8D
;	./lib/aes220.c:252: SUSPEND_F = 0;
	clr	_PD7
;	./lib/aes220.c:254: PROG_B = 1;
	setb	_PD0
;	./lib/aes220.c:255: LOAD_B = 1;    // Shift register load signal set to 1
	setb	_PD2
;	./lib/aes220.c:256: CS_B   = 1;    // Chip select signal set to 1
	setb	_PD3
;	./lib/aes220.c:257: fpgaStatus = PROG_F_MODE;
	mov	dptr,#_fpgaStatus
	mov	a,#0xA8
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'progFpga'
;------------------------------------------------------------
;bytes                     Allocated with name '_progFpga_bytes_1_51'
;i                         Allocated to registers r6 r7 
;ctrlCode                  Allocated to registers r7 
;------------------------------------------------------------
;	./lib/aes220.c:260: BYTE progFpga()
;	-----------------------------------------
;	 function progFpga
;	-----------------------------------------
_progFpga:
;	./lib/aes220.c:264: setupFpgaProg();
	lcall	_setupFpgaProg
;	./lib/aes220.c:265: if (fpgaStatus != PROG_F_MODE) return 1;
	mov	dptr,#_fpgaStatus
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xA8,00172$
	sjmp	00114$
00172$:
	mov	dpl,#0x01
	ret
;	./lib/aes220.c:266: while(fpgaStatus != PROG_DONE) { 
00114$:
	mov	dptr,#_fpgaStatus
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xAB,00173$
	ljmp	00116$
00173$:
;	./lib/aes220.c:267: if ( !(EP2468STAT & bmEP2EMPTY)) {
	mov	a,_EP2468STAT
	jb	acc.0,00114$
;	./lib/aes220.c:271: bytes = MAKEWORD(EP2BCH,EP2BCL);
	mov	dptr,#_EP2BCH
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#_EP2BCL
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	orl	a,r7
	mov	_progFpga_bytes_1_51,a
	mov	a,r4
	orl	a,r6
	mov	(_progFpga_bytes_1_51 + 1),a
;	./lib/aes220.c:273: ctrlCode = EP2FIFOBUF[0];
	mov	dptr,#_EP2FIFOBUF
	movx	a,@dptr
	mov	r7,a
;	./lib/aes220.c:274: switch (ctrlCode) {
	cjne	r7,#0x60,00175$
	sjmp	00103$
00175$:
	cjne	r7,#0x61,00176$
	sjmp	00104$
00176$:
	cjne	r7,#0x62,00177$
	sjmp	00106$
00177$:
	cjne	r7,#0xAF,00178$
	ljmp	00109$
00178$:
	ljmp	00110$
;	./lib/aes220.c:275: case STATUS_CHECK:
00103$:
;	./lib/aes220.c:276: CS_B = 0;    // Enable flash
	clr	_PD3
;	./lib/aes220.c:277: LOAD_B = 0;
	clr	_PD2
;	./lib/aes220.c:278: IOB = 0xD7;  // Write the value on port B
	mov	_IOB,#0xD7
;	./lib/aes220.c:279: LOAD_B = 1;
	setb	_PD2
;	./lib/aes220.c:280: IOB = 0x55;  // Write a dummy value to flush out status byte from flash
	mov	_IOB,#0x55
;	./lib/aes220.c:281: LOAD_B = 0;
	clr	_PD2
;	./lib/aes220.c:282: LOAD_B = 1;
	setb	_PD2
;	./lib/aes220.c:283: EP6FIFOBUF[0] = IOA; // read and send value on port A back
	mov	dptr,#_EP6FIFOBUF
	mov	a,_IOA
	movx	@dptr,a
;	./lib/aes220.c:284: CS_B = 1;
	setb	_PD3
;	./lib/aes220.c:286: EP6BCH=0;
	mov	dptr,#_EP6BCH
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:287: SYNCDELAY;
	nop 
	nop 
	nop 
	nop 
;	./lib/aes220.c:288: EP6BCL=1;
	mov	dptr,#_EP6BCL
	mov	a,#0x01
	movx	@dptr,a
;	./lib/aes220.c:289: break; // end of case STATUS_CHECK
	ljmp	00111$
;	./lib/aes220.c:290: case WRITE_CMD:
00104$:
;	./lib/aes220.c:291: CS_B = 0;
	clr	_PD3
;	./lib/aes220.c:292: for (i=1;i<bytes;++i) {
	mov	r6,#0x01
	mov	r7,#0x00
00118$:
	clr	c
	mov	a,r6
	subb	a,_progFpga_bytes_1_51
	mov	a,r7
	subb	a,(_progFpga_bytes_1_51 + 1)
	jnc	00105$
;	./lib/aes220.c:293: LOAD_B = 0;
	clr	_PD2
;	./lib/aes220.c:294: IOB = EP2FIFOBUF[i];
	mov	dpl,r6
	mov	a,#(_EP2FIFOBUF >> 8)
	add	a,r7
	mov	dph,a
	movx	a,@dptr
	mov	_IOB,a
;	./lib/aes220.c:295: LOAD_B = 1;
	setb	_PD2
;	./lib/aes220.c:292: for (i=1;i<bytes;++i) {
	inc	r6
	cjne	r6,#0x00,00118$
	inc	r7
	sjmp	00118$
00105$:
;	./lib/aes220.c:297: CS_B = 1;
	setb	_PD3
;	./lib/aes220.c:298: break; // end of case WRITE_CMD
;	./lib/aes220.c:299: case READ_CMD:
	sjmp	00111$
00106$:
;	./lib/aes220.c:300: CS_B = 0;
	clr	_PD3
;	./lib/aes220.c:301: for (i=1;i<bytes;++i) {
	mov	r6,#0x01
	mov	r7,#0x00
00121$:
	clr	c
	mov	a,r6
	subb	a,_progFpga_bytes_1_51
	mov	a,r7
	subb	a,(_progFpga_bytes_1_51 + 1)
	jnc	00107$
;	./lib/aes220.c:302: LOAD_B = 0;
	clr	_PD2
;	./lib/aes220.c:303: IOB = EP2FIFOBUF[i];
	mov	dpl,r6
	mov	a,#(_EP2FIFOBUF >> 8)
	add	a,r7
	mov	dph,a
	movx	a,@dptr
	mov	_IOB,a
;	./lib/aes220.c:304: LOAD_B = 1;
	setb	_PD2
;	./lib/aes220.c:301: for (i=1;i<bytes;++i) {
	inc	r6
	cjne	r6,#0x00,00121$
	inc	r7
	sjmp	00121$
00107$:
;	./lib/aes220.c:306: for (i=0;i<PAGE_SIZE;++i) {
	mov	r6,#0x00
	mov	r7,#0x00
00123$:
;	./lib/aes220.c:307: LOAD_B = 0;
	clr	_PD2
;	./lib/aes220.c:308: IOB = 0xAA; // dummy byte
	mov	_IOB,#0xAA
;	./lib/aes220.c:309: LOAD_B = 1;
	setb	_PD2
;	./lib/aes220.c:310: EP6FIFOBUF[i] = IOA;
	mov	dpl,r6
	mov	a,#(_EP6FIFOBUF >> 8)
	add	a,r7
	mov	dph,a
	mov	a,_IOA
	movx	@dptr,a
;	./lib/aes220.c:306: for (i=0;i<PAGE_SIZE;++i) {
	inc	r6
	cjne	r6,#0x00,00183$
	inc	r7
00183$:
	clr	c
	mov	a,r6
	subb	a,#0x08
	mov	a,r7
	subb	a,#0x01
	jc	00123$
;	./lib/aes220.c:312: CS_B = 1;
	setb	_PD3
;	./lib/aes220.c:314: EP6BCH=MSB(PAGE_SIZE);
	mov	dptr,#_EP6BCH
	mov	a,#0x01
	movx	@dptr,a
;	./lib/aes220.c:315: SYNCDELAY;
	nop 
	nop 
	nop 
	nop 
;	./lib/aes220.c:316: EP6BCL=LSB(PAGE_SIZE);
	mov	dptr,#_EP6BCL
	mov	a,#0x08
	movx	@dptr,a
;	./lib/aes220.c:317: break; // end of case READ_CMD
;	./lib/aes220.c:318: case RESET_F:
	sjmp	00111$
00109$:
;	./lib/aes220.c:319: startFpga();
	lcall	_startFpga
;	./lib/aes220.c:320: fpgaStatus = PROG_DONE;
	mov	dptr,#_fpgaStatus
	mov	a,#0xAB
	movx	@dptr,a
;	./lib/aes220.c:321: break; // end of case RESET_FPGA
;	./lib/aes220.c:322: default:
	sjmp	00111$
00110$:
;	./lib/aes220.c:323: LED6 = 1 ; // D6 OFF
	setb	_PB0
;	./lib/aes220.c:325: } // end of switch
00111$:
;	./lib/aes220.c:326: REARM(); // ep2
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
	ljmp	00114$
00116$:
;	./lib/aes220.c:329: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setMode'
;------------------------------------------------------------
;uCMode                    Allocated to registers r7 
;------------------------------------------------------------
;	./lib/aes220.c:358: void setMode(BYTE uCMode)
;	-----------------------------------------
;	 function setMode
;	-----------------------------------------
_setMode:
	mov	r7,dpl
;	./lib/aes220.c:360: switch (uCMode) {
	cjne	r7,#0xA2,00112$
	sjmp	00101$
00112$:
	cjne	r7,#0xA3,00113$
	ljmp	00102$
00113$:
	ret
;	./lib/aes220.c:362: case PORT_MODE:
00101$:
;	./lib/aes220.c:364: REVCTL=0x00; // not using advanced endpoint controls
	mov	dptr,#_REVCTL
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:366: SYNCDELAY; PORTACFG = 0x00; // otherwise PA7 = SLCS -> is maintained at '1' by the FPGA
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_PORTACFG
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:371: SYNCDELAY; IFCONFIG = (bmIFCLKSRC | bm3048MHZ); // intern. clk, 48MHz, not provided to FPGA, not
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_IFCONFIG
	mov	a,#0xC0
	movx	@dptr,a
;	./lib/aes220.c:377: SYNCDELAY; EP2CFG = (bmVALID | bmTYPE1); // valid, OUT, bulk, 512 bytes, quad buffered
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP2CFG
	mov	a,#0xA0
	movx	@dptr,a
;	./lib/aes220.c:378: SYNCDELAY; EP6CFG = (bmVALID | bmTYPE1 | bmDIR); // valid, IN, bulk, 512 bytes, quad buffered
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP6CFG
	mov	a,#0xE0
	movx	@dptr,a
;	./lib/aes220.c:381: SYNCDELAY; EP1INCFG &= ~bmVALID;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP1INCFG
	movx	a,@dptr
	mov	r7,a
	anl	a,#0x7F
	movx	@dptr,a
;	./lib/aes220.c:382: SYNCDELAY; EP1OUTCFG &= ~bmVALID;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP1OUTCFG
	movx	a,@dptr
	mov	r7,a
	anl	a,#0x7F
	movx	@dptr,a
;	./lib/aes220.c:383: SYNCDELAY; EP4CFG &= ~bmVALID;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP4CFG
	movx	a,@dptr
	mov	r7,a
	anl	a,#0x7F
	movx	@dptr,a
;	./lib/aes220.c:384: SYNCDELAY; EP8CFG &= ~bmVALID;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP8CFG
	movx	a,@dptr
	mov	r7,a
	anl	a,#0x7F
	movx	@dptr,a
;	./lib/aes220.c:386: SYNCDELAY; EP2FIFOCFG = 0x00;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP2FIFOCFG
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:387: SYNCDELAY; EP6FIFOCFG = 0x00;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP6FIFOCFG
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:390: SYNCDELAY; REARM(); // Rearm 4 times for the four buffers
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	./lib/aes220.c:391: SYNCDELAY; REARM(); 
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	./lib/aes220.c:392: SYNCDELAY; REARM(); 
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	./lib/aes220.c:393: SYNCDELAY; REARM(); 
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	./lib/aes220.c:396: SYNCDELAY; EP6BCL = 0x00; // write once
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP6BCL
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:397: SYNCDELAY; EP6BCL = 0x00; // do it again
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP6BCL
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:400: OEA = 0x00; // Port A as input
	mov	_OEA,#0x00
;	./lib/aes220.c:401: OEB = 0x00; // Port B as input
	mov	_OEB,#0x00
;	./lib/aes220.c:402: OED = 0x81; // Port D as input save for PROG_B and SUSPEND_F
	mov	_OED,#0x81
;	./lib/aes220.c:403: PROG_B = 1;
	setb	_PD0
;	./lib/aes220.c:404: SUSPEND_F = 0;
	clr	_PD7
;	./lib/aes220.c:406: break; // end of case PORT_MODE
	ret
;	./lib/aes220.c:408: case SLAVE_FIFO_MODE:
00102$:
;	./lib/aes220.c:410: OED = 0x81;
	mov	_OED,#0x81
;	./lib/aes220.c:411: SUSPEND_F = 0;
	clr	_PD7
;	./lib/aes220.c:413: PORTACFG = 0x40; // PA7 = SLCS -> needs to be maintained at '1' by the
	mov	dptr,#_PORTACFG
	mov	a,#0x40
	movx	@dptr,a
;	./lib/aes220.c:414: SYNCDELAY;       // FPGA otherwise port D outputs set to '0' resetting
	nop 
	nop 
	nop 
	nop 
;	./lib/aes220.c:420: FIFOPINPOLAR = (bmBIT5 | bmBIT4 | bmBIT3 | bmBIT2 | bmBIT0); 
	mov	dptr,#_FIFOPINPOLAR
	mov	a,#0x3D
	movx	@dptr,a
;	./lib/aes220.c:421: PINFLAGSAB = (bmBIT7 | bmBIT6 | bmBIT5); // Flag B is EP6 FIFO full flag
	mov	dptr,#_PINFLAGSAB
	mov	a,#0xE0
	movx	@dptr,a
;	./lib/aes220.c:422: SYNCDELAY;
	nop 
	nop 
	nop 
	nop 
;	./lib/aes220.c:423: PINFLAGSCD = bmBIT4; // Flag C is EP2 FIFO empty flag
	mov	dptr,#_PINFLAGSCD
	mov	a,#0x10
	movx	@dptr,a
;	./lib/aes220.c:424: SYNCDELAY;
	nop 
	nop 
	nop 
	nop 
;	./lib/aes220.c:428: SYNCDELAY; IFCONFIG = (bm3048MHZ | bmIFCFGMASK); // extern. clk, 48MHz, provided by FPGA, 
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_IFCONFIG
	mov	a,#0x43
	movx	@dptr,a
;	./lib/aes220.c:432: SYNCDELAY; EP4FIFOCFG = 0x00; // 8 bit wide bus (Port B) 
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP4FIFOCFG
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:433: SYNCDELAY; EP8FIFOCFG = 0x00; // 8 bit wide bus (Port B) 
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP8FIFOCFG
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:435: SYNCDELAY; REVCTL = (bmBIT1 | bmBIT0); 
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_REVCTL
	mov	a,#0x03
	movx	@dptr,a
;	./lib/aes220.c:440: SYNCDELAY; EP2CFG = (bmVALID | bmTYPE1); // valid, OUT, bulk, 512 bytes, quad buffered
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP2CFG
	mov	a,#0xA0
	movx	@dptr,a
;	./lib/aes220.c:441: SYNCDELAY;EP6CFG = (bmVALID | bmTYPE1 | bmDIR ); // valid, IN, bulk, 512 bytes, quad buffered
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP6CFG
	mov	a,#0xE0
	movx	@dptr,a
;	./lib/aes220.c:444: SYNCDELAY; FIFORESET = bmNAKALL; 
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_FIFORESET
	mov	a,#0x80
	movx	@dptr,a
;	./lib/aes220.c:445: SYNCDELAY; FIFORESET = bmNAKALL | 2; // reset EP2OUT
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_FIFORESET
	mov	a,#0x82
	movx	@dptr,a
;	./lib/aes220.c:446: SYNCDELAY; FIFORESET = bmNAKALL | 6; // reset EP6IN
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_FIFORESET
	mov	a,#0x86
	movx	@dptr,a
;	./lib/aes220.c:447: SYNCDELAY; FIFORESET = 0x00; 
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_FIFORESET
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:450: SYNCDELAY; OUTPKTEND = bmBIT7 | 2;  // EP2OUT
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_OUTPKTEND
	mov	a,#0x82
	movx	@dptr,a
;	./lib/aes220.c:451: SYNCDELAY; OUTPKTEND = bmBIT7 | 2;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_OUTPKTEND
	mov	a,#0x82
	movx	@dptr,a
;	./lib/aes220.c:452: SYNCDELAY; OUTPKTEND = bmBIT7 | 2;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_OUTPKTEND
	mov	a,#0x82
	movx	@dptr,a
;	./lib/aes220.c:453: SYNCDELAY; OUTPKTEND = bmBIT7 | 2;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_OUTPKTEND
	mov	a,#0x82
	movx	@dptr,a
;	./lib/aes220.c:456: SYNCDELAY; EP2FIFOCFG = bmAUTOOUT; // autoout=1, 8 bits wide bus (Port B)
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP2FIFOCFG
	mov	a,#0x10
	movx	@dptr,a
;	./lib/aes220.c:459: SYNCDELAY; EP6FIFOCFG = (bmINFM | bmAUTOIN); // Full minus one, autoIN=1, 8 bits wide bus (Port B)  
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP6FIFOCFG
	mov	a,#0x48
	movx	@dptr,a
;	./lib/aes220.c:466: SYNCDELAY; EP6AUTOINLENH = 0x02; // Send data in 512 byte chunks
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP6AUTOINLENH
	mov	a,#0x02
	movx	@dptr,a
;	./lib/aes220.c:467: SYNCDELAY; EP6AUTOINLENL = 0x00;
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_EP6AUTOINLENL
	clr	a
	movx	@dptr,a
;	./lib/aes220.c:469: SYNCDELAY; RESETFIFO(0x06);
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_FIFORESET
	mov	a,#0x80
	movx	@dptr,a
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_FIFORESET
	mov	a,#0x06
	movx	@dptr,a
	nop 
	nop 
	nop 
	nop 
	mov	dptr,#_FIFORESET
	clr	a
	movx	@dptr,a
	nop 
	nop 
	nop 
	nop 
;	./lib/aes220.c:471: OED = 0x81;
	mov	_OED,#0x81
;	./lib/aes220.c:472: SUSPEND_F = 0;
	clr	_PD7
;	./lib/aes220.c:475: } // end of uCMode switch
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'writeEeprom'
;------------------------------------------------------------
;addr                      Allocated with name '_writeEeprom_PARM_2'
;length                    Allocated with name '_writeEeprom_PARM_3'
;buf                       Allocated with name '_writeEeprom_PARM_4'
;prom_addr                 Allocated with name '_writeEeprom_prom_addr_1_62'
;addr_len                  Allocated to registers 
;addr_buffer               Allocated with name '_writeEeprom_addr_buffer_1_63'
;bs                        Allocated to registers r7 
;data_buffer_ptr           Allocated to registers r4 r5 r6 
;last_data_ptr             Allocated with name '_writeEeprom_last_data_ptr_1_63'
;------------------------------------------------------------
;	./lib/aes220.c:478: BOOL writeEeprom(BYTE prom_addr, WORD addr, WORD length, BYTE* buf)
;	-----------------------------------------
;	 function writeEeprom
;	-----------------------------------------
_writeEeprom:
	mov	_writeEeprom_prom_addr_1_62,dpl
;	./lib/aes220.c:483: BYTE *data_buffer_ptr = buf;
	mov	r4,_writeEeprom_PARM_4
	mov	r5,(_writeEeprom_PARM_4 + 1)
	mov	r6,(_writeEeprom_PARM_4 + 2)
;	./lib/aes220.c:484: BYTE *last_data_ptr = buf + length;
	mov	a,_writeEeprom_PARM_3
	add	a,r4
	mov	_writeEeprom_last_data_ptr_1_63,a
	mov	a,(_writeEeprom_PARM_3 + 1)
	addc	a,r5
	mov	(_writeEeprom_last_data_ptr_1_63 + 1),a
	mov	(_writeEeprom_last_data_ptr_1_63 + 2),r6
;	./lib/aes220.c:487: addr_buffer[0] = MSB(addr);
	mov	r7,(_writeEeprom_PARM_2 + 1)
	mov	_writeEeprom_addr_buffer_1_63,r7
;	./lib/aes220.c:488: addr_buffer[1] = LSB(addr);
	mov	r3,_writeEeprom_PARM_2
	mov	r7,#0x00
	mov	(_writeEeprom_addr_buffer_1_63 + 0x0001),r3
;	./lib/aes220.c:490: while ( data_buffer_ptr < last_data_ptr ) {
00106$:
	push	_writeEeprom_last_data_ptr_1_63
	push	(_writeEeprom_last_data_ptr_1_63 + 1)
	push	(_writeEeprom_last_data_ptr_1_63 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jnc	00108$
;	./lib/aes220.c:491: if ( (last_data_ptr - data_buffer_ptr) > MAX_EEP_WRITE) { // 
	mov	a,_writeEeprom_last_data_ptr_1_63
	clr	c
	subb	a,r4
	mov	r3,a
	mov	a,(_writeEeprom_last_data_ptr_1_63 + 1)
	subb	a,r5
	mov	r7,a
	clr	c
	mov	a,#0x40
	subb	a,r3
	clr	a
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00102$
;	./lib/aes220.c:492: bs = MAX_EEP_WRITE;
	mov	r7,#0x40
	sjmp	00103$
00102$:
;	./lib/aes220.c:494: else bs = last_data_ptr - data_buffer_ptr;
	mov	a,_writeEeprom_last_data_ptr_1_63
	clr	c
	subb	a,r4
	mov	r2,a
	mov	a,(_writeEeprom_last_data_ptr_1_63 + 1)
	subb	a,r5
	mov	r3,a
	mov	ar7,r2
00103$:
;	./lib/aes220.c:495: if ( ! i2c_write ( prom_addr, addr_len, addr_buffer, bs, data_buffer_ptr ) ) return FALSE;
	mov	_i2c_write_PARM_3,#_writeEeprom_addr_buffer_1_63
	mov	(_i2c_write_PARM_3 + 1),#0x00
	mov	(_i2c_write_PARM_3 + 2),#0x40
	mov	_i2c_write_PARM_4,r7
	mov	(_i2c_write_PARM_4 + 1),#0x00
	mov	_i2c_write_PARM_2,#0x02
	mov	(_i2c_write_PARM_2 + 1),#0x00
	mov	_i2c_write_PARM_5,r4
	mov	(_i2c_write_PARM_5 + 1),r5
	mov	(_i2c_write_PARM_5 + 2),r6
	mov	dpl,_writeEeprom_prom_addr_1_62
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_i2c_write
	mov	a,dpl
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00105$
	mov	dpl,a
	ret
00105$:
;	./lib/aes220.c:496: addr += bs; // More data to come so remember to increase the address
	mov	ar2,r7
	mov	r3,#0x00
	mov	a,r2
	add	a,_writeEeprom_PARM_2
	mov	_writeEeprom_PARM_2,a
	mov	a,r3
	addc	a,(_writeEeprom_PARM_2 + 1)
	mov	(_writeEeprom_PARM_2 + 1),a
;	./lib/aes220.c:497: data_buffer_ptr += bs;
	mov	a,r7
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r5
	mov	r5,a
	ljmp	00106$
00108$:
;	./lib/aes220.c:499: return TRUE;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'execFlashCmd'
;------------------------------------------------------------
;len                       Allocated with name '_execFlashCmd_PARM_2'
;cmd                       Allocated to registers r6 r7 
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	./lib/aes220.c:502: void execFlashCmd(WORD cmd, WORD len)
;	-----------------------------------------
;	 function execFlashCmd
;	-----------------------------------------
_execFlashCmd:
	mov	r6,dpl
;	./lib/aes220.c:505: CS_B = 0;    // Enable SPI interface
	clr	_PD3
;	./lib/aes220.c:506: transferSpiByte((BYTE)cmd);
	mov	dpl,r6
	lcall	_transferSpiByte
;	./lib/aes220.c:507: for (i=0; i<len; i++) {
	mov	r7,#0x00
00103$:
	mov	ar5,r7
	mov	r6,#0x00
	clr	c
	mov	a,r5
	subb	a,_execFlashCmd_PARM_2
	mov	a,r6
	subb	a,(_execFlashCmd_PARM_2 + 1)
	jnc	00101$
;	./lib/aes220.c:508: EP0BUF[i] = transferSpiByte(EP0BUF[i]);
	mov	a,r7
	add	a,#_EP0BUF
	mov	r5,a
	clr	a
	addc	a,#(_EP0BUF >> 8)
	mov	r6,a
	mov	a,r7
	add	a,#_EP0BUF
	mov	dpl,a
	clr	a
	addc	a,#(_EP0BUF >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_transferSpiByte
	mov	r4,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	a,r4
	movx	@dptr,a
;	./lib/aes220.c:507: for (i=0; i<len; i++) {
	inc	r7
	sjmp	00103$
00101$:
;	./lib/aes220.c:510: CS_B = 1;
	setb	_PD3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'transferSpiByte'
;------------------------------------------------------------
;spiByte                   Allocated to registers 
;------------------------------------------------------------
;	./lib/aes220.c:513: BYTE transferSpiByte(BYTE spiByte) 
;	-----------------------------------------
;	 function transferSpiByte
;	-----------------------------------------
_transferSpiByte:
	mov	_IOB,dpl
;	./lib/aes220.c:516: LOAD_B = 0;
	clr	_PD2
;	./lib/aes220.c:517: LOAD_B = 1;
	setb	_PD2
;	./lib/aes220.c:518: NOP;
	nop 
;	./lib/aes220.c:519: NOP;
	nop 
;	./lib/aes220.c:520: NOP;
	nop 
;	./lib/aes220.c:521: return IOA;
	mov	dpl,_IOA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readBoardStatusRegister'
;------------------------------------------------------------
;addr_len                  Allocated to registers 
;addr_buffer               Allocated to registers 
;bs                        Allocated to registers 
;buf                       Allocated with name '_readBoardStatusRegister_buf_1_71'
;------------------------------------------------------------
;	./lib/aes220.c:524: BYTE readBoardStatusRegister()
;	-----------------------------------------
;	 function readBoardStatusRegister
;	-----------------------------------------
_readBoardStatusRegister:
;	./lib/aes220.c:534: if (!eeprom_read(0x51, addr_buffer, bs, &buf)) return 0x00;
	mov	_eeprom_read_PARM_4,#_readBoardStatusRegister_buf_1_71
	mov	(_eeprom_read_PARM_4 + 1),#0x00
	mov	(_eeprom_read_PARM_4 + 2),#0x40
	mov	_eeprom_read_PARM_2,#0xF8
	mov	(_eeprom_read_PARM_2 + 1),#0x3D
	mov	_eeprom_read_PARM_3,#0x01
	mov	(_eeprom_read_PARM_3 + 1),#0x00
	mov	dpl,#0x51
	lcall	_eeprom_read
	mov	a,dpl
	jnz	00102$
	mov	dpl,a
	ret
00102$:
;	./lib/aes220.c:536: return buf;
	mov	dpl,_readBoardStatusRegister_buf_1_71
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
