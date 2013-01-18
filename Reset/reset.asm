;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Fri Apr  1 14:05:55 2011
;--------------------------------------------------------
	.module reset
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _handle_set_configuration
	.globl _handle_get_configuration
	.globl _handle_set_interface
	.globl _handle_get_interface
	.globl _handle_vendorcommand
	.globl _main
	.globl _eeprom_write_local
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
	.globl _buf
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
	.globl _on5
	.globl _on
	.globl _got_sud
	.globl _gotbuf
	.globl _handle_set_interface_PARM_2
	.globl _handle_get_interface_PARM_2
	.globl _eeprom_write_local_PARM_4
	.globl _eeprom_write_local_PARM_3
	.globl _eeprom_write_local_PARM_2
	.globl _lcount
	.globl _icount
	.globl _bytes
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
_bytes::
	.ds 2
_icount::
	.ds 1
_lcount::
	.ds 4
_eeprom_write_local_PARM_2:
	.ds 2
_eeprom_write_local_PARM_3:
	.ds 2
_eeprom_write_local_PARM_4:
	.ds 3
_eeprom_write_local_prom_addr_1_1:
	.ds 1
_eeprom_write_local_data_buffer_1_1:
	.ds 3
_eeprom_write_local_cur_byte_1_1:
	.ds 1
_handle_get_interface_PARM_2:
	.ds 3
