                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
                              4 ; This file was generated Mon Apr 25 13:24:27 2011
                              5 ;--------------------------------------------------------
                              6 	.module aes220_progFpga
                              7 	.optsdcc -mmcs51 --model-small
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _handle_set_configuration
                             13 	.globl _handle_get_configuration
                             14 	.globl _handle_set_interface
                             15 	.globl _handle_get_interface
                             16 	.globl _handle_vendorcommand
                             17 	.globl _main
                             18 	.globl _EIPX6
                             19 	.globl _EIPX5
                             20 	.globl _EIPX4
                             21 	.globl _PI2C
                             22 	.globl _PUSB
                             23 	.globl _EIEX6
                             24 	.globl _EIEX5
                             25 	.globl _EIEX4
                             26 	.globl _EI2C
                             27 	.globl _EUSB
                             28 	.globl _SMOD1
                             29 	.globl _ERESI
                             30 	.globl _RESI
                             31 	.globl _INT6
                             32 	.globl _CY
                             33 	.globl _AC
                             34 	.globl _F0
                             35 	.globl _RS1
                             36 	.globl _RS0
                             37 	.globl _OV
                             38 	.globl _FL
                             39 	.globl _P
                             40 	.globl _TF2
                             41 	.globl _EXF2
                             42 	.globl _RCLK
                             43 	.globl _TCLK
                             44 	.globl _EXEN2
                             45 	.globl _TR2
                             46 	.globl _C_T2
                             47 	.globl _CP_RL2
                             48 	.globl _SM01
                             49 	.globl _SM11
                             50 	.globl _SM21
                             51 	.globl _REN1
                             52 	.globl _TB81
                             53 	.globl _RB81
                             54 	.globl _TI1
                             55 	.globl _RI1
                             56 	.globl _PS1
                             57 	.globl _PT2
                             58 	.globl _PS0
                             59 	.globl _PT1
                             60 	.globl _PX1
                             61 	.globl _PT0
                             62 	.globl _PX0
                             63 	.globl _PD7
                             64 	.globl _PD6
                             65 	.globl _PD5
                             66 	.globl _PD4
                             67 	.globl _PD3
                             68 	.globl _PD2
                             69 	.globl _PD1
                             70 	.globl _PD0
                             71 	.globl _EA
                             72 	.globl _ES1
                             73 	.globl _ET2
                             74 	.globl _ES0
                             75 	.globl _ET1
                             76 	.globl _EX1
                             77 	.globl _ET0
                             78 	.globl _EX0
                             79 	.globl _PC7
                             80 	.globl _PC6
                             81 	.globl _PC5
                             82 	.globl _PC4
                             83 	.globl _PC3
                             84 	.globl _PC2
                             85 	.globl _PC1
                             86 	.globl _PC0
                             87 	.globl _SM0
                             88 	.globl _SM1
                             89 	.globl _SM2
                             90 	.globl _REN
                             91 	.globl _TB8
                             92 	.globl _RB8
                             93 	.globl _TI
                             94 	.globl _RI
                             95 	.globl _PB7
                             96 	.globl _PB6
                             97 	.globl _PB5
                             98 	.globl _PB4
                             99 	.globl _PB3
                            100 	.globl _PB2
                            101 	.globl _PB1
                            102 	.globl _PB0
                            103 	.globl _TF1
                            104 	.globl _TR1
                            105 	.globl _TF0
                            106 	.globl _TR0
                            107 	.globl _IE1
                            108 	.globl _IT1
                            109 	.globl _IE0
                            110 	.globl _IT0
                            111 	.globl _PA7
                            112 	.globl _PA6
                            113 	.globl _PA5
                            114 	.globl _PA4
                            115 	.globl _PA3
                            116 	.globl _PA2
                            117 	.globl _PA1
                            118 	.globl _PA0
                            119 	.globl _EIP
                            120 	.globl _B
                            121 	.globl _EIE
                            122 	.globl _ACC
                            123 	.globl _EICON
                            124 	.globl _PSW
                            125 	.globl _TH2
                            126 	.globl _TL2
                            127 	.globl _RCAP2H
                            128 	.globl _RCAP2L
                            129 	.globl _T2CON
                            130 	.globl _SBUF1
                            131 	.globl _SCON1
                            132 	.globl _GPIFSGLDATLNOX
                            133 	.globl _GPIFSGLDATLX
                            134 	.globl _GPIFSGLDATH
                            135 	.globl _GPIFTRIG
                            136 	.globl _EP01STAT
                            137 	.globl _IP
                            138 	.globl _OEE
                            139 	.globl _OED
                            140 	.globl _OEC
                            141 	.globl _OEB
                            142 	.globl _OEA
                            143 	.globl _IOE
                            144 	.globl _IOD
                            145 	.globl _AUTOPTRSETUP
                            146 	.globl _EP68FIFOFLGS
                            147 	.globl _EP24FIFOFLGS
                            148 	.globl _EP2468STAT
                            149 	.globl _IE
                            150 	.globl _INT4CLR
                            151 	.globl _INT2CLR
                            152 	.globl _IOC
                            153 	.globl _AUTOPTRL2
                            154 	.globl _AUTOPTRH2
                            155 	.globl _AUTOPTRL1
                            156 	.globl _AUTOPTRH1
                            157 	.globl _SBUF0
                            158 	.globl _SCON0
                            159 	.globl __XPAGE
                            160 	.globl _EXIF
                            161 	.globl _IOB
                            162 	.globl _CKCON
                            163 	.globl _TH1
                            164 	.globl _TH0
                            165 	.globl _TL1
                            166 	.globl _TL0
                            167 	.globl _TMOD
                            168 	.globl _TCON
                            169 	.globl _PCON
                            170 	.globl _DPS
                            171 	.globl _DPH1
                            172 	.globl _DPL1
                            173 	.globl _DPH
                            174 	.globl _DPL
                            175 	.globl _SP
                            176 	.globl _IOA
                            177 	.globl _sofct
                            178 	.globl _D5OFF
                            179 	.globl _D5ON
                            180 	.globl _D4OFF
                            181 	.globl _D4ON
                            182 	.globl _D3OFF
                            183 	.globl _D3ON
                            184 	.globl _D2OFF
                            185 	.globl _D2ON
                            186 	.globl _GPCR2
                            187 	.globl _ECC2B2
                            188 	.globl _ECC2B1
                            189 	.globl _ECC2B0
                            190 	.globl _ECC1B2
                            191 	.globl _ECC1B1
                            192 	.globl _ECC1B0
                            193 	.globl _ECCRESET
                            194 	.globl _ECCCFG
                            195 	.globl _EP8FIFOBUF
                            196 	.globl _EP6FIFOBUF
                            197 	.globl _EP4FIFOBUF
                            198 	.globl _EP2FIFOBUF
                            199 	.globl _EP1INBUF
                            200 	.globl _EP1OUTBUF
                            201 	.globl _EP0BUF
                            202 	.globl _UDMACRCQUAL
                            203 	.globl _UDMACRCL
                            204 	.globl _UDMACRCH
                            205 	.globl _GPIFHOLDAMOUNT
                            206 	.globl _FLOWSTBHPERIOD
                            207 	.globl _FLOWSTBEDGE
                            208 	.globl _FLOWSTB
                            209 	.globl _FLOWHOLDOFF
                            210 	.globl _FLOWEQ1CTL
                            211 	.globl _FLOWEQ0CTL
                            212 	.globl _FLOWLOGIC
                            213 	.globl _FLOWSTATE
                            214 	.globl _GPIFABORT
                            215 	.globl _GPIFREADYSTAT
                            216 	.globl _GPIFREADYCFG
                            217 	.globl _XGPIFSGLDATLNOX
                            218 	.globl _XGPIFSGLDATLX
                            219 	.globl _XGPIFSGLDATH
                            220 	.globl _EP8GPIFTRIG
                            221 	.globl _EP8GPIFPFSTOP
                            222 	.globl _EP8GPIFFLGSEL
                            223 	.globl _EP6GPIFTRIG
                            224 	.globl _EP6GPIFPFSTOP
                            225 	.globl _EP6GPIFFLGSEL
                            226 	.globl _EP4GPIFTRIG
                            227 	.globl _EP4GPIFPFSTOP
                            228 	.globl _EP4GPIFFLGSEL
                            229 	.globl _EP2GPIFTRIG
                            230 	.globl _EP2GPIFPFSTOP
                            231 	.globl _EP2GPIFFLGSEL
                            232 	.globl _GPIFTCB0
                            233 	.globl _GPIFTCB1
                            234 	.globl _GPIFTCB2
                            235 	.globl _GPIFTCB3
                            236 	.globl _GPIFADRL
                            237 	.globl _GPIFADRH
                            238 	.globl _GPIFCTLCFG
                            239 	.globl _GPIFIDLECTL
                            240 	.globl _GPIFIDLECS
                            241 	.globl _GPIFWFSELECT
                            242 	.globl _SETUPDAT
                            243 	.globl _SUDPTRCTL
                            244 	.globl _SUDPTRL
                            245 	.globl _SUDPTRH
                            246 	.globl _EP8FIFOBCL
                            247 	.globl _EP8FIFOBCH
                            248 	.globl _EP6FIFOBCL
                            249 	.globl _EP6FIFOBCH
                            250 	.globl _EP4FIFOBCL
                            251 	.globl _EP4FIFOBCH
                            252 	.globl _EP2FIFOBCL
                            253 	.globl _EP2FIFOBCH
                            254 	.globl _EP8FIFOFLGS
                            255 	.globl _EP6FIFOFLGS
                            256 	.globl _EP4FIFOFLGS
                            257 	.globl _EP2FIFOFLGS
                            258 	.globl _EP8CS
                            259 	.globl _EP6CS
                            260 	.globl _EP4CS
                            261 	.globl _EP2CS
                            262 	.globl _EP1INCS
                            263 	.globl _EP1OUTCS
                            264 	.globl _EP0CS
                            265 	.globl _EP8BCL
                            266 	.globl _EP8BCH
                            267 	.globl _EP6BCL
                            268 	.globl _EP6BCH
                            269 	.globl _EP4BCL
                            270 	.globl _EP4BCH
                            271 	.globl _EP2BCL
                            272 	.globl _EP2BCH
                            273 	.globl _EP1INBC
                            274 	.globl _EP1OUTBC
                            275 	.globl _EP0BCL
                            276 	.globl _EP0BCH
                            277 	.globl _FNADDR
                            278 	.globl _MICROFRAME
                            279 	.globl _USBFRAMEL
                            280 	.globl _USBFRAMEH
                            281 	.globl _TOGCTL
                            282 	.globl _WAKEUPCS
                            283 	.globl _SUSPEND
                            284 	.globl _USBCS
                            285 	.globl _XAUTODAT2
                            286 	.globl _XAUTODAT1
                            287 	.globl _I2CTL
                            288 	.globl _I2DAT
                            289 	.globl _I2CS
                            290 	.globl _PORTECFG
                            291 	.globl _PORTCCFG
                            292 	.globl _PORTACFG
                            293 	.globl _INTSETUP
                            294 	.globl _INT4IVEC
                            295 	.globl _INT2IVEC
                            296 	.globl _CLRERRCNT
                            297 	.globl _ERRCNTLIM
                            298 	.globl _USBERRIRQ
                            299 	.globl _USBERRIE
                            300 	.globl _GPIFIRQ
                            301 	.globl _GPIFIE
                            302 	.globl _EPIRQ
                            303 	.globl _EPIE
                            304 	.globl _USBIRQ
                            305 	.globl _USBIE
                            306 	.globl _NAKIRQ
                            307 	.globl _NAKIE
                            308 	.globl _IBNIRQ
                            309 	.globl _IBNIE
                            310 	.globl _EP8FIFOIRQ
                            311 	.globl _EP8FIFOIE
                            312 	.globl _EP6FIFOIRQ
                            313 	.globl _EP6FIFOIE
                            314 	.globl _EP4FIFOIRQ
                            315 	.globl _EP4FIFOIE
                            316 	.globl _EP2FIFOIRQ
                            317 	.globl _EP2FIFOIE
                            318 	.globl _OUTPKTEND
                            319 	.globl _INPKTEND
                            320 	.globl _EP8ISOINPKTS
                            321 	.globl _EP6ISOINPKTS
                            322 	.globl _EP4ISOINPKTS
                            323 	.globl _EP2ISOINPKTS
                            324 	.globl _EP8FIFOPFL
                            325 	.globl _EP8FIFOPFH
                            326 	.globl _EP6FIFOPFL
                            327 	.globl _EP6FIFOPFH
                            328 	.globl _EP4FIFOPFL
                            329 	.globl _EP4FIFOPFH
                            330 	.globl _EP2FIFOPFL
                            331 	.globl _EP2FIFOPFH
                            332 	.globl _EP8AUTOINLENL
                            333 	.globl _EP8AUTOINLENH
                            334 	.globl _EP6AUTOINLENL
                            335 	.globl _EP6AUTOINLENH
                            336 	.globl _EP4AUTOINLENL
                            337 	.globl _EP4AUTOINLENH
                            338 	.globl _EP2AUTOINLENL
                            339 	.globl _EP2AUTOINLENH
                            340 	.globl _EP8FIFOCFG
                            341 	.globl _EP6FIFOCFG
                            342 	.globl _EP4FIFOCFG
                            343 	.globl _EP2FIFOCFG
                            344 	.globl _EP8CFG
                            345 	.globl _EP6CFG
                            346 	.globl _EP4CFG
                            347 	.globl _EP2CFG
                            348 	.globl _EP1INCFG
                            349 	.globl _EP1OUTCFG
                            350 	.globl _REVCTL
                            351 	.globl _REVID
                            352 	.globl _FIFOPINPOLAR
                            353 	.globl _UART230
                            354 	.globl _BPADDRL
                            355 	.globl _BPADDRH
                            356 	.globl _BREAKPT
                            357 	.globl _FIFORESET
                            358 	.globl _PINFLAGSCD
                            359 	.globl _PINFLAGSAB
                            360 	.globl _IFCONFIG
                            361 	.globl _CPUCS
                            362 	.globl _RES_WAVEDATA_END
                            363 	.globl _GPIF_WAVE_DATA
                            364 	.globl _on5
                            365 	.globl _on
                            366 	.globl _got_sud
                            367 	.globl _gotbuf
                            368 	.globl _handle_set_interface_PARM_2
                            369 	.globl _handle_get_interface_PARM_2
                            370 	.globl _CONFIGURE_FPGA
                            371 	.globl _START_CONFIG_PROC
                            372 	.globl _lcount
                            373 	.globl _icount
                            374 	.globl _bytes
                            375 	.globl _sudav_isr
                            376 	.globl _sof_isr
                            377 	.globl _usbreset_isr
                            378 	.globl _hispeed_isr
                            379 ;--------------------------------------------------------
                            380 ; special function registers
                            381 ;--------------------------------------------------------
                            382 	.area RSEG    (DATA)
                    0080    383 _IOA	=	0x0080
                    0081    384 _SP	=	0x0081
                    0082    385 _DPL	=	0x0082
                    0083    386 _DPH	=	0x0083
                    0084    387 _DPL1	=	0x0084
                    0085    388 _DPH1	=	0x0085
                    0086    389 _DPS	=	0x0086
                    0087    390 _PCON	=	0x0087
                    0088    391 _TCON	=	0x0088
                    0089    392 _TMOD	=	0x0089
                    008A    393 _TL0	=	0x008a
                    008B    394 _TL1	=	0x008b
                    008C    395 _TH0	=	0x008c
                    008D    396 _TH1	=	0x008d
                    008E    397 _CKCON	=	0x008e
                    0090    398 _IOB	=	0x0090
                    0091    399 _EXIF	=	0x0091
                    0092    400 __XPAGE	=	0x0092
                    0098    401 _SCON0	=	0x0098
                    0099    402 _SBUF0	=	0x0099
                    009A    403 _AUTOPTRH1	=	0x009a
                    009B    404 _AUTOPTRL1	=	0x009b
                    009D    405 _AUTOPTRH2	=	0x009d
                    009E    406 _AUTOPTRL2	=	0x009e
                    00A0    407 _IOC	=	0x00a0
                    00A1    408 _INT2CLR	=	0x00a1
                    00A2    409 _INT4CLR	=	0x00a2
                    00A8    410 _IE	=	0x00a8
                    00AA    411 _EP2468STAT	=	0x00aa
                    00AB    412 _EP24FIFOFLGS	=	0x00ab
                    00AC    413 _EP68FIFOFLGS	=	0x00ac
                    00AF    414 _AUTOPTRSETUP	=	0x00af
                    00B0    415 _IOD	=	0x00b0
                    00B1    416 _IOE	=	0x00b1
                    00B2    417 _OEA	=	0x00b2
                    00B3    418 _OEB	=	0x00b3
                    00B4    419 _OEC	=	0x00b4
                    00B5    420 _OED	=	0x00b5
                    00B6    421 _OEE	=	0x00b6
                    00B8    422 _IP	=	0x00b8
                    00BA    423 _EP01STAT	=	0x00ba
                    00BB    424 _GPIFTRIG	=	0x00bb
                    00BD    425 _GPIFSGLDATH	=	0x00bd
                    00BE    426 _GPIFSGLDATLX	=	0x00be
                    00BF    427 _GPIFSGLDATLNOX	=	0x00bf
                    00C0    428 _SCON1	=	0x00c0
                    00C1    429 _SBUF1	=	0x00c1
                    00C8    430 _T2CON	=	0x00c8
                    00CA    431 _RCAP2L	=	0x00ca
                    00CB    432 _RCAP2H	=	0x00cb
                    00CC    433 _TL2	=	0x00cc
                    00CD    434 _TH2	=	0x00cd
                    00D0    435 _PSW	=	0x00d0
                    00D8    436 _EICON	=	0x00d8
                    00E0    437 _ACC	=	0x00e0
                    00E8    438 _EIE	=	0x00e8
                    00F0    439 _B	=	0x00f0
                    00F8    440 _EIP	=	0x00f8
                            441 ;--------------------------------------------------------
                            442 ; special function bits
                            443 ;--------------------------------------------------------
                            444 	.area RSEG    (DATA)
                    0080    445 _PA0	=	0x0080
                    0081    446 _PA1	=	0x0081
                    0082    447 _PA2	=	0x0082
                    0083    448 _PA3	=	0x0083
                    0084    449 _PA4	=	0x0084
                    0085    450 _PA5	=	0x0085
                    0086    451 _PA6	=	0x0086
                    0087    452 _PA7	=	0x0087
                    0088    453 _IT0	=	0x0088
                    0089    454 _IE0	=	0x0089
                    008A    455 _IT1	=	0x008a
                    008B    456 _IE1	=	0x008b
                    008C    457 _TR0	=	0x008c
                    008D    458 _TF0	=	0x008d
                    008E    459 _TR1	=	0x008e
                    008F    460 _TF1	=	0x008f
                    0090    461 _PB0	=	0x0090
                    0091    462 _PB1	=	0x0091
                    0092    463 _PB2	=	0x0092
                    0093    464 _PB3	=	0x0093
                    0094    465 _PB4	=	0x0094
                    0095    466 _PB5	=	0x0095
                    0096    467 _PB6	=	0x0096
                    0097    468 _PB7	=	0x0097
                    0098    469 _RI	=	0x0098
                    0099    470 _TI	=	0x0099
                    009A    471 _RB8	=	0x009a
                    009B    472 _TB8	=	0x009b
                    009C    473 _REN	=	0x009c
                    009D    474 _SM2	=	0x009d
                    009E    475 _SM1	=	0x009e
                    009F    476 _SM0	=	0x009f
                    00A0    477 _PC0	=	0x00a0
                    00A1    478 _PC1	=	0x00a1
                    00A2    479 _PC2	=	0x00a2
                    00A3    480 _PC3	=	0x00a3
                    00A4    481 _PC4	=	0x00a4
                    00A5    482 _PC5	=	0x00a5
                    00A6    483 _PC6	=	0x00a6
                    00A7    484 _PC7	=	0x00a7
                    00A8    485 _EX0	=	0x00a8
                    00A9    486 _ET0	=	0x00a9
                    00AA    487 _EX1	=	0x00aa
                    00AB    488 _ET1	=	0x00ab
                    00AC    489 _ES0	=	0x00ac
                    00AD    490 _ET2	=	0x00ad
                    00AE    491 _ES1	=	0x00ae
                    00AF    492 _EA	=	0x00af
                    00B0    493 _PD0	=	0x00b0
                    00B1    494 _PD1	=	0x00b1
                    00B2    495 _PD2	=	0x00b2
                    00B3    496 _PD3	=	0x00b3
                    00B4    497 _PD4	=	0x00b4
                    00B5    498 _PD5	=	0x00b5
                    00B6    499 _PD6	=	0x00b6
                    00B7    500 _PD7	=	0x00b7
                    00B8    501 _PX0	=	0x00b8
                    00B9    502 _PT0	=	0x00b9
                    00BA    503 _PX1	=	0x00ba
                    00BB    504 _PT1	=	0x00bb
                    00BC    505 _PS0	=	0x00bc
                    00BD    506 _PT2	=	0x00bd
                    00BE    507 _PS1	=	0x00be
                    00C0    508 _RI1	=	0x00c0
                    00C1    509 _TI1	=	0x00c1
                    00C2    510 _RB81	=	0x00c2
                    00C3    511 _TB81	=	0x00c3
                    00C4    512 _REN1	=	0x00c4
                    00C5    513 _SM21	=	0x00c5
                    00C6    514 _SM11	=	0x00c6
                    00C7    515 _SM01	=	0x00c7
                    00C8    516 _CP_RL2	=	0x00c8
                    00C9    517 _C_T2	=	0x00c9
                    00CA    518 _TR2	=	0x00ca
                    00CB    519 _EXEN2	=	0x00cb
                    00CC    520 _TCLK	=	0x00cc
                    00CD    521 _RCLK	=	0x00cd
                    00CE    522 _EXF2	=	0x00ce
                    00CF    523 _TF2	=	0x00cf
                    00D0    524 _P	=	0x00d0
                    00D1    525 _FL	=	0x00d1
                    00D2    526 _OV	=	0x00d2
                    00D3    527 _RS0	=	0x00d3
                    00D4    528 _RS1	=	0x00d4
                    00D5    529 _F0	=	0x00d5
                    00D6    530 _AC	=	0x00d6
                    00D7    531 _CY	=	0x00d7
                    00DB    532 _INT6	=	0x00db
                    00DC    533 _RESI	=	0x00dc
                    00DD    534 _ERESI	=	0x00dd
                    00DF    535 _SMOD1	=	0x00df
                    00E8    536 _EUSB	=	0x00e8
                    00E9    537 _EI2C	=	0x00e9
                    00EA    538 _EIEX4	=	0x00ea
                    00EB    539 _EIEX5	=	0x00eb
                    00EC    540 _EIEX6	=	0x00ec
                    00F8    541 _PUSB	=	0x00f8
                    00F9    542 _PI2C	=	0x00f9
                    00FA    543 _EIPX4	=	0x00fa
                    00FB    544 _EIPX5	=	0x00fb
                    00FC    545 _EIPX6	=	0x00fc
                            546 ;--------------------------------------------------------
                            547 ; overlayable register banks
                            548 ;--------------------------------------------------------
                            549 	.area REG_BANK_0	(REL,OVR,DATA)
   0000                     550 	.ds 8
                            551 	.area REG_BANK_1	(REL,OVR,DATA)
   0008                     552 	.ds 8
                            553 ;--------------------------------------------------------
                            554 ; overlayable bit register bank
                            555 ;--------------------------------------------------------
                            556 	.area BIT_BANK	(REL,OVR,DATA)
   0022                     557 bits:
   0022                     558 	.ds 1
                    8000    559 	b0 = bits[0]
                    8100    560 	b1 = bits[1]
                    8200    561 	b2 = bits[2]
                    8300    562 	b3 = bits[3]
                    8400    563 	b4 = bits[4]
                    8500    564 	b5 = bits[5]
                    8600    565 	b6 = bits[6]
                    8700    566 	b7 = bits[7]
                            567 ;--------------------------------------------------------
                            568 ; internal ram data
                            569 ;--------------------------------------------------------
                            570 	.area DSEG    (DATA)
   0010                     571 _bytes::
   0010                     572 	.ds 2
   0012                     573 _icount::
   0012                     574 	.ds 1
   0013                     575 _lcount::
   0013                     576 	.ds 4
   0017                     577 _START_CONFIG_PROC::
   0017                     578 	.ds 1
   0018                     579 _CONFIGURE_FPGA::
   0018                     580 	.ds 1
   0019                     581 _handle_get_interface_PARM_2:
   0019                     582 	.ds 3
   001C                     583 _handle_set_interface_PARM_2:
   001C                     584 	.ds 1
                            585 ;--------------------------------------------------------
                            586 ; overlayable items in internal ram 
                            587 ;--------------------------------------------------------
                            588 	.area	OSEG    (OVR,DATA)
                            589 ;--------------------------------------------------------
                            590 ; Stack segment in internal ram 
                            591 ;--------------------------------------------------------
                            592 	.area	SSEG	(DATA)
   004D                     593 __start__stack:
   004D                     594 	.ds	1
                            595 
                            596 ;--------------------------------------------------------
                            597 ; indirectly addressable internal ram data
                            598 ;--------------------------------------------------------
                            599 	.area ISEG    (DATA)
                            600 ;--------------------------------------------------------
                            601 ; absolute internal ram data
                            602 ;--------------------------------------------------------
                            603 	.area IABS    (ABS,DATA)
                            604 	.area IABS    (ABS,DATA)
                            605 ;--------------------------------------------------------
                            606 ; bit data
                            607 ;--------------------------------------------------------
                            608 	.area BSEG    (BIT)
   0000                     609 _gotbuf::
   0000                     610 	.ds 1
   0001                     611 _got_sud::
   0001                     612 	.ds 1
   0002                     613 _on::
   0002                     614 	.ds 1
   0003                     615 _on5::
   0003                     616 	.ds 1
                            617 ;--------------------------------------------------------
                            618 ; paged external ram data
                            619 ;--------------------------------------------------------
                            620 	.area PSEG    (PAG,XDATA)
                            621 ;--------------------------------------------------------
                            622 ; external ram data
                            623 ;--------------------------------------------------------
                            624 	.area XSEG    (XDATA)
                    E400    625 _GPIF_WAVE_DATA	=	0xe400
                    E480    626 _RES_WAVEDATA_END	=	0xe480
                    E600    627 _CPUCS	=	0xe600
                    E601    628 _IFCONFIG	=	0xe601
                    E602    629 _PINFLAGSAB	=	0xe602
                    E603    630 _PINFLAGSCD	=	0xe603
                    E604    631 _FIFORESET	=	0xe604
                    E605    632 _BREAKPT	=	0xe605
                    E606    633 _BPADDRH	=	0xe606
                    E607    634 _BPADDRL	=	0xe607
                    E608    635 _UART230	=	0xe608
                    E609    636 _FIFOPINPOLAR	=	0xe609
                    E60A    637 _REVID	=	0xe60a
                    E60B    638 _REVCTL	=	0xe60b
                    E610    639 _EP1OUTCFG	=	0xe610
                    E611    640 _EP1INCFG	=	0xe611
                    E612    641 _EP2CFG	=	0xe612
                    E613    642 _EP4CFG	=	0xe613
                    E614    643 _EP6CFG	=	0xe614
                    E615    644 _EP8CFG	=	0xe615
                    E618    645 _EP2FIFOCFG	=	0xe618
                    E619    646 _EP4FIFOCFG	=	0xe619
                    E61A    647 _EP6FIFOCFG	=	0xe61a
                    E61B    648 _EP8FIFOCFG	=	0xe61b
                    E620    649 _EP2AUTOINLENH	=	0xe620
                    E621    650 _EP2AUTOINLENL	=	0xe621
                    E622    651 _EP4AUTOINLENH	=	0xe622
                    E623    652 _EP4AUTOINLENL	=	0xe623
                    E624    653 _EP6AUTOINLENH	=	0xe624
                    E625    654 _EP6AUTOINLENL	=	0xe625
                    E626    655 _EP8AUTOINLENH	=	0xe626
                    E627    656 _EP8AUTOINLENL	=	0xe627
                    E630    657 _EP2FIFOPFH	=	0xe630
                    E631    658 _EP2FIFOPFL	=	0xe631
                    E632    659 _EP4FIFOPFH	=	0xe632
                    E633    660 _EP4FIFOPFL	=	0xe633
                    E634    661 _EP6FIFOPFH	=	0xe634
                    E635    662 _EP6FIFOPFL	=	0xe635
                    E636    663 _EP8FIFOPFH	=	0xe636
                    E637    664 _EP8FIFOPFL	=	0xe637
                    E640    665 _EP2ISOINPKTS	=	0xe640
                    E641    666 _EP4ISOINPKTS	=	0xe641
                    E642    667 _EP6ISOINPKTS	=	0xe642
                    E643    668 _EP8ISOINPKTS	=	0xe643
                    E648    669 _INPKTEND	=	0xe648
                    E649    670 _OUTPKTEND	=	0xe649
                    E650    671 _EP2FIFOIE	=	0xe650
                    E651    672 _EP2FIFOIRQ	=	0xe651
                    E652    673 _EP4FIFOIE	=	0xe652
                    E653    674 _EP4FIFOIRQ	=	0xe653
                    E654    675 _EP6FIFOIE	=	0xe654
                    E655    676 _EP6FIFOIRQ	=	0xe655
                    E656    677 _EP8FIFOIE	=	0xe656
                    E657    678 _EP8FIFOIRQ	=	0xe657
                    E658    679 _IBNIE	=	0xe658
                    E659    680 _IBNIRQ	=	0xe659
                    E65A    681 _NAKIE	=	0xe65a
                    E65B    682 _NAKIRQ	=	0xe65b
                    E65C    683 _USBIE	=	0xe65c
                    E65D    684 _USBIRQ	=	0xe65d
                    E65E    685 _EPIE	=	0xe65e
                    E65F    686 _EPIRQ	=	0xe65f
                    E660    687 _GPIFIE	=	0xe660
                    E661    688 _GPIFIRQ	=	0xe661
                    E662    689 _USBERRIE	=	0xe662
                    E663    690 _USBERRIRQ	=	0xe663
                    E664    691 _ERRCNTLIM	=	0xe664
                    E665    692 _CLRERRCNT	=	0xe665
                    E666    693 _INT2IVEC	=	0xe666
                    E667    694 _INT4IVEC	=	0xe667
                    E668    695 _INTSETUP	=	0xe668
                    E670    696 _PORTACFG	=	0xe670
                    E671    697 _PORTCCFG	=	0xe671
                    E672    698 _PORTECFG	=	0xe672
                    E678    699 _I2CS	=	0xe678
                    E679    700 _I2DAT	=	0xe679
                    E67A    701 _I2CTL	=	0xe67a
                    E67B    702 _XAUTODAT1	=	0xe67b
                    E67C    703 _XAUTODAT2	=	0xe67c
                    E680    704 _USBCS	=	0xe680
                    E681    705 _SUSPEND	=	0xe681
                    E682    706 _WAKEUPCS	=	0xe682
                    E683    707 _TOGCTL	=	0xe683
                    E684    708 _USBFRAMEH	=	0xe684
                    E685    709 _USBFRAMEL	=	0xe685
                    E686    710 _MICROFRAME	=	0xe686
                    E687    711 _FNADDR	=	0xe687
                    E68A    712 _EP0BCH	=	0xe68a
                    E68B    713 _EP0BCL	=	0xe68b
                    E68D    714 _EP1OUTBC	=	0xe68d
                    E68F    715 _EP1INBC	=	0xe68f
                    E690    716 _EP2BCH	=	0xe690
                    E691    717 _EP2BCL	=	0xe691
                    E694    718 _EP4BCH	=	0xe694
                    E695    719 _EP4BCL	=	0xe695
                    E698    720 _EP6BCH	=	0xe698
                    E699    721 _EP6BCL	=	0xe699
                    E69C    722 _EP8BCH	=	0xe69c
                    E69D    723 _EP8BCL	=	0xe69d
                    E6A0    724 _EP0CS	=	0xe6a0
                    E6A1    725 _EP1OUTCS	=	0xe6a1
                    E6A2    726 _EP1INCS	=	0xe6a2
                    E6A3    727 _EP2CS	=	0xe6a3
                    E6A4    728 _EP4CS	=	0xe6a4
                    E6A5    729 _EP6CS	=	0xe6a5
                    E6A6    730 _EP8CS	=	0xe6a6
                    E6A7    731 _EP2FIFOFLGS	=	0xe6a7
                    E6A8    732 _EP4FIFOFLGS	=	0xe6a8
                    E6A9    733 _EP6FIFOFLGS	=	0xe6a9
                    E6AA    734 _EP8FIFOFLGS	=	0xe6aa
                    E6AB    735 _EP2FIFOBCH	=	0xe6ab
                    E6AC    736 _EP2FIFOBCL	=	0xe6ac
                    E6AD    737 _EP4FIFOBCH	=	0xe6ad
                    E6AE    738 _EP4FIFOBCL	=	0xe6ae
                    E6AF    739 _EP6FIFOBCH	=	0xe6af
                    E6B0    740 _EP6FIFOBCL	=	0xe6b0
                    E6B1    741 _EP8FIFOBCH	=	0xe6b1
                    E6B2    742 _EP8FIFOBCL	=	0xe6b2
                    E6B3    743 _SUDPTRH	=	0xe6b3
                    E6B4    744 _SUDPTRL	=	0xe6b4
                    E6B5    745 _SUDPTRCTL	=	0xe6b5
                    E6B8    746 _SETUPDAT	=	0xe6b8
                    E6C0    747 _GPIFWFSELECT	=	0xe6c0
                    E6C1    748 _GPIFIDLECS	=	0xe6c1
                    E6C2    749 _GPIFIDLECTL	=	0xe6c2
                    E6C3    750 _GPIFCTLCFG	=	0xe6c3
                    E6C4    751 _GPIFADRH	=	0xe6c4
                    E6C5    752 _GPIFADRL	=	0xe6c5
                    E6CE    753 _GPIFTCB3	=	0xe6ce
                    E6CF    754 _GPIFTCB2	=	0xe6cf
                    E6D0    755 _GPIFTCB1	=	0xe6d0
                    E6D1    756 _GPIFTCB0	=	0xe6d1
                    E6D2    757 _EP2GPIFFLGSEL	=	0xe6d2
                    E6D3    758 _EP2GPIFPFSTOP	=	0xe6d3
                    E6D4    759 _EP2GPIFTRIG	=	0xe6d4
                    E6DA    760 _EP4GPIFFLGSEL	=	0xe6da
                    E6DB    761 _EP4GPIFPFSTOP	=	0xe6db
                    E6DC    762 _EP4GPIFTRIG	=	0xe6dc
                    E6E2    763 _EP6GPIFFLGSEL	=	0xe6e2
                    E6E3    764 _EP6GPIFPFSTOP	=	0xe6e3
                    E6E4    765 _EP6GPIFTRIG	=	0xe6e4
                    E6EA    766 _EP8GPIFFLGSEL	=	0xe6ea
                    E6EB    767 _EP8GPIFPFSTOP	=	0xe6eb
                    E6EC    768 _EP8GPIFTRIG	=	0xe6ec
                    E6F0    769 _XGPIFSGLDATH	=	0xe6f0
                    E6F1    770 _XGPIFSGLDATLX	=	0xe6f1
                    E6F2    771 _XGPIFSGLDATLNOX	=	0xe6f2
                    E6F3    772 _GPIFREADYCFG	=	0xe6f3
                    E6F4    773 _GPIFREADYSTAT	=	0xe6f4
                    E6F5    774 _GPIFABORT	=	0xe6f5
                    E6C6    775 _FLOWSTATE	=	0xe6c6
                    E6C7    776 _FLOWLOGIC	=	0xe6c7
                    E6C8    777 _FLOWEQ0CTL	=	0xe6c8
                    E6C9    778 _FLOWEQ1CTL	=	0xe6c9
                    E6CA    779 _FLOWHOLDOFF	=	0xe6ca
                    E6CB    780 _FLOWSTB	=	0xe6cb
                    E6CC    781 _FLOWSTBEDGE	=	0xe6cc
                    E6CD    782 _FLOWSTBHPERIOD	=	0xe6cd
                    E60C    783 _GPIFHOLDAMOUNT	=	0xe60c
                    E67D    784 _UDMACRCH	=	0xe67d
                    E67E    785 _UDMACRCL	=	0xe67e
                    E67F    786 _UDMACRCQUAL	=	0xe67f
                    E740    787 _EP0BUF	=	0xe740
                    E780    788 _EP1OUTBUF	=	0xe780
                    E7C0    789 _EP1INBUF	=	0xe7c0
                    F000    790 _EP2FIFOBUF	=	0xf000
                    F400    791 _EP4FIFOBUF	=	0xf400
                    F800    792 _EP6FIFOBUF	=	0xf800
                    FC00    793 _EP8FIFOBUF	=	0xfc00
                    E628    794 _ECCCFG	=	0xe628
                    E629    795 _ECCRESET	=	0xe629
                    E62A    796 _ECC1B0	=	0xe62a
                    E62B    797 _ECC1B1	=	0xe62b
                    E62C    798 _ECC1B2	=	0xe62c
                    E62D    799 _ECC2B0	=	0xe62d
                    E62E    800 _ECC2B1	=	0xe62e
                    E62F    801 _ECC2B2	=	0xe62f
                    E50D    802 _GPCR2	=	0xe50d
                    8800    803 _D2ON	=	0x8800
                    8000    804 _D2OFF	=	0x8000
                    9800    805 _D3ON	=	0x9800
                    9000    806 _D3OFF	=	0x9000
                    A800    807 _D4ON	=	0xa800
                    A000    808 _D4OFF	=	0xa000
                    B800    809 _D5ON	=	0xb800
                    B000    810 _D5OFF	=	0xb000
                            811 ;--------------------------------------------------------
                            812 ; absolute external ram data
                            813 ;--------------------------------------------------------
                            814 	.area XABS    (ABS,XDATA)
                            815 ;--------------------------------------------------------
                            816 ; external initialized ram data
                            817 ;--------------------------------------------------------
                            818 	.area XISEG   (XDATA)
   3C00                     819 _sofct::
   3C00                     820 	.ds 2
                            821 	.area HOME    (CODE)
                            822 	.area GSINIT0 (CODE)
                            823 	.area GSINIT1 (CODE)
                            824 	.area GSINIT2 (CODE)
                            825 	.area GSINIT3 (CODE)
                            826 	.area GSINIT4 (CODE)
                            827 	.area GSINIT5 (CODE)
                            828 	.area GSINIT  (CODE)
                            829 	.area GSFINAL (CODE)
                            830 	.area CSEG    (CODE)
                            831 ;--------------------------------------------------------
                            832 ; interrupt vector 
                            833 ;--------------------------------------------------------
                            834 	.area HOME    (CODE)
   0000                     835 __interrupt_vect:
   0000 02 01 BB            836 	ljmp	__sdcc_gsinit_startup
   0003 32                  837 	reti
   0004                     838 	.ds	7
   000B 32                  839 	reti
   000C                     840 	.ds	7
   0013 32                  841 	reti
   0014                     842 	.ds	7
   001B 32                  843 	reti
   001C                     844 	.ds	7
   0023 32                  845 	reti
   0024                     846 	.ds	7
   002B 32                  847 	reti
   002C                     848 	.ds	7
   0033 32                  849 	reti
   0034                     850 	.ds	7
   003B 32                  851 	reti
   003C                     852 	.ds	7
   0043 32                  853 	reti
   0044                     854 	.ds	7
   004B 32                  855 	reti
   004C                     856 	.ds	7
   0053 32                  857 	reti
   0054                     858 	.ds	7
   005B 32                  859 	reti
   005C                     860 	.ds	7
   0063 32                  861 	reti
   0064                     862 	.ds	7
   006B 02 05 C0            863 	ljmp	_sudav_isr
   006E                     864 	.ds	5
   0073 02 05 D8            865 	ljmp	_sof_isr
   0076                     866 	.ds	5
   007B 02 06 BE            867 	ljmp	_sutok_isr
   007E                     868 	.ds	5
   0083 02 0A 95            869 	ljmp	_suspend_isr
   0086                     870 	.ds	5
   008B 02 06 25            871 	ljmp	_usbreset_isr
   008E                     872 	.ds	5
   0093 02 06 70            873 	ljmp	_hispeed_isr
   0096                     874 	.ds	5
   009B 02 06 BB            875 	ljmp	_ep0ack_isr
   009E                     876 	.ds	5
   00A3 02 0A BF            877 	ljmp	_ep0in_isr
   00A6                     878 	.ds	5
   00AB 02 0A C0            879 	ljmp	_ep0out_isr
   00AE                     880 	.ds	5
   00B3 02 0A C1            881 	ljmp	_ep1in_isr
   00B6                     882 	.ds	5
   00BB 02 0A C4            883 	ljmp	_ep1out_isr
   00BE                     884 	.ds	5
   00C3 02 0A 97            885 	ljmp	_ep2_isr
   00C6                     886 	.ds	5
   00CB 02 0A B1            887 	ljmp	_ep4_isr
   00CE                     888 	.ds	5
   00D3 02 0A B2            889 	ljmp	_ep6_isr
   00D6                     890 	.ds	5
   00DB 02 0A B4            891 	ljmp	_ep8_isr
   00DE                     892 	.ds	5
   00E3 02 06 C0            893 	ljmp	_ibn_isr
   00E6                     894 	.ds	5
   00EB 02 12 95            895 	ljmp	_ep0ping_isr
   00EE                     896 	.ds	5
   00F3 02 06 BC            897 	ljmp	_ep1ping_isr
   00F6                     898 	.ds	5
   00FB 02 06 BD            899 	ljmp	_ep2ping_isr
   00FE                     900 	.ds	5
   0103 02 06 BF            901 	ljmp	_ep4ping_isr
   0106                     902 	.ds	5
   010B 02 06 C1            903 	ljmp	_ep6ping_isr
   010E                     904 	.ds	5
   0113 02 06 C2            905 	ljmp	_ep8ping_isr
   0116                     906 	.ds	5
   011B 02 11 F2            907 	ljmp	_errlimit_isr
   011E                     908 	.ds	5
   0123 02 0A BD            909 	ljmp	_ep2isoerr_isr
   0126                     910 	.ds	5
   012B 02 0A C2            911 	ljmp	_ep4isoerr_isr
   012E                     912 	.ds	5
   0133 02 0A C5            913 	ljmp	_ep6isoerr_isr
   0136                     914 	.ds	5
   013B 02 0A C7            915 	ljmp	_ep8isoerr_isr
   013E                     916 	.ds	5
   0143 02 0A BE            917 	ljmp	_spare_isr
   0146                     918 	.ds	5
   014B 02 0A C3            919 	ljmp	_ep2pf_isr
   014E                     920 	.ds	5
   0153 02 0A C6            921 	ljmp	_ep4pf_isr
   0156                     922 	.ds	5
   015B 02 0A C8            923 	ljmp	_ep6pf_isr
   015E                     924 	.ds	5
   0163 02 0C 1F            925 	ljmp	_ep8pf_isr
   0166                     926 	.ds	5
   016B 02 0A B5            927 	ljmp	_ep2ef_isr
   016E                     928 	.ds	5
   0173 02 0A B7            929 	ljmp	_ep4ef_isr
   0176                     930 	.ds	5
   017B 02 0A B9            931 	ljmp	_ep6ef_isr
   017E                     932 	.ds	5
   0183 02 0A BB            933 	ljmp	_ep8ef_isr
   0186                     934 	.ds	5
   018B 02 0A B6            935 	ljmp	_ep2ff_isr
   018E                     936 	.ds	5
   0193 02 0A B8            937 	ljmp	_ep4ff_isr
   0196                     938 	.ds	5
   019B 02 0A BA            939 	ljmp	_ep6ff_isr
   019E                     940 	.ds	5
   01A3 02 0A BC            941 	ljmp	_ep8ff_isr
   01A6                     942 	.ds	5
   01AB 02 0A B3            943 	ljmp	_gpifdone_isr
   01AE                     944 	.ds	5
   01B3 02 0A 96            945 	ljmp	_gpifwf_isr
                            946 ;--------------------------------------------------------
                            947 ; global & static initialisations
                            948 ;--------------------------------------------------------
                            949 	.area HOME    (CODE)
                            950 	.area GSINIT  (CODE)
                            951 	.area GSFINAL (CODE)
                            952 	.area GSINIT  (CODE)
                            953 	.globl __sdcc_gsinit_startup
                            954 	.globl __sdcc_program_startup
                            955 	.globl __start__stack
                            956 	.globl __mcs51_genXINIT
                            957 	.globl __mcs51_genXRAMCLEAR
                            958 	.globl __mcs51_genRAMCLEAR
                            959 ;	aes220_progFpga.c:168: BOOL START_CONFIG_PROC = TRUE;
   0214 75 17 01            960 	mov	_START_CONFIG_PROC,#0x01
                            961 ;	aes220_progFpga.c:169: BOOL CONFIGURE_FPGA = FALSE;
   0217 75 18 00            962 	mov	_CONFIGURE_FPGA,#0x00
                            963 	.area GSFINAL (CODE)
   022C 02 01 B6            964 	ljmp	__sdcc_program_startup
                            965 ;--------------------------------------------------------
                            966 ; Home
                            967 ;--------------------------------------------------------
                            968 	.area HOME    (CODE)
                            969 	.area HOME    (CODE)
   01B6                     970 __sdcc_program_startup:
   01B6 12 02 2F            971 	lcall	_main
                            972 ;	return from main will lock up
   01B9 80 FE               973 	sjmp .
                            974 ;--------------------------------------------------------
                            975 ; code
                            976 ;--------------------------------------------------------
                            977 	.area CSEG    (CODE)
                            978 ;------------------------------------------------------------
                            979 ;Allocation info for local variables in function 'main'
                            980 ;------------------------------------------------------------
                            981 ;dummy                     Allocated to registers 
                            982 ;i                         Allocated to registers r2 r3 
                            983 ;ctrlCode                  Allocated to registers r2 
                            984 ;------------------------------------------------------------
                            985 ;	aes220_progFpga.c:171: void main() {
                            986 ;	-----------------------------------------
                            987 ;	 function main
                            988 ;	-----------------------------------------
   022F                     989 _main:
                    0002    990 	ar2 = 0x02
                    0003    991 	ar3 = 0x03
                    0004    992 	ar4 = 0x04
                    0005    993 	ar5 = 0x05
                    0006    994 	ar6 = 0x06
                    0007    995 	ar7 = 0x07
                    0000    996 	ar0 = 0x00
                    0001    997 	ar1 = 0x01
                            998 ;	aes220_progFpga.c:173: REVCTL=0; // not using advanced endpoint controls
   022F 90 E6 0B            999 	mov	dptr,#_REVCTL
   0232 E4                 1000 	clr	a
   0233 F0                 1001 	movx	@dptr,a
                           1002 ;	aes220_progFpga.c:175: on=0;
   0234 C2 02              1003 	clr	_on
                           1004 ;	aes220_progFpga.c:176: lcount=0;
   0236 E4                 1005 	clr	a
   0237 F5 13              1006 	mov	_lcount,a
   0239 F5 14              1007 	mov	(_lcount + 1),a
   023B F5 15              1008 	mov	(_lcount + 2),a
   023D F5 16              1009 	mov	(_lcount + 3),a
                           1010 ;	aes220_progFpga.c:177: got_sud=FALSE;
   023F C2 01              1011 	clr	_got_sud
                           1012 ;	aes220_progFpga.c:178: icount=0;
   0241 75 12 00           1013 	mov	_icount,#0x00
                           1014 ;	aes220_progFpga.c:179: gotbuf=FALSE;
   0244 C2 00              1015 	clr	_gotbuf
                           1016 ;	aes220_progFpga.c:180: bytes=0;
   0246 E4                 1017 	clr	a
   0247 F5 10              1018 	mov	_bytes,a
   0249 F5 11              1019 	mov	(_bytes + 1),a
                           1020 ;	aes220_progFpga.c:183: RENUMERATE_UNCOND();
   024B 90 E6 80           1021 	mov	dptr,#_USBCS
   024E E0                 1022 	movx	a,@dptr
   024F 44 0A              1023 	orl	a,#0x0A
   0251 F0                 1024 	movx	@dptr,a
   0252 90 05 DC           1025 	mov	dptr,#0x05DC
   0255 12 0B C9           1026 	lcall	_delay
   0258 90 E6 80           1027 	mov	dptr,#_USBCS
   025B E0                 1028 	movx	a,@dptr
   025C 54 F7              1029 	anl	a,#0xF7
   025E F0                 1030 	movx	@dptr,a
                           1031 ;	aes220_progFpga.c:186: SETCPUFREQ(CLK_48M);
   025F 90 E6 00           1032 	mov	dptr,#_CPUCS
   0262 E0                 1033 	movx	a,@dptr
   0263 FA                 1034 	mov	r2,a
   0264 74 E7              1035 	mov	a,#0xE7
   0266 5A                 1036 	anl	a,r2
   0267 90 E6 00           1037 	mov	dptr,#_CPUCS
   026A F5 F0              1038 	mov	b,a
   026C 74 10              1039 	mov	a,#0x10
   026E 45 F0              1040 	orl	a,b
   0270 F0                 1041 	movx	@dptr,a
                           1042 ;	aes220_progFpga.c:187: SETIF48MHZ();
   0271 90 E6 01           1043 	mov	dptr,#_IFCONFIG
   0274 E0                 1044 	movx	a,@dptr
   0275 44 40              1045 	orl	a,#0x40
   0277 F0                 1046 	movx	@dptr,a
                           1047 ;	aes220_progFpga.c:188: sio0_init(57600);
   0278 90 E1 00           1048 	mov	dptr,#0xE100
   027B 12 0A C9           1049 	lcall	_sio0_init
                           1050 ;	aes220_progFpga.c:191: USE_USB_INTS();
   027E E5 00              1051 	mov	a,_INT2JT
   0280 D2 E8              1052 	setb	_EUSB
   0282 90 E6 68           1053 	mov	dptr,#_INTSETUP
   0285 E0                 1054 	movx	a,@dptr
   0286 44 08              1055 	orl	a,#0x08
   0288 F0                 1056 	movx	@dptr,a
                           1057 ;	aes220_progFpga.c:192: ENABLE_SUDAV();
   0289 90 E6 5C           1058 	mov	dptr,#_USBIE
   028C E0                 1059 	movx	a,@dptr
   028D 44 01              1060 	orl	a,#0x01
   028F F0                 1061 	movx	@dptr,a
                           1062 ;	aes220_progFpga.c:193: ENABLE_SOF();
   0290 90 E6 5C           1063 	mov	dptr,#_USBIE
   0293 E0                 1064 	movx	a,@dptr
   0294 44 02              1065 	orl	a,#0x02
   0296 F0                 1066 	movx	@dptr,a
                           1067 ;	aes220_progFpga.c:194: ENABLE_HISPEED();
   0297 90 E6 5C           1068 	mov	dptr,#_USBIE
   029A E0                 1069 	movx	a,@dptr
   029B 44 20              1070 	orl	a,#0x20
   029D F0                 1071 	movx	@dptr,a
                           1072 ;	aes220_progFpga.c:195: ENABLE_USBRESET();
   029E 90 E6 5C           1073 	mov	dptr,#_USBIE
   02A1 E0                 1074 	movx	a,@dptr
   02A2 FA                 1075 	mov	r2,a
   02A3 44 10              1076 	orl	a,#0x10
   02A5 F0                 1077 	movx	@dptr,a
                           1078 ;	aes220_progFpga.c:199: EP2CFG = 0xA2; // 10100010
   02A6 90 E6 12           1079 	mov	dptr,#_EP2CFG
   02A9 74 A2              1080 	mov	a,#0xA2
   02AB F0                 1081 	movx	@dptr,a
                           1082 ;	aes220_progFpga.c:200: SYNCDELAY();
   02AC 00                 1083 	 nop 
   02AD 00                 1084 	 nop 
   02AE 00                 1085 	 nop 
   02AF 00                 1086 	 nop 
                           1087 ;	aes220_progFpga.c:201: EP6CFG = 0xE2; // 11100010
   02B0 90 E6 14           1088 	mov	dptr,#_EP6CFG
   02B3 74 E2              1089 	mov	a,#0xE2
   02B5 F0                 1090 	movx	@dptr,a
                           1091 ;	aes220_progFpga.c:202: SYNCDELAY();
   02B6 00                 1092 	 nop 
   02B7 00                 1093 	 nop 
   02B8 00                 1094 	 nop 
   02B9 00                 1095 	 nop 
                           1096 ;	aes220_progFpga.c:203: EP1INCFG &= ~bmVALID;
   02BA 90 E6 11           1097 	mov	dptr,#_EP1INCFG
   02BD E0                 1098 	movx	a,@dptr
   02BE FA                 1099 	mov	r2,a
   02BF 54 7F              1100 	anl	a,#0x7F
   02C1 F0                 1101 	movx	@dptr,a
                           1102 ;	aes220_progFpga.c:204: SYNCDELAY();
   02C2 00                 1103 	 nop 
   02C3 00                 1104 	 nop 
   02C4 00                 1105 	 nop 
   02C5 00                 1106 	 nop 
                           1107 ;	aes220_progFpga.c:205: EP1OUTCFG &= ~bmVALID;
   02C6 90 E6 10           1108 	mov	dptr,#_EP1OUTCFG
   02C9 E0                 1109 	movx	a,@dptr
   02CA FA                 1110 	mov	r2,a
   02CB 54 7F              1111 	anl	a,#0x7F
   02CD F0                 1112 	movx	@dptr,a
                           1113 ;	aes220_progFpga.c:206: SYNCDELAY();
   02CE 00                 1114 	 nop 
   02CF 00                 1115 	 nop 
   02D0 00                 1116 	 nop 
   02D1 00                 1117 	 nop 
                           1118 ;	aes220_progFpga.c:207: EP4CFG &= ~bmVALID;
   02D2 90 E6 13           1119 	mov	dptr,#_EP4CFG
   02D5 E0                 1120 	movx	a,@dptr
   02D6 FA                 1121 	mov	r2,a
   02D7 54 7F              1122 	anl	a,#0x7F
   02D9 F0                 1123 	movx	@dptr,a
                           1124 ;	aes220_progFpga.c:208: SYNCDELAY();
   02DA 00                 1125 	 nop 
   02DB 00                 1126 	 nop 
   02DC 00                 1127 	 nop 
   02DD 00                 1128 	 nop 
                           1129 ;	aes220_progFpga.c:209: EP8CFG &= ~bmVALID;
   02DE 90 E6 15           1130 	mov	dptr,#_EP8CFG
   02E1 E0                 1131 	movx	a,@dptr
   02E2 FA                 1132 	mov	r2,a
   02E3 54 7F              1133 	anl	a,#0x7F
   02E5 F0                 1134 	movx	@dptr,a
                           1135 ;	aes220_progFpga.c:210: SYNCDELAY();
   02E6 00                 1136 	 nop 
   02E7 00                 1137 	 nop 
   02E8 00                 1138 	 nop 
   02E9 00                 1139 	 nop 
                           1140 ;	aes220_progFpga.c:214: EP2BCL = 0x80; // write once
   02EA 90 E6 91           1141 	mov	dptr,#_EP2BCL
   02ED 74 80              1142 	mov	a,#0x80
   02EF F0                 1143 	movx	@dptr,a
                           1144 ;	aes220_progFpga.c:215: SYNCDELAY();
   02F0 00                 1145 	 nop 
   02F1 00                 1146 	 nop 
   02F2 00                 1147 	 nop 
   02F3 00                 1148 	 nop 
                           1149 ;	aes220_progFpga.c:216: EP2BCL = 0x80; // do it again
   02F4 90 E6 91           1150 	mov	dptr,#_EP2BCL
   02F7 74 80              1151 	mov	a,#0x80
   02F9 F0                 1152 	movx	@dptr,a
                           1153 ;	aes220_progFpga.c:222: EA=1; // global interrupt enable
   02FA D2 AF              1154 	setb	_EA
                           1155 ;	aes220_progFpga.c:223: printf ( "Done initializing stuff\n" );
   02FC 74 FF              1156 	mov	a,#__str_0
   02FE C0 E0              1157 	push	acc
   0300 74 12              1158 	mov	a,#(__str_0 >> 8)
   0302 C0 E0              1159 	push	acc
   0304 74 80              1160 	mov	a,#0x80
   0306 C0 E0              1161 	push	acc
   0308 12 0C 44           1162 	lcall	_printf
   030B 15 81              1163 	dec	sp
   030D 15 81              1164 	dec	sp
   030F 15 81              1165 	dec	sp
                           1166 ;	aes220_progFpga.c:226: OEA = 0x00; // set port A as inputs
   0311 75 B2 00           1167 	mov	_OEA,#0x00
                           1168 ;	aes220_progFpga.c:227: OEB = 0xFF; // set port B as outputs
   0314 75 B3 FF           1169 	mov	_OEB,#0xFF
                           1170 ;	aes220_progFpga.c:228: OED |= 0b00001101; // set PD0, PD2 and PD3 as outputs
   0317 43 B5 0D           1171 	orl	_OED,#0x0D
                           1172 ;	aes220_progFpga.c:230: PROG_B = 1;
   031A D2 B0              1173 	setb	_PD0
                           1174 ;	aes220_progFpga.c:231: LOAD_B = 1;    // Shift register load signal set to 1
   031C D2 B2              1175 	setb	_PD2
                           1176 ;	aes220_progFpga.c:232: CS_B   = 1;    // Chip select signal set to 1
   031E D2 B3              1177 	setb	_PD3
                           1178 ;	aes220_progFpga.c:234: while(TRUE) {
   0320                    1179 00113$:
                           1180 ;	aes220_progFpga.c:235: if ( got_sud ) {
   0320 30 01 1A           1181 	jnb	_got_sud,00102$
                           1182 ;	aes220_progFpga.c:236: printf ( "Handle setupdata\n" );
   0323 74 18              1183 	mov	a,#__str_1
   0325 C0 E0              1184 	push	acc
   0327 74 13              1185 	mov	a,#(__str_1 >> 8)
   0329 C0 E0              1186 	push	acc
   032B 74 80              1187 	mov	a,#0x80
   032D C0 E0              1188 	push	acc
   032F 12 0C 44           1189 	lcall	_printf
   0332 15 81              1190 	dec	sp
   0334 15 81              1191 	dec	sp
   0336 15 81              1192 	dec	sp
                           1193 ;	aes220_progFpga.c:237: handle_setupdata();
   0338 12 06 C3           1194 	lcall	_handle_setupdata
                           1195 ;	aes220_progFpga.c:238: got_sud=FALSE;
   033B C2 01              1196 	clr	_got_sud
   033D                    1197 00102$:
                           1198 ;	aes220_progFpga.c:241: if ( !(EP2468STAT & bmEP2EMPTY)) {
   033D E5 AA              1199 	mov	a,_EP2468STAT
   033F 20 E0 DE           1200 	jb	acc.0,00113$
                           1201 ;	aes220_progFpga.c:245: bytes = MAKEWORD(EP2BCH,EP2BCL);
   0342 90 E6 90           1202 	mov	dptr,#_EP2BCH
   0345 E0                 1203 	movx	a,@dptr
   0346 FB                 1204 	mov	r3,a
   0347 7A 00              1205 	mov	r2,#0x00
   0349 90 E6 91           1206 	mov	dptr,#_EP2BCL
   034C E0                 1207 	movx	a,@dptr
   034D FC                 1208 	mov	r4,a
   034E 7D 00              1209 	mov	r5,#0x00
   0350 4A                 1210 	orl	a,r2
   0351 F5 10              1211 	mov	_bytes,a
   0353 ED                 1212 	mov	a,r5
   0354 4B                 1213 	orl	a,r3
   0355 F5 11              1214 	mov	(_bytes + 1),a
                           1215 ;	aes220_progFpga.c:247: ctrlCode = EP2FIFOBUF[0];
   0357 90 F0 00           1216 	mov	dptr,#_EP2FIFOBUF
   035A E0                 1217 	movx	a,@dptr
   035B FA                 1218 	mov	r2,a
                           1219 ;	aes220_progFpga.c:248: switch (ctrlCode) {
   035C BA 63 02           1220 	cjne	r2,#0x63,00148$
   035F 80 19              1221 	sjmp	00103$
   0361                    1222 00148$:
   0361 BA 64 02           1223 	cjne	r2,#0x64,00149$
   0364 80 3E              1224 	sjmp	00104$
   0366                    1225 00149$:
   0366 BA 65 02           1226 	cjne	r2,#0x65,00150$
   0369 80 62              1227 	sjmp	00105$
   036B                    1228 00150$:
   036B BA 66 03           1229 	cjne	r2,#0x66,00151$
   036E 02 04 46           1230 	ljmp	00107$
   0371                    1231 00151$:
   0371 BA AF 03           1232 	cjne	r2,#0xAF,00152$
   0374 02 04 2A           1233 	ljmp	00106$
   0377                    1234 00152$:
   0377 02 04 4E           1235 	ljmp	00108$
                           1236 ;	aes220_progFpga.c:249: case STATUS_CHECK:
   037A                    1237 00103$:
                           1238 ;	aes220_progFpga.c:250: CS_B = 0;    // Enable flash
   037A C2 B3              1239 	clr	_PD3
                           1240 ;	aes220_progFpga.c:251: LOAD_B = 0;
   037C C2 B2              1241 	clr	_PD2
                           1242 ;	aes220_progFpga.c:252: IOB = 0xD7;  // Write the value on port B
   037E 75 90 D7           1243 	mov	_IOB,#0xD7
                           1244 ;	aes220_progFpga.c:253: LOAD_B = 1;
   0381 D2 B2              1245 	setb	_PD2
                           1246 ;	aes220_progFpga.c:254: IOB = 0x55;  // Write a dummy value to flush out status byte
   0383 75 90 55           1247 	mov	_IOB,#0x55
                           1248 ;	aes220_progFpga.c:256: LOAD_B = 0;
   0386 C2 B2              1249 	clr	_PD2
                           1250 ;	aes220_progFpga.c:257: LOAD_B = 1;
   0388 D2 B2              1251 	setb	_PD2
                           1252 ;	aes220_progFpga.c:258: EP6FIFOBUF[0] = IOA; // read and send value on port A back
   038A 90 F8 00           1253 	mov	dptr,#_EP6FIFOBUF
   038D E5 80              1254 	mov	a,_IOA
   038F F0                 1255 	movx	@dptr,a
                           1256 ;	aes220_progFpga.c:259: CS_B = 1;
   0390 D2 B3              1257 	setb	_PD3
                           1258 ;	aes220_progFpga.c:261: EP6BCH=0;
   0392 90 E6 98           1259 	mov	dptr,#_EP6BCH
   0395 E4                 1260 	clr	a
   0396 F0                 1261 	movx	@dptr,a
                           1262 ;	aes220_progFpga.c:262: SYNCDELAY();
   0397 00                 1263 	 nop 
   0398 00                 1264 	 nop 
   0399 00                 1265 	 nop 
   039A 00                 1266 	 nop 
                           1267 ;	aes220_progFpga.c:263: EP6BCL=1;
   039B 90 E6 99           1268 	mov	dptr,#_EP6BCL
   039E 74 01              1269 	mov	a,#0x01
   03A0 F0                 1270 	movx	@dptr,a
                           1271 ;	aes220_progFpga.c:264: break; // end of case STATUS_CHECK
   03A1 02 04 50           1272 	ljmp	00109$
                           1273 ;	aes220_progFpga.c:265: case WRITE_PAGE:
   03A4                    1274 00104$:
                           1275 ;	aes220_progFpga.c:266: CS_B = 0;
   03A4 C2 B3              1276 	clr	_PD3
                           1277 ;	aes220_progFpga.c:267: for (i=1;i<bytes;++i) {
   03A6 7A 01              1278 	mov	r2,#0x01
   03A8 7B 00              1279 	mov	r3,#0x00
   03AA                    1280 00115$:
   03AA C3                 1281 	clr	c
   03AB EA                 1282 	mov	a,r2
   03AC 95 10              1283 	subb	a,_bytes
   03AE EB                 1284 	mov	a,r3
   03AF 95 11              1285 	subb	a,(_bytes + 1)
   03B1 50 15              1286 	jnc	00118$
                           1287 ;	aes220_progFpga.c:268: LOAD_B = 0;
   03B3 C2 B2              1288 	clr	_PD2
                           1289 ;	aes220_progFpga.c:269: IOB = EP2FIFOBUF[i];
   03B5 8A 82              1290 	mov	dpl,r2
   03B7 74 F0              1291 	mov	a,#(_EP2FIFOBUF >> 8)
   03B9 2B                 1292 	add	a,r3
   03BA F5 83              1293 	mov	dph,a
   03BC E0                 1294 	movx	a,@dptr
   03BD F5 90              1295 	mov	_IOB,a
                           1296 ;	aes220_progFpga.c:270: LOAD_B = 1;
   03BF D2 B2              1297 	setb	_PD2
                           1298 ;	aes220_progFpga.c:267: for (i=1;i<bytes;++i) {
   03C1 0A                 1299 	inc	r2
   03C2 BA 00 E5           1300 	cjne	r2,#0x00,00115$
   03C5 0B                 1301 	inc	r3
   03C6 80 E2              1302 	sjmp	00115$
   03C8                    1303 00118$:
                           1304 ;	aes220_progFpga.c:272: CS_B = 1;
   03C8 D2 B3              1305 	setb	_PD3
                           1306 ;	aes220_progFpga.c:273: break; // end of case WRITE_PAGE
   03CA 02 04 50           1307 	ljmp	00109$
                           1308 ;	aes220_progFpga.c:274: case READ_PAGE:
   03CD                    1309 00105$:
                           1310 ;	aes220_progFpga.c:275: CS_B = 0;
   03CD C2 B3              1311 	clr	_PD3
                           1312 ;	aes220_progFpga.c:276: for (i=1;i<bytes;++i) {
   03CF 7A 01              1313 	mov	r2,#0x01
   03D1 7B 00              1314 	mov	r3,#0x00
   03D3                    1315 00119$:
   03D3 C3                 1316 	clr	c
   03D4 EA                 1317 	mov	a,r2
   03D5 95 10              1318 	subb	a,_bytes
   03D7 EB                 1319 	mov	a,r3
   03D8 95 11              1320 	subb	a,(_bytes + 1)
   03DA 50 15              1321 	jnc	00122$
                           1322 ;	aes220_progFpga.c:277: LOAD_B = 0;
   03DC C2 B2              1323 	clr	_PD2
                           1324 ;	aes220_progFpga.c:278: IOB = EP2FIFOBUF[i];
   03DE 8A 82              1325 	mov	dpl,r2
   03E0 74 F0              1326 	mov	a,#(_EP2FIFOBUF >> 8)
   03E2 2B                 1327 	add	a,r3
   03E3 F5 83              1328 	mov	dph,a
   03E5 E0                 1329 	movx	a,@dptr
   03E6 F5 90              1330 	mov	_IOB,a
                           1331 ;	aes220_progFpga.c:279: LOAD_B = 1;
   03E8 D2 B2              1332 	setb	_PD2
                           1333 ;	aes220_progFpga.c:276: for (i=1;i<bytes;++i) {
   03EA 0A                 1334 	inc	r2
   03EB BA 00 E5           1335 	cjne	r2,#0x00,00119$
   03EE 0B                 1336 	inc	r3
   03EF 80 E2              1337 	sjmp	00119$
   03F1                    1338 00122$:
                           1339 ;	aes220_progFpga.c:281: for (i=0;i<PAGE_SIZE;++i) {
   03F1 7A 00              1340 	mov	r2,#0x00
   03F3 7B 00              1341 	mov	r3,#0x00
   03F5                    1342 00123$:
   03F5 C3                 1343 	clr	c
   03F6 EA                 1344 	mov	a,r2
   03F7 94 08              1345 	subb	a,#0x08
   03F9 EB                 1346 	mov	a,r3
   03FA 94 01              1347 	subb	a,#0x01
   03FC 50 18              1348 	jnc	00126$
                           1349 ;	aes220_progFpga.c:282: LOAD_B = 0;
   03FE C2 B2              1350 	clr	_PD2
                           1351 ;	aes220_progFpga.c:283: IOB = 0xAA; // dummy byte
   0400 75 90 AA           1352 	mov	_IOB,#0xAA
                           1353 ;	aes220_progFpga.c:284: LOAD_B = 1;
   0403 D2 B2              1354 	setb	_PD2
                           1355 ;	aes220_progFpga.c:285: EP6FIFOBUF[i] = IOA;
   0405 8A 82              1356 	mov	dpl,r2
   0407 74 F8              1357 	mov	a,#(_EP6FIFOBUF >> 8)
   0409 2B                 1358 	add	a,r3
   040A F5 83              1359 	mov	dph,a
   040C E5 80              1360 	mov	a,_IOA
   040E F0                 1361 	movx	@dptr,a
                           1362 ;	aes220_progFpga.c:281: for (i=0;i<PAGE_SIZE;++i) {
   040F 0A                 1363 	inc	r2
   0410 BA 00 E2           1364 	cjne	r2,#0x00,00123$
   0413 0B                 1365 	inc	r3
   0414 80 DF              1366 	sjmp	00123$
   0416                    1367 00126$:
                           1368 ;	aes220_progFpga.c:287: CS_B = 1;
   0416 D2 B3              1369 	setb	_PD3
                           1370 ;	aes220_progFpga.c:289: EP6BCH=MSB(PAGE_SIZE);
   0418 90 E6 98           1371 	mov	dptr,#_EP6BCH
   041B 74 01              1372 	mov	a,#0x01
   041D F0                 1373 	movx	@dptr,a
                           1374 ;	aes220_progFpga.c:290: SYNCDELAY();
   041E 00                 1375 	 nop 
   041F 00                 1376 	 nop 
   0420 00                 1377 	 nop 
   0421 00                 1378 	 nop 
                           1379 ;	aes220_progFpga.c:291: EP6BCL=LSB(PAGE_SIZE);
   0422 90 E6 99           1380 	mov	dptr,#_EP6BCL
   0425 74 08              1381 	mov	a,#0x08
   0427 F0                 1382 	movx	@dptr,a
                           1383 ;	aes220_progFpga.c:292: break; // end of case READ_PAGE
                           1384 ;	aes220_progFpga.c:293: case RESET_F:
   0428 80 26              1385 	sjmp	00109$
   042A                    1386 00106$:
                           1387 ;	aes220_progFpga.c:294: PROG_B = 0;
   042A C2 B0              1388 	clr	_PD0
                           1389 ;	aes220_progFpga.c:295: LED6 = 1; // D6 OFF
   042C D2 90              1390 	setb	_PB0
                           1391 ;	aes220_progFpga.c:296: M2 = 0;
   042E C2 91              1392 	clr	_PB1
                           1393 ;	aes220_progFpga.c:297: M1 = 1;
   0430 D2 95              1394 	setb	_PB5
                           1395 ;	aes220_progFpga.c:298: M0 = 1;
   0432 D2 93              1396 	setb	_PB3
                           1397 ;	aes220_progFpga.c:299: VS2 = 1;
   0434 D2 92              1398 	setb	_PB2
                           1399 ;	aes220_progFpga.c:300: VS1 = 1;
   0436 D2 97              1400 	setb	_PB7
                           1401 ;	aes220_progFpga.c:301: VS0 = 1;
   0438 D2 96              1402 	setb	_PB6
                           1403 ;	aes220_progFpga.c:302: delay(1000);
   043A 90 03 E8           1404 	mov	dptr,#0x03E8
   043D 12 0B C9           1405 	lcall	_delay
                           1406 ;	aes220_progFpga.c:303: PROG_B = 1;
   0440 D2 B0              1407 	setb	_PD0
                           1408 ;	aes220_progFpga.c:304: LED6 = 0; // D6 ON
   0442 C2 90              1409 	clr	_PB0
                           1410 ;	aes220_progFpga.c:305: break; // end of case RESET_FPGA
                           1411 ;	aes220_progFpga.c:306: case LED_OFF:
   0444 80 0A              1412 	sjmp	00109$
   0446                    1413 00107$:
                           1414 ;	aes220_progFpga.c:307: CS_B = 0;
   0446 C2 B3              1415 	clr	_PD3
                           1416 ;	aes220_progFpga.c:308: LED6 = 1; // D6 OFF
   0448 D2 90              1417 	setb	_PB0
                           1418 ;	aes220_progFpga.c:309: CS_B = 1;
   044A D2 B3              1419 	setb	_PD3
                           1420 ;	aes220_progFpga.c:310: break; // end of case RESET_FPGA
                           1421 ;	aes220_progFpga.c:311: default:
   044C 80 02              1422 	sjmp	00109$
   044E                    1423 00108$:
                           1424 ;	aes220_progFpga.c:312: LED6 = 1 ; // D6 OFF
   044E D2 90              1425 	setb	_PB0
                           1426 ;	aes220_progFpga.c:314: } // end of switch
   0450                    1427 00109$:
                           1428 ;	aes220_progFpga.c:315: REARM(); // ep2
   0450 90 E6 91           1429 	mov	dptr,#_EP2BCL
   0453 74 80              1430 	mov	a,#0x80
   0455 F0                 1431 	movx	@dptr,a
   0456 02 03 20           1432 	ljmp	00113$
                           1433 ;------------------------------------------------------------
                           1434 ;Allocation info for local variables in function 'handle_vendorcommand'
                           1435 ;------------------------------------------------------------
                           1436 ;cmd                       Allocated to registers r2 
                           1437 ;pep                       Allocated to registers r3 r4 
                           1438 ;------------------------------------------------------------
                           1439 ;	aes220_progFpga.c:326: BOOL handle_vendorcommand(BYTE cmd) {
                           1440 ;	-----------------------------------------
                           1441 ;	 function handle_vendorcommand
                           1442 ;	-----------------------------------------
   0459                    1443 _handle_vendorcommand:
   0459 AA 82              1444 	mov	r2,dpl
                           1445 ;	aes220_progFpga.c:328: switch ( cmd ) {
   045B BA B1 52           1446 	cjne	r2,#0xB1,00104$
                           1447 ;	aes220_progFpga.c:332: xdata BYTE* pep= ep_addr(SETUPDAT[2]);
   045E 90 E6 BA           1448 	mov	dptr,#(_SETUPDAT + 0x0002)
   0461 E0                 1449 	movx	a,@dptr
   0462 F5 82              1450 	mov	dpl,a
   0464 C0 02              1451 	push	ar2
   0466 12 07 E0           1452 	lcall	_ep_addr
                           1453 ;	aes220_progFpga.c:333: printf ( "ep %02x\n" , *pep );
   0469 AB 82              1454 	mov	r3,dpl
   046B AC 83              1455 	mov  r4,dph
   046D E0                 1456 	movx	a,@dptr
   046E FD                 1457 	mov	r5,a
   046F 7E 00              1458 	mov	r6,#0x00
   0471 C0 03              1459 	push	ar3
   0473 C0 04              1460 	push	ar4
   0475 C0 05              1461 	push	ar5
   0477 C0 06              1462 	push	ar6
   0479 74 2A              1463 	mov	a,#__str_2
   047B C0 E0              1464 	push	acc
   047D 74 13              1465 	mov	a,#(__str_2 >> 8)
   047F C0 E0              1466 	push	acc
   0481 74 80              1467 	mov	a,#0x80
   0483 C0 E0              1468 	push	acc
   0485 12 0C 44           1469 	lcall	_printf
   0488 E5 81              1470 	mov	a,sp
   048A 24 FB              1471 	add	a,#0xfb
   048C F5 81              1472 	mov	sp,a
   048E D0 04              1473 	pop	ar4
   0490 D0 03              1474 	pop	ar3
   0492 D0 02              1475 	pop	ar2
                           1476 ;	aes220_progFpga.c:334: if (pep) {
   0494 EB                 1477 	mov	a,r3
   0495 4C                 1478 	orl	a,r4
   0496 60 18              1479 	jz	00104$
                           1480 ;	aes220_progFpga.c:335: EP0BUF[0] = *pep;
   0498 8B 82              1481 	mov	dpl,r3
   049A 8C 83              1482 	mov	dph,r4
   049C E0                 1483 	movx	a,@dptr
   049D 90 E7 40           1484 	mov	dptr,#_EP0BUF
   04A0 F0                 1485 	movx	@dptr,a
                           1486 ;	aes220_progFpga.c:336: EP0BCH=0;
   04A1 90 E6 8A           1487 	mov	dptr,#_EP0BCH
   04A4 E4                 1488 	clr	a
   04A5 F0                 1489 	movx	@dptr,a
                           1490 ;	aes220_progFpga.c:337: EP0BCL=1;
   04A6 90 E6 8B           1491 	mov	dptr,#_EP0BCL
   04A9 74 01              1492 	mov	a,#0x01
   04AB F0                 1493 	movx	@dptr,a
                           1494 ;	aes220_progFpga.c:338: return TRUE;
   04AC 75 82 01           1495 	mov	dpl,#0x01
                           1496 ;	aes220_progFpga.c:341: default:
   04AF 22                 1497 	ret
   04B0                    1498 00104$:
                           1499 ;	aes220_progFpga.c:342: printf ( "Need to implement vendor command: %02x\n", cmd );
   04B0 7B 00              1500 	mov	r3,#0x00
   04B2 C0 02              1501 	push	ar2
   04B4 C0 03              1502 	push	ar3
   04B6 74 33              1503 	mov	a,#__str_3
   04B8 C0 E0              1504 	push	acc
   04BA 74 13              1505 	mov	a,#(__str_3 >> 8)
   04BC C0 E0              1506 	push	acc
   04BE 74 80              1507 	mov	a,#0x80
   04C0 C0 E0              1508 	push	acc
   04C2 12 0C 44           1509 	lcall	_printf
   04C5 E5 81              1510 	mov	a,sp
   04C7 24 FB              1511 	add	a,#0xfb
   04C9 F5 81              1512 	mov	sp,a
                           1513 ;	aes220_progFpga.c:344: return FALSE;
   04CB 75 82 00           1514 	mov	dpl,#0x00
   04CE 22                 1515 	ret
                           1516 ;------------------------------------------------------------
                           1517 ;Allocation info for local variables in function 'handle_get_interface'
                           1518 ;------------------------------------------------------------
                           1519 ;alt_ifc                   Allocated with name '_handle_get_interface_PARM_2'
                           1520 ;ifc                       Allocated to registers r2 
                           1521 ;------------------------------------------------------------
                           1522 ;	aes220_progFpga.c:348: BOOL handle_get_interface(BYTE ifc, BYTE* alt_ifc) {
                           1523 ;	-----------------------------------------
                           1524 ;	 function handle_get_interface
                           1525 ;	-----------------------------------------
   04CF                    1526 _handle_get_interface:
   04CF AA 82              1527 	mov	r2,dpl
                           1528 ;	aes220_progFpga.c:349: printf ( "Get Interface\n" );
   04D1 C0 02              1529 	push	ar2
   04D3 74 5B              1530 	mov	a,#__str_4
   04D5 C0 E0              1531 	push	acc
   04D7 74 13              1532 	mov	a,#(__str_4 >> 8)
   04D9 C0 E0              1533 	push	acc
   04DB 74 80              1534 	mov	a,#0x80
   04DD C0 E0              1535 	push	acc
   04DF 12 0C 44           1536 	lcall	_printf
   04E2 15 81              1537 	dec	sp
   04E4 15 81              1538 	dec	sp
   04E6 15 81              1539 	dec	sp
   04E8 D0 02              1540 	pop	ar2
                           1541 ;	aes220_progFpga.c:350: if (ifc==0) {*alt_ifc=0; return TRUE;} else { return FALSE;}
   04EA EA                 1542 	mov	a,r2
   04EB 70 14              1543 	jnz	00102$
   04ED AA 19              1544 	mov	r2,_handle_get_interface_PARM_2
   04EF AB 1A              1545 	mov	r3,(_handle_get_interface_PARM_2 + 1)
   04F1 AC 1B              1546 	mov	r4,(_handle_get_interface_PARM_2 + 2)
   04F3 8A 82              1547 	mov	dpl,r2
   04F5 8B 83              1548 	mov	dph,r3
   04F7 8C F0              1549 	mov	b,r4
   04F9 E4                 1550 	clr	a
   04FA 12 0A 98           1551 	lcall	__gptrput
   04FD 75 82 01           1552 	mov	dpl,#0x01
   0500 22                 1553 	ret
   0501                    1554 00102$:
   0501 75 82 00           1555 	mov	dpl,#0x00
   0504 22                 1556 	ret
                           1557 ;------------------------------------------------------------
                           1558 ;Allocation info for local variables in function 'handle_set_interface'
                           1559 ;------------------------------------------------------------
                           1560 ;alt_ifc                   Allocated with name '_handle_set_interface_PARM_2'
                           1561 ;ifc                       Allocated to registers r2 
                           1562 ;------------------------------------------------------------
                           1563 ;	aes220_progFpga.c:352: BOOL handle_set_interface(BYTE ifc, BYTE alt_ifc) {
                           1564 ;	-----------------------------------------
                           1565 ;	 function handle_set_interface
                           1566 ;	-----------------------------------------
   0505                    1567 _handle_set_interface:
   0505 AA 82              1568 	mov	r2,dpl
                           1569 ;	aes220_progFpga.c:353: printf ( "Set interface %d to alt: %d\n" , ifc, alt_ifc );
   0507 AB 1C              1570 	mov	r3,_handle_set_interface_PARM_2
   0509 7C 00              1571 	mov	r4,#0x00
   050B 8A 05              1572 	mov	ar5,r2
   050D 7E 00              1573 	mov	r6,#0x00
   050F C0 02              1574 	push	ar2
   0511 C0 03              1575 	push	ar3
   0513 C0 04              1576 	push	ar4
   0515 C0 05              1577 	push	ar5
   0517 C0 06              1578 	push	ar6
   0519 74 6A              1579 	mov	a,#__str_5
   051B C0 E0              1580 	push	acc
   051D 74 13              1581 	mov	a,#(__str_5 >> 8)
   051F C0 E0              1582 	push	acc
   0521 74 80              1583 	mov	a,#0x80
   0523 C0 E0              1584 	push	acc
   0525 12 0C 44           1585 	lcall	_printf
   0528 E5 81              1586 	mov	a,sp
   052A 24 F9              1587 	add	a,#0xf9
   052C F5 81              1588 	mov	sp,a
   052E D0 02              1589 	pop	ar2
                           1590 ;	aes220_progFpga.c:355: if (ifc==0&&alt_ifc==0) {
   0530 EA                 1591 	mov	a,r2
   0531 60 03              1592 	jz	00109$
   0533 02 05 AA           1593 	ljmp	00102$
   0536                    1594 00109$:
   0536 E5 1C              1595 	mov	a,_handle_set_interface_PARM_2
   0538 70 70              1596 	jnz	00102$
                           1597 ;	aes220_progFpga.c:358: RESETTOGGLE(0x02);
   053A 90 E6 83           1598 	mov	dptr,#_TOGCTL
   053D 74 02              1599 	mov	a,#0x02
   053F F0                 1600 	movx	@dptr,a
   0540 E0                 1601 	movx	a,@dptr
   0541 FA                 1602 	mov	r2,a
   0542 90 E6 83           1603 	mov	dptr,#_TOGCTL
   0545 74 20              1604 	mov	a,#0x20
   0547 4A                 1605 	orl	a,r2
   0548 F0                 1606 	movx	@dptr,a
                           1607 ;	aes220_progFpga.c:359: RESETTOGGLE(0x86);
   0549 90 E6 83           1608 	mov	dptr,#_TOGCTL
   054C 74 16              1609 	mov	a,#0x16
   054E F0                 1610 	movx	@dptr,a
   054F E0                 1611 	movx	a,@dptr
   0550 FA                 1612 	mov	r2,a
   0551 90 E6 83           1613 	mov	dptr,#_TOGCTL
   0554 74 20              1614 	mov	a,#0x20
   0556 4A                 1615 	orl	a,r2
   0557 F0                 1616 	movx	@dptr,a
                           1617 ;	aes220_progFpga.c:361: RESETFIFO(0x02);
   0558 90 E6 04           1618 	mov	dptr,#_FIFORESET
   055B 74 80              1619 	mov	a,#0x80
   055D F0                 1620 	movx	@dptr,a
   055E 00                 1621 	 nop 
   055F 00                 1622 	 nop 
   0560 00                 1623 	 nop 
   0561 00                 1624 	 nop 
   0562 90 E6 04           1625 	mov	dptr,#_FIFORESET
   0565 74 02              1626 	mov	a,#0x02
   0567 F0                 1627 	movx	@dptr,a
   0568 00                 1628 	 nop 
   0569 00                 1629 	 nop 
   056A 00                 1630 	 nop 
   056B 00                 1631 	 nop 
   056C 90 E6 04           1632 	mov	dptr,#_FIFORESET
   056F E4                 1633 	clr	a
   0570 F0                 1634 	movx	@dptr,a
   0571 00                 1635 	 nop 
   0572 00                 1636 	 nop 
   0573 00                 1637 	 nop 
   0574 00                 1638 	 nop 
                           1639 ;	aes220_progFpga.c:362: EP2BCL=0x80;
   0575 90 E6 91           1640 	mov	dptr,#_EP2BCL
   0578 74 80              1641 	mov	a,#0x80
   057A F0                 1642 	movx	@dptr,a
                           1643 ;	aes220_progFpga.c:363: SYNCDELAY();
   057B 00                 1644 	 nop 
   057C 00                 1645 	 nop 
   057D 00                 1646 	 nop 
   057E 00                 1647 	 nop 
                           1648 ;	aes220_progFpga.c:364: EP2BCL=0X80;
   057F 90 E6 91           1649 	mov	dptr,#_EP2BCL
   0582 74 80              1650 	mov	a,#0x80
   0584 F0                 1651 	movx	@dptr,a
                           1652 ;	aes220_progFpga.c:365: SYNCDELAY();
   0585 00                 1653 	 nop 
   0586 00                 1654 	 nop 
   0587 00                 1655 	 nop 
   0588 00                 1656 	 nop 
                           1657 ;	aes220_progFpga.c:366: RESETFIFO(0x86);
   0589 90 E6 04           1658 	mov	dptr,#_FIFORESET
   058C 74 80              1659 	mov	a,#0x80
   058E F0                 1660 	movx	@dptr,a
   058F 00                 1661 	 nop 
   0590 00                 1662 	 nop 
   0591 00                 1663 	 nop 
   0592 00                 1664 	 nop 
   0593 90 E6 04           1665 	mov	dptr,#_FIFORESET
   0596 74 86              1666 	mov	a,#0x86
   0598 F0                 1667 	movx	@dptr,a
   0599 00                 1668 	 nop 
   059A 00                 1669 	 nop 
   059B 00                 1670 	 nop 
   059C 00                 1671 	 nop 
   059D 90 E6 04           1672 	mov	dptr,#_FIFORESET
   05A0 E4                 1673 	clr	a
   05A1 F0                 1674 	movx	@dptr,a
   05A2 00                 1675 	 nop 
   05A3 00                 1676 	 nop 
   05A4 00                 1677 	 nop 
   05A5 00                 1678 	 nop 
                           1679 ;	aes220_progFpga.c:367: return TRUE;
   05A6 75 82 01           1680 	mov	dpl,#0x01
                           1681 ;	aes220_progFpga.c:369: return FALSE;
   05A9 22                 1682 	ret
   05AA                    1683 00102$:
   05AA 75 82 00           1684 	mov	dpl,#0x00
   05AD 22                 1685 	ret
                           1686 ;------------------------------------------------------------
                           1687 ;Allocation info for local variables in function 'handle_get_configuration'
                           1688 ;------------------------------------------------------------
                           1689 ;------------------------------------------------------------
                           1690 ;	aes220_progFpga.c:373: BYTE handle_get_configuration() {
                           1691 ;	-----------------------------------------
                           1692 ;	 function handle_get_configuration
                           1693 ;	-----------------------------------------
   05AE                    1694 _handle_get_configuration:
                           1695 ;	aes220_progFpga.c:374: return 1;
   05AE 75 82 01           1696 	mov	dpl,#0x01
   05B1 22                 1697 	ret
                           1698 ;------------------------------------------------------------
                           1699 ;Allocation info for local variables in function 'handle_set_configuration'
                           1700 ;------------------------------------------------------------
                           1701 ;cfg                       Allocated to registers r2 
                           1702 ;------------------------------------------------------------
                           1703 ;	aes220_progFpga.c:376: BOOL handle_set_configuration(BYTE cfg) {
                           1704 ;	-----------------------------------------
                           1705 ;	 function handle_set_configuration
                           1706 ;	-----------------------------------------
   05B2                    1707 _handle_set_configuration:
   05B2 AA 82              1708 	mov	r2,dpl
                           1709 ;	aes220_progFpga.c:377: return cfg==1 ? TRUE : FALSE; // we only handle cfg 1
   05B4 BA 01 04           1710 	cjne	r2,#0x01,00103$
   05B7 7A 01              1711 	mov	r2,#0x01
   05B9 80 02              1712 	sjmp	00104$
   05BB                    1713 00103$:
   05BB 7A 00              1714 	mov	r2,#0x00
   05BD                    1715 00104$:
   05BD 8A 82              1716 	mov	dpl,r2
   05BF 22                 1717 	ret
                           1718 ;------------------------------------------------------------
                           1719 ;Allocation info for local variables in function 'sudav_isr'
                           1720 ;------------------------------------------------------------
                           1721 ;------------------------------------------------------------
                           1722 ;	aes220_progFpga.c:382: void sudav_isr() interrupt SUDAV_ISR {
                           1723 ;	-----------------------------------------
                           1724 ;	 function sudav_isr
                           1725 ;	-----------------------------------------
   05C0                    1726 _sudav_isr:
   05C0 C0 E0              1727 	push	acc
   05C2 C0 82              1728 	push	dpl
   05C4 C0 83              1729 	push	dph
                           1730 ;	aes220_progFpga.c:384: got_sud=TRUE;
   05C6 D2 01              1731 	setb	_got_sud
                           1732 ;	aes220_progFpga.c:385: CLEAR_SUDAV();
   05C8 53 91 EF           1733 	anl	_EXIF,#0xEF
   05CB 90 E6 5D           1734 	mov	dptr,#_USBIRQ
   05CE 74 01              1735 	mov	a,#0x01
   05D0 F0                 1736 	movx	@dptr,a
   05D1 D0 83              1737 	pop	dph
   05D3 D0 82              1738 	pop	dpl
   05D5 D0 E0              1739 	pop	acc
   05D7 32                 1740 	reti
                           1741 ;	eliminated unneeded push/pop psw
                           1742 ;	eliminated unneeded push/pop b
                           1743 ;------------------------------------------------------------
                           1744 ;Allocation info for local variables in function 'sof_isr'
                           1745 ;------------------------------------------------------------
                           1746 ;------------------------------------------------------------
                           1747 ;	aes220_progFpga.c:390: void sof_isr () interrupt SOF_ISR using 1 {
                           1748 ;	-----------------------------------------
                           1749 ;	 function sof_isr
                           1750 ;	-----------------------------------------
   05D8                    1751 _sof_isr:
                    000A   1752 	ar2 = 0x0a
                    000B   1753 	ar3 = 0x0b
                    000C   1754 	ar4 = 0x0c
                    000D   1755 	ar5 = 0x0d
                    000E   1756 	ar6 = 0x0e
                    000F   1757 	ar7 = 0x0f
                    0008   1758 	ar0 = 0x08
                    0009   1759 	ar1 = 0x09
   05D8 C0 E0              1760 	push	acc
   05DA C0 82              1761 	push	dpl
   05DC C0 83              1762 	push	dph
   05DE C0 D0              1763 	push	psw
   05E0 75 D0 08           1764 	mov	psw,#0x08
                           1765 ;	aes220_progFpga.c:391: ++sofct;
   05E3 90 3C 00           1766 	mov	dptr,#_sofct
   05E6 E0                 1767 	movx	a,@dptr
   05E7 24 01              1768 	add	a,#0x01
   05E9 F0                 1769 	movx	@dptr,a
   05EA A3                 1770 	inc	dptr
   05EB E0                 1771 	movx	a,@dptr
   05EC 34 00              1772 	addc	a,#0x00
   05EE F0                 1773 	movx	@dptr,a
                           1774 ;	aes220_progFpga.c:392: if(sofct==8000) { // about 8000 sof interrupts per second at high speed
   05EF 90 3C 00           1775 	mov	dptr,#_sofct
   05F2 E0                 1776 	movx	a,@dptr
   05F3 FA                 1777 	mov	r2,a
   05F4 A3                 1778 	inc	dptr
   05F5 E0                 1779 	movx	a,@dptr
   05F6 FB                 1780 	mov	r3,a
   05F7 BA 40 19           1781 	cjne	r2,#0x40,00105$
   05FA BB 1F 16           1782 	cjne	r3,#0x1F,00105$
                           1783 ;	aes220_progFpga.c:393: on5=!on5;
   05FD B2 03              1784 	cpl	_on5
                           1785 ;	aes220_progFpga.c:394: if (on5) {d5on();} else {d5off();}
   05FF 30 03 06           1786 	jnb	_on5,00102$
   0602 75 92 B8           1787 	 mov __XPAGE, #0xB8 
   0605 E2                 1788 	 movx a, @r0 
   0606 80 04              1789 	sjmp	00103$
   0608                    1790 00102$:
   0608 75 92 B0           1791 	 mov __XPAGE, #0xB0 
   060B E2                 1792 	 movx a, @r0 
   060C                    1793 00103$:
                           1794 ;	aes220_progFpga.c:395: sofct=0;
   060C 90 3C 00           1795 	mov	dptr,#_sofct
   060F E4                 1796 	clr	a
   0610 F0                 1797 	movx	@dptr,a
   0611 A3                 1798 	inc	dptr
   0612 F0                 1799 	movx	@dptr,a
   0613                    1800 00105$:
                           1801 ;	aes220_progFpga.c:397: CLEAR_SOF();
   0613 53 91 EF           1802 	anl	_EXIF,#0xEF
   0616 90 E6 5D           1803 	mov	dptr,#_USBIRQ
   0619 74 02              1804 	mov	a,#0x02
   061B F0                 1805 	movx	@dptr,a
   061C D0 D0              1806 	pop	psw
   061E D0 83              1807 	pop	dph
   0620 D0 82              1808 	pop	dpl
   0622 D0 E0              1809 	pop	acc
   0624 32                 1810 	reti
                           1811 ;	eliminated unneeded push/pop b
                           1812 ;------------------------------------------------------------
                           1813 ;Allocation info for local variables in function 'usbreset_isr'
                           1814 ;------------------------------------------------------------
                           1815 ;------------------------------------------------------------
                           1816 ;	aes220_progFpga.c:400: void usbreset_isr() interrupt USBRESET_ISR {
                           1817 ;	-----------------------------------------
                           1818 ;	 function usbreset_isr
                           1819 ;	-----------------------------------------
   0625                    1820 _usbreset_isr:
                    0002   1821 	ar2 = 0x02
                    0003   1822 	ar3 = 0x03
                    0004   1823 	ar4 = 0x04
                    0005   1824 	ar5 = 0x05
                    0006   1825 	ar6 = 0x06
                    0007   1826 	ar7 = 0x07
                    0000   1827 	ar0 = 0x00
                    0001   1828 	ar1 = 0x01
   0625 C0 22              1829 	push	bits
   0627 C0 E0              1830 	push	acc
   0629 C0 F0              1831 	push	b
   062B C0 82              1832 	push	dpl
   062D C0 83              1833 	push	dph
   062F C0 02              1834 	push	(0+2)
   0631 C0 03              1835 	push	(0+3)
   0633 C0 04              1836 	push	(0+4)
   0635 C0 05              1837 	push	(0+5)
   0637 C0 06              1838 	push	(0+6)
   0639 C0 07              1839 	push	(0+7)
   063B C0 00              1840 	push	(0+0)
   063D C0 01              1841 	push	(0+1)
   063F C0 D0              1842 	push	psw
   0641 75 D0 00           1843 	mov	psw,#0x00
                           1844 ;	aes220_progFpga.c:401: handle_hispeed(FALSE);
   0644 75 82 00           1845 	mov	dpl,#0x00
   0647 12 09 99           1846 	lcall	_handle_hispeed
                           1847 ;	aes220_progFpga.c:402: CLEAR_USBRESET();
   064A 53 91 EF           1848 	anl	_EXIF,#0xEF
   064D 90 E6 5D           1849 	mov	dptr,#_USBIRQ
   0650 74 10              1850 	mov	a,#0x10
   0652 F0                 1851 	movx	@dptr,a
   0653 D0 D0              1852 	pop	psw
   0655 D0 01              1853 	pop	(0+1)
   0657 D0 00              1854 	pop	(0+0)
   0659 D0 07              1855 	pop	(0+7)
   065B D0 06              1856 	pop	(0+6)
   065D D0 05              1857 	pop	(0+5)
   065F D0 04              1858 	pop	(0+4)
   0661 D0 03              1859 	pop	(0+3)
   0663 D0 02              1860 	pop	(0+2)
   0665 D0 83              1861 	pop	dph
   0667 D0 82              1862 	pop	dpl
   0669 D0 F0              1863 	pop	b
   066B D0 E0              1864 	pop	acc
   066D D0 22              1865 	pop	bits
   066F 32                 1866 	reti
                           1867 ;------------------------------------------------------------
                           1868 ;Allocation info for local variables in function 'hispeed_isr'
                           1869 ;------------------------------------------------------------
                           1870 ;------------------------------------------------------------
                           1871 ;	aes220_progFpga.c:404: void hispeed_isr() interrupt HISPEED_ISR {
                           1872 ;	-----------------------------------------
                           1873 ;	 function hispeed_isr
                           1874 ;	-----------------------------------------
   0670                    1875 _hispeed_isr:
   0670 C0 22              1876 	push	bits
   0672 C0 E0              1877 	push	acc
   0674 C0 F0              1878 	push	b
   0676 C0 82              1879 	push	dpl
   0678 C0 83              1880 	push	dph
   067A C0 02              1881 	push	(0+2)
   067C C0 03              1882 	push	(0+3)
   067E C0 04              1883 	push	(0+4)
   0680 C0 05              1884 	push	(0+5)
   0682 C0 06              1885 	push	(0+6)
   0684 C0 07              1886 	push	(0+7)
   0686 C0 00              1887 	push	(0+0)
   0688 C0 01              1888 	push	(0+1)
   068A C0 D0              1889 	push	psw
   068C 75 D0 00           1890 	mov	psw,#0x00
                           1891 ;	aes220_progFpga.c:405: handle_hispeed(TRUE);
   068F 75 82 01           1892 	mov	dpl,#0x01
   0692 12 09 99           1893 	lcall	_handle_hispeed
                           1894 ;	aes220_progFpga.c:406: CLEAR_HISPEED();
   0695 53 91 EF           1895 	anl	_EXIF,#0xEF
   0698 90 E6 5D           1896 	mov	dptr,#_USBIRQ
   069B 74 20              1897 	mov	a,#0x20
   069D F0                 1898 	movx	@dptr,a
   069E D0 D0              1899 	pop	psw
   06A0 D0 01              1900 	pop	(0+1)
   06A2 D0 00              1901 	pop	(0+0)
   06A4 D0 07              1902 	pop	(0+7)
   06A6 D0 06              1903 	pop	(0+6)
   06A8 D0 05              1904 	pop	(0+5)
   06AA D0 04              1905 	pop	(0+4)
   06AC D0 03              1906 	pop	(0+3)
   06AE D0 02              1907 	pop	(0+2)
   06B0 D0 83              1908 	pop	dph
   06B2 D0 82              1909 	pop	dpl
   06B4 D0 F0              1910 	pop	b
   06B6 D0 E0              1911 	pop	acc
   06B8 D0 22              1912 	pop	bits
   06BA 32                 1913 	reti
                           1914 	.area CSEG    (CODE)
                           1915 	.area CONST   (CODE)
   12FF                    1916 __str_0:
   12FF 44 6F 6E 65 20 69  1917 	.ascii "Done initializing stuff"
        6E 69 74 69 61 6C
        69 7A 69 6E 67 20
        73 74 75 66 66
   1316 0A                 1918 	.db 0x0A
   1317 00                 1919 	.db 0x00
   1318                    1920 __str_1:
   1318 48 61 6E 64 6C 65  1921 	.ascii "Handle setupdata"
        20 73 65 74 75 70
        64 61 74 61
   1328 0A                 1922 	.db 0x0A
   1329 00                 1923 	.db 0x00
   132A                    1924 __str_2:
   132A 65 70 20 25 30 32  1925 	.ascii "ep %02x"
        78
   1331 0A                 1926 	.db 0x0A
   1332 00                 1927 	.db 0x00
   1333                    1928 __str_3:
   1333 4E 65 65 64 20 74  1929 	.ascii "Need to implement vendor command: %02x"
        6F 20 69 6D 70 6C
        65 6D 65 6E 74 20
        76 65 6E 64 6F 72
        20 63 6F 6D 6D 61
        6E 64 3A 20 25 30
        32 78
   1359 0A                 1930 	.db 0x0A
   135A 00                 1931 	.db 0x00
   135B                    1932 __str_4:
   135B 47 65 74 20 49 6E  1933 	.ascii "Get Interface"
        74 65 72 66 61 63
        65
   1368 0A                 1934 	.db 0x0A
   1369 00                 1935 	.db 0x00
   136A                    1936 __str_5:
   136A 53 65 74 20 69 6E  1937 	.ascii "Set interface %d to alt: %d"
        74 65 72 66 61 63
        65 20 25 64 20 74
        6F 20 61 6C 74 3A
        20 25 64
   1385 0A                 1938 	.db 0x0A
   1386 00                 1939 	.db 0x00
                           1940 	.area XINIT   (CODE)
   1392                    1941 __xinit__sofct:
   1392 00 00              1942 	.byte #0x00,#0x00
                           1943 	.area CABS    (ABS,CODE)
