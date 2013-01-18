ASxxxx Assembler V01.70 + NoICE + SDCC mods + Flat24 Feb-1999  (Intel 8051), page 1.



                              1 ; Copyright (C) 2009 Ubixum, Inc. 
                              2 ;
                              3 ; This library is free software; you can redistribute it and/or
                              4 ; modify it under the terms of the GNU Lesser General Public
                              5 ; License as published by the Free Software Foundation; either
                              6 ; version 2.1 of the License, or (at your option) any later version.
                              7 ; 
                              8 ; This library is distributed in the hope that it will be useful,
                              9 ; but WITHOUT ANY WARRANTY; without even the implied warranty of
                             10 ; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                             11 ; Lesser General Public License for more details.
                             12 ; 
                             13 ; You should have received a copy of the GNU Lesser General Public
                             14 ; License along with this library; if not, write to the Free Software
                             15 ; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                             16 
                             17 ; this is a the default 
                             18 ; full speed and high speed 
                             19 ; descriptors found in the TRM
                             20 ; change however you want but leave 
                             21 ; the descriptor pointers so the setupdat.c file works right
                             22  
                             23 
                             24 .module DEV_DSCR 
                             25 
                             26 ; descriptor types
                             27 ; same as setupdat.h
                    0001     28 DSCR_DEVICE_TYPE=1
                    0002     29 DSCR_CONFIG_TYPE=2
                    0003     30 DSCR_STRING_TYPE=3
                    0004     31 DSCR_INTERFACE_TYPE=4
                    0005     32 DSCR_ENDPOINT_TYPE=5
                    0006     33 DSCR_DEVQUAL_TYPE=6
                             34 
                             35 ; for the repeating interfaces
                    0009     36 DSCR_INTERFACE_LEN=9
                    0007     37 DSCR_ENDPOINT_LEN=7
                             38 
                             39 ; endpoint types
                    0000     40 ENDPOINT_TYPE_CONTROL=0
                    0001     41 ENDPOINT_TYPE_ISO=1
                    0002     42 ENDPOINT_TYPE_BULK=2
                    0003     43 ENDPOINT_TYPE_INT=3
                             44 
                             45     .globl	_dev_dscr, _dev_qual_dscr, _highspd_dscr, _fullspd_dscr, _dev_strings, _dev_strings_end
                             46 ; These need to be in code memory.  If
                             47 ; they aren't you'll have to manully copy them somewhere
                             48 ; in code memory otherwise SUDPTRH:L don't work right
                             49     .area	DSCR_AREA	(CODE)
                             50 
   3E00                      51 _dev_dscr:
   3E00 12                   52 	.db	dev_dscr_end-_dev_dscr    ; len
   3E01 01                   53 	.db	DSCR_DEVICE_TYPE	  ; type
   3E02 00 02                54 	.dw	0x0002			  ; usb 2.0
   3E04 FF                   55 	.db	0xff  			  ; class (vendor specific)
   3E05 FF                   56 	.db	0xff			  ; subclass (vendor specific)
ASxxxx Assembler V01.70 + NoICE + SDCC mods + Flat24 Feb-1999  (Intel 8051), page 2.



   3E06 FF                   57 	.db	0xff			  ; protocol (vendor specific)
   3E07 40                   58 	.db	64			  ; packet size (ep0)
   3E08 43 24                59 	.dw	0x4324			  ; vendor id 
   3E0A DC 00                60 	.dw	0xdc00			  ; product id
   3E0C 01 00                61 	.dw	0x0100			  ; version id
   3E0E 01                   62 	.db	1		          ; manufacturer str idx
   3E0F 02                   63 	.db	2			  ; product str idx	
   3E10 00                   64 	.db	0		          ; serial str idx 
   3E11 01                   65 	.db	1                         ; n configurations
   3E12                      66 dev_dscr_end:
                             67 
   3E12                      68 _dev_qual_dscr:
   3E12 0A                   69 	.db	dev_qualdscr_end-_dev_qual_dscr
   3E13 06                   70 	.db	DSCR_DEVQUAL_TYPE
   3E14 00 02                71 	.dw	0x0002                              ; usb 2.0
   3E16 FF                   72 	.db	0xff
   3E17 FF                   73 	.db	0xff
   3E18 FF                   74 	.db	0xff
   3E19 40                   75 	.db	64                                  ; max packet
   3E1A 01                   76 	.db	1									; n configs
   3E1B 00                   77 	.db	0									; extra reserved byte
   3E1C                      78 dev_qualdscr_end:
                             79 
   3E1C                      80 _highspd_dscr:
   3E1C 09                   81 	.db	highspd_dscr_end-_highspd_dscr      ; dscr len											;; Descriptor length
   3E1D 02                   82 	.db	DSCR_CONFIG_TYPE
                             83     ; can't use .dw because byte order is different
   3E1E 20                   84 	.db	(highspd_dscr_realend-_highspd_dscr) % 256 ; total length of config lsb
   3E1F 00                   85 	.db	(highspd_dscr_realend-_highspd_dscr) / 256 ; total length of config msb
   3E20 01                   86 	.db	1								 ; n interfaces
   3E21 01                   87 	.db	1								 ; config number
   3E22 00                   88 	.db	0								 ; config string
   3E23 80                   89 	.db	0x80                             ; attrs = bus powered, no wakeup
   3E24 32                   90 	.db	0x32                             ; max power = 100ma
   3E25                      91 highspd_dscr_end:
                             92 
                             93 ; all the interfaces next 
                             94 ; NOTE the default TRM actually has more alt interfaces
                             95 ; but you can add them back in if you need them.
                             96 ; here, we just use the default alt setting 1 from the trm
   3E25 09                   97 	.db	DSCR_INTERFACE_LEN
   3E26 04                   98 	.db	DSCR_INTERFACE_TYPE
   3E27 00                   99 	.db	0				 ; index
   3E28 00                  100 	.db	0				 ; alt setting idx
   3E29 02                  101 	.db	2				 ; n endpoints	
   3E2A FF                  102 	.db	0xff			 ; class
   3E2B FF                  103 	.db	0xff
   3E2C FF                  104 	.db	0xff
   3E2D 03                  105 	.db	3	             ; string index	
                            106 
                            107 ; endpoint 2 out
   3E2E 07                  108 	.db	DSCR_ENDPOINT_LEN
   3E2F 05                  109 	.db	DSCR_ENDPOINT_TYPE
   3E30 02                  110 	.db	0x02				;  ep2 dir=OUT and address
   3E31 02                  111 	.db	ENDPOINT_TYPE_BULK	; type
   3E32 00                  112 	.db	0x00				; max packet LSB
