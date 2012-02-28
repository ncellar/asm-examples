.file "box.asm"

# Displays a message box on Windows.
# dependencies : kernel32.dll (ExitProcess), user32.dll (MessageBox)

.section .data

    title:   .asciz "Norswap's Box"
    message: .asciz "This was a triumph."

.section .text

    .global _start

_start:
    # display box
    pushl $0                # null : no owner window
    pushl $title
    pushl $message
    pushl $0                # MB_OK : only OK button
    call  _MessageBoxA@16

    # exit
    pushl $0                # exit code
    call  _ExitProcess@4

.end
