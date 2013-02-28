                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
                              4 ; This file was generated Thu Feb 28 13:18:13 2013
                              5 ;--------------------------------------------------------
                              6 	.module aes220_Firmware
                              7 	.optsdcc -mmcs51 --model-small
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _handle_set_interface_PARM_2
                             13 	.globl _handle_get_interface_PARM_2
                             14 	.globl _codeVersion
                             15 	.globl _timer0_isr
                             16 	.globl _handle_set_configuration
                             17 	.globl _handle_get_configuration
                             18 	.globl _handle_set_interface
                             19 	.globl _handle_get_interface
                             20 	.globl _handle_vendorcommand
                             21 	.globl _main
                             22 	.globl _EIPX6
                             23 	.globl _EIPX5
                             24 	.globl _EIPX4
                             25 	.globl _PI2C
                             26 	.globl _PUSB
                             27 	.globl _EIEX6
                             28 	.globl _EIEX5
                             29 	.globl _EIEX4
                             30 	.globl _EI2C
                             31 	.globl _EUSB
                             32 	.globl _SMOD1
                             33 	.globl _ERESI
                             34 	.globl _RESI
                             35 	.globl _INT6
                             36 	.globl _CY
                             37 	.globl _AC
                             38 	.globl _F0
                             39 	.globl _RS1
                             40 	.globl _RS0
                             41 	.globl _OV
                             42 	.globl _FL
                             43 	.globl _P
                             44 	.globl _TF2
                             45 	.globl _EXF2
                             46 	.globl _RCLK
                             47 	.globl _TCLK
                             48 	.globl _EXEN2
                             49 	.globl _TR2
                             50 	.globl _C_T2
                             51 	.globl _CP_RL2
                             52 	.globl _SM01
                             53 	.globl _SM11
                             54 	.globl _SM21
                             55 	.globl _REN1
                             56 	.globl _TB81
                             57 	.globl _RB81
                             58 	.globl _TI1
                             59 	.globl _RI1
                             60 	.globl _PS1
                             61 	.globl _PT2
                             62 	.globl _PS0
                             63 	.globl _PT1
                             64 	.globl _PX1
                             65 	.globl _PT0
                             66 	.globl _PX0
                             67 	.globl _PD7
                             68 	.globl _PD6
                             69 	.globl _PD5
                             70 	.globl _PD4
                             71 	.globl _PD3
                             72 	.globl _PD2
                             73 	.globl _PD1
                             74 	.globl _PD0
                             75 	.globl _EA
                             76 	.globl _ES1
                             77 	.globl _ET2
                             78 	.globl _ES0
                             79 	.globl _ET1
                             80 	.globl _EX1
                             81 	.globl _ET0
                             82 	.globl _EX0
                             83 	.globl _PC7
                             84 	.globl _PC6
                             85 	.globl _PC5
                             86 	.globl _PC4
                             87 	.globl _PC3
                             88 	.globl _PC2
                             89 	.globl _PC1
                             90 	.globl _PC0
                             91 	.globl _SM0
                             92 	.globl _SM1
                             93 	.globl _SM2
                             94 	.globl _REN
                             95 	.globl _TB8
                             96 	.globl _RB8
                             97 	.globl _TI
                             98 	.globl _RI
                             99 	.globl _PB7
                            100 	.globl _PB6
                            101 	.globl _PB5
                            102 	.globl _PB4
                            103 	.globl _PB3
                            104 	.globl _PB2
                            105 	.globl _PB1
                            106 	.globl _PB0
                            107 	.globl _TF1
                            108 	.globl _TR1
                            109 	.globl _TF0
                            110 	.globl _TR0
                            111 	.globl _IE1
                            112 	.globl _IT1
                            113 	.globl _IE0
                            114 	.globl _IT0
                            115 	.globl _PA7
                            116 	.globl _PA6
                            117 	.globl _PA5
                            118 	.globl _PA4
                            119 	.globl _PA3
                            120 	.globl _PA2
                            121 	.globl _PA1
                            122 	.globl _PA0
                            123 	.globl _EIP
                            124 	.globl _B
                            125 	.globl _EIE
                            126 	.globl _ACC
                            127 	.globl _EICON
                            128 	.globl _PSW
                            129 	.globl _TH2
                            130 	.globl _TL2
                            131 	.globl _RCAP2H
                            132 	.globl _RCAP2L
                            133 	.globl _T2CON
                            134 	.globl _SBUF1
                            135 	.globl _SCON1
                            136 	.globl _GPIFSGLDATLNOX
                            137 	.globl _GPIFSGLDATLX
                            138 	.globl _GPIFSGLDATH
                            139 	.globl _GPIFTRIG
                            140 	.globl _EP01STAT
                            141 	.globl _IP
                            142 	.globl _OEE
                            143 	.globl _OED
                            144 	.globl _OEC
                            145 	.globl _OEB
                            146 	.globl _OEA
                            147 	.globl _IOE
                            148 	.globl _IOD
                            149 	.globl _AUTOPTRSETUP
                            150 	.globl _EP68FIFOFLGS
                            151 	.globl _EP24FIFOFLGS
                            152 	.globl _EP2468STAT
                            153 	.globl _IE
                            154 	.globl _INT4CLR
                            155 	.globl _INT2CLR
                            156 	.globl _IOC
                            157 	.globl _AUTOPTRL2
                            158 	.globl _AUTOPTRH2
                            159 	.globl _AUTOPTRL1
                            160 	.globl _AUTOPTRH1
                            161 	.globl _SBUF0
                            162 	.globl _SCON0
                            163 	.globl __XPAGE
                            164 	.globl _EXIF
                            165 	.globl _IOB
                            166 	.globl _CKCON
                            167 	.globl _TH1
                            168 	.globl _TH0
                            169 	.globl _TL1
                            170 	.globl _TL0
                            171 	.globl _TMOD
                            172 	.globl _TCON
                            173 	.globl _PCON
                            174 	.globl _DPS
                            175 	.globl _DPH1
                            176 	.globl _DPL1
                            177 	.globl _DPH
                            178 	.globl _DPL
                            179 	.globl _SP
                            180 	.globl _IOA
                            181 	.globl _sofct
                            182 	.globl _TURN3V3OFF
                            183 	.globl _prevMode
                            184 	.globl _uCMode
                            185 	.globl _fpgaStatus
                            186 	.globl _fpgaProgrammed
                            187 	.globl _programFpga
                            188 	.globl _fpgaFileLen
                            189 	.globl _lcount
                            190 	.globl _GPCR2
                            191 	.globl _ECC2B2
                            192 	.globl _ECC2B1
                            193 	.globl _ECC2B0
                            194 	.globl _ECC1B2
                            195 	.globl _ECC1B1
                            196 	.globl _ECC1B0
                            197 	.globl _ECCRESET
                            198 	.globl _ECCCFG
                            199 	.globl _EP8FIFOBUF
                            200 	.globl _EP6FIFOBUF
                            201 	.globl _EP4FIFOBUF
                            202 	.globl _EP2FIFOBUF
                            203 	.globl _EP1INBUF
                            204 	.globl _EP1OUTBUF
                            205 	.globl _EP0BUF
                            206 	.globl _UDMACRCQUAL
                            207 	.globl _UDMACRCL
                            208 	.globl _UDMACRCH
                            209 	.globl _GPIFHOLDAMOUNT
                            210 	.globl _FLOWSTBHPERIOD
                            211 	.globl _FLOWSTBEDGE
                            212 	.globl _FLOWSTB
                            213 	.globl _FLOWHOLDOFF
                            214 	.globl _FLOWEQ1CTL
                            215 	.globl _FLOWEQ0CTL
                            216 	.globl _FLOWLOGIC
                            217 	.globl _FLOWSTATE
                            218 	.globl _GPIFABORT
                            219 	.globl _GPIFREADYSTAT
                            220 	.globl _GPIFREADYCFG
                            221 	.globl _XGPIFSGLDATLNOX
                            222 	.globl _XGPIFSGLDATLX
                            223 	.globl _XGPIFSGLDATH
                            224 	.globl _EP8GPIFTRIG
                            225 	.globl _EP8GPIFPFSTOP
                            226 	.globl _EP8GPIFFLGSEL
                            227 	.globl _EP6GPIFTRIG
                            228 	.globl _EP6GPIFPFSTOP
                            229 	.globl _EP6GPIFFLGSEL
                            230 	.globl _EP4GPIFTRIG
                            231 	.globl _EP4GPIFPFSTOP
                            232 	.globl _EP4GPIFFLGSEL
                            233 	.globl _EP2GPIFTRIG
                            234 	.globl _EP2GPIFPFSTOP
                            235 	.globl _EP2GPIFFLGSEL
                            236 	.globl _GPIFTCB0
                            237 	.globl _GPIFTCB1
                            238 	.globl _GPIFTCB2
                            239 	.globl _GPIFTCB3
                            240 	.globl _GPIFADRL
                            241 	.globl _GPIFADRH
                            242 	.globl _GPIFCTLCFG
                            243 	.globl _GPIFIDLECTL
                            244 	.globl _GPIFIDLECS
                            245 	.globl _GPIFWFSELECT
                            246 	.globl _SETUPDAT
                            247 	.globl _SUDPTRCTL
                            248 	.globl _SUDPTRL
                            249 	.globl _SUDPTRH
                            250 	.globl _EP8FIFOBCL
                            251 	.globl _EP8FIFOBCH
                            252 	.globl _EP6FIFOBCL
                            253 	.globl _EP6FIFOBCH
                            254 	.globl _EP4FIFOBCL
                            255 	.globl _EP4FIFOBCH
                            256 	.globl _EP2FIFOBCL
                            257 	.globl _EP2FIFOBCH
                            258 	.globl _EP8FIFOFLGS
                            259 	.globl _EP6FIFOFLGS
                            260 	.globl _EP4FIFOFLGS
                            261 	.globl _EP2FIFOFLGS
                            262 	.globl _EP8CS
                            263 	.globl _EP6CS
                            264 	.globl _EP4CS
                            265 	.globl _EP2CS
                            266 	.globl _EP1INCS
                            267 	.globl _EP1OUTCS
                            268 	.globl _EP0CS
                            269 	.globl _EP8BCL
                            270 	.globl _EP8BCH
                            271 	.globl _EP6BCL
                            272 	.globl _EP6BCH
                            273 	.globl _EP4BCL
                            274 	.globl _EP4BCH
                            275 	.globl _EP2BCL
                            276 	.globl _EP2BCH
                            277 	.globl _EP1INBC
                            278 	.globl _EP1OUTBC
                            279 	.globl _EP0BCL
                            280 	.globl _EP0BCH
                            281 	.globl _FNADDR
                            282 	.globl _MICROFRAME
                            283 	.globl _USBFRAMEL
                            284 	.globl _USBFRAMEH
                            285 	.globl _TOGCTL
                            286 	.globl _WAKEUPCS
                            287 	.globl _SUSPEND
                            288 	.globl _USBCS
                            289 	.globl _XAUTODAT2
                            290 	.globl _XAUTODAT1
                            291 	.globl _I2CTL
                            292 	.globl _I2DAT
                            293 	.globl _I2CS
                            294 	.globl _PORTECFG
                            295 	.globl _PORTCCFG
                            296 	.globl _PORTACFG
                            297 	.globl _INTSETUP
                            298 	.globl _INT4IVEC
                            299 	.globl _INT2IVEC
                            300 	.globl _CLRERRCNT
                            301 	.globl _ERRCNTLIM
                            302 	.globl _USBERRIRQ
                            303 	.globl _USBERRIE
                            304 	.globl _GPIFIRQ
                            305 	.globl _GPIFIE
                            306 	.globl _EPIRQ
                            307 	.globl _EPIE
                            308 	.globl _USBIRQ
                            309 	.globl _USBIE
                            310 	.globl _NAKIRQ
                            311 	.globl _NAKIE
                            312 	.globl _IBNIRQ
                            313 	.globl _IBNIE
                            314 	.globl _EP8FIFOIRQ
                            315 	.globl _EP8FIFOIE
                            316 	.globl _EP6FIFOIRQ
                            317 	.globl _EP6FIFOIE
                            318 	.globl _EP4FIFOIRQ
                            319 	.globl _EP4FIFOIE
                            320 	.globl _EP2FIFOIRQ
                            321 	.globl _EP2FIFOIE
                            322 	.globl _OUTPKTEND
                            323 	.globl _INPKTEND
                            324 	.globl _EP8ISOINPKTS
                            325 	.globl _EP6ISOINPKTS
                            326 	.globl _EP4ISOINPKTS
                            327 	.globl _EP2ISOINPKTS
                            328 	.globl _EP8FIFOPFL
                            329 	.globl _EP8FIFOPFH
                            330 	.globl _EP6FIFOPFL
                            331 	.globl _EP6FIFOPFH
                            332 	.globl _EP4FIFOPFL
                            333 	.globl _EP4FIFOPFH
                            334 	.globl _EP2FIFOPFL
                            335 	.globl _EP2FIFOPFH
                            336 	.globl _EP8AUTOINLENL
                            337 	.globl _EP8AUTOINLENH
                            338 	.globl _EP6AUTOINLENL
                            339 	.globl _EP6AUTOINLENH
                            340 	.globl _EP4AUTOINLENL
                            341 	.globl _EP4AUTOINLENH
                            342 	.globl _EP2AUTOINLENL
                            343 	.globl _EP2AUTOINLENH
                            344 	.globl _EP8FIFOCFG
                            345 	.globl _EP6FIFOCFG
                            346 	.globl _EP4FIFOCFG
                            347 	.globl _EP2FIFOCFG
                            348 	.globl _EP8CFG
                            349 	.globl _EP6CFG
                            350 	.globl _EP4CFG
                            351 	.globl _EP2CFG
                            352 	.globl _EP1INCFG
                            353 	.globl _EP1OUTCFG
                            354 	.globl _REVCTL
                            355 	.globl _REVID
                            356 	.globl _FIFOPINPOLAR
                            357 	.globl _UART230
                            358 	.globl _BPADDRL
                            359 	.globl _BPADDRH
                            360 	.globl _BREAKPT
                            361 	.globl _FIFORESET
                            362 	.globl _PINFLAGSCD
                            363 	.globl _PINFLAGSAB
                            364 	.globl _IFCONFIG
                            365 	.globl _CPUCS
                            366 	.globl _RES_WAVEDATA_END
                            367 	.globl _GPIF_WAVE_DATA
                            368 	.globl _on5
                            369 	.globl _on
                            370 	.globl _got_sud
                            371 	.globl _gotbuf
                            372 	.globl _icount
                            373 	.globl _bytes
                            374 	.globl _CONFIGURE_FPGA
                            375 	.globl _START_CONFIG_PROC
                            376 	.globl _sudav_isr
                            377 	.globl _sof_isr
                            378 	.globl _usbreset_isr
                            379 	.globl _hispeed_isr
                            380 ;--------------------------------------------------------
                            381 ; special function registers
                            382 ;--------------------------------------------------------
                            383 	.area RSEG    (DATA)
                    0080    384 _IOA	=	0x0080
                    0081    385 _SP	=	0x0081
                    0082    386 _DPL	=	0x0082
                    0083    387 _DPH	=	0x0083
                    0084    388 _DPL1	=	0x0084
                    0085    389 _DPH1	=	0x0085
                    0086    390 _DPS	=	0x0086
                    0087    391 _PCON	=	0x0087
                    0088    392 _TCON	=	0x0088
                    0089    393 _TMOD	=	0x0089
                    008A    394 _TL0	=	0x008a
                    008B    395 _TL1	=	0x008b
                    008C    396 _TH0	=	0x008c
                    008D    397 _TH1	=	0x008d
                    008E    398 _CKCON	=	0x008e
                    0090    399 _IOB	=	0x0090
                    0091    400 _EXIF	=	0x0091
                    0092    401 __XPAGE	=	0x0092
                    0098    402 _SCON0	=	0x0098
                    0099    403 _SBUF0	=	0x0099
                    009A    404 _AUTOPTRH1	=	0x009a
                    009B    405 _AUTOPTRL1	=	0x009b
                    009D    406 _AUTOPTRH2	=	0x009d
                    009E    407 _AUTOPTRL2	=	0x009e
                    00A0    408 _IOC	=	0x00a0
                    00A1    409 _INT2CLR	=	0x00a1
                    00A2    410 _INT4CLR	=	0x00a2
                    00A8    411 _IE	=	0x00a8
                    00AA    412 _EP2468STAT	=	0x00aa
                    00AB    413 _EP24FIFOFLGS	=	0x00ab
                    00AC    414 _EP68FIFOFLGS	=	0x00ac
                    00AF    415 _AUTOPTRSETUP	=	0x00af
                    00B0    416 _IOD	=	0x00b0
                    00B1    417 _IOE	=	0x00b1
                    00B2    418 _OEA	=	0x00b2
                    00B3    419 _OEB	=	0x00b3
                    00B4    420 _OEC	=	0x00b4
                    00B5    421 _OED	=	0x00b5
                    00B6    422 _OEE	=	0x00b6
                    00B8    423 _IP	=	0x00b8
                    00BA    424 _EP01STAT	=	0x00ba
                    00BB    425 _GPIFTRIG	=	0x00bb
                    00BD    426 _GPIFSGLDATH	=	0x00bd
                    00BE    427 _GPIFSGLDATLX	=	0x00be
                    00BF    428 _GPIFSGLDATLNOX	=	0x00bf
                    00C0    429 _SCON1	=	0x00c0
                    00C1    430 _SBUF1	=	0x00c1
                    00C8    431 _T2CON	=	0x00c8
                    00CA    432 _RCAP2L	=	0x00ca
                    00CB    433 _RCAP2H	=	0x00cb
                    00CC    434 _TL2	=	0x00cc
                    00CD    435 _TH2	=	0x00cd
                    00D0    436 _PSW	=	0x00d0
                    00D8    437 _EICON	=	0x00d8
                    00E0    438 _ACC	=	0x00e0
                    00E8    439 _EIE	=	0x00e8
                    00F0    440 _B	=	0x00f0
                    00F8    441 _EIP	=	0x00f8
                            442 ;--------------------------------------------------------
                            443 ; special function bits
                            444 ;--------------------------------------------------------
                            445 	.area RSEG    (DATA)
                    0080    446 _PA0	=	0x0080
                    0081    447 _PA1	=	0x0081
                    0082    448 _PA2	=	0x0082
                    0083    449 _PA3	=	0x0083
                    0084    450 _PA4	=	0x0084
                    0085    451 _PA5	=	0x0085
                    0086    452 _PA6	=	0x0086
                    0087    453 _PA7	=	0x0087
                    0088    454 _IT0	=	0x0088
                    0089    455 _IE0	=	0x0089
                    008A    456 _IT1	=	0x008a
                    008B    457 _IE1	=	0x008b
                    008C    458 _TR0	=	0x008c
                    008D    459 _TF0	=	0x008d
                    008E    460 _TR1	=	0x008e
                    008F    461 _TF1	=	0x008f
                    0090    462 _PB0	=	0x0090
                    0091    463 _PB1	=	0x0091
                    0092    464 _PB2	=	0x0092
                    0093    465 _PB3	=	0x0093
                    0094    466 _PB4	=	0x0094
                    0095    467 _PB5	=	0x0095
                    0096    468 _PB6	=	0x0096
                    0097    469 _PB7	=	0x0097
                    0098    470 _RI	=	0x0098
                    0099    471 _TI	=	0x0099
                    009A    472 _RB8	=	0x009a
                    009B    473 _TB8	=	0x009b
                    009C    474 _REN	=	0x009c
                    009D    475 _SM2	=	0x009d
                    009E    476 _SM1	=	0x009e
                    009F    477 _SM0	=	0x009f
                    00A0    478 _PC0	=	0x00a0
                    00A1    479 _PC1	=	0x00a1
                    00A2    480 _PC2	=	0x00a2
                    00A3    481 _PC3	=	0x00a3
                    00A4    482 _PC4	=	0x00a4
                    00A5    483 _PC5	=	0x00a5
                    00A6    484 _PC6	=	0x00a6
                    00A7    485 _PC7	=	0x00a7
                    00A8    486 _EX0	=	0x00a8
                    00A9    487 _ET0	=	0x00a9
                    00AA    488 _EX1	=	0x00aa
                    00AB    489 _ET1	=	0x00ab
                    00AC    490 _ES0	=	0x00ac
                    00AD    491 _ET2	=	0x00ad
                    00AE    492 _ES1	=	0x00ae
                    00AF    493 _EA	=	0x00af
                    00B0    494 _PD0	=	0x00b0
                    00B1    495 _PD1	=	0x00b1
                    00B2    496 _PD2	=	0x00b2
                    00B3    497 _PD3	=	0x00b3
                    00B4    498 _PD4	=	0x00b4
                    00B5    499 _PD5	=	0x00b5
                    00B6    500 _PD6	=	0x00b6
                    00B7    501 _PD7	=	0x00b7
                    00B8    502 _PX0	=	0x00b8
                    00B9    503 _PT0	=	0x00b9
                    00BA    504 _PX1	=	0x00ba
                    00BB    505 _PT1	=	0x00bb
                    00BC    506 _PS0	=	0x00bc
                    00BD    507 _PT2	=	0x00bd
                    00BE    508 _PS1	=	0x00be
                    00C0    509 _RI1	=	0x00c0
                    00C1    510 _TI1	=	0x00c1
                    00C2    511 _RB81	=	0x00c2
                    00C3    512 _TB81	=	0x00c3
                    00C4    513 _REN1	=	0x00c4
                    00C5    514 _SM21	=	0x00c5
                    00C6    515 _SM11	=	0x00c6
                    00C7    516 _SM01	=	0x00c7
                    00C8    517 _CP_RL2	=	0x00c8
                    00C9    518 _C_T2	=	0x00c9
                    00CA    519 _TR2	=	0x00ca
                    00CB    520 _EXEN2	=	0x00cb
                    00CC    521 _TCLK	=	0x00cc
                    00CD    522 _RCLK	=	0x00cd
                    00CE    523 _EXF2	=	0x00ce
                    00CF    524 _TF2	=	0x00cf
                    00D0    525 _P	=	0x00d0
                    00D1    526 _FL	=	0x00d1
                    00D2    527 _OV	=	0x00d2
                    00D3    528 _RS0	=	0x00d3
                    00D4    529 _RS1	=	0x00d4
                    00D5    530 _F0	=	0x00d5
                    00D6    531 _AC	=	0x00d6
                    00D7    532 _CY	=	0x00d7
                    00DB    533 _INT6	=	0x00db
                    00DC    534 _RESI	=	0x00dc
                    00DD    535 _ERESI	=	0x00dd
                    00DF    536 _SMOD1	=	0x00df
                    00E8    537 _EUSB	=	0x00e8
                    00E9    538 _EI2C	=	0x00e9
                    00EA    539 _EIEX4	=	0x00ea
                    00EB    540 _EIEX5	=	0x00eb
                    00EC    541 _EIEX6	=	0x00ec
                    00F8    542 _PUSB	=	0x00f8
                    00F9    543 _PI2C	=	0x00f9
                    00FA    544 _EIPX4	=	0x00fa
                    00FB    545 _EIPX5	=	0x00fb
                    00FC    546 _EIPX6	=	0x00fc
                            547 ;--------------------------------------------------------
                            548 ; overlayable register banks
                            549 ;--------------------------------------------------------
                            550 	.area REG_BANK_0	(REL,OVR,DATA)
   0000                     551 	.ds 8
                            552 	.area REG_BANK_1	(REL,OVR,DATA)
   0008                     553 	.ds 8
                            554 ;--------------------------------------------------------
                            555 ; overlayable bit register bank
                            556 ;--------------------------------------------------------
                            557 	.area BIT_BANK	(REL,OVR,DATA)
   0021                     558 bits:
   0021                     559 	.ds 1
                    8000    560 	b0 = bits[0]
                    8100    561 	b1 = bits[1]
                    8200    562 	b2 = bits[2]
                    8300    563 	b3 = bits[3]
                    8400    564 	b4 = bits[4]
                    8500    565 	b5 = bits[5]
                    8600    566 	b6 = bits[6]
                    8700    567 	b7 = bits[7]
                            568 ;--------------------------------------------------------
                            569 ; internal ram data
                            570 ;--------------------------------------------------------
                            571 	.area DSEG    (DATA)
   0010                     572 _START_CONFIG_PROC::
   0010                     573 	.ds 1
   0011                     574 _CONFIGURE_FPGA::
   0011                     575 	.ds 1
   0012                     576 _bytes::
   0012                     577 	.ds 2
   0014                     578 _icount::
   0014                     579 	.ds 1
   0015                     580 _handle_vendorcommand_cmd_1_1:
   0015                     581 	.ds 1
   0016                     582 _handle_vendorcommand_addr_1_1:
   0016                     583 	.ds 2
   0018                     584 _handle_vendorcommand_len_1_1:
   0018                     585 	.ds 2
   001A                     586 _handle_vendorcommand_regAddr_3_9:
   001A                     587 	.ds 1
   001B                     588 _handle_vendorcommand_sloc0_1_0:
   001B                     589 	.ds 4
                            590 ;--------------------------------------------------------
                            591 ; overlayable items in internal ram 
                            592 ;--------------------------------------------------------
                            593 	.area	OSEG    (OVR,DATA)
   006A                     594 _handle_get_interface_PARM_2::
   006A                     595 	.ds 3
                            596 	.area	OSEG    (OVR,DATA)
   006A                     597 _handle_set_interface_PARM_2::
   006A                     598 	.ds 1
                            599 	.area	OSEG    (OVR,DATA)
                            600 ;--------------------------------------------------------
                            601 ; Stack segment in internal ram 
                            602 ;--------------------------------------------------------
                            603 	.area	SSEG	(DATA)
   0075                     604 __start__stack:
   0075                     605 	.ds	1
                            606 
                            607 ;--------------------------------------------------------
                            608 ; indirectly addressable internal ram data
                            609 ;--------------------------------------------------------
                            610 	.area ISEG    (DATA)
                            611 ;--------------------------------------------------------
                            612 ; absolute internal ram data
                            613 ;--------------------------------------------------------
                            614 	.area IABS    (ABS,DATA)
                            615 	.area IABS    (ABS,DATA)
                            616 ;--------------------------------------------------------
                            617 ; bit data
                            618 ;--------------------------------------------------------
                            619 	.area BSEG    (BIT)
   0000                     620 _gotbuf::
   0000                     621 	.ds 1
   0001                     622 _got_sud::
   0001                     623 	.ds 1
   0002                     624 _on::
   0002                     625 	.ds 1
   0003                     626 _on5::
   0003                     627 	.ds 1
                            628 ;--------------------------------------------------------
                            629 ; paged external ram data
                            630 ;--------------------------------------------------------
                            631 	.area PSEG    (PAG,XDATA)
                            632 ;--------------------------------------------------------
                            633 ; external ram data
                            634 ;--------------------------------------------------------
                            635 	.area XSEG    (XDATA)
                    E400    636 _GPIF_WAVE_DATA	=	0xe400
                    E480    637 _RES_WAVEDATA_END	=	0xe480
                    E600    638 _CPUCS	=	0xe600
                    E601    639 _IFCONFIG	=	0xe601
                    E602    640 _PINFLAGSAB	=	0xe602
                    E603    641 _PINFLAGSCD	=	0xe603
                    E604    642 _FIFORESET	=	0xe604
                    E605    643 _BREAKPT	=	0xe605
                    E606    644 _BPADDRH	=	0xe606
                    E607    645 _BPADDRL	=	0xe607
                    E608    646 _UART230	=	0xe608
                    E609    647 _FIFOPINPOLAR	=	0xe609
                    E60A    648 _REVID	=	0xe60a
                    E60B    649 _REVCTL	=	0xe60b
                    E610    650 _EP1OUTCFG	=	0xe610
                    E611    651 _EP1INCFG	=	0xe611
                    E612    652 _EP2CFG	=	0xe612
                    E613    653 _EP4CFG	=	0xe613
                    E614    654 _EP6CFG	=	0xe614
                    E615    655 _EP8CFG	=	0xe615
                    E618    656 _EP2FIFOCFG	=	0xe618
                    E619    657 _EP4FIFOCFG	=	0xe619
                    E61A    658 _EP6FIFOCFG	=	0xe61a
                    E61B    659 _EP8FIFOCFG	=	0xe61b
                    E620    660 _EP2AUTOINLENH	=	0xe620
                    E621    661 _EP2AUTOINLENL	=	0xe621
                    E622    662 _EP4AUTOINLENH	=	0xe622
                    E623    663 _EP4AUTOINLENL	=	0xe623
                    E624    664 _EP6AUTOINLENH	=	0xe624
                    E625    665 _EP6AUTOINLENL	=	0xe625
                    E626    666 _EP8AUTOINLENH	=	0xe626
                    E627    667 _EP8AUTOINLENL	=	0xe627
                    E630    668 _EP2FIFOPFH	=	0xe630
                    E631    669 _EP2FIFOPFL	=	0xe631
                    E632    670 _EP4FIFOPFH	=	0xe632
                    E633    671 _EP4FIFOPFL	=	0xe633
                    E634    672 _EP6FIFOPFH	=	0xe634
                    E635    673 _EP6FIFOPFL	=	0xe635
                    E636    674 _EP8FIFOPFH	=	0xe636
                    E637    675 _EP8FIFOPFL	=	0xe637
                    E640    676 _EP2ISOINPKTS	=	0xe640
                    E641    677 _EP4ISOINPKTS	=	0xe641
                    E642    678 _EP6ISOINPKTS	=	0xe642
                    E643    679 _EP8ISOINPKTS	=	0xe643
                    E648    680 _INPKTEND	=	0xe648
                    E649    681 _OUTPKTEND	=	0xe649
                    E650    682 _EP2FIFOIE	=	0xe650
                    E651    683 _EP2FIFOIRQ	=	0xe651
                    E652    684 _EP4FIFOIE	=	0xe652
                    E653    685 _EP4FIFOIRQ	=	0xe653
                    E654    686 _EP6FIFOIE	=	0xe654
                    E655    687 _EP6FIFOIRQ	=	0xe655
                    E656    688 _EP8FIFOIE	=	0xe656
                    E657    689 _EP8FIFOIRQ	=	0xe657
                    E658    690 _IBNIE	=	0xe658
                    E659    691 _IBNIRQ	=	0xe659
                    E65A    692 _NAKIE	=	0xe65a
                    E65B    693 _NAKIRQ	=	0xe65b
                    E65C    694 _USBIE	=	0xe65c
                    E65D    695 _USBIRQ	=	0xe65d
                    E65E    696 _EPIE	=	0xe65e
                    E65F    697 _EPIRQ	=	0xe65f
                    E660    698 _GPIFIE	=	0xe660
                    E661    699 _GPIFIRQ	=	0xe661
                    E662    700 _USBERRIE	=	0xe662
                    E663    701 _USBERRIRQ	=	0xe663
                    E664    702 _ERRCNTLIM	=	0xe664
                    E665    703 _CLRERRCNT	=	0xe665
                    E666    704 _INT2IVEC	=	0xe666
                    E667    705 _INT4IVEC	=	0xe667
                    E668    706 _INTSETUP	=	0xe668
                    E670    707 _PORTACFG	=	0xe670
                    E671    708 _PORTCCFG	=	0xe671
                    E672    709 _PORTECFG	=	0xe672
                    E678    710 _I2CS	=	0xe678
                    E679    711 _I2DAT	=	0xe679
                    E67A    712 _I2CTL	=	0xe67a
                    E67B    713 _XAUTODAT1	=	0xe67b
                    E67C    714 _XAUTODAT2	=	0xe67c
                    E680    715 _USBCS	=	0xe680
                    E681    716 _SUSPEND	=	0xe681
                    E682    717 _WAKEUPCS	=	0xe682
                    E683    718 _TOGCTL	=	0xe683
                    E684    719 _USBFRAMEH	=	0xe684
                    E685    720 _USBFRAMEL	=	0xe685
                    E686    721 _MICROFRAME	=	0xe686
                    E687    722 _FNADDR	=	0xe687
                    E68A    723 _EP0BCH	=	0xe68a
                    E68B    724 _EP0BCL	=	0xe68b
                    E68D    725 _EP1OUTBC	=	0xe68d
                    E68F    726 _EP1INBC	=	0xe68f
                    E690    727 _EP2BCH	=	0xe690
                    E691    728 _EP2BCL	=	0xe691
                    E694    729 _EP4BCH	=	0xe694
                    E695    730 _EP4BCL	=	0xe695
                    E698    731 _EP6BCH	=	0xe698
                    E699    732 _EP6BCL	=	0xe699
                    E69C    733 _EP8BCH	=	0xe69c
                    E69D    734 _EP8BCL	=	0xe69d
                    E6A0    735 _EP0CS	=	0xe6a0
                    E6A1    736 _EP1OUTCS	=	0xe6a1
                    E6A2    737 _EP1INCS	=	0xe6a2
                    E6A3    738 _EP2CS	=	0xe6a3
                    E6A4    739 _EP4CS	=	0xe6a4
                    E6A5    740 _EP6CS	=	0xe6a5
                    E6A6    741 _EP8CS	=	0xe6a6
                    E6A7    742 _EP2FIFOFLGS	=	0xe6a7
                    E6A8    743 _EP4FIFOFLGS	=	0xe6a8
                    E6A9    744 _EP6FIFOFLGS	=	0xe6a9
                    E6AA    745 _EP8FIFOFLGS	=	0xe6aa
                    E6AB    746 _EP2FIFOBCH	=	0xe6ab
                    E6AC    747 _EP2FIFOBCL	=	0xe6ac
                    E6AD    748 _EP4FIFOBCH	=	0xe6ad
                    E6AE    749 _EP4FIFOBCL	=	0xe6ae
                    E6AF    750 _EP6FIFOBCH	=	0xe6af
                    E6B0    751 _EP6FIFOBCL	=	0xe6b0
                    E6B1    752 _EP8FIFOBCH	=	0xe6b1
                    E6B2    753 _EP8FIFOBCL	=	0xe6b2
                    E6B3    754 _SUDPTRH	=	0xe6b3
                    E6B4    755 _SUDPTRL	=	0xe6b4
                    E6B5    756 _SUDPTRCTL	=	0xe6b5
                    E6B8    757 _SETUPDAT	=	0xe6b8
                    E6C0    758 _GPIFWFSELECT	=	0xe6c0
                    E6C1    759 _GPIFIDLECS	=	0xe6c1
                    E6C2    760 _GPIFIDLECTL	=	0xe6c2
                    E6C3    761 _GPIFCTLCFG	=	0xe6c3
                    E6C4    762 _GPIFADRH	=	0xe6c4
                    E6C5    763 _GPIFADRL	=	0xe6c5
                    E6CE    764 _GPIFTCB3	=	0xe6ce
                    E6CF    765 _GPIFTCB2	=	0xe6cf
                    E6D0    766 _GPIFTCB1	=	0xe6d0
                    E6D1    767 _GPIFTCB0	=	0xe6d1
                    E6D2    768 _EP2GPIFFLGSEL	=	0xe6d2
                    E6D3    769 _EP2GPIFPFSTOP	=	0xe6d3
                    E6D4    770 _EP2GPIFTRIG	=	0xe6d4
                    E6DA    771 _EP4GPIFFLGSEL	=	0xe6da
                    E6DB    772 _EP4GPIFPFSTOP	=	0xe6db
                    E6DC    773 _EP4GPIFTRIG	=	0xe6dc
                    E6E2    774 _EP6GPIFFLGSEL	=	0xe6e2
                    E6E3    775 _EP6GPIFPFSTOP	=	0xe6e3
                    E6E4    776 _EP6GPIFTRIG	=	0xe6e4
                    E6EA    777 _EP8GPIFFLGSEL	=	0xe6ea
                    E6EB    778 _EP8GPIFPFSTOP	=	0xe6eb
                    E6EC    779 _EP8GPIFTRIG	=	0xe6ec
                    E6F0    780 _XGPIFSGLDATH	=	0xe6f0
                    E6F1    781 _XGPIFSGLDATLX	=	0xe6f1
                    E6F2    782 _XGPIFSGLDATLNOX	=	0xe6f2
                    E6F3    783 _GPIFREADYCFG	=	0xe6f3
                    E6F4    784 _GPIFREADYSTAT	=	0xe6f4
                    E6F5    785 _GPIFABORT	=	0xe6f5
                    E6C6    786 _FLOWSTATE	=	0xe6c6
                    E6C7    787 _FLOWLOGIC	=	0xe6c7
                    E6C8    788 _FLOWEQ0CTL	=	0xe6c8
                    E6C9    789 _FLOWEQ1CTL	=	0xe6c9
                    E6CA    790 _FLOWHOLDOFF	=	0xe6ca
                    E6CB    791 _FLOWSTB	=	0xe6cb
                    E6CC    792 _FLOWSTBEDGE	=	0xe6cc
                    E6CD    793 _FLOWSTBHPERIOD	=	0xe6cd
                    E60C    794 _GPIFHOLDAMOUNT	=	0xe60c
                    E67D    795 _UDMACRCH	=	0xe67d
                    E67E    796 _UDMACRCL	=	0xe67e
                    E67F    797 _UDMACRCQUAL	=	0xe67f
                    E740    798 _EP0BUF	=	0xe740
                    E780    799 _EP1OUTBUF	=	0xe780
                    E7C0    800 _EP1INBUF	=	0xe7c0
                    F000    801 _EP2FIFOBUF	=	0xf000
                    F400    802 _EP4FIFOBUF	=	0xf400
                    F800    803 _EP6FIFOBUF	=	0xf800
                    FC00    804 _EP8FIFOBUF	=	0xfc00
                    E628    805 _ECCCFG	=	0xe628
                    E629    806 _ECCRESET	=	0xe629
                    E62A    807 _ECC1B0	=	0xe62a
                    E62B    808 _ECC1B1	=	0xe62b
                    E62C    809 _ECC1B2	=	0xe62c
                    E62D    810 _ECC2B0	=	0xe62d
                    E62E    811 _ECC2B1	=	0xe62e
                    E62F    812 _ECC2B2	=	0xe62f
                    E50D    813 _GPCR2	=	0xe50d
   3BF7                     814 _lcount::
   3BF7                     815 	.ds 4
   3BFB                     816 _fpgaFileLen::
   3BFB                     817 	.ds 4
                            818 ;--------------------------------------------------------
                            819 ; absolute external ram data
                            820 ;--------------------------------------------------------
                            821 	.area XABS    (ABS,XDATA)
                            822 ;--------------------------------------------------------
                            823 ; external initialized ram data
                            824 ;--------------------------------------------------------
                            825 	.area XISEG   (XDATA)
   3C01                     826 _programFpga::
   3C01                     827 	.ds 1
   3C02                     828 _fpgaProgrammed::
   3C02                     829 	.ds 1
   3C03                     830 _fpgaStatus::
   3C03                     831 	.ds 1
   3C04                     832 _uCMode::
   3C04                     833 	.ds 1
   3C05                     834 _prevMode::
   3C05                     835 	.ds 1
   3C06                     836 _TURN3V3OFF::
   3C06                     837 	.ds 2
   3C08                     838 _sofct::
   3C08                     839 	.ds 2
                            840 	.area HOME    (CODE)
                            841 	.area GSINIT0 (CODE)
                            842 	.area GSINIT1 (CODE)
                            843 	.area GSINIT2 (CODE)
                            844 	.area GSINIT3 (CODE)
                            845 	.area GSINIT4 (CODE)
                            846 	.area GSINIT5 (CODE)
                            847 	.area GSINIT  (CODE)
                            848 	.area GSFINAL (CODE)
                            849 	.area CSEG    (CODE)
                            850 ;--------------------------------------------------------
                            851 ; interrupt vector 
                            852 ;--------------------------------------------------------
                            853 	.area HOME    (CODE)
   0000                     854 __interrupt_vect:
   0000 02 01 BB            855 	ljmp	__sdcc_gsinit_startup
   0003 32                  856 	reti
   0004                     857 	.ds	7
   000B 02 0C 52            858 	ljmp	_timer0_isr
   000E                     859 	.ds	5
   0013 32                  860 	reti
   0014                     861 	.ds	7
   001B 32                  862 	reti
   001C                     863 	.ds	7
   0023 32                  864 	reti
   0024                     865 	.ds	7
   002B 32                  866 	reti
   002C                     867 	.ds	7
   0033 32                  868 	reti
   0034                     869 	.ds	7
   003B 32                  870 	reti
   003C                     871 	.ds	7
   0043 32                  872 	reti
   0044                     873 	.ds	7
   004B 32                  874 	reti
   004C                     875 	.ds	7
   0053 32                  876 	reti
   0054                     877 	.ds	7
   005B 32                  878 	reti
   005C                     879 	.ds	7
   0063 32                  880 	reti
   0064                     881 	.ds	7
   006B 02 0B 64            882 	ljmp	_sudav_isr
   006E                     883 	.ds	5
   0073 02 0B 7C            884 	ljmp	_sof_isr
   0076                     885 	.ds	5
   007B 02 0C 5F            886 	ljmp	_sutok_isr
   007E                     887 	.ds	5
   0083 02 1B DD            888 	ljmp	_suspend_isr
   0086                     889 	.ds	5
   008B 02 0B BC            890 	ljmp	_usbreset_isr
   008E                     891 	.ds	5
   0093 02 0C 07            892 	ljmp	_hispeed_isr
   0096                     893 	.ds	5
   009B 02 0C 5C            894 	ljmp	_ep0ack_isr
   009E                     895 	.ds	5
   00A3 02 1C 07            896 	ljmp	_ep0in_isr
   00A6                     897 	.ds	5
   00AB 02 1C 08            898 	ljmp	_ep0out_isr
   00AE                     899 	.ds	5
   00B3 02 1C 09            900 	ljmp	_ep1in_isr
   00B6                     901 	.ds	5
   00BB 02 1C 0C            902 	ljmp	_ep1out_isr
   00BE                     903 	.ds	5
   00C3 02 1B DF            904 	ljmp	_ep2_isr
   00C6                     905 	.ds	5
   00CB 02 1B F9            906 	ljmp	_ep4_isr
   00CE                     907 	.ds	5
   00D3 02 1B FA            908 	ljmp	_ep6_isr
   00D6                     909 	.ds	5
   00DB 02 1B FC            910 	ljmp	_ep8_isr
   00DE                     911 	.ds	5
   00E3 02 14 9A            912 	ljmp	_ibn_isr
   00E6                     913 	.ds	5
   00EB 02 1C 85            914 	ljmp	_ep0ping_isr
   00EE                     915 	.ds	5
   00F3 02 0C 5D            916 	ljmp	_ep1ping_isr
   00F6                     917 	.ds	5
   00FB 02 0C 5E            918 	ljmp	_ep2ping_isr
   00FE                     919 	.ds	5
   0103 02 14 99            920 	ljmp	_ep4ping_isr
   0106                     921 	.ds	5
   010B 02 14 9B            922 	ljmp	_ep6ping_isr
   010E                     923 	.ds	5
   0113 02 17 92            924 	ljmp	_ep8ping_isr
   0116                     925 	.ds	5
   011B 02 1C 68            926 	ljmp	_errlimit_isr
   011E                     927 	.ds	5
   0123 02 1C 05            928 	ljmp	_ep2isoerr_isr
   0126                     929 	.ds	5
   012B 02 1C 0A            930 	ljmp	_ep4isoerr_isr
   012E                     931 	.ds	5
   0133 02 1C 0D            932 	ljmp	_ep6isoerr_isr
   0136                     933 	.ds	5
   013B 02 1C 0F            934 	ljmp	_ep8isoerr_isr
   013E                     935 	.ds	5
   0143 02 1C 06            936 	ljmp	_spare_isr
   0146                     937 	.ds	5
   014B 02 1C 0B            938 	ljmp	_ep2pf_isr
   014E                     939 	.ds	5
   0153 02 1C 0E            940 	ljmp	_ep4pf_isr
   0156                     941 	.ds	5
   015B 02 1C 10            942 	ljmp	_ep6pf_isr
   015E                     943 	.ds	5
   0163 02 1C 67            944 	ljmp	_ep8pf_isr
   0166                     945 	.ds	5
   016B 02 1B FD            946 	ljmp	_ep2ef_isr
   016E                     947 	.ds	5
   0173 02 1B FF            948 	ljmp	_ep4ef_isr
   0176                     949 	.ds	5
   017B 02 1C 01            950 	ljmp	_ep6ef_isr
   017E                     951 	.ds	5
   0183 02 1C 03            952 	ljmp	_ep8ef_isr
   0186                     953 	.ds	5
   018B 02 1B FE            954 	ljmp	_ep2ff_isr
   018E                     955 	.ds	5
   0193 02 1C 00            956 	ljmp	_ep4ff_isr
   0196                     957 	.ds	5
   019B 02 1C 02            958 	ljmp	_ep6ff_isr
   019E                     959 	.ds	5
   01A3 02 1C 04            960 	ljmp	_ep8ff_isr
   01A6                     961 	.ds	5
   01AB 02 1B FB            962 	ljmp	_gpifdone_isr
   01AE                     963 	.ds	5
   01B3 02 1B DE            964 	ljmp	_gpifwf_isr
                            965 ;--------------------------------------------------------
                            966 ; global & static initialisations
                            967 ;--------------------------------------------------------
                            968 	.area HOME    (CODE)
                            969 	.area GSINIT  (CODE)
                            970 	.area GSFINAL (CODE)
                            971 	.area GSINIT  (CODE)
                            972 	.globl __sdcc_gsinit_startup
                            973 	.globl __sdcc_program_startup
                            974 	.globl __start__stack
                            975 	.globl __mcs51_genXINIT
                            976 	.globl __mcs51_genXRAMCLEAR
                            977 	.globl __mcs51_genRAMCLEAR
                            978 ;	.//include/aes220.h:213: BOOL START_CONFIG_PROC = TRUE;
   0214 75 10 01            979 	mov	_START_CONFIG_PROC,#0x01
                            980 ;	.//include/aes220.h:214: BOOL CONFIGURE_FPGA = FALSE;
   0217 75 11 00            981 	mov	_CONFIGURE_FPGA,#0x00
                            982 	.area GSFINAL (CODE)
   0232 02 01 B6            983 	ljmp	__sdcc_program_startup
                            984 ;--------------------------------------------------------
                            985 ; Home
                            986 ;--------------------------------------------------------
                            987 	.area HOME    (CODE)
                            988 	.area HOME    (CODE)
   01B6                     989 __sdcc_program_startup:
   01B6 12 02 35            990 	lcall	_main
                            991 ;	return from main will lock up
   01B9 80 FE               992 	sjmp .
                            993 ;--------------------------------------------------------
                            994 ; code
                            995 ;--------------------------------------------------------
                            996 	.area CSEG    (CODE)
                            997 ;------------------------------------------------------------
                            998 ;Allocation info for local variables in function 'main'
                            999 ;------------------------------------------------------------
                           1000 ;dummy                     Allocated to registers 
                           1001 ;------------------------------------------------------------
                           1002 ;	aes220_Firmware.c:149: void main() 
                           1003 ;	-----------------------------------------
                           1004 ;	 function main
                           1005 ;	-----------------------------------------
   0235                    1006 _main:
                    0002   1007 	ar2 = 0x02
                    0003   1008 	ar3 = 0x03
                    0004   1009 	ar4 = 0x04
                    0005   1010 	ar5 = 0x05
                    0006   1011 	ar6 = 0x06
                    0007   1012 	ar7 = 0x07
                    0000   1013 	ar0 = 0x00
                    0001   1014 	ar1 = 0x01
                           1015 ;	aes220_Firmware.c:151: REVCTL=0x00; // not using advanced endpoint controls
   0235 90 E6 0B           1016 	mov	dptr,#_REVCTL
   0238 E4                 1017 	clr	a
   0239 F0                 1018 	movx	@dptr,a
                           1019 ;	aes220_Firmware.c:153: on=0; 
   023A C2 02              1020 	clr	_on
                           1021 ;	aes220_Firmware.c:154: lcount=0;
   023C 90 3B F7           1022 	mov	dptr,#_lcount
   023F E4                 1023 	clr	a
   0240 F0                 1024 	movx	@dptr,a
   0241 A3                 1025 	inc	dptr
   0242 F0                 1026 	movx	@dptr,a
   0243 A3                 1027 	inc	dptr
   0244 F0                 1028 	movx	@dptr,a
   0245 A3                 1029 	inc	dptr
   0246 F0                 1030 	movx	@dptr,a
                           1031 ;	aes220_Firmware.c:155: got_sud=FALSE;
   0247 C2 01              1032 	clr	_got_sud
                           1033 ;	aes220_Firmware.c:156: icount=0;
   0249 75 14 00           1034 	mov	_icount,#0x00
                           1035 ;	aes220_Firmware.c:157: gotbuf=FALSE;
   024C C2 00              1036 	clr	_gotbuf
                           1037 ;	aes220_Firmware.c:158: bytes=0;
   024E E4                 1038 	clr	a
   024F F5 12              1039 	mov	_bytes,a
   0251 F5 13              1040 	mov	(_bytes + 1),a
                           1041 ;	aes220_Firmware.c:160: SETCPUFREQ(CLK_48M);
   0253 90 E6 00           1042 	mov	dptr,#_CPUCS
   0256 E0                 1043 	movx	a,@dptr
   0257 FA                 1044 	mov	r2,a
   0258 74 E7              1045 	mov	a,#0xE7
   025A 5A                 1046 	anl	a,r2
   025B 90 E6 00           1047 	mov	dptr,#_CPUCS
   025E F5 F0              1048 	mov	b,a
   0260 74 10              1049 	mov	a,#0x10
   0262 45 F0              1050 	orl	a,b
   0264 F0                 1051 	movx	@dptr,a
                           1052 ;	aes220_Firmware.c:161: SETIF48MHZ();
   0265 90 E6 01           1053 	mov	dptr,#_IFCONFIG
   0268 E0                 1054 	movx	a,@dptr
   0269 FA                 1055 	mov	r2,a
   026A 44 40              1056 	orl	a,#0x40
   026C F0                 1057 	movx	@dptr,a
                           1058 ;	aes220_Firmware.c:167: IFCONFIG = (bmIFCLKSRC | bm3048MHZ); // intern. clk, 48MHz, not provided to FPGA, not
   026D 90 E6 01           1059 	mov	dptr,#_IFCONFIG
   0270 74 C0              1060 	mov	a,#0xC0
   0272 F0                 1061 	movx	@dptr,a
                           1062 ;	aes220_Firmware.c:168: SYNCDELAY();                         // inverted, port mode
   0273 00                 1063 	 nop 
   0274 00                 1064 	 nop 
   0275 00                 1065 	 nop 
   0276 00                 1066 	 nop 
                           1067 ;	aes220_Firmware.c:171: OEA = 0x00;
   0277 75 B2 00           1068 	mov	_OEA,#0x00
                           1069 ;	aes220_Firmware.c:172: OEB = 0x00;
   027A 75 B3 00           1070 	mov	_OEB,#0x00
                           1071 ;	aes220_Firmware.c:173: OED = (bmBIT7 | bmBIT0); // Set PD0/7 as outputs (SUSPEND_F, PROG_B)
   027D 75 B5 81           1072 	mov	_OED,#0x81
                           1073 ;	aes220_Firmware.c:174: LED6 = LED_ON;   // Blue LED ON
   0280 C2 90              1074 	clr	_PB0
                           1075 ;	aes220_Firmware.c:176: PROG_B = 0; // FPGA held in reset (hard)
   0282 C2 B0              1076 	clr	_PD0
                           1077 ;	aes220_Firmware.c:177: SUSPEND_F = 0; // Maintain fpga suspend pin low to prevent it going in suspend mode
   0284 C2 B7              1078 	clr	_PD7
                           1079 ;	aes220_Firmware.c:181: fpgaProgrammed = startFpga(); 
   0286 12 0F C5           1080 	lcall	_startFpga
   0289 E5 82              1081 	mov	a,dpl
   028B 90 3C 02           1082 	mov	dptr,#_fpgaProgrammed
   028E F0                 1083 	movx	@dptr,a
                           1084 ;	aes220_Firmware.c:186: OEB |= bmBIT0;
   028F 43 B3 01           1085 	orl	_OEB,#0x01
                           1086 ;	aes220_Firmware.c:187: OEA = bmBIT0;
   0292 75 B2 01           1087 	mov	_OEA,#0x01
                           1088 ;	aes220_Firmware.c:189: if (readBoardStatusRegister() == 0x00) { 
   0295 12 14 73           1089 	lcall	_readBoardStatusRegister
   0298 E5 82              1090 	mov	a,dpl
   029A 70 1A              1091 	jnz	00102$
                           1092 ;	aes220_Firmware.c:190: LED6 = LED_OFF;   // Blue LED OFF
   029C D2 90              1093 	setb	_PB0
                           1094 ;	aes220_Firmware.c:192: startWriteI2C(PSU_ADDR, 2, TURN3V3OFF);
   029E 75 5B 06           1095 	mov	_startWriteI2C_PARM_3,#_TURN3V3OFF
   02A1 75 5C 3C           1096 	mov	(_startWriteI2C_PARM_3 + 1),#(_TURN3V3OFF >> 8)
   02A4 75 5D 00           1097 	mov	(_startWriteI2C_PARM_3 + 2),#0x00
   02A7 75 59 02           1098 	mov	_startWriteI2C_PARM_2,#0x02
   02AA E4                 1099 	clr	a
   02AB F5 5A              1100 	mov	(_startWriteI2C_PARM_2 + 1),a
   02AD 75 82 60           1101 	mov	dpl,#0x60
   02B0 12 14 9C           1102 	lcall	_startWriteI2C
                           1103 ;	aes220_Firmware.c:193: stopWriteI2C();
   02B3 12 15 CD           1104 	lcall	_stopWriteI2C
   02B6                    1105 00102$:
                           1106 ;	aes220_Firmware.c:196: assertSoftReset(); // Maintain the FPGA in soft reset so FPGA state machine is not enabled
   02B6 12 0F B9           1107 	lcall	_assertSoftReset
                           1108 ;	aes220_Firmware.c:201: EP2CFG = (bmVALID | bmTYPE1 | bmBUF1); // valid, OUT, bulk, 512 bytes, double buffered
   02B9 90 E6 12           1109 	mov	dptr,#_EP2CFG
   02BC 74 A2              1110 	mov	a,#0xA2
   02BE F0                 1111 	movx	@dptr,a
                           1112 ;	aes220_Firmware.c:202: SYNCDELAY();
   02BF 00                 1113 	 nop 
   02C0 00                 1114 	 nop 
   02C1 00                 1115 	 nop 
   02C2 00                 1116 	 nop 
                           1117 ;	aes220_Firmware.c:203: EP6CFG = (bmVALID | bmDIR | bmTYPE1); // valid, IN, bulk, 512 bytes, quad buffered
   02C3 90 E6 14           1118 	mov	dptr,#_EP6CFG
   02C6 74 E0              1119 	mov	a,#0xE0
   02C8 F0                 1120 	movx	@dptr,a
                           1121 ;	aes220_Firmware.c:204: SYNCDELAY();
   02C9 00                 1122 	 nop 
   02CA 00                 1123 	 nop 
   02CB 00                 1124 	 nop 
   02CC 00                 1125 	 nop 
                           1126 ;	aes220_Firmware.c:206: EP1INCFG &= ~bmVALID;
   02CD 90 E6 11           1127 	mov	dptr,#_EP1INCFG
   02D0 E0                 1128 	movx	a,@dptr
   02D1 FA                 1129 	mov	r2,a
   02D2 54 7F              1130 	anl	a,#0x7F
   02D4 F0                 1131 	movx	@dptr,a
                           1132 ;	aes220_Firmware.c:207: SYNCDELAY();
   02D5 00                 1133 	 nop 
   02D6 00                 1134 	 nop 
   02D7 00                 1135 	 nop 
   02D8 00                 1136 	 nop 
                           1137 ;	aes220_Firmware.c:208: EP1OUTCFG &= ~bmVALID;
   02D9 90 E6 10           1138 	mov	dptr,#_EP1OUTCFG
   02DC E0                 1139 	movx	a,@dptr
   02DD FA                 1140 	mov	r2,a
   02DE 54 7F              1141 	anl	a,#0x7F
   02E0 F0                 1142 	movx	@dptr,a
                           1143 ;	aes220_Firmware.c:209: SYNCDELAY();
   02E1 00                 1144 	 nop 
   02E2 00                 1145 	 nop 
   02E3 00                 1146 	 nop 
   02E4 00                 1147 	 nop 
                           1148 ;	aes220_Firmware.c:210: EP4CFG &= ~bmVALID;
   02E5 90 E6 13           1149 	mov	dptr,#_EP4CFG
   02E8 E0                 1150 	movx	a,@dptr
   02E9 FA                 1151 	mov	r2,a
   02EA 54 7F              1152 	anl	a,#0x7F
   02EC F0                 1153 	movx	@dptr,a
                           1154 ;	aes220_Firmware.c:211: SYNCDELAY();
   02ED 00                 1155 	 nop 
   02EE 00                 1156 	 nop 
   02EF 00                 1157 	 nop 
   02F0 00                 1158 	 nop 
                           1159 ;	aes220_Firmware.c:212: EP8CFG &= ~bmVALID;
   02F1 90 E6 15           1160 	mov	dptr,#_EP8CFG
   02F4 E0                 1161 	movx	a,@dptr
   02F5 FA                 1162 	mov	r2,a
   02F6 54 7F              1163 	anl	a,#0x7F
   02F8 F0                 1164 	movx	@dptr,a
                           1165 ;	aes220_Firmware.c:213: SYNCDELAY();
   02F9 00                 1166 	 nop 
   02FA 00                 1167 	 nop 
   02FB 00                 1168 	 nop 
   02FC 00                 1169 	 nop 
                           1170 ;	aes220_Firmware.c:216: USE_USB_INTS();
   02FD E5 00              1171 	mov	a,_INT2JT
   02FF D2 E8              1172 	setb	_EUSB
   0301 90 E6 68           1173 	mov	dptr,#_INTSETUP
   0304 E0                 1174 	movx	a,@dptr
   0305 44 08              1175 	orl	a,#0x08
   0307 F0                 1176 	movx	@dptr,a
                           1177 ;	aes220_Firmware.c:217: ENABLE_SUDAV();
   0308 90 E6 5C           1178 	mov	dptr,#_USBIE
   030B E0                 1179 	movx	a,@dptr
   030C 44 01              1180 	orl	a,#0x01
   030E F0                 1181 	movx	@dptr,a
                           1182 ;	aes220_Firmware.c:218: ENABLE_SOF();
   030F 90 E6 5C           1183 	mov	dptr,#_USBIE
   0312 E0                 1184 	movx	a,@dptr
   0313 44 02              1185 	orl	a,#0x02
   0315 F0                 1186 	movx	@dptr,a
                           1187 ;	aes220_Firmware.c:219: ENABLE_HISPEED();
   0316 90 E6 5C           1188 	mov	dptr,#_USBIE
   0319 E0                 1189 	movx	a,@dptr
   031A 44 20              1190 	orl	a,#0x20
   031C F0                 1191 	movx	@dptr,a
                           1192 ;	aes220_Firmware.c:220: ENABLE_USBRESET();
   031D 90 E6 5C           1193 	mov	dptr,#_USBIE
   0320 E0                 1194 	movx	a,@dptr
   0321 44 10              1195 	orl	a,#0x10
   0323 F0                 1196 	movx	@dptr,a
                           1197 ;	aes220_Firmware.c:223: SUSPEND = 10; 
   0324 90 E6 81           1198 	mov	dptr,#_SUSPEND
   0327 74 0A              1199 	mov	a,#0x0A
   0329 F0                 1200 	movx	@dptr,a
                           1201 ;	aes220_Firmware.c:225: EA=1; // global interrupt enable
   032A D2 AF              1202 	setb	_EA
                           1203 ;	aes220_Firmware.c:228: RENUMERATE();
   032C 90 E6 80           1204 	mov	dptr,#_USBCS
   032F E0                 1205 	movx	a,@dptr
   0330 FA                 1206 	mov	r2,a
   0331 20 E1 15           1207 	jb	acc.1,00104$
   0334 90 E6 80           1208 	mov	dptr,#_USBCS
   0337 E0                 1209 	movx	a,@dptr
   0338 44 0A              1210 	orl	a,#0x0A
   033A F0                 1211 	movx	@dptr,a
   033B 90 05 DC           1212 	mov	dptr,#0x05DC
   033E 12 1C 11           1213 	lcall	_delay
   0341 90 E6 80           1214 	mov	dptr,#_USBCS
   0344 E0                 1215 	movx	a,@dptr
   0345 FA                 1216 	mov	r2,a
   0346 54 F7              1217 	anl	a,#0xF7
   0348 F0                 1218 	movx	@dptr,a
   0349                    1219 00104$:
                           1220 ;	aes220_Firmware.c:231: uCMode = PORT_MODE;
   0349 90 3C 04           1221 	mov	dptr,#_uCMode
   034C 74 A2              1222 	mov	a,#0xA2
   034E F0                 1223 	movx	@dptr,a
                           1224 ;	aes220_Firmware.c:233: while(TRUE) {
   034F                    1225 00129$:
                           1226 ;	aes220_Firmware.c:234: if ( got_sud ) {
   034F 30 01 05           1227 	jnb	_got_sud,00106$
                           1228 ;	aes220_Firmware.c:235: handle_setupdata();
   0352 12 17 EB           1229 	lcall	_handle_setupdata
                           1230 ;	aes220_Firmware.c:236: got_sud=FALSE;
   0355 C2 01              1231 	clr	_got_sud
   0357                    1232 00106$:
                           1233 ;	aes220_Firmware.c:238: switch(uCMode) {
   0357 90 3C 04           1234 	mov	dptr,#_uCMode
   035A E0                 1235 	movx	a,@dptr
   035B FA                 1236 	mov	r2,a
   035C BA A1 03           1237 	cjne	r2,#0xA1,00151$
   035F 02 03 DF           1238 	ljmp	00115$
   0362                    1239 00151$:
   0362 BA A2 02           1240 	cjne	r2,#0xA2,00152$
   0365 80 56              1241 	sjmp	00112$
   0367                    1242 00152$:
   0367 BA A3 02           1243 	cjne	r2,#0xA3,00153$
   036A 80 0E              1244 	sjmp	00107$
   036C                    1245 00153$:
   036C BA A7 03           1246 	cjne	r2,#0xA7,00154$
   036F 02 03 EF           1247 	ljmp	00116$
   0372                    1248 00154$:
   0372 BA A8 03           1249 	cjne	r2,#0xA8,00155$
   0375 02 04 3B           1250 	ljmp	00122$
   0378                    1251 00155$:
                           1252 ;	aes220_Firmware.c:240: case SLAVE_FIFO_MODE: 
   0378 80 D5              1253 	sjmp	00129$
   037A                    1254 00107$:
                           1255 ;	aes220_Firmware.c:241: if (uCMode != prevMode) { // Newly entering the mode
   037A 90 3C 05           1256 	mov	dptr,#_prevMode
   037D E0                 1257 	movx	a,@dptr
   037E FB                 1258 	mov	r3,a
   037F EA                 1259 	mov	a,r2
   0380 B5 03 02           1260 	cjne	a,ar3,00156$
   0383 80 14              1261 	sjmp	00109$
   0385                    1262 00156$:
                           1263 ;	aes220_Firmware.c:242: prevMode = uCMode;
   0385 90 3C 05           1264 	mov	dptr,#_prevMode
   0388 EA                 1265 	mov	a,r2
   0389 F0                 1266 	movx	@dptr,a
                           1267 ;	aes220_Firmware.c:243: assertSoftReset();
   038A 12 0F B9           1268 	lcall	_assertSoftReset
                           1269 ;	aes220_Firmware.c:244: setMode(uCMode);
   038D 90 3C 04           1270 	mov	dptr,#_uCMode
   0390 E0                 1271 	movx	a,@dptr
   0391 F5 82              1272 	mov	dpl,a
   0393 12 12 64           1273 	lcall	_setMode
                           1274 ;	aes220_Firmware.c:245: clearSoftReset();
   0396 12 0F BF           1275 	lcall	_clearSoftReset
   0399                    1276 00109$:
                           1277 ;	aes220_Firmware.c:247: if ( !(EP2FIFOFLGS & bmEP2EMPTY) ) {
   0399 90 E6 A7           1278 	mov	dptr,#_EP2FIFOFLGS
   039C E0                 1279 	movx	a,@dptr
   039D FB                 1280 	mov	r3,a
   039E 20 E0 AE           1281 	jb	acc.0,00129$
                           1282 ;	aes220_Firmware.c:248: EP2BCH = EP2FIFOBCH; SYNCDELAY();
   03A1 90 E6 AB           1283 	mov	dptr,#_EP2FIFOBCH
   03A4 E0                 1284 	movx	a,@dptr
   03A5 FB                 1285 	mov	r3,a
   03A6 90 E6 90           1286 	mov	dptr,#_EP2BCH
   03A9 F0                 1287 	movx	@dptr,a
   03AA 00                 1288 	 nop 
   03AB 00                 1289 	 nop 
   03AC 00                 1290 	 nop 
   03AD 00                 1291 	 nop 
                           1292 ;	aes220_Firmware.c:249: EP2BCL = EP2FIFOBCL; SYNCDELAY();
   03AE 90 E6 AC           1293 	mov	dptr,#_EP2FIFOBCL
   03B1 E0                 1294 	movx	a,@dptr
   03B2 FB                 1295 	mov	r3,a
   03B3 90 E6 91           1296 	mov	dptr,#_EP2BCL
   03B6 F0                 1297 	movx	@dptr,a
   03B7 00                 1298 	 nop 
   03B8 00                 1299 	 nop 
   03B9 00                 1300 	 nop 
   03BA 00                 1301 	 nop 
                           1302 ;	aes220_Firmware.c:251: break; // end of case SLAVE_FIFO_MODE
                           1303 ;	aes220_Firmware.c:253: case PORT_MODE:
   03BB 80 92              1304 	sjmp	00129$
   03BD                    1305 00112$:
                           1306 ;	aes220_Firmware.c:254: if (uCMode != prevMode) { // Newly entering the mode
   03BD 90 3C 05           1307 	mov	dptr,#_prevMode
   03C0 E0                 1308 	movx	a,@dptr
   03C1 FB                 1309 	mov	r3,a
   03C2 EA                 1310 	mov	a,r2
   03C3 B5 03 02           1311 	cjne	a,ar3,00158$
   03C6 80 87              1312 	sjmp	00129$
   03C8                    1313 00158$:
                           1314 ;	aes220_Firmware.c:255: prevMode = uCMode;
   03C8 90 3C 05           1315 	mov	dptr,#_prevMode
   03CB EA                 1316 	mov	a,r2
   03CC F0                 1317 	movx	@dptr,a
                           1318 ;	aes220_Firmware.c:256: assertSoftReset();
   03CD 12 0F B9           1319 	lcall	_assertSoftReset
                           1320 ;	aes220_Firmware.c:257: setMode(uCMode);
   03D0 90 3C 04           1321 	mov	dptr,#_uCMode
   03D3 E0                 1322 	movx	a,@dptr
   03D4 F5 82              1323 	mov	dpl,a
   03D6 12 12 64           1324 	lcall	_setMode
                           1325 ;	aes220_Firmware.c:258: clearSoftReset();
   03D9 12 0F BF           1326 	lcall	_clearSoftReset
                           1327 ;	aes220_Firmware.c:260: break; // end of case PORT_MODE
   03DC 02 03 4F           1328 	ljmp	00129$
                           1329 ;	aes220_Firmware.c:262: case WAIT_MODE:
   03DF                    1330 00115$:
                           1331 ;	aes220_Firmware.c:263: OEB |= bmBIT0;
   03DF 43 B3 01           1332 	orl	_OEB,#0x01
                           1333 ;	aes220_Firmware.c:264: LED6 = LED_ON;
   03E2 C2 90              1334 	clr	_PB0
                           1335 ;	aes220_Firmware.c:265: assertSoftReset(); 
   03E4 12 0F B9           1336 	lcall	_assertSoftReset
                           1337 ;	aes220_Firmware.c:266: NOP;
   03E7 00                 1338 	 nop 
                           1339 ;	aes220_Firmware.c:267: NOP;
   03E8 00                 1340 	 nop 
                           1341 ;	aes220_Firmware.c:268: clearSoftReset();
   03E9 12 0F BF           1342 	lcall	_clearSoftReset
                           1343 ;	aes220_Firmware.c:269: break; // end of case WAIT_MODE
   03EC 02 03 4F           1344 	ljmp	00129$
                           1345 ;	aes220_Firmware.c:271: case CONF_F_MODE: 
   03EF                    1346 00116$:
                           1347 ;	aes220_Firmware.c:272: if (prevMode != PORT_MODE) {
   03EF 90 3C 05           1348 	mov	dptr,#_prevMode
   03F2 E0                 1349 	movx	a,@dptr
   03F3 FA                 1350 	mov	r2,a
   03F4 BA A2 02           1351 	cjne	r2,#0xA2,00159$
   03F7 80 06              1352 	sjmp	00118$
   03F9                    1353 00159$:
                           1354 ;	aes220_Firmware.c:273: setMode(PORT_MODE);
   03F9 75 82 A2           1355 	mov	dpl,#0xA2
   03FC 12 12 64           1356 	lcall	_setMode
   03FF                    1357 00118$:
                           1358 ;	aes220_Firmware.c:275: fpgaStatus = configureFpga(fpgaFileLen);
   03FF 90 3B FB           1359 	mov	dptr,#_fpgaFileLen
   0402 E0                 1360 	movx	a,@dptr
   0403 FA                 1361 	mov	r2,a
   0404 A3                 1362 	inc	dptr
   0405 E0                 1363 	movx	a,@dptr
   0406 FB                 1364 	mov	r3,a
   0407 A3                 1365 	inc	dptr
   0408 E0                 1366 	movx	a,@dptr
   0409 FC                 1367 	mov	r4,a
   040A A3                 1368 	inc	dptr
   040B E0                 1369 	movx	a,@dptr
   040C 8A 82              1370 	mov	dpl,r2
   040E 8B 83              1371 	mov	dph,r3
   0410 8C F0              1372 	mov	b,r4
   0412 12 10 44           1373 	lcall	_configureFpga
   0415 AA 82              1374 	mov	r2,dpl
   0417 90 3C 03           1375 	mov	dptr,#_fpgaStatus
   041A EA                 1376 	mov	a,r2
   041B F0                 1377 	movx	@dptr,a
                           1378 ;	aes220_Firmware.c:276: if (fpgaStatus == PROG_DONE) {
   041C BA AB 08           1379 	cjne	r2,#0xAB,00120$
                           1380 ;	aes220_Firmware.c:277: fpgaProgrammed = TRUE;
   041F 90 3C 02           1381 	mov	dptr,#_fpgaProgrammed
   0422 74 01              1382 	mov	a,#0x01
   0424 F0                 1383 	movx	@dptr,a
   0425 80 05              1384 	sjmp	00121$
   0427                    1385 00120$:
                           1386 ;	aes220_Firmware.c:280: fpgaProgrammed = FALSE;
   0427 90 3C 02           1387 	mov	dptr,#_fpgaProgrammed
   042A E4                 1388 	clr	a
   042B F0                 1389 	movx	@dptr,a
   042C                    1390 00121$:
                           1391 ;	aes220_Firmware.c:282: uCMode = WAIT_MODE; // Exit the configuration mode and wait for a new one
   042C 90 3C 04           1392 	mov	dptr,#_uCMode
   042F 74 A1              1393 	mov	a,#0xA1
   0431 F0                 1394 	movx	@dptr,a
                           1395 ;	aes220_Firmware.c:283: prevMode = CONF_F_MODE; // Reset previous mode
   0432 90 3C 05           1396 	mov	dptr,#_prevMode
   0435 74 A7              1397 	mov	a,#0xA7
   0437 F0                 1398 	movx	@dptr,a
                           1399 ;	aes220_Firmware.c:284: break; // end of case CONF_F_MODE
   0438 02 03 4F           1400 	ljmp	00129$
                           1401 ;	aes220_Firmware.c:286: case PROG_F_MODE: 
   043B                    1402 00122$:
                           1403 ;	aes220_Firmware.c:288: setMode(PORT_MODE);
   043B 75 82 A2           1404 	mov	dpl,#0xA2
   043E 12 12 64           1405 	lcall	_setMode
                           1406 ;	aes220_Firmware.c:290: progFpga();
   0441 12 11 14           1407 	lcall	_progFpga
                           1408 ;	aes220_Firmware.c:291: if (fpgaStatus == PROG_DONE) {
   0444 90 3C 03           1409 	mov	dptr,#_fpgaStatus
   0447 E0                 1410 	movx	a,@dptr
   0448 FA                 1411 	mov	r2,a
   0449 BA AB 08           1412 	cjne	r2,#0xAB,00124$
                           1413 ;	aes220_Firmware.c:292: fpgaProgrammed = TRUE;
   044C 90 3C 02           1414 	mov	dptr,#_fpgaProgrammed
   044F 74 01              1415 	mov	a,#0x01
   0451 F0                 1416 	movx	@dptr,a
   0452 80 05              1417 	sjmp	00125$
   0454                    1418 00124$:
                           1419 ;	aes220_Firmware.c:294: else fpgaProgrammed = FALSE;
   0454 90 3C 02           1420 	mov	dptr,#_fpgaProgrammed
   0457 E4                 1421 	clr	a
   0458 F0                 1422 	movx	@dptr,a
   0459                    1423 00125$:
                           1424 ;	aes220_Firmware.c:295: uCMode = WAIT_MODE; // Exit the program mode and wait for a new one
   0459 90 3C 04           1425 	mov	dptr,#_uCMode
   045C 74 A1              1426 	mov	a,#0xA1
   045E F0                 1427 	movx	@dptr,a
                           1428 ;	aes220_Firmware.c:296: prevMode = PROG_F_MODE; // Reset previous mode
   045F 90 3C 05           1429 	mov	dptr,#_prevMode
   0462 74 A8              1430 	mov	a,#0xA8
   0464 F0                 1431 	movx	@dptr,a
                           1432 ;	aes220_Firmware.c:297: break; // end of case PROG_F_MODE
                           1433 ;	aes220_Firmware.c:301: } // end of switch(ucMODE)
   0465 02 03 4F           1434 	ljmp	00129$
                           1435 ;------------------------------------------------------------
                           1436 ;Allocation info for local variables in function 'handle_vendorcommand'
                           1437 ;------------------------------------------------------------
                           1438 ;cmd                       Allocated with name '_handle_vendorcommand_cmd_1_1'
                           1439 ;addr                      Allocated with name '_handle_vendorcommand_addr_1_1'
                           1440 ;len                       Allocated with name '_handle_vendorcommand_len_1_1'
                           1441 ;index                     Allocated to registers r3 r4 
                           1442 ;pep                       Allocated to registers r6 r7 
                           1443 ;cur_read                  Allocated to registers r6 
                           1444 ;cur_write                 Allocated to registers r6 
                           1445 ;rv                        Allocated to registers r5 
                           1446 ;devAddr                   Allocated to registers r6 
                           1447 ;regAddr                   Allocated with name '_handle_vendorcommand_regAddr_3_9'
                           1448 ;curRead                   Allocated to registers r7 
                           1449 ;curWrite                  Allocated to registers r2 
                           1450 ;sloc0                     Allocated with name '_handle_vendorcommand_sloc0_1_0'
                           1451 ;------------------------------------------------------------
                           1452 ;	aes220_Firmware.c:305: BOOL handle_vendorcommand(BYTE cmd)  
                           1453 ;	-----------------------------------------
                           1454 ;	 function handle_vendorcommand
                           1455 ;	-----------------------------------------
   0468                    1456 _handle_vendorcommand:
   0468 85 82 15           1457 	mov	_handle_vendorcommand_cmd_1_1,dpl
                           1458 ;	aes220_Firmware.c:307: WORD addr=SETUP_VALUE(),len=SETUP_LENGTH(), index=SETUP_INDEX();
   046B 90 E6 BB           1459 	mov	dptr,#(_SETUPDAT + 0x0003)
   046E E0                 1460 	movx	a,@dptr
   046F FC                 1461 	mov	r4,a
   0470 7B 00              1462 	mov	r3,#0x00
   0472 90 E6 BA           1463 	mov	dptr,#(_SETUPDAT + 0x0002)
   0475 E0                 1464 	movx	a,@dptr
   0476 7E 00              1465 	mov	r6,#0x00
   0478 4B                 1466 	orl	a,r3
   0479 F5 16              1467 	mov	_handle_vendorcommand_addr_1_1,a
   047B EE                 1468 	mov	a,r6
   047C 4C                 1469 	orl	a,r4
   047D F5 17              1470 	mov	(_handle_vendorcommand_addr_1_1 + 1),a
   047F 90 E6 BF           1471 	mov	dptr,#(_SETUPDAT + 0x0007)
   0482 E0                 1472 	movx	a,@dptr
   0483 FE                 1473 	mov	r6,a
   0484 7D 00              1474 	mov	r5,#0x00
   0486 90 E6 BE           1475 	mov	dptr,#(_SETUPDAT + 0x0006)
   0489 E0                 1476 	movx	a,@dptr
   048A 7A 00              1477 	mov	r2,#0x00
   048C 4D                 1478 	orl	a,r5
   048D F5 18              1479 	mov	_handle_vendorcommand_len_1_1,a
   048F EA                 1480 	mov	a,r2
   0490 4E                 1481 	orl	a,r6
   0491 F5 19              1482 	mov	(_handle_vendorcommand_len_1_1 + 1),a
   0493 90 E6 BD           1483 	mov	dptr,#(_SETUPDAT + 0x0005)
   0496 E0                 1484 	movx	a,@dptr
   0497 FF                 1485 	mov	r7,a
   0498 7E 00              1486 	mov	r6,#0x00
   049A 90 E6 BC           1487 	mov	dptr,#(_SETUPDAT + 0x0004)
   049D E0                 1488 	movx	a,@dptr
   049E FB                 1489 	mov	r3,a
   049F 7C 00              1490 	mov	r4,#0x00
   04A1 EE                 1491 	mov	a,r6
   04A2 42 03              1492 	orl	ar3,a
   04A4 EF                 1493 	mov	a,r7
   04A5 42 04              1494 	orl	ar4,a
                           1495 ;	aes220_Firmware.c:308: switch ( cmd ) 
   04A7 74 B0              1496 	mov	a,#0xB0
   04A9 B5 15 02           1497 	cjne	a,_handle_vendorcommand_cmd_1_1,00332$
   04AC 80 42              1498 	sjmp	00101$
   04AE                    1499 00332$:
   04AE 74 B1              1500 	mov	a,#0xB1
   04B0 B5 15 02           1501 	cjne	a,_handle_vendorcommand_cmd_1_1,00333$
   04B3 80 67              1502 	sjmp	00104$
   04B5                    1503 00333$:
   04B5 74 B2              1504 	mov	a,#0xB2
   04B7 B5 15 03           1505 	cjne	a,_handle_vendorcommand_cmd_1_1,00334$
   04BA 02 05 F6           1506 	ljmp	00123$
   04BD                    1507 00334$:
   04BD 74 B7              1508 	mov	a,#0xB7
   04BF B5 15 03           1509 	cjne	a,_handle_vendorcommand_cmd_1_1,00335$
   04C2 02 09 4A           1510 	ljmp	00210$
   04C5                    1511 00335$:
   04C5 74 C1              1512 	mov	a,#0xC1
   04C7 B5 15 03           1513 	cjne	a,_handle_vendorcommand_cmd_1_1,00336$
   04CA 02 07 AB           1514 	ljmp	00162$
   04CD                    1515 00336$:
   04CD 74 C2              1516 	mov	a,#0xC2
   04CF B5 15 03           1517 	cjne	a,_handle_vendorcommand_cmd_1_1,00337$
   04D2 02 08 CD           1518 	ljmp	00191$
   04D5                    1519 00337$:
   04D5 74 C3              1520 	mov	a,#0xC3
   04D7 B5 15 03           1521 	cjne	a,_handle_vendorcommand_cmd_1_1,00338$
   04DA 02 08 3E           1522 	ljmp	00176$
   04DD                    1523 00338$:
   04DD 74 C4              1524 	mov	a,#0xC4
   04DF B5 15 03           1525 	cjne	a,_handle_vendorcommand_cmd_1_1,00339$
   04E2 02 0A 0C           1526 	ljmp	00221$
   04E5                    1527 00339$:
   04E5 74 C5              1528 	mov	a,#0xC5
   04E7 B5 15 03           1529 	cjne	a,_handle_vendorcommand_cmd_1_1,00340$
   04EA 02 0A 58           1530 	ljmp	00232$
   04ED                    1531 00340$:
   04ED 02 0A AD           1532 	ljmp	00243$
                           1533 ;	aes220_Firmware.c:311: case VC_EPSTAT:
   04F0                    1534 00101$:
                           1535 ;	aes220_Firmware.c:313: xdata BYTE* pep= ep_addr(SETUPDAT[2]);
   04F0 90 E6 BA           1536 	mov	dptr,#(_SETUPDAT + 0x0002)
   04F3 E0                 1537 	movx	a,@dptr
   04F4 F5 82              1538 	mov	dpl,a
   04F6 12 19 08           1539 	lcall	_ep_addr
   04F9 AE 82              1540 	mov	r6,dpl
   04FB AF 83              1541 	mov	r7,dph
                           1542 ;	aes220_Firmware.c:314: if (pep) {
   04FD EE                 1543 	mov	a,r6
   04FE 4F                 1544 	orl	a,r7
   04FF 70 03              1545 	jnz	00341$
   0501 02 0A B1           1546 	ljmp	00244$
   0504                    1547 00341$:
                           1548 ;	aes220_Firmware.c:315: EP0BUF[0] = *pep;
   0504 8E 82              1549 	mov	dpl,r6
   0506 8F 83              1550 	mov	dph,r7
   0508 E0                 1551 	movx	a,@dptr
   0509 90 E7 40           1552 	mov	dptr,#_EP0BUF
   050C F0                 1553 	movx	@dptr,a
                           1554 ;	aes220_Firmware.c:316: EP0BCH=0;
   050D 90 E6 8A           1555 	mov	dptr,#_EP0BCH
   0510 E4                 1556 	clr	a
   0511 F0                 1557 	movx	@dptr,a
                           1558 ;	aes220_Firmware.c:317: EP0BCL=1;
   0512 90 E6 8B           1559 	mov	dptr,#_EP0BCL
   0515 74 01              1560 	mov	a,#0x01
   0517 F0                 1561 	movx	@dptr,a
                           1562 ;	aes220_Firmware.c:318: return TRUE;
   0518 75 82 01           1563 	mov	dpl,#0x01
   051B 22                 1564 	ret
                           1565 ;	aes220_Firmware.c:323: case VC_EEPROM:
   051C                    1566 00104$:
                           1567 ;	aes220_Firmware.c:326: switch (SETUP_TYPE) 
   051C 90 E6 B8           1568 	mov	dptr,#_SETUPDAT
   051F E0                 1569 	movx	a,@dptr
   0520 FE                 1570 	mov	r6,a
   0521 BE 40 02           1571 	cjne	r6,#0x40,00342$
   0524 80 72              1572 	sjmp	00118$
   0526                    1573 00342$:
   0526 BE C0 02           1574 	cjne	r6,#0xC0,00343$
   0529 80 03              1575 	sjmp	00344$
   052B                    1576 00343$:
   052B 02 05 EE           1577 	ljmp	00121$
   052E                    1578 00344$:
                           1579 ;	aes220_Firmware.c:330: while (len) { // still have bytes to read
   052E                    1580 00109$:
   052E E5 18              1581 	mov	a,_handle_vendorcommand_len_1_1
   0530 45 19              1582 	orl	a,(_handle_vendorcommand_len_1_1 + 1)
   0532 70 03              1583 	jnz	00345$
   0534 02 05 F2           1584 	ljmp	00122$
   0537                    1585 00345$:
                           1586 ;	aes220_Firmware.c:332: BYTE cur_read = len > 64 ? 64 : len; 
   0537 C3                 1587 	clr	c
   0538 74 40              1588 	mov	a,#0x40
   053A 95 18              1589 	subb	a,_handle_vendorcommand_len_1_1
   053C E4                 1590 	clr	a
   053D 95 19              1591 	subb	a,(_handle_vendorcommand_len_1_1 + 1)
   053F 50 06              1592 	jnc	00247$
   0541 7E 40              1593 	mov	r6,#0x40
   0543 7F 00              1594 	mov	r7,#0x00
   0545 80 04              1595 	sjmp	00248$
   0547                    1596 00247$:
   0547 AE 18              1597 	mov	r6,_handle_vendorcommand_len_1_1
   0549 AF 19              1598 	mov	r7,(_handle_vendorcommand_len_1_1 + 1)
   054B                    1599 00248$:
                           1600 ;	aes220_Firmware.c:333: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   054B                    1601 00106$:
   054B 90 E6 A0           1602 	mov	dptr,#_EP0CS
   054E E0                 1603 	movx	a,@dptr
   054F FF                 1604 	mov	r7,a
   0550 20 E1 F8           1605 	jb	acc.1,00106$
                           1606 ;	aes220_Firmware.c:334: eeprom_read(EEP_ADDR, addr, cur_read, EP0BUF);
   0553 8E 38              1607 	mov	_eeprom_read_PARM_3,r6
   0555 75 39 00           1608 	mov	(_eeprom_read_PARM_3 + 1),#0x00
   0558 75 3A 40           1609 	mov	_eeprom_read_PARM_4,#_EP0BUF
   055B 75 3B E7           1610 	mov	(_eeprom_read_PARM_4 + 1),#(_EP0BUF >> 8)
   055E 75 3C 00           1611 	mov	(_eeprom_read_PARM_4 + 2),#0x00
   0561 85 16 36           1612 	mov	_eeprom_read_PARM_2,_handle_vendorcommand_addr_1_1
   0564 85 17 37           1613 	mov	(_eeprom_read_PARM_2 + 1),(_handle_vendorcommand_addr_1_1 + 1)
   0567 75 82 51           1614 	mov	dpl,#0x51
   056A C0 06              1615 	push	ar6
   056C 12 0F 54           1616 	lcall	_eeprom_read
   056F D0 06              1617 	pop	ar6
                           1618 ;	aes220_Firmware.c:335: EP0BCH=0;
   0571 90 E6 8A           1619 	mov	dptr,#_EP0BCH
   0574 E4                 1620 	clr	a
   0575 F0                 1621 	movx	@dptr,a
                           1622 ;	aes220_Firmware.c:336: SYNCDELAY();
   0576 00                 1623 	 nop 
   0577 00                 1624 	 nop 
   0578 00                 1625 	 nop 
   0579 00                 1626 	 nop 
                           1627 ;	aes220_Firmware.c:337: EP0BCL=cur_read;
   057A 90 E6 8B           1628 	mov	dptr,#_EP0BCL
   057D EE                 1629 	mov	a,r6
   057E F0                 1630 	movx	@dptr,a
                           1631 ;	aes220_Firmware.c:338: len -= cur_read;
   057F 7F 00              1632 	mov	r7,#0x00
   0581 E5 18              1633 	mov	a,_handle_vendorcommand_len_1_1
   0583 C3                 1634 	clr	c
   0584 9E                 1635 	subb	a,r6
   0585 F5 18              1636 	mov	_handle_vendorcommand_len_1_1,a
   0587 E5 19              1637 	mov	a,(_handle_vendorcommand_len_1_1 + 1)
   0589 9F                 1638 	subb	a,r7
   058A F5 19              1639 	mov	(_handle_vendorcommand_len_1_1 + 1),a
                           1640 ;	aes220_Firmware.c:339: addr += cur_read;
   058C EE                 1641 	mov	a,r6
   058D 25 16              1642 	add	a,_handle_vendorcommand_addr_1_1
   058F F5 16              1643 	mov	_handle_vendorcommand_addr_1_1,a
   0591 EF                 1644 	mov	a,r7
   0592 35 17              1645 	addc	a,(_handle_vendorcommand_addr_1_1 + 1)
   0594 F5 17              1646 	mov	(_handle_vendorcommand_addr_1_1 + 1),a
                           1647 ;	aes220_Firmware.c:344: while (len) {
   0596 80 96              1648 	sjmp	00109$
   0598                    1649 00118$:
   0598 E5 18              1650 	mov	a,_handle_vendorcommand_len_1_1
   059A 45 19              1651 	orl	a,(_handle_vendorcommand_len_1_1 + 1)
   059C 60 54              1652 	jz	00122$
                           1653 ;	aes220_Firmware.c:346: EP0BCL = 0; // allow pc transfer in
   059E 90 E6 8B           1654 	mov	dptr,#_EP0BCL
   05A1 E4                 1655 	clr	a
   05A2 F0                 1656 	movx	@dptr,a
                           1657 ;	aes220_Firmware.c:347: while(EP0CS & bmEPBUSY); // wait
   05A3                    1658 00113$:
   05A3 90 E6 A0           1659 	mov	dptr,#_EP0CS
   05A6 E0                 1660 	movx	a,@dptr
   05A7 FE                 1661 	mov	r6,a
   05A8 20 E1 F8           1662 	jb	acc.1,00113$
                           1663 ;	aes220_Firmware.c:348: cur_write=EP0BCL;
   05AB 90 E6 8B           1664 	mov	dptr,#_EP0BCL
   05AE E0                 1665 	movx	a,@dptr
   05AF FE                 1666 	mov	r6,a
                           1667 ;	aes220_Firmware.c:349: if (!writeEeprom(EEP_ADDR, addr, cur_write, EP0BUF)) return FALSE;
   05B0 8E 4B              1668 	mov	_writeEeprom_PARM_3,r6
   05B2 75 4C 00           1669 	mov	(_writeEeprom_PARM_3 + 1),#0x00
   05B5 75 4D 40           1670 	mov	_writeEeprom_PARM_4,#_EP0BUF
   05B8 75 4E E7           1671 	mov	(_writeEeprom_PARM_4 + 1),#(_EP0BUF >> 8)
   05BB 75 4F 00           1672 	mov	(_writeEeprom_PARM_4 + 2),#0x00
   05BE 85 16 49           1673 	mov	_writeEeprom_PARM_2,_handle_vendorcommand_addr_1_1
   05C1 85 17 4A           1674 	mov	(_writeEeprom_PARM_2 + 1),(_handle_vendorcommand_addr_1_1 + 1)
   05C4 75 82 51           1675 	mov	dpl,#0x51
   05C7 C0 06              1676 	push	ar6
   05C9 12 13 74           1677 	lcall	_writeEeprom
   05CC E5 82              1678 	mov	a,dpl
   05CE D0 06              1679 	pop	ar6
   05D0 70 03              1680 	jnz	00117$
   05D2 F5 82              1681 	mov	dpl,a
   05D4 22                 1682 	ret
   05D5                    1683 00117$:
                           1684 ;	aes220_Firmware.c:350: addr += cur_write;
   05D5 7F 00              1685 	mov	r7,#0x00
   05D7 EE                 1686 	mov	a,r6
   05D8 25 16              1687 	add	a,_handle_vendorcommand_addr_1_1
   05DA F5 16              1688 	mov	_handle_vendorcommand_addr_1_1,a
   05DC EF                 1689 	mov	a,r7
   05DD 35 17              1690 	addc	a,(_handle_vendorcommand_addr_1_1 + 1)
   05DF F5 17              1691 	mov	(_handle_vendorcommand_addr_1_1 + 1),a
                           1692 ;	aes220_Firmware.c:351: len -= cur_write;
   05E1 E5 18              1693 	mov	a,_handle_vendorcommand_len_1_1
   05E3 C3                 1694 	clr	c
   05E4 9E                 1695 	subb	a,r6
   05E5 F5 18              1696 	mov	_handle_vendorcommand_len_1_1,a
   05E7 E5 19              1697 	mov	a,(_handle_vendorcommand_len_1_1 + 1)
   05E9 9F                 1698 	subb	a,r7
   05EA F5 19              1699 	mov	(_handle_vendorcommand_len_1_1 + 1),a
                           1700 ;	aes220_Firmware.c:355: default:
   05EC 80 AA              1701 	sjmp	00118$
   05EE                    1702 00121$:
                           1703 ;	aes220_Firmware.c:356: return FALSE; // bad type
   05EE 75 82 00           1704 	mov	dpl,#0x00
   05F1 22                 1705 	ret
                           1706 ;	aes220_Firmware.c:358: }
   05F2                    1707 00122$:
                           1708 ;	aes220_Firmware.c:359: return TRUE;
   05F2 75 82 01           1709 	mov	dpl,#0x01
   05F5 22                 1710 	ret
                           1711 ;	aes220_Firmware.c:363: case VC_I2C:
   05F6                    1712 00123$:
                           1713 ;	aes220_Firmware.c:367: BYTE regAddr[1] = {0x10};
   05F6 75 1A 10           1714 	mov	_handle_vendorcommand_regAddr_3_9,#0x10
                           1715 ;	aes220_Firmware.c:369: devAddr = (BYTE)addr;
   05F9 AE 16              1716 	mov	r6,_handle_vendorcommand_addr_1_1
                           1717 ;	aes220_Firmware.c:372: switch (SETUP_TYPE) 
   05FB 90 E6 B8           1718 	mov	dptr,#_SETUPDAT
   05FE E0                 1719 	movx	a,@dptr
   05FF FF                 1720 	mov	r7,a
   0600 BF 40 03           1721 	cjne	r7,#0x40,00351$
   0603 02 06 FD           1722 	ljmp	00143$
   0606                    1723 00351$:
   0606 BF C0 02           1724 	cjne	r7,#0xC0,00352$
   0609 80 03              1725 	sjmp	00353$
   060B                    1726 00352$:
   060B 02 07 A7           1727 	ljmp	00160$
   060E                    1728 00353$:
                           1729 ;	aes220_Firmware.c:376: if (len <= MAX_EP0_DATA) { // Short I2C transfer
   060E C3                 1730 	clr	c
   060F 74 40              1731 	mov	a,#0x40
   0611 95 18              1732 	subb	a,_handle_vendorcommand_len_1_1
   0613 E4                 1733 	clr	a
   0614 95 19              1734 	subb	a,(_handle_vendorcommand_len_1_1 + 1)
   0616 40 40              1735 	jc	00128$
                           1736 ;	aes220_Firmware.c:377: while (EP0CS&bmEPBUSY); // Can't do this until EP0 is ready
   0618                    1737 00125$:
   0618 90 E6 A0           1738 	mov	dptr,#_EP0CS
   061B E0                 1739 	movx	a,@dptr
   061C FF                 1740 	mov	r7,a
   061D 20 E1 F8           1741 	jb	acc.1,00125$
                           1742 ;	aes220_Firmware.c:378: startReadI2C((BYTE)addr, len, EP0BUF);
   0620 75 60 40           1743 	mov	_startReadI2C_PARM_3,#_EP0BUF
   0623 75 61 E7           1744 	mov	(_startReadI2C_PARM_3 + 1),#(_EP0BUF >> 8)
   0626 75 62 00           1745 	mov	(_startReadI2C_PARM_3 + 2),#0x00
   0629 85 18 5E           1746 	mov	_startReadI2C_PARM_2,_handle_vendorcommand_len_1_1
   062C 85 19 5F           1747 	mov	(_startReadI2C_PARM_2 + 1),(_handle_vendorcommand_len_1_1 + 1)
   062F 8E 82              1748 	mov	dpl,r6
   0631 12 15 F3           1749 	lcall	_startReadI2C
                           1750 ;	aes220_Firmware.c:379: stopReadI2C(len, EP0BUF);
   0634 75 6A 40           1751 	mov	_stopReadI2C_PARM_2,#_EP0BUF
   0637 75 6B E7           1752 	mov	(_stopReadI2C_PARM_2 + 1),#(_EP0BUF >> 8)
   063A 75 6C 00           1753 	mov	(_stopReadI2C_PARM_2 + 2),#0x00
   063D 85 18 82           1754 	mov	dpl,_handle_vendorcommand_len_1_1
   0640 85 19 83           1755 	mov	dph,(_handle_vendorcommand_len_1_1 + 1)
   0643 12 17 4C           1756 	lcall	_stopReadI2C
                           1757 ;	aes220_Firmware.c:380: EP0BCH=0;
   0646 90 E6 8A           1758 	mov	dptr,#_EP0BCH
   0649 E4                 1759 	clr	a
   064A F0                 1760 	movx	@dptr,a
                           1761 ;	aes220_Firmware.c:381: SYNCDELAY();
   064B 00                 1762 	 nop 
   064C 00                 1763 	 nop 
   064D 00                 1764 	 nop 
   064E 00                 1765 	 nop 
                           1766 ;	aes220_Firmware.c:382: EP0BCL=len;
   064F 90 E6 8B           1767 	mov	dptr,#_EP0BCL
   0652 E5 18              1768 	mov	a,_handle_vendorcommand_len_1_1
   0654 F0                 1769 	movx	@dptr,a
   0655 02 06 F9           1770 	ljmp	00142$
                           1771 ;	aes220_Firmware.c:385: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   0658                    1772 00128$:
   0658 90 E6 A0           1773 	mov	dptr,#_EP0CS
   065B E0                 1774 	movx	a,@dptr
   065C FF                 1775 	mov	r7,a
   065D 20 E1 F8           1776 	jb	acc.1,00128$
                           1777 ;	aes220_Firmware.c:386: startReadI2C((BYTE)addr, MAX_EP0_DATA, EP0BUF);
   0660 75 60 40           1778 	mov	_startReadI2C_PARM_3,#_EP0BUF
   0663 75 61 E7           1779 	mov	(_startReadI2C_PARM_3 + 1),#(_EP0BUF >> 8)
   0666 75 62 00           1780 	mov	(_startReadI2C_PARM_3 + 2),#0x00
   0669 75 5E 40           1781 	mov	_startReadI2C_PARM_2,#0x40
   066C E4                 1782 	clr	a
   066D F5 5F              1783 	mov	(_startReadI2C_PARM_2 + 1),a
   066F 8E 82              1784 	mov	dpl,r6
   0671 12 15 F3           1785 	lcall	_startReadI2C
                           1786 ;	aes220_Firmware.c:387: len -= MAX_EP0_DATA;
   0674 E5 18              1787 	mov	a,_handle_vendorcommand_len_1_1
   0676 24 C0              1788 	add	a,#0xc0
   0678 F5 18              1789 	mov	_handle_vendorcommand_len_1_1,a
   067A E5 19              1790 	mov	a,(_handle_vendorcommand_len_1_1 + 1)
   067C 34 FF              1791 	addc	a,#0xff
   067E F5 19              1792 	mov	(_handle_vendorcommand_len_1_1 + 1),a
                           1793 ;	aes220_Firmware.c:388: while (len) {
   0680                    1794 00137$:
   0680 E5 18              1795 	mov	a,_handle_vendorcommand_len_1_1
   0682 45 19              1796 	orl	a,(_handle_vendorcommand_len_1_1 + 1)
   0684 60 73              1797 	jz	00142$
                           1798 ;	aes220_Firmware.c:389: BYTE curRead = len > MAX_EP0_DATA ? MAX_EP0_DATA : len;
   0686 C3                 1799 	clr	c
   0687 74 40              1800 	mov	a,#0x40
   0689 95 18              1801 	subb	a,_handle_vendorcommand_len_1_1
   068B E4                 1802 	clr	a
   068C 95 19              1803 	subb	a,(_handle_vendorcommand_len_1_1 + 1)
   068E 50 06              1804 	jnc	00249$
   0690 7F 40              1805 	mov	r7,#0x40
   0692 7A 00              1806 	mov	r2,#0x00
   0694 80 04              1807 	sjmp	00250$
   0696                    1808 00249$:
   0696 AF 18              1809 	mov	r7,_handle_vendorcommand_len_1_1
   0698 AA 19              1810 	mov	r2,(_handle_vendorcommand_len_1_1 + 1)
   069A                    1811 00250$:
                           1812 ;	aes220_Firmware.c:390: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   069A                    1813 00131$:
   069A 90 E6 A0           1814 	mov	dptr,#_EP0CS
   069D E0                 1815 	movx	a,@dptr
   069E FA                 1816 	mov	r2,a
   069F 20 E1 F8           1817 	jb	acc.1,00131$
                           1818 ;	aes220_Firmware.c:391: if (len <= MAX_EP0_DATA) {
   06A2 C3                 1819 	clr	c
   06A3 74 40              1820 	mov	a,#0x40
   06A5 95 18              1821 	subb	a,_handle_vendorcommand_len_1_1
   06A7 E4                 1822 	clr	a
   06A8 95 19              1823 	subb	a,(_handle_vendorcommand_len_1_1 + 1)
   06AA 40 18              1824 	jc	00135$
                           1825 ;	aes220_Firmware.c:392: stopReadI2C(len, EP0BUF);
   06AC 75 6A 40           1826 	mov	_stopReadI2C_PARM_2,#_EP0BUF
   06AF 75 6B E7           1827 	mov	(_stopReadI2C_PARM_2 + 1),#(_EP0BUF >> 8)
   06B2 75 6C 00           1828 	mov	(_stopReadI2C_PARM_2 + 2),#0x00
   06B5 85 18 82           1829 	mov	dpl,_handle_vendorcommand_len_1_1
   06B8 85 19 83           1830 	mov	dph,(_handle_vendorcommand_len_1_1 + 1)
   06BB C0 07              1831 	push	ar7
   06BD 12 17 4C           1832 	lcall	_stopReadI2C
   06C0 D0 07              1833 	pop	ar7
   06C2 80 18              1834 	sjmp	00136$
   06C4                    1835 00135$:
                           1836 ;	aes220_Firmware.c:395: readI2C(curRead, EP0BUF);
   06C4 8F 02              1837 	mov	ar2,r7
   06C6 7D 00              1838 	mov	r5,#0x00
   06C8 75 6A 40           1839 	mov	_readI2C_PARM_2,#_EP0BUF
   06CB 75 6B E7           1840 	mov	(_readI2C_PARM_2 + 1),#(_EP0BUF >> 8)
   06CE 75 6C 00           1841 	mov	(_readI2C_PARM_2 + 2),#0x00
   06D1 8A 82              1842 	mov	dpl,r2
   06D3 8D 83              1843 	mov	dph,r5
   06D5 C0 07              1844 	push	ar7
   06D7 12 16 82           1845 	lcall	_readI2C
   06DA D0 07              1846 	pop	ar7
   06DC                    1847 00136$:
                           1848 ;	aes220_Firmware.c:397: EP0BCH=0;
   06DC 90 E6 8A           1849 	mov	dptr,#_EP0BCH
   06DF E4                 1850 	clr	a
   06E0 F0                 1851 	movx	@dptr,a
                           1852 ;	aes220_Firmware.c:398: SYNCDELAY();
   06E1 00                 1853 	 nop 
   06E2 00                 1854 	 nop 
   06E3 00                 1855 	 nop 
   06E4 00                 1856 	 nop 
                           1857 ;	aes220_Firmware.c:399: EP0BCL=curRead;
   06E5 90 E6 8B           1858 	mov	dptr,#_EP0BCL
   06E8 EF                 1859 	mov	a,r7
   06E9 F0                 1860 	movx	@dptr,a
                           1861 ;	aes220_Firmware.c:400: len -= curRead;
   06EA 7A 00              1862 	mov	r2,#0x00
   06EC E5 18              1863 	mov	a,_handle_vendorcommand_len_1_1
   06EE C3                 1864 	clr	c
   06EF 9F                 1865 	subb	a,r7
   06F0 F5 18              1866 	mov	_handle_vendorcommand_len_1_1,a
   06F2 E5 19              1867 	mov	a,(_handle_vendorcommand_len_1_1 + 1)
   06F4 9A                 1868 	subb	a,r2
   06F5 F5 19              1869 	mov	(_handle_vendorcommand_len_1_1 + 1),a
   06F7 80 87              1870 	sjmp	00137$
   06F9                    1871 00142$:
                           1872 ;	aes220_Firmware.c:403: return rv;
   06F9 75 82 00           1873 	mov	dpl,#0x00
   06FC 22                 1874 	ret
                           1875 ;	aes220_Firmware.c:406: case 0x40:  { // write I2C request
   06FD                    1876 00143$:
                           1877 ;	aes220_Firmware.c:408: EP0BCL = 0; // allow pc transfer in
   06FD 90 E6 8B           1878 	mov	dptr,#_EP0BCL
   0700 E4                 1879 	clr	a
   0701 F0                 1880 	movx	@dptr,a
                           1881 ;	aes220_Firmware.c:409: while(EP0CS & bmEPBUSY); // wait
   0702                    1882 00144$:
   0702 90 E6 A0           1883 	mov	dptr,#_EP0CS
   0705 E0                 1884 	movx	a,@dptr
   0706 FA                 1885 	mov	r2,a
   0707 20 E1 F8           1886 	jb	acc.1,00144$
                           1887 ;	aes220_Firmware.c:410: curWrite = EP0BCL;
   070A 90 E6 8B           1888 	mov	dptr,#_EP0BCL
   070D E0                 1889 	movx	a,@dptr
   070E FA                 1890 	mov	r2,a
                           1891 ;	aes220_Firmware.c:411: rv = startWriteI2C((BYTE)addr, curWrite, EP0BUF);
   070F 8A 59              1892 	mov	_startWriteI2C_PARM_2,r2
   0711 75 5A 00           1893 	mov	(_startWriteI2C_PARM_2 + 1),#0x00
   0714 75 5B 40           1894 	mov	_startWriteI2C_PARM_3,#_EP0BUF
   0717 75 5C E7           1895 	mov	(_startWriteI2C_PARM_3 + 1),#(_EP0BUF >> 8)
   071A 75 5D 00           1896 	mov	(_startWriteI2C_PARM_3 + 2),#0x00
   071D 8E 82              1897 	mov	dpl,r6
   071F C0 02              1898 	push	ar2
   0721 C0 03              1899 	push	ar3
   0723 C0 04              1900 	push	ar4
   0725 12 14 9C           1901 	lcall	_startWriteI2C
   0728 AD 82              1902 	mov	r5,dpl
   072A D0 04              1903 	pop	ar4
   072C D0 03              1904 	pop	ar3
   072E D0 02              1905 	pop	ar2
                           1906 ;	aes220_Firmware.c:412: if (len <= MAX_EP0_DATA) { // Short I2C transfer
   0730 C3                 1907 	clr	c
   0731 74 40              1908 	mov	a,#0x40
   0733 95 18              1909 	subb	a,_handle_vendorcommand_len_1_1
   0735 E4                 1910 	clr	a
   0736 95 19              1911 	subb	a,(_handle_vendorcommand_len_1_1 + 1)
   0738 40 0A              1912 	jc	00158$
                           1913 ;	aes220_Firmware.c:413: if (rv == TRUE) rv = stopWriteI2C();
   073A BD 01 67           1914 	cjne	r5,#0x01,00159$
   073D 12 15 CD           1915 	lcall	_stopWriteI2C
   0740 AD 82              1916 	mov	r5,dpl
   0742 80 60              1917 	sjmp	00159$
   0744                    1918 00158$:
                           1919 ;	aes220_Firmware.c:416: len -= curWrite;
   0744 8A 06              1920 	mov	ar6,r2
   0746 7F 00              1921 	mov	r7,#0x00
   0748 E5 18              1922 	mov	a,_handle_vendorcommand_len_1_1
   074A C3                 1923 	clr	c
   074B 9E                 1924 	subb	a,r6
   074C F5 18              1925 	mov	_handle_vendorcommand_len_1_1,a
   074E E5 19              1926 	mov	a,(_handle_vendorcommand_len_1_1 + 1)
   0750 9F                 1927 	subb	a,r7
   0751 F5 19              1928 	mov	(_handle_vendorcommand_len_1_1 + 1),a
                           1929 ;	aes220_Firmware.c:417: while(len) {
   0753                    1930 00152$:
   0753 E5 18              1931 	mov	a,_handle_vendorcommand_len_1_1
   0755 45 19              1932 	orl	a,(_handle_vendorcommand_len_1_1 + 1)
   0757 60 42              1933 	jz	00154$
                           1934 ;	aes220_Firmware.c:418: EP0BCL = 0; // allow pc transfer in
   0759 90 E6 8B           1935 	mov	dptr,#_EP0BCL
   075C E4                 1936 	clr	a
   075D F0                 1937 	movx	@dptr,a
                           1938 ;	aes220_Firmware.c:419: while(EP0CS & bmEPBUSY); // wait
   075E                    1939 00149$:
   075E 90 E6 A0           1940 	mov	dptr,#_EP0CS
   0761 E0                 1941 	movx	a,@dptr
   0762 FE                 1942 	mov	r6,a
   0763 20 E1 F8           1943 	jb	acc.1,00149$
                           1944 ;	aes220_Firmware.c:420: curWrite = EP0BCL;
   0766 90 E6 8B           1945 	mov	dptr,#_EP0BCL
   0769 E0                 1946 	movx	a,@dptr
                           1947 ;	aes220_Firmware.c:421: rv = writeI2C(curWrite, EP0BUF);
   076A FA                 1948 	mov	r2,a
   076B FE                 1949 	mov	r6,a
   076C 7F 00              1950 	mov	r7,#0x00
   076E 75 6A 40           1951 	mov	_writeI2C_PARM_2,#_EP0BUF
   0771 75 6B E7           1952 	mov	(_writeI2C_PARM_2 + 1),#(_EP0BUF >> 8)
   0774 75 6C 00           1953 	mov	(_writeI2C_PARM_2 + 2),#0x00
   0777 8E 82              1954 	mov	dpl,r6
   0779 8F 83              1955 	mov	dph,r7
   077B C0 02              1956 	push	ar2
   077D C0 03              1957 	push	ar3
   077F C0 04              1958 	push	ar4
   0781 12 15 4F           1959 	lcall	_writeI2C
   0784 AD 82              1960 	mov	r5,dpl
   0786 D0 04              1961 	pop	ar4
   0788 D0 03              1962 	pop	ar3
   078A D0 02              1963 	pop	ar2
                           1964 ;	aes220_Firmware.c:422: len -= curWrite;
   078C 7E 00              1965 	mov	r6,#0x00
   078E E5 18              1966 	mov	a,_handle_vendorcommand_len_1_1
   0790 C3                 1967 	clr	c
   0791 9A                 1968 	subb	a,r2
   0792 F5 18              1969 	mov	_handle_vendorcommand_len_1_1,a
   0794 E5 19              1970 	mov	a,(_handle_vendorcommand_len_1_1 + 1)
   0796 9E                 1971 	subb	a,r6
   0797 F5 19              1972 	mov	(_handle_vendorcommand_len_1_1 + 1),a
   0799 80 B8              1973 	sjmp	00152$
   079B                    1974 00154$:
                           1975 ;	aes220_Firmware.c:424: if (index == 0) { 
   079B EB                 1976 	mov	a,r3
   079C 4C                 1977 	orl	a,r4
   079D 70 05              1978 	jnz	00159$
                           1979 ;	aes220_Firmware.c:425: rv = stopWriteI2C();
   079F 12 15 CD           1980 	lcall	_stopWriteI2C
   07A2 AD 82              1981 	mov	r5,dpl
   07A4                    1982 00159$:
                           1983 ;	aes220_Firmware.c:428: return rv;
   07A4 8D 82              1984 	mov	dpl,r5
   07A6 22                 1985 	ret
                           1986 ;	aes220_Firmware.c:432: default:
   07A7                    1987 00160$:
                           1988 ;	aes220_Firmware.c:433: return FALSE; // bad type
   07A7 75 82 00           1989 	mov	dpl,#0x00
   07AA 22                 1990 	ret
                           1991 ;	aes220_Firmware.c:440: case VC_UC_MODE:
   07AB                    1992 00162$:
                           1993 ;	aes220_Firmware.c:442: switch (SETUP_TYPE) 
   07AB 90 E6 B8           1994 	mov	dptr,#_SETUPDAT
   07AE E0                 1995 	movx	a,@dptr
   07AF FA                 1996 	mov	r2,a
   07B0 BA 40 02           1997 	cjne	r2,#0x40,00368$
   07B3 80 3C              1998 	sjmp	00167$
   07B5                    1999 00368$:
   07B5 BA C0 02           2000 	cjne	r2,#0xC0,00369$
   07B8 80 03              2001 	sjmp	00370$
   07BA                    2002 00369$:
   07BA 02 08 3A           2003 	ljmp	00174$
   07BD                    2004 00370$:
                           2005 ;	aes220_Firmware.c:447: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   07BD                    2006 00164$:
   07BD 90 E6 A0           2007 	mov	dptr,#_EP0CS
   07C0 E0                 2008 	movx	a,@dptr
   07C1 FA                 2009 	mov	r2,a
   07C2 20 E1 F8           2010 	jb	acc.1,00164$
                           2011 ;	aes220_Firmware.c:448: EP0BUF[0] = fpgaStatus;
   07C5 90 3C 03           2012 	mov	dptr,#_fpgaStatus
   07C8 E0                 2013 	movx	a,@dptr
   07C9 90 E7 40           2014 	mov	dptr,#_EP0BUF
   07CC F0                 2015 	movx	@dptr,a
                           2016 ;	aes220_Firmware.c:449: EP0BUF[1] = uCMode;
   07CD 90 3C 04           2017 	mov	dptr,#_uCMode
   07D0 E0                 2018 	movx	a,@dptr
   07D1 90 E7 41           2019 	mov	dptr,#(_EP0BUF + 0x0001)
   07D4 F0                 2020 	movx	@dptr,a
                           2021 ;	aes220_Firmware.c:450: EP0BUF[2] = prevMode;
   07D5 90 3C 05           2022 	mov	dptr,#_prevMode
   07D8 E0                 2023 	movx	a,@dptr
   07D9 FA                 2024 	mov	r2,a
   07DA 90 E7 42           2025 	mov	dptr,#(_EP0BUF + 0x0002)
   07DD F0                 2026 	movx	@dptr,a
                           2027 ;	aes220_Firmware.c:451: EP0BCH=0;
   07DE 90 E6 8A           2028 	mov	dptr,#_EP0BCH
   07E1 E4                 2029 	clr	a
   07E2 F0                 2030 	movx	@dptr,a
                           2031 ;	aes220_Firmware.c:452: SYNCDELAY();
   07E3 00                 2032 	 nop 
   07E4 00                 2033 	 nop 
   07E5 00                 2034 	 nop 
   07E6 00                 2035 	 nop 
                           2036 ;	aes220_Firmware.c:453: EP0BCL=3;
   07E7 90 E6 8B           2037 	mov	dptr,#_EP0BCL
   07EA 74 03              2038 	mov	a,#0x03
   07EC F0                 2039 	movx	@dptr,a
                           2040 ;	aes220_Firmware.c:454: return TRUE; 
   07ED 75 82 01           2041 	mov	dpl,#0x01
   07F0 22                 2042 	ret
                           2043 ;	aes220_Firmware.c:458: case 0x40:    
   07F1                    2044 00167$:
                           2045 ;	aes220_Firmware.c:460: EP0BCL = 0; // allow pc transfer in
   07F1 90 E6 8B           2046 	mov	dptr,#_EP0BCL
   07F4 E4                 2047 	clr	a
   07F5 F0                 2048 	movx	@dptr,a
                           2049 ;	aes220_Firmware.c:461: while(EP0CS & bmEPBUSY); // wait
   07F6                    2050 00168$:
   07F6 90 E6 A0           2051 	mov	dptr,#_EP0CS
   07F9 E0                 2052 	movx	a,@dptr
   07FA FA                 2053 	mov	r2,a
   07FB 20 E1 F8           2054 	jb	acc.1,00168$
                           2055 ;	aes220_Firmware.c:462: uCMode = EP0BUF[0];
   07FE 90 E7 40           2056 	mov	dptr,#_EP0BUF
   0801 E0                 2057 	movx	a,@dptr
   0802 FA                 2058 	mov	r2,a
   0803 90 3C 04           2059 	mov	dptr,#_uCMode
   0806 F0                 2060 	movx	@dptr,a
                           2061 ;	aes220_Firmware.c:463: switch (uCMode)
   0807 BA A7 2C           2062 	cjne	r2,#0xA7,00173$
                           2063 ;	aes220_Firmware.c:466: fpgaFileLen = MAKEDWORD(addr, index);
   080A AA 16              2064 	mov	r2,_handle_vendorcommand_addr_1_1
   080C AD 17              2065 	mov	r5,(_handle_vendorcommand_addr_1_1 + 1)
   080E 7E 00              2066 	mov	r6,#0x00
   0810 7F 00              2067 	mov	r7,#0x00
   0812 8D 1E              2068 	mov	(_handle_vendorcommand_sloc0_1_0 + 3),r5
   0814 8A 1D              2069 	mov	(_handle_vendorcommand_sloc0_1_0 + 2),r2
   0816 75 1C 00           2070 	mov	(_handle_vendorcommand_sloc0_1_0 + 1),#0x00
   0819 75 1B 00           2071 	mov	_handle_vendorcommand_sloc0_1_0,#0x00
   081C 7A 00              2072 	mov	r2,#0x00
   081E 7D 00              2073 	mov	r5,#0x00
   0820 90 3B FB           2074 	mov	dptr,#_fpgaFileLen
   0823 EB                 2075 	mov	a,r3
   0824 45 1B              2076 	orl	a,_handle_vendorcommand_sloc0_1_0
   0826 F0                 2077 	movx	@dptr,a
   0827 EC                 2078 	mov	a,r4
   0828 45 1C              2079 	orl	a,(_handle_vendorcommand_sloc0_1_0 + 1)
   082A A3                 2080 	inc	dptr
   082B F0                 2081 	movx	@dptr,a
   082C EA                 2082 	mov	a,r2
   082D 45 1D              2083 	orl	a,(_handle_vendorcommand_sloc0_1_0 + 2)
   082F A3                 2084 	inc	dptr
   0830 F0                 2085 	movx	@dptr,a
   0831 ED                 2086 	mov	a,r5
   0832 45 1E              2087 	orl	a,(_handle_vendorcommand_sloc0_1_0 + 3)
   0834 A3                 2088 	inc	dptr
   0835 F0                 2089 	movx	@dptr,a
                           2090 ;	aes220_Firmware.c:471: }
   0836                    2091 00173$:
                           2092 ;	aes220_Firmware.c:472: return TRUE;
   0836 75 82 01           2093 	mov	dpl,#0x01
   0839 22                 2094 	ret
                           2095 ;	aes220_Firmware.c:476: default:
   083A                    2096 00174$:
                           2097 ;	aes220_Firmware.c:477: return FALSE; // bad SETUP_TYPE
   083A 75 82 00           2098 	mov	dpl,#0x00
   083D 22                 2099 	ret
                           2100 ;	aes220_Firmware.c:483: case VC_UPP_CMD:
   083E                    2101 00176$:
                           2102 ;	aes220_Firmware.c:485: switch (SETUP_TYPE) 
   083E 90 E6 B8           2103 	mov	dptr,#_SETUPDAT
   0841 E0                 2104 	movx	a,@dptr
   0842 FA                 2105 	mov	r2,a
   0843 BA 40 02           2106 	cjne	r2,#0x40,00375$
   0846 80 49              2107 	sjmp	00181$
   0848                    2108 00375$:
   0848 BA C0 02           2109 	cjne	r2,#0xC0,00376$
   084B 80 02              2110 	sjmp	00377$
   084D                    2111 00376$:
   084D 80 7A              2112 	sjmp	00189$
   084F                    2113 00377$:
                           2114 ;	aes220_Firmware.c:490: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   084F                    2115 00178$:
   084F 90 E6 A0           2116 	mov	dptr,#_EP0CS
   0852 E0                 2117 	movx	a,@dptr
   0853 FA                 2118 	mov	r2,a
   0854 20 E1 F8           2119 	jb	acc.1,00178$
                           2120 ;	aes220_Firmware.c:491: EP0BUF[0] = (0x00 | (PD6 << 3) |(PD5 << 2) |(PD3 << 1) | PD2) ;
   0857 A2 B6              2121 	mov	c,_PD6
   0859 E4                 2122 	clr	a
   085A 33                 2123 	rlc	a
   085B C4                 2124 	swap	a
   085C 03                 2125 	rr	a
   085D 54 F8              2126 	anl	a,#0xf8
   085F FA                 2127 	mov	r2,a
   0860 A2 B5              2128 	mov	c,_PD5
   0862 E4                 2129 	clr	a
   0863 33                 2130 	rlc	a
   0864 25 E0              2131 	add	a,acc
   0866 25 E0              2132 	add	a,acc
   0868 42 02              2133 	orl	ar2,a
   086A A2 B3              2134 	mov	c,_PD3
   086C E4                 2135 	clr	a
   086D 33                 2136 	rlc	a
   086E 25 E0              2137 	add	a,acc
   0870 42 02              2138 	orl	ar2,a
   0872 A2 B2              2139 	mov	c,_PD2
   0874 E4                 2140 	clr	a
   0875 33                 2141 	rlc	a
   0876 FB                 2142 	mov	r3,a
   0877 42 02              2143 	orl	ar2,a
   0879 90 E7 40           2144 	mov	dptr,#_EP0BUF
   087C EA                 2145 	mov	a,r2
   087D F0                 2146 	movx	@dptr,a
                           2147 ;	aes220_Firmware.c:492: EP0BCH=0;
   087E 90 E6 8A           2148 	mov	dptr,#_EP0BCH
   0881 E4                 2149 	clr	a
   0882 F0                 2150 	movx	@dptr,a
                           2151 ;	aes220_Firmware.c:493: SYNCDELAY();
   0883 00                 2152 	 nop 
   0884 00                 2153 	 nop 
   0885 00                 2154 	 nop 
   0886 00                 2155 	 nop 
                           2156 ;	aes220_Firmware.c:494: EP0BCL=1;
   0887 90 E6 8B           2157 	mov	dptr,#_EP0BCL
   088A 74 01              2158 	mov	a,#0x01
   088C F0                 2159 	movx	@dptr,a
                           2160 ;	aes220_Firmware.c:495: return TRUE; 
   088D 75 82 01           2161 	mov	dpl,#0x01
   0890 22                 2162 	ret
                           2163 ;	aes220_Firmware.c:499: case 0x40:    
   0891                    2164 00181$:
                           2165 ;	aes220_Firmware.c:501: EP0BCL = 0; // allow pc transfer in
   0891 90 E6 8B           2166 	mov	dptr,#_EP0BCL
   0894 E4                 2167 	clr	a
   0895 F0                 2168 	movx	@dptr,a
                           2169 ;	aes220_Firmware.c:502: while(EP0CS & bmEPBUSY); // wait
   0896                    2170 00182$:
   0896 90 E6 A0           2171 	mov	dptr,#_EP0CS
   0899 E0                 2172 	movx	a,@dptr
   089A FA                 2173 	mov	r2,a
   089B 20 E1 F8           2174 	jb	acc.1,00182$
                           2175 ;	aes220_Firmware.c:503: switch (EP0BUF[0])
   089E 90 E7 40           2176 	mov	dptr,#_EP0BUF
   08A1 E0                 2177 	movx	a,@dptr
   08A2 FA                 2178 	mov	r2,a
   08A3 60 05              2179 	jz	00185$
                           2180 ;	aes220_Firmware.c:505: case UPP_PIN_DIR:
   08A5 BA 01 1D           2181 	cjne	r2,#0x01,00188$
   08A8 80 12              2182 	sjmp	00186$
   08AA                    2183 00185$:
                           2184 ;	aes220_Firmware.c:506: setUserPinsDir(EP0BUF[1], EP0BUF[2]);
   08AA 90 E7 41           2185 	mov	dptr,#(_EP0BUF + 0x0001)
   08AD E0                 2186 	movx	a,@dptr
   08AE FA                 2187 	mov	r2,a
   08AF 90 E7 42           2188 	mov	dptr,#(_EP0BUF + 0x0002)
   08B2 E0                 2189 	movx	a,@dptr
   08B3 F5 6A              2190 	mov	_setUserPinsDir_PARM_2,a
   08B5 8A 82              2191 	mov	dpl,r2
   08B7 12 12 34           2192 	lcall	_setUserPinsDir
                           2193 ;	aes220_Firmware.c:507: break;
                           2194 ;	aes220_Firmware.c:508: case UPP_PIN_VAL:
   08BA 80 09              2195 	sjmp	00188$
   08BC                    2196 00186$:
                           2197 ;	aes220_Firmware.c:509: setUserPins(EP0BUF[1]);
   08BC 90 E7 41           2198 	mov	dptr,#(_EP0BUF + 0x0001)
   08BF E0                 2199 	movx	a,@dptr
   08C0 F5 82              2200 	mov	dpl,a
   08C2 12 12 44           2201 	lcall	_setUserPins
                           2202 ;	aes220_Firmware.c:513: }
   08C5                    2203 00188$:
                           2204 ;	aes220_Firmware.c:514: return TRUE;
   08C5 75 82 01           2205 	mov	dpl,#0x01
   08C8 22                 2206 	ret
                           2207 ;	aes220_Firmware.c:518: default:
   08C9                    2208 00189$:
                           2209 ;	aes220_Firmware.c:519: return FALSE; // bad SETUP_TYPE
   08C9 75 82 00           2210 	mov	dpl,#0x00
   08CC 22                 2211 	ret
                           2212 ;	aes220_Firmware.c:525: case VC_UC_CMD:
   08CD                    2213 00191$:
                           2214 ;	aes220_Firmware.c:527: switch (SETUP_TYPE) 
   08CD 90 E6 B8           2215 	mov	dptr,#_SETUPDAT
   08D0 E0                 2216 	movx	a,@dptr
   08D1 FA                 2217 	mov	r2,a
   08D2 BA 40 02           2218 	cjne	r2,#0x40,00382$
   08D5 80 0F              2219 	sjmp	00196$
   08D7                    2220 00382$:
   08D7 BA C0 6C           2221 	cjne	r2,#0xC0,00208$
                           2222 ;	aes220_Firmware.c:532: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   08DA                    2223 00193$:
   08DA 90 E6 A0           2224 	mov	dptr,#_EP0CS
   08DD E0                 2225 	movx	a,@dptr
   08DE FA                 2226 	mov	r2,a
   08DF 20 E1 F8           2227 	jb	acc.1,00193$
                           2228 ;	aes220_Firmware.c:533: return TRUE; 
   08E2 75 82 01           2229 	mov	dpl,#0x01
   08E5 22                 2230 	ret
                           2231 ;	aes220_Firmware.c:537: case 0x40:    
   08E6                    2232 00196$:
                           2233 ;	aes220_Firmware.c:539: EP0BCL = 0; // allow pc transfer in
   08E6 90 E6 8B           2234 	mov	dptr,#_EP0BCL
   08E9 E4                 2235 	clr	a
   08EA F0                 2236 	movx	@dptr,a
                           2237 ;	aes220_Firmware.c:540: while(EP0CS & bmEPBUSY); // wait
   08EB                    2238 00197$:
   08EB 90 E6 A0           2239 	mov	dptr,#_EP0CS
   08EE E0                 2240 	movx	a,@dptr
   08EF FA                 2241 	mov	r2,a
   08F0 20 E1 F8           2242 	jb	acc.1,00197$
                           2243 ;	aes220_Firmware.c:542: switch (EP0BUF[0]) 
   08F3 90 E7 40           2244 	mov	dptr,#_EP0BUF
   08F6 E0                 2245 	movx	a,@dptr
   08F7 FA                 2246 	mov	r2,a
   08F8 BA 01 02           2247 	cjne	r2,#0x01,00387$
   08FB 80 24              2248 	sjmp	00201$
   08FD                    2249 00387$:
   08FD BA 02 02           2250 	cjne	r2,#0x02,00388$
   0900 80 26              2251 	sjmp	00202$
   0902                    2252 00388$:
   0902 BA 03 02           2253 	cjne	r2,#0x03,00389$
   0905 80 0F              2254 	sjmp	00200$
   0907                    2255 00389$:
   0907 BA 04 02           2256 	cjne	r2,#0x04,00390$
   090A 80 23              2257 	sjmp	00203$
   090C                    2258 00390$:
   090C BA 09 02           2259 	cjne	r2,#0x09,00391$
   090F 80 23              2260 	sjmp	00204$
   0911                    2261 00391$:
                           2262 ;	aes220_Firmware.c:544: case SLEEP_U:
   0911 BA 10 2A           2263 	cjne	r2,#0x10,00206$
   0914 80 23              2264 	sjmp	00205$
   0916                    2265 00200$:
                           2266 ;	aes220_Firmware.c:547: WAKEUPCS = bmWU | bmWUEN;
   0916 90 E6 82           2267 	mov	dptr,#_WAKEUPCS
   0919 74 41              2268 	mov	a,#0x41
   091B F0                 2269 	movx	@dptr,a
                           2270 ;	aes220_Firmware.c:548: PCON = 0x01;
   091C 75 87 01           2271 	mov	_PCON,#0x01
                           2272 ;	aes220_Firmware.c:549: break; // end of case SLEEP_U
                           2273 ;	aes220_Firmware.c:551: case SLEEP_F:
   091F 80 21              2274 	sjmp	00207$
   0921                    2275 00201$:
                           2276 ;	aes220_Firmware.c:552: OED |= 0x80; // PD7 (suspend pin) as output
   0921 43 B5 80           2277 	orl	_OED,#0x80
                           2278 ;	aes220_Firmware.c:553: SUSPEND_F = 1;
   0924 D2 B7              2279 	setb	_PD7
                           2280 ;	aes220_Firmware.c:554: break; // end of case SLEEP_F
                           2281 ;	aes220_Firmware.c:556: case WAKE_F:
   0926 80 1A              2282 	sjmp	00207$
   0928                    2283 00202$:
                           2284 ;	aes220_Firmware.c:557: OED |= 0x80; // PD7 (suspend pin) as output
   0928 43 B5 80           2285 	orl	_OED,#0x80
                           2286 ;	aes220_Firmware.c:558: SUSPEND_F = 0;
   092B C2 B7              2287 	clr	_PD7
                           2288 ;	aes220_Firmware.c:559: break; // end of case WAKE_F
                           2289 ;	aes220_Firmware.c:561: case FLASH_F:
   092D 80 13              2290 	sjmp	00207$
   092F                    2291 00203$:
                           2292 ;	aes220_Firmware.c:562: setupFpgaProg();
   092F 12 10 FC           2293 	lcall	_setupFpgaProg
                           2294 ;	aes220_Firmware.c:563: break; // end of case FLASH_F
                           2295 ;	aes220_Firmware.c:565: case ASSERT_SOFT_RESET:
   0932 80 0E              2296 	sjmp	00207$
   0934                    2297 00204$:
                           2298 ;	aes220_Firmware.c:566: assertSoftReset();
   0934 12 0F B9           2299 	lcall	_assertSoftReset
                           2300 ;	aes220_Firmware.c:567: break; // end of case ASSERT_SOFT_RESET
                           2301 ;	aes220_Firmware.c:569: case CLEAR_SOFT_RESET:
   0937 80 09              2302 	sjmp	00207$
   0939                    2303 00205$:
                           2304 ;	aes220_Firmware.c:570: clearSoftReset();
   0939 12 0F BF           2305 	lcall	_clearSoftReset
                           2306 ;	aes220_Firmware.c:571: break; // end of case CLEAR_SOFT_RESET
                           2307 ;	aes220_Firmware.c:573: default: 
   093C 80 04              2308 	sjmp	00207$
   093E                    2309 00206$:
                           2310 ;	aes220_Firmware.c:574: return FALSE;
   093E 75 82 00           2311 	mov	dpl,#0x00
   0941 22                 2312 	ret
                           2313 ;	aes220_Firmware.c:576: }
   0942                    2314 00207$:
                           2315 ;	aes220_Firmware.c:577: return TRUE;
   0942 75 82 01           2316 	mov	dpl,#0x01
   0945 22                 2317 	ret
                           2318 ;	aes220_Firmware.c:580: default:
   0946                    2319 00208$:
                           2320 ;	aes220_Firmware.c:581: return FALSE; // bad SETUP_TYPE
   0946 75 82 00           2321 	mov	dpl,#0x00
   0949 22                 2322 	ret
                           2323 ;	aes220_Firmware.c:587: case VC_FIFO_DEBUG:
   094A                    2324 00210$:
                           2325 ;	aes220_Firmware.c:589: switch (SETUP_TYPE) 
   094A 90 E6 B8           2326 	mov	dptr,#_SETUPDAT
   094D E0                 2327 	movx	a,@dptr
   094E FA                 2328 	mov	r2,a
   094F BA 40 03           2329 	cjne	r2,#0x40,00393$
   0952 02 09 F7           2330 	ljmp	00215$
   0955                    2331 00393$:
   0955 BA C0 02           2332 	cjne	r2,#0xC0,00394$
   0958 80 03              2333 	sjmp	00395$
   095A                    2334 00394$:
   095A 02 0A 08           2335 	ljmp	00219$
   095D                    2336 00395$:
                           2337 ;	aes220_Firmware.c:594: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   095D                    2338 00212$:
   095D 90 E6 A0           2339 	mov	dptr,#_EP0CS
   0960 E0                 2340 	movx	a,@dptr
   0961 FA                 2341 	mov	r2,a
   0962 20 E1 F8           2342 	jb	acc.1,00212$
                           2343 ;	aes220_Firmware.c:595: EP0BUF[0] = IFCONFIG;
   0965 90 E6 01           2344 	mov	dptr,#_IFCONFIG
   0968 E0                 2345 	movx	a,@dptr
   0969 90 E7 40           2346 	mov	dptr,#_EP0BUF
   096C F0                 2347 	movx	@dptr,a
                           2348 ;	aes220_Firmware.c:596: EP0BUF[1] = EP2468STAT;
   096D 90 E7 41           2349 	mov	dptr,#(_EP0BUF + 0x0001)
   0970 E5 AA              2350 	mov	a,_EP2468STAT
   0972 F0                 2351 	movx	@dptr,a
                           2352 ;	aes220_Firmware.c:597: EP0BUF[2] = EP2CFG;
   0973 90 E6 12           2353 	mov	dptr,#_EP2CFG
   0976 E0                 2354 	movx	a,@dptr
   0977 90 E7 42           2355 	mov	dptr,#(_EP0BUF + 0x0002)
   097A F0                 2356 	movx	@dptr,a
                           2357 ;	aes220_Firmware.c:598: EP0BUF[3] = EP2CS;
   097B 90 E6 A3           2358 	mov	dptr,#_EP2CS
   097E E0                 2359 	movx	a,@dptr
   097F 90 E7 43           2360 	mov	dptr,#(_EP0BUF + 0x0003)
   0982 F0                 2361 	movx	@dptr,a
                           2362 ;	aes220_Firmware.c:599: EP0BUF[4] = EP2FIFOFLGS;
   0983 90 E6 A7           2363 	mov	dptr,#_EP2FIFOFLGS
   0986 E0                 2364 	movx	a,@dptr
   0987 90 E7 44           2365 	mov	dptr,#(_EP0BUF + 0x0004)
   098A F0                 2366 	movx	@dptr,a
                           2367 ;	aes220_Firmware.c:600: EP0BUF[5] = EP2FIFOBCH;
   098B 90 E6 AB           2368 	mov	dptr,#_EP2FIFOBCH
   098E E0                 2369 	movx	a,@dptr
   098F 90 E7 45           2370 	mov	dptr,#(_EP0BUF + 0x0005)
   0992 F0                 2371 	movx	@dptr,a
                           2372 ;	aes220_Firmware.c:601: EP0BUF[6] = EP2FIFOBCL;
   0993 90 E6 AC           2373 	mov	dptr,#_EP2FIFOBCL
   0996 E0                 2374 	movx	a,@dptr
   0997 90 E7 46           2375 	mov	dptr,#(_EP0BUF + 0x0006)
   099A F0                 2376 	movx	@dptr,a
                           2377 ;	aes220_Firmware.c:602: EP0BUF[7] = EP2BCH;
   099B 90 E6 90           2378 	mov	dptr,#_EP2BCH
   099E E0                 2379 	movx	a,@dptr
   099F 90 E7 47           2380 	mov	dptr,#(_EP0BUF + 0x0007)
   09A2 F0                 2381 	movx	@dptr,a
                           2382 ;	aes220_Firmware.c:603: EP0BUF[8] = EP2BCL;
   09A3 90 E6 91           2383 	mov	dptr,#_EP2BCL
   09A6 E0                 2384 	movx	a,@dptr
   09A7 90 E7 48           2385 	mov	dptr,#(_EP0BUF + 0x0008)
   09AA F0                 2386 	movx	@dptr,a
                           2387 ;	aes220_Firmware.c:604: EP0BUF[9] = EP6CFG;
   09AB 90 E6 14           2388 	mov	dptr,#_EP6CFG
   09AE E0                 2389 	movx	a,@dptr
   09AF 90 E7 49           2390 	mov	dptr,#(_EP0BUF + 0x0009)
   09B2 F0                 2391 	movx	@dptr,a
                           2392 ;	aes220_Firmware.c:605: EP0BUF[10] = EP6CS;
   09B3 90 E6 A5           2393 	mov	dptr,#_EP6CS
   09B6 E0                 2394 	movx	a,@dptr
   09B7 90 E7 4A           2395 	mov	dptr,#(_EP0BUF + 0x000a)
   09BA F0                 2396 	movx	@dptr,a
                           2397 ;	aes220_Firmware.c:606: EP0BUF[11] = EP6FIFOFLGS;
   09BB 90 E6 A9           2398 	mov	dptr,#_EP6FIFOFLGS
   09BE E0                 2399 	movx	a,@dptr
   09BF 90 E7 4B           2400 	mov	dptr,#(_EP0BUF + 0x000b)
   09C2 F0                 2401 	movx	@dptr,a
                           2402 ;	aes220_Firmware.c:607: EP0BUF[12] = EP6FIFOBCH;
   09C3 90 E6 AF           2403 	mov	dptr,#_EP6FIFOBCH
   09C6 E0                 2404 	movx	a,@dptr
   09C7 90 E7 4C           2405 	mov	dptr,#(_EP0BUF + 0x000c)
   09CA F0                 2406 	movx	@dptr,a
                           2407 ;	aes220_Firmware.c:608: EP0BUF[13] = EP6FIFOBCL;
   09CB 90 E6 B0           2408 	mov	dptr,#_EP6FIFOBCL
   09CE E0                 2409 	movx	a,@dptr
   09CF 90 E7 4D           2410 	mov	dptr,#(_EP0BUF + 0x000d)
   09D2 F0                 2411 	movx	@dptr,a
                           2412 ;	aes220_Firmware.c:609: EP0BUF[14] = EP6BCH;
   09D3 90 E6 98           2413 	mov	dptr,#_EP6BCH
   09D6 E0                 2414 	movx	a,@dptr
   09D7 90 E7 4E           2415 	mov	dptr,#(_EP0BUF + 0x000e)
   09DA F0                 2416 	movx	@dptr,a
                           2417 ;	aes220_Firmware.c:610: EP0BUF[15] = EP6BCL;
   09DB 90 E6 99           2418 	mov	dptr,#_EP6BCL
   09DE E0                 2419 	movx	a,@dptr
   09DF FA                 2420 	mov	r2,a
   09E0 90 E7 4F           2421 	mov	dptr,#(_EP0BUF + 0x000f)
   09E3 F0                 2422 	movx	@dptr,a
                           2423 ;	aes220_Firmware.c:611: EP0BCH=0;
   09E4 90 E6 8A           2424 	mov	dptr,#_EP0BCH
   09E7 E4                 2425 	clr	a
   09E8 F0                 2426 	movx	@dptr,a
                           2427 ;	aes220_Firmware.c:612: SYNCDELAY();
   09E9 00                 2428 	 nop 
   09EA 00                 2429 	 nop 
   09EB 00                 2430 	 nop 
   09EC 00                 2431 	 nop 
                           2432 ;	aes220_Firmware.c:613: EP0BCL=16;
   09ED 90 E6 8B           2433 	mov	dptr,#_EP0BCL
   09F0 74 10              2434 	mov	a,#0x10
   09F2 F0                 2435 	movx	@dptr,a
                           2436 ;	aes220_Firmware.c:614: return TRUE; 
   09F3 75 82 01           2437 	mov	dpl,#0x01
   09F6 22                 2438 	ret
                           2439 ;	aes220_Firmware.c:618: case 0x40:    
   09F7                    2440 00215$:
                           2441 ;	aes220_Firmware.c:620: EP0BCL = 0; // allow pc transfer in
   09F7 90 E6 8B           2442 	mov	dptr,#_EP0BCL
   09FA E4                 2443 	clr	a
   09FB F0                 2444 	movx	@dptr,a
                           2445 ;	aes220_Firmware.c:621: while(EP0CS & bmEPBUSY); // wait
   09FC                    2446 00216$:
   09FC 90 E6 A0           2447 	mov	dptr,#_EP0CS
   09FF E0                 2448 	movx	a,@dptr
   0A00 FA                 2449 	mov	r2,a
   0A01 20 E1 F8           2450 	jb	acc.1,00216$
                           2451 ;	aes220_Firmware.c:623: return TRUE;
   0A04 75 82 01           2452 	mov	dpl,#0x01
   0A07 22                 2453 	ret
                           2454 ;	aes220_Firmware.c:627: default:
   0A08                    2455 00219$:
                           2456 ;	aes220_Firmware.c:628: return FALSE; // bad SETUP_TYPE
   0A08 75 82 00           2457 	mov	dpl,#0x00
   0A0B 22                 2458 	ret
                           2459 ;	aes220_Firmware.c:634: case VC_FLASH_CMD:
   0A0C                    2460 00221$:
                           2461 ;	aes220_Firmware.c:636: switch (SETUP_TYPE) 
   0A0C 90 E6 B8           2462 	mov	dptr,#_SETUPDAT
   0A0F E0                 2463 	movx	a,@dptr
   0A10 FA                 2464 	mov	r2,a
   0A11 BA 40 02           2465 	cjne	r2,#0x40,00398$
   0A14 80 1E              2466 	sjmp	00226$
   0A16                    2467 00398$:
   0A16 BA C0 3B           2468 	cjne	r2,#0xC0,00230$
                           2469 ;	aes220_Firmware.c:641: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   0A19                    2470 00223$:
   0A19 90 E6 A0           2471 	mov	dptr,#_EP0CS
   0A1C E0                 2472 	movx	a,@dptr
   0A1D FA                 2473 	mov	r2,a
   0A1E 20 E1 F8           2474 	jb	acc.1,00223$
                           2475 ;	aes220_Firmware.c:643: EP0BCH=0;
   0A21 90 E6 8A           2476 	mov	dptr,#_EP0BCH
   0A24 E4                 2477 	clr	a
   0A25 F0                 2478 	movx	@dptr,a
                           2479 ;	aes220_Firmware.c:644: SYNCDELAY();
   0A26 00                 2480 	 nop 
   0A27 00                 2481 	 nop 
   0A28 00                 2482 	 nop 
   0A29 00                 2483 	 nop 
                           2484 ;	aes220_Firmware.c:645: EP0BCL=len;
   0A2A 90 E6 8B           2485 	mov	dptr,#_EP0BCL
   0A2D E5 18              2486 	mov	a,_handle_vendorcommand_len_1_1
   0A2F F0                 2487 	movx	@dptr,a
                           2488 ;	aes220_Firmware.c:646: return TRUE; 
   0A30 75 82 01           2489 	mov	dpl,#0x01
   0A33 22                 2490 	ret
                           2491 ;	aes220_Firmware.c:650: case 0x40:    
   0A34                    2492 00226$:
                           2493 ;	aes220_Firmware.c:652: EP0BCL = 0; // allow pc transfer in
   0A34 90 E6 8B           2494 	mov	dptr,#_EP0BCL
   0A37 E4                 2495 	clr	a
   0A38 F0                 2496 	movx	@dptr,a
                           2497 ;	aes220_Firmware.c:653: while(EP0CS & bmEPBUSY); // wait
   0A39                    2498 00227$:
   0A39 90 E6 A0           2499 	mov	dptr,#_EP0CS
   0A3C E0                 2500 	movx	a,@dptr
   0A3D FA                 2501 	mov	r2,a
   0A3E 20 E1 F8           2502 	jb	acc.1,00227$
                           2503 ;	aes220_Firmware.c:654: execFlashCmd(addr, len);
   0A41 85 18 56           2504 	mov	_execFlashCmd_PARM_2,_handle_vendorcommand_len_1_1
   0A44 85 19 57           2505 	mov	(_execFlashCmd_PARM_2 + 1),(_handle_vendorcommand_len_1_1 + 1)
   0A47 85 16 82           2506 	mov	dpl,_handle_vendorcommand_addr_1_1
   0A4A 85 17 83           2507 	mov	dph,(_handle_vendorcommand_addr_1_1 + 1)
   0A4D 12 14 1B           2508 	lcall	_execFlashCmd
                           2509 ;	aes220_Firmware.c:655: return TRUE;
   0A50 75 82 01           2510 	mov	dpl,#0x01
                           2511 ;	aes220_Firmware.c:659: default:
   0A53 22                 2512 	ret
   0A54                    2513 00230$:
                           2514 ;	aes220_Firmware.c:660: return FALSE; // bad SETUP_TYPE
   0A54 75 82 00           2515 	mov	dpl,#0x00
                           2516 ;	aes220_Firmware.c:666: case VC_SOFT_INFO:
   0A57 22                 2517 	ret
   0A58                    2518 00232$:
                           2519 ;	aes220_Firmware.c:668: switch (SETUP_TYPE) 
   0A58 90 E6 B8           2520 	mov	dptr,#_SETUPDAT
   0A5B E0                 2521 	movx	a,@dptr
   0A5C FA                 2522 	mov	r2,a
   0A5D BA 40 02           2523 	cjne	r2,#0x40,00403$
   0A60 80 36              2524 	sjmp	00237$
   0A62                    2525 00403$:
   0A62 BA C0 44           2526 	cjne	r2,#0xC0,00241$
                           2527 ;	aes220_Firmware.c:672: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   0A65                    2528 00234$:
   0A65 90 E6 A0           2529 	mov	dptr,#_EP0CS
   0A68 E0                 2530 	movx	a,@dptr
   0A69 FA                 2531 	mov	r2,a
   0A6A 20 E1 F8           2532 	jb	acc.1,00234$
                           2533 ;	aes220_Firmware.c:673: memcpy(EP0BUF, codeVersion, sizeof(codeVersion));
   0A6D 75 6A 8A           2534 	mov	_memcpy_PARM_2,#_codeVersion
   0A70 75 6B 1C           2535 	mov	(_memcpy_PARM_2 + 1),#(_codeVersion >> 8)
   0A73 75 6C 80           2536 	mov	(_memcpy_PARM_2 + 2),#0x80
   0A76 75 6D 03           2537 	mov	_memcpy_PARM_3,#0x03
   0A79 E4                 2538 	clr	a
   0A7A F5 6E              2539 	mov	(_memcpy_PARM_3 + 1),a
   0A7C 90 E7 40           2540 	mov	dptr,#_EP0BUF
   0A7F 75 F0 00           2541 	mov	b,#0x00
   0A82 12 17 93           2542 	lcall	_memcpy
                           2543 ;	aes220_Firmware.c:674: EP0BCH=0;
   0A85 90 E6 8A           2544 	mov	dptr,#_EP0BCH
   0A88 E4                 2545 	clr	a
   0A89 F0                 2546 	movx	@dptr,a
                           2547 ;	aes220_Firmware.c:675: SYNCDELAY();
   0A8A 00                 2548 	 nop 
   0A8B 00                 2549 	 nop 
   0A8C 00                 2550 	 nop 
   0A8D 00                 2551 	 nop 
                           2552 ;	aes220_Firmware.c:676: EP0BCL=len;
   0A8E 90 E6 8B           2553 	mov	dptr,#_EP0BCL
   0A91 E5 18              2554 	mov	a,_handle_vendorcommand_len_1_1
   0A93 F0                 2555 	movx	@dptr,a
                           2556 ;	aes220_Firmware.c:677: return TRUE; 
   0A94 75 82 01           2557 	mov	dpl,#0x01
                           2558 ;	aes220_Firmware.c:680: case 0x40:    
   0A97 22                 2559 	ret
   0A98                    2560 00237$:
                           2561 ;	aes220_Firmware.c:682: EP0BCL = 0; // allow pc transfer in
   0A98 90 E6 8B           2562 	mov	dptr,#_EP0BCL
   0A9B E4                 2563 	clr	a
   0A9C F0                 2564 	movx	@dptr,a
                           2565 ;	aes220_Firmware.c:683: while(EP0CS & bmEPBUSY); // wait
   0A9D                    2566 00238$:
   0A9D 90 E6 A0           2567 	mov	dptr,#_EP0CS
   0AA0 E0                 2568 	movx	a,@dptr
   0AA1 FA                 2569 	mov	r2,a
   0AA2 20 E1 F8           2570 	jb	acc.1,00238$
                           2571 ;	aes220_Firmware.c:684: return TRUE;
   0AA5 75 82 01           2572 	mov	dpl,#0x01
                           2573 ;	aes220_Firmware.c:688: default:
   0AA8 22                 2574 	ret
   0AA9                    2575 00241$:
                           2576 ;	aes220_Firmware.c:689: return FALSE; // bad SETUP_TYPE
   0AA9 75 82 00           2577 	mov	dpl,#0x00
                           2578 ;	aes220_Firmware.c:727: default:
   0AAC 22                 2579 	ret
   0AAD                    2580 00243$:
                           2581 ;	aes220_Firmware.c:728: return FALSE;
   0AAD 75 82 00           2582 	mov	dpl,#0x00
                           2583 ;	aes220_Firmware.c:730: } // end of case cmd
                           2584 ;	aes220_Firmware.c:731: return FALSE;
   0AB0 22                 2585 	ret
   0AB1                    2586 00244$:
   0AB1 75 82 00           2587 	mov	dpl,#0x00
   0AB4 22                 2588 	ret
                           2589 ;------------------------------------------------------------
                           2590 ;Allocation info for local variables in function 'handle_get_interface'
                           2591 ;------------------------------------------------------------
                           2592 ;alt_ifc                   Allocated with name '_handle_get_interface_PARM_2'
                           2593 ;ifc                       Allocated to registers r2 
                           2594 ;------------------------------------------------------------
                           2595 ;	aes220_Firmware.c:737: BOOL handle_get_interface(BYTE ifc, BYTE* alt_ifc) {
                           2596 ;	-----------------------------------------
                           2597 ;	 function handle_get_interface
                           2598 ;	-----------------------------------------
   0AB5                    2599 _handle_get_interface:
                           2600 ;	aes220_Firmware.c:738: if (ifc==0) {*alt_ifc=0; return TRUE;} else { return FALSE;}
   0AB5 E5 82              2601 	mov	a,dpl
   0AB7 FA                 2602 	mov	r2,a
   0AB8 70 14              2603 	jnz	00102$
   0ABA AA 6A              2604 	mov	r2,_handle_get_interface_PARM_2
   0ABC AB 6B              2605 	mov	r3,(_handle_get_interface_PARM_2 + 1)
   0ABE AC 6C              2606 	mov	r4,(_handle_get_interface_PARM_2 + 2)
   0AC0 8A 82              2607 	mov	dpl,r2
   0AC2 8B 83              2608 	mov	dph,r3
   0AC4 8C F0              2609 	mov	b,r4
   0AC6 E4                 2610 	clr	a
   0AC7 12 1B E0           2611 	lcall	__gptrput
   0ACA 75 82 01           2612 	mov	dpl,#0x01
   0ACD 22                 2613 	ret
   0ACE                    2614 00102$:
   0ACE 75 82 00           2615 	mov	dpl,#0x00
   0AD1 22                 2616 	ret
                           2617 ;------------------------------------------------------------
                           2618 ;Allocation info for local variables in function 'handle_set_interface'
                           2619 ;------------------------------------------------------------
                           2620 ;alt_ifc                   Allocated with name '_handle_set_interface_PARM_2'
                           2621 ;ifc                       Allocated to registers r2 
                           2622 ;------------------------------------------------------------
                           2623 ;	aes220_Firmware.c:740: BOOL handle_set_interface(BYTE ifc, BYTE alt_ifc) {
                           2624 ;	-----------------------------------------
                           2625 ;	 function handle_set_interface
                           2626 ;	-----------------------------------------
   0AD2                    2627 _handle_set_interface:
                           2628 ;	aes220_Firmware.c:741: if (ifc==0&&alt_ifc==0) {
   0AD2 E5 82              2629 	mov	a,dpl
   0AD4 FA                 2630 	mov	r2,a
   0AD5 60 03              2631 	jz	00109$
   0AD7 02 0B 4E           2632 	ljmp	00102$
   0ADA                    2633 00109$:
   0ADA E5 6A              2634 	mov	a,_handle_set_interface_PARM_2
   0ADC 70 70              2635 	jnz	00102$
                           2636 ;	aes220_Firmware.c:744: RESETTOGGLE(0x02);
   0ADE 90 E6 83           2637 	mov	dptr,#_TOGCTL
   0AE1 74 02              2638 	mov	a,#0x02
   0AE3 F0                 2639 	movx	@dptr,a
   0AE4 E0                 2640 	movx	a,@dptr
   0AE5 FA                 2641 	mov	r2,a
   0AE6 90 E6 83           2642 	mov	dptr,#_TOGCTL
   0AE9 74 20              2643 	mov	a,#0x20
   0AEB 4A                 2644 	orl	a,r2
   0AEC F0                 2645 	movx	@dptr,a
                           2646 ;	aes220_Firmware.c:745: RESETTOGGLE(0x86);
   0AED 90 E6 83           2647 	mov	dptr,#_TOGCTL
   0AF0 74 16              2648 	mov	a,#0x16
   0AF2 F0                 2649 	movx	@dptr,a
   0AF3 E0                 2650 	movx	a,@dptr
   0AF4 FA                 2651 	mov	r2,a
   0AF5 90 E6 83           2652 	mov	dptr,#_TOGCTL
   0AF8 74 20              2653 	mov	a,#0x20
   0AFA 4A                 2654 	orl	a,r2
   0AFB F0                 2655 	movx	@dptr,a
                           2656 ;	aes220_Firmware.c:747: RESETFIFO(0x02);
   0AFC 90 E6 04           2657 	mov	dptr,#_FIFORESET
   0AFF 74 80              2658 	mov	a,#0x80
   0B01 F0                 2659 	movx	@dptr,a
   0B02 00                 2660 	 nop 
   0B03 00                 2661 	 nop 
   0B04 00                 2662 	 nop 
   0B05 00                 2663 	 nop 
   0B06 90 E6 04           2664 	mov	dptr,#_FIFORESET
   0B09 74 02              2665 	mov	a,#0x02
   0B0B F0                 2666 	movx	@dptr,a
   0B0C 00                 2667 	 nop 
   0B0D 00                 2668 	 nop 
   0B0E 00                 2669 	 nop 
   0B0F 00                 2670 	 nop 
   0B10 90 E6 04           2671 	mov	dptr,#_FIFORESET
   0B13 E4                 2672 	clr	a
   0B14 F0                 2673 	movx	@dptr,a
   0B15 00                 2674 	 nop 
   0B16 00                 2675 	 nop 
   0B17 00                 2676 	 nop 
   0B18 00                 2677 	 nop 
                           2678 ;	aes220_Firmware.c:748: EP2BCL=0x80;
   0B19 90 E6 91           2679 	mov	dptr,#_EP2BCL
   0B1C 74 80              2680 	mov	a,#0x80
   0B1E F0                 2681 	movx	@dptr,a
                           2682 ;	aes220_Firmware.c:749: SYNCDELAY();
   0B1F 00                 2683 	 nop 
   0B20 00                 2684 	 nop 
   0B21 00                 2685 	 nop 
   0B22 00                 2686 	 nop 
                           2687 ;	aes220_Firmware.c:750: EP2BCL=0X80;
   0B23 90 E6 91           2688 	mov	dptr,#_EP2BCL
   0B26 74 80              2689 	mov	a,#0x80
   0B28 F0                 2690 	movx	@dptr,a
                           2691 ;	aes220_Firmware.c:751: SYNCDELAY();
   0B29 00                 2692 	 nop 
   0B2A 00                 2693 	 nop 
   0B2B 00                 2694 	 nop 
   0B2C 00                 2695 	 nop 
                           2696 ;	aes220_Firmware.c:752: RESETFIFO(0x86);
   0B2D 90 E6 04           2697 	mov	dptr,#_FIFORESET
   0B30 74 80              2698 	mov	a,#0x80
   0B32 F0                 2699 	movx	@dptr,a
   0B33 00                 2700 	 nop 
   0B34 00                 2701 	 nop 
   0B35 00                 2702 	 nop 
   0B36 00                 2703 	 nop 
   0B37 90 E6 04           2704 	mov	dptr,#_FIFORESET
   0B3A 74 86              2705 	mov	a,#0x86
   0B3C F0                 2706 	movx	@dptr,a
   0B3D 00                 2707 	 nop 
   0B3E 00                 2708 	 nop 
   0B3F 00                 2709 	 nop 
   0B40 00                 2710 	 nop 
   0B41 90 E6 04           2711 	mov	dptr,#_FIFORESET
   0B44 E4                 2712 	clr	a
   0B45 F0                 2713 	movx	@dptr,a
   0B46 00                 2714 	 nop 
   0B47 00                 2715 	 nop 
   0B48 00                 2716 	 nop 
   0B49 00                 2717 	 nop 
                           2718 ;	aes220_Firmware.c:753: return TRUE;
   0B4A 75 82 01           2719 	mov	dpl,#0x01
                           2720 ;	aes220_Firmware.c:755: return FALSE;
   0B4D 22                 2721 	ret
   0B4E                    2722 00102$:
   0B4E 75 82 00           2723 	mov	dpl,#0x00
   0B51 22                 2724 	ret
                           2725 ;------------------------------------------------------------
                           2726 ;Allocation info for local variables in function 'handle_get_configuration'
                           2727 ;------------------------------------------------------------
                           2728 ;------------------------------------------------------------
                           2729 ;	aes220_Firmware.c:759: BYTE handle_get_configuration() {
                           2730 ;	-----------------------------------------
                           2731 ;	 function handle_get_configuration
                           2732 ;	-----------------------------------------
   0B52                    2733 _handle_get_configuration:
                           2734 ;	aes220_Firmware.c:760: return 1;
   0B52 75 82 01           2735 	mov	dpl,#0x01
   0B55 22                 2736 	ret
                           2737 ;------------------------------------------------------------
                           2738 ;Allocation info for local variables in function 'handle_set_configuration'
                           2739 ;------------------------------------------------------------
                           2740 ;cfg                       Allocated to registers r2 
                           2741 ;------------------------------------------------------------
                           2742 ;	aes220_Firmware.c:762: BOOL handle_set_configuration(BYTE cfg) {
                           2743 ;	-----------------------------------------
                           2744 ;	 function handle_set_configuration
                           2745 ;	-----------------------------------------
   0B56                    2746 _handle_set_configuration:
   0B56 AA 82              2747 	mov	r2,dpl
                           2748 ;	aes220_Firmware.c:763: return cfg==1 ? TRUE : FALSE; // we only handle cfg 1
   0B58 BA 01 04           2749 	cjne	r2,#0x01,00103$
   0B5B 7A 01              2750 	mov	r2,#0x01
   0B5D 80 02              2751 	sjmp	00104$
   0B5F                    2752 00103$:
   0B5F 7A 00              2753 	mov	r2,#0x00
   0B61                    2754 00104$:
   0B61 8A 82              2755 	mov	dpl,r2
   0B63 22                 2756 	ret
                           2757 ;------------------------------------------------------------
                           2758 ;Allocation info for local variables in function 'sudav_isr'
                           2759 ;------------------------------------------------------------
                           2760 ;------------------------------------------------------------
                           2761 ;	aes220_Firmware.c:768: void sudav_isr() interrupt SUDAV_ISR {
                           2762 ;	-----------------------------------------
                           2763 ;	 function sudav_isr
                           2764 ;	-----------------------------------------
   0B64                    2765 _sudav_isr:
   0B64 C0 E0              2766 	push	acc
   0B66 C0 82              2767 	push	dpl
   0B68 C0 83              2768 	push	dph
                           2769 ;	aes220_Firmware.c:769: got_sud=TRUE;
   0B6A D2 01              2770 	setb	_got_sud
                           2771 ;	aes220_Firmware.c:770: CLEAR_SUDAV();
   0B6C 53 91 EF           2772 	anl	_EXIF,#0xEF
   0B6F 90 E6 5D           2773 	mov	dptr,#_USBIRQ
   0B72 74 01              2774 	mov	a,#0x01
   0B74 F0                 2775 	movx	@dptr,a
   0B75 D0 83              2776 	pop	dph
   0B77 D0 82              2777 	pop	dpl
   0B79 D0 E0              2778 	pop	acc
   0B7B 32                 2779 	reti
                           2780 ;	eliminated unneeded push/pop psw
                           2781 ;	eliminated unneeded push/pop b
                           2782 ;------------------------------------------------------------
                           2783 ;Allocation info for local variables in function 'sof_isr'
                           2784 ;------------------------------------------------------------
                           2785 ;------------------------------------------------------------
                           2786 ;	aes220_Firmware.c:775: void sof_isr () interrupt SOF_ISR using 1 {
                           2787 ;	-----------------------------------------
                           2788 ;	 function sof_isr
                           2789 ;	-----------------------------------------
   0B7C                    2790 _sof_isr:
                    000A   2791 	ar2 = 0x0a
                    000B   2792 	ar3 = 0x0b
                    000C   2793 	ar4 = 0x0c
                    000D   2794 	ar5 = 0x0d
                    000E   2795 	ar6 = 0x0e
                    000F   2796 	ar7 = 0x0f
                    0008   2797 	ar0 = 0x08
                    0009   2798 	ar1 = 0x09
   0B7C C0 E0              2799 	push	acc
   0B7E C0 82              2800 	push	dpl
   0B80 C0 83              2801 	push	dph
   0B82 C0 D0              2802 	push	psw
   0B84 75 D0 08           2803 	mov	psw,#0x08
                           2804 ;	aes220_Firmware.c:776: ++sofct;
   0B87 90 3C 08           2805 	mov	dptr,#_sofct
   0B8A E0                 2806 	movx	a,@dptr
   0B8B 24 01              2807 	add	a,#0x01
   0B8D F0                 2808 	movx	@dptr,a
   0B8E A3                 2809 	inc	dptr
   0B8F E0                 2810 	movx	a,@dptr
   0B90 34 00              2811 	addc	a,#0x00
   0B92 F0                 2812 	movx	@dptr,a
                           2813 ;	aes220_Firmware.c:777: if(sofct==8000) { // about 8000 sof interrupts per second at high speed
   0B93 90 3C 08           2814 	mov	dptr,#_sofct
   0B96 E0                 2815 	movx	a,@dptr
   0B97 FA                 2816 	mov	r2,a
   0B98 A3                 2817 	inc	dptr
   0B99 E0                 2818 	movx	a,@dptr
   0B9A FB                 2819 	mov	r3,a
   0B9B BA 40 0C           2820 	cjne	r2,#0x40,00102$
   0B9E BB 1F 09           2821 	cjne	r3,#0x1F,00102$
                           2822 ;	aes220_Firmware.c:778: on5=!on5;
   0BA1 B2 03              2823 	cpl	_on5
                           2824 ;	aes220_Firmware.c:779: sofct=0;
   0BA3 90 3C 08           2825 	mov	dptr,#_sofct
   0BA6 E4                 2826 	clr	a
   0BA7 F0                 2827 	movx	@dptr,a
   0BA8 A3                 2828 	inc	dptr
   0BA9 F0                 2829 	movx	@dptr,a
   0BAA                    2830 00102$:
                           2831 ;	aes220_Firmware.c:781: CLEAR_SOF();
   0BAA 53 91 EF           2832 	anl	_EXIF,#0xEF
   0BAD 90 E6 5D           2833 	mov	dptr,#_USBIRQ
   0BB0 74 02              2834 	mov	a,#0x02
   0BB2 F0                 2835 	movx	@dptr,a
   0BB3 D0 D0              2836 	pop	psw
   0BB5 D0 83              2837 	pop	dph
   0BB7 D0 82              2838 	pop	dpl
   0BB9 D0 E0              2839 	pop	acc
   0BBB 32                 2840 	reti
                           2841 ;	eliminated unneeded push/pop b
                           2842 ;------------------------------------------------------------
                           2843 ;Allocation info for local variables in function 'usbreset_isr'
                           2844 ;------------------------------------------------------------
                           2845 ;------------------------------------------------------------
                           2846 ;	aes220_Firmware.c:784: void usbreset_isr() interrupt USBRESET_ISR {
                           2847 ;	-----------------------------------------
                           2848 ;	 function usbreset_isr
                           2849 ;	-----------------------------------------
   0BBC                    2850 _usbreset_isr:
                    0002   2851 	ar2 = 0x02
                    0003   2852 	ar3 = 0x03
                    0004   2853 	ar4 = 0x04
                    0005   2854 	ar5 = 0x05
                    0006   2855 	ar6 = 0x06
                    0007   2856 	ar7 = 0x07
                    0000   2857 	ar0 = 0x00
                    0001   2858 	ar1 = 0x01
   0BBC C0 21              2859 	push	bits
   0BBE C0 E0              2860 	push	acc
   0BC0 C0 F0              2861 	push	b
   0BC2 C0 82              2862 	push	dpl
   0BC4 C0 83              2863 	push	dph
   0BC6 C0 02              2864 	push	(0+2)
   0BC8 C0 03              2865 	push	(0+3)
   0BCA C0 04              2866 	push	(0+4)
   0BCC C0 05              2867 	push	(0+5)
   0BCE C0 06              2868 	push	(0+6)
   0BD0 C0 07              2869 	push	(0+7)
   0BD2 C0 00              2870 	push	(0+0)
   0BD4 C0 01              2871 	push	(0+1)
   0BD6 C0 D0              2872 	push	psw
   0BD8 75 D0 00           2873 	mov	psw,#0x00
                           2874 ;	aes220_Firmware.c:785: handle_hispeed(FALSE);
   0BDB 75 82 00           2875 	mov	dpl,#0x00
   0BDE 12 1A E1           2876 	lcall	_handle_hispeed
                           2877 ;	aes220_Firmware.c:786: CLEAR_USBRESET();
   0BE1 53 91 EF           2878 	anl	_EXIF,#0xEF
   0BE4 90 E6 5D           2879 	mov	dptr,#_USBIRQ
   0BE7 74 10              2880 	mov	a,#0x10
   0BE9 F0                 2881 	movx	@dptr,a
   0BEA D0 D0              2882 	pop	psw
   0BEC D0 01              2883 	pop	(0+1)
   0BEE D0 00              2884 	pop	(0+0)
   0BF0 D0 07              2885 	pop	(0+7)
   0BF2 D0 06              2886 	pop	(0+6)
   0BF4 D0 05              2887 	pop	(0+5)
   0BF6 D0 04              2888 	pop	(0+4)
   0BF8 D0 03              2889 	pop	(0+3)
   0BFA D0 02              2890 	pop	(0+2)
   0BFC D0 83              2891 	pop	dph
   0BFE D0 82              2892 	pop	dpl
   0C00 D0 F0              2893 	pop	b
   0C02 D0 E0              2894 	pop	acc
   0C04 D0 21              2895 	pop	bits
   0C06 32                 2896 	reti
                           2897 ;------------------------------------------------------------
                           2898 ;Allocation info for local variables in function 'hispeed_isr'
                           2899 ;------------------------------------------------------------
                           2900 ;------------------------------------------------------------
                           2901 ;	aes220_Firmware.c:788: void hispeed_isr() interrupt HISPEED_ISR {
                           2902 ;	-----------------------------------------
                           2903 ;	 function hispeed_isr
                           2904 ;	-----------------------------------------
   0C07                    2905 _hispeed_isr:
   0C07 C0 21              2906 	push	bits
   0C09 C0 E0              2907 	push	acc
   0C0B C0 F0              2908 	push	b
   0C0D C0 82              2909 	push	dpl
   0C0F C0 83              2910 	push	dph
   0C11 C0 02              2911 	push	(0+2)
   0C13 C0 03              2912 	push	(0+3)
   0C15 C0 04              2913 	push	(0+4)
   0C17 C0 05              2914 	push	(0+5)
   0C19 C0 06              2915 	push	(0+6)
   0C1B C0 07              2916 	push	(0+7)
   0C1D C0 00              2917 	push	(0+0)
   0C1F C0 01              2918 	push	(0+1)
   0C21 C0 D0              2919 	push	psw
   0C23 75 D0 00           2920 	mov	psw,#0x00
                           2921 ;	aes220_Firmware.c:789: handle_hispeed(TRUE);
   0C26 75 82 01           2922 	mov	dpl,#0x01
   0C29 12 1A E1           2923 	lcall	_handle_hispeed
                           2924 ;	aes220_Firmware.c:790: CLEAR_HISPEED();
   0C2C 53 91 EF           2925 	anl	_EXIF,#0xEF
   0C2F 90 E6 5D           2926 	mov	dptr,#_USBIRQ
   0C32 74 20              2927 	mov	a,#0x20
   0C34 F0                 2928 	movx	@dptr,a
   0C35 D0 D0              2929 	pop	psw
   0C37 D0 01              2930 	pop	(0+1)
   0C39 D0 00              2931 	pop	(0+0)
   0C3B D0 07              2932 	pop	(0+7)
   0C3D D0 06              2933 	pop	(0+6)
   0C3F D0 05              2934 	pop	(0+5)
   0C41 D0 04              2935 	pop	(0+4)
   0C43 D0 03              2936 	pop	(0+3)
   0C45 D0 02              2937 	pop	(0+2)
   0C47 D0 83              2938 	pop	dph
   0C49 D0 82              2939 	pop	dpl
   0C4B D0 F0              2940 	pop	b
   0C4D D0 E0              2941 	pop	acc
   0C4F D0 21              2942 	pop	bits
   0C51 32                 2943 	reti
                           2944 ;------------------------------------------------------------
                           2945 ;Allocation info for local variables in function 'timer0_isr'
                           2946 ;------------------------------------------------------------
                           2947 ;------------------------------------------------------------
                           2948 ;	aes220_Firmware.c:793: void timer0_isr() interrupt TF0_ISR {
                           2949 ;	-----------------------------------------
                           2950 ;	 function timer0_isr
                           2951 ;	-----------------------------------------
   0C52                    2952 _timer0_isr:
                           2953 ;	aes220_Firmware.c:795: if (LED6) { LED6 = 0;} else {LED6 = 1;}
   0C52 10 90 02           2954 	jbc	_PB0,00107$
   0C55 80 02              2955 	sjmp	00102$
   0C57                    2956 00107$:
   0C57 80 02              2957 	sjmp	00104$
   0C59                    2958 00102$:
   0C59 D2 90              2959 	setb	_PB0
   0C5B                    2960 00104$:
   0C5B 32                 2961 	reti
                           2962 ;	eliminated unneeded push/pop psw
                           2963 ;	eliminated unneeded push/pop dpl
                           2964 ;	eliminated unneeded push/pop dph
                           2965 ;	eliminated unneeded push/pop b
                           2966 ;	eliminated unneeded push/pop acc
                           2967 	.area CSEG    (CODE)
                           2968 	.area CONST   (CODE)
   1C8A                    2969 _codeVersion:
   1C8A 01                 2970 	.db #0x01
   1C8B 04                 2971 	.db #0x04
   1C8C 02                 2972 	.db #0x02
                           2973 	.area XINIT   (CODE)
   1C8D                    2974 __xinit__programFpga:
   1C8D 00                 2975 	.db #0x00
   1C8E                    2976 __xinit__fpgaProgrammed:
   1C8E 00                 2977 	.db #0x00
   1C8F                    2978 __xinit__fpgaStatus:
   1C8F A1                 2979 	.db #0xA1
   1C90                    2980 __xinit__uCMode:
   1C90 A1                 2981 	.db #0xA1
   1C91                    2982 __xinit__prevMode:
   1C91 A1                 2983 	.db #0xA1
   1C92                    2984 __xinit__TURN3V3OFF:
   1C92 10                 2985 	.db #0x10
   1C93 71                 2986 	.db #0x71
   1C94                    2987 __xinit__sofct:
   1C94 00 00              2988 	.byte #0x00,#0x00
                           2989 	.area CABS    (ABS,CODE)
