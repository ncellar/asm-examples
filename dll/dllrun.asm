.file "dllrun.asm"

# Displays a message box, using code defined in a DLL loaded at run-time.
# dependencies : kernel32.dll

.section .data

    dll:     .asciz "dlldll.dll"
    func:    .asciz "box"
    title:   .asciz "Norswap's Box"
    message: .asciz "This was a triumph."

.section .text

    .global _start

_start:

    pushl $dll
    call  _LoadLibraryA@4

    pushl $func
    pushl %eax
    call  _GetProcAddress@8
    movl  %eax, %ebx

    movl  $title,   %eax
    movl  $message, %edx
    call  *%ebx

    pushl $0
    call  _ExitProcess@4

.end
