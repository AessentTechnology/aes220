;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Thu Jan 10 22:15:17 2013
;--------------------------------------------------------
	.module aes220_Firmware
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _handle_set_interface_PARM_2
	.globl _handle_get_interface_PARM_2
	.globl _codeVersion
	.globl _timer0_isr
	.globl _handle_set_configuration
	.globl _handle_get_configuration
	.globl _handle_set_interface
	.globl _handle_get_interface
	.globl _handle_vendorcommand
	.globl _main
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
	.globl _sofct
	.globl _TURN3V3OFF
	.globl _prevMode
	.globl _uCMode
	.globl _fpgaStatus
	.globl _fpgaProgrammed
	.globl _programFpga
	.globl _fpgaFileLen
	.globl _lcount
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
	.globl _on5
	.globl _on
	.globl _got_sud
	.globl _gotbuf
	.globl _icount
	.globl _bytes
	.globl _CONFIGURE_FPGA
	.globl _START_CONFIG_PROC
	.globl _sudav_isr
	.globl _sof_isr
	.globl _usbreset_isr
	.globl _hispeed_isr
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
	.area REG_BANK_1	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_START_CONFIG_PROC::
	.ds 1
_CONFIGURE_FPGA::
	.ds 1
_bytes::
	.ds 2
_icount::
	.ds 1
_handle_vendorcommand_cmd_1_1:
	.ds 1
_handle_vendorcommand_addr_1_1:
	.ds 2
_handle_vendorcommand_len_1_1:
	.ds 2
_handle_vendorcommand_regAddr_3_9:
	.ds 1
_handle_vendorcommand_sloc0_1_0:
	.ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_handle_get_interface_PARM_2::
	.ds 3
	.area	OSEG    (OVR,DATA)
_handle_set_interface_PARM_2::
	.ds 1
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

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
_gotbuf::
	.ds 1
_got_sud::
	.ds 1
_on::
	.ds 1
_on5::
	.ds 1
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
_lcount::
	.ds 4
_fpgaFileLen::
	.ds 4
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_programFpga::
	.ds 1
_fpgaProgrammed::
	.ds 1
_fpgaStatus::
	.ds 1
_uCMode::
	.ds 1
_prevMode::
	.ds 1
_TURN3V3OFF::
	.ds 2
_sofct::
	.ds 2
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
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_isr
	.ds	5
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_sudav_isr
	.ds	5
	ljmp	_sof_isr
	.ds	5
	ljmp	_sutok_isr
	.ds	5
	ljmp	_suspend_isr
	.ds	5
	ljmp	_usbreset_isr
	.ds	5
	ljmp	_hispeed_isr
	.ds	5
	ljmp	_ep0ack_isr
	.ds	5
	ljmp	_ep0in_isr
	.ds	5
	ljmp	_ep0out_isr
	.ds	5
	ljmp	_ep1in_isr
	.ds	5
	ljmp	_ep1out_isr
	.ds	5
	ljmp	_ep2_isr
	.ds	5
	ljmp	_ep4_isr
	.ds	5
	ljmp	_ep6_isr
	.ds	5
	ljmp	_ep8_isr
	.ds	5
	ljmp	_ibn_isr
	.ds	5
	ljmp	_ep0ping_isr
	.ds	5
	ljmp	_ep1ping_isr
	.ds	5
	ljmp	_ep2ping_isr
	.ds	5
	ljmp	_ep4ping_isr
	.ds	5
	ljmp	_ep6ping_isr
	.ds	5
	ljmp	_ep8ping_isr
	.ds	5
	ljmp	_errlimit_isr
	.ds	5
	ljmp	_ep2isoerr_isr
	.ds	5
	ljmp	_ep4isoerr_isr
	.ds	5
	ljmp	_ep6isoerr_isr
	.ds	5
	ljmp	_ep8isoerr_isr
	.ds	5
	ljmp	_spare_isr
	.ds	5
	ljmp	_ep2pf_isr
	.ds	5
	ljmp	_ep4pf_isr
	.ds	5
	ljmp	_ep6pf_isr
	.ds	5
	ljmp	_ep8pf_isr
	.ds	5
	ljmp	_ep2ef_isr
	.ds	5
	ljmp	_ep4ef_isr
	.ds	5
	ljmp	_ep6ef_isr
	.ds	5
	ljmp	_ep8ef_isr
	.ds	5
	ljmp	_ep2ff_isr
	.ds	5
	ljmp	_ep4ff_isr
	.ds	5
	ljmp	_ep6ff_isr
	.ds	5
	ljmp	_ep8ff_isr
	.ds	5
	ljmp	_gpifdone_isr
	.ds	5
	ljmp	_gpifwf_isr
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	.//include/aes220.h:213: BOOL START_CONFIG_PROC = TRUE;
	mov	_START_CONFIG_PROC,#0x01
;	.//include/aes220.h:214: BOOL CONFIGURE_FPGA = FALSE;
	mov	_CONFIGURE_FPGA,#0x00
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;dummy                     Allocated to registers 
;------------------------------------------------------------
;	aes220_Firmware.c:163: void main() 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
;	aes220_Firmware.c:165: REVCTL=0x00; // not using advanced endpoint controls
	mov	dptr,#_REVCTL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:167: on=0; 
	clr	_on
;	aes220_Firmware.c:168: lcount=0;
	mov	dptr,#_lcount
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	aes220_Firmware.c:169: got_sud=FALSE;
	clr	_got_sud
;	aes220_Firmware.c:170: icount=0;
	mov	_icount,#0x00
;	aes220_Firmware.c:171: gotbuf=FALSE;
	clr	_gotbuf
;	aes220_Firmware.c:172: bytes=0;
	clr	a
	mov	_bytes,a
	mov	(_bytes + 1),a
;	aes220_Firmware.c:174: SETCPUFREQ(CLK_48M);
	mov	dptr,#_CPUCS
	movx	a,@dptr
	mov	r2,a
	mov	a,#0xE7
	anl	a,r2
	mov	dptr,#_CPUCS
	mov	b,a
	mov	a,#0x10
	orl	a,b
	movx	@dptr,a
;	aes220_Firmware.c:175: SETIF48MHZ();
	mov	dptr,#_IFCONFIG
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x40
	movx	@dptr,a
;	aes220_Firmware.c:181: IFCONFIG = 0b11000000; // intern. clk, 48MHz, not provided to FPGA, not
	mov	dptr,#_IFCONFIG
	mov	a,#0xC0
	movx	@dptr,a
;	aes220_Firmware.c:182: SYNCDELAY();           // inverted, port mode
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:185: OEA = 0x00;
	mov	_OEA,#0x00
;	aes220_Firmware.c:186: OEB = 0x00;
	mov	_OEB,#0x00
;	aes220_Firmware.c:187: OED = 0x81; // Set PD0/7 as outputs (SUSPEND_F, PROG_B)
	mov	_OED,#0x81
;	aes220_Firmware.c:188: LED6 = LED_ON;   // Blue LED ON
	clr	_PB0
;	aes220_Firmware.c:190: PROG_B = 0; // FPGA held in reset (hard)
	clr	_PD0
;	aes220_Firmware.c:191: SUSPEND_F = 0; // Maintain fpga suspend pin low to prevent it going in suspend mode
	clr	_PD7
;	aes220_Firmware.c:195: fpgaProgrammed = startFpga(); 
	lcall	_startFpga
	mov	a,dpl
	mov	dptr,#_fpgaProgrammed
	movx	@dptr,a
;	aes220_Firmware.c:200: OEB |= 0x01;
	orl	_OEB,#0x01
;	aes220_Firmware.c:201: OEA = 0x01;
	mov	_OEA,#0x01