_handle_set_interface_PARM_2:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
_D2ON	=	0x8800
_D2OFF	=	0x8000
_D3ON	=	0x9800
_D3OFF	=	0x9000
_D4ON	=	0xa800
_D4OFF	=	0xa000
_D5ON	=	0xb800
_D5OFF	=	0xb000
_buf::
	.ds 100
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
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
;Allocation info for local variables in function 'eeprom_write_local'
;------------------------------------------------------------
;addr                      Allocated with name '_eeprom_write_local_PARM_2'
;length                    Allocated with name '_eeprom_write_local_PARM_3'
;buf                       Allocated with name '_eeprom_write_local_PARM_4'
;prom_addr                 Allocated with name '_eeprom_write_local_prom_addr_1_1'
;addr_len                  Allocated to registers 
;data_buffer               Allocated with name '_eeprom_write_local_data_buffer_1_1'
;cur_byte                  Allocated with name '_eeprom_write_local_cur_byte_1_1'
;------------------------------------------------------------
;	reset.c:62: void eeprom_write_local(BYTE prom_addr, WORD addr, WORD length, BYTE* buf) {
;	-----------------------------------------
;	 function eeprom_write_local
;	-----------------------------------------
_eeprom_write_local:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	mov	_eeprom_write_local_prom_addr_1_1,dpl
;	reset.c:68: while ( cur_byte<length ) {
	mov	_eeprom_write_local_cur_byte_1_1,#0x00
	mov	r4,_eeprom_write_local_PARM_2
	mov	r5,(_eeprom_write_local_PARM_2 + 1)
00101$:
	mov	r6,_eeprom_write_local_cur_byte_1_1
	mov	r7,#0x00
	clr	c
	mov	a,r6
	subb	a,_eeprom_write_local_PARM_3
	mov	a,r7
	subb	a,(_eeprom_write_local_PARM_3 + 1)
	jc	00109$
	ret
00109$:
;	reset.c:70: printf ( "%d %04x:%02x\n", cur_byte, addr, buf[cur_byte]);
	mov	a,_eeprom_write_local_cur_byte_1_1
	add	a,_eeprom_write_local_PARM_4
	mov	r6,a
	clr	a
	addc	a,(_eeprom_write_local_PARM_4 + 1)
	mov	r7,a
	mov	r2,(_eeprom_write_local_PARM_4 + 2)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	lcall	__gptrget
	mov	r6,a
	mov	r2,#0x00
	mov	r7,_eeprom_write_local_cur_byte_1_1
	mov	r3,#0x00
	push	ar4
	push	ar5
	push	ar6
	push	ar2
	push	ar4
	push	ar5
	push	ar7
	push	ar3
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	pop	ar5
	pop	ar4
;	reset.c:71: data_buffer[addr_len++] = MSB(addr);
	mov	ar2,r5
	mov	_eeprom_write_local_data_buffer_1_1,r2
;	reset.c:72: data_buffer[addr_len++] = LSB(addr);
	mov	ar2,r4
	mov	(_eeprom_write_local_data_buffer_1_1 + 0x0001),r2
;	reset.c:73: data_buffer[addr_len++] = buf[cur_byte++];
	mov	r2,_eeprom_write_local_cur_byte_1_1
	inc	_eeprom_write_local_cur_byte_1_1
	mov	a,r2
	add	a,_eeprom_write_local_PARM_4
	mov	r2,a
	clr	a
	addc	a,(_eeprom_write_local_PARM_4 + 1)
	mov	r3,a
	mov	r6,(_eeprom_write_local_PARM_4 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	lcall	__gptrget
	mov	r2,a
	mov	(_eeprom_write_local_data_buffer_1_1 + 0x0002),r2
;	reset.c:74: i2c_write ( prom_addr, addr_len, data_buffer, 0, NULL );
	mov	_i2c_write_PARM_3,#_eeprom_write_local_data_buffer_1_1
	mov	(_i2c_write_PARM_3 + 1),#0x00
	mov	(_i2c_write_PARM_3 + 2),#0x40
	mov	_i2c_write_PARM_2,#0x03
	clr	a
	mov	(_i2c_write_PARM_2 + 1),a
	clr	a
	mov	_i2c_write_PARM_4,a
	mov	(_i2c_write_PARM_4 + 1),a
	mov	_i2c_write_PARM_5,a
	mov	(_i2c_write_PARM_5 + 1),a
	mov	(_i2c_write_PARM_5 + 2),a
	mov	dpl,_eeprom_write_local_prom_addr_1_1
	push	ar4
	push	ar5
	lcall	_i2c_write
	pop	ar5
	pop	ar4
;	reset.c:75: ++addr; // next byte goes to next address
	inc	r4
	cjne	r4,#0x00,00110$
	inc	r5
00110$:
	ljmp	00101$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;on                        Allocated to registers 
;size                      Allocated to registers 
;dummy                     Allocated to registers 
;i                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	reset.c:80: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	reset.c:84: LED6 = 0;
	clr	_PB0
;	reset.c:85: REVCTL=0; // not using advanced endpoint controls
	mov	dptr,#_REVCTL
	clr	a
	movx	@dptr,a
;	reset.c:88: lcount=0;
	clr	a
	mov	_lcount,a
	mov	(_lcount + 1),a
	mov	(_lcount + 2),a
	mov	(_lcount + 3),a
;	reset.c:89: got_sud=FALSE;
	clr	_got_sud
;	reset.c:90: icount=0;
	mov	_icount,#0x00
;	reset.c:91: gotbuf=FALSE;
	clr	_gotbuf
;	reset.c:92: bytes=0;
	clr	a
	mov	_bytes,a
	mov	(_bytes + 1),a
;	reset.c:95: RENUMERATE_UNCOND();
	mov	dptr,#_USBCS
	movx	a,@dptr
	orl	a,#0x0A
	movx	@dptr,a
	mov	dptr,#0x05DC
	lcall	_delay
	mov	dptr,#_USBCS
	movx	a,@dptr
	anl	a,#0xF7
	movx	@dptr,a
;	reset.c:97: SETCPUFREQ(CLK_48M);
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
;	reset.c:98: sio0_init(57600);
	mov	dptr,#0xE100
	lcall	_sio0_init
;	reset.c:100: USE_USB_INTS();
	mov	a,_INT2JT
	setb	_EUSB
	mov	dptr,#_INTSETUP
	movx	a,@dptr
	orl	a,#0x08
	movx	@dptr,a
;	reset.c:101: ENABLE_SUDAV();
	mov	dptr,#_USBIE
	movx	a,@dptr
	orl	a,#0x01
	movx	@dptr,a
;	reset.c:102: ENABLE_SOF();
	mov	dptr,#_USBIE
	movx	a,@dptr
	orl	a,#0x02
	movx	@dptr,a
;	reset.c:103: ENABLE_HISPEED();
	mov	dptr,#_USBIE
	movx	a,@dptr
	orl	a,#0x20
	movx	@dptr,a
;	reset.c:104: ENABLE_USBRESET();
	mov	dptr,#_USBIE
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x10
	movx	@dptr,a
;	reset.c:108: EP2CFG = 0xA2; // 10100010
	mov	dptr,#_EP2CFG
	mov	a,#0xA2
	movx	@dptr,a
;	reset.c:109: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:110: EP6CFG = 0xE2; // 11100010
	mov	dptr,#_EP6CFG
	mov	a,#0xE2
	movx	@dptr,a
;	reset.c:111: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:112: EP1INCFG &= ~bmVALID;
	mov	dptr,#_EP1INCFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0x7F
	movx	@dptr,a
;	reset.c:113: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:114: EP1OUTCFG &= ~bmVALID;
	mov	dptr,#_EP1OUTCFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0x7F
	movx	@dptr,a
;	reset.c:115: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:116: EP4CFG &= ~bmVALID;
	mov	dptr,#_EP4CFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0x7F
	movx	@dptr,a
;	reset.c:117: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:118: EP8CFG &= ~bmVALID;
	mov	dptr,#_EP8CFG
	movx	a,@dptr
	mov	r2,a
	anl	a,#0x7F
	movx	@dptr,a
;	reset.c:119: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:122: EP2BCL = 0x80; // write once
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	reset.c:123: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:124: EP2BCL = 0x80; // do it again
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	reset.c:126: EA=1; // global interrupt enable
	setb	_EA
;	reset.c:128: OEB |= 0x01; // set PB0 as output
	orl	_OEB,#0x01
;	reset.c:129: LED6 = 0;
	clr	_PB0
;	reset.c:131: eeprom_write_local(LG_PROM, 0, IIC_SIZE, fx2_c0);
	mov	_eeprom_write_local_PARM_4,#_fx2_c0
	mov	(_eeprom_write_local_PARM_4 + 1),#(_fx2_c0 >> 8)
	clr	a
	mov	(_eeprom_write_local_PARM_4 + 2),a
	mov	_eeprom_write_local_PARM_2,a
	mov	(_eeprom_write_local_PARM_2 + 1),a
	mov	_eeprom_write_local_PARM_3,#0x08
	clr	a
	mov	(_eeprom_write_local_PARM_3 + 1),a
	mov	dpl,#0x51
	lcall	_eeprom_write_local
;	reset.c:133: while(TRUE) {
00111$:
;	reset.c:134: if ( got_sud ) {
	jnb	_got_sud,00102$
;	reset.c:135: printf ( "Handle setupdata\n" );
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	reset.c:136: handle_setupdata();
	lcall	_handle_setupdata
;	reset.c:137: got_sud=FALSE;
	clr	_got_sud
00102$:
;	reset.c:139: if ( !(EP2468STAT & bmEP2EMPTY) ) { // EP2 received data
	mov	a,_EP2468STAT
	jb	acc.0,00106$
;	reset.c:140: if  ( !(EP2468STAT & bmEP6FULL) ) { // wait for at least one 
	mov	a,_EP2468STAT
	jb	acc.5,00106$
;	reset.c:143: bytes = MAKEWORD(EP2BCH,EP2BCL);
	mov	dptr,#_EP2BCH
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	mov	dptr,#_EP2BCL
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	orl	a,r2
	mov	_bytes,a
	mov	a,r5
	orl	a,r3
	mov	(_bytes + 1),a
;	reset.c:144: for (i=0;i<bytes;++i) {
	mov	r2,#0x00
	mov	r3,#0x00
00113$:
	clr	c
	mov	a,r2
	subb	a,_bytes
	mov	a,r3
	subb	a,(_bytes + 1)
	jnc	00106$
;	reset.c:145: EP6FIFOBUF[i] = 0x00;
	mov	dpl,r2
	mov	a,#(_EP6FIFOBUF >> 8)
	add	a,r3
	mov	dph,a
	clr	a
	movx	@dptr,a
;	reset.c:147: EP6BCH=MSB(bytes);
	mov	dptr,#_EP6BCH
	mov	a,(_bytes + 1)
	movx	@dptr,a
;	reset.c:148: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:149: EP6BCL=LSB(bytes);
	mov	r4,_bytes
	mov	a,(_bytes + 1)
	mov	r5,#0x00
	mov	dptr,#_EP6BCL
	mov	a,r4
	movx	@dptr,a
;	reset.c:150: REARM(); // re-arm ep2
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	reset.c:144: for (i=0;i<bytes;++i) {
	inc	r2
	cjne	r2,#0x00,00113$
	inc	r3
	sjmp	00113$
00106$:
;	reset.c:156: if (LED6) {LED6 = 0;} else {LED6 =1;}
	jbc	_PB0,00132$
	sjmp	00108$
00132$:
	sjmp	00111$
00108$:
	setb	_PB0
	ljmp	00111$
;------------------------------------------------------------
;Allocation info for local variables in function 'handle_vendorcommand'
;------------------------------------------------------------
;cmd                       Allocated to registers r2 
;addr                      Allocated to registers r3 r4 
;len                       Allocated to registers r5 r6 
;pep                       Allocated to registers r7 r0 
;cur_read                  Allocated to registers r7 
;cur_write                 Allocated to registers r7 
;------------------------------------------------------------
;	reset.c:165: BOOL handle_vendorcommand(BYTE cmd)  
;	-----------------------------------------
;	 function handle_vendorcommand
;	-----------------------------------------
_handle_vendorcommand:
	mov	r2,dpl
;	reset.c:167: WORD addr=SETUP_VALUE(),len=SETUP_LENGTH();
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r6,#0x00
	orl	ar3,a
	mov	a,r6
	orl	ar4,a
	mov	dptr,#(_SETUPDAT + 0x0007)
	movx	a,@dptr
	mov	r6,a
	mov	r5,#0x00
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	mov	r7,a
	mov	r0,#0x00
	orl	ar5,a
	mov	a,r0
	orl	ar6,a
;	reset.c:169: switch ( cmd ) {
	cjne	r2,#0xB0,00143$
	sjmp	00101$
00143$:
	cjne	r2,#0xB1,00144$
	sjmp	00104$
00144$:
	ljmp	00123$
;	reset.c:171: case VC_EPSTAT:
00101$:
;	reset.c:173: xdata BYTE* pep= ep_addr(SETUPDAT[2]);
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	dpl,a
	lcall	_ep_addr
	mov	r7,dpl
	mov	r0,dph
;	reset.c:174: if (pep) {
	mov	a,r7
	orl	a,r0
	jnz	00145$
	ljmp	00124$
00145$:
;	reset.c:175: EP0BUF[0] = *pep;
	mov	dpl,r7
	mov	dph,r0
	movx	a,@dptr
	mov	dptr,#_EP0BUF
	movx	@dptr,a
;	reset.c:176: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	reset.c:177: EP0BCL=1;
	mov	dptr,#_EP0BCL
	mov	a,#0x01
	movx	@dptr,a
;	reset.c:178: return TRUE;
	mov	dpl,#0x01
	ret
;	reset.c:182: case VC_EEPROM:
00104$:
;	reset.c:185: switch (SETUP_TYPE) {
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x40,00146$
	sjmp	00118$
00146$:
	cjne	r7,#0xC0,00147$
	sjmp	00148$
00147$:
	ljmp	00121$
00148$:
;	reset.c:187: while (len) { // still have bytes to read
00109$:
	mov	a,r5
	orl	a,r6
	jnz	00149$
	ljmp	00122$
00149$:
;	reset.c:189: BYTE cur_read = len > 64 ? 64 : len; 
	clr	c
	mov	a,#0x40
	subb	a,r5
	clr	a
	subb	a,r6
	jnc	00127$
	mov	r7,#0x40
	mov	r0,#0x00
	sjmp	00128$
00127$:
	mov	ar7,r5
	mov	ar0,r6
00128$:
;	reset.c:190: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
00106$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r0,a
	jb	acc.1,00106$
;	reset.c:191: eeprom_read(0x51, addr, cur_read, EP0BUF );
	mov	_eeprom_read_PARM_3,r7
	mov	(_eeprom_read_PARM_3 + 1),#0x00
	mov	_eeprom_read_PARM_4,#_EP0BUF
	mov	(_eeprom_read_PARM_4 + 1),#(_EP0BUF >> 8)
	mov	(_eeprom_read_PARM_4 + 2),#0x00
	mov	_eeprom_read_PARM_2,r3
	mov	(_eeprom_read_PARM_2 + 1),r4
	mov	dpl,#0x51
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_eeprom_read
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
;	reset.c:192: EP0BCH=0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	reset.c:193: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:194: EP0BCL=cur_read;
	mov	dptr,#_EP0BCL
	mov	a,r7
	movx	@dptr,a
;	reset.c:195: len -= cur_read;
	mov	r0,#0x00
	mov	a,r5
	clr	c
	subb	a,r7
	mov	r5,a
	mov	a,r6
	subb	a,r0
	mov	r6,a
;	reset.c:196: addr += cur_read;
	mov	a,r7
	add	a,r3
	mov	r3,a
	mov	a,r0
	addc	a,r4
	mov	r4,a
;	reset.c:200: while (len) {
	sjmp	00109$
00118$:
	mov	a,r5
	orl	a,r6
	jz	00122$
;	reset.c:202: EP0BCL = 0; // allow pc transfer in
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	reset.c:203: while(EP0CS & bmEPBUSY); // wait
00113$:
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	jb	acc.1,00113$
;	reset.c:204: cur_write=EP0BCL;
	mov	dptr,#_EP0BCL
	movx	a,@dptr
	mov	r7,a
;	reset.c:205: if ( !eeprom_write(0x51, addr, cur_write, EP0BUF ) ) return FALSE;
	mov	_eeprom_write_PARM_3,r7
	mov	(_eeprom_write_PARM_3 + 1),#0x00
	mov	_eeprom_write_PARM_4,#_EP0BUF
	mov	(_eeprom_write_PARM_4 + 1),#(_EP0BUF >> 8)
	mov	(_eeprom_write_PARM_4 + 2),#0x00
	mov	_eeprom_write_PARM_2,r3
	mov	(_eeprom_write_PARM_2 + 1),r4
	mov	dpl,#0x51
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_eeprom_write
	mov	a,dpl
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	jnz	00117$
	mov	dpl,a
	ret
00117$:
;	reset.c:206: addr += cur_write;
	mov	r0,#0x00
	mov	a,r7
	add	a,r3
	mov	r3,a
	mov	a,r0
	addc	a,r4
	mov	r4,a
;	reset.c:207: len -= cur_write;
	mov	a,r5
	clr	c
	subb	a,r7
	mov	r5,a
	mov	a,r6
	subb	a,r0
	mov	r6,a
;	reset.c:210: default:
	sjmp	00118$
00121$:
;	reset.c:211: return FALSE; // bad type
	mov	dpl,#0x00
;	reset.c:212: }
	ret
00122$:
;	reset.c:213: printf ( "All OK\n" );
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	reset.c:214: return TRUE;
	mov	dpl,#0x01
;	reset.c:217: default:
	ret
00123$:
;	reset.c:219: printf ( "Need to implement vendor command: %02x\n", cmd );
	mov	r3,#0x00
	push	ar2
	push	ar3
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	reset.c:220: return FALSE;
	mov	dpl,#0x00
;	reset.c:222: }
;	reset.c:223: return FALSE;
	ret
00124$:
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'handle_get_interface'
;------------------------------------------------------------
;alt_ifc                   Allocated with name '_handle_get_interface_PARM_2'
;ifc                       Allocated to registers r2 
;------------------------------------------------------------
;	reset.c:228: BOOL handle_get_interface(BYTE ifc, BYTE* alt_ifc) {
;	-----------------------------------------
;	 function handle_get_interface
;	-----------------------------------------
_handle_get_interface:
	mov	r2,dpl
;	reset.c:229: printf ( "Get Interface\n" );
	push	ar2
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	pop	ar2
;	reset.c:230: if (ifc==0) {*alt_ifc=0; return TRUE;} else { return FALSE;}
	mov	a,r2
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
;	reset.c:232: BOOL handle_set_interface(BYTE ifc, BYTE alt_ifc) {
;	-----------------------------------------
;	 function handle_set_interface
;	-----------------------------------------
_handle_set_interface:
	mov	r2,dpl
;	reset.c:233: printf ( "Set interface %d to alt: %d\n" , ifc, alt_ifc );
	mov	r3,_handle_set_interface_PARM_2
	mov	r4,#0x00
	mov	ar5,r2
	mov	r6,#0x00
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	pop	ar2
;	reset.c:235: if (ifc==0&&alt_ifc==0) {
	mov	a,r2
	jz	00109$
	ljmp	00102$
00109$:
	mov	a,_handle_set_interface_PARM_2
	jnz	00102$
;	reset.c:238: RESETTOGGLE(0x02);
	mov	dptr,#_TOGCTL
	mov	a,#0x02
	movx	@dptr,a
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_TOGCTL
	mov	a,#0x20
	orl	a,r2
	movx	@dptr,a
;	reset.c:239: RESETTOGGLE(0x86);
	mov	dptr,#_TOGCTL
	mov	a,#0x16
	movx	@dptr,a
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_TOGCTL
	mov	a,#0x20
	orl	a,r2
	movx	@dptr,a
;	reset.c:241: RESETFIFO(0x02);
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
;	reset.c:242: EP2BCL=0x80;
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	reset.c:243: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:244: EP2BCL=0X80;
	mov	dptr,#_EP2BCL
	mov	a,#0x80
	movx	@dptr,a
;	reset.c:245: SYNCDELAY();
	 nop 
	 nop 
	 nop 
	 nop 
;	reset.c:246: RESETFIFO(0x86);
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
;	reset.c:247: return TRUE;
	mov	dpl,#0x01
;	reset.c:249: return FALSE;
	ret
00102$:
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'handle_get_configuration'
;------------------------------------------------------------
;------------------------------------------------------------
;	reset.c:253: BYTE handle_get_configuration() {
;	-----------------------------------------
;	 function handle_get_configuration
;	-----------------------------------------
_handle_get_configuration:
;	reset.c:254: return 1;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'handle_set_configuration'
;------------------------------------------------------------
;cfg                       Allocated to registers r2 
;------------------------------------------------------------
;	reset.c:256: BOOL handle_set_configuration(BYTE cfg) {
;	-----------------------------------------
;	 function handle_set_configuration
;	-----------------------------------------
_handle_set_configuration:
	mov	r2,dpl
;	reset.c:257: return cfg==1 ? TRUE : FALSE; // we only handle cfg 1
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
;	reset.c:262: void sudav_isr() interrupt SUDAV_ISR {
;	-----------------------------------------
;	 function sudav_isr
;	-----------------------------------------
_sudav_isr:
	push	acc
	push	dpl
	push	dph
;	reset.c:263: got_sud=TRUE;
	setb	_got_sud
;	reset.c:264: CLEAR_SUDAV();
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
;	reset.c:269: void sof_isr () interrupt SOF_ISR using 1 {
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
;	reset.c:270: ++sofct;
	mov	dptr,#_sofct
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	reset.c:271: if(sofct==8000) { // about 8000 sof interrupts per second at high speed
	mov	dptr,#_sofct
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	cjne	r2,#0x40,00105$
	cjne	r3,#0x1F,00105$
;	reset.c:272: on5=!on5;
	cpl	_on5
;	reset.c:273: if (on5) {d5on();} else {d5off();}
	jnb	_on5,00102$
	 mov __XPAGE, #0xB8 
	 movx a, @r0 
	sjmp	00103$
00102$:
	 mov __XPAGE, #0xB0 
	 movx a, @r0 
00103$:
;	reset.c:274: sofct=0;
	mov	dptr,#_sofct
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
00105$:
;	reset.c:276: CLEAR_SOF();
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
;	reset.c:279: void usbreset_isr() interrupt USBRESET_ISR {
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
;	reset.c:280: handle_hispeed(FALSE);
	mov	dpl,#0x00
	lcall	_handle_hispeed
;	reset.c:281: CLEAR_USBRESET();
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
;	reset.c:283: void hispeed_isr() interrupt HISPEED_ISR {
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
;	reset.c:284: handle_hispeed(TRUE);
	mov	dpl,#0x01
	lcall	_handle_hispeed
;	reset.c:285: CLEAR_HISPEED();
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
	.area CSEG    (CODE)
	.area CONST   (CODE)
__str_0:
	.ascii "%d %04x:%02x"
	.db 0x0A
	.db 0x00
__str_1:
	.ascii "Handle setupdata"
	.db 0x0A
	.db 0x00
__str_2:
	.ascii "All OK"
	.db 0x0A
	.db 0x00
__str_3:
	.ascii "Need to implement vendor command: %02x"
	.db 0x0A
	.db 0x00
__str_4:
	.ascii "Get Interface"
	.db 0x0A
	.db 0x00
__str_5:
	.ascii "Set interface %d to alt: %d"
	.db 0x0A
	.db 0x00
	.area XINIT   (CODE)
__xinit__sofct:
	.byte #0x00,#0x00
	.area CABS    (ABS,CODE)
