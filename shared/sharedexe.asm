.file "sharedexe.asm"

# Increment and print a shared variable from a dll.
# dependencies : kernel32.lib

.section .text

    .global _start

_start:
    call  _incp

    pushl $0
    call  _ExitProcess@4

.end
