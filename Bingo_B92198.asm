;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"Bingo_B92198.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3ff7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__mulint
	extern	__divsint
	extern	__modsint
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_NumDisplay
	global	_n
	global	_guardados
	global	_numeros
	global	_pantallas
	global	_RetenerPantalla
	global	_Guardar

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_Bingo_B92198_0	udata
r0x1046	res	1
r0x1041	res	1
r0x1040	res	1
r0x1043	res	1
r0x1042	res	1
r0x1044	res	1
r0x1045	res	1
r0x1038	res	1
r0x1039	res	1
r0x103A	res	1
r0x103B	res	1
r0x103C	res	1
r0x103D	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_Bingo_B92198_0	idata
_numeros
	db	0x00, 0x00	; 0
	db	0x01, 0x00	; 1
	db	0x02, 0x00	; 2
	db	0x03, 0x00	; 3
	db	0x04, 0x00	; 4
	db	0x05, 0x00	; 5
	db	0x06, 0x00	; 6
	db	0x07, 0x00	; 7
	db	0x08, 0x00	; 8
	db	0x09, 0x00	; 9


IDD_Bingo_B92198_1	idata
_guardados
	db	0x00, 0x00	; 0
	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00


IDD_Bingo_B92198_2	idata
_n
	db	0x00, 0x00	;  0


IDD_Bingo_B92198_3	idata
_NumDisplay
	db	0x00, 0x00	;  0

;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_Bingo_B92198	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _RetenerPantalla
;   _Guardar
;   _RetenerPantalla
;   _Guardar
;1 compiler assigned register :
;   r0x1046
;; Starting pCode block
S_Bingo_B92198__main	code
_main:
; 2 exit points
;	.line	14; "Bingo_B92198.c"	TRISIO = 0x00;
	BANKSEL	_TRISIO
	CLRF	_TRISIO
;	.line	15; "Bingo_B92198.c"	GPIO = 0x00;
	BANKSEL	_GPIO
	CLRF	_GPIO
_00111_DS_:
;	.line	18; "Bingo_B92198.c"	NumDisplay = 0; //Se encarga de volver el contador a cero para reiniciar la cuenta
	BANKSEL	_NumDisplay
	CLRF	_NumDisplay
	CLRF	(_NumDisplay + 1)
;;signed compare: left < lit(0x64=100), size=2, mask=ffff
_00107_DS_:
;	.line	19; "Bingo_B92198.c"	while(NumDisplay < 100)
	BANKSEL	_NumDisplay
	MOVF	(_NumDisplay + 1),W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00131_DS_
	MOVLW	0x64
	SUBWF	_NumDisplay,W
_00131_DS_:
	BTFSC	STATUS,0
	GOTO	_00111_DS_
;;genSkipc:3307: created from rifx:00000055a2dd8e50
;	.line	21; "Bingo_B92198.c"	RetenerPantalla();
	PAGESEL	_RetenerPantalla
	CALL	_RetenerPantalla
	PAGESEL	$
;	.line	22; "Bingo_B92198.c"	if (GP3 = ~GP3)
	BANKSEL	r0x1046
	CLRF	r0x1046
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00001_DS_
	BANKSEL	r0x1046
	INCF	r0x1046,F
_00001_DS_:
	BANKSEL	r0x1046
	COMF	r0x1046,W
	MOVWF	r0x1046
	RRF	r0x1046,W
	BTFSC	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,3
_00002_DS_:
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,3
_00003_DS_:
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00106_DS_
;	.line	24; "Bingo_B92198.c"	Guardar();
	PAGESEL	_Guardar
	CALL	_Guardar
	PAGESEL	$
_00106_DS_:
;	.line	26; "Bingo_B92198.c"	NumDisplay++;
	BANKSEL	_NumDisplay
	INCF	_NumDisplay,F
	BTFSC	STATUS,2
	INCF	(_NumDisplay + 1),F
	GOTO	_00107_DS_
;	.line	29; "Bingo_B92198.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;8 compiler assigned registers:
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;   r0x103F
;; Starting pCode block
S_Bingo_B92198__Guardar	code
_Guardar:
; 2 exit points
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	58; "Bingo_B92198.c"	if (n < 16)
	BANKSEL	_n
	MOVF	(_n + 1),W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00185_DS_
	MOVLW	0x10
	SUBWF	_n,W
_00185_DS_:
	BTFSC	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3307: created from rifx:00000055a2dd8e50
;	.line	61; "Bingo_B92198.c"	for (i=0;i<16;i++)
	BANKSEL	r0x1038
	CLRF	r0x1038
	CLRF	r0x1039
	CLRF	r0x103A
	CLRF	r0x103B
_00167_DS_:
;	.line	63; "Bingo_B92198.c"	if (NumDisplay = guardados[i])
	BANKSEL	r0x103A
	MOVF	r0x103A,W
	ADDLW	(_guardados + 0)
	MOVWF	r0x103C
	MOVLW	high (_guardados + 0)
	MOVWF	r0x103D
	MOVF	r0x103B,W
	BTFSC	STATUS,0
	INCFSZ	r0x103B,W
	ADDWF	r0x103D,F
	MOVF	r0x103C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103D
	BTFSC	r0x103D,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	_NumDisplay
	MOVWF	_NumDisplay
;;1	MOVWF	r0x103E
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	_NumDisplay
	MOVWF	(_NumDisplay + 1)
