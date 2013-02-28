;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Thu Feb 28 13:14:40 2013
;--------------------------------------------------------
	.module aes220
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _setUserPinsDir_PARM_2
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
	.globl _D5OFF
	.globl _D5ON
	.globl _D4OFF
	.globl _D4ON
	.globl _D3OFF
	.globl _D3ON
	.globl _D2OFF
	.globl _D2ON
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
	.globl _CONFIGURE_FPGA
	.globl _START_CONFIG_PROC
	.globl _assertSoftReset
	.globl _clearSoftReset
	.globl _startFpga
	.globl _setupFpgaConf
	.globl _configureFpga
	.globl _setupFpgaProg
	.globl _progFpga
	.globl _setUserPinsDir
	.globl _setUserPins
	.globl _setMode
	.globl _writeEeprom
	.globl _execFlashCmd
	.globl _transferSpiByte
	.globl _readBoardStatusRegister
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (DATA)
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
	.area RSEG    (DATA)
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
_START_CONFIG_PROC::
	.ds 1
_CONFIGURE_FPGA::
	.ds 1
_configureFpga_dataLen_1_1:
	.ds 4
_configureFpga_bytes_1_1:
	.ds 2
_progFpga_bytes_1_1:
	.ds 2
_writeEeprom_PARM_2:
	.ds 2
_writeEeprom_PARM_3:
	.ds 2
_writeEeprom_PARM_4:
	.ds 3
_writeEeprom_prom_addr_1_1:
	.ds 1
_writeEeprom_addr_buffer_1_1:
	.ds 2
_writeEeprom_last_data_ptr_1_1:
	.ds 3
_execFlashCmd_PARM_2:
	.ds 2
_readBoardStatusRegister_buf_1_1:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_setUserPinsDir_PARM_2::
	.ds 1
	.area	OSEG    (OVR,DATA)
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
_D2ON	=	0x8800
_D2OFF	=	0x8000
_D3ON	=	0x9800
_D3OFF	=	0x9000
_D4ON	=	0xa800
_D4OFF	=	0xa000
_D5ON	=	0xb800
_D5OFF	=	0xb000
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
;	../include/aes220.h:213: BOOL START_CONFIG_PROC = TRUE;
	mov	_START_CONFIG_PROC,#0x01
;	../include/aes220.h:214: BOOL CONFIGURE_FPGA = FALSE;
	mov	_CONFIGURE_FPGA,#0x00
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
;------------------------------------------------------------
;	aes220.c:104: void assertSoftReset()
;	-----------------------------------------
;	 function assertSoftReset
;	-----------------------------------------
_assertSoftReset:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
;	aes220.c:106: OEA |= 0x01; // Make sure PA0 is an output
	orl	_OEA,#0x01
;	aes220.c:107: PA0 = 1; // Reset active level = 1
	setb	_PA0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'clearSoftReset'
;------------------------------------------------------------
;------------------------------------------------------------
;	aes220.c:110: void clearSoftReset()
;	-----------------------------------------
;	 function clearSoftReset
;	-----------------------------------------
_clearSoftReset:
;	aes220.c:112: OEA |= 0x01; // Make sure PA0 is an output
	orl	_OEA,#0x01
;	aes220.c:113: PA0 = 0; // Reset active level = 1
	clr	_PA0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'startFpga'
;------------------------------------------------------------
;fpgaProgd                 Allocated to registers r2 
;------------------------------------------------------------
;	aes220.c:116: BOOL startFpga() 
;	-----------------------------------------
;	 function startFpga
;	-----------------------------------------
_startFpga:
;	aes220.c:123: OEA = 0x00;
	mov	_OEA,#0x00
;	aes220.c:124: OEB = 0b11101111; // set PB0/1/2/3/5/6/7 as outputs
	mov	_OEB,#0xEF
;	aes220.c:125: OED = 0b10001101; // set PD0/2/3/7 as outputs
	mov	_OED,#0x8D
;	aes220.c:126: SUSPEND_F = 0;
	clr	_PD7
;	aes220.c:127: PROG_B = 0; // Reset the FPGA (hard reset)
	clr	_PD0
;	aes220.c:131: M2 = 0; 
	clr	_PB1
;	aes220.c:132: M1 = 1;
	setb	_PB5
;	aes220.c:133: M0 = 1;
	setb	_PB3
;	aes220.c:134: VS2 = 1;
	setb	_PB2
;	aes220.c:135: VS1 = 1;
	setb	_PB7
;	aes220.c:136: VS0 = 1;
	setb	_PB6
;	aes220.c:137: while (INIT_B != 0) {};
00101$:
	jb	_PD5,00101$
;	aes220.c:138: PROG_B = 1; // release reset (hard)
	setb	_PD0
;	aes220.c:140: while (INIT_B != 1) {}; // wait for fpga to do its houskeeping
00104$:
	jnb	_PD5,00104$
;	aes220.c:143: delay(200); // 200ms increased from 100ms or aes220b uC hangs
	mov	dptr,#0x00C8
	lcall	_delay
;	aes220.c:145: if (DONE == 1) { fpgaProgd = TRUE; }
	jnb	_PD1,00108$
	mov	r2,#0x01
	sjmp	00109$
