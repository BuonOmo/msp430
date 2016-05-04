SRCDIR = ../src
EDL = msp430-gcc -mmcu=msp430fg4618 -mdisable-watchdog -o exe.elf
GCC = msp430-gcc -mmcu=msp430fg4618 -Wall -Werror -01 -c
AS  = msp430-as -mmcu=msp430fg4618

edl : lcd.o tp3.o
	$(EDL) $^

lcd.o : $(SRCDIR)/lcd.c $(SRCDIR)/lcd.h
	$(GCC) -o lcd.o $(SRCDIR)/lcd.c

tp3.o : $(SRCDIR)/tp3.s
	$(AS) -o tp3.o $(SRCDIR)/tp3.s

exe : edl
	mspdebug -j -d /dev/ttyUSB0 uif < debugopt

clean :
	rm *.o exe.elf