;;1	MOVWF	r0x103F
;;99	MOVF	r0x103E,W
;;100	MOVF	r0x103F,W
;	.line	61; "Bingo_B92198.c"	for (i=0;i<16;i++)
	MOVLW	0x02
	BANKSEL	r0x103A
	ADDWF	r0x103A,F
	BTFSC	STATUS,0
	INCF	r0x103B,F
	INCF	r0x1038,F
	BTFSC	STATUS,2
	INCF	r0x1039,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
	MOVF	r0x1039,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00186_DS_
	MOVLW	0x10
	SUBWF	r0x1038,W
_00186_DS_:
	BTFSS	STATUS,0
	GOTO	_00167_DS_
;;genSkipc:3307: created from rifx:00000055a2dd8e50
;	.line	68; "Bingo_B92198.c"	if (repetido = 0)
	GOTO	_00169_DS_
_00165_DS_:
;	.line	77; "Bingo_B92198.c"	n = 0;
	BANKSEL	_n
	CLRF	_n
	CLRF	(_n + 1)
;	.line	78; "Bingo_B92198.c"	NumDisplay = 98;
	MOVLW	0x62
	BANKSEL	_NumDisplay
	MOVWF	_NumDisplay
	CLRF	(_NumDisplay + 1)
_00169_DS_:
;	.line	82; "Bingo_B92198.c"	}
	RETURN	
; exit point of _Guardar

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pantallas
;   _pantallas
;2 compiler assigned registers:
;   r0x1044
;   r0x1045
;; Starting pCode block
S_Bingo_B92198__RetenerPantalla	code
_RetenerPantalla:
; 2 exit points
;	.line	46; "Bingo_B92198.c"	while (tiemporest>0)
	MOVLW	0xf4
	BANKSEL	r0x1044
	MOVWF	r0x1044
	MOVLW	0x01
	MOVWF	r0x1045
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit(0x1=1), size=2, mask=ffff
_00140_DS_:
	BANKSEL	r0x1045
	MOVF	r0x1045,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00154_DS_
	MOVLW	0x01
	SUBWF	r0x1044,W
_00154_DS_:
	BTFSS	STATUS,0
	GOTO	_00143_DS_
;;genSkipc:3307: created from rifx:00000055a2dd8e50
;	.line	48; "Bingo_B92198.c"	pantallas();
	PAGESEL	_pantallas
	CALL	_pantallas
	PAGESEL	$
;	.line	49; "Bingo_B92198.c"	tiemporest--;
	MOVLW	0xff
	BANKSEL	r0x1044
	ADDWF	r0x1044,F
	BTFSS	STATUS,0
	DECF	r0x1045,F
	GOTO	_00140_DS_
_00143_DS_:
;	.line	52; "Bingo_B92198.c"	}
	RETURN	
; exit point of _RetenerPantalla

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __modsint
;   __divsint
;   __mulint
;   __mulint
;   __modsint
;   __divsint
;   __mulint
;   __mulint
;7 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;; Starting pCode block
S_Bingo_B92198__pantallas	code
_pantallas:
; 2 exit points
;	.line	33; "Bingo_B92198.c"	unidades = NumDisplay % 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	_NumDisplay
	MOVF	_NumDisplay,W
	MOVWF	STK00
	MOVF	(_NumDisplay + 1),W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1040
	MOVWF	r0x1040
	MOVF	STK00,W
	MOVWF	r0x1041
;	.line	34; "Bingo_B92198.c"	decenas = NumDisplay / 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	_NumDisplay
	MOVF	_NumDisplay,W
	MOVWF	STK00
	MOVF	(_NumDisplay + 1),W
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x1042
	MOVWF	r0x1042
	MOVF	STK00,W
	MOVWF	r0x1043
;	.line	36; "Bingo_B92198.c"	GPIO = numeros[unidades];
	MOVF	r0x1041,W
	MOVWF	STK02
	MOVF	r0x1040,W
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x1040
	MOVWF	r0x1040
	MOVF	STK00,W
	MOVWF	r0x1041
	ADDLW	(_numeros + 0)
	MOVWF	r0x1041
	MOVF	r0x1040,W
	BTFSC	STATUS,0
	INCFSZ	r0x1040,W
	ADDLW	high (_numeros + 0)
	MOVWF	r0x1040
	MOVF	r0x1041,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1040
	BTFSC	r0x1040,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_GPIO
;	.line	37; "Bingo_B92198.c"	GP5 = 0;
	BCF	_GPIObits,5
;	.line	39; "Bingo_B92198.c"	GPIO = numeros[decenas];
	BANKSEL	r0x1043
	MOVF	r0x1043,W
	MOVWF	STK02
	MOVF	r0x1042,W
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x1040
	MOVWF	r0x1040
	MOVF	STK00,W
	MOVWF	r0x1041
	ADDLW	(_numeros + 0)
	MOVWF	r0x1041
	MOVF	r0x1040,W
	BTFSC	STATUS,0
	INCFSZ	r0x1040,W
	ADDLW	high (_numeros + 0)
	MOVWF	r0x1040
	MOVF	r0x1041,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1040
	BTFSC	r0x1040,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_GPIO
;	.line	40; "Bingo_B92198.c"	GP5 = 1;
	BSF	_GPIObits,5
;	.line	41; "Bingo_B92198.c"	}
	RETURN	
; exit point of _pantallas


;	code size estimation:
;	  185+   54 =   239 instructions (  586 byte)

	end
