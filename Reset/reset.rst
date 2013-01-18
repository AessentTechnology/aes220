                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
                              4 ; This file was generated Fri Apr  1 14:05:55 2011
                              5 ;--------------------------------------------------------
                              6 	.module reset
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
                             18 	.globl _eeprom_write_local
                             19 	.globl _EIPX6
                             20 	.globl _EIPX5
                             21 	.globl _EIPX4
                             22 	.globl _PI2C
                             23 	.globl _PUSB
                             24 	.globl _EIEX6
                             25 	.globl _EIEX5
                             26 	.globl _EIEX4
                             27 	.globl _EI2C
                             28 	.globl _EUSB
                             29 	.globl _SMOD1
                             30 	.globl _ERESI
                             31 	.globl _RESI
                             32 	.globl _INT6
                             33 	.globl _CY
                             34 	.globl _AC
                             35 	.globl _F0
                             36 	.globl _RS1
                             37 	.globl _RS0
                             38 	.globl _OV
                             39 	.globl _FL
                             40 	.globl _P
                             41 	.globl _TF2
                             42 	.globl _EXF2
                             43 	.globl _RCLK
                             44 	.globl _TCLK
                             45 	.globl _EXEN2
                             46 	.globl _TR2
                             47 	.globl _C_T2
                             48 	.globl _CP_RL2
                             49 	.globl _SM01
                             50 	.globl _SM11
                             51 	.globl _SM21
                             52 	.globl _REN1
                             53 	.globl _TB81
                             54 	.globl _RB81
                             55 	.globl _TI1
                             56 	.globl _RI1
                             57 	.globl _PS1
                             58 	.globl _PT2
                             59 	.globl _PS0
                             60 	.globl _PT1
                             61 	.globl _PX1
                             62 	.globl _PT0
                             63 	.globl _PX0
                             64 	.globl _PD7
                             65 	.globl _PD6
                             66 	.globl _PD5
                             67 	.globl _PD4
                             68 	.globl _PD3
                             69 	.globl _PD2
                             70 	.globl _PD1
                             71 	.globl _PD0
                             72 	.globl _EA
                             73 	.globl _ES1
                             74 	.globl _ET2
                             75 	.globl _ES0
                             76 	.globl _ET1
                             77 	.globl _EX1
                             78 	.globl _ET0
                             79 	.globl _EX0
                             80 	.globl _PC7
                             81 	.globl _PC6
                             82 	.globl _PC5
                             83 	.globl _PC4
                             84 	.globl _PC3
                             85 	.globl _PC2
                             86 	.globl _PC1
                             87 	.globl _PC0
                             88 	.globl _SM0
                             89 	.globl _SM1
                             90 	.globl _SM2
                             91 	.globl _REN
                             92 	.globl _TB8
                             93 	.globl _RB8
                             94 	.globl _TI
                             95 	.globl _RI
                             96 	.globl _PB7
                             97 	.globl _PB6
                             98 	.globl _PB5
                             99 	.globl _PB4
                            100 	.globl _PB3
                            101 	.globl _PB2
                            102 	.globl _PB1
                            103 	.globl _PB0
                            104 	.globl _TF1
                            105 	.globl _TR1
                            106 	.globl _TF0
                            107 	.globl _TR0
                            108 	.globl _IE1
                            109 	.globl _IT1
                            110 	.globl _IE0
                            111 	.globl _IT0
                            112 	.globl _PA7
                            113 	.globl _PA6
                            114 	.globl _PA5
                            115 	.globl _PA4
                            116 	.globl _PA3
                            117 	.globl _PA2
                            118 	.globl _PA1
                            119 	.globl _PA0
                            120 	.globl _EIP
                            121 	.globl _B
                            122 	.globl _EIE
                            123 	.globl _ACC
                            124 	.globl _EICON
                            125 	.globl _PSW
                            126 	.globl _TH2
                            127 	.globl _TL2
                            128 	.globl _RCAP2H
                            129 	.globl _RCAP2L
                            130 	.globl _T2CON
                            131 	.globl _SBUF1
                            132 	.globl _SCON1
                            133 	.globl _GPIFSGLDATLNOX
                            134 	.globl _GPIFSGLDATLX
                            135 	.globl _GPIFSGLDATH
                            136 	.globl _GPIFTRIG
                            137 	.globl _EP01STAT
                            138 	.globl _IP
                            139 	.globl _OEE
                            140 	.globl _OED
                            141 	.globl _OEC
                            142 	.globl _OEB
                            143 	.globl _OEA
                            144 	.globl _IOE
                            145 	.globl _IOD
                            146 	.globl _AUTOPTRSETUP
                            147 	.globl _EP68FIFOFLGS
                            148 	.globl _EP24FIFOFLGS
                            149 	.globl _EP2468STAT
                            150 	.globl _IE
                            151 	.globl _INT4CLR
                            152 	.globl _INT2CLR
                            153 	.globl _IOC
                            154 	.globl _AUTOPTRL2
                            155 	.globl _AUTOPTRH2
                            156 	.globl _AUTOPTRL1
                            157 	.globl _AUTOPTRH1
                            158 	.globl _SBUF0
                            159 	.globl _SCON0
                            160 	.globl __XPAGE
                            161 	.globl _EXIF
                            162 	.globl _IOB
                            163 	.globl _CKCON
                            164 	.globl _TH1
                            165 	.globl _TH0
                            166 	.globl _TL1
                            167 	.globl _TL0
                            168 	.globl _TMOD
                            169 	.globl _TCON
                            170 	.globl _PCON
                            171 	.globl _DPS
                            172 	.globl _DPH1
                            173 	.globl _DPL1
                            174 	.globl _DPH
                            175 	.globl _DPL
                            176 	.globl _SP
                            177 	.globl _IOA
                            178 	.globl _sofct
                            179 	.globl _buf
                            180 	.globl _D5OFF
                            181 	.globl _D5ON
                            182 	.globl _D4OFF
                            183 	.globl _D4ON
                            184 	.globl _D3OFF
                            185 	.globl _D3ON
                            186 	.globl _D2OFF
                            187 	.globl _D2ON
                            188 	.globl _GPCR2
                            189 	.globl _ECC2B2
                            190 	.globl _ECC2B1
                            191 	.globl _ECC2B0
                            192 	.globl _ECC1B2
                            193 	.globl _ECC1B1
                            194 	.globl _ECC1B0
                            195 	.globl _ECCRESET
                            196 	.globl _ECCCFG
                            197 	.globl _EP8FIFOBUF
                            198 	.globl _EP6FIFOBUF
                            199 	.globl _EP4FIFOBUF
                            200 	.globl _EP2FIFOBUF
                            201 	.globl _EP1INBUF
                            202 	.globl _EP1OUTBUF
                            203 	.globl _EP0BUF
                            204 	.globl _UDMACRCQUAL
                            205 	.globl _UDMACRCL
                            206 	.globl _UDMACRCH
                            207 	.globl _GPIFHOLDAMOUNT
                            208 	.globl _FLOWSTBHPERIOD
                            209 	.globl _FLOWSTBEDGE
                            210 	.globl _FLOWSTB
                            211 	.globl _FLOWHOLDOFF
                            212 	.globl _FLOWEQ1CTL
                            213 	.globl _FLOWEQ0CTL
                            214 	.globl _FLOWLOGIC
                            215 	.globl _FLOWSTATE
                            216 	.globl _GPIFABORT
                            217 	.globl _GPIFREADYSTAT
                            218 	.globl _GPIFREADYCFG
                            219 	.globl _XGPIFSGLDATLNOX
                            220 	.globl _XGPIFSGLDATLX
                            221 	.globl _XGPIFSGLDATH
                            222 	.globl _EP8GPIFTRIG
                            223 	.globl _EP8GPIFPFSTOP
                            224 	.globl _EP8GPIFFLGSEL
                            225 	.globl _EP6GPIFTRIG
                            226 	.globl _EP6GPIFPFSTOP
                            227 	.globl _EP6GPIFFLGSEL
                            228 	.globl _EP4GPIFTRIG
                            229 	.globl _EP4GPIFPFSTOP
                            230 	.globl _EP4GPIFFLGSEL
                            231 	.globl _EP2GPIFTRIG
                            232 	.globl _EP2GPIFPFSTOP
                            233 	.globl _EP2GPIFFLGSEL
                            234 	.globl _GPIFTCB0
                            235 	.globl _GPIFTCB1
                            236 	.globl _GPIFTCB2
                            237 	.globl _GPIFTCB3
                            238 	.globl _GPIFADRL
                            239 	.globl _GPIFADRH
                            240 	.globl _GPIFCTLCFG
                            241 	.globl _GPIFIDLECTL
                            242 	.globl _GPIFIDLECS
                            243 	.globl _GPIFWFSELECT
                            244 	.globl _SETUPDAT
                            245 	.globl _SUDPTRCTL
                            246 	.globl _SUDPTRL
                            247 	.globl _SUDPTRH
                            248 	.globl _EP8FIFOBCL
                            249 	.globl _EP8FIFOBCH
                            250 	.globl _EP6FIFOBCL
                            251 	.globl _EP6FIFOBCH
                            252 	.globl _EP4FIFOBCL
                            253 	.globl _EP4FIFOBCH
                            254 	.globl _EP2FIFOBCL
                            255 	.globl _EP2FIFOBCH
                            256 	.globl _EP8FIFOFLGS
                            257 	.globl _EP6FIFOFLGS
                            258 	.globl _EP4FIFOFLGS
                            259 	.globl _EP2FIFOFLGS
                            260 	.globl _EP8CS
                            261 	.globl _EP6CS
                            262 	.globl _EP4CS
                            263 	.globl _EP2CS
                            264 	.globl _EP1INCS
                            265 	.globl _EP1OUTCS
                            266 	.globl _EP0CS
                            267 	.globl _EP8BCL
                            268 	.globl _EP8BCH
                            269 	.globl _EP6BCL
                            270 	.globl _EP6BCH
                            271 	.globl _EP4BCL
                            272 	.globl _EP4BCH
                            273 	.globl _EP2BCL
                            274 	.globl _EP2BCH
                            275 	.globl _EP1INBC
                            276 	.globl _EP1OUTBC
                            277 	.globl _EP0BCL
                            278 	.globl _EP0BCH
                            279 	.globl _FNADDR
                            280 	.globl _MICROFRAME
                            281 	.globl _USBFRAMEL
                            282 	.globl _USBFRAMEH
                            283 	.globl _TOGCTL
                            284 	.globl _WAKEUPCS
                            285 	.globl _SUSPEND
                            286 	.globl _USBCS
                            287 	.globl _XAUTODAT2
                            288 	.globl _XAUTODAT1
                            289 	.globl _I2CTL
                            290 	.globl _I2DAT
                            291 	.globl _I2CS
                            292 	.globl _PORTECFG
                            293 	.globl _PORTCCFG
                            294 	.globl _PORTACFG
                            295 	.globl _INTSETUP
                            296 	.globl _INT4IVEC
                            297 	.globl _INT2IVEC
                            298 	.globl _CLRERRCNT
                            299 	.globl _ERRCNTLIM
                            300 	.globl _USBERRIRQ
                            301 	.globl _USBERRIE
                            302 	.globl _GPIFIRQ
                            303 	.globl _GPIFIE
                            304 	.globl _EPIRQ
                            305 	.globl _EPIE
                            306 	.globl _USBIRQ
                            307 	.globl _USBIE
                            308 	.globl _NAKIRQ
                            309 	.globl _NAKIE
                            310 	.globl _IBNIRQ
                            311 	.globl _IBNIE
                            312 	.globl _EP8FIFOIRQ
                            313 	.globl _EP8FIFOIE
                            314 	.globl _EP6FIFOIRQ
                            315 	.globl _EP6FIFOIE
                            316 	.globl _EP4FIFOIRQ
                            317 	.globl _EP4FIFOIE
                            318 	.globl _EP2FIFOIRQ
                            319 	.globl _EP2FIFOIE
                            320 	.globl _OUTPKTEND
                            321 	.globl _INPKTEND
                            322 	.globl _EP8ISOINPKTS
                            323 	.globl _EP6ISOINPKTS
                            324 	.globl _EP4ISOINPKTS
                            325 	.globl _EP2ISOINPKTS
                            326 	.globl _EP8FIFOPFL
                            327 	.globl _EP8FIFOPFH
                            328 	.globl _EP6FIFOPFL
                            329 	.globl _EP6FIFOPFH
                            330 	.globl _EP4FIFOPFL
                            331 	.globl _EP4FIFOPFH
                            332 	.globl _EP2FIFOPFL
                            333 	.globl _EP2FIFOPFH
                            334 	.globl _EP8AUTOINLENL
                            335 	.globl _EP8AUTOINLENH
                            336 	.globl _EP6AUTOINLENL
                            337 	.globl _EP6AUTOINLENH
                            338 	.globl _EP4AUTOINLENL
                            339 	.globl _EP4AUTOINLENH
                            340 	.globl _EP2AUTOINLENL
                            341 	.globl _EP2AUTOINLENH
                            342 	.globl _EP8FIFOCFG
                            343 	.globl _EP6FIFOCFG
                            344 	.globl _EP4FIFOCFG
                            345 	.globl _EP2FIFOCFG
                            346 	.globl _EP8CFG
                            347 	.globl _EP6CFG
                            348 	.globl _EP4CFG
                            349 	.globl _EP2CFG
                            350 	.globl _EP1INCFG
                            351 	.globl _EP1OUTCFG
                            352 	.globl _REVCTL
                            353 	.globl _REVID
                            354 	.globl _FIFOPINPOLAR
                            355 	.globl _UART230
                            356 	.globl _BPADDRL
                            357 	.globl _BPADDRH
                            358 	.globl _BREAKPT
                            359 	.globl _FIFORESET
                            360 	.globl _PINFLAGSCD
                            361 	.globl _PINFLAGSAB
                            362 	.globl _IFCONFIG
                            363 	.globl _CPUCS
                            364 	.globl _RES_WAVEDATA_END
                            365 	.globl _GPIF_WAVE_DATA
                            366 	.globl _on5
                            367 	.globl _on
                            368 	.globl _got_sud
                            369 	.globl _gotbuf
                            370 	.globl _handle_set_interface_PARM_2
                            371 	.globl _handle_get_interface_PARM_2
                            372 	.globl _eeprom_write_local_PARM_4
                            373 	.globl _eeprom_write_local_PARM_3
                            374 	.globl _eeprom_write_local_PARM_2
                            375 	.globl _lcount
                            376 	.globl _icount
                            377 	.globl _bytes
                            378 	.globl _sudav_isr
                            379 	.globl _sof_isr
                            380 	.globl _usbreset_isr
                            381 	.globl _hispeed_isr
                            382 ;--------------------------------------------------------
                            383 ; special function registers
                            384 ;--------------------------------------------------------
                            385 	.area RSEG    (DATA)
                    0080    386 _IOA	=	0x0080
                    0081    387 _SP	=	0x0081
                    0082    388 _DPL	=	0x0082
                    0083    389 _DPH	=	0x0083
                    0084    390 _DPL1	=	0x0084
                    0085    391 _DPH1	=	0x0085
                    0086    392 _DPS	=	0x0086
                    0087    393 _PCON	=	0x0087
                    0088    394 _TCON	=	0x0088
                    0089    395 _TMOD	=	0x0089
                    008A    396 _TL0	=	0x008a
                    008B    397 _TL1	=	0x008b
                    008C    398 _TH0	=	0x008c
                    008D    399 _TH1	=	0x008d
                    008E    400 _CKCON	=	0x008e
                    0090    401 _IOB	=	0x0090
                    0091    402 _EXIF	=	0x0091
                    0092    403 __XPAGE	=	0x0092
                    0098    404 _SCON0	=	0x0098
                    0099    405 _SBUF0	=	0x0099
                    009A    406 _AUTOPTRH1	=	0x009a
                    009B    407 _AUTOPTRL1	=	0x009b
                    009D    408 _AUTOPTRH2	=	0x009d
                    009E    409 _AUTOPTRL2	=	0x009e
                    00A0    410 _IOC	=	0x00a0
                    00A1    411 _INT2CLR	=	0x00a1
                    00A2    412 _INT4CLR	=	0x00a2
                    00A8    413 _IE	=	0x00a8
                    00AA    414 _EP2468STAT	=	0x00aa
                    00AB    415 _EP24FIFOFLGS	=	0x00ab
                    00AC    416 _EP68FIFOFLGS	=	0x00ac
                    00AF    417 _AUTOPTRSETUP	=	0x00af
                    00B0    418 _IOD	=	0x00b0
                    00B1    419 _IOE	=	0x00b1
                    00B2    420 _OEA	=	0x00b2
                    00B3    421 _OEB	=	0x00b3
                    00B4    422 _OEC	=	0x00b4
                    00B5    423 _OED	=	0x00b5
                    00B6    424 _OEE	=	0x00b6
                    00B8    425 _IP	=	0x00b8
                    00BA    426 _EP01STAT	=	0x00ba
                    00BB    427 _GPIFTRIG	=	0x00bb
                    00BD    428 _GPIFSGLDATH	=	0x00bd
                    00BE    429 _GPIFSGLDATLX	=	0x00be
                    00BF    430 _GPIFSGLDATLNOX	=	0x00bf
                    00C0    431 _SCON1	=	0x00c0
                    00C1    432 _SBUF1	=	0x00c1
                    00C8    433 _T2CON	=	0x00c8
                    00CA    434 _RCAP2L	=	0x00ca
                    00CB    435 _RCAP2H	=	0x00cb
                    00CC    436 _TL2	=	0x00cc
                    00CD    437 _TH2	=	0x00cd
                    00D0    438 _PSW	=	0x00d0
                    00D8    439 _EICON	=	0x00d8
                    00E0    440 _ACC	=	0x00e0
                    00E8    441 _EIE	=	0x00e8
                    00F0    442 _B	=	0x00f0
                    00F8    443 _EIP	=	0x00f8
                            444 ;--------------------------------------------------------
                            445 ; special function bits
                            446 ;--------------------------------------------------------
                            447 	.area RSEG    (DATA)
                    0080    448 _PA0	=	0x0080
                    0081    449 _PA1	=	0x0081
                    0082    450 _PA2	=	0x0082
                    0083    451 _PA3	=	0x0083
                    0084    452 _PA4	=	0x0084
                    0085    453 _PA5	=	0x0085
                    0086    454 _PA6	=	0x0086
                    0087    455 _PA7	=	0x0087
                    0088    456 _IT0	=	0x0088
                    0089    457 _IE0	=	0x0089
                    008A    458 _IT1	=	0x008a
                    008B    459 _IE1	=	0x008b
                    008C    460 _TR0	=	0x008c
                    008D    461 _TF0	=	0x008d
                    008E    462 _TR1	=	0x008e
                    008F    463 _TF1	=	0x008f
                    0090    464 _PB0	=	0x0090
                    0091    465 _PB1	=	0x0091
                    0092    466 _PB2	=	0x0092
                    0093    467 _PB3	=	0x0093
                    0094    468 _PB4	=	0x0094
                    0095    469 _PB5	=	0x0095
                    0096    470 _PB6	=	0x0096
                    0097    471 _PB7	=	0x0097
                    0098    472 _RI	=	0x0098
                    0099    473 _TI	=	0x0099
                    009A    474 _RB8	=	0x009a
                    009B    475 _TB8	=	0x009b
                    009C    476 _REN	=	0x009c
                    009D    477 _SM2	=	0x009d
                    009E    478 _SM1	=	0x009e
                    009F    479 _SM0	=	0x009f
                    00A0    480 _PC0	=	0x00a0
                    00A1    481 _PC1	=	0x00a1
                    00A2    482 _PC2	=	0x00a2
                    00A3    483 _PC3	=	0x00a3
                    00A4    484 _PC4	=	0x00a4
                    00A5    485 _PC5	=	0x00a5
                    00A6    486 _PC6	=	0x00a6
                    00A7    487 _PC7	=	0x00a7
                    00A8    488 _EX0	=	0x00a8
                    00A9    489 _ET0	=	0x00a9
                    00AA    490 _EX1	=	0x00aa
                    00AB    491 _ET1	=	0x00ab
                    00AC    492 _ES0	=	0x00ac
                    00AD    493 _ET2	=	0x00ad
                    00AE    494 _ES1	=	0x00ae
                    00AF    495 _EA	=	0x00af
                    00B0    496 _PD0	=	0x00b0
                    00B1    497 _PD1	=	0x00b1
                    00B2    498 _PD2	=	0x00b2
                    00B3    499 _PD3	=	0x00b3
                    00B4    500 _PD4	=	0x00b4
                    00B5    501 _PD5	=	0x00b5
                    00B6    502 _PD6	=	0x00b6
                    00B7    503 _PD7	=	0x00b7
                    00B8    504 _PX0	=	0x00b8
                    00B9    505 _PT0	=	0x00b9
                    00BA    506 _PX1	=	0x00ba
                    00BB    507 _PT1	=	0x00bb
                    00BC    508 _PS0	=	0x00bc
                    00BD    509 _PT2	=	0x00bd
                    00BE    510 _PS1	=	0x00be
                    00C0    511 _RI1	=	0x00c0
                    00C1    512 _TI1	=	0x00c1
                    00C2    513 _RB81	=	0x00c2
                    00C3    514 _TB81	=	0x00c3
                    00C4    515 _REN1	=	0x00c4
                    00C5    516 _SM21	=	0x00c5
                    00C6    517 _SM11	=	0x00c6
                    00C7    518 _SM01	=	0x00c7
                    00C8    519 _CP_RL2	=	0x00c8
                    00C9    520 _C_T2	=	0x00c9
                    00CA    521 _TR2	=	0x00ca
                    00CB    522 _EXEN2	=	0x00cb
                    00CC    523 _TCLK	=	0x00cc
                    00CD    524 _RCLK	=	0x00cd
                    00CE    525 _EXF2	=	0x00ce
                    00CF    526 _TF2	=	0x00cf
                    00D0    527 _P	=	0x00d0
                    00D1    528 _FL	=	0x00d1
                    00D2    529 _OV	=	0x00d2
                    00D3    530 _RS0	=	0x00d3
                    00D4    531 _RS1	=	0x00d4
                    00D5    532 _F0	=	0x00d5
                    00D6    533 _AC	=	0x00d6
                    00D7    534 _CY	=	0x00d7
                    00DB    535 _INT6	=	0x00db
                    00DC    536 _RESI	=	0x00dc
                    00DD    537 _ERESI	=	0x00dd
                    00DF    538 _SMOD1	=	0x00df
                    00E8    539 _EUSB	=	0x00e8
                    00E9    540 _EI2C	=	0x00e9
                    00EA    541 _EIEX4	=	0x00ea
                    00EB    542 _EIEX5	=	0x00eb
                    00EC    543 _EIEX6	=	0x00ec
                    00F8    544 _PUSB	=	0x00f8
                    00F9    545 _PI2C	=	0x00f9
                    00FA    546 _EIPX4	=	0x00fa
                    00FB    547 _EIPX5	=	0x00fb
                    00FC    548 _EIPX6	=	0x00fc
                            549 ;--------------------------------------------------------
                            550 ; overlayable register banks
                            551 ;--------------------------------------------------------
                            552 	.area REG_BANK_0	(REL,OVR,DATA)
   0000                     553 	.ds 8
                            554 	.area REG_BANK_1	(REL,OVR,DATA)
   0008                     555 	.ds 8
                            556 ;--------------------------------------------------------
                            557 ; overlayable bit register bank
                            558 ;--------------------------------------------------------
                            559 	.area BIT_BANK	(REL,OVR,DATA)
   0022                     560 bits:
   0022                     561 	.ds 1
                    8000    562 	b0 = bits[0]
                    8100    563 	b1 = bits[1]
                    8200    564 	b2 = bits[2]
                    8300    565 	b3 = bits[3]
                    8400    566 	b4 = bits[4]
                    8500    567 	b5 = bits[5]
                    8600    568 	b6 = bits[6]
                    8700    569 	b7 = bits[7]
                            570 ;--------------------------------------------------------
                            571 ; internal ram data
                            572 ;--------------------------------------------------------
                            573 	.area DSEG    (DATA)
   0023                     574 _bytes::
   0023                     575 	.ds 2
   0025                     576 _icount::
   0025                     577 	.ds 1
   0026                     578 _lcount::
   0026                     579 	.ds 4
   002A                     580 _eeprom_write_local_PARM_2:
   002A                     581 	.ds 2
   002C                     582 _eeprom_write_local_PARM_3:
   002C                     583 	.ds 2
   002E                     584 _eeprom_write_local_PARM_4:
   002E                     585 	.ds 3
   0031                     586 _eeprom_write_local_prom_addr_1_1:
   0031                     587 	.ds 1
   0032                     588 _eeprom_write_local_data_buffer_1_1:
   0032                     589 	.ds 3
   0035                     590 _eeprom_write_local_cur_byte_1_1:
   0035                     591 	.ds 1
   0036                     592 _handle_get_interface_PARM_2:
   0036                     593 	.ds 3
   0039                     594 _handle_set_interface_PARM_2:
   0039                     595 	.ds 1
                            596 ;--------------------------------------------------------
                            597 ; overlayable items in internal ram 
                            598 ;--------------------------------------------------------
                            599 	.area	OSEG    (OVR,DATA)
                            600 ;--------------------------------------------------------
                            601 ; Stack segment in internal ram 
                            602 ;--------------------------------------------------------
                            603 	.area	SSEG	(DATA)
   0083                     604 __start__stack:
   0083                     605 	.ds	1
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
                    8800    814 _D2ON	=	0x8800
                    8000    815 _D2OFF	=	0x8000
                    9800    816 _D3ON	=	0x9800
                    9000    817 _D3OFF	=	0x9000
                    A800    818 _D4ON	=	0xa800
                    A000    819 _D4OFF	=	0xa000
                    B800    820 _D5ON	=	0xb800
                    B000    821 _D5OFF	=	0xb000
   3C00                     822 _buf::
   3C00                     823 	.ds 100
                            824 ;--------------------------------------------------------
                            825 ; absolute external ram data
                            826 ;--------------------------------------------------------
                            827 	.area XABS    (ABS,XDATA)
                            828 ;--------------------------------------------------------
                            829 ; external initialized ram data
                            830 ;--------------------------------------------------------
                            831 	.area XISEG   (XDATA)
   3C65                     832 _sofct::
   3C65                     833 	.ds 2
                            834 	.area HOME    (CODE)
                            835 	.area GSINIT0 (CODE)
                            836 	.area GSINIT1 (CODE)
                            837 	.area GSINIT2 (CODE)
                            838 	.area GSINIT3 (CODE)
                            839 	.area GSINIT4 (CODE)
                            840 	.area GSINIT5 (CODE)
                            841 	.area GSINIT  (CODE)
                            842 	.area GSFINAL (CODE)
                            843 	.area CSEG    (CODE)
                            844 ;--------------------------------------------------------
                            845 ; interrupt vector 
                            846 ;--------------------------------------------------------
                            847 	.area HOME    (CODE)
   0000                     848 __interrupt_vect:
   0000 02 01 BB            849 	ljmp	__sdcc_gsinit_startup
   0003 32                  850 	reti
   0004                     851 	.ds	7
   000B 32                  852 	reti
   000C                     853 	.ds	7
   0013 32                  854 	reti
   0014                     855 	.ds	7
   001B 32                  856 	reti
   001C                     857 	.ds	7
   0023 32                  858 	reti
   0024                     859 	.ds	7
   002B 32                  860 	reti
   002C                     861 	.ds	7
   0033 32                  862 	reti
   0034                     863 	.ds	7
   003B 32                  864 	reti
   003C                     865 	.ds	7
   0043 32                  866 	reti
   0044                     867 	.ds	7
   004B 32                  868 	reti
   004C                     869 	.ds	7
   0053 32                  870 	reti
   0054                     871 	.ds	7
   005B 32                  872 	reti
   005C                     873 	.ds	7
   0063 32                  874 	reti
   0064                     875 	.ds	7
   006B 02 06 A4            876 	ljmp	_sudav_isr
   006E                     877 	.ds	5
   0073 02 06 BC            878 	ljmp	_sof_isr
   0076                     879 	.ds	5
   007B 02 07 A2            880 	ljmp	_sutok_isr
   007E                     881 	.ds	5
   0083 02 0F 64            882 	ljmp	_suspend_isr
   0086                     883 	.ds	5
   008B 02 07 09            884 	ljmp	_usbreset_isr
   008E                     885 	.ds	5
   0093 02 07 54            886 	ljmp	_hispeed_isr
   0096                     887 	.ds	5
   009B 02 07 9F            888 	ljmp	_ep0ack_isr
   009E                     889 	.ds	5
   00A3 02 0F 8E            890 	ljmp	_ep0in_isr
   00A6                     891 	.ds	5
   00AB 02 0F 8F            892 	ljmp	_ep0out_isr
   00AE                     893 	.ds	5
   00B3 02 0F 90            894 	ljmp	_ep1in_isr
   00B6                     895 	.ds	5
   00BB 02 0F 93            896 	ljmp	_ep1out_isr
   00BE                     897 	.ds	5
   00C3 02 0F 66            898 	ljmp	_ep2_isr
   00C6                     899 	.ds	5
   00CB 02 0F 80            900 	ljmp	_ep4_isr
   00CE                     901 	.ds	5
   00D3 02 0F 81            902 	ljmp	_ep6_isr
   00D6                     903 	.ds	5
   00DB 02 0F 83            904 	ljmp	_ep8_isr
   00DE                     905 	.ds	5
   00E3 02 0B 8F            906 	ljmp	_ibn_isr
   00E6                     907 	.ds	5
   00EB 02 17 64            908 	ljmp	_ep0ping_isr
   00EE                     909 	.ds	5
   00F3 02 07 A0            910 	ljmp	_ep1ping_isr
   00F6                     911 	.ds	5
   00FB 02 07 A1            912 	ljmp	_ep2ping_isr
   00FE                     913 	.ds	5
   0103 02 0B 8E            914 	ljmp	_ep4ping_isr
   0106                     915 	.ds	5
   010B 02 0B 90            916 	ljmp	_ep6ping_isr
   010E                     917 	.ds	5
   0113 02 0B 91            918 	ljmp	_ep8ping_isr
   0116                     919 	.ds	5
   011B 02 16 C1            920 	ljmp	_errlimit_isr
   011E                     921 	.ds	5
   0123 02 0F 8C            922 	ljmp	_ep2isoerr_isr
   0126                     923 	.ds	5
   012B 02 0F 91            924 	ljmp	_ep4isoerr_isr
   012E                     925 	.ds	5
   0133 02 0F 94            926 	ljmp	_ep6isoerr_isr
   0136                     927 	.ds	5
   013B 02 0F 96            928 	ljmp	_ep8isoerr_isr
   013E                     929 	.ds	5
   0143 02 0F 8D            930 	ljmp	_spare_isr
   0146                     931 	.ds	5
   014B 02 0F 92            932 	ljmp	_ep2pf_isr
   014E                     933 	.ds	5
   0153 02 0F 95            934 	ljmp	_ep4pf_isr
   0156                     935 	.ds	5
   015B 02 0F 97            936 	ljmp	_ep6pf_isr
   015E                     937 	.ds	5
   0163 02 10 EE            938 	ljmp	_ep8pf_isr
   0166                     939 	.ds	5
   016B 02 0F 84            940 	ljmp	_ep2ef_isr
   016E                     941 	.ds	5
   0173 02 0F 86            942 	ljmp	_ep4ef_isr
   0176                     943 	.ds	5
   017B 02 0F 88            944 	ljmp	_ep6ef_isr
   017E                     945 	.ds	5
   0183 02 0F 8A            946 	ljmp	_ep8ef_isr
   0186                     947 	.ds	5
   018B 02 0F 85            948 	ljmp	_ep2ff_isr
   018E                     949 	.ds	5
   0193 02 0F 87            950 	ljmp	_ep4ff_isr
   0196                     951 	.ds	5
   019B 02 0F 89            952 	ljmp	_ep6ff_isr
   019E                     953 	.ds	5
   01A3 02 0F 8B            954 	ljmp	_ep8ff_isr
   01A6                     955 	.ds	5
   01AB 02 0F 82            956 	ljmp	_gpifdone_isr
   01AE                     957 	.ds	5
   01B3 02 0F 65            958 	ljmp	_gpifwf_isr
                            959 ;--------------------------------------------------------
                            960 ; global & static initialisations
                            961 ;--------------------------------------------------------
                            962 	.area HOME    (CODE)
                            963 	.area GSINIT  (CODE)
                            964 	.area GSFINAL (CODE)
                            965 	.area GSINIT  (CODE)
                            966 	.globl __sdcc_gsinit_startup
                            967 	.globl __sdcc_program_startup
                            968 	.globl __start__stack
                            969 	.globl __mcs51_genXINIT
                            970 	.globl __mcs51_genXRAMCLEAR
                            971 	.globl __mcs51_genRAMCLEAR
                            972 	.area GSFINAL (CODE)
   0226 02 01 B6            973 	ljmp	__sdcc_program_startup
                            974 ;--------------------------------------------------------
                            975 ; Home
                            976 ;--------------------------------------------------------
                            977 	.area HOME    (CODE)
                            978 	.area HOME    (CODE)
   01B6                     979 __sdcc_program_startup:
   01B6 12 02 D7            980 	lcall	_main
                            981 ;	return from main will lock up
   01B9 80 FE               982 	sjmp .
                            983 ;--------------------------------------------------------
                            984 ; code
                            985 ;--------------------------------------------------------
                            986 	.area CSEG    (CODE)
                            987 ;------------------------------------------------------------
                            988 ;Allocation info for local variables in function 'eeprom_write_local'
                            989 ;------------------------------------------------------------
                            990 ;addr                      Allocated with name '_eeprom_write_local_PARM_2'
                            991 ;length                    Allocated with name '_eeprom_write_local_PARM_3'
                            992 ;buf                       Allocated with name '_eeprom_write_local_PARM_4'
                            993 ;prom_addr                 Allocated with name '_eeprom_write_local_prom_addr_1_1'
                            994 ;addr_len                  Allocated to registers 
                            995 ;data_buffer               Allocated with name '_eeprom_write_local_data_buffer_1_1'
                            996 ;cur_byte                  Allocated with name '_eeprom_write_local_cur_byte_1_1'
                            997 ;------------------------------------------------------------
                            998 ;	reset.c:62: void eeprom_write_local(BYTE prom_addr, WORD addr, WORD length, BYTE* buf) {
                            999 ;	-----------------------------------------
                           1000 ;	 function eeprom_write_local
                           1001 ;	-----------------------------------------
   0229                    1002 _eeprom_write_local:
                    0002   1003 	ar2 = 0x02
                    0003   1004 	ar3 = 0x03
                    0004   1005 	ar4 = 0x04
                    0005   1006 	ar5 = 0x05
                    0006   1007 	ar6 = 0x06
                    0007   1008 	ar7 = 0x07
                    0000   1009 	ar0 = 0x00
                    0001   1010 	ar1 = 0x01
   0229 85 82 31           1011 	mov	_eeprom_write_local_prom_addr_1_1,dpl
                           1012 ;	reset.c:68: while ( cur_byte<length ) {
   022C 75 35 00           1013 	mov	_eeprom_write_local_cur_byte_1_1,#0x00
   022F AC 2A              1014 	mov	r4,_eeprom_write_local_PARM_2
   0231 AD 2B              1015 	mov	r5,(_eeprom_write_local_PARM_2 + 1)
   0233                    1016 00101$:
   0233 AE 35              1017 	mov	r6,_eeprom_write_local_cur_byte_1_1
   0235 7F 00              1018 	mov	r7,#0x00
   0237 C3                 1019 	clr	c
   0238 EE                 1020 	mov	a,r6
   0239 95 2C              1021 	subb	a,_eeprom_write_local_PARM_3
   023B EF                 1022 	mov	a,r7
   023C 95 2D              1023 	subb	a,(_eeprom_write_local_PARM_3 + 1)
   023E 40 01              1024 	jc	00109$
   0240 22                 1025 	ret
   0241                    1026 00109$:
                           1027 ;	reset.c:70: printf ( "%d %04x:%02x\n", cur_byte, addr, buf[cur_byte]);
   0241 E5 35              1028 	mov	a,_eeprom_write_local_cur_byte_1_1
   0243 25 2E              1029 	add	a,_eeprom_write_local_PARM_4
   0245 FE                 1030 	mov	r6,a
   0246 E4                 1031 	clr	a
   0247 35 2F              1032 	addc	a,(_eeprom_write_local_PARM_4 + 1)
   0249 FF                 1033 	mov	r7,a
   024A AA 30              1034 	mov	r2,(_eeprom_write_local_PARM_4 + 2)
   024C 8E 82              1035 	mov	dpl,r6
   024E 8F 83              1036 	mov	dph,r7
   0250 8A F0              1037 	mov	b,r2
   0252 12 16 DA           1038 	lcall	__gptrget
   0255 FE                 1039 	mov	r6,a
   0256 7A 00              1040 	mov	r2,#0x00
   0258 AF 35              1041 	mov	r7,_eeprom_write_local_cur_byte_1_1
   025A 7B 00              1042 	mov	r3,#0x00
   025C C0 04              1043 	push	ar4
   025E C0 05              1044 	push	ar5
   0260 C0 06              1045 	push	ar6
   0262 C0 02              1046 	push	ar2
   0264 C0 04              1047 	push	ar4
   0266 C0 05              1048 	push	ar5
   0268 C0 07              1049 	push	ar7
   026A C0 03              1050 	push	ar3
   026C 74 CE              1051 	mov	a,#__str_0
   026E C0 E0              1052 	push	acc
   0270 74 17              1053 	mov	a,#(__str_0 >> 8)
   0272 C0 E0              1054 	push	acc
   0274 74 80              1055 	mov	a,#0x80
   0276 C0 E0              1056 	push	acc
   0278 12 11 13           1057 	lcall	_printf
   027B E5 81              1058 	mov	a,sp
   027D 24 F7              1059 	add	a,#0xf7
   027F F5 81              1060 	mov	sp,a
   0281 D0 05              1061 	pop	ar5
   0283 D0 04              1062 	pop	ar4
                           1063 ;	reset.c:71: data_buffer[addr_len++] = MSB(addr);
   0285 8D 02              1064 	mov	ar2,r5
   0287 8A 32              1065 	mov	_eeprom_write_local_data_buffer_1_1,r2
                           1066 ;	reset.c:72: data_buffer[addr_len++] = LSB(addr);
   0289 8C 02              1067 	mov	ar2,r4
   028B 8A 33              1068 	mov	(_eeprom_write_local_data_buffer_1_1 + 0x0001),r2
                           1069 ;	reset.c:73: data_buffer[addr_len++] = buf[cur_byte++];
   028D AA 35              1070 	mov	r2,_eeprom_write_local_cur_byte_1_1
   028F 05 35              1071 	inc	_eeprom_write_local_cur_byte_1_1
   0291 EA                 1072 	mov	a,r2
   0292 25 2E              1073 	add	a,_eeprom_write_local_PARM_4
   0294 FA                 1074 	mov	r2,a
   0295 E4                 1075 	clr	a
   0296 35 2F              1076 	addc	a,(_eeprom_write_local_PARM_4 + 1)
   0298 FB                 1077 	mov	r3,a
   0299 AE 30              1078 	mov	r6,(_eeprom_write_local_PARM_4 + 2)
   029B 8A 82              1079 	mov	dpl,r2
   029D 8B 83              1080 	mov	dph,r3
   029F 8E F0              1081 	mov	b,r6
   02A1 12 16 DA           1082 	lcall	__gptrget
   02A4 FA                 1083 	mov	r2,a
   02A5 8A 34              1084 	mov	(_eeprom_write_local_data_buffer_1_1 + 0x0002),r2
                           1085 ;	reset.c:74: i2c_write ( prom_addr, addr_len, data_buffer, 0, NULL );
   02A7 75 3C 32           1086 	mov	_i2c_write_PARM_3,#_eeprom_write_local_data_buffer_1_1
   02AA 75 3D 00           1087 	mov	(_i2c_write_PARM_3 + 1),#0x00
   02AD 75 3E 40           1088 	mov	(_i2c_write_PARM_3 + 2),#0x40
   02B0 75 3A 03           1089 	mov	_i2c_write_PARM_2,#0x03
   02B3 E4                 1090 	clr	a
   02B4 F5 3B              1091 	mov	(_i2c_write_PARM_2 + 1),a
   02B6 E4                 1092 	clr	a
   02B7 F5 3F              1093 	mov	_i2c_write_PARM_4,a
   02B9 F5 40              1094 	mov	(_i2c_write_PARM_4 + 1),a
   02BB F5 41              1095 	mov	_i2c_write_PARM_5,a
   02BD F5 42              1096 	mov	(_i2c_write_PARM_5 + 1),a
   02BF F5 43              1097 	mov	(_i2c_write_PARM_5 + 2),a
   02C1 85 31 82           1098 	mov	dpl,_eeprom_write_local_prom_addr_1_1
   02C4 C0 04              1099 	push	ar4
   02C6 C0 05              1100 	push	ar5
   02C8 12 07 A3           1101 	lcall	_i2c_write
   02CB D0 05              1102 	pop	ar5
   02CD D0 04              1103 	pop	ar4
                           1104 ;	reset.c:75: ++addr; // next byte goes to next address
   02CF 0C                 1105 	inc	r4
   02D0 BC 00 01           1106 	cjne	r4,#0x00,00110$
   02D3 0D                 1107 	inc	r5
   02D4                    1108 00110$:
   02D4 02 02 33           1109 	ljmp	00101$
                           1110 ;------------------------------------------------------------
                           1111 ;Allocation info for local variables in function 'main'
                           1112 ;------------------------------------------------------------
                           1113 ;on                        Allocated to registers 
                           1114 ;size                      Allocated to registers 
                           1115 ;dummy                     Allocated to registers 
                           1116 ;i                         Allocated to registers r2 r3 
                           1117 ;------------------------------------------------------------
                           1118 ;	reset.c:80: void main() {
                           1119 ;	-----------------------------------------
                           1120 ;	 function main
                           1121 ;	-----------------------------------------
   02D7                    1122 _main:
                           1123 ;	reset.c:84: LED6 = 0;
   02D7 C2 90              1124 	clr	_PB0
                           1125 ;	reset.c:85: REVCTL=0; // not using advanced endpoint controls
   02D9 90 E6 0B           1126 	mov	dptr,#_REVCTL
   02DC E4                 1127 	clr	a
   02DD F0                 1128 	movx	@dptr,a
                           1129 ;	reset.c:88: lcount=0;
   02DE E4                 1130 	clr	a
   02DF F5 26              1131 	mov	_lcount,a
   02E1 F5 27              1132 	mov	(_lcount + 1),a
   02E3 F5 28              1133 	mov	(_lcount + 2),a
   02E5 F5 29              1134 	mov	(_lcount + 3),a
                           1135 ;	reset.c:89: got_sud=FALSE;
   02E7 C2 01              1136 	clr	_got_sud
                           1137 ;	reset.c:90: icount=0;
   02E9 75 25 00           1138 	mov	_icount,#0x00
                           1139 ;	reset.c:91: gotbuf=FALSE;
   02EC C2 00              1140 	clr	_gotbuf
                           1141 ;	reset.c:92: bytes=0;
   02EE E4                 1142 	clr	a
   02EF F5 23              1143 	mov	_bytes,a
   02F1 F5 24              1144 	mov	(_bytes + 1),a
                           1145 ;	reset.c:95: RENUMERATE_UNCOND();
   02F3 90 E6 80           1146 	mov	dptr,#_USBCS
   02F6 E0                 1147 	movx	a,@dptr
   02F7 44 0A              1148 	orl	a,#0x0A
   02F9 F0                 1149 	movx	@dptr,a
   02FA 90 05 DC           1150 	mov	dptr,#0x05DC
   02FD 12 10 98           1151 	lcall	_delay
   0300 90 E6 80           1152 	mov	dptr,#_USBCS
   0303 E0                 1153 	movx	a,@dptr
   0304 54 F7              1154 	anl	a,#0xF7
   0306 F0                 1155 	movx	@dptr,a
                           1156 ;	reset.c:97: SETCPUFREQ(CLK_48M);
   0307 90 E6 00           1157 	mov	dptr,#_CPUCS
   030A E0                 1158 	movx	a,@dptr
   030B FA                 1159 	mov	r2,a
   030C 74 E7              1160 	mov	a,#0xE7
   030E 5A                 1161 	anl	a,r2
   030F 90 E6 00           1162 	mov	dptr,#_CPUCS
   0312 F5 F0              1163 	mov	b,a
   0314 74 10              1164 	mov	a,#0x10
   0316 45 F0              1165 	orl	a,b
   0318 F0                 1166 	movx	@dptr,a
                           1167 ;	reset.c:98: sio0_init(57600);
   0319 90 E1 00           1168 	mov	dptr,#0xE100
   031C 12 0F 98           1169 	lcall	_sio0_init
                           1170 ;	reset.c:100: USE_USB_INTS();
   031F E5 00              1171 	mov	a,_INT2JT
   0321 D2 E8              1172 	setb	_EUSB
   0323 90 E6 68           1173 	mov	dptr,#_INTSETUP
   0326 E0                 1174 	movx	a,@dptr
   0327 44 08              1175 	orl	a,#0x08
   0329 F0                 1176 	movx	@dptr,a
                           1177 ;	reset.c:101: ENABLE_SUDAV();
   032A 90 E6 5C           1178 	mov	dptr,#_USBIE
   032D E0                 1179 	movx	a,@dptr
   032E 44 01              1180 	orl	a,#0x01
   0330 F0                 1181 	movx	@dptr,a
                           1182 ;	reset.c:102: ENABLE_SOF();
   0331 90 E6 5C           1183 	mov	dptr,#_USBIE
   0334 E0                 1184 	movx	a,@dptr
   0335 44 02              1185 	orl	a,#0x02
   0337 F0                 1186 	movx	@dptr,a
                           1187 ;	reset.c:103: ENABLE_HISPEED();
   0338 90 E6 5C           1188 	mov	dptr,#_USBIE
   033B E0                 1189 	movx	a,@dptr
   033C 44 20              1190 	orl	a,#0x20
   033E F0                 1191 	movx	@dptr,a
                           1192 ;	reset.c:104: ENABLE_USBRESET();
   033F 90 E6 5C           1193 	mov	dptr,#_USBIE
   0342 E0                 1194 	movx	a,@dptr
   0343 FA                 1195 	mov	r2,a
   0344 44 10              1196 	orl	a,#0x10
   0346 F0                 1197 	movx	@dptr,a
                           1198 ;	reset.c:108: EP2CFG = 0xA2; // 10100010
   0347 90 E6 12           1199 	mov	dptr,#_EP2CFG
   034A 74 A2              1200 	mov	a,#0xA2
   034C F0                 1201 	movx	@dptr,a
                           1202 ;	reset.c:109: SYNCDELAY();
   034D 00                 1203 	 nop 
   034E 00                 1204 	 nop 
   034F 00                 1205 	 nop 
   0350 00                 1206 	 nop 
                           1207 ;	reset.c:110: EP6CFG = 0xE2; // 11100010
   0351 90 E6 14           1208 	mov	dptr,#_EP6CFG
   0354 74 E2              1209 	mov	a,#0xE2
   0356 F0                 1210 	movx	@dptr,a
                           1211 ;	reset.c:111: SYNCDELAY();
   0357 00                 1212 	 nop 
   0358 00                 1213 	 nop 
   0359 00                 1214 	 nop 
   035A 00                 1215 	 nop 
                           1216 ;	reset.c:112: EP1INCFG &= ~bmVALID;
   035B 90 E6 11           1217 	mov	dptr,#_EP1INCFG
   035E E0                 1218 	movx	a,@dptr
   035F FA                 1219 	mov	r2,a
   0360 54 7F              1220 	anl	a,#0x7F
   0362 F0                 1221 	movx	@dptr,a
                           1222 ;	reset.c:113: SYNCDELAY();
   0363 00                 1223 	 nop 
   0364 00                 1224 	 nop 
   0365 00                 1225 	 nop 
   0366 00                 1226 	 nop 
                           1227 ;	reset.c:114: EP1OUTCFG &= ~bmVALID;
   0367 90 E6 10           1228 	mov	dptr,#_EP1OUTCFG
   036A E0                 1229 	movx	a,@dptr
   036B FA                 1230 	mov	r2,a
   036C 54 7F              1231 	anl	a,#0x7F
   036E F0                 1232 	movx	@dptr,a
                           1233 ;	reset.c:115: SYNCDELAY();
   036F 00                 1234 	 nop 
   0370 00                 1235 	 nop 
   0371 00                 1236 	 nop 
   0372 00                 1237 	 nop 
                           1238 ;	reset.c:116: EP4CFG &= ~bmVALID;
   0373 90 E6 13           1239 	mov	dptr,#_EP4CFG
   0376 E0                 1240 	movx	a,@dptr
   0377 FA                 1241 	mov	r2,a
   0378 54 7F              1242 	anl	a,#0x7F
   037A F0                 1243 	movx	@dptr,a
                           1244 ;	reset.c:117: SYNCDELAY();
   037B 00                 1245 	 nop 
   037C 00                 1246 	 nop 
   037D 00                 1247 	 nop 
   037E 00                 1248 	 nop 
                           1249 ;	reset.c:118: EP8CFG &= ~bmVALID;
   037F 90 E6 15           1250 	mov	dptr,#_EP8CFG
   0382 E0                 1251 	movx	a,@dptr
   0383 FA                 1252 	mov	r2,a
   0384 54 7F              1253 	anl	a,#0x7F
   0386 F0                 1254 	movx	@dptr,a
                           1255 ;	reset.c:119: SYNCDELAY();
   0387 00                 1256 	 nop 
   0388 00                 1257 	 nop 
   0389 00                 1258 	 nop 
   038A 00                 1259 	 nop 
                           1260 ;	reset.c:122: EP2BCL = 0x80; // write once
   038B 90 E6 91           1261 	mov	dptr,#_EP2BCL
   038E 74 80              1262 	mov	a,#0x80
   0390 F0                 1263 	movx	@dptr,a
                           1264 ;	reset.c:123: SYNCDELAY();
   0391 00                 1265 	 nop 
   0392 00                 1266 	 nop 
   0393 00                 1267 	 nop 
   0394 00                 1268 	 nop 
                           1269 ;	reset.c:124: EP2BCL = 0x80; // do it again
   0395 90 E6 91           1270 	mov	dptr,#_EP2BCL
   0398 74 80              1271 	mov	a,#0x80
   039A F0                 1272 	movx	@dptr,a
                           1273 ;	reset.c:126: EA=1; // global interrupt enable
   039B D2 AF              1274 	setb	_EA
                           1275 ;	reset.c:128: OEB |= 0x01; // set PB0 as output
   039D 43 B3 01           1276 	orl	_OEB,#0x01
                           1277 ;	reset.c:129: LED6 = 0;
   03A0 C2 90              1278 	clr	_PB0
                           1279 ;	reset.c:131: eeprom_write_local(LG_PROM, 0, IIC_SIZE, fx2_c0);
   03A2 75 2E 67           1280 	mov	_eeprom_write_local_PARM_4,#_fx2_c0
   03A5 75 2F 3C           1281 	mov	(_eeprom_write_local_PARM_4 + 1),#(_fx2_c0 >> 8)
   03A8 E4                 1282 	clr	a
   03A9 F5 30              1283 	mov	(_eeprom_write_local_PARM_4 + 2),a
   03AB F5 2A              1284 	mov	_eeprom_write_local_PARM_2,a
   03AD F5 2B              1285 	mov	(_eeprom_write_local_PARM_2 + 1),a
   03AF 75 2C 08           1286 	mov	_eeprom_write_local_PARM_3,#0x08
   03B2 E4                 1287 	clr	a
   03B3 F5 2D              1288 	mov	(_eeprom_write_local_PARM_3 + 1),a
   03B5 75 82 51           1289 	mov	dpl,#0x51
   03B8 12 02 29           1290 	lcall	_eeprom_write_local
                           1291 ;	reset.c:133: while(TRUE) {
   03BB                    1292 00111$:
                           1293 ;	reset.c:134: if ( got_sud ) {
   03BB 30 01 1A           1294 	jnb	_got_sud,00102$
                           1295 ;	reset.c:135: printf ( "Handle setupdata\n" );
   03BE 74 DC              1296 	mov	a,#__str_1
   03C0 C0 E0              1297 	push	acc
   03C2 74 17              1298 	mov	a,#(__str_1 >> 8)
   03C4 C0 E0              1299 	push	acc
   03C6 74 80              1300 	mov	a,#0x80
   03C8 C0 E0              1301 	push	acc
   03CA 12 11 13           1302 	lcall	_printf
   03CD 15 81              1303 	dec	sp
   03CF 15 81              1304 	dec	sp
   03D1 15 81              1305 	dec	sp
                           1306 ;	reset.c:136: handle_setupdata();
   03D3 12 0B 92           1307 	lcall	_handle_setupdata
                           1308 ;	reset.c:137: got_sud=FALSE;
   03D6 C2 01              1309 	clr	_got_sud
   03D8                    1310 00102$:
                           1311 ;	reset.c:139: if ( !(EP2468STAT & bmEP2EMPTY) ) { // EP2 received data
   03D8 E5 AA              1312 	mov	a,_EP2468STAT
   03DA 20 E0 52           1313 	jb	acc.0,00106$
                           1314 ;	reset.c:140: if  ( !(EP2468STAT & bmEP6FULL) ) { // wait for at least one 
   03DD E5 AA              1315 	mov	a,_EP2468STAT
   03DF 20 E5 4D           1316 	jb	acc.5,00106$
                           1317 ;	reset.c:143: bytes = MAKEWORD(EP2BCH,EP2BCL);
   03E2 90 E6 90           1318 	mov	dptr,#_EP2BCH
   03E5 E0                 1319 	movx	a,@dptr
   03E6 FB                 1320 	mov	r3,a
   03E7 7A 00              1321 	mov	r2,#0x00
   03E9 90 E6 91           1322 	mov	dptr,#_EP2BCL
   03EC E0                 1323 	movx	a,@dptr
   03ED FC                 1324 	mov	r4,a
   03EE 7D 00              1325 	mov	r5,#0x00
   03F0 4A                 1326 	orl	a,r2
   03F1 F5 23              1327 	mov	_bytes,a
   03F3 ED                 1328 	mov	a,r5
   03F4 4B                 1329 	orl	a,r3
   03F5 F5 24              1330 	mov	(_bytes + 1),a
                           1331 ;	reset.c:144: for (i=0;i<bytes;++i) {
   03F7 7A 00              1332 	mov	r2,#0x00
   03F9 7B 00              1333 	mov	r3,#0x00
   03FB                    1334 00113$:
   03FB C3                 1335 	clr	c
   03FC EA                 1336 	mov	a,r2
   03FD 95 23              1337 	subb	a,_bytes
   03FF EB                 1338 	mov	a,r3
   0400 95 24              1339 	subb	a,(_bytes + 1)
   0402 50 2B              1340 	jnc	00106$
                           1341 ;	reset.c:145: EP6FIFOBUF[i] = 0x00;
   0404 8A 82              1342 	mov	dpl,r2
   0406 74 F8              1343 	mov	a,#(_EP6FIFOBUF >> 8)
   0408 2B                 1344 	add	a,r3
   0409 F5 83              1345 	mov	dph,a
   040B E4                 1346 	clr	a
   040C F0                 1347 	movx	@dptr,a
                           1348 ;	reset.c:147: EP6BCH=MSB(bytes);
   040D 90 E6 98           1349 	mov	dptr,#_EP6BCH
   0410 E5 24              1350 	mov	a,(_bytes + 1)
   0412 F0                 1351 	movx	@dptr,a
                           1352 ;	reset.c:148: SYNCDELAY();
   0413 00                 1353 	 nop 
   0414 00                 1354 	 nop 
   0415 00                 1355 	 nop 
   0416 00                 1356 	 nop 
                           1357 ;	reset.c:149: EP6BCL=LSB(bytes);
   0417 AC 23              1358 	mov	r4,_bytes
   0419 E5 24              1359 	mov	a,(_bytes + 1)
   041B 7D 00              1360 	mov	r5,#0x00
   041D 90 E6 99           1361 	mov	dptr,#_EP6BCL
   0420 EC                 1362 	mov	a,r4
   0421 F0                 1363 	movx	@dptr,a
                           1364 ;	reset.c:150: REARM(); // re-arm ep2
   0422 90 E6 91           1365 	mov	dptr,#_EP2BCL
   0425 74 80              1366 	mov	a,#0x80
   0427 F0                 1367 	movx	@dptr,a
                           1368 ;	reset.c:144: for (i=0;i<bytes;++i) {
   0428 0A                 1369 	inc	r2
   0429 BA 00 CF           1370 	cjne	r2,#0x00,00113$
   042C 0B                 1371 	inc	r3
   042D 80 CC              1372 	sjmp	00113$
   042F                    1373 00106$:
                           1374 ;	reset.c:156: if (LED6) {LED6 = 0;} else {LED6 =1;}
   042F 10 90 02           1375 	jbc	_PB0,00132$
   0432 80 02              1376 	sjmp	00108$
   0434                    1377 00132$:
   0434 80 85              1378 	sjmp	00111$
   0436                    1379 00108$:
   0436 D2 90              1380 	setb	_PB0
   0438 02 03 BB           1381 	ljmp	00111$
                           1382 ;------------------------------------------------------------
                           1383 ;Allocation info for local variables in function 'handle_vendorcommand'
                           1384 ;------------------------------------------------------------
                           1385 ;cmd                       Allocated to registers r2 
                           1386 ;addr                      Allocated to registers r3 r4 
                           1387 ;len                       Allocated to registers r5 r6 
                           1388 ;pep                       Allocated to registers r7 r0 
                           1389 ;cur_read                  Allocated to registers r7 
                           1390 ;cur_write                 Allocated to registers r7 
                           1391 ;------------------------------------------------------------
                           1392 ;	reset.c:165: BOOL handle_vendorcommand(BYTE cmd)  
                           1393 ;	-----------------------------------------
                           1394 ;	 function handle_vendorcommand
                           1395 ;	-----------------------------------------
   043B                    1396 _handle_vendorcommand:
   043B AA 82              1397 	mov	r2,dpl
                           1398 ;	reset.c:167: WORD addr=SETUP_VALUE(),len=SETUP_LENGTH();
   043D 90 E6 BB           1399 	mov	dptr,#(_SETUPDAT + 0x0003)
   0440 E0                 1400 	movx	a,@dptr
   0441 FC                 1401 	mov	r4,a
   0442 7B 00              1402 	mov	r3,#0x00
   0444 90 E6 BA           1403 	mov	dptr,#(_SETUPDAT + 0x0002)
   0447 E0                 1404 	movx	a,@dptr
   0448 7E 00              1405 	mov	r6,#0x00
   044A 42 03              1406 	orl	ar3,a
   044C EE                 1407 	mov	a,r6
   044D 42 04              1408 	orl	ar4,a
   044F 90 E6 BF           1409 	mov	dptr,#(_SETUPDAT + 0x0007)
   0452 E0                 1410 	movx	a,@dptr
   0453 FE                 1411 	mov	r6,a
   0454 7D 00              1412 	mov	r5,#0x00
   0456 90 E6 BE           1413 	mov	dptr,#(_SETUPDAT + 0x0006)
   0459 E0                 1414 	movx	a,@dptr
   045A FF                 1415 	mov	r7,a
   045B 78 00              1416 	mov	r0,#0x00
   045D 42 05              1417 	orl	ar5,a
   045F E8                 1418 	mov	a,r0
   0460 42 06              1419 	orl	ar6,a
                           1420 ;	reset.c:169: switch ( cmd ) {
   0462 BA B0 02           1421 	cjne	r2,#0xB0,00143$
   0465 80 08              1422 	sjmp	00101$
   0467                    1423 00143$:
   0467 BA B1 02           1424 	cjne	r2,#0xB1,00144$
   046A 80 2F              1425 	sjmp	00104$
   046C                    1426 00144$:
   046C 02 05 90           1427 	ljmp	00123$
                           1428 ;	reset.c:171: case VC_EPSTAT:
   046F                    1429 00101$:
                           1430 ;	reset.c:173: xdata BYTE* pep= ep_addr(SETUPDAT[2]);
   046F 90 E6 BA           1431 	mov	dptr,#(_SETUPDAT + 0x0002)
   0472 E0                 1432 	movx	a,@dptr
   0473 F5 82              1433 	mov	dpl,a
   0475 12 0C AF           1434 	lcall	_ep_addr
   0478 AF 82              1435 	mov	r7,dpl
   047A A8 83              1436 	mov	r0,dph
                           1437 ;	reset.c:174: if (pep) {
   047C EF                 1438 	mov	a,r7
   047D 48                 1439 	orl	a,r0
   047E 70 03              1440 	jnz	00145$
   0480 02 05 AF           1441 	ljmp	00124$
   0483                    1442 00145$:
                           1443 ;	reset.c:175: EP0BUF[0] = *pep;
   0483 8F 82              1444 	mov	dpl,r7
   0485 88 83              1445 	mov	dph,r0
   0487 E0                 1446 	movx	a,@dptr
   0488 90 E7 40           1447 	mov	dptr,#_EP0BUF
   048B F0                 1448 	movx	@dptr,a
                           1449 ;	reset.c:176: EP0BCH=0;
   048C 90 E6 8A           1450 	mov	dptr,#_EP0BCH
   048F E4                 1451 	clr	a
   0490 F0                 1452 	movx	@dptr,a
                           1453 ;	reset.c:177: EP0BCL=1;
   0491 90 E6 8B           1454 	mov	dptr,#_EP0BCL
   0494 74 01              1455 	mov	a,#0x01
   0496 F0                 1456 	movx	@dptr,a
                           1457 ;	reset.c:178: return TRUE;
   0497 75 82 01           1458 	mov	dpl,#0x01
   049A 22                 1459 	ret
                           1460 ;	reset.c:182: case VC_EEPROM:
   049B                    1461 00104$:
                           1462 ;	reset.c:185: switch (SETUP_TYPE) {
   049B 90 E6 B8           1463 	mov	dptr,#_SETUPDAT
   049E E0                 1464 	movx	a,@dptr
   049F FF                 1465 	mov	r7,a
   04A0 BF 40 02           1466 	cjne	r7,#0x40,00146$
   04A3 80 74              1467 	sjmp	00118$
   04A5                    1468 00146$:
   04A5 BF C0 02           1469 	cjne	r7,#0xC0,00147$
   04A8 80 03              1470 	sjmp	00148$
   04AA                    1471 00147$:
   04AA 02 05 73           1472 	ljmp	00121$
   04AD                    1473 00148$:
                           1474 ;	reset.c:187: while (len) { // still have bytes to read
   04AD                    1475 00109$:
   04AD ED                 1476 	mov	a,r5
   04AE 4E                 1477 	orl	a,r6
   04AF 70 03              1478 	jnz	00149$
   04B1 02 05 77           1479 	ljmp	00122$
   04B4                    1480 00149$:
                           1481 ;	reset.c:189: BYTE cur_read = len > 64 ? 64 : len; 
   04B4 C3                 1482 	clr	c
   04B5 74 40              1483 	mov	a,#0x40
   04B7 9D                 1484 	subb	a,r5
   04B8 E4                 1485 	clr	a
   04B9 9E                 1486 	subb	a,r6
   04BA 50 06              1487 	jnc	00127$
   04BC 7F 40              1488 	mov	r7,#0x40
   04BE 78 00              1489 	mov	r0,#0x00
   04C0 80 04              1490 	sjmp	00128$
   04C2                    1491 00127$:
   04C2 8D 07              1492 	mov	ar7,r5
   04C4 8E 00              1493 	mov	ar0,r6
   04C6                    1494 00128$:
                           1495 ;	reset.c:190: while (EP0CS&bmEPBUSY); // can't do this until EP0 is ready
   04C6                    1496 00106$:
   04C6 90 E6 A0           1497 	mov	dptr,#_EP0CS
   04C9 E0                 1498 	movx	a,@dptr
   04CA F8                 1499 	mov	r0,a
   04CB 20 E1 F8           1500 	jb	acc.1,00106$
                           1501 ;	reset.c:191: eeprom_read(0x51, addr, cur_read, EP0BUF );
   04CE 8F 5D              1502 	mov	_eeprom_read_PARM_3,r7
   04D0 75 5E 00           1503 	mov	(_eeprom_read_PARM_3 + 1),#0x00
   04D3 75 5F 40           1504 	mov	_eeprom_read_PARM_4,#_EP0BUF
   04D6 75 60 E7           1505 	mov	(_eeprom_read_PARM_4 + 1),#(_EP0BUF >> 8)
   04D9 75 61 00           1506 	mov	(_eeprom_read_PARM_4 + 2),#0x00
   04DC 8B 5B              1507 	mov	_eeprom_read_PARM_2,r3
   04DE 8C 5C              1508 	mov	(_eeprom_read_PARM_2 + 1),r4
   04E0 75 82 51           1509 	mov	dpl,#0x51
   04E3 C0 03              1510 	push	ar3
   04E5 C0 04              1511 	push	ar4
   04E7 C0 05              1512 	push	ar5
   04E9 C0 06              1513 	push	ar6
   04EB C0 07              1514 	push	ar7
   04ED 12 0B 29           1515 	lcall	_eeprom_read
   04F0 D0 07              1516 	pop	ar7
   04F2 D0 06              1517 	pop	ar6
   04F4 D0 05              1518 	pop	ar5
   04F6 D0 04              1519 	pop	ar4
   04F8 D0 03              1520 	pop	ar3
                           1521 ;	reset.c:192: EP0BCH=0;
   04FA 90 E6 8A           1522 	mov	dptr,#_EP0BCH
   04FD E4                 1523 	clr	a
   04FE F0                 1524 	movx	@dptr,a
                           1525 ;	reset.c:193: SYNCDELAY();
   04FF 00                 1526 	 nop 
   0500 00                 1527 	 nop 
   0501 00                 1528 	 nop 
   0502 00                 1529 	 nop 
                           1530 ;	reset.c:194: EP0BCL=cur_read;
   0503 90 E6 8B           1531 	mov	dptr,#_EP0BCL
   0506 EF                 1532 	mov	a,r7
   0507 F0                 1533 	movx	@dptr,a
                           1534 ;	reset.c:195: len -= cur_read;
   0508 78 00              1535 	mov	r0,#0x00
   050A ED                 1536 	mov	a,r5
   050B C3                 1537 	clr	c
   050C 9F                 1538 	subb	a,r7
   050D FD                 1539 	mov	r5,a
   050E EE                 1540 	mov	a,r6
   050F 98                 1541 	subb	a,r0
   0510 FE                 1542 	mov	r6,a
                           1543 ;	reset.c:196: addr += cur_read;
   0511 EF                 1544 	mov	a,r7
   0512 2B                 1545 	add	a,r3
   0513 FB                 1546 	mov	r3,a
   0514 E8                 1547 	mov	a,r0
   0515 3C                 1548 	addc	a,r4
   0516 FC                 1549 	mov	r4,a
                           1550 ;	reset.c:200: while (len) {
   0517 80 94              1551 	sjmp	00109$
   0519                    1552 00118$:
   0519 ED                 1553 	mov	a,r5
   051A 4E                 1554 	orl	a,r6
   051B 60 5A              1555 	jz	00122$
                           1556 ;	reset.c:202: EP0BCL = 0; // allow pc transfer in
   051D 90 E6 8B           1557 	mov	dptr,#_EP0BCL
   0520 E4                 1558 	clr	a
   0521 F0                 1559 	movx	@dptr,a
                           1560 ;	reset.c:203: while(EP0CS & bmEPBUSY); // wait
   0522                    1561 00113$:
   0522 90 E6 A0           1562 	mov	dptr,#_EP0CS
   0525 E0                 1563 	movx	a,@dptr
   0526 FF                 1564 	mov	r7,a
   0527 20 E1 F8           1565 	jb	acc.1,00113$
                           1566 ;	reset.c:204: cur_write=EP0BCL;
   052A 90 E6 8B           1567 	mov	dptr,#_EP0BCL
   052D E0                 1568 	movx	a,@dptr
   052E FF                 1569 	mov	r7,a
                           1570 ;	reset.c:205: if ( !eeprom_write(0x51, addr, cur_write, EP0BUF ) ) return FALSE;
   052F 8F 50              1571 	mov	_eeprom_write_PARM_3,r7
   0531 75 51 00           1572 	mov	(_eeprom_write_PARM_3 + 1),#0x00
   0534 75 52 40           1573 	mov	_eeprom_write_PARM_4,#_EP0BUF
   0537 75 53 E7           1574 	mov	(_eeprom_write_PARM_4 + 1),#(_EP0BUF >> 8)
   053A 75 54 00           1575 	mov	(_eeprom_write_PARM_4 + 2),#0x00
   053D 8B 4E              1576 	mov	_eeprom_write_PARM_2,r3
   053F 8C 4F              1577 	mov	(_eeprom_write_PARM_2 + 1),r4
   0541 75 82 51           1578 	mov	dpl,#0x51
   0544 C0 03              1579 	push	ar3
   0546 C0 04              1580 	push	ar4
   0548 C0 05              1581 	push	ar5
   054A C0 06              1582 	push	ar6
   054C C0 07              1583 	push	ar7
   054E 12 0A 93           1584 	lcall	_eeprom_write
   0551 E5 82              1585 	mov	a,dpl
   0553 D0 07              1586 	pop	ar7
   0555 D0 06              1587 	pop	ar6
   0557 D0 05              1588 	pop	ar5
   0559 D0 04              1589 	pop	ar4
   055B D0 03              1590 	pop	ar3
   055D 70 03              1591 	jnz	00117$
   055F F5 82              1592 	mov	dpl,a
   0561 22                 1593 	ret
   0562                    1594 00117$:
                           1595 ;	reset.c:206: addr += cur_write;
   0562 78 00              1596 	mov	r0,#0x00
   0564 EF                 1597 	mov	a,r7
   0565 2B                 1598 	add	a,r3
   0566 FB                 1599 	mov	r3,a
   0567 E8                 1600 	mov	a,r0
   0568 3C                 1601 	addc	a,r4
   0569 FC                 1602 	mov	r4,a
                           1603 ;	reset.c:207: len -= cur_write;
   056A ED                 1604 	mov	a,r5
   056B C3                 1605 	clr	c
   056C 9F                 1606 	subb	a,r7
   056D FD                 1607 	mov	r5,a
   056E EE                 1608 	mov	a,r6
   056F 98                 1609 	subb	a,r0
   0570 FE                 1610 	mov	r6,a
                           1611 ;	reset.c:210: default:
   0571 80 A6              1612 	sjmp	00118$
   0573                    1613 00121$:
                           1614 ;	reset.c:211: return FALSE; // bad type
   0573 75 82 00           1615 	mov	dpl,#0x00
                           1616 ;	reset.c:212: }
   0576 22                 1617 	ret
   0577                    1618 00122$:
                           1619 ;	reset.c:213: printf ( "All OK\n" );
   0577 74 EE              1620 	mov	a,#__str_2
   0579 C0 E0              1621 	push	acc
   057B 74 17              1622 	mov	a,#(__str_2 >> 8)
   057D C0 E0              1623 	push	acc
   057F 74 80              1624 	mov	a,#0x80
   0581 C0 E0              1625 	push	acc
   0583 12 11 13           1626 	lcall	_printf
   0586 15 81              1627 	dec	sp
   0588 15 81              1628 	dec	sp
   058A 15 81              1629 	dec	sp
                           1630 ;	reset.c:214: return TRUE;
   058C 75 82 01           1631 	mov	dpl,#0x01
                           1632 ;	reset.c:217: default:
   058F 22                 1633 	ret
   0590                    1634 00123$:
                           1635 ;	reset.c:219: printf ( "Need to implement vendor command: %02x\n", cmd );
   0590 7B 00              1636 	mov	r3,#0x00
   0592 C0 02              1637 	push	ar2
   0594 C0 03              1638 	push	ar3
   0596 74 F6              1639 	mov	a,#__str_3
   0598 C0 E0              1640 	push	acc
   059A 74 17              1641 	mov	a,#(__str_3 >> 8)
   059C C0 E0              1642 	push	acc
   059E 74 80              1643 	mov	a,#0x80
   05A0 C0 E0              1644 	push	acc
   05A2 12 11 13           1645 	lcall	_printf
   05A5 E5 81              1646 	mov	a,sp
   05A7 24 FB              1647 	add	a,#0xfb
   05A9 F5 81              1648 	mov	sp,a
                           1649 ;	reset.c:220: return FALSE;
   05AB 75 82 00           1650 	mov	dpl,#0x00
                           1651 ;	reset.c:222: }
                           1652 ;	reset.c:223: return FALSE;
   05AE 22                 1653 	ret
   05AF                    1654 00124$:
   05AF 75 82 00           1655 	mov	dpl,#0x00
   05B2 22                 1656 	ret
                           1657 ;------------------------------------------------------------
                           1658 ;Allocation info for local variables in function 'handle_get_interface'
                           1659 ;------------------------------------------------------------
                           1660 ;alt_ifc                   Allocated with name '_handle_get_interface_PARM_2'
                           1661 ;ifc                       Allocated to registers r2 
                           1662 ;------------------------------------------------------------
                           1663 ;	reset.c:228: BOOL handle_get_interface(BYTE ifc, BYTE* alt_ifc) {
                           1664 ;	-----------------------------------------
                           1665 ;	 function handle_get_interface
                           1666 ;	-----------------------------------------
   05B3                    1667 _handle_get_interface:
   05B3 AA 82              1668 	mov	r2,dpl
                           1669 ;	reset.c:229: printf ( "Get Interface\n" );
   05B5 C0 02              1670 	push	ar2
   05B7 74 1E              1671 	mov	a,#__str_4
   05B9 C0 E0              1672 	push	acc
   05BB 74 18              1673 	mov	a,#(__str_4 >> 8)
   05BD C0 E0              1674 	push	acc
   05BF 74 80              1675 	mov	a,#0x80
   05C1 C0 E0              1676 	push	acc
   05C3 12 11 13           1677 	lcall	_printf
   05C6 15 81              1678 	dec	sp
   05C8 15 81              1679 	dec	sp
   05CA 15 81              1680 	dec	sp
   05CC D0 02              1681 	pop	ar2
                           1682 ;	reset.c:230: if (ifc==0) {*alt_ifc=0; return TRUE;} else { return FALSE;}
   05CE EA                 1683 	mov	a,r2
   05CF 70 14              1684 	jnz	00102$
   05D1 AA 36              1685 	mov	r2,_handle_get_interface_PARM_2
   05D3 AB 37              1686 	mov	r3,(_handle_get_interface_PARM_2 + 1)
   05D5 AC 38              1687 	mov	r4,(_handle_get_interface_PARM_2 + 2)
   05D7 8A 82              1688 	mov	dpl,r2
   05D9 8B 83              1689 	mov	dph,r3
   05DB 8C F0              1690 	mov	b,r4
   05DD E4                 1691 	clr	a
   05DE 12 0F 67           1692 	lcall	__gptrput
   05E1 75 82 01           1693 	mov	dpl,#0x01
   05E4 22                 1694 	ret
   05E5                    1695 00102$:
   05E5 75 82 00           1696 	mov	dpl,#0x00
   05E8 22                 1697 	ret
                           1698 ;------------------------------------------------------------
                           1699 ;Allocation info for local variables in function 'handle_set_interface'
                           1700 ;------------------------------------------------------------
                           1701 ;alt_ifc                   Allocated with name '_handle_set_interface_PARM_2'
                           1702 ;ifc                       Allocated to registers r2 
                           1703 ;------------------------------------------------------------
                           1704 ;	reset.c:232: BOOL handle_set_interface(BYTE ifc, BYTE alt_ifc) {
                           1705 ;	-----------------------------------------
                           1706 ;	 function handle_set_interface
                           1707 ;	-----------------------------------------
   05E9                    1708 _handle_set_interface:
   05E9 AA 82              1709 	mov	r2,dpl
                           1710 ;	reset.c:233: printf ( "Set interface %d to alt: %d\n" , ifc, alt_ifc );
   05EB AB 39              1711 	mov	r3,_handle_set_interface_PARM_2
   05ED 7C 00              1712 	mov	r4,#0x00
   05EF 8A 05              1713 	mov	ar5,r2
   05F1 7E 00              1714 	mov	r6,#0x00
   05F3 C0 02              1715 	push	ar2
   05F5 C0 03              1716 	push	ar3
   05F7 C0 04              1717 	push	ar4
   05F9 C0 05              1718 	push	ar5
   05FB C0 06              1719 	push	ar6
   05FD 74 2D              1720 	mov	a,#__str_5
   05FF C0 E0              1721 	push	acc
   0601 74 18              1722 	mov	a,#(__str_5 >> 8)
   0603 C0 E0              1723 	push	acc
   0605 74 80              1724 	mov	a,#0x80
   0607 C0 E0              1725 	push	acc
   0609 12 11 13           1726 	lcall	_printf
   060C E5 81              1727 	mov	a,sp
   060E 24 F9              1728 	add	a,#0xf9
   0610 F5 81              1729 	mov	sp,a
   0612 D0 02              1730 	pop	ar2
                           1731 ;	reset.c:235: if (ifc==0&&alt_ifc==0) {
   0614 EA                 1732 	mov	a,r2
   0615 60 03              1733 	jz	00109$
   0617 02 06 8E           1734 	ljmp	00102$
   061A                    1735 00109$:
   061A E5 39              1736 	mov	a,_handle_set_interface_PARM_2
   061C 70 70              1737 	jnz	00102$
                           1738 ;	reset.c:238: RESETTOGGLE(0x02);
   061E 90 E6 83           1739 	mov	dptr,#_TOGCTL
   0621 74 02              1740 	mov	a,#0x02
   0623 F0                 1741 	movx	@dptr,a
   0624 E0                 1742 	movx	a,@dptr
   0625 FA                 1743 	mov	r2,a
   0626 90 E6 83           1744 	mov	dptr,#_TOGCTL
   0629 74 20              1745 	mov	a,#0x20
   062B 4A                 1746 	orl	a,r2
   062C F0                 1747 	movx	@dptr,a
                           1748 ;	reset.c:239: RESETTOGGLE(0x86);
   062D 90 E6 83           1749 	mov	dptr,#_TOGCTL
   0630 74 16              1750 	mov	a,#0x16
   0632 F0                 1751 	movx	@dptr,a
   0633 E0                 1752 	movx	a,@dptr
   0634 FA                 1753 	mov	r2,a
   0635 90 E6 83           1754 	mov	dptr,#_TOGCTL
   0638 74 20              1755 	mov	a,#0x20
   063A 4A                 1756 	orl	a,r2
   063B F0                 1757 	movx	@dptr,a
                           1758 ;	reset.c:241: RESETFIFO(0x02);
   063C 90 E6 04           1759 	mov	dptr,#_FIFORESET
   063F 74 80              1760 	mov	a,#0x80
   0641 F0                 1761 	movx	@dptr,a
   0642 00                 1762 	 nop 
   0643 00                 1763 	 nop 
   0644 00                 1764 	 nop 
   0645 00                 1765 	 nop 
   0646 90 E6 04           1766 	mov	dptr,#_FIFORESET
   0649 74 02              1767 	mov	a,#0x02
   064B F0                 1768 	movx	@dptr,a
   064C 00                 1769 	 nop 
   064D 00                 1770 	 nop 
   064E 00                 1771 	 nop 
   064F 00                 1772 	 nop 
   0650 90 E6 04           1773 	mov	dptr,#_FIFORESET
   0653 E4                 1774 	clr	a
   0654 F0                 1775 	movx	@dptr,a
   0655 00                 1776 	 nop 
   0656 00                 1777 	 nop 
   0657 00                 1778 	 nop 
   0658 00                 1779 	 nop 
                           1780 ;	reset.c:242: EP2BCL=0x80;
   0659 90 E6 91           1781 	mov	dptr,#_EP2BCL
   065C 74 80              1782 	mov	a,#0x80
   065E F0                 1783 	movx	@dptr,a
                           1784 ;	reset.c:243: SYNCDELAY();
   065F 00                 1785 	 nop 
   0660 00                 1786 	 nop 
   0661 00                 1787 	 nop 
   0662 00                 1788 	 nop 
                           1789 ;	reset.c:244: EP2BCL=0X80;
   0663 90 E6 91           1790 	mov	dptr,#_EP2BCL
   0666 74 80              1791 	mov	a,#0x80
   0668 F0                 1792 	movx	@dptr,a
                           1793 ;	reset.c:245: SYNCDELAY();
   0669 00                 1794 	 nop 
   066A 00                 1795 	 nop 
   066B 00                 1796 	 nop 
   066C 00                 1797 	 nop 
                           1798 ;	reset.c:246: RESETFIFO(0x86);
   066D 90 E6 04           1799 	mov	dptr,#_FIFORESET
   0670 74 80              1800 	mov	a,#0x80
   0672 F0                 1801 	movx	@dptr,a
   0673 00                 1802 	 nop 
   0674 00                 1803 	 nop 
   0675 00                 1804 	 nop 
   0676 00                 1805 	 nop 
   0677 90 E6 04           1806 	mov	dptr,#_FIFORESET
   067A 74 86              1807 	mov	a,#0x86
   067C F0                 1808 	movx	@dptr,a
   067D 00                 1809 	 nop 
   067E 00                 1810 	 nop 
   067F 00                 1811 	 nop 
   0680 00                 1812 	 nop 
   0681 90 E6 04           1813 	mov	dptr,#_FIFORESET
   0684 E4                 1814 	clr	a
   0685 F0                 1815 	movx	@dptr,a
   0686 00                 1816 	 nop 
   0687 00                 1817 	 nop 
   0688 00                 1818 	 nop 
   0689 00                 1819 	 nop 
                           1820 ;	reset.c:247: return TRUE;
   068A 75 82 01           1821 	mov	dpl,#0x01
                           1822 ;	reset.c:249: return FALSE;
   068D 22                 1823 	ret
   068E                    1824 00102$:
   068E 75 82 00           1825 	mov	dpl,#0x00
   0691 22                 1826 	ret
                           1827 ;------------------------------------------------------------
                           1828 ;Allocation info for local variables in function 'handle_get_configuration'
                           1829 ;------------------------------------------------------------
                           1830 ;------------------------------------------------------------
                           1831 ;	reset.c:253: BYTE handle_get_configuration() {
                           1832 ;	-----------------------------------------
                           1833 ;	 function handle_get_configuration
                           1834 ;	-----------------------------------------
   0692                    1835 _handle_get_configuration:
                           1836 ;	reset.c:254: return 1;
   0692 75 82 01           1837 	mov	dpl,#0x01
   0695 22                 1838 	ret
                           1839 ;------------------------------------------------------------
                           1840 ;Allocation info for local variables in function 'handle_set_configuration'
                           1841 ;------------------------------------------------------------
                           1842 ;cfg                       Allocated to registers r2 
                           1843 ;------------------------------------------------------------
                           1844 ;	reset.c:256: BOOL handle_set_configuration(BYTE cfg) {
                           1845 ;	-----------------------------------------
                           1846 ;	 function handle_set_configuration
                           1847 ;	-----------------------------------------
   0696                    1848 _handle_set_configuration:
   0696 AA 82              1849 	mov	r2,dpl
                           1850 ;	reset.c:257: return cfg==1 ? TRUE : FALSE; // we only handle cfg 1
   0698 BA 01 04           1851 	cjne	r2,#0x01,00103$
   069B 7A 01              1852 	mov	r2,#0x01
   069D 80 02              1853 	sjmp	00104$
   069F                    1854 00103$:
   069F 7A 00              1855 	mov	r2,#0x00
   06A1                    1856 00104$:
   06A1 8A 82              1857 	mov	dpl,r2
   06A3 22                 1858 	ret
                           1859 ;------------------------------------------------------------
                           1860 ;Allocation info for local variables in function 'sudav_isr'
                           1861 ;------------------------------------------------------------
                           1862 ;------------------------------------------------------------
                           1863 ;	reset.c:262: void sudav_isr() interrupt SUDAV_ISR {
                           1864 ;	-----------------------------------------
                           1865 ;	 function sudav_isr
                           1866 ;	-----------------------------------------
   06A4                    1867 _sudav_isr:
   06A4 C0 E0              1868 	push	acc
   06A6 C0 82              1869 	push	dpl
   06A8 C0 83              1870 	push	dph
                           1871 ;	reset.c:263: got_sud=TRUE;
   06AA D2 01              1872 	setb	_got_sud
                           1873 ;	reset.c:264: CLEAR_SUDAV();
   06AC 53 91 EF           1874 	anl	_EXIF,#0xEF
   06AF 90 E6 5D           1875 	mov	dptr,#_USBIRQ
   06B2 74 01              1876 	mov	a,#0x01
   06B4 F0                 1877 	movx	@dptr,a
   06B5 D0 83              1878 	pop	dph
   06B7 D0 82              1879 	pop	dpl
   06B9 D0 E0              1880 	pop	acc
   06BB 32                 1881 	reti
                           1882 ;	eliminated unneeded push/pop psw
                           1883 ;	eliminated unneeded push/pop b
                           1884 ;------------------------------------------------------------
                           1885 ;Allocation info for local variables in function 'sof_isr'
                           1886 ;------------------------------------------------------------
                           1887 ;------------------------------------------------------------
                           1888 ;	reset.c:269: void sof_isr () interrupt SOF_ISR using 1 {
                           1889 ;	-----------------------------------------
                           1890 ;	 function sof_isr
                           1891 ;	-----------------------------------------
   06BC                    1892 _sof_isr:
                    000A   1893 	ar2 = 0x0a
                    000B   1894 	ar3 = 0x0b
                    000C   1895 	ar4 = 0x0c
                    000D   1896 	ar5 = 0x0d
                    000E   1897 	ar6 = 0x0e
                    000F   1898 	ar7 = 0x0f
                    0008   1899 	ar0 = 0x08
                    0009   1900 	ar1 = 0x09
   06BC C0 E0              1901 	push	acc
   06BE C0 82              1902 	push	dpl
   06C0 C0 83              1903 	push	dph
   06C2 C0 D0              1904 	push	psw
   06C4 75 D0 08           1905 	mov	psw,#0x08
                           1906 ;	reset.c:270: ++sofct;
   06C7 90 3C 65           1907 	mov	dptr,#_sofct
   06CA E0                 1908 	movx	a,@dptr
   06CB 24 01              1909 	add	a,#0x01
   06CD F0                 1910 	movx	@dptr,a
   06CE A3                 1911 	inc	dptr
   06CF E0                 1912 	movx	a,@dptr
   06D0 34 00              1913 	addc	a,#0x00
   06D2 F0                 1914 	movx	@dptr,a
                           1915 ;	reset.c:271: if(sofct==8000) { // about 8000 sof interrupts per second at high speed
   06D3 90 3C 65           1916 	mov	dptr,#_sofct
   06D6 E0                 1917 	movx	a,@dptr
   06D7 FA                 1918 	mov	r2,a
   06D8 A3                 1919 	inc	dptr
   06D9 E0                 1920 	movx	a,@dptr
   06DA FB                 1921 	mov	r3,a
   06DB BA 40 19           1922 	cjne	r2,#0x40,00105$
   06DE BB 1F 16           1923 	cjne	r3,#0x1F,00105$
                           1924 ;	reset.c:272: on5=!on5;
   06E1 B2 03              1925 	cpl	_on5
                           1926 ;	reset.c:273: if (on5) {d5on();} else {d5off();}
   06E3 30 03 06           1927 	jnb	_on5,00102$
   06E6 75 92 B8           1928 	 mov __XPAGE, #0xB8 
   06E9 E2                 1929 	 movx a, @r0 
   06EA 80 04              1930 	sjmp	00103$
   06EC                    1931 00102$:
   06EC 75 92 B0           1932 	 mov __XPAGE, #0xB0 
   06EF E2                 1933 	 movx a, @r0 
   06F0                    1934 00103$:
                           1935 ;	reset.c:274: sofct=0;
   06F0 90 3C 65           1936 	mov	dptr,#_sofct
   06F3 E4                 1937 	clr	a
   06F4 F0                 1938 	movx	@dptr,a
   06F5 A3                 1939 	inc	dptr
   06F6 F0                 1940 	movx	@dptr,a
   06F7                    1941 00105$:
                           1942 ;	reset.c:276: CLEAR_SOF();
   06F7 53 91 EF           1943 	anl	_EXIF,#0xEF
   06FA 90 E6 5D           1944 	mov	dptr,#_USBIRQ
   06FD 74 02              1945 	mov	a,#0x02
   06FF F0                 1946 	movx	@dptr,a
   0700 D0 D0              1947 	pop	psw
   0702 D0 83              1948 	pop	dph
   0704 D0 82              1949 	pop	dpl
   0706 D0 E0              1950 	pop	acc
   0708 32                 1951 	reti
                           1952 ;	eliminated unneeded push/pop b
                           1953 ;------------------------------------------------------------
                           1954 ;Allocation info for local variables in function 'usbreset_isr'
                           1955 ;------------------------------------------------------------
                           1956 ;------------------------------------------------------------
                           1957 ;	reset.c:279: void usbreset_isr() interrupt USBRESET_ISR {
                           1958 ;	-----------------------------------------
                           1959 ;	 function usbreset_isr
                           1960 ;	-----------------------------------------
   0709                    1961 _usbreset_isr:
                    0002   1962 	ar2 = 0x02
                    0003   1963 	ar3 = 0x03
                    0004   1964 	ar4 = 0x04
                    0005   1965 	ar5 = 0x05
                    0006   1966 	ar6 = 0x06
                    0007   1967 	ar7 = 0x07
                    0000   1968 	ar0 = 0x00
                    0001   1969 	ar1 = 0x01
   0709 C0 22              1970 	push	bits
   070B C0 E0              1971 	push	acc
   070D C0 F0              1972 	push	b
   070F C0 82              1973 	push	dpl
   0711 C0 83              1974 	push	dph
   0713 C0 02              1975 	push	(0+2)
   0715 C0 03              1976 	push	(0+3)
   0717 C0 04              1977 	push	(0+4)
   0719 C0 05              1978 	push	(0+5)
   071B C0 06              1979 	push	(0+6)
   071D C0 07              1980 	push	(0+7)
   071F C0 00              1981 	push	(0+0)
   0721 C0 01              1982 	push	(0+1)
   0723 C0 D0              1983 	push	psw
   0725 75 D0 00           1984 	mov	psw,#0x00
                           1985 ;	reset.c:280: handle_hispeed(FALSE);
   0728 75 82 00           1986 	mov	dpl,#0x00
   072B 12 0E 68           1987 	lcall	_handle_hispeed
                           1988 ;	reset.c:281: CLEAR_USBRESET();
   072E 53 91 EF           1989 	anl	_EXIF,#0xEF
   0731 90 E6 5D           1990 	mov	dptr,#_USBIRQ
   0734 74 10              1991 	mov	a,#0x10
   0736 F0                 1992 	movx	@dptr,a
   0737 D0 D0              1993 	pop	psw
   0739 D0 01              1994 	pop	(0+1)
   073B D0 00              1995 	pop	(0+0)
   073D D0 07              1996 	pop	(0+7)
   073F D0 06              1997 	pop	(0+6)
   0741 D0 05              1998 	pop	(0+5)
   0743 D0 04              1999 	pop	(0+4)
   0745 D0 03              2000 	pop	(0+3)
   0747 D0 02              2001 	pop	(0+2)
   0749 D0 83              2002 	pop	dph
   074B D0 82              2003 	pop	dpl
   074D D0 F0              2004 	pop	b
   074F D0 E0              2005 	pop	acc
   0751 D0 22              2006 	pop	bits
   0753 32                 2007 	reti
                           2008 ;------------------------------------------------------------
                           2009 ;Allocation info for local variables in function 'hispeed_isr'
                           2010 ;------------------------------------------------------------
                           2011 ;------------------------------------------------------------
                           2012 ;	reset.c:283: void hispeed_isr() interrupt HISPEED_ISR {
                           2013 ;	-----------------------------------------
                           2014 ;	 function hispeed_isr
                           2015 ;	-----------------------------------------
   0754                    2016 _hispeed_isr:
   0754 C0 22              2017 	push	bits
   0756 C0 E0              2018 	push	acc
   0758 C0 F0              2019 	push	b
   075A C0 82              2020 	push	dpl
   075C C0 83              2021 	push	dph
   075E C0 02              2022 	push	(0+2)
   0760 C0 03              2023 	push	(0+3)
   0762 C0 04              2024 	push	(0+4)
   0764 C0 05              2025 	push	(0+5)
   0766 C0 06              2026 	push	(0+6)
   0768 C0 07              2027 	push	(0+7)
   076A C0 00              2028 	push	(0+0)
   076C C0 01              2029 	push	(0+1)
   076E C0 D0              2030 	push	psw
   0770 75 D0 00           2031 	mov	psw,#0x00
                           2032 ;	reset.c:284: handle_hispeed(TRUE);
   0773 75 82 01           2033 	mov	dpl,#0x01
   0776 12 0E 68           2034 	lcall	_handle_hispeed
                           2035 ;	reset.c:285: CLEAR_HISPEED();
   0779 53 91 EF           2036 	anl	_EXIF,#0xEF
   077C 90 E6 5D           2037 	mov	dptr,#_USBIRQ
   077F 74 20              2038 	mov	a,#0x20
   0781 F0                 2039 	movx	@dptr,a
   0782 D0 D0              2040 	pop	psw
   0784 D0 01              2041 	pop	(0+1)
   0786 D0 00              2042 	pop	(0+0)
   0788 D0 07              2043 	pop	(0+7)
   078A D0 06              2044 	pop	(0+6)
   078C D0 05              2045 	pop	(0+5)
   078E D0 04              2046 	pop	(0+4)
   0790 D0 03              2047 	pop	(0+3)
   0792 D0 02              2048 	pop	(0+2)
   0794 D0 83              2049 	pop	dph
   0796 D0 82              2050 	pop	dpl
   0798 D0 F0              2051 	pop	b
   079A D0 E0              2052 	pop	acc
   079C D0 22              2053 	pop	bits
   079E 32                 2054 	reti
                           2055 	.area CSEG    (CODE)
                           2056 	.area CONST   (CODE)
   17CE                    2057 __str_0:
   17CE 25 64 20 25 30 34  2058 	.ascii "%d %04x:%02x"
        78 3A 25 30 32 78
   17DA 0A                 2059 	.db 0x0A
   17DB 00                 2060 	.db 0x00
   17DC                    2061 __str_1:
   17DC 48 61 6E 64 6C 65  2062 	.ascii "Handle setupdata"
        20 73 65 74 75 70
        64 61 74 61
   17EC 0A                 2063 	.db 0x0A
   17ED 00                 2064 	.db 0x00
   17EE                    2065 __str_2:
   17EE 41 6C 6C 20 4F 4B  2066 	.ascii "All OK"
   17F4 0A                 2067 	.db 0x0A
   17F5 00                 2068 	.db 0x00
   17F6                    2069 __str_3:
   17F6 4E 65 65 64 20 74  2070 	.ascii "Need to implement vendor command: %02x"
        6F 20 69 6D 70 6C
        65 6D 65 6E 74 20
        76 65 6E 64 6F 72
        20 63 6F 6D 6D 61
        6E 64 3A 20 25 30
        32 78
   181C 0A                 2071 	.db 0x0A
   181D 00                 2072 	.db 0x00
   181E                    2073 __str_4:
   181E 47 65 74 20 49 6E  2074 	.ascii "Get Interface"
        74 65 72 66 61 63
        65
   182B 0A                 2075 	.db 0x0A
   182C 00                 2076 	.db 0x00
   182D                    2077 __str_5:
   182D 53 65 74 20 69 6E  2078 	.ascii "Set interface %d to alt: %d"
        74 65 72 66 61 63
        65 20 25 64 20 74
        6F 20 61 6C 74 3A
        20 25 64
   1848 0A                 2079 	.db 0x0A
   1849 00                 2080 	.db 0x00
                           2081 	.area XINIT   (CODE)
   1855                    2082 __xinit__sofct:
   1855 00 00              2083 	.byte #0x00,#0x00
                           2084 	.area CABS    (ABS,CODE)
