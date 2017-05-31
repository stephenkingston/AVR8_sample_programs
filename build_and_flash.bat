@echo off

:: Delete all .hex and .out files 
del *.hex *.out

:: Compile 'blinky.c' for ATmega328p chip using 'avr-gcc' to generate 'a.out' 
avr-gcc -O2 -mmcu=atmega328p blinky.c 

:: Convert 'a.out' to Intel HEX file 'a.hex' using 'avr-objcopy'
avr-objcopy -O ihex a.out a.hex

:: Burn the HEX file(a.hex) to ATmega328 chip on Arduino Uno using 'avrdude'
:: Replace COM25 by the COM port detected on your PC
avrdude -patmega328p -carduino -PCOM25 -b115200 -D -Uflash:w:a.hex:i

::Don't close console after execution
pause
