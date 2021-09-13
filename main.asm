PROCESSOR 18F16Q41
    
    #include <xc.h>
  
  
  // CONFIG8 code can be generated bit configuration bits
#pragma config WRTB = OFF       // Boot Block Write Protection bit (Boot Block not Write protected)
;#pragma config WRTC = OFF       // Configuration Register Write Protection bit (Configuration registers not Write protected)
;#pragma config WRTD = OFF       // Data EEPROM Write Protection bit (Data EEPROM not Write protected)
;#pragma config WRTSAF = OFF     // SAF Write protection bit (SAF not Write Protected)
;#pragma config WRTAPP = OFF     // Application Block write protection bit (Application Block not write protected)

// CONFIG9
;#pragma config CP = OFF         // PFM and Data EEPROM Code Protection bit (PFM and Data EEPROM code protection disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.


    
PSECT resetVect, class=CODE, delta=2
resetVect:
    PAGESEL main
    goto main
    
PSECT code, delta=2
main:
	
    ; This code example illustrates initializing the PORTA register. 
; The other ports are initialized in the same manner.
 BANKSEL PORTA ;
 CLRF PORTA ;Clear PORTA
 BANKSEL LATA ;
 CLRF LATA ;Clear Data Latch
 BANKSEL ANSELA ;
 CLRF ANSELA ;Enable digital drivers
 BANKSEL TRISA ;
 MOVLW B'00111000' ;Set RA[5:3] as inputs
 MOVWF TRISA ;and set others as outputs
    goto main
    
END resetVect