ASxxxx Assembler V01.70 + NoICE + SDCC mods + Flat24 Feb-1999  (Intel 8051), page 3.



   3E33 02                  113 	.db	0x02				; max packet size=512 bytes
   3E34 00                  114 	.db	0x00				; polling interval
                            115 
                            116 ; endpoint 6 in
   3E35 07                  117 	.db	DSCR_ENDPOINT_LEN
   3E36 05                  118 	.db	DSCR_ENDPOINT_TYPE
   3E37 86                  119 	.db	0x86				;  ep6 dir=in and address
   3E38 02                  120 	.db	ENDPOINT_TYPE_BULK	; type
   3E39 00                  121 	.db	0x00				; max packet LSB
   3E3A 02                  122 	.db	0x02				; max packet size=512 bytes
   3E3B 00                  123 	.db	0x00				; polling interval
                            124 
   3E3C                     125 highspd_dscr_realend:
                            126 
   3E3C                     127     .even
   3E3C                     128 _fullspd_dscr:
   3E3C 09                  129 	.db	fullspd_dscr_end-_fullspd_dscr      ; dscr len
   3E3D 02                  130 	.db	DSCR_CONFIG_TYPE
                            131     ; can't use .dw because byte order is different
   3E3E 20                  132 	.db	(fullspd_dscr_realend-_fullspd_dscr) % 256 ; total length of config lsb
   3E3F 00                  133 	.db	(fullspd_dscr_realend-_fullspd_dscr) / 256 ; total length of config msb
   3E40 01                  134 	.db	1								 ; n interfaces
   3E41 01                  135 	.db	1								 ; config number
   3E42 00                  136 	.db	0								 ; config string
   3E43 80                  137 	.db	0x80                             ; attrs = bus powered, no wakeup
   3E44 32                  138 	.db	0x32                             ; max power = 100ma
   3E45                     139 fullspd_dscr_end:
                            140 
                            141 ; all the interfaces next 
                            142 ; NOTE the default TRM actually has more alt interfaces
                            143 ; but you can add them back in if you need them.
                            144 ; here, we just use the default alt setting 1 from the trm
   3E45 09                  145 	.db	DSCR_INTERFACE_LEN
   3E46 04                  146 	.db	DSCR_INTERFACE_TYPE
   3E47 00                  147 	.db	0				 ; index
   3E48 00                  148 	.db	0				 ; alt setting idx
   3E49 02                  149 	.db	2				 ; n endpoints	
   3E4A FF                  150 	.db	0xff			 ; class
   3E4B FF                  151 	.db	0xff
   3E4C FF                  152 	.db	0xff
   3E4D 03                  153 	.db	3	             ; string index	
                            154 
                            155 ; endpoint 2 out
   3E4E 07                  156 	.db	DSCR_ENDPOINT_LEN
   3E4F 05                  157 	.db	DSCR_ENDPOINT_TYPE
   3E50 02                  158 	.db	0x02				;  ep2 dir=OUT and address
   3E51 02                  159 	.db	ENDPOINT_TYPE_BULK	; type
   3E52 40                  160 	.db	0x40				; max packet LSB
   3E53 00                  161 	.db	0x00				; max packet size=64 bytes
   3E54 00                  162 	.db	0x00				; polling interval
                            163 
                            164 ; endpoint 6 in
   3E55 07                  165 	.db	DSCR_ENDPOINT_LEN
   3E56 05                  166 	.db	DSCR_ENDPOINT_TYPE
   3E57 86                  167 	.db	0x86				;  ep6 dir=in and address
   3E58 02                  168 	.db	ENDPOINT_TYPE_BULK	; type
ASxxxx Assembler V01.70 + NoICE + SDCC mods + Flat24 Feb-1999  (Intel 8051), page 4.



   3E59 40                  169 	.db	0x40				; max packet LSB
   3E5A 00                  170 	.db	0x00				; max packet size=64 bytes
   3E5B 00                  171 	.db	0x00				; polling interval
                            172 
   3E5C                     173 fullspd_dscr_realend:
                            174 
   3E5C                     175 .even
   3E5C                     176 _dev_strings:
                            177 ; sample string
   3E5C                     178 _string0:
   3E5C 04                  179 	.db	string0end-_string0 ; len
   3E5D 03                  180 	.db	DSCR_STRING_TYPE
   3E5E 09 04               181     .db 0x09, 0x04     ; who knows
   3E60                     182 string0end:
                            183 ; add more strings here
                            184 
   3E60                     185 _string1:
   3E60 32                  186     .db string1end-_string1
   3E61 03                  187     .db DSCR_STRING_TYPE
   3E62 61                  188     .ascii 'a'
   3E63 00                  189     .db 0
   3E64 65                  190     .ascii 'e'
   3E65 00                  191     .db 0
   3E66 73                  192     .ascii 's'
   3E67 00                  193     .db 0
   3E68 73                  194     .ascii 's'
   3E69 00                  195     .db 0
   3E6A 65                  196     .ascii 'e'
   3E6B 00                  197     .db 0
   3E6C 6E                  198     .ascii 'n'
   3E6D 00                  199     .db 0
   3E6E 74                  200     .ascii 't'
   3E6F 00                  201     .db 0
   3E70 20                  202     .ascii ' '
   3E71 00                  203     .db 0
   3E72 54                  204     .ascii 'T'
   3E73 00                  205     .db 0
   3E74 65                  206     .ascii 'e'
   3E75 00                  207     .db 0
   3E76 63                  208     .ascii 'c'
   3E77 00                  209     .db 0
   3E78 68                  210     .ascii 'h'
   3E79 00                  211     .db 0
   3E7A 6E                  212     .ascii 'n'
   3E7B 00                  213     .db 0
   3E7C 6F                  214     .ascii 'o'
   3E7D 00                  215     .db 0
   3E7E 6C                  216     .ascii 'l'
   3E7F 00                  217     .db 0
   3E80 6F                  218     .ascii 'o'
   3E81 00                  219     .db 0
   3E82 67                  220     .ascii 'g'
   3E83 00                  221     .db 0
   3E84 79                  222     .ascii 'y'
   3E85 00                  223     .db 0
   3E86 20                  224     .ascii ' '
ASxxxx Assembler V01.70 + NoICE + SDCC mods + Flat24 Feb-1999  (Intel 8051), page 5.



   3E87 00                  225     .db 0
   3E88 4C                  226     .ascii 'L'
   3E89 00                  227     .db 0
   3E8A 74                  228     .ascii 't'
   3E8B 00                  229     .db 0
   3E8C 64                  230     .ascii 'd'
   3E8D 00                  231     .db 0
   3E8E 2E                  232     .ascii '.'
   3E8F 00                  233     .db 0
   3E90 20                  234     .ascii ' '
   3E91 00                  235     .db 0
   3E92                     236 string1end:
                            237 
   3E92                     238 _string2:
   3E92 10                  239     .db string2end-_string2
   3E93 03                  240     .db DSCR_STRING_TYPE
   3E94 61                  241     .ascii 'a'
   3E95 00                  242     .db 0
   3E96 65                  243     .ascii 'e'
   3E97 00                  244     .db 0
   3E98 73                  245     .ascii 's'
   3E99 00                  246     .db 0
   3E9A 32                  247     .ascii '2'
   3E9B 00                  248     .db 0
   3E9C 32                  249     .ascii '2'
   3E9D 00                  250     .db 0
   3E9E 30                  251     .ascii '0'
   3E9F 00                  252     .db 0
   3EA0 20                  253     .ascii ' '
   3EA1 00                  254     .db 0
   3EA2                     255 string2end:
                            256 
   3EA2                     257 _string3:
   3EA2 0C                  258     .db string3end-_string3
   3EA3 03                  259     .db DSCR_STRING_TYPE
   3EA4 69                  260     .ascii 'i'
   3EA5 00                  261     .db 0
   3EA6 46                  262     .ascii 'F'
   3EA7 00                  263     .db 0
   3EA8 61                  264     .ascii 'a'
   3EA9 00                  265     .db 0
   3EAA 63                  266     .ascii 'c'
   3EAB 00                  267     .db 0
   3EAC 65                  268     .ascii 'e'
   3EAD 00                  269     .db 0
   3EAE                     270 string3end:
                            271     
   3EAE                     272 _dev_strings_end:
   3EAE 00 00               273     .dw 0x0000   ; just in case someone passes an index higher than the end to the firmware