;	aes220_Firmware.c:203: if (readBoardStatusRegister() == 0x00) { 
	lcall	_readBoardStatusRegister
	mov	a,dpl
	jnz	00102$
;	aes220_Firmware.c:204: LED6 = LED_OFF;   // Blue LED OFF
	setb	_PB0
;	aes220_Firmware.c:206: startWriteI2C(0x60, 2, TURN3V3OFF);
	mov	_startWriteI2C_PARM_3,#_TURN3V3OFF
	mov	(_startWriteI2C_PARM_3 + 1),#(_TURN3V3OFF >> 8)
	mov	(_startWriteI2C_PARM_3 + 2),#0x00
	mov	_startWriteI2C_PARM_2,#0x02
	clr	a
	mov	(_startWriteI2C_PARM_2 + 1),a
	mov	dpl,#0x60
	lcall	_startWriteI2C
;	aes220_Firmware.c:207: stopWriteI2C();
	lcall	_stopWriteI2C
00102$:
;	aes220_Firmware.c:210: assertSoftReset(); // Maintain the FPGA in soft reset so FPGA state machine is not enabled
	lcall	_assertSoftReset
;	aes220_Firmware.c:215: EP2CFG = 0xA2; // 10101010, valid, OUT, bulk, 512 bytes, double buffered
	mov	dptr,#_EP2CFG
	mov	a,#0xA2
	movx	@dptr,a
;	aes220_Firmware.c:216: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:217: EP6CFG = 0xE0; // 11101010, valid, IN, bulk, 512 bytes, quad buffered
	mov	dptr,#_EP6CFG
	mov	a,#0xE0
	movx	@dptr,a
;	aes220_Firmware.c:218: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:220: EP1INCFG &= ~bmVALID;
	mov	dptr,#_EP1INCFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0x7F
	movx	@dptr,a
;	aes220_Firmware.c:221: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:222: EP1OUTCFG &= ~bmVALID;
	mov	dptr,#_EP1OUTCFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0x7F
	movx	@dptr,a
;	aes220_Firmware.c:223: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:224: EP4CFG &= ~bmVALID;
	mov	dptr,#_EP4CFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0x7F
	movx	@dptr,a
;	aes220_Firmware.c:225: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:226: EP8CFG &= ~bmVALID;
	mov	dptr,#_EP8CFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0x7F
	movx	@dptr,a
;	aes220_Firmware.c:227: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:230: USE_USB_INTS();
	mov	a,_INT2JT
	setb	_EUSB
	mov	dptr,#_INTSETUP
	movx	a,@dptr
	orl	a,#0x08
	movx	@dptr,a
;	aes220_Firmware.c:231: ENABLE_SUDAV();
	mov	dptr,#_USBIE
	movx	a,@dptr
	orl	a,#0x01
	movx	@dptr,a
;	aes220_Firmware.c:232: ENABLE_SOF();
	mov	dptr,#_USBIE
	movx	a,@dptr
	orl	a,#0x02
	movx	@dptr,a
;	aes220_Firmware.c:233: ENABLE_HISPEED();
	mov	dptr,#_USBIE
	movx	a,@dptr
	orl	a,#0x20
	movx	@dptr,a
;	aes220_Firmware.c:234: ENABLE_USBRESET();
	mov	dptr,#_USBIE
	movx	a,@dptr
	orl	a,#0x10
	movx	@dptr,a
;	aes220_Firmware.c:237: SUSPEND = 10; 
	mov	dptr,#_SUSPEND
	mov	a,#0x0A
	movx	@dptr,a
;	aes220_Firmware.c:239: EA=1; // global interrupt enable
	setb	_EA
;	aes220_Firmware.c:242: RENUMERATE();
	mov	dptr,#_USBCS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00104$
	mov	dptr,#_USBCS
	movx	a,@dptr
	orl	a,#0x0A
	movx	@dptr,a
	mov	dptr,#0x05DC
	lcall	_delay
	mov	dptr,#_USBCS
	movx	a,@dptr
	mov	r2,a
	anl	a,#0xF7
	movx	@dptr,a
00104$:
;	aes220_Firmware.c:245: uCMode = PORT_MODE;
	mov	dptr,#_uCMode
	mov	a,#0xA2
	movx	@dptr,a
;	aes220_Firmware.c:247: while(TRUE) {
00129$:
;	aes220_Firmware.c:248: if ( got_sud ) {
	jnb	_got_sud,00106$
;	aes220_Firmware.c:249: handle_setupdata();
	lcall	_handle_setupdata
;	aes220_Firmware.c:250: got_sud=FALSE;
	clr	_got_sud
00106$:
;	aes220_Firmware.c:252: switch(uCMode) {
	mov	dptr,#_uCMode
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0xA1,00151$
	ljmp	00115$
00151$:
	cjne	r2,#0xA2,00152$
	sjmp	00112$
00152$:
	cjne	r2,#0xA3,00153$
	sjmp	00107$
00153$:
	cjne	r2,#0xA7,00154$
	ljmp	00116$
00154$:
	cjne	r2,#0xA8,00155$
	ljmp	00122$
00155$:
;	aes220_Firmware.c:254: case SLAVE_FIFO_MODE: 
	sjmp	00129$
00107$:
;	aes220_Firmware.c:255: if (uCMode != prevMode) { // Newly entering the mode
	mov	dptr,#_prevMode
	movx	a,@dptr
	mov	r3,a
	mov	a,r2
	cjne	a,ar3,00156$
	sjmp	00109$
00156$:
;	aes220_Firmware.c:256: prevMode = uCMode;
	mov	dptr,#_prevMode
	mov	a,r2
	movx	@dptr,a
;	aes220_Firmware.c:257: assertSoftReset();
	lcall	_assertSoftReset
;	aes220_Firmware.c:258: setMode(uCMode);
	mov	dptr,#_uCMode
	movx	a,@dptr
	mov	dpl,a
	lcall	_setMode
;	aes220_Firmware.c:259: clearSoftReset();
	lcall	_clearSoftReset
00109$:
;	aes220_Firmware.c:261: if ( !(EP2FIFOFLGS & bmEP2EMPTY) ) {
	mov	dptr,#_EP2FIFOFLGS
	movx	a,@dptr
	mov	r3,a
	jb	acc.0,00129$
;	aes220_Firmware.c:262: EP2BCH = EP2FIFOBCH; SYNCDELAY();
	mov	dptr,#_EP2FIFOBCH
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_EP2BCH
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:263: EP2BCL = EP2FIFOBCL; SYNCDELAY();
	mov	dptr,#_EP2FIFOBCL
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_EP2BCL
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:265: break; // end of case SLAVE_FIFO_MODE
;	aes220_Firmware.c:267: case PORT_MODE:
	sjmp	00129$
00112$:
;	aes220_Firmware.c:268: if (uCMode != prevMode) { // Newly entering the mode
	mov	dptr,#_prevMode
	movx	a,@dptr
	mov	r3,a
	mov	a,r2
	cjne	a,ar3,00158$
	sjmp	00129$
00158$:
;	aes220_Firmware.c:269: prevMode = uCMode;
	mov	dptr,#_prevMode
	mov	a,r2
	movx	@dptr,a
;	aes220_Firmware.c:270: assertSoftReset();
	lcall	_assertSoftReset
;	aes220_Firmware.c:271: setMode(uCMode);
	mov	dptr,#_uCMode
	movx	a,@dptr
	mov	dpl,a
	lcall	_setMode
;	aes220_Firmware.c:272: clearSoftReset();
	lcall	_clearSoftReset
;	aes220_Firmware.c:274: break; // end of case PORT_MODE
	ljmp	00129$
;	aes220_Firmware.c:276: case WAIT_MODE:
00115$:
;	aes220_Firmware.c:277: OEB |= 0x01;
	orl	_OEB,#0x01
;	aes220_Firmware.c:278: LED6 = LED_ON;
	clr	_PB0
;	aes220_Firmware.c:279: assertSoftReset(); 
	lcall	_assertSoftReset
;	aes220_Firmware.c:280: NOP;
	 nop 
;	aes220_Firmware.c:281: NOP;
	 nop 
;	aes220_Firmware.c:282: clearSoftReset();
	lcall	_clearSoftReset
;	aes220_Firmware.c:283: break; // end of case WAIT_MODE
	ljmp	00129$
;	aes220_Firmware.c:285: case CONF_F_MODE: 
00116$:
;	aes220_Firmware.c:286: if (prevMode != PORT_MODE) {
	mov	dptr,#_prevMode
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0xA2,00159$
	sjmp	00118$
00159$:
;	aes220_Firmware.c:287: setMode(PORT_MODE);
	mov	dpl,#0xA2
	lcall	_setMode
00118$:
;	aes220_Firmware.c:289: fpgaStatus = configureFpga(fpgaFileLen);
	mov	dptr,#_fpgaFileLen
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	_configureFpga
	mov	r2,dpl
	mov	dptr,#_fpgaStatus
	mov	a,r2
	movx	@dptr,a
;	aes220_Firmware.c:290: if (fpgaStatus == PROG_DONE) {
	cjne	r2,#0xAB,00120$
;	aes220_Firmware.c:291: fpgaProgrammed = TRUE;
	mov	dptr,#_fpgaProgrammed
	mov	a,#0x01
	movx	@dptr,a
	sjmp	00121$
00120$:
;	aes220_Firmware.c:294: fpgaProgrammed = FALSE;
	mov	dptr,#_fpgaProgrammed
	clr	a
	movx	@dptr,a
00121$:
;	aes220_Firmware.c:296: uCMode = WAIT_MODE; // Exit the configuration mode and wait for a new one
	mov	dptr,#_uCMode
	mov	a,#0xA1
	movx	@dptr,a
;	aes220_Firmware.c:297: prevMode = CONF_F_MODE; // Reset previous mode
	mov	dptr,#_prevMode
	mov	a,#0xA7
	movx	@dptr,a
;	aes220_Firmware.c:298: break; // end of case CONF_F_MODE
	ljmp	00129$
;	aes220_Firmware.c:300: case PROG_F_MODE: 
00122$:
;	aes220_Firmware.c:302: setMode(PORT_MODE);
	mov	dpl,#0xA2
	lcall	_setMode
;	aes220_Firmware.c:304: progFpga();
	lcall	_progFpga
;	aes220_Firmware.c:305: if (fpgaStatus == PROG_DONE) {
	mov	dptr,#_fpgaStatus
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0xAB,00124$
;	aes220_Firmware.c:306: fpgaProgrammed = TRUE;
	mov	dptr,#_fpgaProgrammed
	mov	a,#0x01
	movx	@dptr,a
	sjmp	00125$
00124$:
;	aes220_Firmware.c:308: else fpgaProgrammed = FALSE;
	mov	dptr,#_fpgaProgrammed
	clr	a
	movx	@dptr,a
00125$:
;	aes220_Firmware.c:309: uCMode = WAIT_MODE; // Exit the program mode and wait for a new one
	mov	dptr,#_uCMode
	mov	a,#0xA1
	movx	@dptr,a
;	aes220_Firmware.c:310: prevMode = PROG_F_MODE; // Reset previous mode
	mov	dptr,#_prevMode
	mov	a,#0xA8
	movx	@dptr,a
;	aes220_Firmware.c:311: break; // end of case PROG_F_MODE
;	aes220_Firmware.c:315: } // end of switch(ucMODE)
	ljmp	00129$
;------------------------------------------------------------
;Allocation info for local variables in function 'handle_vendorcommand'
;------------------------------------------------------------
;cmd                       Allocated with name '_handle_vendorcommand_cmd_1_1'
;addr                      Allocated with name '_handle_vendorcommand_addr_1_1'
;len                       Allocated with name '_handle_vendorcommand_len_1_1'
;index                     Allocated to registers r3 r4 
;pep                       Allocated to registers r6 r7 
;cur_read                  Allocated to registers r6 
;cur_write                 Allocated to registers r6 
;rv                        Allocated to registers r5 
;devAddr                   Allocated to registers r6 
;regAddr                   Allocated with name '_handle_vendorcommand_regAddr_3_9'
;curRead                   Allocated to registers r7 
;curWrite                  Allocated to registers r2 
;sloc0                     Allocated with name '_handle_vendorcommand_sloc0_1_0'
;------------------------------------------------------------
;	aes220_Firmware.c:319: BOOL handle_vendorcommand(BYTE cmd)  
;	-----------------------------------------
;	 function handle_vendorcommand
;	-----------------------------------------
_handle_vendorcommand:
	mov	_handle_vendorcommand_cmd_1_1,dpl
;	aes220_Firmware.c:321: WORD addr=SETUP_VALUE(),len=SETUP_LENGTH(), index=SETUP_INDEX();
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r6,#0x00
	orl	a,r3
	mov	_handle_vendorcommand_addr_1_1,a
	mov	a,r6
	orl	a,r4
	mov	(_handle_vendorcommand_addr_1_1 + 1),a
	mov	dptr,#(_SETUPDAT + 0x0007)
	movx	a,@dptr
	mov	r6,a
	mov	r5,#0x00
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	mov	r2,#0x00
	orl	a,r5
	mov	_handle_vendorcommand_len_1_1,a
	mov	a,r2
	orl	a,r6
	mov	(_handle_vendorcommand_len_1_1 + 1),a
	mov	dptr,#(_SETUPDAT + 0x0005)
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	mov	r3,a
	mov	r4,#0x00
	mov	a,r6
	orl	ar3,a
	mov	a,r7
	orl	ar4,a
;	aes220_Firmware.c:322: switch ( cmd ) 
	mov	a,#0xB0
	cjne	a,_handle_vendorcommand_cmd_1_1,00332$
	sjmp	00101$
00332$:
	mov	a,#0xB1
	cjne	a,_handle_vendorcommand_cmd_1_1,00333$
	sjmp	00104$
00333$:
	mov	a,#0xB2
	cjne	a,_handle_vendorcommand_cmd_1_1,00334$
	ljmp	00123$
00334$:
	mov	a,#0xB7
	cjne	a,_handle_vendorcommand_cmd_1_1,00335$
	ljmp	00210$
00335$:
	mov	a,#0xC1
	cjne	a,_handle_vendorcommand_cmd_1_1,00336$
	ljmp	00162$
00336$:
	mov	a,#0xC2
	cjne	a,_handle_vendorcommand_cmd_1_1,00337$
	ljmp	00191$
00337$:
	mov	a,#0xC3
	cjne	a,_handle_vendorcommand_cmd_1_1,00338$
	ljmp	00176$
00338$:
	mov	a,#0xC4
	cjne	a,_handle_vendorcommand_cmd_1_1,00339$
	ljmp	00221$
00339$:
	mov	a,#0xC5
	cjne	a,_handle_vendorcommand_cmd_1_1,00340$
	ljmp	00232$
00340$:
	ljmp	00243$
;	aes220_Firmware.c:325: case VC_EPSTAT:
00101$:
;	aes220_Firmware.c:327: xdata BYTE* pep= ep_addr(SETUPDAT[2]);
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	dpl,a
	lcall	_ep_addr
	mov	r6,dpl
	mov	r7,dph
;	aes220_Firmware.c:328: if (pep) {
	mov	a,r6
	orl	a,r7
	jnz	00341$
	ljmp	00244$
00341$:
;	aes220_Firmware.c:329: EP0BUF[0] = *pep;
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	dptr,#_EP0BUF
	movx	@dptr,a
;	aes220_Firmware.c:330: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:331: EP0BCL=1;
	mov	dptr,#_EP0BCL
	mov	a,#0x01
	movx	@dptr,a
;	aes220_Firmware.c:332: return TRUE;
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:337: case VC_EEPROM:
00104$:
;	aes220_Firmware.c:340: switch (SETUP_TYPE) 
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x40,00342$
	sjmp	00118$
00342$:
	cjne	r6,#0xC0,00343$
	sjmp	00344$
00343$:
	ljmp	00121$
00344$:
;	aes220_Firmware.c:344: while (len) { // still have bytes to read
00109$:
	mov	a,_handle_vendorcommand_len_1_1
	orl	a,(_handle_vendorcommand_len_1_1 + 1)
	jnz	00345$
	ljmp	00122$
00345$:
;	aes220_Firmware.c:346: BYTE cur_read = len > 64 ? 64 : len; 
	clr	c
	mov	a,#0x40
	subb	a,_handle_vendorcommand_len_1_1
	clr	a
	subb	a,(_handle_vendorcommand_len_1_1 + 1)
	jnc	00247$
	mov	r6,#0x40
	mov	r7,#0x00
	sjmp	00248$
00247$:
	mov	r6,_handle_vendorcommand_len_1_1
	mov	r7,(_handle_vendorcommand_len_1_1 + 1)
00248$:
;	aes220_Firmware.c:347: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00106$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	jb	acc.1,00106$
;	aes220_Firmware.c:348: eeprom_read(0x51, addr, cur_read, EP0BUF);
	mov	_eeprom_read_PARM_3,r6
	mov	(_eeprom_read_PARM_3 + 1),#0x00
	mov	_eeprom_read_PARM_4,#_EP0BUF
	mov	(_eeprom_read_PARM_4 + 1),#(_EP0BUF >> 8)
	mov	(_eeprom_read_PARM_4 + 2),#0x00
	mov	_eeprom_read_PARM_2,_handle_vendorcommand_addr_1_1
	mov	(_eeprom_read_PARM_2 + 1),(_handle_vendorcommand_addr_1_1 + 1)
	mov	dpl,#0x51
	push	ar6
	lcall	_eeprom_read
	pop	ar6
;	aes220_Firmware.c:349: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:350: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:351: EP0BCL=cur_read;
	mov	dptr,#_EP0BCL
	mov	a,r6
	movx	@dptr,a
;	aes220_Firmware.c:352: len -= cur_read;
	mov	r7,#0x00
	mov	a,_handle_vendorcommand_len_1_1
	clr	c
	subb	a,r6
	mov	_handle_vendorcommand_len_1_1,a
	mov	a,(_handle_vendorcommand_len_1_1 + 1)
	subb	a,r7
	mov	(_handle_vendorcommand_len_1_1 + 1),a
;	aes220_Firmware.c:353: addr += cur_read;
	mov	a,r6
	add	a,_handle_vendorcommand_addr_1_1
	mov	_handle_vendorcommand_addr_1_1,a
	mov	a,r7
	addc	a,(_handle_vendorcommand_addr_1_1 + 1)
	mov	(_handle_vendorcommand_addr_1_1 + 1),a
;	aes220_Firmware.c:358: while (len) {
	sjmp	00109$
00118$:
	mov	a,_handle_vendorcommand_len_1_1
	orl	a,(_handle_vendorcommand_len_1_1 + 1)
	jz	00122$
;	aes220_Firmware.c:360: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:361: while(EP0CS & bmEPBUSY); // wait
00113$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r6,a
	jb	acc.1,00113$
;	aes220_Firmware.c:362: cur_write=EP0BCL;
	mov	dptr,#_EP0BCL
	movx	a,@dptr
	mov	r6,a
;	aes220_Firmware.c:363: if (!writeEeprom(0x51, addr, cur_write, EP0BUF)) return FALSE;
	mov	_writeEeprom_PARM_3,r6
	mov	(_writeEeprom_PARM_3 + 1),#0x00
	mov	_writeEeprom_PARM_4,#_EP0BUF
	mov	(_writeEeprom_PARM_4 + 1),#(_EP0BUF >> 8)
	mov	(_writeEeprom_PARM_4 + 2),#0x00
	mov	_writeEeprom_PARM_2,_handle_vendorcommand_addr_1_1
	mov	(_writeEeprom_PARM_2 + 1),(_handle_vendorcommand_addr_1_1 + 1)
	mov	dpl,#0x51
	push	ar6
	lcall	_writeEeprom
	mov	a,dpl
	pop	ar6
	jnz	00117$
	mov	dpl,a
	ret
00117$:
;	aes220_Firmware.c:364: addr += cur_write;
	mov	r7,#0x00
	mov	a,r6
	add	a,_handle_vendorcommand_addr_1_1
	mov	_handle_vendorcommand_addr_1_1,a
	mov	a,r7
	addc	a,(_handle_vendorcommand_addr_1_1 + 1)
	mov	(_handle_vendorcommand_addr_1_1 + 1),a
;	aes220_Firmware.c:365: len -= cur_write;
	mov	a,_handle_vendorcommand_len_1_1
	clr	c
	subb	a,r6
	mov	_handle_vendorcommand_len_1_1,a
	mov	a,(_handle_vendorcommand_len_1_1 + 1)
	subb	a,r7
	mov	(_handle_vendorcommand_len_1_1 + 1),a
;	aes220_Firmware.c:369: default:
	sjmp	00118$
00121$:
;	aes220_Firmware.c:370: return FALSE; // bad type
	mov	dpl,#0x00
	ret
;	aes220_Firmware.c:372: }
00122$:
;	aes220_Firmware.c:373: return TRUE;
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:377: case VC_I2C:
00123$:
;	aes220_Firmware.c:381: BYTE regAddr[1] = {0x10};
	mov	_handle_vendorcommand_regAddr_3_9,#0x10
;	aes220_Firmware.c:383: devAddr = (BYTE)addr;
	mov	r6,_handle_vendorcommand_addr_1_1
;	aes220_Firmware.c:386: switch (SETUP_TYPE) 
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x40,00351$
	ljmp	00143$
00351$:
	cjne	r7,#0xC0,00352$
	sjmp	00353$
00352$:
	ljmp	00160$
00353$:
;	aes220_Firmware.c:390: if (len <= MAX_EP0_DATA) { // Short I2C transfer
	clr	c
	mov	a,#0x40
	subb	a,_handle_vendorcommand_len_1_1
	clr	a
	subb	a,(_handle_vendorcommand_len_1_1 + 1)
	jc	00128$
;	aes220_Firmware.c:391: while (EP0CS&bmEPBUSY); // Can't do this until EP0 is ready
00125$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	jb	acc.1,00125$
;	aes220_Firmware.c:392: startReadI2C((BYTE)addr, len, EP0BUF);
	mov	_startReadI2C_PARM_3,#_EP0BUF
	mov	(_startReadI2C_PARM_3 + 1),#(_EP0BUF >> 8)
	mov	(_startReadI2C_PARM_3 + 2),#0x00
	mov	_startReadI2C_PARM_2,_handle_vendorcommand_len_1_1
	mov	(_startReadI2C_PARM_2 + 1),(_handle_vendorcommand_len_1_1 + 1)
	mov	dpl,r6
	lcall	_startReadI2C
;	aes220_Firmware.c:393: stopReadI2C(len, EP0BUF);
	mov	_stopReadI2C_PARM_2,#_EP0BUF
	mov	(_stopReadI2C_PARM_2 + 1),#(_EP0BUF >> 8)
	mov	(_stopReadI2C_PARM_2 + 2),#0x00
	mov	dpl,_handle_vendorcommand_len_1_1
	mov	dph,(_handle_vendorcommand_len_1_1 + 1)
	lcall	_stopReadI2C
;	aes220_Firmware.c:394: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:395: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:396: EP0BCL=len;
	mov	dptr,#_EP0BCL
	mov	a,_handle_vendorcommand_len_1_1
	movx	@dptr,a
	ljmp	00142$
;	aes220_Firmware.c:399: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00128$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	jb	acc.1,00128$
;	aes220_Firmware.c:400: startReadI2C((BYTE)addr, MAX_EP0_DATA, EP0BUF);
	mov	_startReadI2C_PARM_3,#_EP0BUF
	mov	(_startReadI2C_PARM_3 + 1),#(_EP0BUF >> 8)
	mov	(_startReadI2C_PARM_3 + 2),#0x00
	mov	_startReadI2C_PARM_2,#0x40
	clr	a
	mov	(_startReadI2C_PARM_2 + 1),a
	mov	dpl,r6
	lcall	_startReadI2C
;	aes220_Firmware.c:401: len -= MAX_EP0_DATA;
	mov	a,_handle_vendorcommand_len_1_1
	add	a,#0xc0
	mov	_handle_vendorcommand_len_1_1,a
	mov	a,(_handle_vendorcommand_len_1_1 + 1)
	addc	a,#0xff
	mov	(_handle_vendorcommand_len_1_1 + 1),a
;	aes220_Firmware.c:402: while (len) {
00137$:
	mov	a,_handle_vendorcommand_len_1_1
	orl	a,(_handle_vendorcommand_len_1_1 + 1)
	jz	00142$
;	aes220_Firmware.c:403: BYTE curRead = len > MAX_EP0_DATA ? MAX_EP0_DATA : len;
	clr	c
	mov	a,#0x40
	subb	a,_handle_vendorcommand_len_1_1
	clr	a
	subb	a,(_handle_vendorcommand_len_1_1 + 1)
	jnc	00249$
	mov	r7,#0x40
	mov	r2,#0x00
	sjmp	00250$
00249$:
	mov	r7,_handle_vendorcommand_len_1_1
	mov	r2,(_handle_vendorcommand_len_1_1 + 1)
00250$:
;	aes220_Firmware.c:404: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00131$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00131$
;	aes220_Firmware.c:405: if (len <= MAX_EP0_DATA) {
	clr	c
	mov	a,#0x40
	subb	a,_handle_vendorcommand_len_1_1
	clr	a
	subb	a,(_handle_vendorcommand_len_1_1 + 1)
	jc	00135$
;	aes220_Firmware.c:406: stopReadI2C(len, EP0BUF);
	mov	_stopReadI2C_PARM_2,#_EP0BUF
	mov	(_stopReadI2C_PARM_2 + 1),#(_EP0BUF >> 8)
	mov	(_stopReadI2C_PARM_2 + 2),#0x00
	mov	dpl,_handle_vendorcommand_len_1_1
	mov	dph,(_handle_vendorcommand_len_1_1 + 1)
	push	ar7
	lcall	_stopReadI2C
	pop	ar7
	sjmp	00136$
00135$:
;	aes220_Firmware.c:409: readI2C(curRead, EP0BUF);
	mov	ar2,r7
	mov	r5,#0x00
	mov	_readI2C_PARM_2,#_EP0BUF
	mov	(_readI2C_PARM_2 + 1),#(_EP0BUF >> 8)
	mov	(_readI2C_PARM_2 + 2),#0x00
	mov	dpl,r2
	mov	dph,r5
	push	ar7
	lcall	_readI2C
	pop	ar7
00136$:
;	aes220_Firmware.c:411: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:412: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:413: EP0BCL=curRead;
	mov	dptr,#_EP0BCL
	mov	a,r7
	movx	@dptr,a
;	aes220_Firmware.c:414: len -= curRead;
	mov	r2,#0x00
	mov	a,_handle_vendorcommand_len_1_1
	clr	c
	subb	a,r7
	mov	_handle_vendorcommand_len_1_1,a
	mov	a,(_handle_vendorcommand_len_1_1 + 1)
	subb	a,r2
	mov	(_handle_vendorcommand_len_1_1 + 1),a
	sjmp	00137$
00142$:
;	aes220_Firmware.c:417: return rv;
	mov	dpl,#0x00
	ret
;	aes220_Firmware.c:420: case 0x40:  { // write I2C request
00143$:
;	aes220_Firmware.c:422: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:423: while(EP0CS & bmEPBUSY); // wait
00144$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00144$
;	aes220_Firmware.c:424: curWrite = EP0BCL;
	mov	dptr,#_EP0BCL
	movx	a,@dptr
	mov	r2,a
;	aes220_Firmware.c:425: rv = startWriteI2C((BYTE)addr, curWrite, EP0BUF);
	mov	_startWriteI2C_PARM_2,r2
	mov	(_startWriteI2C_PARM_2 + 1),#0x00
	mov	_startWriteI2C_PARM_3,#_EP0BUF
	mov	(_startWriteI2C_PARM_3 + 1),#(_EP0BUF >> 8)
	mov	(_startWriteI2C_PARM_3 + 2),#0x00
	mov	dpl,r6
	push	ar2
	push	ar3
	push	ar4
	lcall	_startWriteI2C
	mov	r5,dpl
	pop	ar4
	pop	ar3
	pop	ar2
;	aes220_Firmware.c:426: if (len <= MAX_EP0_DATA) { // Short I2C transfer
	clr	c
	mov	a,#0x40
	subb	a,_handle_vendorcommand_len_1_1
	clr	a
	subb	a,(_handle_vendorcommand_len_1_1 + 1)
	jc	00158$
;	aes220_Firmware.c:427: if (rv == TRUE) rv = stopWriteI2C();
	cjne	r5,#0x01,00159$
	lcall	_stopWriteI2C
	mov	r5,dpl
	sjmp	00159$
00158$:
;	aes220_Firmware.c:430: len -= curWrite;
	mov	ar6,r2
	mov	r7,#0x00
	mov	a,_handle_vendorcommand_len_1_1
	clr	c
	subb	a,r6
	mov	_handle_vendorcommand_len_1_1,a
	mov	a,(_handle_vendorcommand_len_1_1 + 1)
	subb	a,r7
	mov	(_handle_vendorcommand_len_1_1 + 1),a
;	aes220_Firmware.c:431: while(len) {
00152$:
	mov	a,_handle_vendorcommand_len_1_1
	orl	a,(_handle_vendorcommand_len_1_1 + 1)
	jz	00154$
;	aes220_Firmware.c:432: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:433: while(EP0CS & bmEPBUSY); // wait
00149$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r6,a
	jb	acc.1,00149$
;	aes220_Firmware.c:434: curWrite = EP0BCL;
	mov	dptr,#_EP0BCL
	movx	a,@dptr
;	aes220_Firmware.c:435: rv = writeI2C(curWrite, EP0BUF);
	mov	r2,a
	mov	r6,a
	mov	r7,#0x00
	mov	_writeI2C_PARM_2,#_EP0BUF
	mov	(_writeI2C_PARM_2 + 1),#(_EP0BUF >> 8)
	mov	(_writeI2C_PARM_2 + 2),#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	lcall	_writeI2C
	mov	r5,dpl
	pop	ar4
	pop	ar3
	pop	ar2
;	aes220_Firmware.c:436: len -= curWrite;
	mov	r6,#0x00
	mov	a,_handle_vendorcommand_len_1_1
	clr	c
	subb	a,r2
	mov	_handle_vendorcommand_len_1_1,a
	mov	a,(_handle_vendorcommand_len_1_1 + 1)
	subb	a,r6
	mov	(_handle_vendorcommand_len_1_1 + 1),a
	sjmp	00152$
00154$:
;	aes220_Firmware.c:438: if (index == 0) { 
	mov	a,r3
	orl	a,r4
	jnz	00159$
;	aes220_Firmware.c:439: rv = stopWriteI2C();
	lcall	_stopWriteI2C
	mov	r5,dpl
00159$:
;	aes220_Firmware.c:442: return rv;
	mov	dpl,r5
	ret
;	aes220_Firmware.c:446: default:
00160$:
;	aes220_Firmware.c:447: return FALSE; // bad type
	mov	dpl,#0x00
	ret
;	aes220_Firmware.c:454: case VC_UC_MODE:
00162$:
;	aes220_Firmware.c:456: switch (SETUP_TYPE) 
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x40,00368$
	sjmp	00167$
00368$:
	cjne	r2,#0xC0,00369$
	sjmp	00370$
00369$:
	ljmp	00174$
00370$:
;	aes220_Firmware.c:461: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00164$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00164$
;	aes220_Firmware.c:462: EP0BUF[0] = fpgaStatus;
	mov	dptr,#_fpgaStatus
	movx	a,@dptr
	mov	dptr,#_EP0BUF
	movx	@dptr,a
;	aes220_Firmware.c:463: EP0BUF[1] = uCMode;
	mov	dptr,#_uCMode
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	@dptr,a
;	aes220_Firmware.c:464: EP0BUF[2] = prevMode;
	mov	dptr,#_prevMode
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#(_EP0BUF + 0x0002)
	movx	@dptr,a
;	aes220_Firmware.c:465: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:466: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:467: EP0BCL=3;
	mov	dptr,#_EP0BCL
	mov	a,#0x03
	movx	@dptr,a
;	aes220_Firmware.c:468: return TRUE; 
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:472: case 0x40:    
00167$:
;	aes220_Firmware.c:474: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:475: while(EP0CS & bmEPBUSY); // wait
00168$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00168$
;	aes220_Firmware.c:476: uCMode = EP0BUF[0];
	mov	dptr,#_EP0BUF
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_uCMode
	movx	@dptr,a
;	aes220_Firmware.c:477: switch (uCMode)
	cjne	r2,#0xA7,00173$
;	aes220_Firmware.c:480: fpgaFileLen = MAKEDWORD(addr, index);
	mov	r2,_handle_vendorcommand_addr_1_1
	mov	r5,(_handle_vendorcommand_addr_1_1 + 1)
	mov	r6,#0x00
	mov	r7,#0x00
	mov	(_handle_vendorcommand_sloc0_1_0 + 3),r5
	mov	(_handle_vendorcommand_sloc0_1_0 + 2),r2
	mov	(_handle_vendorcommand_sloc0_1_0 + 1),#0x00
	mov	_handle_vendorcommand_sloc0_1_0,#0x00
	mov	r2,#0x00
	mov	r5,#0x00
	mov	dptr,#_fpgaFileLen
	mov	a,r3
	orl	a,_handle_vendorcommand_sloc0_1_0
	movx	@dptr,a
	mov	a,r4
	orl	a,(_handle_vendorcommand_sloc0_1_0 + 1)
	inc	dptr
	movx	@dptr,a
	mov	a,r2
	orl	a,(_handle_vendorcommand_sloc0_1_0 + 2)
	inc	dptr
	movx	@dptr,a
	mov	a,r5
	orl	a,(_handle_vendorcommand_sloc0_1_0 + 3)
	inc	dptr
	movx	@dptr,a
;	aes220_Firmware.c:485: }
00173$:
;	aes220_Firmware.c:486: return TRUE;
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:490: default:
00174$:
;	aes220_Firmware.c:491: return FALSE; // bad SETUP_TYPE
	mov	dpl,#0x00
	ret
;	aes220_Firmware.c:497: case VC_UPP_CMD:
00176$:
;	aes220_Firmware.c:499: switch (SETUP_TYPE) 
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x40,00375$
	sjmp	00181$
00375$:
	cjne	r2,#0xC0,00376$
	sjmp	00377$
00376$:
	sjmp	00189$
00377$:
;	aes220_Firmware.c:504: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00178$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00178$
;	aes220_Firmware.c:505: EP0BUF[0] = (0x00 | (PD6 << 3) |(PD5 << 2) |(PD3 << 1) | PD2) ;
	mov	c,_PD6
	clr	a
	rlc	a
	swap	a
	rr	a
	anl	a,#0xf8
	mov	r2,a
	mov	c,_PD5
	clr	a
	rlc	a
	add	a,acc
	add	a,acc
	orl	ar2,a
	mov	c,_PD3
	clr	a
	rlc	a
	add	a,acc
	orl	ar2,a
	mov	c,_PD2
	clr	a
	rlc	a
	mov	r3,a
	orl	ar2,a
	mov	dptr,#_EP0BUF
	mov	a,r2
	movx	@dptr,a
;	aes220_Firmware.c:506: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:507: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:508: EP0BCL=1;
	mov	dptr,#_EP0BCL
	mov	a,#0x01
	movx	@dptr,a
;	aes220_Firmware.c:509: return TRUE; 
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:513: case 0x40:    
00181$:
;	aes220_Firmware.c:515: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:516: while(EP0CS & bmEPBUSY); // wait
00182$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00182$
;	aes220_Firmware.c:517: switch (EP0BUF[0])
	mov	dptr,#_EP0BUF
	movx	a,@dptr
	mov	r2,a
	jz	00185$
;	aes220_Firmware.c:519: case UPP_PIN_DIR:
	cjne	r2,#0x01,00188$
	sjmp	00186$
00185$:
;	aes220_Firmware.c:520: setUserPinsDir(EP0BUF[1], EP0BUF[2]);
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#(_EP0BUF + 0x0002)
	movx	a,@dptr
	mov	_setUserPinsDir_PARM_2,a
	mov	dpl,r2
	lcall	_setUserPinsDir
;	aes220_Firmware.c:521: break;
;	aes220_Firmware.c:522: case UPP_PIN_VAL:
	sjmp	00188$
00186$:
;	aes220_Firmware.c:523: setUserPins(EP0BUF[1]);
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	a,@dptr
	mov	dpl,a
	lcall	_setUserPins
;	aes220_Firmware.c:527: }
00188$:
;	aes220_Firmware.c:528: return TRUE;
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:532: default:
00189$:
;	aes220_Firmware.c:533: return FALSE; // bad SETUP_TYPE
	mov	dpl,#0x00
	ret
;	aes220_Firmware.c:539: case VC_UC_CMD:
00191$:
;	aes220_Firmware.c:541: switch (SETUP_TYPE) 
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x40,00382$
	sjmp	00196$
00382$:
	cjne	r2,#0xC0,00208$
;	aes220_Firmware.c:546: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00193$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00193$
;	aes220_Firmware.c:547: return TRUE; 
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:551: case 0x40:    
00196$:
;	aes220_Firmware.c:553: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:554: while(EP0CS & bmEPBUSY); // wait
00197$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00197$
;	aes220_Firmware.c:556: switch (EP0BUF[0]) 
	mov	dptr,#_EP0BUF
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x01,00387$
	sjmp	00201$
00387$:
	cjne	r2,#0x02,00388$
	sjmp	00202$
00388$:
	cjne	r2,#0x03,00389$
	sjmp	00200$
00389$:
	cjne	r2,#0x04,00390$
	sjmp	00203$
00390$:
	cjne	r2,#0x09,00391$
	sjmp	00204$
00391$:
;	aes220_Firmware.c:558: case SLEEP_U:
	cjne	r2,#0x10,00206$
	sjmp	00205$
00200$:
;	aes220_Firmware.c:561: WAKEUPCS = bmWU | bmWUEN;
	mov	dptr,#_WAKEUPCS
	mov	a,#0x41
	movx	@dptr,a
;	aes220_Firmware.c:562: PCON = 0x01;
	mov	_PCON,#0x01
;	aes220_Firmware.c:563: break; // end of case SLEEP_U
;	aes220_Firmware.c:565: case SLEEP_F:
	sjmp	00207$
00201$:
;	aes220_Firmware.c:566: OED |= 0x80; // PD7 (suspend pin) as output
	orl	_OED,#0x80
;	aes220_Firmware.c:567: SUSPEND_F = 1;
	setb	_PD7
;	aes220_Firmware.c:568: break; // end of case SLEEP_F
;	aes220_Firmware.c:570: case WAKE_F:
	sjmp	00207$
00202$:
;	aes220_Firmware.c:571: OED |= 0x80; // PD7 (suspend pin) as output
	orl	_OED,#0x80
;	aes220_Firmware.c:572: SUSPEND_F = 0;
	clr	_PD7
;	aes220_Firmware.c:573: break; // end of case WAKE_F
;	aes220_Firmware.c:575: case FLASH_F:
	sjmp	00207$
00203$:
;	aes220_Firmware.c:576: setupFpgaProg();
	lcall	_setupFpgaProg
;	aes220_Firmware.c:577: break; // end of case FLASH_F
;	aes220_Firmware.c:579: case ASSERT_SOFT_RESET:
	sjmp	00207$
00204$:
;	aes220_Firmware.c:580: assertSoftReset();
	lcall	_assertSoftReset
;	aes220_Firmware.c:581: break; // end of case ASSERT_SOFT_RESET
;	aes220_Firmware.c:583: case CLEAR_SOFT_RESET:
	sjmp	00207$
00205$:
;	aes220_Firmware.c:584: clearSoftReset();
	lcall	_clearSoftReset
;	aes220_Firmware.c:585: break; // end of case CLEAR_SOFT_RESET
;	aes220_Firmware.c:587: default: 
	sjmp	00207$
00206$:
;	aes220_Firmware.c:588: return FALSE;
	mov	dpl,#0x00
	ret
;	aes220_Firmware.c:590: }
00207$:
;	aes220_Firmware.c:591: return TRUE;
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:594: default:
00208$:
;	aes220_Firmware.c:595: return FALSE; // bad SETUP_TYPE
	mov	dpl,#0x00
	ret
;	aes220_Firmware.c:601: case VC_FIFO_DEBUG:
00210$:
;	aes220_Firmware.c:603: switch (SETUP_TYPE) 
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x40,00393$
	ljmp	00215$
00393$:
	cjne	r2,#0xC0,00394$
	sjmp	00395$
00394$:
	ljmp	00219$
00395$:
;	aes220_Firmware.c:608: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00212$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00212$
;	aes220_Firmware.c:609: EP0BUF[0] = IFCONFIG;
	mov	dptr,#_IFCONFIG
	movx	a,@dptr
	mov	dptr,#_EP0BUF
	movx	@dptr,a
;	aes220_Firmware.c:610: EP0BUF[1] = EP2468STAT;
	mov	dptr,#(_EP0BUF + 0x0001)
	mov	a,_EP2468STAT
	movx	@dptr,a
;	aes220_Firmware.c:611: EP0BUF[2] = EP2CFG;
	mov	dptr,#_EP2CFG
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0002)
	movx	@dptr,a
;	aes220_Firmware.c:612: EP0BUF[3] = EP2CS;
	mov	dptr,#_EP2CS
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0003)
	movx	@dptr,a
;	aes220_Firmware.c:613: EP0BUF[4] = EP2FIFOFLGS;
	mov	dptr,#_EP2FIFOFLGS
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0004)
	movx	@dptr,a
;	aes220_Firmware.c:614: EP0BUF[5] = EP2FIFOBCH;
	mov	dptr,#_EP2FIFOBCH
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0005)
	movx	@dptr,a
;	aes220_Firmware.c:615: EP0BUF[6] = EP2FIFOBCL;
	mov	dptr,#_EP2FIFOBCL
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0006)
	movx	@dptr,a
;	aes220_Firmware.c:616: EP0BUF[7] = EP2BCH;
	mov	dptr,#_EP2BCH
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0007)
	movx	@dptr,a
;	aes220_Firmware.c:617: EP0BUF[8] = EP2BCL;
	mov	dptr,#_EP2BCL
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0008)
	movx	@dptr,a
;	aes220_Firmware.c:618: EP0BUF[9] = EP6CFG;
	mov	dptr,#_EP6CFG
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0009)
	movx	@dptr,a
;	aes220_Firmware.c:619: EP0BUF[10] = EP6CS;
	mov	dptr,#_EP6CS
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x000a)
	movx	@dptr,a
;	aes220_Firmware.c:620: EP0BUF[11] = EP6FIFOFLGS;
	mov	dptr,#_EP6FIFOFLGS
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x000b)
	movx	@dptr,a
;	aes220_Firmware.c:621: EP0BUF[12] = EP6FIFOBCH;
	mov	dptr,#_EP6FIFOBCH
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x000c)
	movx	@dptr,a
;	aes220_Firmware.c:622: EP0BUF[13] = EP6FIFOBCL;
	mov	dptr,#_EP6FIFOBCL
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x000d)
	movx	@dptr,a
;	aes220_Firmware.c:623: EP0BUF[14] = EP6BCH;
	mov	dptr,#_EP6BCH
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x000e)
	movx	@dptr,a
;	aes220_Firmware.c:624: EP0BUF[15] = EP6BCL;
	mov	dptr,#_EP6BCL
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#(_EP0BUF + 0x000f)
	movx	@dptr,a
;	aes220_Firmware.c:625: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:626: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:627: EP0BCL=16;
	mov	dptr,#_EP0BCL
	mov	a,#0x10
	movx	@dptr,a
;	aes220_Firmware.c:628: return TRUE; 
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:632: case 0x40:    
00215$:
;	aes220_Firmware.c:634: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:635: while(EP0CS & bmEPBUSY); // wait
00216$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00216$
;	aes220_Firmware.c:637: return TRUE;
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:641: default:
00219$:
;	aes220_Firmware.c:642: return FALSE; // bad SETUP_TYPE
	mov	dpl,#0x00
	ret
;	aes220_Firmware.c:648: case VC_FLASH_CMD:
00221$:
;	aes220_Firmware.c:650: switch (SETUP_TYPE) 
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x40,00398$
	sjmp	00226$
00398$:
	cjne	r2,#0xC0,00230$
;	aes220_Firmware.c:655: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00223$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00223$
;	aes220_Firmware.c:657: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:658: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:659: EP0BCL=len;
	mov	dptr,#_EP0BCL
	mov	a,_handle_vendorcommand_len_1_1
	movx	@dptr,a
;	aes220_Firmware.c:660: return TRUE; 
	mov	dpl,#0x01
	ret
;	aes220_Firmware.c:664: case 0x40:    
00226$:
;	aes220_Firmware.c:666: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:667: while(EP0CS & bmEPBUSY); // wait
00227$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00227$
;	aes220_Firmware.c:670: execFlashCmd(addr, len);
	mov	_execFlashCmd_PARM_2,_handle_vendorcommand_len_1_1
	mov	(_execFlashCmd_PARM_2 + 1),(_handle_vendorcommand_len_1_1 + 1)
	mov	dpl,_handle_vendorcommand_addr_1_1
	mov	dph,(_handle_vendorcommand_addr_1_1 + 1)
	lcall	_execFlashCmd
;	aes220_Firmware.c:671: return TRUE;
	mov	dpl,#0x01
;	aes220_Firmware.c:675: default:
	ret
00230$:
;	aes220_Firmware.c:676: return FALSE; // bad SETUP_TYPE
	mov	dpl,#0x00
;	aes220_Firmware.c:682: case VC_SOFT_INFO:
	ret
00232$:
;	aes220_Firmware.c:684: switch (SETUP_TYPE) 
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x40,00403$
	sjmp	00237$
00403$:
	cjne	r2,#0xC0,00241$
;	aes220_Firmware.c:688: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00234$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00234$
;	aes220_Firmware.c:689: memcpy(EP0BUF, codeVersion, sizeof(codeVersion));
	mov	_memcpy_PARM_2,#_codeVersion
	mov	(_memcpy_PARM_2 + 1),#(_codeVersion >> 8)
	mov	(_memcpy_PARM_2 + 2),#0x80
	mov	_memcpy_PARM_3,#0x03
	clr	a
	mov	(_memcpy_PARM_3 + 1),a
	mov	dptr,#_EP0BUF
	mov	b,#0x00
	lcall	_memcpy
;	aes220_Firmware.c:690: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:691: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:692: EP0BCL=len;
	mov	dptr,#_EP0BCL
	mov	a,_handle_vendorcommand_len_1_1
	movx	@dptr,a
;	aes220_Firmware.c:693: return TRUE; 
	mov	dpl,#0x01
;	aes220_Firmware.c:696: case 0x40:    
	ret
00237$:
;	aes220_Firmware.c:698: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	aes220_Firmware.c:699: while(EP0CS & bmEPBUSY); // wait
00238$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	jb	acc.1,00238$
;	aes220_Firmware.c:700: return TRUE;
	mov	dpl,#0x01
;	aes220_Firmware.c:704: default:
	ret
00241$:
;	aes220_Firmware.c:705: return FALSE; // bad SETUP_TYPE
	mov	dpl,#0x00
;	aes220_Firmware.c:743: default:
	ret
00243$:
;	aes220_Firmware.c:744: return FALSE;
	mov	dpl,#0x00
;	aes220_Firmware.c:746: } // end of case cmd
;	aes220_Firmware.c:747: return FALSE;
	ret
00244$:
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'handle_get_interface'
;------------------------------------------------------------
;alt_ifc                   Allocated with name '_handle_get_interface_PARM_2'
;ifc                       Allocated to registers r2 
;------------------------------------------------------------
;	aes220_Firmware.c:753: BOOL handle_get_interface(BYTE ifc, BYTE* alt_ifc) {
;	-----------------------------------------
;	 function handle_get_interface
;	-----------------------------------------
_handle_get_interface:
;	aes220_Firmware.c:754: if (ifc==0) {*alt_ifc=0; return TRUE;} else { return FALSE;}
	mov	a,dpl
	mov	r2,a
	jnz	00102$
	mov	r2,_handle_get_interface_PARM_2
	mov	r3,(_handle_get_interface_PARM_2 + 1)
	mov	r4,(_handle_get_interface_PARM_2 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
	mov	dpl,#0x01
	ret
00102$:
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'handle_set_interface'
;------------------------------------------------------------
;alt_ifc                   Allocated with name '_handle_set_interface_PARM_2'
;ifc                       Allocated to registers r2 
;------------------------------------------------------------
;	aes220_Firmware.c:756: BOOL handle_set_interface(BYTE ifc, BYTE alt_ifc) {
;	-----------------------------------------
;	 function handle_set_interface
;	-----------------------------------------
_handle_set_interface:
;	aes220_Firmware.c:757: if (ifc==0&&alt_ifc==0) {
	mov	a,dpl
	mov	r2,a
	jz	00109$
	ljmp	00102$
00109$:
	mov	a,_handle_set_interface_PARM_2
	jnz	00102$
;	aes220_Firmware.c:760: RESETTOGGLE(0x02);
	mov	dptr,#_TOGCTL
	mov	a,#0x02
	movx	@dptr,a
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_TOGCTL
	mov	a,#0x20
	orl	a,r2
	movx	@dptr,a
;	aes220_Firmware.c:761: RESETTOGGLE(0x86);
	mov	dptr,#_TOGCTL
	mov	a,#0x16
	movx	@dptr,a
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_TOGCTL
	mov	a,#0x20
	orl	a,r2
	movx	@dptr,a
;	aes220_Firmware.c:763: RESETFIFO(0x02);
	mov	dptr,#_FIFORESET
	mov	a,#0x80
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
	mov	dptr,#_FIFORESET
	mov	a,#0x02
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
;	aes220_Firmware.c:764: EP2BCL=0x80;
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	aes220_Firmware.c:765: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:766: EP2BCL=0X80;
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	aes220_Firmware.c:767: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	aes220_Firmware.c:768: RESETFIFO(0x86);
	mov	dptr,#_FIFORESET
	mov	a,#0x80
	movx	@dptr,a
	 nop 
	 nop 
	 nop 
	 nop 
	mov	dptr,#_FIFORESET
	mov	a,#0x86
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
;	aes220_Firmware.c:769: return TRUE;
	mov	dpl,#0x01
;	aes220_Firmware.c:771: return FALSE;
	ret
00102$:
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'handle_get_configuration'
;------------------------------------------------------------
;------------------------------------------------------------
;	aes220_Firmware.c:775: BYTE handle_get_configuration() {
;	-----------------------------------------
;	 function handle_get_configuration
;	-----------------------------------------
_handle_get_configuration:
;	aes220_Firmware.c:776: return 1;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'handle_set_configuration'
;------------------------------------------------------------
;cfg                       Allocated to registers r2 
;------------------------------------------------------------
;	aes220_Firmware.c:778: BOOL handle_set_configuration(BYTE cfg) {
;	-----------------------------------------
;	 function handle_set_configuration
;	-----------------------------------------
_handle_set_configuration:
	mov	r2,dpl
;	aes220_Firmware.c:779: return cfg==1 ? TRUE : FALSE; // we only handle cfg 1
	cjne	r2,#0x01,00103$
	mov	r2,#0x01
	sjmp	00104$
00103$:
	mov	r2,#0x00
00104$:
	mov	dpl,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sudav_isr'
;------------------------------------------------------------
;------------------------------------------------------------
;	aes220_Firmware.c:784: void sudav_isr() interrupt SUDAV_ISR {
;	-----------------------------------------
;	 function sudav_isr
;	-----------------------------------------
_sudav_isr:
	push	acc
	push	dpl
	push	dph
;	aes220_Firmware.c:785: got_sud=TRUE;
	setb	_got_sud
;	aes220_Firmware.c:786: CLEAR_SUDAV();
	anl	_EXIF,#0xEF
	mov	dptr,#_USBIRQ
	mov	a,#0x01
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'sof_isr'
;------------------------------------------------------------
;------------------------------------------------------------
;	aes220_Firmware.c:791: void sof_isr () interrupt SOF_ISR using 1 {
;	-----------------------------------------
;	 function sof_isr
;	-----------------------------------------
_sof_isr:
	ar2 = 0x0a
	ar3 = 0x0b
	ar4 = 0x0c
	ar5 = 0x0d
	ar6 = 0x0e
	ar7 = 0x0f
	ar0 = 0x08
	ar1 = 0x09
	push	acc
	push	dpl
	push	dph
	push	psw
	mov	psw,#0x08
;	aes220_Firmware.c:792: ++sofct;
	mov	dptr,#_sofct
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	aes220_Firmware.c:793: if(sofct==8000) { // about 8000 sof interrupts per second at high speed
	mov	dptr,#_sofct
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	cjne	r2,#0x40,00102$
	cjne	r3,#0x1F,00102$
;	aes220_Firmware.c:794: on5=!on5;
	cpl	_on5
;	aes220_Firmware.c:795: sofct=0;
	mov	dptr,#_sofct
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
00102$:
;	aes220_Firmware.c:797: CLEAR_SOF();
	anl	_EXIF,#0xEF
	mov	dptr,#_USBIRQ
	mov	a,#0x02
	movx	@dptr,a
	pop	psw
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'usbreset_isr'
;------------------------------------------------------------
;------------------------------------------------------------
;	aes220_Firmware.c:800: void usbreset_isr() interrupt USBRESET_ISR {
;	-----------------------------------------
;	 function usbreset_isr
;	-----------------------------------------
_usbreset_isr:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	aes220_Firmware.c:801: handle_hispeed(FALSE);
	mov	dpl,#0x00
	lcall	_handle_hispeed
;	aes220_Firmware.c:802: CLEAR_USBRESET();
	anl	_EXIF,#0xEF
	mov	dptr,#_USBIRQ
	mov	a,#0x10
	movx	@dptr,a
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'hispeed_isr'
;------------------------------------------------------------
;------------------------------------------------------------
;	aes220_Firmware.c:804: void hispeed_isr() interrupt HISPEED_ISR {
;	-----------------------------------------
;	 function hispeed_isr
;	-----------------------------------------
_hispeed_isr:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	aes220_Firmware.c:805: handle_hispeed(TRUE);
	mov	dpl,#0x01
	lcall	_handle_hispeed
;	aes220_Firmware.c:806: CLEAR_HISPEED();
	anl	_EXIF,#0xEF
	mov	dptr,#_USBIRQ
	mov	a,#0x20
	movx	@dptr,a
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_isr'
;------------------------------------------------------------
;------------------------------------------------------------
;	aes220_Firmware.c:809: void timer0_isr() interrupt TF0_ISR {
;	-----------------------------------------
;	 function timer0_isr
;	-----------------------------------------
_timer0_isr:
;	aes220_Firmware.c:811: if (LED6) { LED6 = 0;} else {LED6 = 1;}
	jbc	_PB0,00107$
	sjmp	00102$
00107$:
	sjmp	00104$
00102$:
	setb	_PB0
00104$:
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
_codeVersion:
	.db #0x01
	.db #0x04
	.db #0x01
	.area XINIT   (CODE)
__xinit__programFpga:
	.db #0x00
__xinit__fpgaProgrammed:
	.db #0x00
__xinit__fpgaStatus:
	.db #0xA1
__xinit__uCMode:
	.db #0xA1
__xinit__prevMode:
	.db #0xA1
__xinit__TURN3V3OFF:
	.db #0x10
	.db #0x71
__xinit__sofct:
	.byte #0x00,#0x00
	.area CABS    (ABS,CODE)
