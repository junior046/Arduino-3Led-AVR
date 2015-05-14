; the ultrasonic HC-SR04 AVR assembly
; credit to Mike Shegedin for some ideas

.include "/usr/local/include/atmega328p.def"

.equ	GREEN_PIN, 2
.equ	BLUE_PIN, 1
.equ	RED_PIN, 3
.equ	DELAY, 255

	.section .text
.org 0x00

; function setup
Start:
	; set stack to top of available ram
    	ldi 	r28, (RAMEND & 0x00ff)
   	ldi 	r29, (RAMEND >> 8)
   	out 	SPH, r29
   	out 	SPL, r28

; initialize the pins and registers
	call	Init

; main loop
Main_Loop:
	sbi	PORTB, RED_PIN
	call	System_Delay
	sbi	PORTB, BLUE_PIN
	call	System_Delay
	sbi	PORTB, GREEN_PIN
	call	System_Delay
    	rjmp	Main_Loop			; repeat the loop
	ret

; initializing the I/O
Init:
	sbi	DDRB, GREEN_PIN
	sbi	DDRB, RED_PIN
	sbi	DDRB, BLUE_PIN
	cbi	PORTB, GREEN_PIN
	cbi	PORTB, RED_PIN
	cbi	PORTB, BLUE_PIN
    	ret

; the delay of 0.6ms or 10000 cycles on the 16Mhz chip
System_Delay:
	ldi	r17, DELAY		; outer loop
SD_L1:
	ldi	r18, DELAY		; inner loop
SD_L2:
	dec	r18			; use R17 as a parameter -> decrement it
	brne	SD_L2			; if not ZERO -> keep decrementing
	dec	r17
	brne	SD_L1
	ret
