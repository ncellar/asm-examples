.file "printf.asm"

# Prints a console message on Windows using the C standard library.
# dependencies : kernel32.dll (all calls), microsoft C runtime

.section .data

    message: .asciz "This was a triumph.\n"

.section .text

    .global _main

_main:

    pushl $message
    call  _printf
    addl  $4, %esp

    pushl $0
    call  _ExitProcess@4

.end