00108$:
;	aes220.c:146: else { fpgaProgd = FALSE; } // Blank Flash or problem during config
	mov	r2,#0x00
00109$:
;	aes220.c:150: OEA = 0x00; // Port A as input
	mov	_OEA,#0x00
;	aes220.c:151: OEB = 0x00; // Port B as input
	mov	_OEB,#0x00
;	aes220.c:152: OED = 0x81; // Port D as input save for PROG_B and SUSPEND_F
	mov	_OED,#0x81
;	aes220.c:153: PROG_B = 1;
	setb	_PD0
;	aes220.c:154: SUSPEND_F = 0;
	clr	_PD7
;	aes220.c:156: return fpgaProgd;
	mov	dpl,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setupFpgaConf'
;------------------------------------------------------------
;fpgaStatus                Allocated to registers r2 
;------------------------------------------------------------
;	aes220.c:159: BYTE setupFpgaConf() 
;	-----------------------------------------
;	 function setupFpgaConf
;	-----------------------------------------
_setupFpgaConf:
;	aes220.c:164: OED = 0xC5; // set PD0/2/6/7 as outputs, the rest as inputs
	mov	_OED,#0xC5
;	aes220.c:165: SUSPEND_F = 0;
	clr	_PD7
;	aes220.c:166: PROG_B = 0; // Reset the FPGA
	clr	_PD0
;	aes220.c:167: OEA = 0xFF; // set port A as outputs (SelectMAP data bus)
	mov	_OEA,#0xFF
;	aes220.c:168: OEB = 0xFF; // set port B as outputs
	mov	_OEB,#0xFF
;	aes220.c:170: INIT_B = 1;
	setb	_PD5
;	aes220.c:171: RDWRB  = 1;
	setb	_PB4
;	aes220.c:172: CSI_B  = 1;    // Chip select signal set permanently to 0 (one 
	setb	_PD2
;	aes220.c:174: CCLK  = 0;    // sets CCLK low
	clr	_PD6
;	aes220.c:176: M2    = 1;    // M2 = 1 for SelectMap mode 
	setb	_PB1
;	aes220.c:177: M1    = 1;    // M1 = 1 for SelectMap mode
	setb	_PB5
;	aes220.c:178: M0    = 0;    // M0 = 0 for SelectMap mode
	clr	_PB3
;	aes220.c:181: delay(500); // 500ms
	mov	dptr,#0x01F4
	lcall	_delay
;	aes220.c:182: while (INIT_B != 0) {}; // wait for INIT_B to go low
00101$:
	jb	_PD5,00101$
;	aes220.c:183: PROG_B = 1;             // PROG_B back up
	setb	_PD0
;	aes220.c:184: while (INIT_B != 1) {}; // Wait for INIT_B to do the same
00104$:
	jnb	_PD5,00104$
;	aes220.c:185: RDWRB = 0; // select write mode
	clr	_PB4
;	aes220.c:186: CSI_B = 0;  // assert chip select
	clr	_PD2
;	aes220.c:187: delay(500);
	mov	dptr,#0x01F4
	lcall	_delay
;	aes220.c:188: if (DONE == 0) {fpgaStatus = F_READY;}
	jb	_PD1,00108$
	mov	r2,#0xAD
	sjmp	00109$
00108$:
;	aes220.c:189: else fpgaStatus = F_NOT_READY;
	mov	r2,#0xB3
00109$:
;	aes220.c:190: return fpgaStatus;
	mov	dpl,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'configureFpga'
;------------------------------------------------------------
;dataLen                   Allocated with name '_configureFpga_dataLen_1_1'
;fpgaStatus                Allocated to registers r6 
;bytes                     Allocated with name '_configureFpga_bytes_1_1'
;i                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	aes220.c:193: BYTE configureFpga(DWORD dataLen)
;	-----------------------------------------
;	 function configureFpga
;	-----------------------------------------
_configureFpga:
	mov	_configureFpga_dataLen_1_1,dpl
	mov	(_configureFpga_dataLen_1_1 + 1),dph
	mov	(_configureFpga_dataLen_1_1 + 2),b
	mov	(_configureFpga_dataLen_1_1 + 3),a
;	aes220.c:198: fpgaStatus = setupFpgaConf();
	lcall	_setupFpgaConf
	mov	r6,dpl
