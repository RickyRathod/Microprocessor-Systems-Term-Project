;*****************************************************************
;* This stationery serves as the framework for a                 *
;* user application (single file, absolute assembly application) *
;* For a more comprehensive program that                         *
;* demonstrates the more advanced functionality of this          *
;* processor, please see the demonstration applications          *
;* located in the examples subdirectory of the                   *
;* Freescale CodeWarrior for the HC12 Program directory          *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



;Include derivative-specific definitions 
		        INCLUDE 'derivative.inc' 



            ORG $3000
MULTIPLICAND FCB 05 ; First Number
MULTIPLIER FCB 02 ; Second Number
PRODUCT RMB 1 ; Result of addition



Entry:
_Startup:

            LDAA MULTIPLICAND ; Get the first number into ACCA
            LDAB MULTIPLIER ; Add to it the second number
            MUL ;
            STD PRODUCT ; and store the sum
            SWI ; break to the monitor

;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector