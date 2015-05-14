# Makefile for Teensy2 assembly language tests
TARGET = app
MCU	= atmega328p
PORT	= /dev/ttyACM0

# This line lists the ".c" source files for this project
CSRCS =

# Uncomment the next line if this program starts in C code
CPROG = yes

# This line should list the ".S" source files for this project
ASRCS = $(TARGET).S

# do not modify anything below this line ----------------------------
include /usr/local/include/AVRmaster.mak