;	aes220.c:200: if (fpgaStatus == F_READY) {
	cjne	r6,#0xAD,00127$
	sjmp	00128$
00127$:
	ljmp	00112$
00128$:
;	aes220.c:201: while(dataLen > 0) { 
00105$:
	mov	a,_configureFpga_dataLen_1_1
	orl	a,(_configureFpga_dataLen_1_1 + 1)
	orl	a,(_configureFpga_dataLen_1_1 + 2)
	orl	a,(_configureFpga_dataLen_1_1 + 3)
	jz	00107$
;	aes220.c:202: if ( !(EP2468STAT & bmEP2EMPTY) ) { // EP2 received data
	mov	a,_EP2468STAT
	jb	acc.0,00105$
;	aes220.c:206: bytes = MAKEWORD(EP2BCH,EP2BCL);
	mov	dptr,#_EP2BCH
	movx	a,@dptr
	mov	r0,a
	mov	r7,#0x00
	mov	dptr,#_EP2BCL
	movx	a,@dptr
	mov	r1,a
	mov	r2,#0x00
	orl	a,r7
	mov	_configureFpga_bytes_1_1,a
	mov	a,r2
	orl	a,r0
	mov	(_configureFpga_bytes_1_1 + 1),a
;	aes220.c:208: for (i=0;i<bytes;++i) {
	mov	r2,#0x00
	mov	r3,#0x00
00113$:
	clr	c
	mov	a,r2
	subb	a,_configureFpga_bytes_1_1
	mov	a,r3
	subb	a,(_configureFpga_bytes_1_1 + 1)
	jnc	00116$
;	aes220.c:209: IOA = EP2FIFOBUF[i]; // output the byte on port A
	mov	dpl,r2
	mov	a,#(_EP2FIFOBUF >> 8)
	add	a,r3
	mov	dph,a
	movx	a,@dptr
	mov	_IOA,a
;	aes220.c:210: CCLK = 0;     // tick the clock (low)
	clr	_PD6
;	aes220.c:211: LED6 = 1;     // flash the LED, why not?
	setb	_PB0
;	aes220.c:212: CCLK = 1;     // tick the clock (high)
	setb	_PD6
;	aes220.c:213: LED6 = 0;     // keep flashing this LED
	clr	_PB0
;	aes220.c:208: for (i=0;i<bytes;++i) {
	inc	r2
	cjne	r2,#0x00,00113$
	inc	r3
	sjmp	00113$
00116$:
;	aes220.c:215: dataLen -= bytes;
	mov	r2,_configureFpga_bytes_1_1
	mov	r3,(_configureFpga_bytes_1_1 + 1)
	clr	a
	mov	r4,a
	mov	r5,a
	mov	a,_configureFpga_dataLen_1_1
	clr	c
	subb	a,r2
	mov	_configureFpga_dataLen_1_1,a
	mov	a,(_configureFpga_dataLen_1_1 + 1)
	subb	a,r3
	mov	(_configureFpga_dataLen_1_1 + 1),a
	mov	a,(_configureFpga_dataLen_1_1 + 2)
	subb	a,r4
	mov	(_configureFpga_dataLen_1_1 + 2),a
	mov	a,(_configureFpga_dataLen_1_1 + 3)
	subb	a,r5
	mov	(_configureFpga_dataLen_1_1 + 3),a
;	aes220.c:216: if ( (INIT_B == 0) & (DONE == 0) ) {
	mov	c,_PD5
	cpl	c
	clr	a
	rlc	a
	mov	r2,a
	mov	c,_PD1
	cpl	c
	clr	a
	rlc	a
	mov	r3,a
	anl	a,r2
	jz	00102$
;	aes220.c:218: LED6 = 1; // turn LED off
	setb	_PB0
;	aes220.c:219: return fpgaStatus;
	mov	dpl,#0xB0
	ret
00102$:
;	aes220.c:222: REARM();
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
	ljmp	00105$
00107$:
;	aes220.c:226: if (DONE == 1) {
	jnb	_PD1,00109$
;	aes220.c:228: OEA = 0x00; // Port A as input
	mov	_OEA,#0x00
;	aes220.c:229: assertSoftReset(); // keep soft_reset at one (active)
	lcall	_assertSoftReset
;	aes220.c:231: CSI_B = 1;  // release chip select
	setb	_PD2
;	aes220.c:232: RDWRB = 1; // release write mode
	setb	_PB4
;	aes220.c:235: OEB = 0x00; // Port B as input
	mov	_OEB,#0x00
;	aes220.c:236: OED = 0x81; // Port D as input save for PROG_B and SUSPEND_F
	mov	_OED,#0x81
;	aes220.c:237: fpgaStatus = PROG_DONE;
	mov	r6,#0xAB
	sjmp	00112$
00109$:
;	aes220.c:239: else fpgaStatus = DONE_LOW;
	mov	r6,#0xB2
00112$:
;	aes220.c:241: return fpgaStatus;
	mov	dpl,r6
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setupFpgaProg'
;------------------------------------------------------------
;------------------------------------------------------------
;	aes220.c:244: void setupFpgaProg() 
;	-----------------------------------------
;	 function setupFpgaProg
;	-----------------------------------------
_setupFpgaProg:
;	aes220.c:249: OEA = 0x00; // set port A as inputs
	mov	_OEA,#0x00
;	aes220.c:250: OEB = 0xFF; // set port B as outputs
	mov	_OEB,#0xFF
;	aes220.c:251: OED = 0b10001101; // set PD0, PD2, PD3 and PD7 as outputs
	mov	_OED,#0x8D
;	aes220.c:252: SUSPEND_F = 0;
	clr	_PD7
;	aes220.c:254: PROG_B = 1;
	setb	_PD0
;	aes220.c:255: LOAD_B = 1;    // Shift register load signal set to 1
	setb	_PD2
;	aes220.c:256: CS_B   = 1;    // Chip select signal set to 1
	setb	_PD3
;	aes220.c:257: fpgaStatus = PROG_F_MODE;
	mov	dptr,#_fpgaStatus
	mov	a,#0xA8
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'progFpga'
;------------------------------------------------------------
;bytes                     Allocated with name '_progFpga_bytes_1_1'
;i                         Allocated to registers r2 r3 
;ctrlCode                  Allocated to registers r2 
;------------------------------------------------------------
;	aes220.c:260: BYTE progFpga()
;	-----------------------------------------
;	 function progFpga
;	-----------------------------------------
_progFpga:
;	aes220.c:264: setupFpgaProg();
	lcall	_setupFpgaProg
;	aes220.c:265: if (fpgaStatus != PROG_F_MODE) return 1;
	mov	dptr,#_fpgaStatus
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0xA8,00148$
	sjmp	00113$
00148$:
	mov	dpl,#0x01
	ret
;	aes220.c:266: while(fpgaStatus != PROG_DONE) { 
00113$:
	mov	dptr,#_fpgaStatus
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0xAB,00149$
	ljmp	00115$
00149$:
;	aes220.c:267: if ( !(EP2468STAT & bmEP2EMPTY)) {
	mov	a,_EP2468STAT
	jb	acc.0,00113$
;	aes220.c:271: bytes = MAKEWORD(EP2BCH,EP2BCL);
	mov	dptr,#_EP2BCH
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	mov	dptr,#_EP2BCL
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	orl	a,r2
	mov	_progFpga_bytes_1_1,a
	mov	a,r5
	orl	a,r3
	mov	(_progFpga_bytes_1_1 + 1),a
;	aes220.c:273: ctrlCode = EP2FIFOBUF[0];
	mov	dptr,#_EP2FIFOBUF
	movx	a,@dptr
	mov	r2,a
;	aes220.c:274: switch (ctrlCode) {
	cjne	r2,#0x60,00151$
	sjmp	00103$
00151$:
	cjne	r2,#0x61,00152$
	sjmp	00104$
00152$:
	cjne	r2,#0x62,00153$
	sjmp	00105$
00153$:
	cjne	r2,#0xAF,00154$
	ljmp	00106$
00154$:
	ljmp	00109$
;	aes220.c:275: case STATUS_CHECK:
00103$:
;	aes220.c:276: CS_B = 0;    // Enable flash
	clr	_PD3
;	aes220.c:277: LOAD_B = 0;
	clr	_PD2
;	aes220.c:278: IOB = 0xD7;  // Write the value on port B
	mov	_IOB,#0xD7
;	aes220.c:279: LOAD_B = 1;
	setb	_PD2
;	aes220.c:280: IOB = 0x55;  // Write a dummy value to flush out status byte from flash
	mov	_IOB,#0x55
;	aes220.c:281: LOAD_B = 0;
	clr	_PD2
;	aes220.c:282: LOAD_B = 1;
	setb	_PD2
;	aes220.c:283: EP6FIFOBUF[0] = IOA; // read and send value on port A back
	mov	dptr,#_EP6FIFOBUF
	mov	a,_IOA
	movx	@dptr,a
;	aes220.c:284: CS_B = 1;
	setb	_PD3
;	aes220.c:286: EP6BCH=0;
	mov	dptr,#_EP6BCH
	clr	a
	movx	@dptr,a
;	aes220.c:287: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:288: EP6BCL=1;
	mov	dptr,#_EP6BCL
	mov	a,#0x01
	movx	@dptr,a
;	aes220.c:289: break; // end of case STATUS_CHECK
	ljmp	00110$
;	aes220.c:290: case WRITE_CMD:
00104$:
;	aes220.c:291: CS_B = 0;
	clr	_PD3
;	aes220.c:292: for (i=1;i<bytes;++i) {
	mov	r2,#0x01
	mov	r3,#0x00
00116$:
	clr	c
	mov	a,r2
	subb	a,_progFpga_bytes_1_1
	mov	a,r3
	subb	a,(_progFpga_bytes_1_1 + 1)
	jnc	00119$
;	aes220.c:293: LOAD_B = 0;
	clr	_PD2
;	aes220.c:294: IOB = EP2FIFOBUF[i];
	mov	dpl,r2
	mov	a,#(_EP2FIFOBUF >> 8)
	add	a,r3
	mov	dph,a
	movx	a,@dptr
	mov	_IOB,a
;	aes220.c:295: LOAD_B = 1;
	setb	_PD2
;	aes220.c:292: for (i=1;i<bytes;++i) {
	inc	r2
	cjne	r2,#0x00,00116$
	inc	r3
	sjmp	00116$
00119$:
;	aes220.c:297: CS_B = 1;
	setb	_PD3
;	aes220.c:298: break; // end of case WRITE_CMD
;	aes220.c:299: case READ_CMD:
	sjmp	00110$
00105$:
;	aes220.c:300: CS_B = 0;
	clr	_PD3
;	aes220.c:301: for (i=1;i<bytes;++i) {
	mov	r2,#0x01
	mov	r3,#0x00
00120$:
	clr	c
	mov	a,r2
	subb	a,_progFpga_bytes_1_1
	mov	a,r3
	subb	a,(_progFpga_bytes_1_1 + 1)
	jnc	00123$
;	aes220.c:302: LOAD_B = 0;
	clr	_PD2
;	aes220.c:303: IOB = EP2FIFOBUF[i];
	mov	dpl,r2
	mov	a,#(_EP2FIFOBUF >> 8)
	add	a,r3
	mov	dph,a
	movx	a,@dptr
	mov	_IOB,a
;	aes220.c:304: LOAD_B = 1;
	setb	_PD2
;	aes220.c:301: for (i=1;i<bytes;++i) {
	inc	r2
	cjne	r2,#0x00,00120$
	inc	r3
	sjmp	00120$
00123$:
;	aes220.c:306: for (i=0;i<PAGE_SIZE;++i) {
	mov	r2,#0x00
	mov	r3,#0x00
00124$:
	clr	c
	mov	a,r2
	subb	a,#0x08
	mov	a,r3
	subb	a,#0x01
	jnc	00127$
;	aes220.c:307: LOAD_B = 0;
	clr	_PD2
;	aes220.c:308: IOB = 0xAA; // dummy byte
	mov	_IOB,#0xAA
;	aes220.c:309: LOAD_B = 1;
	setb	_PD2
;	aes220.c:310: EP6FIFOBUF[i] = IOA;
	mov	dpl,r2
	mov	a,#(_EP6FIFOBUF >> 8)
	add	a,r3
	mov	dph,a
	mov	a,_IOA
	movx	@dptr,a
;	aes220.c:306: for (i=0;i<PAGE_SIZE;++i) {
	inc	r2
	cjne	r2,#0x00,00124$
	inc	r3
	sjmp	00124$
00127$:
;	aes220.c:312: CS_B = 1;
	setb	_PD3
;	aes220.c:314: EP6BCH=MSB(PAGE_SIZE);
	mov	dptr,#_EP6BCH
	mov	a,#0x01
	movx	@dptr,a
;	aes220.c:315: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:316: EP6BCL=LSB(PAGE_SIZE);
	mov	dptr,#_EP6BCL
	mov	a,#0x08
	movx	@dptr,a
;	aes220.c:317: break; // end of case READ_CMD
;	aes220.c:318: case RESET_F:
	sjmp	00110$
00106$:
;	aes220.c:319: if (startFpga()) {
	lcall	_startFpga
	mov	a,dpl
	jz	00110$
;	aes220.c:320: fpgaStatus = PROG_DONE;
	mov	dptr,#_fpgaStatus
	mov	a,#0xAB
	movx	@dptr,a
;	aes220.c:322: break; // end of case RESET_FPGA
;	aes220.c:323: default:
	sjmp	00110$
00109$:
;	aes220.c:324: LED6 = 1 ; // D6 OFF
	setb	_PB0
;	aes220.c:326: } // end of switch
00110$:
;	aes220.c:327: REARM(); // ep2
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
	ljmp	00113$
00115$:
;	aes220.c:330: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setUserPinsDir'
;------------------------------------------------------------
;uppHDirByte               Allocated with name '_setUserPinsDir_PARM_2'
;uppLDirByte               Allocated to registers r2 
;bmOED                     Allocated to registers 
;bmOEA                     Allocated to registers 
;------------------------------------------------------------
;	aes220.c:334: void setUserPinsDir(BYTE uppLDirByte, BYTE uppHDirByte) 
;	-----------------------------------------
;	 function setUserPinsDir
;	-----------------------------------------
_setUserPinsDir:
	mov	r2,dpl
;	aes220.c:340: OED &= bmOED; // Clearing bits 2/3/5/6
	anl	_OED,#0x93
;	aes220.c:341: OEA &= bmOEA; // Clearing bits 1/3
	anl	_OEA,#0xF5
;	aes220.c:344: OED |= uppLDirByte;
	mov	a,r2
	orl	_OED,a
;	aes220.c:345: OEA |= uppHDirByte;
	mov	a,_setUserPinsDir_PARM_2
	orl	_OEA,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setUserPins'
;------------------------------------------------------------
;userPinsByte              Allocated to registers r2 
;------------------------------------------------------------
;	aes220.c:348: void setUserPins(BYTE userPinsByte) 
;	-----------------------------------------
;	 function setUserPins
;	-----------------------------------------
_setUserPins:
;	aes220.c:350: UPP0 = bmBIT0 & userPinsByte;
	mov	a,dpl
	mov	r2,a
	rrc	a
	mov	_PD2,c
;	aes220.c:351: UPP1 = bmBIT1 & userPinsByte;
	mov	a,r2
	mov	c,acc.1
	mov	_PD3,c
;	aes220.c:352: UPP2 = bmBIT2 & userPinsByte;
	mov	a,r2
	mov	c,acc.2
	mov	_PD5,c
;	aes220.c:353: UPP3 = bmBIT3 & userPinsByte;
	mov	a,r2
	mov	c,acc.3
	mov	_PD6,c
;	aes220.c:354: UPP4 = bmBIT4 & userPinsByte;
	mov	a,r2
	mov	c,acc.4
	mov	_PA1,c
;	aes220.c:355: UPP5 = bmBIT5 & userPinsByte;
	mov	a,r2
	mov	c,acc.5
	mov	_PA3,c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setMode'
;------------------------------------------------------------
;uCMode                    Allocated to registers r2 
;------------------------------------------------------------
;	aes220.c:359: void setMode(BYTE uCMode)
;	-----------------------------------------
;	 function setMode
;	-----------------------------------------
_setMode:
	mov	r2,dpl
;	aes220.c:361: switch (uCMode) {
	cjne	r2,#0xA2,00108$
	sjmp	00101$
00108$:
	cjne	r2,#0xA3,00109$
	sjmp	00102$
00109$:
	ret
;	aes220.c:363: case PORT_MODE:
00101$:
;	aes220.c:365: PORTACFG = 0x00; // otherwise PA7 = SLCS -> is maintained at '1' by the
	mov	dptr,#_PORTACFG
	clr	a
	movx	@dptr,a
;	aes220.c:366: SYNCDELAY();     // FPGA 
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:369: IFCONFIG = 0b11000000; // intern. clk, 48MHz, not provided to FPGA, not
	mov	dptr,#_IFCONFIG
	mov	a,#0xC0
	movx	@dptr,a
;	aes220.c:370: SYNCDELAY();           // inverted, port mode
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:373: EP2BCL = 0x80; // write once
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	aes220.c:374: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:375: EP2BCL = 0x80; // do it again
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	aes220.c:378: EP6BCL = 0x00; // write once
	mov	dptr,#_EP6BCL
	clr	a
	movx	@dptr,a
;	aes220.c:379: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:380: EP6BCL = 0x00; // do it again
	mov	dptr,#_EP6BCL
	clr	a
	movx	@dptr,a
;	aes220.c:383: OEA = 0x00; // Port A as input
	mov	_OEA,#0x00
;	aes220.c:384: OEB = 0x00; // Port B as input
	mov	_OEB,#0x00
;	aes220.c:385: OED = 0x81; // Port D as input save for PROG_B and SUSPEND_F
	mov	_OED,#0x81
;	aes220.c:386: PROG_B = 1;
	setb	_PD0
;	aes220.c:387: SUSPEND_F = 0;
	clr	_PD7
;	aes220.c:389: break; // end of case PORT_MODE
	ret
;	aes220.c:391: case SLAVE_FIFO_MODE:
00102$:
;	aes220.c:393: OED = 0x81;
	mov	_OED,#0x81
;	aes220.c:394: SUSPEND_F = 0;
	clr	_PD7
;	aes220.c:396: PORTACFG = 0x40; // PA7 = SLCS -> needs to be maintained at '1' by the
	mov	dptr,#_PORTACFG
	mov	a,#0x40
	movx	@dptr,a
;	aes220.c:397: SYNCDELAY();     // FPGA otherwise port D outputs set to '0' resetting
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:402: IFCONFIG = 0b01000011; // extern. clk, 48MHz, provided by FPGA, 
	mov	dptr,#_IFCONFIG
	mov	a,#0x43
	movx	@dptr,a
;	aes220.c:403: SYNCDELAY();           // not inverted clock, slave FIFO mode
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:405: OED = 0x81;
	mov	_OED,#0x81
;	aes220.c:406: SUSPEND_F = 0;
	clr	_PD7
;	aes220.c:409: FIFORESET = bmNAKALL; SYNCDELAY();
	mov	dptr,#_FIFORESET
	mov	a,#0x80
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:410: FIFORESET = bmNAKALL | 2; SYNCDELAY();
	mov	dptr,#_FIFORESET
	mov	a,#0x82
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:411: FIFORESET = bmNAKALL | 6; SYNCDELAY();
	mov	dptr,#_FIFORESET
	mov	a,#0x86
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:412: FIFORESET = 0x00; SYNCDELAY();
	mov	dptr,#_FIFORESET
	clr	a
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:415: EP2FIFOCFG = 0x00; SYNCDELAY(); // autoout=0, 8 bits wide bus (Port B)
	mov	dptr,#_EP2FIFOCFG
	clr	a
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:418: EP6FIFOCFG = 0x48; SYNCDELAY(); // Full minus one, autoIN=1, 8 bits wide bus (Port B)  
	mov	dptr,#_EP6FIFOCFG
	mov	a,#0x48
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:425: EP6AUTOINLENH = 0x02; // Send data in 512 byte chunks
	mov	dptr,#_EP6AUTOINLENH
	mov	a,#0x02
	movx	@dptr,a
;	aes220.c:426: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:427: EP6AUTOINLENL = 0x00;
	mov	dptr,#_EP6AUTOINLENL
	clr	a
	movx	@dptr,a
;	aes220.c:428: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:430: RESETFIFO(0x06);
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
;	aes220.c:431: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:434: EP4FIFOCFG &= ~0b00000001; // 8 bit wide bus (Port B) 
	mov	dptr,#_EP4FIFOCFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0xFE
	movx	@dptr,a
;	aes220.c:435: SYNCDELAY(); 
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:436: EP8FIFOCFG &= ~0b00000001; // 8 bit wide bus (Port B) 
	mov	dptr,#_EP8FIFOCFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0xFE
	movx	@dptr,a
;	aes220.c:437: SYNCDELAY(); 
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:440: FIFOPINPOLAR = 0x3D; // PKTEND, SLRD, SLWR, SLOE AND FIFO FULL active high
	mov	dptr,#_FIFOPINPOLAR
	mov	a,#0x3D
	movx	@dptr,a
;	aes220.c:441: PINFLAGSAB = 0xE0; // Flag B is EP6 FIFO full flag
	mov	dptr,#_PINFLAGSAB
	mov	a,#0xE0
	movx	@dptr,a
;	aes220.c:442: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:443: PINFLAGSCD = 0x08; // Flag C is EP2 FIFO empty flag
	mov	dptr,#_PINFLAGSCD
	mov	a,#0x08
	movx	@dptr,a
;	aes220.c:444: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220.c:446: OED = 0x81;
	mov	_OED,#0x81
;	aes220.c:447: SUSPEND_F = 0;
	clr	_PD7
;	aes220.c:455: } // end of uCMode switch
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'writeEeprom'
;------------------------------------------------------------
;addr                      Allocated with name '_writeEeprom_PARM_2'
;length                    Allocated with name '_writeEeprom_PARM_3'
;buf                       Allocated with name '_writeEeprom_PARM_4'
;prom_addr                 Allocated with name '_writeEeprom_prom_addr_1_1'
;addr_len                  Allocated to registers 
;addr_buffer               Allocated with name '_writeEeprom_addr_buffer_1_1'
;bs                        Allocated to registers r2 
;data_buffer_ptr           Allocated to registers r3 r4 r5 
;last_data_ptr             Allocated with name '_writeEeprom_last_data_ptr_1_1'
;------------------------------------------------------------
;	aes220.c:458: BOOL writeEeprom(BYTE prom_addr, WORD addr, WORD length, BYTE* buf)
;	-----------------------------------------
;	 function writeEeprom
;	-----------------------------------------
_writeEeprom:
	mov	_writeEeprom_prom_addr_1_1,dpl
;	aes220.c:463: BYTE *data_buffer_ptr = buf;
	mov	r3,_writeEeprom_PARM_4
	mov	r4,(_writeEeprom_PARM_4 + 1)
	mov	r5,(_writeEeprom_PARM_4 + 2)
;	aes220.c:464: BYTE *last_data_ptr = buf + length;
	mov	a,_writeEeprom_PARM_3
	add	a,r3
	mov	_writeEeprom_last_data_ptr_1_1,a
	mov	a,(_writeEeprom_PARM_3 + 1)
	addc	a,r4
	mov	(_writeEeprom_last_data_ptr_1_1 + 1),a
	mov	(_writeEeprom_last_data_ptr_1_1 + 2),r5
;	aes220.c:467: addr_buffer[0] = MSB(addr);
	mov	r2,(_writeEeprom_PARM_2 + 1)
	mov	_writeEeprom_addr_buffer_1_1,r2
;	aes220.c:468: addr_buffer[1] = LSB(addr);
	mov	r2,_writeEeprom_PARM_2
	mov	r6,#0x00
	mov	(_writeEeprom_addr_buffer_1_1 + 0x0001),r2
;	aes220.c:470: while ( data_buffer_ptr < last_data_ptr ) {
00106$:
	clr	c
	mov	a,r3
	subb	a,_writeEeprom_last_data_ptr_1_1
	mov	a,r4
	subb	a,(_writeEeprom_last_data_ptr_1_1 + 1)
	mov	a,r5
	subb	a,(_writeEeprom_last_data_ptr_1_1 + 2)
	jc	00115$
	ljmp	00108$
00115$:
;	aes220.c:471: if ( (last_data_ptr - data_buffer_ptr) > MAX_EEP_WRITE) { // 
	mov	a,_writeEeprom_last_data_ptr_1_1
	clr	c
	subb	a,r3
	mov	r2,a
	mov	a,(_writeEeprom_last_data_ptr_1_1 + 1)
	subb	a,r4
	mov	r6,a
	clr	c
	mov	a,#0x40
	subb	a,r2
	mov	a,#(0x00 ^ 0x80)
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jnc	00102$
;	aes220.c:472: bs = MAX_EEP_WRITE;
	mov	r2,#0x40
	sjmp	00103$
00102$:
;	aes220.c:474: else bs = last_data_ptr - data_buffer_ptr;
	mov	a,_writeEeprom_last_data_ptr_1_1
	clr	c
	subb	a,r3
	mov	r6,a
	mov	a,(_writeEeprom_last_data_ptr_1_1 + 1)
	subb	a,r4
	mov	r7,a
	mov	ar2,r6
00103$:
;	aes220.c:475: if ( ! i2c_write ( prom_addr, addr_len, addr_buffer, bs, data_buffer_ptr ) ) return FALSE;
	mov	_i2c_write_PARM_3,#_writeEeprom_addr_buffer_1_1
	mov	(_i2c_write_PARM_3 + 1),#0x00
	mov	(_i2c_write_PARM_3 + 2),#0x40
	mov	_i2c_write_PARM_4,r2
	mov	(_i2c_write_PARM_4 + 1),#0x00
	mov	_i2c_write_PARM_2,#0x02
	clr	a
	mov	(_i2c_write_PARM_2 + 1),a
	mov	_i2c_write_PARM_5,r3
	mov	(_i2c_write_PARM_5 + 1),r4
	mov	(_i2c_write_PARM_5 + 2),r5
	mov	dpl,_writeEeprom_prom_addr_1_1
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_i2c_write
	mov	a,dpl
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	jnz	00105$
	mov	dpl,a
	ret
00105$:
;	aes220.c:476: addr += bs; // More data to come so remember to increase the address
	mov	ar6,r2
	mov	r7,#0x00
	mov	a,r6
	add	a,_writeEeprom_PARM_2
	mov	_writeEeprom_PARM_2,a
	mov	a,r7
	addc	a,(_writeEeprom_PARM_2 + 1)
	mov	(_writeEeprom_PARM_2 + 1),a
;	aes220.c:477: data_buffer_ptr += bs;
	mov	a,r2
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	ljmp	00106$
00108$:
;	aes220.c:479: return TRUE;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'execFlashCmd'
;------------------------------------------------------------
;len                       Allocated with name '_execFlashCmd_PARM_2'
;cmd                       Allocated to registers r2 r3 
;i                         Allocated to registers r2 
;------------------------------------------------------------
;	aes220.c:482: void execFlashCmd(WORD cmd, WORD len)
;	-----------------------------------------
;	 function execFlashCmd
;	-----------------------------------------
_execFlashCmd:
	mov	r2,dpl
;	aes220.c:485: CS_B = 0;    // Enable SPI interface
	clr	_PD3
;	aes220.c:486: transferSpiByte((BYTE)cmd);
	mov	dpl,r2
	lcall	_transferSpiByte
;	aes220.c:487: for (i=0; i<len; i++) {
	mov	r2,#0x00
00101$:
	mov	ar3,r2
	mov	r4,#0x00
	clr	c
	mov	a,r3
	subb	a,_execFlashCmd_PARM_2
	mov	a,r4
	subb	a,(_execFlashCmd_PARM_2 + 1)
	jnc	00104$
;	aes220.c:488: EP0BUF[i] = transferSpiByte(EP0BUF[i]);
	mov	a,r2
	add	a,#_EP0BUF
	mov	r3,a
	clr	a
	addc	a,#(_EP0BUF >> 8)
	mov	r4,a
	mov	a,r2
	add	a,#_EP0BUF
	mov	dpl,a
	clr	a
	addc	a,#(_EP0BUF >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,a
	push	ar2
	push	ar3
	push	ar4
	lcall	_transferSpiByte
	mov	r5,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	mov	dpl,r3
	mov	dph,r4
	mov	a,r5
	movx	@dptr,a
;	aes220.c:487: for (i=0; i<len; i++) {
	inc	r2
	sjmp	00101$
00104$:
;	aes220.c:490: CS_B = 1;
	setb	_PD3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'transferSpiByte'
;------------------------------------------------------------
;spiByte                   Allocated to registers 
;------------------------------------------------------------
;	aes220.c:493: BYTE transferSpiByte(BYTE spiByte) 
;	-----------------------------------------
;	 function transferSpiByte
;	-----------------------------------------
_transferSpiByte:
	mov	_IOB,dpl
;	aes220.c:496: LOAD_B = 0;
	clr	_PD2
;	aes220.c:497: LOAD_B = 1;
	setb	_PD2
;	aes220.c:498: NOP;
	 nop 
;	aes220.c:499: NOP;
	 nop 
;	aes220.c:500: NOP;
	 nop 
;	aes220.c:501: return IOA;
	mov	dpl,_IOA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readBoardStatusRegister'
;------------------------------------------------------------
;addr_len                  Allocated to registers 
;addr_buffer               Allocated to registers 
;bs                        Allocated to registers 
;buf                       Allocated with name '_readBoardStatusRegister_buf_1_1'
;------------------------------------------------------------
;	aes220.c:504: BYTE readBoardStatusRegister()
;	-----------------------------------------
;	 function readBoardStatusRegister
;	-----------------------------------------
_readBoardStatusRegister:
;	aes220.c:514: if (!eeprom_read(0x51, addr_buffer, bs, &buf)) return 0x00;
	mov	_eeprom_read_PARM_4,#_readBoardStatusRegister_buf_1_1
	mov	(_eeprom_read_PARM_4 + 1),#0x00
	mov	(_eeprom_read_PARM_4 + 2),#0x40
	mov	_eeprom_read_PARM_2,#0xF8
	mov	(_eeprom_read_PARM_2 + 1),#0x3D
	mov	_eeprom_read_PARM_3,#0x01
	clr	a
	mov	(_eeprom_read_PARM_3 + 1),a
	mov	dpl,#0x51
	lcall	_eeprom_read
	mov	a,dpl
	jnz	00102$
	mov	dpl,a
;	aes220.c:516: return buf;
	ret
00102$:
	mov	dpl,_readBoardStatusRegister_buf_1_1
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
