.equ SREG,0x3f
.equ PORTB,0x05
.equ DDRB,0x04


.org 0 

main:     ldi r16,0
          out SREG,r16
          
          ldi r16,0x01
          out DDRB,r16
          
          ldi r17,0x01    ;F 
          out PORTB,r17
          
          call zerotwo ; on 0.2  first dot

          ldi r17,0x00
          out PORTB,r17
          
          call zerotwo ; off for 0.2 space
          
          ldi r17,0x01
          out PORTB,r17
          
          call zerotwo ; on 0.2 second dot
          
          ldi r17,0x00
          out PORTB,r17
          
          call zerotwo ; off 0.2 space
          
          ldi r17,0x01
          out PORTB,r17
          
          call zerosix ; on 0.6 first dash
          
          ldi r17,0x00
          out PORTB,r17
          
          call zerotwo ; off 0.2 space 
          
          ldi r17,0x01
          out PORTB,r17
          
          call zerotwo ; on 0.2 third dot
          
          ldi r17,0x00
          out PORTB,r17
          
          call zerosix ; off Interletter space 0.6
          
          ldi r17,0x01 ; R
          out PORTB,r17
          
          call zerotwo ; on 0.2 first dot
          
          ldi r17,0x00
          out PORTB,r17
          
          call zerotwo ; off 0.2 space
          
          ldi r17,0x01
          out PORTB,r17
          
          call zerosix ; on 0.6 first dash
          
          ldi r17,0x00
          out PORTB,r17
          
          call zerotwo ; off 0.2 space
          
          ldi r17,0x01
          out PORTB,r17
          
          call zerotwo ; on for 0.2 second dot
          
          ldi r17,0x00
          out PORTB,r17
          
          call zerosix ; off Interletter space 0.6
          
          ldi r17,0x01 ; A
          out PORTB,r17
          
          call zerotwo ; on 0.2 first dot
          
          ldi r17,0x00
          out PORTB,r17
          
          call zerotwo ; off 0.2 space
          
          ldi r17,0x01 
          out PORTB,r17
          
          call zerosix ; on 0.6 dash
          
          ldi r17,0x00
          out PORTB,r17
          
          call zerosix ; off FINAL 0.6
          
          
zerotwo:  ldi r20, 86   ; I figure out how many cycles each loop has. x is the number that is registered.
   loop3: nop           ; loop3 has ((5x)x + 5x)x + 5x
          ldi r19, 86 
   loop2: nop           ; loop2 has (5x)x + 5x
          ldi r18, 86
   loop1: nop          ; loop1 has 5x cycles
          dec r18
          cpi r18,0
          brne loop1
          dec r19
          cpi r19,0
          brne loop2
          dec r20
          cpi r20,0
          brne loop3  ; total cycles is 5x^3 + 5x^2 + 5x      
          ret         ; 0.2/16x10^6 = 5x^3 + 5x^2 + 5x..... x = 86 this is to make it 0.2 seconds long
          
zerosix:  ldi r23, 124
   loop6: nop
          ldi r22, 124
   loop5: nop
          ldi r21, 124
   loop4: nop
          dec r21
          cpi r21,0
          brne loop4
          dec r22
          cpi r22,0
          brne loop5
          dec r23
          cpi r23,0
          brne loop6  ;similar loops but register is changed        
          ret         ; 0.6/16x10^6 = 5x^3 + 5x^2 + 5x...... x = 126 this is to make it 0.6 seconds long 


mainloop:  rjmp mainloop
