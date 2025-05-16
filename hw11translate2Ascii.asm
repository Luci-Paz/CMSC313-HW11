; Translate to ASCII converter program
; Author: Lucian Pazour
; Class: CMSC313 - (UMBC / CMSC313-01, MoWe 8:30AM - 9:45AM)
; Date: 05/15/2025

section .data
    inputBuf: db 0x83, 0x6A, 0x88, 0xDE, 0x9A, 0xC3, 0x54, 0x9A
    inputLen: equ $ - inputBuf


section .bss
    outputBuf: resb 80


section .text
    global _start


; ==================================
; Subroutine: byteToAscii
; separates a byte into two nibbles, one is the MSB and the other the LSB
; and then converts each nibble into that hex digits ascii representation
; ==================================

byteToAscii:
    push ax

    ; Convert the MSB to ascii 
    ; Save the original byte value from AL into AH and mask the LSB
    mov ah, al
    shr al, 4
    cmp al, 9
    jbe .MSBDigit
    add al, 0x37
    jmp .storeMSB 
.MSBDigit:
    add al, 0x30
.storeMSB:
    mov [edi], al


    ; Convert the LSB to ascii
    ; restore the original value of AL and mask the MSB
    mov al, ah
    and al, 0x0F
    cmp al, 9
    jbe .LSBDigit
    add al, 0x37
    jmp .storeLSB
.LSBDigit:
    add al, 0x30
.storeLSB:
    mov [edi + 1], al


    ; Restore AX and return to the caller
    pop ax
    ret


; ==================================
; Entry Point: _start
; Program converts input buffer to ASCII and prints it
; ==================================

_start:
    mov esi, inputBuf
    mov edi, outputBuf
    mov ecx, inputLen


; loop through each byte and convert into respective hex ascii
.nextByte:

    ; load byte from [ESI] into AL so it can be translated
    lodsb
    call byteToAscii
    add edi, 2


    ; place a space between bytes, then work on the next byte
    mov byte [edi], ' '
    inc edi
    loop .nextByte


    ; remove last space and replace with a newline
    dec edi
    mov byte [edi], 0x0A
    inc edi


    ; Calculate the number of bytes written
    mov eax, edi
    sub eax, outputBuf


    ; output the translation
    mov edx, eax
    mov ecx, outputBuf
    mov ebx, 1
    mov eax, 4
    int 0x80


    ; exit syscall
    mov eax, 1
    xor ebx, ebx
    int 0x80