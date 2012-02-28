.file "dllload.asm"

# Displyas a message box, using code defined in a DLL loaded at load-time.
# dependencies : kernel32.dll

.section .data

    title:   .asciz "Norswap's Box"
    message: .asciz "This was a triumph."

.section .text

    .global _start

_start:

    movl  $title,   %eax
    movl  $message, %edx
    call  box

    pushl $0
    call  _ExitProcess@4

.end
