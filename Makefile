# Makefile for HW11 Translate To ASCII Prorgam
# Author: Lucian Pazour
# Date: 05/15/2025


#Compiler
ASM = nasm
LD = ld
ASMFLAGS = -f elf32
DEBUGFLAGS = -g -F dwarf

# Executable name
BIN = hw11translate2Ascii

# Source and Object file
SRC = hw11translate2Ascii.asm
OBJ = $(SRC:.asm=.o)

.PHONY: all release debug clean

# Builds
all: release

release: 
	$(ASM) $(ASMFLAGS) -o $(OBJ) $(SRC)
	$(LD) -m elf_i386 -o $(BIN) $(OBJ)

debug:
	$(ASM) $(ASMFLAGS) $(DEBUGFLAGS) -o $(OBJ) $(SRC)
	$(LD) -m elf_i386 -o $(BIN) $(OBJ)


clean:
	rm -f $(OBJ) $(BIN)