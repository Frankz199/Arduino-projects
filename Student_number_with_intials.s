.equ SREG,0x3f
.equ PORTB,0x05
.equ DDRB,0x04


.org 0 

main:     ldi r16,0
          out SREG,r16
          
          ldi r16,0x1F
          out DDRB,r16
          
          ldi r17,0x01
          out PORTB,r17
          
          ldi r18,0x09
          out PORTB,r18
          
          ldi r19,0x00
          out PORTB,r19
          
          ldi r20,0x01
          out PORTB,r20
          
          ldi r21,0x06
          out PORTB,r21
          
          ldi r22,0x06
          out PORTB,r22
          
          ldi r23,0x05
          out PORTB,r23
          
          ldi r24,0x07
          out PORTB,r24
          
          ldi r25,0x06
          out PORTB,r25
          
          ldi r26,0x1B
          out PORTB,r26
          
          ldi r27,0x1A
          out PORTB,r27   ; I added a wire to the pin D12 and connected it to the extra LED and extra resistor that I placed in the same way as before. 



mainloop:  rjmp mainloop
